Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F5A136351;
	Sat,  3 Aug 2024 06:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722666700; cv=none; b=C+ujiOy/Rm8PBjr4mG3ZAA2nZ5sJTNw9jGwvJa7M1v1tD2FjIVY6ojxb/jNr1pMWvUXYIvqqLFyLNXaTU3HbI+PwHn6+jWu5tARgAlReZj9Am+7m0TUgMhmFEyzCFWewVrPOlNRnrFdH7H6Sn6QOOwQc/JTnhzY42BjsWVQPQO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722666700; c=relaxed/simple;
	bh=yeJuKkkHSLb3Zf0u5cXdoPoOWgJ8zaszQxYulDzZarU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o7joP8/icVvGBjAT4Hy7roMJEFgEF/uS5W/FMMuHaVB1w/iYn8cwPyDviMC+oed1nRONJe3Bn2IqFm+JtW8kUlWyxk8+b86owTvybGr9glxSIs9Ls8QdIEE04kXAC1JozXkZC8fa8tQ6isnBOY4n9LuVaJRTkb8SnnF8FySnePw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBhqGYzk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBhqGYzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722666699; x=1754202699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yeJuKkkHSLb3Zf0u5cXdoPoOWgJ8zaszQxYulDzZarU=;
  b=QBhqGYzkst9vWCKWTFlkVD1pz9+159ON4DizUsBDRANE4xBc6iNjbDWY
   7yb6h3QY4MVx5mlrq8L3iWVhFAk/4YoThRe50jiLm/mvOS7Ox9KGgu9zi
   CBg99xORmnlyaQ4OPUy8q139E+Lb7pM9ZYegVO1CBAtouQ4cxor6VC8eo
   /zMH4qouEWz1GgbUMQ0dQCBbBmSaG+dJjv8cIiRiRQ4WIoSXf+ja3HxP1
   i2MMECeXasbREtd28e+vSM80wzOYtXX5IZZcHu9CF5lUFL0inp2dvEu/V
   sZZwoOIAPuC9SMGqT2YXO255c4ka9KqPBcFknaicGdjG1CdM6ej0BEvNh
   g==;
X-CSE-ConnectionGUID: TnDJw4XoTSisz3NcwEHyog==
X-CSE-MsgGUID: YX+/CiCMSaGdt8+fmnXuog==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="31342447"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="31342447"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 23:31:31 -0700
X-CSE-ConnectionGUID: wfHfZgCLQXappWf/DNgJYA==
X-CSE-MsgGUID: Mx/50nF/TVW0ZfwnsHoFZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="60651981"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Aug 2024 23:31:29 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa8IY-0000BQ-2X;
	Sat, 03 Aug 2024 06:31:26 +0000
Date: Sat, 3 Aug 2024 14:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 15/15] ld.lld: error: undefined symbol:
 __popcountdi2
Message-ID: <202408031328.JyFmCpZg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   3bb7a4e54bb8a2458b0e1304d85c385359895bb6
commit: 3bb7a4e54bb8a2458b0e1304d85c385359895bb6 [15/15] todo
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240803/202408031328.JyFmCpZg-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031328.JyFmCpZg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031328.JyFmCpZg-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/riscv/kvm/kvm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/btrfs/btrfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/xor.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_deflate/zlib_deflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-de2-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio_dma_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_acm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/u_serial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_serial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_obex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/u_ether.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ncm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ecm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_eem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ecm_subset.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_rndis.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_mass_storage.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_fs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/libcomposite.o
>> WARNING: modpost: "__popcountdi2" [fs/btrfs/btrfs.ko] undefined!
>> WARNING: modpost: "__popcountdi2" [drivers/gpu/drm/radeon/radeon.ko] undefined!
>> WARNING: modpost: "__popcountdi2" [drivers/md/dm-bufio.ko] undefined!
--
>> ld.lld: error: undefined symbol: __popcountdi2
>>> referenced by swiotlb.c
>>>               kernel/dma/swiotlb.o:(swiotlb_tbl_map_single) in archive vmlinux.a
>>> referenced by percpu.c
>>>               mm/percpu.o:(pcpu_alloc) in archive vmlinux.a
>>> referenced by vmalloc.c
>>>               mm/vmalloc.o:(alloc_vmap_area) in archive vmlinux.a
>>> referenced 11 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
