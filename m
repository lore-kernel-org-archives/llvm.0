Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A93D3C082;
	Sun, 28 Jan 2024 16:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706460099; cv=none; b=TWP8+lw/xZ68E68uGV7m5KM1yLYZCzTeOzTqNCH3Tk/xdNGwWONDiAL6gdEToCw7pGLk7n6W6VAvkUivOKeRtj7c2XfM1wemzgjcn1FZs1dGR06/E5F+00NWz140F79VC/paXSy3Gf/K2mOaipkEy1Vv4V8pL7MYM/HGVBkRqgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706460099; c=relaxed/simple;
	bh=qvWFWgNJaf07mKO/LaFiF3KOpagW29MNcQSa9aJSciI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D+JcgUhL/oRG2EnvW7v8ZBYoxjNEUzbqFjNCe5a6CIlKy8V+ue2xoa+qanA2wKdeSLyugnQFuhD5Tw1Wk9YDlEurd/2cT8ksZt732PxBJK2iKCDBd+Byf04Do2vWCwRQhVkUkcDyKrdz7PphRcesKwaByQkAgZs+e8twK2/bZwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFVwZCLM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFVwZCLM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706460097; x=1737996097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qvWFWgNJaf07mKO/LaFiF3KOpagW29MNcQSa9aJSciI=;
  b=VFVwZCLM8WkQhVSWUnvvH+31Is2Okxtlj5/AWFRUORwb1a6OwVyw9bCY
   YnGc3MkPzlnp+tqeMCxkAB0mVBlUSe7cz7a/kCPNzzAHiC5qsEbkP1J7x
   S2XMgxJe3uoqtmvWkAXCbEI7IZrgFA3PbCwV65BoFu2CdDZlmn6+X++4M
   YkvBMp45cnE/wacwaF+h9fUKMtRVKyFlSSfeEkd5KwUuNnVkStaKem/AG
   7TWuzoY0rJRkHSAPcFDhwuKEWE1/1H4m6VbS+P4nIxdmGg1LOSJAREtmr
   /Reb1fDf9i2sRP6zdxdxPbItZi2J2W4QACb3I+Z1RpIoN0Fk01F5YxotM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="2617663"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2617663"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 08:41:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="787604882"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="787604882"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Jan 2024 08:41:34 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU8Dr-0003Zi-2e;
	Sun, 28 Jan 2024 16:41:31 +0000
Date: Mon, 29 Jan 2024 00:40:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/enable-unsigned-sanitizer 26/100]
 fs/bcachefs/btree_locking.c:374:9: error: use of undeclared identifier
 'sub_wrap'
Message-ID: <202401290037.HTRCJohQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/enable-unsigned-sanitizer
head:   a7e79409b1cc59a7f181e2b04e0cb4835b620b81
commit: 41236ed2b6bd8c9f9fdd235e7a44b7729c36e38a [26/100] [WIP] include/linux/jiffies.h: wrapping jiffies: use sub_wrap()
config: i386-buildonly-randconfig-003-20240128 (https://download.01.org/0day-ci/archive/20240129/202401290037.HTRCJohQ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290037.HTRCJohQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290037.HTRCJohQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/btree_locking.c:374:9: error: too few arguments provided to function-like macro invocation
     374 |                                     time_after_eq64(top->lock_start_time, trans->locking_wait.start_time))
         |                                     ^
   include/linux/jiffies.h:225:42: note: expanded from macro 'time_after_eq64'
     225 |          ((__s64)sub_wrap(__u64, ((a), (b)) >= 0))
         |                                                 ^
   include/linux/overflow.h:177:9: note: macro 'sub_wrap' defined here
     177 | #define sub_wrap(type, a, b)                            \
         |         ^
>> fs/bcachefs/btree_locking.c:374:9: error: use of undeclared identifier 'sub_wrap'
     374 |                                     time_after_eq64(top->lock_start_time, trans->locking_wait.start_time))
         |                                     ^
   include/linux/jiffies.h:225:11: note: expanded from macro 'time_after_eq64'
     225 |          ((__s64)sub_wrap(__u64, ((a), (b)) >= 0))
         |                  ^
   2 errors generated.
