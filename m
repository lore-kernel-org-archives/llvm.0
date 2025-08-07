Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9241325F963;
	Thu,  7 Aug 2025 23:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754610643; cv=none; b=JTjncvwnrbodSAmXSi11oCAkeuqertn0baIEEmbbO2+nUefvVfiRfocpLH3xCuiJsvfXSgehM5LRRhHwPQUBmqSze8P1Mmz7qpozbwh57ADJ+aVqogZwai6FVjXY/TWwRnsi9XfFycKP3VVQb4A8MNxh7JvjJRDCxEJMGlucwZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754610643; c=relaxed/simple;
	bh=4Z7JtQR6dCs84/k9VG6Aoz/zQfjyQQr7OF2eJuuCkLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PIMdyZtiVg/h23InIKteDzOw5W0IOFJSUvP2Cu6IgZDCX669OqZWQ2ya2sc4wpL8DYZFpPfvw9YL1YokK7KIoyYvUFr4Dq+CWywL/PqIe3x3Z4oS6F+gD8mjGyp9b6tubN1BLHC3V7m0SOYuYMIKgGqusANfF+4x4tuLtksyFk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMphVxzt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMphVxzt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754610642; x=1786146642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Z7JtQR6dCs84/k9VG6Aoz/zQfjyQQr7OF2eJuuCkLw=;
  b=ZMphVxztB0C/lATAtm+HcP1o23BKme8gDzi0X1Ylnj2Ev5NXKK96bDMP
   jOYwfBZQ+ydSiEB13uZ9VhnB8XhElQpOb5CShuhRHVme9NEJH78l1I3RB
   br+RBx8fbZpmv0JpvmiweFik5Wi2mmeTB10jTJEKkP4VKzObK/QC4HmLx
   AAiSmq4ADNvZHotDnWExm+FxhvvYw5JmyZnaWswCGZJJgu8wNF1H7rKpK
   HomtbWgMTnJvsrZfiJNucaazGiDLCGkFCqE1/wpSzNnTHVVBReWnpQVYo
   D+5dstaKOs15rPE5/rUF6Snmpt05tFlqTOK4Jwu6Nwxo906DVSB8FxfeE
   A==;
X-CSE-ConnectionGUID: QFzh9kHwT1adtMgdBE370g==
X-CSE-MsgGUID: THOrYvrJQmOttWlkDZnzBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68330854"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="68330854"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 16:50:38 -0700
X-CSE-ConnectionGUID: WrCS4nk5R3S0NpTXN6+EEQ==
X-CSE-MsgGUID: VQgyOVilTJ+KUrML8AXtjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="165574137"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 07 Aug 2025 16:50:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukANW-0003Mm-1J;
	Thu, 07 Aug 2025 23:50:34 +0000
Date: Fri, 8 Aug 2025 07:50:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-cqe-mix 4/9] io_uring/fdinfo.c:134:7: warning:
 variable 'cq_shift' is uninitialized when used here
