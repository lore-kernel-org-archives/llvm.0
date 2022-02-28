Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568D17C
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 22:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646087611; x=1677623611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bn9izpqKBs56oc43rnakzO6sXTOcc68e/qndE3+SDl8=;
  b=dVids3Xr1BD2vU6D5/e0sGNyLs8YrZtErpnEZbyE41ttRQIDH1UNvAgl
   paCKo2wxdU+rn+67GphaF1ClIbQbWu62iNuHXP2LOn+tD3X+Do9lZo+WE
   i8Rl8NmM34hwBODj2vDIPoyC4J48yCHwYGWEGrSnthBJx3Fre3j2FTwgA
   +zhEOX6jZ//RO95OZzaqnK2ib+NCCi+qYJKj3VPf80izS9/OMDCX64KNo
   Sj90dba0GAsRu82LrlaKV0JA4GoK9nhra0nw2rKyzMpEYSbbmwAkmqszc
   o8fXqUtAbBGZXj70+G8s4UVuap8ky+TexTq6gLGmrp4GrfMFBilrB6CrI
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="251835162"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="251835162"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 14:33:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="708826716"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Feb 2022 14:33:26 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nOoa5-0007q1-Me; Mon, 28 Feb 2022 22:33:25 +0000
Date: Tue, 1 Mar 2022 06:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [Intel-gfx] [PATCH v7 09/13] drm/i915/guc: Check sizing of
 guc_capture output
Message-ID: <202203010622.2JyDEoHX-lkp@intel.com>
References: <20220226095541.1010534-10-alan.previn.teres.alexis@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220226095541.1010534-10-alan.previn.teres.alexis@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Alan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next drm-exynos/exynos-drm-next drm/drm-next tegra-drm/drm/tegra/for-next airlied/drm-next v5.17-rc6 next-20220228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alan-Previn/Add-GuC-Error-Capture-Support/20220226-175600
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220301/202203010622.2JyDEoHX-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/4c41838b35d9a5c0bcb4380e0064cb2d5d33661f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alan-Previn/Add-GuC-Error-Capture-Support/20220226-175600
        git checkout 4c41838b35d9a5c0bcb4380e0064cb2d5d33661f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c:555:1: error: no previous prototype for function 'intel_guc_capture_getlistsize' [-Werror,-Wmissing-prototypes]
   intel_guc_capture_getlistsize(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
   ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c:554:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c:585:1: error: no previous prototype for function 'intel_guc_capture_getlist' [-Werror,-Wmissing-prototypes]
   intel_guc_capture_getlist(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
   ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c:584:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
>> drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c:648:5: error: no previous prototype for function 'intel_guc_capture_output_min_size_est' [-Werror,-Wmissing-prototypes]
   int intel_guc_capture_output_min_size_est(struct intel_guc *guc)
       ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c:648:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int intel_guc_capture_output_min_size_est(struct intel_guc *guc)
   ^
   static 
   drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c:711:6: error: no previous prototype for function 'intel_guc_capture_destroy' [-Werror,-Wmissing-prototypes]
   void intel_guc_capture_destroy(struct intel_guc *guc)
        ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c:711:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void intel_guc_capture_destroy(struct intel_guc *guc)
   ^
   static 
   drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c:727:5: error: no previous prototype for function 'intel_guc_capture_init' [-Werror,-Wmissing-prototypes]
   int intel_guc_capture_init(struct intel_guc *guc)
       ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c:727:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int intel_guc_capture_init(struct intel_guc *guc)
   ^
   static 
   5 errors generated.


vim +/intel_guc_capture_output_min_size_est +648 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c

   646	
   647	#define GUC_CAPTURE_OVERBUFFER_MULTIPLIER 3
 > 648	int intel_guc_capture_output_min_size_est(struct intel_guc *guc)
   649	{
   650		struct intel_gt *gt = guc_to_gt(guc);
   651		struct intel_engine_cs *engine;
   652		enum intel_engine_id id;
   653		int worst_min_size = 0, num_regs = 0;
   654		size_t tmp = 0;
   655	
   656		/*
   657		 * If every single engine-instance suffered a failure in quick succession but
   658		 * were all unrelated, then a burst of multiple error-capture events would dump
   659		 * registers for every one engine instance, one at a time. In this case, GuC
   660		 * would even dump the global-registers repeatedly.
   661		 *
   662		 * For each engine instance, there would be 1 x guc_state_capture_group_t output
   663		 * followed by 3 x guc_state_capture_t lists. The latter is how the register
   664		 * dumps are split across different register types (where the '3' are global vs class
   665		 * vs instance). Finally, let's multiply the whole thing by 3x (just so we are
   666		 * not limited to just 1 round of data in a worst case full register dump log)
   667		 *
   668		 * NOTE: intel_guc_log that allocates the log buffer would round this size up to
   669		 * a power of two.
   670		 */
   671	
   672		for_each_engine(engine, gt, id) {
   673			worst_min_size += sizeof(struct guc_state_capture_group_header_t) +
   674					  (3 * sizeof(struct guc_state_capture_header_t));
   675	
   676			if (!intel_guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0, &tmp))
   677				num_regs += tmp;
   678	
   679			if (!intel_guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
   680							   engine->class, &tmp)) {
   681				num_regs += tmp;
   682			}
   683			if (!intel_guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
   684							   engine->class, &tmp)) {
   685				num_regs += tmp;
   686			}
   687		}
   688	
   689		worst_min_size += (num_regs * sizeof(struct guc_mmio_reg));
   690	
   691		return (worst_min_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER);
   692	}
   693	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
