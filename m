Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127162C0268;
	Thu,  2 Jul 2026 15:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007955; cv=none; b=jEXfcEvr2jEhVWzccCu6F1oxf5cBppbsZ1LjZLbJqboreMGf9c4qbRi/Rvs3aaNUxHnWmx9BsA64lJOLk4JLCLzDrKMH8FsSV01UY0vvSJflzXrAxpMXJZYV//rYoqxHuJY6iymm3FEk+PcKbwYcn17QZlUbjRWoNv9XBsVPsAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007955; c=relaxed/simple;
	bh=bcDhMDMx8EaCxXLu9M4067NovIxkV7DkMDOkotv1vCo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eLNeHOeVX4n9mbpEXbO3WO7xTFOqxG9CjBWMvQXHweMqJsMF7+Fr7OMKx0c2o0ujxe3CaTDM6brjPDD38e9yJX6OvsdtyrDX5OmK0o2InV9No+3QJXqbNpeVaTTUg9RLiLj3vguZGSXqft6znK/p8oJF+qqVOpRr1scVxxvm5Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSbNjY0u; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSbNjY0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783007953; x=1814543953;
  h=date:from:to:cc:subject:message-id;
  bh=bcDhMDMx8EaCxXLu9M4067NovIxkV7DkMDOkotv1vCo=;
  b=gSbNjY0upuTEC3GbjN4nK2H02nUxUqhw1Uu/wYAl8WRJnMEnTIltSbzr
   D+h75jGBvUEU6tcAnBqpGp3plvG+DwBc07ZwYRpvHwnPaohIih7EG8j8G
   3WXZWJx1TJzjphr9+FyQgvD1YF3hyoSjq184akuSM9WuiaHq38f3xLyew
   f20hJgbwwW51suoKpcnL9+gTJzAGRM33NTFXelGxG2aOSUlYpymv1pF25
   e2mBhZjxLaA+SYGUj3m1Rdmn/zD7AcaDrtkH10+PrqPbdxdFqxS+9fQRI
   begTwq0bhW0JhD1KFDWC36kAZAnSScRCC+zx8uer314Zb9laojb8nj3Ou
   g==;
X-CSE-ConnectionGUID: waH2TDLXTrSCfBc36yq+nA==
X-CSE-MsgGUID: YFgWvVUKSAyqYDl4L1fMjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87446553"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="87446553"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 08:59:13 -0700
X-CSE-ConnectionGUID: DijxR7eoTUmyyk0mvB79mA==
X-CSE-MsgGUID: nWVf9aIVROOiMBGemy/DBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="253554249"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 02 Jul 2026 08:59:11 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfJoj-000000001Ft-0LzE;
	Thu, 02 Jul 2026 15:59:09 +0000
Date: Thu, 02 Jul 2026 17:58:15 +0200
From: kernel test robot <lkp@intel.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: mm/bootmem_info.c:42:22: warning: variable 'ms' set but not
 used
Message-ID: <202607021721.hYpm7ljY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Muchun-Song/mm-sparse-drop-power-of-2-size-requirement-for-struct-mem_section/20260702-190519
head:   d82bcb5e8cebc61e5770c45ab420f0216bca10c4
commit: d9ad0c4a1c722741bcba70f71ce5ae7116c3ac64 mm/hugetlb: switch HugeTLB to section-based vmemmap optimization
date:   5 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260702/202607021721.hYpm7ljY-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021721.hYpm7ljY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021721.hYpm7ljY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/bootmem_info.c:42:22: warning: variable 'ms' set but not used [-Wunused-but-set-variable]
      42 |         struct mem_section *ms;
         |                             ^
   1 warning generated.


vim +/ms +42 mm/bootmem_info.c

426e5c429d16e4 Muchun Song             2021-06-30  38  
cdcfc631c80e71 Muchun Song             2021-09-02  39  static void __init register_page_bootmem_info_section(unsigned long start_pfn)
426e5c429d16e4 Muchun Song             2021-06-30  40  {
ae751d567baa08 David Hildenbrand (Arm  2026-05-11  41) 	unsigned long section_nr;
426e5c429d16e4 Muchun Song             2021-06-30 @42  	struct mem_section *ms;
426e5c429d16e4 Muchun Song             2021-06-30  43  
7f8e592bb3271e David Hildenbrand (Arm  2026-03-20  44) 	start_pfn = SECTION_ALIGN_DOWN(start_pfn);
426e5c429d16e4 Muchun Song             2021-06-30  45  	section_nr = pfn_to_section_nr(start_pfn);
426e5c429d16e4 Muchun Song             2021-06-30  46  	ms = __nr_to_section(section_nr);
426e5c429d16e4 Muchun Song             2021-06-30  47  
7f8e592bb3271e David Hildenbrand (Arm  2026-03-20  48) 	register_page_bootmem_memmap(section_nr, pfn_to_page(start_pfn),
d65917c42373f7 Frank van der Linden    2025-02-28  49  				     PAGES_PER_SECTION);
426e5c429d16e4 Muchun Song             2021-06-30  50  }
426e5c429d16e4 Muchun Song             2021-06-30  51  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
