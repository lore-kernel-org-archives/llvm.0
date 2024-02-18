Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AAEF9CF;
	Sun, 18 Feb 2024 08:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708244121; cv=none; b=MgKBPnaBvOWTzuZtnOR9JGiHOXIS/wb2JLdllkj8MhkqfzxRY1s5Jv9iqGOGIKpS214yIO+iGdBq0t5/pTOvdG/oE+KY6RRcomARM3Y1ncJb3koeMR5rgPum63QcaupU2ey/xEXERykhDS+n8eW2t002wtianoUGF5GXxpGlPMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708244121; c=relaxed/simple;
	bh=WYzmBNpH6cGczEIpfsWVPnXKFuEzrstvirYrXLCIkqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gCvuYXUFVElJgxR2fNvniBfJaRY3hyC3hTte7JgEGkMJmNEBUk7kcPjICoM1JYRNaEGN/FWlN3DSuzxW62IeiUiiOaAhNJuTjloqdMt62GkfjwXnlDhUEavmh1WM+px5tzqSuj2NiALPlmsLqbGx1VGstEp9Dm54uNvrV0ZiMP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfW+Kjge; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfW+Kjge"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708244120; x=1739780120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WYzmBNpH6cGczEIpfsWVPnXKFuEzrstvirYrXLCIkqo=;
  b=jfW+KjgeuejzzGo8TrqV9T3I/PQgc485+MiSpP6Gi8qYcjGUScTKO4dM
   jgssWnNFhnGhrMncszJFlgR1RoKFesUQEnBJsw2BZk4iw/uYyq3MSi1Vv
   vx/rPveXvIG53pkX4KZ3rpbxqufxJVyFYEZpS8Aj7wTqZ5GCrU2p2LoPh
   eJ6DkH8ITPDueypfxXVQeTZIE1ZXAEiMe6kO6MJzGin2F4WaFre3a4cvx
   IOAItFT8jDWgAaOeAJkRnS2J2YLY/vLqseFBJVs/CJd3GmlBwv72L1Pky
   CcYexXtJCPfPWq/nwxTDHAWXtvsPQ1oFbRmfX7Dq0tCuzUa2t6vTRadJD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2197458"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="2197458"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 00:15:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="8882060"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 18 Feb 2024 00:15:18 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbcKR-0002t8-2W;
	Sun, 18 Feb 2024 08:15:15 +0000
Date: Sun, 18 Feb 2024 16:14:38 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Suren Baghdasaryan <surenb@google.com>
Subject: [surenbaghdasaryan:memalloc_prof_v4 49/49]
 include/linux/mm.h:3116:6: error: call to undeclared function
 'mem_alloc_profiling_enabled'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202402181620.v9zvCTpl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/surenbaghdasaryan/linux.git memalloc_prof_v4
head:   a9e8134c559030b55a98c4be4b3efaf0604c4e57
commit: a9e8134c559030b55a98c4be4b3efaf0604c4e57 [49/49] fixup: move mem_alloc_profiling_enabled() to be checked earlier
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240218/202402181620.v9zvCTpl-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402181620.v9zvCTpl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402181620.v9zvCTpl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
>> include/linux/mm.h:3116:6: error: call to undeclared function 'mem_alloc_profiling_enabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3116 |         if (mem_alloc_profiling_enabled()) {
         |             ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:116: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1199: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/mem_alloc_profiling_enabled +3116 include/linux/mm.h

  3109	
  3110	extern void reserve_bootmem_region(phys_addr_t start,
  3111					   phys_addr_t end, int nid);
  3112	
  3113	/* Free the reserved page into the buddy system, so it gets managed. */
  3114	static inline void free_reserved_page(struct page *page)
  3115	{
> 3116		if (mem_alloc_profiling_enabled()) {
  3117			union codetag_ref *ref = get_page_tag_ref(page);
  3118	
  3119			if (ref) {
  3120				set_codetag_empty(ref);
  3121				put_page_tag_ref(ref);
  3122			}
  3123		}
  3124		ClearPageReserved(page);
  3125		init_page_count(page);
  3126		__free_page(page);
  3127		adjust_managed_page_count(page, 1);
  3128	}
  3129	#define free_highmem_page(page) free_reserved_page(page)
  3130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
