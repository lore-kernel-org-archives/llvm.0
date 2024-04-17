Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4795D8F6;
	Wed, 17 Apr 2024 08:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342247; cv=none; b=ngzl+4IscZifTD9HCIcSe0zO5KBewqTkPTlm/bMDY1xCxQ4M6ddXvJC6/tCLVEmhbWGwUuTNGm1HCA+xk0qC7l5YFeBpZyGhWTk4ljlhp5TSB7tnRxNmkM3S0ITQ3/buztXnajD2tRZGPxmxpYc7OE+OlLhHTdlW+b48n0cYkcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342247; c=relaxed/simple;
	bh=+D19jfVva7lCBGw1V7Lq4pMmEjyAWlX/ECge230lLMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OllptWH5p1eM7Q9PmrtprjP6CXZgsbQJ3ji1g+HSX31a/UHC1EO3Wd/sdeKpRSOt83X+x15+6wZI8/V4J4zt1ZHFL90AAkT02QKGSa+12+FGqyvJgkrtpHcIW1KNOx4Fm2uZZuKO8KGQpU/gBRNs7yW/z7qimhYA6lB0cSw4wVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EakDOMID; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EakDOMID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713342245; x=1744878245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+D19jfVva7lCBGw1V7Lq4pMmEjyAWlX/ECge230lLMo=;
  b=EakDOMIDYoSvo/TV36c+Vo67AeF63LaCR/nPcRJJVnQf6gwwhXn9esTL
   WQofi+HtIp58CjeCBr850lyuc8JzB5PEMSKMt0Inknfu9EsgnC/y1pkmH
   FSURkINL2a0B3lD1n6bIkOaKtgPyVTunJTN4AF49OscVRdTrekFd0U7+c
   P3t7uBV1c+D/qkjpLRxVSjWBFrehLQcxjMbMLN5f5KGMykcLd+bOtUh9B
   xqDMkrJTUHrWNSi8OAraO0DaQLQ3HklSgIFzBNS48vA08mijv04WTFnsz
   c4hsBc5vi3i8mHEcTZUj2A+KcJotZb3UWf1hnNbkkn3x1Lxh4VudeatH5
   A==;
X-CSE-ConnectionGUID: rFl5p2LhRjiuXNSLhyiT9A==
X-CSE-MsgGUID: LWQLbQ9PS1Ots55doiOiQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8648450"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="8648450"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 01:24:04 -0700
X-CSE-ConnectionGUID: YRM1Pbm1RB28W1sMPhdb6A==
X-CSE-MsgGUID: hrU076SUQsqPZF4K9sl45w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="22622126"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Apr 2024 01:23:57 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx0aA-0006IQ-2k;
	Wed, 17 Apr 2024 08:23:54 +0000
Date: Wed, 17 Apr 2024 16:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: Maxwell Bland <mbland@motorola.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Maxwell Bland <mbland@motorola.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Sam Creasey <sammy@sammy.net>, Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 3/5] mm: add vaddr param to pmd_populate_kernel
Message-ID: <202404171648.VEQfHAIY-lkp@intel.com>
References: <20240416122254.868007168-4-mbland@motorola.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416122254.868007168-4-mbland@motorola.com>

Hi Maxwell,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0bbac3facb5d6cc0171c45c9873a2dc96bea9680]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxwell-Bland/mm-allow-arch-refinement-skip-for-vmap-alloc/20240417-032149
base:   0bbac3facb5d6cc0171c45c9873a2dc96bea9680
patch link:    https://lore.kernel.org/r/20240416122254.868007168-4-mbland%40motorola.com
patch subject: [PATCH 3/5] mm: add vaddr param to pmd_populate_kernel
config: powerpc64-randconfig-003-20240417 (https://download.01.org/0day-ci/archive/20240417/202404171648.VEQfHAIY-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404171648.VEQfHAIY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404171648.VEQfHAIY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/mm/kasan/init_book3s_64.c:19:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/mm/kasan/init_book3s_64.c:75:9: error: incompatible pointer to integer conversion passing 'void *' to parameter of type 'unsigned long' [-Wint-conversion]
      75 |                                     vaddr_start + i * PMD_SIZE);
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/book3s/64/pgalloc.h:159:38: note: passing argument to parameter 'vaddr' here
     159 |                                        pte_t *pte, unsigned long vaddr)
         |                                                                  ^
   5 warnings and 1 error generated.


vim +75 arch/powerpc/mm/kasan/init_book3s_64.c

    39	
    40	void __init kasan_init(void)
    41	{
    42		/*
    43		 * We want to do the following things:
    44		 *  1) Map real memory into the shadow for all physical memblocks
    45		 *     This takes us from c000... to c008...
    46		 *  2) Leave a hole over the shadow of vmalloc space. KASAN_VMALLOC
    47		 *     will manage this for us.
    48		 *     This takes us from c008... to c00a...
    49		 *  3) Map the 'early shadow'/zero page over iomap and vmemmap space.
    50		 *     This takes us up to where we start at c00e...
    51		 */
    52	
    53		void *k_start = kasan_mem_to_shadow((void *)RADIX_VMALLOC_END);
    54		void *k_end = kasan_mem_to_shadow((void *)RADIX_VMEMMAP_END);
    55		phys_addr_t start, end;
    56		u64 i;
    57		pte_t zero_pte = pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL);
    58		void *vaddr_start = __va(start);
    59	
    60		if (!early_radix_enabled()) {
    61			pr_warn("KASAN not enabled as it requires radix!");
    62			return;
    63		}
    64	
    65		for_each_mem_range(i, &start, &end)
    66			kasan_init_phys_region((void *)start, (void *)end);
    67	
    68		for (i = 0; i < PTRS_PER_PTE; i++)
    69			__set_pte_at(&init_mm, (unsigned long)kasan_early_shadow_page,
    70				     &kasan_early_shadow_pte[i], zero_pte, 0);
    71	
    72		for (i = 0; i < PTRS_PER_PMD; i++) {
    73			pmd_populate_kernel(&init_mm, &kasan_early_shadow_pmd[i],
    74					    kasan_early_shadow_pte,
  > 75					    vaddr_start + i * PMD_SIZE);
    76		}
    77	
    78		for (i = 0; i < PTRS_PER_PUD; i++)
    79			pud_populate(&init_mm, &kasan_early_shadow_pud[i],
    80				     kasan_early_shadow_pmd);
    81	
    82		/* map the early shadow over the iomap and vmemmap space */
    83		kasan_populate_early_shadow(k_start, k_end);
    84	
    85		/* mark early shadow region as RO and wipe it */
    86		zero_pte = pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL_RO);
    87		for (i = 0; i < PTRS_PER_PTE; i++)
    88			__set_pte_at(&init_mm, (unsigned long)kasan_early_shadow_page,
    89				     &kasan_early_shadow_pte[i], zero_pte, 0);
    90	
    91		/*
    92		 * clear_page relies on some cache info that hasn't been set up yet.
    93		 * It ends up looping ~forever and blows up other data.
    94		 * Use memset instead.
    95		 */
    96		memset(kasan_early_shadow_page, 0, PAGE_SIZE);
    97	
    98		static_branch_inc(&powerpc_kasan_enabled_key);
    99	
   100		/* Enable error messages */
   101		init_task.kasan_depth = 0;
   102		pr_info("KASAN init done\n");
   103	}
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
