Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201BD24500E;
	Wed, 28 May 2025 08:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419591; cv=none; b=DbotCuR2oDeZVrps5Ep88K/JjHnpu3TNzGtWoGNw5OyDd8G4EBhXxabdRNjUtd9aITTsSGxnnXZBmhhOLh6Ie/K8uQSfuwQiqKd48+/9G4rf1cQx2uJ1GAJFcHV7UznZtq6kfOEWljsv7ApVIOdNE6llK7vnHdsbJn16Rk3ONCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419591; c=relaxed/simple;
	bh=ygD1nvTqJTQVru5KHm5lf6zhytP0Amm0REBcK2Q5Ycs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BoCAqziPGGKnzU/AnJ5MZ+8B1M6R380tqnguE6jQn3QWRrL0V7H890j0+69i1riXwpdiLxEJlcjZO14yu60eeHz2zKDZ+6I2L06vnzWRCBNoJWKPVZqnMZ+QRv/zY6Ya6Wxqa057PjONHuRWK1G7xMvsqLj/SgjaQj08ac10jyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBegN5ZJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBegN5ZJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748419590; x=1779955590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ygD1nvTqJTQVru5KHm5lf6zhytP0Amm0REBcK2Q5Ycs=;
  b=ZBegN5ZJxNXFawwdHbokJg1qM9SUQQzAyDgXRlSHMlgo6FwgnYLoN064
   qUtC+0CcCf9tyL05JQnz0YZ4bVSK7F7/S5ZOERw1c9Fi3o+qtsKtJ7eNn
   HwGTaZlVh+X8jT8lZGLZ13fvlRJnIoyw2JI7dacmdaq8Iu1y3zr5QltK7
   i++i4c91SDs2BKDTzQ3D+zJBVMISVjnxAX6oYT4C2zJR1BNCoJyff/vrp
   FEZmzN9QPgk7nzAk2i8nnFRVPvtnuKWyKZdQb0ymnVimYtKT8V9PT53lQ
   MX4gOcCM17MnN2vaFn0/SggTOfpmo5DABA+wprJA25e8pxLg9N+rPUQtG
   g==;
X-CSE-ConnectionGUID: YYAj5EW2QV+IfYftP63Q0w==
X-CSE-MsgGUID: i4cOdy4GQKWkz9PS8HASWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50492433"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="50492433"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 01:06:30 -0700
X-CSE-ConnectionGUID: U8VeXT+zR+W+5DYGeyz6Xg==
X-CSE-MsgGUID: 7IlsCDJyStijxjElscPl4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="174164870"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 May 2025 01:06:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKBnu-000VPc-0a;
	Wed, 28 May 2025 08:06:26 +0000
Date: Wed, 28 May 2025 16:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:rpc-numa 1/2] net/sunrpc/svc.c:761:37: warning: variable
 'rqstp' is uninitialized when used here
Message-ID: <202505281507.DsEMM6Az-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git rpc-numa
head:   4fb548fc918eae3b330e50c56bae2a0b02b9b157
commit: a0d4dce2778e63a6410a5606d50a17426a4251fd [1/2] sunrpc: new tracepoints around thread wakeups
config: riscv-randconfig-002-20250528 (https://download.01.org/0day-ci/archive/20250528/202505281507.DsEMM6Az-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505281507.DsEMM6Az-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505281507.DsEMM6Az-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/sunrpc/svc.c:20:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:804:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     804 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from net/sunrpc/svc.c:20:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:812:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     812 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from net/sunrpc/svc.c:20:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     820 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from net/sunrpc/svc.c:20:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     829 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from net/sunrpc/svc.c:20:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from net/sunrpc/svc.c:20:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     847 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from net/sunrpc/svc.c:20:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> net/sunrpc/svc.c:761:37: warning: variable 'rqstp' is uninitialized when used here [-Wuninitialized]
     761 |         trace_svc_pool_thread_noidle(pool, rqstp->rq_task->pid);
         |                                            ^~~~~
   net/sunrpc/svc.c:742:24: note: initialize the variable 'rqstp' to silence this warning
     742 |         struct svc_rqst *rqstp;
         |                               ^
         |                                = NULL
   8 warnings generated.


vim +/rqstp +761 net/sunrpc/svc.c

   730	
   731	/**
   732	 * svc_pool_wake_idle_thread - Awaken an idle thread in @pool
   733	 * @pool: service thread pool
   734	 *
   735	 * Can be called from soft IRQ or process context. Finding an idle
   736	 * service thread and marking it BUSY is atomic with respect to
   737	 * other calls to svc_pool_wake_idle_thread().
   738	 *
   739	 */
   740	void svc_pool_wake_idle_thread(struct svc_pool *pool)
   741	{
   742		struct svc_rqst	*rqstp;
   743		struct llist_node *ln;
   744	
   745		rcu_read_lock();
   746		ln = READ_ONCE(pool->sp_idle_threads.first);
   747		if (ln) {
   748			rqstp = llist_entry(ln, struct svc_rqst, rq_idle);
   749			WRITE_ONCE(rqstp->rq_qtime, ktime_get());
   750			if (!task_is_running(rqstp->rq_task)) {
   751				wake_up_process(rqstp->rq_task);
   752				trace_svc_pool_thread_wake(pool, rqstp->rq_task->pid);
   753				percpu_counter_inc(&pool->sp_threads_woken);
   754			} else {
   755				trace_svc_pool_thread_running(pool, rqstp->rq_task->pid);
   756			}
   757			rcu_read_unlock();
   758			return;
   759		}
   760		rcu_read_unlock();
 > 761		trace_svc_pool_thread_noidle(pool, rqstp->rq_task->pid);
   762	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
