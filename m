Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111BAC2EA;
	Sun, 28 Dec 2025 13:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766927042; cv=none; b=pbhEPsIf08D7+xgxVuL1xZCkOHozWNMV9LAw4voYcWpfWR8l0KNNhor89ZgfnRhxaD4q1dyqq3NN/SOl0iJB7DUgbImEHD/2qwEJzR6B3hdT3jqAzk9LEnEGmN3pqFx6uUePq3bnK8QGpU9JGSbsX5lhH2emtTsJxpnZ5j0v6bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766927042; c=relaxed/simple;
	bh=jWf0ut3gAMoXBzAN1n2GJhgWrWO9cVj+r4UhQg18Tk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YccnQXP+6yGbT2xyv+b6GcrguCXc+IiWHyQBAQBL5lT4f/MeB/pw62J+qeee3yXgtqK5q9AS0+cLRM1FWI5tB6m33smQSutVPtagBksG+INmGLHtf/Z0PKAJfg80jay95ZSukNnj30kFkktz+8KPXPxWpgzrg+IDNa4GcQaW1r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQ/95CLL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQ/95CLL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766927041; x=1798463041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jWf0ut3gAMoXBzAN1n2GJhgWrWO9cVj+r4UhQg18Tk4=;
  b=CQ/95CLLocMZ1CjUBKHvhuB7yC/JqwNoVIHdd4lnD/QOxkMVcA2FQyup
   iipKpc6B15PA5nAsywHBXMmhVXAunqsx0lrFJaYrAl8oysrvTd4/p7Sww
   ZrXGjEF5LEgIHWNSIw91Y+0+hvPTlk6JPotKGS96Yx7MHdUdzxuuXP+8p
   ZhGcKplaadz5xHHXLa1jfOu04KTZFK9DWXoVADnJFvT4YZP0Hu7hBLfQt
   mR7UHWV4oYCI6fG0rnCkPl6po8ed9N/sba5CgB62mzxbpb8St616MzjiL
   enqKg8FntmsgxW1cw+ddJMUMepxe6DYsSVXAKPFVdx06JK+7loo3D4HW7
   w==;
X-CSE-ConnectionGUID: g6a+cxVkRJCuV9zvay1VuA==
X-CSE-MsgGUID: Hpvc9NO8QjeLWwZxKChFIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="79939371"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="79939371"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 05:04:01 -0800
X-CSE-ConnectionGUID: 0onEPtczSPmMnFonx103Hw==
X-CSE-MsgGUID: U3Fp+QloSLCTvbYtK7XXSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="200619545"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 Dec 2025 05:03:57 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZqR8-000000006Tl-1Y9O;
	Sun, 28 Dec 2025 13:03:54 +0000
Date: Sun, 28 Dec 2025 21:03:30 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 3/3] drm/atomic: verify that gamma/degamma LUTs are
 not too big
Message-ID: <202512282045.vcM3bTwk-lkp@intel.com>
References: <20251228-drm-fix-lut-checks-v2-3-50f5d1a260a7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228-drm-fix-lut-checks-v2-3-50f5d1a260a7@oss.qualcomm.com>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on 130343ee6bca9895c47d314467db7dd3dcc8bc35]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-mode_object-add-drm_object_immutable_property_get_value/20251228-112526
base:   130343ee6bca9895c47d314467db7dd3dcc8bc35
patch link:    https://lore.kernel.org/r/20251228-drm-fix-lut-checks-v2-3-50f5d1a260a7%40oss.qualcomm.com
patch subject: [PATCH v2 3/3] drm/atomic: verify that gamma/degamma LUTs are not too big
config: x86_64-randconfig-076-20251228 (https://download.01.org/0day-ci/archive/20251228/202512282045.vcM3bTwk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512282045.vcM3bTwk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512282045.vcM3bTwk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_atomic_uapi.c:416:9: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     416 |                 const elem_size = sizeof(struct drm_color_lut);
         |                 ~~~~~ ^
         |                 int
   drivers/gpu/drm/drm_atomic_uapi.c:441:9: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     441 |                 const elem_size = sizeof(struct drm_color_lut);
         |                 ~~~~~ ^
         |                 int
   2 errors generated.


vim +/int +416 drivers/gpu/drm/drm_atomic_uapi.c

   395	
   396	static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
   397			struct drm_crtc_state *state, struct drm_property *property,
   398			uint64_t val)
   399	{
   400		struct drm_device *dev = crtc->dev;
   401		struct drm_mode_config *config = &dev->mode_config;
   402		bool replaced = false;
   403		int ret;
   404	
   405		if (property == config->prop_active)
   406			state->active = val;
   407		else if (property == config->prop_mode_id) {
   408			struct drm_property_blob *mode =
   409				drm_property_lookup_blob(dev, val);
   410			ret = drm_atomic_set_mode_prop_for_crtc(state, mode);
   411			drm_property_blob_put(mode);
   412			return ret;
   413		} else if (property == config->prop_vrr_enabled) {
   414			state->vrr_enabled = val;
   415		} else if (property == config->degamma_lut_property) {
 > 416			const elem_size = sizeof(struct drm_color_lut);
   417			u64 lut_size;
   418	
   419			ret = drm_object_immutable_property_get_value(&crtc->base,
   420								      config->degamma_lut_size_property,
   421								      &lut_size);
   422			if (ret)
   423				return ret;
   424	
   425			ret = drm_property_replace_blob_from_id(dev,
   426						&state->degamma_lut,
   427						val,
   428						elem_size * lut_size, -1, elem_size,
   429						&replaced);
   430			state->color_mgmt_changed |= replaced;
   431			return ret;
   432		} else if (property == config->ctm_property) {
   433			ret = drm_property_replace_blob_from_id(dev,
   434						&state->ctm,
   435						val,
   436						-1, sizeof(struct drm_color_ctm), -1,
   437						&replaced);
   438			state->color_mgmt_changed |= replaced;
   439			return ret;
   440		} else if (property == config->gamma_lut_property) {
   441			const elem_size = sizeof(struct drm_color_lut);
   442			u64 lut_size;
   443	
   444			ret = drm_object_immutable_property_get_value(&crtc->base,
   445								      config->gamma_lut_size_property,
   446								      &lut_size);
   447			if (ret)
   448				return ret;
   449	
   450			ret = drm_property_replace_blob_from_id(dev,
   451						&state->gamma_lut,
   452						val,
   453						elem_size * lut_size, -1, elem_size,
   454						&replaced);
   455			state->color_mgmt_changed |= replaced;
   456			return ret;
   457		} else if (property == config->prop_out_fence_ptr) {
   458			s32 __user *fence_ptr = u64_to_user_ptr(val);
   459	
   460			if (!fence_ptr)
   461				return 0;
   462	
   463			if (put_user(-1, fence_ptr))
   464				return -EFAULT;
   465	
   466			set_out_fence_for_crtc(state->state, crtc, fence_ptr);
   467		} else if (property == crtc->scaling_filter_property) {
   468			state->scaling_filter = val;
   469		} else if (property == crtc->sharpness_strength_property) {
   470			state->sharpness_strength = val;
   471		} else if (crtc->funcs->atomic_set_property) {
   472			return crtc->funcs->atomic_set_property(crtc, state, property, val);
   473		} else {
   474			drm_dbg_atomic(crtc->dev,
   475				       "[CRTC:%d:%s] unknown property [PROP:%d:%s]\n",
   476				       crtc->base.id, crtc->name,
   477				       property->base.id, property->name);
   478			return -EINVAL;
   479		}
   480	
   481		return 0;
   482	}
   483	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
