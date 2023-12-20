Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CD68BEB;
	Wed, 20 Dec 2023 03:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ph1na75L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703042222; x=1734578222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ebt8MnqECr1X0gcAYVgWHpq3MGr19w1aV9NwTwCFcvU=;
  b=Ph1na75LCFIdMUp37qfPj6exCbI//jfG89nEJtfN9R99p3JNN1crmqz7
   W5UpzCw1ArLtDEQ9BiYW6HSe9Ft6dQzLzCLkx2ZciIGBq5RMsWC6husjm
   yT7gN61+Ray18MjWqBD5twFDsc0F/+QK3JgkXbl5aWjRpXdU0gNbVT3GN
   bO7lPA5ttU7BoDh+naRWyvCorY2siGKfNoT4NWi9VU6PRys/g4FY4aEpd
   Lm/MzTQ5Un//FdDUOHvFUHgRdaAxY98zX+9+nct7is8J1rpzLxSPDFfVX
   6oXkajU6jpHe0y8SlW/wqA6GrZlpcYlSutyLtZVVmaoaRlcDMJ/iV5s5P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="394639601"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="394639601"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 19:17:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="919824658"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="919824658"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2023 19:17:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFn4s-0006Fs-24;
	Wed, 20 Dec 2023 03:16:58 +0000
Date: Wed, 20 Dec 2023 11:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:fork-batching 43/43] mm/memory.c:972:23: error:
 call to undeclared function 'pte_next_pfn'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202312201029.HLyooDGf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux fork-batching
head:   05bc057b414c5bd673e6a8dce1d195be1bfdac67
commit: 05bc057b414c5bd673e6a8dce1d195be1bfdac67 [43/43] mm/memory: optimize fork() with PTE-mapped THP
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20231220/202312201029.HLyooDGf-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 5ac12951b4e9bbfcc5791282d0961ec2b65575e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231220/202312201029.HLyooDGf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312201029.HLyooDGf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory.c:972:23: error: call to undeclared function 'pte_next_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     972 |         pte_t expected_pte = pte_next_pfn(pte);
         |                              ^
>> mm/memory.c:972:8: error: initializing 'pte_t' with an expression of incompatible type 'int'
     972 |         pte_t expected_pte = pte_next_pfn(pte);
         |               ^              ~~~~~~~~~~~~~~~~~
>> mm/memory.c:990:16: error: assigning to 'pte_t' from incompatible type 'int'
     990 |                 expected_pte = pte_next_pfn(expected_pte);
         |                              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/pte_next_pfn +972 mm/memory.c

   966	
   967	static inline int folio_pte_batch(struct folio *folio, pte_t *start_ptep,
   968			pte_t pte, unsigned long addr, int max_nr)
   969	{
   970		unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
   971		const pte_t *end_ptep = start_ptep + max_nr;
 > 972		pte_t expected_pte = pte_next_pfn(pte);
   973		pte_t *ptep = start_ptep + 1;
   974	
   975		while (ptep != end_ptep) {
   976			pte = ptep_get(ptep);
   977	
   978			/* Do all PTE bits match, and the PFN is consecutive? */
   979			if (!pte_same(pte, expected_pte))
   980				break;
   981	
   982			/*
   983			 * Stop immediately once we reached the end of the folio. In
   984			 * corner cases the next PFN might fall into a different
   985			 * folio.
   986			 */
   987			if (pte_pfn(pte) == folio_end_pfn - 1)
   988				break;
   989	
 > 990			expected_pte = pte_next_pfn(expected_pte);
   991			ptep++;
   992		}
   993	
   994		return ptep - start_ptep;
   995	}
   996	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
