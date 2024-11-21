Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7997080A;
	Thu, 21 Nov 2024 02:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732155197; cv=none; b=jS9ouv0/1W/13AdsGWRCempsGc468YmEFHVHGQ/MpT1hMnlKKPoQWcyjHHvJKSz7hPdFoZsF8GkbkQb3uRiInB4XFjPKPwUegMfgVdyX4/kTrQfiaU+qenRnfY1Kye0f47bMTm1qJHehY/nVPdOb8WyCO6nF6LEkWpXvLMrabeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732155197; c=relaxed/simple;
	bh=KcBF1Jr/ez1bhiqSUbKF2XhKb/yJSguKB4HnvUtOFh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TS/VgRn9LoZ8Mc3nxbxuPmNuvPg73T/RLhZkfIelzGSaFjeiVbFdHevs2yFABqB7JAMBsf6+zZ8jiIrAt5KyslmixsCmoDLeyc9XkSDNzYP0dptX63YdL3PJWe6tmT4vzD67yNNr6DpXp6txqCe0vCVqSE9EGasL0y/92u6+c3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SIMFcPEl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIMFcPEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732155196; x=1763691196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KcBF1Jr/ez1bhiqSUbKF2XhKb/yJSguKB4HnvUtOFh0=;
  b=SIMFcPElPyfclJsCQA2At5aTCu3C6oV9gyc+SJJTmaDxd7IgpMBeZiry
   Yp8u+TUzX2GJp9VAqGYjgxb6QfRtTNbDJFw6TUikSy01oxi8ZMbT4vylS
   Kw30s8qBX5Xqtw0hwk5Q81tPaZGCvWFKT7F4hMxuhqE1d52/QMR7JamLg
   xFZGUYORUXEp+xhySPPQ2es8sItKbx6AIv41Buopgz2Y8v8tGAJrijIGj
   WxpU3nnBOir3A0f4iwVqFG6aSXRv4R13dwyAq+BSejJmaGsPyIc0haO1V
   t5XrYgBmNsoIMB25QAZWNI/L/Tut7JtudyfsEXH+/Tg4AB29k+BR1JFSg
   Q==;
X-CSE-ConnectionGUID: ynzzHob4Ry2icu44ih+QLA==
X-CSE-MsgGUID: uVFIUnQaSIW8IKp3opawQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32099885"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="32099885"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 18:13:15 -0800
X-CSE-ConnectionGUID: P2dn31XlTYquTO91E7i5cQ==
X-CSE-MsgGUID: cORhwNVsQf2nS5/t5jsvxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="90063135"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Nov 2024 18:13:13 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDwgw-0001QE-29;
	Thu, 21 Nov 2024 02:13:10 +0000
Date: Thu, 21 Nov 2024 10:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_pagecache 3/4] mm/memory.c:5450:20: error: use
 of undeclared identifier 'NUMA_HINT_FAULTS'
Message-ID: <202411211042.18o8eGXe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_pagecache
head:   22a918e8984faca048ec24295ed20e91b682a03e
commit: 425aa488c12121665243fbb89d75a0f6312fa28a [3/4] vmstat: add page-cache numa hints
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241121/202411211042.18o8eGXe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411211042.18o8eGXe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411211042.18o8eGXe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:44:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/memory.c:45:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/memory.c:5450:20: error: use of undeclared identifier 'NUMA_HINT_FAULTS'
    5450 |         int event = vmf ? NUMA_HINT_FAULTS : NUMA_HINT_PAGE_CACHE;
         |                           ^
>> mm/memory.c:5450:39: error: use of undeclared identifier 'NUMA_HINT_PAGE_CACHE'
    5450 |         int event = vmf ? NUMA_HINT_FAULTS : NUMA_HINT_PAGE_CACHE;
         |                                              ^
   6 warnings and 2 errors generated.


vim +/NUMA_HINT_FAULTS +5450 mm/memory.c

  5445	
  5446	int numa_migrate_check(struct folio *folio, struct vm_fault *vmf,
  5447			      unsigned long addr, int *flags,
  5448			      bool writable, int *last_cpupid)
  5449	{
> 5450		int event = vmf ? NUMA_HINT_FAULTS : NUMA_HINT_PAGE_CACHE;
  5451	
  5452		if (vmf) {
  5453			struct vm_area_struct *vma = vmf->vma;
  5454			const vm_flags_t vmflags = vma->vm_flags;
  5455	
  5456			/*
  5457			 * Flag if the folio is shared between multiple address spaces.
  5458			 * This used later when determining whether to group tasks.
  5459			 */
  5460			if (folio_likely_mapped_shared(folio))
  5461				*flags |= vmflags & VM_SHARED ? TNF_SHARED : 0;
  5462	
  5463			/* Record the current PID acceesing VMA */
  5464			vma_set_access_pid_bit(vma);
  5465		}
  5466	
  5467		/*
  5468		 * Avoid grouping on RO pages in general. RO pages shouldn't hurt as
  5469		 * much anyway since they can be in shared cache state. This misses
  5470		 * the case where a mapping is writable but the process never writes
  5471		 * to it but pte_write gets cleared during protection updates and
  5472		 * pte_dirty has unpredictable behaviour between PTE scan updates,
  5473		 * background writeback, dirty balancing and application behaviour.
  5474		 */
  5475		if (!writable)
  5476			*flags |= TNF_NO_GROUP;
  5477	
  5478		/*
  5479		 * For memory tiering mode, cpupid of slow memory page is used
  5480		 * to record page access time.  So use default value.
  5481		 */
  5482		if (folio_use_access_time(folio))
  5483			*last_cpupid = (-1 & LAST_CPUPID_MASK);
  5484		else
  5485			*last_cpupid = folio_last_cpupid(folio);
  5486	
  5487		numa_migrate_hint_event(folio, event, flags);
  5488	
  5489		return mpol_misplaced(folio, vmf, addr);
  5490	}
  5491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
