Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4361A32;
	Fri, 12 May 2023 03:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683863557; x=1715399557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=89dNGZOLGkIN3PtYPrHUazerKGVbbcltTjysT58ZfCs=;
  b=SwZR/rNDvW9lXRL0qGm1VQCCafQFzehlnisyC85LFRVH7kH0J0mSlF2O
   4qKVhvpjFkUw6M3finIGQBGj89OvBzL1xtW+YKe7b+u5wJpfZGwewLU18
   JgDcdPKXZznJkt9Cyhj2Jf2ImQlazSsjDH7VGlH48lLMdFVr3P6zj95Tf
   fPMHjrL1WVEB8PxWE/QtyvwWzdy7pVAs/dmTIii+WsBH6J91FOXpSRDE8
   H3A2OtkigrJktK9ihOaKFUKujvKWUiLVsjBHKSMWfO1iqsjVgvhz9kizI
   yR+Lt9BtIMwpgKV9WarbPCa8Stk3FzEJ8fzgyb9lKSBw3n3sVU/LC9UbG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="437027723"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="437027723"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 20:52:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="769629438"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="769629438"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 May 2023 20:52:35 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxJpa-0004TD-2C;
	Fri, 12 May 2023 03:52:34 +0000
Date: Fri, 12 May 2023 11:52:19 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 8/30] include/linux/poll.h:140:27: warning: division
 by zero is undefined
Message-ID: <202305121131.xoUncOQW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   fd35584ec7147f575dcdc65239bc8ac7fe340ab4
commit: 7d709841b48071e203642a18aef6b5e7ff850fe4 [8/30] acpi: tables: Add CDAT table parsing support
config: mips-cu1000-neo_defconfig (https://download.01.org/0day-ci/archive/20230512/202305121131.xoUncOQW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=7d709841b48071e203642a18aef6b5e7ff850fe4
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 7d709841b48071e203642a18aef6b5e7ff850fe4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/generic/ drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121131.xoUncOQW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/mips/generic/init.c:10:
   In file included from include/linux/irqchip.h:14:
   include/linux/acpi.h:1540:49: warning: declaration of 'struct acpi_subtable_proc' will not be visible outside of this function [-Wvisibility]
           struct acpi_table_header *table_header, struct acpi_subtable_proc *proc,
                                                          ^
   include/linux/acpi.h:1547:6: error: unknown type name 'acpi_tbl_entry_handler_arg'
                             acpi_tbl_entry_handler_arg handler, void *arg,
                             ^
   In file included from arch/mips/generic/init.c:21:
   In file included from arch/mips/include/asm/time.h:13:
   In file included from include/linux/rtc.h:40:
>> include/linux/poll.h:140:27: warning: division by zero is undefined [-Wdivision-by-zero]
                   M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
                                           ^~~~~~~~~
   include/linux/poll.h:138:32: note: expanded from macro 'M'
   #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:124:51: note: expanded from macro '__MAP'
           (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
                                                            ^ ~~~~~~~~~
   include/linux/poll.h:140:39: warning: division by zero is undefined [-Wdivision-by-zero]
                   M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
                                                       ^~~~~~~~~
   include/linux/poll.h:138:32: note: expanded from macro 'M'
   #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:124:51: note: expanded from macro '__MAP'
           (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
                                                            ^ ~~~~~~~~~
   3 warnings and 1 error generated.
--
   In file included from drivers/irqchip/irq-ingenic.c:12:
   In file included from include/linux/irqchip.h:14:
   include/linux/acpi.h:1540:49: warning: declaration of 'struct acpi_subtable_proc' will not be visible outside of this function [-Wvisibility]
           struct acpi_table_header *table_header, struct acpi_subtable_proc *proc,
                                                          ^
   include/linux/acpi.h:1547:6: error: unknown type name 'acpi_tbl_entry_handler_arg'
                             acpi_tbl_entry_handler_arg handler, void *arg,
                             ^
>> drivers/irqchip/irq-ingenic.c:111:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   gc->wake_enabled = IRQ_MSK(32);
                                      ^~~~~~~~~~~
   include/linux/irq.h:1193:41: note: expanded from macro 'IRQ_MSK'
   #define IRQ_MSK(n) (u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX)
                                           ^  ~~~
   drivers/irqchip/irq-ingenic.c:124:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   irq_reg_writel(gc, IRQ_MSK(32), JZ_REG_INTC_SET_MASK);
                                      ^~~~~~~~~~~
   include/linux/irq.h:1193:41: note: expanded from macro 'IRQ_MSK'
   #define IRQ_MSK(n) (u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX)
                                           ^  ~~~
   3 warnings and 1 error generated.
--
   In file included from drivers/irqchip/irq-ingenic-tcu.c:9:
   In file included from include/linux/irqchip.h:14:
   include/linux/acpi.h:1540:49: warning: declaration of 'struct acpi_subtable_proc' will not be visible outside of this function [-Wvisibility]
           struct acpi_table_header *table_header, struct acpi_subtable_proc *proc,
                                                          ^
   include/linux/acpi.h:1547:6: error: unknown type name 'acpi_tbl_entry_handler_arg'
                             acpi_tbl_entry_handler_arg handler, void *arg,
                             ^
>> drivers/irqchip/irq-ingenic-tcu.c:135:21: warning: shift count >= width of type [-Wshift-count-overflow]
           gc->wake_enabled = IRQ_MSK(32);
                              ^~~~~~~~~~~
   include/linux/irq.h:1193:41: note: expanded from macro 'IRQ_MSK'
   #define IRQ_MSK(n) (u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX)
                                           ^  ~~~
   drivers/irqchip/irq-ingenic-tcu.c:147:39: warning: shift count >= width of type [-Wshift-count-overflow]
           regmap_write(tcu->map, TCU_REG_TMSR, IRQ_MSK(32));
                                                ^~~~~~~~~~~
   include/linux/irq.h:1193:41: note: expanded from macro 'IRQ_MSK'
   #define IRQ_MSK(n) (u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX)
                                           ^  ~~~
   3 warnings and 1 error generated.


vim +140 include/linux/poll.h

7a163b2195cda0 Al Viro 2018-02-01  135  
7a163b2195cda0 Al Viro 2018-02-01  136  static inline __poll_t demangle_poll(u16 val)
7a163b2195cda0 Al Viro 2018-02-01  137  {
7a163b2195cda0 Al Viro 2018-02-01  138  #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
7a163b2195cda0 Al Viro 2018-02-01  139  	return M(IN) | M(OUT) | M(PRI) | M(ERR) | M(NVAL) |
7a163b2195cda0 Al Viro 2018-02-01 @140  		M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
7a163b2195cda0 Al Viro 2018-02-01  141  		M(HUP) | M(RDHUP) | M(MSG);
7a163b2195cda0 Al Viro 2018-02-01  142  #undef M
7a163b2195cda0 Al Viro 2018-02-01  143  }
7a163b2195cda0 Al Viro 2018-02-01  144  #undef __MAP
7a163b2195cda0 Al Viro 2018-02-01  145  
7a163b2195cda0 Al Viro 2018-02-01  146  

:::::: The code at line 140 was first introduced by commit
:::::: 7a163b2195cda0cddf47b5caf14a7229d4e2bea3 unify {de,}mangle_poll(), get rid of kernel-side POLL...

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
