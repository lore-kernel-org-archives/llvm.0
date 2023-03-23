Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AC617F6;
	Thu, 23 Mar 2023 04:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679545270; x=1711081270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jXeYGLUBnGvzUJdFqYvvM4UkKddze27+xNK0kkr5RK4=;
  b=Nxk4cu4aj9jY0Ql/omA0UJ+1uL3oE7D5CbxBgRnPduHo6d0IkLgFd9PA
   Ns5iHOG0gye1QN0TDpf2+Yex7JtniDBuXMcB54ZjrRbYaaqmR8c566rx/
   jsEk5h+S093dQH8COPG9IW5Z4NgNxGj2XH6rqFzLRU2UNDWnZGcGlvJ6n
   MQ1tCpAoKG6qK9HV8Mm5WTkd+J5OGvYQo7v/wMkFeU0TlaqLEXgja31F/
   Eq1ooca2FzAIPD3MWq8xWh0YzxmpMUbzsa3Hy+7CYeOix28QUr8c9tdJP
   XB3HNYv7oEnbJ8IdPgLkxrbFGiyjBupx+7y1pUXOsTxzcNwVNJknMTfiB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327771975"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="327771975"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 21:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="714654166"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="714654166"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Mar 2023 21:21:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfCRn-000Dwr-35;
	Thu, 23 Mar 2023 04:21:07 +0000
Date: Thu, 23 Mar 2023 12:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [peterz-queue:smp/core 6/12] arch/arm/kernel/smp.c:534:37: error:
 expected ';' after top level declarator
