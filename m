Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F093B8D41;
	Sun,  7 Dec 2025 15:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765122065; cv=none; b=ZiH3SqKcQaCaXTUQUSTUrHPhfBkMIEyL9bKHWUzpCs/ZZLTYrdTSlm1s2WoTTa5aO85rHjdWRPK/didljs/PKQr9IPLiwfWa5uhYC1Oz+o5XPYCS+hW+HHfaCVDbIYWdCAwH0cGkwxFpNrqriGok3eNmJQEuhVNkFReKCV6hOXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765122065; c=relaxed/simple;
	bh=InePeH95Ih9ns54fIn2nOeaz2xhMALPrQmRHfJwmh5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtIYKLvtydYGY6ttHP3Atzxt1BbgJUm/7yV5xBy9MuDUlqAz17gyRIhPu5sMOFmEg8eaLrCpVwm0a4PUpTu7ZST6ujstuyyChAEpcF3SbpbRCIdIfJsG45NcfthBSGfh58QuogATr0OFctRdoxF0tQFVBo1GAUptoB4ibe3Rd/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTaz4hpf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTaz4hpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765122062; x=1796658062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=InePeH95Ih9ns54fIn2nOeaz2xhMALPrQmRHfJwmh5A=;
  b=RTaz4hpfvvMUhxLkFBXyNHXOt7mb13rXxRvMm+LCG2rTIIV+487OhNge
   IjZc5mseJFr/zb3P1erR/B0cRgv7cTB48kD8aYs0eqFpcpnWmJu7BwMd5
   So1aTUzw6dHYhu8PQvBNtimJ/eLNBtM/mS+3HnIomrPfEUtmk4xXZnGJW
   vYoY9LjnSgyhaKwi1YItFpE9JhDbdKEi8YAUnP5NFVFn8K1EWGxvlA8eU
   o/G+rorAH37AnCVEAkmXkIGbH7s8qgysdb0SU+dWHzomBIGqBiN7ypCm7
   RtKwPXJDZ8QZ2PpyonhXes8ksvrT3CoeifA1ETeoqpNYwOOX5RMuWW+zA
   g==;
X-CSE-ConnectionGUID: byUOM/cKQJCa+IpcDhAS0g==
X-CSE-MsgGUID: 79Zrd3QkR6Gavshc4N48Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67119957"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67119957"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 07:41:00 -0800
X-CSE-ConnectionGUID: //7gNd4+S9myi8EciuNmMw==
X-CSE-MsgGUID: 3gikd7QxQzqvLPY8LKmENA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="195751834"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Dec 2025 07:40:59 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSGsa-00000000JIP-2Bu0;
	Sun, 07 Dec 2025 15:40:56 +0000
Date: Sun, 7 Dec 2025 23:39:58 +0800
From: kernel test robot <lkp@intel.com>
To: Anatoly Stepanov <stepanov.anatoly@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 3/5] kernel: introduce general hq-lock support
Message-ID: <202512072334.p6FnpvnH-lkp@intel.com>
References: <20251206062106.2109014-4-stepanov.anatoly@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206062106.2109014-4-stepanov.anatoly@huawei.com>

Hi Anatoly,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/locking/core]
[also build test WARNING on tip/x86/core arnd-asm-generic/master v6.18]
[cannot apply to linus/master next-20251205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anatoly-Stepanov/kernel-introduce-Hierarchical-Queued-spinlock/20251206-070428
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20251206062106.2109014-4-stepanov.anatoly%40huawei.com
patch subject: [RFC PATCH v2 3/5] kernel: introduce general hq-lock support
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251207/202512072334.p6FnpvnH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512072334.p6FnpvnH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512072334.p6FnpvnH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/locking/qspinlock.c:423:
>> kernel/locking/hqlock_core.h:611:17: warning: variable 'node_tail' set but not used [-Wunused-but-set-variable]
     611 |         u16 node_head, node_tail;
         |                        ^
   1 warning generated.


vim +/node_tail +611 kernel/locking/hqlock_core.h

1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  597  
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  598  static inline void handoff_remote(struct qspinlock *lock,
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  599  						struct numa_qnode *qnode,
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  600  						u32 tail, int handoff_info)
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  601  {
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  602  	struct numa_queue *next_queue = NULL;
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  603  	struct mcs_spinlock *mcs_head = NULL;
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  604  	struct numa_qnode *qhead = NULL;
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  605  	u16 lock_id = qnode->lock_id;
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  606  
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  607  	struct lock_metadata *lock_meta = get_meta(lock_id);
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  608  	struct numa_queue *queue = get_local_queue(qnode);
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  609  
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  610  	u16 next_node_id;
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06 @611  	u16 node_head, node_tail;
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  612  
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  613  	node_tail = READ_ONCE(lock_meta->tail_node);
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  614  	node_head = READ_ONCE(lock_meta->head_node);
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  615  
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  616  	/*
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  617  	 * 'handoffs_not_head > 0' means at the head of NUMA-level queue we have a node
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  618  	 * which is heavily loaded and has performed a remote handoff upon reaching the threshold.
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  619  	 *
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  620  	 * Perform handoff to the head instead of next node in the NUMA-level queue,
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  621  	 * if handoffs_not_head >= nr_online_nodes
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  622  	 * (It means other contended nodes have been taking the lock at least once after the head one)
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  623  	 */
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  624  	u16 handoffs_not_head = READ_ONCE(queue->handoffs_not_head);
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  625  
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  626  	if (handoff_info > 0 && (handoffs_not_head < nr_online_nodes)) {
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  627  		next_node_id = handoff_info;
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  628  		if (node_head != qnode->numa_node)
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  629  			handoffs_not_head++;
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  630  	} else {
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  631  		if (!node_head) {
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  632  			/* If we're here - we have defintely other node-contenders, let's wait */
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  633  			next_node_id = smp_cond_load_relaxed(&lock_meta->head_node, (VAL));
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  634  		} else {
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  635  			next_node_id = node_head;
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  636  		}
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  637  
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  638  		handoffs_not_head = 0;
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  639  	}
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  640  
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  641  	next_queue = get_queue(lock_id, next_node_id);
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  642  	WRITE_ONCE(next_queue->handoffs_not_head, handoffs_not_head);
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  643  
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  644  	qhead = READ_ONCE(next_queue->head);
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  645  
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  646  	mcs_head = (void *) qhead;
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  647  
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  648  	/* arch_mcs_spin_unlock_contended implies smp-barrier */
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  649  	arch_mcs_spin_unlock_contended(&mcs_head->locked);
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  650  }
1b1736c3ff9c9f Anatoly Stepanov 2025-12-06  651  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
