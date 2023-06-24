Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFA120F0;
	Sat, 24 Jun 2023 15:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687620430; x=1719156430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eJvyH0GvXjDS0GGqHfp1AWiQnFwXAcik/4MDyo+szXQ=;
  b=SRXhHU/VSbTGxklykl/Snv02uWYKbHjwhVxnp3VyG/qxbxgJSTr0RApK
   f3wjBSGPhyH8ehCxTXwuW2lfglY/nU1+CzolkeWsqFieSciyT9nNtntXu
   UFKnr/4n1ecWEE67m7R5lz4+b4bUF2Rbj+0pGF2dbRhz14dwpiZJI5ovJ
   Gy3zf38p/P1iH4hszbdG61bRNJ3TsVCatVAbE04AZTrSRE6n7xE5AFrR3
   SUFJIqSXN4ipC/e67yWvfgx3nB/be/2uzzJ6ALLVuaGXLUa6tinWhyoMt
   j8kHBdG1g3y6QSMA8HcPBljXEu0vgFSsYp1cw3gVKrTMLpfbcImylnmj4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="359822592"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; 
   d="scan'208";a="359822592"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 08:27:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="860197695"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; 
   d="scan'208";a="860197695"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jun 2023 08:27:08 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qD5AJ-00099N-19;
	Sat, 24 Jun 2023 15:27:07 +0000
Date: Sat, 24 Jun 2023 23:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [stable:linux-5.10.y 136/9999]
 drivers/gpu/drm/i915/gt/intel_gt.c:732:2: error: format string is not a
 string literal (potentially insecure)
Message-ID: <202306242328.FQpxm2dQ-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   ef0d5feb32ab7007d1316e9c5037cd7d9f7febbf
commit: 6a6acf927895c38bdd9f3cd76b8dbfc25ac03e88 [136/9999] drm/i915: Flush TLBs before releasing backing store
config: x86_64-buildonly-randconfig-r003-20230624 (https://download.01.org/0day-ci/archive/20230624/202306242328.FQpxm2dQ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306242328.FQpxm2dQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306242328.FQpxm2dQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/intel_gt.c:732:2: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
           GEM_TRACE("\n");
           ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.h:69:24: note: expanded from macro 'GEM_TRACE'
   #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:724:3: note: expanded from macro 'trace_printk'
                   do_trace_printk(fmt, ##__VA_ARGS__);    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:738:30: note: expanded from macro 'do_trace_printk'
                   __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
                                              ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/intel_gt.c:732:2: note: treat the string as an argument to avoid this
   drivers/gpu/drm/i915/i915_gem.h:69:24: note: expanded from macro 'GEM_TRACE'
   #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
                          ^
   include/linux/kernel.h:724:3: note: expanded from macro 'trace_printk'
                   do_trace_printk(fmt, ##__VA_ARGS__);    \
                   ^
   include/linux/kernel.h:738:30: note: expanded from macro 'do_trace_printk'
                   __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
                                              ^
   1 error generated.


vim +732 drivers/gpu/drm/i915/gt/intel_gt.c

   693	
   694	void intel_gt_invalidate_tlbs(struct intel_gt *gt)
   695	{
   696		static const i915_reg_t gen8_regs[] = {
   697			[RENDER_CLASS]			= GEN8_RTCR,
   698			[VIDEO_DECODE_CLASS]		= GEN8_M1TCR, /* , GEN8_M2TCR */
   699			[VIDEO_ENHANCEMENT_CLASS]	= GEN8_VTCR,
   700			[COPY_ENGINE_CLASS]		= GEN8_BTCR,
   701		};
   702		static const i915_reg_t gen12_regs[] = {
   703			[RENDER_CLASS]			= GEN12_GFX_TLB_INV_CR,
   704			[VIDEO_DECODE_CLASS]		= GEN12_VD_TLB_INV_CR,
   705			[VIDEO_ENHANCEMENT_CLASS]	= GEN12_VE_TLB_INV_CR,
   706			[COPY_ENGINE_CLASS]		= GEN12_BLT_TLB_INV_CR,
   707		};
   708		struct drm_i915_private *i915 = gt->i915;
   709		struct intel_uncore *uncore = gt->uncore;
   710		struct intel_engine_cs *engine;
   711		enum intel_engine_id id;
   712		const i915_reg_t *regs;
   713		unsigned int num = 0;
   714	
   715		if (I915_SELFTEST_ONLY(gt->awake == -ENODEV))
   716			return;
   717	
   718		if (INTEL_GEN(i915) == 12) {
   719			regs = gen12_regs;
   720			num = ARRAY_SIZE(gen12_regs);
   721		} else if (INTEL_GEN(i915) >= 8 && INTEL_GEN(i915) <= 11) {
   722			regs = gen8_regs;
   723			num = ARRAY_SIZE(gen8_regs);
   724		} else if (INTEL_GEN(i915) < 8) {
   725			return;
   726		}
   727	
   728		if (drm_WARN_ONCE(&i915->drm, !num,
   729				  "Platform does not implement TLB invalidation!"))
   730			return;
   731	
 > 732		GEM_TRACE("\n");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
