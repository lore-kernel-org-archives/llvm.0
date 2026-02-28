Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD90175A93;
	Sat, 28 Feb 2026 20:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772309756; cv=none; b=oDEztr7HZCyCdhsZNHRhHdbNaWzTK0o7KDNL+NeH7xPx52ZWetB488B7TSaZ6mov+mLaNUJN0c4goqmkv8TEBRJI7aCaKkrqvxYBOk9iGGorfYHOWxWUegaXRdqhl2qm0VAOyByLpkyjtQyFkafo4xVfAmw6QMMnbQ6NIYN364w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772309756; c=relaxed/simple;
	bh=5bfbx1262s2r8MchzD4Pi4s59qo613AKwoiy3cpHTrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZLLFB1FG4N22bjU0hCPFMOU/r8rPNgKB3KG7h0+VBdGIEejTHVWxCCnCHsnDirImOE/iNIRn3MBi+P3NhClROkRMZr/nsrPQdU2WaVzFkuqNUkFu7IQ77wR9KfUFzvjuOYrrkFhxA8evDiHCpWgqPUWx0qboSU2XoSQEFbSPtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7/vpZBS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7/vpZBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772309754; x=1803845754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5bfbx1262s2r8MchzD4Pi4s59qo613AKwoiy3cpHTrk=;
  b=d7/vpZBSy2ohcFd+DL0NNnXgV4yusK4docNac3jiSRhZEZHyb60GLFXL
   TFhzNNzxG72mQfR5fmvfudAo2XpbboguS3LvAbqbOk7lqJN+EsHPLlNnH
   MnIFp5O74784p3B1wjEsI2l9KE+IJ8+3h9uR5tXdvq+KUcAA/8FQfdX9q
   4gqQ0B9ft/AkvNfCRSn/DGSL4F5OgqSo5Onlc7hV+hsx34tMGMP9STRHo
   TcIzS/yX+NIb6UTR1CrgzcxPlHeXtOO8ZkXmp/QBk+n81C6hy3k2z2+eo
   gA0e5yqM1y4/rAG1ylPU2iYKROyYGl4MYFM6bYh96CP+I/4Fh5HCw5tDj
   A==;
X-CSE-ConnectionGUID: 5cnxtNi6ScOdyKfnq1an0g==
X-CSE-MsgGUID: OlmJNCtiSsWJyAElyfqdAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="76977756"
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="76977756"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 12:15:53 -0800
X-CSE-ConnectionGUID: LZDtiQVkQNq5oSQJ257D8w==
X-CSE-MsgGUID: X00eL+ZyQRGdIDrOBXn0tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="216463375"
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Feb 2026 12:15:50 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwQj4-0000000009t-41HG;
	Sat, 28 Feb 2026 20:15:46 +0000
Date: Sun, 1 Mar 2026 04:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: Leno Hou <lenohou@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leno Hou <lenohou@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Barry Song <21cnbao@gmail.com>, Jialing Wang <wjl.linux@gmail.com>,
	Yafang Shao <laoar.shao@gmail.com>, Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH] mm/mglru: fix cgroup OOM during MGLRU state switching
Message-ID: <202603010435.MBtvBCTp-lkp@intel.com>
References: <20260228161008.707-1-lenohou@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228161008.707-1-lenohou@gmail.com>

Hi Leno,

kernel test robot noticed the following build errors:

