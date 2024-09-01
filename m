Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F6E6A8CF;
	Sun,  1 Sep 2024 22:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725229161; cv=none; b=rCV4a/q/vCIIZxo1EMxF7J75fsw3InSOKSkhRgFqbf0YY+PjlPo61CF4WDVjK2/w7ao/mXPxMwbgkpMqIniMEkyVEihjJssKhjBnv1+I6CKSyvuuDCwUEvHc9V9pZZHg7Zgp/UkT6g87doO52jEn3ZaPrixOsMN/JK4wMNpl+Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725229161; c=relaxed/simple;
	bh=yPdrCymwrixgMCJ3R96c4Ce91R0Ej1y+VH6Au8CAiY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A9UoYT9+MmqKWIbFYTM1iJvI4BkTOaCbeIxGdNXzZsV8QpiMr3rKXmgNNv7rSA+rcpcccUAD1DWhMVjdUTvoQZcrbR6V7YaLoX1LNfWZcdV6WZym98m1D/ty/F0Z/UdIT2+NJDB5HvBa2TBzxjqF5eE52WeqNnbSThM7k3R38FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDXHlMLG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDXHlMLG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725229160; x=1756765160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yPdrCymwrixgMCJ3R96c4Ce91R0Ej1y+VH6Au8CAiY0=;
  b=GDXHlMLGHU5mlb39tlxiBngeIAUN1RLMoFQ4QyxdB/B1USi/ummtjO5F
   ApyAbYce+K/KTXBd9i48hwDc52Ridl+JYpva6pRzIcGYDH25brEH7tP5P
   GjvIxWIYMe1IIC+IAWJHLbRGxmNva1/idZz7VeWOuCVpk5ePw2dA48TrD
   lZ+ClTAQiZI4jOOpXmHjZchWPpVu5fgEraPL4ZN9Q3DclAJjdhjeKvSVf
   uQko6zI/iB6nzc/zltrrUsbnmNq3i5TejRNSsjajmznOP/q0yOQ/nl63i
   xqM9HZUovd3IfwaYygBxDfJlwaulcbh5M0owyUC4/KYRl6sjFzpfWx0op
   w==;
X-CSE-ConnectionGUID: B2B1Jb/3SROnuv4uEkYUgA==
X-CSE-MsgGUID: apcGmYI9R6e9QyPoogp70A==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="34371258"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="34371258"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 15:19:19 -0700
X-CSE-ConnectionGUID: PHaulQvZRQ2P9Mq+pfjNHg==
X-CSE-MsgGUID: pqvZ0a3QRcKOOZzk6HoB7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="64382140"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Sep 2024 15:19:18 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sksug-0004ww-33;
	Sun, 01 Sep 2024 22:19:14 +0000
Date: Mon, 2 Sep 2024 06:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-dispatch_from_dsq 15/16]
 kernel/sched/ext.c:5635:4: error: call to undeclared function
 'move_remote_task_to_local_dsq'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202409020602.H4KVYN6p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-dispatch_from_dsq
