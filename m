Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC78301035;
	Mon, 10 Nov 2025 09:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762767928; cv=none; b=BkE+X01hmdudB7VHTcGk8UPctcnXWcoHxEkZZhJoxAbysCa+2wIZWe76tBFwTo37ykAOUNUrW2hBAEk71m4NJjE0vymu1ALxthJ630wBL2294o7G6ybHjAWj+YaZJRl8qBatuw+S1LuENdZQQnGkrVSlJCf41yZOL/Lg0kQvDcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762767928; c=relaxed/simple;
	bh=KuOjXaqFLtRTrWcU25hNsiUdYFSF7AKmNnR0D7iVs8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bEQOLXbmNbsjztTEBdI6WI+xEIYhOOzy7YZvkmSQKgwdrEp1iCpy6NyU2Knf8MNt95pw6fUt66QEV4OO1cm1dT57TGLw5KqhXik/eaSgTL4tYARHnyu9N1UoiAHUjK60iMe7x2VSxd2yprQT05nyV7/eOQeGbQgd9acomGJFT08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJwLtHvx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJwLtHvx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762767926; x=1794303926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KuOjXaqFLtRTrWcU25hNsiUdYFSF7AKmNnR0D7iVs8w=;
  b=nJwLtHvx2/DKyI+CQQsOBMwDhFvVw9QXKkDcbm/Y+koL1Aqtrl6fNpI7
   /0+mGuPIMkaEXg20Qgj7YvKoqWZsaytUsCYnAxI3tJButteGTT0wayA8P
   uDfqLChbAfHYM+6P9CuBCqeXyv9i63TqoNJJajW9ZCv1Q2Y3LLb1o8xA2
   yHa4VCaB1WPAzLtQN+19QF7IM90NJ2BSL9vYOCtqEOnqnqRzxNcOuugsf
   COhQYBQsO2t1w35MqcCrGMx4yQT7ZcJYVB83s60yCRDEQ7kiOaqw3MiG1
   0loh/pcv3UIbRafefGVEywwmS41gfLb+ZCwsBjCGOfe8vr7cIZD/5+E43
   A==;
X-CSE-ConnectionGUID: 0q4L5y96TomrBrm/Q7uHQw==
X-CSE-MsgGUID: i4V/Pkh7TIKjdaR726RbEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="75501420"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="75501420"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 01:45:26 -0800
X-CSE-ConnectionGUID: OoOWK0+ZTNqbv6Jt1lGamg==
X-CSE-MsgGUID: /zafgGzwQmuakdWBMgK3kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="219285834"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2025 01:45:24 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIOSg-0000Fz-0R;
	Mon, 10 Nov 2025 09:45:22 +0000
Date: Mon, 10 Nov 2025 17:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 3/3] fs/f2fs/segment.c:3075:27: warning:
 variable 'sum_node' is uninitialized when used here
Message-ID: <202511101720.2o5hUDXJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   b7778d525fe14d1d671a7036ab62a3b72488a4f9
commit: b7778d525fe14d1d671a7036ab62a3b72488a4f9 [3/3] [WIP] f2fs: cache entire summary block in curseg
config: arm-randconfig-004-20251110 (https://download.01.org/0day-ci/archive/20251110/202511101720.2o5hUDXJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d445cba39f4dd3dcda4fa1433eca825cf8fc09)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511101720.2o5hUDXJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511101720.2o5hUDXJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/segment.c:3075:27: warning: variable 'sum_node' is uninitialized when used here [-Wuninitialized]
    3075 |                 memcpy(curseg->sum_blk, sum_node, F2FS_BLKSIZE);
         |                                         ^~~~~~~~
   fs/f2fs/segment.c:3066:38: note: initialize the variable 'sum_node' to silence this warning
    3066 |                 struct f2fs_summary_block *sum_node;
         |                                                    ^
         |                                                     = NULL
   In file included from fs/f2fs/segment.c:8:
   In file included from include/linux/fs.h:7:
   In file included from include/linux/wait_bit.h:8:
   In file included from include/linux/wait.h:9:
   In file included from include/linux/spinlock.h:63:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:12:
   In file included from include/linux/bitmap.h:13:
   In file included from include/linux/string.h:382:
   include/linux/fortify-string.h:580:4: warning: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     580 |                         __read_overflow2_field(q_size_field, size);
         |                         ^
   2 warnings generated.


vim +/sum_node +3075 fs/f2fs/segment.c

  3038	
  3039	/*
  3040	 * This function always allocates a used segment(from dirty seglist) by SSR
  3041	 * manner, so it should recover the existing segment information of valid blocks
  3042	 */
  3043	static int change_curseg(struct f2fs_sb_info *sbi, int type)
  3044	{
  3045		struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
  3046		struct curseg_info *curseg = CURSEG_I(sbi, type);
  3047		unsigned int new_segno = curseg->next_segno;
  3048		bool exchange_sumblk = GET_SEC_FROM_SEG(sbi, curseg->segno) !=
  3049					GET_SEC_FROM_SEG(sbi, new_segno);
  3050	
  3051		if (curseg->inited && exchange_sumblk)
  3052			write_sum_page(sbi, curseg->sum_blk, curseg->segno);
  3053	
  3054		__set_test_and_inuse(sbi, new_segno);
  3055	
  3056		mutex_lock(&dirty_i->seglist_lock);
  3057		__remove_dirty_segment(sbi, new_segno, PRE);
  3058		__remove_dirty_segment(sbi, new_segno, DIRTY);
  3059		mutex_unlock(&dirty_i->seglist_lock);
  3060	
  3061		reset_curseg(sbi, type, 1);
  3062		curseg->alloc_type = SSR;
  3063		curseg->next_blkoff = __next_free_blkoff(sbi, curseg->segno, 0);
  3064	
  3065		if (exchange_sumblk) {
  3066			struct f2fs_summary_block *sum_node;
  3067			struct folio *sum_folio;
  3068	
  3069			sum_folio = f2fs_get_sum_folio(sbi, new_segno);
  3070			if (IS_ERR(sum_folio)) {
  3071				/* GC won't be able to use stale summary pages by cp_error */
  3072				memset(curseg->sum_blk, 0, F2FS_BLKSIZE);
  3073				return PTR_ERR(sum_folio);
  3074			}
> 3075			memcpy(curseg->sum_blk, sum_node, F2FS_BLKSIZE);
  3076			f2fs_folio_put(sum_folio, true);
  3077		}
  3078		return 0;
  3079	}
  3080	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
