Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E23E78F5D;
	Wed, 12 Feb 2025 01:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739324619; cv=none; b=LExurVHzy0+bw2sohWcbsbJkB2+Dr4bDyMk26l6jdksUtwcKDf65fKGQcNzwjqCadoaFmQ6QCQg1lEFZS6HmDx+UCLKwJC0eHBiS7Msf7EigT6TarXz2M1tMLyyBH+Ki8d1SgyZz5RcXs4AxWCNrKX5741H1tXYPg+qvkrud5fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739324619; c=relaxed/simple;
	bh=pEBoerNGQIQz6CgbVC4qbPIbhAOm/dHvWMe21pczfT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HX5//JOIaGOMBjKby9tLwv5Prc2LhBPS/Gi3mO6S3sMP4qvgXnFpG3vRXEymP//Of7NFrt2NbaR+6FYeOOS+S9/s/vqvPliFupVTb30eQGm3Y0DjN/mzhgXFWKGsQwB7ZBFrA16n45E4J/FxH3GUtAYjcjcbG4VIdZtzA/7YLAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7HqqunE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7HqqunE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739324618; x=1770860618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pEBoerNGQIQz6CgbVC4qbPIbhAOm/dHvWMe21pczfT4=;
  b=g7HqqunEUVPEpQ7BagVQH3Hh+9oHNUELxUWe7Q2wNtUnUvCxhKMQzBeu
   Dak8PXWinsYolwkxvuirVaowDQRNzb70UNrZv2GhjToZZhNHxdlFU4DrL
   uv9aZo9gdOHMfMCSg9OQSSMbZ8KxlHc38IuQey16TRIuXNmWYPAnDqCn3
   zCizAoevc+8FOiBPiFnK4UT0+zT9ACZp3xEOF0JeL3+SiXH2T/3v6Vdla
   jqC4zSioLbxAFL65h90lYxQXSyT8zzDCzHy+0tnKea4BEk54341ikmxkq
   Qg8gJuQhxKS053xc0f7CvgDNATbFSbd1HTXAOsVk70Y7pkBOLIz/4PCGh
   w==;
X-CSE-ConnectionGUID: TfI1qA2KRoC7ZsgxkxbbHg==
X-CSE-MsgGUID: uz5GdISbQeOnX3SKYLiM6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50951379"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="50951379"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 17:43:35 -0800
X-CSE-ConnectionGUID: GpNoBTHYT7i3nQsQSWHmag==
X-CSE-MsgGUID: x/Prz7ssQxin0Gc0ljEQpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117302767"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Feb 2025 17:43:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti1mk-0014x1-2p;
	Wed, 12 Feb 2025 01:43:30 +0000
Date: Wed, 12 Feb 2025 09:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv2 6/6] io_uring: cache nodes and mapped buffers
Message-ID: <202502120932.uu9ibLvc-lkp@intel.com>
References: <20250211005646.222452-7-kbusch@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211005646.222452-7-kbusch@meta.com>

Hi Keith,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v6.14-rc2 next-20250210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/io_uring-use-node-for-import/20250211-091231
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20250211005646.222452-7-kbusch%40meta.com
patch subject: [PATCHv2 6/6] io_uring: cache nodes and mapped buffers
config: hexagon-randconfig-001-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120932.uu9ibLvc-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120932.uu9ibLvc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120932.uu9ibLvc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> io_uring/rsrc.c:180:2: error: call to '__compiletime_assert_443' declared with 'error' attribute: BUILD_BUG_ON failed: imu_cache_size != 512
     180 |         BUILD_BUG_ON(imu_cache_size != 512);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:542:2: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:193:1: note: expanded from here
     193 | __compiletime_assert_443
         | ^
>> io_uring/rsrc.c:180:2: error: call to '__compiletime_assert_443' declared with 'error' attribute: BUILD_BUG_ON failed: imu_cache_size != 512
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:542:2: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:193:1: note: expanded from here
     193 | __compiletime_assert_443
         | ^
   2 errors generated.


vim +180 io_uring/rsrc.c

   173	
   174	static __cold int io_rsrc_buffer_alloc(struct io_buf_table *table, unsigned nr)
   175	{
   176		const int imu_cache_size = struct_size_t(struct io_mapped_ubuf, bvec,
   177							 IO_CACHED_BVECS_SEGS);
   178		int ret;
   179	
 > 180		BUILD_BUG_ON(imu_cache_size != 512);
   181		ret = io_rsrc_data_alloc(&table->data, nr);
   182		if (ret)
   183			return ret;
   184	
   185		ret = io_alloc_cache_init(&table->node_cache, nr,
   186					  sizeof(struct io_rsrc_node), 0);
   187		if (ret)
   188			goto out_1;
   189	
   190		ret = io_alloc_cache_init(&table->imu_cache, nr, imu_cache_size, 0);
   191		if (ret)
   192			goto out_2;
   193	
   194		return 0;
   195	out_2:
   196		io_alloc_cache_free(&table->node_cache, kfree);
   197	out_1:
   198		__io_rsrc_data_free(&table->data);
   199		return ret;
   200	}
   201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
