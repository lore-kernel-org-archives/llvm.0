Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52EF324B2D;
	Tue,  7 Jul 2026 08:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413036; cv=none; b=UGz3CUFhQkPKvqw6EC5zrJfwLAxroAAp6gZhan9u+ZPMjMxDu+i4xJDPBE9vSXr9Q8hP/eo3qdSs76YCcSeIUZ8nS9FR4HnteHhKOgBcO6IOg678gRmR2WKcXjt7yRZFYFZZnI9CFXnJ438gr9LGswRlbcPP+11C/CFnJnoeSZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413036; c=relaxed/simple;
	bh=nP5SS8TSn5a1GQ/GBM9vcN4zxKMjiK9AstDAgspH3Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gM7S4y2poXbJDAb0cLSllqEY0XouC7cldRd9KZntwS0F4gvpzCoTC+3o5wiJ8pk/AwoSAs/sX2Sd0TLNpJDDDg1pHcF+9o1+84ykE7vvo3Xu9JeIwNvsJaYMPKeO2hlH+F4WKlpEhzvhqGWBVTWHBCCCbXSXBtGfr/f2hoJX4YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEFi/gRZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEFi/gRZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783413034; x=1814949034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nP5SS8TSn5a1GQ/GBM9vcN4zxKMjiK9AstDAgspH3Ms=;
  b=fEFi/gRZe9hjx9v6SrDla8SHH4JGLGFSt8D1SK1Kqr6qilITFeUO2XGu
   L5yWntpXjM+bhEANoGBnbp4F7ENrjX748eW8Tb3THUClYUD79CELahwnb
   buaXkOITUj2AzmCzQIorw01OZ1QKJN+An5bnRWgL1mSaHTNDq80y5NRfG
   jhzxJZJpE8V5chGDq1EzlTKwiEywRN0gk1ovEmmH+6/qjcGXciHPpwHkN
   33LSiJ1JPuS/qpbHUD7bmUUWQ78pNVoXSQJCzXCQnSj4w0d1+NzGv1GTk
   +lCFMpyQtQH4wAKBpopU5PRe+f/zKI0ZBo9UtxIF0ZLEEIpuzlud9Af0z
   w==;
X-CSE-ConnectionGUID: KFDPs85pSmqedOmbRjp3CQ==
X-CSE-MsgGUID: r/vfQhSURhmoqGr2KtWeeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="83031799"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83031799"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 01:30:33 -0700
X-CSE-ConnectionGUID: LZSYVUCuQJyacjLdi8uxMg==
X-CSE-MsgGUID: dM7jaC+ZThG2ZHIge1VmMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="254588886"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 07 Jul 2026 01:30:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wh1Bt-00000000F9t-3HG1;
	Tue, 07 Jul 2026 08:30:06 +0000
Date: Tue, 7 Jul 2026 16:29:39 +0800
From: kernel test robot <lkp@intel.com>
To: Yonggil Song <yonggil.song@samsung.com>,
	"jaegeuk@kernel.org" <jaegeuk@kernel.org>,
	"chao@kernel.org" <chao@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Yonggil Song <yonggil.song@samsung.com>,
	"linux-f2fs-devel@lists.sourceforge.net" <linux-f2fs-devel@lists.sourceforge.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Dongjin Kim <dongjin_.kim@samsung.com>,
	Seokhwan Kim <sukka.kim@samsung.com>,
	Daejun Park <daejun7.park@samsung.com>
Subject: Re: [PATCH] f2fs: introduce gcless mount option to avoid foreground
 GC
Message-ID: <202607071623.ZxOpKv3S-lkp@intel.com>
References: <20260706062043epcms2p16928216befdca1242bc2d3cd7cb34afe@epcms2p1>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706062043epcms2p16928216befdca1242bc2d3cd7cb34afe@epcms2p1>

Hi Yonggil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cb8ff3ead9a3fc43727980be58c7099506f65261]

