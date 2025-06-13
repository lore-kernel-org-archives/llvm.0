Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F7A2DA762;
	Fri, 13 Jun 2025 08:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749802019; cv=none; b=Id/grai/YQDUafaM3I/jKybZLSCDicX++sucTOGfyk/eSj4coQO+1YUXAxScE49SNJLV/togvSPqQEO7vMh1FfHIKOwN76DcQuvQ4EkAOY8Y59bUAC3SZSjQy0EOXp5StSlHM2L/3Hifs0sweNJCZ6uOdtdUuYlwtxcUv1256zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749802019; c=relaxed/simple;
	bh=hcvmg0eKWg6J9hjGZ6YUcp4Igm6x/GCZOv1O1sz6pg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kh0J+k1VW0q3J1OMUZwSQ1ENFtOI83BP0c2kY3j+6l9NXznzGw3K1UVGPa5NvI8O0udhqe9qvmsleTMpVExhwttysq9b+hhiZpQg03VnlpoblAv+ANirsbOSdw64i+DkjufbDxQUDQsVk2Zea9rU/AqTBThDzjk+u6BuhA2B5Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iprYIAtB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iprYIAtB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749802017; x=1781338017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hcvmg0eKWg6J9hjGZ6YUcp4Igm6x/GCZOv1O1sz6pg8=;
  b=iprYIAtBcjdV45+653s+54nEmh1TYQYucPNgTzElKSmpVslVzVzr256M
   dxE94qeFDqIjHsJ1PdhTVe1nML2EwMej+pboVEGBRuuCgbgBiLKx50q+9
   XFHzNwih4mx7IKPl7/GGMHp8llZUrlSMrto1TG/zlFegXWiZPgmaTiUz1
   hMxle6h/7cgxfurMHvTjxPyvVKFlbZ31C92Oiln1pFfLvyEP3u5mrkmnM
   D5e73roxr8jSVEZmfSrv77zlXkQrKfi1tKmsNsg3cfaxTxZ/GVasW/xU0
   39QKCgCoWz44FlWxaxP7h4hC1+Zx1dlfbqmltfWJ5LABPRYDWWv05/4X4
   w==;
X-CSE-ConnectionGUID: Cgm3QxGTR0GMYfxE8G1TSA==
X-CSE-MsgGUID: cr+1TwFyQN2RnkS5Odkbmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="77403971"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="77403971"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 01:06:57 -0700
X-CSE-ConnectionGUID: WGIaX5ZUTLuwq+Qm99LULw==
X-CSE-MsgGUID: J6P2UcZ0SyqsP7hnikn1ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="148129506"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jun 2025 01:06:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPzR7-000CLu-2y;
	Fri, 13 Jun 2025 08:06:53 +0000
Date: Fri, 13 Jun 2025 16:06:36 +0800
From: kernel test robot <lkp@intel.com>
To: youngjun.park@lge.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] mm/swap, memcg: basic structure and logic for
 per cgroup swap priority control
Message-ID: <202506131523.EpvlXp1a-lkp@intel.com>
References: <20250612103743.3385842-2-youngjun.park@lge.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612103743.3385842-2-youngjun.park@lge.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/youngjun-park-lge-com/mm-swap-memcg-basic-structure-and-logic-for-per-cgroup-swap-priority-control/20250612-184013
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250612103743.3385842-2-youngjun.park%40lge.com
patch subject: [RFC PATCH 1/2] mm/swap, memcg: basic structure and logic for per cgroup swap priority control
config: x86_64-buildonly-randconfig-001-20250613 (https://download.01.org/0day-ci/archive/20250613/202506131523.EpvlXp1a-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506131523.EpvlXp1a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506131523.EpvlXp1a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memcontrol.c:3706:2: error: call to undeclared function 'delete_swap_cgroup_priority'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3706 |         delete_swap_cgroup_priority(memcg);
         |         ^
   1 error generated.


vim +/delete_swap_cgroup_priority +3706 mm/memcontrol.c

  3701	
  3702	static void mem_cgroup_free(struct mem_cgroup *memcg)
  3703	{
  3704		lru_gen_exit_memcg(memcg);
  3705		memcg_wb_domain_exit(memcg);
> 3706		delete_swap_cgroup_priority(memcg);
  3707		__mem_cgroup_free(memcg);
  3708	}
  3709	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
