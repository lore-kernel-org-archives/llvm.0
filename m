Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ED520DE4;
	Tue, 21 Nov 2023 20:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mkae5KcG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700597115; x=1732133115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TVQTqQYlVVj7iGtz+mGp4eYK6XnKsFaWzGtA5+1YIN0=;
  b=Mkae5KcGTlMaJUlIiU4ONpXYJEUsPRROiyzRzrlPARGm+9FZJwZVin9V
   XuSKwuXEbv9hxupIa6HluspQxBbLPYPPQQmHKM52mAu5SMazc9Lzg3ZeC
   gsVGhw4hEiBnjGzlhP3Ch+QiIz3J60E9YT7KSXBkdGoWwNLo/f3wOnPfE
   smZRKxvPp8C3IN4qF1XYhyduBppfqxWQ2a1q4pXc1XQFw4JhvY84AuDWp
   ybWIz8+I5bF+sRPyNAIL6TW7ZB35Wd+sJKA2t3d95586xNFC29KTIgxyr
   eNNFBklG0AeNIdLZe3R8GMaz75GgcOB/Y1UYN3QD+6QmBGKuX8l9a68JH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="391691344"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="391691344"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 12:05:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="760214715"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="760214715"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Nov 2023 12:05:12 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5Wze-0008D3-0J;
	Tue, 21 Nov 2023 20:05:10 +0000
Date: Wed, 22 Nov 2023 04:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 38/73] arch/x86/hyperv/hv_vtl.c:30:19:
 error: no member named 'get_smp_config' in 'struct x86_init_mpparse'
Message-ID: <202311220318.bJavb53t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   4fe0e2152c0eca6ed0c790ace47809c2c9e62708
commit: e5e4d8cf04a82ff89f673e4097525155999c832e [38/73] x86/mpparse: Switch to new init callbacks
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231122/202311220318.bJavb53t-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220318.bJavb53t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311220318.bJavb53t-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/hyperv/hv_vtl.c:29:19: error: no member named 'find_smp_config' in 'struct x86_init_mpparse'
           x86_init.mpparse.find_smp_config = x86_init_noop;
           ~~~~~~~~~~~~~~~~ ^
>> arch/x86/hyperv/hv_vtl.c:30:19: error: no member named 'get_smp_config' in 'struct x86_init_mpparse'
           x86_init.mpparse.get_smp_config = x86_init_uint_noop;
           ~~~~~~~~~~~~~~~~ ^
   2 errors generated.


vim +30 arch/x86/hyperv/hv_vtl.c

3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  18  
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  19  void __init hv_vtl_init_platform(void)
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  20  {
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  21  	pr_info("Linux runs in Hyper-V Virtual Trust Level\n");
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  22  
cb6aeeb69af06b Saurabh Sengar 2023-04-24  23  	x86_platform.realmode_reserve = x86_init_noop;
cb6aeeb69af06b Saurabh Sengar 2023-04-24  24  	x86_platform.realmode_init = x86_init_noop;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  25  	x86_init.irqs.pre_vector_init = x86_init_noop;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  26  	x86_init.timers.timer_init = x86_init_noop;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  27  
9e2d0c33652470 Saurabh Sengar 2023-06-23  28  	/* Avoid searching for BIOS MP tables */
9e2d0c33652470 Saurabh Sengar 2023-06-23  29  	x86_init.mpparse.find_smp_config = x86_init_noop;
9e2d0c33652470 Saurabh Sengar 2023-06-23 @30  	x86_init.mpparse.get_smp_config = x86_init_uint_noop;
9e2d0c33652470 Saurabh Sengar 2023-06-23  31  
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  32  	x86_platform.get_wallclock = get_rtc_noop;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  33  	x86_platform.set_wallclock = set_rtc_noop;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  34  	x86_platform.get_nmi_reason = hv_get_nmi_reason;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  35  
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  36  	x86_platform.legacy.i8042 = X86_LEGACY_I8042_PLATFORM_ABSENT;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  37  	x86_platform.legacy.rtc = 0;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  38  	x86_platform.legacy.warm_reset = 0;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  39  	x86_platform.legacy.reserve_bios_regions = 0;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  40  	x86_platform.legacy.devices.pnpbios = 0;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  41  }
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  42  

:::::: The code at line 30 was first introduced by commit
:::::: 9e2d0c336524706fb327e9b87477f5f3337ad7a6 x86/hyperv: add noop functions to x86_init mpparse functions

:::::: TO: Saurabh Sengar <ssengar@linux.microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
