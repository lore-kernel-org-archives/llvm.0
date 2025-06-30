Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212985336D;
	Mon, 30 Jun 2025 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279924; cv=none; b=Of10Gn8m/cypZod8yx6CggKthPMd2kDoZdUGOQJeSJrUxi/FpmXuLSGTpvbOfbPwpZQMaUxUxerDttxUSKSJt90n0bdpYvLVRE6kqpQk6Jp9q3pXwr44Aj30sSo8VnFq4B5d58+7601YVZUY5nvyUy1r5mcAGgipnX8UZorwwnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279924; c=relaxed/simple;
	bh=90pyHrF0RViM4pGrdWWqWuM9lBGiL7Pw4669LBz+phU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvDz8skNUGlMnGJZmo6spV7mxjUxkS2NyLa6Zru4lVG0dEkKO3hat8NTj8vbLXWjAbEJhaNE/gpoTu/mHkcbXk6NVnrgckQw/PzFmLz9ClEYlXLM7hKF9T+Lrw10Z8oekvqSXMnVMrbC4zBanov8DL+T4y70rCWF4yVW3m2wnN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eukjme4E; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eukjme4E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751279922; x=1782815922;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=90pyHrF0RViM4pGrdWWqWuM9lBGiL7Pw4669LBz+phU=;
  b=eukjme4EFbe98uQ96NZR54ywv4aWw9KyWAvvxrDqqnU4xpx20SfX2ooZ
   dXHf8uQATausBHlIb3IDNoSWqOdge/wpNqt3QAduE3TRd/Lm3FsfTE9af
   htN9QlGHveduS2ZcTesRufuq/vWErdv/XIpZjxZt5f1il4eVjP8PJ48zQ
   3JG1ou/9A64bLXzPL0t1MRJD1w+4DUx5h3/Y9OcMce7+N8L8ftArMwIxK
   HsJ+bqtYZtQ0sbRBRP7f3q3vTNH8juIt6VZmzNHEeZp6/yYfDfzIzqAW+
   mdmElmhE+C9ftOZSKRGIHPUmzFhaE4TS/qb7OW9wYTlt6Q8kHpUjLZXXH
   A==;
X-CSE-ConnectionGUID: 2vmqCorST0SqnN3QCqMyww==
X-CSE-MsgGUID: 7NKL+lyBT96DWPcBg1nuFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="52730957"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="52730957"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:38:42 -0700
X-CSE-ConnectionGUID: 3qJxtHz3R1Gvncn6V5PRqQ==
X-CSE-MsgGUID: fzRuq/8OS+Krc8EYqHxOSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="157967326"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Jun 2025 03:38:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWBuG-000Yni-1V;
	Mon, 30 Jun 2025 10:38:36 +0000
Date: Mon, 30 Jun 2025 18:37:50 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
	Christian Koenig <christian.koenig@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dave Chinner <david@fromorbit.com>,
	Kairui Song <kasong@tencent.com>, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH 04/17] ttm/pool: port to list_lru. (v2)
Message-ID: <202506301808.C73SwQJr-lkp@intel.com>
References: <20250630045005.1337339-5-airlied@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630045005.1337339-5-airlied@gmail.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v6.16-rc4]
[cannot apply to akpm-mm/mm-everything linus/master next-20250630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/drm-ttm-use-gpu-mm-stats-to-track-gpu-memory-allocations-v2/20250630-134938
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250630045005.1337339-5-airlied%40gmail.com
patch subject: [PATCH 04/17] ttm/pool: port to list_lru. (v2)
config: i386-buildonly-randconfig-003-20250630 (https://download.01.org/0day-ci/archive/20250630/202506301808.C73SwQJr-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301808.C73SwQJr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301808.C73SwQJr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/intel_region_ttm.c:5:
   In file included from include/drm/ttm/ttm_device.h:31:
>> include/drm/ttm/ttm_pool.h:57:18: error: field has incomplete type 'struct list_lru'
      57 |         struct list_lru pages;
         |                         ^
   include/linux/xarray.h:25:8: note: forward declaration of 'struct list_lru'
      25 | struct list_lru;
         |        ^
   In file included from drivers/gpu/drm/i915/intel_region_ttm.c:8:
   In file included from drivers/gpu/drm/i915/i915_drv.h:35:
   In file included from include/linux/pci.h:1656:
   In file included from include/linux/dmapool.h:15:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/i915/intel_region_ttm.c:8:
   In file included from drivers/gpu/drm/i915/i915_drv.h:35:
   In file included from include/linux/pci.h:1656:
   In file included from include/linux/dmapool.h:15:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/i915/intel_region_ttm.c:8:
   In file included from drivers/gpu/drm/i915/i915_drv.h:35:
   In file included from include/linux/pci.h:1656:
   In file included from include/linux/dmapool.h:15:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/i915/intel_region_ttm.c:8:
   In file included from drivers/gpu/drm/i915/i915_drv.h:35:
   In file included from include/linux/pci.h:1656:
   In file included from include/linux/dmapool.h:15:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/i915/intel_region_ttm.c:8:
   In file included from drivers/gpu/drm/i915/i915_drv.h:35:
   In file included from include/linux/pci.h:1656:
   In file included from include/linux/dmapool.h:15:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/i915/intel_region_ttm.c:8:
   In file included from drivers/gpu/drm/i915/i915_drv.h:35:
   In file included from include/linux/pci.h:1656:
   In file included from include/linux/dmapool.h:15:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/i915/intel_region_ttm.c:8:
   In file included from drivers/gpu/drm/i915/i915_drv.h:35:
   In file included from include/linux/pci.h:1656:
   In file included from include/linux/dmapool.h:15:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +57 include/drm/ttm/ttm_pool.h

    40	
    41	/**
    42	 * struct ttm_pool_type - Pool for a certain memory type
    43	 *
    44	 * @pool: the pool we belong to, might be NULL for the global ones
    45	 * @order: the allocation order our pages have
    46	 * @caching: the caching type our pages have
    47	 * @shrinker_list: our place on the global shrinker list
    48	 * @pages: the lru_list of pages in the pool
    49	 */
    50	struct ttm_pool_type {
    51		struct ttm_pool *pool;
    52		unsigned int order;
    53		enum ttm_caching caching;
    54	
    55		struct list_head shrinker_list;
    56	
  > 57		struct list_lru pages;
    58	};
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
