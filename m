Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37881748E;
	Sat, 22 Jun 2024 09:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719048165; cv=none; b=aH+u+rOYqODC/hUxZPdOyCNJQqmkm1ZC0NsojR+suaBxvZSZ6cl+jp09dDOGyOjHt4fGIlJo7HXIkzYY21En63XMjrcz4+vX6OClnzV8UqYNnUbgvEmVUg+dyXwkNq5oMnKck5kG9YGiaRe6tTtqWvRW7xisHTEbfL3iPpVN7kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719048165; c=relaxed/simple;
	bh=Y4E8Mj+5l0cceAQrwkZ9e1+6UTEXVFgSF2vvJgF2rbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RfZyFyB0/9gr5Div0rItUjlnavAHdhREKokc+gdUyJBT8llsftiwGP5uNimGAUBSHNWg2BOGrRARRJkm1ezuX0rR1g9EKXu6h97MTy86VNyghrDunz06L595Iw0aumJIDLH8YpTzdrciElt3XF07MP2fKv02AizRk3qYHpTTfXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUMNhyFI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUMNhyFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719048163; x=1750584163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y4E8Mj+5l0cceAQrwkZ9e1+6UTEXVFgSF2vvJgF2rbo=;
  b=UUMNhyFIfgoMtVczcmEngUCU//yLh5SA7gC/ghlxilV/U0iQ9ZRf5SJF
   OZo5KW3VGWWQyhZXSVg+7e972j8yOUTD5cexRL4d9jTdBX2AYHKmzWxMO
   dc24Kf3hdljmriX5D9drmbtirSR7oLvCJQATDQ77m6eNBR4x2LesKT2gv
   6oAv1fAo6n3OXUXMczs9LrX2nQ40tJjRhG7yYKhv0lVRWkquNISAZvYwp
   8f0r6qLQWALYMzYkyAfp6e3WBfGEk0ZjSBQDLW1NNfhqIqJkzi2HzqU7P
   Mj4BBeU8KAyBHNqvsA7vtrZbHie8ZLrYmDpnid3bQHtwRUBs2DZSyu8ON
   g==;
X-CSE-ConnectionGUID: XRaZwhCkSLm2m+LvJVwPHg==
X-CSE-MsgGUID: ONP7XtXEQcm5rEIp1dxhRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="19893460"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="19893460"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 02:22:42 -0700
X-CSE-ConnectionGUID: PBOWf08+QDmOUQZtjcm60Q==
X-CSE-MsgGUID: YbDWQWKuS7O4NpLDqCJtfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="73568692"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Jun 2024 02:22:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKwxD-0009Ve-0T;
	Sat, 22 Jun 2024 09:22:39 +0000
Date: Sat, 22 Jun 2024 17:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 5/5] ERROR: modpost:
 "__early_static_cpu_has__thunk" [arch/x86/kvm/kvm.ko] undefined!
Message-ID: <202406221743.kuMlNIxf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   03896a2cffb7e9210068032867433c5393d497ea
commit: 03896a2cffb7e9210068032867433c5393d497ea [5/5] todo
config: i386-buildonly-randconfig-002-20240622 (https://download.01.org/0day-ci/archive/20240622/202406221743.kuMlNIxf-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406221743.kuMlNIxf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406221743.kuMlNIxf-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/events/intel/intel-uncore.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/events/intel/intel-cstate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/crypto/crc32-pclmul.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/kvm/kvm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/kvm/kvm-intel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/kvm/kvm-amd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/locktorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcuscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_script.o
WARNING: modpost: missing MODULE_DESCRIPTION() in security/keys/trusted-keys/trusted.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/crypto_simd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/prime_numbers.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/find_bit_benchmark.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_dhry.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_firmware.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_min_heap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_xarray.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_maple_tree.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_memcat_p.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_blackhole_dev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_meminit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ref_tracker.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/atomic64_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-pcf857x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/pci-stub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/qcom/hdma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/dmatest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vdpa/ifcvf/ifcvf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/amd-k7-agp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/amd64-agp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/efficeon-agp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/intel-agp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/intel-gtt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/nvidia-agp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/sis-agp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/lp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ppdev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_kunit_helpers.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_buddy_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_cmdline_parser_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_connector_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_damage_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_dp_mst_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_exec_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_format_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_framebuffer_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_gem_shmem_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_managed_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_mm_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_modes_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_plane_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_probe_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_rect_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/bochs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/pcf50633-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/dax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_cmdset_0020.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/hd44780_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/line-display.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/matrix-keymap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/vivaldi-fmap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-rc5t583.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-ali1563.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/mmc_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-apple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-aureal.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-belkin.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cherry.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-vivaldi-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kensington.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lcpower.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ortek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-saitek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-semitek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sunplus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gaff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tivo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zpff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-viewsonic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/corsair-cpro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestream-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/video/fbdev.o
>> ERROR: modpost: "__early_static_cpu_has__thunk" [arch/x86/kvm/kvm.ko] undefined!
>> ERROR: modpost: "__early_static_cpu_has__thunk" [arch/x86/kvm/kvm-intel.ko] undefined!
>> ERROR: modpost: "__early_static_cpu_has__thunk" [arch/x86/kvm/kvm-amd.ko] undefined!
ERROR: modpost: "__early_static_cpu_has__thunk" [drivers/gpu/drm/drm.ko] undefined!
ERROR: modpost: "__early_static_cpu_has__thunk" [drivers/gpu/drm/i915/i915.ko] undefined!
ERROR: modpost: "__early_static_cpu_has__thunk" [drivers/firewire/firewire-ohci.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
