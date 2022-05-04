Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E22120E0
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 01:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651629216; x=1683165216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JDxQddswnaAtAEe6Yd2ih6qHUHQiMwv8N9U0jVI8plg=;
  b=Y5jwJTd88C1+QjtWhEhGUXyA1vsSzJfUbOwpBpWyMQxl/lO2l/J22dbv
   qJd7Oy0GKHI8eMwfWnEPAgNKgcO5wLTxdljm/XCIGBxBPcYBs5+tPAHer
   dba+DXxqw+Qpj4AD+wIGpVJuaTmtUWd2XTHCx/JgJYYOjuwJ9l5TOVLBv
   CB/5WUd2Z+qc7S8FcVSecqZHlrErzbu/6ZWWUfycY4AByZPnjZSoUIkQh
   H+aeGaFXLXLE59uehXEwFAgQkh2K2I7ZLINjwYNspyzeUZDPF8QSzpwjJ
   SPcBBdKloTI84pPyud/BSIHae9pz7j/PUPSM0CNIeHUgYhP1m1a9BwVF2
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="354076348"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="354076348"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 18:53:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="734182002"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 May 2022 18:53:33 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nm4Cr-000AxP-98;
	Wed, 04 May 2022 01:53:33 +0000
Date: Wed, 4 May 2022 09:52:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [vsyrjala:crtc_clock_compute_8 10/26]
 drivers/gpu/drm/i915/display/intel_ddi.c:325:5: warning: no previous
 prototype for function 'intel_crtc_dotclock'
Message-ID: <202205040931.3Rt8hNR2-lkp@intel.com>
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
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220504/202205040931.3Rt8hNR2-lkp@intel.com/config)
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

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_ddi.c:325:5: warning: no previous prototype for function 'intel_crtc_dotclock' [-Wmissing-prototypes]
   int intel_crtc_dotclock(const struct intel_crtc_state *pipe_config)
       ^
   drivers/gpu/drm/i915/display/intel_ddi.c:325:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int intel_crtc_dotclock(const struct intel_crtc_state *pipe_config)
   ^
   static 
   1 warning generated.


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