Message-ID: <202508080735.4yY5oniq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-cqe-mix
head:   ff0112fc6f064b012cc2f63d744e1103cea398fd
commit: 36e483696f3bcd302cb45a77d0483c2727e3f396 [4/9] io_uring/fdinfo: deal with mixed sized CQEs
config: hexagon-randconfig-002-20250808 (https://download.01.org/0day-ci/archive/20250808/202508080735.4yY5oniq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080735.4yY5oniq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080735.4yY5oniq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   io_uring/fdinfo.c:69:27: warning: variable 'cq_entries' set but not used [-Wunused-but-set-variable]
      69 |         unsigned int sq_entries, cq_entries;
         |                                  ^
>> io_uring/fdinfo.c:134:7: warning: variable 'cq_shift' is uninitialized when used here [-Wuninitialized]
     134 |                 if (cq_shift)
         |                     ^~~~~~~~
   io_uring/fdinfo.c:128:24: note: initialize the variable 'cq_shift' to silence this warning
     128 |                 unsigned int cq_shift;
         |                                      ^
         |                                       = 0
   2 warnings generated.


vim +/cq_shift +134 io_uring/fdinfo.c

6bf90bd8c58a30 Olivier Langlois        2024-10-13   57  
d871198ee431d9 Jens Axboe              2025-05-13   58  static void __io_uring_show_fdinfo(struct io_ring_ctx *ctx, struct seq_file *m)
a4ad4f748ea962 Jens Axboe              2022-05-25   59  {
a4ad4f748ea962 Jens Axboe              2022-05-25   60  	struct io_overflow_cqe *ocqe;
a4ad4f748ea962 Jens Axboe              2022-05-25   61  	struct io_rings *r = ctx->rings;
3fcb9d17206e31 Xiaobing Li             2024-02-28   62  	struct rusage sq_usage;
a4ad4f748ea962 Jens Axboe              2022-05-25   63  	unsigned int sq_mask = ctx->sq_entries - 1, cq_mask = ctx->cq_entries - 1;
a4ad4f748ea962 Jens Axboe              2022-05-25   64  	unsigned int sq_head = READ_ONCE(r->sq.head);
a4ad4f748ea962 Jens Axboe              2022-05-25   65  	unsigned int sq_tail = READ_ONCE(r->sq.tail);
a4ad4f748ea962 Jens Axboe              2022-05-25   66  	unsigned int cq_head = READ_ONCE(r->cq.head);
a4ad4f748ea962 Jens Axboe              2022-05-25   67  	unsigned int cq_tail = READ_ONCE(r->cq.tail);
3b8fdd1dc35e39 Jens Axboe              2022-09-11   68  	unsigned int sq_shift = 0;
a4ad4f748ea962 Jens Axboe              2022-05-25   69  	unsigned int sq_entries, cq_entries;
7644b1a1c9a7ae Jens Axboe              2023-10-21   70  	int sq_pid = -1, sq_cpu = -1;
3fcb9d17206e31 Xiaobing Li             2024-02-28   71  	u64 sq_total_time = 0, sq_work_time = 0;
a4ad4f748ea962 Jens Axboe              2022-05-25   72  	unsigned int i;
a4ad4f748ea962 Jens Axboe              2022-05-25   73  
3b8fdd1dc35e39 Jens Axboe              2022-09-11   74  	if (ctx->flags & IORING_SETUP_SQE128)
3b8fdd1dc35e39 Jens Axboe              2022-09-11   75  		sq_shift = 1;
a4ad4f748ea962 Jens Axboe              2022-05-25   76  
a4ad4f748ea962 Jens Axboe              2022-05-25   77  	/*
a4ad4f748ea962 Jens Axboe              2022-05-25   78  	 * we may get imprecise sqe and cqe info if uring is actively running
a4ad4f748ea962 Jens Axboe              2022-05-25   79  	 * since we get cached_sq_head and cached_cq_tail without uring_lock
a4ad4f748ea962 Jens Axboe              2022-05-25   80  	 * and sq_tail and cq_head are changed by userspace. But it's ok since
a4ad4f748ea962 Jens Axboe              2022-05-25   81  	 * we usually use these info when it is stuck.
a4ad4f748ea962 Jens Axboe              2022-05-25   82  	 */
a4ad4f748ea962 Jens Axboe              2022-05-25   83  	seq_printf(m, "SqMask:\t0x%x\n", sq_mask);
a4ad4f748ea962 Jens Axboe              2022-05-25   84  	seq_printf(m, "SqHead:\t%u\n", sq_head);
a4ad4f748ea962 Jens Axboe              2022-05-25   85  	seq_printf(m, "SqTail:\t%u\n", sq_tail);
f024d3a8ded0d8 Jens Axboe              2025-04-30   86  	seq_printf(m, "CachedSqHead:\t%u\n", data_race(ctx->cached_sq_head));
a4ad4f748ea962 Jens Axboe              2022-05-25   87  	seq_printf(m, "CqMask:\t0x%x\n", cq_mask);
a4ad4f748ea962 Jens Axboe              2022-05-25   88  	seq_printf(m, "CqHead:\t%u\n", cq_head);
a4ad4f748ea962 Jens Axboe              2022-05-25   89  	seq_printf(m, "CqTail:\t%u\n", cq_tail);
f024d3a8ded0d8 Jens Axboe              2025-04-30   90  	seq_printf(m, "CachedCqTail:\t%u\n", data_race(ctx->cached_cq_tail));
3b8fdd1dc35e39 Jens Axboe              2022-09-11   91  	seq_printf(m, "SQEs:\t%u\n", sq_tail - sq_head);
a4ad4f748ea962 Jens Axboe              2022-05-25   92  	sq_entries = min(sq_tail - sq_head, ctx->sq_entries);
a4ad4f748ea962 Jens Axboe              2022-05-25   93  	for (i = 0; i < sq_entries; i++) {
a4ad4f748ea962 Jens Axboe              2022-05-25   94  		unsigned int entry = i + sq_head;
a4ad4f748ea962 Jens Axboe              2022-05-25   95  		struct io_uring_sqe *sqe;
3b8fdd1dc35e39 Jens Axboe              2022-09-11   96  		unsigned int sq_idx;
a4ad4f748ea962 Jens Axboe              2022-05-25   97  
32f5dea040ee6e Jens Axboe              2023-09-01   98  		if (ctx->flags & IORING_SETUP_NO_SQARRAY)
32f5dea040ee6e Jens Axboe              2023-09-01   99  			break;
3b8fdd1dc35e39 Jens Axboe              2022-09-11  100  		sq_idx = READ_ONCE(ctx->sq_array[entry & sq_mask]);
a4ad4f748ea962 Jens Axboe              2022-05-25  101  		if (sq_idx > sq_mask)
a4ad4f748ea962 Jens Axboe              2022-05-25  102  			continue;
00927931cb630b Pavel Begunkov          2022-10-11  103  		sqe = &ctx->sq_sqes[sq_idx << sq_shift];
3b8fdd1dc35e39 Jens Axboe              2022-09-11  104  		seq_printf(m, "%5u: opcode:%s, fd:%d, flags:%x, off:%llu, "
3b8fdd1dc35e39 Jens Axboe              2022-09-11  105  			      "addr:0x%llx, rw_flags:0x%x, buf_index:%d "
3b8fdd1dc35e39 Jens Axboe              2022-09-11  106  			      "user_data:%llu",
3b8fdd1dc35e39 Jens Axboe              2022-09-11  107  			   sq_idx, io_uring_get_opcode(sqe->opcode), sqe->fd,
3b8fdd1dc35e39 Jens Axboe              2022-09-11  108  			   sqe->flags, (unsigned long long) sqe->off,
3b8fdd1dc35e39 Jens Axboe              2022-09-11  109  			   (unsigned long long) sqe->addr, sqe->rw_flags,
3b8fdd1dc35e39 Jens Axboe              2022-09-11  110  			   sqe->buf_index, sqe->user_data);
3b8fdd1dc35e39 Jens Axboe              2022-09-11  111  		if (sq_shift) {
3b8fdd1dc35e39 Jens Axboe              2022-09-11  112  			u64 *sqeb = (void *) (sqe + 1);
3b8fdd1dc35e39 Jens Axboe              2022-09-11  113  			int size = sizeof(struct io_uring_sqe) / sizeof(u64);
3b8fdd1dc35e39 Jens Axboe              2022-09-11  114  			int j;
3b8fdd1dc35e39 Jens Axboe              2022-09-11  115  
3b8fdd1dc35e39 Jens Axboe              2022-09-11  116  			for (j = 0; j < size; j++) {
3b8fdd1dc35e39 Jens Axboe              2022-09-11  117  				seq_printf(m, ", e%d:0x%llx", j,
3b8fdd1dc35e39 Jens Axboe              2022-09-11  118  						(unsigned long long) *sqeb);
3b8fdd1dc35e39 Jens Axboe              2022-09-11  119  				sqeb++;
3b8fdd1dc35e39 Jens Axboe              2022-09-11  120  			}
3b8fdd1dc35e39 Jens Axboe              2022-09-11  121  		}
3b8fdd1dc35e39 Jens Axboe              2022-09-11  122  		seq_printf(m, "\n");
a4ad4f748ea962 Jens Axboe              2022-05-25  123  	}
a4ad4f748ea962 Jens Axboe              2022-05-25  124  	seq_printf(m, "CQEs:\t%u\n", cq_tail - cq_head);
a4ad4f748ea962 Jens Axboe              2022-05-25  125  	cq_entries = min(cq_tail - cq_head, ctx->cq_entries);
36e483696f3bcd Jens Axboe              2025-08-07  126  	while (cq_head < cq_tail) {
36e483696f3bcd Jens Axboe              2025-08-07  127  		struct io_uring_cqe *cqe;
36e483696f3bcd Jens Axboe              2025-08-07  128  		unsigned int cq_shift;
a4ad4f748ea962 Jens Axboe              2022-05-25  129  
36e483696f3bcd Jens Axboe              2025-08-07  130  		cqe = &r->cqes[(cq_head & cq_mask)];
4f731705cc1f15 Jens Axboe              2022-09-11  131  		seq_printf(m, "%5u: user_data:%llu, res:%d, flag:%x",
36e483696f3bcd Jens Axboe              2025-08-07  132  			   cq_head & cq_mask, cqe->user_data, cqe->res,
a4ad4f748ea962 Jens Axboe              2022-05-25  133  			   cqe->flags);
4f731705cc1f15 Jens Axboe              2022-09-11 @134  		if (cq_shift)
4f731705cc1f15 Jens Axboe              2022-09-11  135  			seq_printf(m, ", extra1:%llu, extra2:%llu\n",
4f731705cc1f15 Jens Axboe              2022-09-11  136  					cqe->big_cqe[0], cqe->big_cqe[1]);
4f731705cc1f15 Jens Axboe              2022-09-11  137  		seq_printf(m, "\n");
36e483696f3bcd Jens Axboe              2025-08-07  138  		cq_head++;
36e483696f3bcd Jens Axboe              2025-08-07  139  		if (cqe->flags & IORING_CQE_F_32 || ctx->flags & IORING_SETUP_CQE32)
36e483696f3bcd Jens Axboe              2025-08-07  140  			cq_head++;
a4ad4f748ea962 Jens Axboe              2022-05-25  141  	}
a4ad4f748ea962 Jens Axboe              2022-05-25  142  
d871198ee431d9 Jens Axboe              2025-05-13  143  	if (ctx->flags & IORING_SETUP_SQPOLL) {
7644b1a1c9a7ae Jens Axboe              2023-10-21  144  		struct io_sq_data *sq = ctx->sq_data;
ac0b8b327a5677 Penglei Jiang           2025-06-10  145  		struct task_struct *tsk;
7644b1a1c9a7ae Jens Axboe              2023-10-21  146  
ac0b8b327a5677 Penglei Jiang           2025-06-10  147  		rcu_read_lock();
ac0b8b327a5677 Penglei Jiang           2025-06-10  148  		tsk = rcu_dereference(sq->thread);
606559dc4fa36a Gabriel Krisman Bertazi 2024-03-08  149  		/*
606559dc4fa36a Gabriel Krisman Bertazi 2024-03-08  150  		 * sq->thread might be NULL if we raced with the sqpoll
606559dc4fa36a Gabriel Krisman Bertazi 2024-03-08  151  		 * thread termination.
606559dc4fa36a Gabriel Krisman Bertazi 2024-03-08  152  		 */
ac0b8b327a5677 Penglei Jiang           2025-06-10  153  		if (tsk) {
ac0b8b327a5677 Penglei Jiang           2025-06-10  154  			get_task_struct(tsk);
ac0b8b327a5677 Penglei Jiang           2025-06-10  155  			rcu_read_unlock();
ac0b8b327a5677 Penglei Jiang           2025-06-10  156  			getrusage(tsk, RUSAGE_SELF, &sq_usage);
ac0b8b327a5677 Penglei Jiang           2025-06-10  157  			put_task_struct(tsk);
a0d45c3f596be5 Jens Axboe              2023-11-14  158  			sq_pid = sq->task_pid;
a0d45c3f596be5 Jens Axboe              2023-11-14  159  			sq_cpu = sq->sq_cpu;
606559dc4fa36a Gabriel Krisman Bertazi 2024-03-08  160  			sq_total_time = (sq_usage.ru_stime.tv_sec * 1000000
606559dc4fa36a Gabriel Krisman Bertazi 2024-03-08  161  					 + sq_usage.ru_stime.tv_usec);
3fcb9d17206e31 Xiaobing Li             2024-02-28  162  			sq_work_time = sq->work_time;
ac0b8b327a5677 Penglei Jiang           2025-06-10  163  		} else {
ac0b8b327a5677 Penglei Jiang           2025-06-10  164  			rcu_read_unlock();
a4ad4f748ea962 Jens Axboe              2022-05-25  165  		}
606559dc4fa36a Gabriel Krisman Bertazi 2024-03-08  166  	}
a4ad4f748ea962 Jens Axboe              2022-05-25  167  
7644b1a1c9a7ae Jens Axboe              2023-10-21  168  	seq_printf(m, "SqThread:\t%d\n", sq_pid);
7644b1a1c9a7ae Jens Axboe              2023-10-21  169  	seq_printf(m, "SqThreadCpu:\t%d\n", sq_cpu);
3fcb9d17206e31 Xiaobing Li             2024-02-28  170  	seq_printf(m, "SqTotalTime:\t%llu\n", sq_total_time);
3fcb9d17206e31 Xiaobing Li             2024-02-28  171  	seq_printf(m, "SqWorkTime:\t%llu\n", sq_work_time);
3597f2786b687a Jens Axboe              2024-10-26  172  	seq_printf(m, "UserFiles:\t%u\n", ctx->file_table.data.nr);
d871198ee431d9 Jens Axboe              2025-05-13  173  	for (i = 0; i < ctx->file_table.data.nr; i++) {
cb1717a7cd0fc8 Jens Axboe              2024-10-28  174  		struct file *f = NULL;
a4ad4f748ea962 Jens Axboe              2022-05-25  175  
cb1717a7cd0fc8 Jens Axboe              2024-10-28  176  		if (ctx->file_table.data.nodes[i])
cb1717a7cd0fc8 Jens Axboe              2024-10-28  177  			f = io_slot_file(ctx->file_table.data.nodes[i]);
561e3a0c40dc7e Al Viro                 2025-01-19  178  		if (f) {
561e3a0c40dc7e Al Viro                 2025-01-19  179  			seq_printf(m, "%5u: ", i);
561e3a0c40dc7e Al Viro                 2025-01-19  180  			seq_file_path(m, f, " \t\n\\");
561e3a0c40dc7e Al Viro                 2025-01-19  181  			seq_puts(m, "\n");
561e3a0c40dc7e Al Viro                 2025-01-19  182  		}
a4ad4f748ea962 Jens Axboe              2022-05-25  183  	}
3597f2786b687a Jens Axboe              2024-10-26  184  	seq_printf(m, "UserBufs:\t%u\n", ctx->buf_table.nr);
d871198ee431d9 Jens Axboe              2025-05-13  185  	for (i = 0; i < ctx->buf_table.nr; i++) {
d50f94d761a5d9 Jens Axboe              2024-10-30  186  		struct io_mapped_ubuf *buf = NULL;
a4ad4f748ea962 Jens Axboe              2022-05-25  187  
d50f94d761a5d9 Jens Axboe              2024-10-30  188  		if (ctx->buf_table.nodes[i])
d50f94d761a5d9 Jens Axboe              2024-10-30  189  			buf = ctx->buf_table.nodes[i]->buf;
d50f94d761a5d9 Jens Axboe              2024-10-30  190  		if (buf)
9753c642a53bc4 Jens Axboe              2024-09-15  191  			seq_printf(m, "%5u: 0x%llx/%u\n", i, buf->ubuf, buf->len);
d50f94d761a5d9 Jens Axboe              2024-10-30  192  		else
d50f94d761a5d9 Jens Axboe              2024-10-30  193  			seq_printf(m, "%5u: <none>\n", i);
a4ad4f748ea962 Jens Axboe              2022-05-25  194  	}
a4ad4f748ea962 Jens Axboe              2022-05-25  195  
a4ad4f748ea962 Jens Axboe              2022-05-25  196  	seq_puts(m, "PollList:\n");
d871198ee431d9 Jens Axboe              2025-05-13  197  	for (i = 0; i < (1U << ctx->cancel_table.hash_bits); i++) {
e6f89be61410ff Pavel Begunkov          2022-06-16  198  		struct io_hash_bucket *hb = &ctx->cancel_table.hbs[i];
a4ad4f748ea962 Jens Axboe              2022-05-25  199  		struct io_kiocb *req;
a4ad4f748ea962 Jens Axboe              2022-05-25  200  
38513c464d3d45 Hao Xu                  2022-06-16  201  		hlist_for_each_entry(req, &hb->list, hash_node)
a4ad4f748ea962 Jens Axboe              2022-05-25  202  			seq_printf(m, "  op=%d, task_works=%d\n", req->opcode,
b6f58a3f4aa8db Jens Axboe              2024-11-03  203  					task_work_pending(req->tctx->task));
a4ad4f748ea962 Jens Axboe              2022-05-25  204  	}
a4ad4f748ea962 Jens Axboe              2022-05-25  205  
a4ad4f748ea962 Jens Axboe              2022-05-25  206  	seq_puts(m, "CqOverflowList:\n");
38513c464d3d45 Hao Xu                  2022-06-16  207  	spin_lock(&ctx->completion_lock);
a4ad4f748ea962 Jens Axboe              2022-05-25  208  	list_for_each_entry(ocqe, &ctx->cq_overflow_list, list) {
a4ad4f748ea962 Jens Axboe              2022-05-25  209  		struct io_uring_cqe *cqe = &ocqe->cqe;
a4ad4f748ea962 Jens Axboe              2022-05-25  210  
a4ad4f748ea962 Jens Axboe              2022-05-25  211  		seq_printf(m, "  user_data=%llu, res=%d, flags=%x\n",
a4ad4f748ea962 Jens Axboe              2022-05-25  212  			   cqe->user_data, cqe->res, cqe->flags);
a4ad4f748ea962 Jens Axboe              2022-05-25  213  
a4ad4f748ea962 Jens Axboe              2022-05-25  214  	}
a4ad4f748ea962 Jens Axboe              2022-05-25  215  	spin_unlock(&ctx->completion_lock);
6bf90bd8c58a30 Olivier Langlois        2024-10-13  216  	napi_show_fdinfo(ctx, m);
a4ad4f748ea962 Jens Axboe              2022-05-25  217  }
d871198ee431d9 Jens Axboe              2025-05-13  218  

:::::: The code at line 134 was first introduced by commit
:::::: 4f731705cc1f1591e15e1c3133de8ae3843c68ff io_uring/fdinfo: get rid of unnecessary is_cqe32 variable

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
