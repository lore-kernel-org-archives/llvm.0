Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12B64C7D;
	Mon, 20 Mar 2023 19:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679339521; x=1710875521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5o9RpN4Jejq2A4TvwJ2hvJoe3sRwJVlP2xcazTHwaVs=;
  b=cuVT3ramftl49s7z8DwQ1en6AToUHdmR8M/pCWRh230Fm1cUomNr3NQL
   7QiZERquXx+8halbj87acOb+qd6LU16mofv75Mi9ZynCU4Xs7MNeOkExU
   B2kvy9i26NRRhuiY+Qp3I11nhbrdySxMskIY94eJwTLOlLazdmTFrULe0
   aEDbEVzp5KAAAksqIf4MCNuel7ia1x4/HUGHjDZTm7I4aGG+HBpd/CEHN
   Ms0em7N9NDHICF/zLlECTB48cISixXK8vaSHYYIMDUQzzvPAGCELmk7Gv
   kCMG4SB0ycZcBbJPxeFkCGI87Il6pCDaMgKoxLoFOR3qk4cpi3Bfi5+7N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="366478111"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="366478111"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 12:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="824612637"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="824612637"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Mar 2023 12:11:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peKvB-000BFE-3D;
	Mon, 20 Mar 2023 19:11:54 +0000
Date: Tue, 21 Mar 2023 03:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.3.y-rt-rebase 35/68]
 kernel/printk/printk.c:3365:6: warning: no previous prototype for function
 'console_bkl_kthread_create'
Message-ID: <202303210319.3ZOzlpgj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.3.y-rt-rebase
head:   65d172fdb862a825eace9b418119a5aa2461a3ff
commit: 2e100b3dc2cb1a8a4b64b0dc84dd6e4b9768a3b8 [35/68] printk: Add threaded printing support for BKL consoles.
config: s390-randconfig-r044-20230319 (https://download.01.org/0day-ci/archive/20230321/202303210319.3ZOzlpgj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=2e100b3dc2cb1a8a4b64b0dc84dd6e4b9768a3b8
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-6.3.y-rt-rebase
        git checkout 2e100b3dc2cb1a8a4b64b0dc84dd6e4b9768a3b8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash kernel/printk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210319.3ZOzlpgj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/printk/printk.c:24:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from kernel/printk/printk.c:24:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from kernel/printk/printk.c:24:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> kernel/printk/printk.c:3365:6: warning: no previous prototype for function 'console_bkl_kthread_create' [-Wmissing-prototypes]
   void console_bkl_kthread_create(void)
        ^
   kernel/printk/printk.c:3365:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void console_bkl_kthread_create(void)
   ^
   static 
   13 warnings generated.


vim +/console_bkl_kthread_create +3365 kernel/printk/printk.c

  3364	
> 3365	void console_bkl_kthread_create(void)
  3366	{
  3367		struct task_struct *kt;
  3368		struct console *c;
  3369	
  3370		lockdep_assert_held(&console_mutex);
  3371	
  3372		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
  3373			return;
  3374	
  3375		if (!printk_threads_enabled || console_bkl_kthread)
  3376			return;
  3377	
  3378		for_each_console(c) {
  3379			if (c->flags & CON_BOOT)
  3380				return;
  3381		}
  3382	
  3383		kt = kthread_run(console_bkl_kthread_func, NULL, "pr/bkl");
  3384		if (IS_ERR(kt)) {
  3385			pr_err("unable to start BKL printing thread\n");
  3386			return;
  3387		}
  3388	
  3389		console_bkl_kthread = kt;
  3390	
  3391		/*
  3392		 * It is important that console printing threads are scheduled
  3393		 * shortly after a printk call and with generous runtime budgets.
  3394		 */
  3395		sched_set_normal(console_bkl_kthread, -20);
  3396	}
  3397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
