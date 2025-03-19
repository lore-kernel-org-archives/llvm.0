Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9B921C17B;
	Wed, 19 Mar 2025 22:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422945; cv=none; b=oyqE+X4oeb0YGzw+vO+4UvgBNm/A9m3lksOSYD5W4GXUvIxgJXJ1C1Ml+Nm9eKc5821M6Bcne9uDM2zSEI5spYKsVuBvi1aWGJOYtB2qOHBlNw3GPYj3X0/dGrFFTSwVzGeS+9SOLILsurgGc2TtRVd+2I225vprJqzQHK4H4kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422945; c=relaxed/simple;
	bh=Rzo3xoOv+immuffrPxNmQWMmO/EwBEuFgzg8kcJOZgo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WOILTaMrkwfc0PsQZsEbWDhww8W1ezpUW/FTmF4y4xuonskMmZYLs1SyCy8c4Wg2/bY4ZQSWagUUXUhW14ETpWyF+YH3ntcQgZ6J4zgEAvYrD8awE/OnTHz3WBobEn9iHBKjq2s553RjWl0mfsggKENT1DCpMxMmCn7CycjVHkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LX+/d4A3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LX+/d4A3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742422943; x=1773958943;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Rzo3xoOv+immuffrPxNmQWMmO/EwBEuFgzg8kcJOZgo=;
  b=LX+/d4A3WamZuqTPs7hlasPFEMkppiwD8sl+Z/JwdXhu583qCiZImCNT
   2eIeggHSsLf5QzjYpscDQ+hfuKMkUPsVMsQtscYzmenNfddHJx8mijq6x
   G+Tq7NkkvVLtmDntP5w0x+ccXqusGIfQ90n0N8wyU54WB0j9jiTUVIfHY
   t/atZo+ioxCtV835rjph4uOook/w6n4fPwpJOIaB9NYsKWKkTMNzLgeul
   +dTxKFECbu/xd6xW9hhLb2Tnq+c/6mJhNenNv0aLgW0gblWh/N1kLl1U/
   CpqB+hTbFlf2GUs/1l27NvVSU9CYuIqXK3QcM7NJaaIi3PogeP1TGVA3s
   g==;
X-CSE-ConnectionGUID: nTjL7exoQA+ddMozt2rkOQ==
X-CSE-MsgGUID: IKOocH4rRIyfRyDS8GzmMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="54264347"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="54264347"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 15:22:23 -0700
X-CSE-ConnectionGUID: 04ol61cXRSa3QpXzRbqhXQ==
X-CSE-MsgGUID: sxnDpROKStqy+zOe8a504w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="127644614"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 19 Mar 2025 15:22:22 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tv1ng-000FiC-2v;
	Wed, 19 Mar 2025 22:22:14 +0000
Date: Thu, 20 Mar 2025 06:22:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [sailus-media-tree:devel 8/44] ld.lld: error:
 vmlinux.a(drivers/md/dm-cache-metadata.o):(function dm_cache_metadata_open:
 .text+0x28): relocation R_RISCV_HI20 out of range: 535148 is not in
 [-524288, 524287]; references '.L_MergedGlobals.117'
Message-ID: <202503200630.YHUaE68M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-media@vger.kernel.org
TO: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Jai Luthra <jai.luthra@ideasonboard.com>

tree:   git://linuxtv.org/sailus/media_tree.git devel
head:   22577ec933050a30b5c7cbdf85c0615da11aaf37
commit: 60c9efc12e8c102073fde36286a625cca2f4c57e [8/44] media: i2c: ds90ub913: Add error handling to ub913_log_status()
config: riscv-randconfig-001-20250320 (https://download.01.org/0day-ci/archive/20250320/202503200630.YHUaE68M-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200630.YHUaE68M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200630.YHUaE68M-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(drivers/md/dm-cache-metadata.o):(function dm_cache_metadata_open: .text+0x28): relocation R_RISCV_HI20 out of range: 535148 is not in [-524288, 524287]; references '.L_MergedGlobals.117'
   >>> referenced by dm-cache-metadata.c:865 (drivers/md/dm-cache-metadata.c:865)
   >>> defined in vmlinux.a(drivers/md/dm-cache-metadata.o)
--
>> ld.lld: error: vmlinux.a(drivers/md/dm-cache-metadata.o):(function dm_cache_metadata_open: .text+0x4e): relocation R_RISCV_HI20 out of range: 536060 is not in [-524288, 524287]; references '.L_MergedGlobals'
   >>> referenced by dm-cache-metadata.c:823 (drivers/md/dm-cache-metadata.c:823)
   >>> defined in vmlinux.a(drivers/md/dm-cache-metadata.o)
--
>> ld.lld: error: vmlinux.a(drivers/md/dm-cache-metadata.o):(function dm_cache_metadata_open: .text+0x6e): relocation R_RISCV_HI20 out of range: 532893 is not in [-524288, 524287]; references 'kmalloc_caches'
   >>> referenced by dm-cache-metadata.c:824 (drivers/md/dm-cache-metadata.c:824)
   >>> defined in vmlinux.a(mm/slab_common.o)
--
>> ld.lld: error: vmlinux.a(drivers/md/dm-cache-metadata.o):(function dm_cache_metadata_open: .text+0x96): relocation R_RISCV_HI20 out of range: 532638 is not in [-524288, 524287]; references '.L.str.12'
   >>> referenced by dm-cache-metadata.c:824 (drivers/md/dm-cache-metadata.c:824)
   >>> defined in vmlinux.a(drivers/md/dm-cache-metadata.o)
--
>> ld.lld: error: vmlinux.a(drivers/md/dm-cache-metadata.o):(function dm_cache_metadata_open: .text+0x9e): relocation R_RISCV_HI20 out of range: 538001 is not in [-524288, 524287]; references 'metadata_open.__key'
   >>> referenced by dm-cache-metadata.c:824 (drivers/md/dm-cache-metadata.c:824)
   >>> defined in vmlinux.a(drivers/md/dm-cache-metadata.o)
--
>> ld.lld: error: vmlinux.a(drivers/md/dm-cache-metadata.o):(function dm_cache_metadata_open: .text+0x15e): relocation R_RISCV_HI20 out of range: 531113 is not in [-524288, 524287]; references 'sb_validator'
   >>> referenced by dm-cache-metadata.c:827 (drivers/md/dm-cache-metadata.c:827)
   >>> defined in vmlinux.a(drivers/md/dm-cache-metadata.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
