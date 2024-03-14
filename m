Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD87DDD9;
	Thu, 14 Mar 2024 15:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429046; cv=none; b=ImPy70bOtxhzU8G3IiORpLYdtOszNFLG6cI4aGoHJ8GgZXugMgRpbjmehqm3kFrW1LzKPuOjpqLBogVNvWgmXm5fwEQFxWq+HeokbFa9Po1wtP20wu3/i+47yz5RduG0RPkqgiVD5vGMNMhgSacsaUWz6qdRXa+f4oVyctFsu0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429046; c=relaxed/simple;
	bh=FCe+y7lWSmXeIQgAPTpNsUa5v/iA53Gn2A1M8zxt1tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXnoyzqxv1iKPkcsBdpOGrOBO7RaN/QD/w5h52Rj1tLTMRGDVpPc0unbp7fQMVPcaFTr+5I0Al1/5hvPMbsuII6nrHzwTM4UBaEaFuO1XAlj2ZVKkmpkOq84Kq9KWIGYgYS7rNsHAxJjBqQpObC4ev/Ns4jEayVHhkoB3kEIKQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lRHoiuWK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRHoiuWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710429044; x=1741965044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FCe+y7lWSmXeIQgAPTpNsUa5v/iA53Gn2A1M8zxt1tI=;
  b=lRHoiuWKKqOuODbWIS8e16/hs+7Z2sNQT1RcGvbN9BX4UGYtIQ02gTpR
   9EvudFqV7KGfKcD50dcbXmbo6Tes6gpBJws5b+1ciy1IHW/D3Z8iLp189
   yGGs9iMFrksHMDEhwbez1MivKONd4fh/X5A728jjJXq8mnArEwcjJZPOL
   tJOi8HNyy2I0G43G1Q9kalQ+gVqknitHOowHuHn/JWURKWDusw+HJWKo6
   5+bDe/e4JqbcelhOlCIS/SwYBO3Q88BlRdtqmddaodMKXGcZZoqKWOXhD
   g4fxzD7RrxO/ZiYUtIgMe47Y80X4q+u2ehh9hoLF5MfgwlOJ0uqwgqdp6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5121187"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5121187"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 08:10:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="35444465"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Mar 2024 08:10:32 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkmj0-000DWr-0o;
	Thu, 14 Mar 2024 15:10:30 +0000
Date: Thu, 14 Mar 2024 23:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] pseries/iommu: Enable DDW for VFIO TCE create
Message-ID: <202403142228.8FfmsLis-lkp@intel.com>
References: <171026728072.8367.13581504605624115205.stgit@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171026728072.8367.13581504605624115205.stgit@linux.ibm.com>

