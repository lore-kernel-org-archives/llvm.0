Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BE3125D6;
	Thu,  2 Jan 2025 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735813041; cv=none; b=bZ/HMHBaFufT6TrqZv+2hYlnSnSsY8iEP/i2r/35kifxtcrWlhmGx1m0GXBbC2Qpxty6CwpRrF05shoRYGSV9vqr6WdPBHcHk/8yCJWzJccuuAS+c/MYlq/Ouk/TuWqp5Bu1P4r/3+Sa2ufk99mI8E6FYswcDEt4CXnUaErdBhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735813041; c=relaxed/simple;
	bh=D7CA55YdOp+fE1Rlyh6h9ubuMNN5SF8bOjllsPY4zQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SRTCsbm+Sp4inNTIxKK+HTK2Tszd7CCH/UMQwk58GCXqZIrn8nDWRxV1cHgJ5VLkAZINTaHWUzpMiw71jhJvSMWMkupzHHuhREv57H6piVQqfRg5XX5pEuwjpgagRy9Mvv9CC0GR9UD11qcymBjhq5XOAu0mpBBwWUVEM3vXHF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LNzelgEY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNzelgEY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735813039; x=1767349039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D7CA55YdOp+fE1Rlyh6h9ubuMNN5SF8bOjllsPY4zQI=;
  b=LNzelgEYagi3dcYmEamlAbcJieUzhH2VRy/xWMvY7tcxGZNP48jlpWga
   7X9NXdovFxYvWVEZxzSm7PX3MtBZqOh4Y83j/jjvxqfRxeFL+9mew6L9T
   GGSxtDTAPDGa9/1LTeeURUiN6QUzmb5yHw1AbOhDLlf4fhNgTZk64MA8e
   lSSDI5VQeti7hLJyzXYFNg0rV5dabfR1/Yg31hw/UeYb4pCpUAaytetnL
   ccMLgG5YJuPBe0Mn7nmgH5fZQyn2rM3vDe0bPp+bs8hBBQvAIQ4mV8vM4
   823i2KgboApR/oihyijrY/TCs5SfJKUNRNTcNVvMtH1ihHJ4HNDiwFqIE
   w==;
X-CSE-ConnectionGUID: Zr4Evl7kS8ytEUOhc6Qd7g==
X-CSE-MsgGUID: mh0sPamSS4St7gqbilWQrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="23634224"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="23634224"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 02:17:19 -0800
X-CSE-ConnectionGUID: wEKVem/EQyy2Au/za6hGDA==
X-CSE-MsgGUID: xDr46f49TTOfu/K1uv46FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="106336474"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Jan 2025 02:17:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTIGR-0008ON-18;
	Thu, 02 Jan 2025 10:17:15 +0000
Date: Thu, 2 Jan 2025 18:16:14 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Gelmini <andrea.gelmini@gelma.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/739 1/1] fs/bcachefs/ec.c:950:9: error: use
 of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
Message-ID: <202501021846.hljuDpo3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs pr/739
head:   5aab4d7cc3e134b97e6bb36ea9d51325e66e258c
commit: d581cdb2a0705aed99b7534ad8c164ce30377a4e [1/1] Fix typos
config: x86_64-randconfig-004-20250102 (https://download.01.org/0day-ci/archive/20250102/202501021846.hljuDpo3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501021846.hljuDpo3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501021846.hljuDpo3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/ec.c:5:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/bcachefs/ec.c:950:9: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
     950 |         return allocate_dropping_locks_errcode(trans,
         |                ^
   fs/bcachefs/btree_iter.h:889:31: note: expanded from macro 'allocate_dropping_locks_errcode'
     889 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                      ^
>> fs/bcachefs/ec.c:950:9: error: use of undeclared identifier 'PF_MEMALLOC_NOWARN'
   fs/bcachefs/btree_iter.h:889:53: note: expanded from macro 'allocate_dropping_locks_errcode'
     889 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                            ^
   1 warning and 2 errors generated.
--
   In file included from fs/bcachefs/btree_key_cache.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/bcachefs/btree_key_cache.c:149:7: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
     149 |         ck = allocate_dropping_locks(trans, ret,
         |              ^
   fs/bcachefs/btree_iter.h:899:37: note: expanded from macro 'allocate_dropping_locks'
     899 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^
>> fs/bcachefs/btree_key_cache.c:149:7: error: use of undeclared identifier 'PF_MEMALLOC_NOWARN'
   fs/bcachefs/btree_iter.h:899:59: note: expanded from macro 'allocate_dropping_locks'
     899 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^
   fs/bcachefs/btree_key_cache.c:245:26: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
     245 |                 struct bkey_i *new_k = allocate_dropping_locks(trans, ret,
         |                                        ^
   fs/bcachefs/btree_iter.h:899:37: note: expanded from macro 'allocate_dropping_locks'
     899 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^
   fs/bcachefs/btree_key_cache.c:245:26: error: use of undeclared identifier 'PF_MEMALLOC_NOWARN'
   fs/bcachefs/btree_iter.h:899:59: note: expanded from macro 'allocate_dropping_locks'
     899 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^
   1 warning and 4 errors generated.
--
   In file included from fs/bcachefs/btree_cache.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/bcachefs/btree_cache.c:831:24: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'; did you mean 'KMALLOC_RECLAIM'?
     831 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
         |                               ^~~~~~~~~~~~~~~~~~~~~
         |                               KMALLOC_RECLAIM
   fs/bcachefs/btree_iter.h:881:46: note: expanded from macro 'memalloc_flags_do'
     881 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^
   include/linux/slab.h:584:2: note: 'KMALLOC_RECLAIM' declared here
     584 |         KMALLOC_RECLAIM = KMALLOC_NORMAL,
         |         ^
   1 warning and 1 error generated.


vim +/PF_MEMALLOC_NORECLAIM +950 fs/bcachefs/ec.c

cd575ddf57af00 Kent Overstreet 2018-11-01  946  
9f6bd30703a32c Kent Overstreet 2021-08-24  947  static int ec_stripe_mem_alloc(struct btree_trans *trans,
cd575ddf57af00 Kent Overstreet 2018-11-01  948  			       struct btree_iter *iter)
cd575ddf57af00 Kent Overstreet 2018-11-01  949  {
d95dd378c207dd Kent Overstreet 2023-05-28 @950  	return allocate_dropping_locks_errcode(trans,
d581cdb2a0705a Andrea Gelmini  2024-12-22  951  			__ec_stripe_mem_alloc(trans->c, iter->pos.offset));
cd575ddf57af00 Kent Overstreet 2018-11-01  952  }
cd575ddf57af00 Kent Overstreet 2018-11-01  953  

:::::: The code at line 950 was first introduced by commit
:::::: d95dd378c207ddec7551cce2e047e6067c3c27ab bcachefs: allocate_dropping_locks()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
