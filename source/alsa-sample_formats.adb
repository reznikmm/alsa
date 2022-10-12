--  SPDX-FileCopyrightText: 2022 Max Reznik
--
--  SPDX-License-Identifier: LGPL-2.1-or-later
-------------------------------------------------------------

package body ALSA.Sample_Formats  is

   function Image (Self : Format) return String is
   begin
      case Self.Value is
      when pcm_h.PCM_FORMAT_UNKNOWN => return "PCM_FORMAT_UNKNOWN";
      when pcm_h.PCM_FORMAT_S8 => return "PCM_FORMAT_S8";
      when pcm_h.PCM_FORMAT_U8 => return "PCM_FORMAT_U8";
      when pcm_h.PCM_FORMAT_S16_LE => return "PCM_FORMAT_S16_LE";
      when pcm_h.PCM_FORMAT_S16_BE => return "PCM_FORMAT_S16_BE";
      when pcm_h.PCM_FORMAT_U16_LE => return "PCM_FORMAT_U16_LE";
      when pcm_h.PCM_FORMAT_U16_BE => return "PCM_FORMAT_U16_BE";
      when pcm_h.PCM_FORMAT_S24_LE => return "PCM_FORMAT_S24_LE";
      when pcm_h.PCM_FORMAT_S24_BE => return "PCM_FORMAT_S24_BE";
      when pcm_h.PCM_FORMAT_U24_LE => return "PCM_FORMAT_U24_LE";
      when pcm_h.PCM_FORMAT_U24_BE => return "PCM_FORMAT_U24_BE";
      when pcm_h.PCM_FORMAT_S32_LE => return "PCM_FORMAT_S32_LE";
      when pcm_h.PCM_FORMAT_S32_BE => return "PCM_FORMAT_S32_BE";
      when pcm_h.PCM_FORMAT_U32_LE => return "PCM_FORMAT_U32_LE";
      when pcm_h.PCM_FORMAT_U32_BE => return "PCM_FORMAT_U32_BE";
      when pcm_h.PCM_FORMAT_FLOAT_LE => return "PCM_FORMAT_FLOAT_LE";
      when pcm_h.PCM_FORMAT_FLOAT_BE => return "PCM_FORMAT_FLOAT_BE";
      when pcm_h.PCM_FORMAT_FLOAT64_LE => return "PCM_FORMAT_FLOAT64_LE";
      when pcm_h.PCM_FORMAT_FLOAT64_BE => return "PCM_FORMAT_FLOAT64_BE";
      when pcm_h.PCM_FORMAT_IEC958_SUBFRAME_LE =>
         return "PCM_FORMAT_IEC958_SUBFRAME_LE";
      when pcm_h.PCM_FORMAT_IEC958_SUBFRAME_BE =>
         return "PCM_FORMAT_IEC958_SUBFRAME_BE";
      when pcm_h.PCM_FORMAT_MU_LAW => return "PCM_FORMAT_MU_LAW";
      when pcm_h.PCM_FORMAT_A_LAW => return "PCM_FORMAT_A_LAW";
      when pcm_h.PCM_FORMAT_IMA_ADPCM => return "PCM_FORMAT_IMA_ADPCM";
      when pcm_h.PCM_FORMAT_MPEG => return "PCM_FORMAT_MPEG";
      when pcm_h.PCM_FORMAT_GSM => return "PCM_FORMAT_GSM";
      when pcm_h.PCM_FORMAT_S20_LE => return "PCM_FORMAT_S20_LE";
      when pcm_h.PCM_FORMAT_S20_BE => return "PCM_FORMAT_S20_BE";
      when pcm_h.PCM_FORMAT_U20_LE => return "PCM_FORMAT_U20_LE";
      when pcm_h.PCM_FORMAT_U20_BE => return "PCM_FORMAT_U20_BE";
      when pcm_h.PCM_FORMAT_SPECIAL => return "PCM_FORMAT_SPECIAL";
      when pcm_h.PCM_FORMAT_S24_3LE => return "PCM_FORMAT_S24_3LE";
      when pcm_h.PCM_FORMAT_S24_3BE => return "PCM_FORMAT_S24_3BE";
      when pcm_h.PCM_FORMAT_U24_3LE => return "PCM_FORMAT_U24_3LE";
      when pcm_h.PCM_FORMAT_U24_3BE => return "PCM_FORMAT_U24_3BE";
      when pcm_h.PCM_FORMAT_S20_3LE => return "PCM_FORMAT_S20_3LE";
      when pcm_h.PCM_FORMAT_S20_3BE => return "PCM_FORMAT_S20_3BE";
      when pcm_h.PCM_FORMAT_U20_3LE => return "PCM_FORMAT_U20_3LE";
      when pcm_h.PCM_FORMAT_U20_3BE => return "PCM_FORMAT_U20_3BE";
      when pcm_h.PCM_FORMAT_S18_3LE => return "PCM_FORMAT_S18_3LE";
      when pcm_h.PCM_FORMAT_S18_3BE => return "PCM_FORMAT_S18_3BE";
      when pcm_h.PCM_FORMAT_U18_3LE => return "PCM_FORMAT_U18_3LE";
      when pcm_h.PCM_FORMAT_U18_3BE => return "PCM_FORMAT_U18_3BE";
      when pcm_h.PCM_FORMAT_G723_24 => return "PCM_FORMAT_G723_24";
      when pcm_h.PCM_FORMAT_G723_24_1B => return "PCM_FORMAT_G723_24_1B";
      when pcm_h.PCM_FORMAT_G723_40 => return "PCM_FORMAT_G723_40";
      when pcm_h.PCM_FORMAT_G723_40_1B => return "PCM_FORMAT_G723_40_1B";
      when pcm_h.PCM_FORMAT_DSD_U8 => return "PCM_FORMAT_DSD_U8";
      when pcm_h.PCM_FORMAT_DSD_U16_LE => return "PCM_FORMAT_DSD_U16_LE";
      when pcm_h.PCM_FORMAT_DSD_U32_LE => return "PCM_FORMAT_DSD_U32_LE";
      when pcm_h.PCM_FORMAT_DSD_U16_BE => return "PCM_FORMAT_DSD_U16_BE";
      when pcm_h.PCM_FORMAT_DSD_U32_BE => return "PCM_FORMAT_DSD_U32_BE";
      when others => return "Invalid format value";
      end case;

   end Image;

   ------------
   -- Signed --
   ------------

   function Signed
     (Bits  : Natural;
      Order : System.Bit_Order := System.Default_Bit_Order) return Format
   is
      use all type System.Bit_Order;
      Result : ALSA.pcm_h.snd_pcm_format_t;
   begin
      case Bits is
         when 8 =>
            Result := pcm_h.PCM_FORMAT_S8;
         when 16 =>
            Result := (if Order = High_Order_First
                       then pcm_h.PCM_FORMAT_S16_BE
                       else pcm_h.PCM_FORMAT_S16_LE);
         when 20 =>
            Result := (if Order = High_Order_First
                       then pcm_h.PCM_FORMAT_S20_BE
                       else pcm_h.PCM_FORMAT_S20_LE);
         when 24 =>
            Result := (if Order = High_Order_First
                       then pcm_h.PCM_FORMAT_S24_BE
                       else pcm_h.PCM_FORMAT_S24_LE);
         when 32 =>
            Result := (if Order = High_Order_First
                       then pcm_h.PCM_FORMAT_S32_BE
                       else pcm_h.PCM_FORMAT_S32_LE);
         when others =>
            raise Program_Error;
      end case;

      return (Value => Result);
   end Signed;

   --------------
   -- Unsigned --
   --------------

   function Unsigned
     (Bits  : Natural;
      Order : System.Bit_Order := System.Default_Bit_Order) return Format
   is
      use all type System.Bit_Order;
      Result : ALSA.pcm_h.snd_pcm_format_t;
   begin
      case Bits is
         when 8 =>
            Result := pcm_h.PCM_FORMAT_U8;
         when 16 =>
            Result := (if Order = High_Order_First
                       then pcm_h.PCM_FORMAT_U16_BE
                       else pcm_h.PCM_FORMAT_U16_LE);
         when 20 =>
            Result := (if Order = High_Order_First
                       then pcm_h.PCM_FORMAT_U20_BE
                       else pcm_h.PCM_FORMAT_U20_LE);
         when 24 =>
            Result := (if Order = High_Order_First
                       then pcm_h.PCM_FORMAT_U24_BE
                       else pcm_h.PCM_FORMAT_U24_LE);
         when 32 =>
            Result := (if Order = High_Order_First
                       then pcm_h.PCM_FORMAT_U32_BE
                       else pcm_h.PCM_FORMAT_U32_LE);
         when others =>
            raise Program_Error;
      end case;

      return (Value => Result);
   end Unsigned;

end ALSA.Sample_Formats;
