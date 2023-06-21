Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A451C769;
	Wed, 21 Jun 2023 23:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687390885; x=1718926885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TN9dHADspNic912KXaEyvjIgS1JVMUjF18ESMv7EPPg=;
  b=SXgtXUC5X+gh0vvu8Av89MwHsuB6JLFokDbnGNg20aZ9iUWf+sxU89aw
   p9C6uUFSBTV/XC3NiQcotgOHNfuG3c489v7EGWn8o9dMqJBVbvN55j0+N
   6uM0byh1PgbWPyvYFYAl1uRpXO7bqE/a0a+ame8HyDIjDT8qs8fM3LGbP
   5KjwyNkrjnifLWsS4G/PBOVUskFGO2BDUc+Oua6XrI4T0rZhgERFMVoHC
   u4szDUvtyNUQx1tJsIVjrJDDD0p1oaadR9hCNO2/WH8HovRd32MfHjDPD
   Gy9SYEjdASJtLx1P2rO5hmZK5ro/fSDPEd5YgAdcvrz3SZaTyX8MoonBt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="424006168"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="424006168"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 16:41:24 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="748933735"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="748933735"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Jun 2023 16:41:22 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC7Rx-0007AN-2M;
	Wed, 21 Jun 2023 23:41:21 +0000
Date: Thu, 22 Jun 2023 07:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: Handle legacy cursor update as
 normal update
Message-ID: <202306220703.F8iGFXoT-lkp@intel.com>
References: <20230621114827.167713-2-maarten.lankhorst@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621114827.167713-2-maarten.lankhorst@linux.intel.com>

Hi Maarten,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-i915-Handle-legacy-cursor-update-as-normal-update/20230621-195009
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230621114827.167713-2-maarten.lankhorst%40linux.intel.com
patch subject: [Intel-gfx] [PATCH 2/2] drm/i915: Handle legacy cursor update as normal update
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230622/202306220703.F8iGFXoT-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220703.F8iGFXoT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220703.F8iGFXoT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_display.c:6900:40: error: use of undeclared identifier 'dev'
                   drm_atomic_helper_wait_for_flip_done(dev, &state->base);
                                                        ^
   1 error generated.


vim +/dev +6900 drivers/gpu/drm/i915/display/intel_display.c

  6889	
  6890	static void intel_atomic_cleanup_work(struct work_struct *work)
  6891	{
  6892		struct intel_atomic_state *state =
  6893			container_of(work, struct intel_atomic_state, base.commit_work);
  6894		struct drm_i915_private *i915 = to_i915(state->base.dev);
  6895		struct intel_crtc_state *old_crtc_state;
  6896		struct intel_crtc *crtc;
  6897		int i;
  6898	
  6899		if (state->cursor_update)
> 6900			drm_atomic_helper_wait_for_flip_done(dev, &state->base);
  6901	
  6902		for_each_old_intel_crtc_in_state(state, crtc, old_crtc_state, i)
  6903			intel_color_cleanup_commit(old_crtc_state);
  6904	
  6905		drm_atomic_helper_cleanup_planes(&i915->drm, &state->base);
  6906		drm_atomic_helper_commit_cleanup_done(&state->base);
  6907		drm_atomic_state_put(&state->base);
  6908	
  6909		intel_atomic_helper_free_state(i915);
  6910	}
  6911	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
