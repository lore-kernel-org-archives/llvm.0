Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DCE3594B;
	Mon,  3 Feb 2025 10:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738577349; cv=none; b=PCA11Mm2KE/zNkQ+pyU6NGF0wlw45kg0ZxmAFQZJkHdc8eA3qBcd6eUZiBDTpovYQ95YT+8XJxy65fiXUJ8vbVTcrt/8nw3zBMwoRETFQpPoNka6utr3EeL5Q4H3z6l1iWtPtRP3AlFxH4PVF1Fdb6kQ/y6ZEKbwevgppP92VCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738577349; c=relaxed/simple;
	bh=svLd/H/1hWUDg+N8moPYn9QABWRDG1NyAQHvyAvw5PI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s1UmUCWFN3FXpnhNXTqT0gR3LgVKZl/IHX8RbsWnsV1PRzhGg/QWUf2ivcyS9/jIKY2667kTvnDvnFQ+UJM2/qvaXO/ROHSpRpQ0TG+zfvV47/wYDvttTIrvQ2s1TcjvsdnmpzMosZ4t45T1AEoINy65C57rhftwjlIu03kT1Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEDVgmeX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEDVgmeX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738577347; x=1770113347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=svLd/H/1hWUDg+N8moPYn9QABWRDG1NyAQHvyAvw5PI=;
  b=TEDVgmeXUe9SocjqHjAFn5SRqXu3iDA38D0F+hI3lovdGCs+VmxItlXl
   jj2wTTItgWKRjHKHMzGK+LDifwyT8h4KFZl5k+QoUZsx1wMlm8BIUrZM9
   mYSWM0WGTLmAgH/kD3en7ED25SEntP/2akRF9fg9GoHOGNaS0+9/e4MBy
   lGdgXhr6diumJsmK2SW5pDCTShGT/bNmEG/dQQdBcsTeWkChp8A8T+TzO
   ZCJgWQ47C2tZA8AIfb0dSh8HgGPSjHyli0kcwu4w9gnMFK7Ok/Olvss1o
   FhAEU1gENpos4z14+O+0WsroC22Z5mHy0xqgOASG3pk8FI5nU1WZ4TmAN
   Q==;
X-CSE-ConnectionGUID: u6lIpjLnRymTCUObbBv60A==
X-CSE-MsgGUID: F0euxS7bQMOaJikerWmXdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="42985844"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="42985844"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 02:09:06 -0800
X-CSE-ConnectionGUID: d3rNyI6YQDGU+5DwmeQHqQ==
X-CSE-MsgGUID: R2uXP4hKSkiFUGTbBRT4OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110145654"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2025 02:09:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tetO2-000qml-1S;
	Mon, 03 Feb 2025 10:09:02 +0000
Date: Mon, 3 Feb 2025 18:08:32 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 6/28] WARNING: modpost: EXPORT symbol
 "mutex_lock_nested" [vmlinux] version generation failed, symbol will not be
 versioned.
