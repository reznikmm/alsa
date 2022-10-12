--  SPDX-FileCopyrightText: 2022 Max Reznik
--
--  SPDX-License-Identifier: LGPL-2.1-or-later
-------------------------------------------------------------

private with Ada.Streams;

with ALSA.Sample_Formats;

package ALSA.PCM.Hardware_Parameters is

   type Hardware_Configuration is private;

   function Channels (Self : Hardware_Configuration) return Positive;
   --  Extract channels from a configuration space.
   --
   --  Raise error if the configuration space does not contain a single value

   procedure Set_Channels
     (Self  : in out Hardware_Configuration;
      Value : Positive);
   --  Restrict a configuration space to contain only one channels count.

   function Rate (Self : Hardware_Configuration) return Positive;
   --  Extract rate from a configuration space.
   --
   --  Raise error if the configuration space does not contain a single value

   procedure Set_Rate
     (Self  : in out Hardware_Configuration;
      Value : Positive);
   --  Restrict a configuration space to contain only one rate.

   function Format
     (Self : Hardware_Configuration) return Sample_Formats.Format;
   --  Extract format from a configuration space.
   --
   --  Raise error if the configuration space does not contain a single value

   procedure Set_Format
     (Self  : in out Hardware_Configuration;
      Value : Sample_Formats.Format);
   --  Restrict a configuration space to contain only one format.

   procedure Set_Access_Type
     (Self        : in out Hardware_Configuration;
      Interleaved : Boolean);
   --  Restrict a configuration space to contain only one access type.

   function Period_Size (Self : Hardware_Configuration) return Positive;
   --  Extract period size in frames from a configuration space.
   --
   --  Raise error if the configuration space does not contain a single value

   function Current_Hardware_Configuration
     (Self : Device) return Hardware_Configuration
       with Pre => Self.Is_Open;
   --  Retreive current PCM hardware configuration chosen with
   --  PCM.Set_Hardware_Configuration

   function Any_Hardware_Configuration
     (Self : Device) return Hardware_Configuration
       with Pre => Self.Is_Open;
   --  Return a hardware configuration filled with all possible ranges for the
   --  PCM device.

private

   type Hardware_Configuration is record
      Data : Ada.Streams.Stream_Element_Array (1 .. 700) := (others => 0);
      pcm  : pcm_t;
   end record;

end ALSA.PCM.Hardware_Parameters;
