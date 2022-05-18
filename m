Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573F97F
	for <llvm@lists.linux.dev>; Wed, 18 May 2022 02:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652839883; x=1684375883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sDi1b/n6+eMEJdLkZx6KM/2L6PvkOIYVb/LPTYgoEPo=;
  b=hav6oeBZ60ngbtVdOYgmuRWKTVRNYlsxbG+6Jeq4C/cMCjO+WhFNOM6c
   uTONA8KWAj+x7At6RvWO1gM19Jotz/J/uYodTn7taDUF9B/0Vj6yFUJwc
   ZOdwmLHqYNz7FpxhwaCireF9pYu/wZRLjuySvwXWm45b98N1RT+1BsGA+
   BUCTqIuP7t9bkY0WPzuxtFhr9NctK94Tlt8lumAL8r8aGi327yVKQrbWD
   5JIRzsimYxGTRgXVfsABbXfOgvXpeQ7q0seGfBe7oaUCcAL9yEwi8Uoir
   MJUP6ZWCN33Dx8BP0mvKXLxJTMf6mR0QG5nezCO96EvJwep1qoRKodsIl
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="271558370"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="271558370"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 19:11:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="700362894"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 May 2022 19:11:12 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nr99b-0001gz-FB;
	Wed, 18 May 2022 02:11:11 +0000
Date: Wed, 18 May 2022 10:10:25 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [linux-stable-rc:linux-5.4.y 2248/3625]
 drivers/gpu/drm/i915/gt/intel_gt.c:335:2: error: format string is not a
 string literal (potentially insecure)
Message-ID: <202205180933.FHJdKHSI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
head:   25f2e99af01b5b7328f55bbadab563cb26478289
commit: 1b5553c79d52f17e735cd924ff2178a2409e6d0b [2248/3625] drm/i915: Flush TLBs before releasing backing store
config: x86_64-randconfig-r031-20220516 (https://download.01.org/0day-ci/archive/20220518/202205180933.FHJdKHSI-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=1b5553c79d52f17e735cd924ff2178a2409e6d0b
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.4.y
        git checkout 1b5553c79d52f17e735cd924ff2178a2409e6d0b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/intel_gt.c:335:2: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
           GEM_TRACE("\n");
           ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.h:68:24: note: expanded from macro 'GEM_TRACE'
   #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:716:3: note: expanded from macro 'trace_printk'
                   do_trace_printk(fmt, ##__VA_ARGS__);    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:730:30: note: expanded from macro 'do_trace_printk'
                   __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
                                              ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/intel_gt.c:335:2: note: treat the string as an argument to avoid this
   drivers/gpu/drm/i915/i915_gem.h:68:24: note: expanded from macro 'GEM_TRACE'
   #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
                          ^
   include/linux/kernel.h:716:3: note: expanded from macro 'trace_printk'
                   do_trace_printk(fmt, ##__VA_ARGS__);    \
                   ^
   include/linux/kernel.h:730:30: note: expanded from macro 'do_trace_printk'
                   __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
                                              ^
   1 error generated.


vim +335 drivers/gpu/drm/i915/gt/intel_gt.c

   297	
   298	void intel_gt_invalidate_tlbs(struct intel_gt *gt)
   299	{
   300		static const i915_reg_t gen8_regs[] = {
   301			[RENDER_CLASS]			= GEN8_RTCR,
   302			[VIDEO_DECODE_CLASS]		= GEN8_M1TCR, /* , GEN8_M2TCR */
   303			[VIDEO_ENHANCEMENT_CLASS]	= GEN8_VTCR,
   304			[COPY_ENGINE_CLASS]		= GEN8_BTCR,
   305		};
   306		static const i915_reg_t gen12_regs[] = {
   307			[RENDER_CLASS]			= GEN12_GFX_TLB_INV_CR,
   308			[VIDEO_DECODE_CLASS]		= GEN12_VD_TLB_INV_CR,
   309			[VIDEO_ENHANCEMENT_CLASS]	= GEN12_VE_TLB_INV_CR,
   310			[COPY_ENGINE_CLASS]		= GEN12_BLT_TLB_INV_CR,
   311		};
   312		struct drm_i915_private *i915 = gt->i915;
   313		struct intel_uncore *uncore = gt->uncore;
   314		struct intel_engine_cs *engine;
   315		enum intel_engine_id id;
   316		const i915_reg_t *regs;
   317		unsigned int num = 0;
   318	
   319		if (I915_SELFTEST_ONLY(gt->awake == -ENODEV))
   320			return;
   321	
   322		if (INTEL_GEN(i915) == 12) {
   323			regs = gen12_regs;
   324			num = ARRAY_SIZE(gen12_regs);
   325		} else if (INTEL_GEN(i915) >= 8 && INTEL_GEN(i915) <= 11) {
   326			regs = gen8_regs;
   327			num = ARRAY_SIZE(gen8_regs);
   328		} else if (INTEL_GEN(i915) < 8) {
   329			return;
   330		}
   331	
   332		if (WARN_ONCE(!num, "Platform does not implement TLB invalidation!"))
   333			return;
   334	
 > 335		GEM_TRACE("\n");

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