--
>> fs/bcachefs/six.c:439:8: error: too few arguments provided to function-like macro invocation
     439 |                         if (time_before_eq64(wait->start_time, last->start_time))
         |                             ^
   include/linux/jiffies.h:236:31: note: expanded from macro 'time_before_eq64'
     236 | #define time_before_eq64(a,b)   time_after_eq64(b,a)
         |                                 ^
   include/linux/jiffies.h:225:42: note: expanded from macro 'time_after_eq64'
     225 |          ((__s64)sub_wrap(__u64, ((a), (b)) >= 0))
         |                                                 ^
   include/linux/overflow.h:177:9: note: macro 'sub_wrap' defined here
     177 | #define sub_wrap(type, a, b)                            \
         |         ^
>> fs/bcachefs/six.c:439:8: error: use of undeclared identifier 'sub_wrap'
     439 |                         if (time_before_eq64(wait->start_time, last->start_time))
         |                             ^
   include/linux/jiffies.h:236:31: note: expanded from macro 'time_before_eq64'
     236 | #define time_before_eq64(a,b)   time_after_eq64(b,a)
         |                                 ^
   include/linux/jiffies.h:225:11: note: expanded from macro 'time_after_eq64'
     225 |          ((__s64)sub_wrap(__u64, ((a), (b)) >= 0))
         |                  ^
   2 errors generated.


vim +/sub_wrap +374 fs/bcachefs/btree_locking.c

