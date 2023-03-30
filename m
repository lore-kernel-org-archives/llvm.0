Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF84BD301;
	Thu, 30 Mar 2023 22:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680217105; x=1711753105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GgyxPetBIVo4pNOsM/GM2WPOBByZjXnSfgPF33BAwMs=;
  b=M4+3lW7qhjt/wVJLFCdS5qQeIsfyNNP14T1tGTWPdkvl/xu8/tyZibQ8
   GzwiqmbesTkpqdz4Cvxlni0LQMhZl7WCcPCDaNxYAM/o/tXxtlKyIZft1
   if1XKm/kJRsC4CJ4W1P9uuj2C5bL+Gh1CoX0EKrdwQB/0Ua3E2n3VSO/1
   gPWcQVU3P9L6R6rx9fk0OLAQ2M8iltwEX6qI02QCFgySLQgkh6wFUplZa
   D3YToyhTedIPghVFEJSBUfGLqgREuow5uc6kNLcW3N008KIA6QDI6eiDi
   rE31+YEPKN7cQnzIJtWIWweM7KkKJ1Y0iKdAjx0dLlM5+rhXLuSnRzLjv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321691062"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="321691062"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 15:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="754192672"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="754192672"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2023 15:58:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi1Di-000LHs-0y;
	Thu, 30 Mar 2023 22:58:14 +0000
Date: Fri, 31 Mar 2023 06:57:15 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>,
	Brian Gerst <brgerst@gmail.com>,
	Usama Arif <usama.arif@bytedance.com>
Subject: [dwmw2:tglx-parallel-2 24/25] kernel/cpu.c:641:3: error: implicit
 declaration of function 'cpu_up' is invalid in C99
Message-ID: <202303310647.BrY9xHzl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux tglx-parallel-2
head:   553f41a50ed7c3097c465e96d5c41522a1fae23e
commit: 0a1bcd102db41f6364d0aa00960e2fb908fd3762 [24/25] x86/smpboot: Support parallel startup of secondary CPUs
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230331/202303310647.BrY9xHzl-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add dwmw2 git://git.infradead.org/users/dwmw2/linux
        git fetch --no-tags dwmw2 tglx-parallel-2
        git checkout 0a1bcd102db41f6364d0aa00960e2fb908fd3762
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310647.BrY9xHzl-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cpu.c:436:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret = 0;
               ^
>> kernel/cpu.c:641:3: error: implicit declaration of function 'cpu_up' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   cpu_up(cpu, CPUHP_BP_KICK_AP);
                   ^
   kernel/cpu.c:641:3: note: did you mean '__cpu_up'?
   include/linux/smp.h:139:12: note: '__cpu_up' declared here
   extern int __cpu_up(unsigned int cpunum, struct task_struct *tidle);
              ^
   kernel/cpu.c:1706:12: error: static declaration of 'cpu_up' follows non-static declaration
   static int cpu_up(unsigned int cpu, enum cpuhp_state target)
              ^
   kernel/cpu.c:641:3: note: previous implicit declaration is here
                   cpu_up(cpu, CPUHP_BP_KICK_AP);
                   ^
   kernel/cpu.c:1797:30: error: too many arguments to function call, expected 0, have 1
           cpuhp_bringup_cpus_parallel(setup_max_cpus);
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^~~~~~~~~~~~~~
   kernel/cpu.c:631:13: note: 'cpuhp_bringup_cpus_parallel' declared here
   static void cpuhp_bringup_cpus_parallel(void)
               ^
   1 warning and 3 errors generated.


vim +/cpu_up +641 kernel/cpu.c

c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  620  
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  621  /*
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  622   * On architectures which have enabled parallel bringup this invokes all BP
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  623   * prepare states for each of the to be onlined APs. The last state sends
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  624   * the startup IPI to the APs. The APs proceed through the low level
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  625   * bringup code in parallel and then wait for the control CPU to release
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  626   * them one by one for the final onlining procedure.
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  627   *
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  628   * This avoids waiting for each AP to respond to the startup IPI in
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  629   * CPUHP_BRINGUP_CPU.
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  630   */
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  631  static void cpuhp_bringup_cpus_parallel(void)
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  632  {
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  633  	unsigned int cpu, n = 1;
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  634  
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  635  	if (!__cpuhp_parallel_bringup)
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  636  		return;
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  637  
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  638  	for_each_present_cpu(cpu) {
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  639  		if (n++ >= setup_max_cpus)
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  640  			break;
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30 @641  		cpu_up(cpu, CPUHP_BP_KICK_AP);
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  642  	}
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  643  }
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  644  

:::::: The code at line 641 was first introduced by commit
:::::: c8f7cb6d0895e48171b3fc33201e9244ac0e5970 cpu/hotplug: Allow "parallel" bringup up to CPUHP_BP_KICK_AP_STATE

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: David Woodhouse <dwmw@amazon.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
