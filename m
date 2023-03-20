Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35E36D1B;
	Mon, 20 Mar 2023 19:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679340176; x=1710876176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U3FRldIghgkxNGkr6s5MStl/8Sqbf7uSl9+GhzoH6b4=;
  b=b0v8B8C2yOB2oFKaZANi6ZIl9S4iTOjGPHHi7J+EFIyOrXwFS1AMu6tb
   4D9CRGkQOrONLoNy3fzf/gvx6xrCKNDbSe/xAQ5iY7Y1jxf+TMDTO0E+G
   dhfmLmJjmkqkwj7NE3MJHgUAVPBdgTkSN3d1ceXW+9rWq1P91NnhwiM0V
   sngQD648xLv/SSmJSLgDOiDbjcG65JO6dqXQI3ODr2GUTY8zfQCTZbvyA
   XGn9o+0OBC3oQyoiDM6Tz4fqvCz8NMPsTwjjBFSt7QUUOem9/0EpqsvCG
   vpiMV8xaYMamVm8RLaooJ9PWyYC+FjLTpJTJLi7Nv0QeLzRJ8lhFYfJS4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="340304591"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="340304591"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 12:22:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="674521751"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="674521751"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Mar 2023 12:22:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peL5q-000BG2-1Z;
	Mon, 20 Mar 2023 19:22:54 +0000
Date: Tue, 21 Mar 2023 03:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/5] PM: domains: Allow power off queuing from
 providers
Message-ID: <202303210319.sOmW6Lr7-lkp@intel.com>
References: <20230320134217.1685781-2-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320134217.1685781-2-abel.vesa@linaro.org>

Hi Abel,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on clk/clk-next]
[also build test WARNING on rafael-pm/linux-next linus/master v6.3-rc3 next-20230320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/PM-domains-Allow-power-off-queuing-from-providers/20230320-214327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230320134217.1685781-2-abel.vesa%40linaro.org
patch subject: [RFC PATCH v2 1/5] PM: domains: Allow power off queuing from providers
config: arm-randconfig-r036-20230319 (https://download.01.org/0day-ci/archive/20230321/202303210319.sOmW6Lr7-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/fef66120c9d99388e95560573d2e0c92c7a547c8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Abel-Vesa/PM-domains-Allow-power-off-queuing-from-providers/20230320-214327
        git checkout fef66120c9d99388e95560573d2e0c92c7a547c8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/char/tpm/ drivers/opp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210319.sOmW6Lr7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/opp/core.c:18:
   include/linux/pm_domain.h:284:2: error: void function 'genpd_queue_power_off_work' should not return a value [-Wreturn-type]
           return -EOPNOTSUPP;
           ^      ~~~~~~~~~~~
>> include/linux/pm_domain.h:282:6: warning: no previous prototype for function 'genpd_queue_power_off_work' [-Wmissing-prototypes]
   void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
        ^
   include/linux/pm_domain.h:282:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
   ^
   static 
   In file included from drivers/opp/core.c:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/opp/core.c:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/opp/core.c:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/opp/core.c:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/opp/core.c:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/opp/core.c:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
--
   In file included from drivers/opp/of.c:17:
   include/linux/pm_domain.h:284:2: error: void function 'genpd_queue_power_off_work' should not return a value [-Wreturn-type]
           return -EOPNOTSUPP;
           ^      ~~~~~~~~~~~
>> include/linux/pm_domain.h:282:6: warning: no previous prototype for function 'genpd_queue_power_off_work' [-Wmissing-prototypes]
   void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
        ^
   include/linux/pm_domain.h:282:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
   ^
   static 
   1 warning and 1 error generated.


vim +/genpd_queue_power_off_work +282 include/linux/pm_domain.h

   281	
 > 282	void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
   283	{
   284		return -EOPNOTSUPP;
   285	}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
