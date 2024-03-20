Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634C04AEC4;
	Wed, 20 Mar 2024 15:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710946829; cv=none; b=grfjnZFq9y+SeDfXJEoUa+5sAkDw3cx0U2FweEK74p4OcyPsY9LN4In/gzJzceNju6Ozgko2bo2pHd6t3y61SJEVOdA+rdmockeapxjvvhN7T5m0gxqK9cyOFwLvT/oCWaAGE5+DL4x61+U86hG5sJJFBbSsDlAKGPPEbNL7AEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710946829; c=relaxed/simple;
	bh=t0PiITGCuSh61NoRMbdfeoe76Sm/fO+MuYu6weDxWhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m7aCu0Gb0reNPxFYXCfj5GHy4h6C024q4AxDdJTq7iX6b6uL7P3/tU5wb9CfmJJiIXrBlJXykm6t/pcpHAYGn5B5VEXlRQF4dypLR9/+LSc8dN0NcebDdQ9YvpWgk6Ni06JODwHN+Wj+q3X2NPP7sP+e3kONEZZNcen5EfgfYao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpBcHp40; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpBcHp40"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710946828; x=1742482828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t0PiITGCuSh61NoRMbdfeoe76Sm/fO+MuYu6weDxWhs=;
  b=bpBcHp40hetph5Fn5FWFtXCraIq4Vbj9e6RVb4dV7ZTHZoMLEKyw8idi
   lWG3R8oEmCXR8EkpdiorYjPiimsgi8jWl+IbdEovOOBhSPYdoyOn4VvOf
   9KjE+g8iziKvHzoizlTfQO5TBFoZcC3ixK1OSLV1voHH/N7+YSqxm7M91
   jLnJMKBU1gf3vVxpGgXA7MxGer5CPlWQzJL30lldIa9z0rGpHVwxpOd1U
   hkZ3dh99dDl0qUU/JL+OQwvlaP1nbFF9r+pNHcB0ktfUBQjGSn5W8B1wp
   aSdZWAUyG1pCE/nvwJKV7CvIoGprItF5tIhg6lfUMQ6eeI1C/wkgc0MK5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="8822515"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="8822515"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 08:00:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="51620770"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Mar 2024 08:00:13 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmxQI-000Ii3-31;
	Wed, 20 Mar 2024 15:00:10 +0000
Date: Wed, 20 Mar 2024 22:59:25 +0800
From: kernel test robot <lkp@intel.com>
To: Donet Tom <donettom@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>
Subject: [akpm-mm:mm-unstable 47/52] mm/mempolicy.c:2733: warning: Function
 parameter or struct member 'vmf' not described in 'mpol_misplaced'
Message-ID: <202403202229.WZeAnUuO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Donet,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   a824831a082f1d8f9b51a4c0598e633d38555fcf
commit: 592a4535e66c74e8027c4cd213f3fea42c0f077e [47/52] mm/mempolicy: use numa_node_id() instead of cpu_to_node()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240320/202403202229.WZeAnUuO-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403202229.WZeAnUuO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403202229.WZeAnUuO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mempolicy.c:2733: warning: Function parameter or struct member 'vmf' not described in 'mpol_misplaced'
>> mm/mempolicy.c:2733: warning: Excess function parameter 'vma' description in 'mpol_misplaced'


vim +2733 mm/mempolicy.c

