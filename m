Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7544E194A44;
	Wed, 14 May 2025 17:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245300; cv=none; b=UrheSVXHNiXFnPRFiprY4Dax6onu/PfGuKhs7tFmgtju8ebje+Adhd7jHEYUZbCeeAkVMAH0j5+BsNAqaSlZqPmURe9Ac648NWr5FZWvs8N2AXECiAP3mXgY9uAKfxAD1glEkWYgLL+Rc7+U9AKQ8+MCIohd/da5dhfES4nrQSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245300; c=relaxed/simple;
	bh=QuwXOW+bPbr+c/N3MgIMBMJ3gYGLGrCnOuRpDAxpyCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZA9/xGO5o5hxFACMnC59tC6bvUb6c9inEvUNgpXVD17d6p+K8ZJmL9uc6Mr4I6t0mvuh2hTwQ4dHzCtIR+d5Y9QZoGJICB8A1kH/zAYK1R/0Vptjo5RpqUJZltd+A+SNFsEsqvTlPmchKr9XNDBU+WBcMjuCr/df+ooQzwah4i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBYiUVu0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBYiUVu0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747245299; x=1778781299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QuwXOW+bPbr+c/N3MgIMBMJ3gYGLGrCnOuRpDAxpyCo=;
  b=EBYiUVu01FXNeCI7JXNjFaPBSKIbSpWAqlEUcC36eSqDAxrnk+xHypFK
   c7bo3Kgxbi5kGuXCXl6ZwSn0y4MXU82emGP2WKBJc0z0d5UZ8e+5RKesH
   MHUI4ZPihzK3o9oUmw/r5kLwaF1tZrojO6PJOzenoPcOuiewBLctPYacm
   lFLL6JJpiZKqvDWbfgko4jM6qigPPZfasGmmUgYWgOBE9XpJo2a4cIVxE
   1Q5H08vuke5WFW4Jo8aPSkCtVCSMoLGIInF0sOCrU/oJZwDAdMbG0Kz5s
   JD01z76ghmuoZwF6V/PO5rhPgOJ+vuIldMc4osONWzn2PeOWuAEBBs8yy
   w==;
X-CSE-ConnectionGUID: yTiEMk5qRh6TX8ORTfB1gw==
X-CSE-MsgGUID: WrPGCr9PSZulewo0veVT8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48409102"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="48409102"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 10:54:58 -0700
X-CSE-ConnectionGUID: s1vqdcwFQkeGehkzAL9m8Q==
X-CSE-MsgGUID: j3qPMOXwRLugPYoU1XiJQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="161399910"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 May 2025 10:54:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFGJi-000HQ7-17;
	Wed, 14 May 2025 17:54:54 +0000
Date: Thu, 15 May 2025 01:53:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/mediated_pmu 77/104] arch/arm64/kvm/arm.c:2356:30:
 error: too many arguments to function call, expected 0, have 1
