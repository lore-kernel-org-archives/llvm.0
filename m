Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C09269CE8;
	Thu,  6 Mar 2025 18:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741286598; cv=none; b=b68AbE4VVBl5HhdG6I3bBgEtkr9aDOzUXP56ngHd+r+rCyC1jX0M1SnlL5dzNT0o/mxb6aJWM1pZVL6ZbXzC/MIgyJY1ab4NXuTf1Mo/2lDKeaZQGpLDErLiSA/o/kLchu6BarNICCCP+3Oh3hlGocoC5JnsJ7O5vtI5P1fva0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741286598; c=relaxed/simple;
	bh=+ZC+IPzGfWdCxLUMTe0m86ZNZz3wbsO1+RCvbGChMsk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OAw0tER11xMTFLtSYef+Y7pzURh7+bJBnkzzUzOTwqakB9x1p9gQRztgTKgt8o9Ye8rnsLGFnQtYPyyw/rRWKoPFgpo5NvzRphAEqDxZsRMVgB+OavRBrD2hLhRmw27fd/WUDljjU2826EKEHsjUMqMvOlVk8pOlwMMW3yIvbCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NrTkRsg5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NrTkRsg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741286596; x=1772822596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ZC+IPzGfWdCxLUMTe0m86ZNZz3wbsO1+RCvbGChMsk=;
  b=NrTkRsg53yc+WTwKuLkZE5gG/Emb4DImnD0PCf2n9Os/mMSCIuJP+Cr9
   jxi6ChnnDDCOKULJN+V7aXK6SYeF81OW3HpnbkZ3qNNe7Tfqg2iUoe7Rt
   PU3ewdFrcbxjnS6C7d0hb6NNtmltvDkKR2gz+fiVHVOsBDIm1iEA/VEtE
   rHhu368GDF3mibZTi+ItEPuUMKW2esYWh+Pnuix0dytnEalXL88WeUKah
   ImNkOEbMugtD3mHTpXVhlbVWIOhI31ajGksvZeuubsLaRjvFJT2cQaB+g
   zG4VY+y1pIbn/KiqTRbHXZS2T8ldWqXNz9FYZRjwRpEJDXpn5f2K855ED
   w==;
X-CSE-ConnectionGUID: soRyIIlCSoepQn3WajZzEw==
X-CSE-MsgGUID: It5CS1vnTJ64eDMCBK+Nrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42231140"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="42231140"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 10:43:16 -0800
X-CSE-ConnectionGUID: p8rAkDONTe211/28XcjMJg==
X-CSE-MsgGUID: VTGPLayPSQGbU/WJ2BTPPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119611935"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Mar 2025 10:43:15 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqGBa-000NTa-1y;
	Thu, 06 Mar 2025 18:43:11 +0000
Date: Fri, 7 Mar 2025 02:42:24 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:for-6.15/io_uring-reg-vec 5/12] io_uring/rsrc.c:1266:2:
 error: call to '__compiletime_assert_555' declared with 'error' attribute:
 BUILD_BUG_ON failed: sizeof(struct bio_vec) > sizeof(struct iovec)
Message-ID: <202503070201.nEVRL9BJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.15/io_uring-reg-vec
head:   dbc5b236b665e61bc206055f8a6d45766fbec974
commit: 0b9406095d9d362ec0113e645380ac15302cd43c [5/12] io_uring: add infra for importing vectored reg buffers
config: arm-randconfig-004-20250306 (https://download.01.org/0day-ci/archive/20250307/202503070201.nEVRL9BJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503070201.nEVRL9BJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503070201.nEVRL9BJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> io_uring/rsrc.c:1266:2: error: call to '__compiletime_assert_555' declared with 'error' attribute: BUILD_BUG_ON failed: sizeof(struct bio_vec) > sizeof(struct iovec)
    1266 |         BUILD_BUG_ON(sizeof(struct bio_vec) > sizeof(struct iovec));
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:542:2: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:14:1: note: expanded from here
      14 | __compiletime_assert_555
         | ^
>> io_uring/rsrc.c:1266:2: error: call to '__compiletime_assert_555' declared with 'error' attribute: BUILD_BUG_ON failed: sizeof(struct bio_vec) > sizeof(struct iovec)
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:542:2: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:14:1: note: expanded from here
      14 | __compiletime_assert_555
         | ^
>> io_uring/rsrc.c:1266:2: error: call to '__compiletime_assert_555' declared with 'error' attribute: BUILD_BUG_ON failed: sizeof(struct bio_vec) > sizeof(struct iovec)
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:542:2: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:14:1: note: expanded from here
      14 | __compiletime_assert_555
         | ^
   3 errors generated.


vim +1266 io_uring/rsrc.c

  1263	
  1264	void io_vec_free(struct iou_vec *iv)
  1265	{
> 1266		BUILD_BUG_ON(sizeof(struct bio_vec) > sizeof(struct iovec));
  1267	
  1268		if (!iv->iovec)
  1269			return;
  1270		kfree(iv->iovec);
  1271		iv->iovec = NULL;
  1272		iv->nr = 0;
  1273	}
  1274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
