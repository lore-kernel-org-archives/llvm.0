Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93961EA1;
	Tue, 25 Jul 2023 02:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690252922; x=1721788922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5cQaZ4sUJFJaVpTbKvhhPLrYE4v8ekS1HElqu21+t54=;
  b=f6Eg9pX9rteGlT779/7gTyz69VSLT1mpHxpDxfXxsI0IfjVsnTFAJjoG
   BFvZXb0MEEaKYQcXk9NVIczRJ122OXszk13quX5LvTAJThD1X2M/rCURR
   SxsP7i+0+k6pHjiJWEuBWjJCw/TeEC4lPxFIJz0DjkGlKM1zQmb5X8PgQ
   S7bUM9hgxWdBE9nxybWxtWvD3WnkeKbwDOqEcPoaYeAXg4E3mzQbkD76W
   WldEJQjnEq2//h2iPbYXGdDbG96ZOyd6+dE7O2Vox0r3nKtogGwOT73Db
   jwe/zLTkIQWwrlCvFjw9avwiN3/sxV+u9J5SgrJ01HYS9OzekFqt1f3x8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="352499573"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="352499573"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 19:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="761045193"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="761045193"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 24 Jul 2023 19:41:56 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO7zn-000AEa-28;
	Tue, 25 Jul 2023 02:41:55 +0000
Date: Tue, 25 Jul 2023 10:41:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ulfh-pm:genpd_create_dir 9/18]
 drivers/genpd/renesas/rmobile-sysc.c:193:22: warning: cast to smaller
 integer type 'enum pd_types' from 'const void *'
Message-ID: <202307251015.dZ7jmRPA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git genpd_create_dir
head:   b43f11e5b453a9c48159d7121c88d79d81901276
commit: 86341a84495cb4201948053fecb71f6bda2baaa6 [9/18] soc: renesas: Move power-domain drivers to the genpd dir
config: x86_64-buildonly-randconfig-r001-20230723 (https://download.01.org/0day-ci/archive/20230725/202307251015.dZ7jmRPA-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251015.dZ7jmRPA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251015.dZ7jmRPA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/genpd/renesas/rmobile-sysc.c:193:22: warning: cast to smaller integer type 'enum pd_types' from 'const void *' [-Wvoid-pointer-to-enum-cast]
                   add_special_pd(np, (enum pd_types)id->data);
                                      ^~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +193 drivers/genpd/renesas/rmobile-sysc.c

2173fc7cb681c38 arch/arm/mach-shmobile/pm-rmobile.c Geert Uytterhoeven 2014-12-03  177  
60e264356230014 arch/arm/mach-shmobile/pm-rmobile.c Geert Uytterhoeven 2015-01-14  178  static void __init get_special_pds(void)
60e264356230014 arch/arm/mach-shmobile/pm-rmobile.c Geert Uytterhoeven 2015-01-14  179  {
60e264356230014 arch/arm/mach-shmobile/pm-rmobile.c Geert Uytterhoeven 2015-01-14  180  	struct device_node *np;
1632ff162f305f3 arch/arm/mach-shmobile/pm-rmobile.c Geert Uytterhoeven 2015-01-14  181  	const struct of_device_id *id;
60e264356230014 arch/arm/mach-shmobile/pm-rmobile.c Geert Uytterhoeven 2015-01-14  182  
60e264356230014 arch/arm/mach-shmobile/pm-rmobile.c Geert Uytterhoeven 2015-01-14  183  	/* PM domains containing CPUs */
5af5d40c4015813 arch/arm/mach-shmobile/pm-rmobile.c Rob Herring        2018-08-27  184  	for_each_of_cpu_node(np)
60e264356230014 arch/arm/mach-shmobile/pm-rmobile.c Geert Uytterhoeven 2015-01-14  185  		add_special_pd(np, PD_CPU);
60e264356230014 arch/arm/mach-shmobile/pm-rmobile.c Geert Uytterhoeven 2015-01-14  186  
2173fc7cb681c38 arch/arm/mach-shmobile/pm-rmobile.c Geert Uytterhoeven 2014-12-03  187  	/* PM domain containing console */
2173fc7cb681c38 arch/arm/mach-shmobile/pm-rmobile.c Geert Uytterhoeven 2014-12-03  188  	if (of_stdout)
60e264356230014 arch/arm/mach-shmobile/pm-rmobile.c Geert Uytterhoeven 2015-01-14  189  		add_special_pd(of_stdout, PD_CONSOLE);
2173fc7cb681c38 arch/arm/mach-shmobile/pm-rmobile.c Geert Uytterhoeven 2014-12-03  190  
1632ff162f305f3 arch/arm/mach-shmobile/pm-rmobile.c Geert Uytterhoeven 2015-01-14  191  	/* PM domains containing other special devices */
1632ff162f305f3 arch/arm/mach-shmobile/pm-rmobile.c Geert Uytterhoeven 2015-01-14  192  	for_each_matching_node_and_match(np, special_ids, &id)
1632ff162f305f3 arch/arm/mach-shmobile/pm-rmobile.c Geert Uytterhoeven 2015-01-14 @193  		add_special_pd(np, (enum pd_types)id->data);
2173fc7cb681c38 arch/arm/mach-shmobile/pm-rmobile.c Geert Uytterhoeven 2014-12-03  194  }
2173fc7cb681c38 arch/arm/mach-shmobile/pm-rmobile.c Geert Uytterhoeven 2014-12-03  195  

:::::: The code at line 193 was first introduced by commit
:::::: 1632ff162f305f38667632c465e4bfaab8ef87a2 ARM: shmobile: R-Mobile: Special-case PM domains with memory-controllers

:::::: TO: Geert Uytterhoeven <geert+renesas@glider.be>
:::::: CC: Simon Horman <horms+renesas@verge.net.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
