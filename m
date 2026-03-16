Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25297080E;
	Mon, 16 Mar 2026 04:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773634873; cv=none; b=AWhWCnZIeW+zOgibO5DWUM6nDkUQnmU+CT+0WmhP66y6HfU1hbuIh7kurymo2BFk73UpmF+kxIeIf5ob63o+6/fR0e1iGnAwZhJKW5VMHhbH9zb/uoJzRxrs2Zyaxd+OHjC75cW8gY+50n7akOfzfr+JW6+Jl4Mk2bvL/UaSxfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773634873; c=relaxed/simple;
	bh=ugDXr4umjV2wE5t9A2d87jF48b/dnuJsQFKJP2khR/s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W7m7EzmQ1ApizdEDb3opAC9RqaZHNf2m/UkzVw5n1WYvSkXe3E+5qc33Mq8+t/qcljDEFDOcDcZq6eVS4N0MSrU/QD9U8o4QFOAwzvKZwHyH6S/24qhHJMxc01lPX6+9GKqmgNq/bRhbyVQZ05xmCr7DcRVQTppL3P4CHrUSHyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKbRZYZW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKbRZYZW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773634872; x=1805170872;
  h=date:from:to:cc:subject:message-id;
  bh=ugDXr4umjV2wE5t9A2d87jF48b/dnuJsQFKJP2khR/s=;
  b=JKbRZYZWlY0ONgGDi1Mf7AlZb8A0W/kJawUjGLdQDBva+GY0ngUncYg0
   aZ5cwP7wp+SabZaeWJ1lpFkiXRThe/iap+DmY1nTXbVd+6NuzxAK4fzLW
   DbIFMN5B4jOY67hYgOATlNgHa6mCaFDxaoKC6tDguGohLiC3HpA7Ujl7H
   EAHGRDZdaY2wlmGjV65BzXHC3rZkD7k2IHj+s0tjD/xmn2AmMr3IHrlmJ
   TaUrbNll9E28gGDqFyguqaaSHyJL1WyiraSNGrBv5O2ByyPLDV1G7BoC0
   IhEypj8LoyJDGKbojqjD2PHV14zr7E09zQdSlFZSsTxk0hVadf6+ycc6v
   g==;
X-CSE-ConnectionGUID: iZACQJc/RM27SYahX9i7uw==
X-CSE-MsgGUID: 7WfJ2fNaS3uS1SnHtzDjKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74833895"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="74833895"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 21:21:12 -0700
X-CSE-ConnectionGUID: k/DesnSdRu2BYIyGIy55mw==
X-CSE-MsgGUID: bZVj7hi7RCqXGawirR3+eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="221876096"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Mar 2026 21:21:10 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1zRy-0000000006E-1uP7;
	Mon, 16 Mar 2026 04:21:06 +0000
Date: Mon, 16 Mar 2026 12:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 378/389] drivers/mtd/mtdchar.c:1384:9:
 error: call to undeclared function 'vma_desc_test_flags'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202603161221.qNrB6fVE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   c5a81ff6071bcf42531426e6336b5cc424df6e3d
commit: cf0dfae0323aa8b75cee0b94d5c7553b511d7bc3 [378/389] mtdchar: replace deprecated mmap hook with mmap_prepare, clean up
config: arm-randconfig-002-20260316 (https://download.01.org/0day-ci/archive/20260316/202603161221.qNrB6fVE-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 36041192cf6c9042615c8d2364cacc698ef89865)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260316/202603161221.qNrB6fVE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603161221.qNrB6fVE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mtd/mtdchar.c:1384:9: error: call to undeclared function 'vma_desc_test_flags'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1384 |         return vma_desc_test_flags(desc, VMA_SHARED_BIT) ? 0 : -EACCES;
         |                ^
   1 error generated.


vim +/vma_desc_test_flags +1384 drivers/mtd/mtdchar.c

  1375	
  1376	/*
  1377	 * set up a mapping for shared memory segments
  1378	 */
  1379	static int mtdchar_mmap_prepare(struct vm_area_desc *desc)
  1380	{
  1381	#ifdef CONFIG_MMU
  1382		return -ENODEV;
  1383	#else
> 1384		return vma_desc_test_flags(desc, VMA_SHARED_BIT) ? 0 : -EACCES;
  1385	#endif
  1386	}
  1387	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
