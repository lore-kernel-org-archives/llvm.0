Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A84661FE9;
	Wed, 23 Oct 2024 02:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729649062; cv=none; b=aWeZyhcXx1y0aFr6/v6a1LPFRJJy2pJFdcuncl7gvipjgXGXUy1FfoJURu0L4RB1EB0H3GFrAsdIClj2GiuHzF4pqegHA/E4xO1Z/c2IWQjJlpTKF84Ih8c2kZBbyCNt9pbGRVSB890+GctYN68zrlGKIF17Ogpv0/r6opidCS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729649062; c=relaxed/simple;
	bh=VZtPWwAnDnUOpZZFl5UEeMy6a7Ay3ailL7WqcSORjQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=smHVHH4fCAT16VG0H6t/apu9qLm675BgfrQqDup2aFyP1tiOm7bc2v6sNjnQqTeQOAwa3Hxi/R9cAmgV9ixRFkD6IKv7ntO7eUtojkBlAwTYAwHxryNXqT4ZMGXInGLDNl7unDXFsSk/cf2UgofJ9C8hn8D15n6c+44MaUdTR5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFw5ssya; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFw5ssya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729649060; x=1761185060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VZtPWwAnDnUOpZZFl5UEeMy6a7Ay3ailL7WqcSORjQE=;
  b=AFw5ssyavutKAVX2o1Ps94FXivgXRvX/S2LiQqiYHq1x76H4L8FJk7tK
   sUaMkLpzat8PQ6+K35XIV0pd4Z5LeMHbqamQXXpucW6JphbmeaX+BBdzP
   ukUPZcD5csHLyhM9/me5MVNfSxAI0AoikKAyGE4vYJxa3VV/ZJTArGjCY
   +hXF6mHfrVZ512vkbGoulkooZ2cDZiA38N1zyi9QeoEKS+79EPeiLT9AW
   KzcmTDYitkfA9AAjjxbrWPm14HoSb1faVsGnZXvf5jmkNy7sLuut+s4Tb
   pSNb7k93IaLTuU5SC1IyQwAJgGd6DHqKXd0PRhenpfa8tczH6c/sArfZ/
   A==;
X-CSE-ConnectionGUID: ACFt6wvcSfCo8fePPqr+Bw==
X-CSE-MsgGUID: 24TJB9ZrSzGxIwHmAmc63w==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="28681180"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="28681180"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 19:04:19 -0700
X-CSE-ConnectionGUID: IenJ2A+GQtGbki1oFmk3Gw==
X-CSE-MsgGUID: d6eSH1oCTJSX4Z/bmYeNDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="80463774"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Oct 2024 19:04:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3QjP-000ULg-2w;
	Wed, 23 Oct 2024 02:04:15 +0000
Date: Wed, 23 Oct 2024 10:03:30 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-wip 11/26] mm/hmm.c:642:12: error: no member
 named 'dma_skip_sync' in 'struct device'
Message-ID: <202410230948.5HQG0Vem-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-wip
head:   c651d2118e26e1ac43db75c53cc4b4a51c41984b
commit: 8beafe484c79bce5de4807d390d93250449fecee [11/26] mm/hmm: generalize managing PFN and DMA lists
config: i386-buildonly-randconfig-002-20241023 (https://download.01.org/0day-ci/archive/20241023/202410230948.5HQG0Vem-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230948.5HQG0Vem-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410230948.5HQG0Vem-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/hmm.c:642:12: error: no member named 'dma_skip_sync' in 'struct device'
     642 |         if (!dev->dma_skip_sync || dma_addressing_limited(dev))
         |              ~~~  ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
>> mm/hmm.c:642:12: error: no member named 'dma_skip_sync' in 'struct device'
     642 |         if (!dev->dma_skip_sync || dma_addressing_limited(dev))
         |              ~~~  ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
>> mm/hmm.c:642:12: error: no member named 'dma_skip_sync' in 'struct device'
     642 |         if (!dev->dma_skip_sync || dma_addressing_limited(dev))
         |              ~~~  ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   3 errors generated.


vim +642 mm/hmm.c

   618	
   619	/**
   620	 * hmm_map_alloc - Allocate HMM map structure
   621	 * @dev: device to allocate structure for
   622	 * @map: HMM map to allocate
   623	 * @nr_entries: number of entries in the map
   624	 * @dma_entry_size: size of the DMA entry in the map
   625	 *
   626	 * Allocate the HMM map structure and all the lists it contains.
   627	 * Return 0 on success, -ENOMEM on failure.
   628	 */
   629	int hmm_map_alloc(struct device *dev, struct hmm_map *map, size_t nr_entries,
   630			  size_t dma_entry_size)
   631	{
   632		bool use_iova;
   633	
   634		if (!(nr_entries * PAGE_SIZE / dma_entry_size))
   635			return -EINVAL;
   636	
   637		/*
   638		 * The HMM API violates our normal DMA buffer ownership rules and can't
   639		 * transfer buffer ownership.  The dma_addressing_limited() check is a
   640		 * best approximation to ensure no swiotlb buffering happens.
   641		 */
 > 642		if (!dev->dma_skip_sync || dma_addressing_limited(dev))
   643			return -EOPNOTSUPP;
   644	
   645		map->dma_entry_size = dma_entry_size;
   646		map->pfn_list =
   647			kvcalloc(nr_entries, sizeof(*map->pfn_list), GFP_KERNEL);
   648		if (!map->pfn_list)
   649			return -ENOMEM;
   650	
   651		use_iova = dma_iova_try_alloc(dev, &map->state, 0,
   652				nr_entries * PAGE_SIZE);
   653		if (!use_iova && dma_need_unmap(dev)) {
   654			map->dma_list = kvcalloc(nr_entries, sizeof(*map->dma_list),
   655						 GFP_KERNEL);
   656			if (!map->dma_list)
   657				goto err_dma;
   658		}
   659		return 0;
   660	
   661	err_dma:
   662		kfree(map->pfn_list);
   663		return -ENOMEM;
   664	}
   665	EXPORT_SYMBOL_GPL(hmm_map_alloc);
   666	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
