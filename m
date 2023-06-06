Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F094395;
	Tue,  6 Jun 2023 03:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686023273; x=1717559273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5OyQs/vTogDOV1X71jEAP7FuvYj7GzxLvIzmQCpubKc=;
  b=c6cKHuT8mgtt8sFc7ZiggBvm4TyxGLFsSw2cwVW+Yn+RQkMgjSAH6OdW
   tVkutkNsyEYTEVCKRDeAbsrG9z7Lxx0sUUge15EjGxhYF98xJriUz0UDf
   AmYPYXIdPdIUGEKxmHtS4AUPBtdUzh5stLRpqLeJbZdD0TkVGEih65XXZ
   JlYsOEvgqvznnH1lajxOxZzfB1ORoBpjZXzrn/NPXnkA3kTtr5bvqWS+2
   d64mpueC7rZyRTtM+qJkq8B4+6coMeM8hK2FOqxEdUQ9SZEZw4/5yU43K
   kbyc0v0FChrNi4vvDabRDCALGAWdsDBZlW+wwm4q5FPfnbtsweIphyDSm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341193419"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="341193419"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 20:47:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="798666871"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="798666871"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2023 20:47:51 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6Nfi-0004nF-1l;
	Tue, 06 Jun 2023 03:47:50 +0000
Date: Tue, 6 Jun 2023 11:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix 58/61] kernel/signal.c:4257:28: warning:
 variable 't' is uninitialized when used here
Message-ID: <202306061121.RfpSvAcZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix
head:   16a20adb1e0ae19ad42041a7d1b5583e4705ca0c
commit: 3ef2ce19cb1200cb49c61f9b3cef58c4b8a3a10d [58/61] signal: Add list to track ignored posix timers
config: hexagon-randconfig-r026-20230605 (https://download.01.org/0day-ci/archive/20230606/202306061121.RfpSvAcZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=3ef2ce19cb1200cb49c61f9b3cef58c4b8a3a10d
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel timers/posix
        git checkout 3ef2ce19cb1200cb49c61f9b3cef58c4b8a3a10d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061121.RfpSvAcZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/signal.c:26:
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
   In file included from kernel/signal.c:26:
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
   In file included from kernel/signal.c:26:
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
>> kernel/signal.c:4257:28: warning: variable 't' is uninitialized when used here [-Wuninitialized]
    4257 |                         posixtimer_sig_unignore(t, sig);
         |                                                 ^
   kernel/signal.c:4198:37: note: initialize the variable 't' to silence this warning
    4198 |         struct task_struct *p = current, *t;
         |                                            ^
         |                                             = NULL
   7 warnings generated.


vim +/t +4257 kernel/signal.c

  4195	
  4196	int do_sigaction(int sig, struct k_sigaction *act, struct k_sigaction *oact)
  4197	{
  4198		struct task_struct *p = current, *t;
  4199		struct k_sigaction *k;
  4200		sigset_t mask;
  4201	
  4202		if (!valid_signal(sig) || sig < 1 || (act && sig_kernel_only(sig)))
  4203			return -EINVAL;
  4204	
  4205		k = &p->sighand->action[sig-1];
  4206	
  4207		spin_lock_irq(&p->sighand->siglock);
  4208		if (k->sa.sa_flags & SA_IMMUTABLE) {
  4209			spin_unlock_irq(&p->sighand->siglock);
  4210			return -EINVAL;
  4211		}
  4212		if (oact)
  4213			*oact = *k;
  4214	
  4215		/*
  4216		 * Make sure that we never accidentally claim to support SA_UNSUPPORTED,
  4217		 * e.g. by having an architecture use the bit in their uapi.
  4218		 */
  4219		BUILD_BUG_ON(UAPI_SA_FLAGS & SA_UNSUPPORTED);
  4220	
  4221		/*
  4222		 * Clear unknown flag bits in order to allow userspace to detect missing
  4223		 * support for flag bits and to allow the kernel to use non-uapi bits
  4224		 * internally.
  4225		 */
  4226		if (act)
  4227			act->sa.sa_flags &= UAPI_SA_FLAGS;
  4228		if (oact)
  4229			oact->sa.sa_flags &= UAPI_SA_FLAGS;
  4230	
  4231		sigaction_compat_abi(act, oact);
  4232	
  4233		if (act) {
  4234			bool was_ignored = k->sa.sa_handler == SIG_IGN;
  4235	
  4236			sigdelsetmask(&act->sa.sa_mask,
  4237				      sigmask(SIGKILL) | sigmask(SIGSTOP));
  4238			*k = *act;
  4239			/*
  4240			 * POSIX 3.3.1.3:
  4241			 *  "Setting a signal action to SIG_IGN for a signal that is
  4242			 *   pending shall cause the pending signal to be discarded,
  4243			 *   whether or not it is blocked."
  4244			 *
  4245			 *  "Setting a signal action to SIG_DFL for a signal that is
  4246			 *   pending and whose default action is to ignore the signal
  4247			 *   (for example, SIGCHLD), shall cause the pending signal to
  4248			 *   be discarded, whether or not it is blocked"
  4249			 */
  4250			if (sig_handler_ignored(sig_handler(p, sig), sig)) {
  4251				sigemptyset(&mask);
  4252				sigaddset(&mask, sig);
  4253				flush_sigqueue_mask(p, &mask, &p->signal->shared_pending);
  4254				for_each_thread(p, t)
  4255					flush_sigqueue_mask(t, &mask, &t->pending);
  4256			} else if (was_ignored) {
> 4257				posixtimer_sig_unignore(t, sig);
  4258			}
  4259		}
  4260	
  4261		spin_unlock_irq(&p->sighand->siglock);
  4262		return 0;
  4263	}
  4264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