63f74ca21f1fad KOSAKI Motohiro         2012-10-08  2716  
771fb4d806a92b Lee Schermerhorn        2012-10-25  2717  /**
75c70128a67311 Kefeng Wang             2023-09-21  2718   * mpol_misplaced - check whether current folio node is valid in policy
771fb4d806a92b Lee Schermerhorn        2012-10-25  2719   *
75c70128a67311 Kefeng Wang             2023-09-21  2720   * @folio: folio to be checked
75c70128a67311 Kefeng Wang             2023-09-21  2721   * @vma: vm area where folio mapped
75c70128a67311 Kefeng Wang             2023-09-21  2722   * @addr: virtual address in @vma for shared policy lookup and interleave policy
771fb4d806a92b Lee Schermerhorn        2012-10-25  2723   *
75c70128a67311 Kefeng Wang             2023-09-21  2724   * Lookup current policy node id for vma,addr and "compare to" folio's
5f076944f06988 Matthew Wilcox (Oracle  2021-04-29  2725)  * node id.  Policy determination "mimics" alloc_page_vma().
771fb4d806a92b Lee Schermerhorn        2012-10-25  2726   * Called from fault path where we know the vma and faulting address.
5f076944f06988 Matthew Wilcox (Oracle  2021-04-29  2727)  *
062db29358c9bd Baolin Wang             2021-09-02  2728   * Return: NUMA_NO_NODE if the page is in a node that is valid for this
75c70128a67311 Kefeng Wang             2023-09-21  2729   * policy, or a suitable node ID to allocate a replacement folio from.
771fb4d806a92b Lee Schermerhorn        2012-10-25  2730   */
592a4535e66c74 Donet Tom               2024-03-08  2731  int mpol_misplaced(struct folio *folio, struct vm_fault *vmf,
75c70128a67311 Kefeng Wang             2023-09-21  2732  		   unsigned long addr)
771fb4d806a92b Lee Schermerhorn        2012-10-25 @2733  {
771fb4d806a92b Lee Schermerhorn        2012-10-25  2734  	struct mempolicy *pol;
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2735  	pgoff_t ilx;
c33d6c06f60f71 Mel Gorman              2016-05-19  2736  	struct zoneref *z;
75c70128a67311 Kefeng Wang             2023-09-21  2737  	int curnid = folio_nid(folio);
592a4535e66c74 Donet Tom               2024-03-08  2738  	struct vm_area_struct *vma = vmf->vma;
90572890d20252 Peter Zijlstra          2013-10-07  2739  	int thiscpu = raw_smp_processor_id();
592a4535e66c74 Donet Tom               2024-03-08  2740  	int thisnid = numa_node_id();
98fa15f34cb379 Anshuman Khandual       2019-03-05  2741  	int polnid = NUMA_NO_NODE;
062db29358c9bd Baolin Wang             2021-09-02  2742  	int ret = NUMA_NO_NODE;
771fb4d806a92b Lee Schermerhorn        2012-10-25  2743  
592a4535e66c74 Donet Tom               2024-03-08  2744  	/*
592a4535e66c74 Donet Tom               2024-03-08  2745  	 * Make sure ptl is held so that we don't preempt and we
592a4535e66c74 Donet Tom               2024-03-08  2746  	 * have a stable smp processor id
592a4535e66c74 Donet Tom               2024-03-08  2747  	 */
592a4535e66c74 Donet Tom               2024-03-08  2748  	lockdep_assert_held(vmf->ptl);
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2749  	pol = get_vma_policy(vma, addr, folio_order(folio), &ilx);
771fb4d806a92b Lee Schermerhorn        2012-10-25  2750  	if (!(pol->flags & MPOL_F_MOF))
771fb4d806a92b Lee Schermerhorn        2012-10-25  2751  		goto out;
771fb4d806a92b Lee Schermerhorn        2012-10-25  2752  
771fb4d806a92b Lee Schermerhorn        2012-10-25  2753  	switch (pol->mode) {
771fb4d806a92b Lee Schermerhorn        2012-10-25  2754  	case MPOL_INTERLEAVE:
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2755  		polnid = interleave_nid(pol, ilx);
771fb4d806a92b Lee Schermerhorn        2012-10-25  2756  		break;
771fb4d806a92b Lee Schermerhorn        2012-10-25  2757  
fa3bea4e1f8202 Gregory Price           2024-02-02  2758  	case MPOL_WEIGHTED_INTERLEAVE:
fa3bea4e1f8202 Gregory Price           2024-02-02  2759  		polnid = weighted_interleave_nid(pol, ilx);
fa3bea4e1f8202 Gregory Price           2024-02-02  2760  		break;
fa3bea4e1f8202 Gregory Price           2024-02-02  2761  
771fb4d806a92b Lee Schermerhorn        2012-10-25  2762  	case MPOL_PREFERRED:
b27abaccf8e8b0 Dave Hansen             2021-09-02  2763  		if (node_isset(curnid, pol->nodes))
b27abaccf8e8b0 Dave Hansen             2021-09-02  2764  			goto out;
269fbe72cded0a Ben Widawsky            2021-06-30  2765  		polnid = first_node(pol->nodes);
771fb4d806a92b Lee Schermerhorn        2012-10-25  2766  		break;
771fb4d806a92b Lee Schermerhorn        2012-10-25  2767  
7858d7bca7fbbb Feng Tang               2021-06-30  2768  	case MPOL_LOCAL:
7858d7bca7fbbb Feng Tang               2021-06-30  2769  		polnid = numa_node_id();
7858d7bca7fbbb Feng Tang               2021-06-30  2770  		break;
7858d7bca7fbbb Feng Tang               2021-06-30  2771  
771fb4d806a92b Lee Schermerhorn        2012-10-25  2772  	case MPOL_BIND:
bda420b985054a Huang Ying              2021-02-24  2773  		/* Optimize placement among multiple nodes via NUMA balancing */
bda420b985054a Huang Ying              2021-02-24  2774  		if (pol->flags & MPOL_F_MORON) {
269fbe72cded0a Ben Widawsky            2021-06-30  2775  			if (node_isset(thisnid, pol->nodes))
bda420b985054a Huang Ying              2021-02-24  2776  				break;
bda420b985054a Huang Ying              2021-02-24  2777  			goto out;
bda420b985054a Huang Ying              2021-02-24  2778  		}
b27abaccf8e8b0 Dave Hansen             2021-09-02  2779  		fallthrough;
c33d6c06f60f71 Mel Gorman              2016-05-19  2780  
b27abaccf8e8b0 Dave Hansen             2021-09-02  2781  	case MPOL_PREFERRED_MANY:
771fb4d806a92b Lee Schermerhorn        2012-10-25  2782  		/*
771fb4d806a92b Lee Schermerhorn        2012-10-25  2783  		 * use current page if in policy nodemask,
771fb4d806a92b Lee Schermerhorn        2012-10-25  2784  		 * else select nearest allowed node, if any.
771fb4d806a92b Lee Schermerhorn        2012-10-25  2785  		 * If no allowed nodes, use current [!misplaced].
771fb4d806a92b Lee Schermerhorn        2012-10-25  2786  		 */
269fbe72cded0a Ben Widawsky            2021-06-30  2787  		if (node_isset(curnid, pol->nodes))
771fb4d806a92b Lee Schermerhorn        2012-10-25  2788  			goto out;
c33d6c06f60f71 Mel Gorman              2016-05-19  2789  		z = first_zones_zonelist(
592a4535e66c74 Donet Tom               2024-03-08  2790  				node_zonelist(thisnid, GFP_HIGHUSER),
771fb4d806a92b Lee Schermerhorn        2012-10-25  2791  				gfp_zone(GFP_HIGHUSER),
269fbe72cded0a Ben Widawsky            2021-06-30  2792  				&pol->nodes);
c1093b746c0576 Pavel Tatashin          2018-08-21  2793  		polnid = zone_to_nid(z->zone);
771fb4d806a92b Lee Schermerhorn        2012-10-25  2794  		break;
771fb4d806a92b Lee Schermerhorn        2012-10-25  2795  
771fb4d806a92b Lee Schermerhorn        2012-10-25  2796  	default:
771fb4d806a92b Lee Schermerhorn        2012-10-25  2797  		BUG();
771fb4d806a92b Lee Schermerhorn        2012-10-25  2798  	}
5606e3877ad8ba Mel Gorman              2012-11-02  2799  
75c70128a67311 Kefeng Wang             2023-09-21  2800  	/* Migrate the folio towards the node whose CPU is referencing it */
e42c8ff2999de1 Mel Gorman              2012-11-12  2801  	if (pol->flags & MPOL_F_MORON) {
90572890d20252 Peter Zijlstra          2013-10-07  2802  		polnid = thisnid;
5606e3877ad8ba Mel Gorman              2012-11-02  2803  
8c9ae56dc73b5a Kefeng Wang             2023-09-21  2804  		if (!should_numa_migrate_memory(current, folio, curnid,
75c70128a67311 Kefeng Wang             2023-09-21  2805  						thiscpu))
de1c9ce6f07fec Rik van Riel            2013-10-07  2806  			goto out;
de1c9ce6f07fec Rik van Riel            2013-10-07  2807  	}
e42c8ff2999de1 Mel Gorman              2012-11-12  2808  
771fb4d806a92b Lee Schermerhorn        2012-10-25  2809  	if (curnid != polnid)
771fb4d806a92b Lee Schermerhorn        2012-10-25  2810  		ret = polnid;
771fb4d806a92b Lee Schermerhorn        2012-10-25  2811  out:
771fb4d806a92b Lee Schermerhorn        2012-10-25  2812  	mpol_cond_put(pol);
771fb4d806a92b Lee Schermerhorn        2012-10-25  2813  
771fb4d806a92b Lee Schermerhorn        2012-10-25  2814  	return ret;
771fb4d806a92b Lee Schermerhorn        2012-10-25  2815  }
771fb4d806a92b Lee Schermerhorn        2012-10-25  2816  

:::::: The code at line 2733 was first introduced by commit
:::::: 771fb4d806a92bf6c988fcfbd286ae40a9374332 mm: mempolicy: Check for misplaced page

:::::: TO: Lee Schermerhorn <lee.schermerhorn@hp.com>
:::::: CC: Mel Gorman <mgorman@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
