Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6A920EB
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 02:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651632876; x=1683168876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HxFwtYpjpmRFdvTf/9xqAkVN6i8U8Ky4fUdZWTr/aCY=;
  b=PVOQ3DwGG2nbxXB2YkrhjxWB6IdR6zJo5uBreyXkd8ZVzU89SpddydLp
   dzyGbCVJ/uLo3fxf93O6ST+DSQP87WpXc67tr9KptACsB0hD0/GHVqoTW
   uO3vEHh9LrfjgCMokL65AV3CYNIgydSwdmf5SmZnR+7NvrpsTUhHWJEhd
   18Ln4kcJvmlgAtLb+OAmAPFhTrtemF8uMjg6HKsOxMI8zchyxQL/85BRd
   05ltyEa5UDNBzZoCZQ2U3I1x9BN9hJsFbEkbtPKDiTZz+zEYreI6hc/ww
   j0WH9ZVZY9yzCQ6p1/PSHtgZvwfyupUxaZtGM7mrGCXuzgVRTA0IWCHDV
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="248188037"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="248188037"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 19:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="889681119"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 May 2022 19:54:35 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nm59u-000Aza-HI;
	Wed, 04 May 2022 02:54:34 +0000
Date: Wed, 4 May 2022 10:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [PATCH 10/26] drm/i915: Extract intel_crtc_dotclock()
Message-ID: <202205041054.2CCCG4hP-lkp@intel.com>
References: <20220503182242.18797-11-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503182242.18797-11-ville.syrjala@linux.intel.com>

Hi Ville,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip next-20220503]
[cannot apply to v5.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-i915-Make-fastset-not-suck-and-allow-seamless-M-N-changes/20220504-022619
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220504/202205041054.2CCCG4hP-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a7c24aec0d5727b1e827ab8c847aa42188d199f2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ville-Syrjala/drm-i915-Make-fastset-not-suck-and-allow-seamless-M-N-changes/20220504-022619
        git checkout a7c24aec0d5727b1e827ab8c847aa42188d199f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

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
