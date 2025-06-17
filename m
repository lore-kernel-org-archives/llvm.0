Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DA22BF016;
	Tue, 17 Jun 2025 09:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152675; cv=none; b=V1wv78qKMxx1slsA/I8RQfGmS8NJM+mIlEPKyArtF1t3RR3mN1QCae3eikJ2gqgqrmH9jEdVHQ0tU4i4mmou8UJ8VsPjcrT9NI3jzMexP4PL/7jEPIsjy8G/zer4XnAxCiUjhchXtIFc1xBoybksqU9y2JEsMRiHyo8kBM4L8zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152675; c=relaxed/simple;
	bh=hfaWYW0g5xirI7gKGjgVOLkaLmCwL61b3xsApVEHQBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfzanugv+I4EauNII3QXMV6DSKbgpJULN4GHnSUnGj1s3BWBJiIHnpPbFUE3jefcDbISWh0Ddlv0WLMnSaXjYkZnJFxfqkIgkN1x20QGwivfTBVIG2J0F+3N2K95ZGk1sqG0SmL+TX/Sv02uGPV0+pmxQCxXup2GDbY+bs7P+E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbLySMV4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbLySMV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750152673; x=1781688673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hfaWYW0g5xirI7gKGjgVOLkaLmCwL61b3xsApVEHQBY=;
  b=nbLySMV4Ptl1wCkGnmJBKMc1ElznN65sF4n9cKlwwknCtTZypCeIkIL5
   2NHlXpMgkk+ZjRcXLsakUP9NYGeTMBVOnQex9zpPRWMSNt/DfcwRCLlyY
   brwVQaT5C9SSk9E8XmySxUDo4K1J1+N3H7NfaU8sW9mU0b9AMpYJLIIvx
   axVULV1DA29aeuqqQR38WmvtcsqaTDliN5tKJOXvq+EXYyy47yGvbswr+
   7hlwe//RcwWsRFOYbpYJGwtg/sjsZ87UiPY1S61aO3tdvs/FohNVfWZak
   PuIuwF6ovj4D2jtnaKFHXtxPzWo4vp5xv5VTK+jIruT1kAgsLvDlCm1Vq
   g==;
X-CSE-ConnectionGUID: mrenKoWKQ8ixxTKlw7wnbg==
X-CSE-MsgGUID: tPk0VDdVQiWPkt0siBXzDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="39927570"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="39927570"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 02:31:13 -0700
X-CSE-ConnectionGUID: rgXyHl2mRwmg5OFErPMvZw==
X-CSE-MsgGUID: s9x1w/ejS8Ow3aiDhX9JYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="154023428"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Jun 2025 02:31:11 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRSeq-000FpO-2U;
	Tue, 17 Jun 2025 09:31:08 +0000
Date: Tue, 17 Jun 2025 17:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 11/14] mm: Remove devmap related functions and page
 table bits
Message-ID: <202506171710.jhTZDsZ3-lkp@intel.com>
References: <bf6221bf1e3a290845417a60c27cf301203fd99c.1750075065.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf6221bf1e3a290845417a60c27cf301203fd99c.1750075065.git-series.apopple@nvidia.com>

Hi Alistair,

kernel test robot noticed the following build errors:

[auto build test ERROR on f97971f859dd7d22e63982a493aec85d9e75a69e]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/mm-Convert-pXd_devmap-checks-to-vma_is_dax/20250616-200157
base:   f97971f859dd7d22e63982a493aec85d9e75a69e
patch link:    https://lore.kernel.org/r/bf6221bf1e3a290845417a60c27cf301203fd99c.1750075065.git-series.apopple%40nvidia.com
patch subject: [PATCH v2 11/14] mm: Remove devmap related functions and page table bits
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20250617/202506171710.jhTZDsZ3-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171710.jhTZDsZ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171710.jhTZDsZ3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:31:
   In file included from include/linux/pgtable.h:6:
>> arch/riscv/include/asm/pgtable.h:934:17: error: call to undeclared function 'pte_mkdevmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     934 |         return pte_pud(pte_mkdevmap(pud_pte(pud)));
         |                        ^
   arch/riscv/include/asm/pgtable.h:934:17: note: did you mean 'pud_mkdevmap'?
   arch/riscv/include/asm/pgtable.h:932:21: note: 'pud_mkdevmap' declared here
     932 | static inline pud_t pud_mkdevmap(pud_t pud)
         |                     ^
     933 | {
     934 |         return pte_pud(pte_mkdevmap(pud_pte(pud)));
         |                        ~~~~~~~~~~~~
         |                        pud_mkdevmap
>> arch/riscv/include/asm/pgtable.h:934:17: error: passing 'int' to parameter of incompatible type 'pte_t'
     934 |         return pte_pud(pte_mkdevmap(pud_pte(pud)));
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:675:35: note: passing argument to parameter 'pte' here
     675 | static inline pud_t pte_pud(pte_t pte)
         |                                   ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]


vim +/pte_mkdevmap +934 arch/riscv/include/asm/pgtable.h

c3cc2a4a3a23fa Alexandre Ghiti 2025-03-21  931  
c3cc2a4a3a23fa Alexandre Ghiti 2025-03-21  932  static inline pud_t pud_mkdevmap(pud_t pud)
c3cc2a4a3a23fa Alexandre Ghiti 2025-03-21  933  {
c3cc2a4a3a23fa Alexandre Ghiti 2025-03-21 @934  	return pte_pud(pte_mkdevmap(pud_pte(pud)));
c3cc2a4a3a23fa Alexandre Ghiti 2025-03-21  935  }
c3cc2a4a3a23fa Alexandre Ghiti 2025-03-21  936  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
