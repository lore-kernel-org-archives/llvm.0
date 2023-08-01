Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6961ADCA;
	Tue,  1 Aug 2023 15:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690904944; x=1722440944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ijHKWyxMDFX2U0gtiiQl9OLeh2+s4wzjS1aKzHDmD7Y=;
  b=UEtnMj82SfCDRJeYfzbzm1EHQrWcwfsvYPtsAnaduCELB7aazoIWiG+S
   +SUrzLWGsvuPkOIFIUsow+TfOKhPPfqXs881vJTL3Pb3pceifCLWEKlL1
   pxOEMIasI5grsbWxzXwOmyf5xAG6vVvh93I0yKF5vNXyA8IfojMqh5PSO
   pbxE42JtBQWWDV2CkQRrLuDW26ZPwaB8Fx/SQ2S+C7BDN3EGiUI/CMbzm
   87Gsh7TlB9URgIw9DDhEyPSk9Q+FTWY5e6okF0OP/59QqA3UWeFidOQJb
   +tPRE9IykENbpW+sLIsqcnLLJsA7gzcL7To2Lw0aadBZPExfydRcHljaV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="369330144"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="369330144"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 08:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="975358851"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="975358851"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Aug 2023 08:49:02 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQrcL-0000P5-0V;
	Tue, 01 Aug 2023 15:49:01 +0000
Date: Tue, 1 Aug 2023 23:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/softirq-preemptible 5/6]
 kernel/time/timer.c:1700:3: error: implicit declaration of function
 'local_bh_vec_disable' is invalid in C99
Message-ID: <202308012358.5V8YXhOZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/softirq-preemptible
head:   c233aee141ddb78d07b2f7311be38cfc286de654
commit: e54180a8daee54a469b182cd7e753d17e52394ef [5/6] timers: Introduce soft-interruptible timers
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230801/202308012358.5V8YXhOZ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308012358.5V8YXhOZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308012358.5V8YXhOZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/time/timer.c:21:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from kernel/time/timer.c:21:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/time/timer.c:21:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
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
>> kernel/time/timer.c:1700:3: error: implicit declaration of function 'local_bh_vec_disable' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   local_bh_vec_disable(1 << TIMER_SOFTIRQ);
                   ^
   kernel/time/timer.c:1700:3: note: did you mean 'local_bh_disable'?
   include/linux/bottom_half.h:18:20: note: 'local_bh_disable' declared here
   static inline void local_bh_disable(void)
                      ^
>> kernel/time/timer.c:1719:3: error: implicit declaration of function 'local_bh_vec_enable' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   local_bh_vec_enable(1 << TIMER_SOFTIRQ);
                   ^
   kernel/time/timer.c:1719:3: note: did you mean 'local_bh_enable'?
   include/linux/bottom_half.h:31:20: note: 'local_bh_enable' declared here
   static inline void local_bh_enable(void)
                      ^
   12 warnings and 2 errors generated.


vim +/local_bh_vec_disable +1700 kernel/time/timer.c

  1693	
  1694		if (IS_ENABLED(CONFIG_PREEMPT_RT) &&
  1695		    IS_ENABLED(CONFIG_ARCH_HAS_SOFTIRQ_DISABLED_MASK) &&
  1696		    timer->flags & TIMER_SOFTINTERRUPTIBLE)
  1697			softinterruptible = true;
  1698	
  1699		if (softinterruptible) {
> 1700			local_bh_vec_disable(1 << TIMER_SOFTIRQ);
  1701			local_bh_exit();
  1702		}
  1703	
  1704		/*
  1705		 * Couple the lock chain with the lock chain at
  1706		 * timer_delete_sync() by acquiring the lock_map around the fn()
  1707		 * call here and in timer_delete_sync().
  1708		 */
  1709		lock_map_acquire(&lockdep_map);
  1710	
  1711		trace_timer_expire_entry(timer, baseclk);
  1712		fn(timer);
  1713		trace_timer_expire_exit(timer);
  1714	
  1715		lock_map_release(&lockdep_map);
  1716	
  1717		if (softinterruptible) {
  1718			local_bh_enter();
> 1719			local_bh_vec_enable(1 << TIMER_SOFTIRQ);
  1720		}
  1721	
  1722	
  1723		if (count != preempt_count()) {
  1724			WARN_ONCE(1, "timer: %pS preempt leak: %08x -> %08x\n",
  1725				  fn, count, preempt_count());
  1726			/*
  1727			 * Restore the preempt count. That gives us a decent
  1728			 * chance to survive and extract information. If the
  1729			 * callback kept a lock held, bad luck, but not worse
  1730			 * than the BUG() we had.
  1731			 */
  1732			preempt_count_set(count);
  1733		}
  1734	}
  1735	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
