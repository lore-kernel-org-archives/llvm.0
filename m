Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A342586;
	Sat,  4 Feb 2023 15:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675523749; x=1707059749;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kh6pSqNnIdqjLa0S5rNlE4klaFOpWFEoZi6T+dY8kDc=;
  b=ZhrRFDn5ELhcSbiM0pgs4wQuba9ZQWxwItjaPQ2Y6otjZfXu7FmEiBmU
   c7cjQdA4liRXt/KJovAVvCoaWQDiAFYUNru5QmXhC4/b3+p+oX8pj/Xmb
   9hi9HNoe7gplEiUrE05dsMeS85apVcNr7Lj5HBVtmcDkstoRqOr2qmft9
   eEcNdR9xwZDidkPUh+FxFEJoEGW4nYE1CGHuV52BW1conHZoWiCbR/rIj
   UHdHC4Eok5cMlRgFttyYkoKWmLG+og/5jLscAZdzEPZB8xXAEtkvykTms
   hbyF8uuRCPU6RGHDzrYG0GInWOFvLtr3FtA+fzjyao3TNXzNADhEl1kkd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="309287115"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="309287115"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 07:15:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="994813824"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="994813824"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Feb 2023 07:15:47 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOKGY-0001Ng-2c;
	Sat, 04 Feb 2023 15:15:46 +0000
Date: Sat, 4 Feb 2023 23:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:parallel-6.2-rc6 14/15] kernel/cpu.c:1527:37: warning: format
 specifies type 'long long' but the argument has type 'cycles_t' (aka
 'unsigned long')
Message-ID: <202302042359.ZHnxu0oG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://git.infradead.org/users/dwmw2/linux parallel-6.2-rc6
head:   459d1c46dbd121ad460159a0fe313dd07e3951da
commit: 3e54da50727b59679cce6ca7f99b3f216badee2d [14/15] Print bringup timing
config: hexagon-randconfig-r045-20230204 (https://download.01.org/0day-ci/archive/20230204/202302042359.ZHnxu0oG-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add dwmw2 git://git.infradead.org/users/dwmw2/linux
        git fetch --no-tags dwmw2 parallel-6.2-rc6
        git checkout 3e54da50727b59679cce6ca7f99b3f216badee2d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from kernel/cpu.c:13:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from kernel/cpu.c:13:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/cpu.c:13:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> kernel/cpu.c:1527:37: warning: format specifies type 'long long' but the argument has type 'cycles_t' (aka 'unsigned long') [-Wformat]
                                  cpuhp_hp_states[st].name, t2 - t1);
                                                            ^~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   kernel/cpu.c:1540:49: warning: format specifies type 'long long' but the argument has type 'cycles_t' (aka 'unsigned long') [-Wformat]
           printk("Brought CPUs online in %lld cycles\n", t2 - t1);
                                          ~~~~            ^~~~~~~
                                          %lu
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   8 warnings generated.


vim +1527 kernel/cpu.c

  1504	
  1505	void bringup_nonboot_cpus(unsigned int setup_max_cpus)
  1506	{
  1507		unsigned int cpu;
  1508		int n = setup_max_cpus - num_online_cpus();
  1509		cycles_t t1, t2;
  1510	
  1511		/* ∀ parallel pre-bringup state, bring N CPUs to it */
  1512		if (n > 0) {
  1513			enum cpuhp_state st = CPUHP_BP_PARALLEL_DYN;
  1514	
  1515			while (st <= CPUHP_BP_PARALLEL_DYN_END &&
  1516			       cpuhp_hp_states[st].name) {
  1517				int i = n;
  1518				t1 = get_cycles();
  1519				for_each_present_cpu(cpu) {
  1520					cpu_up(cpu, st);
  1521					if (!--i)
  1522						break;
  1523				}
  1524				t2 = get_cycles();
  1525	
  1526				printk("Brought %d CPUs to %s in %lld cycles\n", n - i,
> 1527				       cpuhp_hp_states[st].name, t2 - t1);
  1528				st++;
  1529			}
  1530		}
  1531	
  1532		t1 = get_cycles();
  1533		for_each_present_cpu(cpu) {
  1534			if (num_online_cpus() >= setup_max_cpus)
  1535				break;
  1536			if (!cpu_online(cpu))
  1537				cpu_up(cpu, CPUHP_ONLINE);
  1538		}
  1539		t2 = get_cycles();
  1540		printk("Brought CPUs online in %lld cycles\n", t2 - t1);
  1541	}
  1542	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
