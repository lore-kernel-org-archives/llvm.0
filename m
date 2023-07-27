Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3771174D0;
	Thu, 27 Jul 2023 14:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690467781; x=1722003781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tVmXn8OQubx5m3Wv00d0TOMJ2VIMCX79C3U8NiiaI2s=;
  b=DZRdBUC8ta14iaC3GT9YOml7oYnPKk7/SXOtLHOKlQruCLWzLcjVGMzB
   rA6qm8t/LysGl3Fo1DG1qIgq/ckw6O9ydH5zjplGHTHMg9OZmregpvjsR
   i8eWfZAw1buqjNMRRZRSWeJmYrOloG5aEJK4QenRDK/S8b0rXPM2/DDEL
   zfVK8soPkM28L3BR8XEJfGB+cwUge+LRV3gbg5GePAo/1qS7lEttVqiZm
   AEmMkSkxWn/xWC7cwvLiij6Sz6E33UcfkqOA9Wx+7igiUei+gbIeLI2Z5
   cf/kkyohl1pSp0Q7tD1+biEuFoOBYsS3IGJPWH3JG23GwmKTFOgBHkDnA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="399260411"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="399260411"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 07:22:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="900892893"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="900892893"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 27 Jul 2023 07:22:03 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP1sQ-0002KR-2C;
	Thu, 27 Jul 2023 14:22:02 +0000
Date: Thu, 27 Jul 2023 22:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.4.y-rt-rebase 50/85]
 kernel/printk/printk.c:3361:6: warning: no previous prototype for function
 'console_bkl_kthread_create'
Message-ID: <202307272243.gHGeMfJW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.4.y-rt-rebase
head:   fb7828286d1ee12dc132500e9fc84085ceadabc3
commit: 6222f512e52abd73ca47462f12ede8872ff59f0f [50/85] printk: Add threaded printing support for BKL consoles.
config: hexagon-randconfig-r013-20230727 (https://download.01.org/0day-ci/archive/20230727/202307272243.gHGeMfJW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307272243.gHGeMfJW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307272243.gHGeMfJW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/printk/printk.c:24:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/printk/printk.c:24:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/printk/printk.c:24:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> kernel/printk/printk.c:3361:6: warning: no previous prototype for function 'console_bkl_kthread_create' [-Wmissing-prototypes]
    3361 | void console_bkl_kthread_create(void)
         |      ^
   kernel/printk/printk.c:3361:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3361 | void console_bkl_kthread_create(void)
         | ^
         | static 
   7 warnings generated.


vim +/console_bkl_kthread_create +3361 kernel/printk/printk.c

  3360	
> 3361	void console_bkl_kthread_create(void)
  3362	{
  3363		struct task_struct *kt;
  3364		struct console *c;
  3365	
  3366		lockdep_assert_held(&console_mutex);
  3367	
  3368		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
  3369			return;
  3370	
  3371		if (!printk_threads_enabled || console_bkl_kthread)
  3372			return;
  3373	
  3374		for_each_console(c) {
  3375			if (c->flags & CON_BOOT)
  3376				return;
  3377		}
  3378	
  3379		kt = kthread_run(console_bkl_kthread_func, NULL, "pr/bkl");
  3380		if (IS_ERR(kt)) {
  3381			pr_err("unable to start BKL printing thread\n");
  3382			return;
  3383		}
  3384	
  3385		console_bkl_kthread = kt;
  3386	
  3387		/*
  3388		 * It is important that console printing threads are scheduled
  3389		 * shortly after a printk call and with generous runtime budgets.
  3390		 */
  3391		sched_set_normal(console_bkl_kthread, -20);
  3392	}
  3393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
