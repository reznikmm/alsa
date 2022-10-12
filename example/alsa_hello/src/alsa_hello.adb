--  SPDX-FileCopyrightText: 2022 Max Reznik
--
--  SPDX-License-Identifier: LGPL-2.1-or-later
-------------------------------------------------------------

with Ada.Text_IO;
with Interfaces;

with ALSA.PCM;
with ALSA.Sample_Formats;
with ALSA.PCM.Hardware_Parameters;
use ALSA.PCM.Hardware_Parameters;

procedure Alsa_Hello is
   Device : ALSA.PCM.Device;
   S16    : constant ALSA.Sample_Formats.Format :=
     ALSA.Sample_Formats.Signed (16);
   HW : ALSA.PCM.Hardware_Parameters.Hardware_Configuration;
begin
   Device.Open_Capture ("sysdefault");
   HW := Device.Any_Hardware_Configuration;

   --  Set_Channels (HW, 2);
   --  Set_Rate (HW, 12000);
   Set_Format (HW, S16);
   Set_Access_Type (HW, Interleaved => True);

   Device.Set_Hardware_Configuration (HW);

   Ada.Text_IO.Put_Line ("Channels:" & Channels (HW)'Image);
   Ada.Text_IO.Put_Line ("Rate:" & Rate (HW)'Image);
   Ada.Text_IO.Put_Line ("Periods:" & Period_Size (HW)'Image);

   Ada.Text_IO.Put_Line
     ("Format:" & ALSA.Sample_Formats.Image (Format (HW)));

   Device.Start;

   declare
      Buffer : array (1 .. 1024) of Interfaces.Integer_16;
      Last   : Natural;
   begin
      Device.Read_Interleaved
        (Buffer'Address, Frames => Buffer'Length, Last => Last);
   end;

   Device.Drop;
   Device.Close;
end Alsa_Hello;
