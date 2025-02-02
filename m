Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2816142AA4;
	Sun,  2 Feb 2025 11:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738495961; cv=none; b=B9sjhOwSVkY8wPJrLD9+3Ga0ECFdpxp1zr1ZRoZdo/EOXAiLSZyrHU7b4xNaHsXziAQsf5Yid/O7q+eLaEEZ/lwv7XcfPUq6DNxU9R5NIciJeTGFtXT9wkyvW9dQnnrXxQrVjBjpHA2Bt4EgDi4zPq+cs4QNS1TSdWQc0PTaTSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738495961; c=relaxed/simple;
	bh=Qmx5MWkJHxihCnDHNluyVHcDDLrjl1SQrJZ//Y2lZNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jObUzj9VONQUk5U7XftgxPojaI7CfDGxAAKL1VjQNfHEMX09/7U6WEJ90GPWcQtMkuFJKSNoGtvqwkA26NgqqHbatOprbxAjsN9ieQ7wXm8WPO12p/27/6IcVyTdGehmghhp7sHLp+rY+rtVJ00FAPldLoTqGl1FPusLKHFaKjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XnffBsm9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnffBsm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738495959; x=1770031959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qmx5MWkJHxihCnDHNluyVHcDDLrjl1SQrJZ//Y2lZNI=;
  b=XnffBsm9H/bIDPLKFASCaqwD8Wem9yP+gGY7mJi7pqqQhf9/ez3dzOU4
   Ov+rdmVBbtDZITlFHE3Y6C7W3PcdX7mpGimF+WuU8HAZSCSNTIRSaBfsY
   FAlYd1lazXXgiFGsBwT7mGzv4Q/frP22ZQqB5vHckRSrt6rsNzLcXW6AF
   FzxdcB/wfVsS8X4qFNX4JYqgVAuS38snTx2AU4Xdo1vlnrQLueJAgKLjP
   bTJ5+MlELw07cEE7/ucVJcDD/SXLpkN0LXG6o8WOiuaAlzpo/U5ceFRs3
   b4lqOIvhSM0vn6ZjiBypCUV+itS39UPviy6OPjfrgdWFb1yF10ncmUoSy
   g==;
X-CSE-ConnectionGUID: m6+myj+OTy+sDbWnBcw+gw==
X-CSE-MsgGUID: iGJgF38tTMGGFx5/Vaj38g==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="49604007"
X-IronPort-AV: E=Sophos;i="6.13,253,1732608000"; 
   d="scan'208";a="49604007"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 03:32:38 -0800
X-CSE-ConnectionGUID: esd5+4bCSeemdS73KlwlnQ==
X-CSE-MsgGUID: MX/aaKvNSeS3zghNMw1ITA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110901589"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Feb 2025 03:32:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teYDK-000pcZ-1e;
	Sun, 02 Feb 2025 11:32:34 +0000
Date: Sun, 2 Feb 2025 19:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 6/28] WARNING: modpost: "mutex_lock"
 [fs/fat/msdos.ko] has no CRC!
