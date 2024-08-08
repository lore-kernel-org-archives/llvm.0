Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76138EEA9;
	Thu,  8 Aug 2024 13:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723122482; cv=none; b=qJqUQe9rdWUpnzQ40uumaUyryMrpT7icLrJIMagv6UKB6TMxLEtV6GRJOrXQhQUz0k3AGd+kcp061nVSYlMRHK65fQ+huus2PYatlw2BPuEjYgHuCkwK0wsHM7ozUgB6PjMQK/gXtQAhe7d8z4MfnLmWy8Hye8WB4rFLRn5J6G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723122482; c=relaxed/simple;
	bh=lzYQGR1Hu3LSf5dJINnbLZ3RZxG01ilpRAY9+tniPyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W49nwo3+3mFHMMHpwPFuDnkLomD0JMo7Fb2jM5BETR0GjM8MNNacsNmwd89ak5Fvh1g4AVa9C7u5/QAkVGI1at2C/WlQlSgroEMYBvHCSR0QKTrNNciroNfRbHKaR1s67V7qBxXRnwUqbWTyGEEgVmnt2nlH3fu2wKuuy29MALo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmWdeWOa; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmWdeWOa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723122481; x=1754658481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lzYQGR1Hu3LSf5dJINnbLZ3RZxG01ilpRAY9+tniPyw=;
  b=NmWdeWOas83g6s00KmoBC8G3Oc1f9Ks9d3x9vrmv3Fc+qLp3hJ1D1hTH
   laALNhI0HawBCv23J1dUozYrD8RKq0/bUuDRxpeT8OFgEHDWhs2VRH/ZR
   iOvVRvvwAMGNw/6YzZZzmWVdDGeGXJKsSpIMH01V5NQQTE7cA/5CLk+RW
   /X/B7RY8H1GNfnBg6EaHJ37xJ4efK11Y/2vU89rHpno/e+MKVBcYhG/Ue
   nJSZW1g0pALX+AjOJ/4sP11NLfW8PtThdOcr46Aq7saMyRPLxMggNZhxp
   6QZ9VNUZScYSHdG+KA5vPhkk0QpFRxSoVblBg83ma5Mr89TWdsGUSc1+7
   g==;
X-CSE-ConnectionGUID: 7TMJTOHDRg+TWQ/kGOnfYw==
X-CSE-MsgGUID: dFKwrQWSQJmFFsoQCEd65w==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43765133"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="43765133"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 06:08:00 -0700
X-CSE-ConnectionGUID: TBcWyZj/Rxya97pGCEdlsg==
X-CSE-MsgGUID: aD5CtOBCSJCKDWZvfLaQYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="61596104"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 08 Aug 2024 06:07:56 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc2rm-0006C2-2p;
	Thu, 08 Aug 2024 13:07:45 +0000
Date: Thu, 8 Aug 2024 21:06:40 +0800
From: kernel test robot <lkp@intel.com>
To: Mary Guillemard <mary.guillemard@collabora.com>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, kernel@collabora.com,
	Mary Guillemard <mary.guillemard@collabora.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/3] drm/panfrost: Add SYSTEM_TIMESTAMP and
 SYSTEM_TIMESTAMP_FREQUENCY parameters
Message-ID: <202408082014.XKxle32n-lkp@intel.com>
References: <20240807160900.149154-2-mary.guillemard@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807160900.149154-2-mary.guillemard@collabora.com>

Hi Mary,

kernel test robot noticed the following build errors:

[auto build test ERROR on f7f3ddb6e5c8dc7b621fd8c0903ea42190d67452]

url:    https://github.com/intel-lab-lkp/linux/commits/Mary-Guillemard/drm-panfrost-Add-SYSTEM_TIMESTAMP-and-SYSTEM_TIMESTAMP_FREQUENCY-parameters/20240808-032938
base:   f7f3ddb6e5c8dc7b621fd8c0903ea42190d67452
patch link:    https://lore.kernel.org/r/20240807160900.149154-2-mary.guillemard%40collabora.com
patch subject: [PATCH 1/3] drm/panfrost: Add SYSTEM_TIMESTAMP and SYSTEM_TIMESTAMP_FREQUENCY parameters
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240808/202408082014.XKxle32n-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408082014.XKxle32n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408082014.XKxle32n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panfrost/panfrost_drv.c:75:18: error: implicit declaration of function '__arch_counter_get_cntvct' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   param->value = __arch_counter_get_cntvct();
                                  ^
