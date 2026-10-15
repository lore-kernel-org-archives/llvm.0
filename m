Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3084E3D34B9;
	Thu, 15 Oct 2026 05:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792040875; cv=none; b=rITEm6HecF7M59FF/1Gwlk6gVtu8Tc7YaxBATEjXOeAbOBpayWP26xhuWVnR3QMbCMw99L9n8oamRc9mAlAl2yu7e97e9R/g+EaaV+mEhX4yg5tSNf0uYfAnEX2xgAeIcIjgEPB+7VdUbZHyhaWnGC3cqWjMZpdvvXKEdeW1yc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792040875; c=relaxed/simple;
	bh=GDkcSrZZLMPZxLwziNM3jSo8wJh7MM3T+70vE87ZBL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qookt6YkTZO3JvHkl1+HBJcQhcUDpENE3cT2xOisNpX0OGIcdrjjVjZEu9fhS+rjk5VlL/EeZxso2jqqnkExzgtyPgVx0lQ6Rrvf7Dg0isS/y7TP2jeDqcIkqreVPlkIOp+Rv6CD1gEOyFgfbMRVw26EJ5m3yQmvs+3OAVp2hNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=am4aUj5q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="am4aUj5q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792040874; x=1823576874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GDkcSrZZLMPZxLwziNM3jSo8wJh7MM3T+70vE87ZBL4=;
  b=am4aUj5qQ/aoNRJuI1WYedujcGgZX3k2Q6QXDHwC7TSvC8sawe5txxeA
   oRC17zL5ctV3yOb6WGAHHB9/nHEQKJ+xU2guimt7CD+i+nmZvlL2LCamz
   kDXzDEZ+hpIu0HtCkTa0wWZWgz/4ZheyjNhE71BsoTop2j57yyf01GEpX
   Y1rCbKX/laEtPTC1bv+t0kpZ60m1cvYNdVybhpICdU/+mmF08wdrT0FA3
   keo6VIvawDvLn4+lqNh51FiUrOVlcYwIEJE4aXmaph3YvOHDr00zCXKv3
   sf8NZ0B4hZlBFSIpiKso0iWBIsWCDuTWzaAime0gyH2/C15fD/YbgBs/P
   w==;
X-CSE-ConnectionGUID: zqMRPzbRQVC1dE4WTjkhQw==
X-CSE-MsgGUID: NbBb8B+LS+OLbF9C1+bK5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="705777"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="705777"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 22:07:53 -0700
X-CSE-ConnectionGUID: vWmQz1fcQdOEqrNQm9ZkVw==
X-CSE-MsgGUID: pi78vQZ4TPmTkOcNhE/Opw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="3360663"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 14 Oct 2026 22:07:47 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHDgu-00000000FqN-09LI;
	Thu, 15 Oct 2026 05:07:44 +0000
Date: Thu, 15 Oct 2026 13:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: Li Zhe <lizhe.67@bytedance.com>, akpm@linux-foundation.org,
	david@kernel.org, ljs@kernel.org, gourry@gourry.net,
	joshua.hahnjy@gmail.com, ziy@nvidia.com, mingo@redhat.com,
	peterz@infradead.org, mgorman@suse.de, riel@redhat.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	vschneid@redhat.com, kprateek.nayak@amd.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Li Zhe <lizhe.67@bytedance.com>
Subject: Re: [PATCH 5/6] sched/numa: do not feed tiering promotions into task
 placement stats
Message-ID: <202610151319.1QoCU2Pd-lkp@intel.com>
References: <20261014094347.99157-6-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014094347.99157-6-lizhe.67@bytedance.com>

Hi Li,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on akpm-mm/mm-everything peterz-queue/sched/core linus/master v7.3-rc7 next-20261012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Zhe/sched-numa-clear-fault-locality-state-on-execve/20261014-174342
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20261014094347.99157-6-lizhe.67%40bytedance.com
patch subject: [PATCH 5/6] sched/numa: do not feed tiering promotions into task placement stats
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20261015/202610151319.1QoCU2Pd-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610151319.1QoCU2Pd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610151319.1QoCU2Pd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory.c:6176:18: error: use of undeclared identifier 'LAST_CPUPID_ACCESS_TIME'
    6176 |                 *last_cpupid = LAST_CPUPID_ACCESS_TIME;
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/LAST_CPUPID_ACCESS_TIME +6176 mm/memory.c

  6147	
  6148	int numa_migrate_check(struct folio *folio, struct vm_fault *vmf,
  6149			      unsigned long addr, int *flags,
  6150			      bool writable, int *last_cpupid)
  6151	{
  6152		struct vm_area_struct *vma = vmf->vma;
  6153	
  6154		/*
  6155		 * Avoid grouping on RO pages in general. RO pages shouldn't hurt as
  6156		 * much anyway since they can be in shared cache state. This misses
  6157		 * the case where a mapping is writable but the process never writes
  6158		 * to it but pte_write gets cleared during protection updates and
  6159		 * pte_dirty has unpredictable behaviour between PTE scan updates,
  6160		 * background writeback, dirty balancing and application behaviour.
  6161		 */
  6162		if (!writable)
  6163			*flags |= TNF_NO_GROUP;
  6164	
  6165		/*
  6166		 * Flag if the folio is shared between multiple address spaces. This
  6167		 * is later used when determining whether to group tasks together
  6168		 */
  6169		if (folio_maybe_mapped_shared(folio) && (vma->vm_flags & VM_SHARED))
  6170			*flags |= TNF_SHARED;
  6171		/*
  6172		 * For memory tiering mode, cpupid of slow memory page is used
  6173		 * to record page access time.  So use default value.
  6174		 */
  6175		if (folio_use_access_time(folio))
> 6176			*last_cpupid = LAST_CPUPID_ACCESS_TIME;
  6177		else
  6178			*last_cpupid = folio_last_cpupid(folio);
  6179	
  6180		/* Record the current PID accessing VMA */
  6181		vma_set_access_pid_bit(vma);
  6182	
  6183		count_vm_numa_event(NUMA_HINT_FAULTS);
  6184	#ifdef CONFIG_NUMA_BALANCING
  6185		count_memcg_folio_events(folio, NUMA_HINT_FAULTS, 1);
  6186	#endif
  6187		if (folio_nid(folio) == numa_node_id()) {
  6188			count_vm_numa_event(NUMA_HINT_FAULTS_LOCAL);
  6189			*flags |= TNF_FAULT_LOCAL;
  6190		}
  6191	
  6192		return mpol_misplaced(folio, vmf, addr);
  6193	}
  6194	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