url:    https://github.com/intel-lab-lkp/linux/commits/Yonggil-Song/f2fs-introduce-gcless-mount-option-to-avoid-foreground-GC/20260706-154229
base:   cb8ff3ead9a3fc43727980be58c7099506f65261
patch link:    https://lore.kernel.org/r/20260706062043epcms2p16928216befdca1242bc2d3cd7cb34afe%40epcms2p1
patch subject: [PATCH] f2fs: introduce gcless mount option to avoid foreground GC
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260707/202607071623.ZxOpKv3S-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607071623.ZxOpKv3S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607071623.ZxOpKv3S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:14:
>> fs/f2fs/f2fs.h:2945:4: warning: shift count >= width of type [-Wshift-count-overflow]
    2945 |                         test_opt(sbi, RESERVE_NODE));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:150:26: note: expanded from macro 'test_opt'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   In file included from fs/f2fs/dir.c:14:
   fs/f2fs/f2fs.h:2953:6: warning: shift count >= width of type [-Wshift-count-overflow]
    2953 |         if (test_opt(sbi, RESERVE_NODE) &&
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:150:26: note: expanded from macro 'test_opt'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   2 warnings generated.
--
   In file included from fs/f2fs/super.c:33:
>> fs/f2fs/f2fs.h:2945:4: warning: shift count >= width of type [-Wshift-count-overflow]
    2945 |                         test_opt(sbi, RESERVE_NODE));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:150:26: note: expanded from macro 'test_opt'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   In file included from fs/f2fs/super.c:33:
   fs/f2fs/f2fs.h:2953:6: warning: shift count >= width of type [-Wshift-count-overflow]
    2953 |         if (test_opt(sbi, RESERVE_NODE) &&
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:150:26: note: expanded from macro 'test_opt'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
>> fs/f2fs/super.c:520:6: warning: shift count >= width of type [-Wshift-count-overflow]
     520 |         if (test_opt(sbi, RESERVE_NODE) &&
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:150:26: note: expanded from macro 'test_opt'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   fs/f2fs/super.c:526:39: warning: shift count >= width of type [-Wshift-count-overflow]
     526 |         if (!test_opt(sbi, RESERVE_ROOT) && !test_opt(sbi, RESERVE_NODE) &&
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:150:26: note: expanded from macro 'test_opt'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   fs/f2fs/super.c:1528:6: warning: shift count >= width of type [-Wshift-count-overflow]
    1528 |         if (test_opt(sbi, RESERVE_NODE) &&
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:150:26: note: expanded from macro 'test_opt'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   fs/f2fs/super.c:1529:21: warning: shift count >= width of type [-Wshift-count-overflow]
    1529 |                         (ctx->opt_mask & BIT(F2FS_MOUNT_RESERVE_NODE)) &&
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   fs/f2fs/super.c:1534:21: warning: shift count >= width of type [-Wshift-count-overflow]
    1534 |                 ctx->opt_mask &= ~BIT(F2FS_MOUNT_RESERVE_NODE);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   fs/f2fs/super.c:2475:37: warning: shift count >= width of type [-Wshift-count-overflow]
    2475 |         if (test_opt(sbi, RESERVE_ROOT) || test_opt(sbi, RESERVE_NODE))
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:150:26: note: expanded from macro 'test_opt'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   8 warnings generated.


vim +2945 fs/f2fs/f2fs.h

e48e16f3e37fac Daeho Jeong 2026-01-10  2916  
3bac20a8f011b8 Jaegeuk Kim 2022-11-30  2917  extern void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync);
0abd675e97e60d Chao Yu     2017-07-09  2918  static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
000519f27866af Chao Yu     2017-07-06  2919  					struct inode *inode, bool is_inode)
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2920  {
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2921  	block_t	valid_block_count;
2141879369681f Chunhai Guo 2025-08-07  2922  	unsigned int valid_node_count, avail_user_node_count;
0f1c6ede6da9f7 Chao Yu     2024-02-20  2923  	unsigned int avail_user_block_count;
af033b2aa8a874 Chao Yu     2018-09-20  2924  	int err;
0abd675e97e60d Chao Yu     2017-07-09  2925  
af033b2aa8a874 Chao Yu     2018-09-20  2926  	if (is_inode) {
af033b2aa8a874 Chao Yu     2018-09-20  2927  		if (inode) {
af033b2aa8a874 Chao Yu     2018-09-20  2928  			err = dquot_alloc_inode(inode);
af033b2aa8a874 Chao Yu     2018-09-20  2929  			if (err)
af033b2aa8a874 Chao Yu     2018-09-20  2930  				return err;
af033b2aa8a874 Chao Yu     2018-09-20  2931  		}
af033b2aa8a874 Chao Yu     2018-09-20  2932  	} else {
af033b2aa8a874 Chao Yu     2018-09-20  2933  		err = dquot_reserve_block(inode, 1);
af033b2aa8a874 Chao Yu     2018-09-20  2934  		if (err)
af033b2aa8a874 Chao Yu     2018-09-20  2935  			return err;
0abd675e97e60d Chao Yu     2017-07-09  2936  	}
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2937  
c40e15a9a59f79 Yangtao Li  2022-12-21  2938  	if (time_to_inject(sbi, FAULT_BLOCK))
812c60564ca721 Chao Yu     2017-11-13  2939  		goto enospc;
812c60564ca721 Chao Yu     2017-11-13  2940  
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2941  	spin_lock(&sbi->stat_lock);
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2942  
0f1c6ede6da9f7 Chao Yu     2024-02-20  2943  	valid_block_count = sbi->total_valid_block_count + 1;
2141879369681f Chunhai Guo 2025-08-07  2944  	avail_user_block_count = get_available_block_count(sbi, inode,
2141879369681f Chunhai Guo 2025-08-07 @2945  			test_opt(sbi, RESERVE_NODE));
300a842937fbcf Chao Yu     2021-12-11  2946  
0f1c6ede6da9f7 Chao Yu     2024-02-20  2947  	if (unlikely(valid_block_count > avail_user_block_count)) {
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2948  		spin_unlock(&sbi->stat_lock);
0abd675e97e60d Chao Yu     2017-07-09  2949  		goto enospc;
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2950  	}
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2951  
2141879369681f Chunhai Guo 2025-08-07  2952  	avail_user_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
2141879369681f Chunhai Guo 2025-08-07  2953  	if (test_opt(sbi, RESERVE_NODE) &&
2141879369681f Chunhai Guo 2025-08-07  2954  			!__allow_reserved_root(sbi, inode, true))
2141879369681f Chunhai Guo 2025-08-07  2955  		avail_user_node_count -= F2FS_OPTION(sbi).root_reserved_nodes;
ef86d70994b57c Gu Zheng    2013-11-19  2956  	valid_node_count = sbi->total_valid_node_count + 1;
2141879369681f Chunhai Guo 2025-08-07  2957  	if (unlikely(valid_node_count > avail_user_node_count)) {
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2958  		spin_unlock(&sbi->stat_lock);
0abd675e97e60d Chao Yu     2017-07-09  2959  		goto enospc;
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2960  	}
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2961  
ef86d70994b57c Gu Zheng    2013-11-19  2962  	sbi->total_valid_node_count++;
ef86d70994b57c Gu Zheng    2013-11-19  2963  	sbi->total_valid_block_count++;
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2964  	spin_unlock(&sbi->stat_lock);
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2965  
000519f27866af Chao Yu     2017-07-06  2966  	if (inode) {
000519f27866af Chao Yu     2017-07-06  2967  		if (is_inode)
000519f27866af Chao Yu     2017-07-06  2968  			f2fs_mark_inode_dirty_sync(inode, true);
000519f27866af Chao Yu     2017-07-06  2969  		else
0abd675e97e60d Chao Yu     2017-07-09  2970  			f2fs_i_blocks_write(inode, 1, true, true);
000519f27866af Chao Yu     2017-07-06  2971  	}
ef86d70994b57c Gu Zheng    2013-11-19  2972  
41382ec43255b5 Jaegeuk Kim 2016-05-16  2973  	percpu_counter_inc(&sbi->alloc_valid_block_count);
0abd675e97e60d Chao Yu     2017-07-09  2974  	return 0;
0abd675e97e60d Chao Yu     2017-07-09  2975  
0abd675e97e60d Chao Yu     2017-07-09  2976  enospc:
af033b2aa8a874 Chao Yu     2018-09-20  2977  	if (is_inode) {
af033b2aa8a874 Chao Yu     2018-09-20  2978  		if (inode)
af033b2aa8a874 Chao Yu     2018-09-20  2979  			dquot_free_inode(inode);
af033b2aa8a874 Chao Yu     2018-09-20  2980  	} else {
0abd675e97e60d Chao Yu     2017-07-09  2981  		dquot_release_reservation_block(inode, 1);
af033b2aa8a874 Chao Yu     2018-09-20  2982  	}
0abd675e97e60d Chao Yu     2017-07-09  2983  	return -ENOSPC;
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2984  }
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2985  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
