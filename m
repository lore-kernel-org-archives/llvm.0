Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7481B3F23;
	Mon,  9 Sep 2024 14:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725890908; cv=none; b=Jlpo+gIBn/yB7CAyMXjQrL0KKEydogmIeZCkuRhJB4lg67qMt2IOHP4n+fdKBPw24xGaaH7Smv885WHtGUGTBorOqF32L0s4pLWbniCe8L4LlZDXocfjt+rCSzbKgdODLKvwMOMQxoerg8lQD5U3d/hZTzpdvfmYYZ//F7PF4/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725890908; c=relaxed/simple;
	bh=9ZZu4QY2OLfeNxckvLpM1qYrr+Qxalay7XeedL8h/U8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bQTufSLTBRwiMT9EPRWcBIf1N9kqTCpAICXmLBYRtayv7qBYtJOA2CbmZgQDMKSjkKoC+egQC4zdfnZYG7VI/NuVCMfm/k6d7Ar8JUIQzTqyPWs8Zsb2FOP+oFZnpN1vroPOaGUi7vESoljHBUBUa5NBPdBF6KFgByFsK6JaQB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEONf8AG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEONf8AG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725890906; x=1757426906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ZZu4QY2OLfeNxckvLpM1qYrr+Qxalay7XeedL8h/U8=;
  b=YEONf8AGxPFMgCJpAC/jiibHNFCnfKpjJXZVsi61vf8lINZS7peU55jN
   QU5W61MzZhl7ZTFxY7xsNA3T5/AEf5XFLwNEyz+8wrmfegbjtIf2XLWWy
   LjSIFCxj2pJwB8Z3NVcJUq2QdVSGzHHbz3VfTJRMmcQGeGvVRsfutpL6y
   P5u3sA8H2t3lwjmRZ+T1koW9+BhIcg4M+IVUrh2v3N7+0OyjpCs7xI89G
   jzHRF2DtvaT0rkjUxPGw/9hKpjjOuKz3Uww6jTvZKQzrP1Atwv5BXuF7A
   FU5JXYPRUPqNy8iOrQtp2xQMPk484eLltEMS0GG5D4cO41Pc4wUa6R5gl
   w==;
X-CSE-ConnectionGUID: jQfuNDr+TNiYO36VK3K4+A==
X-CSE-MsgGUID: 4/Q1Rv28SUqaVb3RxCx0pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="50000785"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="50000785"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 07:08:22 -0700
X-CSE-ConnectionGUID: 6dTWO/iaSoe6uHLNij1AVw==
X-CSE-MsgGUID: MP4DwsIrQeKAmahFeUxHkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="67208392"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Sep 2024 07:08:21 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snf3y-000EnA-26;
	Mon, 09 Sep 2024 14:08:18 +0000
Date: Mon, 9 Sep 2024 22:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 192/258]
 kernel/rcu/pending.c:428:22: error: call to undeclared function
 'is_vmalloc_addr_inlined'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202409092254.aYJpOniO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: b2025b96fdff5877c7c3de511ff5e0456cc3142a [192/258] rcu: lift rcu_pending from bcachefs
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240909/202409092254.aYJpOniO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409092254.aYJpOniO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409092254.aYJpOniO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/pending.c:6:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/rcu/pending.c:428:22: error: call to undeclared function 'is_vmalloc_addr_inlined'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     428 |         if (ptr && unlikely(is_vmalloc_addr_inlined(ptr)))
         |                             ^
   1 warning and 1 error generated.


vim +/is_vmalloc_addr_inlined +428 kernel/rcu/pending.c

