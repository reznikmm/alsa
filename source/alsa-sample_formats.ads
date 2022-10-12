--  SPDX-FileCopyrightText: 2022 Max Reznik
--
--  SPDX-License-Identifier: LGPL-2.1-or-later
-------------------------------------------------------------

with System;
private with ALSA.pcm_h;

package ALSA.Sample_Formats  is
   pragma Preelaborate;

   type Format is private;
   --  PCM sample format

   function Signed
     (Bits  : Natural;
      Order : System.Bit_Order := System.Default_Bit_Order) return Format;

   function Unsigned
     (Bits  : Natural;
      Order : System.Bit_Order := System.Default_Bit_Order) return Format;

   function Image (Self : Format) return String;

private

   type Format is record
      Value : ALSA.pcm_h.snd_pcm_format_t;
   end record;

end ALSA.Sample_Formats;