Message-ID: <202303231230.unCCgMDv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git smp/core
head:   74a78c26e097e9dd14b898429103d6a312fe1d5c
commit: e8dcc7199a6e0a579d834174dabaee97af67ceea [6/12] sched, smp: Trace IPIs sent via send_call_function_single_ipi()
config: arm-randconfig-r013-20230322 (https://download.01.org/0day-ci/archive/20230323/202303231230.unCCgMDv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=e8dcc7199a6e0a579d834174dabaee97af67ceea
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue smp/core
        git checkout e8dcc7199a6e0a579d834174dabaee97af67ceea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231230.unCCgMDv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/kernel/smp.c:534:37: error: expected ';' after top level declarator
   static const char *ipi_types[NR_IPI] __tracepoint_string = {
                                       ^
                                       ;
>> arch/arm/kernel/smp.c:638:3: error: call to undeclared function 'trace_ipi_entry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   trace_ipi_entry(ipi_types[ipinr]);
                   ^
   arch/arm/kernel/smp.c:638:3: note: did you mean 'ftrace_nmi_enter'?
   include/linux/ftrace_irq.h:15:20: note: 'ftrace_nmi_enter' declared here
   static inline void ftrace_nmi_enter(void)
                      ^
>> arch/arm/kernel/smp.c:685:3: error: call to undeclared function 'trace_ipi_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   trace_ipi_exit(ipi_types[ipinr]);
                   ^
   arch/arm/kernel/smp.c:685:3: note: did you mean 'ftrace_nmi_exit'?
   include/linux/ftrace_irq.h:27:20: note: 'ftrace_nmi_exit' declared here
   static inline void ftrace_nmi_exit(void)
                      ^
>> arch/arm/kernel/smp.c:708:2: error: call to undeclared function 'trace_ipi_raise'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           trace_ipi_raise(target, ipi_types[ipinr]);
           ^
   4 errors generated.


vim +534 arch/arm/kernel/smp.c

^1da177e4c3f41 Linus Torvalds       2005-04-16  533  
365ec7b1732732 Nicolas Pitre        2014-07-25 @534  static const char *ipi_types[NR_IPI] __tracepoint_string = {
27bde183b0d3b0 Anshuman Khandual    2020-11-30  535  	[IPI_WAKEUP]		= "CPU wakeup interrupts",
27bde183b0d3b0 Anshuman Khandual    2020-11-30  536  	[IPI_TIMER]		= "Timer broadcast interrupts",
27bde183b0d3b0 Anshuman Khandual    2020-11-30  537  	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
27bde183b0d3b0 Anshuman Khandual    2020-11-30  538  	[IPI_CALL_FUNC]		= "Function call interrupts",
27bde183b0d3b0 Anshuman Khandual    2020-11-30  539  	[IPI_CPU_STOP]		= "CPU stop interrupts",
27bde183b0d3b0 Anshuman Khandual    2020-11-30  540  	[IPI_IRQ_WORK]		= "IRQ work interrupts",
27bde183b0d3b0 Anshuman Khandual    2020-11-30  541  	[IPI_COMPLETION]	= "completion interrupts",
4a88abd7b48e8e Russell King         2010-11-15  542  };
4a88abd7b48e8e Russell King         2010-11-15  543  
8aa837cb7a0328 Marc Zyngier         2020-06-22  544  static void smp_cross_call(const struct cpumask *target, unsigned int ipinr);
365ec7b1732732 Nicolas Pitre        2014-07-25  545  
f13cd4170ee789 Russell King         2010-11-15  546  void show_ipi_list(struct seq_file *p, int prec)
^1da177e4c3f41 Linus Torvalds       2005-04-16  547  {
4a88abd7b48e8e Russell King         2010-11-15  548  	unsigned int cpu, i;
^1da177e4c3f41 Linus Torvalds       2005-04-16  549  
4a88abd7b48e8e Russell King         2010-11-15  550  	for (i = 0; i < NR_IPI; i++) {
220387048d8598 Marc Zyngier         2020-09-25  551  		if (!ipi_desc[i])
220387048d8598 Marc Zyngier         2020-09-25  552  			continue;
220387048d8598 Marc Zyngier         2020-09-25  553  
4a88abd7b48e8e Russell King         2010-11-15  554  		seq_printf(p, "%*s%u: ", prec - 1, "IPI", i);
^1da177e4c3f41 Linus Torvalds       2005-04-16  555  
026b7c6bf0bf04 Nicolas Pitre        2012-12-03  556  		for_each_online_cpu(cpu)
88c637748e3176 Thomas Gleixner      2020-12-10  557  			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
^1da177e4c3f41 Linus Torvalds       2005-04-16  558  
4a88abd7b48e8e Russell King         2010-11-15  559  		seq_printf(p, " %s\n", ipi_types[i]);
4a88abd7b48e8e Russell King         2010-11-15  560  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  561  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  562  
365ec7b1732732 Nicolas Pitre        2014-07-25  563  void arch_send_call_function_ipi_mask(const struct cpumask *mask)
365ec7b1732732 Nicolas Pitre        2014-07-25  564  {
365ec7b1732732 Nicolas Pitre        2014-07-25  565  	smp_cross_call(mask, IPI_CALL_FUNC);
365ec7b1732732 Nicolas Pitre        2014-07-25  566  }
365ec7b1732732 Nicolas Pitre        2014-07-25  567  
365ec7b1732732 Nicolas Pitre        2014-07-25  568  void arch_send_wakeup_ipi_mask(const struct cpumask *mask)
365ec7b1732732 Nicolas Pitre        2014-07-25  569  {
365ec7b1732732 Nicolas Pitre        2014-07-25  570  	smp_cross_call(mask, IPI_WAKEUP);
365ec7b1732732 Nicolas Pitre        2014-07-25  571  }
365ec7b1732732 Nicolas Pitre        2014-07-25  572  
365ec7b1732732 Nicolas Pitre        2014-07-25  573  void arch_send_call_function_single_ipi(int cpu)
365ec7b1732732 Nicolas Pitre        2014-07-25  574  {
89d798b73dc64b Marc Zyngier         2015-12-18  575  	smp_cross_call(cpumask_of(cpu), IPI_CALL_FUNC);
365ec7b1732732 Nicolas Pitre        2014-07-25  576  }
365ec7b1732732 Nicolas Pitre        2014-07-25  577  
365ec7b1732732 Nicolas Pitre        2014-07-25  578  #ifdef CONFIG_IRQ_WORK
365ec7b1732732 Nicolas Pitre        2014-07-25  579  void arch_irq_work_raise(void)
365ec7b1732732 Nicolas Pitre        2014-07-25  580  {
09f6edd424218e Frederic Weisbecker  2014-08-16  581  	if (arch_irq_work_has_interrupt())
365ec7b1732732 Nicolas Pitre        2014-07-25  582  		smp_cross_call(cpumask_of(smp_processor_id()), IPI_IRQ_WORK);
365ec7b1732732 Nicolas Pitre        2014-07-25  583  }
365ec7b1732732 Nicolas Pitre        2014-07-25  584  #endif
365ec7b1732732 Nicolas Pitre        2014-07-25  585  
bc28248ee25e5c Russell King         2009-05-17  586  #ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
3d06770eef43ea Mark Rutland         2012-10-30  587  void tick_broadcast(const struct cpumask *mask)
bc28248ee25e5c Russell King         2009-05-17  588  {
e3fbb087650df1 Russell King         2010-12-20  589  	smp_cross_call(mask, IPI_TIMER);
bc28248ee25e5c Russell King         2009-05-17  590  }
5388a6b266e9c3 Russell King         2010-07-26  591  #endif
bc28248ee25e5c Russell King         2009-05-17  592  
bd31b85960a7fc Thomas Gleixner      2009-07-03  593  static DEFINE_RAW_SPINLOCK(stop_lock);
^1da177e4c3f41 Linus Torvalds       2005-04-16  594  
^1da177e4c3f41 Linus Torvalds       2005-04-16  595  /*
^1da177e4c3f41 Linus Torvalds       2005-04-16  596   * ipi_cpu_stop - handle IPI from smp_send_stop()
^1da177e4c3f41 Linus Torvalds       2005-04-16  597   */
^1da177e4c3f41 Linus Torvalds       2005-04-16  598  static void ipi_cpu_stop(unsigned int cpu)
^1da177e4c3f41 Linus Torvalds       2005-04-16  599  {
8fc0b333a7dd9b Guilherme G. Piccoli 2022-10-17  600  	local_fiq_disable();
8fc0b333a7dd9b Guilherme G. Piccoli 2022-10-17  601  
5976a66913a8bf Thomas Gleixner      2017-05-16  602  	if (system_state <= SYSTEM_RUNNING) {
bd31b85960a7fc Thomas Gleixner      2009-07-03  603  		raw_spin_lock(&stop_lock);
4ed89f22280614 Russell King         2014-10-28  604  		pr_crit("CPU%u: stopping\n", cpu);
^1da177e4c3f41 Linus Torvalds       2005-04-16  605  		dump_stack();
bd31b85960a7fc Thomas Gleixner      2009-07-03  606  		raw_spin_unlock(&stop_lock);
3d3f78d752bfad Russell King         2010-07-26  607  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  608  
e03cdade0ca945 Russell King         2009-05-28  609  	set_cpu_online(cpu, false);
^1da177e4c3f41 Linus Torvalds       2005-04-16  610  
5388a5b82199fa Russell King         2018-04-10  611  	while (1) {
^1da177e4c3f41 Linus Torvalds       2005-04-16  612  		cpu_relax();
5388a5b82199fa Russell King         2018-04-10  613  		wfe();
5388a5b82199fa Russell King         2018-04-10  614  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  615  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  616  
5135d875e1457e Nicolas Pitre        2012-11-27  617  static DEFINE_PER_CPU(struct completion *, cpu_completion);
5135d875e1457e Nicolas Pitre        2012-11-27  618  
5135d875e1457e Nicolas Pitre        2012-11-27  619  int register_ipi_completion(struct completion *completion, int cpu)
5135d875e1457e Nicolas Pitre        2012-11-27  620  {
5135d875e1457e Nicolas Pitre        2012-11-27  621  	per_cpu(cpu_completion, cpu) = completion;
5135d875e1457e Nicolas Pitre        2012-11-27  622  	return IPI_COMPLETION;
5135d875e1457e Nicolas Pitre        2012-11-27  623  }
5135d875e1457e Nicolas Pitre        2012-11-27  624  
5135d875e1457e Nicolas Pitre        2012-11-27  625  static void ipi_complete(unsigned int cpu)
5135d875e1457e Nicolas Pitre        2012-11-27  626  {
5135d875e1457e Nicolas Pitre        2012-11-27  627  	complete(per_cpu(cpu_completion, cpu));
5135d875e1457e Nicolas Pitre        2012-11-27  628  }
5135d875e1457e Nicolas Pitre        2012-11-27  629  
^1da177e4c3f41 Linus Torvalds       2005-04-16  630  /*
^1da177e4c3f41 Linus Torvalds       2005-04-16  631   * Main handler for inter-processor interrupts
^1da177e4c3f41 Linus Torvalds       2005-04-16  632   */
56afcd3dbd1995 Marc Zyngier         2020-06-23  633  static void do_handle_IPI(int ipinr)
^1da177e4c3f41 Linus Torvalds       2005-04-16  634  {
^1da177e4c3f41 Linus Torvalds       2005-04-16  635  	unsigned int cpu = smp_processor_id();
^1da177e4c3f41 Linus Torvalds       2005-04-16  636  
5ebf353af22c89 Marc Zyngier         2020-06-23  637  	if ((unsigned)ipinr < NR_IPI)
08a56e07cd3cb9 Peter Zijlstra       2023-01-12 @638  		trace_ipi_entry(ipi_types[ipinr]);
^1da177e4c3f41 Linus Torvalds       2005-04-16  639  
24480d980e9063 Russell King         2010-11-15  640  	switch (ipinr) {
559a593905e583 Stephen Boyd         2012-09-19  641  	case IPI_WAKEUP:
559a593905e583 Stephen Boyd         2012-09-19  642  		break;
559a593905e583 Stephen Boyd         2012-09-19  643  
e2c501190c7d4b Mark Rutland         2012-10-30  644  #ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
^1da177e4c3f41 Linus Torvalds       2005-04-16  645  	case IPI_TIMER:
e2c501190c7d4b Mark Rutland         2012-10-30  646  		tick_receive_broadcast();
^1da177e4c3f41 Linus Torvalds       2005-04-16  647  		break;
e2c501190c7d4b Mark Rutland         2012-10-30  648  #endif
^1da177e4c3f41 Linus Torvalds       2005-04-16  649  
^1da177e4c3f41 Linus Torvalds       2005-04-16  650  	case IPI_RESCHEDULE:
184748cc50b2dc Peter Zijlstra       2011-04-05  651  		scheduler_ipi();
^1da177e4c3f41 Linus Torvalds       2005-04-16  652  		break;
^1da177e4c3f41 Linus Torvalds       2005-04-16  653  
^1da177e4c3f41 Linus Torvalds       2005-04-16  654  	case IPI_CALL_FUNC:
f6dd9fa5a75a3d Jens Axboe           2008-06-10  655  		generic_smp_call_function_interrupt();
f6dd9fa5a75a3d Jens Axboe           2008-06-10  656  		break;
^1da177e4c3f41 Linus Torvalds       2005-04-16  657  
^1da177e4c3f41 Linus Torvalds       2005-04-16  658  	case IPI_CPU_STOP:
^1da177e4c3f41 Linus Torvalds       2005-04-16  659  		ipi_cpu_stop(cpu);
^1da177e4c3f41 Linus Torvalds       2005-04-16  660  		break;
^1da177e4c3f41 Linus Torvalds       2005-04-16  661  
bf18525fd79310 Stephen Boyd         2013-10-29  662  #ifdef CONFIG_IRQ_WORK
bf18525fd79310 Stephen Boyd         2013-10-29  663  	case IPI_IRQ_WORK:
bf18525fd79310 Stephen Boyd         2013-10-29  664  		irq_work_run();
bf18525fd79310 Stephen Boyd         2013-10-29  665  		break;
bf18525fd79310 Stephen Boyd         2013-10-29  666  #endif
bf18525fd79310 Stephen Boyd         2013-10-29  667  
5135d875e1457e Nicolas Pitre        2012-11-27  668  	case IPI_COMPLETION:
5135d875e1457e Nicolas Pitre        2012-11-27  669  		ipi_complete(cpu);
5135d875e1457e Nicolas Pitre        2012-11-27  670  		break;
5135d875e1457e Nicolas Pitre        2012-11-27  671  
96f0e00378d4a1 Russell King         2014-09-03  672  	case IPI_CPU_BACKTRACE:
85e3e7fbbb720b John Ogness          2021-07-15  673  		printk_deferred_enter();
56afcd3dbd1995 Marc Zyngier         2020-06-23  674  		nmi_cpu_backtrace(get_irq_regs());
85e3e7fbbb720b John Ogness          2021-07-15  675  		printk_deferred_exit();
96f0e00378d4a1 Russell King         2014-09-03  676  		break;
96f0e00378d4a1 Russell King         2014-09-03  677  
^1da177e4c3f41 Linus Torvalds       2005-04-16  678  	default:
4ed89f22280614 Russell King         2014-10-28  679  		pr_crit("CPU%u: Unknown IPI message 0x%x\n",
24480d980e9063 Russell King         2010-11-15  680  		        cpu, ipinr);
^1da177e4c3f41 Linus Torvalds       2005-04-16  681  		break;
^1da177e4c3f41 Linus Torvalds       2005-04-16  682  	}
365ec7b1732732 Nicolas Pitre        2014-07-25  683  
365ec7b1732732 Nicolas Pitre        2014-07-25  684  	if ((unsigned)ipinr < NR_IPI)
08a56e07cd3cb9 Peter Zijlstra       2023-01-12 @685  		trace_ipi_exit(ipi_types[ipinr]);
56afcd3dbd1995 Marc Zyngier         2020-06-23  686  }
56afcd3dbd1995 Marc Zyngier         2020-06-23  687  
56afcd3dbd1995 Marc Zyngier         2020-06-23  688  /* Legacy version, should go away once all irqchips have been converted */
56afcd3dbd1995 Marc Zyngier         2020-06-23  689  void handle_IPI(int ipinr, struct pt_regs *regs)
56afcd3dbd1995 Marc Zyngier         2020-06-23  690  {
56afcd3dbd1995 Marc Zyngier         2020-06-23  691  	struct pt_regs *old_regs = set_irq_regs(regs);
56afcd3dbd1995 Marc Zyngier         2020-06-23  692  
56afcd3dbd1995 Marc Zyngier         2020-06-23  693  	irq_enter();
56afcd3dbd1995 Marc Zyngier         2020-06-23  694  	do_handle_IPI(ipinr);
56afcd3dbd1995 Marc Zyngier         2020-06-23  695  	irq_exit();
56afcd3dbd1995 Marc Zyngier         2020-06-23  696  
c97d4869a23c43 Russell King         2006-10-25  697  	set_irq_regs(old_regs);
^1da177e4c3f41 Linus Torvalds       2005-04-16  698  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  699  
56afcd3dbd1995 Marc Zyngier         2020-06-23  700  static irqreturn_t ipi_handler(int irq, void *data)
56afcd3dbd1995 Marc Zyngier         2020-06-23  701  {
56afcd3dbd1995 Marc Zyngier         2020-06-23  702  	do_handle_IPI(irq - ipi_irq_base);
56afcd3dbd1995 Marc Zyngier         2020-06-23  703  	return IRQ_HANDLED;
56afcd3dbd1995 Marc Zyngier         2020-06-23  704  }
56afcd3dbd1995 Marc Zyngier         2020-06-23  705  
8aa837cb7a0328 Marc Zyngier         2020-06-22  706  static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
56afcd3dbd1995 Marc Zyngier         2020-06-23  707  {
08a56e07cd3cb9 Peter Zijlstra       2023-01-12 @708  	trace_ipi_raise(target, ipi_types[ipinr]);
8aa837cb7a0328 Marc Zyngier         2020-06-22  709  	__ipi_send_mask(ipi_desc[ipinr], target);
56afcd3dbd1995 Marc Zyngier         2020-06-23  710  }
56afcd3dbd1995 Marc Zyngier         2020-06-23  711  

:::::: The code at line 534 was first introduced by commit
:::::: 365ec7b17327329efc71276722ca8db3f21f2edd ARM: add IPI tracepoints

:::::: TO: Nicolas Pitre <nicolas.pitre@linaro.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