Message-ID: <202505150150.ncs78yPq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/mediated_pmu
head:   ab0311cfb61696f3d4cbf9ce764d057ff40d98f0
commit: 2c1ab50147cdb81f59f64e8696594d343ec6a9e3 [77/104] KVM: Add a simplified wrapper for registering perf callbacks
config: arm64-randconfig-001-20250514 (https://download.01.org/0day-ci/archive/20250515/202505150150.ncs78yPq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150150.ncs78yPq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150150.ncs78yPq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/arm.c:2356:30: error: too many arguments to function call, expected 0, have 1
    2356 |         kvm_register_perf_callbacks(NULL);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   include/linux/kvm_host.h:1754:20: note: 'kvm_register_perf_callbacks' declared here
    1754 | static inline void kvm_register_perf_callbacks(void)
         |                    ^
   1 error generated.


vim +2356 arch/arm64/kvm/arm.c

eeeee7193df015 arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2297  
53bf620a2cdfbc arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2298  static int __init init_subsystems(void)
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2299  {
67f6919766620e arch/arm/kvm/arm.c   AKASHI Takahiro     2016-04-27  2300  	int err = 0;
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2301  
5f5560b1c5f3a8 arch/arm/kvm/arm.c   James Morse         2016-03-30  2302  	/*
67f6919766620e arch/arm/kvm/arm.c   AKASHI Takahiro     2016-04-27  2303  	 * Enable hardware so that subsystem initialisation can access EL2.
5f5560b1c5f3a8 arch/arm/kvm/arm.c   James Morse         2016-03-30  2304  	 */
733c758e509b86 arch/arm64/kvm/arm.c Oliver Upton        2023-07-19  2305  	on_each_cpu(cpu_hyp_init, NULL, 1);
5f5560b1c5f3a8 arch/arm/kvm/arm.c   James Morse         2016-03-30  2306  
5f5560b1c5f3a8 arch/arm/kvm/arm.c   James Morse         2016-03-30  2307  	/*
5f5560b1c5f3a8 arch/arm/kvm/arm.c   James Morse         2016-03-30  2308  	 * Register CPU lower-power notifier
5f5560b1c5f3a8 arch/arm/kvm/arm.c   James Morse         2016-03-30  2309  	 */
5f5560b1c5f3a8 arch/arm/kvm/arm.c   James Morse         2016-03-30  2310  	hyp_cpu_pm_init();
5f5560b1c5f3a8 arch/arm/kvm/arm.c   James Morse         2016-03-30  2311  
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2312  	/*
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2313  	 * Init HYP view of VGIC
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2314  	 */
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2315  	err = kvm_vgic_hyp_init();
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2316  	switch (err) {
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2317  	case 0:
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2318  		vgic_present = true;
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2319  		break;
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2320  	case -ENODEV:
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2321  	case -ENXIO:
32392e04cb50d8 arch/arm64/kvm/arm.c Oliver Upton        2025-02-03  2322  		/*
32392e04cb50d8 arch/arm64/kvm/arm.c Oliver Upton        2025-02-03  2323  		 * No VGIC? No pKVM for you.
32392e04cb50d8 arch/arm64/kvm/arm.c Oliver Upton        2025-02-03  2324  		 *
32392e04cb50d8 arch/arm64/kvm/arm.c Oliver Upton        2025-02-03  2325  		 * Protected mode assumes that VGICv3 is present, so no point
32392e04cb50d8 arch/arm64/kvm/arm.c Oliver Upton        2025-02-03  2326  		 * in trying to hobble along if vgic initialization fails.
32392e04cb50d8 arch/arm64/kvm/arm.c Oliver Upton        2025-02-03  2327  		 */
32392e04cb50d8 arch/arm64/kvm/arm.c Oliver Upton        2025-02-03  2328  		if (is_protected_kvm_enabled())
32392e04cb50d8 arch/arm64/kvm/arm.c Oliver Upton        2025-02-03  2329  			goto out;
32392e04cb50d8 arch/arm64/kvm/arm.c Oliver Upton        2025-02-03  2330  
32392e04cb50d8 arch/arm64/kvm/arm.c Oliver Upton        2025-02-03  2331  		/*
32392e04cb50d8 arch/arm64/kvm/arm.c Oliver Upton        2025-02-03  2332  		 * Otherwise, userspace could choose to implement a GIC for its
32392e04cb50d8 arch/arm64/kvm/arm.c Oliver Upton        2025-02-03  2333  		 * guest on non-cooperative hardware.
32392e04cb50d8 arch/arm64/kvm/arm.c Oliver Upton        2025-02-03  2334  		 */
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2335  		vgic_present = false;
67f6919766620e arch/arm/kvm/arm.c   AKASHI Takahiro     2016-04-27  2336  		err = 0;
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2337  		break;
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2338  	default:
67f6919766620e arch/arm/kvm/arm.c   AKASHI Takahiro     2016-04-27  2339  		goto out;
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2340  	}
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2341  
83c6cb20147b5e arch/arm64/kvm/arm.c Marc Zyngier        2025-02-25  2342  	if (kvm_mode == KVM_MODE_NV &&
83c6cb20147b5e arch/arm64/kvm/arm.c Marc Zyngier        2025-02-25  2343  	   !(vgic_present && kvm_vgic_global_state.type == VGIC_V3)) {
83c6cb20147b5e arch/arm64/kvm/arm.c Marc Zyngier        2025-02-25  2344  		kvm_err("NV support requires GICv3, giving up\n");
83c6cb20147b5e arch/arm64/kvm/arm.c Marc Zyngier        2025-02-25  2345  		err = -EINVAL;
83c6cb20147b5e arch/arm64/kvm/arm.c Marc Zyngier        2025-02-25  2346  		goto out;
83c6cb20147b5e arch/arm64/kvm/arm.c Marc Zyngier        2025-02-25  2347  	}
83c6cb20147b5e arch/arm64/kvm/arm.c Marc Zyngier        2025-02-25  2348  
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2349  	/*
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2350  	 * Init HYP architected timer support
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2351  	 */
f384dcfe4d918c virt/kvm/arm/arm.c   Marc Zyngier        2017-12-07  2352  	err = kvm_timer_hyp_init(vgic_present);
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2353  	if (err)
67f6919766620e arch/arm/kvm/arm.c   AKASHI Takahiro     2016-04-27  2354  		goto out;
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2355  
17ed14eba22b3a arch/arm64/kvm/arm.c Sean Christopherson 2021-11-11 @2356  	kvm_register_perf_callbacks(NULL);
17ed14eba22b3a arch/arm64/kvm/arm.c Sean Christopherson 2021-11-11  2357  
67f6919766620e arch/arm/kvm/arm.c   AKASHI Takahiro     2016-04-27  2358  out:
78b3bf485d5cb5 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2359  	if (err)
78b3bf485d5cb5 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2360  		hyp_cpu_pm_exit();
78b3bf485d5cb5 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2361  
fa8c3d65538aa1 arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2362  	if (err || !is_protected_kvm_enabled())
733c758e509b86 arch/arm64/kvm/arm.c Oliver Upton        2023-07-19  2363  		on_each_cpu(cpu_hyp_uninit, NULL, 1);
67f6919766620e arch/arm/kvm/arm.c   AKASHI Takahiro     2016-04-27  2364  
67f6919766620e arch/arm/kvm/arm.c   AKASHI Takahiro     2016-04-27  2365  	return err;
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2366  }
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2367  

:::::: The code at line 2356 was first introduced by commit
:::::: 17ed14eba22b3a86e82fb6df28af00fb4cadfd77 KVM: arm64: Drop perf.c and fold its tiny bits of code into arm.c

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
