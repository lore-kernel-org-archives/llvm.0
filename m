Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7B110F3
	for <llvm@lists.linux.dev>; Sat,  8 Oct 2022 07:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665214294; x=1696750294;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fLHPq2CDxVKwbkIXTwiuYiE8BJKDUN36zUOAHpEsXOY=;
  b=UIilUID0gHjzrGPRXwYdCIzm5cL2geVXDrIBLV6HOZVunofFi+mMasqM
   RZtbVuldggCahvDs92RSHNg7htAC2SjPLu8HMo/N2S+xM7lPP5KYh/iJx
   B/80HM1a71eleiRgMvvP7Rw/FPIcJbc+Av5S6/9HIGqh+BDFNdsB3/jwg
   PZWySqD9eB/i36eSvkIe5BDfuS4nEm5PYwVvtC8dy037QNHxXAT9amuZC
   R5kamuFV/djcedjr/RaoFkoCE5bAJwdRwEAGo/iJdAm9OS0C/gXRSeq17
   lzCTnNcukZvpcO5apXpdqZM321aC+E09dx1BLUhxBtZEDH31z2uBWvPDc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="301511070"
X-IronPort-AV: E=Sophos;i="5.95,169,1661842800"; 
   d="scan'208";a="301511070"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2022 00:31:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="954336742"
X-IronPort-AV: E=Sophos;i="5.95,169,1661842800"; 
   d="scan'208";a="954336742"
Received: from lkp-server01.sh.intel.com (HELO 3c15167049b7) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Oct 2022 00:31:32 -0700
Received: from kbuild by 3c15167049b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oh4J1-0001vP-1G;
	Sat, 08 Oct 2022 07:31:31 +0000
Date: Sat, 8 Oct 2022 15:30:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: fs/hfsplus/super.c:548:17: warning: taking address of packed member
 'write_count' of class or structure 'hfsplus_vh' may result in an unaligned
 pointer value
Message-ID: <202210081510.0GKrIC5r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="uuS0SezJWtn3Kjzw"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
fs/hfsplus/super.c: 548:17: warning: taking address of packed member
 'write_count' of class or structure 'hfsplus_vh' may result in an unaligned
 pointer value [-Waddress-of-packed-member]
fs/hfsplus/xattr.c: 104:17: warning: taking address of packed member
 'free_nodes' of class or structure 'hfs_btree_header_rec' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
drivers/hwmon/occ/common.c: 439:27: warning: taking address of packed member
 'accumulator' of class or structure 'power_sensor_2' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
drivers/hwmon/occ/common.c: 440:13: warning: taking address of packed member
 'update_tag' of class or structure 'power_sensor_2' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
drivers/hwmon/occ/common.c: 477:27: warning: taking address of packed member
 'accumulator' of class or structure 'power_sensor_data_and_time' may result
 in an unaligned pointer value [-Waddress-of-packed-member]
drivers/hwmon/occ/common.c: 478:13: warning: taking address of packed member
 'update_tag' of class or structure 'power_sensor_data_and_time' may result
 in an unaligned pointer value [-Waddress-of-packed-member]
drivers/hwmon/occ/common.c: 505:27: warning: taking address of packed member
 'accumulator' of class or structure 'power_sensor_data' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
drivers/hwmon/occ/common.c: 506:13: warning: taking address of packed member
 'update_tag' of class or structure 'power_sensor_data' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
drivers/pwm/pwm-cros-ec.c: 68:33: warning: taking address of packed member
 'msg' of class or structure '' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
drivers/platform/chrome/cros_ec.c: 123:41: warning: taking address of packed
 member 'msg' of class or structure '' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
drivers/platform/chrome/cros_ec_proto.c: 633:33: warning: taking address of
 packed member 'msg' of class or structure '' may result in an unaligned
 pointer value [-Waddress-of-packed-member]
drivers/platform/chrome/cros_ec_debugfs.c: 213:9: warning: taking address of
 packed member 'msg' of class or structure '' may result in an unaligned
 pointer value [-Waddress-of-packed-member]
drivers/platform/chrome/cros_ec_debugfs.c: 256:41: warning: taking address of
 packed member 'cmd' of class or structure '' may result in an unaligned
 pointer value [-Waddress-of-packed-member]
drivers/rtc/rtc-cros-ec.c: 45:42: warning: taking address of packed member
 'msg' of class or structure '' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 222:16: warning: taking address
 of packed member 'flags' of class or structure 'snd_efw_hwinfo' may result
 in an unaligned pointer value [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 223:16: warning: taking address
 of packed member 'guid_hi' of class or structure 'snd_efw_hwinfo' may result
 in an unaligned pointer value [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 224:16: warning: taking address
 of packed member 'guid_lo' of class or structure 'snd_efw_hwinfo' may result
 in an unaligned pointer value [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 225:16: warning: taking address
 of packed member 'type' of class or structure 'snd_efw_hwinfo' may result in
 an unaligned pointer value [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 226:16: warning: taking address
 of packed member 'version' of class or structure 'snd_efw_hwinfo' may result
 in an unaligned pointer value [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 227:16: warning: taking address
 of packed member 'supported_clocks' of class or structure 'snd_efw_hwinfo'
 may result in an unaligned pointer value [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 228:16: warning: taking address
 of packed member 'amdtp_rx_pcm_channels' of class or structure
 'snd_efw_hwinfo' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 229:16: warning: taking address
 of packed member 'amdtp_tx_pcm_channels' of class or structure
 'snd_efw_hwinfo' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 230:16: warning: taking address
 of packed member 'phys_out' of class or structure 'snd_efw_hwinfo' may
 result in an unaligned pointer value [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 231:16: warning: taking address
 of packed member 'phys_in' of class or structure 'snd_efw_hwinfo' may result
 in an unaligned pointer value [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 232:16: warning: taking address
 of packed member 'phys_out_grp_count' of class or structure 'snd_efw_hwinfo'
 may result in an unaligned pointer value [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 233:16: warning: taking address
 of packed member 'phys_in_grp_count' of class or structure 'snd_efw_hwinfo'
 may result in an unaligned pointer value [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 234:16: warning: taking address
 of packed member 'midi_out_ports' of class or structure 'snd_efw_hwinfo' may
 result in an unaligned pointer value [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 235:16: warning: taking address
 of packed member 'midi_in_ports' of class or structure 'snd_efw_hwinfo' may
 result in an unaligned pointer value [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 236:16: warning: taking address
 of packed member 'max_sample_rate' of class or structure 'snd_efw_hwinfo'
 may result in an unaligned pointer value [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 237:16: warning: taking address
 of packed member 'min_sample_rate' of class or structure 'snd_efw_hwinfo'
 may result in an unaligned pointer value [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 238:16: warning: taking address
 of packed member 'dsp_version' of class or structure 'snd_efw_hwinfo' may
 result in an unaligned pointer value [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 239:16: warning: taking address
 of packed member 'arm_version' of class or structure 'snd_efw_hwinfo' may
 result in an unaligned pointer value [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 240:16: warning: taking address
 of packed member 'mixer_playback_channels' of class or structure
 'snd_efw_hwinfo' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 241:16: warning: taking address
 of packed member 'mixer_capture_channels' of class or structure
 'snd_efw_hwinfo' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 242:16: warning: taking address
 of packed member 'fpga_version' of class or structure 'snd_efw_hwinfo' may
 result in an unaligned pointer value [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 243:16: warning: taking address
 of packed member 'amdtp_rx_pcm_channels_2x' of class or structure
 'snd_efw_hwinfo' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 244:16: warning: taking address
 of packed member 'amdtp_tx_pcm_channels_2x' of class or structure
 'snd_efw_hwinfo' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 245:16: warning: taking address
 of packed member 'amdtp_rx_pcm_channels_4x' of class or structure
 'snd_efw_hwinfo' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
sound/firewire/fireworks/fireworks_command.c: 246:16: warning: taking address
 of packed member 'amdtp_tx_pcm_channels_4x' of class or structure
 'snd_efw_hwinfo' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
drivers/usb/serial/io_ti.c: 2359:16: warning: taking address of packed member
 'wFlags' of class or structure 'ump_uart_config' may result in an unaligned
 pointer value [-Waddress-of-packed-member]
drivers/usb/serial/io_ti.c: 2360:16: warning: taking address of packed member
 'wBaudRate' of class or structure 'ump_uart_config' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
drivers/staging/fwserial/fwserial.c: 1594:20: warning: taking address of
 packed member '' of class or structure 'fwserial_mgmt_pkt' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
sound/soc/fsl/fsl_easrc.c: 341:19: warning: taking address of packed member
 'center_tap' of class or structure 'interp_params' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
sound/soc/sof/trace.c: 190:38: warning: taking address of packed member
 'stream_tag' of class or structure 'sof_ipc_dma_trace_params_ext' may result
 in an unaligned pointer value [-Waddress-of-packed-member]


--uuS0SezJWtn3Kjzw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

CC: linux-kernel@vger.kernel.org
TO: Paul Cercueil <paul@crapouillou.net>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Paul,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e8bc52cb8df80c31c73c726ab58ea9746e9ff734
commit: c434b9f80b0923e6460031b0fd964f8b0bf3c6a6 MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol
date:   2 years, 1 month ago
config: mips-randconfig-r016-20221007
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64el-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c434b9f80b0923e6460031b0fd964f8b0bf3c6a6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c434b9f80b0923e6460031b0fd964f8b0bf3c6a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/hwmon/occ/ drivers/mmc/host/ drivers/platform/chrome/ drivers/pwm/ drivers/rtc/ drivers/staging/fwserial/ drivers/usb/serial/ drivers/watchdog/ fs/hfsplus/ sound/firewire/fireworks/ sound/soc/fsl/ sound/soc/intel/ sound/soc/sof/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/hfsplus/super.c:548:17: warning: taking address of packed member 'write_count' of class or structure 'hfsplus_vh' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   be32_add_cpu(&vhdr->write_count, 1);
                                 ^~~~~~~~~~~~~~~~~
   1 warning generated.
--
>> fs/hfsplus/xattr.c:104:17: warning: taking address of packed member 'free_nodes' of class or structure 'hfs_btree_header_rec' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   be32_add_cpu(&head->free_nodes, 0 - map_nodes);
                                 ^~~~~~~~~~~~~~~~
   1 warning generated.
--
>> drivers/mmc/host/jz4740_mmc.c:986:19: warning: cast to smaller integer type 'enum jz4740_mmc_version' from 'const void *' [-Wvoid-pointer-to-enum-cast]
                   host->version = (enum jz4740_mmc_version)match->data;
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
--
>> drivers/hwmon/occ/common.c:439:27: warning: taking address of packed member 'accumulator' of class or structure 'power_sensor_2' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   val = occ_get_powr_avg(&power->accumulator,
                                           ^~~~~~~~~~~~~~~~~~
>> drivers/hwmon/occ/common.c:440:13: warning: taking address of packed member 'update_tag' of class or structure 'power_sensor_2' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                          &power->update_tag);
                                           ^~~~~~~~~~~~~~~~~
>> drivers/hwmon/occ/common.c:477:27: warning: taking address of packed member 'accumulator' of class or structure 'power_sensor_data_and_time' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   val = occ_get_powr_avg(&power->system.accumulator,
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hwmon/occ/common.c:478:13: warning: taking address of packed member 'update_tag' of class or structure 'power_sensor_data_and_time' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                          &power->system.update_tag);
                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/occ/common.c:491:27: warning: taking address of packed member 'accumulator' of class or structure 'power_sensor_data_and_time' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   val = occ_get_powr_avg(&power->proc.accumulator,
                                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/occ/common.c:492:13: warning: taking address of packed member 'update_tag' of class or structure 'power_sensor_data_and_time' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                          &power->proc.update_tag);
                                           ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/hwmon/occ/common.c:505:27: warning: taking address of packed member 'accumulator' of class or structure 'power_sensor_data' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   val = occ_get_powr_avg(&power->vdd.accumulator,
                                           ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/hwmon/occ/common.c:506:13: warning: taking address of packed member 'update_tag' of class or structure 'power_sensor_data' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                          &power->vdd.update_tag);
                                           ^~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/occ/common.c:519:27: warning: taking address of packed member 'accumulator' of class or structure 'power_sensor_data' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   val = occ_get_powr_avg(&power->vdn.accumulator,
                                           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/occ/common.c:520:13: warning: taking address of packed member 'update_tag' of class or structure 'power_sensor_data' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                          &power->vdn.update_tag);
                                           ^~~~~~~~~~~~~~~~~~~~~
   10 warnings generated.
--
>> drivers/pwm/pwm-cros-ec.c:68:33: warning: taking address of packed member 'msg' of class or structure '' may result in an unaligned pointer value [-Waddress-of-packed-member]
           struct cros_ec_command *msg = &buf.msg;
                                          ^~~~~~~
   drivers/pwm/pwm-cros-ec.c:96:33: warning: taking address of packed member 'msg' of class or structure '' may result in an unaligned pointer value [-Waddress-of-packed-member]
           struct cros_ec_command *msg = &buf.msg;
                                          ^~~~~~~
   2 warnings generated.
--
>> drivers/platform/chrome/cros_ec.c:123:41: warning: taking address of packed member 'msg' of class or structure '' may result in an unaligned pointer value [-Waddress-of-packed-member]
           ret = cros_ec_cmd_xfer_status(ec_dev, &buf.msg);
                                                  ^~~~~~~
   1 warning generated.
--
>> drivers/platform/chrome/cros_ec_proto.c:633:33: warning: taking address of packed member 'msg' of class or structure '' may result in an unaligned pointer value [-Waddress-of-packed-member]
           struct cros_ec_command *msg = &buf.msg;
                                          ^~~~~~~
   1 warning generated.
--
>> drivers/platform/chrome/cros_ec_debugfs.c:213:9: warning: taking address of packed member 'msg' of class or structure '' may result in an unaligned pointer value [-Waddress-of-packed-member]
           msg = &ec_buf.msg;
                  ^~~~~~~~~~
>> drivers/platform/chrome/cros_ec_debugfs.c:256:41: warning: taking address of packed member 'cmd' of class or structure '' may result in an unaligned pointer value [-Waddress-of-packed-member]
           ret = cros_ec_cmd_xfer_status(ec_dev, &msg.cmd);
                                                  ^~~~~~~
   drivers/platform/chrome/cros_ec_debugfs.c:282:41: warning: taking address of packed member 'cmd' of class or structure '' may result in an unaligned pointer value [-Waddress-of-packed-member]
           ret = cros_ec_cmd_xfer_status(ec_dev, &msg.cmd);
                                                  ^~~~~~~
   3 warnings generated.
--
>> drivers/rtc/rtc-cros-ec.c:45:42: warning: taking address of packed member 'msg' of class or structure '' may result in an unaligned pointer value [-Waddress-of-packed-member]
           ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
                                                   ^~~~~~~
   drivers/rtc/rtc-cros-ec.c:73:42: warning: taking address of packed member 'msg' of class or structure '' may result in an unaligned pointer value [-Waddress-of-packed-member]
           ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
                                                   ^~~~~~~
   2 warnings generated.
--
>> sound/firewire/fireworks/fireworks_command.c:222:16: warning: taking address of packed member 'flags' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->flags);
                         ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:223:16: warning: taking address of packed member 'guid_hi' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->guid_hi);
                         ^~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:224:16: warning: taking address of packed member 'guid_lo' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->guid_lo);
                         ^~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:225:16: warning: taking address of packed member 'type' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->type);
                         ^~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:226:16: warning: taking address of packed member 'version' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->version);
                         ^~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:227:16: warning: taking address of packed member 'supported_clocks' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->supported_clocks);
                         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:228:16: warning: taking address of packed member 'amdtp_rx_pcm_channels' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->amdtp_rx_pcm_channels);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:229:16: warning: taking address of packed member 'amdtp_tx_pcm_channels' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->amdtp_tx_pcm_channels);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:230:16: warning: taking address of packed member 'phys_out' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->phys_out);
                         ^~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:231:16: warning: taking address of packed member 'phys_in' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->phys_in);
                         ^~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:232:16: warning: taking address of packed member 'phys_out_grp_count' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->phys_out_grp_count);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:233:16: warning: taking address of packed member 'phys_in_grp_count' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->phys_in_grp_count);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:234:16: warning: taking address of packed member 'midi_out_ports' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->midi_out_ports);
                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:235:16: warning: taking address of packed member 'midi_in_ports' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->midi_in_ports);
                         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:236:16: warning: taking address of packed member 'max_sample_rate' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->max_sample_rate);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:237:16: warning: taking address of packed member 'min_sample_rate' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->min_sample_rate);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:238:16: warning: taking address of packed member 'dsp_version' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->dsp_version);
                         ^~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:239:16: warning: taking address of packed member 'arm_version' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->arm_version);
                         ^~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:240:16: warning: taking address of packed member 'mixer_playback_channels' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->mixer_playback_channels);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
>> sound/firewire/fireworks/fireworks_command.c:241:16: warning: taking address of packed member 'mixer_capture_channels' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->mixer_capture_channels);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
   sound/firewire/fireworks/fireworks_command.c:242:16: warning: taking address of packed member 'fpga_version' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->fpga_version);
                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
   sound/firewire/fireworks/fireworks_command.c:243:16: warning: taking address of packed member 'amdtp_rx_pcm_channels_2x' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->amdtp_rx_pcm_channels_2x);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
   sound/firewire/fireworks/fireworks_command.c:244:16: warning: taking address of packed member 'amdtp_tx_pcm_channels_2x' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->amdtp_tx_pcm_channels_2x);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
   sound/firewire/fireworks/fireworks_command.c:245:16: warning: taking address of packed member 'amdtp_rx_pcm_channels_4x' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->amdtp_rx_pcm_channels_4x);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
   sound/firewire/fireworks/fireworks_command.c:246:16: warning: taking address of packed member 'amdtp_tx_pcm_channels_4x' of class or structure 'snd_efw_hwinfo' may result in an unaligned pointer value [-Waddress-of-packed-member]
           be32_to_cpus(&hwinfo->amdtp_tx_pcm_channels_4x);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:119:22: note: expanded from macro 'be32_to_cpus'
   #define be32_to_cpus __be32_to_cpus
                        ^
   include/uapi/linux/byteorder/little_endian.h:101:38: note: expanded from macro '__be32_to_cpus'
   #define __be32_to_cpus(x) __swab32s((x))
                                        ^
   25 warnings generated.
..


vim +548 fs/hfsplus/super.c

