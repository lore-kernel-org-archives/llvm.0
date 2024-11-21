Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5A94317E;
	Thu, 21 Nov 2024 07:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732175065; cv=none; b=hz5p2xfLkpNsDcKFuHZKr0BNK808UY2qnVJBRu9pIUdRYTVSV/WhR7gHM7hlj2eH9US9fZzt+RZmSNeMRRmgAJ2nVk2pHruQ/NgB+XikTTbI48nKP9pjoO6oT0tub3uZ3gPrz/FClD1h95X0QjViKQoilb7Txc7sdcLwcoDH+QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732175065; c=relaxed/simple;
	bh=0TLbLPLBgcM3iGjdM8q6JOi1u/2UwoegboxVplByXgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qf4jEnzgtZ18ZhdVaMfpX9PV10HyJDzuRy9OTZM+EBcDQ2LVp/jVNgra/rSKwFMgkBihQkLR3hwDOlEQ30g7EaMnWSYMgZYU2vdxVU37OrAQN6xFlpGFQmMfI1n98nWjlKSA0V6wy4kU2JhNeqZoxkrnAgH00tcNwaccc4Vf4Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwWCM6kR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwWCM6kR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732175063; x=1763711063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0TLbLPLBgcM3iGjdM8q6JOi1u/2UwoegboxVplByXgc=;
  b=kwWCM6kRRSy3WNSihDRfLWoK6lyjSCr58Eo1bJaTcXgjahaxpCEipv/8
   HmODF3CvQGPZQB1Z2J9BG39S0Xu0TmF9TPsLusYzP29zwcriq9mmxxtuS
   FQTW2nhrc/dxvpz/puGvZ3ui0Bgvxe03qXABheiuVrjx+i//N241yN1ee
   VlViBikeoTFiPYH1Oautbh2BlLXPRCF85IdZifsAVIjG/S+KFGQeFeT0U
   RLeD37nS/5BukXi11Ne9oK6hyNlJcVUvMPQTX1GNM+7Ek395DPV/Ye8yK
   s/NsMdrnmVOxnKV3oQa+8g9bWyy18Gi3xYPXNed7agyHc2G/CeB+mEhze
   w==;
X-CSE-ConnectionGUID: 5TMXIONuSlud1SOvFAaHHQ==
X-CSE-MsgGUID: JdnD7qpLQ5yL/Q9h9w2IqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32419538"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="32419538"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 23:44:23 -0800
X-CSE-ConnectionGUID: Cta6EdotQ2a2azWLvS5Dpg==
X-CSE-MsgGUID: yVnXHSnHTNKR1szQnH1Ycw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="94237216"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Nov 2024 23:44:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tE1rO-0002ep-1z;
	Thu, 21 Nov 2024 07:44:18 +0000
Date: Thu, 21 Nov 2024 15:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: Sheng Yong <shengyong@oppo.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Song Feng <songfeng@oppo.com>,
	Yongpeng Yang <yangyongpeng1@oppo.com>,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [jaegeuk-f2fs:dev-test 35/36] ERROR: modpost:
 "f2fs_check_and_fix_write_pointer" [fs/f2fs/f2fs.ko] undefined!
Message-ID: <202411211538.Tus6kZm1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   05735334776f7f446fbda9fd7efa7d9f835096ca
commit: 98eebae9535e3ca2df2157d29a37c1b74d8deb79 [35/36] f2fs: fix changing cursegs if recovery fails on zoned device
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241121/202411211538.Tus6kZm1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411211538.Tus6kZm1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411211538.Tus6kZm1-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

In file included from fs/f2fs/segment.c:9:
In file included from include/linux/f2fs_fs.h:11:
In file included from include/linux/pagemap.h:8:
In file included from include/linux/mm.h:2213:
include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
|                            ~~~~~~~~~~~~~~~~~~~~~ ^
505 |                            item];
|                            ~~~~
include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
|                            ~~~~~~~~~~~~~~~~~~~~~ ^
512 |                            NR_VM_NUMA_EVENT_ITEMS +
|                            ~~~~~~~~~~~~~~~~~~~~~~
include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
|                               ~~~~~~~~~~~ ^ ~~~
include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
|                            ~~~~~~~~~~~~~~~~~~~~~ ^
525 |                            NR_VM_NUMA_EVENT_ITEMS +
|                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/f2fs/segment.c:5452:5: warning: no previous prototype for function 'f2fs_fix_curseg_write_pointer' [-Wmissing-prototypes]
5452 | int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
|     ^
fs/f2fs/segment.c:5452:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
5452 | int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
| ^
| static
>> fs/f2fs/segment.c:5457:5: warning: no previous prototype for function 'f2fs_check_write_pointer' [-Wmissing-prototypes]
5457 | int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
|     ^
fs/f2fs/segment.c:5457:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
5457 | int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
| ^
| static
6 warnings generated.
--
>> ERROR: modpost: "f2fs_check_and_fix_write_pointer" [fs/f2fs/f2fs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
