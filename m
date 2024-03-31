Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D42A1E520;
	Sun, 31 Mar 2024 19:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711914163; cv=none; b=Ku054GGQ9aiRgsd7HLmoR9AJtnJq9hscDAwS4yRVY8+zAkmx9XTwUYXHr+0I22Yc/xS0T415F9mJu7K1X2G/oF9l1KBMyBE6VS+OIfawnXxhJ09Ay6IHkSJfR/WRCtJ5KEmCzJsjviY3BWPeW5afTwGJnwsfzJyB5C2vtECko0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711914163; c=relaxed/simple;
	bh=OIBNlY7LjIdSH6waygfdC7frJgQfxvU/feQbHIJAt00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NOAyiUgWyNRqapLRHv98pla6ksvyPooMlqotv54pO6/IED8OW3A1PkMGFPc7SYQJRYxULW5XK2z4MC9d+qzEPVinOHvqFe9OSiuXGdnehSh+3pcrYEFk848lvR/NTaLpHYKX946gUY/YElMgUk9p9XsBkoccbweBRNJgadGvFSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVfa33Sh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVfa33Sh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711914161; x=1743450161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OIBNlY7LjIdSH6waygfdC7frJgQfxvU/feQbHIJAt00=;
  b=RVfa33Sh5RtBC3xlK43uVTowwlV/e09abhl+I/YYMSpwIbqFMUbwyRsO
   ga3u8sSpM4ru2LLr7DaWjqXMekbXa1PpWvzVY9ueiOZKQcAOFUSHt1iAU
   8EYI2stMbs5BwNMvX2+gIIgIVKV57Vp86andVqoqS4oCFObD3CBjecZwK
   8YbLCqOvuJjwAoJqmis7q9bB28DK4Teq4Ve7cMMiE6mg3UvUNd5ndElyt
   qf2boqE3l3ZGB4qQV78W9HwCr2x1mOy3QmygZCD/re9sLryCFo2iTQO1I
   tkW1zVhIuJQ+Xs3z87to72cQLxKjqjRVYJyNf+S24Tq/zVbkK46IARB1Y
   w==;
X-CSE-ConnectionGUID: mJbb8bD+QcyLJB9TKyOavA==
X-CSE-MsgGUID: wluhHOWRRuCvTaz+IWPezg==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="6933534"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="6933534"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 12:42:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="17337395"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Mar 2024 12:42:38 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rr14d-0001NO-2Z;
	Sun, 31 Mar 2024 19:42:35 +0000
Date: Mon, 1 Apr 2024 03:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [ardb:x86-efi-peheader-backport-for-v5.15 29/77]
 arch/x86/boot/compressed/pgtable_64.c:134:3: error: use of undeclared
 identifier '__pgtable_l5_enabled'
Message-ID: <202404010344.7OPWIxxT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-peheader-backport-for-v5.15
head:   51ff9e27b53cd980cd3f4a8ec02b1b34d99091db
commit: 32a1efd2dd3eb5863ff81e49a3f78526747ef2af [29/77] x86/decompressor: Assign paging related global variables earlier
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240401/202404010344.7OPWIxxT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240401/202404010344.7OPWIxxT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404010344.7OPWIxxT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/boot/compressed/pgtable_64.c:134:3: error: use of undeclared identifier '__pgtable_l5_enabled'
     134 |                 __pgtable_l5_enabled = 1;
         |                 ^
   1 error generated.


vim +/__pgtable_l5_enabled +134 arch/x86/boot/compressed/pgtable_64.c

   107	
   108	struct paging_config paging_prepare(void *rmode)
   109	{
   110		struct paging_config paging_config = {};
   111	
   112		/* Initialize boot_params. Required for cmdline_find_option_bool(). */
   113		boot_params = rmode;
   114	
   115		/*
   116		 * Check if LA57 is desired and supported.
   117		 *
   118		 * There are several parts to the check:
   119		 *   - if the kernel supports 5-level paging: CONFIG_X86_5LEVEL=y
   120		 *   - if user asked to disable 5-level paging: no5lvl in cmdline
   121		 *   - if the machine supports 5-level paging:
   122		 *     + CPUID leaf 7 is supported
   123		 *     + the leaf has the feature bit set
   124		 *
   125		 * That's substitute for boot_cpu_has() in early boot code.
   126		 */
   127		if (IS_ENABLED(CONFIG_X86_5LEVEL) &&
   128				!cmdline_find_option_bool("no5lvl") &&
   129				native_cpuid_eax(0) >= 7 &&
   130				(native_cpuid_ecx(7) & (1 << (X86_FEATURE_LA57 & 31)))) {
   131			paging_config.l5_required = 1;
   132	
   133			/* Initialize variables for 5-level paging */
 > 134			__pgtable_l5_enabled = 1;
   135			pgdir_shift = 48;
   136			ptrs_per_p4d = 512;
   137		}
   138	
   139		paging_config.trampoline_start = find_trampoline_placement();
   140	
   141		trampoline_32bit = (unsigned long *)paging_config.trampoline_start;
   142	
   143		/* Preserve trampoline memory */
   144		memcpy(trampoline_save, trampoline_32bit, TRAMPOLINE_32BIT_SIZE);
   145	
   146		/* Clear trampoline memory first */
   147		memset(trampoline_32bit, 0, TRAMPOLINE_32BIT_SIZE);
   148	
   149		/* Copy trampoline code in place */
   150		memcpy(trampoline_32bit + TRAMPOLINE_32BIT_CODE_OFFSET / sizeof(unsigned long),
   151				&trampoline_32bit_src, TRAMPOLINE_32BIT_CODE_SIZE);
   152	
   153		/*
   154		 * The code below prepares page table in trampoline memory.
   155		 *
   156		 * The new page table will be used by trampoline code for switching
   157		 * from 4- to 5-level paging or vice versa.
   158		 *
   159		 * If switching is not required, the page table is unused: trampoline
   160		 * code wouldn't touch CR3.
   161		 */
   162	
   163		/*
   164		 * We are not going to use the page table in trampoline memory if we
   165		 * are already in the desired paging mode.
   166		 */
   167		if (paging_config.l5_required == !!(native_read_cr4() & X86_CR4_LA57))
   168			goto out;
   169	
   170		if (paging_config.l5_required) {
   171			/*
   172			 * For 4- to 5-level paging transition, set up current CR3 as
   173			 * the first and the only entry in a new top-level page table.
   174			 */
   175			trampoline_32bit[TRAMPOLINE_32BIT_PGTABLE_OFFSET] = __native_read_cr3() | _PAGE_TABLE_NOENC;
   176		} else {
   177			unsigned long src;
   178	
   179			/*
   180			 * For 5- to 4-level paging transition, copy page table pointed
   181			 * by first entry in the current top-level page table as our
   182			 * new top-level page table.
   183			 *
   184			 * We cannot just point to the page table from trampoline as it
   185			 * may be above 4G.
   186			 */
   187			src = *(unsigned long *)__native_read_cr3() & PAGE_MASK;
   188			memcpy(trampoline_32bit + TRAMPOLINE_32BIT_PGTABLE_OFFSET / sizeof(unsigned long),
   189			       (void *)src, PAGE_SIZE);
   190		}
   191	
   192	out:
   193		return paging_config;
   194	}
   195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
