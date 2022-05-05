Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C71E367
	for <llvm@lists.linux.dev>; Thu,  5 May 2022 12:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651753810; x=1683289810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VSiK8ulsm6BEXpVUbdOnzxGf/W8U6/mDOG9CDq5xbyw=;
  b=ZS5P7azP0S2bxK4tzqq6W3g1EscYDfNxr3aVZz3FLFvCO9QQ4AeRj1cR
   LggjAgUNaa4wMlgQVloUf1eGDSo9NBEeAzmW69urOxBUf2tkP4AEC2BW/
   bGUgBm7pjSuhPvsPVwkwl1ebIpjj216MiDBSj/D9ZYom34UY+ZvrALcXz
   7kae8uJHh9NQfiFmY585Nhxt/OUy5QGNjiPom6vSrMY+IPnSJxyKGjveM
   NZpiaLMMj+CpyMhGowmUYSJmxsSnIHiVBE+Y1sFvTgemK9TU7HDI8TXev
   p05EYkcdFGDAgKlPVeXHFg+kdih1E8++EonVGJeuFRiEqjS8JgS2hSAmb
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="328632125"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="328632125"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 05:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="654199144"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 May 2022 05:30:07 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmacR-000COY-0j;
	Thu, 05 May 2022 12:30:07 +0000
Date: Thu, 5 May 2022 20:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: Chengming Zhou <zhouchengming@bytedance.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [linux-next:master 6995/9357] kernel/trace/fgraph.c:37:12: warning:
 no previous prototype for function 'ftrace_enable_ftrace_graph_caller'
Message-ID: <202205052057.2TyEsXsL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   632a8c88e339fe86ae6e420a24dfc641d4dd0ab5
commit: e999995c84c3abb6dcae83f8c35942a8d4ee0451 [6995/9357] ftrace: cleanup ftrace_graph_caller enable and disable
config: riscv-randconfig-r003-20220505 (https://download.01.org/0day-ci/archive/20220505/202205052057.2TyEsXsL-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e999995c84c3abb6dcae83f8c35942a8d4ee0451
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e999995c84c3abb6dcae83f8c35942a8d4ee0451
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from kernel/trace/fgraph.c:11:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from kernel/trace/fgraph.c:11:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/trace/fgraph.c:11:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> kernel/trace/fgraph.c:37:12: warning: no previous prototype for function 'ftrace_enable_ftrace_graph_caller' [-Wmissing-prototypes]
   int __weak ftrace_enable_ftrace_graph_caller(void)
              ^
   kernel/trace/fgraph.c:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak ftrace_enable_ftrace_graph_caller(void)
   ^
   static 
>> kernel/trace/fgraph.c:46:12: warning: no previous prototype for function 'ftrace_disable_ftrace_graph_caller' [-Wmissing-prototypes]
   int __weak ftrace_disable_ftrace_graph_caller(void)
              ^
   kernel/trace/fgraph.c:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak ftrace_disable_ftrace_graph_caller(void)
   ^
   static 
   kernel/trace/fgraph.c:241:15: warning: no previous prototype for function 'ftrace_return_to_handler' [-Wmissing-prototypes]
   unsigned long ftrace_return_to_handler(unsigned long frame_pointer)
                 ^
   kernel/trace/fgraph.c:241:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long ftrace_return_to_handler(unsigned long frame_pointer)
   ^
   static 
   kernel/trace/fgraph.c:356:6: warning: no previous prototype for function 'ftrace_graph_sleep_time_control' [-Wmissing-prototypes]
   void ftrace_graph_sleep_time_control(bool enable)
        ^
   kernel/trace/fgraph.c:356:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ftrace_graph_sleep_time_control(bool enable)
   ^
   static 
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   11 warnings and 20 errors generated.


vim +/ftrace_enable_ftrace_graph_caller +37 kernel/trace/fgraph.c

    32	
    33	/*
    34	 * archs can override this function if they must do something
    35	 * to enable hook for graph tracer.
    36	 */
  > 37	int __weak ftrace_enable_ftrace_graph_caller(void)
    38	{
    39		return 0;
    40	}
    41	
    42	/*
    43	 * archs can override this function if they must do something
    44	 * to disable hook for graph tracer.
    45	 */
  > 46	int __weak ftrace_disable_ftrace_graph_caller(void)
    47	{
    48		return 0;
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
