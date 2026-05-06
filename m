Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDAA35DA46;
	Wed,  6 May 2026 08:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778055920; cv=none; b=VbfmxIckzngMIojtTK0QPo3TiYSqfVKFC9HOVCIIJyp8ugu+3KF1lVZhWEsdrFpUpxuPPmj+FI8epkpeE+f9Mo/hYFrfzazFRFWnL+gRYQG3eKPczbqsmAZ5PioNzfzHdKStzc0HnLiytob8I0FKEmDK/p+Kftur4a0mG+Yr7Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778055920; c=relaxed/simple;
	bh=iQpPSqQNuEqz4MryZbsYyRa7YLLJFwHsAzWLA5kt7dg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=egBdqR8TV6/fEWaRytRQfrRRaPg8RkPNQ3b2At56tyM5JuBjqlT5z7E0Q00CX6chgXoGR7bv3QocPdh5uqYT6yE4N0pLunVMCsEZ0tcxiyeZfgIBsUUSvREflt75E0kRTUs1N1zCssHAoAR6Al9+JfFz05YwvL2Ei633AnmYbH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kj9Awy2Y; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kj9Awy2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778055918; x=1809591918;
  h=date:from:to:cc:subject:message-id;
  bh=iQpPSqQNuEqz4MryZbsYyRa7YLLJFwHsAzWLA5kt7dg=;
  b=Kj9Awy2YttGL61Bw5aiRwdRTdgm9FmRHzZGWHLs55YRj7v0JW+MxKdnL
   4TuD4VG/KmcAh01nxLItkz/02UzAsTiGDCdxuang5vzm4MBgaWz3Rb/04
   WSD2JrItcEN8jFhJZsJLT9AaW5MWRr5HoqswM8SVOCn67BqbcQcf0xOTf
   e0vuW218aDwwcS/5GfYP8U2IrZpWs0JcazV5jbnivFB0k5sI/UOttd9yT
   kMfImzsJKxSpFYFVCqpt6YTAKYYsNairtWIL45X9PEG6Q2RhkN58Ztl2+
   L6XvxZBj5b7ELewjhP98708S+BVlpFOEeIIlKfHVVTB7zyoUpD99wwb/Q
   A==;
X-CSE-ConnectionGUID: uxpytq5LRc2lo+W/RCCf7A==
X-CSE-MsgGUID: sM41l7J7Tl2pTyHV4wLtzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="66509683"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="66509683"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:25:15 -0700
X-CSE-ConnectionGUID: B2J325RgShe88oJ8A3i11Q==
X-CSE-MsgGUID: 3WbpjVRXRLe02GjYVMTs3Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 May 2026 01:25:14 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKXZA-000000000or-0LMv;
	Wed, 06 May 2026 08:25:12 +0000
Date: Wed, 06 May 2026 16:24:42 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:b4/bootmem_info 10/19]
 arch/s390/mm/vmem.c:42:15: warning: unused variable 'nr_pages'
Message-ID: <202605061622.0MCmYK6p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux b4/bootmem_info
head:   9bd8b9ac2bf1b3e7ffee070da9c2f0607c507207
commit: ad0ab8ac08f34bb72542795d52e15d8b5d174973 [10/19] s390/mm: use free_reserved_pages() in vmem_free_pages()
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260506/202605061622.0MCmYK6p-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061622.0MCmYK6p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605061622.0MCmYK6p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/s390/mm/vmem.c:42:15: warning: unused variable 'nr_pages' [-Wunused-variable]
      42 |         unsigned int nr_pages = 1 << order;
         |                      ^~~~~~~~
   1 warning generated.


vim +/nr_pages +42 arch/s390/mm/vmem.c

67060d9c1f5d91 Heiko Carstens          2008-05-30  39  
1a65b73ae9abd6 Sumanth Korikkar        2024-01-08  40  static void vmem_free_pages(unsigned long addr, int order, struct vmem_altmap *altmap)
9ec8fa8dc331be David Hildenbrand       2020-07-22  41  {
d5e88d32de4e4c Sumanth Korikkar        2025-10-10 @42  	unsigned int nr_pages = 1 << order;
d5e88d32de4e4c Sumanth Korikkar        2025-10-10  43  	struct page *page;
d5e88d32de4e4c Sumanth Korikkar        2025-10-10  44  
1a65b73ae9abd6 Sumanth Korikkar        2024-01-08  45  	if (altmap) {
1a65b73ae9abd6 Sumanth Korikkar        2024-01-08  46  		vmem_altmap_free(altmap, 1 << order);
1a65b73ae9abd6 Sumanth Korikkar        2024-01-08  47  		return;
1a65b73ae9abd6 Sumanth Korikkar        2024-01-08  48  	}
d5e88d32de4e4c Sumanth Korikkar        2025-10-10  49  	page = virt_to_page((void *)addr);
d5e88d32de4e4c Sumanth Korikkar        2025-10-10  50  	if (PageReserved(page)) {
d5e88d32de4e4c Sumanth Korikkar        2025-10-10  51  		/* allocated from memblock */
ad0ab8ac08f34b David Hildenbrand (Arm  2026-03-12  52) 		free_reserved_pages(page, order);
d5e88d32de4e4c Sumanth Korikkar        2025-10-10  53  	} else {
9ec8fa8dc331be David Hildenbrand       2020-07-22  54  		free_pages(addr, order);
9ec8fa8dc331be David Hildenbrand       2020-07-22  55  	}
d5e88d32de4e4c Sumanth Korikkar        2025-10-10  56  }
9ec8fa8dc331be David Hildenbrand       2020-07-22  57  

:::::: The code at line 42 was first introduced by commit
:::::: d5e88d32de4e4ce289d107939da970763669d631 s390/mm: Support removal of boot-allocated virtual memory map

:::::: TO: Sumanth Korikkar <sumanthk@linux.ibm.com>
:::::: CC: Heiko Carstens <hca@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
