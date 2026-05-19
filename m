Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64113340410;
	Tue, 19 May 2026 21:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779226934; cv=none; b=dEvQzPirAn5jNucUW9/HSzxmoL/YCqSyGHvaVy80TX0jgchXnJAlHredlx7dCD0WGuOkb8Tyf/aw9ThMyk5LQU9BBvtrZO0Ni4MipnngMhKq8NfIkrhac3pfd4FDA2CHyllptN6GGgCjvueVyxTV6TqnyKz3bP+ZVl5K0cQ/vTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779226934; c=relaxed/simple;
	bh=u+oASp8WqVXxtIuZ64LeZdcYJM09Hpg4fAQh9T9IUMU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FDVavGnq881O7TwSoO/euinMO9dyagfea2XT3YmwaTO1ytNfpIUOOjm8/kcsNBLPx90N5y7C7Tv3UTSw5boBt5qUMXoXUY6jv5lLS5KoxdMn0eseCOOcoKbe7NWGr3+jJpd0rpN3fxBDOdOTLjUTRiT8rSpkDjDEXcPvJFc1jpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h5DRmhjy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h5DRmhjy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779226934; x=1810762934;
  h=date:from:to:cc:subject:message-id;
  bh=u+oASp8WqVXxtIuZ64LeZdcYJM09Hpg4fAQh9T9IUMU=;
  b=h5DRmhjyViP1t4M7BayKVJv9kZswd6lvNcu4u02AjfMcMoeh9ydvuZeH
   2iFQIdfDmQrS6SC6Uh0lbQZZQSTsKCoZrWgmO1cuvxysyY7MeaXHwHfxQ
   oaF4D6Zv3rmh5mh0JARj9vjRc2Dr1dRU1sd+DJbCuQjbloM3rACo8mTAu
   oneCYsImt3bPWzHgFaMsXlE6Y/LB+c4ciRMfltrKYg4SedXpdMLIqkxSi
   a1caP4qv94rJF90a+kCd9/rFqAMn04FygPlyhZCEBdOBTqmPhzXFcqDaD
   BkMDXYWcgyAVWaL7U/j9U2JQPCqGUqrcAuBw14OabbEllIk+TgEQ1wAx1
   A==;
X-CSE-ConnectionGUID: /PhVQlvnS4GSQkzjfCTySQ==
X-CSE-MsgGUID: znenZG1eS+GmXITAxu3UrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91584530"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91584530"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 14:42:07 -0700
X-CSE-ConnectionGUID: x39mbVj/TGCtEY5GbwrCLA==
X-CSE-MsgGUID: 2Gdlt5kkTMKZrRvc5HPWLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239062104"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 19 May 2026 14:42:00 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPSBj-000000001xH-2nGP;
	Tue, 19 May 2026 21:41:31 +0000
Date: Wed, 20 May 2026 05:32:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 234/238]
 arch/x86/xen/pmu.c:551:52: error: too few arguments provided to function-like
 macro invocation
Message-ID: <202605200546.bZPeSOBS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 04507bba0f5ca2d399ac98b495682a381b669c27 [234/238] x86/xen/msr: replace get_zeroed_page() with kzalloc()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260520/202605200546.bZPeSOBS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200546.bZPeSOBS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200546.bZPeSOBS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/xen/pmu.c:551:52: error: too few arguments provided to function-like macro invocation
     551 |         kfree((void *)(unsigned long)per_cpu(xenpmu_shared).xenpmu_data, 0);
         |                                                           ^
   include/linux/percpu-defs.h:273:9: note: macro 'per_cpu' defined here
     273 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |         ^
>> arch/x86/xen/pmu.c:551:31: error: use of undeclared identifier 'per_cpu'
     551 |         kfree((void *)(unsigned long)per_cpu(xenpmu_shared).xenpmu_data, 0);
         |                                      ^
   2 errors generated.


vim +551 arch/x86/xen/pmu.c

   537	
   538	void xen_pmu_finish(int cpu)
   539	{
   540		struct xen_pmu_params xp;
   541	
   542		if (xen_hvm_domain())
   543			return;
   544	
   545		xp.vcpu = cpu;
   546		xp.version.maj = XENPMU_VER_MAJ;
   547		xp.version.min = XENPMU_VER_MIN;
   548	
   549		(void)HYPERVISOR_xenpmu_op(XENPMU_finish, &xp);
   550	
 > 551		kfree((void *)(unsigned long)per_cpu(xenpmu_shared).xenpmu_data, 0);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