>> drivers/gpu/drm/panfrost/panfrost_drv.c:83:18: error: implicit declaration of function 'arch_timer_get_cntfrq' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   param->value = arch_timer_get_cntfrq();
                                  ^
   2 errors generated.


vim +/__arch_counter_get_cntvct +75 drivers/gpu/drm/panfrost/panfrost_drv.c

    26	
    27	static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct drm_file *file)
    28	{
    29		struct drm_panfrost_get_param *param = data;
    30		struct panfrost_device *pfdev = ddev->dev_private;
    31	
    32		if (param->pad != 0)
    33			return -EINVAL;
    34	
    35	#define PANFROST_FEATURE(name, member)			\
    36		case DRM_PANFROST_PARAM_ ## name:		\
    37			param->value = pfdev->features.member;	\
    38			break
    39	#define PANFROST_FEATURE_ARRAY(name, member, max)			\
    40		case DRM_PANFROST_PARAM_ ## name ## 0 ...			\
    41			DRM_PANFROST_PARAM_ ## name ## max:			\
    42			param->value = pfdev->features.member[param->param -	\
    43				DRM_PANFROST_PARAM_ ## name ## 0];		\
    44			break
    45	
    46		switch (param->param) {
    47			PANFROST_FEATURE(GPU_PROD_ID, id);
    48			PANFROST_FEATURE(GPU_REVISION, revision);
    49			PANFROST_FEATURE(SHADER_PRESENT, shader_present);
    50			PANFROST_FEATURE(TILER_PRESENT, tiler_present);
    51			PANFROST_FEATURE(L2_PRESENT, l2_present);
    52			PANFROST_FEATURE(STACK_PRESENT, stack_present);
    53			PANFROST_FEATURE(AS_PRESENT, as_present);
    54			PANFROST_FEATURE(JS_PRESENT, js_present);
    55			PANFROST_FEATURE(L2_FEATURES, l2_features);
    56			PANFROST_FEATURE(CORE_FEATURES, core_features);
    57			PANFROST_FEATURE(TILER_FEATURES, tiler_features);
    58			PANFROST_FEATURE(MEM_FEATURES, mem_features);
    59			PANFROST_FEATURE(MMU_FEATURES, mmu_features);
    60			PANFROST_FEATURE(THREAD_FEATURES, thread_features);
    61			PANFROST_FEATURE(MAX_THREADS, max_threads);
    62			PANFROST_FEATURE(THREAD_MAX_WORKGROUP_SZ,
    63					thread_max_workgroup_sz);
    64			PANFROST_FEATURE(THREAD_MAX_BARRIER_SZ,
    65					thread_max_barrier_sz);
    66			PANFROST_FEATURE(COHERENCY_FEATURES, coherency_features);
    67			PANFROST_FEATURE(AFBC_FEATURES, afbc_features);
    68			PANFROST_FEATURE_ARRAY(TEXTURE_FEATURES, texture_features, 3);
    69			PANFROST_FEATURE_ARRAY(JS_FEATURES, js_features, 15);
    70			PANFROST_FEATURE(NR_CORE_GROUPS, nr_core_groups);
    71			PANFROST_FEATURE(THREAD_TLS_ALLOC, thread_tls_alloc);
    72	
    73		case DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP:
    74	#ifdef CONFIG_ARM_ARCH_TIMER
  > 75			param->value = __arch_counter_get_cntvct();
    76	#else
    77			param->value = 0;
    78	#endif
    79			break;
    80	
    81		case DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP_FREQUENCY:
    82	#ifdef CONFIG_ARM_ARCH_TIMER
  > 83			param->value = arch_timer_get_cntfrq();
    84	#else
    85			param->value = 0;
    86	#endif
    87			break;
    88	
    89		default:
    90			return -EINVAL;
    91		}
    92	
    93		return 0;
    94	}
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
