Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5347A1E3DCA;
	Tue,  3 Dec 2024 11:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733224657; cv=none; b=dUn2owjqNfn2gpJ1eR4UencOM5yd1BgsPVnUA4NLDmfP9UIRruqHVVifa7oC42x9PeZsp6Uc1s3xiC2RQg5oKfR5GC6JYpFsGi60PVfFg4K7EQG3344U1Fg6rl0M4wzn0QfwgumKNw0jK3VYmo5sBa539hjvB0/3yYHjpCHyvek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733224657; c=relaxed/simple;
	bh=WUP7Rv1JBd8ZkoXHNIMUuNArMdTVthZtNjKnM2FVP1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EY+T6YoLOY1LSf9QvG3idzBkdN/K0TRY22g7QHS6s5sVztbr8SZM6nKwTA3d/JTiEHc79JQimOKKO7gq5xLUHcAcdj7OSVxH5FPs1GAWWOVBV++TNAVDH0f05DS+hQ2wZj2WmfSX2jqBN3Zi9noGEOnKkSJCdeoZ5NbWhejpaZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKpqJXHA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKpqJXHA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733224655; x=1764760655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WUP7Rv1JBd8ZkoXHNIMUuNArMdTVthZtNjKnM2FVP1M=;
  b=TKpqJXHAt+eSFk/j5eKhLuSBiyQpM6Wj4vg+MWqYlEMow1oiRXNzmAB+
   DjbGhepsYS7G5NTx1wmgEZoqiWaz+ZQ5UqTqKNqXW4m6oaFR9TyyBBbIM
   tyN67oB3kTge66co0zv+In9YXJecds8BGZkORl/5h1u2uO4heK0a2WIag
   G9p5PxpkGWfNYbtIGJ+UKGYjARHCCKYTPwTCa5OLBS8zdQKUFV6mlWn0n
   ZcRLwVRKf5HktEysKnx1Trr9n9hcE9gxy0bgMy12piPQ2IbMzMlurpuK0
   nG0FUricrhF5XZA3vy0sNIC+qTSdZiHcTufQWjZJusWWmTw1dqwlyyS91
   w==;
X-CSE-ConnectionGUID: IOVWFpXEQXOBRL7JaD9sNA==
X-CSE-MsgGUID: D1ESpoxwTlKOtg8CnvT3jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37204376"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="37204376"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 03:17:35 -0800
X-CSE-ConnectionGUID: yDdXHjdASwmdqJ07VobOhQ==
X-CSE-MsgGUID: AAgOyGpFQyW+Bidw2f5IJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="124235677"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Dec 2024 03:17:33 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIQuJ-0000Zv-1Y;
	Tue, 03 Dec 2024 11:17:31 +0000
Date: Tue, 3 Dec 2024 19:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 05/10] drm/xe: Add histogram support to Xe builds
Message-ID: <202412031936.i7B3pzko-lkp@intel.com>
References: <20241203055520.1704661-6-arun.r.murthy@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203055520.1704661-6-arun.r.murthy@intel.com>

