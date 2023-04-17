Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCC1110B;
	Mon, 17 Apr 2023 01:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681696169; x=1713232169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9NMR7qCrmCB/D1PJFwh8rCee5L5CGooUeOkuXrtNGWc=;
  b=a3eV+BGUV05/jhh7OoE+b5MCr0UgxfeIIVFHWieHq8NvhrUY4B9JsfDG
   r33isg//QJWWqrh2ZK1A9OXN2vZe+tqJwe2OzKajOz3kD+7uyWkUlN1ak
   qMNet8bKTI/UCKDXUi0dSjpe0AWF9S2gDergLNg6pbUr2hJEbQopPLurp
   C1qCOFLWD7TZbRzvUqpPVe4tPRKphHAIfmW97azi4P6bXQjSx/Jsdk4jn
   8wi3bo0yV/+DN2bKp9hQoRcAe3iZdVWbUbVKGd7fZunpXdyB8M2UlZqS4
   h1BzB2ESrChOI3syGYEOy2+Ho0nJWt1u/FAOW0kpWmzuGw3Ir9XCkDq1D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="333576702"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="333576702"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 18:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="723097143"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="723097143"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Apr 2023 18:49:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poDzi-000c1j-2Y;
	Mon, 17 Apr 2023 01:49:26 +0000
Date: Mon, 17 Apr 2023 09:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v7] sched: Fix performance regression introduced by
 mm_cid
Message-ID: <202304170947.E0GyNhr1-lkp@intel.com>
References: <20230416223217.191261-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230416223217.191261-1-mathieu.desnoyers@efficios.com>

Hi Mathieu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc7]
[cannot apply to tip/sched/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/sched-Fix-performance-regression-introduced-by-mm_cid/20230417-063345
patch link:    https://lore.kernel.org/r/20230416223217.191261-1-mathieu.desnoyers%40efficios.com
patch subject: [RFC PATCH v7] sched: Fix performance regression introduced by mm_cid
config: s390-randconfig-r024-20230417 (https://download.01.org/0day-ci/archive/20230417/202304170947.E0GyNhr1-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/3ab4bef6c0bd5b33395bbd475c423ba95b9763d6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mathieu-Desnoyers/sched-Fix-performance-regression-introduced-by-mm_cid/20230417-063345
        git checkout 3ab4bef6c0bd5b33395bbd475c423ba95b9763d6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304170947.E0GyNhr1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:33:
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
   In file included from kernel/sched/core.c:33:
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
   In file included from kernel/sched/core.c:33:
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
>> kernel/sched/core.c:11770:15: warning: variable 'next_scan' is uninitialized when used here [-Wuninitialized]
                           old_scan = next_scan;
                                      ^~~~~~~~~
   kernel/sched/core.c:11764:31: note: initialize the variable 'next_scan' to silence this warning
                   unsigned long res, next_scan;
                                               ^
                                                = 0
   kernel/sched/core.c:6448:20: warning: unused function 'sched_core_cpu_deactivate' [-Wunused-function]
   static inline void sched_core_cpu_deactivate(unsigned int cpu) {}
                      ^
   14 warnings generated.


vim +/next_scan +11770 kernel/sched/core.c

 11743	
 11744	static void task_mm_cid_work(struct callback_head *work)
 11745	{
 11746		struct task_struct *t = current;
 11747		struct mm_struct *mm;
 11748		int cpu;
 11749		unsigned long now = jiffies, old_scan, next_scan;
 11750		struct cpumask *cidmask;
 11751		int weight;
 11752	
 11753		SCHED_WARN_ON(t != container_of(work, struct task_struct, cid_work));
 11754	
 11755		work->next = work;	/* Prevent double-add */
 11756		if (t->flags & PF_EXITING)
 11757			return;
 11758		mm = t->mm;
 11759		if (!mm)
 11760			return;
 11761		old_scan = READ_ONCE(mm->mm_cid_next_scan);
 11762		next_scan = now + msecs_to_jiffies(MM_CID_SCAN_DELAY);
 11763		if (!old_scan) {
 11764			unsigned long res, next_scan;
 11765	
 11766			res = cmpxchg(&mm->mm_cid_next_scan, old_scan, next_scan);
 11767			if (res != old_scan)
 11768				old_scan = res;
 11769			else
 11770				old_scan = next_scan;
 11771		}
 11772		if (time_before(now, old_scan))
 11773			return;
 11774		if (!try_cmpxchg(&mm->mm_cid_next_scan, &old_scan, next_scan))
 11775			return;
 11776		cidmask = mm_cidmask(mm);
 11777		/* Clear cids that were not recently used. */
 11778		for_each_possible_cpu(cpu)
 11779			sched_mm_cid_remote_clear_old(mm, cpu);
 11780		weight = cpumask_weight(cidmask);
 11781		/*
 11782		 * Clear cids that are greater or equal to the cidmask weight to
 11783		 * recompact it.
 11784		 */
 11785		for_each_possible_cpu(cpu)
 11786			sched_mm_cid_remote_clear_weight(mm, cpu, weight);
 11787	}
 11788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
