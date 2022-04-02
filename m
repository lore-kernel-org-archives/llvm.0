Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA981FA2
	for <llvm@lists.linux.dev>; Sat,  2 Apr 2022 20:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648931826; x=1680467826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SS66tXmszrn5GQlHV5AFatP2xe96x6vwLBrF2wwfrdA=;
  b=ShRCWh/u5f56GcbG92VplrlpBLg2yJky/qIvxSmq5UtY/4lPLf1zcACW
   DlLqM9j794JoQabynDWk7S9DgXAUzc3thlvW/4bTgotcfM3k8e7vyNAFl
   f6J/NyCCt2nTzhcdpD2AMHaB3tefn/vCB6df23uKErje31fa9O1pbBuxJ
   oqM1ErpUI4O0/JanLSdEPR4yL/0TFjKtladuTVWc1wohjo2MyVQpDu5iA
   AlN/EebxeGP2YJtCds10FYPZyJqqz6wWH7NBxlcZ44uq6bzyd27XbR+8E
   uAERzmxlfqMqvA98YszAxxP9qLdkUY0vFBAc/oFFROSyRJAB6VlzjkENB
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10305"; a="260034988"
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="260034988"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2022 13:37:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="548205182"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 02 Apr 2022 13:37:04 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nakUZ-0000Ot-GV;
	Sat, 02 Apr 2022 20:37:03 +0000
Date: Sun, 3 Apr 2022 04:36:23 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@wdc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: drivers/cpuidle/cpuidle-riscv-sbi.c:350:5: warning: format specifies
 type 'long' but the argument has type 'int'
Message-ID: <202204030457.TMq8L80S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6f34f8c3d6178527d4c02aa3a53c370cc70cb91e
commit: 6abf32f1d9c5009dcccded2c1e7ca899a4ab587b cpuidle: Add RISC-V SBI CPU idle driver
date:   3 weeks ago
config: riscv-randconfig-c006-20220403 (https://download.01.org/0day-ci/archive/20220403/202204030457.TMq8L80S-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6abf32f1d9c5009dcccded2c1e7ca899a4ab587b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6abf32f1d9c5009dcccded2c1e7ca899a4ab587b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/cpuidle/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/cpuidle/cpuidle-riscv-sbi.c:350:5: error: implicit declaration of function 'cpuid_to_hartid_map' [-Werror,-Wimplicit-function-declaration]
                            cpuid_to_hartid_map(cpu));
                            ^
>> drivers/cpuidle/cpuidle-riscv-sbi.c:350:5: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
                            cpuid_to_hartid_map(cpu));
                            ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:570:26: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
                            ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:163:22: note: expanded from macro 'dynamic_pr_debug'
                              pr_fmt(fmt), ##__VA_ARGS__)
                                     ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
                                                                 ^~~~~~~~~~~
   include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
                   func(&id, ##__VA_ARGS__);               \
                               ^~~~~~~~~~~
   drivers/cpuidle/cpuidle-riscv-sbi.c:359:10: error: implicit declaration of function 'cpuid_to_hartid_map' [-Werror,-Wimplicit-function-declaration]
                          cpuid_to_hartid_map(cpu));
                          ^
   drivers/cpuidle/cpuidle-riscv-sbi.c:359:10: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
                          cpuid_to_hartid_map(cpu));
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:489:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   drivers/cpuidle/cpuidle-riscv-sbi.c:567:6: error: implicit declaration of function 'cpuid_to_hartid_map' [-Werror,-Wimplicit-function-declaration]
                                    cpuid_to_hartid_map(cpu));
                                    ^
   drivers/cpuidle/cpuidle-riscv-sbi.c:567:6: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
                                    cpuid_to_hartid_map(cpu));
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:570:26: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
                            ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:163:22: note: expanded from macro 'dynamic_pr_debug'
                              pr_fmt(fmt), ##__VA_ARGS__)
                                     ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
                                                                 ^~~~~~~~~~~
   include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
                   func(&id, ##__VA_ARGS__);               \
                               ^~~~~~~~~~~
   3 warnings and 3 errors generated.


vim +350 drivers/cpuidle/cpuidle-riscv-sbi.c

   317	
   318	static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
   319	{
   320		struct cpuidle_driver *drv;
   321		unsigned int state_count = 0;
   322		int ret = 0;
   323	
   324		drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
   325		if (!drv)
   326			return -ENOMEM;
   327	
   328		drv->name = "sbi_cpuidle";
   329		drv->owner = THIS_MODULE;
   330		drv->cpumask = (struct cpumask *)cpumask_of(cpu);
   331	
   332		/* RISC-V architectural WFI to be represented as state index 0. */
   333		drv->states[0].enter = sbi_cpuidle_enter_state;
   334		drv->states[0].exit_latency = 1;
   335		drv->states[0].target_residency = 1;
   336		drv->states[0].power_usage = UINT_MAX;
   337		strcpy(drv->states[0].name, "WFI");
   338		strcpy(drv->states[0].desc, "RISC-V WFI");
   339	
   340		/*
   341		 * If no DT idle states are detected (ret == 0) let the driver
   342		 * initialization fail accordingly since there is no reason to
   343		 * initialize the idle driver if only wfi is supported, the
   344		 * default archictectural back-end already executes wfi
   345		 * on idle entry.
   346		 */
   347		ret = dt_init_idle_driver(drv, sbi_cpuidle_state_match, 1);
   348		if (ret <= 0) {
   349			pr_debug("HART%ld: failed to parse DT idle states\n",
 > 350				 cpuid_to_hartid_map(cpu));
   351			return ret ? : -ENODEV;
   352		}
   353		state_count = ret + 1; /* Include WFI state as well */
   354	
   355		/* Initialize idle states from DT. */
   356		ret = sbi_cpuidle_dt_init_states(dev, drv, cpu, state_count);
   357		if (ret) {
   358			pr_err("HART%ld: failed to init idle states\n",
   359			       cpuid_to_hartid_map(cpu));
   360			return ret;
   361		}
   362	
   363		ret = cpuidle_register(drv, NULL);
   364		if (ret)
   365			goto deinit;
   366	
   367		cpuidle_cooling_register(drv);
   368	
   369		return 0;
   370	deinit:
   371		sbi_cpuidle_deinit_cpu(cpu);
   372		return ret;
   373	}
   374	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
