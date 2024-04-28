Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2A62F29;
	Sun, 28 Apr 2024 05:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714281014; cv=none; b=ZX2aobPfaZtos3zg4WpRj2capE/5MgUnEEHE7uz26mrRWO+oKhTiL0tiUxPTWN3xx2QPufDb35u5APEUBe3jMXo5a4yiH2P2z+g7VTdX+8B+BDOiL5ZKSaKkPNqhTOXtVB0Yz8YCjgNhAw7Uth0RzeQXFomW0w+/Mb9FpanfCp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714281014; c=relaxed/simple;
	bh=DIE7UMeOXIJae8CgmF266+JjorlV/RxEcvVvmlxGs4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xk+eIoEcE9vpsNsC+1UHPGEO9dgWM8SReKZiAvYCeZu2qAAURGEg6m8mdehG+o9RedLwcIxQx0TUvbCKzTvLJB1TpHbDh0iun6ixMsnpM3fnC8JrxdgKzosq4PjiytDT5mxMZWlbQ5SYtGe8x6Ft+cy86/Ha5L8M+ZylnecvidU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0rCKpL2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0rCKpL2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714281013; x=1745817013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DIE7UMeOXIJae8CgmF266+JjorlV/RxEcvVvmlxGs4U=;
  b=i0rCKpL2ZP/D4hMY8pt2rpcE3hL2mSlQGGkJJAvt63PD4FSJAjJEPH8q
   yZgCom5JyU0MIVCvMjln0EMmS8xvQK87YM55YMrALmIuFJuY2w7HfjIjq
   kQULrYK9uDWvKFHxU1OxixOH7kJM4DamwdQOvtt4ZUHXQokoN9AcdkMjh
   f9c7FJh12CcG7nJ7VDRAWJ7aIjz5ktF3zeYhtCzcniEgP234qIOFjU/om
   dSmFOdzQbJpy9IHfg4VCez0gt1p4lwGbhc2YMeiI6ipUcvmIyPDw0XuwV
   L5AN2nQP/Hp+1Lq8irssyBi3chnu+t8865KhyD/JwzFAsdUH22JtcggCZ
   w==;
X-CSE-ConnectionGUID: pxWHvNMKQCe600lVN7LWaQ==
X-CSE-MsgGUID: PajcU1PSS/eSO1lSDXc4OA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9833494"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="9833494"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 22:10:10 -0700
X-CSE-ConnectionGUID: mgq/99ZqQvqkbVRvjywPfg==
X-CSE-MsgGUID: oD8H+LrYRCW8Omrp6xxZUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="26305263"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Apr 2024 22:10:09 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0wne-0005rA-0x;
	Sun, 28 Apr 2024 05:10:06 +0000
Date: Sun, 28 Apr 2024 13:09:19 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:vivid-kthread 36/37] ERROR: modpost:
 "__udivdi3" [drivers/media/test-drivers/vivid/vivid.ko] undefined!
Message-ID: <202404281349.QTL1bQkB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git vivid-kthread
head:   110b5a0121cf99f034671c91eed3674a652b0e6f
commit: 61319ac7d6157a0f4d6f782749b820988e22fdf2 [36/37] media: vivid: make the timestamps/seq numbers reliable
config: i386-randconfig-012-20240428 (https://download.01.org/0day-ci/archive/20240428/202404281349.QTL1bQkB-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281349.QTL1bQkB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281349.QTL1bQkB-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-r.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-celtic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-centeuro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-cyrillic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-greek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-inuit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-roman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/unicode/utf8data.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/unicode/utf8-selftest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/isofs/isofs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_arc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_md4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in security/apparmor/apparmor_policy_unpack_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/ecc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in block/t10-pi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-example-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/prime_numbers.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/rational-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libdes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/string_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/string_helpers_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bpf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/cpumask_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test-kstrtox.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_rhashtable.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_scanf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_xarray.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_memcat_p.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_blackhole_dev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_meminit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_free_pages.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_kprobes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/atomic64_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/bitfield_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/checksum_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/list-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/hashtable_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bits.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/cmdline_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/is_signed_type_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/stackinit_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/strcat_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/strscpy_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/siphash_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-pcf857x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/backlight/rt4831-backlight.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/vfb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk-gate_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/max20411-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/ttynull.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/lp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/tlclk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-ram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-raw-ram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-slimbus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-w1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/loop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/null_blk/null_blk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/ublk_drv.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/rt4831.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_virtio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/dax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/device_dax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/macintosh/mac_hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_cmdset_0020.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/charlcd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/hd44780_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/line-display.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/touchscreen/cyttsp_i2c_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/tuners/tda9887.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/menz69_wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/framebuffer-coreboot.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_rsrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/asus_atk0110.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/sound_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/drivers/snd-pcmtest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-sigmadsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-wm-adsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-i2s.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-formatter-pcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy-fb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kmemleak/kmemleak-test.o
>> ERROR: modpost: "__udivdi3" [drivers/media/test-drivers/vivid/vivid.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
