Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E296C8E1;
	Fri, 29 Sep 2023 20:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696020114; x=1727556114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dR7SUYn2jYKCo8MxOXStEXnxyfIRE39PjK8d61aXcDs=;
  b=Im4U3i+83+gscI9qtxLbkcVUABdRIiJ6gQIcKCoX2v8T7IdQ4cid3ucZ
   PZWX2wDNepU3Ni3DOn7QCUdJ4b+DDAqgQG8He5QZaX4Z6xmF6PucQVGGD
   LbhnKz8IpXJUL/HQ71otcTt1WNRrlEjgh+LC4xpbsXWgS/Q4WxMcR+IJG
   hr7n5EoaLz3bwY4w5/uxogJ730nNOB6q0v+s6O1uIAYrYF2EqqyPzWIqZ
   mxHspjQsNhc7BxU/bUUsax+wV7uGyFA1/C4Prlzz827SQkS/NB0tBAqUB
   9SLBDaxDTI+GFtYnCFeBJN4Ck7n0ldZMiIaFXIrbgv+j0bP6zQ4D5hvsZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="382280479"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="382280479"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 13:08:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="785186197"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="785186197"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Sep 2023 13:08:31 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmJmm-0003Cr-1s;
	Fri, 29 Sep 2023 20:08:28 +0000
Date: Sat, 30 Sep 2023 04:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: arch/arm/mach-sa1100/pm.c:122:12: warning: no previous prototype for
 function 'sa11x0_pm_init'
Message-ID: <202309300341.lmOXFhDS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nathan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c84724ccb1a9f6eaf727ded49dd7e22ac62cc5b
commit: 5eb6e280432ddc9b755193552f3a070da8d7455c ARM: 9289/1: Allow pre-ARMv5 builds with ld.lld 16.0.0 and newer
date:   8 months ago
config: arm-collie_defconfig (https://download.01.org/0day-ci/archive/20230930/202309300341.lmOXFhDS-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309300341.lmOXFhDS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309300341.lmOXFhDS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mach-sa1100/pm.c:122:12: warning: no previous prototype for function 'sa11x0_pm_init' [-Wmissing-prototypes]
     122 | int __init sa11x0_pm_init(void)
         |            ^
   arch/arm/mach-sa1100/pm.c:122:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     122 | int __init sa11x0_pm_init(void)
         | ^
         | static 
   1 warning generated.
--
>> drivers/gpio/gpio-sa1100.c:309:13: warning: no previous prototype for function 'sa1100_init_gpio' [-Wmissing-prototypes]
     309 | void __init sa1100_init_gpio(void)
         |             ^
   drivers/gpio/gpio-sa1100.c:309:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     309 | void __init sa1100_init_gpio(void)
         | ^
         | static 
   1 warning generated.
--
>> drivers/pcmcia/pxa2xx_sharpsl.c:206:5: warning: no previous prototype for function 'pcmcia_collie_init' [-Wmissing-prototypes]
     206 | int pcmcia_collie_init(struct device *dev)
         |     ^
   drivers/pcmcia/pxa2xx_sharpsl.c:206:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     206 | int pcmcia_collie_init(struct device *dev)
         | ^
         | static 
   1 warning generated.
--
>> drivers/video/fbdev/sa1100fb.c:1219:12: warning: no previous prototype for function 'sa1100fb_init' [-Wmissing-prototypes]
    1219 | int __init sa1100fb_init(void)
         |            ^
   drivers/video/fbdev/sa1100fb.c:1219:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1219 | int __init sa1100fb_init(void)
         | ^
         | static 
   1 warning generated.


vim +/sa11x0_pm_init +122 arch/arm/mach-sa1100/pm.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  121  
7fea1ba58e61c1 Shawn Guo      2012-04-26 @122  int __init sa11x0_pm_init(void)

:::::: The code at line 122 was first introduced by commit
:::::: 7fea1ba58e61c17fb59dfc50c408945f307addc6 ARM: sa1100: use machine specific hook for late init

:::::: TO: Shawn Guo <shawn.guo@linaro.org>
:::::: CC: Shawn Guo <shawn.guo@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