head:   4f221a391cbdb370fca69fc2f960786811ba830c
commit: ccc958af2b5f19e4dcc844a3ebf0c43cff367bff [15/16] sched_ext: Implement scx_bpf_dispatch[_vtime]_from_dsq()
config: arm-randconfig-001-20240902 (https://download.01.org/0day-ci/archive/20240902/202409020602.H4KVYN6p-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 6f682c26b04f0b349c4c473756cb8625b4f37c6d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409020602.H4KVYN6p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409020602.H4KVYN6p-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:19:
   In file included from include/linux/sched/isolation.h:5:
   In file included from include/linux/cpuset.h:17:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/sched/build_policy.c:63:
   kernel/sched/ext.c:4860:35: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
    4860 |                 info->reg_type = PTR_MAYBE_NULL | PTR_TO_BTF_ID | PTR_TRUSTED;
         |                                  ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   kernel/sched/ext.c:5335:31: warning: bitwise operation between different enumeration types ('enum scx_enq_flags' and 'enum scx_deq_flags') [-Wenum-enum-conversion]
    5335 |         WRITE_ONCE(v, SCX_ENQ_WAKEUP | SCX_DEQ_SLEEP | SCX_KICK_PREEMPT);
         |                       ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:61:18: note: expanded from macro 'WRITE_ONCE'
      61 |         __WRITE_ONCE(x, val);                                           \
         |                         ^~~
   include/asm-generic/rwonce.h:55:33: note: expanded from macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                        ^~~
   In file included from kernel/sched/build_policy.c:63:
>> kernel/sched/ext.c:5635:4: error: call to undeclared function 'move_remote_task_to_local_dsq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5635 |                         move_remote_task_to_local_dsq(p, enq_flags,
         |                         ^
   kernel/sched/ext.c:5635:4: note: did you mean 'move_local_task_to_local_dsq'?
   kernel/sched/ext.c:2111:13: note: 'move_local_task_to_local_dsq' declared here
    2111 | static void move_local_task_to_local_dsq(struct task_struct *p, u64 enq_flags,
         |             ^
   3 warnings and 1 error generated.


vim +/move_remote_task_to_local_dsq +5635 kernel/sched/ext.c

  5559	
  5560	static bool scx_dispatch_from_dsq(struct bpf_iter_scx_dsq_kern *kit,
  5561					  struct task_struct *p, u64 dsq_id,
  5562					  u64 slice, u64 vtime, u64 enq_flags)
  5563	{
  5564		struct scx_dispatch_q *src_dsq = kit->dsq, *dst_dsq;
  5565		struct rq *this_rq, *src_rq, *dst_rq, *locked_rq;
  5566		bool dispatched = false;
  5567		bool in_balance;
  5568		unsigned long flags;
  5569	
  5570		if (!scx_kf_allowed_if_unlocked() && !scx_kf_allowed(SCX_KF_DISPATCH))
  5571			return false;
  5572	
  5573		/*
  5574		 * Can be called from either ops.dispatch() locking this_rq() or any
  5575		 * context where no rq lock is held. If latter, lock @p's task_rq which
  5576		 * we'll likely need anyway.
  5577		 */
  5578		src_rq = task_rq(p);
  5579	
  5580		local_irq_save(flags);
  5581		this_rq = this_rq();
  5582		in_balance = this_rq->scx.flags & SCX_RQ_IN_BALANCE;
  5583	
  5584		if (in_balance) {
  5585			if (this_rq != src_rq) {
  5586				raw_spin_rq_unlock(this_rq);
  5587				raw_spin_rq_lock(src_rq);
  5588			}
  5589		} else {
  5590			raw_spin_rq_lock(src_rq);
  5591		}
  5592	
  5593		locked_rq = src_rq;
  5594		raw_spin_lock(&src_dsq->lock);
  5595	
  5596		/*
  5597		 * Did someone else get to it? @p could have already left $src_dsq, got
  5598		 * re-enqueud, or be in the process of being consumed by someone else.
  5599		 */
  5600		if (unlikely(p->scx.dsq != src_dsq ||
  5601			     u32_before(kit->dsq_seq, p->scx.dsq_seq) ||
  5602			     p->scx.holding_cpu >= 0) ||
  5603		    WARN_ON_ONCE(src_rq != task_rq(p))) {
  5604			raw_spin_unlock(&src_dsq->lock);
  5605			goto out;
  5606		}
  5607	
  5608		/* @p is still on $src_dsq and stable, determine the destination */
  5609		dst_dsq = find_dsq_for_dispatch(this_rq, dsq_id, p);
  5610	
  5611		if (dst_dsq->id == SCX_DSQ_LOCAL) {
  5612			dst_rq = container_of(dst_dsq, struct rq, scx.local_dsq);
  5613			if (!task_can_run_on_remote_rq(p, dst_rq, true)) {
  5614				dst_dsq = &scx_dsq_global;
  5615				dst_rq = src_rq;
  5616			}
  5617		} else {
  5618			/* no need to migrate if destination is a non-local DSQ */
  5619			dst_rq = src_rq;
  5620		}
  5621	
  5622		/*
  5623		 * Move @p into $dst_dsq. If $dst_dsq is the local DSQ of a different
  5624		 * CPU, @p will be migrated.
  5625		 */
  5626		if (dst_dsq->id == SCX_DSQ_LOCAL) {
  5627			/* @p is going from a non-local DSQ to a local DSQ */
  5628			if (src_rq == dst_rq) {
  5629				task_unlink_from_dsq(p, src_dsq);
  5630				move_local_task_to_local_dsq(p, enq_flags,
  5631							     src_dsq, dst_rq);
  5632				raw_spin_unlock(&src_dsq->lock);
  5633			} else {
  5634				raw_spin_unlock(&src_dsq->lock);
> 5635				move_remote_task_to_local_dsq(p, enq_flags,
  5636							      src_rq, dst_rq);
  5637				locked_rq = dst_rq;
  5638			}
  5639		} else {
  5640			/*
  5641			 * @p is going from a non-local DSQ to a non-local DSQ. As
  5642			 * $src_dsq is already locked, do an abbreviated dequeue.
  5643			 */
  5644			task_unlink_from_dsq(p, src_dsq);
  5645			p->scx.dsq = NULL;
  5646			raw_spin_unlock(&src_dsq->lock);
  5647	
  5648			p->scx.dsq_vtime = vtime;
  5649			dispatch_enqueue(dst_dsq, p, enq_flags);
  5650		}
  5651	
  5652		if (slice)
  5653			p->scx.slice = slice;
  5654		else
  5655			p->scx.slice = p->scx.slice ?: 1;
  5656	
  5657		dispatched = true;
  5658	out:
  5659		if (in_balance) {
  5660			if (this_rq != locked_rq) {
  5661				raw_spin_rq_unlock(locked_rq);
  5662				raw_spin_rq_lock(this_rq);
  5663			}
  5664		} else {
  5665			raw_spin_rq_unlock_irqrestore(locked_rq, flags);
  5666		}
  5667	
  5668		return dispatched;
  5669	}
  5670	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