Message-ID: <202502021944.ked9b99B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux thread-safety
head:   1fb61c841ca602318a356ae71432c2b8afbf7224
commit: 165738e93ed8ffda3d0ee4b2d958b89a23acd6d3 [6/28] linux/mutex.h: Annotate struct mutex and mutex functions
config: arm-imx_v6_v7_defconfig (https://download.01.org/0day-ci/archive/20250202/202502021944.ked9b99B-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502021944.ked9b99B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502021944.ked9b99B-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: EXPORT symbol "mutex_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "mutex_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ww_mutex_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "ww_mutex_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ww_mutex_trylock" [vmlinux] version generation failed, symbol will not be versioned.
Is "ww_mutex_trylock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "mutex_lock_interruptible" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_lock_interruptible" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "mutex_lock_killable" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_lock_killable" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "mutex_trylock" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_trylock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ww_mutex_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "ww_mutex_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ww_mutex_lock_interruptible" [vmlinux] version generation failed, symbol will not be versioned.
Is "ww_mutex_lock_interruptible" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "atomic_dec_and_mutex_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "atomic_dec_and_mutex_lock" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: "mutex_lock" [fs/fat/msdos.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [fs/fat/msdos.ko] has no CRC!
>> WARNING: modpost: "mutex_lock" [fs/isofs/isofs.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [fs/isofs/isofs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/udf/udf.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/udf/udf.ko] has no CRC!
>> WARNING: modpost: "mutex_lock" [drivers/gpio/gpio-siox.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [drivers/gpio/gpio-siox.ko] has no CRC!
>> WARNING: modpost: "mutex_lock" [drivers/dma/dmatest.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [drivers/dma/dmatest.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [drivers/net/wireless/ath/ath10k/ath10k_core.ko] has no CRC!
>> WARNING: modpost: "mutex_lock" [drivers/net/wireless/ath/ath10k/ath10k_core.ko] has no CRC!
>> WARNING: modpost: "mutex_lock" [drivers/net/wireless/ath/ath10k/ath10k_sdio.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [drivers/net/wireless/ath/ath10k/ath10k_sdio.ko] has no CRC!
>> WARNING: modpost: "mutex_lock" [drivers/net/wireless/broadcom/brcm80211/brcmfmac/brcmfmac.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [drivers/net/wireless/broadcom/brcm80211/brcmfmac/brcmfmac.ko] has no CRC!
>> WARNING: modpost: "mutex_lock" [drivers/net/wireless/marvell/mwifiex/mwifiex.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [drivers/net/wireless/marvell/mwifiex/mwifiex.ko] has no CRC!
>> WARNING: modpost: "mutex_lock_interruptible" [drivers/net/wireless/marvell/mwifiex/mwifiex.ko] has no CRC!
>> WARNING: modpost: "mutex_lock" [drivers/net/wireless/ti/wlcore/wlcore.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [drivers/net/wireless/ti/wlcore/wlcore.ko] has no CRC!
>> WARNING: modpost: "mutex_lock_interruptible" [drivers/net/wireless/ti/wlcore/wlcore.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/net/wireless/ti/wl12xx/wl12xx.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/net/wireless/ti/wl12xx/wl12xx.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/net/wireless/ti/wl18xx/wl18xx.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/net/wireless/ti/wl18xx/wl18xx.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/usb/misc/usbtest.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/usb/misc/usbtest.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/usb/gadget/legacy/gadgetfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/usb/gadget/legacy/gadgetfs.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/usb/gadget/legacy/gadgetfs.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [drivers/usb/gadget/legacy/gadgetfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/usb/class/cdc-acm.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/usb/class/cdc-acm.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/usb/serial/usbserial.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/usb/serial/usbserial.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/usb/serial/ftdi_sio.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/usb/serial/ftdi_sio.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/input/mouse/psmouse.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/input/mouse/psmouse.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/input/mouse/psmouse.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/i2c/adv7180.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/i2c/adv7180.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/media/i2c/adv7180.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/i2c/ov2680.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/i2c/ov2680.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/i2c/ov5640.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/i2c/ov5640.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/tuners/mxl5007t.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/tuners/mxl5007t.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/tuners/r820t.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/tuners/r820t.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/tuners/si2157.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/tuners/si2157.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/tuners/tuner-simple.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/tuners/tuner-simple.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/tuners/tda18271.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/tuners/tda18271.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/tuners/tda9887.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/tuners/tda9887.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/tuners/xc2028.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/tuners/xc2028.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/tuners/xc4000.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/tuners/xc4000.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/tuners/xc5000.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/tuners/xc5000.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/dvb-frontends/au8522_common.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/au8522_common.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/media/dvb-frontends/bcm3510.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/bcm3510.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/dvb-frontends/cx24117.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/cx24117.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/dvb-frontends/cxd2099.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/cxd2099.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/dvb-frontends/cxd2880/cxd2880.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/cxd2880/cxd2880.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/media/dvb-frontends/dibx000_common.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/dibx000_common.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/media/dvb-frontends/dib7000m.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/dib7000m.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/media/dvb-frontends/dib7000p.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/dib7000p.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/media/dvb-frontends/dib8000.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/dib8000.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/media/dvb-frontends/dib9000.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/dib9000.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/dvb-frontends/drxd.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/drxd.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/dvb-frontends/drxk.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/drxk.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/dvb-frontends/mxl5xx.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/mxl5xx.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/dvb-frontends/mxl692.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/mxl692.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/dvb-frontends/rtl2832_sdr.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/rtl2832_sdr.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/media/dvb-frontends/rtl2832_sdr.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/dvb-frontends/si2168.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/si2168.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/dvb-frontends/stv090x.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/stv090x.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/dvb-frontends/stv0910.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/stv0910.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/dvb-frontends/tda10071.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/tda10071.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/dvb-frontends/ts2020.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/ts2020.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/media/dvb-frontends/dib0070.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/dib0070.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/media/dvb-frontends/dib0090.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/dvb-frontends/dib0090.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/platform/chips-media/coda/coda-vpu.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/platform/chips-media/coda/coda-vpu.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/usb/uvc/uvcvideo.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/usb/uvc/uvcvideo.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/media/usb/uvc/uvcvideo.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/media/spi/cxd2880-spi.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/spi/cxd2880-spi.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/hwmon/jc42.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/hwmon/jc42.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/bluetooth/btnxpuart.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/bluetooth/btnxpuart.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
