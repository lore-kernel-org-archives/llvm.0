Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B12A38D3F3;
	Fri, 29 May 2026 06:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780037390; cv=none; b=B1L7Wfei+d42soWSpGvFtv40Z6B3fgFn61t+x/kWlZkI3E/t6v8TYgg4+KLR9GmYDGv66t+AjGx+Sfh44pBrzZFs9YlRHLiD9k0HriZrZJwo3gRgeAwjfl7+kx7oL9yQL32+ZoLK6J8m2sPgDFAiD9ILUa0T8vFBF+R/gHLnWKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780037390; c=relaxed/simple;
	bh=4xx0DbleGfoyvUuQjW3FtKSISI+UIEl20NwmXWATzKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uB/3rkY7IdDlhaqKekWf+8a2vEt9QfEMpKNZFGgxX2Vxmmk+wJMgJ43zSWgbGOR/iwqgE+7IuSj5PL6bXVzdSdnu3bYQCg2izIuVWb888+EGN+YjeELX4kQT53j4mohKShU5pBnGpUo2bZ+8VsUWYBpftbLlZHTimHb8IqbaYpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5xBSmaO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5xBSmaO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780037389; x=1811573389;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4xx0DbleGfoyvUuQjW3FtKSISI+UIEl20NwmXWATzKo=;
  b=M5xBSmaO7d4dAhUBvgWdnjozGAVjMs68rqp97A7sfnuycmSpMDCivB3x
   QTPsZ5RUfVkMbMHCLAQ3tWvg5bY2Jv0x3+oQnsz0m6S/McaPuLwDxkpjq
   xJdh8/LhcsaMm5nIFcBIy3UbpOheyBwh7zoqQgHB4/JQbwGPrhk26RY7/
   lyR8SwhSuaaPYk15XTfuV/Cfeq8PpnLb+scyEP8uZMgX7UT+p0fLC9Ryz
   5kx+9xFY3oKWk4Hlzn9j3kpyDuGDOmDjjBTxbPrl2a50Zam8HUVh7upi8
   XtVUfGI2tVDt092QA5rjInPBqfIMBV/0cbVG4SMQ5rVFJn0Y3uxw+lfKg
   A==;
X-CSE-ConnectionGUID: NFBuVmbJR9un96fRYZwdqA==
X-CSE-MsgGUID: 9qVvovcURdGCIUfD/+QfSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80857836"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80857836"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 23:49:49 -0700
X-CSE-ConnectionGUID: 5ftVuP7NR5aF2glJOos2Bg==
X-CSE-MsgGUID: w0iBaxAxSIeYrez9/ZMeqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="238373530"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 May 2026 23:49:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSr2O-000000006rS-1Rn7;
	Fri, 29 May 2026 06:49:44 +0000
Date: Fri, 29 May 2026 14:48:52 +0800
From: kernel test robot <lkp@intel.com>
To: liuqiqi@kylinos.cn, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, ying.huang@linux.alibaba.com,
	Qiqi Liu <liuqiqi@kylinos.cn>
Subject: Re: [PATCH 1/1] mm/memory-tier: add node_tier_id as stable tier
 identifier
Message-ID: <202605291449.2jXZbqUJ-lkp@intel.com>
References: <20260528134212.240492-2-liuqiqi@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528134212.240492-2-liuqiqi@kylinos.cn>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on rppt-memblock/for-next rppt-memblock/fixes linus/master v7.1-rc5 next-20260528]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/liuqiqi-kylinos-cn/mm-memory-tier-add-node_tier_id-as-stable-tier-identifier/20260528-214338
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260528134212.240492-2-liuqiqi%40kylinos.cn
patch subject: [PATCH 1/1] mm/memory-tier: add node_tier_id as stable tier identifier
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260529/202605291449.2jXZbqUJ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291449.2jXZbqUJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291449.2jXZbqUJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mm_init.c:1713:9: error: no member named 'node_tier_id' in 'struct pglist_data'
    1713 |         pgdat->node_tier_id = -1;
         |         ~~~~~  ^
   1 error generated.


vim +1713 mm/mm_init.c

  1698	
  1699	static void __init free_area_init_node(int nid)
  1700	{
  1701		pg_data_t *pgdat = NODE_DATA(nid);
  1702		unsigned long start_pfn = 0;
  1703		unsigned long end_pfn = 0;
  1704	
  1705		/* pg_data_t should be reset to zero when it's allocated */
  1706		WARN_ON(pgdat->nr_zones || pgdat->kswapd_highest_zoneidx);
  1707	
  1708		get_pfn_range_for_nid(nid, &start_pfn, &end_pfn);
  1709	
  1710		pgdat->node_id = nid;
  1711		pgdat->node_start_pfn = start_pfn;
  1712		pgdat->per_cpu_nodestats = NULL;
> 1713		pgdat->node_tier_id = -1;
  1714	
  1715		if (start_pfn != end_pfn) {
  1716			pr_info("Initmem setup node %d [mem %#018Lx-%#018Lx]\n", nid,
  1717				(u64)start_pfn << PAGE_SHIFT,
  1718				end_pfn ? ((u64)end_pfn << PAGE_SHIFT) - 1 : 0);
  1719	
  1720			calculate_node_totalpages(pgdat, start_pfn, end_pfn);
  1721		} else {
  1722			pr_info("Initmem setup node %d as memoryless\n", nid);
  1723	
  1724			reset_memoryless_node_totalpages(pgdat);
  1725		}
  1726	
  1727		alloc_node_mem_map(pgdat);
  1728		pgdat_set_deferred_range(pgdat);
  1729	
  1730		free_area_init_core(pgdat);
  1731		lru_gen_init_pgdat(pgdat);
  1732	}
  1733	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
