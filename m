Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649F97E
	for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 08:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661328241; x=1692864241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iqSZQ3NiVJWhpIJm/QA3YsSHn2PhwlnuDTmZ/d+c01o=;
  b=l3UN08KHWqO9Yc7aZ8bhI89C5MtSsy48RQurGfGXClSSta9DGTYbSbM9
   Yi6pnQHFeiEUR7d0V7PaMQeHXfZYRy1S3Hp6xNCKhg6DOWvgUHjSN6Ow9
   2/nrOKMl5XjkNStkuNkdGDIFh+hYbabJmHgPfzvpk459EvitYGCAqJK6h
   3O75rEbWCudVU4Aru9ZXv+g7xKeqCNbV7EO15Oa9tXNp1LHxu1YbJA3IW
   Xq47iuXNcK3u50TVhxYlg1v6F/P2gt4w8K4fPM2Qoh+/M3MR9qnHFFonZ
   k9XmFrYhNYNHcFYeqY0Yf6dKdtsvbtAAG7T9Zwk0992yQeBlfqM+RM+fJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="274286197"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="274286197"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2022 01:04:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="612713965"
Received: from lkp-server02.sh.intel.com (HELO 34e741d32628) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 24 Aug 2022 01:03:57 -0700
Received: from kbuild by 34e741d32628 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oQlMi-00005L-1U;
	Wed, 24 Aug 2022 08:03:56 +0000
Date: Wed, 24 Aug 2022 16:03:07 +0800
From: kernel test robot <lkp@intel.com>
To: John Stultz <jstultz@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC][PATCH v2 1/2] sched: Avoid placing RT threads on cores
 handling long softirqs
Message-ID: <202208241540.4avi4iGS-lkp@intel.com>
References: <20220822190501.2171100-2-jstultz@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822190501.2171100-2-jstultz@google.com>

Hi John,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v6.0-rc2 next-20220824]
[cannot apply to tip/sched/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Stultz/Softirq-rt-Optimizations/20220823-030642
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 072e51356cd5a4a1c12c1020bc054c99b98333df
config: s390-randconfig-r003-20220824 (https://download.01.org/0day-ci/archive/20220824/202208241540.4avi4iGS-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project d00e97df0fe8c67f694c4d027297f4382ce72b38)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/1d1c0ba7867315d6327259cbf7a561248330038b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review John-Stultz/Softirq-rt-Optimizations/20220823-030642
        git checkout 1d1c0ba7867315d6327259cbf7a561248330038b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:34:
   In file included from kernel/sched/sched.h:63:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
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
   In file included from kernel/sched/build_policy.c:34:
   In file included from kernel/sched/sched.h:63:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
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
   In file included from kernel/sched/build_policy.c:34:
   In file included from kernel/sched/sched.h:63:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
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
   In file included from kernel/sched/build_policy.c:45:
>> kernel/sched/rt.c:1612:33: error: no member named '__softirq_pending' in 'struct irq_stat'
                          per_cpu(irq_stat, cpu).__softirq_pending;
                          ~~~~~~~~~~~~~~~~~~~~~~ ^
   12 warnings and 1 error generated.


vim +1612 kernel/sched/rt.c

  1601	
  1602	#ifdef CONFIG_RT_SOFTIRQ_OPTIMIZATION
  1603	/*
  1604	 * Return whether the task on the given cpu is currently non-preemptible
  1605	 * while handling a potentially long softirq, or if the task is likely
  1606	 * to block preemptions soon because it is a ksoftirq thread that is
  1607	 * handling slow softirq.
  1608	 */
  1609	static bool task_may_preempt(struct task_struct *task, int cpu)
  1610	{
  1611		u32 softirqs = per_cpu(active_softirqs, cpu) |
> 1612			       per_cpu(irq_stat, cpu).__softirq_pending;
  1613	
  1614		struct task_struct *cpu_ksoftirqd = per_cpu(ksoftirqd, cpu);
  1615		struct task_struct *curr;
  1616		struct rq *rq = cpu_rq(cpu);
  1617		int ret;
  1618	
  1619		rcu_read_lock();
  1620		curr = READ_ONCE(rq->curr); /* unlocked access */
  1621		ret = !((softirqs & LONG_SOFTIRQ_MASK) &&
  1622			 (curr == cpu_ksoftirqd ||
  1623			  preempt_count() & SOFTIRQ_MASK));
  1624		rcu_read_unlock();
  1625		return ret;
  1626	}
  1627	#else
  1628	static bool task_may_preempt(struct task_struct *task, int cpu)
  1629	{
  1630		return true;
  1631	}
  1632	#endif /* CONFIG_RT_SOFTIRQ_OPTIMIZATION */
  1633	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
