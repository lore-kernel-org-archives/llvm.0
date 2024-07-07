Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD42D1DFF7;
	Sun,  7 Jul 2024 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720371954; cv=none; b=n/uw59z0tVPmOx7ndVNt4eRDjyfGmCSwZHU/GHi29ulMW5qEKoopCbsMZg9rpDKvJra8uCgHA/VYKqhLipPsA9uWlZoXwrgXYG7MuHpGJnAEQyV/MHY12bg+jPeSnYzGBwbfSrX8mSGmVcPV5sqEsHi75q3F/lC8cr+37+im9Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720371954; c=relaxed/simple;
	bh=i6KGoCpJnCx3OiRmHrSxCsSRTwsgE6tNYNiKvNjiXJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eeeBfj+5GZQIWqVAMsB/spZFzLIYyd2nSQ6Yb4HIEy4ZPjsk5tzoJ94Q37JlEv9gQ9DFQdwUul4YqhIDxXG5L5XWvPsFhMwPBx+i5AEUbVOBiOZbpgA+TW6BEO8lCm0Y50OiEsEPcfgpwuN4r6z+YHinhXwgUO1P216Gn9M8x+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G1gCzkS8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1gCzkS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720371952; x=1751907952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i6KGoCpJnCx3OiRmHrSxCsSRTwsgE6tNYNiKvNjiXJE=;
  b=G1gCzkS8wUDj0Hdzx9UY0izXuo8qLRIvx4PKMgqH2eGZrIvPYaUjwbhh
   6U0KzC3tKErOsBF9NyRg+DlEtsO3oBWOXOcMTalB6+5JxiTj7lvPt4gcL
   c4V63xHY4q5tl83Rlh1gP0yGPkmuFJu2UI9V/hJYUCTye3xtx8Qik7/bP
   oMBxS6/9t3N7xAOa8drs26OqeWMFqDy7hdWtBKmsC1FfpeCwc61yZOqdE
   XIe8SFLJvg2xZDYiP8eNwT3d6GkFWUm4Zh9AcgRjRbYfOrZR9fR1VaSnP
   ks0rJsADberIyKTKMvXTZuf4Wc9xNle4S282Yb7oERkI7S/Aa/F0ICFxm
   g==;
X-CSE-ConnectionGUID: 66Tz8rZ5S9mMsBvRpMFI+Q==
X-CSE-MsgGUID: r9BfGPtST7K8C9fHnSyYkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17449459"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="17449459"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 10:05:51 -0700
X-CSE-ConnectionGUID: yELR9w6MReW9RDk5jh5uEg==
X-CSE-MsgGUID: DwJJsYfRSg+HmdElycOrYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="51643398"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jul 2024 10:05:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQVKe-000V8S-0C;
	Sun, 07 Jul 2024 17:05:48 +0000
Date: Mon, 8 Jul 2024 01:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgtime 5/13] arch/powerpc/include/asm/cmpxchg.h:636:2:
 error: call to '__compiletime_assert_35' declared with 'error' attribute:
 Unsupported size for __cmpxchg
Message-ID: <202407080156.STNjCTNk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgtime
head:   ce2d8b57e9c187fac67576e9577736d268780ba9
commit: 034a5675908ff1a97b0e6f0f209373e97d969972 [5/13] fs: add infrastructure for multigrain timestamps
config: powerpc-randconfig-001-20240707 (https://download.01.org/0day-ci/archive/20240708/202407080156.STNjCTNk-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407080156.STNjCTNk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407080156.STNjCTNk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/inode.c:9:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/inode.c:7:
   In file included from include/linux/fs.h:6:
   In file included from include/linux/wait_bit.h:8:
   In file included from include/linux/wait.h:9:
   In file included from include/linux/spinlock.h:63:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:14:
   In file included from include/linux/atomic.h:7:
   In file included from arch/powerpc/include/asm/atomic.h:11:
>> arch/powerpc/include/asm/cmpxchg.h:636:2: error: call to '__compiletime_assert_35' declared with 'error' attribute: Unsupported size for __cmpxchg
     636 |         BUILD_BUG_ON_MSG(1, "Unsupported size for __cmpxchg");
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:510:2: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:220:1: note: expanded from here
     220 | __compiletime_assert_35
         | ^
   1 warning and 1 error generated.


vim +636 arch/powerpc/include/asm/cmpxchg.h

ae3a197e3d0bfe David Howells    2012-03-28  619  
ae3a197e3d0bfe David Howells    2012-03-28  620  static __always_inline unsigned long
da58b23cb976ab Michael Ellerman 2016-11-24  621  __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new,
ae3a197e3d0bfe David Howells    2012-03-28  622  	  unsigned int size)
ae3a197e3d0bfe David Howells    2012-03-28  623  {
ae3a197e3d0bfe David Howells    2012-03-28  624  	switch (size) {
d0563a1297e234 Pan Xinhui       2016-04-27  625  	case 1:
d0563a1297e234 Pan Xinhui       2016-04-27  626  		return __cmpxchg_u8(ptr, old, new);
d0563a1297e234 Pan Xinhui       2016-04-27  627  	case 2:
d0563a1297e234 Pan Xinhui       2016-04-27  628  		return __cmpxchg_u16(ptr, old, new);
ae3a197e3d0bfe David Howells    2012-03-28  629  	case 4:
ae3a197e3d0bfe David Howells    2012-03-28  630  		return __cmpxchg_u32(ptr, old, new);
ae3a197e3d0bfe David Howells    2012-03-28  631  #ifdef CONFIG_PPC64
ae3a197e3d0bfe David Howells    2012-03-28  632  	case 8:
ae3a197e3d0bfe David Howells    2012-03-28  633  		return __cmpxchg_u64(ptr, old, new);
ae3a197e3d0bfe David Howells    2012-03-28  634  #endif
ae3a197e3d0bfe David Howells    2012-03-28  635  	}
10d8b1480e6966 pan xinhui       2016-02-23 @636  	BUILD_BUG_ON_MSG(1, "Unsupported size for __cmpxchg");
ae3a197e3d0bfe David Howells    2012-03-28  637  	return old;
ae3a197e3d0bfe David Howells    2012-03-28  638  }
ae3a197e3d0bfe David Howells    2012-03-28  639  

:::::: The code at line 636 was first introduced by commit
:::::: 10d8b1480e6966ba03cd3afad3b5d6eb5e341fae powerpc: Use BUILD_BUG_ON_MSG() for unsupported {cmp}xchg sizes

:::::: TO: pan xinhui <xinhui.pan@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
