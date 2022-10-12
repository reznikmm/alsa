--  SPDX-FileCopyrightText: 2022 Max Reznik
--
--  SPDX-License-Identifier: LGPL-2.1-or-later
-------------------------------------------------------------

with Ada.Calendar;

private with Ada.Streams;

package ALSA.PCM.Statuses is

   type Status is private;
   --  The stream status

   function Delays (Self : Status) return Integer;
   --  Get delay from a PCM status container in frames
   --
   --  Delay is distance between current application frame position and sound
   --  frame position. It's positive and less than buffer size in normal
   --  situation, negative on playback underrun and greater than buffer size
   --  on capture overrun.

   function Available (Self : Status) return Natural;
   --  Get number of frames available from a PCM status container

   function Timestamp (Self : Status) return Ada.Calendar.Time;

private

   type Status is record
      Data : Ada.Streams.Stream_Element_Array (1 .. 700) := (others => 0);
   end record;

end ALSA.PCM.Statuses;
