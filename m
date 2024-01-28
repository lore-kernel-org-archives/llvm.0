Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD217EF;
	Sun, 28 Jan 2024 00:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706400252; cv=none; b=WKjKYSvIGqGGeNt7RjbGJ2hEIyPusYyFN31Ssp7Wz7gOrUc/QxwFhe03UfDL6gW/ddRrc7zBBr51GuXbVV/dhihdRcBUsf+y/yRJJYM6wa4dlxDKwM8j67XsPZaErpSb0baXh2KXBVR76Xr+ixMD40IqSKKYgZXWMqT8K5fcdkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706400252; c=relaxed/simple;
	bh=YLumH16JuPSsluGRphDit71LzkI3Vnib8UgVorMDduw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LZawv+SjNbbb8PMzaB6lr6rsSqvLHN550AYcnxqkyuOJFKtTLB99AIDLjlauGin5huWR5mSn88Wt91/sp4vVNxlvpKQLHRq2R8dEpGYRVPDdqt1K0zEnyGeBm3smUMlCVtYSTJWQWPDiFk9b8i7yMjCBJTOxUgSRiJlswV2kKGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfhiSxpJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfhiSxpJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706400250; x=1737936250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YLumH16JuPSsluGRphDit71LzkI3Vnib8UgVorMDduw=;
  b=TfhiSxpJKRUbvJKj5O0jzCd/Ahio6s0mE1Q88ua5mXUQv1xt1gVYj2Ul
   7eVHXPTf9Wmcj2onE2dX8i1jz7P4ZLMnE12/KJmvWb4R3BbPL1bxjZG8p
   57PA40iy1YQcmp+MYHQ27IfiFkuoVvLpVTBsD2YWnDc0Bk/+ErKeoMTE/
   H1JfjtOG4SZOz7usjamzoksxaPCvcMn6gFcVTKR1SN6kUhIrOhyFlq+q9
   8DjQcbndfNbbl8r2EjMFiC5DVSRqLQJ0KeI47EGWM8KgwqHcJuOHuy3qQ
   ou9aH/8WBqDx3UPV0xnQHNhVmGR1SLMnZxVG7Gzum1+JpsKWNUSFoDYLI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="2588252"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2588252"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 16:04:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="910684910"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="910684910"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Jan 2024 16:04:06 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTsea-0002so-1Q;
	Sun, 28 Jan 2024 00:04:04 +0000
Date: Sun, 28 Jan 2024 08:03:41 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Galbraith <umgwanakikbuti@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [rt-devel:linux-6.8.y-rt 63/96]
 drivers/gpu/drm/i915/display/intel_vblank.c:284:9: error: incompatible
 pointer to integer conversion assigning to 'unsigned long' from 'void *'
Message-ID: <202401280723.PRXAmsjo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.8.y-rt
head:   ff2361c71bd48a300cf147f5ffa6cd0f67135879
commit: 722e48bb3059ead4fcf48804b314d165a7609029 [63/96] drm/i915: Use preempt_disable/enable_rt() where recommended
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240128/202401280723.PRXAmsjo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280723.PRXAmsjo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280723.PRXAmsjo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_vblank.c:284:9: error: incompatible pointer to integer conversion assigning to 'unsigned long' from 'void *' [-Wint-conversion]
     284 |         *flags = NULL;
         |                ^ ~~~~
   1 error generated.


vim +284 drivers/gpu/drm/i915/display/intel_vblank.c

   267	
   268	/*
   269	 * The uncore version of the spin lock functions is used to decide
   270	 * whether we need to lock the uncore lock or not.  This is only
   271	 * needed in i915, not in Xe.
   272	 *
   273	 * This lock in i915 is needed because some old platforms (at least
   274	 * IVB and possibly HSW as well), which are not supported in Xe, need
   275	 * all register accesses to the same cacheline to be serialized,
   276	 * otherwise they may hang.
   277	 */
   278	static void intel_vblank_section_enter_irqsave(struct drm_i915_private *i915, unsigned long *flags)
   279		__acquires(i915->uncore.lock)
   280	{
   281	#ifdef I915
   282		spin_lock_irqsave(&i915->uncore.lock, *flags);
   283	#else
 > 284		*flags = NULL;
   285	#endif
   286	}
   287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
