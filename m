Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175551370;
	Sat, 10 Aug 2024 23:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723332193; cv=none; b=CYMm4yJbe59iwfgpqmWN1phb+otkwMmwA7yLIhwQiXmIUCJuLzMNgRFKiYhY2NCyuz2f9vWRzVOQ15qOJMDXdL1yUEFdEfdpAFT2xlsh+hV6YvE7f7NpZR01V/5zu3fXAJ1OJn1JG7U5FXmyxCtx9wh0O6nJ/GpsjB7IouKpGkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723332193; c=relaxed/simple;
	bh=KTz2B6y/k7PG49CXJevEoiFHCJ2FHNjVKYZjuLE8HGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YeCmgThcWE4qqPB4u4WOMg0F7nZ5Pgwc7j9y1xa5h2FEVUroSwGNhAfLKGm6606ZjjBgoGROcCfIuxPWgLdyKv8o8onGBBRdbKtYR8KFUfSrfo3o5LpZnyOeSCRZCqznuYqd8t1FeYOcTeINIVN/Nqv8XjFrwFlyVU7pp8pJsl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PImgLvnB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PImgLvnB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723332191; x=1754868191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KTz2B6y/k7PG49CXJevEoiFHCJ2FHNjVKYZjuLE8HGs=;
  b=PImgLvnBH3bfs3cksmwcb8wNLfYC7wItD6jZr2q5o1XusgwM/YBhq2ov
   4ju+KFcYwGZ7NldGdCUkazUz3bhMEHX6aq4y6FiblzTtj71vL5/Ff+1Tl
   FLCRgZvB16R70GTDsL0OX5DJAigIDYdBvB/LgcHbb0uXrhCMjS8AibmVN
   MTv3xpfv8PKLiOfxsOXmhU8DoAwEEF+P6a8XJGGpNZkc366QcJvn+LZfy
   TT5+UTkENfz5nJ2FjsfAK7UEnyV/GMt6XI4wX+IFF4WYjPCYuZb0VcDOd
   acYaM8uCAmy0/HXvTkhc6sI2SRUxWWYUquSrbKMIBCjNR4tA9ECIY02FK
   A==;
X-CSE-ConnectionGUID: y/CldIJfTKGk7UCxImCcLA==
X-CSE-MsgGUID: YxxVlT/xTD235sZolplooA==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21646582"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="21646582"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 16:23:10 -0700
X-CSE-ConnectionGUID: 1WpuxaAETNinE8Eb+kqbnA==
X-CSE-MsgGUID: YKNKURIxSteZ8zhK/rypCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="88540574"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 10 Aug 2024 16:23:08 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scvQQ-000ANn-0w;
	Sat, 10 Aug 2024 23:23:06 +0000
Date: Sun, 11 Aug 2024 07:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kaiyang Zhao <kaiyang2@cs.cmu.edu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 216/222] mm/memory.c:5376:34: error: use of
 undeclared identifier 'NUMA_HINT_FAULTS'
Message-ID: <202408110706.DZD0TOV3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   7d7894afcca68b40bfca49f4d1303167d224919e
commit: 24f8717a5d0bedc9664cf242b14a31c18f9351a6 [216/222] mm,memcg: provide per-cgroup counters for NUMA balancing operations
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240811/202408110706.DZD0TOV3-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408110706.DZD0TOV3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408110706.DZD0TOV3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory.c:5376:34: error: use of undeclared identifier 'NUMA_HINT_FAULTS'
    5376 |         count_memcg_folio_events(folio, NUMA_HINT_FAULTS, 1);
         |                                         ^
   1 error generated.


vim +/NUMA_HINT_FAULTS +5376 mm/memory.c

  5366	
  5367	int numa_migrate_prep(struct folio *folio, struct vm_fault *vmf,
  5368			      unsigned long addr, int page_nid, int *flags)
  5369	{
  5370		struct vm_area_struct *vma = vmf->vma;
  5371	
  5372		/* Record the current PID acceesing VMA */
  5373		vma_set_access_pid_bit(vma);
  5374	
  5375		count_vm_numa_event(NUMA_HINT_FAULTS);
> 5376		count_memcg_folio_events(folio, NUMA_HINT_FAULTS, 1);
  5377		if (page_nid == numa_node_id()) {
  5378			count_vm_numa_event(NUMA_HINT_FAULTS_LOCAL);
  5379			*flags |= TNF_FAULT_LOCAL;
  5380		}
  5381	
  5382		return mpol_misplaced(folio, vmf, addr);
  5383	}
  5384	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
