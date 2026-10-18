Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BE93DB632;
	Sun, 18 Oct 2026 17:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345883; cv=none; b=K01f0kWBCy0/ckSO1l/mHbWhyrQwquNJUXVX/VNhpKPGJIT9JhVDCGPCPn+EwkXrjzCCyFyyqodhisOJ2TYbnu+E3Qf6USSS20HGj0cCwEsVYVoj5FbDqRVZFF5zx6adLVTUJKLzkMT1Y2Cpct4JtMFJEf0G75Imv9hKz75Cxhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345883; c=relaxed/simple;
	bh=f3HoZjkSCwkivOhFulLxrMOZ92s6GDAwTu4EWmDFzd0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kyOoI3hHoUBfDdq2rmk74SylQ8yplZ6FB1VcmbdhhlWA9pNpmqeXxD8EEYJueeH7ujsyxWNLgwqLIb6oLxSJPaGIYrspy/gbgKJTgjanemzGIiDfTArGKEB5Dign348rPCyNZShqYvH1F/G48v5qFjQ8LyVDGPnDHu57bUEp6yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEFcPIkt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEFcPIkt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792345877; x=1823881877;
  h=date:from:to:cc:subject:message-id;
  bh=f3HoZjkSCwkivOhFulLxrMOZ92s6GDAwTu4EWmDFzd0=;
  b=aEFcPIkt95z4Wx/acRE+dusf69f2K9RO8J2VJPy9dAe9lYumdstCxBin
   TXKtsgY1k3wI0PCoHTxcCiYICdT2ILEw81kGbw5EwkZbAU6Woy5yGke7x
   t+8I112lLCmRVSyE4Ybog1bl1+XaiCliCgfgLtooptnmuGET/FIe2rP7f
   6+WWr13GCAwUBgikU6P/TH+LWPS0lhgQ2h728i3SruoClUxvaTi5TSfa/
   XujZIWFQDvNnhGg1Kwo9ezsmz6m1nYKttXA1BD1z6s5hEhs2Nk3zuTc95
   vK9WsQjkJuZi796tTheKj76SeyNSD8poVdblerGIGvKZZ63H8p1vdM9u1
   g==;
X-CSE-ConnectionGUID: 7aps9+ikQSWE5ZPwzWKwdA==
X-CSE-MsgGUID: 2RU6uksnRlaJQ+ugT1yTZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1145178"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1145178"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 10:51:16 -0700
X-CSE-ConnectionGUID: z4/c/RUmQkSHizhoBCHruw==
X-CSE-MsgGUID: /tq2fNciQSm5hF58ShHyjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2338034"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Oct 2026 10:51:15 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIV2P-00000000KfK-0Xqp;
	Sun, 18 Oct 2026 17:51:13 +0000
Date: Mon, 19 Oct 2026 01:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss 28/32] kernel/sched/core.c:5538:16: error:
 invalid operand for instruction
Message-ID: <202610190133.k55LhRgM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss
head:   1b2e2aefa6c7e3d15fac1b25a971b2d2cc3b697d
commit: 22dda6f23b24026b5b1e1e6f968e73f64da9b848 [28/32] kss-debug-empty-ssp
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20261019/202610190133.k55LhRgM-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190133.k55LhRgM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190133.k55LhRgM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:5538:16: error: invalid operand for instruction
    5538 |                 asm volatile("rdsspq %0" : "+r" (ssp));
         |                              ^
   <inline asm>:1:9: note: instantiated into assembly here
       1 |         rdsspq %ecx
         |                ^~~~
   1 error generated.


vim +5538 kernel/sched/core.c

  5469	
  5470	/*
  5471	 * context_switch - switch to the new MM and the new thread's register state.
  5472	 */
  5473	static __always_inline struct rq *
  5474	context_switch(struct rq *rq, struct task_struct *prev,
  5475		       struct task_struct *next, struct rq_flags *rf)
  5476		__releases(__rq_lockp(rq))
  5477	{
  5478		prepare_task_switch(rq, prev, next);
  5479	
  5480		/*
  5481		 * For paravirt, this is coupled with an exit in switch_to to
  5482		 * combine the page table reload and the switch backend into
  5483		 * one hypercall.
  5484		 */
  5485		arch_start_context_switch(prev);
  5486	
  5487		/*
  5488		 * kernel -> kernel   lazy + transfer active
  5489		 *   user -> kernel   lazy + mmgrab_lazy_tlb() active
  5490		 *
  5491		 * kernel ->   user   switch + mmdrop_lazy_tlb() active
  5492		 *   user ->   user   switch
  5493		 */
  5494		if (!next->mm) {				// to kernel
  5495			enter_lazy_tlb(prev->active_mm, next);
  5496	
  5497			next->active_mm = prev->active_mm;
  5498			if (prev->mm)				// from user
  5499				mmgrab_lazy_tlb(prev->active_mm);
  5500			else
  5501				prev->active_mm = NULL;
  5502		} else {					// to user
  5503			membarrier_switch_mm(rq, prev->active_mm, next->mm);
  5504			/*
  5505			 * sys_membarrier() requires an smp_mb() between setting
  5506			 * rq->curr / membarrier_switch_mm() and returning to userspace.
  5507			 *
  5508			 * The below provides this either through switch_mm(), or in
  5509			 * case 'prev->active_mm == next->mm' through
  5510			 * finish_task_switch()'s mmdrop().
  5511			 */
  5512			switch_mm_irqs_off(prev->active_mm, next->mm, next);
  5513			lru_gen_use_mm(next->mm);
  5514	
  5515			if (!prev->mm) {			// from kernel
  5516				/* will mmdrop_lazy_tlb() in finish_task_switch(). */
  5517				rq->prev_mm = prev->active_mm;
  5518				prev->active_mm = NULL;
  5519			}
  5520		}
  5521	
  5522		mm_cid_switch_to(prev, next);
  5523	
  5524		/*
  5525		 * Tell rseq that the task was scheduled in. Must be after
  5526		 * switch_mm_cid() to get the TIF flag set.
  5527		 */
  5528		rseq_sched_switch_event(next);
  5529	
  5530		prepare_lock_switch(rq, next, rf);
  5531	
  5532		/* Here we just switch the register state and the stack. */
  5533		switch_to(prev, next, prev);
  5534		barrier();
  5535	
  5536		{
  5537			unsigned long ssp = 0;
> 5538			asm volatile("rdsspq %0" : "+r" (ssp));
  5539			trace_printk("switch: %s ssp=%lx\n", current->comm, ssp);
  5540		}
  5541	
  5542		return finish_task_switch(prev);
  5543	}
  5544	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
