Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7FA6DCE4;
	Tue,  5 Dec 2023 20:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iW3by8pZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701806929; x=1733342929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SUuGRs+vZC//Sfo0R7WmSf0IDUlFGiXpDp5H5TAZx6Y=;
  b=iW3by8pZiIFdxruL40y2nm+EOGZ69X0ITtq+9zT3f7nGxiNAKDJ+nqnV
   2phe6tdqKCXtKq2cgmbyorC82UdXVpFBfNg5dZp8OxrZX+vc4LXg3R+DB
   jJ0R/u7qZvZGzFw7C+cWy1qwn4haaeJdM+Wr+8yRA4JDtbNqzWUUj2heb
   8d3z9p3SVHlSBrsPY3kQe7pasAXOSggBpq52GSXlMElz7DP1Ms5f+wEf8
   IjQMZlrclT6U1e5HTFszk8lKLb+MNc/OqicyALp7oA6NZFtKNQ7AODub2
   kYmBrVOq26b0OWH1jxoW480nw8NYNztQvhi2YDP+hFFwFD7uySXluYA+F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="374138358"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="374138358"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 12:08:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="805394425"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="805394425"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Dec 2023 12:08:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAbin-0009ew-03;
	Tue, 05 Dec 2023 20:08:45 +0000
Date: Wed, 6 Dec 2023 04:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 15/21] mm/zsmalloc: convert __free_zspage() to use
 zsdesc
Message-ID: <202312060342.tJyfMWv0-lkp@intel.com>
References: <20231130101242.2590384-16-42.hyeyoo@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130101242.2590384-16-42.hyeyoo@gmail.com>

Hi Hyeonggon,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Hyeonggon-Yoo/mm-zsmalloc-create-new-struct-zsdesc/20231130-181616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231130101242.2590384-16-42.hyeyoo%40gmail.com
patch subject: [RFC PATCH v3 15/21] mm/zsmalloc: convert __free_zspage() to use zsdesc
config: i386-buildonly-randconfig-003-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060342.tJyfMWv0-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060342.tJyfMWv0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060342.tJyfMWv0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/zsmalloc.c:393:14: warning: no previous prototype for function 'zsdesc_zone' [-Wmissing-prototypes]
   struct zone *zsdesc_zone(struct zsdesc *zsdesc)
                ^
   mm/zsmalloc.c:393:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct zone *zsdesc_zone(struct zsdesc *zsdesc)
   ^
   static 
   mm/zsmalloc.c:286:29: warning: unused function 'zsdesc_pfn' [-Wunused-function]
   static inline unsigned long zsdesc_pfn(const struct zsdesc *zsdesc)
                               ^
   mm/zsmalloc.c:296:20: warning: unused function 'zsdesc_get' [-Wunused-function]
   static inline void zsdesc_get(struct zsdesc *zsdesc)
                      ^
>> mm/zsmalloc.c:320:20: warning: function 'zsdesc_is_locked' is not needed and will not be emitted [-Wunneeded-internal-declaration]
   static inline bool zsdesc_is_locked(struct zsdesc *zsdesc)
                      ^
   mm/zsmalloc.c:325:20: warning: unused function 'wait_on_zsdesc_locked' [-Wunused-function]
   static inline void wait_on_zsdesc_locked(struct zsdesc *zsdesc)
                      ^
   mm/zsmalloc.c:348:20: warning: unused function 'zsdesc_set_movable' [-Wunused-function]
   static inline void zsdesc_set_movable(struct zsdesc *zsdesc)
                      ^
   mm/zsmalloc.c:388:20: warning: unused function 'zsdesc_is_isolated' [-Wunused-function]
   static inline bool zsdesc_is_isolated(struct zsdesc *zsdesc)
                      ^
   7 warnings generated.


vim +/zsdesc_is_locked +320 mm/zsmalloc.c

   319	
 > 320	static inline bool zsdesc_is_locked(struct zsdesc *zsdesc)
   321	{
   322		return PageLocked(zsdesc_page(zsdesc));
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
