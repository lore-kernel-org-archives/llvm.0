Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DF71FA9;
	Tue, 20 Jun 2023 05:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687240559; x=1718776559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wTpmMXRtxg1A3TQTPk0QjDxNjsJSOtuUCpqRsXXHgcA=;
  b=D022uSyQYxi0eyLt9SZ1bPL/1f4SnTRPH7edYaAqGyT84Yh3SnIZo0//
   9MyPu0rIIbXH2Jn8kNJE1YhT9AwLEqeIOQ5Ak7nJwnJ0x0zfuwkdG/vZ7
   kOP1wmrynpaktstTIFOvgoROKSigl40INt3XpkPOHaC8MgADbvZzKQxLD
   vfui+yM2+INmMVm8yNvdEAwgBkFl+4uCrCBhibUOfbdjrmYxILiGlv5Wi
   Xt0ic7OY8EnIKF+OWtcAfRvUh+5/efMDo3RAffen1gU0S1wY0rBtpd9l4
   3XY5VeIa+7TAFKRjOX8Z6LxolrLaVfkPjb1K1FFJ4/c913xiSp/2pcHym
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="446150482"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="446150482"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 22:55:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="888127426"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="888127426"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Jun 2023 22:55:56 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBULL-0005Ym-2x;
	Tue, 20 Jun 2023 05:55:55 +0000
Date: Tue, 20 Jun 2023 13:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: arch/arm/mach-sa1100/assabet.c:746:13: warning: no previous
 prototype for function 'assabet_init_irq'
Message-ID: <202306201322.xTUPn7A1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nathan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   692b7dc87ca6d55ab254f8259e6f970171dc9d01
commit: 5eb6e280432ddc9b755193552f3a070da8d7455c ARM: 9289/1: Allow pre-ARMv5 builds with ld.lld 16.0.0 and newer
date:   5 months ago
config: arm-neponset_defconfig (https://download.01.org/0day-ci/archive/20230620/202306201322.xTUPn7A1-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201322.xTUPn7A1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306201322.xTUPn7A1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mach-sa1100/assabet.c:746:13: warning: no previous prototype for function 'assabet_init_irq' [-Wmissing-prototypes]
   void __init assabet_init_irq(void)
               ^
   arch/arm/mach-sa1100/assabet.c:746:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init assabet_init_irq(void)
   ^
   static 
   1 warning generated.
--
>> arch/arm/mach-sa1100/pm.c:122:12: warning: no previous prototype for function 'sa11x0_pm_init' [-Wmissing-prototypes]
   int __init sa11x0_pm_init(void)
              ^
   arch/arm/mach-sa1100/pm.c:122:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init sa11x0_pm_init(void)
   ^
   static 
   1 warning generated.
--
>> arch/arm/common/sa1111.c:699:1: warning: no previous prototype for function 'sa1111_configure_smc' [-Wmissing-prototypes]
   sa1111_configure_smc(struct sa1111 *sachip, int sdram, unsigned int drac,
   ^
   arch/arm/common/sa1111.c:698:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void
   ^
   static 
   1 warning generated.
--
   arch/arm/common/sa1111.c:802: warning: Function parameter or member 'me' not described in '__sa1111_probe'
   arch/arm/common/sa1111.c:802: warning: Function parameter or member 'mem' not described in '__sa1111_probe'
   arch/arm/common/sa1111.c:802: warning: Function parameter or member 'irq' not described in '__sa1111_probe'
>> arch/arm/common/sa1111.c:802: warning: expecting prototype for sa1111_probe(). Prototype was for __sa1111_probe() instead
--
>> drivers/gpio/gpio-sa1100.c:309:13: warning: no previous prototype for function 'sa1100_init_gpio' [-Wmissing-prototypes]
   void __init sa1100_init_gpio(void)
               ^
   drivers/gpio/gpio-sa1100.c:309:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init sa1100_init_gpio(void)
   ^
   static 
   1 warning generated.
--
>> drivers/video/fbdev/sa1100fb.c:1219:12: warning: no previous prototype for function 'sa1100fb_init' [-Wmissing-prototypes]
   int __init sa1100fb_init(void)
              ^
   drivers/video/fbdev/sa1100fb.c:1219:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init sa1100fb_init(void)
   ^
   static 
   1 warning generated.


vim +/assabet_init_irq +746 arch/arm/mach-sa1100/assabet.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  745  
b955153bfa68d7 Russell King   2016-08-31 @746  void __init assabet_init_irq(void)
b955153bfa68d7 Russell King   2016-08-31  747  {
b955153bfa68d7 Russell King   2016-08-31  748  	u32 def_val;
b955153bfa68d7 Russell King   2016-08-31  749  
b955153bfa68d7 Russell King   2016-08-31  750  	sa1100_init_irq();
b955153bfa68d7 Russell King   2016-08-31  751  
b955153bfa68d7 Russell King   2016-08-31  752  	if (machine_has_neponset())
b955153bfa68d7 Russell King   2016-08-31  753  		def_val = ASSABET_BCR_DB1111;
b955153bfa68d7 Russell King   2016-08-31  754  	else
b955153bfa68d7 Russell King   2016-08-31  755  		def_val = ASSABET_BCR_DB1110;
b955153bfa68d7 Russell King   2016-08-31  756  
b955153bfa68d7 Russell King   2016-08-31  757  	/*
b955153bfa68d7 Russell King   2016-08-31  758  	 * Angel sets this, but other bootloaders may not.
b955153bfa68d7 Russell King   2016-08-31  759  	 *
b955153bfa68d7 Russell King   2016-08-31  760  	 * This must precede any driver calls to BCR_set() or BCR_clear().
b955153bfa68d7 Russell King   2016-08-31  761  	 */
20a451f8db4a81 Linus Walleij  2021-07-20  762  	assabet_init_gpio((void *)&ASSABET_BCR, def_val);
b955153bfa68d7 Russell King   2016-08-31  763  }
b955153bfa68d7 Russell King   2016-08-31  764  

:::::: The code at line 746 was first introduced by commit
:::::: b955153bfa68d7a9fa2be40bb606cf9578b66511 ARM: sa1100/assabet: add BCR/BSR GPIO driver

:::::: TO: Russell King <rmk+kernel@armlinux.org.uk>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
