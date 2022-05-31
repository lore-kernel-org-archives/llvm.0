Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53A12F22
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 12:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653999793; x=1685535793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nL2+Ikam+GBqRnVV+mHEQYa/V/rwiJja/RdNvaJ6QqY=;
  b=mOIUny3iW+oAHyv1rgqVTnrYijAaJbe8fCshxrh169YdUM//PjU+HCIl
   jYEdTVC0+nt9UhzFf9NOE9Dk89J7hO4UyMRziTnL3tXnwdv4J7xF6/IDu
   QiXrRFL9s8CQE5aB1abN88WpRW1ggzWdcvxwajjfqPsU+dd/buqbmNl8b
   WXPU/EA+875kQNOgQ3dCfv+9CKqAl52tuU/yuVrF0cY9X/muxIb30WTO1
   nTsdE9AoALXWE9zeNQgTapV3Kjl8ytybvoR30WQB9pwermljGIq+LoZKG
   bOwzOuT+mjNM2ZPaIptWFK4th4G4CmqAhGTxBM8/vIlFPhR7OtIZHM2/3
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="262870695"
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; 
   d="scan'208";a="262870695"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 05:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; 
   d="scan'208";a="679553332"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 May 2022 05:23:10 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nw0ty-0002h9-6Z;
	Tue, 31 May 2022 12:23:10 +0000
Date: Tue, 31 May 2022 20:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [stable:linux-5.15.y 3230/6856]
 drivers/gpu/drm/i915/gt/intel_gt.c:966:2: error: format string is not a
 string literal (potentially insecure)
Message-ID: <202205312043.eacilUVl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tvrtko,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   4e67be407725b1d8b829ed2075987037abec98ec
commit: 8a17a077e7e9ecce25c95dbdb27843d2d6c2f0f7 [3230/6856] drm/i915: Flush TLBs before releasing backing store
config: x86_64-randconfig-a014-20220530 (https://download.01.org/0day-ci/archive/20220531/202205312043.eacilUVl-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0776c48f9b7e69fa447bee57c7c0985caa856be9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=8a17a077e7e9ecce25c95dbdb27843d2d6c2f0f7
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 8a17a077e7e9ecce25c95dbdb27843d2d6c2f0f7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/intel_gt.c:966:2: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
           GEM_TRACE("\n");
           ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.h:76:24: note: expanded from macro 'GEM_TRACE'
   #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:366:3: note: expanded from macro 'trace_printk'
                   do_trace_printk(fmt, ##__VA_ARGS__);    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:380:30: note: expanded from macro 'do_trace_printk'
                   __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
                                              ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/intel_gt.c:966:2: note: treat the string as an argument to avoid this
   drivers/gpu/drm/i915/i915_gem.h:76:24: note: expanded from macro 'GEM_TRACE'
   #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
                          ^
   include/linux/kernel.h:366:3: note: expanded from macro 'trace_printk'
                   do_trace_printk(fmt, ##__VA_ARGS__);    \
                   ^
   include/linux/kernel.h:380:30: note: expanded from macro 'do_trace_printk'
                   __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
                                              ^
   1 error generated.


vim +966 drivers/gpu/drm/i915/gt/intel_gt.c

   927	
   928	void intel_gt_invalidate_tlbs(struct intel_gt *gt)
   929	{
   930		static const i915_reg_t gen8_regs[] = {
   931			[RENDER_CLASS]			= GEN8_RTCR,
   932			[VIDEO_DECODE_CLASS]		= GEN8_M1TCR, /* , GEN8_M2TCR */
   933			[VIDEO_ENHANCEMENT_CLASS]	= GEN8_VTCR,
   934			[COPY_ENGINE_CLASS]		= GEN8_BTCR,
   935		};
   936		static const i915_reg_t gen12_regs[] = {
   937			[RENDER_CLASS]			= GEN12_GFX_TLB_INV_CR,
   938			[VIDEO_DECODE_CLASS]		= GEN12_VD_TLB_INV_CR,
   939			[VIDEO_ENHANCEMENT_CLASS]	= GEN12_VE_TLB_INV_CR,
   940			[COPY_ENGINE_CLASS]		= GEN12_BLT_TLB_INV_CR,
   941		};
   942		struct drm_i915_private *i915 = gt->i915;
   943		struct intel_uncore *uncore = gt->uncore;
   944		struct intel_engine_cs *engine;
   945		enum intel_engine_id id;
   946		const i915_reg_t *regs;
   947		unsigned int num = 0;
   948	
   949		if (I915_SELFTEST_ONLY(gt->awake == -ENODEV))
   950			return;
   951	
   952		if (GRAPHICS_VER(i915) == 12) {
   953			regs = gen12_regs;
   954			num = ARRAY_SIZE(gen12_regs);
   955		} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
   956			regs = gen8_regs;
   957			num = ARRAY_SIZE(gen8_regs);
   958		} else if (GRAPHICS_VER(i915) < 8) {
   959			return;
   960		}
   961	
   962		if (drm_WARN_ONCE(&i915->drm, !num,
   963				  "Platform does not implement TLB invalidation!"))
   964			return;
   965	
 > 966		GEM_TRACE("\n");

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
