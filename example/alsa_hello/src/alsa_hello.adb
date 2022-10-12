--  SPDX-FileCopyrightText: 2022 Max Reznik
--
--  SPDX-License-Identifier: LGPL-2.1-or-later
-------------------------------------------------------------

with Ada.Command_Line;
with Ada.Calendar;
with Ada.Text_IO;
with Interfaces;

with ALSA.PCM;
with ALSA.Sample_Formats;
with ALSA.PCM.Statuses;            use ALSA.PCM.Statuses;
with ALSA.PCM.Hardware_Parameters; use ALSA.PCM.Hardware_Parameters;

procedure Alsa_Hello is
   Device : ALSA.PCM.Device;
   S16    : constant ALSA.Sample_Formats.Format :=
     ALSA.Sample_Formats.Signed (16);
   HW     : ALSA.PCM.Hardware_Parameters.Hardware_Configuration;

   Prev_1 : Ada.Calendar.Time := Ada.Calendar.Clock;
   Prev_2 : Ada.Calendar.Time := Ada.Calendar.Clock;
begin
   if Ada.Command_Line.Argument_Count > 0 then
      Device.Open_Capture (Ada.Command_Line.Argument (1));
   else
      Device.Open_Capture ("default");
   end if;

   HW := Device.Any_Hardware_Configuration;

   Set_Channels (HW, 1);
   Set_Rate (HW, 12000);
   Set_Format (HW, S16);
   Set_Access_Type (HW, Interleaved => True);

   Device.Set_Hardware_Configuration (HW);

   Ada.Text_IO.Put_Line ("Channels:" & Channels (HW)'Image);
   Ada.Text_IO.Put_Line ("Rate:" & Rate (HW)'Image);
   Ada.Text_IO.Put_Line ("Periods:" & Period_Size (HW)'Image);

   Ada.Text_IO.Put_Line
     ("Format:" & ALSA.Sample_Formats.Image (Format (HW)));

   Device.Start;

   for J in 1 .. 100 loop
      declare
         use type Ada.Calendar.Time;

         Status : ALSA.PCM.Statuses.Status;
         Buffer : array (1 .. 1024) of Interfaces.Integer_16;
         Last   : Natural;
         Max    : Natural := 0;
      begin
         Device.Read_Interleaved
           (Buffer'Address, Frames => Buffer'Length, Last => Last);

         Status := Device.Status;

         exit when Last /= Buffer'Length;

         for K of Buffer loop
            Max := Natural'Max (Max, abs Integer (K));
         end loop;

         Ada.Text_IO.Put (Duration'Image (Timestamp (Status) - Prev_1));
         Prev_1 := Timestamp (Status);

         Ada.Text_IO.Put (Duration'Image (Ada.Calendar.Clock - Prev_2));
         Prev_2 := Ada.Calendar.Clock;

         Ada.Text_IO.Put (Available (Status)'Image);
         Ada.Text_IO.Put (Delays (Status)'Image);
         Ada.Text_IO.Put_Line (Max'Image);
      end;
   end loop;

   Device.Drop;
   Device.Close;
end Alsa_Hello;
