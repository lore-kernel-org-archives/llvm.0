Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE3117751;
	Fri, 24 Nov 2023 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmsXhXcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700819416; x=1732355416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9x73QFmowsicfnrwMASe6slyeKK3xoY/dkFtS3HVXok=;
  b=jmsXhXcmSPOoue9bSMaXojyYwd/6TFBG+2eozQFlyL10cz1zMNT67WIW
   Sxkc9laf1qSHokhZ0Kh3KySM+j0iqtVrQa/GoYTfwKiN20avb/jAOh47N
   xnTle8fwrT/1XpgGVPJioxhcIMnwyIOu2lWUVOnYtbGG9QmkkBUGh8uVA
   sCpVbqWwCK+xiACrjP+YIfZR2mmMrphiDOcbBbLtg2WPJ38BMVxlgAP6C
   mYkldYTg59xKTtepkGLiw2oEycdfGANoMWF8Pyqt+6Id4Iw+csT7CkDbR
   XaXN4wcrW5RWBayGUjvOL+nTDH8Xh3iYbexXifXofpA5KUMyYHz8/sGzc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="392165220"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="392165220"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 01:50:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="8921126"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Nov 2023 01:50:14 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Sp8-0002LV-28;
	Fri, 24 Nov 2023 09:50:10 +0000
Date: Fri, 24 Nov 2023 17:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH V1 01/11] mm: Fix misused APIs on huge pte
Message-ID: <202311241349.uXS40IqP-lkp@intel.com>
References: <20231123065708.91345-2-luxu.kernel@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123065708.91345-2-luxu.kernel@bytedance.com>

Hi Xu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on arnd-asm-generic/master linus/master v6.7-rc2 next-20231124]
[cannot apply to efi/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Lu/mm-Fix-misused-APIs-on-huge-pte/20231123-150128
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231123065708.91345-2-luxu.kernel%40bytedance.com
patch subject: [RFC PATCH V1 01/11] mm: Fix misused APIs on huge pte
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20231124/202311241349.uXS40IqP-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241349.uXS40IqP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241349.uXS40IqP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mprotect.c:558:36: error: call to undeclared function 'huge_ptep_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return pfn_modify_allowed(pte_pfn(huge_ptep_get(pte)),
                                             ^
>> mm/mprotect.c:558:36: error: passing 'int' to parameter of incompatible type 'pte_t'
           return pfn_modify_allowed(pte_pfn(huge_ptep_get(pte)),
                                             ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:223:43: note: passing argument to parameter 'pte' here
   static inline unsigned long pte_pfn(pte_t pte)
                                             ^
   2 errors generated.
--
>> mm/rmap.c:1611:18: error: call to undeclared function 'huge_ptep_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           pfn = pte_pfn(huge_ptep_get(pvmw.pte));
                                         ^
>> mm/rmap.c:1611:18: error: passing 'int' to parameter of incompatible type 'pte_t'
                           pfn = pte_pfn(huge_ptep_get(pvmw.pte));
                                         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:223:43: note: passing argument to parameter 'pte' here
   static inline unsigned long pte_pfn(pte_t pte)
                                             ^
   mm/rmap.c:1968:18: error: call to undeclared function 'huge_ptep_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           pfn = pte_pfn(huge_ptep_get(pvmw.pte));
                                         ^
   mm/rmap.c:1968:18: error: passing 'int' to parameter of incompatible type 'pte_t'
                           pfn = pte_pfn(huge_ptep_get(pvmw.pte));
                                         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:223:43: note: passing argument to parameter 'pte' here
   static inline unsigned long pte_pfn(pte_t pte)
                                             ^
   4 errors generated.


vim +/huge_ptep_get +558 mm/mprotect.c

   553	
   554	static int prot_none_hugetlb_entry(pte_t *pte, unsigned long hmask,
   555					   unsigned long addr, unsigned long next,
   556					   struct mm_walk *walk)
   557	{
 > 558		return pfn_modify_allowed(pte_pfn(huge_ptep_get(pte)),
   559					  *(pgprot_t *)(walk->private)) ?
   560			0 : -EACCES;
   561	}
   562	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
