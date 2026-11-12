Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511132;
	b=YJl7b9aneWqv7mkDZv5leuUA1JTb96birgzm7te/jHQguNk5kU1ZpYT8vXKPg+2XK00v
	 GmumzNAru6d03WmkN16BMDm3UuAUuTdD4HRQeXWVuUOexHpFsE6Is/9ucTf3zxYlz/gJb
	 Opa/BFNot1UTUi4+/utv6bx6LXMd+s+h41QrnRZKOZuPF+Tnm5EM/lc1SupijyfK5eMSE
	 v0jv2WMR4ha5KDsSaYaOqbbgxaS24Zrgmx3JHgqUMSA2R6Zp2aVeQkBvcNM1I8qqOxXrm
	 QJT2O2UHrAKdyTTnzPcVFhlDBWfdqOVhoiGBjIFRR8Ga9hHCNvBv3udsq8bg6bLhxFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511132;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=KUX9Kp7rugzb85h8aP+l+coCUtMaZ8SyT8yGv5cQAlM=;
	b=lfVOgQ2GDVyXDfHhQVoZ9XnJhsjIK4A01ceuhIQBK7IPMkVJqso7NmlrSbJZzHnm03qt
	 VVZtz00gtM5Mw2FakPG/zfyPDWM3RHUuuTiYSNJ8P4bwEXqKSlE7svLnqykCIY5V1jufu
	 H4NkQ5hTL76IK5xoeGGb1YnjW3JPeq+/tY4EzxzA0/C3BhEsaT2FAK/yKVbFjBr+6u95Q
	 +fmlVl3dpb6/J0639F45r0npmO4GXgUV46Y0grKjsOvnOBLv6n1UT7/2w9ifnOzAzO0Ny
	 1AfjUmUolb0ktX8vaSjm1PkU5bVTlycSm6v0qMwIpL2MZjxO/q6SAV2Kpp4+td2CGXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J23Fb+h4;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03902606A331;
	Thu, 12 Nov 2026 19:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03902606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J23Fb+h4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794511132; x=1826047132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oMA/J307GiWr7pjLQSBMNuFd4qK6A/nv6EG2AHccV4g=;
  b=J23Fb+h49MQm+cknDPFmQpn7vj4BOINFLVD4pLDXBf3mrXrUleSg1Ohd
   F/AqCtOuZV3p+J/cw8gswM7ECQvXHZH7ihJd0oiKpyglrxYBzUN+bnty/
   mZhBmPRfm6EAYVT7qdgjesyronLa4LBIEJioeyXWYQy1hvp4cYeJH+mLE
   6aMpAveHi8ycLyUua0u4Z21/ME7Ahqw81IEe3B6tT+4c7/eLGLKoAg7Xj
   4bJEdiffsNQ509mrq7Ay0Zb17wB2mIHUgpVcqOU16gtx8FZmO7+UVGsvt
   qK38Auz6gObP/GjxY3UoeZTNw8ObXhd6LbhsolFrllyfaUdQCNso9StWQ
   A==;
X-CSE-ConnectionGUID: L06HEltFSDic09jOSZIeEA==
X-CSE-MsgGUID: yg1W6nrbSSidXeTUwmHRZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3312467"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3312467"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 11:18:51 -0800
X-CSE-ConnectionGUID: qgDRMUM/TmKsra+nLMa60w==
X-CSE-MsgGUID: h6iuzYxaQ/+3lAplAH9S8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="9075974"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Nov 2026 11:18:48 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRaJp-000000011xr-08jx;
	Thu, 12 Nov 2026 19:18:45 +0000
Date: Fri, 13 Nov 2026 03:18:01 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
	christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/2] drm: Remove drm_crtc_init()
Message-ID: <202611130312.g6BELEWG-lkp@intel.com>
References: <20261112125039.66082-3-tzimmermann@suse.de>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112125039.66082-3-tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v7.4-rc2 next-20261111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-radeon-Inline-drm_crtc_init/20261112-134508
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261112125039.66082-3-tzimmermann%40suse.de
patch subject: [PATCH v2 2/2] drm: Remove drm_crtc_init()
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20261113/202611130312.g6BELEWG-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c628d639fc66f8e6d8ab1f0cc6b1df38f974e020)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130312.g6BELEWG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130312.g6BELEWG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/dce_v8_0.c:2603:2: error: call to undeclared function 'drm_crtc_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2603 |         drm_crtc_init(adev_to_drm(adev), &amdgpu_crtc->base, &dce_v8_0_crtc_funcs);
         |         ^
   1 error generated.
--
>> drivers/gpu/drm/amd/amdgpu/dce_v6_0.c:2645:2: error: call to undeclared function 'drm_crtc_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2645 |         drm_crtc_init(adev_to_drm(adev), &amdgpu_crtc->base, &dce_v6_0_crtc_funcs);
         |         ^
   1 error generated.
