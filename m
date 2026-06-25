Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3957E3C1092;
	Thu, 25 Jun 2026 06:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782370284; cv=none; b=Pb8HAX0W9GXrpRum8h8b7+HHhp8V+RiD8ArL1JXo+iNDMTvMUpywEpkLFIUzfKVAx5ZflxHcSMsBXazyoM7INWydXyUlRozkHDeQ0614pjXJ7dN7nb+nnYAMhUWsF1egp2sZRcw2FCG0ZMBlCEjL7PQh7rjNHnxOJXa6ES8ubyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782370284; c=relaxed/simple;
	bh=JRevYpKLu+UkOXzSPW6dPV1skR2NA7ozHN2uxP8d7qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxycbZSUd6QM6RImwKjrdN3NL9wm3Wz+x09DOquktlZeEyfHmg2XxNcSGs/E0cCYx7Zy9Cru1eNVdG4yUpfQ1owwS1F3amXFUphP582mqpCKPncn0t0HehgKaEfoPNAXdSbBwiwnCdHVryVWcc5PzBLxPR8LtSQXAAyKYO44bcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQaOi42v; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQaOi42v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782370283; x=1813906283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JRevYpKLu+UkOXzSPW6dPV1skR2NA7ozHN2uxP8d7qI=;
  b=HQaOi42vicykHVEpaxotA8uuh1mQIumC85BcyOO0Q2cBh31USYf7KiAu
   VSAjrCpr5irpFBK5kno/mbh/NtzBlK7iJLpyHLRqfVPeewesieaKNBDK6
   pvWmITSXX6EtXdzEMTeL0sMFk3mT0A8oL+fVy56uxJOa5WIw36DcfOWSa
   dOo+iu6TCTaB/E3SHeKI92SbGjrCY4xtQVLQpGSiVfUuigzFC32OYuTiv
   iBAPsTDrbMO9f8jZk8vJ+oMOpcnQRZySb6YtwT4VYDfh9CS9y5K8kga2C
   WRRGshWQqQfPHcK/kOcD1CbeOrFBuyHTfj23QfDC1HvMKB3VjQCCbi/2e
   A==;
X-CSE-ConnectionGUID: Tpyi/pUkRuy0pilR1qlM8w==
X-CSE-MsgGUID: V1UtCHNiRHyl8HoV7ZuWaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="82260021"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="82260021"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 23:51:19 -0700
X-CSE-ConnectionGUID: e/kArBR8Q56POi4iqKA80Q==
X-CSE-MsgGUID: dzuyUAJcSp6F0URtHGgidw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="244016462"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Jun 2026 23:51:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcdvc-000000003yX-0QD6;
	Thu, 25 Jun 2026 06:51:12 +0000
Date: Thu, 25 Jun 2026 14:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Hui Zhu <zhuhui@kylinos.cn>
Subject: Re: [PATCH v4] mm: assert exclusive nid/zonenum bits at the
 page/folio access sites
Message-ID: <202606251454.M74ab4Rw-lkp@intel.com>
References: <20260625053958.918738-1-hui.zhu@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625053958.918738-1-hui.zhu@linux.dev>

Hi Hui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Zhu/mm-assert-exclusive-nid-zonenum-bits-at-the-page-folio-access-sites/20260625-134106
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260625053958.918738-1-hui.zhu%40linux.dev
patch subject: [PATCH v4] mm: assert exclusive nid/zonenum bits at the page/folio access sites
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260625/202606251454.M74ab4Rw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606251454.M74ab4Rw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606251454.M74ab4Rw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/fork.c:258:18: warning: unused variable 'page' [-Wunused-variable]
     258 |                                 struct page *page = vm_area->pages[i];
         |                                              ^~~~
   1 warning generated.


vim +/page +258 kernel/fork.c

262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  240  
449e0b4ed5a16c7 Pasha Tatashin            2025-05-09  241  static bool try_release_thread_stack_to_cache(struct vm_struct *vm_area)
e540bf3162e822d Sebastian Andrzej Siewior 2022-02-17  242  {
e540bf3162e822d Sebastian Andrzej Siewior 2022-02-17  243  	unsigned int i;
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  244  	int nid;
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  245  
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  246  	/*
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  247  	 * Don't cache stacks if any of the pages don't match the local domain, unless
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  248  	 * there is no local memory to begin with.
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  249  	 *
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  250  	 * Note that lack of local memory does not automatically mean it makes no difference
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  251  	 * performance-wise which other domain backs the stack. In this case we are merely
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  252  	 * trying to avoid constantly going to vmalloc.
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  253  	 */
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  254  	scoped_guard(preempt) {
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  255  		nid = numa_node_id();
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  256  		if (node_state(nid, N_MEMORY)) {
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  257  			for (i = 0; i < vm_area->nr_pages; i++) {
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20 @258  				struct page *page = vm_area->pages[i];
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  259  				if (page_to_nid(page) != nid)
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  260  					return false;
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  261  			}
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  262  		}
e540bf3162e822d Sebastian Andrzej Siewior 2022-02-17  263  
e540bf3162e822d Sebastian Andrzej Siewior 2022-02-17  264  		for (i = 0; i < NR_CACHED_STACKS; i++) {
47e39c793367600 Uros Bizjak               2024-05-23  265  			struct vm_struct *tmp = NULL;
47e39c793367600 Uros Bizjak               2024-05-23  266  
449e0b4ed5a16c7 Pasha Tatashin            2025-05-09  267  			if (this_cpu_try_cmpxchg(cached_stacks[i], &tmp, vm_area))
e540bf3162e822d Sebastian Andrzej Siewior 2022-02-17  268  				return true;
e540bf3162e822d Sebastian Andrzej Siewior 2022-02-17  269  		}
262ef8e55b7ccd4 Mateusz Guzik             2025-11-20  270  	}
e540bf3162e822d Sebastian Andrzej Siewior 2022-02-17  271  	return false;
e540bf3162e822d Sebastian Andrzej Siewior 2022-02-17  272  }
e540bf3162e822d Sebastian Andrzej Siewior 2022-02-17  273  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
