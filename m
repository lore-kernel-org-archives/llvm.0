Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C9319EED7;
	Wed, 26 Feb 2025 09:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740563277; cv=none; b=csdMBwBu0+VG8dGSNgG7UtkK5eKSa95m7qkb82wRuM7TcEXjb6w5Kr2tNWD0FP7yWJSYr2rSf6cFdasBHKpo0JbSV2lFYzfexkrG4haAVU/2cI+HUrSW2446A87zlwc+oWo5g9Qhiacz6Ln0BgVqKeXn/bnvPyrXvNspGE5/mK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740563277; c=relaxed/simple;
	bh=6puDstHpwfkJlpKn7JlWAejjNwhdFTiriKarCCat0OM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iq0UFe0Uti2FTc8Dd9lN6pgY1Sl+26LtKXIGUzMpJmEzljngsu+jVWQN9IAoCF3iFB/au2b3MgICrvovIFl/AyEhI9WwwgDYn2iMpeiuDQAvFXf4HH1RngP1GeOK9ruweN44bU/F1/ZFfW1cwRDAgI8XGLvhnt+dXYhYMtdARzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTLH6I+j; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTLH6I+j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740563276; x=1772099276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6puDstHpwfkJlpKn7JlWAejjNwhdFTiriKarCCat0OM=;
  b=BTLH6I+j1SWWoqf8JaPDUKYyi8fNBFoxnqTBzPEK76T34SyRz97uWm77
   CNcFBus+fPIzvUW8m7A4G8KWzJG9HinzGOSm73Ey7Ehx+qsBUvPMCbeEI
   l3PmXkYykiYokxCJZ4UFaeaGdcriHrLEGvQzAhhAQkmU8jHxKkPfWqVL2
   8IsZYxKsLIEJfoA601bpW3fVTQ+odfO4yAmaiZPAb3rMHCWWkzndVRWT0
   SY+uWC4zidghJuivxCS/YNNPdbqtHDfYn3M3SQ6hK088qS26fxLaiF+/L
   UW7HsFz2lCbyxl7C0PraywO2G/O4/bohbvzz+YL/o4m+9+Ee2EtJEV4BU
   Q==;
X-CSE-ConnectionGUID: 2+togFUoTAmOupwBhzd3Zw==
X-CSE-MsgGUID: M8fSftWQRPiyHnOtusJ+nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41316460"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41316460"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 01:47:55 -0800
X-CSE-ConnectionGUID: HDXTdmQmT/yZBGzrEPF6YA==
X-CSE-MsgGUID: KIrQSNBUQZqVOR7L/8LASg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="139881667"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 26 Feb 2025 01:47:53 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnE18-000BUH-3B;
	Wed, 26 Feb 2025 09:47:50 +0000
Date: Wed, 26 Feb 2025 17:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5933/6583] include/linux/page_ext.h:131:20:
 error: call to undeclared function 'page_to_section'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202502261733.Ma0eUGKJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
commit: a2d6e9c1a867bb9f13943cb8483e2ab85b630bcd [5933/6583] mm: page_ext: add an iteration API for page extensions
config: i386-buildonly-randconfig-004-20250226 (https://download.01.org/0day-ci/archive/20250226/202502261733.Ma0eUGKJ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261733.Ma0eUGKJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261733.Ma0eUGKJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:8:
   In file included from include/linux/pgalloc_tag.h:12:
>> include/linux/page_ext.h:131:20: error: call to undeclared function 'page_to_section'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     131 |         iter->start_pfn = page_to_pfn(page);
         |                           ^
   include/asm-generic/memory_model.h:64:21: note: expanded from macro 'page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:47:14: note: expanded from macro '__page_to_pfn'
      47 |         int __sec = page_to_section(__pg);                      \
         |                     ^
   include/linux/page_ext.h:131:20: note: did you mean '__nr_to_section'?
   include/asm-generic/memory_model.h:64:21: note: expanded from macro 'page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:47:14: note: expanded from macro '__page_to_pfn'
      47 |         int __sec = page_to_section(__pg);                      \
         |                     ^
   include/linux/mmzone.h:1907:35: note: '__nr_to_section' declared here
    1907 | static inline struct mem_section *__nr_to_section(unsigned long nr)
         |                                   ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
>> include/linux/mm.h:1965:29: error: static declaration of 'page_to_section' follows non-static declaration
    1965 | static inline unsigned long page_to_section(const struct page *page)
         |                             ^
   include/linux/page_ext.h:131:20: note: previous implicit declaration is here
     131 |         iter->start_pfn = page_to_pfn(page);
         |                           ^
   include/asm-generic/memory_model.h:64:21: note: expanded from macro 'page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:47:14: note: expanded from macro '__page_to_pfn'
      47 |         int __sec = page_to_section(__pg);                      \
         |                     ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2302:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning and 2 errors generated.
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=1287424088
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=1287424088
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1287424088
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1287424088
   make: Target 'prepare' not remade because of errors.


vim +/page_to_section +131 include/linux/page_ext.h

   118	
   119	/**
   120	 * page_ext_iter_begin() - Prepare for iterating through page extensions.
   121	 * @iter: page extension iterator.
   122	 * @page: The page we're interested in.
   123	 *
   124	 * Must be called with RCU read lock taken.
   125	 *
   126	 * Return: NULL if no page_ext exists for this page.
   127	 */
   128	static inline struct page_ext *page_ext_iter_begin(struct page_ext_iter *iter, struct page *page)
   129	{
   130		iter->index = 0;
 > 131		iter->start_pfn = page_to_pfn(page);
   132		iter->page_ext = lookup_page_ext(page);
   133	
   134		return iter->page_ext;
   135	}
   136	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
