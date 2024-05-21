Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2351CD20;
	Tue, 21 May 2024 12:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716293832; cv=none; b=ZldbOxG4dYEQOktlPYt9axbD+UBXBnDVZf+aIRQ/cDhK2/qFs33ZvxeABSNor52TCjigz+Gu1m8XB+f5DgEC3N6PwDBerY/KaHg348jPB8+eoFYUdzuSq6voCxolWs2dj16np2Etd3N4tpaQktEAGWT0Ge+Ohlx88KAsTP3IgUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716293832; c=relaxed/simple;
	bh=sXXDIMWr6xz4fps1exLO9Hmcd1S30VckhOu9wPv3pkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=raEB0/wDw/feb4W+fg7IKmJlks+EorKGQ+mZl5pgsKSH+n2gUQh1TU44uUZWR7DwzehEzFjCni2XCYVOR6dwDQ+9rxuuJtd4GK4sy7LQPoucH1SvJbgtMrGjs85ZvvBWTZFKzo41upKwiqNPuus4tE4tup9XSy+B0LkRAxsWu1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTYVN2co; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTYVN2co"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716293830; x=1747829830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sXXDIMWr6xz4fps1exLO9Hmcd1S30VckhOu9wPv3pkA=;
  b=WTYVN2coyAHX4isNLfl/chxz4uvxlJM0lyghPFXxxuPOU/0FNn3AfUKW
   DGONk27eJCBTms6rWTx6tfRGLafeIvC62v8I2lNulKCAvYTDx8sc6bWC0
   qyQTQwRonG8KFCt26AbJv/hW5SO54wIpltaIPYlCxJBM+7NkPUqT1tlKp
   fYSd+0TTEideMVqb4FQaIKF7WuWeG7W2F/G44VZi36mWIOQqw2kPLbKoR
   fKfEWRdkL9xoPXSp/QqRCPgMynhPqjIRMKOo4kup+m2/7gI+eCfFlvPRY
   Va6S/yQDhYfUHSqkxfsA85OLmniaChERoRKZ6nhdS4vyEWTPKv15sLl12
   w==;
X-CSE-ConnectionGUID: NuVuKoSqSbGALwtrKPZtlg==
X-CSE-MsgGUID: wOmSldacSrCZvPxMaFd2BQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23617707"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; 
   d="scan'208";a="23617707"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 05:17:04 -0700
X-CSE-ConnectionGUID: Ljfu2liRQruXTFHq+bnyFw==
X-CSE-MsgGUID: h646agcZRDm3lrmFIKGAOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; 
   d="scan'208";a="70320631"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 21 May 2024 05:17:02 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9OQN-0006MY-1t;
	Tue, 21 May 2024 12:16:59 +0000
Date: Tue, 21 May 2024 20:16:15 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:DONTTEST-pcp-locking-bench 1/4] WARNING: modpost:
 "this_cpu_cmpxchg16b_emu" [lib/slub_kunit.ko] has no CRC!
Message-ID: <202405212012.LbVxj6ks-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git DONTTEST-pcp-locking-bench
head:   95b2f070fc4eb7b92d528f64395c5306dc993c50
commit: aefcca2d0875add24036512e1f45bb9da89989c0 [1/4] slub_kunit: hack in a stupid locking/atomics microbenchmark
config: x86_64-buildonly-randconfig-002-20240521 (https://download.01.org/0day-ci/archive/20240521/202405212012.LbVxj6ks-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405212012.LbVxj6ks-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405212012.LbVxj6ks-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-spmi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/pcf50633-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firewire/firewire-uapi-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/misc/yurex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ecm_subset.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_rndis.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_uac1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_uac1_legacy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_uac2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_uvc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_midi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/ch341.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb_debug.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/mxuport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/navman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb-serial-simple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/symbolserial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/matrix-keymap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/vivaldi-fmap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/lib_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-ccgx-ucsi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-ali1563.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/rc-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/videobuf2/videobuf2-dvb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/uvc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/ttpci/budget-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/bt8xx/bt878.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/ivtv/ivtvfb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/saa7134/saa7134-empress.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/saa7134/saa7134-dvb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-fwnode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/radio/si470x/radio-si470x-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/thermal/intel/intel_soc_dts_iosf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/thermal/intel/int340x_thermal/processor_thermal_rfim.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/thermal/intel/int340x_thermal/processor_thermal_mbox.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/thermal/intel/int340x_thermal/processor_thermal_wt_req.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/thermal/intel/int340x_thermal/processor_thermal_wt_hint.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/thermal/intel/int340x_thermal/processor_thermal_power_floor.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/of_mmc_spi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/mmc_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/crypto/atmel-sha204a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-a4tech.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-apple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-aureal.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-belkin.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cherry.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-dr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ezkey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-vivaldi-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gyration.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kensington.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouch.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kye.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lenovo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-microsoft.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ortek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-pl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-petalynx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-primax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-redragon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-saitek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-speedlink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sunplus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tivo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-topseed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-twinhan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zpff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zydacron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-viewsonic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-waltop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/intel-vbtn.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/classmate-laptop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/chrome/cros_kunit_proto_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwtracing/intel_th/intel_th_msu_sink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vdpa/vdpa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vdpa/ifcvf/ifcvf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_rsrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vhost/vringh.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/sound_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-sigmadsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/renoir/snd-acp3x-rn.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-i2s.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-formatter-pcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mtty.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy-fb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mbochs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/configfs/configfs_sample.o
WARNING: modpost: EXPORT symbol "this_cpu_cmpxchg16b_emu" [vmlinux] version generation failed, symbol will not be versioned.
Is "this_cpu_cmpxchg16b_emu" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: "this_cpu_cmpxchg16b_emu" [lib/slub_kunit.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