Hi Arun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.13-rc1 next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arun-R-Murthy/drm-crtc-Add-histogram-properties/20241203-140702
base:   linus/master
patch link:    https://lore.kernel.org/r/20241203055520.1704661-6-arun.r.murthy%40intel.com
patch subject: [PATCH 05/10] drm/xe: Add histogram support to Xe builds
config: i386-buildonly-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031936.i7B3pzko-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031936.i7B3pzko-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031936.i7B3pzko-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_histogram.c:7:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/display/intel_histogram.c:145:7: warning: variable 'data' is uninitialized when used here [-Wuninitialized]
     145 |         if (!data) {
         |              ^~~~
   drivers/gpu/drm/i915/display/intel_histogram.c:134:11: note: initialize the variable 'data' to silence this warning
     134 |         u32 *data;
         |                  ^
         |                   = NULL
   2 warnings generated.


vim +/data +145 drivers/gpu/drm/i915/display/intel_histogram.c

9d86b8b56c6c738 Arun R Murthy 2024-12-03  125  
9d86b8b56c6c738 Arun R Murthy 2024-12-03  126  int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc,
9d86b8b56c6c738 Arun R Murthy 2024-12-03  127  				struct drm_property_blob *blob)
9d86b8b56c6c738 Arun R Murthy 2024-12-03  128  {
9d86b8b56c6c738 Arun R Murthy 2024-12-03  129  	struct intel_histogram *histogram = intel_crtc->histogram;
9d86b8b56c6c738 Arun R Murthy 2024-12-03  130  	struct intel_display *display = to_intel_display(intel_crtc);
9d86b8b56c6c738 Arun R Murthy 2024-12-03  131  	int pipe = intel_crtc->pipe;
9d86b8b56c6c738 Arun R Murthy 2024-12-03  132  	int i = 0;
9d86b8b56c6c738 Arun R Murthy 2024-12-03  133  	struct drm_histogram *hist;
9d86b8b56c6c738 Arun R Murthy 2024-12-03  134  	u32 *data;
9d86b8b56c6c738 Arun R Murthy 2024-12-03  135  	int ret;
9d86b8b56c6c738 Arun R Murthy 2024-12-03  136  
9d86b8b56c6c738 Arun R Murthy 2024-12-03  137  	if (!histogram)
9d86b8b56c6c738 Arun R Murthy 2024-12-03  138  		return -EINVAL;
9d86b8b56c6c738 Arun R Murthy 2024-12-03  139  
9d86b8b56c6c738 Arun R Murthy 2024-12-03  140  	if (!histogram->enable) {
9d86b8b56c6c738 Arun R Murthy 2024-12-03  141  		drm_err(display->drm, "histogram not enabled");
9d86b8b56c6c738 Arun R Murthy 2024-12-03  142  		return -EINVAL;
9d86b8b56c6c738 Arun R Murthy 2024-12-03  143  	}
9d86b8b56c6c738 Arun R Murthy 2024-12-03  144  
9d86b8b56c6c738 Arun R Murthy 2024-12-03 @145  	if (!data) {
9d86b8b56c6c738 Arun R Murthy 2024-12-03  146  		drm_err(display->drm, "enhancement LUT data is NULL");
9d86b8b56c6c738 Arun R Murthy 2024-12-03  147  		return -EINVAL;
9d86b8b56c6c738 Arun R Murthy 2024-12-03  148  	}
9d86b8b56c6c738 Arun R Murthy 2024-12-03  149  
9d86b8b56c6c738 Arun R Murthy 2024-12-03  150  	/* Set DPST_CTL Bin Reg function select to IE & wait for a vblabk */
9d86b8b56c6c738 Arun R Murthy 2024-12-03  151  	intel_de_rmw(display, DPST_CTL(pipe),
9d86b8b56c6c738 Arun R Murthy 2024-12-03  152  		     DPST_CTL_BIN_REG_FUNC_SEL, DPST_CTL_BIN_REG_FUNC_IE);
9d86b8b56c6c738 Arun R Murthy 2024-12-03  153  
9d86b8b56c6c738 Arun R Murthy 2024-12-03  154  	drm_crtc_wait_one_vblank(&intel_crtc->base);
9d86b8b56c6c738 Arun R Murthy 2024-12-03  155  
9d86b8b56c6c738 Arun R Murthy 2024-12-03  156  	 /* Set DPST_CTL Bin Register Index to 0 */
9d86b8b56c6c738 Arun R Murthy 2024-12-03  157  	intel_de_rmw(display, DPST_CTL(pipe),
9d86b8b56c6c738 Arun R Murthy 2024-12-03  158  		     DPST_CTL_BIN_REG_MASK, DPST_CTL_BIN_REG_CLEAR);
9d86b8b56c6c738 Arun R Murthy 2024-12-03  159  
9d86b8b56c6c738 Arun R Murthy 2024-12-03  160  	hist = (struct drm_histogram *)blob->data;
9d86b8b56c6c738 Arun R Murthy 2024-12-03  161  	data = kzalloc(sizeof(data) * hist->nr_elements, GFP_KERNEL);
9d86b8b56c6c738 Arun R Murthy 2024-12-03  162  	if (!data)
9d86b8b56c6c738 Arun R Murthy 2024-12-03  163  		return -ENOMEM;
9d86b8b56c6c738 Arun R Murthy 2024-12-03  164  	ret = copy_from_user(data, (uint32_t __user *)(unsigned long)hist->data_ptr,
9d86b8b56c6c738 Arun R Murthy 2024-12-03  165  			     sizeof(uint32_t) * hist->nr_elements);
9d86b8b56c6c738 Arun R Murthy 2024-12-03  166  	if (ret)
9d86b8b56c6c738 Arun R Murthy 2024-12-03  167  		return ret;
9d86b8b56c6c738 Arun R Murthy 2024-12-03  168  
9d86b8b56c6c738 Arun R Murthy 2024-12-03  169  	for (i = 0; i < HISTOGRAM_IET_LENGTH; i++) {
9d86b8b56c6c738 Arun R Murthy 2024-12-03  170  		intel_de_rmw(display, DPST_BIN(pipe),
9d86b8b56c6c738 Arun R Murthy 2024-12-03  171  			     DPST_BIN_DATA_MASK, data[i]);
9d86b8b56c6c738 Arun R Murthy 2024-12-03  172  		drm_dbg_atomic(display->drm, "iet_lut[%d]=%x\n", i, data[i]);
9d86b8b56c6c738 Arun R Murthy 2024-12-03  173  	}
9d86b8b56c6c738 Arun R Murthy 2024-12-03  174  	kfree(data);
9d86b8b56c6c738 Arun R Murthy 2024-12-03  175  	drm_property_blob_put(intel_crtc->base.state->histogram_iet);
9d86b8b56c6c738 Arun R Murthy 2024-12-03  176  
9d86b8b56c6c738 Arun R Murthy 2024-12-03  177  	return 0;
9d86b8b56c6c738 Arun R Murthy 2024-12-03  178  }
9d86b8b56c6c738 Arun R Murthy 2024-12-03  179  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
