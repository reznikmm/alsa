--  SPDX-FileCopyrightText: 2022 Max Reznik
--
--  SPDX-License-Identifier: LGPL-2.1-or-later
-------------------------------------------------------------

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with System;
with Interfaces.C.Strings;

package ALSA.pcm_h is
   pragma Preelaborate;

   --  unsupported macro: PCM_DLSYM_VERSION _dlsym_pcm_001

   PCM_NONBLOCK : constant := 16#00000001#;  --  /usr/include/alsa/pcm.h:379

   PCM_ASYNC    : constant := 16#00000002#;  --  /usr/include/alsa/pcm.h:381

   PCM_ABORT    : constant := 16#00008000#;  --  /usr/include/alsa/pcm.h:383

   PCM_NO_AUTO_RESAMPLE : constant := 16#00010000#;  --  /usr/include/alsa/pcm.h:385

   PCM_NO_AUTO_CHANNELS : constant := 16#00020000#;  --  /usr/include/alsa/pcm.h:387

   PCM_NO_AUTO_FORMAT : constant := 16#00040000#;  --  /usr/include/alsa/pcm.h:389

   PCM_NO_SOFTVOL : constant := 16#00080000#;  --  /usr/include/alsa/pcm.h:391
   --  unsupported macro: CHMAP_API_VERSION ((1 << 16) | (0 << 8) | 1)

   CHMAP_POSITION_MASK : constant := 16#ffff#;  --  /usr/include/alsa/pcm.h:600

   --  unsupported macro: CHMAP_PHASE_INVERSE (0x01 << 16)
   --  unsupported macro: CHMAP_DRIVER_SPEC (0x02 << 16)
   --  arg-macro: procedure snd_pcm_info_alloca (ptr)
   --    __snd_alloca(ptr, snd_pcm_info)
   --  arg-macro: procedure snd_pcm_hw_params_alloca (ptr)
   --    __snd_alloca(ptr, snd_pcm_hw_params)
   --  arg-macro: procedure snd_pcm_sw_params_alloca (ptr)
   --    __snd_alloca(ptr, snd_pcm_sw_params)
   --  arg-macro: procedure snd_pcm_access_mask_alloca (ptr)
   --    __snd_alloca(ptr, snd_pcm_access_mask)
   --  arg-macro: procedure snd_pcm_format_mask_alloca (ptr)
   --    __snd_alloca(ptr, snd_pcm_format_mask)
   --  arg-macro: procedure snd_pcm_subformat_mask_alloca (ptr)
   --    __snd_alloca(ptr, snd_pcm_subformat_mask)
   --  arg-macro: procedure snd_pcm_status_alloca (ptr)
   --    __snd_alloca(ptr, snd_pcm_status)

  --*
  -- * \file include/pcm.h
  -- * \brief Application interface library for the ALSA driver
  -- * \author Jaroslav Kysela <perex@perex.cz>
  -- * \author Abramo Bagnara <abramo@alsa-project.org>
  -- * \author Takashi Iwai <tiwai@suse.de>
  -- * \date 1998-2001
  -- *
  -- * Application interface library for the ALSA driver.
  -- * See the \ref pcm page for more details.
  --

  -- *   This library is free software; you can redistribute it and/or modify
  -- *   it under the terms of the GNU Lesser General Public License as
  -- *   published by the Free Software Foundation; either version 2.1 of
  -- *   the License, or (at your option) any later version.
  -- *
  -- *   This program is distributed in the hope that it will be useful,
  -- *   but WITHOUT ANY WARRANTY; without even the implied warranty of
  -- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  -- *   GNU Lesser General Public License for more details.
  -- *
  -- *   You should have received a copy of the GNU Lesser General Public
  -- *   License along with this library; if not, write to the Free Software
  -- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
  -- *
  --

  --*
  -- *  \defgroup PCM PCM Interface
  -- *  See the \ref pcm page for more details.
  -- *  \{
  --

  --* dlsym version for interface entry callback
  --* PCM generic info container
   type u_snd_pcm_info is null record;   -- incomplete struct

   subtype snd_pcm_info_t is u_snd_pcm_info;  -- /usr/include/alsa/pcm.h:48

  --* PCM hardware configuration space container
  -- *
  -- *  snd_pcm_hw_params_t is an opaque structure which contains a set of possible
  -- *  PCM hardware configurations. For example, a given instance might include a
  -- *  range of buffer sizes, a range of period sizes, and a set of several sample
  -- *  formats. Some subset of all possible combinations these sets may be valid,
  -- *  but not necessarily any combination will be valid.
  -- *
  -- *  When a parameter is set or restricted using a snd_pcm_hw_params_set*
  -- *  function, all of the other ranges will be updated to exclude as many
  -- *  impossible configurations as possible. Attempting to set a parameter
  -- *  outside of its acceptable range will result in the function failing
  -- *  and an error code being returned.
  --

   type u_snd_pcm_hw_params is null record;   -- incomplete struct

   subtype snd_pcm_hw_params_t is u_snd_pcm_hw_params;  -- /usr/include/alsa/pcm.h:64

  --* PCM software configuration container
   type u_snd_pcm_sw_params is null record;   -- incomplete struct

   subtype snd_pcm_sw_params_t is u_snd_pcm_sw_params;  -- /usr/include/alsa/pcm.h:67

  --* PCM status container
   type u_snd_pcm_status is null record;   -- incomplete struct

   subtype snd_pcm_status_t is u_snd_pcm_status;  -- /usr/include/alsa/pcm.h:69

  --* PCM access types mask
   type u_snd_pcm_access_mask is null record;   -- incomplete struct

   subtype snd_pcm_access_mask_t is u_snd_pcm_access_mask;  -- /usr/include/alsa/pcm.h:71

  --* PCM formats mask
   type u_snd_pcm_format_mask is null record;   -- incomplete struct

   subtype snd_pcm_format_mask_t is u_snd_pcm_format_mask;  -- /usr/include/alsa/pcm.h:73

  --* PCM subformats mask
   type u_snd_pcm_subformat_mask is null record;   -- incomplete struct

   subtype snd_pcm_subformat_mask_t is u_snd_pcm_subformat_mask;  -- /usr/include/alsa/pcm.h:75

  --* PCM class
   subtype u_snd_pcm_class is unsigned;
   PCM_CLASS_GENERIC : constant unsigned := 0;
   PCM_CLASS_MULTI : constant unsigned := 1;
   PCM_CLASS_MODEM : constant unsigned := 2;
   PCM_CLASS_DIGITIZER : constant unsigned := 3;
   PCM_CLASS_LAST : constant unsigned := 3;  -- /usr/include/alsa/pcm.h:78

  --* standard device
  --* multichannel device
  --* software modem device
  --* digitizer device
   subtype snd_pcm_class_t is u_snd_pcm_class;  -- /usr/include/alsa/pcm.h:89

  --* PCM subclass
   subtype u_snd_pcm_subclass is unsigned;
   PCM_SUBCLASS_GENERIC_MIX : constant unsigned := 0;
   PCM_SUBCLASS_MULTI_MIX : constant unsigned := 1;
   PCM_SUBCLASS_LAST : constant unsigned := 1;  -- /usr/include/alsa/pcm.h:92

  --* subdevices are mixed together
  --* multichannel subdevices are mixed together
   subtype snd_pcm_subclass_t is u_snd_pcm_subclass;  -- /usr/include/alsa/pcm.h:98

  --* PCM stream (direction)
   subtype u_snd_pcm_stream is unsigned;
   PCM_STREAM_PLAYBACK : constant unsigned := 0;
   PCM_STREAM_CAPTURE : constant unsigned := 1;
   PCM_STREAM_LAST : constant unsigned := 1;  -- /usr/include/alsa/pcm.h:101

  --* Playback stream
  --* Capture stream
   subtype snd_pcm_stream_t is u_snd_pcm_stream;  -- /usr/include/alsa/pcm.h:107

  --* PCM access type
   subtype u_snd_pcm_access is unsigned;
   PCM_ACCESS_MMAP_INTERLEAVED : constant unsigned := 0;
   PCM_ACCESS_MMAP_NONINTERLEAVED : constant unsigned := 1;
   PCM_ACCESS_MMAP_COMPLEX : constant unsigned := 2;
   PCM_ACCESS_RW_INTERLEAVED : constant unsigned := 3;
   PCM_ACCESS_RW_NONINTERLEAVED : constant unsigned := 4;
   PCM_ACCESS_LAST : constant unsigned := 4;  -- /usr/include/alsa/pcm.h:110

  --* mmap access with simple interleaved channels
  --* mmap access with simple non interleaved channels
  --* mmap access with complex placement
  --* snd_pcm_readi/snd_pcm_writei access
  --* snd_pcm_readn/snd_pcm_writen access
   subtype snd_pcm_access_t is u_snd_pcm_access;  -- /usr/include/alsa/pcm.h:122

  --* PCM sample format
   subtype u_snd_pcm_format is int;
   PCM_FORMAT_UNKNOWN : constant int := -1;
   PCM_FORMAT_S8 : constant int := 0;
   PCM_FORMAT_U8 : constant int := 1;
   PCM_FORMAT_S16_LE : constant int := 2;
   PCM_FORMAT_S16_BE : constant int := 3;
   PCM_FORMAT_U16_LE : constant int := 4;
   PCM_FORMAT_U16_BE : constant int := 5;
   PCM_FORMAT_S24_LE : constant int := 6;
   PCM_FORMAT_S24_BE : constant int := 7;
   PCM_FORMAT_U24_LE : constant int := 8;
   PCM_FORMAT_U24_BE : constant int := 9;
   PCM_FORMAT_S32_LE : constant int := 10;
   PCM_FORMAT_S32_BE : constant int := 11;
   PCM_FORMAT_U32_LE : constant int := 12;
   PCM_FORMAT_U32_BE : constant int := 13;
   PCM_FORMAT_FLOAT_LE : constant int := 14;
   PCM_FORMAT_FLOAT_BE : constant int := 15;
   PCM_FORMAT_FLOAT64_LE : constant int := 16;
   PCM_FORMAT_FLOAT64_BE : constant int := 17;
   PCM_FORMAT_IEC958_SUBFRAME_LE : constant int := 18;
   PCM_FORMAT_IEC958_SUBFRAME_BE : constant int := 19;
   PCM_FORMAT_MU_LAW : constant int := 20;
   PCM_FORMAT_A_LAW : constant int := 21;
   PCM_FORMAT_IMA_ADPCM : constant int := 22;
   PCM_FORMAT_MPEG : constant int := 23;
   PCM_FORMAT_GSM : constant int := 24;
   PCM_FORMAT_S20_LE : constant int := 25;
   PCM_FORMAT_S20_BE : constant int := 26;
   PCM_FORMAT_U20_LE : constant int := 27;
   PCM_FORMAT_U20_BE : constant int := 28;
   PCM_FORMAT_SPECIAL : constant int := 31;
   PCM_FORMAT_S24_3LE : constant int := 32;
   PCM_FORMAT_S24_3BE : constant int := 33;
   PCM_FORMAT_U24_3LE : constant int := 34;
   PCM_FORMAT_U24_3BE : constant int := 35;
   PCM_FORMAT_S20_3LE : constant int := 36;
   PCM_FORMAT_S20_3BE : constant int := 37;
   PCM_FORMAT_U20_3LE : constant int := 38;
   PCM_FORMAT_U20_3BE : constant int := 39;
   PCM_FORMAT_S18_3LE : constant int := 40;
   PCM_FORMAT_S18_3BE : constant int := 41;
   PCM_FORMAT_U18_3LE : constant int := 42;
   PCM_FORMAT_U18_3BE : constant int := 43;
   PCM_FORMAT_G723_24 : constant int := 44;
   PCM_FORMAT_G723_24_1B : constant int := 45;
   PCM_FORMAT_G723_40 : constant int := 46;
   PCM_FORMAT_G723_40_1B : constant int := 47;
   PCM_FORMAT_DSD_U8 : constant int := 48;
   PCM_FORMAT_DSD_U16_LE : constant int := 49;
   PCM_FORMAT_DSD_U32_LE : constant int := 50;
   PCM_FORMAT_DSD_U16_BE : constant int := 51;
   PCM_FORMAT_DSD_U32_BE : constant int := 52;
   PCM_FORMAT_LAST : constant int := 52;
   PCM_FORMAT_S16 : constant int := 2;
   PCM_FORMAT_U16 : constant int := 4;
   PCM_FORMAT_S24 : constant int := 6;
   PCM_FORMAT_U24 : constant int := 8;
   PCM_FORMAT_S32 : constant int := 10;
   PCM_FORMAT_U32 : constant int := 12;
   PCM_FORMAT_FLOAT : constant int := 14;
   PCM_FORMAT_FLOAT64 : constant int := 16;
   PCM_FORMAT_IEC958_SUBFRAME : constant int := 18;
   PCM_FORMAT_S20 : constant int := 25;
   PCM_FORMAT_U20 : constant int := 27;  -- /usr/include/alsa/pcm.h:125

  --* Unknown
  --* Signed 8 bit
  --* Unsigned 8 bit
  --* Signed 16 bit Little Endian
  --* Signed 16 bit Big Endian
  --* Unsigned 16 bit Little Endian
  --* Unsigned 16 bit Big Endian
  --* Signed 24 bit Little Endian using low three bytes in 32-bit word
  --* Signed 24 bit Big Endian using low three bytes in 32-bit word
  --* Unsigned 24 bit Little Endian using low three bytes in 32-bit word
  --* Unsigned 24 bit Big Endian using low three bytes in 32-bit word
  --* Signed 32 bit Little Endian
  --* Signed 32 bit Big Endian
  --* Unsigned 32 bit Little Endian
  --* Unsigned 32 bit Big Endian
  --* Float 32 bit Little Endian, Range -1.0 to 1.0
  --* Float 32 bit Big Endian, Range -1.0 to 1.0
  --* Float 64 bit Little Endian, Range -1.0 to 1.0
  --* Float 64 bit Big Endian, Range -1.0 to 1.0
  --* IEC-958 Little Endian
  --* IEC-958 Big Endian
  --* Mu-Law
  --* A-Law
  --* Ima-ADPCM
  --* MPEG
  --* GSM
  --* Signed 20bit Little Endian in 4bytes format, LSB justified
  --* Signed 20bit Big Endian in 4bytes format, LSB justified
  --* Unsigned 20bit Little Endian in 4bytes format, LSB justified
  --* Unsigned 20bit Big Endian in 4bytes format, LSB justified
  --* Special
  --* Signed 24bit Little Endian in 3bytes format
  --* Signed 24bit Big Endian in 3bytes format
  --* Unsigned 24bit Little Endian in 3bytes format
  --* Unsigned 24bit Big Endian in 3bytes format
  --* Signed 20bit Little Endian in 3bytes format
  --* Signed 20bit Big Endian in 3bytes format
  --* Unsigned 20bit Little Endian in 3bytes format
  --* Unsigned 20bit Big Endian in 3bytes format
  --* Signed 18bit Little Endian in 3bytes format
  --* Signed 18bit Big Endian in 3bytes format
  --* Unsigned 18bit Little Endian in 3bytes format
  --* Unsigned 18bit Big Endian in 3bytes format
  -- G.723 (ADPCM) 24 kbit/s, 8 samples in 3 bytes
  -- G.723 (ADPCM) 24 kbit/s, 1 sample in 1 byte
  -- G.723 (ADPCM) 40 kbit/s, 8 samples in 3 bytes
  -- G.723 (ADPCM) 40 kbit/s, 1 sample in 1 byte
  -- Direct Stream Digital (DSD) in 1-byte samples (x8)
  -- Direct Stream Digital (DSD) in 2-byte samples (x16)
  -- Direct Stream Digital (DSD) in 4-byte samples (x32)
  -- Direct Stream Digital (DSD) in 2-byte samples (x16)
  -- Direct Stream Digital (DSD) in 4-byte samples (x32)
  --* Signed 16 bit CPU endian
  --* Unsigned 16 bit CPU endian
  --* Signed 24 bit CPU endian
  --* Unsigned 24 bit CPU endian
  --* Signed 32 bit CPU endian
  --* Unsigned 32 bit CPU endian
  --* Float 32 bit CPU endian
  --* Float 64 bit CPU endian
  --* IEC-958 CPU Endian
  --* Signed 20bit in 4bytes format, LSB justified, CPU Endian
  --* Unsigned 20bit in 4bytes format, LSB justified, CPU Endian
  --* Signed 16 bit CPU endian
  --* Unsigned 16 bit CPU endian
  --* Signed 24 bit CPU endian
  --* Unsigned 24 bit CPU endian
  --* Signed 32 bit CPU endian
  --* Unsigned 32 bit CPU endian
  --* Float 32 bit CPU endian
  --* Float 64 bit CPU endian
  --* IEC-958 CPU Endian
  --* Signed 20bit in 4bytes format, LSB justified, CPU Endian
  --* Unsigned 20bit in 4bytes format, LSB justified, CPU Endian
   subtype snd_pcm_format_t is u_snd_pcm_format;  -- /usr/include/alsa/pcm.h:281

  --* PCM sample subformat
   subtype u_snd_pcm_subformat is unsigned;
   PCM_SUBFORMAT_STD : constant unsigned := 0;
   PCM_SUBFORMAT_LAST : constant unsigned := 0;  -- /usr/include/alsa/pcm.h:284

  --* Standard
   subtype snd_pcm_subformat_t is u_snd_pcm_subformat;  -- /usr/include/alsa/pcm.h:288

  --* PCM state
   subtype u_snd_pcm_state is unsigned;
   PCM_STATE_OPEN : constant unsigned := 0;
   PCM_STATE_SETUP : constant unsigned := 1;
   PCM_STATE_PREPARED : constant unsigned := 2;
   PCM_STATE_RUNNING : constant unsigned := 3;
   PCM_STATE_XRUN : constant unsigned := 4;
   PCM_STATE_DRAINING : constant unsigned := 5;
   PCM_STATE_PAUSED : constant unsigned := 6;
   PCM_STATE_SUSPENDED : constant unsigned := 7;
   PCM_STATE_DISCONNECTED : constant unsigned := 8;
   PCM_STATE_LAST : constant unsigned := 8;
   PCM_STATE_PRIVATE1 : constant unsigned := 1024;  -- /usr/include/alsa/pcm.h:291

  --* Open
  --* Setup installed
  --* Ready to start
  --* Running
  --* Stopped: underrun (playback) or overrun (capture) detected
  --* Draining: running (playback) or stopped (capture)
  --* Paused
  --* Hardware is suspended
  --* Hardware is disconnected
  --* Private - used internally in the library - do not use
   subtype snd_pcm_state_t is u_snd_pcm_state;  -- /usr/include/alsa/pcm.h:313

  --* PCM start mode
   subtype u_snd_pcm_start is unsigned;
   PCM_START_DATA : constant unsigned := 0;
   PCM_START_EXPLICIT : constant unsigned := 1;
   PCM_START_LAST : constant unsigned := 1;  -- /usr/include/alsa/pcm.h:316

  --* Automatic start on data read/write
  --* Explicit start
   subtype snd_pcm_start_t is u_snd_pcm_start;  -- /usr/include/alsa/pcm.h:322

  --* PCM xrun mode
   subtype u_snd_pcm_xrun is unsigned;
   PCM_XRUN_NONE : constant unsigned := 0;
   PCM_XRUN_STOP : constant unsigned := 1;
   PCM_XRUN_LAST : constant unsigned := 1;  -- /usr/include/alsa/pcm.h:325

  --* Xrun detection disabled
  --* Stop on xrun detection
   subtype snd_pcm_xrun_t is u_snd_pcm_xrun;  -- /usr/include/alsa/pcm.h:331

  --* PCM timestamp mode
   subtype u_snd_pcm_tstamp is unsigned;
   PCM_TSTAMP_NONE : constant unsigned := 0;
   PCM_TSTAMP_ENABLE : constant unsigned := 1;
   PCM_TSTAMP_MMAP : constant unsigned := 1;
   PCM_TSTAMP_LAST : constant unsigned := 1;  -- /usr/include/alsa/pcm.h:334

  --* No timestamp
  --* Update timestamp at every hardware position update
  --* Equivalent with #PCM_TSTAMP_ENABLE,
  --	 * just for compatibility with older versions
  --

   subtype snd_pcm_tstamp_t is u_snd_pcm_tstamp;  -- /usr/include/alsa/pcm.h:344

   subtype u_snd_pcm_tstamp_type is unsigned;
   PCM_TSTAMP_TYPE_GETTIMEOFDAY : constant unsigned := 0;
   PCM_TSTAMP_TYPE_MONOTONIC : constant unsigned := 1;
   PCM_TSTAMP_TYPE_MONOTONIC_RAW : constant unsigned := 2;
   PCM_TSTAMP_TYPE_LAST : constant unsigned := 2;  -- /usr/include/alsa/pcm.h:346

  --*< gettimeofday equivalent
  --*< posix_clock_monotonic equivalent
  --*< monotonic_raw (no NTP)
   subtype snd_pcm_tstamp_type_t is u_snd_pcm_tstamp_type;  -- /usr/include/alsa/pcm.h:351

  -- 5 of max 16 bits used
   type u_snd_pcm_audio_tstamp_config is record
      type_requested : Extensions.Unsigned_4;  -- /usr/include/alsa/pcm.h:355
      report_delay : Extensions.Unsigned_1;  -- /usr/include/alsa/pcm.h:356
   end record
   with Convention => C_Pass_By_Copy,
        Pack => True;  -- /usr/include/alsa/pcm.h:353

  -- add total delay to A/D or D/A
   subtype snd_pcm_audio_tstamp_config_t is u_snd_pcm_audio_tstamp_config;  -- /usr/include/alsa/pcm.h:357

  -- 6 of max 16 bits used for bit-fields
  -- for backwards compatibility
   type u_snd_pcm_audio_tstamp_report is record
      valid : Extensions.Unsigned_1;  -- /usr/include/alsa/pcm.h:363
      actual_type : Extensions.Unsigned_4;  -- /usr/include/alsa/pcm.h:366
      accuracy_report : Extensions.Unsigned_1;  -- /usr/include/alsa/pcm.h:369
      accuracy : aliased unsigned;  -- /usr/include/alsa/pcm.h:370
   end record
   with Convention => C_Pass_By_Copy,
        Pack => True;  -- /usr/include/alsa/pcm.h:359

  -- actual type if hardware could not support requested timestamp
  -- accuracy represented in ns units
  -- 0 if accuracy unknown, 1 if accuracy field is valid
  -- up to 4.29s, will be packed in separate field
   subtype snd_pcm_audio_tstamp_report_t is u_snd_pcm_audio_tstamp_report;  -- /usr/include/alsa/pcm.h:371

  --* Unsigned frames quantity
   subtype snd_pcm_uframes_t is unsigned_long;  -- /usr/include/alsa/pcm.h:374

  --* Signed frames quantity
   subtype snd_pcm_sframes_t is long;  -- /usr/include/alsa/pcm.h:376

  --* Non blocking mode (flag for open mode) \hideinitializer
  --* Async notification (flag for open mode) \hideinitializer
  --* In an abort state (internal, not allowed for open)
  --* Disable automatic (but not forced!) rate resamplinig
  --* Disable automatic (but not forced!) channel conversion
  --* Disable automatic (but not forced!) format conversion
  --* Disable soft volume control
  --* PCM handle
   type u_snd_pcm is null record;   -- incomplete struct

   subtype snd_pcm_t is u_snd_pcm;  -- /usr/include/alsa/pcm.h:394

  --* PCM type
   subtype u_snd_pcm_type is unsigned;
   PCM_TYPE_HW : constant unsigned := 0;
   PCM_TYPE_HOOKS : constant unsigned := 1;
   PCM_TYPE_MULTI : constant unsigned := 2;
   PCM_TYPE_FILE : constant unsigned := 3;
   PCM_TYPE_NULL : constant unsigned := 4;
   PCM_TYPE_SHM : constant unsigned := 5;
   PCM_TYPE_INET : constant unsigned := 6;
   PCM_TYPE_COPY : constant unsigned := 7;
   PCM_TYPE_LINEAR : constant unsigned := 8;
   PCM_TYPE_ALAW : constant unsigned := 9;
   PCM_TYPE_MULAW : constant unsigned := 10;
   PCM_TYPE_ADPCM : constant unsigned := 11;
   PCM_TYPE_RATE : constant unsigned := 12;
   PCM_TYPE_ROUTE : constant unsigned := 13;
   PCM_TYPE_PLUG : constant unsigned := 14;
   PCM_TYPE_SHARE : constant unsigned := 15;
   PCM_TYPE_METER : constant unsigned := 16;
   PCM_TYPE_MIX : constant unsigned := 17;
   PCM_TYPE_DROUTE : constant unsigned := 18;
   PCM_TYPE_LBSERVER : constant unsigned := 19;
   PCM_TYPE_LINEAR_FLOAT : constant unsigned := 20;
   PCM_TYPE_LADSPA : constant unsigned := 21;
   PCM_TYPE_DMIX : constant unsigned := 22;
   PCM_TYPE_JACK : constant unsigned := 23;
   PCM_TYPE_DSNOOP : constant unsigned := 24;
   PCM_TYPE_DSHARE : constant unsigned := 25;
   PCM_TYPE_IEC958 : constant unsigned := 26;
   PCM_TYPE_SOFTVOL : constant unsigned := 27;
   PCM_TYPE_IOPLUG : constant unsigned := 28;
   PCM_TYPE_EXTPLUG : constant unsigned := 29;
   PCM_TYPE_MMAP_EMUL : constant unsigned := 30;
   PCM_TYPE_LAST : constant unsigned := 30;  -- /usr/include/alsa/pcm.h:397

  --* Kernel level PCM
  --* Hooked PCM
  --* One or more linked PCM with exclusive access to selected
  --	    channels

  --* File writing plugin
  --* Null endpoint PCM
  --* Shared memory client PCM
  --* INET client PCM (not yet implemented)
  --* Copying plugin
  --* Linear format conversion PCM
  --* A-Law format conversion PCM
  --* Mu-Law format conversion PCM
  --* IMA-ADPCM format conversion PCM
  --* Rate conversion PCM
  --* Attenuated static route PCM
  --* Format adjusted PCM
  --* Sharing PCM
  --* Meter plugin
  --* Mixing PCM
  --* Attenuated dynamic route PCM (not yet implemented)
  --* Loopback server plugin (not yet implemented)
  --* Linear Integer <-> Linear Float format conversion PCM
  --* LADSPA integration plugin
  --* Direct Mixing plugin
  --* Jack Audio Connection Kit plugin
  --* Direct Snooping plugin
  --* Direct Sharing plugin
  --* IEC958 subframe plugin
  --* Soft volume plugin
  --* External I/O plugin
  --* External filter plugin
  --* Mmap-emulation plugin
  --* PCM type
   subtype snd_pcm_type_t is u_snd_pcm_type;  -- /usr/include/alsa/pcm.h:465

  --* PCM area specification
  --* base address of channel samples
   type u_snd_pcm_channel_area is record
      addr : System.Address;  -- /usr/include/alsa/pcm.h:470
      first : aliased unsigned;  -- /usr/include/alsa/pcm.h:472
      step : aliased unsigned;  -- /usr/include/alsa/pcm.h:474
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/alsa/pcm.h:468

  --* offset to first sample in bits
  --* samples distance in bits
   subtype snd_pcm_channel_area_t is u_snd_pcm_channel_area;  -- /usr/include/alsa/pcm.h:475

  --* PCM synchronization ID
  --* 8-bit ID
   type u_snd_pcm_sync_id_id_array is array (0 .. 15) of aliased unsigned_char;
   type u_snd_pcm_sync_id_id16_array is array (0 .. 7) of aliased unsigned_short;
   type u_snd_pcm_sync_id_id32_array is array (0 .. 3) of aliased unsigned;
   type u_snd_pcm_sync_id (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            id : aliased u_snd_pcm_sync_id_id_array;  -- /usr/include/alsa/pcm.h:480
         when 1 =>
            id16 : aliased u_snd_pcm_sync_id_id16_array;  -- /usr/include/alsa/pcm.h:482
         when others =>
            id32 : aliased u_snd_pcm_sync_id_id32_array;  -- /usr/include/alsa/pcm.h:484
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /usr/include/alsa/pcm.h:478

  --* 16-bit ID
  --* 32-bit ID
   subtype snd_pcm_sync_id_t is u_snd_pcm_sync_id;  -- /usr/include/alsa/pcm.h:485

  --* #PCM_TYPE_METER scope handle
   type u_snd_pcm_scope is null record;   -- incomplete struct

   subtype snd_pcm_scope_t is u_snd_pcm_scope;  -- /usr/include/alsa/pcm.h:488

   function snd_pcm_open
     (pcm : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      stream : snd_pcm_stream_t;
      mode : int) return int  -- /usr/include/alsa/pcm.h:490
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_open";

   function snd_pcm_open_lconf
     (pcm : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      stream : snd_pcm_stream_t;
      mode : int;
      lconf : access int) return int  -- /usr/include/alsa/pcm.h:492
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_open_lconf";

   function snd_pcm_open_fallback
     (pcm : System.Address;
      root : access int;
      name : Interfaces.C.Strings.chars_ptr;
      orig_name : Interfaces.C.Strings.chars_ptr;
      stream : snd_pcm_stream_t;
      mode : int) return int  -- /usr/include/alsa/pcm.h:495
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_open_fallback";

   function snd_pcm_close (pcm : access snd_pcm_t) return int  -- /usr/include/alsa/pcm.h:499
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_close";

   function snd_pcm_name (pcm : access snd_pcm_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:500
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_name";

   function snd_pcm_type (pcm : access snd_pcm_t) return snd_pcm_type_t  -- /usr/include/alsa/pcm.h:501
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_type";

   function snd_pcm_stream (pcm : access snd_pcm_t) return snd_pcm_stream_t  -- /usr/include/alsa/pcm.h:502
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_stream";

   function snd_pcm_poll_descriptors_count (pcm : access snd_pcm_t) return int  -- /usr/include/alsa/pcm.h:503
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_poll_descriptors_count";

   type pollfd;
   function snd_pcm_poll_descriptors
     (pcm : access snd_pcm_t;
      pfds : access pollfd;
      space : unsigned) return int  -- /usr/include/alsa/pcm.h:504
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_poll_descriptors";

   type pollfd is null record;   -- incomplete struct

   function snd_pcm_poll_descriptors_revents
     (pcm : access snd_pcm_t;
      pfds : access pollfd;
      nfds : unsigned;
      revents : access unsigned_short) return int  -- /usr/include/alsa/pcm.h:505
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_poll_descriptors_revents";

   function snd_pcm_nonblock (pcm : access snd_pcm_t; nonblock : int) return int  -- /usr/include/alsa/pcm.h:506
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_nonblock";

   function snd_pcm_abort (pcm : access snd_pcm_t) return int  -- /usr/include/alsa/pcm.h:507
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_abort";

   snd_async_add_pcm_handler : aliased int  -- /usr/include/alsa/pcm.h:508
   with Import => True,
        Convention => C,
        External_Name => "snd_async_add_pcm_handler";

   snd_async_handler_get_pcm : access snd_pcm_t  -- /usr/include/alsa/pcm.h:510
   with Import => True,
        Convention => C,
        External_Name => "snd_async_handler_get_pcm";

   function snd_pcm_info (pcm : access snd_pcm_t; info : access snd_pcm_info_t) return int  -- /usr/include/alsa/pcm.h:511
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info";

   function snd_pcm_hw_params_current (pcm : access snd_pcm_t; params : access snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:512
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_current";

   function snd_pcm_hw_params (pcm : access snd_pcm_t; params : access snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:513
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params";

   function snd_pcm_hw_free (pcm : access snd_pcm_t) return int  -- /usr/include/alsa/pcm.h:514
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_free";

   function snd_pcm_sw_params_current (pcm : access snd_pcm_t; params : access snd_pcm_sw_params_t) return int  -- /usr/include/alsa/pcm.h:515
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_current";

   function snd_pcm_sw_params (pcm : access snd_pcm_t; params : access snd_pcm_sw_params_t) return int  -- /usr/include/alsa/pcm.h:516
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params";

   function snd_pcm_prepare (pcm : access snd_pcm_t) return int  -- /usr/include/alsa/pcm.h:517
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_prepare";

   function snd_pcm_reset (pcm : access snd_pcm_t) return int  -- /usr/include/alsa/pcm.h:518
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_reset";

   function snd_pcm_status (pcm : access snd_pcm_t; status : access snd_pcm_status_t) return int  -- /usr/include/alsa/pcm.h:519
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_status";

   function snd_pcm_start (pcm : access snd_pcm_t) return int  -- /usr/include/alsa/pcm.h:520
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_start";

   function snd_pcm_drop (pcm : access snd_pcm_t) return int  -- /usr/include/alsa/pcm.h:521
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_drop";

   function snd_pcm_drain (pcm : access snd_pcm_t) return int  -- /usr/include/alsa/pcm.h:522
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_drain";

   function snd_pcm_pause (pcm : access snd_pcm_t; enable : int) return int  -- /usr/include/alsa/pcm.h:523
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_pause";

   function snd_pcm_state (pcm : access snd_pcm_t) return snd_pcm_state_t  -- /usr/include/alsa/pcm.h:524
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_state";

   function snd_pcm_hwsync (pcm : access snd_pcm_t) return int  -- /usr/include/alsa/pcm.h:525
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hwsync";

   function snd_pcm_delay (pcm : access snd_pcm_t; delayp : access snd_pcm_sframes_t) return int  -- /usr/include/alsa/pcm.h:526
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_delay";

   function snd_pcm_resume (pcm : access snd_pcm_t) return int  -- /usr/include/alsa/pcm.h:527
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_resume";

   function snd_pcm_htimestamp
     (pcm : access snd_pcm_t;
      avail : access snd_pcm_uframes_t;
      tstamp : access int) return int  -- /usr/include/alsa/pcm.h:528
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_htimestamp";

   function snd_pcm_avail (pcm : access snd_pcm_t) return snd_pcm_sframes_t  -- /usr/include/alsa/pcm.h:529
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_avail";

   function snd_pcm_avail_update (pcm : access snd_pcm_t) return snd_pcm_sframes_t  -- /usr/include/alsa/pcm.h:530
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_avail_update";

   function snd_pcm_avail_delay
     (pcm : access snd_pcm_t;
      availp : access snd_pcm_sframes_t;
      delayp : access snd_pcm_sframes_t) return int  -- /usr/include/alsa/pcm.h:531
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_avail_delay";

   function snd_pcm_rewindable (pcm : access snd_pcm_t) return snd_pcm_sframes_t  -- /usr/include/alsa/pcm.h:532
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_rewindable";

   function snd_pcm_rewind (pcm : access snd_pcm_t; frames : snd_pcm_uframes_t) return snd_pcm_sframes_t  -- /usr/include/alsa/pcm.h:533
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_rewind";

   function snd_pcm_forwardable (pcm : access snd_pcm_t) return snd_pcm_sframes_t  -- /usr/include/alsa/pcm.h:534
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_forwardable";

   function snd_pcm_forward (pcm : access snd_pcm_t; frames : snd_pcm_uframes_t) return snd_pcm_sframes_t  -- /usr/include/alsa/pcm.h:535
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_forward";

   function snd_pcm_writei
     (pcm : access snd_pcm_t;
      buffer : System.Address;
      size : snd_pcm_uframes_t) return snd_pcm_sframes_t  -- /usr/include/alsa/pcm.h:536
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_writei";

   function snd_pcm_readi
     (pcm : access snd_pcm_t;
      buffer : System.Address;
      size : snd_pcm_uframes_t) return snd_pcm_sframes_t  -- /usr/include/alsa/pcm.h:537
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_readi";

   function snd_pcm_writen
     (pcm : access snd_pcm_t;
      bufs : System.Address;
      size : snd_pcm_uframes_t) return snd_pcm_sframes_t  -- /usr/include/alsa/pcm.h:538
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_writen";

   function snd_pcm_readn
     (pcm : access snd_pcm_t;
      bufs : System.Address;
      size : snd_pcm_uframes_t) return snd_pcm_sframes_t  -- /usr/include/alsa/pcm.h:539
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_readn";

   function snd_pcm_wait (pcm : access snd_pcm_t; timeout : int) return int  -- /usr/include/alsa/pcm.h:540
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_wait";

   function snd_pcm_link (pcm1 : access snd_pcm_t; pcm2 : access snd_pcm_t) return int  -- /usr/include/alsa/pcm.h:542
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_link";

   function snd_pcm_unlink (pcm : access snd_pcm_t) return int  -- /usr/include/alsa/pcm.h:543
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_unlink";

  --* channel mapping API version number
  --* channel map list type
   subtype snd_pcm_chmap_type is unsigned;
   CHMAP_TYPE_NONE : constant unsigned := 0;
   CHMAP_TYPE_FIXED : constant unsigned := 1;
   CHMAP_TYPE_VAR : constant unsigned := 2;
   CHMAP_TYPE_PAIRED : constant unsigned := 3;
   CHMAP_TYPE_LAST : constant unsigned := 3;  -- /usr/include/alsa/pcm.h:549

  --*< unspecified channel position
  --*< fixed channel position
  --*< freely swappable channel position
  --*< pair-wise swappable channel position
  --*< last entry
  --* channel positions
   subtype snd_pcm_chmap_position is unsigned;
   CHMAP_UNKNOWN : constant unsigned := 0;
   CHMAP_NA : constant unsigned := 1;
   CHMAP_MONO : constant unsigned := 2;
   CHMAP_FL : constant unsigned := 3;
   CHMAP_FR : constant unsigned := 4;
   CHMAP_RL : constant unsigned := 5;
   CHMAP_RR : constant unsigned := 6;
   CHMAP_FC : constant unsigned := 7;
   CHMAP_LFE : constant unsigned := 8;
   CHMAP_SL : constant unsigned := 9;
   CHMAP_SR : constant unsigned := 10;
   CHMAP_RC : constant unsigned := 11;
   CHMAP_FLC : constant unsigned := 12;
   CHMAP_FRC : constant unsigned := 13;
   CHMAP_RLC : constant unsigned := 14;
   CHMAP_RRC : constant unsigned := 15;
   CHMAP_FLW : constant unsigned := 16;
   CHMAP_FRW : constant unsigned := 17;
   CHMAP_FLH : constant unsigned := 18;
   CHMAP_FCH : constant unsigned := 19;
   CHMAP_FRH : constant unsigned := 20;
   CHMAP_TC : constant unsigned := 21;
   CHMAP_TFL : constant unsigned := 22;
   CHMAP_TFR : constant unsigned := 23;
   CHMAP_TFC : constant unsigned := 24;
   CHMAP_TRL : constant unsigned := 25;
   CHMAP_TRR : constant unsigned := 26;
   CHMAP_TRC : constant unsigned := 27;
   CHMAP_TFLC : constant unsigned := 28;
   CHMAP_TFRC : constant unsigned := 29;
   CHMAP_TSL : constant unsigned := 30;
   CHMAP_TSR : constant unsigned := 31;
   CHMAP_LLFE : constant unsigned := 32;
   CHMAP_RLFE : constant unsigned := 33;
   CHMAP_BC : constant unsigned := 34;
   CHMAP_BLC : constant unsigned := 35;
   CHMAP_BRC : constant unsigned := 36;
   CHMAP_LAST : constant unsigned := 36;  -- /usr/include/alsa/pcm.h:558

  --*< unspecified
  --*< N/A, silent
  --*< mono stream
  --*< front left
  --*< front right
  --*< rear left
  --*< rear right
  --*< front center
  --*< LFE
  --*< side left
  --*< side right
  --*< rear center
  --*< front left center
  --*< front right center
  --*< rear left center
  --*< rear right center
  --*< front left wide
  --*< front right wide
  --*< front left high
  --*< front center high
  --*< front right high
  --*< top center
  --*< top front left
  --*< top front right
  --*< top front center
  --*< top rear left
  --*< top rear right
  --*< top rear center
  --*< top front left center
  --*< top front right center
  --*< top side left
  --*< top side right
  --*< left LFE
  --*< right LFE
  --*< bottom center
  --*< bottom left center
  --*< bottom right center
  --* bitmask for channel position
  --* bit flag indicating the channel is phase inverted
  --* bit flag indicating the non-standard channel value
  --* the channel map header
  --*< number of channels
   type snd_pcm_chmap_pos_array is array (0 .. -1) of aliased unsigned;
   type snd_pcm_chmap is record
      channels : aliased unsigned;  -- /usr/include/alsa/pcm.h:609
      pos : aliased snd_pcm_chmap_pos_array;  -- /usr/include/alsa/pcm.h:610
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/alsa/pcm.h:608

  --*< channel position array
   subtype snd_pcm_chmap_t is snd_pcm_chmap;  -- /usr/include/alsa/pcm.h:611

  --* the header of array items returned from snd_pcm_query_chmaps()
  --*< channel map type
   type snd_pcm_chmap_query is record
      c_type : aliased snd_pcm_chmap_type;  -- /usr/include/alsa/pcm.h:615
      map : aliased snd_pcm_chmap_t;  -- /usr/include/alsa/pcm.h:616
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/alsa/pcm.h:614

  --*< available channel map
   subtype snd_pcm_chmap_query_t is snd_pcm_chmap_query;  -- /usr/include/alsa/pcm.h:617

   function snd_pcm_query_chmaps (pcm : access snd_pcm_t) return System.Address  -- /usr/include/alsa/pcm.h:620
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_query_chmaps";

   function snd_pcm_query_chmaps_from_hw
     (card : int;
      dev : int;
      subdev : int;
      stream : snd_pcm_stream_t) return System.Address  -- /usr/include/alsa/pcm.h:621
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_query_chmaps_from_hw";

   procedure snd_pcm_free_chmaps (maps : System.Address)  -- /usr/include/alsa/pcm.h:624
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_free_chmaps";

   function snd_pcm_get_chmap (pcm : access snd_pcm_t) return access snd_pcm_chmap_t  -- /usr/include/alsa/pcm.h:625
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_get_chmap";

   function snd_pcm_set_chmap (pcm : access snd_pcm_t; map : access constant snd_pcm_chmap_t) return int  -- /usr/include/alsa/pcm.h:626
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_set_chmap";

   function snd_pcm_chmap_type_name (val : snd_pcm_chmap_type) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:628
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_chmap_type_name";

   function snd_pcm_chmap_name (val : snd_pcm_chmap_position) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:629
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_chmap_name";

   function snd_pcm_chmap_long_name (val : snd_pcm_chmap_position) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:630
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_chmap_long_name";

   function snd_pcm_chmap_print
     (map : access constant snd_pcm_chmap_t;
      maxlen : int;
      buf : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/alsa/pcm.h:631
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_chmap_print";

   function snd_pcm_chmap_from_string (str : Interfaces.C.Strings.chars_ptr) return unsigned  -- /usr/include/alsa/pcm.h:632
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_chmap_from_string";

   function snd_pcm_chmap_parse_string (str : Interfaces.C.Strings.chars_ptr) return access snd_pcm_chmap_t  -- /usr/include/alsa/pcm.h:633
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_chmap_parse_string";

  --int snd_pcm_mixer_element(snd_pcm_t *pcm, snd_mixer_t *mixer, snd_mixer_elem_t **elem);
  -- * application helpers - these functions are implemented on top
  -- * of the basic API
  --

   function snd_pcm_recover
     (pcm : access snd_pcm_t;
      err : int;
      silent : int) return int  -- /usr/include/alsa/pcm.h:642
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_recover";

   function snd_pcm_set_params
     (pcm : access snd_pcm_t;
      format : snd_pcm_format_t;
      c_access : snd_pcm_access_t;
      channels : unsigned;
      rate : unsigned;
      soft_resample : int;
      latency : unsigned) return int  -- /usr/include/alsa/pcm.h:643
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_set_params";

   function snd_pcm_get_params
     (pcm : access snd_pcm_t;
      buffer_size : access snd_pcm_uframes_t;
      period_size : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:650
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_get_params";

  --* \}
  --*
  -- * \defgroup PCM_Info Stream Information
  -- * \ingroup PCM
  -- * See the \ref pcm page for more details.
  -- * \{
  --

  --* \hideinitializer
  -- * \brief allocate an invalid #snd_pcm_info_t using standard alloca
  -- * \param ptr returned pointer
  --

   function snd_pcm_info_malloc (ptr : System.Address) return int  -- /usr/include/alsa/pcm.h:669
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info_malloc";

   procedure snd_pcm_info_free (obj : access snd_pcm_info_t)  -- /usr/include/alsa/pcm.h:670
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info_free";

   procedure snd_pcm_info_copy (dst : access snd_pcm_info_t; src : access constant snd_pcm_info_t)  -- /usr/include/alsa/pcm.h:671
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info_copy";

   function snd_pcm_info_get_device (obj : access constant snd_pcm_info_t) return unsigned  -- /usr/include/alsa/pcm.h:672
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info_get_device";

   function snd_pcm_info_get_subdevice (obj : access constant snd_pcm_info_t) return unsigned  -- /usr/include/alsa/pcm.h:673
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info_get_subdevice";

   function snd_pcm_info_get_stream (obj : access constant snd_pcm_info_t) return snd_pcm_stream_t  -- /usr/include/alsa/pcm.h:674
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info_get_stream";

   function snd_pcm_info_get_card (obj : access constant snd_pcm_info_t) return int  -- /usr/include/alsa/pcm.h:675
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info_get_card";

   function snd_pcm_info_get_id (obj : access constant snd_pcm_info_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:676
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info_get_id";

   function snd_pcm_info_get_name (obj : access constant snd_pcm_info_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:677
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info_get_name";

   function snd_pcm_info_get_subdevice_name (obj : access constant snd_pcm_info_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:678
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info_get_subdevice_name";

   function snd_pcm_info_get_class (obj : access constant snd_pcm_info_t) return snd_pcm_class_t  -- /usr/include/alsa/pcm.h:679
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info_get_class";

   function snd_pcm_info_get_subclass (obj : access constant snd_pcm_info_t) return snd_pcm_subclass_t  -- /usr/include/alsa/pcm.h:680
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info_get_subclass";

   function snd_pcm_info_get_subdevices_count (obj : access constant snd_pcm_info_t) return unsigned  -- /usr/include/alsa/pcm.h:681
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info_get_subdevices_count";

   function snd_pcm_info_get_subdevices_avail (obj : access constant snd_pcm_info_t) return unsigned  -- /usr/include/alsa/pcm.h:682
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info_get_subdevices_avail";

   function snd_pcm_info_get_sync (obj : access constant snd_pcm_info_t) return snd_pcm_sync_id_t  -- /usr/include/alsa/pcm.h:683
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info_get_sync";

   procedure snd_pcm_info_set_device (obj : access snd_pcm_info_t; val : unsigned)  -- /usr/include/alsa/pcm.h:684
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info_set_device";

   procedure snd_pcm_info_set_subdevice (obj : access snd_pcm_info_t; val : unsigned)  -- /usr/include/alsa/pcm.h:685
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info_set_subdevice";

   procedure snd_pcm_info_set_stream (obj : access snd_pcm_info_t; val : snd_pcm_stream_t)  -- /usr/include/alsa/pcm.h:686
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_info_set_stream";

  --* \}
  --*
  -- * \defgroup PCM_HW_Params Hardware Parameters
  -- * \ingroup PCM
  -- * See the \ref pcm page for more details.
  -- * \{
  --

   function snd_pcm_hw_params_any (pcm : access snd_pcm_t; params : access snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:697
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_any";

   function snd_pcm_hw_params_can_mmap_sample_resolution (params : access constant snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:699
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_can_mmap_sample_resolution";

   function snd_pcm_hw_params_is_double (params : access constant snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:700
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_is_double";

   function snd_pcm_hw_params_is_batch (params : access constant snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:701
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_is_batch";

   function snd_pcm_hw_params_is_block_transfer (params : access constant snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:702
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_is_block_transfer";

   function snd_pcm_hw_params_is_monotonic (params : access constant snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:703
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_is_monotonic";

   function snd_pcm_hw_params_can_overrange (params : access constant snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:704
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_can_overrange";

   function snd_pcm_hw_params_can_pause (params : access constant snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:705
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_can_pause";

   function snd_pcm_hw_params_can_resume (params : access constant snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:706
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_can_resume";

   function snd_pcm_hw_params_is_half_duplex (params : access constant snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:707
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_is_half_duplex";

   function snd_pcm_hw_params_is_joint_duplex (params : access constant snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:708
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_is_joint_duplex";

   function snd_pcm_hw_params_can_sync_start (params : access constant snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:709
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_can_sync_start";

   function snd_pcm_hw_params_can_disable_period_wakeup (params : access constant snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:710
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_can_disable_period_wakeup";

  -- deprecated, use audio_ts_type
   function snd_pcm_hw_params_supports_audio_wallclock_ts (params : access constant snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:711
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_supports_audio_wallclock_ts";

   function snd_pcm_hw_params_supports_audio_ts_type (params : access constant snd_pcm_hw_params_t; c_type : int) return int  -- /usr/include/alsa/pcm.h:712
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_supports_audio_ts_type";

   function snd_pcm_hw_params_get_rate_numden
     (params : access constant snd_pcm_hw_params_t;
      rate_num : access unsigned;
      rate_den : access unsigned) return int  -- /usr/include/alsa/pcm.h:713
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_rate_numden";

   function snd_pcm_hw_params_get_sbits (params : access constant snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:716
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_sbits";

   function snd_pcm_hw_params_get_fifo_size (params : access constant snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:717
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_fifo_size";

  -- choices need to be sorted on ascending badness
  --* \hideinitializer
  -- * \brief allocate an invalid #snd_pcm_hw_params_t using standard alloca
  -- * \param ptr returned pointer
  --

   function snd_pcm_hw_params_malloc (ptr : System.Address) return int  -- /usr/include/alsa/pcm.h:751
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_malloc";

   procedure snd_pcm_hw_params_free (obj : access snd_pcm_hw_params_t)  -- /usr/include/alsa/pcm.h:752
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_free";

   procedure snd_pcm_hw_params_copy (dst : access snd_pcm_hw_params_t; src : access constant snd_pcm_hw_params_t)  -- /usr/include/alsa/pcm.h:753
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_copy";

   function snd_pcm_hw_params_get_access (params : access constant snd_pcm_hw_params_t; u_access : access snd_pcm_access_t) return int  -- /usr/include/alsa/pcm.h:757
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_access";

   function snd_pcm_hw_params_test_access
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      u_access : snd_pcm_access_t) return int  -- /usr/include/alsa/pcm.h:758
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_test_access";

   function snd_pcm_hw_params_set_access
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      u_access : snd_pcm_access_t) return int  -- /usr/include/alsa/pcm.h:759
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_access";

   function snd_pcm_hw_params_set_access_first
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      u_access : access snd_pcm_access_t) return int  -- /usr/include/alsa/pcm.h:760
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_access_first";

   function snd_pcm_hw_params_set_access_last
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      u_access : access snd_pcm_access_t) return int  -- /usr/include/alsa/pcm.h:761
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_access_last";

   function snd_pcm_hw_params_set_access_mask
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      mask : access snd_pcm_access_mask_t) return int  -- /usr/include/alsa/pcm.h:762
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_access_mask";

   function snd_pcm_hw_params_get_access_mask (params : access snd_pcm_hw_params_t; mask : access snd_pcm_access_mask_t) return int  -- /usr/include/alsa/pcm.h:763
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_access_mask";

   function snd_pcm_hw_params_get_format (params : access constant snd_pcm_hw_params_t; val : access snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:765
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_format";

   function snd_pcm_hw_params_test_format
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:766
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_test_format";

   function snd_pcm_hw_params_set_format
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:767
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_format";

   function snd_pcm_hw_params_set_format_first
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      format : access snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:768
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_format_first";

   function snd_pcm_hw_params_set_format_last
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      format : access snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:769
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_format_last";

   function snd_pcm_hw_params_set_format_mask
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      mask : access snd_pcm_format_mask_t) return int  -- /usr/include/alsa/pcm.h:770
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_format_mask";

   procedure snd_pcm_hw_params_get_format_mask (params : access snd_pcm_hw_params_t; mask : access snd_pcm_format_mask_t)  -- /usr/include/alsa/pcm.h:771
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_format_mask";

   function snd_pcm_hw_params_get_subformat (params : access constant snd_pcm_hw_params_t; subformat : access snd_pcm_subformat_t) return int  -- /usr/include/alsa/pcm.h:773
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_subformat";

   function snd_pcm_hw_params_test_subformat
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      subformat : snd_pcm_subformat_t) return int  -- /usr/include/alsa/pcm.h:774
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_test_subformat";

   function snd_pcm_hw_params_set_subformat
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      subformat : snd_pcm_subformat_t) return int  -- /usr/include/alsa/pcm.h:775
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_subformat";

   function snd_pcm_hw_params_set_subformat_first
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      subformat : access snd_pcm_subformat_t) return int  -- /usr/include/alsa/pcm.h:776
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_subformat_first";

   function snd_pcm_hw_params_set_subformat_last
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      subformat : access snd_pcm_subformat_t) return int  -- /usr/include/alsa/pcm.h:777
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_subformat_last";

   function snd_pcm_hw_params_set_subformat_mask
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      mask : access snd_pcm_subformat_mask_t) return int  -- /usr/include/alsa/pcm.h:778
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_subformat_mask";

   procedure snd_pcm_hw_params_get_subformat_mask (params : access snd_pcm_hw_params_t; mask : access snd_pcm_subformat_mask_t)  -- /usr/include/alsa/pcm.h:779
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_subformat_mask";

   function snd_pcm_hw_params_get_channels (params : access constant snd_pcm_hw_params_t; val : access unsigned) return int  -- /usr/include/alsa/pcm.h:781
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_channels";

   function snd_pcm_hw_params_get_channels_min (params : access constant snd_pcm_hw_params_t; val : access unsigned) return int  -- /usr/include/alsa/pcm.h:782
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_channels_min";

   function snd_pcm_hw_params_get_channels_max (params : access constant snd_pcm_hw_params_t; val : access unsigned) return int  -- /usr/include/alsa/pcm.h:783
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_channels_max";

   function snd_pcm_hw_params_test_channels
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : unsigned) return int  -- /usr/include/alsa/pcm.h:784
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_test_channels";

   function snd_pcm_hw_params_set_channels
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : unsigned) return int  -- /usr/include/alsa/pcm.h:785
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_channels";

   function snd_pcm_hw_params_set_channels_min
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned) return int  -- /usr/include/alsa/pcm.h:786
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_channels_min";

   function snd_pcm_hw_params_set_channels_max
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned) return int  -- /usr/include/alsa/pcm.h:787
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_channels_max";

   function snd_pcm_hw_params_set_channels_minmax
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      min : access unsigned;
      max : access unsigned) return int  -- /usr/include/alsa/pcm.h:788
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_channels_minmax";

   function snd_pcm_hw_params_set_channels_near
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned) return int  -- /usr/include/alsa/pcm.h:789
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_channels_near";

   function snd_pcm_hw_params_set_channels_first
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned) return int  -- /usr/include/alsa/pcm.h:790
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_channels_first";

   function snd_pcm_hw_params_set_channels_last
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned) return int  -- /usr/include/alsa/pcm.h:791
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_channels_last";

   function snd_pcm_hw_params_get_rate
     (params : access constant snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:793
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_rate";

   function snd_pcm_hw_params_get_rate_min
     (params : access constant snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:794
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_rate_min";

   function snd_pcm_hw_params_get_rate_max
     (params : access constant snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:795
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_rate_max";

   function snd_pcm_hw_params_test_rate
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : unsigned;
      dir : int) return int  -- /usr/include/alsa/pcm.h:796
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_test_rate";

   function snd_pcm_hw_params_set_rate
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : unsigned;
      dir : int) return int  -- /usr/include/alsa/pcm.h:797
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_rate";

   function snd_pcm_hw_params_set_rate_min
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:798
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_rate_min";

   function snd_pcm_hw_params_set_rate_max
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:799
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_rate_max";

   function snd_pcm_hw_params_set_rate_minmax
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      min : access unsigned;
      mindir : access int;
      max : access unsigned;
      maxdir : access int) return int  -- /usr/include/alsa/pcm.h:800
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_rate_minmax";

   function snd_pcm_hw_params_set_rate_near
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:801
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_rate_near";

   function snd_pcm_hw_params_set_rate_first
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:802
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_rate_first";

   function snd_pcm_hw_params_set_rate_last
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:803
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_rate_last";

   function snd_pcm_hw_params_set_rate_resample
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : unsigned) return int  -- /usr/include/alsa/pcm.h:804
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_rate_resample";

   function snd_pcm_hw_params_get_rate_resample
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned) return int  -- /usr/include/alsa/pcm.h:805
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_rate_resample";

   function snd_pcm_hw_params_set_export_buffer
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : unsigned) return int  -- /usr/include/alsa/pcm.h:806
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_export_buffer";

   function snd_pcm_hw_params_get_export_buffer
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned) return int  -- /usr/include/alsa/pcm.h:807
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_export_buffer";

   function snd_pcm_hw_params_set_period_wakeup
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : unsigned) return int  -- /usr/include/alsa/pcm.h:808
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_period_wakeup";

   function snd_pcm_hw_params_get_period_wakeup
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned) return int  -- /usr/include/alsa/pcm.h:809
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_period_wakeup";

   function snd_pcm_hw_params_get_period_time
     (params : access constant snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:811
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_period_time";

   function snd_pcm_hw_params_get_period_time_min
     (params : access constant snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:812
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_period_time_min";

   function snd_pcm_hw_params_get_period_time_max
     (params : access constant snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:813
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_period_time_max";

   function snd_pcm_hw_params_test_period_time
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : unsigned;
      dir : int) return int  -- /usr/include/alsa/pcm.h:814
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_test_period_time";

   function snd_pcm_hw_params_set_period_time
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : unsigned;
      dir : int) return int  -- /usr/include/alsa/pcm.h:815
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_period_time";

   function snd_pcm_hw_params_set_period_time_min
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:816
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_period_time_min";

   function snd_pcm_hw_params_set_period_time_max
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:817
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_period_time_max";

   function snd_pcm_hw_params_set_period_time_minmax
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      min : access unsigned;
      mindir : access int;
      max : access unsigned;
      maxdir : access int) return int  -- /usr/include/alsa/pcm.h:818
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_period_time_minmax";

   function snd_pcm_hw_params_set_period_time_near
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:819
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_period_time_near";

   function snd_pcm_hw_params_set_period_time_first
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:820
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_period_time_first";

   function snd_pcm_hw_params_set_period_time_last
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:821
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_period_time_last";

   function snd_pcm_hw_params_get_period_size
     (params : access constant snd_pcm_hw_params_t;
      frames : access snd_pcm_uframes_t;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:823
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_period_size";

   function snd_pcm_hw_params_get_period_size_min
     (params : access constant snd_pcm_hw_params_t;
      frames : access snd_pcm_uframes_t;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:824
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_period_size_min";

   function snd_pcm_hw_params_get_period_size_max
     (params : access constant snd_pcm_hw_params_t;
      frames : access snd_pcm_uframes_t;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:825
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_period_size_max";

   function snd_pcm_hw_params_test_period_size
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : snd_pcm_uframes_t;
      dir : int) return int  -- /usr/include/alsa/pcm.h:826
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_test_period_size";

   function snd_pcm_hw_params_set_period_size
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : snd_pcm_uframes_t;
      dir : int) return int  -- /usr/include/alsa/pcm.h:827
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_period_size";

   function snd_pcm_hw_params_set_period_size_min
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access snd_pcm_uframes_t;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:828
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_period_size_min";

   function snd_pcm_hw_params_set_period_size_max
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access snd_pcm_uframes_t;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:829
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_period_size_max";

   function snd_pcm_hw_params_set_period_size_minmax
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      min : access snd_pcm_uframes_t;
      mindir : access int;
      max : access snd_pcm_uframes_t;
      maxdir : access int) return int  -- /usr/include/alsa/pcm.h:830
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_period_size_minmax";

   function snd_pcm_hw_params_set_period_size_near
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access snd_pcm_uframes_t;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:831
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_period_size_near";

   function snd_pcm_hw_params_set_period_size_first
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access snd_pcm_uframes_t;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:832
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_period_size_first";

   function snd_pcm_hw_params_set_period_size_last
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access snd_pcm_uframes_t;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:833
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_period_size_last";

   function snd_pcm_hw_params_set_period_size_integer (pcm : access snd_pcm_t; params : access snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:834
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_period_size_integer";

   function snd_pcm_hw_params_get_periods
     (params : access constant snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:836
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_periods";

   function snd_pcm_hw_params_get_periods_min
     (params : access constant snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:837
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_periods_min";

   function snd_pcm_hw_params_get_periods_max
     (params : access constant snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:838
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_periods_max";

   function snd_pcm_hw_params_test_periods
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : unsigned;
      dir : int) return int  -- /usr/include/alsa/pcm.h:839
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_test_periods";

   function snd_pcm_hw_params_set_periods
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : unsigned;
      dir : int) return int  -- /usr/include/alsa/pcm.h:840
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_periods";

   function snd_pcm_hw_params_set_periods_min
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:841
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_periods_min";

   function snd_pcm_hw_params_set_periods_max
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:842
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_periods_max";

   function snd_pcm_hw_params_set_periods_minmax
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      min : access unsigned;
      mindir : access int;
      max : access unsigned;
      maxdir : access int) return int  -- /usr/include/alsa/pcm.h:843
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_periods_minmax";

   function snd_pcm_hw_params_set_periods_near
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:844
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_periods_near";

   function snd_pcm_hw_params_set_periods_first
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:845
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_periods_first";

   function snd_pcm_hw_params_set_periods_last
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:846
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_periods_last";

   function snd_pcm_hw_params_set_periods_integer (pcm : access snd_pcm_t; params : access snd_pcm_hw_params_t) return int  -- /usr/include/alsa/pcm.h:847
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_periods_integer";

   function snd_pcm_hw_params_get_buffer_time
     (params : access constant snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:849
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_buffer_time";

   function snd_pcm_hw_params_get_buffer_time_min
     (params : access constant snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:850
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_buffer_time_min";

   function snd_pcm_hw_params_get_buffer_time_max
     (params : access constant snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:851
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_buffer_time_max";

   function snd_pcm_hw_params_test_buffer_time
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : unsigned;
      dir : int) return int  -- /usr/include/alsa/pcm.h:852
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_test_buffer_time";

   function snd_pcm_hw_params_set_buffer_time
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : unsigned;
      dir : int) return int  -- /usr/include/alsa/pcm.h:853
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_buffer_time";

   function snd_pcm_hw_params_set_buffer_time_min
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:854
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_buffer_time_min";

   function snd_pcm_hw_params_set_buffer_time_max
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:855
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_buffer_time_max";

   function snd_pcm_hw_params_set_buffer_time_minmax
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      min : access unsigned;
      mindir : access int;
      max : access unsigned;
      maxdir : access int) return int  -- /usr/include/alsa/pcm.h:856
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_buffer_time_minmax";

   function snd_pcm_hw_params_set_buffer_time_near
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:857
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_buffer_time_near";

   function snd_pcm_hw_params_set_buffer_time_first
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:858
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_buffer_time_first";

   function snd_pcm_hw_params_set_buffer_time_last
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:859
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_buffer_time_last";

   function snd_pcm_hw_params_get_buffer_size (params : access constant snd_pcm_hw_params_t; val : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:861
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_buffer_size";

   function snd_pcm_hw_params_get_buffer_size_min (params : access constant snd_pcm_hw_params_t; val : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:862
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_buffer_size_min";

   function snd_pcm_hw_params_get_buffer_size_max (params : access constant snd_pcm_hw_params_t; val : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:863
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_buffer_size_max";

   function snd_pcm_hw_params_test_buffer_size
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:864
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_test_buffer_size";

   function snd_pcm_hw_params_set_buffer_size
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:865
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_buffer_size";

   function snd_pcm_hw_params_set_buffer_size_min
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:866
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_buffer_size_min";

   function snd_pcm_hw_params_set_buffer_size_max
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:867
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_buffer_size_max";

   function snd_pcm_hw_params_set_buffer_size_minmax
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      min : access snd_pcm_uframes_t;
      max : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:868
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_buffer_size_minmax";

   function snd_pcm_hw_params_set_buffer_size_near
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:869
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_buffer_size_near";

   function snd_pcm_hw_params_set_buffer_size_first
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:870
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_buffer_size_first";

   function snd_pcm_hw_params_set_buffer_size_last
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:871
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_buffer_size_last";

   function snd_pcm_hw_params_get_min_align (params : access constant snd_pcm_hw_params_t; val : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:875
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_min_align";

  --* \}
  --*
  -- * \defgroup PCM_SW_Params Software Parameters
  -- * \ingroup PCM
  -- * See the \ref pcm page for more details.
  -- * \{
  --

  --* \hideinitializer
  -- * \brief allocate an invalid #snd_pcm_sw_params_t using standard alloca
  -- * \param ptr returned pointer
  --

   function snd_pcm_sw_params_malloc (ptr : System.Address) return int  -- /usr/include/alsa/pcm.h:892
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_malloc";

   procedure snd_pcm_sw_params_free (obj : access snd_pcm_sw_params_t)  -- /usr/include/alsa/pcm.h:893
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_free";

   procedure snd_pcm_sw_params_copy (dst : access snd_pcm_sw_params_t; src : access constant snd_pcm_sw_params_t)  -- /usr/include/alsa/pcm.h:894
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_copy";

   function snd_pcm_sw_params_get_boundary (params : access constant snd_pcm_sw_params_t; val : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:895
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_get_boundary";

   function snd_pcm_sw_params_set_tstamp_mode
     (pcm : access snd_pcm_t;
      params : access snd_pcm_sw_params_t;
      val : snd_pcm_tstamp_t) return int  -- /usr/include/alsa/pcm.h:899
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_set_tstamp_mode";

   function snd_pcm_sw_params_get_tstamp_mode (params : access constant snd_pcm_sw_params_t; val : access snd_pcm_tstamp_t) return int  -- /usr/include/alsa/pcm.h:900
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_get_tstamp_mode";

   function snd_pcm_sw_params_set_tstamp_type
     (pcm : access snd_pcm_t;
      params : access snd_pcm_sw_params_t;
      val : snd_pcm_tstamp_type_t) return int  -- /usr/include/alsa/pcm.h:901
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_set_tstamp_type";

   function snd_pcm_sw_params_get_tstamp_type (params : access constant snd_pcm_sw_params_t; val : access snd_pcm_tstamp_type_t) return int  -- /usr/include/alsa/pcm.h:902
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_get_tstamp_type";

   function snd_pcm_sw_params_set_avail_min
     (pcm : access snd_pcm_t;
      params : access snd_pcm_sw_params_t;
      val : snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:903
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_set_avail_min";

   function snd_pcm_sw_params_get_avail_min (params : access constant snd_pcm_sw_params_t; val : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:904
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_get_avail_min";

   function snd_pcm_sw_params_set_period_event
     (pcm : access snd_pcm_t;
      params : access snd_pcm_sw_params_t;
      val : int) return int  -- /usr/include/alsa/pcm.h:905
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_set_period_event";

   function snd_pcm_sw_params_get_period_event (params : access constant snd_pcm_sw_params_t; val : access int) return int  -- /usr/include/alsa/pcm.h:906
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_get_period_event";

   function snd_pcm_sw_params_set_start_threshold
     (pcm : access snd_pcm_t;
      params : access snd_pcm_sw_params_t;
      val : snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:907
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_set_start_threshold";

   function snd_pcm_sw_params_get_start_threshold (paramsm : access constant snd_pcm_sw_params_t; val : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:908
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_get_start_threshold";

   function snd_pcm_sw_params_set_stop_threshold
     (pcm : access snd_pcm_t;
      params : access snd_pcm_sw_params_t;
      val : snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:909
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_set_stop_threshold";

   function snd_pcm_sw_params_get_stop_threshold (params : access constant snd_pcm_sw_params_t; val : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:910
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_get_stop_threshold";

   function snd_pcm_sw_params_set_silence_threshold
     (pcm : access snd_pcm_t;
      params : access snd_pcm_sw_params_t;
      val : snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:911
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_set_silence_threshold";

   function snd_pcm_sw_params_get_silence_threshold (params : access constant snd_pcm_sw_params_t; val : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:912
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_get_silence_threshold";

   function snd_pcm_sw_params_set_silence_size
     (pcm : access snd_pcm_t;
      params : access snd_pcm_sw_params_t;
      val : snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:913
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_set_silence_size";

   function snd_pcm_sw_params_get_silence_size (params : access constant snd_pcm_sw_params_t; val : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:914
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_get_silence_size";

  --* \}
  -- include old API
  --*
  -- * \defgroup PCM_Access Access Mask Functions
  -- * \ingroup PCM
  -- * See the \ref pcm page for more details.
  -- * \{
  --

  --* \hideinitializer
  -- * \brief allocate an empty #snd_pcm_access_mask_t using standard alloca
  -- * \param ptr returned pointer
  --

   function snd_pcm_access_mask_malloc (ptr : System.Address) return int  -- /usr/include/alsa/pcm.h:940
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_access_mask_malloc";

   procedure snd_pcm_access_mask_free (obj : access snd_pcm_access_mask_t)  -- /usr/include/alsa/pcm.h:941
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_access_mask_free";

   procedure snd_pcm_access_mask_copy (dst : access snd_pcm_access_mask_t; src : access constant snd_pcm_access_mask_t)  -- /usr/include/alsa/pcm.h:942
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_access_mask_copy";

   procedure snd_pcm_access_mask_none (mask : access snd_pcm_access_mask_t)  -- /usr/include/alsa/pcm.h:943
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_access_mask_none";

   procedure snd_pcm_access_mask_any (mask : access snd_pcm_access_mask_t)  -- /usr/include/alsa/pcm.h:944
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_access_mask_any";

   function snd_pcm_access_mask_test (mask : access constant snd_pcm_access_mask_t; val : snd_pcm_access_t) return int  -- /usr/include/alsa/pcm.h:945
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_access_mask_test";

   function snd_pcm_access_mask_empty (mask : access constant snd_pcm_access_mask_t) return int  -- /usr/include/alsa/pcm.h:946
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_access_mask_empty";

   procedure snd_pcm_access_mask_set (mask : access snd_pcm_access_mask_t; val : snd_pcm_access_t)  -- /usr/include/alsa/pcm.h:947
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_access_mask_set";

   procedure snd_pcm_access_mask_reset (mask : access snd_pcm_access_mask_t; val : snd_pcm_access_t)  -- /usr/include/alsa/pcm.h:948
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_access_mask_reset";

  --* \}
  --*
  -- * \defgroup PCM_Format Format Mask Functions
  -- * \ingroup PCM
  -- * See the \ref pcm page for more details.
  -- * \{
  --

  --* \hideinitializer
  -- * \brief allocate an empty #snd_pcm_format_mask_t using standard alloca
  -- * \param ptr returned pointer
  --

   function snd_pcm_format_mask_malloc (ptr : System.Address) return int  -- /usr/include/alsa/pcm.h:965
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_mask_malloc";

   procedure snd_pcm_format_mask_free (obj : access snd_pcm_format_mask_t)  -- /usr/include/alsa/pcm.h:966
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_mask_free";

   procedure snd_pcm_format_mask_copy (dst : access snd_pcm_format_mask_t; src : access constant snd_pcm_format_mask_t)  -- /usr/include/alsa/pcm.h:967
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_mask_copy";

   procedure snd_pcm_format_mask_none (mask : access snd_pcm_format_mask_t)  -- /usr/include/alsa/pcm.h:968
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_mask_none";

   procedure snd_pcm_format_mask_any (mask : access snd_pcm_format_mask_t)  -- /usr/include/alsa/pcm.h:969
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_mask_any";

   function snd_pcm_format_mask_test (mask : access constant snd_pcm_format_mask_t; val : snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:970
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_mask_test";

   function snd_pcm_format_mask_empty (mask : access constant snd_pcm_format_mask_t) return int  -- /usr/include/alsa/pcm.h:971
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_mask_empty";

   procedure snd_pcm_format_mask_set (mask : access snd_pcm_format_mask_t; val : snd_pcm_format_t)  -- /usr/include/alsa/pcm.h:972
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_mask_set";

   procedure snd_pcm_format_mask_reset (mask : access snd_pcm_format_mask_t; val : snd_pcm_format_t)  -- /usr/include/alsa/pcm.h:973
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_mask_reset";

  --* \}
  --*
  -- * \defgroup PCM_SubFormat Subformat Mask Functions
  -- * \ingroup PCM
  -- * See the \ref pcm page for more details.
  -- * \{
  --

  --* \hideinitializer
  -- * \brief allocate an empty #snd_pcm_subformat_mask_t using standard alloca
  -- * \param ptr returned pointer
  --

   function snd_pcm_subformat_mask_malloc (ptr : System.Address) return int  -- /usr/include/alsa/pcm.h:990
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_subformat_mask_malloc";

   procedure snd_pcm_subformat_mask_free (obj : access snd_pcm_subformat_mask_t)  -- /usr/include/alsa/pcm.h:991
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_subformat_mask_free";

   procedure snd_pcm_subformat_mask_copy (dst : access snd_pcm_subformat_mask_t; src : access constant snd_pcm_subformat_mask_t)  -- /usr/include/alsa/pcm.h:992
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_subformat_mask_copy";

   procedure snd_pcm_subformat_mask_none (mask : access snd_pcm_subformat_mask_t)  -- /usr/include/alsa/pcm.h:993
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_subformat_mask_none";

   procedure snd_pcm_subformat_mask_any (mask : access snd_pcm_subformat_mask_t)  -- /usr/include/alsa/pcm.h:994
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_subformat_mask_any";

   function snd_pcm_subformat_mask_test (mask : access constant snd_pcm_subformat_mask_t; val : snd_pcm_subformat_t) return int  -- /usr/include/alsa/pcm.h:995
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_subformat_mask_test";

   function snd_pcm_subformat_mask_empty (mask : access constant snd_pcm_subformat_mask_t) return int  -- /usr/include/alsa/pcm.h:996
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_subformat_mask_empty";

   procedure snd_pcm_subformat_mask_set (mask : access snd_pcm_subformat_mask_t; val : snd_pcm_subformat_t)  -- /usr/include/alsa/pcm.h:997
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_subformat_mask_set";

   procedure snd_pcm_subformat_mask_reset (mask : access snd_pcm_subformat_mask_t; val : snd_pcm_subformat_t)  -- /usr/include/alsa/pcm.h:998
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_subformat_mask_reset";

  --* \}
  --*
  -- * \defgroup PCM_Status Status Functions
  -- * \ingroup PCM
  -- * See the \ref pcm page for more details.
  -- * \{
  --

  --* \hideinitializer
  -- * \brief allocate an invalid #snd_pcm_status_t using standard alloca
  -- * \param ptr returned pointer
  --

   function snd_pcm_status_malloc (ptr : System.Address) return int  -- /usr/include/alsa/pcm.h:1015
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_status_malloc";

   procedure snd_pcm_status_free (obj : access snd_pcm_status_t)  -- /usr/include/alsa/pcm.h:1016
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_status_free";

   procedure snd_pcm_status_copy (dst : access snd_pcm_status_t; src : access constant snd_pcm_status_t)  -- /usr/include/alsa/pcm.h:1017
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_status_copy";

   function snd_pcm_status_get_state (obj : access constant snd_pcm_status_t) return snd_pcm_state_t  -- /usr/include/alsa/pcm.h:1018
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_status_get_state";

   procedure snd_pcm_status_get_trigger_tstamp (obj : access constant snd_pcm_status_t; ptr : access int)  -- /usr/include/alsa/pcm.h:1019
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_status_get_trigger_tstamp";

   procedure snd_pcm_status_get_trigger_htstamp (obj : access constant snd_pcm_status_t; ptr : access int)  -- /usr/include/alsa/pcm.h:1020
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_status_get_trigger_htstamp";

   procedure snd_pcm_status_get_tstamp (obj : access constant snd_pcm_status_t; ptr : access int)  -- /usr/include/alsa/pcm.h:1021
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_status_get_tstamp";

   procedure snd_pcm_status_get_htstamp (obj : access constant snd_pcm_status_t; ptr : access int)  -- /usr/include/alsa/pcm.h:1022
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_status_get_htstamp";

   procedure snd_pcm_status_get_audio_htstamp (obj : access constant snd_pcm_status_t; ptr : access int)  -- /usr/include/alsa/pcm.h:1023
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_status_get_audio_htstamp";

   procedure snd_pcm_status_get_driver_htstamp (obj : access constant snd_pcm_status_t; ptr : access int)  -- /usr/include/alsa/pcm.h:1024
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_status_get_driver_htstamp";

   procedure snd_pcm_status_get_audio_htstamp_report (obj : access constant snd_pcm_status_t; audio_tstamp_report : access snd_pcm_audio_tstamp_report_t)  -- /usr/include/alsa/pcm.h:1025
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_status_get_audio_htstamp_report";

   procedure snd_pcm_status_set_audio_htstamp_config (obj : access snd_pcm_status_t; audio_tstamp_config : access snd_pcm_audio_tstamp_config_t)  -- /usr/include/alsa/pcm.h:1027
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_status_set_audio_htstamp_config";

   procedure snd_pcm_pack_audio_tstamp_config (data : access unsigned; config : access snd_pcm_audio_tstamp_config_t)  -- /usr/include/alsa/pcm.h:1030
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_pack_audio_tstamp_config";

   procedure snd_pcm_unpack_audio_tstamp_report
     (data : unsigned;
      accuracy : unsigned;
      report : access snd_pcm_audio_tstamp_report_t)  -- /usr/include/alsa/pcm.h:1038
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_unpack_audio_tstamp_report";

   function snd_pcm_status_get_delay (obj : access constant snd_pcm_status_t) return snd_pcm_sframes_t  -- /usr/include/alsa/pcm.h:1048
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_status_get_delay";

   function snd_pcm_status_get_avail (obj : access constant snd_pcm_status_t) return snd_pcm_uframes_t  -- /usr/include/alsa/pcm.h:1049
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_status_get_avail";

   function snd_pcm_status_get_avail_max (obj : access constant snd_pcm_status_t) return snd_pcm_uframes_t  -- /usr/include/alsa/pcm.h:1050
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_status_get_avail_max";

   function snd_pcm_status_get_overrange (obj : access constant snd_pcm_status_t) return snd_pcm_uframes_t  -- /usr/include/alsa/pcm.h:1051
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_status_get_overrange";

  --* \}
  --*
  -- * \defgroup PCM_Description Description Functions
  -- * \ingroup PCM
  -- * See the \ref pcm page for more details.
  -- * \{
  --

   function snd_pcm_type_name (c_type : snd_pcm_type_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:1062
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_type_name";

   function snd_pcm_stream_name (stream : snd_pcm_stream_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:1063
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_stream_name";

   function snd_pcm_access_name (u_access : snd_pcm_access_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:1064
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_access_name";

   function snd_pcm_format_name (format : snd_pcm_format_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:1065
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_name";

   function snd_pcm_format_description (format : snd_pcm_format_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:1066
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_description";

   function snd_pcm_subformat_name (subformat : snd_pcm_subformat_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:1067
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_subformat_name";

   function snd_pcm_subformat_description (subformat : snd_pcm_subformat_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:1068
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_subformat_description";

   function snd_pcm_format_value (name : Interfaces.C.Strings.chars_ptr) return snd_pcm_format_t  -- /usr/include/alsa/pcm.h:1069
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_value";

   function snd_pcm_tstamp_mode_name (mode : snd_pcm_tstamp_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:1070
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_tstamp_mode_name";

   function snd_pcm_state_name (state : snd_pcm_state_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:1071
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_state_name";

  --* \}
  --*
  -- * \defgroup PCM_Dump Debug Functions
  -- * \ingroup PCM
  -- * See the \ref pcm page for more details.
  -- * \{
  --

   function snd_pcm_dump (pcm : access snd_pcm_t; c_out : access int) return int  -- /usr/include/alsa/pcm.h:1082
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_dump";

   function snd_pcm_dump_hw_setup (pcm : access snd_pcm_t; c_out : access int) return int  -- /usr/include/alsa/pcm.h:1083
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_dump_hw_setup";

   function snd_pcm_dump_sw_setup (pcm : access snd_pcm_t; c_out : access int) return int  -- /usr/include/alsa/pcm.h:1084
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_dump_sw_setup";

   function snd_pcm_dump_setup (pcm : access snd_pcm_t; c_out : access int) return int  -- /usr/include/alsa/pcm.h:1085
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_dump_setup";

   function snd_pcm_hw_params_dump (params : access snd_pcm_hw_params_t; c_out : access int) return int  -- /usr/include/alsa/pcm.h:1086
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_dump";

   function snd_pcm_sw_params_dump (params : access snd_pcm_sw_params_t; c_out : access int) return int  -- /usr/include/alsa/pcm.h:1087
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_dump";

   function snd_pcm_status_dump (status : access snd_pcm_status_t; c_out : access int) return int  -- /usr/include/alsa/pcm.h:1088
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_status_dump";

  --* \}
  --*
  -- * \defgroup PCM_Direct Direct Access (MMAP) Functions
  -- * \ingroup PCM
  -- * See the \ref pcm page for more details.
  -- * \{
  --

   function snd_pcm_mmap_begin
     (pcm : access snd_pcm_t;
      areas : System.Address;
      offset : access snd_pcm_uframes_t;
      frames : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:1099
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_mmap_begin";

   function snd_pcm_mmap_commit
     (pcm : access snd_pcm_t;
      offset : snd_pcm_uframes_t;
      frames : snd_pcm_uframes_t) return snd_pcm_sframes_t  -- /usr/include/alsa/pcm.h:1103
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_mmap_commit";

   function snd_pcm_mmap_writei
     (pcm : access snd_pcm_t;
      buffer : System.Address;
      size : snd_pcm_uframes_t) return snd_pcm_sframes_t  -- /usr/include/alsa/pcm.h:1106
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_mmap_writei";

   function snd_pcm_mmap_readi
     (pcm : access snd_pcm_t;
      buffer : System.Address;
      size : snd_pcm_uframes_t) return snd_pcm_sframes_t  -- /usr/include/alsa/pcm.h:1107
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_mmap_readi";

   function snd_pcm_mmap_writen
     (pcm : access snd_pcm_t;
      bufs : System.Address;
      size : snd_pcm_uframes_t) return snd_pcm_sframes_t  -- /usr/include/alsa/pcm.h:1108
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_mmap_writen";

   function snd_pcm_mmap_readn
     (pcm : access snd_pcm_t;
      bufs : System.Address;
      size : snd_pcm_uframes_t) return snd_pcm_sframes_t  -- /usr/include/alsa/pcm.h:1109
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_mmap_readn";

  --* \}
  --*
  -- * \defgroup PCM_Helpers Helper Functions
  -- * \ingroup PCM
  -- * See the \ref pcm page for more details.
  -- * \{
  --

   function snd_pcm_format_signed (format : snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:1120
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_signed";

   function snd_pcm_format_unsigned (format : snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:1121
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_unsigned";

   function snd_pcm_format_linear (format : snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:1122
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_linear";

   function snd_pcm_format_float (format : snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:1123
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_float";

   function snd_pcm_format_little_endian (format : snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:1124
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_little_endian";

   function snd_pcm_format_big_endian (format : snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:1125
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_big_endian";

   function snd_pcm_format_cpu_endian (format : snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:1126
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_cpu_endian";

  -- in bits
   function snd_pcm_format_width (format : snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:1127
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_width";

  -- in bits
   function snd_pcm_format_physical_width (format : snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:1128
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_physical_width";

   function snd_pcm_build_linear_format
     (width : int;
      pwidth : int;
      unsignd : int;
      big_endian : int) return snd_pcm_format_t  -- /usr/include/alsa/pcm.h:1129
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_build_linear_format";

   function snd_pcm_format_silence (format : snd_pcm_format_t) return Interfaces.Unsigned_8  -- /usr/include/alsa/pcm.h:1131
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_silence";

   function snd_pcm_format_silence_16 (format : snd_pcm_format_t) return Interfaces.Unsigned_16  -- /usr/include/alsa/pcm.h:1132
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_silence_16";

   function snd_pcm_format_silence_32 (format : snd_pcm_format_t) return Interfaces.Unsigned_32  -- /usr/include/alsa/pcm.h:1133
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_silence_32";

   function snd_pcm_format_silence_64 (format : snd_pcm_format_t) return Interfaces.Unsigned_64  -- /usr/include/alsa/pcm.h:1134
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_silence_64";

   function snd_pcm_format_set_silence
     (format : snd_pcm_format_t;
      buf : System.Address;
      samples : unsigned) return int  -- /usr/include/alsa/pcm.h:1135
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_format_set_silence";

   function snd_pcm_bytes_to_frames (pcm : access snd_pcm_t; bytes : int) return snd_pcm_sframes_t  -- /usr/include/alsa/pcm.h:1137
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_bytes_to_frames";

   function snd_pcm_bytes_to_samples (pcm : access snd_pcm_t; bytes : int) return long  -- /usr/include/alsa/pcm.h:1139
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_bytes_to_samples";

   function snd_pcm_area_silence
     (dst_channel : access constant snd_pcm_channel_area_t;
      dst_offset : snd_pcm_uframes_t;
      samples : unsigned;
      format : snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:1142
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_area_silence";

   function snd_pcm_areas_silence
     (dst_channels : access constant snd_pcm_channel_area_t;
      dst_offset : snd_pcm_uframes_t;
      channels : unsigned;
      frames : snd_pcm_uframes_t;
      format : snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:1144
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_areas_silence";

   function snd_pcm_area_copy
     (dst_channel : access constant snd_pcm_channel_area_t;
      dst_offset : snd_pcm_uframes_t;
      src_channel : access constant snd_pcm_channel_area_t;
      src_offset : snd_pcm_uframes_t;
      samples : unsigned;
      format : snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:1146
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_area_copy";

   function snd_pcm_areas_copy
     (dst_channels : access constant snd_pcm_channel_area_t;
      dst_offset : snd_pcm_uframes_t;
      src_channels : access constant snd_pcm_channel_area_t;
      src_offset : snd_pcm_uframes_t;
      channels : unsigned;
      frames : snd_pcm_uframes_t;
      format : snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:1149
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_areas_copy";

   function snd_pcm_areas_copy_wrap
     (dst_channels : access constant snd_pcm_channel_area_t;
      dst_offset : snd_pcm_uframes_t;
      dst_size : snd_pcm_uframes_t;
      src_channels : access constant snd_pcm_channel_area_t;
      src_offset : snd_pcm_uframes_t;
      src_size : snd_pcm_uframes_t;
      channels : unsigned;
      frames : snd_pcm_uframes_t;
      format : snd_pcm_format_t) return int  -- /usr/include/alsa/pcm.h:1152
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_areas_copy_wrap";

  --* \}
  --*
  -- * \defgroup PCM_Hook Hook Extension
  -- * \ingroup PCM
  -- * See the \ref pcm page for more details.
  -- * \{
  --

  --* type of pcm hook
   subtype u_snd_pcm_hook_type is unsigned;
   PCM_HOOK_TYPE_HW_PARAMS : constant unsigned := 0;
   PCM_HOOK_TYPE_HW_FREE : constant unsigned := 1;
   PCM_HOOK_TYPE_CLOSE : constant unsigned := 2;
   PCM_HOOK_TYPE_LAST : constant unsigned := 2;  -- /usr/include/alsa/pcm.h:1172

   subtype snd_pcm_hook_type_t is u_snd_pcm_hook_type;  -- /usr/include/alsa/pcm.h:1177

  --* PCM hook container
   type u_snd_pcm_hook is null record;   -- incomplete struct

   subtype snd_pcm_hook_t is u_snd_pcm_hook;  -- /usr/include/alsa/pcm.h:1180

  --* PCM hook callback function
   type snd_pcm_hook_func_t is access function (arg1 : access snd_pcm_hook_t) return int
   with Convention => C;  -- /usr/include/alsa/pcm.h:1182

   function snd_pcm_hook_get_pcm (hook : access snd_pcm_hook_t) return access snd_pcm_t  -- /usr/include/alsa/pcm.h:1183
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hook_get_pcm";

   function snd_pcm_hook_get_private (hook : access snd_pcm_hook_t) return System.Address  -- /usr/include/alsa/pcm.h:1184
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hook_get_private";

   procedure snd_pcm_hook_set_private (hook : access snd_pcm_hook_t; private_data : System.Address)  -- /usr/include/alsa/pcm.h:1185
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hook_set_private";

   function snd_pcm_hook_add
     (hookp : System.Address;
      pcm : access snd_pcm_t;
      c_type : snd_pcm_hook_type_t;
      func : snd_pcm_hook_func_t;
      private_data : System.Address) return int  -- /usr/include/alsa/pcm.h:1186
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hook_add";

   function snd_pcm_hook_remove (hook : access snd_pcm_hook_t) return int  -- /usr/include/alsa/pcm.h:1189
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hook_remove";

  --* \}
  --*
  -- * \defgroup PCM_Scope Scope Plugin Extension
  -- * \ingroup PCM
  -- * See the \ref pcm page for more details.
  -- * \{
  --

  --* #PCM_TYPE_METER scope functions
  --* \brief Enable and prepare it using current params
  --	 * \param scope scope handle
  --

   type u_snd_pcm_scope_ops is record
      enable : access function (arg1 : access snd_pcm_scope_t) return int;  -- /usr/include/alsa/pcm.h:1205
      disable : access procedure (arg1 : access snd_pcm_scope_t);  -- /usr/include/alsa/pcm.h:1209
      start : access procedure (arg1 : access snd_pcm_scope_t);  -- /usr/include/alsa/pcm.h:1213
      stop : access procedure (arg1 : access snd_pcm_scope_t);  -- /usr/include/alsa/pcm.h:1217
      update : access procedure (arg1 : access snd_pcm_scope_t);  -- /usr/include/alsa/pcm.h:1221
      reset : access procedure (arg1 : access snd_pcm_scope_t);  -- /usr/include/alsa/pcm.h:1225
      close : access procedure (arg1 : access snd_pcm_scope_t);  -- /usr/include/alsa/pcm.h:1229
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/alsa/pcm.h:1201

  --* \brief Disable
  --	 * \param scope scope handle
  --

  --* \brief PCM has been started
  --	 * \param scope scope handle
  --

  --* \brief PCM has been stopped
  --	 * \param scope scope handle
  --

  --* \brief New frames are present
  --	 * \param scope scope handle
  --

  --* \brief Reset status
  --	 * \param scope scope handle
  --

  --* \brief PCM is closing
  --	 * \param scope scope handle
  --

   subtype snd_pcm_scope_ops_t is u_snd_pcm_scope_ops;  -- /usr/include/alsa/pcm.h:1230

   function snd_pcm_meter_get_bufsize (pcm : access snd_pcm_t) return snd_pcm_uframes_t  -- /usr/include/alsa/pcm.h:1232
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_meter_get_bufsize";

   function snd_pcm_meter_get_channels (pcm : access snd_pcm_t) return unsigned  -- /usr/include/alsa/pcm.h:1233
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_meter_get_channels";

   function snd_pcm_meter_get_rate (pcm : access snd_pcm_t) return unsigned  -- /usr/include/alsa/pcm.h:1234
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_meter_get_rate";

   function snd_pcm_meter_get_now (pcm : access snd_pcm_t) return snd_pcm_uframes_t  -- /usr/include/alsa/pcm.h:1235
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_meter_get_now";

   function snd_pcm_meter_get_boundary (pcm : access snd_pcm_t) return snd_pcm_uframes_t  -- /usr/include/alsa/pcm.h:1236
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_meter_get_boundary";

   function snd_pcm_meter_add_scope (pcm : access snd_pcm_t; scope : access snd_pcm_scope_t) return int  -- /usr/include/alsa/pcm.h:1237
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_meter_add_scope";

   function snd_pcm_meter_search_scope (pcm : access snd_pcm_t; name : Interfaces.C.Strings.chars_ptr) return access snd_pcm_scope_t  -- /usr/include/alsa/pcm.h:1238
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_meter_search_scope";

   function snd_pcm_scope_malloc (ptr : System.Address) return int  -- /usr/include/alsa/pcm.h:1239
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_scope_malloc";

   procedure snd_pcm_scope_set_ops (scope : access snd_pcm_scope_t; val : access constant snd_pcm_scope_ops_t)  -- /usr/include/alsa/pcm.h:1240
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_scope_set_ops";

   procedure snd_pcm_scope_set_name (scope : access snd_pcm_scope_t; val : Interfaces.C.Strings.chars_ptr)  -- /usr/include/alsa/pcm.h:1242
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_scope_set_name";

   function snd_pcm_scope_get_name (scope : access snd_pcm_scope_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:1243
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_scope_get_name";

   function snd_pcm_scope_get_callback_private (scope : access snd_pcm_scope_t) return System.Address  -- /usr/include/alsa/pcm.h:1244
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_scope_get_callback_private";

   procedure snd_pcm_scope_set_callback_private (scope : access snd_pcm_scope_t; val : System.Address)  -- /usr/include/alsa/pcm.h:1245
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_scope_set_callback_private";

   function snd_pcm_scope_s16_open
     (pcm : access snd_pcm_t;
      name : Interfaces.C.Strings.chars_ptr;
      scopep : System.Address) return int  -- /usr/include/alsa/pcm.h:1246
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_scope_s16_open";

   function snd_pcm_scope_s16_get_channel_buffer (scope : access snd_pcm_scope_t; channel : unsigned) return access Interfaces.Integer_16  -- /usr/include/alsa/pcm.h:1248
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_scope_s16_get_channel_buffer";

  --* \}
  --*
  -- * \defgroup PCM_Simple Simple setup functions
  -- * \ingroup PCM
  -- * See the \ref pcm page for more details.
  -- * \{
  --

  --* Simple PCM latency type
   type u_snd_spcm_latency is
     (SPCM_LATENCY_STANDARD,
      SPCM_LATENCY_MEDIUM,
      SPCM_LATENCY_REALTIME)
   with Convention => C;  -- /usr/include/alsa/pcm.h:1261

  --* standard latency - for standard playback or capture
  --            (estimated latency in one direction 350ms)

  --* medium latency - software phones etc.
  --	    (estimated latency in one direction maximally 25ms

  --* realtime latency - realtime applications (effect processors etc.)
  --	    (estimated latency in one direction 5ms and better)

   subtype snd_spcm_latency_t is u_snd_spcm_latency;  -- /usr/include/alsa/pcm.h:1271

  --* Simple PCM xrun type
   type u_snd_spcm_xrun_type is
     (SPCM_XRUN_IGNORE,
      SPCM_XRUN_STOP)
   with Convention => C;  -- /usr/include/alsa/pcm.h:1274

  --* driver / library will ignore all xruns, the stream runs forever
  --* driver / library stops the stream when an xrun occurs
   subtype snd_spcm_xrun_type_t is u_snd_spcm_xrun_type;  -- /usr/include/alsa/pcm.h:1279

  --* Simple PCM duplex type
   type u_snd_spcm_duplex_type is
     (SPCM_DUPLEX_LIBERAL,
      SPCM_DUPLEX_PEDANTIC)
   with Convention => C;  -- /usr/include/alsa/pcm.h:1282

  --* liberal duplex - the buffer and period sizes might not match
  --* pedantic duplex - the buffer and period sizes MUST match
   subtype snd_spcm_duplex_type_t is u_snd_spcm_duplex_type;  -- /usr/include/alsa/pcm.h:1287

   function snd_spcm_init
     (pcm : access snd_pcm_t;
      rate : unsigned;
      channels : unsigned;
      format : snd_pcm_format_t;
      subformat : snd_pcm_subformat_t;
      latency : snd_spcm_latency_t;
      u_access : snd_pcm_access_t;
      xrun_type : snd_spcm_xrun_type_t) return int  -- /usr/include/alsa/pcm.h:1289
   with Import => True,
        Convention => C,
        External_Name => "snd_spcm_init";

   function snd_spcm_init_duplex
     (playback_pcm : access snd_pcm_t;
      capture_pcm : access snd_pcm_t;
      rate : unsigned;
      channels : unsigned;
      format : snd_pcm_format_t;
      subformat : snd_pcm_subformat_t;
      latency : snd_spcm_latency_t;
      u_access : snd_pcm_access_t;
      xrun_type : snd_spcm_xrun_type_t;
      duplex_type : snd_spcm_duplex_type_t) return int  -- /usr/include/alsa/pcm.h:1298
   with Import => True,
        Convention => C,
        External_Name => "snd_spcm_init_duplex";

   function snd_spcm_init_get_params
     (pcm : access snd_pcm_t;
      rate : access unsigned;
      buffer_size : access snd_pcm_uframes_t;
      period_size : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:1309
   with Import => True,
        Convention => C,
        External_Name => "snd_spcm_init_get_params";

  --* \}
  --*
  -- * \defgroup PCM_Deprecated Deprecated Functions
  -- * \ingroup PCM
  -- * See the \ref pcm page for more details.
  -- * \{
  --

  -- Deprecated functions, for compatibility
   function snd_pcm_start_mode_name (mode : snd_pcm_start_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:1324
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_start_mode_name";

   function snd_pcm_xrun_mode_name (mode : snd_pcm_xrun_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/alsa/pcm.h:1325
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_xrun_mode_name";

   function snd_pcm_sw_params_set_start_mode
     (pcm : access snd_pcm_t;
      params : access snd_pcm_sw_params_t;
      val : snd_pcm_start_t) return int  -- /usr/include/alsa/pcm.h:1326
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_set_start_mode";

   function snd_pcm_sw_params_get_start_mode (params : access constant snd_pcm_sw_params_t) return snd_pcm_start_t  -- /usr/include/alsa/pcm.h:1327
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_get_start_mode";

   function snd_pcm_sw_params_set_xrun_mode
     (pcm : access snd_pcm_t;
      params : access snd_pcm_sw_params_t;
      val : snd_pcm_xrun_t) return int  -- /usr/include/alsa/pcm.h:1328
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_set_xrun_mode";

   function snd_pcm_sw_params_get_xrun_mode (params : access constant snd_pcm_sw_params_t) return snd_pcm_xrun_t  -- /usr/include/alsa/pcm.h:1329
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_get_xrun_mode";

   function snd_pcm_sw_params_set_xfer_align
     (pcm : access snd_pcm_t;
      params : access snd_pcm_sw_params_t;
      val : snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:1331
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_set_xfer_align";

   function snd_pcm_sw_params_get_xfer_align (params : access constant snd_pcm_sw_params_t; val : access snd_pcm_uframes_t) return int  -- /usr/include/alsa/pcm.h:1332
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_get_xfer_align";

   function snd_pcm_sw_params_set_sleep_min
     (pcm : access snd_pcm_t;
      params : access snd_pcm_sw_params_t;
      val : unsigned) return int  -- /usr/include/alsa/pcm.h:1333
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_set_sleep_min";

   function snd_pcm_sw_params_get_sleep_min (params : access constant snd_pcm_sw_params_t; val : access unsigned) return int  -- /usr/include/alsa/pcm.h:1334
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_sw_params_get_sleep_min";

   function snd_pcm_hw_params_get_tick_time
     (params : access constant snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:1337
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_tick_time";

   function snd_pcm_hw_params_get_tick_time_min
     (params : access constant snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:1338
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_tick_time_min";

   function snd_pcm_hw_params_get_tick_time_max
     (params : access constant snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:1339
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_get_tick_time_max";

   function snd_pcm_hw_params_test_tick_time
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : unsigned;
      dir : int) return int  -- /usr/include/alsa/pcm.h:1340
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_test_tick_time";

   function snd_pcm_hw_params_set_tick_time
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : unsigned;
      dir : int) return int  -- /usr/include/alsa/pcm.h:1341
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_tick_time";

   function snd_pcm_hw_params_set_tick_time_min
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:1342
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_tick_time_min";

   function snd_pcm_hw_params_set_tick_time_max
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:1343
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_tick_time_max";

   function snd_pcm_hw_params_set_tick_time_minmax
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      min : access unsigned;
      mindir : access int;
      max : access unsigned;
      maxdir : access int) return int  -- /usr/include/alsa/pcm.h:1344
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_tick_time_minmax";

   function snd_pcm_hw_params_set_tick_time_near
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:1345
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_tick_time_near";

   function snd_pcm_hw_params_set_tick_time_first
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:1346
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_tick_time_first";

   function snd_pcm_hw_params_set_tick_time_last
     (pcm : access snd_pcm_t;
      params : access snd_pcm_hw_params_t;
      val : access unsigned;
      dir : access int) return int  -- /usr/include/alsa/pcm.h:1347
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_set_tick_time_last";

  --* \}

   --  size_t snd_pcm_hw_params_sizeof(void);
   function snd_pcm_hw_params_sizeof return Interfaces.C.size_t
   with Import => True,
        Convention => C,
        External_Name => "snd_pcm_hw_params_sizeof";

end ALSA.pcm_h;
