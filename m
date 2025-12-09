Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A55B14F9D6;
	Tue,  9 Dec 2025 01:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765245179; cv=none; b=Kg2tgt0Hv8253nlDkQqL76G4YHenuDrC1ojKhWRmakkltQg87LmyYBD0ouD9HuAFQry5vSulBmG1vvzLQU4iZUgY/un6uBE3vb1DRWKWmL0/JLEIqIspRH+MZ3m0c3JYzCc3NZ8vIgHC5Wu4jlkAnms53xmQm8TAtaq5JtewrSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765245179; c=relaxed/simple;
	bh=Ey9K4onyQ6f8kRj6L7zyp5HQ9JpLyn+tNZX7DiZPVB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMjFWDtrGg++pyEjTmGSRN7s73OS1ZO7AdAxdqp1tWchne0FR5GlFRmdkRh8m3TXvks2pAVBa3zLCqMTl90n8XpurA6GxTWaPU+hxzjFzeh/6x2+/+l5r6ANxteBfHRVZ6HoGcE/eOVGk1CqcUEUXqVrsqtLZPrR7dMN6MW9uc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n22PiBmQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n22PiBmQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765245178; x=1796781178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ey9K4onyQ6f8kRj6L7zyp5HQ9JpLyn+tNZX7DiZPVB4=;
  b=n22PiBmQf2gLrEcTdGj0xJRSi+MxLYCJZ88wnHYkPIUZvMPuTR8/gEGo
   5KRyFBuLQvPJtKQwzB9Ge+k1NtGIso4z/wxz8h9yWWixpQhkNw5TBSkqP
   2a3ZiJXovAO9zLP2UYgxtO3uu1KoDNshsErKRtX0VquZO/w8UxQmdexEz
   LGgEQUmoEIz41l5MEVuz96Fch88pnqBkdOP+iGo/qzcT2lZBfYFOzm1bg
   DP20fkgEthFZ9KQEuiofDEFr8w4Mjy+CNb8x/MK/jVRfLQbhySNRbtymC
   LNXHw10wJTINrD1YhGtQbxcbiXgdAhGWihAeSGq4vFQzsksMcAvVaPl+6
   A==;
X-CSE-ConnectionGUID: vfn08brdT/amUgKEAAZarQ==
X-CSE-MsgGUID: OUBiPW7FT8W9J9fQYwxkoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67081856"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="67081856"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 17:52:57 -0800
X-CSE-ConnectionGUID: NmFLdEa4RSSSF9mDwljs4w==
X-CSE-MsgGUID: 3LPMO/wqQvKJ5OnTwt0Fog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="200537413"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2025 17:52:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSmuL-000000001AQ-09RK;
	Tue, 09 Dec 2025 01:52:53 +0000
Date: Tue, 9 Dec 2025 09:52:11 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Brendan Jackman <jackmanb@google.com>
Subject: Re: [PATCH] mm/vmalloc: clarify why vmap_range_noflush() might sleep
Message-ID: <202512090959.BWqYaOOg-lkp@intel.com>
References: <20251208-b4-vmalloc-might_alloc-v1-1-94a9bb8ecb08@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-b4-vmalloc-might_alloc-v1-1-94a9bb8ecb08@google.com>

Hi Brendan,

kernel test robot noticed the following build errors:

[auto build test ERROR on ecc46e02e0abe025a6e840cba2d647f23fd1d721]

url:    https://github.com/intel-lab-lkp/linux/commits/Brendan-Jackman/mm-vmalloc-clarify-why-vmap_range_noflush-might-sleep/20251208-132202
base:   ecc46e02e0abe025a6e840cba2d647f23fd1d721
patch link:    https://lore.kernel.org/r/20251208-b4-vmalloc-might_alloc-v1-1-94a9bb8ecb08%40google.com
patch subject: [PATCH] mm/vmalloc: clarify why vmap_range_noflush() might sleep
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251209/202512090959.BWqYaOOg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090959.BWqYaOOg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090959.BWqYaOOg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmalloc.c:308:14: error: use of undeclared identifier 'GFP_PGTABLE_KERNEL'
     308 |         might_alloc(GFP_PGTABLE_KERNEL);
         |                     ^
   1 error generated.


vim +/GFP_PGTABLE_KERNEL +308 mm/vmalloc.c

   297	
   298	static int vmap_range_noflush(unsigned long addr, unsigned long end,
   299				phys_addr_t phys_addr, pgprot_t prot,
   300				unsigned int max_page_shift)
   301	{
   302		pgd_t *pgd;
   303		unsigned long start;
   304		unsigned long next;
   305		int err;
   306		pgtbl_mod_mask mask = 0;
   307	
 > 308		might_alloc(GFP_PGTABLE_KERNEL);
   309		BUG_ON(addr >= end);
   310	
   311		start = addr;
   312		pgd = pgd_offset_k(addr);
   313		do {
   314			next = pgd_addr_end(addr, end);
   315			err = vmap_p4d_range(pgd, addr, next, phys_addr, prot,
   316						max_page_shift, &mask);
   317			if (err)
   318				break;
   319		} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
   320	
   321		if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
   322			arch_sync_kernel_mappings(start, end);
   323	
   324		return err;
   325	}
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
