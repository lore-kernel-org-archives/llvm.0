Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33A2173
	for <llvm@lists.linux.dev>; Fri,  7 Jan 2022 07:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641539394; x=1673075394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PyHCT8ZFTZQ143GrjnW0x82nS8khVUS+/ejprLVyYrY=;
  b=Lh7Q9Fl2Oef1a4Hq362XgL81fWirw5nU09CS65/k9AEH7BfpuSpXNBtg
   yowLr5h7q+17Qo1hSME+1U3vCVVDIplFYTI/LTZOkkqQeZXcbQ7mYMtBL
   8o03NE4lJgJKSOnIUjMGMcPE8DTcL26PwOdBbNuAlPP2j1CSpNOL32LLN
   H3QlSmyfe13jo02F3GpEHL3Y568qN4hFb6uq4eF1OOIinaIs9MzKzkDGV
   VGA3n1dvk7tRftiq4wRMZbs8JiVvJNxHTy9wScfp6j1bXPcHHC9L7TWCE
   JCQbc22oKooGexx0lwUBe+rrih+tCjfI19kcqrA18AKZes/qvQnAVrtZR
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="303568030"
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; 
   d="scan'208";a="303568030"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2022 23:09:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; 
   d="scan'208";a="618611333"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Jan 2022 23:09:43 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5jNf-000IOA-72; Fri, 07 Jan 2022 07:09:43 +0000
Date: Fri, 7 Jan 2022 15:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev 51/53]
 kernel/time/tick-sched.c:1455:6: warning: no previous prototype for function
 'tick_setup_sched_timer_dump'
Message-ID: <202201071538.1zOsvPzw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev
head:   56b8a9dc5e8aa4d625a09ce87015016ae339d44d
commit: feba9f855e1f9231392df9e7c2ba94e2fe1bc822 [51/53] EXP timers: Debugging for last-resort jiffies update
config: i386-randconfig-r014-20220107 (https://download.01.org/0day-ci/archive/20220107/202201071538.1zOsvPzw-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167bfe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/feba9f855e1f9231392df9e7c2ba94e2fe1bc822
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev
        git checkout feba9f855e1f9231392df9e7c2ba94e2fe1bc822
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/ kernel/time/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/time/tick-sched.c:1455:6: warning: no previous prototype for function 'tick_setup_sched_timer_dump' [-Wmissing-prototypes]
   void tick_setup_sched_timer_dump(void)
        ^
   kernel/time/tick-sched.c:1455:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tick_setup_sched_timer_dump(void)
   ^
   static 
   1 warning generated.


vim +/tick_setup_sched_timer_dump +1455 kernel/time/tick-sched.c

  1454	
> 1455	void tick_setup_sched_timer_dump(void)
  1456	{
  1457		int cpu;
  1458		int j = jiffies;
  1459	
  1460		pr_alert("%s state", __func__);
  1461		for_each_possible_cpu(cpu)
  1462			pr_cont(" j/c %x/%d %c",
  1463				(int)(j - per_cpu(tick_setup_sched_timer_jiffies, cpu)) & 0xfff,
  1464				per_cpu(tick_setup_sched_timer_jiffies_count, cpu),
  1465				".H"[per_cpu(tick_setup_sched_timer_help_needed, cpu)]);
  1466		pr_cont("\n");
  1467	}
  1468	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
