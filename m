Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFB818CC0D;
	Mon,  9 Sep 2024 22:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725921317; cv=none; b=g7MUqBtJp/ZUKKRnW/s3lcq2zeMw/uIzR4DT9DQRrBT4CwQnsHzc8SbwhR1wKJflsWqGzjqY90ahOT1bdJGXeMvkFSNlVMDuDynAy2D+bfz9Y0ENl6FE9Ql1TdaDQ22tNvmbv7cQ0B0ytE9AglSJF8zPPp+AXdOkEcWmL7oy/vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725921317; c=relaxed/simple;
	bh=5jhHw95ZYJu42xY8UMzXJ33P/jSqRN1W5Kp6o5UY6ts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RQqtOqIVAtxNOSjY2XqwEbdm7Da61p65JYkVmKkTfGUoMv/WX8q+4v+lLe+qG/eqkoXZSkrXLoUyad6BYBNjkS6Bz/yySCXpnzGt+srcG3rF32/SIK9tokQ1LVraiBlAsh12DtUV3hQjfdgBSmh4eJ1JrIFtxWBXUxp19MaSQDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DGXcmzsL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DGXcmzsL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725921315; x=1757457315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5jhHw95ZYJu42xY8UMzXJ33P/jSqRN1W5Kp6o5UY6ts=;
  b=DGXcmzsLF27VDNQey/5xnGlqP6vJfFdPeuSNcvMAPDPAFgwFLm0DQN9c
   k0rynlU+XaZsFXzZg0TVh9KPYIAG0N6mIQPeds4YM7bsygi1GMxUOl54L
   kofdzaiGAOcddo/1PAu0bSoG2489Sq1gzyiHVpNPt2SDEq7qLa4AjU+aI
   8bTPMtWfuxbXqfT9adNOJMKmgR/sTZtShJ6QFw7rpcZ0k+QH1MNo5qllt
   RnS2Eor8JOEJ22LVH0RooxqhqDn9z0Zrhi+SDA3lEyOWi5Ik0EO/m4oWi
   WjjqWz/18U4Ly6OV9R52cho8lBxdyypIZLO+d9mv2pV6uWtHkw1dggr7L
   g==;
X-CSE-ConnectionGUID: 5ZCStvbuRFG//hzJzJ2ntA==
X-CSE-MsgGUID: UZoeExqPQPWHB+s5SQYKfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="42158891"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="42158891"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 15:35:14 -0700
X-CSE-ConnectionGUID: 5tGFG+GXS06gVTeDOV0j1g==
X-CSE-MsgGUID: NOqMb9RzRGueapMGrbEP0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="66860526"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2024 15:35:13 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snmyV-000FIK-1p;
	Mon, 09 Sep 2024 22:35:11 +0000
Date: Tue, 10 Sep 2024 06:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 199/258]
 fs/bcachefs/btree_locking.h:450:69: warning: omitting the parameter name in
 a function definition is a C23 extension
Message-ID: <202409100642.H4Iu79Bp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: edde99ce91c811e0b46b10c82e21d883ba0cb4aa [199/258] bcachefs: Path must be locked if trans->locked && path->should_be_locked
config: i386-randconfig-003-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100642.H4Iu79Bp-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100642.H4Iu79Bp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100642.H4Iu79Bp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/extents.c:9:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   include/linux/mm.h:1200:17: error: use of undeclared identifier 'VMALLOC_START'; did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                        ^~~~~~~~~~~~~
         |                        KMALLOC_DMA
   include/linux/slab.h:421:2: note: 'KMALLOC_DMA' declared here
     421 |         KMALLOC_DMA,
         |         ^
   In file included from fs/bcachefs/extents.c:9:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   include/linux/mm.h:1200:41: error: use of undeclared identifier 'VMALLOC_END'; did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                                                ^~~~~~~~~~~
         |                                                KMALLOC_DMA
   include/linux/slab.h:421:2: note: 'KMALLOC_DMA' declared here
     421 |         KMALLOC_DMA,
         |         ^
   In file included from fs/bcachefs/extents.c:13:
   In file included from fs/bcachefs/btree_io.h:7:
>> fs/bcachefs/btree_locking.h:450:69: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     450 | static inline void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *path) {}
         |                                                                     ^
   1 warning and 2 errors generated.


vim +450 fs/bcachefs/btree_locking.h

   445	
   446	#ifdef CONFIG_BCACHEFS_DEBUG
   447	void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *);
   448	void bch2_trans_verify_locks(struct btree_trans *);
   449	#else
 > 450	static inline void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *path) {}
   451	static inline void bch2_trans_verify_locks(struct btree_trans *trans) {}
   452	#endif
   453	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
