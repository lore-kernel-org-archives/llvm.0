Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220F91BF329;
	Fri, 28 Jun 2024 14:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719584305; cv=none; b=aJ6rImR5omx8KDRNjNyqY0zyYHR5JEg9vEiOXEp9wHV2a9LiQoINT6tCqG0abI5gkLo3G77m6ReJ4JYyhrjyUFvfohdjekGk/IBDT0SqGd8tIk50Twf6v6jGLuyPxxVMGslPVgG0KTfLLswK8RxBtnOQ+ZgOxAUbsMwz33gyqVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719584305; c=relaxed/simple;
	bh=1YJJG5D7+u3FmINigAy0zveGXvWefge1uVMDVisu0LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDZCvvfKSsUrFpSMT5ujkGjeIO66726nZ21DZ3S7ggDs9EJ4luxX6+RPfawDACZNbq9FdckPtv3OpAJBDuIyKKgg49OrQE9o2lJflxOOKhNvVjmtQ+kg+jjAWxQYpHaa1YIx5vdpDHsLzcsu+ibtaGGaUv4Sk1uOjUkluu70jQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ad6qjDNx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ad6qjDNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719584304; x=1751120304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1YJJG5D7+u3FmINigAy0zveGXvWefge1uVMDVisu0LA=;
  b=Ad6qjDNxpal7S3KHAIrlX3e4oSC9+4TQjCB2xuQPZ/5baULH0y0vXgW+
   f1Vsn5qnDUKOQ+z0I+S6SYlCX1muj6CQISoV2gTjG2o1RWSw19QKxC3Dh
   qQJzMGWsMNWQ+Z88bgQBvXnNuiVGC4WzKJhAHokonli6UvuYeeMQuby+q
   0zN1At3sjv9rj5eWGWWUhMGBQnwaApCEIovjw2hoSvtaEYU16EYxrEX3h
   oMTviqADa8cfMt8F6c12+V4ybUTE9JtWB60/ZePpGMrKLkmR5L68f+19V
   MLUYQUjK04LV0PmPSo4M2VjjoXZqRE/8Qg2Urq1qONWWP0MF/r3oYbXMW
   g==;
X-CSE-ConnectionGUID: E3iQfcoZQ46LYyiUyTyONw==
X-CSE-MsgGUID: Onw6zGiOQ96He4ueOcEGUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="34212461"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="34212461"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 07:18:22 -0700
X-CSE-ConnectionGUID: FyBt4nggTt2iWY7Wx6F2yQ==
X-CSE-MsgGUID: Gu4d2bXORkC1ryhkIQX7Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="44806973"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jun 2024 07:18:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNCQb-000HCA-1A;
	Fri, 28 Jun 2024 14:18:17 +0000
Date: Fri, 28 Jun 2024 22:17:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] drm/connector: automatically set immutable flag for
 max_bpc property
Message-ID: <202406282224.4sie1QiJ-lkp@intel.com>
References: <20240623-drm-bridge-connector-fix-hdmi-reset-v1-2-41e9894dcdec@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240623-drm-bridge-connector-fix-hdmi-reset-v1-2-41e9894dcdec@linaro.org>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2102cb0d050d34d50b9642a3a50861787527e922]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-bridge-connector-reset-the-HDMI-connector-state/20240626-024615
base:   2102cb0d050d34d50b9642a3a50861787527e922
patch link:    https://lore.kernel.org/r/20240623-drm-bridge-connector-fix-hdmi-reset-v1-2-41e9894dcdec%40linaro.org
patch subject: [PATCH 2/2] drm/connector: automatically set immutable flag for max_bpc property
config: i386-randconfig-003-20240628 (https://download.01.org/0day-ci/archive/20240628/202406282224.4sie1QiJ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406282224.4sie1QiJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406282224.4sie1QiJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_connector.c:2613:7: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
    2613 |                 u32 flags = 0;
         |                     ^
   1 warning generated.


vim +/flags +2613 drivers/gpu/drm/drm_connector.c

  2593	
  2594	/**
  2595	 * drm_connector_attach_max_bpc_property - attach "max bpc" property
  2596	 * @connector: connector to attach max bpc property on.
  2597	 * @min: The minimum bit depth supported by the connector.
  2598	 * @max: The maximum bit depth supported by the connector.
  2599	 *
  2600	 * This is used to add support for limiting the bit depth on a connector.
  2601	 *
  2602	 * Returns:
  2603	 * Zero on success, negative errno on failure.
  2604	 */
  2605	int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
  2606						  int min, int max)
  2607	{
  2608		struct drm_device *dev = connector->dev;
  2609		struct drm_property *prop;
  2610	
  2611		prop = connector->max_bpc_property;
  2612		if (!prop) {
> 2613			u32 flags = 0;
  2614	
  2615			if (min == max)
  2616				flags |= DRM_MODE_PROP_IMMUTABLE;
  2617	
  2618			prop = drm_property_create_range(dev, 0, "max bpc", min, max);
  2619			if (!prop)
  2620				return -ENOMEM;
  2621	
  2622			connector->max_bpc_property = prop;
  2623		}
  2624	
  2625		drm_object_attach_property(&connector->base, prop, max);
  2626		connector->state->max_requested_bpc = max;
  2627		connector->state->max_bpc = max;
  2628	
  2629		return 0;
  2630	}
  2631	EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
  2632	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
