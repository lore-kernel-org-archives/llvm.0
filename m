Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B9F2D8380;
	Sat, 16 Aug 2025 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755342914; cv=none; b=ct3XylHRkLCnvjKYDIENZG5u0i67ElGG1tioEUYwWDrb2jmeS1/xQpcn4JitNBT3Bg2m7XI6dbVwdesohpB7XrM+s6ArE3fV4ZtYMTY1FAgkG3TWj9P9JqmxLQHRpPPLwg4UKcpAdKhyP7E9ny0f53KAO8hT54i4lOg6m/6DPzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755342914; c=relaxed/simple;
	bh=U5CMim5LoB8qmWk4X0T7bjQMuIKbXieIyZQ7MFtUErc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSKdbEAcdT0jRLsmm/sM6+QyV0H/UpKrEy5HBLtF+79D3n0Ynpr2SVk2bNGWg/Wiah3qPxoAkP+QjzdDifgPiHgTzURHaQGTaPdZntquxfPb70wYYAWtgBjfjE5++GznLDcCOiKQqeCgD9/WCtmMC1DoaSPzUVtuFTJ7xh8y87w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJW0aZSG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJW0aZSG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755342913; x=1786878913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U5CMim5LoB8qmWk4X0T7bjQMuIKbXieIyZQ7MFtUErc=;
  b=mJW0aZSGgNAuyjQPsTPo6/Uz4Fmd2RBWu+xnIvC4iBk7THJFhAH3KTZM
   P7TfmlSsOvdgUbKjzeZbtB5E8oc1iX0paSONOoLsbJvZ3rcUI8/uKUHM+
   2oYvfnDq2xY5NwBu7lFsOkGXQtfTyfDLbWRHtJflfEXf8g35LuwNp7f7U
   jxWjXNOqLGs57Kb8pYcgNjDFiko5eRkPvFLzlEeLw1IYs1v2DTWvsh7kK
   p9Mx9VEH38bpCUHnMVtTBLgmJt4peugd9JA4dqNiYS62RZyKAcGH3oRJm
   Q1Wtzrs6tXRGST3y/Fc4M/LrzIYb/yfWangujGE2fLZWc82+2+fB3Lx/v
   w==;
X-CSE-ConnectionGUID: ZrAfcLonSZquS7mKDf3oeA==
X-CSE-MsgGUID: 0Yqh5zslQvSBelpCMuQpcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57596899"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57596899"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 04:15:11 -0700
X-CSE-ConnectionGUID: lvQbGZwcReCUi2yFPMYLdg==
X-CSE-MsgGUID: eaSEQoDbT4WyfMxK5AqcRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167112212"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 16 Aug 2025 04:15:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unEsN-000CqA-1I;
	Sat, 16 Aug 2025 11:15:07 +0000
Date: Sat, 16 Aug 2025 19:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 08/16] kmsan: convert kmsan_handle_dma to use physical
 addresses
Message-ID: <202508161823.vfpArxa2-lkp@intel.com>
References: <38de1c5ffb567c5705826f14742fcaf54522c083.1755193625.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38de1c5ffb567c5705826f14742fcaf54522c083.1755193625.git.leon@kernel.org>

Hi Leon,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on akpm-mm/mm-everything trace/for-next linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leon-Romanovsky/dma-mapping-introduce-new-DMA-attribute-to-indicate-MMIO-memory/20250815-015647
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/38de1c5ffb567c5705826f14742fcaf54522c083.1755193625.git.leon%40kernel.org
patch subject: [PATCH v3 08/16] kmsan: convert kmsan_handle_dma to use physical addresses
config: x86_64-buildonly-randconfig-004-20250816 (https://download.01.org/0day-ci/archive/20250816/202508161823.vfpArxa2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508161823.vfpArxa2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508161823.vfpArxa2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/kmsan/hooks.c:339:6: error: conflicting types for 'kmsan_handle_dma'
     339 | void kmsan_handle_dma(phys_addr_t phys, size_t size,
         |      ^
   include/linux/kmsan.h:194:6: note: previous declaration is here
     194 | void kmsan_handle_dma(phys_addr_t phys, size_t size,
         |      ^
>> mm/kmsan/hooks.c:371:6: error: too many arguments to function call, expected 3, have 4
     370 |                 kmsan_handle_dma(sg_page(item), item->offset, item->length,
         |                 ~~~~~~~~~~~~~~~~
     371 |                                  dir);
         |                                  ^~~
   mm/kmsan/hooks.c:361:19: note: 'kmsan_handle_dma' declared here
     361 | EXPORT_SYMBOL_GPL(kmsan_handle_dma);
         |                   ^~~~~~~~~~~~~~~~
   include/linux/export.h:90:48: note: expanded from macro 'EXPORT_SYMBOL_GPL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                                        ^~~
   include/linux/export.h:86:54: note: expanded from macro '_EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                                         ^~~
   include/linux/export.h:76:21: note: expanded from macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   2 errors generated.


vim +/kmsan_handle_dma +339 mm/kmsan/hooks.c

   337	
   338	/* Helper function to handle DMA data transfers. */
 > 339	void kmsan_handle_dma(phys_addr_t phys, size_t size,
   340			      enum dma_data_direction dir, unsigned int attrs)
   341	{
   342		struct page *page = phys_to_page(phys);
   343		u64 page_offset, to_go, addr;
   344	
   345		if (PageHighMem(page))
   346			return;
   347		addr = (u64)page_address(page) + offset_in_page(phys);
   348		/*
   349		 * The kernel may occasionally give us adjacent DMA pages not belonging
   350		 * to the same allocation. Process them separately to avoid triggering
   351		 * internal KMSAN checks.
   352		 */
   353		while (size > 0) {
   354			page_offset = offset_in_page(addr);
   355			to_go = min(PAGE_SIZE - page_offset, (u64)size);
   356			kmsan_handle_dma_page((void *)addr, to_go, dir);
   357			addr += to_go;
   358			size -= to_go;
   359		}
   360	}
   361	EXPORT_SYMBOL_GPL(kmsan_handle_dma);
   362	
   363	void kmsan_handle_dma_sg(struct scatterlist *sg, int nents,
   364				 enum dma_data_direction dir)
   365	{
   366		struct scatterlist *item;
   367		int i;
   368	
   369		for_each_sg(sg, item, nents, i)
   370			kmsan_handle_dma(sg_page(item), item->offset, item->length,
 > 371					 dir);
   372	}
   373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
