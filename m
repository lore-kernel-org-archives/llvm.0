Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FEF377A9E;
	Tue,  1 Sep 2026 12:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265004; cv=none; b=b+NGlqVR+G9VNbAD5O215hArORPaIYFi5w86SaUVz6Q8D9nsg9QHLg2dfgqe98qpTkAkyEA7Lc05IuZDi3gC6cpJP7U4F81Hd8NxqsLtdB3ZmBV2pdsvGNNDEbjhPDySlXl+95BJuj1JI6GXQ/0nmYZjmJXGugI97lseoG8/9+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265004; c=relaxed/simple;
	bh=VUNXO1mr+q/p6Sgm3i3DC61q/skWyiAp40iUHd63aFk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ga41WbknV8AJDOyOJ57XUOfiTE029+mgiprlvVglrpX8rcj2Jgd2y0tCzvJts68+h96X7gfwQqAZFTySJwN+e66xXD3AXeZ57f4BqRYKKpI60fWcsxkiche3/r9BERE/kFBHV9CMm1058PRG1bfmc3LEwUs/OpO+4blnFhu/0Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWSt4c6f; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWSt4c6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788265002; x=1819801002;
  h=date:from:to:cc:subject:message-id;
  bh=VUNXO1mr+q/p6Sgm3i3DC61q/skWyiAp40iUHd63aFk=;
  b=SWSt4c6fWDByoVx/PT2BsmxznFD8DWJ9ffSIF8CeQYsLeI1tZPQWBiiX
   aHhtu4Nt0/ii6asfbLlFIPFDaITDbrBnE2sVfpAWRBW9p56wwrgn3iF+S
   CMG2Ari+alH9xgU9Pvnl4/XI3B4o9cJEZ45CCERf70tFRSKeaAGbrcdS9
   WTPkRiZRUpEEIYt0ZSgi7LiszlIxhY7GEKhMX+uuEUbcVnyLs/rudmYZC
   KEkbJaT0mI4HpxIQlVyIG3g8hRLeROr1IIR6mh25/lrY6e2JkrWLQX9ys
   zFTK7bcCfMdXOAsxKS/xwOb8qs73oNzEW30ZwqgIHaO5/HOLTemH2Xgvb
   w==;
X-CSE-ConnectionGUID: Mf6f9sWzSJGBCUwuyc7IBQ==
X-CSE-MsgGUID: C1JIFrCFQHehVpVVneULUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="87829477"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="87829477"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 05:16:41 -0700
X-CSE-ConnectionGUID: CTW9h89aTa6S6Ue/JTImcA==
X-CSE-MsgGUID: x6w378BnQkGxN3Tr1L6C5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="262955838"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Sep 2026 05:16:39 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1NPo-000000000km-3rtx;
	Tue, 01 Sep 2026 12:16:36 +0000
Date: Tue, 01 Sep 2026 20:16:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-thread-handoff 10/13]
 io_uring/handoff.c:307:36: error: call to undeclared function
 'task_stack_page'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202609012001.qCSj57tc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-thread-handoff
head:   e787853bf31af505ee20b5a64dd31bdaaca8bedd
commit: d664aea9c73b2f39f16192756888e0c03aa1fa28 [10/13] io_uring: enable handing submitter identity to an io-wq worker
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260901/202609012001.qCSj57tc-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260901/202609012001.qCSj57tc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609012001.qCSj57tc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> io_uring/handoff.c:307:36: error: call to undeclared function 'task_stack_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     307 |         syscall_set_return_value(current, task_pt_regs(current),
         |                                           ^
   arch/x86/include/asm/processor.h:668:39: note: expanded from macro 'task_pt_regs'
     668 |         unsigned long __ptr = (unsigned long)task_stack_page(task);     \
         |                                              ^
   1 error generated.


vim +/task_stack_page +307 io_uring/handoff.c

   250	
   251	/*
   252	 * Runs on the task that got handed the submitter identity: finish taking
   253	 * it over, then resume io_uring_enter() where io_submit_sqes() would have
   254	 * returned and take the syscall result to userspace.
   255	 */
   256	static long io_handoff_resume(void)
   257	{
   258		struct io_uring_task *tctx = current->io_uring;
   259		struct io_handoff *ho = &tctx->handoff;
   260		struct task_struct *src = ho->src;
   261		struct io_kiocb *req = ho->req;
   262		struct io_ring_ctx *ctx = req->ctx;
   263		struct io_submit_state *state = &ctx->submit_state;
   264		bool bound = io_handoff_bound(req);
   265		unsigned int consumed, left;
   266		long ret;
   267	
   268		if (WARN_ON_ONCE(thread_handoff_finish(src)))
   269			force_sig(SIGKILL);
   270		io_wq_handoff_finished(src);
   271		put_task_struct_many(src, ho->src_refs);
   272		ho->src_refs = 0;
   273		ho->src = NULL;
   274		ho->req = NULL;
   275	
   276		/* we took a worker, top the spare pool back up */
   277		io_wq_handoff_spare(tctx->io_wq, bound, true);
   278	
   279		/*
   280		 * Finish the batch the blocked request was part of, then submit
   281		 * what's left of the syscall. Another handoff continues from here,
   282		 * the consumed count lives in the tctx.
   283		 */
   284		io_run_task_work();
   285		mutex_lock(&ctx->uring_lock);
   286		consumed = ctx->cached_sq_head - state->sq_head;
   287		left = state->submit_nr - consumed;
   288		ret = io_submit_sqes_end(ctx, state->submit_nr, left);
   289		ho->consumed += ret;
   290		if (ho->consumed < ho->to_submit) {
   291			ret = io_submit_sqes(ctx, ho->to_submit - ho->consumed);
   292			if (ret == -EIOCBQUEUED)
   293				return ret;
   294			if (ret > 0)
   295				ho->consumed += ret;
   296		}
   297		ret = ho->consumed;
   298		if (ret != ho->to_submit) {
   299			mutex_unlock(&ctx->uring_lock);
   300		} else {
   301			ret = io_uring_enter_finish(ctx, ret, ho->min_complete,
   302						    ho->flags, ho->argp, ho->argsz);
   303		}
   304		if (!(ho->flags & IORING_ENTER_REGISTERED_RING))
   305			fput(ho->file);
   306	
 > 307		syscall_set_return_value(current, task_pt_regs(current),
   308					 ret < 0 ? ret : 0, ret);
   309		return ret;
   310	}
   311	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
