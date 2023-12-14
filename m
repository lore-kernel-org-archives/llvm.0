Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B30D302;
	Thu, 14 Dec 2023 08:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBZ2UK2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702542686; x=1734078686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iDDCZdGEORt6D19Y3AX1MX+iitBTTwT0AlZvGpS3UgY=;
  b=JBZ2UK2CO1KdRU730Dk30Ldx52M947XrqWzfATL9FQG6ay33BXqO0VHR
   19SluSXsZpFdSJwMX4+35FHnBYkfMa+mZRlELJw5eLLSxgob6FRhWFjvd
   BW9PAXvP6G+Te41/JSey6zmgSl13Q5jvlaZBdhg+TioTKHQ4TRPpXm5oQ
   6SjP6frj26Y+4SjdOIOJXXOorIOVf88FqMKjhAuhzWnPqD0IiLPMcs5ZZ
   gIdugPep7EP/qnxBU9Tfz3EcNdYHQD2SEz5FQikkP8MQd7mI9fW4jffvb
   afqT8eiKl9R/2fGYhsedtmQNiXDd+0ChILO787vJeS8+gCqw4IXL7xYri
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1906325"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="1906325"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 00:31:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="803198192"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="803198192"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Dec 2023 00:31:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDh7n-000LoV-2E;
	Thu, 14 Dec 2023 08:31:19 +0000
Date: Thu, 14 Dec 2023 16:30:46 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/4] drm/ttm: improve idle/busy handling
Message-ID: <202312141637.ciYxVFVl-lkp@intel.com>
References: <20231213144222.1871-3-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231213144222.1871-3-christian.koenig@amd.com>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc5 next-20231214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-ttm-replace-busy-placement-with-flags-v3/20231213-224456
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231213144222.1871-3-christian.koenig%40amd.com
patch subject: [PATCH 3/4] drm/ttm: improve idle/busy handling
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231214/202312141637.ciYxVFVl-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312141637.ciYxVFVl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141637.ciYxVFVl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_resource.c:301: warning: Function parameter or member 'busy' not described in 'ttm_resource_compatible'


vim +301 drivers/gpu/drm/ttm/ttm_resource.c

544432703b2fe7 Arunpravin Paneer Selvam 2022-08-20  289  
544432703b2fe7 Arunpravin Paneer Selvam 2022-08-20  290  /**
9909b7ee1d1561 Somalapuram Amaranath    2023-12-13  291   * ttm_resource_compatible - check if resource is compatible with placement
544432703b2fe7 Arunpravin Paneer Selvam 2022-08-20  292   *
9909b7ee1d1561 Somalapuram Amaranath    2023-12-13  293   * @res: the resource to check
9909b7ee1d1561 Somalapuram Amaranath    2023-12-13  294   * @placement: the placement to check against
544432703b2fe7 Arunpravin Paneer Selvam 2022-08-20  295   *
9909b7ee1d1561 Somalapuram Amaranath    2023-12-13  296   * Returns true if the placement is compatible.
544432703b2fe7 Arunpravin Paneer Selvam 2022-08-20  297   */
9909b7ee1d1561 Somalapuram Amaranath    2023-12-13  298  bool ttm_resource_compatible(struct ttm_resource *res,
1e59504faf5d28 Christian König          2023-12-13  299  			     struct ttm_placement *placement,
1e59504faf5d28 Christian König          2023-12-13  300  			     bool busy)
98cca519df6da6 Christian König          2021-08-30 @301  {
544432703b2fe7 Arunpravin Paneer Selvam 2022-08-20  302  	struct ttm_buffer_object *bo = res->bo;
544432703b2fe7 Arunpravin Paneer Selvam 2022-08-20  303  	struct ttm_device *bdev = bo->bdev;
98cca519df6da6 Christian König          2021-08-30  304  	unsigned i;
98cca519df6da6 Christian König          2021-08-30  305  
98cca519df6da6 Christian König          2021-08-30  306  	if (res->placement & TTM_PL_FLAG_TEMPORARY)
98cca519df6da6 Christian König          2021-08-30  307  		return false;
98cca519df6da6 Christian König          2021-08-30  308  
9909b7ee1d1561 Somalapuram Amaranath    2023-12-13  309  	for (i = 0; i < placement->num_placement; i++) {
9909b7ee1d1561 Somalapuram Amaranath    2023-12-13  310  		const struct ttm_place *place = &placement->placement[i];
9909b7ee1d1561 Somalapuram Amaranath    2023-12-13  311  		struct ttm_resource_manager *man;
9909b7ee1d1561 Somalapuram Amaranath    2023-12-13  312  
9909b7ee1d1561 Somalapuram Amaranath    2023-12-13  313  		if (res->mem_type != place->mem_type)
9909b7ee1d1561 Somalapuram Amaranath    2023-12-13  314  			continue;
98cca519df6da6 Christian König          2021-08-30  315  
1e59504faf5d28 Christian König          2023-12-13  316  		if (place->flags & (busy ? TTM_PL_FLAG_IDLE : TTM_PL_FLAG_BUSY))
1e59504faf5d28 Christian König          2023-12-13  317  			continue;
1e59504faf5d28 Christian König          2023-12-13  318  
1e59504faf5d28 Christian König          2023-12-13  319  		if (place->flags & TTM_PL_FLAG_CONTIGUOUS &&
1e59504faf5d28 Christian König          2023-12-13  320  		     !(res->placement & TTM_PL_FLAG_CONTIGUOUS))
1e59504faf5d28 Christian König          2023-12-13  321  			continue;
1e59504faf5d28 Christian König          2023-12-13  322  
9909b7ee1d1561 Somalapuram Amaranath    2023-12-13  323  		man = ttm_manager_type(bdev, res->mem_type);
9909b7ee1d1561 Somalapuram Amaranath    2023-12-13  324  		if (man->func->compatible &&
9909b7ee1d1561 Somalapuram Amaranath    2023-12-13  325  		    !man->func->compatible(man, res, place, bo->base.size))
98cca519df6da6 Christian König          2021-08-30  326  			continue;
98cca519df6da6 Christian König          2021-08-30  327  
98cca519df6da6 Christian König          2021-08-30  328  		return true;
98cca519df6da6 Christian König          2021-08-30  329  	}
98cca519df6da6 Christian König          2021-08-30  330  	return false;
98cca519df6da6 Christian König          2021-08-30  331  }
98cca519df6da6 Christian König          2021-08-30  332  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