--
>> drivers/gpu/drm/amd/amdgpu/dce_v10_0.c:2677:2: error: call to undeclared function 'drm_crtc_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2677 |         drm_crtc_init(adev_to_drm(adev), &amdgpu_crtc->base, &dce_v10_0_crtc_funcs);
         |         ^
   1 error generated.


vim +/drm_crtc_init +2603 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c

7e50642d41050c Alex Deucher 2024-10-31  2593  
a2e73f56fa6282 Alex Deucher 2015-04-20  2594  static int dce_v8_0_crtc_init(struct amdgpu_device *adev, int index)
a2e73f56fa6282 Alex Deucher 2015-04-20  2595  {
a2e73f56fa6282 Alex Deucher 2015-04-20  2596  	struct amdgpu_crtc *amdgpu_crtc;
a2e73f56fa6282 Alex Deucher 2015-04-20  2597  
a2e73f56fa6282 Alex Deucher 2015-04-20  2598  	amdgpu_crtc = kzalloc(sizeof(struct amdgpu_crtc) +
a2e73f56fa6282 Alex Deucher 2015-04-20  2599  			      (AMDGPUFB_CONN_LIMIT * sizeof(struct drm_connector *)), GFP_KERNEL);
a2e73f56fa6282 Alex Deucher 2015-04-20  2600  	if (amdgpu_crtc == NULL)
a2e73f56fa6282 Alex Deucher 2015-04-20  2601  		return -ENOMEM;
a2e73f56fa6282 Alex Deucher 2015-04-20  2602  
4a580877bdcb83 Luben Tuikov 2020-08-24 @2603  	drm_crtc_init(adev_to_drm(adev), &amdgpu_crtc->base, &dce_v8_0_crtc_funcs);
a2e73f56fa6282 Alex Deucher 2015-04-20  2604  
a2e73f56fa6282 Alex Deucher 2015-04-20  2605  	drm_mode_crtc_set_gamma_size(&amdgpu_crtc->base, 256);
a2e73f56fa6282 Alex Deucher 2015-04-20  2606  	amdgpu_crtc->crtc_id = index;
a2e73f56fa6282 Alex Deucher 2015-04-20  2607  	adev->mode_info.crtcs[index] = amdgpu_crtc;
a2e73f56fa6282 Alex Deucher 2015-04-20  2608  
a2e73f56fa6282 Alex Deucher 2015-04-20  2609  	amdgpu_crtc->max_cursor_width = CIK_CURSOR_WIDTH;
a2e73f56fa6282 Alex Deucher 2015-04-20  2610  	amdgpu_crtc->max_cursor_height = CIK_CURSOR_HEIGHT;
4a580877bdcb83 Luben Tuikov 2020-08-24  2611  	adev_to_drm(adev)->mode_config.cursor_width = amdgpu_crtc->max_cursor_width;
4a580877bdcb83 Luben Tuikov 2020-08-24  2612  	adev_to_drm(adev)->mode_config.cursor_height = amdgpu_crtc->max_cursor_height;
a2e73f56fa6282 Alex Deucher 2015-04-20  2613  
a2e73f56fa6282 Alex Deucher 2015-04-20  2614  	amdgpu_crtc->crtc_offset = crtc_offsets[amdgpu_crtc->crtc_id];
a2e73f56fa6282 Alex Deucher 2015-04-20  2615  
a2e73f56fa6282 Alex Deucher 2015-04-20  2616  	amdgpu_crtc->pll_id = ATOM_PPLL_INVALID;
a2e73f56fa6282 Alex Deucher 2015-04-20  2617  	amdgpu_crtc->adjusted_clock = 0;
a2e73f56fa6282 Alex Deucher 2015-04-20  2618  	amdgpu_crtc->encoder = NULL;
a2e73f56fa6282 Alex Deucher 2015-04-20  2619  	amdgpu_crtc->connector = NULL;
a2e73f56fa6282 Alex Deucher 2015-04-20  2620  	drm_crtc_helper_add(&amdgpu_crtc->base, &dce_v8_0_crtc_helper_funcs);
7e50642d41050c Alex Deucher 2024-10-31  2621  	drm_plane_helper_add(amdgpu_crtc->base.primary, &dce_v8_0_drm_primary_plane_helper_funcs);
a2e73f56fa6282 Alex Deucher 2015-04-20  2622  
a2e73f56fa6282 Alex Deucher 2015-04-20  2623  	return 0;
a2e73f56fa6282 Alex Deucher 2015-04-20  2624  }
a2e73f56fa6282 Alex Deucher 2015-04-20  2625  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
