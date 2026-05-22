Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A02433D4FB;
	Fri, 22 May 2026 15:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779464117; cv=none; b=QQven05TyEwWlysHUQ564FkMH6JCdTYmE1XhbGbAx46D45eu3Bjs1zIY4MHjhs4zuSNSyigQHfpSUkwGNXA/jWqrc4x+yF7KYENjOO2ZK0r6S+9OH3knUJAC6dSa8DvJr5Ydj9pKYC3Ym0hl95zsZgenXKVt3B2HAzKTqikHx5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779464117; c=relaxed/simple;
	bh=Xez5hwovgQCqGtqZReOo8+/rH94JHal3yZNDSewKjDE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rVgGcwiwH0nE9xA9TvdRXJkpbkGF41xNGqILNBcN1AcMmGUHoFwh9rTsj7udfG3jAd19ccQepM/2fJLYnBX1dgvG9Lpcps6K71Y/VRFVvAzQiLPqMxVruHiFgkou6nApo4UiU8Fq2bC7Rsbl2Mlkc37AlmK0uQL/09r9BAu8nBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f8g20/hZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8g20/hZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779464116; x=1811000116;
  h=date:from:to:cc:subject:message-id;
  bh=Xez5hwovgQCqGtqZReOo8+/rH94JHal3yZNDSewKjDE=;
  b=f8g20/hZr0W2Gq3tTFFuQkRZjMRDSZ6NXGu5hcsP7ngVBeldvJjnuzkt
   JNCXpvEJoDTuYj2C+QUSvN869PGPUwbM9M7NWOXqGc6nO+SluTVFtbEUP
   6ZHRgNdUdJJOEeWIPYKSbih+qd8t8oAb20aMp5R/pP6V3XJckp8LazMtr
   YAJ3FHyALkqKZkUWoMQUzliRnB63Zo3BdWTO4XkuF34HBmVpxstEwyc47
   NkLz/5mK5PX7xi2cLlAtrST1BYZc0pL/cKly8gIFvS1TAAeIEDd9ajc14
   RhkHEapRG6ZXL2LQBpnKJHJQtdzselQkVqfxSbMwxshJvkaa2idSw9FUg
   Q==;
X-CSE-ConnectionGUID: 8Wy29AdaQRmDa9sQ7QPHPg==
X-CSE-MsgGUID: ye66SEFuT6qmY5LhJc8PMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="105859004"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="105859004"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 08:35:15 -0700
X-CSE-ConnectionGUID: LdPb6tTORbO0dCI6XAkgaw==
X-CSE-MsgGUID: ApEyGHHsR3S5sF5KEMf8zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="242743546"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 May 2026 08:35:13 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQRu2-000000002cR-2h3v;
	Fri, 22 May 2026 15:35:10 +0000
Date: Fri, 22 May 2026 23:34:30 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Schmaus <florian.schmaus@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Subject: [scosu-sched:topic/mmap-cap-prot/v7.0 895/1197]
 drivers/android/tests/binder_alloc_kunit.c:527:19: error: incompatible
 pointer to integer conversion assigning to 'unsigned long' from 'void 
 __attribute__((btf_type_tag("user")))*' (aka 'void *')
Message-ID: <202605222320.u0qxUOOq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot/v7.0
head:   af9683ebfd23308f714cc478321fb01e5c4a7104
commit: 03959bba1ca1f4de9c10cdc883e7b319790b799b [895/1197] kunit: user_alloc: Make kunit_vm_mmap() return a pointer
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260522/202605222320.u0qxUOOq-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605222320.u0qxUOOq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605222320.u0qxUOOq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/android/tests/binder_alloc_kunit.c:527:19: error: incompatible pointer to integer conversion assigning to 'unsigned long' from 'void  __attribute__((btf_type_tag("user")))*' (aka 'void *') [-Wint-conversion]
     527 |         priv->mmap_uaddr = kunit_vm_mmap(test, priv->filp, 0, BINDER_MMAP_SIZE,
         |                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     528 |                                          PROT_READ, MAP_PRIVATE | MAP_NORESERVE,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     529 |                                          0);
         |                                          ~~
   1 error generated.


vim +527 drivers/android/tests/binder_alloc_kunit.c