Message-ID: <202502031729.hkWcluUp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux thread-safety
head:   e64bf5ab040e65a8cb92f59d3f3fd7bdd9f0a907
commit: 3e34df6b7b07777fba80dd604cc702173adcddd5 [6/28] linux/mutex.h: Annotate struct mutex and mutex functions
config: s390-randconfig-001-20250203 (https://download.01.org/0day-ci/archive/20250203/202502031729.hkWcluUp-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502031729.hkWcluUp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502031729.hkWcluUp-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: EXPORT symbol "mutex_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ww_mutex_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "ww_mutex_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ww_mutex_trylock" [vmlinux] version generation failed, symbol will not be versioned.
Is "ww_mutex_trylock" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "mutex_lock_nested" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_lock_nested" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "_mutex_lock_nest_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "_mutex_lock_nest_lock" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "mutex_lock_io_nested" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_lock_io_nested" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "mutex_trylock" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_trylock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "atomic_dec_and_mutex_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "atomic_dec_and_mutex_lock" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: "mutex_lock_nested" [kernel/locking/locktorture.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [kernel/locking/locktorture.ko] has no CRC!
WARNING: modpost: "ww_mutex_unlock" [kernel/locking/locktorture.ko] has no CRC!
>> WARNING: modpost: "mutex_lock_nested" [kernel/time/test_udelay.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [kernel/time/test_udelay.ko] has no CRC!
>> WARNING: modpost: "mutex_lock_nested" [fs/fuse/virtiofs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/fuse/virtiofs.ko] has no CRC!
>> WARNING: modpost: "mutex_lock_nested" [fs/ext2/ext2.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [fs/ext2/ext2.ko] has no CRC!
>> WARNING: modpost: "mutex_lock_nested" [fs/cramfs/cramfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/cramfs/cramfs.ko] has no CRC!
>> WARNING: modpost: "mutex_lock_nested" [fs/exfat/exfat.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/exfat/exfat.ko] has no CRC!
>> WARNING: modpost: "mutex_lock_nested" [fs/hfsplus/hfsplus.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [fs/hfsplus/hfsplus.ko] has no CRC!
>> WARNING: modpost: "mutex_lock_nested" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "atomic_dec_and_mutex_lock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
>> WARNING: modpost: "mutex_lock_nested" [fs/hpfs/hpfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/hpfs/hpfs.ko] has no CRC!
>> WARNING: modpost: "mutex_lock_nested" [fs/ntfs3/ntfs3.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/ntfs3/ntfs3.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/ntfs3/ntfs3.ko] has no CRC!
>> WARNING: modpost: "mutex_lock_nested" [fs/ufs/ufs.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [fs/ufs/ufs.ko] has no CRC!
>> WARNING: modpost: "mutex_lock_nested" [fs/jffs2/jffs2.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [fs/jffs2/jffs2.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/affs/affs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/affs/affs.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/omfs/omfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/omfs/omfs.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/jfs/jfs.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/jfs/jfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/jfs/jfs.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/pstore/pstore.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/pstore/pstore.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [lib/test_lockup.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [lib/test_lockup.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/bus/mhi/host/mhi.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/bus/mhi/host/mhi.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/pinctrl/pinctrl-mcp23s08.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/pinctrl/pinctrl-mcp23s08.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/gpio/gpio-latch.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/gpio/gpio-latch.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/gpio/gpio-mockup.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/gpio/gpio-mockup.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/gpio/gpio-virtio.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/gpio/gpio-virtio.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/led-class.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/led-class.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/led-class-flash.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/led-class-flash.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/led-class-multicolor.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/led-class-multicolor.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/leds-aw200xx.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/leds-aw200xx.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/leds-is31fl319x.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/leds-is31fl319x.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/leds-lm3642.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/leds-lm3642.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/leds-lp3944.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/leds-lp3944.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/leds-lp50xx.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/leds-lp50xx.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/leds-pca9532.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/leds-pca9532.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/leds-pca955x.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/leds-pca955x.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/leds-pca963x.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/leds-pca963x.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/flash/leds-lm3601x.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/flash/leds-lm3601x.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/flash/leds-rt8515.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/flash/leds-rt8515.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/char/ipmi/ipmb_dev_int.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/char/ipmi/ipmb_dev_int.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/misc/eeprom/max6875.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/misc/eeprom/max6875.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/misc/eeprom/idt_89hpesx.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/misc/eeprom/idt_89hpesx.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/misc/eeprom/ee1004.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/misc/eeprom/ee1004.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/misc/lis3lv02d/lis3lv02d.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/misc/lis3lv02d/lis3lv02d.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/misc/ics932s401.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/misc/ics932s401.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/misc/isl29020.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/misc/isl29020.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/dax/kmem.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/dax/kmem.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/scsi/scsi_mod.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/scsi_mod.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/scsi/scsi_transport_sas.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/scsi_transport_sas.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/scsi/libsas/libsas.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/libsas/libsas.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/scsi/scsi_transport_srp.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/scsi_transport_srp.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/scsi/st.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/st.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/scsi/sd_mod.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/sd_mod.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/scsi/sg.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/sg.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/nvme/host/nvme-core.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/nvme/host/nvme-core.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/nvme/host/nvme-fabrics.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/nvme/host/nvme-fabrics.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/nvme/target/nvme-loop.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/nvme/target/nvme-loop.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/media/rc/rc-core.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/rc/rc-core.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/power/supply/bq2415x_charger.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/power/supply/bq2415x_charger.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/power/supply/bq24257_charger.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/power/supply/bq24257_charger.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/power/supply/bq24735-charger.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/power/supply/bq24735-charger.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/power/supply/bq256xx_charger.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/power/supply/bq256xx_charger.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/power/supply/ug3105_battery.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/power/supply/ug3105_battery.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
