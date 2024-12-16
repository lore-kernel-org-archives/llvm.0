Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0614313D29A;
	Mon, 16 Dec 2024 20:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734380554; cv=none; b=AzSR78UqlI0pNfBNZw9zIuW0kq0IJNXWAYsDAtcBcPaTrV/d2T8BnXVZqwtDKWEq4Oj+EbuYoaGhs02DAH+fe6PQyjgyq1SGkdJY5uuH7Vd/0V14UYSrv1OlbD1ChCvulA084YWfErPDaZSNnJ6iA61S6rZiXCpl+xQIaRkBvpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734380554; c=relaxed/simple;
	bh=EeKTGiCqv8QdWwqNNszwwoZY0J8vzhskFJ5oRmo5akE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dIqVIvrhd/6vTOJDIAhg/5Cm5XAayuNeQ756UJDCODoJh4w1MOy2IXjqSfxo2uRJq9NZG914/13a/7owVWpy1RVo/CEh7Pfvt8WZticbU9vqKoGaeP5j4hzwi02Bd7ZQNeeO6K2A0HL4Jl1lkXm1QLtwAE7Ug+H2PjzHlvr0HAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dM7pViM4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dM7pViM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734380553; x=1765916553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EeKTGiCqv8QdWwqNNszwwoZY0J8vzhskFJ5oRmo5akE=;
  b=dM7pViM44QPLehMgcG7QQyh+i1COXHf6yPdsil7Nu25LJj31UN2U3p3x
   6/Bpn8fzBcbXeDud2m88FzdZJLuvIT6/IG7tjvJhGk0FX/WN0NYtqkaER
   EFavypJfhavWGbcnshuwa6nmSS/a5LHWXr7xhjqgPMz9j6bHFnRLiYuv3
   RyY8BlIB1tyHrsNqU4TJ81APNyjVvck8qfIijbo6PETS4lC6jTwYDYyfj
   JJhq8cYwZRsQ3Lqlm/gYfW6wUh5lJ+OhX3Nog3PG8QZ+rOz8W9R1J3WL2
   v8eVN3nHQBf/+w6pPU4ragMGxgQaeS79/JEv9FDu3E0LNKJykGHwbZ3kU
   A==;
X-CSE-ConnectionGUID: WWA7Orb5ShWXykQRMyHcaA==
X-CSE-MsgGUID: YzZF59FjRYCfSLO1X/++5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38558508"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="38558508"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 12:22:32 -0800
X-CSE-ConnectionGUID: mXOd39IrRiOmx5MnHvz71w==
X-CSE-MsgGUID: S0RkYcbhTYWWngpuQj2BKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97767036"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Dec 2024 12:22:31 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNHbo-000ESS-1k;
	Mon, 16 Dec 2024 20:22:28 +0000
Date: Tue, 17 Dec 2024 04:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:wip 19/20] fs/f2fs/segment.c:2891:4: error: call to undeclared
 function 'reset_curseg_fields'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202412170421.kaVgRXyk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
head:   99c1b937f7efd14347261f99e40036e481c6cbc0
commit: adf3b6b31460b800b74602a535414e50d1e761c5 [19/20] f2fs: fix to avoid panic once fallocation fails for pinfile
config: x86_64-buildonly-randconfig-004-20241217 (https://download.01.org/0day-ci/archive/20241217/202412170421.kaVgRXyk-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412170421.kaVgRXyk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412170421.kaVgRXyk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/segment.c:9:
   In file included from include/linux/f2fs_fs.h:11:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/f2fs/segment.c:2891:4: error: call to undeclared function 'reset_curseg_fields'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2891 |                         reset_curseg_fields(curseg);
         |                         ^
   fs/f2fs/segment.c:3671:13: error: static declaration of 'reset_curseg_fields' follows non-static declaration
    3671 | static void reset_curseg_fields(struct curseg_info *curseg)
         |             ^
   fs/f2fs/segment.c:2891:4: note: previous implicit declaration is here
    2891 |                         reset_curseg_fields(curseg);
         |                         ^
   1 warning and 2 errors generated.


vim +/reset_curseg_fields +2891 fs/f2fs/segment.c

  2872	
  2873	/*
  2874	 * Allocate a current working segment.
  2875	 * This function always allocates a free segment in LFS manner.
  2876	 */
  2877	static int new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
  2878	{
  2879		struct curseg_info *curseg = CURSEG_I(sbi, type);
  2880		unsigned int segno = curseg->segno;
  2881		bool pinning = type == CURSEG_COLD_DATA_PINNED;
  2882		int ret;
  2883	
  2884		if (curseg->inited)
  2885			write_sum_page(sbi, curseg->sum_blk, GET_SUM_BLOCK(sbi, segno));
  2886	
  2887		segno = __get_next_segno(sbi, type);
  2888		ret = get_new_segment(sbi, &segno, new_sec, pinning);
  2889		if (ret) {
  2890			if (ret == -ENOSPC)
> 2891				reset_curseg_fields(curseg);
  2892			return ret;
  2893		}
  2894	
  2895		curseg->next_segno = segno;
  2896		reset_curseg(sbi, type, 1);
  2897		curseg->alloc_type = LFS;
  2898		if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK)
  2899			curseg->fragment_remained_chunk =
  2900					get_random_u32_inclusive(1, sbi->max_fragment_chunk);
  2901		return 0;
  2902	}
  2903	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
