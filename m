Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D94B37B025;
	Fri,  3 Apr 2026 08:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206024; cv=none; b=UsyZqv8P7x5S8v+T1AAXCbiJ8LQvfq7n6KFt8BV8TW7B8pfb6g1OAnce0vqWopkiK1y9uGFrGSUSalMMQ4MfC4hyJ6e14tKD9pCLbo5YpHNiZOZwlWhOE3SF4mK9NPy5vI5fwa7nlFaGC2u3HrK8qi2tytRdgw+M6Zoc1Ekw02k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206024; c=relaxed/simple;
	bh=CHzWtnJhUr2W4KctuglNa+kJqGqt9CPYSRAi7990V70=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VP4Yexs7XFOWknCdi9X0gKL7ph6NmsWvr1y2G4/ZinmEtFNmQji+Ix3y1IULJsklFYPrfeEwtQFIBNKvsSYbVcqsaIJoMSob2VA5G2gsg/FR5oXEKs3QvwjjW/2//QadPXMN839L/AIoy1+2bYD0MmvNJEXKXPrqpG4zpl9bv2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNPUceNL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNPUceNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206024; x=1806742024;
  h=date:from:to:cc:subject:message-id;
  bh=CHzWtnJhUr2W4KctuglNa+kJqGqt9CPYSRAi7990V70=;
  b=fNPUceNLzD5wyAauxdeQGDhwMNxPrNsfawcYt/xtvdMPqKevLgknO2KT
   dgS3yB3o9JNNS6/lHUKL2NM4UMC+XZMFo95ee56GDAH2RcEgt/Q8nCyMw
   hTL4YqbI17kVcOcZb595gmq+/6p0SHsfnS98+P20BDYCGUw3gCkfukBhm
   pPfgKc6SMFKMYXXXh4BRvYpc/0MbraCsvVDHLUojvkCndlSNNQhMcx5ih
   TGcGQFaJgbLeX2nlHtdXDOSwg5O07Vd9V0ls/eTY0hp2emMVlOPw1AkAA
   17aLKFO1ebt6G42WrZ12wwyJmRsD16iLZNSGBzXvOIN7wZVURQp1VlvEU
   w==;
X-CSE-ConnectionGUID: uvvL89cfQ2+v5jH2pzJJ4w==
X-CSE-MsgGUID: iTHwTPMWRvyceZSmzp7Osg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75312099"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75312099"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:47:01 -0700
X-CSE-ConnectionGUID: t1+RovnPQx2+9SHgz6pp7g==
X-CSE-MsgGUID: jNt4V+xZRrOnR/LCfp6eTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250287308"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:46:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aB7-0000000016y-044N;
	Fri, 03 Apr 2026 08:46:57 +0000
Date: Fri, 03 Apr 2026 16:46:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 87/109] ld.lld: error: undefined
 symbol: __divdi3
Message-ID: <202604031211.ZXvlxRg9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   feb4f7361e07b561023576f7d47ff4f8b8e5db69
commit: fe00925f7b474798a3a16e41ca0e7d9a1c12b3e7 [87/109] media: imx219: Support LINE_LENGTH_PIXELS and FRAME_LENGTH_LINES controls
config: i386-buildonly-randconfig-002-20260403 (https://download.01.org/0day-ci/archive/20260403/202604031211.ZXvlxRg9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031211.ZXvlxRg9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031211.ZXvlxRg9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __divdi3
   >>> referenced by imx219.c:540 (drivers/media/i2c/imx219.c:540)
   >>>               drivers/media/i2c/imx219.o:(imx219_apply_binning) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
