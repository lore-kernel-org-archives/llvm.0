Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A313DAAB8;
	Sun, 18 Oct 2026 19:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351706; cv=none; b=Xn5nyJBe+CT2VK9mpgAeYWnixwYjcpS5vlNt3nooYWMJGVX6+e9wjhgJ7G/GkgDmH4KHY6G+qJw5b3r5L4aYTVRgfnxoasyDQS2YGM9zAi2IFD7xWtJ/RiwHjuy1KMXVQT9IkQAHjGVOuulQLRvtBl3LWaDneydWyqnRO5/CmrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351706; c=relaxed/simple;
	bh=uFklOqpGLDOcw7llns7c54f6yJI1yDlJs2pvjUS9vbc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XOcpHLmpemy35tXKUPwiRZhhO8aLGzRtNOIPsqqOxnwsZPwW4epHtcG2sAp2Mqpb6ZSMylwBDDCEaz0r3DI07YuqWKavvCqGBXEgqhMbr1sHLbUp+nqM3RzAdx97Nh4Jj0CNj/Mlm8/ISlxOB3T5TnlD1MoCmxTNJhAkC7NkQ5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bp8Pb8VC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bp8Pb8VC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792351705; x=1823887705;
  h=date:from:to:cc:subject:message-id;
  bh=uFklOqpGLDOcw7llns7c54f6yJI1yDlJs2pvjUS9vbc=;
  b=Bp8Pb8VCC2PqhOr+VRGOa9c9awgU+hYuPfkOudKMYjhXya2HScHTLqyX
   naPeyzGHU/SxFFQ81ZlbNtLrZb96k0yLaosogDHS9nx1Xv8ZERgnT1Sdu
   wnP+SUc6laq5SIGJpM0M1aKNuLeuzT2SiHgA/mQ9pVF/AKYlvST2V9tDv
   FiwH3flYrT/kDb6ft0vHX3PBLUeDei0kRQeHTi0EoTBlAh+ux7m0x967P
   62HhnB/bFuGB1v1bhcl7phbOG03kQz4uQyoJRbdFRS6mJlLhKru1Qt2+S
   s63rQfy0+2gAxAkxUkhjqwvlfFDFKjhnaiDPYG5QFzH57BYKbH3hdooQZ
   Q==;
X-CSE-ConnectionGUID: 4/RNzik0QyyiS3lArTBVLg==
X-CSE-MsgGUID: MDiPQaZ7TW2uqDclMn03ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="914990"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="914990"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 12:28:24 -0700
X-CSE-ConnectionGUID: sMlpC2f+SfOOMOt+BHSiSw==
X-CSE-MsgGUID: gaToUJLwQZGeZ/pvUxddFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2706089"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Oct 2026 12:28:22 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIWYN-00000000Kju-0Sj1;
	Sun, 18 Oct 2026 19:28:19 +0000
Date: Mon, 19 Oct 2026 03:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss 24/32] arch/x86/mm/cpu_entry_area.c:97:66:
 warning: format specifies type 'unsigned long' but the argument has type
 'pgprotval_t' (aka 'unsigned long long')
Message-ID: <202610190249.H5DsgiUd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss
head:   1b2e2aefa6c7e3d15fac1b25a971b2d2cc3b697d
commit: 2c3b2196343ffa5e0389c9a104fe9c00e0875799 [24/32] cea-estacks-shadows-debug1
config: i386-buildonly-randconfig-1001-20261018 (https://download.01.org/0day-ci/archive/20261019/202610190249.H5DsgiUd-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190249.H5DsgiUd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190249.H5DsgiUd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/cpu_entry_area.c:97:66: warning: format specifies type 'unsigned long' but the argument has type 'pgprotval_t' (aka 'unsigned long long') [-Wformat]
      97 |         printk("%s(0x%016lx, 0x%016llx, 0x%016lx)\n", __func__, va, pa, pgprot_val(flags));
         |                                           ~~~~~~                        ^~~~~~~~~~~~~~~~~
         |                                           %016llx
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:201:24: note: expanded from macro 'pgprot_val'
     201 | #define pgprot_val(x)           ((x).pgprot)
         |                                 ^~~~~~~~~~~~
   arch/x86/mm/cpu_entry_area.c:103:114: warning: format specifies type 'unsigned long' but the argument has type 'pgprotval_t' (aka 'unsigned long long') [-Wformat]
     103 |         printk("%s(0x%016lx, 0x%016lx, %d, 0x%016lx)\n", __func__, (unsigned long)cea_vaddr, (unsigned long)ptr, pages, pgprot_val(prot));
         |                                              ~~~~~~                                                                     ^~~~~~~~~~~~~~~~
         |                                              %016llx
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:201:24: note: expanded from macro 'pgprot_val'
     201 | #define pgprot_val(x)           ((x).pgprot)
         |                                 ^~~~~~~~~~~~
   2 warnings generated.


vim +97 arch/x86/mm/cpu_entry_area.c

    78	
    79	void cea_set_pte(void *cea_vaddr, phys_addr_t pa, pgprot_t flags)
    80	{
    81		unsigned long va = (unsigned long) cea_vaddr;
    82		pte_t pte = pfn_pte(pa >> PAGE_SHIFT, flags);
    83	
    84		/*
    85		 * The cpu_entry_area is shared between the user and kernel
    86		 * page tables.  All of its ptes can safely be global.
    87		 * _PAGE_GLOBAL gets reused to help indicate PROT_NONE for
    88		 * non-present PTEs, so be careful not to set it in that
    89		 * case to avoid confusion.
    90		 */
    91		if (boot_cpu_has(X86_FEATURE_PGE) &&
    92		    (pgprot_val(flags) & _PAGE_PRESENT))
    93			pte = pte_set_flags(pte, _PAGE_GLOBAL);
    94	
    95		set_pte_vaddr(va, pte);
    96	
  > 97		printk("%s(0x%016lx, 0x%016llx, 0x%016lx)\n", __func__, va, pa, pgprot_val(flags));
    98	}
    99	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
