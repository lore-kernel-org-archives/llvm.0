Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15E92F33;
	Fri,  7 Apr 2023 11:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680865667; x=1712401667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KVCXfhw1zDj7376xpqJwLkfww4Vdi8YGdqQSaX7hiGc=;
  b=eL/s54j2Csfq64o+EJ0zNJ6lkk4ZDfQKCs+1EzKsTAqTZei7MjWWnS7t
   kyyVsfQiZ0GHxTpd28cilociY2GomzcdxoHelC3nAq+LF81hDF85KOuSm
   Hrbf5FEnXh041XzXwlo5dHTNQ+1QN9n2GeIYK0+SLt0uHbMQdx3gMEmmD
   rNoykSXpJW5rLUmVyNfGGktdybSsjH5rlVPmfstsDGG5nhhoaUZFKatuN
   U18Qk1rgN5W+F1W6LanXIHCHLyy+1rCsAWoRBJP82oQfe/YMs0lfkVOwq
   lNelVipLZ/k8hMAt1/cJPgTZV1V43Ux1H41kzXwXetm3cnmvEEKutcJ9w
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341721025"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="341721025"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 04:07:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="756686509"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="756686509"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Apr 2023 04:07:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkjwT-000SQ2-2k;
	Fri, 07 Apr 2023 11:07:41 +0000
Date: Fri, 7 Apr 2023 19:07:33 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:hotplug 32/43] arch/riscv/kernel/cpu-hotplug.c:75:2:
 error: call to undeclared function 'cpuhp_ap_report_death'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202304071802.QnfMJdbf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git hotplug
head:   ddd73f1b6ab5c834f6d98521dcedd9ddd56a9659
commit: 71622e99f16217b2be66e87b63b7521c8ec697af [32/43] riscv: Switch to hotplug core state synchronization
config: riscv-randconfig-r012-20230406 (https://download.01.org/0day-ci/archive/20230407/202304071802.QnfMJdbf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=71622e99f16217b2be66e87b63b7521c8ec697af
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel hotplug
        git checkout 71622e99f16217b2be66e87b63b7521c8ec697af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304071802.QnfMJdbf-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/cpu-hotplug.c:55:6: error: redefinition of 'arch_cpuhp_cleanup_dead_cpu'
   void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
        ^
   include/linux/cpuhotplug.h:531:20: note: previous definition is here
   static inline void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu) { }
                      ^
>> arch/riscv/kernel/cpu-hotplug.c:75:2: error: call to undeclared function 'cpuhp_ap_report_death'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           cpuhp_ap_report_death();
           ^
   arch/riscv/kernel/cpu-hotplug.c:75:2: note: did you mean 'cpuhp_ap_report_dead'?
   include/linux/cpuhotplug.h:530:20: note: 'cpuhp_ap_report_dead' declared here
   static inline void cpuhp_ap_report_dead(void) { }
                      ^
   2 errors generated.


vim +/cpuhp_ap_report_death +75 arch/riscv/kernel/cpu-hotplug.c

    67	
    68	/*
    69	 * Called from the idle thread for the CPU which has been shutdown.
    70	 */
    71	void arch_cpu_idle_dead(void)
    72	{
    73		idle_task_exit();
    74	
  > 75		cpuhp_ap_report_death();

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