5e024582f494c6 Tiffany Yang 2025-07-14  494  
5e024582f494c6 Tiffany Yang 2025-07-14  495  static int binder_alloc_test_init(struct kunit *test)
5e024582f494c6 Tiffany Yang 2025-07-14  496  {
5e024582f494c6 Tiffany Yang 2025-07-14  497  	struct binder_alloc_test *priv;
5e024582f494c6 Tiffany Yang 2025-07-14  498  	int ret;
5e024582f494c6 Tiffany Yang 2025-07-14  499  
5e024582f494c6 Tiffany Yang 2025-07-14  500  	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
5e024582f494c6 Tiffany Yang 2025-07-14  501  	if (!priv)
5e024582f494c6 Tiffany Yang 2025-07-14  502  		return -ENOMEM;
5e024582f494c6 Tiffany Yang 2025-07-14  503  	test->priv = priv;
5e024582f494c6 Tiffany Yang 2025-07-14  504  
5e024582f494c6 Tiffany Yang 2025-07-14  505  	ret = list_lru_init(&priv->binder_test_freelist);
5e024582f494c6 Tiffany Yang 2025-07-14  506  	if (ret) {
5e024582f494c6 Tiffany Yang 2025-07-14  507  		kunit_err(test, "Failed to initialize test freelist\n");
5e024582f494c6 Tiffany Yang 2025-07-14  508  		return ret;
5e024582f494c6 Tiffany Yang 2025-07-14  509  	}
5e024582f494c6 Tiffany Yang 2025-07-14  510  
5e024582f494c6 Tiffany Yang 2025-07-14  511  	/* __binder_alloc_init requires mm to be attached */
5e024582f494c6 Tiffany Yang 2025-07-14  512  	ret = kunit_attach_mm();
5e024582f494c6 Tiffany Yang 2025-07-14  513  	if (ret) {
5e024582f494c6 Tiffany Yang 2025-07-14  514  		kunit_err(test, "Failed to attach mm\n");
5e024582f494c6 Tiffany Yang 2025-07-14  515  		return ret;
5e024582f494c6 Tiffany Yang 2025-07-14  516  	}
5e024582f494c6 Tiffany Yang 2025-07-14  517  	__binder_alloc_init(&priv->alloc, &priv->binder_test_freelist);
5e024582f494c6 Tiffany Yang 2025-07-14  518  
5e024582f494c6 Tiffany Yang 2025-07-14  519  	priv->filp = anon_inode_getfile("binder_alloc_kunit",
5e024582f494c6 Tiffany Yang 2025-07-14  520  					&binder_alloc_test_fops, &priv->alloc,
5e024582f494c6 Tiffany Yang 2025-07-14  521  					O_RDWR | O_CLOEXEC);
5e024582f494c6 Tiffany Yang 2025-07-14  522  	if (IS_ERR_OR_NULL(priv->filp)) {
5e024582f494c6 Tiffany Yang 2025-07-14  523  		kunit_err(test, "Failed to open binder alloc test driver file\n");
5e024582f494c6 Tiffany Yang 2025-07-14  524  		return priv->filp ? PTR_ERR(priv->filp) : -ENOMEM;
5e024582f494c6 Tiffany Yang 2025-07-14  525  	}
5e024582f494c6 Tiffany Yang 2025-07-14  526  
5e024582f494c6 Tiffany Yang 2025-07-14 @527  	priv->mmap_uaddr = kunit_vm_mmap(test, priv->filp, 0, BINDER_MMAP_SIZE,
5e024582f494c6 Tiffany Yang 2025-07-14  528  					 PROT_READ, MAP_PRIVATE | MAP_NORESERVE,
5e024582f494c6 Tiffany Yang 2025-07-14  529  					 0);
5e024582f494c6 Tiffany Yang 2025-07-14  530  	if (!priv->mmap_uaddr) {
5e024582f494c6 Tiffany Yang 2025-07-14  531  		kunit_err(test, "Could not map the test's transaction memory\n");
5e024582f494c6 Tiffany Yang 2025-07-14  532  		return -ENOMEM;
5e024582f494c6 Tiffany Yang 2025-07-14  533  	}
5e024582f494c6 Tiffany Yang 2025-07-14  534  
5e024582f494c6 Tiffany Yang 2025-07-14  535  	return 0;
5e024582f494c6 Tiffany Yang 2025-07-14  536  }
5e024582f494c6 Tiffany Yang 2025-07-14  537  

:::::: The code at line 527 was first introduced by commit
:::::: 5e024582f494c6ff5eb2bec5183fd1eb35462500 binder: Scaffolding for binder_alloc KUnit tests

:::::: TO: Tiffany Yang <ynaffit@google.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
