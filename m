Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1422842361;
	Mon, 18 Dec 2023 21:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwwNH5rL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702935082; x=1734471082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bH5wk8XMn1TIEGwWTP+ChKd+vky7DX3qpUwFjG9A448=;
  b=XwwNH5rLw/4T7kqqGlyguHcIGjAm4Dk29pTDavpB+LyW46Byev0WVxnW
   3jDB3I2jwQUfz5aiKBBBNvUleb8uyeSBxkAaLhf1r9hdnIOj446CJ4fiw
   BgByy2z65UGDUBFNvo/6Zc1CGXzJuZOzTdd+LRwQBHn84SyktDBhUTvzU
   ZRwbFl31/I9CXBEnpsHWV40qrufvQ6euOiV78VNjT6JK21V1hSlJ57MS1
   /2brvXuwgVt2CJzmR6BiWamgdMOWE2SzQombS4qxZVhzhlGVS8cb52yT0
   lzDA93FALA9esR/G5x9orWLTHybJ2SDX+8SBz5YCMMrW+rwjcq6hZvhjc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="459905548"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="459905548"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 13:31:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="804660239"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="804660239"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 18 Dec 2023 13:31:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFLCn-0004Xv-0W;
	Mon, 18 Dec 2023 21:31:17 +0000
Date: Tue, 19 Dec 2023 05:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 18/24] mm/damon/sysfs.c:96:30: error: 'counted_by'
 only applies to C99 flexible array members
Message-ID: <202312190546.yhWbDA8A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   04cc9f72453632bf9e13e06f85c11147583e5d5d
commit: 375af4a6e206c1aeb2edb1d80cbb42fd3349b287 [18/24] mm/damon/sysfs: add __counted_by() annotation
config: arm-randconfig-001-20231219 (https://download.01.org/0day-ci/archive/20231219/202312190546.yhWbDA8A-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 5ac12951b4e9bbfcc5791282d0961ec2b65575e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190546.yhWbDA8A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190546.yhWbDA8A-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/damon/sysfs.c:96:30: error: 'counted_by' only applies to C99 flexible array members
      96 |         struct damon_sysfs_region **regions_arr __counted_by(nr);
         |                                     ^~~~~~~~~~~
   mm/damon/sysfs.c:292:30: error: 'counted_by' only applies to C99 flexible array members
     292 |         struct damon_sysfs_target **targets_arr __counted_by(nr);
         |                                     ^~~~~~~~~~~
   mm/damon/sysfs.c:815:31: error: 'counted_by' only applies to C99 flexible array members
     815 |         struct damon_sysfs_context **contexts_arr __counted_by(nr);
         |                                      ^~~~~~~~~~~~
   mm/damon/sysfs.c:1666:31: error: 'counted_by' only applies to C99 flexible array members
    1666 |         struct damon_sysfs_kdamond **kdamonds_arr __counted_by(nr);
         |                                      ^~~~~~~~~~~~
   4 errors generated.


vim +/counted_by +96 mm/damon/sysfs.c

    89	
    90	/*
    91	 * init_regions directory
    92	 */
    93	
    94	struct damon_sysfs_regions {
    95		struct kobject kobj;
  > 96		struct damon_sysfs_region **regions_arr __counted_by(nr);
    97		int nr;
    98	};
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
