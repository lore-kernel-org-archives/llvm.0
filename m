Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94DC15A2;
	Sat, 29 Jul 2023 04:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690604111; x=1722140111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6JjkIB1til5iATvizLRxylhLnofc2vlREGqZ0dcjo0w=;
  b=OlqheQLn4sCwiIqfBgwqO8OLf7TORRLNjUpQYSbdzjDQJvAQAR1sjEBg
   O0VtEut93TR87yH9Fznk4aLR0jNYCkGdla/dngx8xwh/rRIhWfPXSDgt2
   Vgvfj4mD75Xmk/oDCy5ET3aVhAS6Gt76CE/rR5vR4Bbw/DXtomyk0W8FO
   1RdshefeEDjEtR8DFT2wzd+6BL5E0lbyHo4+tYunVv2yPyNMLFwb5OL8U
   vvKgbgqxLEKZU0FdbnuVYFft0HRI0g8BgcfhMMciFnt/L2cX/lyqHWkXT
   jicz93JU2r8agEK4685darJdoIj0tnVAu/rxSwnIPsi6ud5Zx+ceGL/ik
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="367611482"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="367611482"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 21:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="901515511"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="901515511"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 28 Jul 2023 21:15:08 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPbM5-0003oj-1m;
	Sat, 29 Jul 2023 04:15:02 +0000
Date: Sat, 29 Jul 2023 12:14:42 +0800
From: kernel test robot <lkp@intel.com>
To: Martin KaFai Lau <martin.lau@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Martin KaFai Lau <martin.lau@linux.dev>
Subject: [martin-lau-bpf-next:tcx_warn_dbg 1/1]
 net/sched/sch_generic.c:1146:4: warning: format specifies type 'unsigned
 long' but the argument has type 'int'
Message-ID: <202307291227.ci4Th2Ua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/martin.lau/bpf-next.git tcx_warn_dbg
head:   60e4b66be28ba06cc6c12d45f741e2ff760ed18f
commit: 607f95d32fb730e23c398b33976594cd41dedd10 [1/1] dbg print for tcx warn splat
config: riscv-randconfig-r025-20230728 (https://download.01.org/0day-ci/archive/20230729/202307291227.ci4Th2Ua-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291227.ci4Th2Ua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291227.ci4Th2Ua-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:751:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
   #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from net/sched/sch_generic.c:17:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:759:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
   #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from net/sched/sch_generic.c:17:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:768:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
   #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from net/sched/sch_generic.c:17:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:777:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
   #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from net/sched/sch_generic.c:17:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:786:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
   #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from net/sched/sch_generic.c:17:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1134:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> net/sched/sch_generic.c:1146:4: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
                           dev_ingress_queue(dev) == dev_queue ? 0xdead : dev_queue - &dev->_tx[0],
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:528:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                   ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   14 warnings generated.


vim +1146 net/sched/sch_generic.c

  1131	
  1132	static void shutdown_scheduler_queue(struct net_device *dev,
  1133					     struct netdev_queue *dev_queue,
  1134					     void *_qdisc_default)
  1135	{
  1136		struct Qdisc *qdisc = rtnl_dereference(dev_queue->qdisc_sleeping);
  1137		struct Qdisc *qdisc_default = _qdisc_default;
  1138	
  1139		if (qdisc) {
  1140			rcu_assign_pointer(dev_queue->qdisc, qdisc_default);
  1141			rcu_assign_pointer(dev_queue->qdisc_sleeping, qdisc_default);
  1142	
  1143			qdisc_put(qdisc);
  1144			pr_info("%s dev %s %lx txq %lx qdisc %lx refcnt %d\n",
  1145				__func__, dev->name, (long)dev,
> 1146				dev_ingress_queue(dev) == dev_queue ? 0xdead : dev_queue - &dev->_tx[0],
  1147				(long)qdisc->dev_queue, refcount_read(&qdisc->refcnt));
  1148		}
  1149	}
  1150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
