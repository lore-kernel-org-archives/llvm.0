Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05377173
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 03:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641611734; x=1673147734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sA1uQT+E+/oT1FwTrF/qRTED0E8Q8lKdTIYCP54Z5a4=;
  b=m01z/tWwgXErUUZZaGAaG6vilxyzo3Qwi5DPB6G7xNWgUDIfYeGkMSMu
   dqzqO9NK1+S+7Uq4HJ5geh8vlBTc/+jHnEVTZxKODCoD/tXX6whU2b/SE
   Al9h19JOaZxVQBcxHkwnCaZGFQDhCDeUD6Xduk0aAIDM343NLA3K7iOMy
   6+6m6ZI+qIL9av/xRZqlx9oBXkonQzjxSU0gKurvzBXkevAsbd3OtTB84
   B9HTVyd3Z4/2j7B4mBxoqfqnMNYANkbUlVJ1zaorq9Qi4SpY6Wmpz+T30
   He2q2Sa0iJWGa1iaZ0LmZpcIbV0MuwWAG0aWx2O1caqd8zaqbah+GY3sk
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10220"; a="243177399"
X-IronPort-AV: E=Sophos;i="5.88,271,1635231600"; 
   d="scan'208";a="243177399"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2022 19:15:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,271,1635231600"; 
   d="scan'208";a="557459520"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Jan 2022 19:15:32 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n62CZ-0000D5-Gr; Sat, 08 Jan 2022 03:15:31 +0000
Date: Sat, 8 Jan 2022 11:14:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2022.01.04a 55/55] kernel/time/timer.c:1776:6:
 warning: no previous prototype for function 'tick_setup_sched_timer_dump'
Message-ID: <202201081127.geEljsMv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2022.01.04a
head:   64595d0dff992756e8c6d53c0e9f1e3e50c451f7
commit: 64595d0dff992756e8c6d53c0e9f1e3e50c451f7 [55/55] squash! EXP timers: Non-nohz_full last-resort jiffies update on IRQ entry
config: hexagon-randconfig-r011-20220108 (https://download.01.org/0day-ci/archive/20220108/202201081127.geEljsMv-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?id=64595d0dff992756e8c6d53c0e9f1e3e50c451f7
        git remote add paulmck-rcu https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
        git fetch --no-tags paulmck-rcu dev.2022.01.04a
        git checkout 64595d0dff992756e8c6d53c0e9f1e3e50c451f7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/time/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/time/timer.c:1776:6: warning: no previous prototype for function 'tick_setup_sched_timer_dump' [-Wmissing-prototypes]
   void tick_setup_sched_timer_dump(void)
        ^
   kernel/time/timer.c:1776:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tick_setup_sched_timer_dump(void)
   ^
   static 
   1 warning generated.


vim +/tick_setup_sched_timer_dump +1776 kernel/time/timer.c

  1775	
> 1776	void tick_setup_sched_timer_dump(void)
  1777	{
  1778		int cpu;
  1779		int j = jiffies;
  1780	
  1781		pr_alert("%s state", __func__);
  1782		for_each_possible_cpu(cpu)
  1783			pr_cont(" j/c %x/%d %c",
  1784				(int)(j - per_cpu(tick_setup_sched_timer_jiffies, cpu)) & 0xfff,
  1785				per_cpu(tick_setup_sched_timer_jiffies_count, cpu),
  1786				".H"[per_cpu(tick_setup_sched_timer_help_needed, cpu)]);
  1787		pr_cont("\n");
  1788	}
  1789	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