^1da177e4c3f41 Linus Torvalds       2005-04-16  374  
^1da177e4c3f41 Linus Torvalds       2005-04-16  375  static int hfsplus_fill_super(struct super_block *sb, void *data, int silent)
^1da177e4c3f41 Linus Torvalds       2005-04-16  376  {
^1da177e4c3f41 Linus Torvalds       2005-04-16  377  	struct hfsplus_vh *vhdr;
^1da177e4c3f41 Linus Torvalds       2005-04-16  378  	struct hfsplus_sb_info *sbi;
^1da177e4c3f41 Linus Torvalds       2005-04-16  379  	hfsplus_cat_entry entry;
^1da177e4c3f41 Linus Torvalds       2005-04-16  380  	struct hfs_find_data fd;
635253915b3297 David Howells        2008-02-07  381  	struct inode *root, *inode;
^1da177e4c3f41 Linus Torvalds       2005-04-16  382  	struct qstr str;
^1da177e4c3f41 Linus Torvalds       2005-04-16  383  	struct nls_table *nls = NULL;
f1fcd9f0e96d12 Christoph Hellwig    2011-09-15  384  	u64 last_fs_block, last_fs_page;
c5b8d0bce05294 Christoph Hellwig    2011-02-02  385  	int err;
^1da177e4c3f41 Linus Torvalds       2005-04-16  386  
497d48bd27ec1c Namjae Jeon          2012-07-30  387  	err = -ENOMEM;
a5001a27802723 Wyatt Banks          2007-07-15  388  	sbi = kzalloc(sizeof(*sbi), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds       2005-04-16  389  	if (!sbi)
c5b8d0bce05294 Christoph Hellwig    2011-02-02  390  		goto out;
^1da177e4c3f41 Linus Torvalds       2005-04-16  391  
^1da177e4c3f41 Linus Torvalds       2005-04-16  392  	sb->s_fs_info = sbi;
40bf48afe92fce Christoph Hellwig    2010-10-01  393  	mutex_init(&sbi->alloc_mutex);
7ac9fb9c2a5096 Christoph Hellwig    2010-10-01  394  	mutex_init(&sbi->vh_mutex);
9e6c5829b07c9b Artem Bityutskiy     2012-07-12  395  	spin_lock_init(&sbi->work_lock);
9e6c5829b07c9b Artem Bityutskiy     2012-07-12  396  	INIT_DELAYED_WORK(&sbi->sync_work, delayed_sync_fs);
717dd80e999cdc Roman Zippel         2005-09-06  397  	hfsplus_fill_defaults(sbi);
c5b8d0bce05294 Christoph Hellwig    2011-02-02  398  
c5b8d0bce05294 Christoph Hellwig    2011-02-02  399  	err = -EINVAL;
717dd80e999cdc Roman Zippel         2005-09-06  400  	if (!hfsplus_parse_options(data, sbi)) {
d614267329f2be Joe Perches          2013-04-30  401  		pr_err("unable to parse mount options\n");
c5b8d0bce05294 Christoph Hellwig    2011-02-02  402  		goto out_unload_nls;
^1da177e4c3f41 Linus Torvalds       2005-04-16  403  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  404  
^1da177e4c3f41 Linus Torvalds       2005-04-16  405  	/* temporarily use utf8 to correctly find the hidden dir below */
^1da177e4c3f41 Linus Torvalds       2005-04-16  406  	nls = sbi->nls;
^1da177e4c3f41 Linus Torvalds       2005-04-16  407  	sbi->nls = load_nls("utf8");
bd6a59b22fd3bd Joshua Kwan          2006-01-06  408  	if (!sbi->nls) {
d614267329f2be Joe Perches          2013-04-30  409  		pr_err("unable to load nls for utf8\n");
c5b8d0bce05294 Christoph Hellwig    2011-02-02  410  		goto out_unload_nls;
^1da177e4c3f41 Linus Torvalds       2005-04-16  411  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  412  
^1da177e4c3f41 Linus Torvalds       2005-04-16  413  	/* Grab the volume header */
^1da177e4c3f41 Linus Torvalds       2005-04-16  414  	if (hfsplus_read_wrapper(sb)) {
^1da177e4c3f41 Linus Torvalds       2005-04-16  415  		if (!silent)
d614267329f2be Joe Perches          2013-04-30  416  			pr_warn("unable to find HFS+ superblock\n");
c5b8d0bce05294 Christoph Hellwig    2011-02-02  417  		goto out_unload_nls;
^1da177e4c3f41 Linus Torvalds       2005-04-16  418  	}
dd73a01a30d729 Christoph Hellwig    2010-10-01  419  	vhdr = sbi->s_vhdr;
^1da177e4c3f41 Linus Torvalds       2005-04-16  420  
^1da177e4c3f41 Linus Torvalds       2005-04-16  421  	/* Copy parts of the volume header into the superblock */
2179d372d9f8b5 David Elliott        2006-01-18  422  	sb->s_magic = HFSPLUS_VOLHEAD_SIG;
2179d372d9f8b5 David Elliott        2006-01-18  423  	if (be16_to_cpu(vhdr->version) < HFSPLUS_MIN_VERSION ||
2179d372d9f8b5 David Elliott        2006-01-18  424  	    be16_to_cpu(vhdr->version) > HFSPLUS_CURRENT_VERSION) {
d614267329f2be Joe Perches          2013-04-30  425  		pr_err("wrong filesystem version\n");
c5b8d0bce05294 Christoph Hellwig    2011-02-02  426  		goto out_free_vhdr;
^1da177e4c3f41 Linus Torvalds       2005-04-16  427  	}
dd73a01a30d729 Christoph Hellwig    2010-10-01  428  	sbi->total_blocks = be32_to_cpu(vhdr->total_blocks);
dd73a01a30d729 Christoph Hellwig    2010-10-01  429  	sbi->free_blocks = be32_to_cpu(vhdr->free_blocks);
dd73a01a30d729 Christoph Hellwig    2010-10-01  430  	sbi->next_cnid = be32_to_cpu(vhdr->next_cnid);
dd73a01a30d729 Christoph Hellwig    2010-10-01  431  	sbi->file_count = be32_to_cpu(vhdr->file_count);
dd73a01a30d729 Christoph Hellwig    2010-10-01  432  	sbi->folder_count = be32_to_cpu(vhdr->folder_count);
dd73a01a30d729 Christoph Hellwig    2010-10-01  433  	sbi->data_clump_blocks =
dd73a01a30d729 Christoph Hellwig    2010-10-01  434  		be32_to_cpu(vhdr->data_clump_sz) >> sbi->alloc_blksz_shift;
dd73a01a30d729 Christoph Hellwig    2010-10-01  435  	if (!sbi->data_clump_blocks)
dd73a01a30d729 Christoph Hellwig    2010-10-01  436  		sbi->data_clump_blocks = 1;
dd73a01a30d729 Christoph Hellwig    2010-10-01  437  	sbi->rsrc_clump_blocks =
dd73a01a30d729 Christoph Hellwig    2010-10-01  438  		be32_to_cpu(vhdr->rsrc_clump_sz) >> sbi->alloc_blksz_shift;
dd73a01a30d729 Christoph Hellwig    2010-10-01  439  	if (!sbi->rsrc_clump_blocks)
dd73a01a30d729 Christoph Hellwig    2010-10-01  440  		sbi->rsrc_clump_blocks = 1;
^1da177e4c3f41 Linus Torvalds       2005-04-16  441  
f1fcd9f0e96d12 Christoph Hellwig    2011-09-15  442  	err = -EFBIG;
f1fcd9f0e96d12 Christoph Hellwig    2011-09-15  443  	last_fs_block = sbi->total_blocks - 1;
f1fcd9f0e96d12 Christoph Hellwig    2011-09-15  444  	last_fs_page = (last_fs_block << sbi->alloc_blksz_shift) >>
09cbfeaf1a5a67 Kirill A. Shutemov   2016-04-01  445  			PAGE_SHIFT;
f1fcd9f0e96d12 Christoph Hellwig    2011-09-15  446  
f1fcd9f0e96d12 Christoph Hellwig    2011-09-15  447  	if ((last_fs_block > (sector_t)(~0ULL) >> (sbi->alloc_blksz_shift - 9)) ||
f1fcd9f0e96d12 Christoph Hellwig    2011-09-15  448  	    (last_fs_page > (pgoff_t)(~0ULL))) {
d614267329f2be Joe Perches          2013-04-30  449  		pr_err("filesystem size too large\n");
c6d5f5fa658f25 Christoph Hellwig    2011-02-16  450  		goto out_free_vhdr;
c6d5f5fa658f25 Christoph Hellwig    2011-02-16  451  	}
c6d5f5fa658f25 Christoph Hellwig    2011-02-16  452  
^1da177e4c3f41 Linus Torvalds       2005-04-16  453  	/* Set up operations so we can load metadata */
^1da177e4c3f41 Linus Torvalds       2005-04-16  454  	sb->s_op = &hfsplus_sops;
^1da177e4c3f41 Linus Torvalds       2005-04-16  455  	sb->s_maxbytes = MAX_LFS_FILESIZE;
^1da177e4c3f41 Linus Torvalds       2005-04-16  456  
^1da177e4c3f41 Linus Torvalds       2005-04-16  457  	if (!(vhdr->attributes & cpu_to_be32(HFSPLUS_VOL_UNMNT))) {
d614267329f2be Joe Perches          2013-04-30  458  		pr_warn("Filesystem was not cleanly unmounted, running fsck.hfsplus is recommended.  mounting read-only.\n");
1751e8a6cb935e Linus Torvalds       2017-11-27  459  		sb->s_flags |= SB_RDONLY;
84adede31267af Christoph Hellwig    2010-10-01  460  	} else if (test_and_clear_bit(HFSPLUS_SB_FORCE, &sbi->flags)) {
b0b623c3b22d57 Roman Zippel         2005-11-29  461  		/* nothing */
^1da177e4c3f41 Linus Torvalds       2005-04-16  462  	} else if (vhdr->attributes & cpu_to_be32(HFSPLUS_VOL_SOFTLOCK)) {
d614267329f2be Joe Perches          2013-04-30  463  		pr_warn("Filesystem is marked locked, mounting read-only.\n");
1751e8a6cb935e Linus Torvalds       2017-11-27  464  		sb->s_flags |= SB_RDONLY;
2753cc281c9a0e Anton Salikhmetov    2010-12-16  465  	} else if ((vhdr->attributes & cpu_to_be32(HFSPLUS_VOL_JOURNALED)) &&
bc98a42c1f7d0f David Howells        2017-07-17  466  			!sb_rdonly(sb)) {
d614267329f2be Joe Perches          2013-04-30  467  		pr_warn("write access to a journaled filesystem is not supported, use the force option at your own risk, mounting read-only.\n");
1751e8a6cb935e Linus Torvalds       2017-11-27  468  		sb->s_flags |= SB_RDONLY;
^1da177e4c3f41 Linus Torvalds       2005-04-16  469  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  470  
c6d5f5fa658f25 Christoph Hellwig    2011-02-16  471  	err = -EINVAL;
c6d5f5fa658f25 Christoph Hellwig    2011-02-16  472  
^1da177e4c3f41 Linus Torvalds       2005-04-16  473  	/* Load metadata objects (B*Trees) */
dd73a01a30d729 Christoph Hellwig    2010-10-01  474  	sbi->ext_tree = hfs_btree_open(sb, HFSPLUS_EXT_CNID);
dd73a01a30d729 Christoph Hellwig    2010-10-01  475  	if (!sbi->ext_tree) {
d614267329f2be Joe Perches          2013-04-30  476  		pr_err("failed to load extents file\n");
c5b8d0bce05294 Christoph Hellwig    2011-02-02  477  		goto out_free_vhdr;
^1da177e4c3f41 Linus Torvalds       2005-04-16  478  	}
dd73a01a30d729 Christoph Hellwig    2010-10-01  479  	sbi->cat_tree = hfs_btree_open(sb, HFSPLUS_CAT_CNID);
dd73a01a30d729 Christoph Hellwig    2010-10-01  480  	if (!sbi->cat_tree) {
d614267329f2be Joe Perches          2013-04-30  481  		pr_err("failed to load catalog file\n");
c5b8d0bce05294 Christoph Hellwig    2011-02-02  482  		goto out_close_ext_tree;
^1da177e4c3f41 Linus Torvalds       2005-04-16  483  	}
95e0d7dbb9b28a Vyacheslav Dubeyko   2013-11-12  484  	atomic_set(&sbi->attr_tree_state, HFSPLUS_EMPTY_ATTR_TREE);
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  485  	if (vhdr->attr_file.total_blocks != 0) {
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  486  		sbi->attr_tree = hfs_btree_open(sb, HFSPLUS_ATTR_CNID);
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  487  		if (!sbi->attr_tree) {
d614267329f2be Joe Perches          2013-04-30  488  			pr_err("failed to load attributes file\n");
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  489  			goto out_close_cat_tree;
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  490  		}
95e0d7dbb9b28a Vyacheslav Dubeyko   2013-11-12  491  		atomic_set(&sbi->attr_tree_state, HFSPLUS_VALID_ATTR_TREE);
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  492  	}
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  493  	sb->s_xattr = hfsplus_xattr_handlers;
^1da177e4c3f41 Linus Torvalds       2005-04-16  494  
635253915b3297 David Howells        2008-02-07  495  	inode = hfsplus_iget(sb, HFSPLUS_ALLOC_CNID);
635253915b3297 David Howells        2008-02-07  496  	if (IS_ERR(inode)) {
d614267329f2be Joe Perches          2013-04-30  497  		pr_err("failed to load allocation file\n");
635253915b3297 David Howells        2008-02-07  498  		err = PTR_ERR(inode);
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  499  		goto out_close_attr_tree;
^1da177e4c3f41 Linus Torvalds       2005-04-16  500  	}
dd73a01a30d729 Christoph Hellwig    2010-10-01  501  	sbi->alloc_file = inode;
^1da177e4c3f41 Linus Torvalds       2005-04-16  502  
^1da177e4c3f41 Linus Torvalds       2005-04-16  503  	/* Load the root directory */
635253915b3297 David Howells        2008-02-07  504  	root = hfsplus_iget(sb, HFSPLUS_ROOT_CNID);
635253915b3297 David Howells        2008-02-07  505  	if (IS_ERR(root)) {
d614267329f2be Joe Perches          2013-04-30  506  		pr_err("failed to load root directory\n");
635253915b3297 David Howells        2008-02-07  507  		err = PTR_ERR(root);
c5b8d0bce05294 Christoph Hellwig    2011-02-02  508  		goto out_put_alloc_file;
^1da177e4c3f41 Linus Torvalds       2005-04-16  509  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  510  
68acb8e60d672c Al Viro              2012-02-12  511  	sb->s_d_op = &hfsplus_dentry_operations;
68acb8e60d672c Al Viro              2012-02-12  512  	sb->s_root = d_make_root(root);
68acb8e60d672c Al Viro              2012-02-12  513  	if (!sb->s_root) {
68acb8e60d672c Al Viro              2012-02-12  514  		err = -ENOMEM;
68acb8e60d672c Al Viro              2012-02-12  515  		goto out_put_alloc_file;
68acb8e60d672c Al Viro              2012-02-12  516  	}
68acb8e60d672c Al Viro              2012-02-12  517  
^1da177e4c3f41 Linus Torvalds       2005-04-16  518  	str.len = sizeof(HFSP_HIDDENDIR_NAME) - 1;
^1da177e4c3f41 Linus Torvalds       2005-04-16  519  	str.name = HFSP_HIDDENDIR_NAME;
5bd9d99d107c56 Alexey Khoroshilov   2011-07-06  520  	err = hfs_find_init(sbi->cat_tree, &fd);
5bd9d99d107c56 Alexey Khoroshilov   2011-07-06  521  	if (err)
5bd9d99d107c56 Alexey Khoroshilov   2011-07-06  522  		goto out_put_root;
89ac9b4d3d1a04 Sougata Santra       2014-12-18  523  	err = hfsplus_cat_build_key(sb, fd.search_key, HFSPLUS_ROOT_CNID, &str);
89ac9b4d3d1a04 Sougata Santra       2014-12-18  524  	if (unlikely(err < 0))
89ac9b4d3d1a04 Sougata Santra       2014-12-18  525  		goto out_put_root;
^1da177e4c3f41 Linus Torvalds       2005-04-16  526  	if (!hfs_brec_read(&fd, &entry, sizeof(entry))) {
^1da177e4c3f41 Linus Torvalds       2005-04-16  527  		hfs_find_exit(&fd);
7464726cb59988 Tetsuo Handa         2018-08-21  528  		if (entry.type != cpu_to_be16(HFSPLUS_FOLDER)) {
7464726cb59988 Tetsuo Handa         2018-08-21  529  			err = -EINVAL;
c5b8d0bce05294 Christoph Hellwig    2011-02-02  530  			goto out_put_root;
7464726cb59988 Tetsuo Handa         2018-08-21  531  		}
635253915b3297 David Howells        2008-02-07  532  		inode = hfsplus_iget(sb, be32_to_cpu(entry.folder.id));
635253915b3297 David Howells        2008-02-07  533  		if (IS_ERR(inode)) {
635253915b3297 David Howells        2008-02-07  534  			err = PTR_ERR(inode);
c5b8d0bce05294 Christoph Hellwig    2011-02-02  535  			goto out_put_root;
635253915b3297 David Howells        2008-02-07  536  		}
dd73a01a30d729 Christoph Hellwig    2010-10-01  537  		sbi->hidden_dir = inode;
^1da177e4c3f41 Linus Torvalds       2005-04-16  538  	} else
^1da177e4c3f41 Linus Torvalds       2005-04-16  539  		hfs_find_exit(&fd);
^1da177e4c3f41 Linus Torvalds       2005-04-16  540  
bc98a42c1f7d0f David Howells        2017-07-17  541  	if (!sb_rdonly(sb)) {
c5b8d0bce05294 Christoph Hellwig    2011-02-02  542  		/*
c5b8d0bce05294 Christoph Hellwig    2011-02-02  543  		 * H+LX == hfsplusutils, H+Lx == this driver, H+lx is unused
^1da177e4c3f41 Linus Torvalds       2005-04-16  544  		 * all three are registered with Apple for our use
^1da177e4c3f41 Linus Torvalds       2005-04-16  545  		 */
^1da177e4c3f41 Linus Torvalds       2005-04-16  546  		vhdr->last_mount_vers = cpu_to_be32(HFSP_MOUNT_VERSION);
^1da177e4c3f41 Linus Torvalds       2005-04-16  547  		vhdr->modify_date = hfsp_now2mt();
20c79e785ae3f8 Marcin Slusarz       2008-04-30 @548  		be32_add_cpu(&vhdr->write_count, 1);
^1da177e4c3f41 Linus Torvalds       2005-04-16  549  		vhdr->attributes &= cpu_to_be32(~HFSPLUS_VOL_UNMNT);
^1da177e4c3f41 Linus Torvalds       2005-04-16  550  		vhdr->attributes |= cpu_to_be32(HFSPLUS_VOL_INCNSTNT);
3b5ce8ae31e3c6 Christoph Hellwig    2010-11-23  551  		hfsplus_sync_fs(sb, 1);
^1da177e4c3f41 Linus Torvalds       2005-04-16  552  
dd73a01a30d729 Christoph Hellwig    2010-10-01  553  		if (!sbi->hidden_dir) {
7ac9fb9c2a5096 Christoph Hellwig    2010-10-01  554  			mutex_lock(&sbi->vh_mutex);
b0cd38c7f54c91 Ernesto A. Fernandez 2018-02-06  555  			sbi->hidden_dir = hfsplus_new_inode(sb, root, S_IFDIR);
b3f2a92447b844 Al Viro              2012-01-10  556  			if (!sbi->hidden_dir) {
7ac9fb9c2a5096 Christoph Hellwig    2010-10-01  557  				mutex_unlock(&sbi->vh_mutex);
b3f2a92447b844 Al Viro              2012-01-10  558  				err = -ENOMEM;
b3f2a92447b844 Al Viro              2012-01-10  559  				goto out_put_root;
b3f2a92447b844 Al Viro              2012-01-10  560  			}
b3f2a92447b844 Al Viro              2012-01-10  561  			err = hfsplus_create_cat(sbi->hidden_dir->i_ino, root,
b3f2a92447b844 Al Viro              2012-01-10  562  						 &str, sbi->hidden_dir);
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  563  			if (err) {
b3f2a92447b844 Al Viro              2012-01-10  564  				mutex_unlock(&sbi->vh_mutex);
b3f2a92447b844 Al Viro              2012-01-10  565  				goto out_put_hidden_dir;
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  566  			}
7ac9fb9c2a5096 Christoph Hellwig    2010-10-01  567  
f168d9fd634a46 Ernesto A. Fernández 2018-08-21  568  			err = hfsplus_init_security(sbi->hidden_dir,
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  569  							root, &str);
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  570  			if (err == -EOPNOTSUPP)
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  571  				err = 0; /* Operation is not supported. */
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  572  			else if (err) {
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  573  				/*
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  574  				 * Try to delete anyway without
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  575  				 * error analysis.
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  576  				 */
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  577  				hfsplus_delete_cat(sbi->hidden_dir->i_ino,
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  578  							root, &str);
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  579  				mutex_unlock(&sbi->vh_mutex);
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  580  				goto out_put_hidden_dir;
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  581  			}
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  582  
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  583  			mutex_unlock(&sbi->vh_mutex);
c5b8d0bce05294 Christoph Hellwig    2011-02-02  584  			hfsplus_mark_inode_dirty(sbi->hidden_dir,
c5b8d0bce05294 Christoph Hellwig    2011-02-02  585  						 HFSPLUS_I_CAT_DIRTY);
^1da177e4c3f41 Linus Torvalds       2005-04-16  586  		}
c5b8d0bce05294 Christoph Hellwig    2011-02-02  587  	}
c5b8d0bce05294 Christoph Hellwig    2011-02-02  588  
^1da177e4c3f41 Linus Torvalds       2005-04-16  589  	unload_nls(sbi->nls);
^1da177e4c3f41 Linus Torvalds       2005-04-16  590  	sbi->nls = nls;
^1da177e4c3f41 Linus Torvalds       2005-04-16  591  	return 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  592  
c5b8d0bce05294 Christoph Hellwig    2011-02-02  593  out_put_hidden_dir:
66072c29328717 Tetsuo Handa         2018-05-18  594  	cancel_delayed_work_sync(&sbi->sync_work);
c5b8d0bce05294 Christoph Hellwig    2011-02-02  595  	iput(sbi->hidden_dir);
c5b8d0bce05294 Christoph Hellwig    2011-02-02  596  out_put_root:
68acb8e60d672c Al Viro              2012-02-12  597  	dput(sb->s_root);
68acb8e60d672c Al Viro              2012-02-12  598  	sb->s_root = NULL;
c5b8d0bce05294 Christoph Hellwig    2011-02-02  599  out_put_alloc_file:
c5b8d0bce05294 Christoph Hellwig    2011-02-02  600  	iput(sbi->alloc_file);
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  601  out_close_attr_tree:
324ef39a8a4f69 Vyacheslav Dubeyko   2013-02-27  602  	hfs_btree_close(sbi->attr_tree);
c5b8d0bce05294 Christoph Hellwig    2011-02-02  603  out_close_cat_tree:
c5b8d0bce05294 Christoph Hellwig    2011-02-02  604  	hfs_btree_close(sbi->cat_tree);
c5b8d0bce05294 Christoph Hellwig    2011-02-02  605  out_close_ext_tree:
c5b8d0bce05294 Christoph Hellwig    2011-02-02  606  	hfs_btree_close(sbi->ext_tree);
c5b8d0bce05294 Christoph Hellwig    2011-02-02  607  out_free_vhdr:
f588c960fcaa6f Seth Forshee         2011-09-15  608  	kfree(sbi->s_vhdr_buf);
f588c960fcaa6f Seth Forshee         2011-09-15  609  	kfree(sbi->s_backup_vhdr_buf);
c5b8d0bce05294 Christoph Hellwig    2011-02-02  610  out_unload_nls:
c5b8d0bce05294 Christoph Hellwig    2011-02-02  611  	unload_nls(sbi->nls);
^1da177e4c3f41 Linus Torvalds       2005-04-16  612  	unload_nls(nls);
c5b8d0bce05294 Christoph Hellwig    2011-02-02  613  	kfree(sbi);
c5b8d0bce05294 Christoph Hellwig    2011-02-02  614  out:
^1da177e4c3f41 Linus Torvalds       2005-04-16  615  	return err;
^1da177e4c3f41 Linus Torvalds       2005-04-16  616  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  617  

:::::: The code at line 548 was first introduced by commit
:::::: 20c79e785ae3f813310261dde81b29ab0c3e28b4 hfs/hfsplus: be*_add_cpu conversion

:::::: TO: Marcin Slusarz <marcin.slusarz@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--uuS0SezJWtn3Kjzw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/mips 5.9.0-rc1 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="clang version 16.0.0 (git://gitmirror/llvm_project 791a7ae1ba3efd6bca96338e10ffde557ba83920)"
CONFIG_GCC_VERSION=0
CONFIG_LD_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_LD_IS_LLD=y
CONFIG_CLANG_VERSION=160000
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_KERNEL_ZSTD=y
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SWAP is not set
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_WATCH_QUEUE=y
# CONFIG_CROSS_MEMORY_ATTACH is not set
CONFIG_USELIB=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
CONFIG_HANDLE_DOMAIN_IRQ=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
# end of IRQ subsystem

CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CMOS_UPDATE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
# CONFIG_NO_HZ_FULL is not set
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_FORCE=y
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
# CONFIG_TICK_CPU_ACCOUNTING is not set
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_PSI=y
CONFIG_PSI_DEFAULT_DISABLED=y
# end of CPU/Task time and stats accounting

# CONFIG_CPU_ISOLATION is not set

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
# end of RCU Subsystem

# CONFIG_IKCONFIG is not set
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=17
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_GENERIC_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_HAS_INT128=y
# CONFIG_CGROUPS is not set
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
# CONFIG_IPC_NS is not set
# CONFIG_USER_NS is not set
CONFIG_PID_NS=y
CONFIG_CHECKPOINT_RESTORE=y
# CONFIG_SCHED_AUTOGROUP is not set
CONFIG_SYSFS_DEPRECATED=y
# CONFIG_SYSFS_DEPRECATED_V2 is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
# CONFIG_RD_GZIP is not set
CONFIG_RD_BZIP2=y
# CONFIG_RD_LZMA is not set
# CONFIG_RD_XZ is not set
CONFIG_RD_LZO=y
# CONFIG_RD_LZ4 is not set
# CONFIG_RD_ZSTD is not set
CONFIG_BOOT_CONFIG=y
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION=y
CONFIG_SYSCTL=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_BPF=y
# CONFIG_EXPERT is not set
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_PRINTK_NMI=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_BPF_SYSCALL=y
CONFIG_USERFAULTFD=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# end of Kernel Performance Events And Counters

CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLAB_MERGE_DEFAULT is not set
# CONFIG_SLAB_FREELIST_RANDOM is not set
CONFIG_SLAB_FREELIST_HARDENED=y
CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
CONFIG_SLUB_CPU_PARTIAL=y
CONFIG_PROFILING=y
# end of General setup

CONFIG_MIPS=y

#
# Machine selection
#
# CONFIG_MIPS_GENERIC_KERNEL is not set
# CONFIG_MIPS_ALCHEMY is not set
# CONFIG_AR7 is not set
# CONFIG_ATH25 is not set
# CONFIG_ATH79 is not set
# CONFIG_BMIPS_GENERIC is not set
# CONFIG_BCM47XX is not set
# CONFIG_BCM63XX is not set
# CONFIG_MIPS_COBALT is not set
# CONFIG_MACH_DECSTATION is not set
# CONFIG_MACH_JAZZ is not set
# CONFIG_MACH_INGENIC is not set
# CONFIG_LANTIQ is not set
# CONFIG_MACH_LOONGSON32 is not set
# CONFIG_MACH_LOONGSON2EF is not set
CONFIG_MACH_LOONGSON64=y
# CONFIG_MACH_PISTACHIO is not set
# CONFIG_MIPS_MALTA is not set
# CONFIG_MACH_PIC32 is not set
# CONFIG_MACH_VR41XX is not set
# CONFIG_RALINK is not set
# CONFIG_SGI_IP22 is not set
# CONFIG_SGI_IP27 is not set
# CONFIG_SGI_IP28 is not set
# CONFIG_SGI_IP30 is not set
# CONFIG_SGI_IP32 is not set
# CONFIG_SIBYTE_CRHINE is not set
# CONFIG_SIBYTE_CARMEL is not set
# CONFIG_SIBYTE_CRHONE is not set
# CONFIG_SIBYTE_RHONE is not set
# CONFIG_SIBYTE_SWARM is not set
# CONFIG_SIBYTE_LITTLESUR is not set
# CONFIG_SIBYTE_SENTOSA is not set
# CONFIG_SIBYTE_BIGSUR is not set
# CONFIG_SNI_RM is not set
# CONFIG_MACH_TX39XX is not set
# CONFIG_MACH_TX49XX is not set
# CONFIG_MIKROTIK_RB532 is not set
# CONFIG_CAVIUM_OCTEON_SOC is not set
# CONFIG_NLM_XLR_BOARD is not set
# CONFIG_NLM_XLP_BOARD is not set
# end of Machine selection

CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_SCHED_OMIT_FRAME_POINTER=y
CONFIG_CEVT_R4K=y
CONFIG_CSRC_R4K=y
CONFIG_MIPS_CLOCK_VSYSCALL=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_SYS_HAS_EARLY_PRINTK=y
CONFIG_SYS_SUPPORTS_HOTPLUG_CPU=y
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_ISA_DMA_SUPPORT_BROKEN=y
CONFIG_ISA_DMA_API=y
CONFIG_CPU_LITTLE_ENDIAN=y
CONFIG_SYS_SUPPORTS_LITTLE_ENDIAN=y
CONFIG_SYS_SUPPORTS_HUGETLBFS=y
CONFIG_MIPS_HUGE_TLB_SUPPORT=y
CONFIG_NO_EXCEPT_FILL=y
CONFIG_MIPS_SPRAM=y
CONFIG_BOOT_ELF32=y
CONFIG_MIPS_L1_CACHE_SHIFT_6=y
CONFIG_MIPS_L1_CACHE_SHIFT=6

#
# CPU selection
#
CONFIG_CPU_LOONGSON64=y
# CONFIG_LOONGSON3_ENHANCEMENT is not set
# CONFIG_CPU_LOONGSON3_WORKAROUNDS is not set
CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION=y
CONFIG_SYS_SUPPORTS_ZBOOT=y
CONFIG_SYS_HAS_CPU_LOONGSON64=y
CONFIG_WEAK_ORDERING=y
CONFIG_WEAK_REORDERING_BEYOND_LLSC=y
# end of CPU selection

CONFIG_CPU_MIPSR2=y
CONFIG_TARGET_ISA_REV=2
CONFIG_SYS_SUPPORTS_64BIT_KERNEL=y
CONFIG_CPU_SUPPORTS_64BIT_KERNEL=y
CONFIG_CPU_SUPPORTS_CPUFREQ=y
CONFIG_CPU_SUPPORTS_HUGEPAGES=y
CONFIG_MIPS_PGD_C0_CONTEXT=y
CONFIG_HARDWARE_WATCHPOINTS=y

#
# Kernel type
#
CONFIG_64BIT=y
# CONFIG_MIPS_VA_BITS_48 is not set
CONFIG_PAGE_SIZE_16KB=y
# CONFIG_PAGE_SIZE_64KB is not set
CONFIG_FORCE_MAX_ZONEORDER=12
CONFIG_BOARD_SCACHE=y
CONFIG_CPU_HAS_PREFETCH=y
CONFIG_CPU_GENERIC_DUMP_TLB=y
CONFIG_MIPS_FP_SUPPORT=y
CONFIG_CPU_R4K_FPU=y
CONFIG_CPU_R4K_CACHE_TLB=y
CONFIG_CPU_NEEDS_NO_SMARTMIPS_OR_MICROMIPS=y
CONFIG_CPU_HAS_MSA=y
CONFIG_CPU_HAS_WB=y
CONFIG_CPU_DIEI_BROKEN=y
CONFIG_CPU_HAS_RIXI=y
CONFIG_CPU_MIPSR2_IRQ_VI=y
CONFIG_CPU_HAS_SYNC=y
CONFIG_MIPS_ASID_SHIFT=0
CONFIG_MIPS_ASID_BITS=0
CONFIG_MIPS_ASID_BITS_VARIABLE=y
CONFIG_CPU_SUPPORTS_HIGHMEM=y
CONFIG_SYS_SUPPORTS_HIGHMEM=y
CONFIG_CPU_SUPPORTS_MSA=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_NUMA=y
CONFIG_SYS_SUPPORTS_NUMA=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NODES_SHIFT=6
CONFIG_HW_PERF_EVENTS=y
CONFIG_DMI=y
CONFIG_SMP=y
CONFIG_HOTPLUG_CPU=y
CONFIG_SYS_SUPPORTS_SMP=y
CONFIG_NR_CPUS_DEFAULT_64=y
CONFIG_NR_CPUS=64
CONFIG_MIPS_NR_CPU_NR_MAP=64
# CONFIG_HZ_24 is not set
# CONFIG_HZ_48 is not set
CONFIG_HZ_100=y
# CONFIG_HZ_128 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_256 is not set
# CONFIG_HZ_1000 is not set
# CONFIG_HZ_1024 is not set
CONFIG_SYS_SUPPORTS_ARBIT_HZ=y
CONFIG_HZ=100
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
# CONFIG_CRASH_DUMP is not set
# CONFIG_SECCOMP is not set
CONFIG_USE_OF=y
CONFIG_BUILTIN_DTB=y
# CONFIG_MIPS_NO_APPENDED_DTB is not set
# CONFIG_MIPS_ELF_APPENDED_DTB is not set
CONFIG_MIPS_RAW_APPENDED_DTB=y
CONFIG_MIPS_CMDLINE_FROM_DTB=y
# CONFIG_MIPS_CMDLINE_DTB_EXTEND is not set
# CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER is not set
# end of Kernel type

CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_PGTABLE_LEVELS=3

#
# Bus options (PCI, PCMCIA, EISA, ISA, TC)
#
CONFIG_PCI_DRIVERS_GENERIC=y
CONFIG_ISA=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=12
CONFIG_ARCH_MMAP_RND_BITS_MAX=18
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=15
CONFIG_ZONE_DMA32=y
# end of Bus options (PCI, PCMCIA, EISA, ISA, TC)

CONFIG_MIPS32_COMPAT=y
CONFIG_COMPAT=y
CONFIG_SYSVIPC_COMPAT=y
# CONFIG_MIPS32_O32 is not set
CONFIG_MIPS32_N32=y
CONFIG_BINFMT_ELF32=y

#
# Power management options
#
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_CLK=y
CONFIG_PM_GENERIC_DOMAINS=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_PM_GENERIC_DOMAINS_SLEEP=y
CONFIG_PM_GENERIC_DOMAINS_OF=y
# end of Power management options

#
# CPU Power Management
#

#
# CPU Idle
#
# CONFIG_CPU_IDLE is not set
# end of CPU Idle
# end of CPU Power Management

#
# Firmware Drivers
#
CONFIG_ARM_SCMI_PROTOCOL=y
CONFIG_ARM_SCMI_POWER_DOMAIN=y
# CONFIG_ARM_SCPI_PROTOCOL is not set
CONFIG_ARM_SCPI_POWER_DOMAIN=y
# CONFIG_DMIID is not set
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
CONFIG_TURRIS_MOX_RWTM=y
CONFIG_BCM47XX_NVRAM=y
CONFIG_BCM47XX_SPROM=y
CONFIG_TEE_BNXT_FW=y
# CONFIG_GOOGLE_FIRMWARE is not set
CONFIG_EFI_EARLYCON=y
# CONFIG_IMX_DSP is not set
CONFIG_IMX_SCU=y
CONFIG_IMX_SCU_PD=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_HAVE_KVM=y
# CONFIG_VIRTUALIZATION is not set
CONFIG_MIPS_LD_CAN_LINK_VDSO=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
# CONFIG_OPROFILE is not set
CONFIG_HAVE_OPROFILE=y
# CONFIG_JUMP_LABEL is not set
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_HAVE_CONTEXT_TRACKING=y
CONFIG_HAVE_TIF_NOHZ=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=12
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT=y
CONFIG_ISA_BUS_API=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_ARCH_HAS_PHYS_TO_DMA=y
CONFIG_HAVE_ARCH_COMPILER_H=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
CONFIG_LOCK_EVENT_COUNTS=y
CONFIG_HAVE_SPARSE_SYSCALL_NR=y

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
# CONFIG_MODULES is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLK_SCSI_REQUEST=y
CONFIG_BLK_DEV_BSG=y
CONFIG_BLK_DEV_BSGLIB=y
# CONFIG_BLK_DEV_INTEGRITY is not set
# CONFIG_BLK_DEV_ZONED is not set
# CONFIG_BLK_CMDLINE_PARSER is not set
CONFIG_BLK_WBT=y
# CONFIG_BLK_WBT_MQ is not set
CONFIG_BLK_DEBUG_FS=y
# CONFIG_BLK_SED_OPAL is not set
CONFIG_BLK_INLINE_ENCRYPTION=y
# CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_AMIGA_PARTITION=y
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLOCK_COMPAT=y
CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
# CONFIG_MQ_IOSCHED_DEADLINE is not set
CONFIG_MQ_IOSCHED_KYBER=y
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ARCH_BINFMT_ELF_STATE=y
CONFIG_ELFCORE=y
# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
# CONFIG_BINFMT_SCRIPT is not set
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SPARSEMEM=y
CONFIG_NEED_MULTIPLE_NODES=y
CONFIG_SPARSEMEM_STATIC=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_COMPACTION=y
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_VIRT_TO_BUS=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_TRANSPARENT_HUGEPAGE=y
# CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
# CONFIG_CLEANCACHE is not set
CONFIG_CMA=y
CONFIG_CMA_DEBUGFS=y
CONFIG_CMA_AREAS=19
# CONFIG_ZPOOL is not set
# CONFIG_ZBUD is not set
CONFIG_ZSMALLOC=y
# CONFIG_ZSMALLOC_PGTABLE_MAPPING is not set
CONFIG_ZSMALLOC_STAT=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_FRAME_VECTOR=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_BENCHMARK is not set
CONFIG_READ_ONLY_THP_FOR_FS=y
CONFIG_ARCH_HAS_PTE_SPECIAL=y
# end of Memory Management options

# CONFIG_NET is not set
CONFIG_HAVE_EBPF_JIT=y

#
# Device Drivers
#
CONFIG_HAVE_PCI=y
CONFIG_FORCE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCI_DOMAINS_GENERIC=y
CONFIG_PCIEPORTBUS=y
# CONFIG_PCIEAER is not set
CONFIG_PCIEASPM=y
# CONFIG_PCIEASPM_DEFAULT is not set
CONFIG_PCIEASPM_POWERSAVE=y
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
# CONFIG_PCIE_PTM is not set
# CONFIG_PCIE_BW is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_MSI_IRQ_DOMAIN=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
# CONFIG_PCI_STUB is not set
# CONFIG_PCI_PF_STUB is not set
CONFIG_PCI_ATS=y
CONFIG_PCI_ECAM=y
CONFIG_PCI_BRIDGE_EMUL=y
CONFIG_PCI_IOV=y
# CONFIG_PCI_PRI is not set
CONFIG_PCI_PASID=y
CONFIG_PCI_LABEL=y
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#
CONFIG_PCI_AARDVARK=y
# CONFIG_PCIE_XILINX_NWL is not set
CONFIG_PCI_FTPCI100=y
CONFIG_PCI_TEGRA=y
# CONFIG_PCIE_RCAR is not set
# CONFIG_PCIE_RCAR_HOST is not set
CONFIG_PCIE_RCAR_EP=y
CONFIG_PCI_HOST_COMMON=y
CONFIG_PCI_HOST_GENERIC=y
# CONFIG_PCIE_XILINX is not set
# CONFIG_PCIE_XILINX_CPM is not set
CONFIG_PCI_XGENE=y
CONFIG_PCI_XGENE_MSI=y
CONFIG_PCI_V3_SEMI=y
CONFIG_PCI_VERSATILE=y
# CONFIG_PCIE_ALTERA is not set
CONFIG_PCI_HOST_THUNDER_PEM=y
CONFIG_PCI_HOST_THUNDER_ECAM=y
CONFIG_PCIE_ROCKCHIP=y
CONFIG_PCIE_ROCKCHIP_HOST=y
CONFIG_PCIE_ROCKCHIP_EP=y
# CONFIG_PCIE_MEDIATEK is not set
CONFIG_PCIE_BRCMSTB=y
CONFIG_PCI_LOONGSON=y

#
# DesignWare PCI Core Support
#
CONFIG_PCIE_DW=y
CONFIG_PCIE_DW_HOST=y
CONFIG_PCIE_DW_EP=y
CONFIG_PCI_DRA7XX=y
CONFIG_PCI_DRA7XX_HOST=y
CONFIG_PCI_DRA7XX_EP=y
# CONFIG_PCIE_DW_PLAT_HOST is not set
# CONFIG_PCIE_DW_PLAT_EP is not set
CONFIG_PCI_EXYNOS=y
CONFIG_PCI_IMX6=y
CONFIG_PCIE_SPEAR13XX=y
CONFIG_PCI_LAYERSCAPE=y
# CONFIG_PCI_LAYERSCAPE_EP is not set
CONFIG_PCI_HISI=y
# CONFIG_PCIE_QCOM is not set
# CONFIG_PCIE_ARMADA_8K is not set
CONFIG_PCIE_ARTPEC6=y
CONFIG_PCIE_ARTPEC6_HOST=y
CONFIG_PCIE_ARTPEC6_EP=y
# CONFIG_PCIE_INTEL_GW is not set
# CONFIG_PCIE_KIRIN is not set
# CONFIG_PCIE_HISI_STB is not set
# CONFIG_PCI_MESON is not set
# CONFIG_PCIE_TEGRA194_HOST is not set
# CONFIG_PCIE_TEGRA194_EP is not set
# CONFIG_PCIE_UNIPHIER is not set
CONFIG_PCIE_UNIPHIER_EP=y
# CONFIG_PCIE_AL is not set
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# CONFIG_PCIE_MOBIVEIL_PLAT is not set
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
CONFIG_PCIE_CADENCE=y
CONFIG_PCIE_CADENCE_HOST=y
# CONFIG_PCIE_CADENCE_PLAT_HOST is not set
# CONFIG_PCIE_CADENCE_PLAT_EP is not set
CONFIG_PCI_J721E=y
CONFIG_PCI_J721E_HOST=y
# CONFIG_PCI_J721E_EP is not set
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
CONFIG_PCI_ENDPOINT=y
# CONFIG_PCI_ENDPOINT_CONFIGFS is not set
CONFIG_PCI_EPF_TEST=y
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

CONFIG_PCCARD=y
CONFIG_PCMCIA=y
CONFIG_PCMCIA_LOAD_CIS=y
# CONFIG_CARDBUS is not set

#
# PC-card bridges
#
# CONFIG_YENTA is not set
CONFIG_PD6729=y
CONFIG_I82092=y
# CONFIG_I82365 is not set
CONFIG_TCIC=y
CONFIG_PCMCIA_PROBE=y
CONFIG_PCCARD_NONSTATIC=y
CONFIG_RAPIDIO=y
CONFIG_RAPIDIO_TSI721=y
CONFIG_RAPIDIO_DISC_TIMEOUT=30
# CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
# CONFIG_RAPIDIO_DMA_ENGINE is not set
# CONFIG_RAPIDIO_DEBUG is not set
CONFIG_RAPIDIO_ENUM_BASIC=y
CONFIG_RAPIDIO_CHMAN=y
# CONFIG_RAPIDIO_MPORT_CDEV is not set

#
# RapidIO Switch drivers
#
# CONFIG_RAPIDIO_TSI57X is not set
# CONFIG_RAPIDIO_CPS_XX is not set
# CONFIG_RAPIDIO_TSI568 is not set
# CONFIG_RAPIDIO_CPS_GEN2 is not set
CONFIG_RAPIDIO_RXS_GEN3=y
# end of RapidIO Switch drivers

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
# CONFIG_DEVTMPFS is not set
CONFIG_STANDALONE=y
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
# CONFIG_FW_CACHE is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_PM_QOS_KUNIT_TEST is not set
# CONFIG_KUNIT_DRIVER_PE_TEST is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_AC97=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_ARM_INTEGRATOR_LM=y
# CONFIG_BRCMSTB_GISB_ARB is not set
# CONFIG_BT1_APB is not set
CONFIG_BT1_AXI=y
CONFIG_MOXTET=y
# CONFIG_HISILICON_LPC is not set
CONFIG_MIPS_CDMM=y
# CONFIG_QCOM_EBI2 is not set
# CONFIG_SIMPLE_PM_BUS is not set
# CONFIG_MHI_BUS is not set
# end of Bus devices

# CONFIG_GNSS is not set
CONFIG_MTD=y

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
# CONFIG_MTD_BCM63XX_PARTS is not set
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_OF_PARTS=y
CONFIG_MTD_PARSER_IMAGETAG=y
# CONFIG_MTD_PARSER_TRX is not set
CONFIG_MTD_SHARPSL_PARTS=y
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
CONFIG_NFTL=y
# CONFIG_NFTL_RW is not set
CONFIG_INFTL=y
CONFIG_RFD_FTL=y
# CONFIG_SSFDC is not set
CONFIG_SM_FTL=y
CONFIG_MTD_OOPS=y
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_STAA=y
CONFIG_MTD_CFI_UTIL=y
# CONFIG_MTD_RAM is not set
CONFIG_MTD_ROM=y
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_COMPAT=y
CONFIG_MTD_PHYSMAP_START=0x8000000
CONFIG_MTD_PHYSMAP_LEN=0
CONFIG_MTD_PHYSMAP_BANKWIDTH=2
# CONFIG_MTD_PHYSMAP_OF is not set
# CONFIG_MTD_PHYSMAP_GPIO_ADDR is not set
CONFIG_MTD_SC520CDP=y
CONFIG_MTD_NETSC520=y
# CONFIG_MTD_TS5500 is not set
CONFIG_MTD_PCI=y
CONFIG_MTD_PCMCIA=y
# CONFIG_MTD_PCMCIA_ANONYMOUS is not set
# CONFIG_MTD_INTEL_VR_NOR is not set
# CONFIG_MTD_PLATRAM is not set
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
CONFIG_MTD_PMC551=y
CONFIG_MTD_PMC551_BUGFIX=y
CONFIG_MTD_PMC551_DEBUG=y
CONFIG_MTD_DATAFLASH=y
CONFIG_MTD_DATAFLASH_WRITE_VERIFY=y
CONFIG_MTD_DATAFLASH_OTP=y
CONFIG_MTD_MCHP23K256=y
# CONFIG_MTD_SST25L is not set
CONFIG_MTD_SLRAM=y
CONFIG_MTD_PHRAM=y
CONFIG_MTD_MTDRAM=y
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128
CONFIG_MTD_BLOCK2MTD=y

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOCG3 is not set
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_ONENAND=y
# CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
# CONFIG_MTD_ONENAND_GENERIC is not set
# CONFIG_MTD_ONENAND_SAMSUNG is not set
CONFIG_MTD_ONENAND_OTP=y
# CONFIG_MTD_ONENAND_2X_PROGRAM is not set
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=y
# CONFIG_MTD_RAW_NAND is not set
# CONFIG_MTD_SPI_NAND is not set
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=y
CONFIG_MTD_QINFO_PROBE=y
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_SPI_NOR=y
CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=y
CONFIG_SPI_ASPEED_SMC=y
CONFIG_SPI_HISI_SFC=y
CONFIG_SPI_NXP_SPIFI=y
CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
CONFIG_MTD_UBI_FASTMAP=y
CONFIG_MTD_UBI_GLUEBI=y
# CONFIG_MTD_UBI_BLOCK is not set
CONFIG_MTD_HYPERBUS=y
CONFIG_HBMC_AM654=y
CONFIG_DTC=y
CONFIG_OF=y
CONFIG_OF_UNITTEST=y
# CONFIG_OF_ALL_DTBS is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_RESERVED_MEM=y
CONFIG_OF_RESOLVE=y
# CONFIG_OF_OVERLAY is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
# CONFIG_PARPORT_PC is not set
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
# CONFIG_PNP is not set
CONFIG_BLK_DEV=y
# CONFIG_BLK_DEV_NULL_BLK is not set
CONFIG_CDROM=y
CONFIG_BLK_DEV_PCIESSD_MTIP32XX=y
CONFIG_ZRAM=y
# CONFIG_ZRAM_WRITEBACK is not set
# CONFIG_ZRAM_MEMORY_TRACKING is not set
# CONFIG_BLK_DEV_UMEM is not set
# CONFIG_BLK_DEV_LOOP is not set

#
# DRBD disabled because PROC_FS or INET not selected
#
# CONFIG_BLK_DEV_SKD is not set
# CONFIG_BLK_DEV_SX8 is not set
# CONFIG_BLK_DEV_RAM is not set
CONFIG_CDROM_PKTCDVD=y
CONFIG_CDROM_PKTCDVD_BUFFERS=8
CONFIG_CDROM_PKTCDVD_WCACHE=y
# CONFIG_VIRTIO_BLK is not set
# CONFIG_BLK_DEV_RSXX is not set

#
# NVME Support
#
CONFIG_NVME_CORE=y
# CONFIG_BLK_DEV_NVME is not set
CONFIG_NVME_MULTIPATH=y
# CONFIG_NVME_HWMON is not set
CONFIG_NVME_FABRICS=y
# CONFIG_NVME_FC is not set
CONFIG_NVME_TARGET=y
# CONFIG_NVME_TARGET_PASSTHRU is not set
CONFIG_NVME_TARGET_LOOP=y
CONFIG_NVME_TARGET_FC=y
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=y
# CONFIG_AD525X_DPOT_SPI is not set
# CONFIG_DUMMY_IRQ is not set
CONFIG_PHANTOM=y
# CONFIG_INTEL_MID_PTI is not set
CONFIG_TIFM_CORE=y
CONFIG_TIFM_7XX1=y
# CONFIG_ICS932S401 is not set
CONFIG_ATMEL_SSC=y
CONFIG_ENCLOSURE_SERVICES=y
CONFIG_HP_ILO=y
CONFIG_QCOM_COINCELL=y
CONFIG_QCOM_FASTRPC=y
CONFIG_APDS9802ALS=y
# CONFIG_ISL29003 is not set
CONFIG_ISL29020=y
CONFIG_SENSORS_TSL2550=y
# CONFIG_SENSORS_BH1770 is not set
CONFIG_SENSORS_APDS990X=y
CONFIG_HMC6352=y
CONFIG_DS1682=y
CONFIG_PCH_PHUB=y
# CONFIG_LATTICE_ECP3_CONFIG is not set
CONFIG_SRAM=y
CONFIG_PCI_ENDPOINT_TEST=y
CONFIG_XILINX_SDFEC=y
CONFIG_PVPANIC=y
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_AT25=y
CONFIG_EEPROM_LEGACY=y
CONFIG_EEPROM_MAX6875=y
CONFIG_EEPROM_93CX6=y
CONFIG_EEPROM_93XX46=y
CONFIG_EEPROM_IDT_89HPESX=y
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=y
CONFIG_CB710_DEBUG=y
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_SPI is not set
CONFIG_SENSORS_LIS3_I2C=y
CONFIG_ALTERA_STAPL=y

#
# Intel MIC & related support
#
# CONFIG_VOP_BUS is not set
# end of Intel MIC & related support

CONFIG_GENWQE=y
CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=0
CONFIG_ECHO=y
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_MISC_RTSX_USB is not set
CONFIG_HABANA_AI=y
# CONFIG_UACCE is not set
# end of Misc devices

CONFIG_HAVE_IDE=y
# CONFIG_IDE is not set

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# CONFIG_RAID_ATTRS is not set
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
# CONFIG_SCSI_PROC_FS is not set

#
# SCSI support type (disk, tape, CD-ROM)
#
# CONFIG_BLK_DEV_SD is not set
# CONFIG_CHR_DEV_ST is not set
# CONFIG_BLK_DEV_SR is not set
CONFIG_CHR_DEV_SG=y
# CONFIG_CHR_DEV_SCH is not set
CONFIG_SCSI_ENCLOSURE=y
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=y
CONFIG_SCSI_SAS_ATTRS=y
CONFIG_SCSI_SAS_LIBSAS=y
CONFIG_SCSI_SAS_ATA=y
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=y
# end of SCSI Transports

# CONFIG_SCSI_LOWLEVEL is not set
CONFIG_SCSI_DH=y
# CONFIG_SCSI_DH_RDAC is not set
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# end of SCSI device support

CONFIG_ATA=y
CONFIG_SATA_HOST=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
# CONFIG_SATA_PMP is not set

#
# Controllers with non-SFF native interface
#
# CONFIG_SATA_AHCI is not set
# CONFIG_SATA_AHCI_PLATFORM is not set
CONFIG_AHCI_IMX=y
CONFIG_AHCI_CEVA=y
CONFIG_AHCI_XGENE=y
CONFIG_AHCI_QORIQ=y
CONFIG_SATA_GEMINI=y
CONFIG_SATA_INIC162X=y
CONFIG_SATA_ACARD_AHCI=y
# CONFIG_SATA_SIL24 is not set
# CONFIG_ATA_SFF is not set
# CONFIG_MD is not set
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y
# CONFIG_FIREWIRE_OHCI is not set
CONFIG_FIREWIRE_SBP2=y
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

# CONFIG_NVM is not set

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_LEDS is not set
CONFIG_INPUT_FF_MEMLESS=y
# CONFIG_INPUT_POLLDEV is not set
# CONFIG_INPUT_SPARSEKMAP is not set
CONFIG_INPUT_MATRIXKMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=y
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=y
CONFIG_KEYBOARD_QT1050=y
# CONFIG_KEYBOARD_QT1070 is not set
CONFIG_KEYBOARD_QT2160=y
CONFIG_KEYBOARD_CLPS711X=y
CONFIG_KEYBOARD_DLINK_DIR685=y
CONFIG_KEYBOARD_LKKBD=y
CONFIG_KEYBOARD_EP93XX=y
CONFIG_KEYBOARD_GPIO=y
# CONFIG_KEYBOARD_GPIO_POLLED is not set
CONFIG_KEYBOARD_TCA6416=y
CONFIG_KEYBOARD_TCA8418=y
# CONFIG_KEYBOARD_MATRIX is not set
CONFIG_KEYBOARD_LM8323=y
CONFIG_KEYBOARD_LM8333=y
# CONFIG_KEYBOARD_MAX7359 is not set
CONFIG_KEYBOARD_MCS=y
CONFIG_KEYBOARD_MPR121=y
# CONFIG_KEYBOARD_SNVS_PWRKEY is not set
# CONFIG_KEYBOARD_IMX_SC_KEY is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
CONFIG_KEYBOARD_PMIC8XXX=y
CONFIG_KEYBOARD_SAMSUNG=y
CONFIG_KEYBOARD_GOLDFISH_EVENTS=y
CONFIG_KEYBOARD_STOWAWAY=y
# CONFIG_KEYBOARD_ST_KEYSCAN is not set
# CONFIG_KEYBOARD_SUNKBD is not set
CONFIG_KEYBOARD_SH_KEYSC=y
# CONFIG_KEYBOARD_STMPE is not set
CONFIG_KEYBOARD_OMAP4=y
CONFIG_KEYBOARD_TC3589X=y
CONFIG_KEYBOARD_TM2_TOUCHKEY=y
# CONFIG_KEYBOARD_TWL4030 is not set
CONFIG_KEYBOARD_XTKBD=y
CONFIG_KEYBOARD_CROS_EC=y
CONFIG_KEYBOARD_CAP11XX=y
CONFIG_KEYBOARD_BCM=y
# CONFIG_INPUT_MOUSE is not set
CONFIG_INPUT_JOYSTICK=y
# CONFIG_JOYSTICK_ANALOG is not set
# CONFIG_JOYSTICK_A3D is not set
CONFIG_JOYSTICK_ADI=y
# CONFIG_JOYSTICK_COBRA is not set
CONFIG_JOYSTICK_GF2K=y
# CONFIG_JOYSTICK_GRIP is not set
CONFIG_JOYSTICK_GRIP_MP=y
# CONFIG_JOYSTICK_GUILLEMOT is not set
# CONFIG_JOYSTICK_INTERACT is not set
# CONFIG_JOYSTICK_SIDEWINDER is not set
CONFIG_JOYSTICK_TMDC=y
CONFIG_JOYSTICK_IFORCE=y
CONFIG_JOYSTICK_IFORCE_USB=y
CONFIG_JOYSTICK_IFORCE_232=y
CONFIG_JOYSTICK_WARRIOR=y
# CONFIG_JOYSTICK_MAGELLAN is not set
# CONFIG_JOYSTICK_SPACEORB is not set
# CONFIG_JOYSTICK_SPACEBALL is not set
CONFIG_JOYSTICK_STINGER=y
CONFIG_JOYSTICK_TWIDJOY=y
CONFIG_JOYSTICK_ZHENHUA=y
# CONFIG_JOYSTICK_DB9 is not set
# CONFIG_JOYSTICK_GAMECON is not set
CONFIG_JOYSTICK_TURBOGRAFX=y
CONFIG_JOYSTICK_AS5011=y
CONFIG_JOYSTICK_JOYDUMP=y
CONFIG_JOYSTICK_XPAD=y
# CONFIG_JOYSTICK_XPAD_FF is not set
CONFIG_JOYSTICK_XPAD_LEDS=y
CONFIG_JOYSTICK_WALKERA0701=y
CONFIG_JOYSTICK_PSXPAD_SPI=y
# CONFIG_JOYSTICK_PSXPAD_SPI_FF is not set
CONFIG_JOYSTICK_PXRC=y
# CONFIG_JOYSTICK_FSIA6B is not set
# CONFIG_INPUT_TABLET is not set
CONFIG_INPUT_TOUCHSCREEN=y
CONFIG_TOUCHSCREEN_PROPERTIES=y
# CONFIG_TOUCHSCREEN_ADS7846 is not set
# CONFIG_TOUCHSCREEN_AD7877 is not set
CONFIG_TOUCHSCREEN_AD7879=y
CONFIG_TOUCHSCREEN_AD7879_I2C=y
CONFIG_TOUCHSCREEN_AD7879_SPI=y
CONFIG_TOUCHSCREEN_AR1021_I2C=y
# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
CONFIG_TOUCHSCREEN_AUO_PIXCIR=y
CONFIG_TOUCHSCREEN_BU21013=y
CONFIG_TOUCHSCREEN_BU21029=y
CONFIG_TOUCHSCREEN_CHIPONE_ICN8318=y
CONFIG_TOUCHSCREEN_CY8CTMA140=y
CONFIG_TOUCHSCREEN_CY8CTMG110=y
CONFIG_TOUCHSCREEN_CYTTSP_CORE=y
CONFIG_TOUCHSCREEN_CYTTSP_I2C=y
CONFIG_TOUCHSCREEN_CYTTSP_SPI=y
CONFIG_TOUCHSCREEN_CYTTSP4_CORE=y
CONFIG_TOUCHSCREEN_CYTTSP4_I2C=y
CONFIG_TOUCHSCREEN_CYTTSP4_SPI=y
CONFIG_TOUCHSCREEN_DA9034=y
CONFIG_TOUCHSCREEN_DA9052=y
CONFIG_TOUCHSCREEN_DYNAPRO=y
# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
CONFIG_TOUCHSCREEN_EETI=y
CONFIG_TOUCHSCREEN_EGALAX=y
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=y
CONFIG_TOUCHSCREEN_EXC3000=y
CONFIG_TOUCHSCREEN_FUJITSU=y
CONFIG_TOUCHSCREEN_GOODIX=y
# CONFIG_TOUCHSCREEN_HIDEEP is not set
CONFIG_TOUCHSCREEN_ILI210X=y
CONFIG_TOUCHSCREEN_IPROC=y
CONFIG_TOUCHSCREEN_S6SY761=y
# CONFIG_TOUCHSCREEN_GUNZE is not set
CONFIG_TOUCHSCREEN_EKTF2127=y
# CONFIG_TOUCHSCREEN_ELAN is not set
# CONFIG_TOUCHSCREEN_ELO is not set
CONFIG_TOUCHSCREEN_WACOM_W8001=y
CONFIG_TOUCHSCREEN_WACOM_I2C=y
CONFIG_TOUCHSCREEN_MAX11801=y
CONFIG_TOUCHSCREEN_MCS5000=y
# CONFIG_TOUCHSCREEN_MMS114 is not set
CONFIG_TOUCHSCREEN_MELFAS_MIP4=y
CONFIG_TOUCHSCREEN_MTOUCH=y
# CONFIG_TOUCHSCREEN_IMX6UL_TSC is not set
CONFIG_TOUCHSCREEN_INEXIO=y
# CONFIG_TOUCHSCREEN_MK712 is not set
# CONFIG_TOUCHSCREEN_HTCPEN is not set
CONFIG_TOUCHSCREEN_PENMOUNT=y
CONFIG_TOUCHSCREEN_EDT_FT5X06=y
# CONFIG_TOUCHSCREEN_RASPBERRYPI_FW is not set
CONFIG_TOUCHSCREEN_MIGOR=y
# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
CONFIG_TOUCHSCREEN_TOUCHWIN=y
CONFIG_TOUCHSCREEN_TI_AM335X_TSC=y
# CONFIG_TOUCHSCREEN_UCB1400 is not set
CONFIG_TOUCHSCREEN_PIXCIR=y
# CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
# CONFIG_TOUCHSCREEN_WM831X is not set
CONFIG_TOUCHSCREEN_WM97XX=y
CONFIG_TOUCHSCREEN_WM9705=y
# CONFIG_TOUCHSCREEN_WM9712 is not set
# CONFIG_TOUCHSCREEN_WM9713 is not set
CONFIG_TOUCHSCREEN_USB_COMPOSITE=y
CONFIG_TOUCHSCREEN_MXS_LRADC=y
# CONFIG_TOUCHSCREEN_MX25 is not set
CONFIG_TOUCHSCREEN_MC13783=y
CONFIG_TOUCHSCREEN_USB_EGALAX=y
CONFIG_TOUCHSCREEN_USB_PANJIT=y
CONFIG_TOUCHSCREEN_USB_3M=y
CONFIG_TOUCHSCREEN_USB_ITM=y
CONFIG_TOUCHSCREEN_USB_ETURBO=y
CONFIG_TOUCHSCREEN_USB_GUNZE=y
CONFIG_TOUCHSCREEN_USB_DMC_TSC10=y
CONFIG_TOUCHSCREEN_USB_IRTOUCH=y
CONFIG_TOUCHSCREEN_USB_IDEALTEK=y
CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH=y
CONFIG_TOUCHSCREEN_USB_GOTOP=y
CONFIG_TOUCHSCREEN_USB_JASTEC=y
CONFIG_TOUCHSCREEN_USB_ELO=y
CONFIG_TOUCHSCREEN_USB_E2I=y
CONFIG_TOUCHSCREEN_USB_ZYTRONIC=y
CONFIG_TOUCHSCREEN_USB_ETT_TC45USB=y
CONFIG_TOUCHSCREEN_USB_NEXIO=y
CONFIG_TOUCHSCREEN_USB_EASYTOUCH=y
CONFIG_TOUCHSCREEN_TOUCHIT213=y
# CONFIG_TOUCHSCREEN_TS4800 is not set
CONFIG_TOUCHSCREEN_TSC_SERIO=y
CONFIG_TOUCHSCREEN_TSC200X_CORE=y
# CONFIG_TOUCHSCREEN_TSC2004 is not set
CONFIG_TOUCHSCREEN_TSC2005=y
CONFIG_TOUCHSCREEN_TSC2007=y
CONFIG_TOUCHSCREEN_RM_TS=y
# CONFIG_TOUCHSCREEN_SILEAD is not set
# CONFIG_TOUCHSCREEN_SIS_I2C is not set
CONFIG_TOUCHSCREEN_ST1232=y
CONFIG_TOUCHSCREEN_STMFTS=y
CONFIG_TOUCHSCREEN_STMPE=y
# CONFIG_TOUCHSCREEN_SUN4I is not set
CONFIG_TOUCHSCREEN_SURFACE3_SPI=y
CONFIG_TOUCHSCREEN_SX8654=y
CONFIG_TOUCHSCREEN_TPS6507X=y
# CONFIG_TOUCHSCREEN_ZET6223 is not set
CONFIG_TOUCHSCREEN_ZFORCE=y
CONFIG_TOUCHSCREEN_ROHM_BU21023=y
CONFIG_TOUCHSCREEN_IQS5XX=y
CONFIG_INPUT_MISC=y
CONFIG_INPUT_88PM80X_ONKEY=y
CONFIG_INPUT_AD714X=y
# CONFIG_INPUT_AD714X_I2C is not set
CONFIG_INPUT_AD714X_SPI=y
CONFIG_INPUT_ARIZONA_HAPTICS=y
CONFIG_INPUT_ATMEL_CAPTOUCH=y
CONFIG_INPUT_BMA150=y
CONFIG_INPUT_E3X0_BUTTON=y
# CONFIG_INPUT_PM8941_PWRKEY is not set
CONFIG_INPUT_PM8XXX_VIBRATOR=y
CONFIG_INPUT_PMIC8XXX_PWRKEY=y
CONFIG_INPUT_MAX8925_ONKEY=y
CONFIG_INPUT_MC13783_PWRBUTTON=y
CONFIG_INPUT_MMA8450=y
CONFIG_INPUT_GPIO_BEEPER=y
CONFIG_INPUT_GPIO_DECODER=y
CONFIG_INPUT_GPIO_VIBRA=y
# CONFIG_INPUT_ATI_REMOTE2 is not set
CONFIG_INPUT_KEYSPAN_REMOTE=y
CONFIG_INPUT_KXTJ9=y
CONFIG_INPUT_POWERMATE=y
CONFIG_INPUT_YEALINK=y
CONFIG_INPUT_CM109=y
CONFIG_INPUT_REGULATOR_HAPTIC=y
CONFIG_INPUT_RETU_PWRBUTTON=y
# CONFIG_INPUT_TPS65218_PWRBUTTON is not set
CONFIG_INPUT_AXP20X_PEK=y
# CONFIG_INPUT_TWL4030_PWRBUTTON is not set
# CONFIG_INPUT_TWL4030_VIBRA is not set
CONFIG_INPUT_UINPUT=y
CONFIG_INPUT_PCF50633_PMU=y
CONFIG_INPUT_PCF8574=y
CONFIG_INPUT_PWM_BEEPER=y
# CONFIG_INPUT_PWM_VIBRA is not set
CONFIG_INPUT_RK805_PWRKEY=y
# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
# CONFIG_INPUT_DA9052_ONKEY is not set
CONFIG_INPUT_WM831X_ON=y
# CONFIG_INPUT_ADXL34X is not set
# CONFIG_INPUT_IMS_PCU is not set
# CONFIG_INPUT_IQS269A is not set
# CONFIG_INPUT_CMA3000 is not set
CONFIG_INPUT_IDEAPAD_SLIDEBAR=y
CONFIG_INPUT_DRV260X_HAPTICS=y
CONFIG_INPUT_DRV2665_HAPTICS=y
CONFIG_INPUT_DRV2667_HAPTICS=y
CONFIG_INPUT_HISI_POWERKEY=y
CONFIG_INPUT_RAVE_SP_PWRBUTTON=y
CONFIG_INPUT_SC27XX_VIBRA=y
CONFIG_INPUT_STPMIC1_ONKEY=y
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
# CONFIG_RMI4_SPI is not set
CONFIG_RMI4_SMB=y
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_PARKBD=y
CONFIG_SERIO_PCIPS2=y
CONFIG_SERIO_SGI_IOC3=y
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
# CONFIG_SERIO_ALTERA_PS2 is not set
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
CONFIG_SERIO_APBPS2=y
# CONFIG_SERIO_OLPC_APSP is not set
CONFIG_SERIO_SUN4I_PS2=y
CONFIG_SERIO_GPIO_PS2=y
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=y
# CONFIG_GAMEPORT_NS558 is not set
CONFIG_GAMEPORT_L4=y
# CONFIG_GAMEPORT_EMU10K1 is not set
# CONFIG_GAMEPORT_FM801 is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_16550A_VARIANTS=y
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
# CONFIG_SERIAL_8250_CS is not set
CONFIG_SERIAL_8250_MEN_MCB=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
# CONFIG_SERIAL_8250_MANY_PORTS is not set
CONFIG_SERIAL_8250_ASPEED_VUART=y
# CONFIG_SERIAL_8250_SHARE_IRQ is not set
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_IOC3 is not set
# CONFIG_SERIAL_8250_RT288X is not set
# CONFIG_SERIAL_8250_LPC18XX is not set
CONFIG_SERIAL_8250_UNIPHIER=y
CONFIG_SERIAL_8250_INGENIC=y
# CONFIG_SERIAL_8250_LPSS is not set
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_TEGRA=y
# CONFIG_SERIAL_OF_PLATFORM is not set

#
# Non-8250 serial port support
#
CONFIG_SERIAL_ATMEL=y
# CONFIG_SERIAL_ATMEL_CONSOLE is not set
CONFIG_SERIAL_ATMEL_PDC=y
CONFIG_SERIAL_ATMEL_TTYAT=y
# CONFIG_SERIAL_CLPS711X is not set
# CONFIG_SERIAL_SAMSUNG is not set
# CONFIG_SERIAL_MAX3100 is not set
CONFIG_SERIAL_MAX310X=y
# CONFIG_SERIAL_IMX is not set
CONFIG_SERIAL_IMX_EARLYCON=y
CONFIG_SERIAL_UARTLITE=y
CONFIG_SERIAL_UARTLITE_CONSOLE=y
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_SH_SCI=y
CONFIG_SERIAL_SH_SCI_NR_UARTS=2
CONFIG_SERIAL_SH_SCI_CONSOLE=y
# CONFIG_SERIAL_HS_LPC32XX is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_JSM=y
CONFIG_SERIAL_SIFIVE=y
CONFIG_SERIAL_SIFIVE_CONSOLE=y
CONFIG_SERIAL_LANTIQ=y
# CONFIG_SERIAL_LANTIQ_CONSOLE is not set
CONFIG_SERIAL_SCCNXP=y
# CONFIG_SERIAL_SCCNXP_CONSOLE is not set
CONFIG_SERIAL_SC16IS7XX_CORE=y
CONFIG_SERIAL_SC16IS7XX=y
# CONFIG_SERIAL_SC16IS7XX_I2C is not set
CONFIG_SERIAL_SC16IS7XX_SPI=y
CONFIG_SERIAL_TIMBERDALE=y
CONFIG_SERIAL_BCM63XX=y
CONFIG_SERIAL_BCM63XX_CONSOLE=y
CONFIG_SERIAL_ALTERA_JTAGUART=y
# CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_IFX6X60 is not set
CONFIG_SERIAL_PCH_UART=y
CONFIG_SERIAL_PCH_UART_CONSOLE=y
# CONFIG_SERIAL_MXS_AUART is not set
# CONFIG_SERIAL_XILINX_PS_UART is not set
# CONFIG_SERIAL_MPS2_UART_CONSOLE is not set
CONFIG_SERIAL_MPS2_UART=y
CONFIG_SERIAL_ARC=y
CONFIG_SERIAL_ARC_CONSOLE=y
CONFIG_SERIAL_ARC_NR_PORTS=1
CONFIG_SERIAL_RP2=y
CONFIG_SERIAL_RP2_NR_UARTS=32
CONFIG_SERIAL_FSL_LPUART=y
# CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
CONFIG_SERIAL_FSL_LINFLEXUART=y
# CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE is not set
CONFIG_SERIAL_CONEXANT_DIGICOLOR=y
# CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE is not set
CONFIG_SERIAL_ST_ASC=y
CONFIG_SERIAL_ST_ASC_CONSOLE=y
# CONFIG_SERIAL_MEN_Z135 is not set
CONFIG_SERIAL_SPRD=y
# CONFIG_SERIAL_SPRD_CONSOLE is not set
CONFIG_SERIAL_STM32=y
# CONFIG_SERIAL_STM32_CONSOLE is not set
CONFIG_SERIAL_MVEBU_UART=y
# CONFIG_SERIAL_MVEBU_CONSOLE is not set
CONFIG_SERIAL_OWL=y
CONFIG_SERIAL_OWL_CONSOLE=y
CONFIG_SERIAL_RDA=y
CONFIG_SERIAL_RDA_CONSOLE=y
# CONFIG_SERIAL_MILBEAUT_USIO is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_ROCKETPORT is not set
# CONFIG_CYCLADES is not set
CONFIG_MOXA_INTELLIO=y
CONFIG_MOXA_SMARTIO=y
# CONFIG_SYNCLINK is not set
# CONFIG_SYNCLINKMP is not set
CONFIG_SYNCLINK_GT=y
# CONFIG_ISI is not set
CONFIG_N_HDLC=y
CONFIG_NOZOMI=y
CONFIG_MIPS_EJTAG_FDC_TTY=y
CONFIG_MIPS_EJTAG_FDC_EARLYCON=y
# CONFIG_NULL_TTY is not set
# CONFIG_TRACE_SINK is not set
CONFIG_HVC_DRIVER=y
CONFIG_SERIAL_DEV_BUS=y
CONFIG_SERIAL_DEV_CTRL_TTYPORT=y
# CONFIG_PRINTER is not set
CONFIG_PPDEV=y
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
# CONFIG_IPMI_DEVICE_INTERFACE is not set
CONFIG_IPMI_SI=y
CONFIG_IPMI_SSIF=y
CONFIG_IPMI_WATCHDOG=y
# CONFIG_IPMI_POWEROFF is not set
CONFIG_IPMI_KCS_BMC=y
CONFIG_ASPEED_KCS_IPMI_BMC=y
CONFIG_NPCM7XX_KCS_IPMI_BMC=y
# CONFIG_ASPEED_BT_IPMI_BMC is not set
# CONFIG_IPMB_DEVICE_INTERFACE is not set
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=y
CONFIG_HW_RANDOM_BA431=y
CONFIG_HW_RANDOM_VIRTIO=y
CONFIG_HW_RANDOM_IMX_RNGC=y
# CONFIG_HW_RANDOM_STM32 is not set
CONFIG_HW_RANDOM_MESON=y
CONFIG_HW_RANDOM_CAVIUM=y
CONFIG_HW_RANDOM_MTK=y
CONFIG_HW_RANDOM_EXYNOS=y
CONFIG_HW_RANDOM_NPCM=y
# CONFIG_HW_RANDOM_KEYSTONE is not set
CONFIG_HW_RANDOM_CCTRNG=y
# CONFIG_DTLK is not set
CONFIG_APPLICOM=y

#
# PCMCIA character devices
#
# CONFIG_SYNCLINK_CS is not set
CONFIG_CARDMAN_4000=y
CONFIG_CARDMAN_4040=y
CONFIG_SCR24X=y
# end of PCMCIA character devices

CONFIG_DEVMEM=y
# CONFIG_DEVKMEM is not set
# CONFIG_RAW_DRIVER is not set
CONFIG_DEVPORT=y
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
# CONFIG_TCG_TIS is not set
# CONFIG_TCG_TIS_SPI is not set
CONFIG_TCG_TIS_I2C_ATMEL=y
CONFIG_TCG_TIS_I2C_INFINEON=y
CONFIG_TCG_TIS_I2C_NUVOTON=y
CONFIG_TCG_ATMEL=y
CONFIG_TCG_VTPM_PROXY=y
CONFIG_TCG_TIS_ST33ZP24=y
CONFIG_TCG_TIS_ST33ZP24_I2C=y
CONFIG_TCG_TIS_ST33ZP24_SPI=y
CONFIG_XILLYBUS=y
# CONFIG_XILLYBUS_PCIE is not set
CONFIG_XILLYBUS_OF=y
# end of Character devices

# CONFIG_RANDOM_TRUST_BOOTLOADER is not set

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
# CONFIG_I2C_CHARDEV is not set
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=y
CONFIG_I2C_MUX_GPIO=y
CONFIG_I2C_MUX_GPMUX=y
CONFIG_I2C_MUX_LTC4306=y
CONFIG_I2C_MUX_PCA9541=y
CONFIG_I2C_MUX_PCA954x=y
CONFIG_I2C_MUX_PINCTRL=y
CONFIG_I2C_MUX_REG=y
# CONFIG_I2C_DEMUX_PINCTRL is not set
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=y
CONFIG_I2C_ALGOPCA=y
# end of I2C Algorithms

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_ALI1535=y
CONFIG_I2C_ALI1563=y
CONFIG_I2C_ALI15X3=y
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_HIX5HD2 is not set
CONFIG_I2C_I801=y
CONFIG_I2C_ISCH=y
CONFIG_I2C_PIIX4=y
CONFIG_I2C_NFORCE2=y
CONFIG_I2C_NVIDIA_GPU=y
CONFIG_I2C_SIS5595=y
CONFIG_I2C_SIS630=y
# CONFIG_I2C_SIS96X is not set
CONFIG_I2C_VIA=y
CONFIG_I2C_VIAPRO=y

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_ALTERA=y
# CONFIG_I2C_ASPEED is not set
# CONFIG_I2C_AT91 is not set
CONFIG_I2C_AXXIA=y
# CONFIG_I2C_BCM2835 is not set
CONFIG_I2C_BCM_IPROC=y
CONFIG_I2C_BCM_KONA=y
CONFIG_I2C_BRCMSTB=y
# CONFIG_I2C_CBUS_GPIO is not set
# CONFIG_I2C_DAVINCI is not set
CONFIG_I2C_DESIGNWARE_CORE=y
CONFIG_I2C_DESIGNWARE_SLAVE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=y
CONFIG_I2C_DESIGNWARE_PCI=y
CONFIG_I2C_DIGICOLOR=y
# CONFIG_I2C_EFM32 is not set
CONFIG_I2C_EG20T=y
CONFIG_I2C_EMEV2=y
CONFIG_I2C_EXYNOS5=y
# CONFIG_I2C_GPIO is not set
CONFIG_I2C_HIGHLANDER=y
# CONFIG_I2C_IMG is not set
# CONFIG_I2C_IMX_LPI2C is not set
# CONFIG_I2C_IOP3XX is not set
CONFIG_I2C_JZ4780=y
CONFIG_I2C_KEMPLD=y
CONFIG_I2C_LPC2K=y
CONFIG_I2C_MESON=y
CONFIG_I2C_MT65XX=y
# CONFIG_I2C_MT7621 is not set
# CONFIG_I2C_MV64XXX is not set
CONFIG_I2C_MXS=y
# CONFIG_I2C_NPCM7XX is not set
CONFIG_I2C_OCORES=y
# CONFIG_I2C_OMAP is not set
CONFIG_I2C_OWL=y
# CONFIG_I2C_PCA_PLATFORM is not set
# CONFIG_I2C_PMCMSP is not set
# CONFIG_I2C_PNX is not set
# CONFIG_I2C_PXA is not set
CONFIG_I2C_QCOM_CCI=y
# CONFIG_I2C_RIIC is not set
# CONFIG_I2C_RK3X is not set
CONFIG_I2C_S3C2410=y
CONFIG_I2C_SH_MOBILE=y
CONFIG_I2C_SIMTEC=y
# CONFIG_I2C_SIRF is not set
# CONFIG_I2C_SPRD is not set
CONFIG_I2C_ST=y
CONFIG_I2C_STM32F4=y
CONFIG_I2C_STM32F7=y
# CONFIG_I2C_STU300 is not set
# CONFIG_I2C_SUN6I_P2WI is not set
# CONFIG_I2C_SYNQUACER is not set
CONFIG_I2C_TEGRA_BPMP=y
CONFIG_I2C_UNIPHIER=y
CONFIG_I2C_UNIPHIER_F=y
# CONFIG_I2C_VERSATILE is not set
# CONFIG_I2C_WMT is not set
CONFIG_I2C_THUNDERX=y
# CONFIG_I2C_XILINX is not set
# CONFIG_I2C_XLR is not set
CONFIG_I2C_XLP9XX=y
# CONFIG_I2C_RCAR is not set

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
# CONFIG_I2C_DLN2 is not set
CONFIG_I2C_PARPORT=y
CONFIG_I2C_ROBOTFUZZ_OSIF=y
CONFIG_I2C_TAOS_EVM=y
CONFIG_I2C_TINY_USB=y
# CONFIG_I2C_VIPERBOARD is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=y
# CONFIG_I2C_PCA_ISA is not set
CONFIG_I2C_CROS_EC_TUNNEL=y
CONFIG_I2C_FSI=y
# end of I2C Hardware Bus support

CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
CONFIG_I2C_DEBUG_BUS=y
# end of I2C support

CONFIG_I3C=y
CONFIG_CDNS_I3C_MASTER=y
# CONFIG_DW_I3C_MASTER is not set
CONFIG_SPI=y
CONFIG_SPI_MASTER=y
CONFIG_SPI_MEM=y

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
CONFIG_SPI_AR934X=y
CONFIG_SPI_ATH79=y
CONFIG_SPI_ARMADA_3700=y
CONFIG_SPI_ATMEL=y
CONFIG_SPI_AT91_USART=y
CONFIG_SPI_ATMEL_QUADSPI=y
CONFIG_SPI_AXI_SPI_ENGINE=y
CONFIG_SPI_BCM2835=y
CONFIG_SPI_BCM2835AUX=y
CONFIG_SPI_BCM63XX=y
CONFIG_SPI_BCM63XX_HSSPI=y
CONFIG_SPI_BCM_QSPI=y
CONFIG_SPI_BITBANG=y
CONFIG_SPI_BUTTERFLY=y
CONFIG_SPI_CADENCE=y
# CONFIG_SPI_CADENCE_QUADSPI is not set
CONFIG_SPI_CLPS711X=y
CONFIG_SPI_DESIGNWARE=y
# CONFIG_SPI_DW_DMA is not set
# CONFIG_SPI_DW_PCI is not set
CONFIG_SPI_DW_MMIO=y
CONFIG_SPI_DLN2=y
CONFIG_SPI_EP93XX=y
CONFIG_SPI_FSI=y
# CONFIG_SPI_FSL_LPSPI is not set
CONFIG_SPI_FSL_QUADSPI=y
CONFIG_SPI_HISI_SFC_V3XX=y
CONFIG_SPI_NXP_FLEXSPI=y
CONFIG_SPI_GPIO=y
CONFIG_SPI_IMG_SPFI=y
CONFIG_SPI_IMX=y
CONFIG_SPI_JCORE=y
CONFIG_SPI_LM70_LLP=y
# CONFIG_SPI_LP8841_RTC is not set
CONFIG_SPI_FSL_LIB=y
CONFIG_SPI_FSL_SPI=y
# CONFIG_SPI_FSL_DSPI is not set
CONFIG_SPI_MESON_SPICC=y
CONFIG_SPI_MESON_SPIFC=y
# CONFIG_SPI_MT65XX is not set
CONFIG_SPI_MT7621=y
# CONFIG_SPI_MTK_NOR is not set
CONFIG_SPI_NPCM_FIU=y
CONFIG_SPI_NPCM_PSPI=y
# CONFIG_SPI_LANTIQ_SSC is not set
CONFIG_SPI_OC_TINY=y
# CONFIG_SPI_OMAP24XX is not set
CONFIG_SPI_TI_QSPI=y
# CONFIG_SPI_OMAP_100K is not set
CONFIG_SPI_ORION=y
CONFIG_SPI_PIC32=y
# CONFIG_SPI_PIC32_SQI is not set
CONFIG_SPI_PXA2XX=y
CONFIG_SPI_PXA2XX_PCI=y
CONFIG_SPI_ROCKCHIP=y
CONFIG_SPI_RSPI=y
# CONFIG_SPI_S3C64XX is not set
CONFIG_SPI_SC18IS602=y
CONFIG_SPI_SH_MSIOF=y
# CONFIG_SPI_SH is not set
# CONFIG_SPI_SH_HSPI is not set
# CONFIG_SPI_SIFIVE is not set
CONFIG_SPI_SLAVE_MT27XX=y
# CONFIG_SPI_SPRD is not set
CONFIG_SPI_SPRD_ADI=y
# CONFIG_SPI_STM32 is not set
CONFIG_SPI_STM32_QSPI=y
# CONFIG_SPI_ST_SSC4 is not set
# CONFIG_SPI_SUN4I is not set
CONFIG_SPI_SUN6I=y
CONFIG_SPI_SYNQUACER=y
# CONFIG_SPI_MXIC is not set
CONFIG_SPI_TEGRA114=y
# CONFIG_SPI_TEGRA20_SFLASH is not set
CONFIG_SPI_TEGRA20_SLINK=y
# CONFIG_SPI_THUNDERX is not set
# CONFIG_SPI_TOPCLIFF_PCH is not set
# CONFIG_SPI_TXX9 is not set
# CONFIG_SPI_UNIPHIER is not set
CONFIG_SPI_XCOMM=y
CONFIG_SPI_XILINX=y
# CONFIG_SPI_XLP is not set
# CONFIG_SPI_XTENSA_XTFPGA is not set
CONFIG_SPI_ZYNQ_QSPI=y
CONFIG_SPI_ZYNQMP_GQSPI=y
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
# CONFIG_SPI_MUX is not set

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=y
# CONFIG_SPI_TLE62X0 is not set
CONFIG_SPI_SLAVE=y
CONFIG_SPI_SLAVE_TIME=y
# CONFIG_SPI_SLAVE_SYSTEM_CONTROL is not set
CONFIG_SPMI=y
# CONFIG_SPMI_MSM_PMIC_ARB is not set
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
CONFIG_HSI_CHAR=y
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set
CONFIG_NTP_PPS=y

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=y
CONFIG_PPS_CLIENT_LDISC=y
CONFIG_PPS_CLIENT_PARPORT=y
CONFIG_PPS_CLIENT_GPIO=y

#
# PPS generators support
#

#
# PTP clock support
#

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_PINCTRL_AS3722=y
# CONFIG_PINCTRL_AXP209 is not set
CONFIG_PINCTRL_AT91PIO4=y
CONFIG_PINCTRL_AMD=y
CONFIG_PINCTRL_BM1880=y
CONFIG_PINCTRL_DA850_PUPD=y
CONFIG_PINCTRL_LPC18XX=y
# CONFIG_PINCTRL_MCP23S08 is not set
CONFIG_PINCTRL_RZA1=y
# CONFIG_PINCTRL_RZA2 is not set
CONFIG_PINCTRL_RZN1=y
CONFIG_PINCTRL_SINGLE=y
CONFIG_PINCTRL_SX150X=y
CONFIG_PINCTRL_STMFX=y
CONFIG_PINCTRL_MAX77620=y
CONFIG_PINCTRL_INGENIC=y
CONFIG_PINCTRL_RK805=y
CONFIG_PINCTRL_OCELOT=y
CONFIG_PINCTRL_OWL=y
# CONFIG_PINCTRL_S700 is not set
CONFIG_PINCTRL_S900=y
CONFIG_PINCTRL_ASPEED=y
# CONFIG_PINCTRL_ASPEED_G4 is not set
CONFIG_PINCTRL_ASPEED_G5=y
# CONFIG_PINCTRL_ASPEED_G6 is not set
# CONFIG_PINCTRL_BCM281XX is not set
CONFIG_PINCTRL_BCM2835=y
CONFIG_PINCTRL_IPROC_GPIO=y
CONFIG_PINCTRL_CYGNUS_MUX=y
CONFIG_PINCTRL_NS=y
CONFIG_PINCTRL_NSP_GPIO=y
# CONFIG_PINCTRL_NS2_MUX is not set
CONFIG_PINCTRL_NSP_MUX=y
CONFIG_PINCTRL_BERLIN=y
CONFIG_PINCTRL_AS370=y
# CONFIG_PINCTRL_BERLIN_BG4CT is not set
CONFIG_PINCTRL_NPCM7XX=y
CONFIG_PINCTRL_PXA=y
# CONFIG_PINCTRL_PXA25X is not set
CONFIG_PINCTRL_PXA27X=y
CONFIG_PINCTRL_MSM=y
CONFIG_PINCTRL_APQ8064=y
# CONFIG_PINCTRL_APQ8084 is not set
CONFIG_PINCTRL_IPQ4019=y
CONFIG_PINCTRL_IPQ8064=y
# CONFIG_PINCTRL_IPQ8074 is not set
CONFIG_PINCTRL_IPQ6018=y
CONFIG_PINCTRL_MSM8660=y
CONFIG_PINCTRL_MSM8960=y
# CONFIG_PINCTRL_MDM9615 is not set
# CONFIG_PINCTRL_MSM8X74 is not set
# CONFIG_PINCTRL_MSM8916 is not set
CONFIG_PINCTRL_MSM8976=y
CONFIG_PINCTRL_MSM8994=y
# CONFIG_PINCTRL_MSM8996 is not set
CONFIG_PINCTRL_MSM8998=y
CONFIG_PINCTRL_QCS404=y
# CONFIG_PINCTRL_QCOM_SPMI_PMIC is not set
CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
# CONFIG_PINCTRL_SC7180 is not set
CONFIG_PINCTRL_SDM660=y
# CONFIG_PINCTRL_SDM845 is not set
CONFIG_PINCTRL_SM8150=y
CONFIG_PINCTRL_SM8250=y
CONFIG_PINCTRL_SAMSUNG=y
CONFIG_PINCTRL_EXYNOS=y
# CONFIG_PINCTRL_EXYNOS_ARM is not set
# CONFIG_PINCTRL_EXYNOS_ARM64 is not set
CONFIG_PINCTRL_S3C24XX=y
CONFIG_PINCTRL_S3C64XX=y
CONFIG_PINCTRL_SH_PFC=y
CONFIG_PINCTRL_SH_PFC_GPIO=y
CONFIG_PINCTRL_SH_FUNC_GPIO=y
# CONFIG_PINCTRL_PFC_EMEV2 is not set
CONFIG_PINCTRL_PFC_R8A73A4=y
# CONFIG_PINCTRL_PFC_R8A7740 is not set
# CONFIG_PINCTRL_PFC_R8A7742 is not set
CONFIG_PINCTRL_PFC_R8A7743=y
# CONFIG_PINCTRL_PFC_R8A7744 is not set
CONFIG_PINCTRL_PFC_R8A7745=y
# CONFIG_PINCTRL_PFC_R8A77470 is not set
# CONFIG_PINCTRL_PFC_R8A774A1 is not set
CONFIG_PINCTRL_PFC_R8A774B1=y
# CONFIG_PINCTRL_PFC_R8A774C0 is not set
# CONFIG_PINCTRL_PFC_R8A774E1 is not set
# CONFIG_PINCTRL_PFC_R8A7778 is not set
CONFIG_PINCTRL_PFC_R8A7779=y
CONFIG_PINCTRL_PFC_R8A7790=y
# CONFIG_PINCTRL_PFC_R8A7791 is not set
# CONFIG_PINCTRL_PFC_R8A7792 is not set
CONFIG_PINCTRL_PFC_R8A7793=y
# CONFIG_PINCTRL_PFC_R8A7794 is not set
# CONFIG_PINCTRL_PFC_R8A77950 is not set
# CONFIG_PINCTRL_PFC_R8A77951 is not set
# CONFIG_PINCTRL_PFC_R8A77960 is not set
CONFIG_PINCTRL_PFC_R8A77961=y
CONFIG_PINCTRL_PFC_R8A77965=y
CONFIG_PINCTRL_PFC_R8A77970=y
# CONFIG_PINCTRL_PFC_R8A77980 is not set
CONFIG_PINCTRL_PFC_R8A77990=y
CONFIG_PINCTRL_PFC_R8A77995=y
CONFIG_PINCTRL_PFC_SH7203=y
CONFIG_PINCTRL_PFC_SH7264=y
CONFIG_PINCTRL_PFC_SH7269=y
# CONFIG_PINCTRL_PFC_SH73A0 is not set
CONFIG_PINCTRL_PFC_SH7720=y
# CONFIG_PINCTRL_PFC_SH7722 is not set
CONFIG_PINCTRL_PFC_SH7723=y
# CONFIG_PINCTRL_PFC_SH7724 is not set
CONFIG_PINCTRL_PFC_SH7734=y
CONFIG_PINCTRL_PFC_SH7757=y
# CONFIG_PINCTRL_PFC_SH7785 is not set
# CONFIG_PINCTRL_PFC_SH7786 is not set
# CONFIG_PINCTRL_PFC_SHX3 is not set
CONFIG_PINCTRL_SPRD=y
CONFIG_PINCTRL_SPRD_SC9860=y
CONFIG_PINCTRL_STM32=y
# CONFIG_PINCTRL_STM32F429 is not set
CONFIG_PINCTRL_STM32F469=y
# CONFIG_PINCTRL_STM32F746 is not set
CONFIG_PINCTRL_STM32F769=y
CONFIG_PINCTRL_STM32H743=y
CONFIG_PINCTRL_STM32MP157=y
# CONFIG_PINCTRL_TI_IODELAY is not set
# CONFIG_PINCTRL_UNIPHIER is not set

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
CONFIG_PINCTRL_MTK=y
CONFIG_PINCTRL_MTK_V2=y
CONFIG_PINCTRL_MTK_MOORE=y
CONFIG_PINCTRL_MTK_PARIS=y
# CONFIG_PINCTRL_MT2701 is not set
CONFIG_PINCTRL_MT7623=y
CONFIG_PINCTRL_MT7629=y
CONFIG_PINCTRL_MT8135=y
CONFIG_PINCTRL_MT8127=y
CONFIG_PINCTRL_MT2712=y
CONFIG_PINCTRL_MT6765=y
# CONFIG_PINCTRL_MT6779 is not set
CONFIG_PINCTRL_MT6797=y
CONFIG_PINCTRL_MT7622=y
# CONFIG_PINCTRL_MT8173 is not set
# CONFIG_PINCTRL_MT8183 is not set
CONFIG_PINCTRL_MT8516=y
CONFIG_PINCTRL_MT6397=y
# end of MediaTek pinctrl drivers

CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L15=y
CONFIG_PINCTRL_CS47L35=y
CONFIG_PINCTRL_CS47L85=y
CONFIG_PINCTRL_CS47L90=y
CONFIG_PINCTRL_EQUILIBRIUM=y
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_GPIO_SYSFS is not set
CONFIG_GPIO_GENERIC=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_74XX_MMIO is not set
CONFIG_GPIO_ALTERA=y
# CONFIG_GPIO_ASPEED is not set
# CONFIG_GPIO_ASPEED_SGPIO is not set
CONFIG_GPIO_ATH79=y
CONFIG_GPIO_RASPBERRYPI_EXP=y
CONFIG_GPIO_BCM_KONA=y
CONFIG_GPIO_BCM_XGS_IPROC=y
# CONFIG_GPIO_BRCMSTB is not set
# CONFIG_GPIO_CADENCE is not set
CONFIG_GPIO_CLPS711X=y
# CONFIG_GPIO_DWAPB is not set
CONFIG_GPIO_EIC_SPRD=y
CONFIG_GPIO_EM=y
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_FTGPIO010 is not set
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_GRGPIO=y
# CONFIG_GPIO_HLWD is not set
CONFIG_GPIO_IOP=y
CONFIG_GPIO_LOGICVC=y
CONFIG_GPIO_LOONGSON=y
CONFIG_GPIO_LPC18XX=y
CONFIG_GPIO_LPC32XX=y
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_MENZ127 is not set
# CONFIG_GPIO_MPC8XXX is not set
# CONFIG_GPIO_MT7621 is not set
CONFIG_GPIO_MXC=y
CONFIG_GPIO_MXS=y
# CONFIG_GPIO_PMIC_EIC_SPRD is not set
CONFIG_GPIO_PXA=y
CONFIG_GPIO_RCAR=y
CONFIG_GPIO_RDA=y
CONFIG_GPIO_SAMA5D2_PIOBU=y
CONFIG_GPIO_SIFIVE=y
# CONFIG_GPIO_SNPS_CREG is not set
# CONFIG_GPIO_SPRD is not set
# CONFIG_GPIO_STP_XWAY is not set
CONFIG_GPIO_SYSCON=y
# CONFIG_GPIO_TEGRA is not set
CONFIG_GPIO_TEGRA186=y
CONFIG_GPIO_TS4800=y
CONFIG_GPIO_THUNDERX=y
CONFIG_GPIO_UNIPHIER=y
# CONFIG_GPIO_VX855 is not set
CONFIG_GPIO_XGENE_SB=y
# CONFIG_GPIO_XILINX is not set
# CONFIG_GPIO_XLP is not set
# CONFIG_GPIO_ZX is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADP5588=y
# CONFIG_GPIO_ADP5588_IRQ is not set
# CONFIG_GPIO_ADNP is not set
# CONFIG_GPIO_GW_PLD is not set
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
CONFIG_GPIO_PCA9570=y
CONFIG_GPIO_PCF857X=y
# CONFIG_GPIO_TPIC2810 is not set
# CONFIG_GPIO_TS4900 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ARIZONA=y
CONFIG_GPIO_BD71828=y
CONFIG_GPIO_BD9571MWV=y
CONFIG_GPIO_DA9052=y
CONFIG_GPIO_DLN2=y
CONFIG_GPIO_JANZ_TTL=y
# CONFIG_GPIO_KEMPLD is not set
# CONFIG_GPIO_LP3943 is not set
# CONFIG_GPIO_MADERA is not set
CONFIG_GPIO_MAX77620=y
# CONFIG_GPIO_STMPE is not set
CONFIG_GPIO_TC3589X=y
# CONFIG_GPIO_TIMBERDALE is not set
# CONFIG_GPIO_TPS65086 is not set
CONFIG_GPIO_TPS65912=y
CONFIG_GPIO_TQMX86=y
# CONFIG_GPIO_TWL4030 is not set
# CONFIG_GPIO_UCB1400 is not set
# CONFIG_GPIO_WM831X is not set
CONFIG_GPIO_WM8350=y
CONFIG_GPIO_WM8994=y
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
CONFIG_GPIO_AMD8111=y
# CONFIG_GPIO_BT8XX is not set
CONFIG_GPIO_MLXBF=y
CONFIG_GPIO_MLXBF2=y
CONFIG_GPIO_ML_IOH=y
# CONFIG_GPIO_PCH is not set
CONFIG_GPIO_PCI_IDIO_16=y
CONFIG_GPIO_PCIE_IDIO_24=y
CONFIG_GPIO_RDC321X=y
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
CONFIG_GPIO_74X164=y
# CONFIG_GPIO_MAX3191X is not set
# CONFIG_GPIO_MAX7301 is not set
CONFIG_GPIO_MC33880=y
# CONFIG_GPIO_PISOSR is not set
CONFIG_GPIO_XRA1403=y
CONFIG_GPIO_MOXTET=y
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=y
# end of USB GPIO expanders

# CONFIG_GPIO_AGGREGATOR is not set
CONFIG_GPIO_MOCKUP=y
CONFIG_W1=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_MATROX=y
# CONFIG_W1_MASTER_DS2490 is not set
CONFIG_W1_MASTER_DS2482=y
# CONFIG_W1_MASTER_MXC is not set
# CONFIG_W1_MASTER_DS1WM is not set
# CONFIG_W1_MASTER_GPIO is not set
# CONFIG_W1_MASTER_SGI is not set
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
CONFIG_W1_SLAVE_SMEM=y
# CONFIG_W1_SLAVE_DS2405 is not set
CONFIG_W1_SLAVE_DS2408=y
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
# CONFIG_W1_SLAVE_DS2413 is not set
CONFIG_W1_SLAVE_DS2406=y
CONFIG_W1_SLAVE_DS2423=y
CONFIG_W1_SLAVE_DS2805=y
# CONFIG_W1_SLAVE_DS2430 is not set
# CONFIG_W1_SLAVE_DS2431 is not set
CONFIG_W1_SLAVE_DS2433=y
CONFIG_W1_SLAVE_DS2433_CRC=y
CONFIG_W1_SLAVE_DS2438=y
# CONFIG_W1_SLAVE_DS250X is not set
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

# CONFIG_POWER_AVS is not set
# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_POWER_SUPPLY_HWMON is not set
# CONFIG_PDA_POWER is not set
CONFIG_MAX8925_POWER=y
CONFIG_WM831X_BACKUP=y
# CONFIG_WM831X_POWER is not set
CONFIG_WM8350_POWER=y
CONFIG_TEST_POWER=y
CONFIG_CHARGER_ADP5061=y
CONFIG_BATTERY_ACT8945A=y
CONFIG_BATTERY_CW2015=y
CONFIG_BATTERY_DS2760=y
CONFIG_BATTERY_DS2780=y
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=y
CONFIG_BATTERY_OLPC=y
# CONFIG_BATTERY_WM97XX is not set
CONFIG_BATTERY_SBS=y
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
CONFIG_BATTERY_BQ27XXX=y
# CONFIG_BATTERY_BQ27XXX_I2C is not set
CONFIG_BATTERY_BQ27XXX_HDQ=y
CONFIG_BATTERY_DA9030=y
# CONFIG_BATTERY_DA9052 is not set
CONFIG_BATTERY_MAX17040=y
CONFIG_BATTERY_MAX17042=y
CONFIG_BATTERY_MAX1721X=y
CONFIG_CHARGER_PCF50633=y
# CONFIG_CHARGER_ISP1704 is not set
CONFIG_CHARGER_MAX8903=y
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_GPIO=y
# CONFIG_CHARGER_MANAGER is not set
CONFIG_CHARGER_LT3651=y
CONFIG_CHARGER_MAX14577=y
# CONFIG_CHARGER_DETECTOR_MAX14656 is not set
CONFIG_CHARGER_MAX8998=y
# CONFIG_CHARGER_QCOM_SMBB is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24190 is not set
CONFIG_CHARGER_BQ24257=y
# CONFIG_CHARGER_BQ24735 is not set
CONFIG_CHARGER_BQ2515X=y
CONFIG_CHARGER_BQ25890=y
CONFIG_CHARGER_SMB347=y
CONFIG_CHARGER_TPS65217=y
CONFIG_BATTERY_GAUGE_LTC2941=y
CONFIG_BATTERY_GOLDFISH=y
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=y
# CONFIG_CHARGER_CROS_USBPD is not set
CONFIG_CHARGER_SC2731=y
CONFIG_CHARGER_UCS1002=y
# CONFIG_CHARGER_BD99954 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
# CONFIG_SENSORS_AD7314 is not set
# CONFIG_SENSORS_AD7414 is not set
# CONFIG_SENSORS_AD7418 is not set
# CONFIG_SENSORS_ADM1021 is not set
CONFIG_SENSORS_ADM1025=y
CONFIG_SENSORS_ADM1026=y
CONFIG_SENSORS_ADM1029=y
# CONFIG_SENSORS_ADM1031 is not set
CONFIG_SENSORS_ADM1177=y
# CONFIG_SENSORS_ADM9240 is not set
CONFIG_SENSORS_ADT7X10=y
CONFIG_SENSORS_ADT7310=y
CONFIG_SENSORS_ADT7410=y
CONFIG_SENSORS_ADT7411=y
CONFIG_SENSORS_ADT7462=y
CONFIG_SENSORS_ADT7470=y
# CONFIG_SENSORS_ADT7475 is not set
# CONFIG_SENSORS_AS370 is not set
# CONFIG_SENSORS_ASC7621 is not set
CONFIG_SENSORS_AXI_FAN_CONTROL=y
# CONFIG_SENSORS_ARM_SCMI is not set
# CONFIG_SENSORS_ASPEED is not set
CONFIG_SENSORS_ATXP1=y
CONFIG_SENSORS_BT1_PVT=y
# CONFIG_SENSORS_BT1_PVT_ALARMS is not set
# CONFIG_SENSORS_CORSAIR_CPRO is not set
CONFIG_SENSORS_DRIVETEMP=y
# CONFIG_SENSORS_DS620 is not set
CONFIG_SENSORS_DS1621=y
CONFIG_SENSORS_DA9052_ADC=y
CONFIG_SENSORS_I5K_AMB=y
# CONFIG_SENSORS_SPARX5 is not set
CONFIG_SENSORS_F71805F=y
CONFIG_SENSORS_F71882FG=y
# CONFIG_SENSORS_F75375S is not set
CONFIG_SENSORS_GSC=y
CONFIG_SENSORS_MC13783_ADC=y
CONFIG_SENSORS_FTSTEUTATES=y
CONFIG_SENSORS_GL518SM=y
# CONFIG_SENSORS_GL520SM is not set
# CONFIG_SENSORS_G760A is not set
CONFIG_SENSORS_G762=y
CONFIG_SENSORS_GPIO_FAN=y
CONFIG_SENSORS_HIH6130=y
CONFIG_SENSORS_IBMAEM=y
# CONFIG_SENSORS_IBMPEX is not set
# CONFIG_SENSORS_IT87 is not set
# CONFIG_SENSORS_JC42 is not set
CONFIG_SENSORS_POWR1220=y
CONFIG_SENSORS_LINEAGE=y
# CONFIG_SENSORS_LTC2945 is not set
CONFIG_SENSORS_LTC2947=y
CONFIG_SENSORS_LTC2947_I2C=y
# CONFIG_SENSORS_LTC2947_SPI is not set
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC4151 is not set
CONFIG_SENSORS_LTC4215=y
CONFIG_SENSORS_LTC4222=y
# CONFIG_SENSORS_LTC4245 is not set
CONFIG_SENSORS_LTC4260=y
CONFIG_SENSORS_LTC4261=y
# CONFIG_SENSORS_MAX1111 is not set
CONFIG_SENSORS_MAX16065=y
CONFIG_SENSORS_MAX1619=y
# CONFIG_SENSORS_MAX1668 is not set
CONFIG_SENSORS_MAX197=y
# CONFIG_SENSORS_MAX31722 is not set
CONFIG_SENSORS_MAX31730=y
CONFIG_SENSORS_MAX6621=y
CONFIG_SENSORS_MAX6639=y
CONFIG_SENSORS_MAX6642=y
CONFIG_SENSORS_MAX6650=y
CONFIG_SENSORS_MAX6697=y
CONFIG_SENSORS_MAX31790=y
CONFIG_SENSORS_MCP3021=y
CONFIG_SENSORS_MLXREG_FAN=y
CONFIG_SENSORS_TC654=y
CONFIG_SENSORS_MENF21BMC_HWMON=y
# CONFIG_SENSORS_ADCXX is not set
# CONFIG_SENSORS_LM63 is not set
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=y
CONFIG_SENSORS_LM75=y
CONFIG_SENSORS_LM77=y
CONFIG_SENSORS_LM78=y
CONFIG_SENSORS_LM80=y
# CONFIG_SENSORS_LM83 is not set
CONFIG_SENSORS_LM85=y
CONFIG_SENSORS_LM87=y
# CONFIG_SENSORS_LM90 is not set
CONFIG_SENSORS_LM92=y
CONFIG_SENSORS_LM93=y
CONFIG_SENSORS_LM95234=y
CONFIG_SENSORS_LM95241=y
CONFIG_SENSORS_LM95245=y
CONFIG_SENSORS_PC87360=y
CONFIG_SENSORS_PC87427=y
# CONFIG_SENSORS_NTC_THERMISTOR is not set
CONFIG_SENSORS_NCT6683=y
# CONFIG_SENSORS_NCT6775 is not set
CONFIG_SENSORS_NCT7802=y
CONFIG_SENSORS_NCT7904=y
CONFIG_SENSORS_NPCM7XX=y
CONFIG_SENSORS_NSA320=y
CONFIG_SENSORS_OCC_P8_I2C=y
# CONFIG_SENSORS_OCC_P9_SBE is not set
CONFIG_SENSORS_OCC=y
CONFIG_SENSORS_PCF8591=y
CONFIG_PMBUS=y
CONFIG_SENSORS_PMBUS=y
CONFIG_SENSORS_ADM1275=y
CONFIG_SENSORS_BEL_PFE=y
CONFIG_SENSORS_IBM_CFFPS=y
CONFIG_SENSORS_INSPUR_IPSPS=y
CONFIG_SENSORS_IR35221=y
CONFIG_SENSORS_IR38064=y
CONFIG_SENSORS_IRPS5401=y
# CONFIG_SENSORS_ISL68137 is not set
# CONFIG_SENSORS_LM25066 is not set
CONFIG_SENSORS_LTC2978=y
# CONFIG_SENSORS_LTC2978_REGULATOR is not set
# CONFIG_SENSORS_LTC3815 is not set
CONFIG_SENSORS_MAX16064=y
CONFIG_SENSORS_MAX16601=y
CONFIG_SENSORS_MAX20730=y
# CONFIG_SENSORS_MAX20751 is not set
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=y
# CONFIG_SENSORS_MAX8688 is not set
CONFIG_SENSORS_PXE1610=y
# CONFIG_SENSORS_TPS40422 is not set
# CONFIG_SENSORS_TPS53679 is not set
CONFIG_SENSORS_UCD9000=y
CONFIG_SENSORS_UCD9200=y
CONFIG_SENSORS_XDPE122=y
CONFIG_SENSORS_ZL6100=y
CONFIG_SENSORS_PWM_FAN=y
CONFIG_SENSORS_RASPBERRYPI_HWMON=y
# CONFIG_SENSORS_SHT15 is not set
# CONFIG_SENSORS_SHT21 is not set
CONFIG_SENSORS_SHT3x=y
CONFIG_SENSORS_SHTC1=y
# CONFIG_SENSORS_SIS5595 is not set
CONFIG_SENSORS_DME1737=y
CONFIG_SENSORS_EMC1403=y
# CONFIG_SENSORS_EMC2103 is not set
CONFIG_SENSORS_EMC6W201=y
# CONFIG_SENSORS_SMSC47M1 is not set
# CONFIG_SENSORS_SMSC47M192 is not set
# CONFIG_SENSORS_SMSC47B397 is not set
# CONFIG_SENSORS_SCH5627 is not set
# CONFIG_SENSORS_SCH5636 is not set
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=y
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=y
# CONFIG_SENSORS_INA209 is not set
# CONFIG_SENSORS_INA2XX is not set
CONFIG_SENSORS_INA3221=y
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=y
# CONFIG_SENSORS_TMP102 is not set
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=y
CONFIG_SENSORS_TMP421=y
CONFIG_SENSORS_TMP513=y
CONFIG_SENSORS_VIA686A=y
# CONFIG_SENSORS_VT1211 is not set
# CONFIG_SENSORS_VT8231 is not set
CONFIG_SENSORS_W83773G=y
CONFIG_SENSORS_W83781D=y
CONFIG_SENSORS_W83791D=y
# CONFIG_SENSORS_W83792D is not set
CONFIG_SENSORS_W83793=y
CONFIG_SENSORS_W83795=y
CONFIG_SENSORS_W83795_FANCTRL=y
CONFIG_SENSORS_W83L785TS=y
CONFIG_SENSORS_W83L786NG=y
CONFIG_SENSORS_W83627HF=y
CONFIG_SENSORS_W83627EHF=y
CONFIG_SENSORS_WM831X=y
CONFIG_SENSORS_WM8350=y
CONFIG_THERMAL=y
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_HWMON is not set
CONFIG_THERMAL_OF=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
# CONFIG_THERMAL_GOV_BANG_BANG is not set
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_CPU_THERMAL=y
CONFIG_DEVFREQ_THERMAL=y
# CONFIG_THERMAL_EMULATION is not set
CONFIG_THERMAL_MMIO=y
# CONFIG_HISI_THERMAL is not set
# CONFIG_IMX_THERMAL is not set
CONFIG_IMX_SC_THERMAL=y
CONFIG_IMX8MM_THERMAL=y
CONFIG_K3_THERMAL=y
CONFIG_MAX77620_THERMAL=y
CONFIG_QORIQ_THERMAL=y
CONFIG_SPEAR_THERMAL=y
CONFIG_SUN8I_THERMAL=y
CONFIG_ROCKCHIP_THERMAL=y
CONFIG_RCAR_THERMAL=y
CONFIG_RCAR_GEN3_THERMAL=y
CONFIG_KIRKWOOD_THERMAL=y
CONFIG_DOVE_THERMAL=y
# CONFIG_ARMADA_THERMAL is not set
CONFIG_DA9062_THERMAL=y
# CONFIG_MTK_THERMAL is not set

#
# Intel thermal drivers
#

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers
# end of Intel thermal drivers

#
# Broadcom thermal drivers
#
CONFIG_BCM2711_THERMAL=y
# CONFIG_BCM2835_THERMAL is not set
CONFIG_BRCMSTB_THERMAL=y
CONFIG_BCM_NS_THERMAL=y
CONFIG_BCM_SR_THERMAL=y
# end of Broadcom thermal drivers

#
# Texas Instruments thermal drivers
#
CONFIG_TI_SOC_THERMAL=y
CONFIG_TI_THERMAL=y
CONFIG_OMAP3_THERMAL=y
CONFIG_OMAP4_THERMAL=y
# CONFIG_OMAP5_THERMAL is not set
# CONFIG_DRA752_THERMAL is not set
# end of Texas Instruments thermal drivers

#
# Samsung thermal drivers
#
CONFIG_EXYNOS_THERMAL=y
# end of Samsung thermal drivers

# CONFIG_TANGO_THERMAL is not set

#
# Qualcomm thermal drivers
#
CONFIG_QCOM_TSENS=y
# end of Qualcomm thermal drivers

# CONFIG_ZX2967_THERMAL is not set
CONFIG_UNIPHIER_THERMAL=y
CONFIG_SPRD_THERMAL=y
# CONFIG_KHADAS_MCU_FAN_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_NOWAYOUT=y
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set

#
# Watchdog Pretimeout Governors
#
CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=y
# CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP is not set
CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=y
CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=y

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=y
# CONFIG_SOFT_WATCHDOG_PRETIMEOUT is not set
CONFIG_DA9052_WATCHDOG=y
CONFIG_DA9055_WATCHDOG=y
CONFIG_DA9063_WATCHDOG=y
CONFIG_DA9062_WATCHDOG=y
CONFIG_GPIO_WATCHDOG=y
# CONFIG_GPIO_WATCHDOG_ARCH_INITCALL is not set
CONFIG_MENF21BMC_WATCHDOG=y
CONFIG_MENZ069_WATCHDOG=y
# CONFIG_TANGOX_WATCHDOG is not set
# CONFIG_WM831X_WATCHDOG is not set
# CONFIG_WM8350_WATCHDOG is not set
CONFIG_XILINX_WATCHDOG=y
CONFIG_ZIIRAVE_WATCHDOG=y
# CONFIG_RAVE_SP_WATCHDOG is not set
CONFIG_MLX_WDT=y
CONFIG_ARMADA_37XX_WATCHDOG=y
CONFIG_ASM9260_WATCHDOG=y
CONFIG_AT91RM9200_WATCHDOG=y
# CONFIG_AT91SAM9X_WATCHDOG is not set
CONFIG_SAMA5D4_WATCHDOG=y
# CONFIG_CADENCE_WATCHDOG is not set
CONFIG_FTWDT010_WATCHDOG=y
CONFIG_S3C2410_WATCHDOG=y
CONFIG_DW_WATCHDOG=y
# CONFIG_EP93XX_WATCHDOG is not set
# CONFIG_OMAP_WATCHDOG is not set
CONFIG_PNX4008_WATCHDOG=y
# CONFIG_DAVINCI_WATCHDOG is not set
CONFIG_K3_RTI_WATCHDOG=y
CONFIG_RN5T618_WATCHDOG=y
# CONFIG_SUNXI_WATCHDOG is not set
# CONFIG_NPCM7XX_WATCHDOG is not set
CONFIG_TWL4030_WATCHDOG=y
CONFIG_STMP3XXX_RTC_WATCHDOG=y
CONFIG_TS4800_WATCHDOG=y
CONFIG_TS72XX_WATCHDOG=y
CONFIG_MAX63XX_WATCHDOG=y
CONFIG_MAX77620_WATCHDOG=y
CONFIG_IMX2_WDT=y
# CONFIG_IMX7ULP_WDT is not set
CONFIG_RETU_WATCHDOG=y
CONFIG_MOXART_WDT=y
CONFIG_SIRFSOC_WATCHDOG=y
CONFIG_ST_LPC_WATCHDOG=y
CONFIG_TEGRA_WATCHDOG=y
# CONFIG_QCOM_WDT is not set
CONFIG_MESON_GXBB_WATCHDOG=y
CONFIG_MESON_WATCHDOG=y
# CONFIG_MEDIATEK_WATCHDOG is not set
CONFIG_DIGICOLOR_WATCHDOG=y
CONFIG_LPC18XX_WATCHDOG=y
# CONFIG_ATLAS7_WATCHDOG is not set
# CONFIG_RENESAS_WDT is not set
# CONFIG_RENESAS_RZAWDT is not set
CONFIG_ASPEED_WATCHDOG=y
CONFIG_STPMIC1_WATCHDOG=y
CONFIG_UNIPHIER_WATCHDOG=y
CONFIG_RTD119X_WATCHDOG=y
CONFIG_SPRD_WATCHDOG=y
CONFIG_PM8916_WATCHDOG=y
CONFIG_ALIM7101_WDT=y
CONFIG_SC520_WDT=y
CONFIG_I6300ESB_WDT=y
CONFIG_KEMPLD_WDT=y
# CONFIG_RDC321X_WDT is not set
CONFIG_BCM47XX_WDT=y
CONFIG_JZ4740_WDT=y
CONFIG_WDT_MTX1=y
# CONFIG_SIBYTE_WDOG is not set
# CONFIG_AR7_WDT is not set
CONFIG_TXX9_WDT=y
CONFIG_BCM2835_WDT=y
CONFIG_BCM_KONA_WDT=y
# CONFIG_BCM_KONA_WDT_DEBUG is not set
CONFIG_BCM7038_WDT=y
CONFIG_IMGPDC_WDT=y
# CONFIG_PIC32_WDT is not set
# CONFIG_PIC32_DMT is not set
# CONFIG_MPC5200_WDT is not set
# CONFIG_MV64X60_WDT is not set
# CONFIG_MEN_A21_WDT is not set
CONFIG_UML_WATCHDOG=y

#
# ISA-based Watchdog Cards
#
# CONFIG_PCWATCHDOG is not set
# CONFIG_MIXCOMWD is not set
CONFIG_WDT=y

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=y
CONFIG_WDTPCI=y

#
# USB-based Watchdog Cards
#
CONFIG_USBPCWATCHDOG=y
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
# CONFIG_BCMA_HOST_PCI is not set
# CONFIG_BCMA_HOST_SOC is not set
# CONFIG_BCMA_DRIVER_PCI is not set
CONFIG_BCMA_DRIVER_MIPS=y
CONFIG_BCMA_PFLASH=y
CONFIG_BCMA_NFLASH=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_ACT8945A=y
CONFIG_MFD_SUN4I_GPADC=y
# CONFIG_MFD_AS3711 is not set
CONFIG_MFD_AS3722=y
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
CONFIG_MFD_AT91_USART=y
# CONFIG_MFD_ATMEL_FLEXCOM is not set
# CONFIG_MFD_ATMEL_HLCDC is not set
CONFIG_MFD_BCM590XX=y
CONFIG_MFD_BD9571MWV=y
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
CONFIG_MFD_CROS_EC_DEV=y
CONFIG_MFD_MADERA=y
CONFIG_MFD_MADERA_I2C=y
# CONFIG_MFD_MADERA_SPI is not set
CONFIG_MFD_CS47L15=y
CONFIG_MFD_CS47L35=y
CONFIG_MFD_CS47L85=y
CONFIG_MFD_CS47L90=y
# CONFIG_MFD_CS47L92 is not set
CONFIG_PMIC_DA903X=y
CONFIG_PMIC_DA9052=y
# CONFIG_MFD_DA9052_SPI is not set
CONFIG_MFD_DA9052_I2C=y
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
CONFIG_MFD_DLN2=y
# CONFIG_MFD_EXYNOS_LPASS is not set
CONFIG_MFD_GATEWORKS_GSC=y
CONFIG_MFD_MC13XXX=y
# CONFIG_MFD_MC13XXX_SPI is not set
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MP2629=y
CONFIG_MFD_MXS_LRADC=y
CONFIG_MFD_MX25_TSADC=y
# CONFIG_MFD_HI6421_PMIC is not set
# CONFIG_MFD_HI655X_PMIC is not set
CONFIG_HTC_PASIC3=y
CONFIG_HTC_I2CPLD=y
CONFIG_LPC_ICH=y
CONFIG_LPC_SCH=y
# CONFIG_MFD_IQS62X is not set
CONFIG_MFD_JANZ_CMODIO=y
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=y
# CONFIG_MFD_88PM860X is not set
CONFIG_MFD_MAX14577=y
CONFIG_MFD_MAX77620=y
# CONFIG_MFD_MAX77650 is not set
# CONFIG_MFD_MAX77686 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
CONFIG_MFD_MAX8925=y
# CONFIG_MFD_MAX8997 is not set
CONFIG_MFD_MAX8998=y
CONFIG_MFD_MT6360=y
# CONFIG_MFD_MT6397 is not set
CONFIG_MFD_MENF21BMC=y
# CONFIG_EZX_PCAP is not set
# CONFIG_MFD_CPCAP is not set
CONFIG_MFD_VIPERBOARD=y
CONFIG_MFD_RETU=y
CONFIG_MFD_PCF50633=y
CONFIG_PCF50633_ADC=y
# CONFIG_PCF50633_GPIO is not set
CONFIG_UCB1400_CORE=y
CONFIG_MFD_PM8XXX=y
CONFIG_MFD_SPMI_PMIC=y
CONFIG_MFD_RDC321X=y
CONFIG_MFD_RT5033=y
# CONFIG_MFD_RC5T583 is not set
CONFIG_MFD_RK808=y
CONFIG_MFD_RN5T618=y
# CONFIG_MFD_SEC_CORE is not set
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SKY81452 is not set
CONFIG_MFD_SC27XX_PMIC=y
CONFIG_ABX500_CORE=y
# CONFIG_AB3100_CORE is not set
CONFIG_MFD_STMPE=y

#
# STMicroelectronics STMPE Interface Drivers
#
CONFIG_STMPE_I2C=y
# CONFIG_STMPE_SPI is not set
# end of STMicroelectronics STMPE Interface Drivers

CONFIG_MFD_SUN6I_PRCM=y
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
CONFIG_MFD_LP3943=y
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
CONFIG_MFD_OMAP_USB_HOST=y
# CONFIG_MFD_PALMAS is not set
CONFIG_TPS6105X=y
CONFIG_TPS65010=y
CONFIG_TPS6507X=y
CONFIG_MFD_TPS65086=y
# CONFIG_MFD_TPS65090 is not set
CONFIG_MFD_TPS65217=y
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TI_LP87565 is not set
# CONFIG_MFD_TPS65218 is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_MFD_TPS80031 is not set
CONFIG_TWL4030_CORE=y
CONFIG_MFD_TWL4030_AUDIO=y
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=y
# CONFIG_MFD_LM3533 is not set
CONFIG_MFD_TIMBERDALE=y
CONFIG_MFD_TC3589X=y
# CONFIG_MFD_TQMX86 is not set
# CONFIG_MFD_VX855 is not set
# CONFIG_MFD_LOCHNAGAR is not set
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
CONFIG_MFD_ARIZONA_SPI=y
# CONFIG_MFD_CS47L24 is not set
CONFIG_MFD_WM5102=y
# CONFIG_MFD_WM5110 is not set
CONFIG_MFD_WM8997=y
CONFIG_MFD_WM8998=y
# CONFIG_MFD_WM8400 is not set
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
# CONFIG_MFD_WM831X_SPI is not set
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
CONFIG_MFD_WM8994=y
CONFIG_MFD_STW481X=y
CONFIG_MFD_ROHM_BD718XX=y
# CONFIG_MFD_ROHM_BD70528 is not set
CONFIG_MFD_ROHM_BD71828=y
# CONFIG_MFD_STM32_LPTIMER is not set
# CONFIG_MFD_STM32_TIMERS is not set
CONFIG_MFD_STPMIC1=y
CONFIG_MFD_STMFX=y
# CONFIG_MFD_WCD934X is not set
CONFIG_MFD_KHADAS_MCU=y
CONFIG_RAVE_SP_CORE=y
CONFIG_SGI_MFD_IOC3=y
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
CONFIG_REGULATOR_88PG86X=y
CONFIG_REGULATOR_88PM800=y
CONFIG_REGULATOR_ACT8865=y
# CONFIG_REGULATOR_ACT8945A is not set
# CONFIG_REGULATOR_AD5398 is not set
# CONFIG_REGULATOR_ANATOP is not set
CONFIG_REGULATOR_ARIZONA_LDO1=y
# CONFIG_REGULATOR_ARIZONA_MICSUPP is not set
CONFIG_REGULATOR_AS3722=y
CONFIG_REGULATOR_AXP20X=y
# CONFIG_REGULATOR_BCM590XX is not set
CONFIG_REGULATOR_BD71828=y
CONFIG_REGULATOR_BD718XX=y
# CONFIG_REGULATOR_BD9571MWV is not set
# CONFIG_REGULATOR_CROS_EC is not set
# CONFIG_REGULATOR_DA9052 is not set
CONFIG_REGULATOR_DA9210=y
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=y
CONFIG_REGULATOR_FAN53880=y
# CONFIG_REGULATOR_GPIO is not set
# CONFIG_REGULATOR_ISL9305 is not set
CONFIG_REGULATOR_ISL6271A=y
# CONFIG_REGULATOR_LP3971 is not set
# CONFIG_REGULATOR_LP3972 is not set
# CONFIG_REGULATOR_LP872X is not set
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX14577=y
CONFIG_REGULATOR_MAX1586=y
CONFIG_REGULATOR_MAX77620=y
# CONFIG_REGULATOR_MAX8649 is not set
# CONFIG_REGULATOR_MAX8660 is not set
# CONFIG_REGULATOR_MAX8925 is not set
CONFIG_REGULATOR_MAX8952=y
CONFIG_REGULATOR_MAX8973=y
CONFIG_REGULATOR_MAX8998=y
CONFIG_REGULATOR_MAX77826=y
CONFIG_REGULATOR_MC13XXX_CORE=y
# CONFIG_REGULATOR_MC13783 is not set
CONFIG_REGULATOR_MC13892=y
CONFIG_REGULATOR_MCP16502=y
# CONFIG_REGULATOR_MP5416 is not set
CONFIG_REGULATOR_MP8859=y
# CONFIG_REGULATOR_MP886X is not set
# CONFIG_REGULATOR_MPQ7920 is not set
# CONFIG_REGULATOR_MT6311 is not set
# CONFIG_REGULATOR_MT6380 is not set
CONFIG_REGULATOR_PBIAS=y
CONFIG_REGULATOR_PCA9450=y
CONFIG_REGULATOR_PCF50633=y
CONFIG_REGULATOR_PFUZE100=y
# CONFIG_REGULATOR_PV88060 is not set
CONFIG_REGULATOR_PV88080=y
# CONFIG_REGULATOR_PV88090 is not set
CONFIG_REGULATOR_PWM=y
# CONFIG_REGULATOR_QCOM_RPMH is not set
CONFIG_REGULATOR_QCOM_SPMI=y
CONFIG_REGULATOR_QCOM_USB_VBUS=y
# CONFIG_REGULATOR_RK808 is not set
CONFIG_REGULATOR_RN5T618=y
CONFIG_REGULATOR_ROHM=y
# CONFIG_REGULATOR_RT5033 is not set
# CONFIG_REGULATOR_SC2731 is not set
# CONFIG_REGULATOR_SLG51000 is not set
# CONFIG_REGULATOR_STM32_BOOSTER is not set
# CONFIG_REGULATOR_STM32_VREFBUF is not set
CONFIG_REGULATOR_STM32_PWR=y
CONFIG_REGULATOR_STPMIC1=y
CONFIG_REGULATOR_STW481X_VMMC=y
CONFIG_REGULATOR_SY8106A=y
# CONFIG_REGULATOR_SY8824X is not set
# CONFIG_REGULATOR_SY8827N is not set
CONFIG_REGULATOR_TPS51632=y
CONFIG_REGULATOR_TPS6105X=y
# CONFIG_REGULATOR_TPS62360 is not set
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=y
# CONFIG_REGULATOR_TPS65086 is not set
# CONFIG_REGULATOR_TPS65132 is not set
CONFIG_REGULATOR_TPS65217=y
CONFIG_REGULATOR_TPS6524X=y
# CONFIG_REGULATOR_TPS65912 is not set
CONFIG_REGULATOR_TWL4030=y
CONFIG_REGULATOR_UNIPHIER=y
CONFIG_REGULATOR_VCTRL=y
CONFIG_REGULATOR_WM831X=y
CONFIG_REGULATOR_WM8350=y
# CONFIG_REGULATOR_WM8994 is not set
# CONFIG_REGULATOR_QCOM_LABIBB is not set
CONFIG_RC_CORE=y
CONFIG_RC_MAP=y
CONFIG_LIRC=y
CONFIG_BPF_LIRC_MODE2=y
CONFIG_RC_DECODERS=y
# CONFIG_IR_NEC_DECODER is not set
CONFIG_IR_RC5_DECODER=y
CONFIG_IR_RC6_DECODER=y
# CONFIG_IR_JVC_DECODER is not set
# CONFIG_IR_SONY_DECODER is not set
# CONFIG_IR_SANYO_DECODER is not set
CONFIG_IR_SHARP_DECODER=y
CONFIG_IR_MCE_KBD_DECODER=y
CONFIG_IR_XMP_DECODER=y
# CONFIG_IR_IMON_DECODER is not set
CONFIG_IR_RCMM_DECODER=y
# CONFIG_RC_DEVICES is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y
CONFIG_CEC_PIN=y
# CONFIG_MEDIA_CEC_RC is not set
CONFIG_CEC_PIN_ERROR_INJ=y
CONFIG_MEDIA_CEC_SUPPORT=y
CONFIG_CEC_CH7322=y
# CONFIG_CEC_CROS_EC is not set
CONFIG_CEC_MESON_AO=y
CONFIG_CEC_MESON_G12A_AO=y
CONFIG_CEC_GPIO=y
CONFIG_CEC_SAMSUNG_S5P=y
# CONFIG_CEC_STI is not set
CONFIG_CEC_STM32=y
CONFIG_CEC_TEGRA=y
CONFIG_CEC_SECO=y
# CONFIG_CEC_SECO_RC is not set
CONFIG_USB_PULSE8_CEC=y
CONFIG_USB_RAINSHADOW_CEC=y
# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
CONFIG_IMX_IPUV3_CORE=y
CONFIG_DRM=y
CONFIG_DRM_MIPI_DBI=y
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DP_AUX_CHARDEV=y
CONFIG_DRM_DEBUG_MM=y
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_KMS_FB_HELPER=y
# CONFIG_DRM_FBDEV_EMULATION is not set
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_DP_CEC=y
CONFIG_DRM_TTM=y
CONFIG_DRM_TTM_DMA_PAGE_POOL=y
CONFIG_DRM_VRAM_HELPER=y
CONFIG_DRM_TTM_HELPER=y
CONFIG_DRM_GEM_CMA_HELPER=y
CONFIG_DRM_KMS_CMA_HELPER=y
CONFIG_DRM_GEM_SHMEM_HELPER=y
CONFIG_DRM_SCHED=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=y
CONFIG_DRM_I2C_SIL164=y
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# CONFIG_DRM_HDLCD is not set
CONFIG_DRM_MALI_DISPLAY=y
CONFIG_DRM_KOMEDA=y
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
CONFIG_DRM_NOUVEAU=y
# CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
CONFIG_NOUVEAU_DEBUG=5
CONFIG_NOUVEAU_DEBUG_DEFAULT=3
CONFIG_NOUVEAU_DEBUG_MMU=y
# CONFIG_NOUVEAU_DEBUG_PUSH is not set
# CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
CONFIG_DRM_VGEM=y
# CONFIG_DRM_VKMS is not set
# CONFIG_DRM_EXYNOS is not set
# CONFIG_DRM_ROCKCHIP is not set
# CONFIG_DRM_UDL is not set
# CONFIG_DRM_AST is not set
# CONFIG_DRM_MGAG200 is not set
# CONFIG_DRM_RCAR_DW_HDMI is not set
# CONFIG_DRM_RCAR_LVDS is not set
CONFIG_DRM_QXL=y
CONFIG_DRM_BOCHS=y
# CONFIG_DRM_VIRTIO_GPU is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_ARM_VERSATILE is not set
CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596=y
CONFIG_DRM_PANEL_BOE_HIMAX8279D=y
CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=y
# CONFIG_DRM_PANEL_LVDS is not set
CONFIG_DRM_PANEL_SIMPLE=y
CONFIG_DRM_PANEL_ELIDA_KD35T133=y
# CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02 is not set
CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D=y
CONFIG_DRM_PANEL_ILITEK_IL9322=y
CONFIG_DRM_PANEL_ILITEK_ILI9881C=y
CONFIG_DRM_PANEL_INNOLUX_P079ZCA=y
CONFIG_DRM_PANEL_JDI_LT070ME05000=y
CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04=y
# CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W is not set
# CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829 is not set
# CONFIG_DRM_PANEL_SAMSUNG_LD9040 is not set
CONFIG_DRM_PANEL_LG_LB035Q02=y
# CONFIG_DRM_PANEL_LG_LG4573 is not set
CONFIG_DRM_PANEL_NEC_NL8048HL11=y
# CONFIG_DRM_PANEL_NOVATEK_NT35510 is not set
# CONFIG_DRM_PANEL_NOVATEK_NT39016 is not set
CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO=y
CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
# CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS is not set
# CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00 is not set
CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=y
CONFIG_DRM_PANEL_RAYDIUM_RM67191=y
# CONFIG_DRM_PANEL_RAYDIUM_RM68200 is not set
CONFIG_DRM_PANEL_RONBO_RB070D30=y
# CONFIG_DRM_PANEL_SAMSUNG_S6D16D0 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=y
CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=y
CONFIG_DRM_PANEL_SAMSUNG_S6E63M0=y
# CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0 is not set
# CONFIG_DRM_PANEL_SEIKO_43WVF1G is not set
CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=y
CONFIG_DRM_PANEL_SHARP_LS037V7DW01=y
# CONFIG_DRM_PANEL_SHARP_LS043T1LE01 is not set
CONFIG_DRM_PANEL_SITRONIX_ST7701=y
CONFIG_DRM_PANEL_SITRONIX_ST7703=y
CONFIG_DRM_PANEL_SITRONIX_ST7789V=y
# CONFIG_DRM_PANEL_SONY_ACX424AKP is not set
CONFIG_DRM_PANEL_SONY_ACX565AKM=y
# CONFIG_DRM_PANEL_TPO_TD028TTEC1 is not set
CONFIG_DRM_PANEL_TPO_TD043MTEA1=y
CONFIG_DRM_PANEL_TPO_TPG110=y
CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=y
# CONFIG_DRM_PANEL_VISIONOX_RM69299 is not set
CONFIG_DRM_PANEL_XINPENG_XPP055C272=y
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_CDNS_DSI=y
CONFIG_DRM_CHRONTEL_CH7033=y
CONFIG_DRM_DISPLAY_CONNECTOR=y
CONFIG_DRM_LVDS_CODEC=y
CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW=y
CONFIG_DRM_NWL_MIPI_DSI=y
CONFIG_DRM_NXP_PTN3460=y
CONFIG_DRM_PARADE_PS8622=y
CONFIG_DRM_PARADE_PS8640=y
CONFIG_DRM_SIL_SII8620=y
CONFIG_DRM_SII902X=y
# CONFIG_DRM_SII9234 is not set
CONFIG_DRM_SIMPLE_BRIDGE=y
# CONFIG_DRM_THINE_THC63LVD1024 is not set
# CONFIG_DRM_TOSHIBA_TC358764 is not set
CONFIG_DRM_TOSHIBA_TC358767=y
CONFIG_DRM_TOSHIBA_TC358768=y
# CONFIG_DRM_TI_TFP410 is not set
CONFIG_DRM_TI_SN65DSI86=y
CONFIG_DRM_TI_TPD12S015=y
# CONFIG_DRM_ANALOGIX_ANX6345 is not set
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# CONFIG_DRM_I2C_ADV7511 is not set
# end of Display Interface Bridges

CONFIG_DRM_IMX=y
# CONFIG_DRM_IMX_PARALLEL_DISPLAY is not set
# CONFIG_DRM_IMX_TVE is not set
CONFIG_DRM_IMX_LDB=y
# CONFIG_DRM_IMX_HDMI is not set
CONFIG_DRM_INGENIC=y
CONFIG_DRM_INGENIC_IPU=y
CONFIG_DRM_V3D=y
CONFIG_DRM_VC4=y
# CONFIG_DRM_VC4_HDMI_CEC is not set
CONFIG_DRM_ETNAVIV=y
# CONFIG_DRM_ETNAVIV_THERMAL is not set
CONFIG_DRM_ARCPGU=y
CONFIG_DRM_MXS=y
CONFIG_DRM_MXSFB=y
# CONFIG_DRM_CIRRUS_QEMU is not set
CONFIG_DRM_GM12U320=y
CONFIG_TINYDRM_HX8357D=y
CONFIG_TINYDRM_ILI9225=y
# CONFIG_TINYDRM_ILI9341 is not set
CONFIG_TINYDRM_ILI9486=y
# CONFIG_TINYDRM_MI0283QT is not set
CONFIG_TINYDRM_REPAPER=y
CONFIG_TINYDRM_ST7586=y
CONFIG_TINYDRM_ST7735R=y
CONFIG_DRM_PL111=y
CONFIG_DRM_TVE200=y
# CONFIG_DRM_LIMA is not set
CONFIG_DRM_PANFROST=y
# CONFIG_DRM_ASPEED_GFX is not set
CONFIG_DRM_MCDE=y
CONFIG_DRM_TIDSS=y
# CONFIG_DRM_ZYNQMP_DPSUB is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_DDC=y
CONFIG_FB_BOOT_VESA_SUPPORT=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_CFB_REV_PIXELS_IN_BYTE=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_SVGALIB=y
CONFIG_FB_MACMODES=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
CONFIG_FB_CIRRUS=y
# CONFIG_FB_PM2 is not set
CONFIG_FB_CLPS711X=y
CONFIG_FB_IMX=y
CONFIG_FB_CYBER2000=y
# CONFIG_FB_CYBER2000_DDC is not set
CONFIG_FB_ARC=y
CONFIG_FB_CONTROL=y
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
CONFIG_FB_GBE=y
CONFIG_FB_GBE_MEM=4
CONFIG_FB_PVR2=y
# CONFIG_FB_OPENCORES is not set
CONFIG_FB_S1D13XXX=y
CONFIG_FB_ATMEL=y
CONFIG_FB_NVIDIA=y
CONFIG_FB_NVIDIA_I2C=y
# CONFIG_FB_NVIDIA_DEBUG is not set
CONFIG_FB_NVIDIA_BACKLIGHT=y
CONFIG_FB_RIVA=y
CONFIG_FB_RIVA_I2C=y
CONFIG_FB_RIVA_DEBUG=y
CONFIG_FB_RIVA_BACKLIGHT=y
# CONFIG_FB_I740 is not set
CONFIG_FB_MATROX=y
CONFIG_FB_MATROX_MILLENIUM=y
# CONFIG_FB_MATROX_MYSTIQUE is not set
CONFIG_FB_MATROX_G=y
CONFIG_FB_MATROX_I2C=y
# CONFIG_FB_MATROX_MAVEN is not set
CONFIG_FB_RADEON=y
# CONFIG_FB_RADEON_I2C is not set
# CONFIG_FB_RADEON_BACKLIGHT is not set
CONFIG_FB_RADEON_DEBUG=y
CONFIG_FB_ATY128=y
# CONFIG_FB_ATY128_BACKLIGHT is not set
CONFIG_FB_ATY=y
# CONFIG_FB_ATY_CT is not set
CONFIG_FB_ATY_GX=y
# CONFIG_FB_ATY_BACKLIGHT is not set
CONFIG_FB_S3=y
# CONFIG_FB_S3_DDC is not set
CONFIG_FB_SAVAGE=y
CONFIG_FB_SAVAGE_I2C=y
CONFIG_FB_SAVAGE_ACCEL=y
CONFIG_FB_SIS=y
# CONFIG_FB_SIS_300 is not set
CONFIG_FB_SIS_315=y
CONFIG_FB_VIA=y
# CONFIG_FB_VIA_DIRECT_PROCFS is not set
# CONFIG_FB_VIA_X_COMPATIBILITY is not set
CONFIG_FB_NEOMAGIC=y
CONFIG_FB_KYRO=y
CONFIG_FB_3DFX=y
CONFIG_FB_3DFX_ACCEL=y
# CONFIG_FB_3DFX_I2C is not set
CONFIG_FB_VOODOO1=y
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
CONFIG_FB_ARK=y
CONFIG_FB_PM3=y
# CONFIG_FB_CARMINE is not set
CONFIG_FB_WM8505=y
# CONFIG_FB_WMT_GE_ROPS is not set
CONFIG_FB_PXA168=y
CONFIG_FB_W100=y
CONFIG_FB_SH_MOBILE_LCDC=y
# CONFIG_FB_TMIO is not set
# CONFIG_FB_S3C is not set
CONFIG_FB_SMSCUFX=y
CONFIG_FB_UDL=y
CONFIG_FB_IBM_GXT4500=y
# CONFIG_FB_GOLDFISH is not set
CONFIG_FB_DA8XX=y
CONFIG_FB_VIRTUAL=y
CONFIG_FB_METRONOME=y
CONFIG_FB_MB862XX=y
CONFIG_FB_MB862XX_PCI_GDC=y
CONFIG_FB_MB862XX_I2C=y
CONFIG_FB_BROADSHEET=y
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_SM712 is not set
CONFIG_FB_OMAP2=y
CONFIG_FB_OMAP2_DEBUG_SUPPORT=y
CONFIG_FB_OMAP2_NUM_FBS=3
CONFIG_FB_OMAP2_DSS_INIT=y
CONFIG_FB_OMAP2_DSS=y
# CONFIG_FB_OMAP2_DSS_DEBUG is not set
# CONFIG_FB_OMAP2_DSS_DEBUGFS is not set
# CONFIG_FB_OMAP2_DSS_DPI is not set
CONFIG_FB_OMAP2_DSS_VENC=y
CONFIG_FB_OMAP2_DSS_HDMI_COMMON=y
CONFIG_FB_OMAP4_DSS_HDMI=y
CONFIG_FB_OMAP5_DSS_HDMI=y
CONFIG_FB_OMAP2_DSS_SDI=y
# CONFIG_FB_OMAP2_DSS_DSI is not set
CONFIG_FB_OMAP2_DSS_MIN_FCK_PER_PCK=0
CONFIG_FB_OMAP2_DSS_SLEEP_AFTER_VENC_RESET=y

#
# OMAPFB Panel and Encoder Drivers
#
CONFIG_FB_OMAP2_ENCODER_OPA362=y
CONFIG_FB_OMAP2_ENCODER_TFP410=y
CONFIG_FB_OMAP2_ENCODER_TPD12S015=y
CONFIG_FB_OMAP2_CONNECTOR_DVI=y
CONFIG_FB_OMAP2_CONNECTOR_HDMI=y
CONFIG_FB_OMAP2_CONNECTOR_ANALOG_TV=y
CONFIG_FB_OMAP2_PANEL_DPI=y
# CONFIG_FB_OMAP2_PANEL_DSI_CM is not set
# CONFIG_FB_OMAP2_PANEL_LGPHILIPS_LB035Q02 is not set
CONFIG_FB_OMAP2_PANEL_TPO_TD028TTEC1=y
# end of OMAPFB Panel and Encoder Drivers

# CONFIG_MMP_DISP is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
# CONFIG_LCD_L4F00242T03 is not set
CONFIG_LCD_LMS283GF05=y
CONFIG_LCD_LTV350QV=y
CONFIG_LCD_ILI922X=y
# CONFIG_LCD_ILI9320 is not set
CONFIG_LCD_TDO24M=y
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=y
# CONFIG_LCD_AMS369FG06 is not set
# CONFIG_LCD_LMS501KF03 is not set
CONFIG_LCD_HX8357=y
CONFIG_LCD_OTM3225A=y
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_ATMEL_LCDC is not set
CONFIG_BACKLIGHT_PWM=y
CONFIG_BACKLIGHT_DA903X=y
# CONFIG_BACKLIGHT_DA9052 is not set
CONFIG_BACKLIGHT_MAX8925=y
CONFIG_BACKLIGHT_QCOM_WLED=y
# CONFIG_BACKLIGHT_WM831X is not set
CONFIG_BACKLIGHT_ADP8860=y
CONFIG_BACKLIGHT_ADP8870=y
# CONFIG_BACKLIGHT_PCF50633 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
CONFIG_BACKLIGHT_LM3639=y
CONFIG_BACKLIGHT_LP855X=y
CONFIG_BACKLIGHT_PANDORA=y
CONFIG_BACKLIGHT_TPS65217=y
CONFIG_BACKLIGHT_GPIO=y
CONFIG_BACKLIGHT_LV5207LP=y
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# CONFIG_BACKLIGHT_RAVE_SP is not set
# CONFIG_BACKLIGHT_LED is not set
# end of Backlight & LCD device support

CONFIG_VGASTATE=y
CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
# CONFIG_VGACON_SOFT_SCROLLBACK is not set
CONFIG_MDA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
CONFIG_LOGO_LINUX_MONO=y
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

CONFIG_SOUND=y
CONFIG_SOUND_OSS_CORE=y
CONFIG_SOUND_OSS_CORE_PRECLAIM=y
CONFIG_SND=y
CONFIG_SND_TIMER=y
CONFIG_SND_PCM=y
CONFIG_SND_PCM_ELD=y
CONFIG_SND_PCM_IEC958=y
CONFIG_SND_DMAENGINE_PCM=y
CONFIG_SND_HWDEP=y
CONFIG_SND_SEQ_DEVICE=y
CONFIG_SND_RAWMIDI=y
CONFIG_SND_COMPRESS_OFFLOAD=y
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
CONFIG_SND_OSSEMUL=y
CONFIG_SND_MIXER_OSS=y
# CONFIG_SND_PCM_OSS is not set
CONFIG_SND_PCM_TIMER=y
# CONFIG_SND_HRTIMER is not set
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
CONFIG_SND_SUPPORT_OLD_API=y
CONFIG_SND_PROC_FS=y
CONFIG_SND_VERBOSE_PROCFS=y
# CONFIG_SND_VERBOSE_PRINTK is not set
# CONFIG_SND_DEBUG is not set
CONFIG_SND_VMASTER=y
CONFIG_SND_SEQUENCER=y
CONFIG_SND_SEQ_DUMMY=y
CONFIG_SND_SEQUENCER_OSS=y
CONFIG_SND_SEQ_MIDI_EVENT=y
CONFIG_SND_SEQ_MIDI=y
CONFIG_SND_SEQ_VIRMIDI=y
CONFIG_SND_AC97_CODEC=y
CONFIG_SND_DRIVERS=y
CONFIG_SND_DUMMY=y
# CONFIG_SND_ALOOP is not set
CONFIG_SND_VIRMIDI=y
CONFIG_SND_MTPAV=y
CONFIG_SND_MTS64=y
# CONFIG_SND_SERIAL_U16550 is not set
# CONFIG_SND_MPU401 is not set
CONFIG_SND_PORTMAN2X4=y
# CONFIG_SND_AC97_POWER_SAVE is not set
# CONFIG_SND_ISA is not set
# CONFIG_SND_PCI is not set

#
# HD-Audio
#
CONFIG_SND_HDA=y
CONFIG_SND_HDA_GENERIC_LEDS=y
# CONFIG_SND_HDA_HWDEP is not set
CONFIG_SND_HDA_RECONFIG=y
# CONFIG_SND_HDA_INPUT_BEEP is not set
CONFIG_SND_HDA_PATCH_LOADER=y
CONFIG_SND_HDA_CODEC_REALTEK=y
CONFIG_SND_HDA_CODEC_ANALOG=y
# CONFIG_SND_HDA_CODEC_SIGMATEL is not set
CONFIG_SND_HDA_CODEC_VIA=y
CONFIG_SND_HDA_CODEC_HDMI=y
CONFIG_SND_HDA_CODEC_CIRRUS=y
CONFIG_SND_HDA_CODEC_CONEXANT=y
CONFIG_SND_HDA_CODEC_CA0110=y
CONFIG_SND_HDA_CODEC_CA0132=y
CONFIG_SND_HDA_CODEC_CA0132_DSP=y
# CONFIG_SND_HDA_CODEC_CMEDIA is not set
CONFIG_SND_HDA_CODEC_SI3054=y
CONFIG_SND_HDA_GENERIC=y
CONFIG_SND_HDA_POWER_SAVE_DEFAULT=0
# end of HD-Audio

CONFIG_SND_HDA_CORE=y
CONFIG_SND_HDA_DSP_LOADER=y
CONFIG_SND_HDA_COMPONENT=y
CONFIG_SND_HDA_EXT_CORE=y
CONFIG_SND_HDA_PREALLOC_SIZE=64
CONFIG_SND_PXA2XX_LIB=y
# CONFIG_SND_SPI is not set
CONFIG_SND_MIPS=y
# CONFIG_SND_USB is not set
CONFIG_SND_FIREWIRE=y
CONFIG_SND_FIREWIRE_LIB=y
CONFIG_SND_DICE=y
CONFIG_SND_OXFW=y
CONFIG_SND_ISIGHT=y
CONFIG_SND_FIREWORKS=y
CONFIG_SND_BEBOB=y
CONFIG_SND_FIREWIRE_DIGI00X=y
CONFIG_SND_FIREWIRE_TASCAM=y
# CONFIG_SND_FIREWIRE_MOTU is not set
CONFIG_SND_FIREFACE=y
CONFIG_SND_PCMCIA=y
# CONFIG_SND_VXPOCKET is not set
CONFIG_SND_PDAUDIOCF=y
CONFIG_SND_SOC=y
CONFIG_SND_SOC_AC97_BUS=y
CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
CONFIG_SND_SOC_COMPRESS=y
CONFIG_SND_SOC_TOPOLOGY=y
CONFIG_SND_SOC_ADI=y
CONFIG_SND_SOC_ADI_AXI_I2S=y
CONFIG_SND_SOC_ADI_AXI_SPDIF=y
CONFIG_SND_SOC_AMD_ACP=y
# CONFIG_SND_SOC_AMD_CZ_DA7219MX98357_MACH is not set
# CONFIG_SND_SOC_AMD_CZ_RT5645_MACH is not set
CONFIG_SND_ATMEL_SOC=y
CONFIG_SND_ATMEL_SOC_PDC=y
CONFIG_SND_ATMEL_SOC_DMA=y
CONFIG_SND_ATMEL_SOC_SSC=y
CONFIG_SND_ATMEL_SOC_SSC_PDC=y
CONFIG_SND_ATMEL_SOC_SSC_DMA=y
CONFIG_SND_AT91_SOC_SAM9G20_WM8731=y
CONFIG_SND_ATMEL_SOC_WM8904=y
CONFIG_SND_AT91_SOC_SAM9X5_WM8731=y
CONFIG_SND_ATMEL_SOC_CLASSD=y
CONFIG_SND_ATMEL_SOC_PDMIC=y
CONFIG_SND_ATMEL_SOC_I2S=y
# CONFIG_SND_SOC_MIKROE_PROTO is not set
CONFIG_SND_MCHP_SOC_I2S_MCC=y
# CONFIG_SND_BCM2835_SOC_I2S is not set
# CONFIG_SND_SOC_CYGNUS is not set
CONFIG_SND_BCM63XX_I2S_WHISTLER=y
CONFIG_SND_EP93XX_SOC=y
CONFIG_SND_DESIGNWARE_I2S=y
# CONFIG_SND_DESIGNWARE_PCM is not set

#
# SoC Audio for Freescale CPUs
#

#
# Common SoC Audio options for Freescale CPUs:
#
CONFIG_SND_SOC_FSL_ASRC=y
CONFIG_SND_SOC_FSL_SAI=y
CONFIG_SND_SOC_FSL_MQS=y
CONFIG_SND_SOC_FSL_AUDMIX=y
# CONFIG_SND_SOC_FSL_SSI is not set
CONFIG_SND_SOC_FSL_SPDIF=y
CONFIG_SND_SOC_FSL_ESAI=y
CONFIG_SND_SOC_FSL_MICFIL=y
CONFIG_SND_SOC_FSL_EASRC=y
# CONFIG_SND_SOC_IMX_AUDMUX is not set
# CONFIG_SND_IMX_SOC is not set
# end of SoC Audio for Freescale CPUs

CONFIG_SND_I2S_HI6210_I2S=y
# CONFIG_SND_JZ4740_SOC_I2S is not set
CONFIG_SND_KIRKWOOD_SOC=y
# CONFIG_SND_KIRKWOOD_SOC_ARMADA370_DB is not set
CONFIG_SND_SOC_IMG=y
CONFIG_SND_SOC_IMG_I2S_IN=y
# CONFIG_SND_SOC_IMG_I2S_OUT is not set
CONFIG_SND_SOC_IMG_PARALLEL_OUT=y
CONFIG_SND_SOC_IMG_SPDIF_IN=y
CONFIG_SND_SOC_IMG_SPDIF_OUT=y
CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC=y
# CONFIG_SND_SOC_INTEL_SST_TOPLEVEL is not set
CONFIG_SND_SOC_INTEL_KEEMBAY=y
CONFIG_SND_SOC_INTEL_MACH=y
# CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES is not set
CONFIG_SND_SOC_MTK_BTCVSD=y

#
# ASoC support for Amlogic platforms
#
CONFIG_SND_MESON_AIU=y
# CONFIG_SND_MESON_AXG_FRDDR is not set
# CONFIG_SND_MESON_AXG_TODDR is not set
CONFIG_SND_MESON_AXG_TDM_FORMATTER=y
CONFIG_SND_MESON_AXG_TDM_INTERFACE=y
CONFIG_SND_MESON_AXG_TDMIN=y
CONFIG_SND_MESON_AXG_TDMOUT=y
# CONFIG_SND_MESON_AXG_SOUND_CARD is not set
# CONFIG_SND_MESON_AXG_SPDIFOUT is not set
CONFIG_SND_MESON_AXG_SPDIFIN=y
# CONFIG_SND_MESON_AXG_PDM is not set
CONFIG_SND_MESON_CARD_UTILS=y
CONFIG_SND_MESON_CODEC_GLUE=y
CONFIG_SND_MESON_GX_SOUND_CARD=y
CONFIG_SND_MESON_G12A_TOACODEC=y
# CONFIG_SND_MESON_G12A_TOHDMITX is not set
# CONFIG_SND_SOC_MESON_T9015 is not set
# end of ASoC support for Amlogic platforms

CONFIG_SND_MXS_SOC=y
# CONFIG_SND_SOC_MXS_SGTL5000 is not set
CONFIG_SND_PXA2XX_SOC=y
# CONFIG_SND_SOC_QCOM is not set
CONFIG_SND_SOC_ROCKCHIP=y
CONFIG_SND_SOC_ROCKCHIP_I2S=y
CONFIG_SND_SOC_ROCKCHIP_PDM=y
CONFIG_SND_SOC_ROCKCHIP_SPDIF=y
CONFIG_SND_SOC_ROCKCHIP_MAX98090=y
# CONFIG_SND_SOC_ROCKCHIP_RT5645 is not set
# CONFIG_SND_SOC_RK3288_HDMI_ANALOG is not set
CONFIG_SND_SOC_RK3399_GRU_SOUND=y
CONFIG_SND_SOC_SAMSUNG=y
CONFIG_SND_SAMSUNG_PCM=y
CONFIG_SND_SAMSUNG_SPDIF=y
CONFIG_SND_SAMSUNG_I2S=y
CONFIG_SND_SOC_SAMSUNG_SMDK_WM8580=y
CONFIG_SND_SOC_SAMSUNG_SMDK_WM8994=y
CONFIG_SND_SOC_SMARTQ=y
CONFIG_SND_SOC_SAMSUNG_SMDK_SPDIF=y
# CONFIG_SND_SOC_SMDK_WM8994_PCM is not set
# CONFIG_SND_SOC_SPEYSIDE is not set
CONFIG_SND_SOC_TOBERMORY=y
# CONFIG_SND_SOC_LOWLAND is not set
# CONFIG_SND_SOC_LITTLEMILL is not set
CONFIG_SND_SOC_SNOW=y
CONFIG_SND_SOC_ODROID=y
# CONFIG_SND_SOC_ARNDALE is not set
CONFIG_SND_SOC_SAMSUNG_MIDAS_WM1811=y

#
# SoC Audio support for Renesas SoCs
#
# CONFIG_SND_SOC_SH4_FSI is not set
CONFIG_SND_SOC_RCAR=y
# end of SoC Audio support for Renesas SoCs

# CONFIG_SND_SOC_SIRF is not set
CONFIG_SND_SOC_SOF_TOPLEVEL=y
# CONFIG_SND_SOC_SOF_PCI is not set
CONFIG_SND_SOC_SOF_ACPI=y
# CONFIG_SND_SOC_SOF_OF is not set
# CONFIG_SND_SOC_SOF_DEBUG_PROBES is not set
CONFIG_SND_SOC_SOF=y
CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL=y
CONFIG_SND_SOC_SOF_INTEL_ACPI=y
# CONFIG_SND_SOC_SOF_BAYTRAIL_SUPPORT is not set
# CONFIG_SND_SOC_SOF_BROADWELL_SUPPORT is not set
CONFIG_SND_SOC_SPRD=y
CONFIG_SND_SOC_SPRD_MCDT=y
# CONFIG_SND_SOC_STI is not set

#
# STMicroelectronics STM32 SOC audio support
#
CONFIG_SND_SOC_STM32_SAI=y
CONFIG_SND_SOC_STM32_I2S=y
CONFIG_SND_SOC_STM32_SPDIFRX=y
# end of STMicroelectronics STM32 SOC audio support

#
# Allwinner SoC Audio support
#
CONFIG_SND_SUN4I_CODEC=y
# CONFIG_SND_SUN8I_CODEC is not set
# CONFIG_SND_SUN8I_CODEC_ANALOG is not set
CONFIG_SND_SUN50I_CODEC_ANALOG=y
CONFIG_SND_SUN4I_I2S=y
# CONFIG_SND_SUN4I_SPDIF is not set
CONFIG_SND_SUN8I_ADDA_PR_REGMAP=y
# end of Allwinner SoC Audio support

CONFIG_SND_SOC_TEGRA=y
# CONFIG_SND_SOC_TEGRA20_AC97 is not set
CONFIG_SND_SOC_TEGRA20_DAS=y
CONFIG_SND_SOC_TEGRA20_I2S=y
CONFIG_SND_SOC_TEGRA20_SPDIF=y
CONFIG_SND_SOC_TEGRA30_AHUB=y
CONFIG_SND_SOC_TEGRA30_I2S=y
CONFIG_SND_SOC_TEGRA210_AHUB=y
CONFIG_SND_SOC_TEGRA210_DMIC=y
# CONFIG_SND_SOC_TEGRA210_I2S is not set
CONFIG_SND_SOC_TEGRA186_DSPK=y
CONFIG_SND_SOC_TEGRA210_ADMAIF=y
# CONFIG_SND_SOC_TEGRA_RT5640 is not set
CONFIG_SND_SOC_TEGRA_WM8753=y
# CONFIG_SND_SOC_TEGRA_WM8903 is not set
# CONFIG_SND_SOC_TEGRA_WM9712 is not set
# CONFIG_SND_SOC_TEGRA_TRIMSLICE is not set
CONFIG_SND_SOC_TEGRA_ALC5632=y
CONFIG_SND_SOC_TEGRA_MAX98090=y
CONFIG_SND_SOC_TEGRA_RT5677=y
# CONFIG_SND_SOC_TEGRA_SGTL5000 is not set

#
# Audio support for Texas Instruments SoCs
#
CONFIG_SND_SOC_TI_EDMA_PCM=y
CONFIG_SND_SOC_TI_SDMA_PCM=y
CONFIG_SND_SOC_TI_UDMA_PCM=y

#
# Texas Instruments DAI support for:
#
# CONFIG_SND_SOC_DAVINCI_ASP is not set
CONFIG_SND_SOC_DAVINCI_MCASP=y
CONFIG_SND_SOC_DAVINCI_VCIF=y
CONFIG_SND_SOC_OMAP_DMIC=y
CONFIG_SND_SOC_OMAP_MCBSP=y
CONFIG_SND_SOC_OMAP_MCPDM=y

#
# Audio support for boards with Texas Instruments SoCs
#
CONFIG_SND_SOC_OMAP3_TWL4030=y
CONFIG_SND_SOC_OMAP_HDMI=y
CONFIG_SND_SOC_J721E_EVM=y
# end of Audio support for Texas Instruments SoCs

CONFIG_SND_SOC_UNIPHIER=y
CONFIG_SND_SOC_UNIPHIER_AIO=y
# CONFIG_SND_SOC_UNIPHIER_LD11 is not set
CONFIG_SND_SOC_UNIPHIER_PXS2=y
CONFIG_SND_SOC_UNIPHIER_EVEA_CODEC=y
CONFIG_SND_SOC_XILINX_I2S=y
CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=y
CONFIG_SND_SOC_XILINX_SPDIF=y
CONFIG_SND_SOC_XTFPGA_I2S=y
# CONFIG_ZX_SPDIF is not set
# CONFIG_ZX_I2S is not set
# CONFIG_ZX_TDM is not set
CONFIG_SND_SOC_I2C_AND_SPI=y

#
# CODEC drivers
#
CONFIG_SND_SOC_ALL_CODECS=y
# CONFIG_SND_SOC_88PM860X is not set
CONFIG_SND_SOC_ARIZONA=y
CONFIG_SND_SOC_WM_HUBS=y
CONFIG_SND_SOC_WM_ADSP=y
CONFIG_SND_SOC_AB8500_CODEC=y
CONFIG_SND_SOC_AC97_CODEC=y
CONFIG_SND_SOC_AD1836=y
CONFIG_SND_SOC_AD193X=y
CONFIG_SND_SOC_AD193X_SPI=y
CONFIG_SND_SOC_AD193X_I2C=y
CONFIG_SND_SOC_AD1980=y
CONFIG_SND_SOC_AD73311=y
CONFIG_SND_SOC_ADAU_UTILS=y
CONFIG_SND_SOC_ADAU1373=y
CONFIG_SND_SOC_ADAU1701=y
CONFIG_SND_SOC_ADAU17X1=y
CONFIG_SND_SOC_ADAU1761=y
CONFIG_SND_SOC_ADAU1761_I2C=y
CONFIG_SND_SOC_ADAU1761_SPI=y
CONFIG_SND_SOC_ADAU1781=y
CONFIG_SND_SOC_ADAU1781_I2C=y
CONFIG_SND_SOC_ADAU1781_SPI=y
CONFIG_SND_SOC_ADAU1977=y
CONFIG_SND_SOC_ADAU1977_SPI=y
CONFIG_SND_SOC_ADAU1977_I2C=y
CONFIG_SND_SOC_ADAU7002=y
CONFIG_SND_SOC_ADAU7118=y
# CONFIG_SND_SOC_ADAU7118_HW is not set
CONFIG_SND_SOC_ADAU7118_I2C=y
CONFIG_SND_SOC_ADAV80X=y
CONFIG_SND_SOC_ADAV801=y
CONFIG_SND_SOC_ADAV803=y
CONFIG_SND_SOC_ADS117X=y
CONFIG_SND_SOC_AK4104=y
# CONFIG_SND_SOC_AK4118 is not set
# CONFIG_SND_SOC_AK4458 is not set
CONFIG_SND_SOC_AK4535=y
CONFIG_SND_SOC_AK4554=y
CONFIG_SND_SOC_AK4613=y
CONFIG_SND_SOC_AK4641=y
CONFIG_SND_SOC_AK4642=y
CONFIG_SND_SOC_AK4671=y
CONFIG_SND_SOC_AK5386=y
CONFIG_SND_SOC_AK5558=y
CONFIG_SND_SOC_ALC5623=y
CONFIG_SND_SOC_ALC5632=y
CONFIG_SND_SOC_BD28623=y
CONFIG_SND_SOC_BT_SCO=y
CONFIG_SND_SOC_CQ0093VC=y
CONFIG_SND_SOC_CROS_EC_CODEC=y
CONFIG_SND_SOC_CS35L32=y
CONFIG_SND_SOC_CS35L33=y
CONFIG_SND_SOC_CS35L34=y
CONFIG_SND_SOC_CS35L35=y
CONFIG_SND_SOC_CS35L36=y
# CONFIG_SND_SOC_CS42L42 is not set
CONFIG_SND_SOC_CS42L51=y
CONFIG_SND_SOC_CS42L51_I2C=y
CONFIG_SND_SOC_CS42L52=y
CONFIG_SND_SOC_CS42L56=y
CONFIG_SND_SOC_CS42L73=y
CONFIG_SND_SOC_CS4265=y
CONFIG_SND_SOC_CS4270=y
# CONFIG_SND_SOC_CS4271_I2C is not set
# CONFIG_SND_SOC_CS4271_SPI is not set
CONFIG_SND_SOC_CS42XX8=y
CONFIG_SND_SOC_CS42XX8_I2C=y
# CONFIG_SND_SOC_CS43130 is not set
CONFIG_SND_SOC_CS4341=y
CONFIG_SND_SOC_CS4349=y
CONFIG_SND_SOC_CS47L15=y
# CONFIG_SND_SOC_CS47L24 is not set
CONFIG_SND_SOC_CS47L35=y
CONFIG_SND_SOC_CS47L85=y
CONFIG_SND_SOC_CS47L90=y
CONFIG_SND_SOC_CS47L92=y
# CONFIG_SND_SOC_CS53L30 is not set
CONFIG_SND_SOC_CX20442=y
# CONFIG_SND_SOC_CX2072X is not set
# CONFIG_SND_SOC_JZ4740_CODEC is not set
# CONFIG_SND_SOC_JZ4725B_CODEC is not set
# CONFIG_SND_SOC_JZ4770_CODEC is not set
CONFIG_SND_SOC_L3=y
CONFIG_SND_SOC_DA7210=y
CONFIG_SND_SOC_DA7213=y
CONFIG_SND_SOC_DA7218=y
CONFIG_SND_SOC_DA7219=y
CONFIG_SND_SOC_DA732X=y
CONFIG_SND_SOC_DA9055=y
CONFIG_SND_SOC_DMIC=y
CONFIG_SND_SOC_HDMI_CODEC=y
# CONFIG_SND_SOC_ES7134 is not set
CONFIG_SND_SOC_ES7241=y
CONFIG_SND_SOC_ES8316=y
CONFIG_SND_SOC_ES8328=y
CONFIG_SND_SOC_ES8328_I2C=y
CONFIG_SND_SOC_ES8328_SPI=y
# CONFIG_SND_SOC_GTM601 is not set
CONFIG_SND_SOC_HDAC_HDMI=y
CONFIG_SND_SOC_HDAC_HDA=y
CONFIG_SND_SOC_ICS43432=y
CONFIG_SND_SOC_INNO_RK3036=y
CONFIG_SND_SOC_ISABELLE=y
CONFIG_SND_SOC_LM49453=y
# CONFIG_SND_SOC_LOCHNAGAR_SC is not set
CONFIG_SND_SOC_MADERA=y
CONFIG_SND_SOC_MAX98088=y
CONFIG_SND_SOC_MAX98090=y
CONFIG_SND_SOC_MAX98095=y
CONFIG_SND_SOC_MAX98357A=y
CONFIG_SND_SOC_MAX98371=y
CONFIG_SND_SOC_MAX98504=y
CONFIG_SND_SOC_MAX9867=y
CONFIG_SND_SOC_MAX98925=y
CONFIG_SND_SOC_MAX98926=y
CONFIG_SND_SOC_MAX98927=y
CONFIG_SND_SOC_MAX98373=y
CONFIG_SND_SOC_MAX98373_I2C=y
# CONFIG_SND_SOC_MAX98373_SDW is not set
CONFIG_SND_SOC_MAX98390=y
CONFIG_SND_SOC_MAX9850=y
# CONFIG_SND_SOC_MAX9860 is not set
CONFIG_SND_SOC_MSM8916_WCD_ANALOG=y
CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=y
CONFIG_SND_SOC_PCM1681=y
CONFIG_SND_SOC_PCM1789=y
CONFIG_SND_SOC_PCM1789_I2C=y
CONFIG_SND_SOC_PCM179X=y
CONFIG_SND_SOC_PCM179X_I2C=y
# CONFIG_SND_SOC_PCM179X_SPI is not set
CONFIG_SND_SOC_PCM186X=y
CONFIG_SND_SOC_PCM186X_I2C=y
# CONFIG_SND_SOC_PCM186X_SPI is not set
CONFIG_SND_SOC_PCM3008=y
CONFIG_SND_SOC_PCM3060=y
CONFIG_SND_SOC_PCM3060_I2C=y
CONFIG_SND_SOC_PCM3060_SPI=y
CONFIG_SND_SOC_PCM3168A=y
CONFIG_SND_SOC_PCM3168A_I2C=y
# CONFIG_SND_SOC_PCM3168A_SPI is not set
CONFIG_SND_SOC_PCM5102A=y
CONFIG_SND_SOC_PCM512x=y
CONFIG_SND_SOC_PCM512x_I2C=y
# CONFIG_SND_SOC_PCM512x_SPI is not set
# CONFIG_SND_SOC_RK3328 is not set
CONFIG_SND_SOC_RL6231=y
CONFIG_SND_SOC_RL6347A=y
CONFIG_SND_SOC_RT274=y
CONFIG_SND_SOC_RT286=y
CONFIG_SND_SOC_RT298=y
CONFIG_SND_SOC_RT1011=y
CONFIG_SND_SOC_RT1015=y
CONFIG_SND_SOC_RT1305=y
CONFIG_SND_SOC_RT1308=y
# CONFIG_SND_SOC_RT1308_SDW is not set
CONFIG_SND_SOC_RT5514=y
CONFIG_SND_SOC_RT5514_SPI=y
# CONFIG_SND_SOC_RT5616 is not set
# CONFIG_SND_SOC_RT5631 is not set
CONFIG_SND_SOC_RT5640=y
CONFIG_SND_SOC_RT5645=y
CONFIG_SND_SOC_RT5651=y
CONFIG_SND_SOC_RT5659=y
CONFIG_SND_SOC_RT5660=y
CONFIG_SND_SOC_RT5663=y
CONFIG_SND_SOC_RT5665=y
CONFIG_SND_SOC_RT5668=y
CONFIG_SND_SOC_RT5670=y
CONFIG_SND_SOC_RT5677=y
CONFIG_SND_SOC_RT5677_SPI=y
CONFIG_SND_SOC_RT5682=y
CONFIG_SND_SOC_RT5682_I2C=y
# CONFIG_SND_SOC_RT5682_SDW is not set
# CONFIG_SND_SOC_RT700_SDW is not set
# CONFIG_SND_SOC_RT711_SDW is not set
# CONFIG_SND_SOC_RT715_SDW is not set
# CONFIG_SND_SOC_SGTL5000 is not set
CONFIG_SND_SOC_SI476X=y
CONFIG_SND_SOC_SIGMADSP=y
CONFIG_SND_SOC_SIGMADSP_I2C=y
CONFIG_SND_SOC_SIGMADSP_REGMAP=y
CONFIG_SND_SOC_SIMPLE_AMPLIFIER=y
CONFIG_SND_SOC_SIRF_AUDIO_CODEC=y
CONFIG_SND_SOC_SPDIF=y
CONFIG_SND_SOC_SSM2305=y
CONFIG_SND_SOC_SSM2518=y
# CONFIG_SND_SOC_SSM2602_SPI is not set
# CONFIG_SND_SOC_SSM2602_I2C is not set
CONFIG_SND_SOC_SSM4567=y
CONFIG_SND_SOC_STA32X=y
# CONFIG_SND_SOC_STA350 is not set
CONFIG_SND_SOC_STA529=y
CONFIG_SND_SOC_STAC9766=y
CONFIG_SND_SOC_STI_SAS=y
CONFIG_SND_SOC_TAS2552=y
CONFIG_SND_SOC_TAS2562=y
CONFIG_SND_SOC_TAS2770=y
# CONFIG_SND_SOC_TAS5086 is not set
CONFIG_SND_SOC_TAS571X=y
# CONFIG_SND_SOC_TAS5720 is not set
# CONFIG_SND_SOC_TAS6424 is not set
CONFIG_SND_SOC_TDA7419=y
CONFIG_SND_SOC_TFA9879=y
CONFIG_SND_SOC_TLV320AIC23=y
CONFIG_SND_SOC_TLV320AIC23_I2C=y
# CONFIG_SND_SOC_TLV320AIC23_SPI is not set
CONFIG_SND_SOC_TLV320AIC26=y
CONFIG_SND_SOC_TLV320AIC31XX=y
CONFIG_SND_SOC_TLV320AIC32X4=y
CONFIG_SND_SOC_TLV320AIC32X4_I2C=y
CONFIG_SND_SOC_TLV320AIC32X4_SPI=y
CONFIG_SND_SOC_TLV320AIC3X=y
CONFIG_SND_SOC_TLV320DAC33=y
CONFIG_SND_SOC_TLV320ADCX140=y
CONFIG_SND_SOC_TS3A227E=y
CONFIG_SND_SOC_TSCS42XX=y
CONFIG_SND_SOC_TSCS454=y
CONFIG_SND_SOC_TWL4030=y
# CONFIG_SND_SOC_TWL6040 is not set
CONFIG_SND_SOC_UDA1334=y
CONFIG_SND_SOC_UDA134X=y
CONFIG_SND_SOC_UDA1380=y
CONFIG_SND_SOC_WCD9335=y
# CONFIG_SND_SOC_WCD934X is not set
CONFIG_SND_SOC_WL1273=y
CONFIG_SND_SOC_WM0010=y
CONFIG_SND_SOC_WM1250_EV1=y
CONFIG_SND_SOC_WM2000=y
CONFIG_SND_SOC_WM2200=y
CONFIG_SND_SOC_WM5100=y
CONFIG_SND_SOC_WM5102=y
# CONFIG_SND_SOC_WM5110 is not set
CONFIG_SND_SOC_WM8350=y
# CONFIG_SND_SOC_WM8400 is not set
CONFIG_SND_SOC_WM8510=y
CONFIG_SND_SOC_WM8523=y
# CONFIG_SND_SOC_WM8524 is not set
CONFIG_SND_SOC_WM8580=y
CONFIG_SND_SOC_WM8711=y
CONFIG_SND_SOC_WM8727=y
# CONFIG_SND_SOC_WM8728 is not set
CONFIG_SND_SOC_WM8731=y
CONFIG_SND_SOC_WM8737=y
CONFIG_SND_SOC_WM8741=y
CONFIG_SND_SOC_WM8750=y
CONFIG_SND_SOC_WM8753=y
CONFIG_SND_SOC_WM8770=y
CONFIG_SND_SOC_WM8776=y
CONFIG_SND_SOC_WM8782=y
CONFIG_SND_SOC_WM8804=y
CONFIG_SND_SOC_WM8804_I2C=y
CONFIG_SND_SOC_WM8804_SPI=y
CONFIG_SND_SOC_WM8900=y
CONFIG_SND_SOC_WM8903=y
CONFIG_SND_SOC_WM8904=y
CONFIG_SND_SOC_WM8940=y
CONFIG_SND_SOC_WM8955=y
CONFIG_SND_SOC_WM8960=y
CONFIG_SND_SOC_WM8961=y
CONFIG_SND_SOC_WM8962=y
CONFIG_SND_SOC_WM8971=y
# CONFIG_SND_SOC_WM8974 is not set
CONFIG_SND_SOC_WM8978=y
CONFIG_SND_SOC_WM8983=y
CONFIG_SND_SOC_WM8985=y
CONFIG_SND_SOC_WM8988=y
CONFIG_SND_SOC_WM8990=y
CONFIG_SND_SOC_WM8991=y
CONFIG_SND_SOC_WM8993=y
CONFIG_SND_SOC_WM8994=y
CONFIG_SND_SOC_WM8995=y
CONFIG_SND_SOC_WM8996=y
CONFIG_SND_SOC_WM8997=y
CONFIG_SND_SOC_WM8998=y
CONFIG_SND_SOC_WM9081=y
CONFIG_SND_SOC_WM9090=y
CONFIG_SND_SOC_WM9705=y
CONFIG_SND_SOC_WM9712=y
CONFIG_SND_SOC_WM9713=y
# CONFIG_SND_SOC_WSA881X is not set
# CONFIG_SND_SOC_ZL38060 is not set
# CONFIG_SND_SOC_ZX_AUD96P22 is not set
CONFIG_SND_SOC_LM4857=y
CONFIG_SND_SOC_MAX9759=y
CONFIG_SND_SOC_MAX9768=y
CONFIG_SND_SOC_MAX9877=y
CONFIG_SND_SOC_MC13783=y
CONFIG_SND_SOC_ML26124=y
# CONFIG_SND_SOC_MT6351 is not set
CONFIG_SND_SOC_MT6358=y
CONFIG_SND_SOC_MT6660=y
CONFIG_SND_SOC_NAU8540=y
CONFIG_SND_SOC_NAU8810=y
CONFIG_SND_SOC_NAU8822=y
# CONFIG_SND_SOC_NAU8824 is not set
CONFIG_SND_SOC_NAU8825=y
# CONFIG_SND_SOC_TPA6130A2 is not set
# end of CODEC drivers

CONFIG_SND_SIMPLE_CARD_UTILS=y
CONFIG_SND_SIMPLE_CARD=y
CONFIG_SND_AUDIO_GRAPH_CARD=y
CONFIG_AC97_BUS=y

#
# HID support
#
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
# CONFIG_HIDRAW is not set
# CONFIG_UHID is not set
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
CONFIG_HID_ACCUTOUCH=y
CONFIG_HID_ACRUX=y
CONFIG_HID_ACRUX_FF=y
CONFIG_HID_APPLE=y
CONFIG_HID_APPLEIR=y
CONFIG_HID_ASUS=y
CONFIG_HID_AUREAL=y
CONFIG_HID_BELKIN=y
CONFIG_HID_BETOP_FF=y
CONFIG_HID_BIGBEN_FF=y
CONFIG_HID_CHERRY=y
CONFIG_HID_CHICONY=y
CONFIG_HID_CORSAIR=y
CONFIG_HID_COUGAR=y
CONFIG_HID_MACALLY=y
CONFIG_HID_PRODIKEYS=y
CONFIG_HID_CMEDIA=y
# CONFIG_HID_CREATIVE_SB0540 is not set
# CONFIG_HID_CYPRESS is not set
# CONFIG_HID_DRAGONRISE is not set
CONFIG_HID_EMS_FF=y
CONFIG_HID_ELAN=y
CONFIG_HID_ELECOM=y
CONFIG_HID_ELO=y
CONFIG_HID_EZKEY=y
CONFIG_HID_GEMBIRD=y
CONFIG_HID_GFRM=y
CONFIG_HID_GLORIOUS=y
CONFIG_HID_HOLTEK=y
# CONFIG_HOLTEK_FF is not set
CONFIG_HID_GOOGLE_HAMMER=y
# CONFIG_HID_GT683R is not set
# CONFIG_HID_KEYTOUCH is not set
CONFIG_HID_KYE=y
CONFIG_HID_UCLOGIC=y
CONFIG_HID_WALTOP=y
CONFIG_HID_VIEWSONIC=y
CONFIG_HID_GYRATION=y
CONFIG_HID_ICADE=y
CONFIG_HID_ITE=y
# CONFIG_HID_JABRA is not set
CONFIG_HID_TWINHAN=y
CONFIG_HID_KENSINGTON=y
# CONFIG_HID_LCPOWER is not set
CONFIG_HID_LED=y
CONFIG_HID_LENOVO=y
# CONFIG_HID_LOGITECH is not set
CONFIG_HID_MAGICMOUSE=y
CONFIG_HID_MALTRON=y
CONFIG_HID_MAYFLASH=y
# CONFIG_HID_REDRAGON is not set
# CONFIG_HID_MICROSOFT is not set
CONFIG_HID_MONTEREY=y
# CONFIG_HID_MULTITOUCH is not set
CONFIG_HID_NTI=y
# CONFIG_HID_NTRIG is not set
CONFIG_HID_ORTEK=y
# CONFIG_HID_PANTHERLORD is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=y
CONFIG_HID_PICOLCD=y
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=y
CONFIG_HID_PRIMAX=y
CONFIG_HID_RETRODE=y
CONFIG_HID_ROCCAT=y
CONFIG_HID_SAITEK=y
# CONFIG_HID_SAMSUNG is not set
# CONFIG_HID_SONY is not set
# CONFIG_HID_SPEEDLINK is not set
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=y
# CONFIG_HID_SUNPLUS is not set
CONFIG_HID_RMI=y
CONFIG_HID_GREENASIA=y
CONFIG_GREENASIA_FF=y
# CONFIG_HID_SMARTJOYPLUS is not set
CONFIG_HID_TIVO=y
CONFIG_HID_TOPSEED=y
CONFIG_HID_THINGM=y
# CONFIG_HID_THRUSTMASTER is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
# CONFIG_HID_WACOM is not set
# CONFIG_HID_WIIMOTE is not set
CONFIG_HID_XINMO=y
CONFIG_HID_ZEROPLUS=y
# CONFIG_ZEROPLUS_FF is not set
# CONFIG_HID_ZYDACRON is not set
# CONFIG_HID_SENSOR_HUB is not set
CONFIG_HID_ALPS=y
CONFIG_HID_MCP2221=y
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
CONFIG_HID_PID=y
CONFIG_USB_HIDDEV=y
# end of USB HID support

#
# I2C HID support
#
# CONFIG_I2C_HID is not set
# end of I2C HID support

#
# Intel ISH HID support
#
# CONFIG_INTEL_ISH_HID is not set
# end of Intel ISH HID support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_LED_TRIG=y
CONFIG_USB_ULPI_BUS=y
CONFIG_USB_CONN_GPIO=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_PCI is not set
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
# CONFIG_USB_DEFAULT_PERSIST is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
CONFIG_USB_OTG_PRODUCTLIST=y
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
# CONFIG_USB_MON is not set

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=y
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
# CONFIG_USB_XHCI_PCI_RENESAS is not set
# CONFIG_USB_XHCI_PLATFORM is not set
CONFIG_USB_XHCI_MTK=y
# CONFIG_USB_XHCI_MVEBU is not set
# CONFIG_USB_BRCMSTB is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_FSL=y
# CONFIG_USB_EHCI_MXC is not set
CONFIG_USB_EHCI_HCD_NPCM7XX=y
CONFIG_USB_EHCI_HCD_ORION=y
CONFIG_USB_EHCI_HCD_SPEAR=y
# CONFIG_USB_EHCI_HCD_STI is not set
CONFIG_USB_EHCI_HCD_AT91=y
# CONFIG_USB_EHCI_SH is not set
# CONFIG_USB_EHCI_EXYNOS is not set
CONFIG_USB_EHCI_MV=y
CONFIG_USB_CNS3XXX_EHCI=y
CONFIG_USB_EHCI_HCD_PLATFORM=y
CONFIG_USB_OXU210HP_HCD=y
CONFIG_USB_ISP116X_HCD=y
CONFIG_USB_ISP1362_HCD=y
# CONFIG_USB_FOTG210_HCD is not set
CONFIG_USB_MAX3421_HCD=y
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_SPEAR=y
# CONFIG_USB_OHCI_HCD_STI is not set
CONFIG_USB_OHCI_HCD_S3C2410=y
CONFIG_USB_OHCI_HCD_LPC32XX=y
# CONFIG_USB_OHCI_HCD_AT91 is not set
CONFIG_USB_OHCI_HCD_OMAP3=y
# CONFIG_USB_OHCI_HCD_DAVINCI is not set
CONFIG_USB_OHCI_SH=y
CONFIG_USB_OHCI_EXYNOS=y
CONFIG_USB_CNS3XXX_OHCI=y
CONFIG_USB_OHCI_HCD_PLATFORM=y
CONFIG_USB_SL811_HCD=y
# CONFIG_USB_SL811_HCD_ISO is not set
# CONFIG_USB_SL811_CS is not set
CONFIG_USB_R8A66597_HCD=y
CONFIG_USB_HCD_BCMA=y
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
CONFIG_USB_PRINTER=y
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
# CONFIG_USB_STORAGE is not set

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
CONFIG_USB_MICROTEK=y
# CONFIG_USB_CDNS3 is not set
# CONFIG_USB_MTU3 is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
CONFIG_USB_ISP1760=y
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1760_HOST_ROLE=y

#
# USB port drivers
#
CONFIG_USB_USS720=y
CONFIG_USB_SERIAL=y
CONFIG_USB_SERIAL_CONSOLE=y
CONFIG_USB_SERIAL_GENERIC=y
CONFIG_USB_SERIAL_SIMPLE=y
CONFIG_USB_SERIAL_AIRCABLE=y
# CONFIG_USB_SERIAL_ARK3116 is not set
CONFIG_USB_SERIAL_BELKIN=y
CONFIG_USB_SERIAL_CH341=y
CONFIG_USB_SERIAL_WHITEHEAT=y
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
CONFIG_USB_SERIAL_CP210X=y
CONFIG_USB_SERIAL_CYPRESS_M8=y
CONFIG_USB_SERIAL_EMPEG=y
# CONFIG_USB_SERIAL_FTDI_SIO is not set
CONFIG_USB_SERIAL_VISOR=y
CONFIG_USB_SERIAL_IPAQ=y
# CONFIG_USB_SERIAL_IR is not set
CONFIG_USB_SERIAL_EDGEPORT=y
CONFIG_USB_SERIAL_EDGEPORT_TI=y
CONFIG_USB_SERIAL_F81232=y
CONFIG_USB_SERIAL_F8153X=y
# CONFIG_USB_SERIAL_GARMIN is not set
# CONFIG_USB_SERIAL_IPW is not set
CONFIG_USB_SERIAL_IUU=y
CONFIG_USB_SERIAL_KEYSPAN_PDA=y
# CONFIG_USB_SERIAL_KEYSPAN is not set
# CONFIG_USB_SERIAL_KLSI is not set
CONFIG_USB_SERIAL_KOBIL_SCT=y
# CONFIG_USB_SERIAL_MCT_U232 is not set
CONFIG_USB_SERIAL_METRO=y
# CONFIG_USB_SERIAL_MOS7720 is not set
CONFIG_USB_SERIAL_MOS7840=y
CONFIG_USB_SERIAL_MXUPORT=y
# CONFIG_USB_SERIAL_NAVMAN is not set
# CONFIG_USB_SERIAL_PL2303 is not set
CONFIG_USB_SERIAL_OTI6858=y
CONFIG_USB_SERIAL_QCAUX=y
CONFIG_USB_SERIAL_QUALCOMM=y
# CONFIG_USB_SERIAL_SPCP8X5 is not set
CONFIG_USB_SERIAL_SAFE=y
CONFIG_USB_SERIAL_SAFE_PADDED=y
CONFIG_USB_SERIAL_SIERRAWIRELESS=y
# CONFIG_USB_SERIAL_SYMBOL is not set
# CONFIG_USB_SERIAL_TI is not set
CONFIG_USB_SERIAL_CYBERJACK=y
# CONFIG_USB_SERIAL_XIRCOM is not set
CONFIG_USB_SERIAL_WWAN=y
# CONFIG_USB_SERIAL_OPTION is not set
# CONFIG_USB_SERIAL_OMNINET is not set
CONFIG_USB_SERIAL_OPTICON=y
CONFIG_USB_SERIAL_XSENS_MT=y
# CONFIG_USB_SERIAL_WISHBONE is not set
CONFIG_USB_SERIAL_SSU100=y
# CONFIG_USB_SERIAL_QT2 is not set
CONFIG_USB_SERIAL_UPD78F0730=y
CONFIG_USB_SERIAL_DEBUG=y

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=y
CONFIG_USB_EMI26=y
CONFIG_USB_ADUTUX=y
CONFIG_USB_SEVSEG=y
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_FTDI_ELAN is not set
CONFIG_USB_APPLEDISPLAY=y
CONFIG_APPLE_MFI_FASTCHARGE=y
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
CONFIG_USB_TRANCEVIBRATOR=y
CONFIG_USB_IOWARRIOR=y
CONFIG_USB_TEST=y
CONFIG_USB_EHSET_TEST_FIXTURE=y
CONFIG_USB_ISIGHTFW=y
# CONFIG_USB_YUREX is not set
CONFIG_USB_EZUSB_FX2=y
CONFIG_USB_HUB_USB251XB=y
# CONFIG_USB_HSIC_USB3503 is not set
CONFIG_USB_HSIC_USB4604=y
CONFIG_USB_LINK_LAYER_TEST=y
CONFIG_USB_CHAOSKEY=y

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
# CONFIG_NOP_USB_XCEIV is not set
CONFIG_USB_GPIO_VBUS=y
# CONFIG_TAHVO_USB is not set
CONFIG_USB_ISP1301=y
# CONFIG_USB_TEGRA_PHY is not set
CONFIG_USB_ULPI=y
CONFIG_USB_ULPI_VIEWPORT=y
# CONFIG_JZ4770_PHY is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
CONFIG_TYPEC_TCPM=y
# CONFIG_TYPEC_TCPCI is not set
CONFIG_TYPEC_FUSB302=y
CONFIG_TYPEC_UCSI=y
CONFIG_UCSI_CCG=y
CONFIG_TYPEC_HD3SS3220=y
# CONFIG_TYPEC_TPS6598X is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
CONFIG_TYPEC_MUX_PI3USB30532=y
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
CONFIG_TYPEC_DP_ALTMODE=y
# CONFIG_TYPEC_NVIDIA_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

CONFIG_USB_ROLE_SWITCH=y
CONFIG_MMC=y
CONFIG_PWRSEQ_EMMC=y
CONFIG_PWRSEQ_SIMPLE=y
CONFIG_MMC_BLOCK=y
CONFIG_MMC_BLOCK_MINORS=8
# CONFIG_SDIO_UART is not set
CONFIG_MMC_TEST=y

#
# MMC/SD/SDIO Host Controller Drivers
#
CONFIG_MMC_DEBUG=y
# CONFIG_MMC_SDHCI is not set
CONFIG_MMC_MESON_MX_SDHC=y
CONFIG_MMC_MESON_MX_SDIO=y
CONFIG_MMC_OMAP_HS=y
CONFIG_MMC_WBSD=y
CONFIG_MMC_TIFM_SD=y
# CONFIG_MMC_GOLDFISH is not set
# CONFIG_MMC_SPI is not set
# CONFIG_MMC_SDRICOH_CS is not set
CONFIG_MMC_TMIO_CORE=y
CONFIG_MMC_SDHI=y
# CONFIG_MMC_SDHI_SYS_DMAC is not set
CONFIG_MMC_SDHI_INTERNAL_DMAC=y
CONFIG_MMC_UNIPHIER=y
CONFIG_MMC_CB710=y
CONFIG_MMC_VIA_SDMMC=y
# CONFIG_MMC_CAVIUM_THUNDERX is not set
# CONFIG_MMC_DW is not set
CONFIG_MMC_SH_MMCIF=y
CONFIG_MMC_JZ4740=y
# CONFIG_MMC_VUB300 is not set
# CONFIG_MMC_USHC is not set
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_CQHCI=y
CONFIG_MMC_HSQ=y
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_BCM2835 is not set
CONFIG_MMC_MTK=y
# CONFIG_MMC_OWL is not set
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y
CONFIG_MSPRO_BLOCK=y
CONFIG_MS_BLOCK=y

#
# MemoryStick Host Controller Drivers
#
# CONFIG_MEMSTICK_TIFM_MS is not set
CONFIG_MEMSTICK_JMICRON_38X=y
# CONFIG_MEMSTICK_R592 is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
# CONFIG_LEDS_AN30259A is not set
CONFIG_LEDS_ARIEL=y
CONFIG_LEDS_AW2013=y
CONFIG_LEDS_BCM6328=y
CONFIG_LEDS_BCM6358=y
CONFIG_LEDS_CR0014114=y
CONFIG_LEDS_EL15203000=y
CONFIG_LEDS_LM3530=y
CONFIG_LEDS_LM3532=y
CONFIG_LEDS_LM3642=y
# CONFIG_LEDS_LM3692X is not set
CONFIG_LEDS_PCA9532=y
# CONFIG_LEDS_PCA9532_GPIO is not set
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=y
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP55XX_COMMON=y
CONFIG_LEDS_LP5521=y
CONFIG_LEDS_LP5523=y
CONFIG_LEDS_LP5562=y
# CONFIG_LEDS_LP8501 is not set
# CONFIG_LEDS_LP8860 is not set
CONFIG_LEDS_PCA955X=y
# CONFIG_LEDS_PCA955X_GPIO is not set
# CONFIG_LEDS_PCA963X is not set
CONFIG_LEDS_WM831X_STATUS=y
CONFIG_LEDS_WM8350=y
CONFIG_LEDS_DA903X=y
CONFIG_LEDS_DA9052=y
# CONFIG_LEDS_DAC124S085 is not set
CONFIG_LEDS_PWM=y
CONFIG_LEDS_REGULATOR=y
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_LT3593=y
# CONFIG_LEDS_MC13783 is not set
CONFIG_LEDS_TCA6507=y
# CONFIG_LEDS_TLC591XX is not set
CONFIG_LEDS_LM355x=y
# CONFIG_LEDS_OT200 is not set
CONFIG_LEDS_MENF21BMC=y
# CONFIG_LEDS_IS31FL319X is not set
CONFIG_LEDS_IS31FL32XX=y
# CONFIG_LEDS_SC27XX_BLTC is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
CONFIG_LEDS_SYSCON=y
# CONFIG_LEDS_PM8058 is not set
CONFIG_LEDS_MLXREG=y
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_SPI_BYTE is not set
CONFIG_LEDS_TI_LMU_COMMON=y
CONFIG_LEDS_LM3697=y
# CONFIG_LEDS_TPS6105X is not set
CONFIG_LEDS_IP30=y

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
# CONFIG_LEDS_TRIGGER_ONESHOT is not set
# CONFIG_LEDS_TRIGGER_DISK is not set
# CONFIG_LEDS_TRIGGER_MTD is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=y
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
CONFIG_LEDS_TRIGGER_CAMERA=y
CONFIG_LEDS_TRIGGER_PANIC=y
CONFIG_LEDS_TRIGGER_PATTERN=y
CONFIG_LEDS_TRIGGER_AUDIO=y
# CONFIG_ACCESSIBILITY is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
CONFIG_RTC_DEBUG=y
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
# CONFIG_RTC_INTF_SYSFS is not set
CONFIG_RTC_INTF_PROC=y
# CONFIG_RTC_INTF_DEV is not set
CONFIG_RTC_DRV_TEST=y

#
# I2C RTC drivers
#
CONFIG_RTC_DRV_88PM80X=y
CONFIG_RTC_DRV_ABB5ZES3=y
CONFIG_RTC_DRV_ABEOZ9=y
CONFIG_RTC_DRV_ABX80X=y
CONFIG_RTC_DRV_BRCMSTB=y
CONFIG_RTC_DRV_AS3722=y
CONFIG_RTC_DRV_DS1307=y
CONFIG_RTC_DRV_DS1307_CENTURY=y
CONFIG_RTC_DRV_DS1374=y
CONFIG_RTC_DRV_DS1374_WDT=y
CONFIG_RTC_DRV_DS1672=y
CONFIG_RTC_DRV_HYM8563=y
# CONFIG_RTC_DRV_MAX6900 is not set
CONFIG_RTC_DRV_MAX8907=y
CONFIG_RTC_DRV_MAX8925=y
# CONFIG_RTC_DRV_MAX8998 is not set
CONFIG_RTC_DRV_MAX77686=y
CONFIG_RTC_DRV_RK808=y
CONFIG_RTC_DRV_RS5C372=y
CONFIG_RTC_DRV_ISL1208=y
CONFIG_RTC_DRV_ISL12022=y
CONFIG_RTC_DRV_ISL12026=y
CONFIG_RTC_DRV_X1205=y
CONFIG_RTC_DRV_PCF8523=y
# CONFIG_RTC_DRV_PCF85063 is not set
CONFIG_RTC_DRV_PCF85363=y
# CONFIG_RTC_DRV_PCF8563 is not set
CONFIG_RTC_DRV_PCF8583=y
CONFIG_RTC_DRV_M41T80=y
CONFIG_RTC_DRV_M41T80_WDT=y
# CONFIG_RTC_DRV_BQ32K is not set
CONFIG_RTC_DRV_TWL4030=y
CONFIG_RTC_DRV_RC5T619=y
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=y
CONFIG_RTC_DRV_RX8010=y
CONFIG_RTC_DRV_RX8581=y
CONFIG_RTC_DRV_RX8025=y
CONFIG_RTC_DRV_EM3027=y
CONFIG_RTC_DRV_RV3028=y
CONFIG_RTC_DRV_RV8803=y
# CONFIG_RTC_DRV_S5M is not set
CONFIG_RTC_DRV_SD3078=y

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
CONFIG_RTC_DRV_M41T94=y
CONFIG_RTC_DRV_DS1302=y
CONFIG_RTC_DRV_DS1305=y
CONFIG_RTC_DRV_DS1343=y
CONFIG_RTC_DRV_DS1347=y
CONFIG_RTC_DRV_DS1390=y
CONFIG_RTC_DRV_MAX6916=y
CONFIG_RTC_DRV_R9701=y
CONFIG_RTC_DRV_RX4581=y
CONFIG_RTC_DRV_RX6110=y
CONFIG_RTC_DRV_RS5C348=y
# CONFIG_RTC_DRV_MAX6902 is not set
CONFIG_RTC_DRV_PCF2123=y
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=y
CONFIG_RTC_DRV_DS3232_HWMON=y
# CONFIG_RTC_DRV_PCF2127 is not set
# CONFIG_RTC_DRV_RV3029C2 is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
# CONFIG_RTC_DRV_DS1286 is not set
CONFIG_RTC_DRV_DS1511=y
CONFIG_RTC_DRV_DS1553=y
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=y
# CONFIG_RTC_DRV_DS2404 is not set
CONFIG_RTC_DRV_DA9052=y
CONFIG_RTC_DRV_STK17TA8=y
CONFIG_RTC_DRV_M48T86=y
# CONFIG_RTC_DRV_M48T35 is not set
# CONFIG_RTC_DRV_M48T59 is not set
CONFIG_RTC_DRV_MSM6242=y
# CONFIG_RTC_DRV_BQ4802 is not set
CONFIG_RTC_DRV_RP5C01=y
# CONFIG_RTC_DRV_V3020 is not set
# CONFIG_RTC_DRV_WM831X is not set
CONFIG_RTC_DRV_WM8350=y
CONFIG_RTC_DRV_SC27XX=y
CONFIG_RTC_DRV_SPEAR=y
CONFIG_RTC_DRV_PCF50633=y
CONFIG_RTC_DRV_ZYNQMP=y
CONFIG_RTC_DRV_CROS_EC=y

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_ASM9260 is not set
# CONFIG_RTC_DRV_DAVINCI is not set
# CONFIG_RTC_DRV_DIGICOLOR is not set
CONFIG_RTC_DRV_FSL_FTM_ALARM=y
CONFIG_RTC_DRV_MESON=y
CONFIG_RTC_DRV_MESON_VRTC=y
CONFIG_RTC_DRV_OMAP=y
CONFIG_RTC_DRV_S3C=y
# CONFIG_RTC_DRV_EP93XX is not set
# CONFIG_RTC_DRV_VR41XX is not set
CONFIG_RTC_DRV_AT91RM9200=y
# CONFIG_RTC_DRV_AT91SAM9 is not set
# CONFIG_RTC_DRV_GENERIC is not set
CONFIG_RTC_DRV_VT8500=y
# CONFIG_RTC_DRV_SUN6I is not set
# CONFIG_RTC_DRV_SUNXI is not set
# CONFIG_RTC_DRV_TX4939 is not set
CONFIG_RTC_DRV_MV=y
CONFIG_RTC_DRV_ARMADA38X=y
CONFIG_RTC_DRV_CADENCE=y
# CONFIG_RTC_DRV_FTRTC010 is not set
# CONFIG_RTC_DRV_COH901331 is not set
# CONFIG_RTC_DRV_STMP is not set
# CONFIG_RTC_DRV_MC13XXX is not set
# CONFIG_RTC_DRV_JZ4740 is not set
# CONFIG_RTC_DRV_LPC24XX is not set
CONFIG_RTC_DRV_LPC32XX=y
CONFIG_RTC_DRV_PM8XXX=y
# CONFIG_RTC_DRV_TEGRA is not set
# CONFIG_RTC_DRV_SNVS is not set
# CONFIG_RTC_DRV_MOXART is not set
CONFIG_RTC_DRV_MT2712=y
CONFIG_RTC_DRV_MT6397=y
# CONFIG_RTC_DRV_MT7622 is not set
CONFIG_RTC_DRV_XGENE=y
CONFIG_RTC_DRV_R7301=y
CONFIG_RTC_DRV_STM32=y
# CONFIG_RTC_DRV_RTD119X is not set
# CONFIG_RTC_DRV_ASPEED is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
CONFIG_UDMABUF=y
CONFIG_DMABUF_MOVE_NOTIFY=y
CONFIG_DMABUF_SELFTESTS=y
# CONFIG_DMABUF_HEAPS is not set
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_HD44780=y
CONFIG_IMG_ASCII_LCD=y
# CONFIG_HT16K33 is not set
CONFIG_PARPORT_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
CONFIG_PANEL_CHANGE_MESSAGE=y
CONFIG_PANEL_BOOT_MESSAGE=""
CONFIG_CHARLCD_BL_OFF=y
# CONFIG_CHARLCD_BL_ON is not set
# CONFIG_CHARLCD_BL_FLASH is not set
# CONFIG_PANEL is not set
CONFIG_CHARLCD=y
CONFIG_UIO=y
CONFIG_UIO_CIF=y
CONFIG_UIO_PDRV_GENIRQ=y
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_AEC=y
# CONFIG_UIO_SERCOS3 is not set
# CONFIG_UIO_PCI_GENERIC is not set
# CONFIG_UIO_NETX is not set
# CONFIG_UIO_PRUSS is not set
CONFIG_UIO_MF624=y
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO=y
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PCI=y
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
# CONFIG_VFIO_MDEV is not set
CONFIG_IRQ_BYPASS_MANAGER=y
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO=y
# CONFIG_VIRTIO_MENU is not set
# CONFIG_VDPA is not set
CONFIG_VHOST_MENU=y
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
CONFIG_STAGING=y
CONFIG_COMEDI=y
# CONFIG_COMEDI_DEBUG is not set
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
CONFIG_COMEDI_MISC_DRIVERS=y
CONFIG_COMEDI_BOND=y
CONFIG_COMEDI_TEST=y
CONFIG_COMEDI_PARPORT=y
# CONFIG_COMEDI_SSV_DNP is not set
# CONFIG_COMEDI_ISA_DRIVERS is not set
# CONFIG_COMEDI_PCI_DRIVERS is not set
CONFIG_COMEDI_PCMCIA_DRIVERS=y
CONFIG_COMEDI_CB_DAS16_CS=y
# CONFIG_COMEDI_DAS08_CS is not set
CONFIG_COMEDI_NI_DAQ_700_CS=y
# CONFIG_COMEDI_NI_DAQ_DIO24_CS is not set
CONFIG_COMEDI_NI_LABPC_CS=y
# CONFIG_COMEDI_NI_MIO_CS is not set
CONFIG_COMEDI_QUATECH_DAQP_CS=y
CONFIG_COMEDI_USB_DRIVERS=y
# CONFIG_COMEDI_DT9812 is not set
# CONFIG_COMEDI_NI_USB6501 is not set
# CONFIG_COMEDI_USBDUX is not set
CONFIG_COMEDI_USBDUXFAST=y
CONFIG_COMEDI_USBDUXSIGMA=y
CONFIG_COMEDI_VMK80XX=y
CONFIG_COMEDI_8254=y
CONFIG_COMEDI_8255=y
CONFIG_COMEDI_8255_SA=y
CONFIG_COMEDI_KCOMEDILIB=y
CONFIG_COMEDI_NI_LABPC=y
# CONFIG_RTS5208 is not set
CONFIG_FB_SM750=y
CONFIG_STAGING_MEDIA=y

#
# Android
#
# end of Android

# CONFIG_STAGING_BOARD is not set
CONFIG_FIREWIRE_SERIAL=y
CONFIG_FWTTY_MAX_TOTAL_PORTS=64
CONFIG_FWTTY_MAX_CARD_PORTS=32
# CONFIG_GS_FPGABOOT is not set
# CONFIG_UNISYSSPAR is not set
CONFIG_FB_TFT=y
CONFIG_FB_TFT_AGM1264K_FL=y
# CONFIG_FB_TFT_BD663474 is not set
CONFIG_FB_TFT_HX8340BN=y
# CONFIG_FB_TFT_HX8347D is not set
CONFIG_FB_TFT_HX8353D=y
CONFIG_FB_TFT_HX8357D=y
CONFIG_FB_TFT_ILI9163=y
CONFIG_FB_TFT_ILI9320=y
# CONFIG_FB_TFT_ILI9325 is not set
# CONFIG_FB_TFT_ILI9340 is not set
CONFIG_FB_TFT_ILI9341=y
CONFIG_FB_TFT_ILI9481=y
CONFIG_FB_TFT_ILI9486=y
CONFIG_FB_TFT_PCD8544=y
# CONFIG_FB_TFT_RA8875 is not set
CONFIG_FB_TFT_S6D02A1=y
CONFIG_FB_TFT_S6D1121=y
CONFIG_FB_TFT_SEPS525=y
# CONFIG_FB_TFT_SH1106 is not set
# CONFIG_FB_TFT_SSD1289 is not set
CONFIG_FB_TFT_SSD1305=y
CONFIG_FB_TFT_SSD1306=y
CONFIG_FB_TFT_SSD1331=y
CONFIG_FB_TFT_SSD1351=y
# CONFIG_FB_TFT_ST7735R is not set
# CONFIG_FB_TFT_ST7789V is not set
# CONFIG_FB_TFT_TINYLCD is not set
# CONFIG_FB_TFT_TLS8204 is not set
CONFIG_FB_TFT_UC1611=y
CONFIG_FB_TFT_UC1701=y
CONFIG_FB_TFT_UPD161704=y
# CONFIG_FB_TFT_WATTEROTT is not set
CONFIG_MOST_COMPONENTS=y
# CONFIG_MOST_CDEV is not set
# CONFIG_MOST_SOUND is not set
CONFIG_MOST_DIM2=y
# CONFIG_MOST_I2C is not set
# CONFIG_BCM_VIDEOCORE is not set
# CONFIG_PI433 is not set

#
# Gasket devices
#
# end of Gasket devices

CONFIG_XIL_AXIS_FIFO=y
CONFIG_FIELDBUS_DEV=y
# CONFIG_HMS_ANYBUSS_BUS is not set
# CONFIG_KPC2000 is not set
CONFIG_MIPS_PLATFORM_DEVICES=y
# CONFIG_CPU_HWMON is not set
# CONFIG_RS780E_ACPI is not set
# CONFIG_GOLDFISH is not set
# CONFIG_MFD_CROS_EC is not set
CONFIG_CHROME_PLATFORMS=y
CONFIG_CROS_EC=y
CONFIG_CROS_EC_I2C=y
CONFIG_CROS_EC_RPMSG=y
CONFIG_CROS_EC_SPI=y
CONFIG_CROS_EC_PROTO=y
CONFIG_CROS_EC_CHARDEV=y
# CONFIG_CROS_EC_LIGHTBAR is not set
CONFIG_CROS_EC_VBC=y
CONFIG_CROS_EC_DEBUGFS=y
CONFIG_CROS_EC_SENSORHUB=y
# CONFIG_CROS_EC_SYSFS is not set
# CONFIG_CROS_EC_TYPEC is not set
CONFIG_CROS_USBPD_NOTIFY=y
CONFIG_MELLANOX_PLATFORM=y
CONFIG_MLXREG_HOTPLUG=y
CONFIG_MLXREG_IO=y
CONFIG_OLPC_EC=y
CONFIG_OLPC_XO175=y
CONFIG_OLPC_XO175_EC=y
CONFIG_HAVE_CLK=y
CONFIG_CLKDEV_LOOKUP=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_WM831X=y

#
# Clock driver for ARM Reference designs
#
# CONFIG_ICST is not set
# CONFIG_CLK_SP810 is not set
# end of Clock driver for ARM Reference designs

CONFIG_CLK_HSDK=y
CONFIG_COMMON_CLK_MAX77686=y
# CONFIG_COMMON_CLK_MAX9485 is not set
CONFIG_COMMON_CLK_RK808=y
CONFIG_COMMON_CLK_SCMI=y
CONFIG_COMMON_CLK_SCPI=y
CONFIG_COMMON_CLK_SI5341=y
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI514 is not set
CONFIG_COMMON_CLK_SI544=y
CONFIG_COMMON_CLK_SI570=y
# CONFIG_COMMON_CLK_BM1880 is not set
CONFIG_COMMON_CLK_CDCE706=y
# CONFIG_COMMON_CLK_CDCE925 is not set
CONFIG_COMMON_CLK_CS2000_CP=y
# CONFIG_COMMON_CLK_FSL_SAI is not set
CONFIG_COMMON_CLK_GEMINI=y
CONFIG_COMMON_CLK_ASPEED=y
CONFIG_COMMON_CLK_S2MPS11=y
CONFIG_COMMON_CLK_AXI_CLKGEN=y
# CONFIG_CLK_QORIQ is not set
CONFIG_CLK_LS1028A_PLLDIG=y
# CONFIG_COMMON_CLK_XGENE is not set
CONFIG_COMMON_CLK_PWM=y
CONFIG_COMMON_CLK_OXNAS=y
CONFIG_COMMON_CLK_VC5=y
# CONFIG_COMMON_CLK_MMP2_AUDIO is not set
CONFIG_COMMON_CLK_BD718XX=y
CONFIG_COMMON_CLK_FIXED_MMIO=y
# CONFIG_CLK_ACTIONS is not set
CONFIG_CLK_BAIKAL_T1=y
CONFIG_CLK_BT1_CCU_PLL=y
# CONFIG_CLK_BT1_CCU_DIV is not set
CONFIG_CLK_BCM2711_DVP=y
# CONFIG_CLK_BCM2835 is not set
CONFIG_CLK_BCM_63XX=y
CONFIG_CLK_BCM_63XX_GATE=y
# CONFIG_CLK_BCM_KONA is not set
CONFIG_COMMON_CLK_IPROC=y
# CONFIG_CLK_BCM_CYGNUS is not set
# CONFIG_CLK_BCM_HR2 is not set
# CONFIG_CLK_BCM_NSP is not set
# CONFIG_CLK_BCM_NS2 is not set
# CONFIG_CLK_BCM_SR is not set
CONFIG_CLK_RASPBERRYPI=y
CONFIG_COMMON_CLK_HI3516CV300=y
# CONFIG_COMMON_CLK_HI3519 is not set
# CONFIG_COMMON_CLK_HI3660 is not set
# CONFIG_COMMON_CLK_HI3670 is not set
# CONFIG_COMMON_CLK_HI3798CV200 is not set
# CONFIG_COMMON_CLK_HI6220 is not set
CONFIG_RESET_HISI=y
CONFIG_COMMON_CLK_BOSTON=y

#
# Ingenic SoCs drivers
#
CONFIG_INGENIC_CGU_COMMON=y
# CONFIG_INGENIC_CGU_JZ4740 is not set
CONFIG_INGENIC_CGU_JZ4725B=y
# CONFIG_INGENIC_CGU_JZ4770 is not set
# CONFIG_INGENIC_CGU_JZ4780 is not set
CONFIG_INGENIC_CGU_X1000=y
# CONFIG_INGENIC_CGU_X1830 is not set
CONFIG_INGENIC_TCU_CLK=y
# end of Ingenic SoCs drivers

# CONFIG_COMMON_CLK_KEYSTONE is not set
CONFIG_TI_SYSCON_CLK=y

#
# Clock driver for MediaTek SoC
#
CONFIG_COMMON_CLK_MEDIATEK=y
# CONFIG_COMMON_CLK_MT2701 is not set
# CONFIG_COMMON_CLK_MT2712 is not set
# CONFIG_COMMON_CLK_MT6765 is not set
CONFIG_COMMON_CLK_MT6779=y
CONFIG_COMMON_CLK_MT6779_MMSYS=y
CONFIG_COMMON_CLK_MT6779_IMGSYS=y
# CONFIG_COMMON_CLK_MT6779_IPESYS is not set
CONFIG_COMMON_CLK_MT6779_CAMSYS=y
CONFIG_COMMON_CLK_MT6779_VDECSYS=y
# CONFIG_COMMON_CLK_MT6779_VENCSYS is not set
CONFIG_COMMON_CLK_MT6779_MFGCFG=y
CONFIG_COMMON_CLK_MT6779_AUDSYS=y
CONFIG_COMMON_CLK_MT6797=y
CONFIG_COMMON_CLK_MT6797_MMSYS=y
# CONFIG_COMMON_CLK_MT6797_IMGSYS is not set
CONFIG_COMMON_CLK_MT6797_VDECSYS=y
CONFIG_COMMON_CLK_MT6797_VENCSYS=y
# CONFIG_COMMON_CLK_MT7622 is not set
# CONFIG_COMMON_CLK_MT7629 is not set
# CONFIG_COMMON_CLK_MT8135 is not set
CONFIG_COMMON_CLK_MT8173=y
CONFIG_COMMON_CLK_MT8173_MMSYS=y
CONFIG_COMMON_CLK_MT8183=y
# CONFIG_COMMON_CLK_MT8183_AUDIOSYS is not set
# CONFIG_COMMON_CLK_MT8183_CAMSYS is not set
CONFIG_COMMON_CLK_MT8183_IMGSYS=y
CONFIG_COMMON_CLK_MT8183_IPU_CORE0=y
# CONFIG_COMMON_CLK_MT8183_IPU_CORE1 is not set
CONFIG_COMMON_CLK_MT8183_IPU_ADL=y
# CONFIG_COMMON_CLK_MT8183_IPU_CONN is not set
CONFIG_COMMON_CLK_MT8183_MFGCFG=y
CONFIG_COMMON_CLK_MT8183_MMSYS=y
# CONFIG_COMMON_CLK_MT8183_VDECSYS is not set
CONFIG_COMMON_CLK_MT8183_VENCSYS=y
CONFIG_COMMON_CLK_MT8516=y
# CONFIG_COMMON_CLK_MT8516_AUDSYS is not set
# end of Clock driver for MediaTek SoC

# CONFIG_COMMON_CLK_AXG_AUDIO is not set
# CONFIG_COMMON_CLK_QCOM is not set
# CONFIG_CLK_RENESAS is not set
CONFIG_COMMON_CLK_SAMSUNG=y
CONFIG_EXYNOS_ARM64_COMMON_CLK=y
CONFIG_EXYNOS_AUDSS_CLK_CON=y
CONFIG_S3C2410_COMMON_CLK=y
CONFIG_S3C2412_COMMON_CLK=y
# CONFIG_S3C2443_COMMON_CLK is not set
CONFIG_CLK_SIFIVE=y
# CONFIG_CLK_SIFIVE_FU540_PRCI is not set
CONFIG_SPRD_COMMON_CLK=y
CONFIG_SPRD_SC9860_CLK=y
# CONFIG_SPRD_SC9863A_CLK is not set
# CONFIG_CLK_SUNXI is not set
CONFIG_SUNXI_CCU=y
CONFIG_SUNIV_F1C100S_CCU=y
# CONFIG_SUN50I_A64_CCU is not set
CONFIG_SUN50I_H6_CCU=y
# CONFIG_SUN50I_H6_R_CCU is not set
CONFIG_SUN4I_A10_CCU=y
# CONFIG_SUN5I_CCU is not set
# CONFIG_SUN6I_A31_CCU is not set
# CONFIG_SUN8I_A23_CCU is not set
CONFIG_SUN8I_A33_CCU=y
CONFIG_SUN8I_A83T_CCU=y
# CONFIG_SUN8I_H3_CCU is not set
CONFIG_SUN8I_V3S_CCU=y
CONFIG_SUN8I_DE2_CCU=y
CONFIG_SUN8I_R40_CCU=y
CONFIG_SUN9I_A80_CCU=y
CONFIG_SUN8I_R_CCU=y
# CONFIG_COMMON_CLK_TI_ADPLL is not set
CONFIG_CLK_UNIPHIER=y
CONFIG_CLK_LGM_CGU=y
CONFIG_HWSPINLOCK=y
CONFIG_HWSPINLOCK_OMAP=y
# CONFIG_HWSPINLOCK_QCOM is not set
# CONFIG_HWSPINLOCK_SIRF is not set
# CONFIG_HWSPINLOCK_SPRD is not set
# CONFIG_HWSPINLOCK_STM32 is not set
# CONFIG_HSEM_U8500 is not set

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKSRC_MMIO=y
# CONFIG_BCM2835_TIMER is not set
CONFIG_BCM_KONA_TIMER=y
# CONFIG_DAVINCI_TIMER is not set
CONFIG_DIGICOLOR_TIMER=y
CONFIG_DW_APB_TIMER=y
# CONFIG_FTTMR010_TIMER is not set
# CONFIG_IXP4XX_TIMER is not set
# CONFIG_MESON6_TIMER is not set
CONFIG_OWL_TIMER=y
# CONFIG_RDA_TIMER is not set
CONFIG_SUN4I_TIMER=y
CONFIG_SUN5I_HSTIMER=y
# CONFIG_TEGRA_TIMER is not set
# CONFIG_VT8500_TIMER is not set
CONFIG_NPCM7XX_TIMER=y
CONFIG_CADENCE_TTC_TIMER=y
CONFIG_ASM9260_TIMER=y
# CONFIG_CLKSRC_DBX500_PRCMU is not set
CONFIG_CLPS711X_TIMER=y
# CONFIG_ATLAS7_TIMER is not set
# CONFIG_MXS_TIMER is not set
# CONFIG_PRIMA2_TIMER is not set
CONFIG_NSPIRE_TIMER=y
# CONFIG_INTEGRATOR_AP_TIMER is not set
# CONFIG_CLKSRC_PISTACHIO is not set
# CONFIG_CLKSRC_TI_32K is not set
# CONFIG_CLKSRC_STM32_LP is not set
# CONFIG_CLKSRC_MPS2 is not set
# CONFIG_ARC_TIMERS is not set
CONFIG_ARM_TIMER_SP804=y
CONFIG_ARMV7M_SYSTICK=y
CONFIG_ATMEL_PIT=y
# CONFIG_ATMEL_ST is not set
# CONFIG_CLKSRC_SAMSUNG_PWM is not set
CONFIG_FSL_FTM_TIMER=y
CONFIG_OXNAS_RPS_TIMER=y
# CONFIG_MTK_TIMER is not set
# CONFIG_CLKSRC_JCORE_PIT is not set
# CONFIG_SH_TIMER_CMT is not set
CONFIG_SH_TIMER_MTU2=y
CONFIG_RENESAS_OSTM=y
CONFIG_SH_TIMER_TMU=y
# CONFIG_EM_TIMER_STI is not set
# CONFIG_CLKSRC_VERSATILE is not set
CONFIG_CLKSRC_PXA=y
# CONFIG_H8300_TMR8 is not set
# CONFIG_H8300_TMR16 is not set
# CONFIG_H8300_TPU is not set
CONFIG_TIMER_IMX_SYS_CTR=y
# CONFIG_CLKSRC_ST_LPC is not set
# CONFIG_ATCPIT100_TIMER is not set
# CONFIG_INGENIC_TIMER is not set
# CONFIG_INGENIC_SYSOST is not set
CONFIG_INGENIC_OST=y
# CONFIG_MICROCHIP_PIT64B is not set
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_IMX_MBOX=y
CONFIG_PLATFORM_MHU=y
CONFIG_ARMADA_37XX_RWTM_MBOX=y
CONFIG_ROCKCHIP_MBOX=y
# CONFIG_ALTERA_MBOX is not set
CONFIG_MAILBOX_TEST=y
CONFIG_QCOM_APCS_IPC=y
CONFIG_BCM_PDC_MBOX=y
CONFIG_MTK_CMDQ_MBOX=y
CONFIG_SUN6I_MSGBOX=y
# CONFIG_SPRD_MBOX is not set
CONFIG_QCOM_IPCC=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
CONFIG_IOMMU_IO_PGTABLE=y
CONFIG_IOMMU_IO_PGTABLE_LPAE=y
# CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST is not set
CONFIG_IOMMU_IO_PGTABLE_ARMV7S=y
CONFIG_IOMMU_IO_PGTABLE_ARMV7S_SELFTEST=y
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
CONFIG_IOMMU_DEFAULT_PASSTHROUGH=y
CONFIG_OF_IOMMU=y
# CONFIG_OMAP_IOMMU is not set
CONFIG_ROCKCHIP_IOMMU=y
# CONFIG_SUN50I_IOMMU is not set
CONFIG_EXYNOS_IOMMU=y
CONFIG_EXYNOS_IOMMU_DEBUG=y
# CONFIG_IPMMU_VMSA is not set
CONFIG_ARM_SMMU=y
# CONFIG_ARM_SMMU_LEGACY_DT_BINDINGS is not set
# CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT is not set
# CONFIG_S390_CCW_IOMMU is not set
# CONFIG_S390_AP_IOMMU is not set
CONFIG_MTK_IOMMU=y
CONFIG_QCOM_IOMMU=y

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
# CONFIG_REMOTEPROC_CDEV is not set
CONFIG_INGENIC_VPU_RPROC=y
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_QCOM_GLINK=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
# CONFIG_RPMSG_QCOM_GLINK_SMEM is not set
# CONFIG_RPMSG_QCOM_SMD is not set
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#
CONFIG_OWL_PM_DOMAINS_HELPER=y
CONFIG_OWL_PM_DOMAINS=y

#
# Amlogic SoC drivers
#
# CONFIG_MESON_CANVAS is not set
CONFIG_MESON_CLK_MEASURE=y
CONFIG_MESON_GX_SOCINFO=y
CONFIG_MESON_GX_PM_DOMAINS=y
CONFIG_MESON_EE_PM_DOMAINS=y
# CONFIG_MESON_MX_SOCINFO is not set
# end of Amlogic SoC drivers

#
# Aspeed SoC drivers
#
CONFIG_SOC_ASPEED=y
# CONFIG_ASPEED_LPC_CTRL is not set
CONFIG_ASPEED_LPC_SNOOP=y
CONFIG_ASPEED_P2A_CTRL=y
# end of Aspeed SoC drivers

# CONFIG_AT91_SOC_ID is not set
# CONFIG_AT91_SOC_SFR is not set

#
# Broadcom SoC drivers
#
# CONFIG_BCM2835_POWER is not set
CONFIG_SOC_BRCMSTB=y
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# CONFIG_QUICC_ENGINE is not set
# CONFIG_DPAA2_CONSOLE is not set
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
CONFIG_IMX_GPCV2_PM_DOMAINS=y
CONFIG_SOC_IMX8M=y
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
CONFIG_IXP4XX_QMGR=y
# CONFIG_IXP4XX_NPE is not set
# end of IXP4xx SoC drivers

#
# MediaTek SoC drivers
#
CONFIG_MTK_CMDQ=y
CONFIG_MTK_INFRACFG=y
CONFIG_MTK_PMIC_WRAP=y
# CONFIG_MTK_SCPSYS is not set
# CONFIG_MTK_MMSYS is not set
# end of MediaTek SoC drivers

#
# Qualcomm SoC drivers
#
CONFIG_QCOM_AOSS_QMP=y
CONFIG_QCOM_COMMAND_DB=y
# CONFIG_QCOM_GENI_SE is not set
CONFIG_QCOM_GSBI=y
CONFIG_QCOM_LLCC=y
CONFIG_QCOM_RPMH=y
# CONFIG_QCOM_RPMHPD is not set
CONFIG_QCOM_SMEM=y
# CONFIG_QCOM_SMD_RPM is not set
CONFIG_QCOM_SMEM_STATE=y
# CONFIG_QCOM_SMP2P is not set
CONFIG_QCOM_SMSM=y
# CONFIG_QCOM_SOCINFO is not set
CONFIG_QCOM_WCNSS_CTRL=y
# end of Qualcomm SoC drivers

# CONFIG_SOC_RENESAS is not set
CONFIG_ROCKCHIP_GRF=y
CONFIG_ROCKCHIP_PM_DOMAINS=y
# CONFIG_SOC_SAMSUNG is not set
CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER=y
CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER=y
CONFIG_SOC_TI=y
# CONFIG_UX500_SOC_ID is not set

#
# Xilinx SoC drivers
#
CONFIG_XILINX_VCU=y
# end of Xilinx SoC drivers

# CONFIG_SOC_ZTE is not set
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=y
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
# CONFIG_ARM_EXYNOS_BUS_DEVFREQ is not set
CONFIG_ARM_IMX_BUS_DEVFREQ=y
CONFIG_ARM_TEGRA_DEVFREQ=y
# CONFIG_ARM_TEGRA20_DEVFREQ is not set
CONFIG_PM_DEVFREQ_EVENT=y
CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=y
CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU=y
# CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_ARIZONA is not set
CONFIG_EXTCON_FSA9480=y
CONFIG_EXTCON_GPIO=y
CONFIG_EXTCON_MAX14577=y
CONFIG_EXTCON_MAX3355=y
CONFIG_EXTCON_PTN5150=y
# CONFIG_EXTCON_QCOM_SPMI_MISC is not set
CONFIG_EXTCON_RT8973A=y
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
# CONFIG_EXTCON_USBC_CROS_EC is not set
CONFIG_MEMORY=y
CONFIG_DDR=y
CONFIG_BT1_L2_CTL=y
CONFIG_JZ4780_NEMC=y
CONFIG_MTK_SMI=y
# CONFIG_STM32_FMC2_EBI is not set
CONFIG_SAMSUNG_MC=y
CONFIG_EXYNOS5422_DMC=y
# CONFIG_EXYNOS_SROM is not set
# CONFIG_IIO is not set
CONFIG_NTB=y
CONFIG_NTB_MSI=y
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_SWITCHTEC is not set
CONFIG_NTB_PINGPONG=y
CONFIG_NTB_TOOL=y
CONFIG_NTB_PERF=y
CONFIG_NTB_MSI_TEST=y
CONFIG_NTB_TRANSPORT=y
CONFIG_VME_BUS=y

#
# VME Bridge Drivers
#
# CONFIG_VME_CA91CX42 is not set
CONFIG_VME_TSI148=y
CONFIG_VME_FAKE=y

#
# VME Board Drivers
#
# CONFIG_VMIVME_7805 is not set

#
# VME Device Drivers
#
# CONFIG_VME_USER is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
CONFIG_PWM_ATMEL=y
# CONFIG_PWM_BCM_IPROC is not set
CONFIG_PWM_BCM_KONA=y
# CONFIG_PWM_BCM2835 is not set
CONFIG_PWM_BERLIN=y
CONFIG_PWM_BRCMSTB=y
CONFIG_PWM_CLPS711X=y
CONFIG_PWM_CROS_EC=y
CONFIG_PWM_EP93XX=y
CONFIG_PWM_FSL_FTM=y
# CONFIG_PWM_HIBVT is not set
# CONFIG_PWM_IMG is not set
# CONFIG_PWM_IMX1 is not set
# CONFIG_PWM_IMX27 is not set
CONFIG_PWM_IMX_TPM=y
CONFIG_PWM_IQS620A=y
CONFIG_PWM_JZ4740=y
CONFIG_PWM_LP3943=y
CONFIG_PWM_LPC18XX_SCT=y
CONFIG_PWM_LPC32XX=y
CONFIG_PWM_MESON=y
CONFIG_PWM_MTK_DISP=y
# CONFIG_PWM_MEDIATEK is not set
# CONFIG_PWM_MXS is not set
CONFIG_PWM_OMAP_DMTIMER=y
# CONFIG_PWM_PCA9685 is not set
CONFIG_PWM_PXA=y
# CONFIG_PWM_RCAR is not set
CONFIG_PWM_RENESAS_TPU=y
CONFIG_PWM_ROCKCHIP=y
CONFIG_PWM_SAMSUNG=y
CONFIG_PWM_SIFIVE=y
CONFIG_PWM_SPEAR=y
# CONFIG_PWM_SPRD is not set
# CONFIG_PWM_STI is not set
CONFIG_PWM_STM32=y
CONFIG_PWM_STM32_LP=y
# CONFIG_PWM_STMPE is not set
CONFIG_PWM_SUN4I=y
CONFIG_PWM_TEGRA=y
CONFIG_PWM_TIECAP=y
# CONFIG_PWM_TIEHRPWM is not set
# CONFIG_PWM_TWL is not set
CONFIG_PWM_TWL_LED=y
# CONFIG_PWM_VT8500 is not set
# CONFIG_PWM_ZX is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
CONFIG_AL_FIC=y
CONFIG_I8259=y
CONFIG_MADERA_IRQ=y
CONFIG_IRQ_MIPS_CPU=y
# CONFIG_JCORE_AIC is not set
CONFIG_RENESAS_INTC_IRQPIN=y
CONFIG_RENESAS_IRQC=y
# CONFIG_RENESAS_RZA1_IRQC is not set
CONFIG_TS4800_IRQ=y
CONFIG_INGENIC_TCU_IRQ=y
# CONFIG_RENESAS_H8S_INTC is not set
# CONFIG_IRQ_UNIPHIER_AIDET is not set
# CONFIG_GOLDFISH_PIC is not set
# CONFIG_IMX_IRQSTEER is not set
CONFIG_IMX_INTMUX=y
# CONFIG_EXYNOS_IRQ_COMBINER is not set
CONFIG_LOONGSON_LIOINTC=y
CONFIG_LOONGSON_HTPIC=y
CONFIG_LOONGSON_HTVEC=y
# CONFIG_LOONGSON_PCH_PIC is not set
# CONFIG_LOONGSON_PCH_MSI is not set
# end of IRQ chip support

CONFIG_IPACK_BUS=y
# CONFIG_BOARD_TPCI200 is not set
CONFIG_SERIAL_IPOCTAL=y
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_ATH79=y
# CONFIG_RESET_AXS10X is not set
CONFIG_RESET_BERLIN=y
CONFIG_RESET_BRCMSTB=y
# CONFIG_RESET_BRCMSTB_RESCAL is not set
# CONFIG_RESET_HSDK is not set
CONFIG_RESET_IMX7=y
CONFIG_RESET_INTEL_GW=y
# CONFIG_RESET_LANTIQ is not set
CONFIG_RESET_LPC18XX=y
# CONFIG_RESET_MESON is not set
CONFIG_RESET_MESON_AUDIO_ARB=y
# CONFIG_RESET_NPCM is not set
# CONFIG_RESET_PISTACHIO is not set
CONFIG_RESET_QCOM_AOSS=y
# CONFIG_RESET_QCOM_PDC is not set
CONFIG_RESET_SCMI=y
CONFIG_RESET_SIMPLE=y
# CONFIG_RESET_STM32MP157 is not set
CONFIG_RESET_SOCFPGA=y
CONFIG_RESET_SUNXI=y
CONFIG_RESET_TI_SYSCON=y
CONFIG_RESET_UNIPHIER=y
CONFIG_RESET_UNIPHIER_GLUE=y
CONFIG_RESET_ZYNQ=y
CONFIG_COMMON_RESET_HI3660=y
CONFIG_COMMON_RESET_HI6220=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
# CONFIG_PHY_LPC18XX_USB_OTG is not set
CONFIG_PHY_XGENE=y
CONFIG_PHY_SUN4I_USB=y
CONFIG_PHY_SUN6I_MIPI_DPHY=y
CONFIG_PHY_SUN9I_USB=y
# CONFIG_PHY_SUN50I_USB3 is not set
CONFIG_PHY_MESON8B_USB2=y
# CONFIG_PHY_MESON_GXL_USB2 is not set
# CONFIG_PHY_MESON_G12A_USB2 is not set
# CONFIG_PHY_MESON_G12A_USB3_PCIE is not set
# CONFIG_PHY_MESON_AXG_PCIE is not set
# CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG is not set
CONFIG_PHY_BCM63XX_USBH=y
# CONFIG_PHY_CYGNUS_PCIE is not set
# CONFIG_PHY_BCM_SR_USB is not set
CONFIG_BCM_KONA_USB2_PHY=y
CONFIG_PHY_BCM_NS_USB2=y
CONFIG_PHY_NS2_USB_DRD=y
CONFIG_PHY_BRCM_SATA=y
CONFIG_PHY_BRCM_USB=y
CONFIG_PHY_BCM_SR_PCIE=y
CONFIG_PHY_CADENCE_TORRENT=y
CONFIG_PHY_CADENCE_DPHY=y
CONFIG_PHY_CADENCE_SIERRA=y
CONFIG_PHY_CADENCE_SALVO=y
CONFIG_PHY_FSL_IMX8MQ_USB=y
# CONFIG_PHY_MIXEL_MIPI_DPHY is not set
CONFIG_PHY_HI6220_USB=y
CONFIG_PHY_HI3660_USB=y
# CONFIG_PHY_HISTB_COMBPHY is not set
# CONFIG_PHY_HISI_INNO_USB2 is not set
# CONFIG_PHY_LANTIQ_VRX200_PCIE is not set
CONFIG_PHY_LANTIQ_RCU_USB2=y
CONFIG_ARMADA375_USBCLUSTER_PHY=y
CONFIG_PHY_BERLIN_SATA=y
CONFIG_PHY_BERLIN_USB=y
# CONFIG_PHY_MVEBU_A3700_UTMI is not set
# CONFIG_PHY_MVEBU_A38X_COMPHY is not set
CONFIG_PHY_PXA_28NM_HSIC=y
# CONFIG_PHY_PXA_28NM_USB2 is not set
CONFIG_PHY_PXA_USB=y
CONFIG_PHY_MMP3_USB=y
# CONFIG_PHY_MTK_TPHY is not set
CONFIG_PHY_MTK_UFS=y
CONFIG_PHY_MTK_XSPHY=y
# CONFIG_PHY_MAPPHONE_MDM6600 is not set
# CONFIG_PHY_OCELOT_SERDES is not set
CONFIG_PHY_ATH79_USB=y
CONFIG_PHY_QCOM_IPQ4019_USB=y
# CONFIG_PHY_QCOM_PCIE2 is not set
CONFIG_PHY_QCOM_QMP=y
# CONFIG_PHY_QCOM_QUSB2 is not set
CONFIG_PHY_QCOM_USB_HS=y
# CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2 is not set
# CONFIG_PHY_QCOM_USB_HSIC is not set
CONFIG_PHY_QCOM_USB_HS_28NM=y
CONFIG_PHY_QCOM_USB_SS=y
CONFIG_PHY_QCOM_IPQ806X_USB=y
# CONFIG_PHY_RALINK_USB is not set
CONFIG_PHY_RCAR_GEN3_USB3=y
# CONFIG_PHY_ROCKCHIP_INNO_HDMI is not set
# CONFIG_PHY_ROCKCHIP_INNO_USB2 is not set
CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY=y
CONFIG_PHY_ROCKCHIP_PCIE=y
# CONFIG_PHY_ROCKCHIP_TYPEC is not set
# CONFIG_PHY_EXYNOS_DP_VIDEO is not set
CONFIG_PHY_EXYNOS_MIPI_VIDEO=y
CONFIG_PHY_EXYNOS_PCIE=y
CONFIG_PHY_SAMSUNG_UFS=y
# CONFIG_PHY_SAMSUNG_USB2 is not set
CONFIG_PHY_UNIPHIER_USB2=y
CONFIG_PHY_UNIPHIER_USB3=y
# CONFIG_PHY_UNIPHIER_PCIE is not set
CONFIG_PHY_ST_SPEAR1310_MIPHY=y
# CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
CONFIG_PHY_STIH407_USB=y
CONFIG_PHY_STM32_USBPHYC=y
# CONFIG_PHY_TEGRA194_P2U is not set
CONFIG_PHY_DA8XX_USB=y
CONFIG_PHY_DM816X_USB=y
CONFIG_PHY_AM654_SERDES=y
# CONFIG_PHY_J721E_WIZ is not set
CONFIG_OMAP_CONTROL_PHY=y
CONFIG_TI_PIPE3=y
CONFIG_PHY_TUSB1210=y
# CONFIG_PHY_INTEL_COMBO is not set
# CONFIG_PHY_INTEL_EMMC is not set
CONFIG_PHY_XILINX_ZYNQMP=y
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_MCB=y
CONFIG_MCB_PCI=y
CONFIG_MCB_LPC=y

#
# Performance monitor support
#
# end of Performance monitor support

# CONFIG_RAS is not set
CONFIG_USB4=y
# CONFIG_USB4_KUNIT_TEST is not set

#
# Android
#
# CONFIG_ANDROID is not set
# end of Android

CONFIG_LIBNVDIMM=y
CONFIG_BLK_DEV_PMEM=y
CONFIG_ND_BLK=y
# CONFIG_BTT is not set
# CONFIG_OF_PMEM is not set
CONFIG_NVDIMM_KEYS=y
CONFIG_DAX_DRIVER=y
CONFIG_DAX=y
# CONFIG_DEV_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_IMX_IIM=y
# CONFIG_NVMEM_IMX_OCOTP is not set
CONFIG_JZ4780_EFUSE=y
CONFIG_NVMEM_LPC18XX_EEPROM=y
CONFIG_NVMEM_LPC18XX_OTP=y
# CONFIG_NVMEM_MXS_OCOTP is not set
CONFIG_MTK_EFUSE=y
CONFIG_QCOM_QFPROM=y
CONFIG_NVMEM_SPMI_SDAM=y
CONFIG_ROCKCHIP_EFUSE=y
CONFIG_ROCKCHIP_OTP=y
CONFIG_NVMEM_BCM_OCOTP=y
CONFIG_NVMEM_STM32_ROMEM=y
CONFIG_UNIPHIER_EFUSE=y
CONFIG_NVMEM_VF610_OCOTP=y
# CONFIG_MESON_MX_EFUSE is not set
# CONFIG_NVMEM_SNVS_LPGPR is not set
# CONFIG_RAVE_SP_EEPROM is not set
# CONFIG_SC27XX_EFUSE is not set
# CONFIG_SPRD_EFUSE is not set

#
# HW tracing support
#
CONFIG_STM=y
CONFIG_STM_PROTO_BASIC=y
CONFIG_STM_PROTO_SYS_T=y
CONFIG_STM_DUMMY=y
CONFIG_STM_SOURCE_CONSOLE=y
# CONFIG_STM_SOURCE_HEARTBEAT is not set
CONFIG_INTEL_TH=y
CONFIG_INTEL_TH_PCI=y
CONFIG_INTEL_TH_GTH=y
# CONFIG_INTEL_TH_STH is not set
CONFIG_INTEL_TH_MSU=y
CONFIG_INTEL_TH_PTI=y
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

# CONFIG_FPGA is not set
CONFIG_FSI=y
# CONFIG_FSI_NEW_DEV_NODE is not set
# CONFIG_FSI_MASTER_GPIO is not set
CONFIG_FSI_MASTER_HUB=y
# CONFIG_FSI_MASTER_ASPEED is not set
CONFIG_FSI_SCOM=y
CONFIG_FSI_SBEFIFO=y
CONFIG_FSI_OCC=y
CONFIG_TEE=y

#
# TEE drivers
#
# end of TEE drivers

CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=y
CONFIG_MUX_ADGS1408=y
# CONFIG_MUX_GPIO is not set
CONFIG_MUX_MMIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
CONFIG_SLIMBUS=y
# CONFIG_SLIM_QCOM_CTRL is not set
CONFIG_INTERCONNECT=y
CONFIG_INTERCONNECT_IMX=y
CONFIG_INTERCONNECT_IMX8MM=y
CONFIG_INTERCONNECT_IMX8MN=y
CONFIG_INTERCONNECT_IMX8MQ=y
# CONFIG_INTERCONNECT_QCOM_OSM_L3 is not set
CONFIG_COUNTER=y
CONFIG_STM32_TIMER_CNT=y
CONFIG_TI_EQEP=y
CONFIG_FTM_QUADDEC=y
CONFIG_MICROCHIP_TCB_CAPTURE=y
CONFIG_MOST=y
CONFIG_MOST_USB_HDM=y
# end of Device Drivers

#
# File systems
#
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=y
CONFIG_EXT2_FS_XATTR=y
CONFIG_EXT2_FS_POSIX_ACL=y
# CONFIG_EXT2_FS_SECURITY is not set
CONFIG_EXT3_FS=y
CONFIG_EXT3_FS_POSIX_ACL=y
CONFIG_EXT3_FS_SECURITY=y
CONFIG_EXT4_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
CONFIG_EXT4_DEBUG=y
# CONFIG_EXT4_KUNIT_TESTS is not set
CONFIG_JBD2=y
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=y
# CONFIG_REISERFS_CHECK is not set
# CONFIG_REISERFS_PROC_INFO is not set
CONFIG_REISERFS_FS_XATTR=y
# CONFIG_REISERFS_FS_POSIX_ACL is not set
CONFIG_REISERFS_FS_SECURITY=y
CONFIG_JFS_FS=y
# CONFIG_JFS_POSIX_ACL is not set
# CONFIG_JFS_SECURITY is not set
# CONFIG_JFS_DEBUG is not set
# CONFIG_JFS_STATISTICS is not set
# CONFIG_XFS_FS is not set
# CONFIG_GFS2_FS is not set
CONFIG_BTRFS_FS=y
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
CONFIG_BTRFS_DEBUG=y
CONFIG_BTRFS_ASSERT=y
# CONFIG_BTRFS_FS_REF_VERIFY is not set
CONFIG_NILFS2_FS=y
# CONFIG_F2FS_FS is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_MANDATORY_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_FUSE_FS is not set
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
CONFIG_OVERLAY_FS_INDEX=y
CONFIG_OVERLAY_FS_XINO_AUTO=y
CONFIG_OVERLAY_FS_METACOPY=y

#
# Caches
#
CONFIG_FSCACHE=y
# CONFIG_FSCACHE_STATS is not set
# CONFIG_FSCACHE_HISTOGRAM is not set
# CONFIG_FSCACHE_DEBUG is not set
# CONFIG_FSCACHE_OBJECT_LIST is not set
# CONFIG_CACHEFILES is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
# CONFIG_JOLIET is not set
CONFIG_ZISOFS=y
CONFIG_UDF_FS=y
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=y
CONFIG_MSDOS_FS=y
CONFIG_VFAT_FS=y
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
# CONFIG_FAT_DEFAULT_UTF8 is not set
CONFIG_EXFAT_FS=y
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
CONFIG_NTFS_FS=y
# CONFIG_NTFS_DEBUG is not set
# CONFIG_NTFS_RW is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
CONFIG_TMPFS_XATTR=y
# CONFIG_TMPFS_INODE64 is not set
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=y
CONFIG_ADFS_FS=y
# CONFIG_ADFS_FS_RW is not set
CONFIG_AFFS_FS=y
CONFIG_ECRYPT_FS=y
CONFIG_ECRYPT_FS_MESSAGING=y
# CONFIG_HFS_FS is not set
CONFIG_HFSPLUS_FS=y
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
CONFIG_EFS_FS=y
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_WRITEBUFFER=y
# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
CONFIG_JFFS2_SUMMARY=y
# CONFIG_JFFS2_FS_XATTR is not set
# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_RTIME=y
CONFIG_UBIFS_FS=y
# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
CONFIG_UBIFS_FS_LZO=y
CONFIG_UBIFS_FS_ZLIB=y
CONFIG_UBIFS_FS_ZSTD=y
CONFIG_UBIFS_ATIME_SUPPORT=y
# CONFIG_UBIFS_FS_XATTR is not set
# CONFIG_UBIFS_FS_AUTHENTICATION is not set
# CONFIG_CRAMFS is not set
# CONFIG_SQUASHFS is not set
# CONFIG_VXFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
CONFIG_QNX4FS_FS=y
# CONFIG_QNX6FS_FS is not set
CONFIG_ROMFS_FS=y
# CONFIG_ROMFS_BACKED_BY_BLOCK is not set
# CONFIG_ROMFS_BACKED_BY_MTD is not set
CONFIG_ROMFS_BACKED_BY_BOTH=y
CONFIG_ROMFS_ON_BLOCK=y
CONFIG_ROMFS_ON_MTD=y
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFLATE_COMPRESS=y
CONFIG_PSTORE_LZO_COMPRESS=y
CONFIG_PSTORE_LZ4_COMPRESS=y
CONFIG_PSTORE_LZ4HC_COMPRESS=y
CONFIG_PSTORE_842_COMPRESS=y
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
# CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_LZO_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_LZ4_COMPRESS_DEFAULT=y
# CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_842_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_COMPRESS_DEFAULT="lz4"
CONFIG_PSTORE_CONSOLE=y
CONFIG_PSTORE_PMSG=y
# CONFIG_PSTORE_RAM is not set
# CONFIG_PSTORE_BLK is not set
CONFIG_SYSV_FS=y
CONFIG_UFS_FS=y
CONFIG_UFS_FS_WRITE=y
# CONFIG_UFS_DEBUG is not set
CONFIG_EROFS_FS=y
# CONFIG_EROFS_FS_DEBUG is not set
CONFIG_EROFS_FS_XATTR=y
# CONFIG_EROFS_FS_POSIX_ACL is not set
# CONFIG_EROFS_FS_SECURITY is not set
# CONFIG_EROFS_FS_ZIP is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=y
CONFIG_NLS_CODEPAGE_775=y
# CONFIG_NLS_CODEPAGE_850 is not set
CONFIG_NLS_CODEPAGE_852=y
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=y
# CONFIG_NLS_CODEPAGE_860 is not set
CONFIG_NLS_CODEPAGE_861=y
# CONFIG_NLS_CODEPAGE_862 is not set
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=y
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=y
CONFIG_NLS_CODEPAGE_936=y
CONFIG_NLS_CODEPAGE_950=y
# CONFIG_NLS_CODEPAGE_932 is not set
CONFIG_NLS_CODEPAGE_949=y
# CONFIG_NLS_CODEPAGE_874 is not set
# CONFIG_NLS_ISO8859_8 is not set
# CONFIG_NLS_CODEPAGE_1250 is not set
CONFIG_NLS_CODEPAGE_1251=y
CONFIG_NLS_ASCII=y
# CONFIG_NLS_ISO8859_1 is not set
CONFIG_NLS_ISO8859_2=y
CONFIG_NLS_ISO8859_3=y
# CONFIG_NLS_ISO8859_4 is not set
CONFIG_NLS_ISO8859_5=y
CONFIG_NLS_ISO8859_6=y
CONFIG_NLS_ISO8859_7=y
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=y
# CONFIG_NLS_ISO8859_14 is not set
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=y
# CONFIG_NLS_KOI8_U is not set
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
# CONFIG_NLS_MAC_CROATIAN is not set
# CONFIG_NLS_MAC_CYRILLIC is not set
CONFIG_NLS_MAC_GAELIC=y
CONFIG_NLS_MAC_GREEK=y
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
CONFIG_NLS_MAC_ROMANIAN=y
CONFIG_NLS_MAC_TURKISH=y
CONFIG_NLS_UTF8=y
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_ENCRYPTED_KEYS=y
CONFIG_KEY_DH_OPERATIONS=y
CONFIG_KEY_NOTIFICATIONS=y
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
# CONFIG_SECURITY_NETWORK is not set
CONFIG_SECURITY_PATH=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_LOADPIN=y
# CONFIG_SECURITY_LOADPIN_ENFORCE is not set
# CONFIG_SECURITY_YAMA is not set
CONFIG_SECURITY_SAFESETID=y
CONFIG_SECURITY_LOCKDOWN_LSM=y
CONFIG_SECURITY_LOCKDOWN_LSM_EARLY=y
# CONFIG_LOCK_DOWN_KERNEL_FORCE_NONE is not set
# CONFIG_LOCK_DOWN_KERNEL_FORCE_INTEGRITY is not set
CONFIG_LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY=y
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
# CONFIG_INTEGRITY_ASYMMETRIC_KEYS is not set
# CONFIG_IMA is not set
CONFIG_EVM=y
# CONFIG_EVM_ATTR_FSUUID is not set
CONFIG_EVM_ADD_XATTRS=y
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
# CONFIG_INIT_STACK_ALL_PATTERN is not set
CONFIG_INIT_STACK_ALL_ZERO=y
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
# end of Memory initialization
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=y
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_FIPS=y
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
# CONFIG_CRYPTO_PCRYPT is not set
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_ENGINE=y

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_ECRDSA=y
# CONFIG_CRYPTO_CURVE25519 is not set

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_AEGIS128=y
CONFIG_CRYPTO_SEQIV=y
# CONFIG_CRYPTO_ECHAINIV is not set

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_LRW is not set
CONFIG_CRYPTO_OFB=y
# CONFIG_CRYPTO_PCBC is not set
CONFIG_CRYPTO_XTS=y
# CONFIG_CRYPTO_KEYWRAP is not set
CONFIG_CRYPTO_NHPOLY1305=y
CONFIG_CRYPTO_ADIANTUM=y
CONFIG_CRYPTO_ESSIV=y

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_VMAC=y

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
# CONFIG_CRYPTO_CRC32 is not set
CONFIG_CRYPTO_XXHASH=y
CONFIG_CRYPTO_BLAKE2B=y
# CONFIG_CRYPTO_BLAKE2S is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=y
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
# CONFIG_CRYPTO_RMD128 is not set
CONFIG_CRYPTO_RMD160=y
# CONFIG_CRYPTO_RMD256 is not set
# CONFIG_CRYPTO_RMD320 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_STREEBOG=y
# CONFIG_CRYPTO_TGR192 is not set
CONFIG_CRYPTO_WP512=y

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
# CONFIG_CRYPTO_ANUBIS is not set
# CONFIG_CRYPTO_ARC4 is not set
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
# CONFIG_CRYPTO_CAST5 is not set
CONFIG_CRYPTO_CAST6=y
# CONFIG_CRYPTO_DES is not set
# CONFIG_CRYPTO_FCRYPT is not set
# CONFIG_CRYPTO_KHAZAD is not set
# CONFIG_CRYPTO_SALSA20 is not set
CONFIG_CRYPTO_CHACHA20=y
# CONFIG_CRYPTO_SEED is not set
# CONFIG_CRYPTO_SERPENT is not set
CONFIG_CRYPTO_SM4=y
# CONFIG_CRYPTO_TEA is not set
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=y

#
# Random Number Generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_HASH_INFO=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
# CONFIG_CRYPTO_LIB_BLAKE2S is not set
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=2
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA256=y
CONFIG_CRYPTO_HW=y
# CONFIG_CRYPTO_DEV_ALLWINNER is not set
# CONFIG_CRYPTO_DEV_PICOXCELL is not set
CONFIG_CRYPTO_DEV_EXYNOS_RNG=y
CONFIG_CRYPTO_DEV_S5P=y
# CONFIG_CRYPTO_DEV_ATMEL_AUTHENC is not set
CONFIG_CRYPTO_DEV_ATMEL_AES=y
CONFIG_CRYPTO_DEV_ATMEL_TDES=y
# CONFIG_CRYPTO_DEV_ATMEL_SHA is not set
CONFIG_CRYPTO_DEV_ATMEL_I2C=y
CONFIG_CRYPTO_DEV_ATMEL_ECC=y
CONFIG_CRYPTO_DEV_ATMEL_SHA204A=y
CONFIG_CRYPTO_DEV_CPT=y
CONFIG_CAVIUM_CPT=y
CONFIG_CRYPTO_DEV_NITROX=y
CONFIG_CRYPTO_DEV_NITROX_CNN55XX=y
CONFIG_CRYPTO_DEV_MARVELL=y
CONFIG_CRYPTO_DEV_OCTEONTX_CPT=y
CONFIG_CRYPTO_DEV_CAVIUM_ZIP=y
CONFIG_CRYPTO_DEV_QCE=y
CONFIG_CRYPTO_DEV_QCE_SKCIPHER=y
# CONFIG_CRYPTO_DEV_QCE_ENABLE_ALL is not set
CONFIG_CRYPTO_DEV_QCE_ENABLE_SKCIPHER=y
# CONFIG_CRYPTO_DEV_QCE_ENABLE_SHA is not set
CONFIG_CRYPTO_DEV_QCE_SW_MAX_LEN=512
CONFIG_CRYPTO_DEV_QCOM_RNG=y
# CONFIG_CRYPTO_DEV_IMGTEC_HASH is not set
CONFIG_CRYPTO_DEV_ZYNQMP_AES=y
# CONFIG_CRYPTO_DEV_MEDIATEK is not set
CONFIG_CRYPTO_DEV_VIRTIO=y
CONFIG_CRYPTO_DEV_SAFEXCEL=y
# CONFIG_CRYPTO_DEV_CCREE is not set
CONFIG_CRYPTO_DEV_HISI_SEC=y
CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG is not set
CONFIG_CRYPTO_DEV_SA2UL=y
CONFIG_ASYMMETRIC_KEY_TYPE=y
# CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE is not set
# CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE is not set

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_TRUSTED_KEYRING is not set
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking

#
# Library routines
#
CONFIG_RAID6_PQ=y
CONFIG_RAID6_PQ_BENCHMARK=y
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=y
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_STMP_DEVICE=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
CONFIG_CRC32_SELFTEST=y
# CONFIG_CRC32_SLICEBY8 is not set
CONFIG_CRC32_SLICEBY4=y
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=y
# CONFIG_CRC7 is not set
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
# CONFIG_XZ_DEC is not set
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_DMA_DECLARE_COHERENT=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=16
CONFIG_CMA_SIZE_PERCENTAGE=10
# CONFIG_CMA_SIZE_SEL_MBYTES is not set
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
CONFIG_CMA_SIZE_SEL_MIN=y
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
CONFIG_DMA_API_DEBUG=y
# CONFIG_DMA_API_DEBUG_SG is not set
CONFIG_SGL_ALLOC=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_CLZ_TAB=y
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_SPLIT=y
CONFIG_SG_POOL=y
CONFIG_MEMREGION=y
CONFIG_STACKDEPOT=y
CONFIG_SBITMAP=y
# CONFIG_PARMAN is not set
# CONFIG_OBJAGG is not set
# CONFIG_STRING_SELFTEST is not set
# end of Library routines

CONFIG_GENERIC_LIB_ASHLDI3=y
CONFIG_GENERIC_LIB_ASHRDI3=y
CONFIG_GENERIC_LIB_LSHRDI3=y
CONFIG_GENERIC_LIB_CMPDI2=y
CONFIG_GENERIC_LIB_UCMPDI2=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
# CONFIG_PRINTK_TIME is not set
CONFIG_PRINTK_CALLER=y
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_DYNAMIC_DEBUG is not set
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
# end of printk and dmesg options

#
# Compile-time checks and compiler options
#
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
CONFIG_HEADERS_INSTALL=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
# CONFIG_MAGIC_SYSRQ is not set
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
CONFIG_DEBUG_FS_DISALLOW_MOUNT=y
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_MISC=y
# CONFIG_UBSAN_ALIGNMENT is not set
# end of Generic Kernel Debugging Instruments

# CONFIG_DEBUG_KERNEL is not set

#
# Memory Debugging
#
# CONFIG_PAGE_EXTENSION is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_SLUB_DEBUG_ON is not set
CONFIG_SLUB_STATS=y
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# end of Memory Debugging

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_WW_MUTEX_SELFTEST=y
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_STACKTRACE=y
CONFIG_WARN_ALL_UNSEEDED_RANDOM=y

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
CONFIG_BUG_ON_DATA_CORRUPTION=y
# end of Debug kernel data structures

#
# RCU Debugging
#
CONFIG_RCU_CPU_STALL_TIMEOUT=21
# end of RCU Debugging

CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
# CONFIG_SAMPLES is not set
CONFIG_HAVE_KCSAN_COMPILER=y

#
# mips Debugging
#
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_8250=y
CONFIG_USE_GENERIC_EARLY_PRINTK_8250=y
# CONFIG_CMDLINE_BOOL is not set
CONFIG_SPINLOCK_TEST=y
# CONFIG_SCACHE_DEBUGFS is not set
# end of mips Debugging

#
# Kernel Testing and Coverage
#
CONFIG_KUNIT=y
CONFIG_KUNIT_DEBUGFS=y
# CONFIG_KUNIT_TEST is not set
CONFIG_KUNIT_EXAMPLE_TEST=y
# CONFIG_KUNIT_ALL_TESTS is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_KCOV=y
# CONFIG_KCOV_ENABLE_COMPARISONS is not set
# CONFIG_KCOV_INSTRUMENT_ALL is not set
CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
# CONFIG_RUNTIME_TESTING_MENU is not set
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage
# end of Kernel hacking

# CONFIG_WARN_MISSING_DOCUMENTS is not set

--uuS0SezJWtn3Kjzw--
