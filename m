Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5025670825;
	Sun, 23 Feb 2025 16:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740328210; cv=none; b=DJcVjt0GoEKDH7vuH8YFTf2pOakobJIK5Uswaix8ywIRrLAidPtvvAtEuI7ymYOvhQV47NglRfHs1+R263F2AYtve/D1TKW2lsw4KsjOIoJ9C42DdFTBuEUxHhAPtWv+cB78vZMkVAwCEO2vCl0vRP21Rm57J5Y6HPJ5JZIxUUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740328210; c=relaxed/simple;
	bh=+Y/0FhJQcQb7H79QrG1GfWT+QyqFxJ6L8wblssNi1cI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aR0CTHL7vbvD1hM4cbhhBTbI6grkst01Ht20DMqcRcTJRWtKke4E2QaHSyG81Vk+WD/aARlNHe94jy4b/QUteQwnKUv2AB+KbWS9pXWum0dRhWuu3skaWtnSpDpMmbsvudk6HmKGUEsXWI9ZpiKeujcmYZRi2pJkVF9roFC2WkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+jTLU7c; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+jTLU7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740328208; x=1771864208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Y/0FhJQcQb7H79QrG1GfWT+QyqFxJ6L8wblssNi1cI=;
  b=I+jTLU7cDy5Di/BdXYoQNHBkTCI4vKiepISTV3iTGB2yPWlv/I2U/TVx
   UR60wrvoNMitDVNCbP4bLseAFhOG+E2J5MFFc/tXkUR5179nP/6phDO7q
   P7SK8eMfoi5gaSnReTR+CLCS0uBgvM6JN4zTqaZxvyJHGWT3dsfs4NpP0
   upCKJ+uBLrW8DANl4U/gGmeDtmtmBcaWr7UEusHE+pj/txBMBE9t1gYuQ
   n4G/wRjwvV/nRN/sDDu48F7ezunTweOFyXZT8F9o7NtMUsQxwbXwl5DEX
   P5QhXqxk3z7pAH6PNoMcjJGkAu89fEAFX0vU76J1sU05NQ29uj6LX/x+j
   Q==;
X-CSE-ConnectionGUID: G3eecT+YQwm3gyzf53JFMQ==
X-CSE-MsgGUID: Sko3dXdsRZutLYXa1JqM0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="58635947"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="58635947"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 08:30:06 -0800
X-CSE-ConnectionGUID: 7bfAfqnHR/+G+ed+wATm2Q==
X-CSE-MsgGUID: 5LDLmZwnSuiuRwPyQDwy+w==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116496834"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Feb 2025 08:30:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmEri-0007S9-2E;
	Sun, 23 Feb 2025 16:30:02 +0000
Date: Mon, 24 Feb 2025 00:29:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_bulk_alloc_opt_v2 1/1]
 fs/btrfs/extent_io.c:631:37: error: use of undeclared identifier 'pages'
Message-ID: <202502240053.pJMTGvUm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_bulk_alloc_opt_v2
head:   10c5db9fc7b189b222074598ce5bc9c1d8cd0ea8
commit: 10c5db9fc7b189b222074598ce5bc9c1d8cd0ea8 [1/1] mm: alloc_pages_bulk: remove assumption of populating only NULL elements
config: x86_64-buildonly-randconfig-001-20250223 (https://download.01.org/0day-ci/archive/20250224/202502240053.pJMTGvUm-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502240053.pJMTGvUm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502240053.pJMTGvUm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/btrfs/extent_io.c:5:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2224:
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
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/btrfs/extent_io.c:631:37: error: use of undeclared identifier 'pages'
     631 |         for (allocated = 0, ret = 0; ret < pages; ret++) {
         |                                            ^
>> fs/btrfs/extent_io.c:633:4: error: use of undeclared identifier 'rqstp'
     633 |                         rqstp->rq_pages[allocated] = rqstp->rq_pages[ret];
         |                         ^
   fs/btrfs/extent_io.c:633:33: error: use of undeclared identifier 'rqstp'
     633 |                         rqstp->rq_pages[allocated] = rqstp->rq_pages[ret];
         |                                                      ^
   fs/btrfs/extent_io.c:635:5: error: use of undeclared identifier 'rqstp'
     635 |                                 rqstp->rq_pages[ret] = NULL;
         |                                 ^
   3 warnings and 4 errors generated.


vim +/pages +631 fs/btrfs/extent_io.c

   609	
   610	/*
   611	 * Populate every free slot in a provided array with pages, using GFP_NOFS.
   612	 *
   613	 * @nr_pages:   number of pages to allocate
   614	 * @page_array: the array to fill with pages; any existing non-null entries in
   615	 *		the array will be skipped
   616	 * @nofail:	whether using __GFP_NOFAIL flag
   617	 *
   618	 * Return: 0        if all pages were able to be allocated;
   619	 *         -ENOMEM  otherwise, the partially allocated pages would be freed and
   620	 *                  the array slots zeroed
   621	 */
   622	int btrfs_alloc_page_array(unsigned int nr_pages, struct page **page_array,
   623				   bool nofail)
   624	{
   625		const gfp_t gfp = nofail ? (GFP_NOFS | __GFP_NOFAIL) : GFP_NOFS;
   626		unsigned int allocated, ret;
   627	
   628		/* Defragment page_array so pages can be bulk allocated into remaining
   629		 * NULL elements sequentially.
   630		 */
 > 631		for (allocated = 0, ret = 0; ret < pages; ret++) {
   632			if (page_array[ret]) {
 > 633				rqstp->rq_pages[allocated] = rqstp->rq_pages[ret];
   634				if (ret != allocated)
   635					rqstp->rq_pages[ret] = NULL;
   636	
   637				allocated++;
   638			}
   639		}
   640	
   641		while (allocated < nr_pages) {
   642			ret = alloc_pages_bulk(gfp, nr_pages - allocated,
   643					       page_array + allocated);
   644			allocated += ret;
   645			if (unlikely(!ret)) {
   646				/* No progress, fail and do cleanup. */
   647				for (int i = 0; i < allocated; i++) {
   648					__free_page(page_array[i]);
   649					page_array[i] = NULL;
   650				}
   651				return -ENOMEM;
   652			}
   653		}
   654		return 0;
   655	}
   656	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
