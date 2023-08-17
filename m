Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E844814A84;
	Thu, 17 Aug 2023 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692285943; x=1723821943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bWfsPyFfKqEssNtf28fn3Z9KsAMTbdk29rYzhPaSm2A=;
  b=X9K73uU90GBUQujYoDcrLZazdEewu6AEn/VOcAVebpHUcr2Ak3u4nenS
   ydReOpXJJs9rcXfCcbPqHcl4C06eIK0QaKUHuLJmLnvJjDaT5kywTxgEx
   cbt41jFHecMkCBZtbd1OI+5NuYqPICIjFLuQQR9YbRS5lC7a1TlAA1isw
   ACkSiGUBQs/HpSF5GK+JCTd5N7pTnccz0LjuqWbv0inOvRntHBN5zYaTk
   +nXljnKLlhADjeDcbfBw3wpgTlnsMmp2QK71g4RJu3xdfiAljBAYxmG/P
   EjnIFyrZ69RdqDA/P10VrQwKqI4m5wLekO7ML+Yz1Cb5qqFUTi10uQkxl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="372832643"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="372832643"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 08:25:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="728175534"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="728175534"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Aug 2023 08:25:21 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWesD-0001Gn-0m;
	Thu, 17 Aug 2023 15:25:21 +0000
Date: Thu, 17 Aug 2023 23:24:28 +0800
From: kernel test robot <lkp@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jyri.sarha@linux.intel.com
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/display: Add wrapper to Compute
 SAD
Message-ID: <202308172319.rTgU3hnc-lkp@intel.com>
References: <20230817125007.2681331-4-mitulkumar.ajitkumar.golani@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817125007.2681331-4-mitulkumar.ajitkumar.golani@intel.com>

Hi Mitul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Mitul-Golani/drm-i915-Add-has_audio-to-separate-audio-parameter-in-crtc_state/20230817-205556
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230817125007.2681331-4-mitulkumar.ajitkumar.golani%40intel.com
patch subject: [Intel-gfx] [PATCH 3/3] drm/i915/display: Add wrapper to Compute SAD
config: x86_64-buildonly-randconfig-r001-20230817 (https://download.01.org/0day-ci/archive/20230817/202308172319.rTgU3hnc-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172319.rTgU3hnc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172319.rTgU3hnc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_audio.c:822:39: warning: variable 'channel_count' is uninitialized when used here [-Wuninitialized]
                   audio_req_bandwidth = calc_audio_bw(channel_count,
                                                       ^~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_audio.c:812:19: note: initialize the variable 'channel_count' to silence this warning
           int channel_count;
                            ^
                             = 0
   1 warning generated.


vim +/channel_count +822 drivers/gpu/drm/i915/display/intel_audio.c

   808	
   809	static void calibrate_audio_config_params(struct intel_crtc_state *pipe_config, int channel)
   810	{
   811		struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
   812		int channel_count;
   813		int index, rate[] = { 192000, 176000, 96000, 88000, 48000, 44100, 32000 };
   814		int audio_req_bandwidth, available_blank_bandwidth, vblank, hblank;
   815	
   816		hblank = adjusted_mode->htotal - adjusted_mode->hdisplay;
   817		vblank = adjusted_mode->vtotal - adjusted_mode->vdisplay;
   818		available_blank_bandwidth = hblank * vblank *
   819					    drm_mode_vrefresh(adjusted_mode) * pipe_config->pipe_bpp;
   820	
   821		for (index = 0; index < ARRAY_SIZE(rate); index++) {
 > 822			audio_req_bandwidth = calc_audio_bw(channel_count,
   823							    rate[index]);
   824			if (audio_req_bandwidth < available_blank_bandwidth) {
   825				pipe_config->audio.max_rate = rate[index];
   826				pipe_config->audio.max_channel_count = channel_count;
   827				return;
   828			}
   829		}
   830	
   831		pipe_config->audio.max_rate = 0;
   832		pipe_config->audio.max_channel_count = 0;
   833	}
   834	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
