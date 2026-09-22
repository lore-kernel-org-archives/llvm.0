Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95EC3B7B7F;
	Tue, 22 Sep 2026 17:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096617; cv=none; b=Yl+L5U98zdtdl0VkKzrG4pULDvd/Z3SM0XQtltttmwpHNfPIfr/bbk9QBsrT/GJYHm7Nxp+ri53QfOpzjquoAI2C5cBrsNvnKtuFSY/B53/yyc9w0ONAFlhqXnqUOfyaeGLd/UqU5jWjboJOgJgzdXcmkHawGRB8E6nLC6cASrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096617; c=relaxed/simple;
	bh=0wfzdLF5Bu7q8OlGyBWjR9+dXLWGzGITyd8qdIa1Tyc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eIvMGSJ3XsDlmrdMDEIB/ii0hvu2e1UlrEkjMpQl0C3Pmk3mYghghMM7kf01l8EefZXDw7as49GeeKYOLCuO7f2J8ZGPt8FyeFsOkMFIpsi2FlXkiDn+kB35O2grOdCQ7MRXNHiQHXYQcKqhk2q41vCmZ0bBdqlSYzsn1wxE7us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MmApTSGO; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MmApTSGO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790096615; x=1821632615;
  h=date:from:to:cc:subject:message-id;
  bh=0wfzdLF5Bu7q8OlGyBWjR9+dXLWGzGITyd8qdIa1Tyc=;
  b=MmApTSGOaHBukJf3dV9p9BqME7JX8dX+7t4Nf5BC/UD2PzdQ4z+aQva+
   b0P1mRDO080oNwRnWQcQW5v+Oq+UWtWNWBJshetzssHjzIqYSdW4NCDG/
   2ycjbToIi394J+G0MbjKXFPm1Caky0RJYwt48DFws+x7xaco9iNiMG2Lu
   iFd/P4Ea0C6XqwYA4JRrPwGQFz+pVycJ8muAcntavtbV5okL2lgDL/bHg
   h1pFOgMBo7c3ujBeeVynqdttJYsKepAUf+0IJ6OgZgLcEMl/vIp9EdpZ+
   9MOqqDcNnNBQfxN1CZrI31d8rB+p8Gx4s+SAzPghVRbjchix+M+KSxI5/
   w==;
X-CSE-ConnectionGUID: sI8vh1RNRRyVx11HzM1SeQ==
X-CSE-MsgGUID: lBGVYzzOSauiwW/+1Xr0uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1223653"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1223653"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 10:03:34 -0700
X-CSE-ConnectionGUID: cGpOBy3mSTWMH4d0v8pdow==
X-CSE-MsgGUID: 3riit4LUQ5KMP6OCndK6xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="277975656"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Sep 2026 10:03:31 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x93tx-00000000FmE-1VJB;
	Tue, 22 Sep 2026 17:03:29 +0000
Date: Wed, 23 Sep 2026 01:02:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dominik Kaszewski <dominik.kaszewski@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Chen-Yu Chen" <Chen-Yu.Chen@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: [agd5f:amd-staging-drm-next 3081/3178]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_memory_pool.c:87:37: warning:
 stack frame size (16560) exceeds limit (2048) in 'dc_memory_pool_create'
Message-ID: <202609230057.SPRTbGh9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   e0e9c2257911b291ef5345635a9e6dfef5b2b424
commit: 68006eb4b8f03d723aaa66e87625795189488c04 [3081/3178] drm/amd/display: Add lock-free memory pool
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260923/202609230057.SPRTbGh9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230057.SPRTbGh9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609230057.SPRTbGh9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_memory_pool.c:87:37: warning: stack frame size (16560) exceeds limit (2048) in 'dc_memory_pool_create' [-Wframe-larger-than]
      87 | __must_check struct dc_memory_pool *dc_memory_pool_create(size_t size,
         |                                     ^
   1 warning generated.


vim +/dc_memory_pool_create +87 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_memory_pool.c

    86	
  > 87	__must_check struct dc_memory_pool *dc_memory_pool_create(size_t size,
    88								  size_t capacity)
    89	{
    90		if (!size || !capacity)
    91			return NULL;
    92	
    93		// Limited by split between size and generation in index_t
    94		if (capacity >= (uint32_t)-DC_MEMORY_POOL_ENUM_SIZE)
    95			return NULL;
    96	
    97		// uint32_t because that's what alloc functions take
    98		const uint32_t block_pages = (uint32_t)size_in_pages(size);
    99		const uint32_t lines = (uint32_t)capacity * block_pages;
   100		const uint32_t padded_struct_size =
   101			sizeof(struct dc_memory_pool) + PAGE_SIZE;
   102	
   103		void *unaligned_pool = kzalloc(padded_struct_size, GFP_KERNEL);
   104	
   105		if (!unaligned_pool)
   106			return NULL;
   107	
   108		struct dc_memory_pool *pool = page_align_up(unaligned_pool);
   109	
   110		*pool = (struct dc_memory_pool){
   111			.size = size,
   112			.capacity = capacity,
   113			.unaligned_pool = unaligned_pool,
   114			.unaligned_memory = kcalloc(lines + 1, PAGE_SIZE, GFP_KERNEL),
   115			.free_list = kcalloc((uint32_t)capacity, sizeof(atomic_t),
   116					     GFP_KERNEL),
   117			.free_head = ATOMIC_INIT(0),
   118		};
   119		pool->memory = page_align_up(pool->unaligned_memory);
   120	
   121		if (!pool->unaligned_memory || !pool->free_list) {
   122			dc_memory_pool_destroy(pool);
   123			return NULL;
   124		}
   125	
   126		for (int32_t i = 0; i < (int32_t)capacity; i++)
   127			atomic_set_release(&pool->free_list[i], i + 1);
   128	
   129		atomic_set_release(&pool->free_list[capacity - 1],
   130				   DC_MEMORY_POOL_SENTINEL);
   131	
   132		return pool;
   133	}
   134	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
