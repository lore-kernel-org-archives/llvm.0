Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C631E515;
	Wed,  8 Jan 2025 19:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736363657; cv=none; b=NZ4Rc6i06eWBWugXuaZPLjkaF65KygLyQksjN+UTqfWuNUKRE2lnwCGAQDaumDQG6HFhl0zSuUfD2hFzbppWQE3fOAfPH3uku8n3IkHJipnKvUwV4dLbQZl0jaQVLDuGn/xtThUBwlpAd9bgp/7MpWEYcMXAsC0MyLdWSG492JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736363657; c=relaxed/simple;
	bh=fEEwz81jltL87npWfR4By9hgJJHNAUW8odUCf6SU+p8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IOZlUIKhfPlcYzcpEUrSmwkwB3Qa5X2g+pWIxTOV16xe6bRgWnlNMBMUZYKqG5rVNIS8YSvA5k9ZQaUDt4lYZvEd8/cBv9B+zW7bj09rUh5K9UcGrC64zeKPhpnvCuhX8DTF6GXaxTTtjrCGSF8fLagJ9v6trQqJkWAEki9b30c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEmLFC6v; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEmLFC6v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736363656; x=1767899656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fEEwz81jltL87npWfR4By9hgJJHNAUW8odUCf6SU+p8=;
  b=fEmLFC6vTUvaK5YRe4vEKYG/cuj+78dPU/hYNeLLkh3trXDRYZAIRto8
   03m2u5uiPyDfdQfWsODnGN78rMejCFznEkDecBeEhJu/iXO99odtEAKec
   FSmjDr+vIZVLDRafrigWO7HAlBys3u5vFpCA3+uk7QJxjuD4Nxq4xdYzK
   pVMu5cuDD05qiFwtZ48y7rX5uN9bNUV4I+RbgZunOfnWRn3J/TCjyzP8i
   0aZKOQxabRbDVpOXCUfBh/hle/+ffRSQhWmkMpvBA3uJoZ1qcv0a93bqr
   ryHtlaafBqOiNi1EaY/XIHNs+sxglJe0i3ZxVhksYjINjPhOG7QWzjg4F
   g==;
X-CSE-ConnectionGUID: d8GAyOaISRGApdhCg3nHIw==
X-CSE-MsgGUID: OmhMFBa3QvW7Pco8GpN6lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40372537"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="40372537"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 11:14:15 -0800
X-CSE-ConnectionGUID: IIqfRtmQTRWupD6IMQWNJA==
X-CSE-MsgGUID: rM2xe3LsRGuaCbOiJvH+fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="102989976"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Jan 2025 11:14:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVbVL-000GXX-2R;
	Wed, 08 Jan 2025 19:14:11 +0000
Date: Thu, 9 Jan 2025 03:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <yunshenglin0825@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_part2_v3_250105 8/8]
 net/core/skbuff.c:3091:28: warning: variable 'nc_page' is uninitialized when
 used here
Message-ID: <202501090341.yJ16qGyH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_part2_v3_250105
head:   c94404d3ba31c8322393ffbabf85a5c98e965b4f
commit: c94404d3ba31c8322393ffbabf85a5c98e965b4f [8/8] replace fix
config: riscv-randconfig-002-20250109 (https://download.01.org/0day-ci/archive/20250109/202501090341.yJ16qGyH-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501090341.yJ16qGyH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501090341.yJ16qGyH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/skbuff.c:3091:28: warning: variable 'nc_page' is uninitialized when used here [-Wuninitialized]
           if (spd_can_coalesce(spd, nc_page, nc_offset)) {
                                     ^~~~~~~
   net/core/skbuff.c:3081:22: note: initialize the variable 'nc_page' to silence this warning
           struct page *nc_page;
                               ^
                                = NULL
>> net/core/skbuff.c:3091:37: warning: variable 'nc_offset' is uninitialized when used here [-Wuninitialized]
           if (spd_can_coalesce(spd, nc_page, nc_offset)) {
                                              ^~~~~~~~~
   net/core/skbuff.c:3080:24: note: initialize the variable 'nc_offset' to silence this warning
           unsigned int nc_offset;
                                 ^
                                  = 0
   2 warnings generated.


vim +/nc_page +3091 net/core/skbuff.c

  3074	
  3075	static bool spd_fill_linear_page(struct splice_pipe_desc *spd,
  3076					 struct page *page, unsigned int offset,
  3077					 unsigned int *len, struct sock *sk)
  3078	{
  3079		struct page_frag_cache *nc = sk_page_frag_cache(sk);
  3080		unsigned int nc_offset;
  3081		struct page *nc_page;
  3082		void *va;
  3083	
  3084		if (!sk_page_frag_cache_refill(sk, nc))
  3085			return true;
  3086	
  3087		*len = min_t(unsigned int, *len, page_frag_cache_remaining(nc));
  3088		va = page_frag_cache_virt(nc);
  3089		memcpy(va, page_address(page) + offset, *len);
  3090	
> 3091		if (spd_can_coalesce(spd, nc_page, nc_offset)) {
  3092			spd->partial[spd->nr_pages - 1].len += *len;
  3093			page_frag_cache_commit_noref(nc, *len);
  3094			return false;
  3095		}
  3096	
  3097		page_frag_cache_commit(nc, *len);
  3098		spd->pages[spd->nr_pages] = nc_page;
  3099		spd->partial[spd->nr_pages].len = *len;
  3100		spd->partial[spd->nr_pages].offset = nc_offset;
  3101		spd->nr_pages++;
  3102	
  3103		return false;
  3104	}
  3105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
