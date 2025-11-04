Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438B6D27E;
	Tue,  4 Nov 2025 20:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762289490; cv=none; b=QuvsNyfTdSmN+601JsFCmdt+Z4uCOXCkOkkcfJXVzX+01yslt9ouMQAiNWY5R6WJQFftWWSqo0jj33tlhVqgoCwDsp3iShKrmOp4dJVpKVZa+/jjyEuge4tnnmeq2GEjkbqV3Hb40EcGrS+eE9oMbYiqhUPwlevSUM3iN7u4WLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762289490; c=relaxed/simple;
	bh=8bLTs6wDKk3qr42kNSErNhGJeMR7rvigmxb0+LIL/JY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gacclrkvd3fjoWfzo02M9DfB+4LAQ5UN7nswNrf7ZYIqIeAmFn50cpGQ76JXFfdr1b21Gaq6IxXlcEVJw2J662lp+WdefpIiniIffKUBdVPRdVjQQmGKuDRGZzGRQRVPz4lRmo83YwOjtStSPDHLFCNBDViu/mdtZkwvpxlsAR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVLoEa+t; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVLoEa+t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762289487; x=1793825487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8bLTs6wDKk3qr42kNSErNhGJeMR7rvigmxb0+LIL/JY=;
  b=CVLoEa+tzwZ950GEdTRyWd63NxAOPBAKHSqxnDDyHwJdttVCh63U2v8/
   u5Q/sOM7cpFTQ5lbrP4G9CXJ6mzrNDtgPzgJTqd+KtqsTkXXZssV2BENu
   xFhEoOGnrKloo2U3ftzNqJfC43XIlaY4Yztj5nHMzSjQQn1CbgBIJEYrj
   TeSpSruKP8sgxTrQRaEybhCNzOAGEvdKi+IcPUVJENOlzZKnIOmVfMEIe
   WUftvxE36E1ompbmJ2VnknvRlbZO3DdxlEgwLPkQPeB4G4cH6UPqcVgYS
   40T3CILqAQSqk+xzxbhz9mVZUPhyBhfrwvGhmMUaFWX75jTFD/xZ3JU83
   A==;
X-CSE-ConnectionGUID: i44n1gadRFG7Z4oTnghPWQ==
X-CSE-MsgGUID: Njza+U7NTgGmDZdvR9rMlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64280613"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="64280613"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 12:51:27 -0800
X-CSE-ConnectionGUID: hIRvz3qIRA+4XDnChnAv5A==
X-CSE-MsgGUID: JxIe0AqBR3aWGqMUEoJM1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="187706971"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 04 Nov 2025 12:51:26 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGNzK-000Roe-1K;
	Tue, 04 Nov 2025 20:50:50 +0000
Date: Wed, 5 Nov 2025 04:50:00 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slab-fms-cleanup 2/4] mm/slab.h:107:15: error: static
 assertion failed due to requirement 'sizeof(struct slab) <= sizeof(struct
 page)': sizeof(struct slab) <= sizeof(struct page)
Message-ID: <202511050409.LJTnpEfF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slab-fms-cleanup
head:   e401df7388463ed094dca0ba9c7bac58b1ee4cc7
commit: 382037dcfead97fb0a66368b8237220a7f4a661b [2/4] slab: move counters union to freelist_aba_t
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251105/202511050409.LJTnpEfF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050409.LJTnpEfF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511050409.LJTnpEfF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mempool.c:21:
>> mm/slab.h:107:15: error: static assertion failed due to requirement 'sizeof(struct slab) <= sizeof(struct page)': sizeof(struct slab) <= sizeof(struct page)
     107 | static_assert(sizeof(struct slab) <= sizeof(struct page));
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   mm/slab.h:107:35: note: expression evaluates to '64 <= 56'
     107 | static_assert(sizeof(struct slab) <= sizeof(struct page));
         |               ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.


vim +107 mm/slab.h

d122019bf061cc Matthew Wilcox (Oracle  2021-10-04   95) 
d122019bf061cc Matthew Wilcox (Oracle  2021-10-04   96) #define SLAB_MATCH(pg, sl)						\
d122019bf061cc Matthew Wilcox (Oracle  2021-10-04   97) 	static_assert(offsetof(struct page, pg) == offsetof(struct slab, sl))
30908096dd8d79 Matthew Wilcox (Oracle  2025-06-11   98) SLAB_MATCH(flags, flags);
130d4df57390a2 Vlastimil Babka         2022-08-26   99  SLAB_MATCH(compound_head, slab_cache);	/* Ensure bit 0 is clear */
d122019bf061cc Matthew Wilcox (Oracle  2021-10-04  100) SLAB_MATCH(_refcount, __page_refcount);
a52c6330ff2fe1 Alex Shi (Tencent       2024-07-12  101) #ifdef CONFIG_MEMCG
21c690a349baab Suren Baghdasaryan      2024-03-21  102  SLAB_MATCH(memcg_data, obj_exts);
a52c6330ff2fe1 Alex Shi (Tencent       2024-07-12  103) #elif defined(CONFIG_SLAB_OBJ_EXT)
a52c6330ff2fe1 Alex Shi (Tencent       2024-07-12  104) SLAB_MATCH(_unused_slab_obj_exts, obj_exts);
d122019bf061cc Matthew Wilcox (Oracle  2021-10-04  105) #endif
d122019bf061cc Matthew Wilcox (Oracle  2021-10-04  106) #undef SLAB_MATCH
d122019bf061cc Matthew Wilcox (Oracle  2021-10-04 @107) static_assert(sizeof(struct slab) <= sizeof(struct page));
a9e0b9f27266d4 Vlastimil Babka         2023-10-02  108  #if defined(system_has_freelist_aba)
6801be4f2653e5 Peter Zijlstra          2023-05-31  109  static_assert(IS_ALIGNED(offsetof(struct slab, freelist), sizeof(freelist_aba_t)));
130d4df57390a2 Vlastimil Babka         2022-08-26  110  #endif
d122019bf061cc Matthew Wilcox (Oracle  2021-10-04  111) 

:::::: The code at line 107 was first introduced by commit
:::::: d122019bf061cccc4583eb9ad40bf58c2fe517be mm: Split slab into its own type

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
