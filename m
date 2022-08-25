Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9107B
	for <llvm@lists.linux.dev>; Thu, 25 Aug 2022 04:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661401821; x=1692937821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kxq4UxK/+sKN/MKITgtaEMVYFGyFYzE9EZkADoyRsCo=;
  b=gqKbpN68UNQx6kPRUxvB1wnx8aUkGit3cdpEh/5EBKH5PfMCaLG4RwEa
   FIYTA4HZkcw0wHnFZnoHBbLNOng6UPUlcmbPH+l6adDW1eRp/yjLTmVMc
   W/acI3koiA9AKf5WofSkoPj6XpKT7G3ez0uq2R1lUXjCutnfZH3iZdVGV
   +73Qfp4p/kB5UD8F5Y0r7iJKPkmbnWAzQWHYNRREMxJrwpdnmSk3pEBCh
   OTlSan3HhHRtQD1ZoSPas5XLyXV1LOQiF0fVDKxKOekmuDVXyZRephWbG
   +KkcwyCfbHMFMHbcEIQV6O7NLpnRDU1Q1eUDNRbIamNBNt6WvVfHQsgyP
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10449"; a="273894717"
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200"; 
   d="scan'208";a="273894717"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2022 21:30:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200"; 
   d="scan'208";a="610023194"
Received: from lkp-server02.sh.intel.com (HELO 34e741d32628) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 24 Aug 2022 21:30:18 -0700
Received: from kbuild by 34e741d32628 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oR4VV-0001i9-27;
	Thu, 25 Aug 2022 04:30:17 +0000
Date: Thu, 25 Aug 2022 12:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [ammarfaizi2-block:akpm/mm/mm-nonmm-unstable 50/50]
 kernel/smpboot.c:435:6: warning: variable 'oldstate' is used uninitialized
 whenever 'if' condition is true
