Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C72F1C04;
	Sat, 27 May 2023 08:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685177999; x=1716713999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=icqsCyU+FSgeqlc9F3DL/1oMG9EXyjYxm7MQIgi7k9w=;
  b=BzeYNph2prZB/pVxeG8NRfTPEx5xJuu/L3Edb7MHELb9KMdSq0X0BREc
   9a6uv/zbcZOTeSWwq1n8+QD3NACMOvyTiIrrKVNk4QXCEUNNyxpzciPYS
   aDNoGtOaobm+i8B8tlMeCvJlSUg6f5v+U3LDZDEmrKLUrRbwPwJMDQ3A8
   kYk3ncgz+tG2UefY0ibb1zEsFjNFdartcOWYCwzTT0lxEQ05ZvEJyuM70
   WKWwSP0ZAoplN3IG9WMQSdFBTKNQVYSBCVQc2KFzgdl7mf08L02ABbMba
   sCpBxifDnbo+/lr3pFSswbDeKM/Kt0qbCMcgIFJMOeBcAUDLrJUslttRo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356759214"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="356759214"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 01:59:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879785640"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="879785640"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 May 2023 01:59:57 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2pmH-000JsI-01;
	Sat, 27 May 2023 08:59:57 +0000
Date: Sat, 27 May 2023 16:59:47 +0800
From: kernel test robot <lkp@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 4/7] drm/i915/huc: differentiate the 2 steps of the
 MTL HuC auth flow
Message-ID: <202305271643.4lrHpkZs-lkp@intel.com>
References: <20230527005242.1346093-5-daniele.ceraolospurio@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230527005242.1346093-5-daniele.ceraolospurio@intel.com>

Hi Daniele,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniele-Ceraolo-Spurio/drm-i915-uc-perma-pin-firmwares/20230527-085429
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230527005242.1346093-5-daniele.ceraolospurio%40intel.com
patch subject: [PATCH v3 4/7] drm/i915/huc: differentiate the 2 steps of the MTL HuC auth flow
config: x86_64-randconfig-x056-20230526 (https://download.01.org/0day-ci/archive/20230527/202305271643.4lrHpkZs-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5e7ad1c45a6cbb80d8b9f71212d410d19bbe96d9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniele-Ceraolo-Spurio/drm-i915-uc-perma-pin-firmwares/20230527-085429
        git checkout 5e7ad1c45a6cbb80d8b9f71212d410d19bbe96d9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305271643.4lrHpkZs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:199:54: error: too few arguments to function call, expected 2, have 1
           if (intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc) &&
               ~~~~~~~~~~~~~~~~~~~~~~~~~~                      ^
   drivers/gpu/drm/i915/gt/uc/intel_huc.h:60:6: note: 'intel_huc_is_authenticated' declared here
   bool intel_huc_is_authenticated(struct intel_huc *huc,
        ^
   1 error generated.


vim +199 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c

dc9ac125d81faf Alan Previn 2023-05-11  188  
99afb7cc8c4457 Alan Previn 2023-05-11  189  bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp)
99afb7cc8c4457 Alan Previn 2023-05-11  190  {
99afb7cc8c4457 Alan Previn 2023-05-11  191  	/*
99afb7cc8c4457 Alan Previn 2023-05-11  192  	 * GSC-fw loading, HuC-fw loading, HuC-fw authentication and
99afb7cc8c4457 Alan Previn 2023-05-11  193  	 * GSC-proxy init flow (requiring an mei component driver)
99afb7cc8c4457 Alan Previn 2023-05-11  194  	 * must all occur first before we can start requesting for PXP
99afb7cc8c4457 Alan Previn 2023-05-11  195  	 * sessions. Checking for completion on HuC authentication and
99afb7cc8c4457 Alan Previn 2023-05-11  196  	 * gsc-proxy init flow (the last set of dependencies that
99afb7cc8c4457 Alan Previn 2023-05-11  197  	 * are out of order) will suffice.
99afb7cc8c4457 Alan Previn 2023-05-11  198  	 */
99afb7cc8c4457 Alan Previn 2023-05-11 @199  	if (intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc) &&
99afb7cc8c4457 Alan Previn 2023-05-11  200  	    intel_gsc_uc_fw_proxy_init_done(&pxp->ctrl_gt->uc.gsc))
99afb7cc8c4457 Alan Previn 2023-05-11  201  		return true;
99afb7cc8c4457 Alan Previn 2023-05-11  202  
99afb7cc8c4457 Alan Previn 2023-05-11  203  	return false;
99afb7cc8c4457 Alan Previn 2023-05-11  204  }
99afb7cc8c4457 Alan Previn 2023-05-11  205  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
