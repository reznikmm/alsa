--  SPDX-FileCopyrightText: 2022 Max Reznik
--
--  SPDX-License-Identifier: LGPL-2.1-or-later
-------------------------------------------------------------

with ALSA.error_h;
with ALSA.PCM.Hardware_Parameters;

with Interfaces.C.Strings;

package body ALSA.PCM is

   use type Interfaces.C.int;

   --------------------------------
   -- Any_Hardware_Configuration --
   --------------------------------

   function Any_Hardware_Configuration
     (Self : Device) return ALSA.PCM.Hardware_Parameters.Hardware_Configuration
      renames ALSA.PCM.Hardware_Parameters.Any_Hardware_Configuration;

   -----------
   -- Check --
   -----------

   procedure Check (err : Interfaces.C.int) is
   begin
      if err < 0 then
         raise ALSA_Error
           with Interfaces.C.Strings.Value (error_h.snd_strerror (err));
      end if;
   end Check;

   -----------
   -- Close --
   -----------

   procedure Close (Self : in out Device) is
      err : constant Interfaces.C.int :=
        pcm_h.snd_pcm_close (pcm => Self.pcm);
   begin
      if err /= 0 then
         raise ALSA_Error
           with Interfaces.C.Strings.Value (error_h.snd_strerror (err));
      end if;

      Self.pcm := null;
   end Close;

   ------------------------------------
   -- Current_Hardware_Configuration --
   ------------------------------------

   function Current_Hardware_Configuration
     (Self : Device) return ALSA.PCM.Hardware_Parameters.Hardware_Configuration
      renames ALSA.PCM.Hardware_Parameters.Current_Hardware_Configuration;

   ----------
   -- Drop --
   ----------

   procedure Drop (Self : in out Device) is
      err : constant Interfaces.C.int := pcm_h.snd_pcm_drop (Self.pcm);
   begin
      Check (err);
   end Drop;

   --------------
   -- Finalize --
   --------------

   overriding procedure Finalize (Self : in out Device) is
   begin
      if Self.Is_Open then
         Self.Close;
      end if;
   end Finalize;

   ------------------
   -- Open_Capture --
   ------------------

   procedure Open_Capture (Self : in out Device; Name : String := "default")
   is

      Cast : aliased Interfaces.C.char_array :=
        Interfaces.C.To_C (Name);

      err : constant Interfaces.C.int :=
        pcm_h.snd_pcm_open
          (pcm    => Self.pcm'Address,
           name   => Interfaces.C.Strings.To_Chars_Ptr (Cast'Unchecked_Access),
           stream => ALSA.pcm_h.PCM_STREAM_CAPTURE,
           mode   => 0);
   begin
      Check (err);
--      Check (pcm_h.snd_pcm_prepare (Self.pcm));
   end Open_Capture;

   -------------------
   -- Open_Playback --
   -------------------

   procedure Open_Playback
     (Self : in out Device;
      Name : String := "default")
   is
      Cast : aliased Interfaces.C.char_array :=
        Interfaces.C.To_C (Name);

      err : constant Interfaces.C.int :=
        pcm_h.snd_pcm_open
          (pcm    => Self.pcm'Address,
           name   => Interfaces.C.Strings.To_Chars_Ptr (Cast'Unchecked_Access),
           stream => ALSA.pcm_h.PCM_STREAM_CAPTURE,
           mode   => 0);
   begin
      Check (err);
   end Open_Playback;

   ----------------------
   -- Read_Interleaved --
   ----------------------

   procedure Read_Interleaved
     (Self   : in out Device;
      Buffer : System.Address;
      Frames : Positive;
      Last   : out Natural)
   is
      err : constant pcm_h.snd_pcm_sframes_t :=
        pcm_h.snd_pcm_readi
          (Self.pcm,
           Buffer,
           pcm_h.snd_pcm_uframes_t (Frames));
   begin
      Check (Interfaces.C.int (err));

      Last := Natural (err);
   end Read_Interleaved;

   --------------------------------
   -- Set_Hardware_Configuration --
   --------------------------------

   procedure Set_Hardware_Configuration
     (Self  : in out Device;
      Value : in out ALSA.PCM.Hardware_Parameters.Hardware_Configuration)
   is
      Raw : aliased pcm_h.snd_pcm_hw_params_t
        with Import, Address => Value'Address;

      err : constant Interfaces.C.int :=
        pcm_h.snd_pcm_hw_params
          (Self.pcm, Raw'Unchecked_Access);
   begin
      Check (err);
   end Set_Hardware_Configuration;

   -----------
   -- Start --
   -----------

   procedure Start (Self : in out Device) is
      err : constant Interfaces.C.int := pcm_h.snd_pcm_start (Self.pcm);
   begin
      Check (err);
   end Start;

   -----------------------
   -- Write_Interleaved --
   -----------------------

   procedure Write_Interleaved
     (Self   : in out Device;
      Buffer : System.Address;
      Frames : Positive;
      Last   : out Natural)
   is
      err : constant pcm_h.snd_pcm_sframes_t :=
        pcm_h.snd_pcm_writei
          (Self.pcm,
           Buffer,
           pcm_h.snd_pcm_uframes_t (Frames));
   begin
      Check (Interfaces.C.int (err));

      Last := Natural (err);
   end Write_Interleaved;

end ALSA.PCM;
