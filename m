Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCE36AA4;
	Fri, 14 Jul 2023 05:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689313285; x=1720849285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T6DXf4Emja3xKbEbY5Zh6FCuSVgeRt4SR1yKm8aGKXk=;
  b=V/Zrm8/vt3Mwcm+tb7QfdrKQGITaWVyLtOMQfA8vLC3cqbvTvm3ZTyNK
   2ySvMN7dtEOT1HD5s96TSYre6BdMwcNvnEEyAwqkw2S8IJIYsSVJMPosK
   PvG4x0o4geJsnAdi0UyThdy02vYW341RluBcy+Fc33RrLZpKf52Fb+DsV
   zN/sf5XCE7xF5XekmhkaK+mXjqgHb3ZCXasAnjl+KzYcxOn4BXcmGIVzo
   6YKH4pbcy5sStpCkpehA746qaX3qiA743xOCxvXE4FPKjzR1lYEDxyJ85
   gJGpKrxJyCjt0y01+63OFyFCQGCVuonsY02PHGdWrz0qZKDWis8B/fxnf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="429161395"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="429161395"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 22:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787719658"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="787719658"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Jul 2023 22:41:23 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKBYQ-0007DR-2a;
	Fri, 14 Jul 2023 05:41:22 +0000
Date: Fri, 14 Jul 2023 13:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 41/57]
 arch/x86/kernel/cpu/topology_common.c:160:2: error: use of undeclared
 identifier 'smp_num_siblings'
Message-ID: <202307141308.rK8u7fVY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   39d1f9d6ad3d4b9bf9c298db5685f22d8fe6e2c0
commit: cddc2e9c0152480ee1041b2806b1301b0157d109 [41/57] x86/cpu: Provide cpu_init/parse_topology()
config: i386-randconfig-i004-20230713 (https://download.01.org/0day-ci/archive/20230714/202307141308.rK8u7fVY-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141308.rK8u7fVY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141308.rK8u7fVY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cpu/topology_common.c:160:2: error: use of undeclared identifier 'smp_num_siblings'
           smp_num_siblings = x86_topo_system.dom_size[TOPO_SMT_DOMAIN];
           ^
   1 error generated.


vim +/smp_num_siblings +160 arch/x86/kernel/cpu/topology_common.c

   130	
   131	void __init cpu_init_topology(struct cpuinfo_x86 *c)
   132	{
   133		struct topo_scan tscan = { .c = c, };
   134		unsigned int dom, sft;
   135	
   136		parse_topology(&tscan, true);
   137	
   138		if (!topo_is_converted(c))
   139			return;
   140	
   141		/* Copy the shift values and calculate the unit sizes. */
   142		memcpy(x86_topo_system.dom_shifts, tscan.dom_shifts, sizeof(x86_topo_system.dom_shifts));
   143	
   144		dom = TOPO_SMT_DOMAIN;
   145		x86_topo_system.dom_size[dom] = 1U << x86_topo_system.dom_shifts[dom];
   146	
   147		for (dom++; dom < TOPO_MAX_DOMAIN; dom++) {
   148			sft = x86_topo_system.dom_shifts[dom] - x86_topo_system.dom_shifts[dom - 1];
   149			x86_topo_system.dom_size[dom] = 1U << sft;
   150		}
   151	
   152		topo_set_ids(&tscan);
   153		topo_set_max_cores(&tscan);
   154	
   155		/*
   156		 * This is deliberately using the domain size and not the real one,
   157		 * as this might be a hybrid system. If the boot CPU does not have
   158		 * SMT this would end up with one sibling.
   159		 */
 > 160		smp_num_siblings = x86_topo_system.dom_size[TOPO_SMT_DOMAIN];

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
