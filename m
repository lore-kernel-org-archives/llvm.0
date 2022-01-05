Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19272C9D
	for <llvm@lists.linux.dev>; Wed,  5 Jan 2022 08:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641372692; x=1672908692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4GB6rsCxcMyvreo+aau3rw2RYLpWk7Xrh9vvKs1x03w=;
  b=d2mJCNI+QSGn1Apk57YHKEuN/sueLpNw9o44KT1qvetnyWX9ZLqnP6Za
   9D/U1GZPcXyD7greY7TCF0V2/eUJ1iAq+2MQl+8gBZ+pWpqueb9P+vjqq
   vOSW6Ky4GOYouIMQDwTkIum6wSkyW5Xv1+kOA8SUjxCijap+gWmbtL1JO
   /CVh85nc6AQVA2Q7Udk72IRQKui6dq4oeVwkJ9Ozl0ivsjSKFEuauP/Ld
   8Zxx0ySxkaZuhNaRT61teKmOA9nBfatptbOBXqUjUUctbVUSSwxEtnZTH
   RJ01i1xPS0P/rPt4GoHosKwEUOFa8DgYlk6cagKV2mSYzTSAW+whdsWth
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242198489"
X-IronPort-AV: E=Sophos;i="5.88,263,1635231600"; 
   d="scan'208";a="242198489"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 00:51:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,263,1635231600"; 
   d="scan'208";a="470472751"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 Jan 2022 00:51:30 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5214-000GR3-8G; Wed, 05 Jan 2022 08:51:30 +0000
Date: Wed, 5 Jan 2022 16:51:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [arm-de:upstream/remove_feec_energy_margin_rework 1/11]
 drivers/powercap/dtpm_cpu.c:85:49: error: expected ')'
Message-ID: <202201051643.2xpTOg7E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.gitlab.arm.com/linux-arm/linux-de.git upstream/remove_feec_energy_margin_rework
head:   8a0bdb78ce1cbb8e5e6768965874226b92b07b0e
commit: 150e753e861285e82e9d7c593f1f26075c34e124 [1/11] sched, drivers: Remove max param from effective_cpu_util()/sched_cpu_util()
config: i386-randconfig-a012-20220105 (https://download.01.org/0day-ci/archive/20220105/202201051643.2xpTOg7E-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d5b6e30ed3acad794dd0aec400e617daffc6cc3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add arm-de https://git.gitlab.arm.com/linux-arm/linux-de.git
        git fetch --no-tags arm-de upstream/remove_feec_energy_margin_rework
        git checkout 150e753e861285e82e9d7c593f1f26075c34e124
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/powercap/dtpm_cpu.c:85:49: error: expected ')'
           return (power * ((sum_util << 10) / max) >> 10 : 0;
                                                          ^
   drivers/powercap/dtpm_cpu.c:85:9: note: to match this '('
           return (power * ((sum_util << 10) / max) >> 10 : 0;
                  ^
   1 error generated.


vim +85 drivers/powercap/dtpm_cpu.c

    70	
    71	static u64 scale_pd_power_uw(struct cpumask *pd_mask, u64 power)
    72	{
    73		unsigned long max, sum_util = 0;
    74		int cpu;
    75	
    76		/*
    77		 * The capacity is the same for all CPUs belonging to
    78		 * the same perf domain.
    79		 */
    80		max = arch_scale_cpu_capacity(cpumask_first(pd_mask));
    81	
    82		for_each_cpu_and(cpu, pd_mask, cpu_online_mask)
    83			sum_util += sched_cpu_util(cpu);
    84	
  > 85		return (power * ((sum_util << 10) / max) >> 10 : 0;
    86	}
    87	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
