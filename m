Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200F72E8B6C;
	Wed, 22 Oct 2025 05:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761110619; cv=none; b=DptJxAMNfoqNjpSbYLlB2U/1rMihEKLNO5YM30AhWte9ZKmn8GOSon2P4yg/daL5fl1HW6DBBlQNUPRbyO4LVsDh279r09UYDMOBkycrq4UgMSM+SUBe647WgDEiIEWCfaIRPfEI0YFs82dIkRyQ20ATMZ4PIKucinXczBfwiFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761110619; c=relaxed/simple;
	bh=xbEGqKDBA/Lxat/W9szVAfmuajkgsPGnLy3vg85xh0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sAoHqUAW4DFYZHlJ2+uacyaqjwNP9fRL/E8SESbNIYlyEtxMk1OKSUv7NVdGhDYdWMl/5CUVMNf/iaqtw2x+qNIbeGS6zcTyBCGJSLkkitz/7peYBcvgR7u6fOwyryYo2qZ11NajmJ6HqcQUkZyAuQYpA/J4wr2UFBMEGjkBR0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DKn1DY90; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DKn1DY90"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761110618; x=1792646618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xbEGqKDBA/Lxat/W9szVAfmuajkgsPGnLy3vg85xh0A=;
  b=DKn1DY90AT8Jj6ij4yaYXqD2hwqdJsuXHcz0d05pu2502Y7IRLsecTWp
   wlCQSsIJ7wew3iCwLT2cpUQE+TIqOhq4AshTUKO9kJSYzhrCD6XF3waYB
   Q1dyOz2UntjsOBdg3hkGXAoO1a1wBB8KlEAD61432mfFAVFtkc/gHb3UY
   M1y/Oj1k0uRCuIRlu6GgFwGXJZ2AN2rY0Q+KsPlQwZF2wOR7kyKnT3dOY
   JJEfp2jq9D7wltMuUixIbGUr+XUbc79NeF7kg+k04TD2ueBdZQ+xfnLww
   GMBqwD2k06Mkixw1v9cEtTCfsvvf5WotVfOt5jfUIUlGbbT7nYC+SjVkb
   A==;
X-CSE-ConnectionGUID: kh5DhRH4RA+fTJ+dAHkrFw==
X-CSE-MsgGUID: cm03czAfRuOm7L5R59z0Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85872227"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="85872227"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 22:23:37 -0700
X-CSE-ConnectionGUID: ZouvNuxfSr+m5Jv59oEy/A==
X-CSE-MsgGUID: a73KsNI9SEKG85ELHwGifA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="182980892"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 21 Oct 2025 22:23:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBRJs-000C1F-37;
	Wed, 22 Oct 2025 05:23:32 +0000
Date: Wed, 22 Oct 2025 13:23:08 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>
Subject: [linux-next:master 3361/3483] io_uring/fdinfo.c:104:22: warning:
 variable 'sqe' is uninitialized when used here
