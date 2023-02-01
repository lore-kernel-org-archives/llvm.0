Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43ED8483;
	Wed,  1 Feb 2023 18:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675274711; x=1706810711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tf8JIhlu4q42e+EKofGfOVzVUECoARlxKvI3Vce+vNA=;
  b=UR7xerEJI81z6uq20dEwcY+RhNieFJ1lmWwQypC/fwcU+NaUv2CN3etP
   LLCpO/w4Fn67MYhxtVUYz1Wd5McoIYmJ7syWruP6mxfP3QDjc9g0mIi/v
   zsn1RGIy18CZySfLtxc3cefcCpW39zUmevxTyD0SlEhY3tNJHMpFhVi13
   4/uQSwCr0oWkMSe7gbo16u1zeR3/n6Gvmc1bcmnXVoqtk6KOmhLvKKwh7
   imNTF9vLZQ/ENZEeo4Axl8gr3Z2rsxBoLTmZ7fhD9I2mA2EwNOh9+v/fn
   EXbDr8ay5/3jS51kgZr7lVJUe0UlbcBL69YqfDmCzPzDkfzOJ5S3hqq4B
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="390615838"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="390615838"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 10:04:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="788972548"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="788972548"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Feb 2023 10:03:46 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNHSO-0005fM-1n;
	Wed, 01 Feb 2023 18:03:40 +0000
Date: Thu, 2 Feb 2023 02:02:56 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [stable:linux-5.10.y 2367/9999]
 drivers/gpu/drm/i915/gt/intel_gt.c:732:2: error: format string is not a
 string literal (potentially insecure)
Message-ID: <202302020154.rtce7MUN-lkp@intel.com>
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
head:   8d823aaa220eebec88c9f307225d3e163252ea95
commit: 6a6acf927895c38bdd9f3cd76b8dbfc25ac03e88 [2367/9999] drm/i915: Flush TLBs before releasing backing store
config: i386-randconfig-a012-20230130 (https://download.01.org/0day-ci/archive/20230202/202302020154.rtce7MUN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=6a6acf927895c38bdd9f3cd76b8dbfc25ac03e88
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout 6a6acf927895c38bdd9f3cd76b8dbfc25ac03e88
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
https://github.com/intel/lkp-tests
