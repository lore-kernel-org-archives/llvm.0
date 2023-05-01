Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA756362;
	Mon,  1 May 2023 01:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682904055; x=1714440055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3rvPZOWziF+isa4DSAjbVFuUIw1By16Sxx0S3fri0rQ=;
  b=F82qvUv3mabkM+gcyvfq/Kh2ob3cRl4hSZ118aP1jodXesluvpdbSQE3
   Ph2L37TF3xwzbaJ2Lk9GDVfGJr8I5nsjSPvgsFt9dfF6PRFAyWU6cow72
   U0QUu7DRoC1LsK0QsM9BrjzHCQ1Ot57M5K87lEIZwB8Klbm690OXcoXPm
   uFCrmMVzavrm/MX78oVgVq9+XBm50rZ20un/gGgXXDPVMc2S1832L7AW2
   I7UjOvA1s5LY2ZVO9rPun/SzJeBbKYT+HkdZoFQXZkpEavvh8tAO3WEUi
   2HcnlPHJ6Zcwm3yGVPoDMkTuObphoLEZBw8Ct4hQ0MUhz2ncPFOfOlt1K
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="434386765"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="434386765"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 18:20:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="726185700"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="726185700"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Apr 2023 18:20:53 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptIDk-0000EH-2C;
	Mon, 01 May 2023 01:20:52 +0000
Date: Mon, 1 May 2023 09:20:04 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/eevdf 14/31] kernel/sched/fair.c:6625:41: error:
 use of undeclared identifier 'sysctl_sched_miration_cost'; did you mean
 'sysctl_sched_migration_cost'?
Message-ID: <202305010905.YJehQwCO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/eevdf
head:   9569132375bb97144e975d018b87570ed12a7c99
commit: 50d21bf6811d6a091174cb13a4e7ad4566da7323 [14/31] sched/fair: Introduce SIS_CURRENT to wake up short task on current CPU
config: s390-buildonly-randconfig-r005-20230430 (https://download.01.org/0day-ci/archive/20230501/202305010905.YJehQwCO-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=50d21bf6811d6a091174cb13a4e7ad4566da7323
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/eevdf
        git checkout 50d21bf6811d6a091174cb13a4e7ad4566da7323
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010905.YJehQwCO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:38:
   In file included from include/linux/sched/isolation.h:6:
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
   In file included from kernel/sched/fair.c:38:
   In file included from include/linux/sched/isolation.h:6:
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
   In file included from kernel/sched/fair.c:38:
   In file included from include/linux/sched/isolation.h:6:
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
>> kernel/sched/fair.c:6625:41: error: use of undeclared identifier 'sysctl_sched_miration_cost'; did you mean 'sysctl_sched_migration_cost'?
           if (!p->se.avg_dur || p->se.avg_dur >= sysctl_sched_miration_cost)
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                                  sysctl_sched_migration_cost
   kernel/sched/fair.c:127:26: note: 'sysctl_sched_migration_cost' declared here
   const_debug unsigned int sysctl_sched_migration_cost    = 500000UL;
                            ^
   kernel/sched/fair.c:12044:6: warning: no previous prototype for function 'task_vruntime_update' [-Wmissing-prototypes]
   void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
        ^
   kernel/sched/fair.c:12044:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
   ^
   static 
   13 warnings and 1 error generated.


vim +6625 kernel/sched/fair.c

  6596	
  6597	/*
  6598	 * Wake up the task on current CPU, if the following conditions are met:
  6599	 *
  6600	 * 1. waker A is the only running task on this_cpu
  6601	 * 3. A is a short duration task (waker will fall asleep soon)
  6602	 * 4. wakee B is a short duration task (impact of B on A is minor)
  6603	 * 5. A and B wake up each other alternately
  6604	 */
  6605	static bool
  6606	wake_on_current(int this_cpu, struct task_struct *p)
  6607	{
  6608		if (!sched_feat(SIS_CURRENT))
  6609			return false;
  6610	
  6611		if (cpu_rq(this_cpu)->nr_running > 1)
  6612			return false;
  6613	
  6614		/*
  6615		 * If a task switches in and then voluntarily relinquishes the
  6616		 * CPU quickly, it is regarded as a short duration task. In that
  6617		 * way, the short waker is likely to relinquish the CPU soon, which
  6618		 * provides room for the wakee. Meanwhile, a short wakee would bring
  6619		 * minor impact to the target rq. Put the short waker and wakee together
  6620		 * bring benefit to cache-share task pairs and avoid migration overhead.
  6621		 */
  6622		if (!current->se.avg_dur || current->se.avg_dur >= sysctl_sched_migration_cost)
  6623			return false;
  6624	
> 6625		if (!p->se.avg_dur || p->se.avg_dur >= sysctl_sched_miration_cost)
  6626			return false;
  6627	
  6628		if (current->wakee_flips || p->wakee_flips)
  6629			return false;
  6630	
  6631		if (current->last_wakee != p || p->last_wakee != current)
  6632			return false;
  6633	
  6634		return true;
  6635	}
  6636	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
