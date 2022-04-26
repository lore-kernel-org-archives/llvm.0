Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A547E
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 06:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650955730; x=1682491730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nqrgrw/s0vxaROpu8xZWOWGHSnX8rXEaIq3SmjGDH4c=;
  b=j0AxtA+VOd6oRSO3klySUaZBSOddChPvNQfDtww/a/+Yu+ENl1e8tTIJ
   IBIF2o6qDeGprsJ5oMcpaUnzESnzC3XbpjrE91dOT1Uf0AKdSgbaY5cgA
   34YY4PYSLJmnOptHImBDXZZBh0ZNyQsk6rBdbYnMlJ9OP8Vd8O6alW69A
   p5IMkm2aivRvEZjTvV5klk3ZB+qxwSO6mf8BVVR+c0miCuxHB02/+sWDZ
   QjATvEUwJF8AoPSnKJgebxP/c8CliLXmTWYDEEaJ7mSu/IglfXWHxIYYa
   oBGPOTMZHQazqs/3VPAksm4L+dLGJbglFKyuuLBbBPa8IuFNNKJsLAg47
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="265640422"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="265640422"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 23:48:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="628384521"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 25 Apr 2022 23:48:48 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1njF0B-0003Ii-Hp;
	Tue, 26 Apr 2022 06:48:47 +0000
Date: Tue, 26 Apr 2022 14:48:24 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Chen Yu <yu.c.chen@intel.com>, linux-kernel@vger.kernel.org
Subject: [yu-chen-surf:sis 1/3] kernel/sched/debug.c:765:50: warning: format
 specifies type 'long' but the argument has type 'int'
