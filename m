Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBAE7FA;
	Sat, 15 Apr 2023 00:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681519443; x=1713055443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MD8K63IrPn6nNaZZkJX/7+Boe8uxJZjKc9oRaTHoT8w=;
  b=h0usi704uoURpCbTYAb/CdLLd4jjR4dLVnj5+j89Y3LRIOto02xkJ+Z8
   ugzeHyIoB5hWJ7lTWkdxdoc82LXs430TSG8ZD2C9Ne0dQg8PobRqDL/Ht
   8t8NxOdw3st+Lu7WrQOgvOTaxiIP//RT29UOmcKzgV3c4Tsz7tf9rRlVf
   lQnnvzMunr8z9cCfTVBcxUtXaU1LQCQ0vzeKq+MPfnVp/sR4mutGcDT/v
   PnemHES1/XKK5DCa0KtyR0IiS1BDHmxtj5wCMJJQ0QA92UNpA5X19J9VM
   ySY3PW31drYrau4UqXH4e/yvKUbwE22YKhHCyF1vOH//nUGPqgWGmNEJa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="347328850"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="347328850"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 17:44:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="864381625"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="864381625"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Apr 2023 17:44:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnU1H-000aBE-2U;
	Sat, 15 Apr 2023 00:43:59 +0000
Date: Sat, 15 Apr 2023 08:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Kumar, Mahesh" <mahesh1.kumar@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Nathan Ciobanu <nathan.d.ciobanu@intel.com>,
	=?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14 1494/9354]
 drivers/gpu/drm/i915/intel_pm.c:4646:6: error: variable 'trans_min' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202304150842.WRIIpHTO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14
