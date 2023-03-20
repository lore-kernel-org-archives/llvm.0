Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE56C4C7D;
	Mon, 20 Mar 2023 19:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679339518; x=1710875518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mp86ARg4Ea6mWal56HwOWNypatWBtIqfnGG178l/JAs=;
  b=TUvNtYmcJzlQePV2xFxiRiNhY3Kw6KhBzGNZUW427OsbUV8C0vPvPeP0
   pMU3a7m8MrEmKGtz6qa+tXX1CepenWXY4DP9A+C+4VL1/tnrAgcZTIEtN
   OlyxcP6Pv3mSvmD2RX4O6PP4ZA5GacoZm6pN7qf2Z697sXJ935qA4yKnz
   f/arYZMfTDr3U8K439skFKnG5Nkhd/cd1b2GiiXScwXYYOaXNPHt/Mrvc
   V6GojV5FrtHOmQcMKH8n3cKRr8RuLLN6w3QGaJG7QWxcsIi0kj8w6/nJz
   DqO5Z2ZZ5jSh5msLNIauaJNFYJlwYUvegymVgRf9X2ACpX0iAy6oombQ9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="336259207"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="336259207"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 12:11:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="750228316"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="750228316"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Mar 2023 12:11:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peKvB-000BFC-2t;
	Mon, 20 Mar 2023 19:11:53 +0000
Date: Tue, 21 Mar 2023 03:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.3.y-rt-rebase 35/68]
 kernel/printk/printk.c:3365:6: warning: no previous prototype for function
 'console_bkl_kthread_create'
Message-ID: <202303210343.V4vEbtmt-lkp@intel.com>
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
config: hexagon-randconfig-r045-20230320 (https://download.01.org/0day-ci/archive/20230321/202303210343.V4vEbtmt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=2e100b3dc2cb1a8a4b64b0dc84dd6e4b9768a3b8
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-6.3.y-rt-rebase
        git checkout 2e100b3dc2cb1a8a4b64b0dc84dd6e4b9768a3b8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/printk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210343.V4vEbtmt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/printk/printk.c:24:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from kernel/printk/printk.c:24:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/printk/printk.c:24:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
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
>> kernel/printk/printk.c:3365:6: warning: no previous prototype for function 'console_bkl_kthread_create' [-Wmissing-prototypes]
   void console_bkl_kthread_create(void)
        ^
   kernel/printk/printk.c:3365:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void console_bkl_kthread_create(void)
   ^
   static 
   7 warnings generated.


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