b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  405  
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  406  	struct rcu_pending_pcpu *p;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  407  	struct rcu_pending_seq *objs;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  408  	struct genradix_node *new_node = NULL;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  409  	unsigned long seq, flags;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  410  	bool start_gp = false;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  411  
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  412  	BUG_ON((ptr != NULL) != (pending->process == RCU_PENDING_KVFREE_FN));
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  413  
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  414  	local_irq_save(flags);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  415  	p = this_cpu_ptr(pending->p);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  416  	spin_lock(&p->lock);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  417  	seq = __get_state_synchronize_rcu(pending->srcu);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  418  restart:
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  419  	if (may_sleep &&
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  420  	    unlikely(process_finished_items(pending, p, flags)))
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  421  		goto check_expired;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  422  
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  423  	/*
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  424  	 * In kvfree_rcu() mode, the radix tree is only for slab pointers so
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  425  	 * that we can do kfree_bulk() - vmalloc pointers always use the linked
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  426  	 * list:
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  427  	 */
a2a5fdffbb4208 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-17 @428  	if (ptr && unlikely(is_vmalloc_addr_inlined(ptr)))
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  429  		goto list_add;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  430  
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  431  	objs = get_object_radix(p, seq);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  432  	if (unlikely(!objs))
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  433  		goto list_add;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  434  
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  435  	if (unlikely(!objs->cursor)) {
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  436  		/*
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  437  		 * New radix tree nodes must be added under @p->lock because the
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  438  		 * tree root is in a darray that can be resized (typically,
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  439  		 * genradix supports concurrent unlocked allocation of new
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  440  		 * nodes) - hence preallocation and the retry loop:
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  441  		 */
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  442  		objs->cursor = genradix_ptr_alloc_preallocated_inlined(&objs->objs,
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  443  						objs->nr, &new_node, GFP_ATOMIC|__GFP_NOWARN);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  444  		if (unlikely(!objs->cursor)) {
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  445  			if (may_sleep) {
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  446  				spin_unlock_irqrestore(&p->lock, flags);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  447  
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  448  				gfp_t gfp = GFP_KERNEL;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  449  				if (!head)
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  450  					gfp |= __GFP_NOFAIL;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  451  
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  452  				new_node = genradix_alloc_node(gfp);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  453  				if (!new_node)
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  454  					may_sleep = false;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  455  				goto check_expired;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  456  			}
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  457  list_add:
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  458  			start_gp = rcu_pending_enqueue_list(p, seq, head, ptr, &flags);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  459  			goto start_gp;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  460  		}
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  461  	}
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  462  
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  463  	*objs->cursor++ = ptr ?: head;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  464  	/* zero cursor if we hit the end of a radix tree node: */
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  465  	if (!(((ulong) objs->cursor) & (GENRADIX_NODE_SIZE - 1)))
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  466  		objs->cursor = NULL;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  467  	start_gp = !objs->nr;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  468  	objs->nr++;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  469  start_gp:
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  470  	if (unlikely(start_gp)) {
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  471  		/*
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  472  		 * We only have one callback (ideally, we would have one for
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  473  		 * every outstanding graceperiod) - so if our callback is
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  474  		 * already in flight, we may still have to start a grace period
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  475  		 * (since we used get_state() above, not start_poll())
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  476  		 */
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  477  		if (!p->cb_armed) {
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  478  			p->cb_armed = true;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  479  			__call_rcu(pending->srcu, &p->cb, rcu_pending_rcu_cb);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  480  		} else {
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  481  			__start_poll_synchronize_rcu(pending->srcu);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  482  		}
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  483  	}
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  484  	spin_unlock_irqrestore(&p->lock, flags);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  485  free_node:
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  486  	if (new_node)
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  487  		genradix_free_node(new_node);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  488  	return;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  489  check_expired:
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  490  	if (unlikely(__poll_state_synchronize_rcu(pending->srcu, seq))) {
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  491  		switch ((ulong) pending->process) {
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  492  		case RCU_PENDING_KVFREE:
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  493  			kvfree(ptr);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  494  			break;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  495  		case RCU_PENDING_CALL_RCU:
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  496  			head->func(head);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  497  			break;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  498  		default:
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  499  			pending->process(pending, head);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  500  			break;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  501  		}
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  502  		goto free_node;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  503  	}
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  504  
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  505  	local_irq_save(flags);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  506  	p = this_cpu_ptr(pending->p);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  507  	spin_lock(&p->lock);
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  508  	goto restart;
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  509  }
b76e32ceb9c00d fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  510  

:::::: The code at line 428 was first introduced by commit
:::::: a2a5fdffbb42082064006597ddabecccdb746d39 vmalloc: is_vmalloc_addr_inlined()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
