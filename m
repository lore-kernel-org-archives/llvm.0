Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC80328604;
	Tue, 16 Dec 2025 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765890561; cv=none; b=JwmNXsvxKhWMZ/0K5VJwOo6J68vwJx5z5Pw2MqmJadvEoh+2FvJ9Q9OYH2mJ7jm1E62Ughg7YB2ixgsvV4Yp2jK6xlMCNjbwhUrgQw5ypHKEPWn+9DEldB+anuyBo9uS/YQF6siE4Udgbf00kKp1nBtE/f+88oN22+NJl57b/98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765890561; c=relaxed/simple;
	bh=Xka8vrzXmYsDRtLKcs4D29NutCopasc9PuNbIBmzGKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G31BDALWN/bO1HSurbSBtZhSKmrnEgcwOIZTgIxoj4nYJDa1cqEHoJkzvY4dWTCGwKECG1DL8S35AKzhIEpXVCo9MiHqVEOxtg2AtZ6Ak6/FHYG9GdAwjUrnG4rC6sOqjwa8WtbK8f5jXPIBukG/gfr9K/q06M5yGnI/bHsljcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E787XJ3V; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E787XJ3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765890560; x=1797426560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xka8vrzXmYsDRtLKcs4D29NutCopasc9PuNbIBmzGKE=;
  b=E787XJ3VIjpfLs09tT1d1xVKHcW3aUJ/10rs7f1LALL3EtLWKtkwcrdd
   EnlFiLNDoUQgJ8rJkcf14KRhY/iIzcVYcFkECzry17CN63MQ6j8o5Lu5L
   5lTxU2G/B7gJx3oF694fKaIyR09x7VoG59QhKoFqI4zxoDkr4/Ped1m6d
   t4dChBE5vZe9LCNJW7i6m5AZBa0n5IKXV9uuZOeck82ij/w5AVn7cTpON
   2Bjtw2plK5FJT06RM+wGPDpw3VXIFzCRR/5LUoc4wjnW585/xZSJNp9/w
   GF3xNlaU1ROppktqWNwKTm/U283Pe8mFVEq3J+6p0MoXbKzStqE6khy9J
   A==;
X-CSE-ConnectionGUID: dKNk4cgOTVqEbL6C2J5PIA==
X-CSE-MsgGUID: wlLaPXE8SgKZ4eJPlSsfig==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79263700"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="79263700"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 05:09:20 -0800
X-CSE-ConnectionGUID: 15HNIl5oQ0q6wU2ch0cjvQ==
X-CSE-MsgGUID: qZQU74X1T1S8vd3lHo0D9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197636027"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 16 Dec 2025 05:09:16 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVUni-00000000364-0DGy;
	Tue, 16 Dec 2025 13:09:14 +0000
Date: Tue, 16 Dec 2025 14:08:14 +0100
From: kernel test robot <lkp@intel.com>
To: Vernon Yang <vernon2gm@gmail.com>, akpm@linux-foundation.org,
	david@kernel.org, lorenzo.stoakes@oracle.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, ziy@nvidia.com,
	npache@redhat.com, baohua@kernel.org, lance.yang@linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Vernon Yang <yanglincheng@kylinos.cn>
Subject: Re: [PATCH 3/4] mm: khugepaged: move mm to list tail when
 MADV_COLD/MADV_FREE
Message-ID: <202512161406.RfF1dIYB-lkp@intel.com>
References: <20251215090419.174418-4-yanglincheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215090419.174418-4-yanglincheng@kylinos.cn>

Hi Vernon,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.19-rc1 next-20251216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vernon-Yang/mm-khugepaged-add-trace_mm_khugepaged_scan-event/20251215-171046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251215090419.174418-4-yanglincheng%40kylinos.cn
patch subject: [PATCH 3/4] mm: khugepaged: move mm to list tail when MADV_COLD/MADV_FREE
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251216/202512161406.RfF1dIYB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161406.RfF1dIYB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161406.RfF1dIYB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/madvise.c:609:2: error: call to undeclared function 'khugepaged_move_tail'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     609 |         khugepaged_move_tail(vma->vm_mm);
         |         ^
   mm/madvise.c:837:2: error: call to undeclared function 'khugepaged_move_tail'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     837 |         khugepaged_move_tail(mm);
         |         ^
   2 errors generated.


vim +/khugepaged_move_tail +609 mm/madvise.c

   595	
   596	static long madvise_cold(struct madvise_behavior *madv_behavior)
   597	{
   598		struct vm_area_struct *vma = madv_behavior->vma;
   599		struct mmu_gather tlb;
   600	
   601		if (!can_madv_lru_vma(vma))
   602			return -EINVAL;
   603	
   604		lru_add_drain();
   605		tlb_gather_mmu(&tlb, madv_behavior->mm);
   606		madvise_cold_page_range(&tlb, madv_behavior);
   607		tlb_finish_mmu(&tlb);
   608	
 > 609		khugepaged_move_tail(vma->vm_mm);
   610	
   611		return 0;
   612	}
   613	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
