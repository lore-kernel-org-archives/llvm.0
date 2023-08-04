Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2651DA40;
	Fri,  4 Aug 2023 20:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691182669; x=1722718669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hgW2cdUcq8AVscGrrzqPjxFZDiUQeTpL7LvTX7Jnh1U=;
  b=X3wPWMNXXtE11cceCG9miGv99uJJMqe4axXXOr54oScybPkBICEjzQye
   biDGWuW8iu5i5qLzzmcR1J2y4n0NXj+3ohni4BQt3HtdWdD54/VgioQms
   ZMQ7aofAxs3JsECkKx6dazvfimkHCaLRZXxZ5bNxT9nyIlUvyufPg5IRY
   k3ISctpseI5LXYMV5EX1E2y3ABQVSjfj7F68mJjBVV780gcCzgCUsA2tt
   aYC1fG6SEcPmAXL5nCyxWIq5OoC0AHUt7R7Z0PGNhgPmM253jR5583r4+
   04zCi96t6o4Ky1JG+sExmwFBoVSWCWw76iwL01Wi/GdlMfn53THCbfMnB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="456624534"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="456624534"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 13:57:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="800204382"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="800204382"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Aug 2023 13:57:47 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS1rm-00036J-0S;
	Fri, 04 Aug 2023 20:57:46 +0000
Date: Sat, 5 Aug 2023 04:57:11 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topo-full 111/149]
 arch/x86/platform/ce4100/ce4100.c:142:36: error: use of undeclared
 identifier 'x86_dbt_parse_smp_config'; did you mean
 'x86_dtb_parse_smp_config'?
Message-ID: <202308050405.Kt1zDT7F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topo-full
head:   ef76f58d8b34b1c6af83139c7d7cbf2a53c50bf2
commit: 8b2fbe51e062307e51980e59fa685da41cfedb32 [111/149] x86/platform/ce4100: Prepare for separate mpparse callbacks
config: i386-randconfig-i014-20230801 (https://download.01.org/0day-ci/archive/20230805/202308050405.Kt1zDT7F-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050405.Kt1zDT7F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050405.Kt1zDT7F-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/platform/ce4100/ce4100.c:142:36: error: use of undeclared identifier 'x86_dbt_parse_smp_config'; did you mean 'x86_dtb_parse_smp_config'?
           x86_init.mpparse.parse_smp_cfg          = x86_dbt_parse_smp_config;
                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
                                                     x86_dtb_parse_smp_config
   arch/x86/include/asm/prom.h:26:6: note: 'x86_dtb_parse_smp_config' declared here
   void x86_dtb_parse_smp_config(void);
        ^
   1 error generated.


vim +142 arch/x86/platform/ce4100/ce4100.c

   131	
   132	/*
   133	 * CE4100 specific x86_init function overrides and early setup
   134	 * calls.
   135	 */
   136	void __init x86_ce4100_early_setup(void)
   137	{
   138		x86_init.oem.arch_setup			= sdv_arch_setup;
   139		x86_init.resources.probe_roms		= x86_init_noop;
   140		x86_init.mpparse.find_mptable		= x86_init_noop;
   141		x86_init.mpparse.early_parse_smp_cfg	= x86_init_noop;
 > 142		x86_init.mpparse.parse_smp_cfg		= x86_dbt_parse_smp_config;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