Message-ID: <202510221318.GYorOg0V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aaa9c3550b60d6259d6ea8b1175ade8d1242444e
commit: 31dc41afdef21f264364288a30013b538c46152e [3361/3483] io_uring: add support for IORING_SETUP_SQE_MIXED
config: hexagon-randconfig-002-20251022 (https://download.01.org/0day-ci/archive/20251022/202510221318.GYorOg0V-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510221318.GYorOg0V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221318.GYorOg0V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/fdinfo.c:104:22: warning: variable 'sqe' is uninitialized when used here [-Wuninitialized]
     104 |                 opcode = READ_ONCE(sqe->opcode);
         |                                    ^~~
   io_uring/fdinfo.c:93:27: note: initialize the variable 'sqe' to silence this warning
      93 |                 struct io_uring_sqe *sqe;
         |                                         ^
         |                                          = NULL
   1 warning generated.


vim +/sqe +104 io_uring/fdinfo.c

    58	
    59	static void __io_uring_show_fdinfo(struct io_ring_ctx *ctx, struct seq_file *m)
    60	{
    61		struct io_overflow_cqe *ocqe;
    62		struct io_rings *r = ctx->rings;
    63		struct rusage sq_usage;
    64		unsigned int sq_mask = ctx->sq_entries - 1, cq_mask = ctx->cq_entries - 1;
    65		unsigned int sq_head = READ_ONCE(r->sq.head);
    66		unsigned int sq_tail = READ_ONCE(r->sq.tail);
    67		unsigned int cq_head = READ_ONCE(r->cq.head);
    68		unsigned int cq_tail = READ_ONCE(r->cq.tail);
    69		unsigned int sq_shift = 0;
    70		int sq_pid = -1, sq_cpu = -1;
    71		u64 sq_total_time = 0, sq_work_time = 0;
    72		unsigned int i;
    73	
    74		if (ctx->flags & IORING_SETUP_SQE128)
    75			sq_shift = 1;
    76	
    77		/*
    78		 * we may get imprecise sqe and cqe info if uring is actively running
    79		 * since we get cached_sq_head and cached_cq_tail without uring_lock
    80		 * and sq_tail and cq_head are changed by userspace. But it's ok since
    81		 * we usually use these info when it is stuck.
    82		 */
    83		seq_printf(m, "SqMask:\t0x%x\n", sq_mask);
    84		seq_printf(m, "SqHead:\t%u\n", sq_head);
    85		seq_printf(m, "SqTail:\t%u\n", sq_tail);
    86		seq_printf(m, "CachedSqHead:\t%u\n", data_race(ctx->cached_sq_head));
    87		seq_printf(m, "CqMask:\t0x%x\n", cq_mask);
    88		seq_printf(m, "CqHead:\t%u\n", cq_head);
    89		seq_printf(m, "CqTail:\t%u\n", cq_tail);
    90		seq_printf(m, "CachedCqTail:\t%u\n", data_race(ctx->cached_cq_tail));
    91		seq_printf(m, "SQEs:\t%u\n", sq_tail - sq_head);
    92		while (sq_head < sq_tail) {
    93			struct io_uring_sqe *sqe;
    94			unsigned int sq_idx;
    95			bool sqe128 = false;
    96			u8 opcode;
    97	
    98			if (ctx->flags & IORING_SETUP_NO_SQARRAY)
    99				break;
   100			sq_idx = READ_ONCE(ctx->sq_array[sq_head & sq_mask]);
   101			if (sq_idx > sq_mask)
   102				continue;
   103	
 > 104			opcode = READ_ONCE(sqe->opcode);
   105			sqe = &ctx->sq_sqes[sq_idx << sq_shift];
   106			if (sq_shift) {
   107				sqe128 = true;
   108			} else if (io_issue_defs[opcode].is_128) {
   109				if (!(ctx->flags & IORING_SETUP_SQE_MIXED)) {
   110					seq_printf(m,
   111						"%5u: invalid sqe, 128B entry on non-mixed sq\n",
   112						sq_idx);
   113					break;
   114				}
   115				if ((++sq_head & sq_mask) == 0) {
   116					seq_printf(m,
   117						"%5u: corrupted sqe, wrapping 128B entry\n",
   118						sq_idx);
   119					break;
   120				}
   121				sqe128 = true;
   122			}
   123			seq_printf(m, "%5u: opcode:%s, fd:%d, flags:%x, off:%llu, "
   124				      "addr:0x%llx, rw_flags:0x%x, buf_index:%d "
   125				      "user_data:%llu",
   126				   sq_idx, io_uring_get_opcode(opcode), sqe->fd,
   127				   sqe->flags, (unsigned long long) sqe->off,
   128				   (unsigned long long) sqe->addr, sqe->rw_flags,
   129				   sqe->buf_index, sqe->user_data);
   130			if (sqe128) {
   131				u64 *sqeb = (void *) (sqe + 1);
   132				int size = sizeof(struct io_uring_sqe) / sizeof(u64);
   133				int j;
   134	
   135				for (j = 0; j < size; j++) {
   136					seq_printf(m, ", e%d:0x%llx", j,
   137							(unsigned long long) *sqeb);
   138					sqeb++;
   139				}
   140			}
   141			seq_printf(m, "\n");
   142			sq_head++;
   143		}
   144		seq_printf(m, "CQEs:\t%u\n", cq_tail - cq_head);
   145		while (cq_head < cq_tail) {
   146			struct io_uring_cqe *cqe;
   147			bool cqe32 = false;
   148	
   149			cqe = &r->cqes[(cq_head & cq_mask)];
   150			if (cqe->flags & IORING_CQE_F_32 || ctx->flags & IORING_SETUP_CQE32)
   151				cqe32 = true;
   152			seq_printf(m, "%5u: user_data:%llu, res:%d, flag:%x",
   153				   cq_head & cq_mask, cqe->user_data, cqe->res,
   154				   cqe->flags);
   155			if (cqe32)
   156				seq_printf(m, ", extra1:%llu, extra2:%llu\n",
   157						cqe->big_cqe[0], cqe->big_cqe[1]);
   158			seq_printf(m, "\n");
   159			cq_head++;
   160			if (cqe32)
   161				cq_head++;
   162		}
   163	
   164		if (ctx->flags & IORING_SETUP_SQPOLL) {
   165			struct io_sq_data *sq = ctx->sq_data;
   166			struct task_struct *tsk;
   167	
   168			rcu_read_lock();
   169			tsk = rcu_dereference(sq->thread);
   170			/*
   171			 * sq->thread might be NULL if we raced with the sqpoll
   172			 * thread termination.
   173			 */
   174			if (tsk) {
   175				get_task_struct(tsk);
   176				rcu_read_unlock();
   177				getrusage(tsk, RUSAGE_SELF, &sq_usage);
   178				put_task_struct(tsk);
   179				sq_pid = sq->task_pid;
   180				sq_cpu = sq->sq_cpu;
   181				sq_total_time = (sq_usage.ru_stime.tv_sec * 1000000
   182						 + sq_usage.ru_stime.tv_usec);
   183				sq_work_time = sq->work_time;
   184			} else {
   185				rcu_read_unlock();
   186			}
   187		}
   188	
   189		seq_printf(m, "SqThread:\t%d\n", sq_pid);
   190		seq_printf(m, "SqThreadCpu:\t%d\n", sq_cpu);
   191		seq_printf(m, "SqTotalTime:\t%llu\n", sq_total_time);
   192		seq_printf(m, "SqWorkTime:\t%llu\n", sq_work_time);
   193		seq_printf(m, "UserFiles:\t%u\n", ctx->file_table.data.nr);
   194		for (i = 0; i < ctx->file_table.data.nr; i++) {
   195			struct file *f = NULL;
   196	
   197			if (ctx->file_table.data.nodes[i])
   198				f = io_slot_file(ctx->file_table.data.nodes[i]);
   199			if (f) {
   200				seq_printf(m, "%5u: ", i);
   201				seq_file_path(m, f, " \t\n\\");
   202				seq_puts(m, "\n");
   203			}
   204		}
   205		seq_printf(m, "UserBufs:\t%u\n", ctx->buf_table.nr);
   206		for (i = 0; i < ctx->buf_table.nr; i++) {
   207			struct io_mapped_ubuf *buf = NULL;
   208	
   209			if (ctx->buf_table.nodes[i])
   210				buf = ctx->buf_table.nodes[i]->buf;
   211			if (buf)
   212				seq_printf(m, "%5u: 0x%llx/%u\n", i, buf->ubuf, buf->len);
   213			else
   214				seq_printf(m, "%5u: <none>\n", i);
   215		}
   216	
   217		seq_puts(m, "PollList:\n");
   218		for (i = 0; i < (1U << ctx->cancel_table.hash_bits); i++) {
   219			struct io_hash_bucket *hb = &ctx->cancel_table.hbs[i];
   220			struct io_kiocb *req;
   221	
   222			hlist_for_each_entry(req, &hb->list, hash_node)
   223				seq_printf(m, "  op=%d, task_works=%d\n", req->opcode,
   224						task_work_pending(req->tctx->task));
   225		}
   226	
   227		seq_puts(m, "CqOverflowList:\n");
   228		spin_lock(&ctx->completion_lock);
   229		list_for_each_entry(ocqe, &ctx->cq_overflow_list, list) {
   230			struct io_uring_cqe *cqe = &ocqe->cqe;
   231	
   232			seq_printf(m, "  user_data=%llu, res=%d, flags=%x\n",
   233				   cqe->user_data, cqe->res, cqe->flags);
   234	
   235		}
   236		spin_unlock(&ctx->completion_lock);
   237		napi_show_fdinfo(ctx, m);
   238	}
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
