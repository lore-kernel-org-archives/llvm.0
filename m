Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B8E2105
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 07:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651649579; x=1683185579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MHhfMqQDOoJ9yfAH++kCDJ9iYJiXmFxk5uyPkNVpZ2s=;
  b=XZHxh9is7cU+I2Zm2exFuTN9NMo3lcKqdCAfPrwy0QTNDemqH7Gj4d8Y
   A2HyIAB7EMnd8N+eZtxsLUCOTpjvQ43BSOytp9d2DGLKEjfMDqzbk++kU
   b16XRcM3C8eMskMzkQ7c8jj9IxIj2NkEKf9Q5uour5gtDxmoG1wFP1Q3L
   XyLSINST6zcm4XUWLJ/yAN8wz0FlnEfK9UK61MCCS9jJN2vBr/uY0Jt4s
   +WCT4TNXlnulSXJfy6qTYJPs+l3ifBHRBci/W3H7un6hQI6pcRS0TkwQz
   BUJ/aElPq6mde12+h7GRGI96tGobM2qQVi3McC5UNvD6CV7W06CRhCKTt
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="292879984"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="292879984"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 00:32:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="548416555"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 May 2022 00:32:56 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nm9VI-000BAw-0u;
	Wed, 04 May 2022 07:32:56 +0000
Date: Wed, 4 May 2022 15:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [vsyrjala:crtc_clock_compute_8 10/26]
 drivers/gpu/drm/i915/display/intel_ddi.c:325:5: error: no previous prototype
 for function 'intel_crtc_dotclock'
Message-ID: <202205041506.Q9YdhHrE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/vsyrjala/linux.git crtc_clock_compute_8
head:   aee27a93a2e9c552d016d4eadaff5aa87dccce13
commit: eb839775996f072098b810f91bc34757d1ea008e [10/26] drm/i915: Extract intel_crtc_dotclock()
config: x86_64-randconfig-r023-20220502 (https://download.01.org/0day-ci/archive/20220504/202205041506.Q9YdhHrE-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/vsyrjala/linux/commit/eb839775996f072098b810f91bc34757d1ea008e
        git remote add vsyrjala https://github.com/vsyrjala/linux.git
        git fetch --no-tags vsyrjala crtc_clock_compute_8
        git checkout eb839775996f072098b810f91bc34757d1ea008e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_ddi.c:325:5: error: no previous prototype for function 'intel_crtc_dotclock' [-Werror,-Wmissing-prototypes]
   int intel_crtc_dotclock(const struct intel_crtc_state *pipe_config)
       ^
   drivers/gpu/drm/i915/display/intel_ddi.c:325:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int intel_crtc_dotclock(const struct intel_crtc_state *pipe_config)
   ^
   static 
   1 error generated.


vim +/intel_crtc_dotclock +325 drivers/gpu/drm/i915/display/intel_ddi.c

   324	
 > 325	int intel_crtc_dotclock(const struct intel_crtc_state *pipe_config)
   326	{
   327		int dotclock;
   328	
   329		if (intel_crtc_has_dp_encoder(pipe_config))
   330			dotclock = intel_dotclock_calculate(pipe_config->port_clock,
   331							    &pipe_config->dp_m_n);
   332		else if (pipe_config->has_hdmi_sink && pipe_config->pipe_bpp > 24)
   333			dotclock = pipe_config->port_clock * 24 / pipe_config->pipe_bpp;
   334		else
   335			dotclock = pipe_config->port_clock;
   336	
   337		if (pipe_config->output_format == INTEL_OUTPUT_FORMAT_YCBCR420 &&
   338		    !intel_crtc_has_dp_encoder(pipe_config))
   339			dotclock *= 2;
   340	
   341		if (pipe_config->pixel_multiplier)
   342			dotclock /= pipe_config->pixel_multiplier;
   343	
   344		return dotclock;
   345	}
   346	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
