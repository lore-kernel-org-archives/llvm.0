Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C2685C5E;
	Sat,  1 Feb 2025 16:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738426658; cv=none; b=muIQksFZm0Ly3AYhSBBbJTAWOL5PYfNko0alTQE/T9s0Opk3Yd79lvruKSEd7J1qIuPlrrg11DMZGlvBfY4Hka/wAY0UGNqGkQXPAwD5EgQnzb55WLyc1DMhzuFO3OsWSSzpi99Y9GZTUASOCeRc7oZnnV8fKBdjzduNQchLER0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738426658; c=relaxed/simple;
	bh=I6BUO5AKYqjtuN3xgeomSLUDFFdLVeXlSzRfsrUFkqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZOi+xRudhzAQmxn4kOqEMBgbnoT/+Ublnql0x1KCRwWLN2rXkpV06fqe7+FU8syjfTUB7NPTW8K2DG98MU0GpCH1KYk5qddzcEIv4bH64eZKLoTHoJNq8l/TiFzt2ja9xUTunOk1A7nC5k54y1qS3eQi1K5wZOcqf97oWYm4ex0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQ7iy7Dw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQ7iy7Dw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738426655; x=1769962655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I6BUO5AKYqjtuN3xgeomSLUDFFdLVeXlSzRfsrUFkqA=;
  b=bQ7iy7DwhuKWFaLZU8t6V965wK1dVvFa7eC9CoSyvpgpfBnS/pct3kVA
   TO/VJBa8v/uYXK36Fe7SJjOC1K32bnrarq6Hfkosvpgph3Z9KJi9mvkVR
   SgfX5sKVxg7NwyWZ24LeONforwExUM9v5Mh3IyEtlQZQWUAy6EYnEXKU6
   O1p/JlUbLoyUarybJ8GBayRDVvixUzCeWo1DdDDkbt9tyJoMUxAbsAm+V
   AxVRDhZ8jJe1OslxQst8dzkwI4NJIJ/vwILJ8eHzAk9Qr4M7yCXe2vxwP
   7f8xhzSp4xPeRrV5E7cRkOkiMzYRg+p/cNsDu3we2B10Iv4Vb4g8QX1P4
   Q==;
X-CSE-ConnectionGUID: 8/uUsYATQHaJfTn5qh4WLw==
X-CSE-MsgGUID: Cj9uycBGRkWpOFH+l5dWaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="42723599"
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="42723599"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 08:17:32 -0800
X-CSE-ConnectionGUID: 98Qoq6kRS0GLrrXX+J0Jbg==
X-CSE-MsgGUID: yA8M9xvSSpWVZkvsHorndg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="110460085"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Feb 2025 08:17:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teGBU-000oKp-2U;
	Sat, 01 Feb 2025 16:17:28 +0000
Date: Sun, 2 Feb 2025 00:16:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 7/28] WARNING: modpost: EXPORT symbol
 "sched_setattr_nocheck" [vmlinux] version generation failed, symbol will not
 be versioned.
