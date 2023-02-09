Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D1E748E;
	Thu,  9 Feb 2023 11:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675942661; x=1707478661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4pU4FfIxdtoMnl8HQQxkTr9AsU1rPuyIHBiJngdV5oM=;
  b=NSgC7VaAv6PXRMBc2UwvVBKaMEgGTWhBP8Lzc56TqnLnFAxkYODFQY8T
   9F6Dx35XiLAcutjbu1+P2sGJSaFq2R7AsegKO0nIQRoDH/NgwqnhLR4eB
   FJ7lffeKywTXf2iB+k8BMBZivk6jhVqFCy7NldNeDzG+jHgTvvRs1kv22
   9XZwAigKS4PC2fMBsMUU4mUXtGl8wQCVq/o7T29TBnyLXTnV1/RVOUouL
   +Tf69rIv3ETQ7KsribkB4LY1Gh1vF4x/lqGiIAmU6vtD78zj77A8PY6EQ
   pMIEXmf03BGl4fdsGtFyun3LWZZELqDoWBV6F+H6e25jkMvFvAqiIbiHd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="310437364"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="310437364"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 03:37:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="913095856"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="913095856"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Feb 2023 03:37:39 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQ5FC-000526-1L;
	Thu, 09 Feb 2023 11:37:38 +0000
Date: Thu, 9 Feb 2023 19:36:54 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:parallel-6.2-rc7 13/14] kernel/cpu.c:1531:37: warning: format
 specifies type 'long long' but the argument has type 'cycles_t' (aka
 'unsigned int')
Message-ID: <202302091914.6NZ47xeR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux parallel-6.2-rc7
head:   8fec7c1c6a8c6419aafdfc7dbe6c928d326a87eb
commit: 1ad0d91052e766a0a304552b81738864855b2669 [13/14] Print bringup timing
config: mips-buildonly-randconfig-r004-20230209 (https://download.01.org/0day-ci/archive/20230209/202302091914.6NZ47xeR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        git remote add dwmw2 git://git.infradead.org/users/dwmw2/linux
        git fetch --no-tags dwmw2 parallel-6.2-rc7
        git checkout 1ad0d91052e766a0a304552b81738864855b2669
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302091914.6NZ47xeR-lkp@intel.com

All warnings (new ones prefixed by >>):

>> kernel/cpu.c:1531:37: warning: format specifies type 'long long' but the argument has type 'cycles_t' (aka 'unsigned int') [-Wformat]
                                  cpuhp_hp_states[st].name, t2 - t1);
                                                            ^~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   kernel/cpu.c:1544:49: warning: format specifies type 'long long' but the argument has type 'cycles_t' (aka 'unsigned int') [-Wformat]
           printk("Brought CPUs online in %lld cycles\n", t2 - t1);
                                          ~~~~            ^~~~~~~
                                          %u
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +1531 kernel/cpu.c

  1504	
  1505	void bringup_nonboot_cpus(unsigned int setup_max_cpus)
  1506	{
  1507		unsigned int n = setup_max_cpus - num_online_cpus();
  1508		unsigned int cpu;
  1509		cycles_t t1, t2;
  1510	
  1511		/*
  1512		 * An architecture may have regustered parallel pre-bringup states to
  1513		 * which each CPU may be brought in parallel. For each such state,
  1514		 * bring N CPUs to it in turn before the final round of bringing them
  1515		 * online.
  1516		 */
  1517		if (n > 0) {
  1518			enum cpuhp_state st = CPUHP_BP_PARALLEL_DYN;
  1519	
  1520			while (st <= CPUHP_BP_PARALLEL_DYN_END && cpuhp_hp_states[st].name) {
  1521				int i = n;
  1522				t1 = get_cycles();
  1523				for_each_present_cpu(cpu) {
  1524					cpu_up(cpu, st);
  1525					if (!--i)
  1526						break;
  1527				}
  1528				t2 = get_cycles();
  1529	
  1530				printk("Brought %d CPUs to %s in %lld cycles\n", n - i,
> 1531				       cpuhp_hp_states[st].name, t2 - t1);
  1532				st++;
  1533			}
  1534		}
  1535	
  1536		t1 = get_cycles();
  1537		for_each_present_cpu(cpu) {
  1538			if (num_online_cpus() >= setup_max_cpus)
  1539				break;
  1540			if (!cpu_online(cpu))
  1541				cpu_up(cpu, CPUHP_ONLINE);
  1542		}
  1543		t2 = get_cycles();
  1544		printk("Brought CPUs online in %lld cycles\n", t2 - t1);
  1545	}
  1546	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
