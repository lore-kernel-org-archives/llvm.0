Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4568C265621;
	Thu, 11 Dec 2025 23:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765496459; cv=none; b=IxdbQUVpx0S4uVBUvFJqkGTPgghhCrJr0sbKHSX4uXsizb0IIwXhnSiWtK6AdGzSKVjJPvGx7pCpX7fyqM42RM8mCEj73y+adJZ1t+SbdLWoXtiYYUQEvdIwZ7aAhUUO4kWfK1J4Pj/9sNyzFfAKGgslt7quzxO32qyjBMdVk0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765496459; c=relaxed/simple;
	bh=EkQOI6jVqcqmDxCC2zpQcLsEWK0lUcThTIMyL7fnwXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AE5G701v2hwi7vYOW2yN8sFUDPbfVcZJ8MF4jXxpOeiC0TjqYrUGbp/C7y88jmBKknuMfErHRvj/LsxQxiPfsW8BNw5XcTz6OViZa//21DEhcEvFUZ1PLkg7G8gsCvvhWrsr18c+KF0I1dxTg2e+FnbtlluS3v7zhfup+e3FfVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGjYzLj2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGjYzLj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765496458; x=1797032458;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EkQOI6jVqcqmDxCC2zpQcLsEWK0lUcThTIMyL7fnwXw=;
  b=AGjYzLj2W/V57/4xUskA3EptuXX26x5VXDz2PxDl6k/ddDesBeX7J6ZV
   e+8D8ZWWRHlTBgJNA47Vsgabi02eREMld1MZ1yCtzJ0lWJUq0F5d9muII
   ivaAUiZtOnCB6MKieAw3yb5gkIY0G9ZXDeF6mvuEGpwUDda9rrracfTjM
   j0eyyUXqWbVIVh9Qin8mJBYmxKXuPicFdcgogvxDR9WgihvNanSIpjFHb
   RJzQtxWnGnXzr9tJogMRP5JEVUHCRXIgllBLIrY83JowvtYex6fTsmWZr
   4fXtJodpQCZheZ3uTnCL0MmJRaii1qJ2cPdCxWuRWRPY+E2jRaTsCUsjN
   g==;
X-CSE-ConnectionGUID: f49tFTORTU6K89Rd9bRg9g==
X-CSE-MsgGUID: chmqxVZwSn2oQ/v55wvZ9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78855728"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78855728"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 15:40:58 -0800
X-CSE-ConnectionGUID: Xr4OVmJmRbKPbckglQhbtw==
X-CSE-MsgGUID: 9lUptSQiSpWJOUFt+BwWOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196702616"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Dec 2025 15:40:54 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTqHE-000000005CP-0IV5;
	Thu, 11 Dec 2025 23:40:52 +0000
Date: Fri, 12 Dec 2025 07:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Gavin Shan <gshan@redhat.com>, Zi Yan <ziy@nvidia.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 2/2] mm/madvise: Use set_pte() to write page tables
Message-ID: <202512120735.ge1E0s5N-lkp@intel.com>
References: <20251211081117.1126521-3-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211081117.1126521-3-samuel.holland@sifive.com>

Hi Samuel,

kernel test robot noticed the following build errors:

[auto build test ERROR on d358e5254674b70f34c847715ca509e46eb81e6f]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/mm-debug_vm_pgtable-Use-set_pXd-to-write-page-tables/20251211-161254
base:   d358e5254674b70f34c847715ca509e46eb81e6f
patch link:    https://lore.kernel.org/r/20251211081117.1126521-3-samuel.holland%40sifive.com
patch subject: [PATCH 2/2] mm/madvise: Use set_pte() to write page tables
config: arm-footbridge_defconfig (https://download.01.org/0day-ci/archive/20251212/202512120735.ge1E0s5N-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120735.ge1E0s5N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120735.ge1E0s5N-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/madvise.c:1117:2: error: call to undeclared function 'set_pte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1117 |         set_pte(ptep, make_pte_marker(PTE_MARKER_GUARD));
         |         ^
   mm/madvise.c:1117:2: note: did you mean 'set_ptes'?
   arch/arm/include/asm/pgtable.h:212:6: note: 'set_ptes' declared here
     212 | void set_ptes(struct mm_struct *mm, unsigned long addr,
         |      ^
   1 error generated.


vim +/set_pte +1117 mm/madvise.c

  1110	
  1111	static int guard_install_set_pte(unsigned long addr, unsigned long next,
  1112					 pte_t *ptep, struct mm_walk *walk)
  1113	{
  1114		unsigned long *nr_pages = (unsigned long *)walk->private;
  1115	
  1116		/* Simply install a PTE marker, this causes segfault on access. */
> 1117		set_pte(ptep, make_pte_marker(PTE_MARKER_GUARD));
  1118		(*nr_pages)++;
  1119	
  1120		return 0;
  1121	}
  1122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
