Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13DF28FC;
	Mon, 10 Apr 2023 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681121903; x=1712657903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Px3xZYXBGh3gWKcigP5xScFiAaWtfJvlKq6TWnP5VY=;
  b=i9dpVHB9rTB+rLyXLjae/cj5uT40r4WVcy2BJWKIyRmhDwGUoxnZWoGu
   qN2Riof5rqLNFi4f6LN+L232WwFJUEzw0q5MSCn5OU1cqnR4sHnQQmd8s
   TeqJdj6mWhRAhh5NeodHKcM0huEeIB71EFiyCl+3iGlBQAgqIsVWuuUU9
   ohibbE9U8f045hare2wgJ0SNYNztG3OVeE1JCflp4PsCeXTVtJ9FJr58H
   1XEzJZA7Xbr9dLqshKzoIDxDNCvvAndegXOIPro6GexcYJRVzSbdKe/He
   kusb3Uj74uUANUilFO05FSMWkTnJVXJCmoL+MhJKky21y/cQRETZzz5VM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="327421873"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="327421873"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 03:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="777524079"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="777524079"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Apr 2023 03:18:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plobM-000VJB-01;
	Mon, 10 Apr 2023 10:18:20 +0000
Date: Mon, 10 Apr 2023 18:17:26 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [stable:linux-5.10.y 1220/9999]
 drivers/gpu/drm/i915/gt/intel_gt.c:732:2: error: format string is not a
 string literal (potentially insecure)
Message-ID: <202304101810.OgeMN6Rz-lkp@intel.com>
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
head:   387078f9030cf336cd9fef521540db75b61615e0
commit: 6a6acf927895c38bdd9f3cd76b8dbfc25ac03e88 [1220/9999] drm/i915: Flush TLBs before releasing backing store
config: x86_64-randconfig-a005-20230410 (https://download.01.org/0day-ci/archive/20230410/202304101810.OgeMN6Rz-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304101810.OgeMN6Rz-lkp@intel.com/

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
