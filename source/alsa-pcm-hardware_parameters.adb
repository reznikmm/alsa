--  SPDX-FileCopyrightText: 2022 Max Reznik
--
--  SPDX-License-Identifier: LGPL-2.1-or-later
-------------------------------------------------------------

package body ALSA.PCM.Hardware_Parameters is

   --------------------------------
   -- Any_Hardware_Configuration --
   --------------------------------

   function Any_Hardware_Configuration
     (Self : Device) return Hardware_Configuration
   is
      use type Interfaces.C.size_t;
   begin
      return Result : ALSA.PCM.Hardware_Parameters.Hardware_Configuration do
         declare
            hw_params : aliased pcm_h.snd_pcm_hw_params_t
              with Address => Result'Address;
         begin
            pragma Assert (Result'Size >= 8 * pcm_h.snd_pcm_hw_params_sizeof);

            Check
              (pcm_h.snd_pcm_hw_params_any
                (pcm => Self.pcm, params => hw_params'Unchecked_Access));

            Result.pcm := Self.pcm;
         end;
      end return;
   end Any_Hardware_Configuration;

   --------------
   -- Channels --
   --------------

   function Channels (Self : Hardware_Configuration) return Positive is
      Result    : aliased Interfaces.C.unsigned;

      hw_params : aliased pcm_h.snd_pcm_hw_params_t
        with Address => Self'Address;

      err       : constant Interfaces.C.int :=
        pcm_h.snd_pcm_hw_params_get_channels
          (hw_params'Unchecked_Access, Result'Unchecked_Access);

   begin
      Check (err);
      return Natural (Result);
   end Channels;

   ------------------------------------
   -- Current_Hardware_Configuration --
   ------------------------------------

   function Current_Hardware_Configuration
     (Self : Device) return Hardware_Configuration
   is
      use type Interfaces.C.size_t;
   begin
      return Result : ALSA.PCM.Hardware_Parameters.Hardware_Configuration do
         declare
            hw_params : aliased pcm_h.snd_pcm_hw_params_t
              with Address => Result'Address;
         begin
            pragma Assert (Result'Size >= 8 * pcm_h.snd_pcm_hw_params_sizeof);

            Check
              (pcm_h.snd_pcm_hw_params_current
                (pcm => Self.pcm, params => hw_params'Unchecked_Access));

            Result.pcm := Self.pcm;
         end;
      end return;
   end Current_Hardware_Configuration;

   ------------
   -- Format --
   ------------

   function Format
     (Self : Hardware_Configuration) return Sample_Formats.Format
   is
      Value : aliased Sample_Formats.Format;

      Raw   : aliased pcm_h.snd_pcm_format_t
        with Import, Address => Value'Address;

      hw_params : aliased pcm_h.snd_pcm_hw_params_t
        with Address => Self'Address;

      err       : constant Interfaces.C.int :=
        pcm_h.snd_pcm_hw_params_get_format
          (hw_params'Unchecked_Access, Raw'Unchecked_Access);

   begin
      Check (err);
      return Value;
   end Format;

   -------------
   -- Periods --
   -------------

   function Period_Size (Self : Hardware_Configuration) return Positive is
      Result    : aliased pcm_h.snd_pcm_uframes_t;

      hw_params : aliased pcm_h.snd_pcm_hw_params_t
        with Address => Self'Address;

      Ignore    : aliased Interfaces.C.int;

      err       : constant Interfaces.C.int :=
        pcm_h.snd_pcm_hw_params_get_period_size
          (hw_params'Unchecked_Access,
           Result'Unchecked_Access,
           Ignore'Unchecked_Access);

   begin
      Check (err);
      return Natural (Result);
   end Period_Size;

   ----------
   -- Rate --
   ----------

   function Rate (Self : Hardware_Configuration) return Positive is
      Result    : aliased Interfaces.C.unsigned;

      hw_params : aliased pcm_h.snd_pcm_hw_params_t
        with Address => Self'Address;

      Ignore    : aliased Interfaces.C.int;

      err       : constant Interfaces.C.int :=
        pcm_h.snd_pcm_hw_params_get_rate
          (hw_params'Unchecked_Access,
           Result'Unchecked_Access,
           Ignore'Unchecked_Access);

   begin
      Check (err);
      return Natural (Result);
   end Rate;

   ---------------------
   -- Set_Access_Type --
   ---------------------

   procedure Set_Access_Type
     (Self        : in out Hardware_Configuration;
      Interleaved : Boolean)
   is
      hw_params : aliased pcm_h.snd_pcm_hw_params_t
        with Address => Self'Address;

      err       : constant Interfaces.C.int :=
        pcm_h.snd_pcm_hw_params_set_access
          (Self.pcm,
           hw_params'Unchecked_Access,
           (if Interleaved then pcm_h.PCM_ACCESS_RW_INTERLEAVED
               else pcm_h.PCM_ACCESS_RW_NONINTERLEAVED));

   begin
      Check (err);
   end Set_Access_Type;

   ------------------
   -- Set_Channels --
   ------------------

   procedure Set_Channels
     (Self  : in out Hardware_Configuration;
      Value : Positive)
   is
      hw_params : aliased pcm_h.snd_pcm_hw_params_t
        with Address => Self'Address;

      err       : constant Interfaces.C.int :=
        pcm_h.snd_pcm_hw_params_set_channels
          (Self.pcm,
           hw_params'Unchecked_Access,
           Interfaces.C.unsigned (Value));

   begin
      Check (err);
   end Set_Channels;

   ----------------
   -- Set_Format --
   ----------------

   procedure Set_Format
     (Self  : in out Hardware_Configuration;
      Value : Sample_Formats.Format)
   is
      hw_params : aliased pcm_h.snd_pcm_hw_params_t
        with Import, Address => Self'Address;

      Raw : pcm_h.snd_pcm_format_t
        with Import, Address => Value'Address;

      err       : constant Interfaces.C.int :=
        pcm_h.snd_pcm_hw_params_set_format
          (Self.pcm,
           hw_params'Unchecked_Access,
           Raw);

   begin
      Check (err);
   end Set_Format;

   --------------
   -- Set_Rate --
   --------------

   procedure Set_Rate
     (Self  : in out Hardware_Configuration;
      Value : Positive)
   is
      hw_params : aliased pcm_h.snd_pcm_hw_params_t
        with Address => Self'Address;

      err       : constant Interfaces.C.int :=
        pcm_h.snd_pcm_hw_params_set_rate
          (Self.pcm,
           hw_params'Unchecked_Access,
           Interfaces.C.unsigned (Value),
           dir => 0);

   begin
      Check (err);
   end Set_Rate;

end ALSA.PCM.Hardware_Parameters;
