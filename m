Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811B5B667;
	Wed, 11 Dec 2024 00:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733875747; cv=none; b=bR9yDw0hxD6xs3t2Q8OinTtgdDimDc57wLXox+G8RpsPGJufrKcHgwRZetZXBjC8mAlM3BKQUBC7t06+t0eBDIZkRDdaa699b4Ylaz8LVKultGlAujwfk6zQL0r6RKzAAulHNcObxAoiHGJK1hTOnLhRxeCqdGaYjQJ+TIy55Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733875747; c=relaxed/simple;
	bh=g6CyC/BzX8eZga8ay2UOtzdkAFjDo72TIkB+Z6JUk4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UApMQBkHO+9WTeRezPXX1laSzh2GlZ+S6RAekemCQ0MlcHRebvJBPrgAQwmlm6S7sT0mTBjx4KmMdnMr6HZaMQczSz+JTnRp/bk7fNEkadEaDvriNKuyaU9Ws5xR6+5R8JvOb7ioQZ2pHPMZ8UqxHQQgq/FW4i/bn4QWOAxFf4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJguYtdr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJguYtdr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733875746; x=1765411746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g6CyC/BzX8eZga8ay2UOtzdkAFjDo72TIkB+Z6JUk4U=;
  b=VJguYtdrBjWFXJTfeh+k7KvEk6xTQ5i9W2P3FGs7XkavmiTkPvrgO2dA
   Nvg1+8UME8pXadmVJiqxN6SbovWQJ6Zc3c3E9ShzemKYGdEnxqPRv2VWm
   ABAIsfs+UXJmBkyh4hM1eqnOlOwNP0NrvUJYd0uNGgtd1biQ37foeQoSn
   iitqo3e02KNjBg+66tFkulfThwZnrcybQDkIVI1d4yZveQ6WV0hMrda4p
   Sbwo0oTRHZF7fk8Jccp9wLK6ov3yM52BJ+JClZKcjLbeYBPW2oo8VpUSR
   S2O+paxh3JJZ9dE7ebSVRHgiQykc9HygdHJQhisBIXICb1gxIbXRptdsP
   A==;
X-CSE-ConnectionGUID: eQ5t2ZwNSWmIFJIXWo5YGA==
X-CSE-MsgGUID: tYoYjY5oT6CaILKQ1hzrFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33578139"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="33578139"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 16:09:05 -0800
X-CSE-ConnectionGUID: 5ve2hhvuRSyLY6SmtQDDYw==
X-CSE-MsgGUID: C89kgJdYStaeCtYSlvf0sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100637663"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Dec 2024 16:09:04 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLAHl-00064r-0k;
	Wed, 11 Dec 2024 00:09:01 +0000
Date: Wed, 11 Dec 2024 08:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 04/10] drm/i915/histogram: Add support for histogram
Message-ID: <202412110725.YaOtG2y8-lkp@intel.com>
References: <20241209162504.2146697-5-arun.r.murthy@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209162504.2146697-5-arun.r.murthy@intel.com>

Hi Arun,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.13-rc2 next-20241210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arun-R-Murthy/drm-crtc-Add-histogram-properties/20241210-003717
base:   linus/master
patch link:    https://lore.kernel.org/r/20241209162504.2146697-5-arun.r.murthy%40intel.com
patch subject: [PATCH 04/10] drm/i915/histogram: Add support for histogram
config: x86_64-randconfig-002-20241210 (https://download.01.org/0day-ci/archive/20241211/202412110725.YaOtG2y8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412110725.YaOtG2y8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412110725.YaOtG2y8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_histogram.c:7:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/display/intel_histogram.c:145:7: error: variable 'data' is uninitialized when used here [-Werror,-Wuninitialized]
     145 |         if (!data) {
         |              ^~~~
   drivers/gpu/drm/i915/display/intel_histogram.c:134:11: note: initialize the variable 'data' to silence this warning
     134 |         u32 *data;
         |                  ^
         |                   = NULL
   2 errors generated.


vim +/data +145 drivers/gpu/drm/i915/display/intel_histogram.c

   125	
   126	int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc,
   127					struct drm_property_blob *blob)
   128	{
   129		struct intel_histogram *histogram = intel_crtc->histogram;
   130		struct intel_display *display = to_intel_display(intel_crtc);
   131		int pipe = intel_crtc->pipe;
   132		int i = 0;
   133		struct drm_iet *iet;
   134		u32 *data;
   135		int ret;
   136	
   137		if (!histogram)
   138			return -EINVAL;
   139	
   140		if (!histogram->enable) {
   141			drm_err(display->drm, "histogram not enabled");
   142			return -EINVAL;
   143		}
   144	
 > 145		if (!data) {
   146			drm_err(display->drm, "enhancement LUT data is NULL");
   147			return -EINVAL;
   148		}
   149	
   150		/* Set DPST_CTL Bin Reg function select to IE & wait for a vblabk */
   151		intel_de_rmw(display, DPST_CTL(pipe),
   152			     DPST_CTL_BIN_REG_FUNC_SEL, DPST_CTL_BIN_REG_FUNC_IE);
   153	
   154		drm_crtc_wait_one_vblank(&intel_crtc->base);
   155	
   156		 /* Set DPST_CTL Bin Register Index to 0 */
   157		intel_de_rmw(display, DPST_CTL(pipe),
   158			     DPST_CTL_BIN_REG_MASK, DPST_CTL_BIN_REG_CLEAR);
   159	
   160		iet = (struct drm_iet *)blob->data;
   161		data = kzalloc(sizeof(data) * iet->nr_elements, GFP_KERNEL);
   162		if (!data)
   163			return -ENOMEM;
   164		ret = copy_from_user(data, (uint32_t __user *)(unsigned long)iet->data_ptr,
   165				     sizeof(uint32_t) * iet->nr_elements);
   166		if (ret)
   167			return ret;
   168	
   169		for (i = 0; i < HISTOGRAM_IET_LENGTH; i++) {
   170			intel_de_rmw(display, DPST_BIN(pipe),
   171				     DPST_BIN_DATA_MASK, data[i]);
   172			drm_dbg_atomic(display->drm, "iet_lut[%d]=%x\n", i, data[i]);
   173		}
   174		kfree(data);
   175		drm_property_blob_put(intel_crtc->base.state->histogram_iet);
   176	
   177		return 0;
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
