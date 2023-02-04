Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5AE1108;
	Sat,  4 Feb 2023 06:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675493017; x=1707029017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b4/7gB7Wmk+9qvfpFZWBmDnmJxAoMkk6R6HSDfyyS3Q=;
  b=BoFNqjPOHYsE+Y2AJGS17vn87RZFylIdINqLyLQR+26xtK/aJUq5iXZ1
   t5V4K+wVXrTnL03CV+oXA5lfcXgfeEn69kV554ecqHnkWL19tqjogl3kk
   ALCYEJVYTiVqdaFo3Izyb8wxgIoADLMqUb3fcZ9mdiB4o/tgD2jRCemJC
   VUZ45xjZKVV5ezTRq4qX5JOjxiASrnRhxqhg6N3+l+wdnVAl2M2GNlrHD
   arnBjUVLaW6CL0shgskeV70KvBvFES3owRO0428pqj4aaiJCX5f+YG9tQ
   HRXQoIl/BgKsm2FFtKxXEpzWxLCZqMDQO+ZA+skbYNsz9d3Uc01pAW89R
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="393517072"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="393517072"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 22:43:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729490045"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="729490045"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Feb 2023 22:43:35 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOCGs-00016f-2d;
	Sat, 04 Feb 2023 06:43:34 +0000
Date: Sat, 4 Feb 2023 14:42:41 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:parallel-6.2-rc6 13/15] arch/x86/kernel/smpboot.c:217:25:
 warning: mixing declarations and code is incompatible with standards before
 C99
Message-ID: <202302041423.jV11yeKa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux parallel-6.2-rc6
head:   459d1c46dbd121ad460159a0fe313dd07e3951da
commit: b5cc1bb6bc7d1190dac971407a9c2b1f7fc387f1 [13/15] parallel part 2
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20230204/202302041423.jV11yeKa-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add dwmw2 git://git.infradead.org/users/dwmw2/linux
        git fetch --no-tags dwmw2 parallel-6.2-rc6
        git checkout b5cc1bb6bc7d1190dac971407a9c2b1f7fc387f1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/smpboot.c:217:25: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           static arch_spinlock_t cpuhp_lock = __ARCH_SPIN_LOCK_UNLOCKED;
                                  ^
   1 warning generated.


vim +217 arch/x86/kernel/smpboot.c

   159	
   160	/*
   161	 * Report back to the Boot Processor during boot time or to the caller processor
   162	 * during CPU online.
   163	 */
   164	static void smp_callin(void)
   165	{
   166		int cpuid;
   167	
   168		/*
   169		 * If waken up by an INIT in an 82489DX configuration
   170		 * cpu_callout_mask guarantees we don't get here before
   171		 * an INIT_deassert IPI reaches our local APIC, so it is
   172		 * now safe to touch our local APIC.
   173		 */
   174		cpuid = smp_processor_id();
   175	
   176		/*
   177		 * the boot CPU has finished the init stage and is spinning
   178		 * on callin_map until we finish. We are free to set up this
   179		 * CPU, first the APIC. (this is probably redundant on most
   180		 * boards)
   181		 */
   182		apic_ap_setup();
   183	
   184		/*
   185		 * Save our processor parameters and update topology.
   186		 * Note: this information is needed for clock calibration.
   187		 * The topology information must be up to date before
   188		 * calibrate_delay() and notify_cpu_starting().
   189		 */
   190		smp_store_cpu_info(cpuid, false);
   191	
   192		ap_init_aperfmperf();
   193	
   194		/*
   195		 * Get our bogomips.
   196		 * Update loops_per_jiffy in cpu_data. Previous call to
   197		 * smp_store_cpu_info() stored a value that is close but not as
   198		 * accurate as the value just calculated.
   199		 */
   200		calibrate_delay();
   201		cpu_data(cpuid).loops_per_jiffy = loops_per_jiffy;
   202		pr_debug("Stack at about %p\n", &cpuid);
   203	
   204		wmb();
   205	
   206		/*
   207		 * Allow the master to continue.
   208		 */
   209		cpumask_set_cpu(cpuid, cpu_callin_mask);
   210		while (!cpumask_test_cpu(cpuid, cpu_finishup_mask))
   211			cpu_relax();
   212	
   213		/*
   214		 * This runs the AP through all the cpuhp states to its target
   215		 * state (CPUHP_ONLINE in the case of serial bringup).
   216		 */
 > 217		static arch_spinlock_t cpuhp_lock = __ARCH_SPIN_LOCK_UNLOCKED;
   218		arch_spin_lock(&cpuhp_lock);
   219		notify_cpu_starting(cpuid);
   220		arch_spin_unlock(&cpuhp_lock);
   221	}
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