Message-ID: <202208251224.teVMa7Yy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Uros,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-nonmm-unstable
head:   2d1e07c7534c14e56ac3818fa24e7c1643a9b1dc
commit: 2d1e07c7534c14e56ac3818fa24e7c1643a9b1dc [50/50] smpboot: use atomic_try_cmpxchg in cpu_wait_death and cpu_report_death
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20220825/202208251224.teVMa7Yy-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/2d1e07c7534c14e56ac3818fa24e7c1643a9b1dc
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block akpm/mm/mm-nonmm-unstable
        git checkout 2d1e07c7534c14e56ac3818fa24e7c1643a9b1dc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/smpboot.c:435:6: warning: variable 'oldstate' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (atomic_read(&per_cpu(cpu_hotplug_state, cpu)) == CPU_DEAD)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/smpboot.c:449:6: note: uninitialized use occurs here
           if (oldstate == CPU_DEAD) {
               ^~~~~~~~
   kernel/smpboot.c:435:2: note: remove the 'if' if its condition is always false
           if (atomic_read(&per_cpu(cpu_hotplug_state, cpu)) == CPU_DEAD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/smpboot.c:428:14: note: initialize the variable 'oldstate' to silence this warning
           int oldstate;
                       ^
                        = 0
   1 warning generated.


vim +435 kernel/smpboot.c

8038dad7e88858 Paul E. McKenney 2015-02-25  421  
8038dad7e88858 Paul E. McKenney 2015-02-25  422  /*
8038dad7e88858 Paul E. McKenney 2015-02-25  423   * Wait for the specified CPU to exit the idle loop and die.
8038dad7e88858 Paul E. McKenney 2015-02-25  424   */
8038dad7e88858 Paul E. McKenney 2015-02-25  425  bool cpu_wait_death(unsigned int cpu, int seconds)
8038dad7e88858 Paul E. McKenney 2015-02-25  426  {
8038dad7e88858 Paul E. McKenney 2015-02-25  427  	int jf_left = seconds * HZ;
8038dad7e88858 Paul E. McKenney 2015-02-25  428  	int oldstate;
8038dad7e88858 Paul E. McKenney 2015-02-25  429  	bool ret = true;
8038dad7e88858 Paul E. McKenney 2015-02-25  430  	int sleep_jf = 1;
8038dad7e88858 Paul E. McKenney 2015-02-25  431  
8038dad7e88858 Paul E. McKenney 2015-02-25  432  	might_sleep();
8038dad7e88858 Paul E. McKenney 2015-02-25  433  
8038dad7e88858 Paul E. McKenney 2015-02-25  434  	/* The outgoing CPU will normally get done quite quickly. */
8038dad7e88858 Paul E. McKenney 2015-02-25 @435  	if (atomic_read(&per_cpu(cpu_hotplug_state, cpu)) == CPU_DEAD)
8038dad7e88858 Paul E. McKenney 2015-02-25  436  		goto update_state;
8038dad7e88858 Paul E. McKenney 2015-02-25  437  	udelay(5);
8038dad7e88858 Paul E. McKenney 2015-02-25  438  
8038dad7e88858 Paul E. McKenney 2015-02-25  439  	/* But if the outgoing CPU dawdles, wait increasingly long times. */
8038dad7e88858 Paul E. McKenney 2015-02-25  440  	while (atomic_read(&per_cpu(cpu_hotplug_state, cpu)) != CPU_DEAD) {
8038dad7e88858 Paul E. McKenney 2015-02-25  441  		schedule_timeout_uninterruptible(sleep_jf);
8038dad7e88858 Paul E. McKenney 2015-02-25  442  		jf_left -= sleep_jf;
8038dad7e88858 Paul E. McKenney 2015-02-25  443  		if (jf_left <= 0)
8038dad7e88858 Paul E. McKenney 2015-02-25  444  			break;
8038dad7e88858 Paul E. McKenney 2015-02-25  445  		sleep_jf = DIV_ROUND_UP(sleep_jf * 11, 10);
8038dad7e88858 Paul E. McKenney 2015-02-25  446  	}
8038dad7e88858 Paul E. McKenney 2015-02-25  447  	oldstate = atomic_read(&per_cpu(cpu_hotplug_state, cpu));
2d1e07c7534c14 Uros Bizjak      2022-08-23  448  update_state:
8038dad7e88858 Paul E. McKenney 2015-02-25  449  	if (oldstate == CPU_DEAD) {
8038dad7e88858 Paul E. McKenney 2015-02-25  450  		/* Outgoing CPU died normally, update state. */
8038dad7e88858 Paul E. McKenney 2015-02-25  451  		smp_mb(); /* atomic_read() before update. */
8038dad7e88858 Paul E. McKenney 2015-02-25  452  		atomic_set(&per_cpu(cpu_hotplug_state, cpu), CPU_POST_DEAD);
8038dad7e88858 Paul E. McKenney 2015-02-25  453  	} else {
8038dad7e88858 Paul E. McKenney 2015-02-25  454  		/* Outgoing CPU still hasn't died, set state accordingly. */
2d1e07c7534c14 Uros Bizjak      2022-08-23  455  		if (!atomic_try_cmpxchg(&per_cpu(cpu_hotplug_state, cpu),
2d1e07c7534c14 Uros Bizjak      2022-08-23  456  					&oldstate, CPU_BROKEN))
8038dad7e88858 Paul E. McKenney 2015-02-25  457  			goto update_state;
8038dad7e88858 Paul E. McKenney 2015-02-25  458  		ret = false;
8038dad7e88858 Paul E. McKenney 2015-02-25  459  	}
8038dad7e88858 Paul E. McKenney 2015-02-25  460  	return ret;
8038dad7e88858 Paul E. McKenney 2015-02-25  461  }
8038dad7e88858 Paul E. McKenney 2015-02-25  462  

:::::: The code at line 435 was first introduced by commit
:::::: 8038dad7e888581266c76df15d70ca457a3c5910 smpboot: Add common code for notification from dying CPU

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
