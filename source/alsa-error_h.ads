--  SPDX-FileCopyrightText: 2022 Max Reznik
--
--  SPDX-License-Identifier: LGPL-2.1-or-later
-------------------------------------------------------------

pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package ALSA.error_h is
   pragma Preelaborate;

   function snd_strerror (errnum : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/error.h:45
   with Import => True,
        Convention => C,
        External_Name => "snd_strerror";

end ALSA.error_h;