Hi Shivaprasad,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.8]
[also build test WARNING on linus/master next-20240314]
[cannot apply to powerpc/next powerpc/fixes awilliam-vfio/next awilliam-vfio/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shivaprasad-G-Bhat/powerpc-pseries-iommu-Bring-back-userspace-view-for-single-level-TCE-tables/20240313-022030
base:   v6.8
patch link:    https://lore.kernel.org/r/171026728072.8367.13581504605624115205.stgit%40linux.ibm.com
patch subject: [RFC PATCH 3/3] pseries/iommu: Enable DDW for VFIO TCE create
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240314/202403142228.8FfmsLis-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403142228.8FfmsLis-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403142228.8FfmsLis-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/platforms/pseries/iommu.c:16:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/platforms/pseries/iommu.c:1971:20: warning: variable 'pdn' is uninitialized when used here [-Wuninitialized]
    1971 |                 if (fpdn->pdn == pdn) {
         |                                  ^~~
   arch/powerpc/platforms/pseries/iommu.c:1937:60: note: initialize the variable 'pdn' to silence this warning
    1937 |         struct device_node *dn = pci_device_to_OF_node(pdev), *pdn;
         |                                                                   ^
         |                                                                    = NULL
   6 warnings generated.


vim +/pdn +1971 arch/powerpc/platforms/pseries/iommu.c

  1931	
  1932	static long spapr_tce_create_table(struct iommu_table_group *table_group, int num,
  1933					   __u32 page_shift, __u64 window_size, __u32 levels,
  1934					   struct iommu_table **ptbl)
  1935	{
  1936		struct pci_dev *pdev = iommu_group_get_first_pci_dev(table_group->group);
  1937		struct device_node *dn = pci_device_to_OF_node(pdev), *pdn;
  1938		struct iommu_table *tbl = table_group->tables[num];
  1939		u32 window_shift = order_base_2(window_size);
  1940		u32 ddw_avail[DDW_APPLICABLE_SIZE];
  1941		struct ddw_create_response create;
  1942		struct ddw_query_response query;
  1943		unsigned long start = 0, end = 0;
  1944		struct failed_ddw_pdn *fpdn;
  1945		struct dma_win *window;
  1946		struct property *win64;
  1947		struct pci_dn *pci;
  1948		int len, ret = 0;
  1949		u64 win_addr;
  1950	
  1951		if (num > 1)
  1952			return -EPERM;
  1953	
  1954		if (tbl && (tbl->it_page_shift == page_shift) &&
  1955			(tbl->it_size == (window_size >> page_shift)) &&
  1956			(tbl->it_indirect_levels == levels - 1))
  1957			goto exit;
  1958	
  1959		if (num == 0)
  1960			return -EINVAL; /* Can't modify the default window. */
  1961	
  1962		/* TODO: The SRIO-VFs have only 1 window. */
  1963		if (table_group->max_dynamic_windows_supported == 1)
  1964			return -EPERM;
  1965	
  1966		mutex_lock(&dma_win_init_mutex);
  1967	
  1968		ret = -ENODEV;
  1969		/* If the enable DDW failed for the pdn, dont retry! */
  1970		list_for_each_entry(fpdn, &failed_ddw_pdn_list, list) {
> 1971			if (fpdn->pdn == pdn) {
  1972				pr_err("%s: %pOF in failed DDW device list\n", __func__, pdn);
  1973				goto out_unlock;
  1974			}
  1975		}
  1976	
  1977		pdn = pci_dma_find(dn, NULL);
  1978		if (!pdn || !PCI_DN(pdn)) { /* Niether of 32s|64-bit exist! */
  1979			pr_err("%s: No dma-windows exist for the node %pOF\n", __func__, pdn);
  1980			goto out_failed;
  1981		}
  1982	
  1983		/* The existing ddw didn't match the size/shift */
  1984		if (remove_dynamic_dma_windows_locked(table_group, pdev)) {
  1985			pr_err("%s: The existing DDW remova failed for node %pOF\n", __func__, pdn);
  1986			goto out_failed; /* Could not remove it either! */
  1987		}
  1988	
  1989		pci = PCI_DN(pdn);
  1990		ret = of_property_read_u32_array(pdn, "ibm,ddw-applicable",
  1991					&ddw_avail[0], DDW_APPLICABLE_SIZE);
  1992		if (ret) {
  1993			pr_err("%s: ibm,ddw-applicable not found\n", __func__);
  1994			goto out_failed;
  1995		}
  1996	
  1997		ret = query_ddw(pdev, ddw_avail, &query, pdn);
  1998		if (ret)
  1999			goto out_failed;
  2000		ret = -ENODEV;
  2001	
  2002		len = window_shift;
  2003		if (query.largest_available_block < (1ULL << (len - page_shift))) {
  2004			dev_dbg(&pdev->dev, "can't map window 0x%llx with %llu %llu-sized pages\n",
  2005					1ULL << len, query.largest_available_block,
  2006					1ULL << page_shift);
  2007			ret = -EINVAL; /* Retry with smaller window size */
  2008			goto out_unlock;
  2009		}
  2010	
  2011		if (create_ddw(pdev, ddw_avail, &create, page_shift, len))
  2012			goto out_failed;
  2013	
  2014		win_addr = ((u64)create.addr_hi << 32) | create.addr_lo;
  2015		win64 = ddw_property_create(DMA64_PROPNAME, create.liobn, win_addr, page_shift, len);
  2016		if (!win64)
  2017			goto remove_window;
  2018	
  2019		ret = of_add_property(pdn, win64);
  2020		if (ret) {
  2021			dev_err(&pdev->dev, "unable to add DMA window property for %pOF: %d",
  2022				pdn, ret);
  2023			goto free_property;
  2024		}
  2025		ret = -ENODEV;
  2026	
  2027		window = ddw_list_new_entry(pdn, win64->value);
  2028		if (!window)
  2029			goto remove_property;
  2030	
  2031		window->direct = false;
  2032	
  2033		if (tbl) {
  2034			iommu_table_reset(tbl, pci->phb->bus->number, create.liobn, win_addr,
  2035					  1UL << len, page_shift, NULL, &iommu_table_lpar_multi_ops);
  2036		} else {
  2037			tbl = iommu_pseries_alloc_table(pci->phb->node);
  2038			if (!tbl) {
  2039				dev_err(&pdev->dev, "couldn't create new IOMMU table\n");
  2040				goto free_window;
  2041			}
  2042			iommu_table_setparms_common(tbl, pci->phb->bus->number, create.liobn, win_addr,
  2043						    1UL << len, page_shift, NULL,
  2044						    &iommu_table_lpar_multi_ops);
  2045			iommu_init_table(tbl, pci->phb->node, start, end);
  2046		}
  2047	
  2048		tbl->reset_ddw = true;
  2049		pci->table_group->tables[1] = tbl;
  2050		set_iommu_table_base(&pdev->dev, tbl);
  2051		pdev->dev.archdata.dma_offset = win_addr;
  2052	
  2053		spin_lock(&dma_win_list_lock);
  2054		list_add(&window->list, &dma_win_list);
  2055		spin_unlock(&dma_win_list_lock);
  2056	
  2057		mutex_unlock(&dma_win_init_mutex);
  2058	
  2059		goto exit;
  2060	
  2061	free_window:
  2062		kfree(window);
  2063	remove_property:
  2064		of_remove_property(pdn, win64);
  2065	free_property:
  2066		kfree(win64->name);
  2067		kfree(win64->value);
  2068		kfree(win64);
  2069	remove_window:
  2070		__remove_dma_window(pdn, ddw_avail, create.liobn);
  2071	
  2072	out_failed:
  2073		fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
  2074		if (!fpdn)
  2075			goto out_unlock;
  2076		fpdn->pdn = pdn;
  2077		list_add(&fpdn->list, &failed_ddw_pdn_list);
  2078	
  2079	out_unlock:
  2080		mutex_unlock(&dma_win_init_mutex);
  2081	
  2082		return ret;
  2083	exit:
  2084		*ptbl = iommu_tce_table_get(tbl);
  2085		return 0;
  2086	}
  2087	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
