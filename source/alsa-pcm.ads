--  SPDX-FileCopyrightText: 2022 Max Reznik
--
--  SPDX-License-Identifier: LGPL-2.1-or-later
-------------------------------------------------------------

--  PCM (digital audio) interface
--
--  Although abbreviation PCM stands for Pulse Code Modulation, we are
--  understanding it as general digital audio processing with volume
--  samples generated in continuous time periods.
--
--  The analog signal is recorded via analog to digital converters (ADC). The
--  digital value (de-facto a volume at a specific time) obtained from ADC can
--  be further processed.
--
--  The quality of digital audio signal depends on the time (recording rate)
--  and voltage resolution (usually in an linear integer representation with
--  basic unit one bit).
--
--  The stored digital signal can be converted back to voltage (analog)
--  representation via digital to analog converters (DAC).
--
--  One digital value is called sample. More samples are collected to frames
--  (frame is terminology for ALSA) depending on count of converters used
--  at one specific time. One frame might contain one sample (when only one
--  converter is used - mono) or more samples (for example: stereo has signals
--  from two converters recorded at same time). Digital audio stream contains
--  collection of frames recorded at boundaries of continuous time periods.
--
--  General overview
--  ----------------
--
--  ALSA uses the ring buffer to store outgoing (playback) and incoming
--  (capture, record) samples. There are two pointers being maintained to allow
--  a precise communication between application and device pointing to current
--  processed sample by hardware and last processed sample by application. The
--  modern audio chips allow to program the transfer time periods. It means
--  that the stream of samples is divided to small chunks. Device acknowledges
--  to application when the transfer of a chunk is complete.

limited with ALSA.PCM.Hardware_Parameters;

private with Ada.Finalization;
private with Interfaces.C;
with System;

private with ALSA.pcm_h;

package ALSA.PCM is
   pragma Preelaborate;

   type Device is tagged limited private;

   function Is_Open (Self : Device) return Boolean;

   procedure Open_Capture
     (Self : in out Device;
      Name : String := "default")
        with Pre => not Self.Is_Open;
   --  Opens a PCM for a capture stream

   procedure Open_Playback
     (Self : in out Device;
      Name : String := "default")
        with Pre => not Self.Is_Open;
   --  Opens a PCM for a playback stream

   procedure Close (Self : in out Device)
     with Pre => Self.Is_Open;
   --  Closes the specified PCM handle and frees all associated resources.

   function Any_Hardware_Configuration
     (Self : Device) return ALSA.PCM.Hardware_Parameters.Hardware_Configuration
     with Pre => Self.Is_Open;
   --  Return a hardware configuration filled with all possible ranges for the
   --  PCM device.

   procedure Set_Hardware_Configuration
     (Self  : in out Device;
      Value : in out ALSA.PCM.Hardware_Parameters.Hardware_Configuration)
        with Pre => Self.Is_Open;
   --  Install one PCM hardware configuration chosen from a configuration space
   --
   --  The configuration is chosen fixing single parameters in this order:
   --  first access, first format, first subformat, min channels, min rate, min
   --  period time, max buffer size, min tick time. If no mutually compatible
   --  set of parameters can be chosen, an error code will be raised.
   --
   --  The hardware parameters cannot be changed when the stream is running.
   --
   --  The configuration space will be updated to reflect the chosen
   --  parameters.

   function Current_Hardware_Configuration
     (Self : Device) return ALSA.PCM.Hardware_Parameters.Hardware_Configuration
     with Pre => Self.Is_Open;
   --  Retreive current PCM hardware configuration chosen with
   --  Set_Hardware_Configuration

   procedure Start (Self : in out Device)
     with Pre => Self.Is_Open;
   --  Start a PCM.

   procedure Read_Interleaved
     (Self   : in out Device;
      Buffer : System.Address;
      Frames : Positive;
      Last   : out Natural)
        with Pre => Self.Is_Open;
   --  Read interleaved frames from a PCM.

   procedure Write_Interleaved
     (Self   : in out Device;
      Buffer : System.Address;
      Frames : Positive;
      Last   : out Natural)
        with Pre => Self.Is_Open;
   --  Write interleaved frames to a PCM.

   procedure Drop (Self : in out Device)
     with Pre => Self.Is_Open;
   --  Stop a PCM dropping pending frames.
   --
   --  This function stops the PCM immediately. The pending samples on the
   --  buffer are ignored.

   ALSA_Error : exception;

private

   type pcm_t is access all ALSA.pcm_h.snd_pcm_t
     with Convention => C;

   type Device is new Ada.Finalization.Limited_Controlled with record
      pcm : aliased pcm_t;
   end record;

   overriding procedure Finalize (Self : in out Device);

   function Is_Open (Self : Device) return Boolean is
      (Self.pcm /= null);

   procedure Check (err : Interfaces.C.int);

end ALSA.PCM;
