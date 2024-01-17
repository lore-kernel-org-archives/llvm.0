Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FD624212;
	Wed, 17 Jan 2024 20:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705522941; cv=none; b=hnihlQEA2Ej8Om7QDmvngyNlXnjC8o4CLAkFEB9tXy5MTWSp86o6Hpx+Y3JJ5uo20dOrGPy4bxEuhEomlHnsdbY+bybP0zDaCicCGl3NhJ3B0VB0h7mvT2rn6rhvkfNky0rId6IWZfILc07LMyEgWyotRg9p4ejruWuwnWCTnZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705522941; c=relaxed/simple;
	bh=8GtrfbtluehTb6h+zzyuY+h/ZkDVx5b3uJL7UdVtNOY=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qtqHSUPYVRdcViGF8amKcSMEr3WUnn4qIhyRuuunyjPMUCIg4vXF8Bvm1zaM2RWt153cWPweNLpkSu0IUhPHiSYmfdjnOvoRa52UkuOHSF0gubCsq/XYYWLJVh6Vd72WpO8/vgAztsOtwsMmrHtrguBj8VUN7DB0wAK/rvh7ltY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBGTyoqN; arc=none smtp.client-ip=134.134.136.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBGTyoqN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705522940; x=1737058940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8GtrfbtluehTb6h+zzyuY+h/ZkDVx5b3uJL7UdVtNOY=;
  b=eBGTyoqNOkbi5fKavl/AAkHWsM3DRsY4LSVBjuI3c3yF3KJ6pdqzu2I+
   aGcB13KkXFxP9YiTEFlACcRTYYGzeiL/UATE5xVi20eXEChvwZAp7VJAi
   9cw6ZSulwMqyBVzQhUtDSmW3l8UNRJAXwN+1Y1HljNVsJqu/Z5to0cJBc
   wN3kqaFtrLBEZWqBjVJry/X/Xtil+uw9H1DSt04eK0T0ZINNtV+VmEAd2
   V5IQvdtkoCXsShvqr6ADYAjc6+83ZzJeLwPvGFpPxsFJpIsNkJWNdELad
   cD4Dps87ndrJgi8HUeiL9ot96x+hCWWgIMS4o3HDRmOW0idlJyVSbIa+o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="466647476"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="466647476"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 12:22:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="1115767989"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="1115767989"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 17 Jan 2024 12:22:17 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQCQR-0002Jw-0C;
	Wed, 17 Jan 2024 20:22:15 +0000
Date: Thu, 18 Jan 2024 04:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/i915: move interrupt save/restore into vblank
 section helpers
Message-ID: <202401180456.XKw1s0M1-lkp@intel.com>
References: <20240117094613.1401573-1-luciano.coelho@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240117094613.1401573-1-luciano.coelho@intel.com>

Hi Luca,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip linus/master next-20240117]
[cannot apply to drm-intel/for-linux-next-fixes v6.7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Coelho/drm-i915-move-interrupt-save-restore-into-vblank-section-helpers/20240117-174910
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240117094613.1401573-1-luciano.coelho%40intel.com
patch subject: [PATCH] drm/i915: move interrupt save/restore into vblank section helpers
config: i386-randconfig-011-20240117 (https://download.01.org/0day-ci/archive/20240118/202401180456.XKw1s0M1-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180456.XKw1s0M1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180456.XKw1s0M1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_vblank.c:282:17: error: use of undeclared identifier 'irqflags'
     282 |         local_irq_save(irqflags);
         |                        ^
>> drivers/gpu/drm/i915/display/intel_vblank.c:282:17: error: use of undeclared identifier 'irqflags'
>> drivers/gpu/drm/i915/display/intel_vblank.c:282:17: error: use of undeclared identifier 'irqflags'
>> drivers/gpu/drm/i915/display/intel_vblank.c:282:17: error: use of undeclared identifier 'irqflags'
   drivers/gpu/drm/i915/display/intel_vblank.c:294:20: error: use of undeclared identifier 'irqflags'
     294 |         local_irq_restore(irqflags);
         |                           ^
   drivers/gpu/drm/i915/display/intel_vblank.c:294:20: error: use of undeclared identifier 'irqflags'
   drivers/gpu/drm/i915/display/intel_vblank.c:294:20: error: use of undeclared identifier 'irqflags'
   drivers/gpu/drm/i915/display/intel_vblank.c:294:20: error: use of undeclared identifier 'irqflags'
   drivers/gpu/drm/i915/display/intel_vblank.c:309:16: warning: unused variable 'irqflags' [-Wunused-variable]
     309 |         unsigned long irqflags;
         |                       ^~~~~~~~
   drivers/gpu/drm/i915/display/intel_vblank.c:441:16: warning: unused variable 'irqflags' [-Wunused-variable]
     441 |         unsigned long irqflags;
         |                       ^~~~~~~~
   2 warnings and 8 errors generated.


vim +/irqflags +282 drivers/gpu/drm/i915/display/intel_vblank.c

   267	
   268	/*
   269	 * These functions help enter and exit vblank critical sections.  When
   270	 * entering, they disable interrupts and, for i915, acquire the
   271	 * uncore's spinlock.  Conversely, when exiting, they release the
   272	 * spinlock and restore the interrupts state.
   273	 *
   274	 * This lock in i915 is needed because some old platforms (at least
   275	 * IVB and possibly HSW as well), which are not supported in Xe, need
   276	 * all register accesses to the same cacheline to be serialized,
   277	 * otherwise they may hang.
   278	 */
   279	static void intel_vblank_section_enter(struct drm_i915_private *i915)
   280		__acquires(i915->uncore.lock)
   281	{
 > 282		local_irq_save(irqflags);
   283	#ifdef I915
   284		spin_lock(&i915->uncore.lock);
   285	#endif
   286	}
   287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