33bd5d068603f9 Kent Overstreet 2022-08-22  284  
96d994b37cfcf4 Kent Overstreet 2022-08-22  285  int bch2_check_for_deadlock(struct btree_trans *trans, struct printbuf *cycle)
33bd5d068603f9 Kent Overstreet 2022-08-22  286  {
33bd5d068603f9 Kent Overstreet 2022-08-22  287  	struct lock_graph g;
33bd5d068603f9 Kent Overstreet 2022-08-22  288  	struct trans_waiting_for_lock *top;
33bd5d068603f9 Kent Overstreet 2022-08-22  289  	struct btree_bkey_cached_common *b;
fea153a84557c9 Kent Overstreet 2023-12-12  290  	btree_path_idx_t path_idx;
fea153a84557c9 Kent Overstreet 2023-12-12  291  	int ret = 0;
33bd5d068603f9 Kent Overstreet 2022-08-22  292  
3398124444b900 Kent Overstreet 2023-05-26  293  	g.nr = 0;
3398124444b900 Kent Overstreet 2023-05-26  294  
0d7009d7ca99ad Kent Overstreet 2022-08-22  295  	if (trans->lock_must_abort) {
40405557b92dfe Kent Overstreet 2023-01-20  296  		if (cycle)
40405557b92dfe Kent Overstreet 2023-01-20  297  			return -1;
40405557b92dfe Kent Overstreet 2023-01-20  298  
c13fbb7de2fc4f Kent Overstreet 2024-01-04  299  		trace_would_deadlock(&g, trans);
33bd5d068603f9 Kent Overstreet 2022-08-22  300  		return btree_trans_restart(trans, BCH_ERR_transaction_restart_would_deadlock);
0d7009d7ca99ad Kent Overstreet 2022-08-22  301  	}
33bd5d068603f9 Kent Overstreet 2022-08-22  302  
896f1b316f8e8f Kent Overstreet 2022-10-12  303  	lock_graph_down(&g, trans);
fea153a84557c9 Kent Overstreet 2023-12-12  304  
fea153a84557c9 Kent Overstreet 2023-12-12  305  	/* trans->paths is rcu protected vs. freeing */
fea153a84557c9 Kent Overstreet 2023-12-12  306  	rcu_read_lock();
fea153a84557c9 Kent Overstreet 2023-12-12  307  	if (cycle)
fea153a84557c9 Kent Overstreet 2023-12-12  308  		cycle->atomic++;
33bd5d068603f9 Kent Overstreet 2022-08-22  309  next:
33bd5d068603f9 Kent Overstreet 2022-08-22  310  	if (!g.nr)
fea153a84557c9 Kent Overstreet 2023-12-12  311  		goto out;
33bd5d068603f9 Kent Overstreet 2022-08-22  312  
33bd5d068603f9 Kent Overstreet 2022-08-22  313  	top = &g.g[g.nr - 1];
33bd5d068603f9 Kent Overstreet 2022-08-22  314  
fea153a84557c9 Kent Overstreet 2023-12-12  315  	struct btree_path *paths = rcu_dereference(top->trans->paths);
fea153a84557c9 Kent Overstreet 2023-12-12  316  	if (!paths)
fea153a84557c9 Kent Overstreet 2023-12-12  317  		goto up;
fea153a84557c9 Kent Overstreet 2023-12-12  318  
fea153a84557c9 Kent Overstreet 2023-12-12  319  	unsigned long *paths_allocated = trans_paths_allocated(paths);
fea153a84557c9 Kent Overstreet 2023-12-12  320  
fea153a84557c9 Kent Overstreet 2023-12-12  321  	trans_for_each_path_idx_from(paths_allocated, *trans_paths_nr(paths),
fea153a84557c9 Kent Overstreet 2023-12-12  322  				     path_idx, top->path_idx) {
fea153a84557c9 Kent Overstreet 2023-12-12  323  		struct btree_path *path = paths + path_idx;
33bd5d068603f9 Kent Overstreet 2022-08-22  324  		if (!path->nodes_locked)
33bd5d068603f9 Kent Overstreet 2022-08-22  325  			continue;
33bd5d068603f9 Kent Overstreet 2022-08-22  326  
f154c3eb429a34 Kent Overstreet 2023-05-27  327  		if (path_idx != top->path_idx) {
f154c3eb429a34 Kent Overstreet 2023-05-27  328  			top->path_idx		= path_idx;
33bd5d068603f9 Kent Overstreet 2022-08-22  329  			top->level		= 0;
33bd5d068603f9 Kent Overstreet 2022-08-22  330  			top->lock_start_time	= 0;
33bd5d068603f9 Kent Overstreet 2022-08-22  331  		}
33bd5d068603f9 Kent Overstreet 2022-08-22  332  
33bd5d068603f9 Kent Overstreet 2022-08-22  333  		for (;
33bd5d068603f9 Kent Overstreet 2022-08-22  334  		     top->level < BTREE_MAX_DEPTH;
33bd5d068603f9 Kent Overstreet 2022-08-22  335  		     top->level++, top->lock_start_time = 0) {
33bd5d068603f9 Kent Overstreet 2022-08-22  336  			int lock_held = btree_node_locked_type(path, top->level);
33bd5d068603f9 Kent Overstreet 2022-08-22  337  
33bd5d068603f9 Kent Overstreet 2022-08-22  338  			if (lock_held == BTREE_NODE_UNLOCKED)
33bd5d068603f9 Kent Overstreet 2022-08-22  339  				continue;
33bd5d068603f9 Kent Overstreet 2022-08-22  340  
33bd5d068603f9 Kent Overstreet 2022-08-22  341  			b = &READ_ONCE(path->l[top->level].b)->c;
33bd5d068603f9 Kent Overstreet 2022-08-22  342  
80df5b8cacceb2 Kent Overstreet 2023-01-20  343  			if (IS_ERR_OR_NULL(b)) {
80df5b8cacceb2 Kent Overstreet 2023-01-20  344  				/*
80df5b8cacceb2 Kent Overstreet 2023-01-20  345  				 * If we get here, it means we raced with the
80df5b8cacceb2 Kent Overstreet 2023-01-20  346  				 * other thread updating its btree_path
80df5b8cacceb2 Kent Overstreet 2023-01-20  347  				 * structures - which means it can't be blocked
80df5b8cacceb2 Kent Overstreet 2023-01-20  348  				 * waiting on a lock:
80df5b8cacceb2 Kent Overstreet 2023-01-20  349  				 */
80df5b8cacceb2 Kent Overstreet 2023-01-20  350  				if (!lock_graph_remove_non_waiters(&g)) {
80df5b8cacceb2 Kent Overstreet 2023-01-20  351  					/*
80df5b8cacceb2 Kent Overstreet 2023-01-20  352  					 * If lock_graph_remove_non_waiters()
80df5b8cacceb2 Kent Overstreet 2023-01-20  353  					 * didn't do anything, it must be
80df5b8cacceb2 Kent Overstreet 2023-01-20  354  					 * because we're being called by debugfs
80df5b8cacceb2 Kent Overstreet 2023-01-20  355  					 * checking for lock cycles, which
80df5b8cacceb2 Kent Overstreet 2023-01-20  356  					 * invokes us on btree_transactions that
80df5b8cacceb2 Kent Overstreet 2023-01-20  357  					 * aren't actually waiting on anything.
80df5b8cacceb2 Kent Overstreet 2023-01-20  358  					 * Just bail out:
80df5b8cacceb2 Kent Overstreet 2023-01-20  359  					 */
80df5b8cacceb2 Kent Overstreet 2023-01-20  360  					lock_graph_pop_all(&g);
80df5b8cacceb2 Kent Overstreet 2023-01-20  361  				}
80df5b8cacceb2 Kent Overstreet 2023-01-20  362  
33bd5d068603f9 Kent Overstreet 2022-08-22  363  				goto next;
33bd5d068603f9 Kent Overstreet 2022-08-22  364  			}
33bd5d068603f9 Kent Overstreet 2022-08-22  365  
33bd5d068603f9 Kent Overstreet 2022-08-22  366  			if (list_empty_careful(&b->lock.wait_list))
33bd5d068603f9 Kent Overstreet 2022-08-22  367  				continue;
33bd5d068603f9 Kent Overstreet 2022-08-22  368  
33bd5d068603f9 Kent Overstreet 2022-08-22  369  			raw_spin_lock(&b->lock.wait_lock);
33bd5d068603f9 Kent Overstreet 2022-08-22  370  			list_for_each_entry(trans, &b->lock.wait_list, locking_wait.list) {
33bd5d068603f9 Kent Overstreet 2022-08-22  371  				BUG_ON(b != trans->locking);
33bd5d068603f9 Kent Overstreet 2022-08-22  372  
33bd5d068603f9 Kent Overstreet 2022-08-22  373  				if (top->lock_start_time &&
33bd5d068603f9 Kent Overstreet 2022-08-22 @374  				    time_after_eq64(top->lock_start_time, trans->locking_wait.start_time))
33bd5d068603f9 Kent Overstreet 2022-08-22  375  					continue;
33bd5d068603f9 Kent Overstreet 2022-08-22  376  
33bd5d068603f9 Kent Overstreet 2022-08-22  377  				top->lock_start_time = trans->locking_wait.start_time;
33bd5d068603f9 Kent Overstreet 2022-08-22  378  
33bd5d068603f9 Kent Overstreet 2022-08-22  379  				/* Don't check for self deadlock: */
33bd5d068603f9 Kent Overstreet 2022-08-22  380  				if (trans == top->trans ||
33bd5d068603f9 Kent Overstreet 2022-08-22  381  				    !lock_type_conflicts(lock_held, trans->locking_wait.lock_want))
33bd5d068603f9 Kent Overstreet 2022-08-22  382  					continue;
33bd5d068603f9 Kent Overstreet 2022-08-22  383  
6547ebabdaac44 Kent Overstreet 2023-06-19  384  				closure_get(&trans->ref);
33bd5d068603f9 Kent Overstreet 2022-08-22  385  				raw_spin_unlock(&b->lock.wait_lock);
33bd5d068603f9 Kent Overstreet 2022-08-22  386  
6547ebabdaac44 Kent Overstreet 2023-06-19  387  				ret = lock_graph_descend(&g, trans, cycle);
33bd5d068603f9 Kent Overstreet 2022-08-22  388  				if (ret)
fea153a84557c9 Kent Overstreet 2023-12-12  389  					goto out;
33bd5d068603f9 Kent Overstreet 2022-08-22  390  				goto next;
33bd5d068603f9 Kent Overstreet 2022-08-22  391  
33bd5d068603f9 Kent Overstreet 2022-08-22  392  			}
33bd5d068603f9 Kent Overstreet 2022-08-22  393  			raw_spin_unlock(&b->lock.wait_lock);
33bd5d068603f9 Kent Overstreet 2022-08-22  394  		}
33bd5d068603f9 Kent Overstreet 2022-08-22  395  	}
fea153a84557c9 Kent Overstreet 2023-12-12  396  up:
40a44873a5ca98 Kent Overstreet 2022-10-02  397  	if (g.nr > 1 && cycle)
40a44873a5ca98 Kent Overstreet 2022-10-02  398  		print_chain(cycle, &g);
896f1b316f8e8f Kent Overstreet 2022-10-12  399  	lock_graph_up(&g);
33bd5d068603f9 Kent Overstreet 2022-08-22  400  	goto next;
fea153a84557c9 Kent Overstreet 2023-12-12  401  out:
fea153a84557c9 Kent Overstreet 2023-12-12  402  	if (cycle)
fea153a84557c9 Kent Overstreet 2023-12-12  403  		--cycle->atomic;
fea153a84557c9 Kent Overstreet 2023-12-12  404  	rcu_read_unlock();
fea153a84557c9 Kent Overstreet 2023-12-12  405  	return ret;
33bd5d068603f9 Kent Overstreet 2022-08-22  406  }
33bd5d068603f9 Kent Overstreet 2022-08-22  407  

:::::: The code at line 374 was first introduced by commit
:::::: 33bd5d068603f9e81e0b73dbe50e9b88b2e56d0d bcachefs: Deadlock cycle detector

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