head:   6f750b16c322c9191168a3a97c427c90581d9144
commit: 0fa25d216a15c82850d864b488389c2bb81a0e2a [1494/9354] UPSTREAM: drm/i915/gen10: Calculate and enable transition WM
config: x86_64-randconfig-a005-20230410 (https://download.01.org/0day-ci/archive/20230415/202304150842.WRIIpHTO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jsarha/linux/commit/0fa25d216a15c82850d864b488389c2bb81a0e2a
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14
        git checkout 0fa25d216a15c82850d864b488389c2bb81a0e2a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash LDFLAGS=-z max-page-size=0x200000  drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150842.WRIIpHTO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/intel_pm.c:30:
   In file included from drivers/gpu/drm/i915/i915_drv.h:61:
   In file included from drivers/gpu/drm/i915/intel_uc.h:31:
   In file included from drivers/gpu/drm/i915/i915_vma.h:34:
   drivers/gpu/drm/i915/i915_gem_object.h:290:1: error: attribute declaration must precede definition [-Werror,-Wignored-attributes]
   __deprecated
   ^
   include/linux/compiler-gcc.h:91:37: note: expanded from macro '__deprecated'
   #define __deprecated    __attribute__((deprecated))
                                          ^
   include/drm/drm_gem.h:247:20: note: previous definition is here
   static inline void drm_gem_object_reference(struct drm_gem_object *obj)
                      ^
   In file included from drivers/gpu/drm/i915/intel_pm.c:30:
   In file included from drivers/gpu/drm/i915/i915_drv.h:61:
   In file included from drivers/gpu/drm/i915/intel_uc.h:31:
   In file included from drivers/gpu/drm/i915/i915_vma.h:34:
   drivers/gpu/drm/i915/i915_gem_object.h:300:1: error: attribute declaration must precede definition [-Werror,-Wignored-attributes]
   __deprecated
   ^
   include/linux/compiler-gcc.h:91:37: note: expanded from macro '__deprecated'
   #define __deprecated    __attribute__((deprecated))
                                          ^
   include/drm/drm_gem.h:285:20: note: previous definition is here
   static inline void drm_gem_object_unreference(struct drm_gem_object *obj)
                      ^
   In file included from drivers/gpu/drm/i915/intel_pm.c:30:
   In file included from drivers/gpu/drm/i915/i915_drv.h:61:
   In file included from drivers/gpu/drm/i915/intel_uc.h:31:
   In file included from drivers/gpu/drm/i915/i915_vma.h:34:
   drivers/gpu/drm/i915/i915_gem_object.h:303:1: error: attribute declaration must precede definition [-Werror,-Wignored-attributes]
   __deprecated
   ^
   include/linux/compiler-gcc.h:91:37: note: expanded from macro '__deprecated'
   #define __deprecated    __attribute__((deprecated))
                                          ^
   include/drm/drm_gem.h:273:1: note: previous definition is here
   drm_gem_object_unreference_unlocked(struct drm_gem_object *obj)
   ^
   In file included from drivers/gpu/drm/i915/intel_pm.c:30:
   drivers/gpu/drm/i915/i915_drv.h:3627:9: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
           return i915_reset_backoff(error) | i915_terminally_wedged(error);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                            ||
   drivers/gpu/drm/i915/i915_drv.h:3627:9: note: cast one or both operands to int to silence this warning
   drivers/gpu/drm/i915/intel_pm.c:2977:12: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
           changed = ilk_increase_wm_latency(dev_priv, dev_priv->wm.pri_latency, 12) |
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:2977:12: note: cast one or both operands to int to silence this warning
   drivers/gpu/drm/i915/intel_pm.c:2977:12: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
           changed = ilk_increase_wm_latency(dev_priv, dev_priv->wm.pri_latency, 12) |
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                                                     ||
   drivers/gpu/drm/i915/intel_pm.c:2977:12: note: cast one or both operands to int to silence this warning
   drivers/gpu/drm/i915/intel_pm.c:4080:18: error: variable 'src_h' set but not used [-Werror,-Wunused-but-set-variable]
           uint32_t src_w, src_h;
                           ^
>> drivers/gpu/drm/i915/intel_pm.c:4646:6: error: variable 'trans_min' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
           if (INTEL_GEN(dev_priv) >= 10)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_drv.h:2868:29: note: expanded from macro 'INTEL_GEN'
   #define INTEL_GEN(dev_priv)     ((dev_priv)->info.gen)
                                   ^
   drivers/gpu/drm/i915/intel_pm.c:4649:19: note: uninitialized use occurs here
           trans_offset_b = trans_min + trans_amount;
                            ^~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:4646:2: note: remove the 'if' if its condition is always true
           if (INTEL_GEN(dev_priv) >= 10)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:4631:20: note: initialize the variable 'trans_min' to silence this warning
           uint16_t trans_min, trans_y_tile_min;
                             ^
                              = 0
   8 errors generated.


vim +4646 drivers/gpu/drm/i915/intel_pm.c

  4622	
  4623	static void skl_compute_transition_wm(struct intel_crtc_state *cstate,
  4624					      struct skl_wm_params *wp,
  4625					      struct skl_wm_level *wm_l0,
  4626					      uint16_t ddb_allocation,
  4627					      struct skl_wm_level *trans_wm /* out */)
  4628	{
  4629		struct drm_device *dev = cstate->base.crtc->dev;
  4630		const struct drm_i915_private *dev_priv = to_i915(dev);
  4631		uint16_t trans_min, trans_y_tile_min;
  4632		const uint16_t trans_amount = 10; /* This is configurable amount */
  4633		uint16_t trans_offset_b, res_blocks;
  4634	
  4635		if (!cstate->base.active)
  4636			goto exit;
  4637	
  4638		/* Transition WM are not recommended by HW team for GEN9 */
  4639		if (INTEL_GEN(dev_priv) <= 9)
  4640			goto exit;
  4641	
  4642		/* Transition WM don't make any sense if ipc is disabled */
  4643		if (!dev_priv->ipc_enabled)
  4644			goto exit;
  4645	
> 4646		if (INTEL_GEN(dev_priv) >= 10)
  4647			trans_min = 4;
  4648	
  4649		trans_offset_b = trans_min + trans_amount;
  4650	
  4651		if (wp->y_tiled) {
  4652			trans_y_tile_min = (uint16_t) mul_round_up_u32_fixed16(2,
  4653								wp->y_tile_minimum);
  4654			res_blocks = max(wm_l0->plane_res_b, trans_y_tile_min) +
  4655					trans_offset_b;
  4656		} else {
  4657			res_blocks = wm_l0->plane_res_b + trans_offset_b;
  4658	
  4659			/* WA BUG:1938466 add one block for non y-tile planes */
  4660			if (IS_CNL_REVID(dev_priv, CNL_REVID_A0, CNL_REVID_A0))
  4661				res_blocks += 1;
  4662	
  4663		}
  4664	
  4665		res_blocks += 1;
  4666	
  4667		if (res_blocks < ddb_allocation) {
  4668			trans_wm->plane_res_b = res_blocks;
  4669			trans_wm->plane_en = true;
  4670			return;
  4671		}
  4672	
  4673	exit:
  4674		trans_wm->plane_en = false;
  4675	}
  4676	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