Message-ID: <202204261453.3774zcNd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yu-chen-surf/linux.git sis
head:   96e5c4a99150281df27ecef59d05229a609afd17
commit: 0c1952e6258a04d69b2b862a11f037f125dcfe05 [1/3] sched/fair: Track efficiency of select_idle_sibling
config: hexagon-randconfig-r041-20220425 (https://download.01.org/0day-ci/archive/20220426/202204261453.3774zcNd-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yu-chen-surf/linux/commit/0c1952e6258a04d69b2b862a11f037f125dcfe05
        git remote add yu-chen-surf https://github.com/yu-chen-surf/linux.git
        git fetch --no-tags yu-chen-surf sis
        git checkout 0c1952e6258a04d69b2b862a11f037f125dcfe05
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:72:
>> kernel/sched/debug.c:765:50: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
                   SEQ_printf(m, "  .%-30s: %ld\n", "sis_search", schedstat_val(rq->sis_search));
                                            ~~~                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                            %d
   kernel/sched/stats.h:82:32: note: expanded from macro 'schedstat_val'
   # define   schedstat_val(var)           0
                                           ^
   kernel/sched/debug.c:17:17: note: expanded from macro 'SEQ_printf'
                   seq_printf(m, x);               \
                                 ^
>> kernel/sched/debug.c:765:50: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
                   SEQ_printf(m, "  .%-30s: %ld\n", "sis_search", schedstat_val(rq->sis_search));
                                            ~~~                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                            %d
   kernel/sched/stats.h:82:32: note: expanded from macro 'schedstat_val'
   # define   schedstat_val(var)           0
                                           ^
   kernel/sched/debug.c:19:11: note: expanded from macro 'SEQ_printf'
                   pr_cont(x);                     \
                           ^
   include/linux/printk.h:531:26: note: expanded from macro 'pr_cont'
           printk(KERN_CONT fmt, ##__VA_ARGS__)
                            ~~~    ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:72:
   kernel/sched/debug.c:766:57: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
                   SEQ_printf(m, "  .%-30s: %ld\n", "sis_domain_search", schedstat_val(rq->sis_domain_search));
                                            ~~~                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                            %d
   kernel/sched/stats.h:82:32: note: expanded from macro 'schedstat_val'
   # define   schedstat_val(var)           0
                                           ^
   kernel/sched/debug.c:17:17: note: expanded from macro 'SEQ_printf'
                   seq_printf(m, x);               \
                                 ^
   kernel/sched/debug.c:766:57: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
                   SEQ_printf(m, "  .%-30s: %ld\n", "sis_domain_search", schedstat_val(rq->sis_domain_search));
                                            ~~~                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                            %d
   kernel/sched/stats.h:82:32: note: expanded from macro 'schedstat_val'
   # define   schedstat_val(var)           0
                                           ^
   kernel/sched/debug.c:19:11: note: expanded from macro 'SEQ_printf'
                   pr_cont(x);                     \
                           ^
   include/linux/printk.h:531:26: note: expanded from macro 'pr_cont'
           printk(KERN_CONT fmt, ##__VA_ARGS__)
                            ~~~    ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:72:
   kernel/sched/debug.c:767:51: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
                   SEQ_printf(m, "  .%-30s: %ld\n", "sis_scanned", schedstat_val(rq->sis_scanned));
                                            ~~~                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                            %d
   kernel/sched/stats.h:82:32: note: expanded from macro 'schedstat_val'
   # define   schedstat_val(var)           0
                                           ^
   kernel/sched/debug.c:17:17: note: expanded from macro 'SEQ_printf'
                   seq_printf(m, x);               \
                                 ^
   kernel/sched/debug.c:767:51: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
                   SEQ_printf(m, "  .%-30s: %ld\n", "sis_scanned", schedstat_val(rq->sis_scanned));
                                            ~~~                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                            %d
   kernel/sched/stats.h:82:32: note: expanded from macro 'schedstat_val'
   # define   schedstat_val(var)           0
                                           ^
   kernel/sched/debug.c:19:11: note: expanded from macro 'SEQ_printf'
                   pr_cont(x);                     \
                           ^
   include/linux/printk.h:531:26: note: expanded from macro 'pr_cont'
           printk(KERN_CONT fmt, ##__VA_ARGS__)
                            ~~~    ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:72:
   kernel/sched/debug.c:768:50: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
                   SEQ_printf(m, "  .%-30s: %ld\n", "sis_failed", schedstat_val(rq->sis_failed));
                                            ~~~                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                            %d
   kernel/sched/stats.h:82:32: note: expanded from macro 'schedstat_val'
   # define   schedstat_val(var)           0
                                           ^
   kernel/sched/debug.c:17:17: note: expanded from macro 'SEQ_printf'
                   seq_printf(m, x);               \
                                 ^
   kernel/sched/debug.c:768:50: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
                   SEQ_printf(m, "  .%-30s: %ld\n", "sis_failed", schedstat_val(rq->sis_failed));
                                            ~~~                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                            %d
   kernel/sched/stats.h:82:32: note: expanded from macro 'schedstat_val'
   # define   schedstat_val(var)           0
                                           ^
   kernel/sched/debug.c:19:11: note: expanded from macro 'SEQ_printf'
                   pr_cont(x);                     \
                           ^
   include/linux/printk.h:531:26: note: expanded from macro 'pr_cont'


vim +765 kernel/sched/debug.c

   757	
   758	#define P(n) SEQ_printf(m, "  .%-30s: %d\n", #n, schedstat_val(rq->n));
   759		if (schedstat_enabled()) {
   760			P(yld_count);
   761			P(sched_count);
   762			P(sched_goidle);
   763			P(ttwu_count);
   764			P(ttwu_local);
 > 765			SEQ_printf(m, "  .%-30s: %ld\n", "sis_search", schedstat_val(rq->sis_search));
   766			SEQ_printf(m, "  .%-30s: %ld\n", "sis_domain_search", schedstat_val(rq->sis_domain_search));
   767			SEQ_printf(m, "  .%-30s: %ld\n", "sis_scanned", schedstat_val(rq->sis_scanned));
   768			SEQ_printf(m, "  .%-30s: %ld\n", "sis_failed", schedstat_val(rq->sis_failed));
   769		}
   770	#undef P
   771	
   772		print_cfs_stats(m, cpu);
   773		print_rt_stats(m, cpu);
   774		print_dl_stats(m, cpu);
   775	
   776		print_rq(m, rq, cpu);
   777		SEQ_printf(m, "\n");
   778	}
   779	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
