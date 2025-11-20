Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1611F33C53A;
	Thu, 20 Nov 2025 13:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644456; cv=none; b=MY92VHNlrVKxFr6nXdaUn19xKfOlvOc6Ufza0Fo6EL90kNy/3zodeu/0FP30p2Q/MzPOZ+jbNNsLvH4eI72fHoylBjqu/qBJTcttG/aPBJJkdaWvB6YsURqQHKegxfrnKXLHFoV9bfZqzHzAhZNcXSAHXWZQY7kCCZGQ6NTnu1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644456; c=relaxed/simple;
	bh=LObeUP52zqRcVyzjHpX5FVcl0++HBcnwfNDxI5bUEeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fod+XDlC29VfCDceUGmzsloqT/4HauDJjrfLe2txbXirdB35bZGbxRrFW7g8ZjtysZOe/StyOTUJpRwhPyQgD15tILxiXil/fuTudNw994n8Jj7adYEiRt8Q3O8uVqrWTFFvXwSY/e1BUTyomt94/nfKwyMGz4JOdv80WexwLIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGyvQmKC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGyvQmKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763644454; x=1795180454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LObeUP52zqRcVyzjHpX5FVcl0++HBcnwfNDxI5bUEeg=;
  b=dGyvQmKC0iCZwqZLxqQWAFfwY+6Af/oKlhpcXZXNEcH42bkNtNk7vlRv
   tIOnM/YSALlAXNzYKc7OkJp3cPM1LlUmQvXRfoqKpQ5hAwpuPG+093e1Q
   J09lJqGN7cHtln+1eZ1reLgNHwrGGmeNinS55e/D1W9SU47Lq0OfJXca5
   kqAmPlhKZkmg7+GfSi8Lq7euOX5P/gUrKvN2w9ZCEJuGBn3YVVOEFCKi8
   QEMTR2aybP264zNiDXJRvjiDZpp7iTcyaJedVdNNuR1DL3h7jjzcNcjIK
   TXUg0Y1kKqwlCFx5rFDoAt3ZpHC60pQ7G/4zqSCHUqsUMucn/faMyM0BL
   g==;
X-CSE-ConnectionGUID: ncjAVwbdRZaAXL9jlb8EFQ==
X-CSE-MsgGUID: ZGn1qZF/RXeZWSTgN3pgnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65654356"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="65654356"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 05:14:13 -0800
X-CSE-ConnectionGUID: EQqCb8m4Rh6GN06kPYkH0A==
X-CSE-MsgGUID: es6nKVj7RgmlFUbwaN5+Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="190614319"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Nov 2025 05:14:12 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM4UD-000427-25;
	Thu, 20 Nov 2025 13:14:09 +0000
Date: Thu, 20 Nov 2025 21:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:hugetlb_unshare 7/8] mm/rmap.c:1877:24: error: use
 of undeclared identifier 'range'
Message-ID: <202511202119.DaZbZygy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux hugetlb_unshare
head:   f73f34e9b553d94cf3030e2674fbf2dab619181a
commit: b9189040ca4a05c8025ecff5b70a7895018d34e5 [7/8] mm/rmap: factor out PMD table unsharing into try_to_unshare_hugetlb_pmd_table()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251120/202511202119.DaZbZygy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511202119.DaZbZygy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511202119.DaZbZygy-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/rmap.c:1873:31: error: use of undeclared identifier 'tlb'
    1873 |         unshared = huge_pmd_unshare(&tlb, vma, address);
         |                                      ^
>> mm/rmap.c:1877:24: error: use of undeclared identifier 'range'
    1877 |                 flush_tlb_range(vma, range.start, range.end);
         |                                      ^
   mm/rmap.c:1877:37: error: use of undeclared identifier 'range'
    1877 |                 flush_tlb_range(vma, range.start, range.end);
         |                                                   ^
   3 errors generated.


vim +/range +1877 mm/rmap.c

  1848	
  1849	static bool try_to_unshare_hugetlb_pmd_table(struct vm_area_struct *vma,
  1850			unsigned long address, enum ttu_flags flags,
  1851			struct page_vma_mapped_walk *pvmw, bool *ret)
  1852	{
  1853		bool unshared;
  1854	
  1855		if (!IS_ENABLED(CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING))
  1856			return false;
  1857	
  1858		/*
  1859		* To call huge_pmd_unshare, i_mmap_rwsem must be held in write mode.
  1860		* Callers needs to explicitly do this outside rmap routines.
  1861		*
  1862		* We also must hold hugetlb vma_lock in write mode. Lock order dictates
  1863		* acquiring vma_lock BEFORE i_mmap_rwsem. We can only try lock here
  1864		* and fail if unsuccessful.
  1865		*/
  1866		VM_WARN_ON_ONCE(!(flags & TTU_RMAP_LOCKED));
  1867		if (!hugetlb_vma_trylock_write(vma)) {
  1868			page_vma_mapped_walk_done(pvmw);
  1869			*ret = false;
  1870			return true;
  1871		}
  1872	
  1873		unshared = huge_pmd_unshare(&tlb, vma, address);
  1874		hugetlb_vma_unlock_write(vma);
  1875	
  1876		if (unshared) {
> 1877			flush_tlb_range(vma, range.start, range.end);
  1878			/*
  1879			* The PMD table was unmapped, consequently unmapping the
  1880			* folio.
  1881			*/
  1882			page_vma_mapped_walk_done(pvmw);
  1883		}
  1884		return unshared;
  1885	}
  1886	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
