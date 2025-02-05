Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80184131E2D;
	Wed,  5 Feb 2025 09:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738746615; cv=none; b=P8npylj7g9ZtBlyiXvoQ1Pp9eW+cN7OAzQIZIqv+ZywvFLxnmDmqmLgOYVxWevajEAfkPCp1H1Mwgg8ZUl2Do6P5Nb/e8jYb0VELdhRy+JJYuybDiZQtSHL7D+RMA3Ph6ov2cNJBJy2VG0nByn0xnXjS4ALfot54wPpl6JVGBQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738746615; c=relaxed/simple;
	bh=4Vz/xV52I5TY6e0hXgyl1C65dqvdNjDy5Q319T2OTjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M3JfJyP3mlKWLgFv1RvtmzXcPuvTox4PSuubQTB2WsatMpTRP3c1STRUs7xuFrBUI7WfI3PTnlo0fUjMAnJeuuPjLCuNz4ZA6bHx5PEDYrGQX8ZAgaD55CxbHvlqXotUDqAcXyL22JOLz629Ns2HztN//bnqFybbjQ3P30Cn1aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MOWb/TJr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOWb/TJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738746613; x=1770282613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Vz/xV52I5TY6e0hXgyl1C65dqvdNjDy5Q319T2OTjw=;
  b=MOWb/TJrzmht1voW/tFy0E47o3/AO+e4zpwxwEVQiDk2saqG4bgd2bk4
   x2MvZZmdiUe/OlNEJwCSjFdSFLnbp+1R9VtUnufSIBdQcfycLugOqcH7R
   +KTU2Izm4jddRX6oqgPUARiqnwxtYv2YPtZcgMXqRPgy0dzUzSH80Q7cb
   C50mB8R33xFHeldgZXntPGq0yEIuXlHsFtB6lk/7ziq1jf/SQr9wqgcLT
   jZeb6bjZQ1Rw6kWGHX985FkYt3+L3+kI0pX8r26Mr/JRHZ/pa2arxgk9C
   6eQeGfMH5wpeJoqsFO/zYu9M+fSRxmezId+5fLjuXY3UOOeMpt6PDATqa
   w==;
X-CSE-ConnectionGUID: a5kxentYS+as/gP21P1DzA==
X-CSE-MsgGUID: jtJPz8qyQjeYx0FDsaAIqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50721719"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50721719"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:10:12 -0800
X-CSE-ConnectionGUID: 9F2zih6STh+zl9j5ZszEDQ==
X-CSE-MsgGUID: VrQ+12c0TfWXDwqbaxoylQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="110696884"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Feb 2025 01:10:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfbQ9-000tgF-2M;
	Wed, 05 Feb 2025 09:10:09 +0000
Date: Wed, 5 Feb 2025 17:09:53 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:device_private 15/22] mm/damon/ops-common.c:50:17:
 warning: variable 'pteval' is uninitialized when used here
Message-ID: <202502051656.Xa4isdxU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux device_private
head:   ddc42f5fd72394838fc2d280ff2486ccb7178b9a
commit: 9440e0949cbc08fc248f6eacf05e4d47c48f1294 [15/22] mm/damon: handle device-exclusive entries correctly in damon_folio_mkold_one()
config: i386-buildonly-randconfig-005-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051656.Xa4isdxU-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051656.Xa4isdxU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051656.Xa4isdxU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/ops-common.c:50:17: warning: variable 'pteval' is uninitialized when used here [-Wuninitialized]
      50 |                 pfn = pte_pfn(pteval);
         |                               ^~~~~~
   mm/damon/ops-common.c:47:2: note: variable 'pteval' is declared here
      47 |         pte_t pteval;
         |         ^
   1 warning generated.


vim +/pteval +50 mm/damon/ops-common.c

    41	
    42	void damon_ptep_mkold(pte_t *pte, struct vm_area_struct *vma, unsigned long addr)
    43	{
    44		struct folio *folio = damon_get_folio(pte_pfn(ptep_get(pte)));
    45		bool young = false;
    46		unsigned long pfn;
    47		pte_t pteval;
    48	
    49		if (likely(pte_present(pteval)))
  > 50			pfn = pte_pfn(pteval);
    51		else
    52			pfn = swp_offset_pfn(pte_to_swp_entry(pteval));
    53	
    54		folio = damon_get_folio(pfn);
    55		if (!folio)
    56			return;
    57	
    58		/*
    59		 * PFN swap entries, such as device-exclusive ones, are "old" from a
    60		 * CPU perspective.
    61		 */
    62		if (likely(pte_present(pteval)))
    63			young |= ptep_test_and_clear_young(vma, addr, pte);
    64		young |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
    65		if (young)
    66			folio_set_young(folio);
    67	
    68		folio_set_idle(folio);
    69		folio_put(folio);
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
