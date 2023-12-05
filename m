Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097CED26E;
	Tue,  5 Dec 2023 05:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDYI6Wow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701754992; x=1733290992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1l/T6y2xcV2nRQlqE65TsylyOoLxZOhQmgaILAnve0s=;
  b=eDYI6WowNdAe7AKR3W6XTU0ikzLBTElDPV7VT1Bq2VTD4ugQSak4+JtF
   eVHgsIpBlSnoGWre1QBRr2yVgHmRvohnF3WeDLxV1DVzq3l+zlcuz2HQl
   5/W5EqX1l6ePJeFZ2/pIcbVU4bnooIOCil8A3+m48iUHa6WVvOjB0Gpzg
   7or+ifsX+6ebFYNVdWz6+ZswA+Y5cA3k5U2nMtAIzTv71A+THmP/viCX3
   g+e+vUznm83iZR5GCn9Ce4H37O79sUSID8TsY+eac4Zgfi6wgqZRMXout
   z0Ucu2/6K/x0VHoT3n6W7ZJaS2VLCG3MY5lK/A+JC++h/dX9Bzf+LARlM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="7186191"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="7186191"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 21:43:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764212962"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="764212962"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2023 21:43:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAOD2-0008Os-34;
	Tue, 05 Dec 2023 05:43:04 +0000
Date: Tue, 5 Dec 2023 13:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Jonker <jbx6244@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 1690/4884]
 drivers/gpu/drm/rockchip/rk3066_hdmi.c:397:15: error: call to undeclared
 function 'drm_atomic_get_new_connector_state'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202312051333.Z0rH44Jk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f5f12ac05f36f117e793656c3f560625e927f1b
commit: ae3436a5e7c2ef4f92938133bd99f92fc47ea34e [1690/4884] drm/rockchip: rk3066_hdmi: Switch encoder hooks to atomic
config: x86_64-buildonly-randconfig-003-20231204 (https://download.01.org/0day-ci/archive/20231205/202312051333.Z0rH44Jk-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051333.Z0rH44Jk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051333.Z0rH44Jk-lkp@intel.com/

Note: the linux-next/master HEAD 0f5f12ac05f36f117e793656c3f560625e927f1b builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/rockchip/rk3066_hdmi.c:397:15: error: call to undeclared function 'drm_atomic_get_new_connector_state'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
                        ^
   drivers/gpu/drm/rockchip/rk3066_hdmi.c:397:15: note: did you mean 'drm_atomic_helper_connector_reset'?
   include/drm/drm_atomic_state_helper.h:73:6: note: 'drm_atomic_helper_connector_reset' declared here
   void drm_atomic_helper_connector_reset(struct drm_connector *connector);
        ^
>> drivers/gpu/drm/rockchip/rk3066_hdmi.c:397:13: error: incompatible integer to pointer conversion assigning to 'struct drm_connector_state *' from 'int' [-Wint-conversion]
           conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/rockchip/rk3066_hdmi.c:401:15: error: call to undeclared function 'drm_atomic_get_new_crtc_state'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
                        ^
>> drivers/gpu/drm/rockchip/rk3066_hdmi.c:401:13: error: incompatible integer to pointer conversion assigning to 'struct drm_crtc_state *' from 'int' [-Wint-conversion]
           crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +/drm_atomic_get_new_connector_state +397 drivers/gpu/drm/rockchip/rk3066_hdmi.c

   388	
   389	static void rk3066_hdmi_encoder_enable(struct drm_encoder *encoder,
   390					       struct drm_atomic_state *state)
   391	{
   392		struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);
   393		struct drm_connector_state *conn_state;
   394		struct drm_crtc_state *crtc_state;
   395		int mux, val;
   396	
 > 397		conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
   398		if (WARN_ON(!conn_state))
   399			return;
   400	
 > 401		crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
   402		if (WARN_ON(!crtc_state))
   403			return;
   404	
   405		mux = drm_of_encoder_active_endpoint_id(hdmi->dev->of_node, encoder);
   406		if (mux)
   407			val = (HDMI_VIDEO_SEL << 16) | HDMI_VIDEO_SEL;
   408		else
   409			val = HDMI_VIDEO_SEL << 16;
   410	
   411		regmap_write(hdmi->grf_regmap, GRF_SOC_CON0, val);
   412	
   413		DRM_DEV_DEBUG(hdmi->dev, "hdmi encoder enable select: vop%s\n",
   414			      (mux) ? "1" : "0");
   415	
   416		rk3066_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
   417	}
   418	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
