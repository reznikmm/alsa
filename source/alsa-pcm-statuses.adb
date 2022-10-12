--  SPDX-FileCopyrightText: 2022 Max Reznik
--
--  SPDX-License-Identifier: LGPL-2.1-or-later
-------------------------------------------------------------

with Ada.Calendar.Conversions;

package body ALSA.PCM.Statuses is

   type snd_htimestamp_t is record
      tv_sec  : Interfaces.C.long;
      tv_nsec : Interfaces.C.long;
   end record
     with Convention => C;

   ---------------
   -- Available --
   ---------------

   function Available (Self : Status) return Natural is
      pcm_status : aliased pcm_h.snd_pcm_status_t
        with Address => Self'Address;

      Result : constant pcm_h.snd_pcm_uframes_t :=
        pcm_h.snd_pcm_status_get_avail (pcm_status'Unchecked_Access);

   begin
      return Natural (Result);
   end Available;

   ------------
   -- Delays --
   ------------

   function Delays (Self : Status) return Integer is
      pcm_status : aliased pcm_h.snd_pcm_status_t
        with Address => Self'Address;

      Result : constant pcm_h.snd_pcm_sframes_t :=
        pcm_h.snd_pcm_status_get_delay (pcm_status'Unchecked_Access);

   begin
      return Integer (Result);
   end Delays;

   ---------------
   -- Timestamp --
   ---------------

   function Timestamp (Self : Status) return Ada.Calendar.Time is

      use type Ada.Calendar.Time;

      pcm_status : aliased pcm_h.snd_pcm_status_t
        with Address => Self'Address;

      Result : aliased snd_htimestamp_t;

      Raw    : aliased Interfaces.C.int
        with Import, Address => Result'Address;

   begin
      pcm_h.snd_pcm_status_get_htstamp
        (pcm_status'Unchecked_Access, Raw'Unchecked_Access);

      return Ada.Calendar.Conversions.To_Ada_Time (Result.tv_sec)
        + Ada.Calendar.Conversions.To_Duration (0, Result.tv_nsec);
   end Timestamp;

end ALSA.PCM.Statuses;
