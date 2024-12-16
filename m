Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645E66116;
	Mon, 16 Dec 2024 00:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734309656; cv=none; b=Z/uO8APwTMaQ7iuhJXXCk8dlwAZOtxu/sfmoqBOtG1LCcZS48hM+Yj6U+WQwZF+yIlx6AwBVlE4PKyiu8IOP8R5M3ovo85msb8Smu9sXA4J1F1/LVfdL22rhX8JovKwDH5c5nF62BuaDAh8tDfZ2xn+ag5tvrb0XL5tifBO25q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734309656; c=relaxed/simple;
	bh=PXHmvzghVjV467+BbboUjYJuieSNBfvameSpIxwSlKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RpB8rp0FBqToccaaJyfRvF4NOsKHVaqE4gvmIIV8i3DnXLMB7/GbjPFOSkK3Z2fyvM3CjEUVGI1w/vi3xHgTtBAMJ0C0FvhCXTThWuYIzglaIdoNsDGDtctWpKuKsvp+MOAcPRUBooOXEONH2mzjFWu3iflqnIskcZb0NpGbjLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSz2HDD6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSz2HDD6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734309653; x=1765845653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PXHmvzghVjV467+BbboUjYJuieSNBfvameSpIxwSlKg=;
  b=YSz2HDD6n2De1+2hmZ6rkPCunfaxFuJJ3+9Q5Hnzh4Fj5vdRTMtajLg6
   V8l7BgtmVNRLSuMFtKUe8QsCaLrqWg9yJrWL3wBeBSEZnduFmMxN/2nzA
   r76T1o1/ArojC9n0nv9dITVMEWupVFYM6j4XYjRX848xQIRTS1ThQbD0b
   5zO/m7TFFxj5mB1b93AC6sTxyv++FgjZhZGGFHTU++bsi+yVWEtT83LKM
   v6vLtSTJM9MTyOnVgFOaNalJ8pX1VczihMqAb1pGVxsADABsIAI1eYbPt
   aYDMpoFDbSj2QtogdZp0MSxmqQ35xUQqfKd9oc6nAoHoFu38YsnrvOMdF
   g==;
X-CSE-ConnectionGUID: jS4fDFnXQvilyWcko+aC6Q==
X-CSE-MsgGUID: 5wNAlbi/RqSWZlGOmDU7DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="57166199"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="57166199"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 16:40:50 -0800
X-CSE-ConnectionGUID: LAZoIMgMTrewLAq0ZiYIkw==
X-CSE-MsgGUID: 4k+M0+FRQouY5fQGyqqldQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="96948415"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Dec 2024 16:40:48 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMzAD-000Duy-19;
	Mon, 16 Dec 2024 00:40:45 +0000
Date: Mon, 16 Dec 2024 08:40:37 +0800
From: kernel test robot <lkp@intel.com>
To: Junjie Fu <fujunjie1@qq.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3078/3764] mm/z3fold.c:353:3: error: call to
 undeclared function 'lock_page'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202412160820.Zivm9VbY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4176cf5c5651c33769de83bb61b0287f4ec7719f
commit: a6c37165ca40e362ec07d768ec418afb3c29e4ed [3078/3764] mempolicy.h: remove unnecessary header file inclusions with no test failure
config: arm64-randconfig-004-20241216 (https://download.01.org/0day-ci/archive/20241216/202412160820.Zivm9VbY-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412160820.Zivm9VbY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412160820.Zivm9VbY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/z3fold.c:353:3: error: call to undeclared function 'lock_page'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   lock_page(page);
                   ^
   mm/z3fold.c:353:3: note: did you mean 'copy_page'?
   arch/arm64/include/asm/page.h:22:13: note: 'copy_page' declared here
   extern void copy_page(void *to, const void *from);
               ^
>> mm/z3fold.c:355:3: error: call to undeclared function 'unlock_page'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   unlock_page(page);
                   ^
   mm/z3fold.c:1052:3: error: call to undeclared function 'lock_page'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   lock_page(page);
                   ^
   mm/z3fold.c:1054:3: error: call to undeclared function 'unlock_page'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   unlock_page(page);
                   ^
>> mm/z3fold.c:1056:12: error: call to undeclared function 'trylock_page'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   WARN_ON(!trylock_page(page));
                            ^
   mm/z3fold.c:1056:12: note: did you mean 'try_get_page'?
   include/linux/mm.h:1527:33: note: 'try_get_page' declared here
   static inline __must_check bool try_get_page(struct page *page)
                                   ^
   mm/z3fold.c:1058:3: error: call to undeclared function 'unlock_page'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   unlock_page(page);
                   ^
   6 errors generated.


vim +/lock_page +353 mm/z3fold.c

9a001fc19cccde Vitaly Wool 2016-05-20  348  
9a001fc19cccde Vitaly Wool 2016-05-20  349  /* Resets the struct page fields and frees the page */
1f862989b04ade Vitaly Wool 2019-05-13  350  static void free_z3fold_page(struct page *page, bool headless)
9a001fc19cccde Vitaly Wool 2016-05-20  351  {
1f862989b04ade Vitaly Wool 2019-05-13  352  	if (!headless) {
1f862989b04ade Vitaly Wool 2019-05-13 @353  		lock_page(page);
1f862989b04ade Vitaly Wool 2019-05-13  354  		__ClearPageMovable(page);
1f862989b04ade Vitaly Wool 2019-05-13 @355  		unlock_page(page);
1f862989b04ade Vitaly Wool 2019-05-13  356  	}
5a27aa8220290b Vitaly Wool 2017-02-24  357  	__free_page(page);
5a27aa8220290b Vitaly Wool 2017-02-24  358  }
5a27aa8220290b Vitaly Wool 2017-02-24  359  

:::::: The code at line 353 was first introduced by commit
:::::: 1f862989b04ade61d3aab49184c50e9957f84c7d mm/z3fold.c: support page migration

:::::: TO: Vitaly Wool <vitalywool@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