[auto build test ERROR on v7.0-rc1]
[also build test ERROR on linus/master next-20260227]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leno-Hou/mm-mglru-fix-cgroup-OOM-during-MGLRU-state-switching/20260301-001148
base:   v7.0-rc1
patch link:    https://lore.kernel.org/r/20260228161008.707-1-lenohou%40gmail.com
patch subject: [PATCH] mm/mglru: fix cgroup OOM during MGLRU state switching
config: um-defconfig (https://download.01.org/0day-ci/archive/20260301/202603010435.MBtvBCTp-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603010435.MBtvBCTp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603010435.MBtvBCTp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:5785:50: error: no member named 'lrugen' in 'struct lruvec'
    5785 |         bool lrugen_enabled = smp_load_acquire(&lruvec->lrugen.enabled);
         |                                                 ~~~~~~  ^
>> mm/vmscan.c:5785:50: error: no member named 'lrugen' in 'struct lruvec'
    5785 |         bool lrugen_enabled = smp_load_acquire(&lruvec->lrugen.enabled);
         |                                                 ~~~~~~  ^
>> mm/vmscan.c:5785:50: error: no member named 'lrugen' in 'struct lruvec'
    5785 |         bool lrugen_enabled = smp_load_acquire(&lruvec->lrugen.enabled);
         |                                                 ~~~~~~  ^
>> mm/vmscan.c:5785:50: error: no member named 'lrugen' in 'struct lruvec'
    5785 |         bool lrugen_enabled = smp_load_acquire(&lruvec->lrugen.enabled);
         |                                                 ~~~~~~  ^
>> mm/vmscan.c:5785:50: error: no member named 'lrugen' in 'struct lruvec'
    5785 |         bool lrugen_enabled = smp_load_acquire(&lruvec->lrugen.enabled);
         |                                                 ~~~~~~  ^
>> mm/vmscan.c:5785:50: error: no member named 'lrugen' in 'struct lruvec'
    5785 |         bool lrugen_enabled = smp_load_acquire(&lruvec->lrugen.enabled);
         |                                                 ~~~~~~  ^
>> mm/vmscan.c:5785:50: error: no member named 'lrugen' in 'struct lruvec'
    5785 |         bool lrugen_enabled = smp_load_acquire(&lruvec->lrugen.enabled);
         |                                                 ~~~~~~  ^
>> mm/vmscan.c:5785:50: error: no member named 'lrugen' in 'struct lruvec'
    5785 |         bool lrugen_enabled = smp_load_acquire(&lruvec->lrugen.enabled);
         |                                                 ~~~~~~  ^
>> mm/vmscan.c:5785:50: error: no member named 'lrugen' in 'struct lruvec'
    5785 |         bool lrugen_enabled = smp_load_acquire(&lruvec->lrugen.enabled);
         |                                                 ~~~~~~  ^
   mm/vmscan.c:5786:48: error: no member named 'lrugen' in 'struct lruvec'
    5786 |         bool lru_draining = smp_load_acquire(&lruvec->lrugen.draining);
         |                                               ~~~~~~  ^
   mm/vmscan.c:5786:48: error: no member named 'lrugen' in 'struct lruvec'
    5786 |         bool lru_draining = smp_load_acquire(&lruvec->lrugen.draining);
         |                                               ~~~~~~  ^
   mm/vmscan.c:5786:48: error: no member named 'lrugen' in 'struct lruvec'
    5786 |         bool lru_draining = smp_load_acquire(&lruvec->lrugen.draining);
         |                                               ~~~~~~  ^
   mm/vmscan.c:5786:48: error: no member named 'lrugen' in 'struct lruvec'
    5786 |         bool lru_draining = smp_load_acquire(&lruvec->lrugen.draining);
         |                                               ~~~~~~  ^
   mm/vmscan.c:5786:48: error: no member named 'lrugen' in 'struct lruvec'
    5786 |         bool lru_draining = smp_load_acquire(&lruvec->lrugen.draining);
         |                                               ~~~~~~  ^
   mm/vmscan.c:5786:48: error: no member named 'lrugen' in 'struct lruvec'
    5786 |         bool lru_draining = smp_load_acquire(&lruvec->lrugen.draining);
         |                                               ~~~~~~  ^
   mm/vmscan.c:5786:48: error: no member named 'lrugen' in 'struct lruvec'
    5786 |         bool lru_draining = smp_load_acquire(&lruvec->lrugen.draining);
         |                                               ~~~~~~  ^
   mm/vmscan.c:5786:48: error: no member named 'lrugen' in 'struct lruvec'
    5786 |         bool lru_draining = smp_load_acquire(&lruvec->lrugen.draining);
         |                                               ~~~~~~  ^
   mm/vmscan.c:5786:48: error: no member named 'lrugen' in 'struct lruvec'
    5786 |         bool lru_draining = smp_load_acquire(&lruvec->lrugen.draining);
         |                                               ~~~~~~  ^
   mm/vmscan.c:5788:37: warning: '&&' within '||' [-Wlogical-op-parentheses]
    5788 |         if (lrugen_enabled || lru_draining && !root_reclaim(sc)) {
         |                            ~~ ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:5788:37: note: place parentheses around the '&&' expression to silence this warning
    5788 |         if (lrugen_enabled || lru_draining && !root_reclaim(sc)) {
         |                                            ^                   
         |                               (                                )
   1 warning and 18 errors generated.


vim +5785 mm/vmscan.c

  5774	
  5775	static void shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
  5776	{
  5777		unsigned long nr[NR_LRU_LISTS];
  5778		unsigned long targets[NR_LRU_LISTS];
  5779		unsigned long nr_to_scan;
  5780		enum lru_list lru;
  5781		unsigned long nr_reclaimed = 0;
  5782		unsigned long nr_to_reclaim = sc->nr_to_reclaim;
  5783		bool proportional_reclaim;
  5784		struct blk_plug plug;
> 5785		bool lrugen_enabled = smp_load_acquire(&lruvec->lrugen.enabled);
  5786		bool lru_draining = smp_load_acquire(&lruvec->lrugen.draining);
  5787	
  5788		if (lrugen_enabled || lru_draining && !root_reclaim(sc)) {
  5789			lru_gen_shrink_lruvec(lruvec, sc);
  5790	
  5791			if (!lru_draining)
  5792				return;
  5793	
  5794		}
  5795	
  5796		get_scan_count(lruvec, sc, nr);
  5797	
  5798		/* Record the original scan target for proportional adjustments later */
  5799		memcpy(targets, nr, sizeof(nr));
  5800	
  5801		/*
  5802		 * Global reclaiming within direct reclaim at DEF_PRIORITY is a normal
  5803		 * event that can occur when there is little memory pressure e.g.
  5804		 * multiple streaming readers/writers. Hence, we do not abort scanning
  5805		 * when the requested number of pages are reclaimed when scanning at
  5806		 * DEF_PRIORITY on the assumption that the fact we are direct
  5807		 * reclaiming implies that kswapd is not keeping up and it is best to
  5808		 * do a batch of work at once. For memcg reclaim one check is made to
  5809		 * abort proportional reclaim if either the file or anon lru has already
  5810		 * dropped to zero at the first pass.
  5811		 */
  5812		proportional_reclaim = (!cgroup_reclaim(sc) && !current_is_kswapd() &&
  5813					sc->priority == DEF_PRIORITY);
  5814	
  5815		blk_start_plug(&plug);
  5816		while (nr[LRU_INACTIVE_ANON] || nr[LRU_ACTIVE_FILE] ||
  5817						nr[LRU_INACTIVE_FILE]) {
  5818			unsigned long nr_anon, nr_file, percentage;
  5819			unsigned long nr_scanned;
  5820	
  5821			for_each_evictable_lru(lru) {
  5822				if (nr[lru]) {
  5823					nr_to_scan = min(nr[lru], SWAP_CLUSTER_MAX);
  5824					nr[lru] -= nr_to_scan;
  5825	
  5826					nr_reclaimed += shrink_list(lru, nr_to_scan,
  5827								    lruvec, sc);
  5828				}
  5829			}
  5830	
  5831			cond_resched();
  5832	
  5833			if (nr_reclaimed < nr_to_reclaim || proportional_reclaim)
  5834				continue;
  5835	
  5836			/*
  5837			 * For kswapd and memcg, reclaim at least the number of pages
  5838			 * requested. Ensure that the anon and file LRUs are scanned
  5839			 * proportionally what was requested by get_scan_count(). We
  5840			 * stop reclaiming one LRU and reduce the amount scanning
  5841			 * proportional to the original scan target.
  5842			 */
  5843			nr_file = nr[LRU_INACTIVE_FILE] + nr[LRU_ACTIVE_FILE];
  5844			nr_anon = nr[LRU_INACTIVE_ANON] + nr[LRU_ACTIVE_ANON];
  5845	
  5846			/*
  5847			 * It's just vindictive to attack the larger once the smaller
  5848			 * has gone to zero.  And given the way we stop scanning the
  5849			 * smaller below, this makes sure that we only make one nudge
  5850			 * towards proportionality once we've got nr_to_reclaim.
  5851			 */
  5852			if (!nr_file || !nr_anon)
  5853				break;
  5854	
  5855			if (nr_file > nr_anon) {
  5856				unsigned long scan_target = targets[LRU_INACTIVE_ANON] +
  5857							targets[LRU_ACTIVE_ANON] + 1;
  5858				lru = LRU_BASE;
  5859				percentage = nr_anon * 100 / scan_target;
  5860			} else {
  5861				unsigned long scan_target = targets[LRU_INACTIVE_FILE] +
  5862							targets[LRU_ACTIVE_FILE] + 1;
  5863				lru = LRU_FILE;
  5864				percentage = nr_file * 100 / scan_target;
  5865			}
  5866	
  5867			/* Stop scanning the smaller of the LRU */
  5868			nr[lru] = 0;
  5869			nr[lru + LRU_ACTIVE] = 0;
  5870	
  5871			/*
  5872			 * Recalculate the other LRU scan count based on its original
  5873			 * scan target and the percentage scanning already complete
  5874			 */
  5875			lru = (lru == LRU_FILE) ? LRU_BASE : LRU_FILE;
  5876			nr_scanned = targets[lru] - nr[lru];
  5877			nr[lru] = targets[lru] * (100 - percentage) / 100;
  5878			nr[lru] -= min(nr[lru], nr_scanned);
  5879	
  5880			lru += LRU_ACTIVE;
  5881			nr_scanned = targets[lru] - nr[lru];
  5882			nr[lru] = targets[lru] * (100 - percentage) / 100;
  5883			nr[lru] -= min(nr[lru], nr_scanned);
  5884		}
  5885		blk_finish_plug(&plug);
  5886		sc->nr_reclaimed += nr_reclaimed;
  5887	
  5888		/*
  5889		 * Even if we did not try to evict anon pages at all, we want to
  5890		 * rebalance the anon lru active/inactive ratio.
  5891		 */
  5892		if (can_age_anon_pages(lruvec, sc) &&
  5893		    inactive_is_low(lruvec, LRU_INACTIVE_ANON))
  5894			shrink_active_list(SWAP_CLUSTER_MAX, lruvec,
  5895					   sc, LRU_ACTIVE_ANON);
  5896	}
  5897	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
