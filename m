Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609C41D7E30;
	Sun,  1 Dec 2024 21:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733087149; cv=none; b=VM8ll8S2JVPSCmQ0r09R8n8nCuU25A0dHUzVwDzIlxYr/+K+YcTlKDhsAONOkkesMM5w9QEc4ls09o4jB7lpcMS3fPQyWM3OHaPF4geNtm2Knv2A2CKy7G39T1qudHiBuAVvaA2HO27cHkK0Q8Te3tjFm3VhKRAQOlpeP7WeleU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733087149; c=relaxed/simple;
	bh=lGaqOCq0UyLotf80FywLXX/qI1H6W4CyJle9/4RdXXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYR7i+hQKzF5N15O0Fg10Abk63EXNqU1FUMgIVJ4COOTt6CDG24cWmlOX4tTA6AWaudCphoQzJO3QCSo4yS9ntg41Vg4koyLFCZyEyMiDPwotsUceJn60wZVQxy43o/1+cPHM5TSuXNMcqzIFGMaYqtoErcTkA59veI3RC8aQoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HqVyzOZb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HqVyzOZb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733087147; x=1764623147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lGaqOCq0UyLotf80FywLXX/qI1H6W4CyJle9/4RdXXw=;
  b=HqVyzOZbY2eExooLl8zF2elCZ+7vcBa5tr0A0dNWNTU399XQ1a1gmjmD
   KnEyIY5TagF9cstg3LoqbfJKxeBq2ZOt5gqfLUG1qMN6v0XxxxMLk7aRr
   mBSWDEeY/6xZNeXvRkWA9VcRTSa23ugCp0xS0MrUigghB8arhlfuGTgHp
   aL+EEY3hMo8dtxI4sgo7ASZdxO8caOLmJnTZMgeeOg+Rl/+juFeNe+EsY
   CQN4MB4aENQ0NfSO/bNNua3toGLRFrWk9WUTeQ3eIEt9oKl8usU0M5tK0
   45BUV4CpbmS6L4JPlmnGCzHP1yDOBYwdc6UkHfyXfQOTOcB3/F8gdRa1u
   g==;
X-CSE-ConnectionGUID: bKGPVoDqT5uprJfCdACYTw==
X-CSE-MsgGUID: JA9XoaykRNmPXFR0QLGoMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="43730981"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="43730981"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 13:05:45 -0800
X-CSE-ConnectionGUID: giqLi05CSd2KTcIc0zov4A==
X-CSE-MsgGUID: oed2xUWoSV+YLjEl8pNVUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="93403079"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Dec 2024 13:05:43 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHr8P-0001qP-18;
	Sun, 01 Dec 2024 21:05:41 +0000
Date: Mon, 2 Dec 2024 05:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: Raghavendra K T <raghavendra.kt@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH V0 03/10] mm: Scan the mm and create a migration list
Message-ID: <202412020401.kTXL2n6L-lkp@intel.com>
References: <20241201153818.2633616-4-raghavendra.kt@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241201153818.2633616-4-raghavendra.kt@amd.com>

Hi Raghavendra,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a]

url:    https://github.com/intel-lab-lkp/linux/commits/Raghavendra-K-T/mm-Add-kmmscand-kernel-daemon/20241201-234153
base:   bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a
patch link:    https://lore.kernel.org/r/20241201153818.2633616-4-raghavendra.kt%40amd.com
patch subject: [RFC PATCH V0 03/10] mm: Scan the mm and create a migration list
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241202/202412020401.kTXL2n6L-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020401.kTXL2n6L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020401.kTXL2n6L-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/kmmscand.c:2:
   In file included from include/linux/mm.h:2223:
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
   In file included from mm/kmmscand.c:14:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/kmmscand.c:159:36: error: use of undeclared identifier 'vma'
     159 |         VM_BUG_ON_VMA(address == -EFAULT, vma);
         |                                           ^
   6 warnings and 1 error generated.


vim +/vma +159 mm/kmmscand.c

   145	
   146	static void page_idle_clear_pte_refs(struct page *page, pte_t *pte, struct mm_walk *walk)
   147	{
   148		bool need_lock;
   149		struct folio *folio =  page_folio(page);
   150		unsigned long address;
   151	
   152		if (!folio_mapped(folio) || !folio_raw_mapping(folio))
   153			return;
   154	
   155		need_lock = !folio_test_anon(folio) || folio_test_ksm(folio);
   156		if (need_lock && !folio_trylock(folio))
   157			return;
   158		address = vma_address(walk->vma, page_pgoff(folio, page), compound_nr(page));
 > 159		VM_BUG_ON_VMA(address == -EFAULT, vma);
   160		folio_idle_clear_pte_refs_one(folio, walk->vma, address, pte);
   161	
   162		if (need_lock)
   163			folio_unlock(folio);
   164	}
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
