Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A121DE8AF;
	Wed, 11 Dec 2024 17:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733937539; cv=none; b=nUqhnF5haktlY/U8OlwpphqLLZUw6TfZrgkNCAVt0Ya+jFMbxYYkUVxMxwRcOxKKGYbX9cTjDsl2Gy4v4X9teqr2O0TWWsCNnhHP89WPSPwy87LB1JyiPpuZiKMYmfGO99xWswoTThRMpP4ETX8XjE5UuALqILGiexzds62mH4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733937539; c=relaxed/simple;
	bh=6m/FEkErYkTgndplG/4B7TlZAoKTdQWT3a7pXkXaAH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lIkg369n3A4hP4KvwUM4YDaNnV40Cd8e4nFJEaCTnFa58CiyyQrgGmD1gWWI/V3bScHzP5cxGYI0qRaIlxjNwHs9ucrxz7nOykakkQoc05hoey+lFheQ8NIjqwAnBT/e+x2njb735AmyqyhwNQXAlVomy7cXzFTxuiwlgBL/ZCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1vPj8mF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1vPj8mF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733937538; x=1765473538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6m/FEkErYkTgndplG/4B7TlZAoKTdQWT3a7pXkXaAH8=;
  b=k1vPj8mFAqyeaAmmJYnD67FhaJ/MWbQlBBWpaCIjY1tw2awy4uTcCCB2
   hJE2+oPZsggwv4eq0L9WADkfhrYl97rSS9nPXlUPTdeEbEQuVl6mMk6Oc
   pwGaphnqgBNkkGgjTRWmzkyyf8LrOSAqxUI4toGL9LtOxWaM3PfaoT9Yb
   1K2KWCJqVGjm+Yt1XAfx5EV6h85k010ZUdO/BN+/KUSsSizifmCcw5uA/
   ztV3j7SegfLxzyNouAcJSMMoArltZxgvh03FaXaPZzdBHo2fmI9zAK/h+
   IX9w49+xj7EFU4/6JlSGrwK1ShtuGIfTo16FY+VnfD3F2a5t3rvXrMv1w
   g==;
X-CSE-ConnectionGUID: LH6VokMWTCahJ2PhE1067Q==
X-CSE-MsgGUID: ErrVYxwkSJiuz6T48sTRdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34203253"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="34203253"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 09:18:54 -0800
X-CSE-ConnectionGUID: eHlOtguiRi6zInkIDQmw4w==
X-CSE-MsgGUID: BlEk8d8eRb+nW6DpBKlySw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126824513"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Dec 2024 09:18:52 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLQML-0006vd-0y;
	Wed, 11 Dec 2024 17:18:49 +0000
Date: Thu, 12 Dec 2024 01:18:31 +0800
From: kernel test robot <lkp@intel.com>
To: Junjie Fu <fujunjie1@qq.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, willy@infradead.org, sj@kernel.org,
	Junjie Fu <fujunjie1@qq.com>
Subject: Re: [PATCH RESEND] mempolicy.h: Remove unnecessary header file
 inclusions with no test failure
Message-ID: <202412120124.VtMN4Kk6-lkp@intel.com>
References: <tencent_C12D22B8989E0314FDE7073D6446186E3C09@qq.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_C12D22B8989E0314FDE7073D6446186E3C09@qq.com>

Hi Junjie,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on brauner-vfs/vfs.all linus/master v6.13-rc2 next-20241211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Junjie-Fu/mempolicy-h-Remove-unnecessary-header-file-inclusions-with-no-test-failure/20241211-120550
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/tencent_C12D22B8989E0314FDE7073D6446186E3C09%40qq.com
patch subject: [PATCH RESEND] mempolicy.h: Remove unnecessary header file inclusions with no test failure
config: i386-buildonly-randconfig-003-20241211 (https://download.01.org/0day-ci/archive/20241212/202412120124.VtMN4Kk6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120124.VtMN4Kk6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120124.VtMN4Kk6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/z3fold.c:30:
   In file included from include/linux/mm.h:2287:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/z3fold.c:353:3: error: call to undeclared function 'lock_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     353 |                 lock_page(page);
         |                 ^
   mm/z3fold.c:353:3: note: did you mean 'copy_page'?
   arch/x86/include/asm/page_32.h:25:20: note: 'copy_page' declared here
      25 | static inline void copy_page(void *to, void *from)
         |                    ^
>> mm/z3fold.c:355:3: error: call to undeclared function 'unlock_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     355 |                 unlock_page(page);
         |                 ^
   mm/z3fold.c:1052:3: error: call to undeclared function 'lock_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1052 |                 lock_page(page);
         |                 ^
   mm/z3fold.c:1054:3: error: call to undeclared function 'unlock_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1054 |                 unlock_page(page);
         |                 ^
>> mm/z3fold.c:1056:12: error: call to undeclared function 'trylock_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1056 |                 WARN_ON(!trylock_page(page));
         |                          ^
   mm/z3fold.c:1056:12: note: did you mean 'try_get_page'?
   include/linux/mm.h:1527:33: note: 'try_get_page' declared here
    1527 | static inline __must_check bool try_get_page(struct page *page)
         |                                 ^
   mm/z3fold.c:1058:3: error: call to undeclared function 'unlock_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1058 |                 unlock_page(page);
         |                 ^
   1 warning and 6 errors generated.


vim +/lock_page +353 mm/z3fold.c

9a001fc19cccdeb Vitaly Wool 2016-05-20  348  
9a001fc19cccdeb Vitaly Wool 2016-05-20  349  /* Resets the struct page fields and frees the page */
1f862989b04ade6 Vitaly Wool 2019-05-13  350  static void free_z3fold_page(struct page *page, bool headless)
9a001fc19cccdeb Vitaly Wool 2016-05-20  351  {
1f862989b04ade6 Vitaly Wool 2019-05-13  352  	if (!headless) {
1f862989b04ade6 Vitaly Wool 2019-05-13 @353  		lock_page(page);
1f862989b04ade6 Vitaly Wool 2019-05-13  354  		__ClearPageMovable(page);
1f862989b04ade6 Vitaly Wool 2019-05-13 @355  		unlock_page(page);
1f862989b04ade6 Vitaly Wool 2019-05-13  356  	}
5a27aa8220290b6 Vitaly Wool 2017-02-24  357  	__free_page(page);
5a27aa8220290b6 Vitaly Wool 2017-02-24  358  }
5a27aa8220290b6 Vitaly Wool 2017-02-24  359  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