Message-ID: <202502020025.snULYtTp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux thread-safety
head:   edb8f58988e23eb5e665bf55625f2461a878483b
commit: ae30988295858c34f5a383ccc839469d39ae6a79 [7/28] include/linux/cleanup.h: Add thread-safety annotations
config: s390-randconfig-002-20250201 (https://download.01.org/0day-ci/archive/20250202/202502020025.snULYtTp-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502020025.snULYtTp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502020025.snULYtTp-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: EXPORT symbol "sched_setattr_nocheck" [vmlinux] version generation failed, symbol will not be versioned.
Is "sched_setattr_nocheck" prototyped in <asm/asm-prototypes.h>?
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
>> WARNING: modpost: EXPORT symbol "__mnt_is_readonly" [vmlinux] version generation failed, symbol will not be versioned.
Is "__mnt_is_readonly" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "mutex_trylock" [arch/s390/crypto/des_s390.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/crypto/des_s390.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [arch/s390/crypto/aes_s390.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/crypto/aes_s390.ko] has no CRC!
WARNING: modpost: "mutex_lock" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "mutex_lock_killable" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "atomic_dec_and_mutex_lock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/hpfs/hpfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/hpfs/hpfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/autofs/autofs4.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [fs/autofs/autofs4.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/autofs/autofs4.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/overlayfs/overlay.ko] has no CRC!
>> WARNING: modpost: "__mnt_is_readonly" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/udf/udf.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/udf/udf.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/omfs/omfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/omfs/omfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/f2fs/f2fs.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/f2fs/f2fs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/f2fs/f2fs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/pstore/pstore.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/pstore/pstore.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/pstore/pstore_zone.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/pstore/pstore_zone.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/pstore/pstore_blk.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/pstore/pstore_blk.ko] has no CRC!
WARNING: modpost: "mutex_lock" [lib/test_lockup.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [lib/test_lockup.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/bus/mhi/host/mhi.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/bus/mhi/host/mhi.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/pinctrl/pinctrl-aw9523.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/pinctrl/pinctrl-aw9523.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/pinctrl/pinctrl-cy8c95x0.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/pinctrl/pinctrl-cy8c95x0.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/gpio/gpio-aggregator.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/gpio/gpio-aggregator.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/gpio/gpio-mockup.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/gpio/gpio-mockup.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/gpio/gpio-pca953x.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/gpio/gpio-pca953x.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/gpio/gpio-pcf857x.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/gpio/gpio-pcf857x.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/gpio/gpio-sim.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/gpio/gpio-sim.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/pwm/pwm-pca9685.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/pwm/pwm-pca9685.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/block/pktcdvd.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/block/pktcdvd.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/misc/eeprom/idt_89hpesx.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/misc/eeprom/idt_89hpesx.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/misc/bh1770glc.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/misc/bh1770glc.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/misc/apds9802als.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/misc/apds9802als.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/misc/isl29003.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/misc/isl29003.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/misc/tsl2550.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/misc/tsl2550.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/dax/dax.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/dax/dax.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/scsi/st.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/st.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/scsi/st.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/nvme/host/nvme-core.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/nvme/host/nvme-core.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/nvme/host/nvme-fabrics.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/nvme/host/nvme-fabrics.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/nvme/target/nvmet.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/nvme/target/nvmet.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/nvme/target/nvme-loop.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/nvme/target/nvme-loop.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/input/serio/libps2.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/input/serio/libps2.ko] has no CRC!
WARNING: modpost: "mutex_lock_killable" [drivers/input/serio/serio_raw.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/input/serio/serio_raw.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/input/serio/serio_raw.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/input/serio/serio_raw.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/input/keyboard/adp5588-keys.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/input/keyboard/adp5588-keys.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/input/keyboard/adp5589-keys.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/input/keyboard/adp5589-keys.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/input/evdev.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/input/evdev.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/input/evdev.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/input/rmi4/rmi_core.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/input/rmi4/rmi_core.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/watchdog/watchdog.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/watchdog/watchdog.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/md/raid0.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/accessibility/speakup/speakup.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/accessibility/speakup/speakup.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/ufs/core/ufshcd-core.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/ufs/core/ufshcd-core.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/memstick/core/mspro_block.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/memstick/core/mspro_block.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/crypto/atmel-i2c.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/crypto/atmel-i2c.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/devfreq/governor_userspace.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/devfreq/governor_userspace.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/devfreq/governor_passive.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/devfreq/governor_passive.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/s390/cio/vfio_ccw.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [drivers/s390/cio/vfio_ccw.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/s390/cio/vfio_ccw.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/s390/block/dasd_mod.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/s390/block/dasd_mod.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/s390/block/dasd_eckd_mod.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [drivers/s390/block/dasd_eckd_mod.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/s390/block/dasd_eckd_mod.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/s390/char/tape.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/s390/char/tape.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/s390/crypto/ap.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/s390/crypto/ap.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
