Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AE72C08BC;
	Fri, 12 Jun 2026 02:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781229913; cv=none; b=WU3K3mIG2jRqeNiU+MsQiex349AD32hQNQTM1MQPnfL9L7KMWHT1v4ZZNiSjV/1HiFG9UDhMZHM4Y3RtncHiMjIQbVm3vLjKqgqc/ZQZsDqtaYXAH+59RCavWEiowX1G9XgbaMHZQePk2FhU2XRjKRUlYe0APOUkeZRbU1tCPJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781229913; c=relaxed/simple;
	bh=7YwVkXGaGgAzf1Vw87qs1z5OVapZmA8S/0mZwJNLgu4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VhLN6vIk7aDiX4Ck9y1Prspku8OK4QFSrNakLqmbTb1vBdI5Ag3Vrts2GXC00MhhclDnnAWTYysTH/lmsTFK4RY851Legafq80o4igNQbT1s3N3lzjyzICIZiiZn9JKOpyuvqG32tngiRkHYF02cccUZlxPNuUOHkkHzGPByI/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJgQRbEP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJgQRbEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781229912; x=1812765912;
  h=date:from:to:cc:subject:message-id;
  bh=7YwVkXGaGgAzf1Vw87qs1z5OVapZmA8S/0mZwJNLgu4=;
  b=eJgQRbEPS/tay/V1tY8YAPo7SFwD3cdWKL0uWWMP2CsR6plntyZ28phn
   xmCwluO+wYtxFzNgYWjDRZTyB/WKqsCbd40uKf9huodtvsWeOJbUQ9ljl
   FLU3ia4fbPsW5Nf3h9FROlt9T8K1skUTw9Z5PKFs0RFLAOtiy8zlNbo7u
   u5j8KAktvH/Ux6s+OLP7au7DgeUAi7Mxd2ANz5jtil4yCd3SJWSRFj+Hh
   Vu0PlNwnO1T0SINsGJ5GwMHzNqEC7iZd5zlK0W9WOHbiLS+L2rPTFGSS0
   haruLrJibwnRbFYCzbwigyNpSmpL+0M6ULy9Is8TrcGNCuVoCFD0gCM+7
   g==;
X-CSE-ConnectionGUID: 3zPW3yaMToebiaehE/s0lQ==
X-CSE-MsgGUID: Ay6ZhMzXTCmY2H9FvX0XAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93449744"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="93449744"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 19:05:11 -0700
X-CSE-ConnectionGUID: zKHPNEleTDuJh5x80MAodg==
X-CSE-MsgGUID: LzVUCkEHT3miIklLV8mQ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="248572125"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jun 2026 19:05:10 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXrGd-00000000O9Q-2XJz;
	Fri, 12 Jun 2026 02:05:07 +0000
Date: Fri, 12 Jun 2026 10:04:20 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:b4/clear_not_present_full_ptes 3/4]
 include/linux/pgtable.h:974:17: error: parameter 'addr' set but not used
Message-ID: <202606120923.3tqIxomB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux b4/clear_not_present_full_ptes
head:   81719d3f861fee6a18ea50f011a411e7fa330df1
commit: cc8cb0687c651143e5bba6b80b26f188b5cd641d [3/4] mm: drop pte_clear_not_present_full()
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260612/202606120923.3tqIxomB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c8ad049db78ae52052722b6f42b54cd2a666072b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120923.3tqIxomB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120923.3tqIxomB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_bitops.c:12:
   In file included from include/linux/slab.h:264:
   In file included from include/linux/kasan.h:38:
>> include/linux/pgtable.h:974:17: error: parameter 'addr' set but not used [-Werror,-Wunused-but-set-parameter]
     974 |                 unsigned long addr, pte_t *ptep, unsigned int nr, int full)
         |                               ^
   1 error generated.


vim +/addr +974 include/linux/pgtable.h

7df676974359f9 include/asm-generic/pgtable.h Bibo Mao                2020-05-27  956  
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  957  #ifndef clear_not_present_full_ptes
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  958  /**
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  959   * clear_not_present_full_ptes - Clear multiple not present PTEs which are
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  960   *				 consecutive in the pgtable.
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  961   * @mm: Address space the ptes represent.
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  962   * @addr: Address of the first pte.
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  963   * @ptep: Page table pointer for the first entry.
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  964   * @nr: Number of entries to clear.
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  965   * @full: Whether we are clearing a full mm.
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  966   *
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  967   * May be overridden by the architecture; otherwise, implemented as a simple
cc8cb0687c6511 include/linux/pgtable.h       David Hildenbrand (Arm  2026-06-10  968)  * loop over pte_clear().
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  969   *
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  970   * Context: The caller holds the page table lock.  The PTEs are all not present.
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  971   * The PTEs are all in the same PMD.
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  972   */
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  973  static inline void clear_not_present_full_ptes(struct mm_struct *mm,
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08 @974  		unsigned long addr, pte_t *ptep, unsigned int nr, int full)
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  975  {
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  976  	for (;;) {
cc8cb0687c6511 include/linux/pgtable.h       David Hildenbrand (Arm  2026-06-10  977) 		pte_clear(mm, addr, ptep);
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  978  		if (--nr == 0)
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  979  			break;
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  980  		ptep++;
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  981  		addr += PAGE_SIZE;
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  982  	}
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  983  }
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  984  #endif
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  985  

:::::: The code at line 974 was first introduced by commit
:::::: a62fb92ac12ed39df4930dca599a3b427552882a mm: swap: free_swap_and_cache_nr() as batched free_swap_and_cache()

:::::: TO: Ryan Roberts <ryan.roberts@arm.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
