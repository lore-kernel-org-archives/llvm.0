Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEC961FC5;
	Tue, 28 May 2024 06:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716878337; cv=none; b=hvkB70wnSJSf4iPgu4I+M4uK7lSTcOJlLge9fv53RpjJdNcoSw0FW4KFnCCQxukgsjb8a6FiGc4h3LKfsyv/iZpZixpFJRDcHPf0OtzeVfpN5c4IlL6R7SoFKDjyZXt1fh2NcNZBI7VznNsOnPVPGTaaF8ny4oRziP3/puSNN9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716878337; c=relaxed/simple;
	bh=i0m/4PpDho1mA8OcYNuMKBtlf11w3z4BhHZtnXeL6GI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QupKiyaB3Ex9Tz1UK6T6vYGseum4Io48Y7z/1gTHJ7wbNKsjUhcvGj8z7VLiQhOc9e/jKOetxvykd4+AHZw422FrR2VcUt8N2TxmDIEuEdv2syew0tT8+3lq/5/prQSmrikc2XZa/9CepFIpXeTntgn6uIR9Tf/5SxwZQgShgZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7WY+cNX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7WY+cNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716878335; x=1748414335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i0m/4PpDho1mA8OcYNuMKBtlf11w3z4BhHZtnXeL6GI=;
  b=F7WY+cNXiABA6K8slJp0IF9Xn7N8NVIu2Y2IHHlm9fa9si4tTeiPldLi
   majW0PN0sObKvGuK/5xGqLR6njy0LPZfLj7t0ibwxtHVXDH/qOXYo3P1I
   ibhHi6XOD8bf/65Sfiv+LTqzxxMxuqARVhpGfEE37utWMIl4NpM4wDzax
   hm5/wS0qtKMSjFAZciCShp07mP4oFX/YEkl/vYZjB76yr1+2ezYlV3yPk
   BPTFld4YWP/BxtP2+ps7PHOVtycvino08VOtWI///qS0KLrdYSE0r3lLs
   9FAeYZ0JSmlEHKKeW4K+mcGotcqVq7pjHNJnmlTwrRmMyEMcM05BOb9En
   A==;
X-CSE-ConnectionGUID: W0CyPEUOTnef9AV2Wihq1w==
X-CSE-MsgGUID: vQCP1PhSSruHVGJUXfV7TA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13029860"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="13029860"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 23:38:54 -0700
X-CSE-ConnectionGUID: gWNUkS2qQeC9WWgAY6imiQ==
X-CSE-MsgGUID: FMgF5OsqSaae4aFUsAAORQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="35045024"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 May 2024 23:38:53 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBqTy-000BoB-2X;
	Tue, 28 May 2024 06:38:50 +0000
Date: Tue, 28 May 2024 14:38:21 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v4 13/16] powerpc/e500: Use contiguous PMD instead of
 hugepd
Message-ID: <202405281459.7U76gKPa-lkp@intel.com>
References: <56cf925576285e2b97550f4f7317183d98d596c5.1716815901.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56cf925576285e2b97550f4f7317183d98d596c5.1716815901.git.christophe.leroy@csgroup.eu>

Hi Christophe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.10-rc1 next-20240523]
[cannot apply to powerpc/next powerpc/fixes arm64/for-next/core s390/features]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/powerpc-64e-Remove-unused-IBM-HTW-code-SQUASHED/20240527-213228
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/56cf925576285e2b97550f4f7317183d98d596c5.1716815901.git.christophe.leroy%40csgroup.eu
patch subject: [RFC PATCH v4 13/16] powerpc/e500: Use contiguous PMD instead of hugepd
config: powerpc-tqm8541_defconfig (https://download.01.org/0day-ci/archive/20240528/202405281459.7U76gKPa-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405281459.7U76gKPa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405281459.7U76gKPa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/powerpc/include/asm/uaccess.h:8:
   In file included from arch/powerpc/include/asm/kup.h:43:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/powerpc/include/asm/pgtable.h:20:
>> arch/powerpc/include/asm/nohash/pgtable.h:64:24: error: use of undeclared identifier '_PAGE_HSIZE_MSK'
                   sz = 1UL << (((old & _PAGE_HSIZE_MSK) >> _PAGE_HSIZE_SHIFT) + 20);
                                        ^
>> arch/powerpc/include/asm/nohash/pgtable.h:64:44: error: use of undeclared identifier '_PAGE_HSIZE_SHIFT'
                   sz = 1UL << (((old & _PAGE_HSIZE_MSK) >> _PAGE_HSIZE_SHIFT) + 20);
                                                            ^
   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   include/linux/mman.h:157:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   3 warnings and 2 errors generated.
   make[3]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/_PAGE_HSIZE_MSK +64 arch/powerpc/include/asm/nohash/pgtable.h

    33	
    34	/*
    35	 * PTE updates. This function is called whenever an existing
    36	 * valid PTE is updated. This does -not- include set_pte_at()
    37	 * which nowadays only sets a new PTE.
    38	 *
    39	 * Depending on the type of MMU, we may need to use atomic updates
    40	 * and the PTE may be either 32 or 64 bit wide. In the later case,
    41	 * when using atomic updates, only the low part of the PTE is
    42	 * accessed atomically.
    43	 *
    44	 * In addition, on 44x, we also maintain a global flag indicating
    45	 * that an executable user mapping was modified, which is needed
    46	 * to properly flush the virtually tagged instruction cache of
    47	 * those implementations.
    48	 */
    49	#ifndef pte_update
    50	static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, pte_t *p,
    51					     unsigned long clr, unsigned long set, int huge)
    52	{
    53		pte_basic_t old = pte_val(*p);
    54		pte_basic_t new = (old & ~(pte_basic_t)clr) | set;
    55		unsigned long sz;
    56		unsigned long pdsize;
    57		int i;
    58	
    59		if (new == old)
    60			return old;
    61	
    62	#ifdef CONFIG_PPC_E500
    63		if (huge)
  > 64			sz = 1UL << (((old & _PAGE_HSIZE_MSK) >> _PAGE_HSIZE_SHIFT) + 20);
    65		else
    66	#endif
    67			sz = PAGE_SIZE;
    68	
    69		if (!huge || sz < PMD_SIZE)
    70			pdsize = PAGE_SIZE;
    71		else if (sz < PUD_SIZE)
    72			pdsize = PMD_SIZE;
    73		else if (sz < P4D_SIZE)
    74			pdsize = PUD_SIZE;
    75		else if (sz < PGDIR_SIZE)
    76			pdsize = P4D_SIZE;
    77		else
    78			pdsize = PGDIR_SIZE;
    79	
    80		for (i = 0; i < sz / pdsize; i++, p++) {
    81			*p = __pte(new);
    82			if (new)
    83				new += (unsigned long long)(pdsize / PAGE_SIZE) << PTE_RPN_SHIFT;
    84		}
    85	
    86		if (IS_ENABLED(CONFIG_44x) && !is_kernel_addr(addr) && (old & _PAGE_EXEC))
    87			icache_44x_need_flush = 1;
    88	
    89		/* huge pages use the old page table lock */
    90		if (!huge)
    91			assert_pte_locked(mm, addr);
    92	
    93		return old;
    94	}
    95	#endif
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
