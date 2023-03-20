Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11C68477;
	Mon, 20 Mar 2023 22:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679351341; x=1710887341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TJMJPFr3cLAeYNh481ag/bwAaIrjSS8sSoGuh2BcK/s=;
  b=B0qG6uMKXlH71k5h1WsjzMgS6OhpUJTNnQZONXjGLlfVqSCpOcxiyfnQ
   kw3AKMYuVpIWg1xl9tadIeP0J/7g/Q+5HM7nW7SekuHiVa/wyB6ThuHFL
   /CwP2gc4rRk9CK9NVOIXGLy9Ny6j6C3c5M3pEMmXwxFg0GOatuxOQmCjb
   94JC/6GuNLbeCzQ6Upf8HZEsEBwlRDewmNUgK6XFFXpMEl+Y1IYdG9L23
   e98jttvLLvX6S1JU8OZn8xbsSzkvWpjtkg90O0lvJhKD78sNPlD20MisF
   cBnXQnmQuEe4PI7pN/yQZ1iPF30g9yV0SEwPW+JjwqUqWAA4/yvi47umm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="319190017"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="319190017"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 15:29:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="683608425"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="683608425"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Mar 2023 15:28:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peNzv-000BMg-0R;
	Mon, 20 Mar 2023 22:28:59 +0000
Date: Tue, 21 Mar 2023 06:28:51 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/5] PM: domains: Allow power off queuing from
 providers
Message-ID: <202303210628.8jKZlFon-lkp@intel.com>
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
[auto build test ERROR on clk/clk-next]
[also build test ERROR on rafael-pm/linux-next linus/master pavel-leds/for-next v6.3-rc3 next-20230320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/PM-domains-Allow-power-off-queuing-from-providers/20230320-214327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230320134217.1685781-2-abel.vesa%40linaro.org
patch subject: [RFC PATCH v2 1/5] PM: domains: Allow power off queuing from providers
config: i386-randconfig-a004-20230320 (https://download.01.org/0day-ci/archive/20230321/202303210628.8jKZlFon-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fef66120c9d99388e95560573d2e0c92c7a547c8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Abel-Vesa/PM-domains-Allow-power-off-queuing-from-providers/20230320-214327
        git checkout fef66120c9d99388e95560573d2e0c92c7a547c8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210628.8jKZlFon-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/base/platform.c:25:
>> include/linux/pm_domain.h:284:2: error: void function 'genpd_queue_power_off_work' should not return a value [-Wreturn-type]
           return -EOPNOTSUPP;
           ^      ~~~~~~~~~~~
   include/linux/pm_domain.h:282:6: warning: no previous prototype for function 'genpd_queue_power_off_work' [-Wmissing-prototypes]
   void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
        ^
   include/linux/pm_domain.h:282:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
   ^
   static 
   1 warning and 1 error generated.
--
   In file included from drivers/acpi/device_pm.c:19:
>> include/linux/pm_domain.h:284:2: error: void function 'genpd_queue_power_off_work' should not return a value [-Wreturn-type]
           return -EOPNOTSUPP;
           ^      ~~~~~~~~~~~
   include/linux/pm_domain.h:282:6: warning: no previous prototype for function 'genpd_queue_power_off_work' [-Wmissing-prototypes]
   void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
        ^
   include/linux/pm_domain.h:282:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
   ^
   static 
   In file included from drivers/acpi/device_pm.c:21:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/acpi/device_pm.c:21:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/acpi/device_pm.c:21:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/acpi/device_pm.c:21:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/acpi/device_pm.c:21:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/acpi/device_pm.c:21:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/acpi/device_pm.c:21:


vim +/genpd_queue_power_off_work +284 include/linux/pm_domain.h

   281	
   282	void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
   283	{
 > 284		return -EOPNOTSUPP;
   285	}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
