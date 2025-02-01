Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AC32557A;
	Sat,  1 Feb 2025 14:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738421726; cv=none; b=NMMApN5zl9S7f7o/RHjVrw4ApY9NOWmscycf+jBKFn0cHAJ40vOVGcB5c9YRcxcB72M0mJSE/cJ6aOHQ0KK4D1/v0QI47f/tmLj9tdSUVsY7Byn45t4WZgsnrJmraFpAB3pUQlTfP1/JwASuhX8WtGHhPYZSsG3uQ5BdWdIXz1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738421726; c=relaxed/simple;
	bh=ayzJGXE409qZ+CiL8TTKqijNJ7A/mtkGcJukg3RJiDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N2lJD86llSuVKEAzOypg8ZbGu3aBcNYrLQpLmsOgwR5x/UEWqwCh/t8K4HPojRainCicoT7x1zJJwCa6EdZLOcHHDSvLoeA35lkDcI4/ZTWj1msYktBdAjdtRlYgRBcgipo0DdNk1tiTE5JoUL9KD9If8wY8UgU+iT5s1g8wqBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MIvE5pdO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MIvE5pdO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738421723; x=1769957723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ayzJGXE409qZ+CiL8TTKqijNJ7A/mtkGcJukg3RJiDU=;
  b=MIvE5pdOo9IHDnSez8X02gOyJSb8RGzfeiDAgRPglAYGzTx3z7W/8E1r
   gHXwJ0wRTzTRYjcw00RIrjKwu57rUgRDp/FN/PzfUylgKQ4G5OusozFNg
   yAMqeCKM4PFg4LU1NTV4Ekp2secoAnBNxQV++yBxAPOjgJXWEisflQ7mu
   Whfsxge3aAL2m961Q+/CyzZ7AqY+8IgaEohZMQOSc64MC9GnfTc9Hhi7p
   pRmnFA3CvfgzGbZRqZkcThulTKD3250x0IHChTERr4X+aFEDz/y3qfFsV
   HMovVU/7a2QdUO/X+/T8OVAQOwmHYxDooG1TTfY3GEZk/8qKlOjsq7Uab
   w==;
X-CSE-ConnectionGUID: fZVUOZrKTne/1WyeaEbelg==
X-CSE-MsgGUID: LDh72zInRlGa5+3i20ZrWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="49962206"
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="49962206"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 06:55:22 -0800
X-CSE-ConnectionGUID: 4jZtghG5RKiuEgROPK+jRw==
X-CSE-MsgGUID: RYJPk3VsT8OuUrJ5kfYXXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="110447759"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Feb 2025 06:55:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teEtz-000oHN-0U;
	Sat, 01 Feb 2025 14:55:19 +0000
Date: Sat, 1 Feb 2025 22:55:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 6/28] WARNING: modpost: EXPORT symbol
 "mutex_lock" [vmlinux] version generation failed, symbol will not be
 versioned.
Message-ID: <202502012242.SLz4UHZs-lkp@intel.com>
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
commit: b48085c9ee4966abfb5b01c8dfb299834d73dbef [6/28] linux/mutex.h: Annotate struct mutex and mutex functions
config: s390-randconfig-002-20250201 (https://download.01.org/0day-ci/archive/20250201/202502012242.SLz4UHZs-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502012242.SLz4UHZs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502012242.SLz4UHZs-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: EXPORT symbol "mutex_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_lock" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "mutex_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_unlock" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "ww_mutex_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "ww_mutex_unlock" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "ww_mutex_trylock" [vmlinux] version generation failed, symbol will not be versioned.
Is "ww_mutex_trylock" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "mutex_lock_interruptible" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_lock_interruptible" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "mutex_lock_killable" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_lock_killable" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "mutex_trylock" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_trylock" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "ww_mutex_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "ww_mutex_lock" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "ww_mutex_lock_interruptible" [vmlinux] version generation failed, symbol will not be versioned.
Is "ww_mutex_lock_interruptible" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "atomic_dec_and_mutex_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "atomic_dec_and_mutex_lock" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: "mutex_trylock" [arch/s390/crypto/des_s390.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [arch/s390/crypto/des_s390.ko] has no CRC!
>> WARNING: modpost: "mutex_trylock" [arch/s390/crypto/aes_s390.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [arch/s390/crypto/aes_s390.ko] has no CRC!
>> WARNING: modpost: "mutex_lock" [arch/s390/kvm/kvm.ko] has no CRC!
>> WARNING: modpost: "mutex_lock_killable" [arch/s390/kvm/kvm.ko] has no CRC!
>> WARNING: modpost: "mutex_trylock" [arch/s390/kvm/kvm.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "atomic_dec_and_mutex_lock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
>> WARNING: modpost: "mutex_lock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
>> WARNING: modpost: "mutex_trylock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/hpfs/hpfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/hpfs/hpfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/autofs/autofs4.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [fs/autofs/autofs4.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/autofs/autofs4.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/overlayfs/overlay.ko] has no CRC!
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
