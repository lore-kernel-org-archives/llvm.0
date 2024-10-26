Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CF02B9B9;
	Sat, 26 Oct 2024 17:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729965440; cv=none; b=eiMoipabIXmBcWXxIQqqYK8oHL3dXyuCSHZYNSWFMHA4CL33bpvaFr899ghJfN+pkm0Clo5opoUymz2iPhazV95mVidu1Ekj2dWX3//pxJ0Ufv8vfdXq9b19ISgDNvSNbAcO9IHLdwvGgpMWzkHm0lPzEq5HvJXbcCWF4wgUL6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729965440; c=relaxed/simple;
	bh=SSRPuWeVkZ3gvmcs2le6jAqBRDCYOdFoqwH7JMixkP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=InDWfw6vxOOL66YkG4Yw70eHa2Ztp7RgKkTFUyxS19JNiAkutbqp2vi7TnA3LeWIfeNgJbwBkU0N67AQblKJ5eyjKwLNbkU6PT7ZThUzDDBMxx785vsbIk2/auDyVr5tRA8FJ5Cue/wNFRky9UXGRYZCBAJFB/dSTXu7LudQh3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VNfMF5xk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VNfMF5xk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729965437; x=1761501437;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SSRPuWeVkZ3gvmcs2le6jAqBRDCYOdFoqwH7JMixkP0=;
  b=VNfMF5xkvx0W6V/JytMh7O3Rp13Oy2/BPJdWG/5IePcQIfaBN4w9PKGA
   SXAfOaPjduvPCtQo56iZwF3Msx1bVJnZti06lgwIb/oxjrjh0Lc/H88Mi
   RTntIBGYqxawHnUUwvbMICIssAukwIWA4fGfKoMlxfaNoj5iPhBrcq7bx
   HctvOuWYrmv3MjBCDSH0cCCvyl/YVwS4RP/cjDHMdF5l2+8oeMaJAuyZF
   TifxkWT9tBy1S8GTkkJQxyAXTfRWBfC0xPJuSC++9cRcHYtULlyHvIXKQ
   vHMj7IwwznPDICElyw9gV8vklx3uV32V0mooLD6peUeIQQtTa85EY1MUY
   A==;
X-CSE-ConnectionGUID: 2wRVFZkJTiW8MKrU4cENEg==
X-CSE-MsgGUID: ZvkGxiO8RLaFLUfyrRbbag==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="29508824"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="29508824"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 10:57:17 -0700
X-CSE-ConnectionGUID: KcPwuyvwSvSbagYsudgH6g==
X-CSE-MsgGUID: Tbzh1edpQ0aZrP7CDZa6mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="112062560"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Oct 2024 10:57:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4l2H-000ZuE-1i;
	Sat, 26 Oct 2024 17:57:13 +0000
Date: Sun, 27 Oct 2024 01:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-rsrc 5/5] io_uring/io_uring.c:315:2: warning:
 variable 'ret' is uninitialized when used here
Message-ID: <202410270144.5QQpiUAO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-rsrc
head:   dfa5034f58b2aefa95ebea2bda0a33944d177d77
commit: dfa5034f58b2aefa95ebea2bda0a33944d177d77 [5/5] io_uring/rsrc: get rid of io_rsrc_node allocation cache
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241027/202410270144.5QQpiUAO-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270144.5QQpiUAO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270144.5QQpiUAO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:45:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> io_uring/io_uring.c:315:2: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     315 |         ret |= io_alloc_cache_init(&ctx->apoll_cache, IO_POLL_ALLOC_CACHE_MAX,
         |         ^~~
   io_uring/io_uring.c:288:10: note: initialize the variable 'ret' to silence this warning
     288 |         bool ret;
         |                 ^
         |                  = 0
   5 warnings generated.


vim +/ret +315 io_uring/io_uring.c

e6f89be61410ff io_uring/io_uring.c Pavel Begunkov          2022-06-16  283  
c072481ded14bc fs/io_uring.c       Pavel Begunkov          2021-10-04  284  static __cold struct io_ring_ctx *io_ring_ctx_alloc(struct io_uring_params *p)
2b188cc1bb857a fs/io_uring.c       Jens Axboe              2019-01-07  285  {
2b188cc1bb857a fs/io_uring.c       Jens Axboe              2019-01-07  286  	struct io_ring_ctx *ctx;
9cfc7e94e42be9 fs/io_uring.c       Jens Axboe              2022-05-01  287  	int hash_bits;
414d0f45c31622 io_uring/io_uring.c Jens Axboe              2024-03-20  288  	bool ret;
2b188cc1bb857a fs/io_uring.c       Jens Axboe              2019-01-07  289  
2b188cc1bb857a fs/io_uring.c       Jens Axboe              2019-01-07  290  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
2b188cc1bb857a fs/io_uring.c       Jens Axboe              2019-01-07  291  	if (!ctx)
2b188cc1bb857a fs/io_uring.c       Jens Axboe              2019-01-07  292  		return NULL;
2b188cc1bb857a fs/io_uring.c       Jens Axboe              2019-01-07  293  
9cfc7e94e42be9 fs/io_uring.c       Jens Axboe              2022-05-01  294  	xa_init(&ctx->io_bl_xa);
9cfc7e94e42be9 fs/io_uring.c       Jens Axboe              2022-05-01  295  
78076bb64aa8ba fs/io_uring.c       Jens Axboe              2019-12-04  296  	/*
78076bb64aa8ba fs/io_uring.c       Jens Axboe              2019-12-04  297  	 * Use 5 bits less than the max cq entries, that should give us around
4a07723fb4bb25 io_uring/io_uring.c Pavel Begunkov          2022-06-16  298  	 * 32 entries per hash list if totally full and uniformly spread, but
4a07723fb4bb25 io_uring/io_uring.c Pavel Begunkov          2022-06-16  299  	 * don't keep too many buckets to not overconsume memory.
78076bb64aa8ba fs/io_uring.c       Jens Axboe              2019-12-04  300  	 */
4a07723fb4bb25 io_uring/io_uring.c Pavel Begunkov          2022-06-16  301  	hash_bits = ilog2(p->cq_entries) - 5;
4a07723fb4bb25 io_uring/io_uring.c Pavel Begunkov          2022-06-16  302  	hash_bits = clamp(hash_bits, 1, 8);
e6f89be61410ff io_uring/io_uring.c Pavel Begunkov          2022-06-16  303  	if (io_alloc_hash_table(&ctx->cancel_table, hash_bits))
78076bb64aa8ba fs/io_uring.c       Jens Axboe              2019-12-04  304  		goto err;
214828962dead0 fs/io_uring.c       Roman Gushchin          2019-05-07  305  	if (percpu_ref_init(&ctx->refs, io_ring_ctx_ref_free,
48904229928d94 io_uring/io_uring.c Michal Koutný           2022-07-15  306  			    0, GFP_KERNEL))
206aefde4f886f fs/io_uring.c       Jens Axboe              2019-11-07  307  		goto err;
2b188cc1bb857a fs/io_uring.c       Jens Axboe              2019-01-07  308  
2b188cc1bb857a fs/io_uring.c       Jens Axboe              2019-01-07  309  	ctx->flags = p->flags;
b4bc35cf8704db io_uring/io_uring.c Pavel Begunkov          2024-01-17  310  	atomic_set(&ctx->cq_wait_nr, IO_CQ_WAKE_INIT);
90554200724d5b fs/io_uring.c       Jens Axboe              2020-09-03  311  	init_waitqueue_head(&ctx->sqo_sq_wait);
69fb21310fd36a fs/io_uring.c       Jens Axboe              2020-09-14  312  	INIT_LIST_HEAD(&ctx->sqd_list);
1d7bb1d50fb4dc fs/io_uring.c       Jens Axboe              2019-11-06  313  	INIT_LIST_HEAD(&ctx->cq_overflow_list);
cc3cec8367cba7 fs/io_uring.c       Jens Axboe              2022-03-08  314  	INIT_LIST_HEAD(&ctx->io_buffers_cache);
da22bdf38be2f2 io_uring/io_uring.c Jens Axboe              2024-03-21 @315  	ret |= io_alloc_cache_init(&ctx->apoll_cache, IO_POLL_ALLOC_CACHE_MAX,
69bbc6ade9d9d4 io_uring/io_uring.c Pavel Begunkov          2023-04-04  316  			    sizeof(struct async_poll));
414d0f45c31622 io_uring/io_uring.c Jens Axboe              2024-03-20  317  	ret |= io_alloc_cache_init(&ctx->netmsg_cache, IO_ALLOC_CACHE_MAX,
69bbc6ade9d9d4 io_uring/io_uring.c Pavel Begunkov          2023-04-04  318  			    sizeof(struct io_async_msghdr));
414d0f45c31622 io_uring/io_uring.c Jens Axboe              2024-03-20  319  	ret |= io_alloc_cache_init(&ctx->rw_cache, IO_ALLOC_CACHE_MAX,
a9165b83c1937e io_uring/io_uring.c Jens Axboe              2024-03-18  320  			    sizeof(struct io_async_rw));
414d0f45c31622 io_uring/io_uring.c Jens Axboe              2024-03-20  321  	ret |= io_alloc_cache_init(&ctx->uring_cache, IO_ALLOC_CACHE_MAX,
d10f19dff56eac io_uring/io_uring.c Jens Axboe              2024-03-18  322  			    sizeof(struct uring_cache));
50cf5f3842af31 io_uring/io_uring.c Jens Axboe              2024-06-06  323  	spin_lock_init(&ctx->msg_lock);
50cf5f3842af31 io_uring/io_uring.c Jens Axboe              2024-06-06  324  	ret |= io_alloc_cache_init(&ctx->msg_cache, IO_ALLOC_CACHE_MAX,
50cf5f3842af31 io_uring/io_uring.c Jens Axboe              2024-06-06  325  			    sizeof(struct io_kiocb));
414d0f45c31622 io_uring/io_uring.c Jens Axboe              2024-03-20  326  	ret |= io_futex_cache_init(ctx);
414d0f45c31622 io_uring/io_uring.c Jens Axboe              2024-03-20  327  	if (ret)
3a87e264290d71 io_uring/io_uring.c Guixin Liu              2024-09-23  328  		goto free_ref;
0f158b4cf20e79 fs/io_uring.c       Jens Axboe              2020-05-14  329  	init_completion(&ctx->ref_comp);
61cf93700fe635 fs/io_uring.c       Matthew Wilcox (Oracle  2021-03-08  330) 	xa_init_flags(&ctx->personalities, XA_FLAGS_ALLOC1);
2b188cc1bb857a fs/io_uring.c       Jens Axboe              2019-01-07  331  	mutex_init(&ctx->uring_lock);
311997b3fcddc2 fs/io_uring.c       Pavel Begunkov          2021-06-14  332  	init_waitqueue_head(&ctx->cq_wait);
7b235dd82ad32c io_uring/io_uring.c Pavel Begunkov          2023-01-09  333  	init_waitqueue_head(&ctx->poll_wq);
2b188cc1bb857a fs/io_uring.c       Jens Axboe              2019-01-07  334  	spin_lock_init(&ctx->completion_lock);
89850fce16a1a7 fs/io_uring.c       Jens Axboe              2021-08-10  335  	spin_lock_init(&ctx->timeout_lock);
5eef4e87eb0b2b fs/io_uring.c       Pavel Begunkov          2021-09-24  336  	INIT_WQ_LIST(&ctx->iopoll_list);
cc3cec8367cba7 fs/io_uring.c       Jens Axboe              2022-03-08  337  	INIT_LIST_HEAD(&ctx->io_buffers_comp);
de0617e467171b fs/io_uring.c       Jens Axboe              2019-04-06  338  	INIT_LIST_HEAD(&ctx->defer_list);
5262f567987d3c fs/io_uring.c       Jens Axboe              2019-09-17  339  	INIT_LIST_HEAD(&ctx->timeout_list);
ef9dd637084d43 fs/io_uring.c       Pavel Begunkov          2021-08-28  340  	INIT_LIST_HEAD(&ctx->ltimeout_list);
c0e0d6ba25f180 io_uring/io_uring.c Dylan Yudaken           2022-08-30  341  	init_llist_head(&ctx->work_llist);
13bf43f5f47397 fs/io_uring.c       Pavel Begunkov          2021-03-06  342  	INIT_LIST_HEAD(&ctx->tctx_list);
c2b6c6bc4e0d34 fs/io_uring.c       Pavel Begunkov          2021-09-24  343  	ctx->submit_state.free_list.next = NULL;
f31ecf671ddc49 io_uring/io_uring.c Jens Axboe              2023-07-10  344  	INIT_HLIST_HEAD(&ctx->waitid_list);
194bb58c6090e3 io_uring/io_uring.c Jens Axboe              2023-06-08  345  #ifdef CONFIG_FUTEX
194bb58c6090e3 io_uring/io_uring.c Jens Axboe              2023-06-08  346  	INIT_HLIST_HEAD(&ctx->futex_list);
194bb58c6090e3 io_uring/io_uring.c Jens Axboe              2023-06-08  347  #endif
9011bf9a13e3b5 fs/io_uring.c       Pavel Begunkov          2021-06-30  348  	INIT_DELAYED_WORK(&ctx->fallback_work, io_fallback_req_func);
6f33b0bc4ea43f fs/io_uring.c       Pavel Begunkov          2021-09-24  349  	INIT_WQ_LIST(&ctx->submit_state.compl_reqs);
93b8cc60c37b9d io_uring/io_uring.c Ming Lei                2023-09-28  350  	INIT_HLIST_HEAD(&ctx->cancelable_uring_cmd);
8d0c12a80cdeb8 io_uring/io_uring.c Stefan Roesch           2023-06-08  351  	io_napi_init(ctx);
909b9acefcc3bc io_uring/io_uring.c Jens Axboe              2024-10-21  352  	mutex_init(&ctx->resize_lock);
8d0c12a80cdeb8 io_uring/io_uring.c Stefan Roesch           2023-06-08  353  
2b188cc1bb857a fs/io_uring.c       Jens Axboe              2019-01-07  354  	return ctx;
3a87e264290d71 io_uring/io_uring.c Guixin Liu              2024-09-23  355  
3a87e264290d71 io_uring/io_uring.c Guixin Liu              2024-09-23  356  free_ref:
3a87e264290d71 io_uring/io_uring.c Guixin Liu              2024-09-23  357  	percpu_ref_exit(&ctx->refs);
206aefde4f886f fs/io_uring.c       Jens Axboe              2019-11-07  358  err:
414d0f45c31622 io_uring/io_uring.c Jens Axboe              2024-03-20  359  	io_alloc_cache_free(&ctx->apoll_cache, kfree);
414d0f45c31622 io_uring/io_uring.c Jens Axboe              2024-03-20  360  	io_alloc_cache_free(&ctx->netmsg_cache, io_netmsg_cache_free);
414d0f45c31622 io_uring/io_uring.c Jens Axboe              2024-03-20  361  	io_alloc_cache_free(&ctx->rw_cache, io_rw_cache_free);
414d0f45c31622 io_uring/io_uring.c Jens Axboe              2024-03-20  362  	io_alloc_cache_free(&ctx->uring_cache, kfree);
50cf5f3842af31 io_uring/io_uring.c Jens Axboe              2024-06-06  363  	io_alloc_cache_free(&ctx->msg_cache, io_msg_cache_free);
414d0f45c31622 io_uring/io_uring.c Jens Axboe              2024-03-20  364  	io_futex_cache_free(ctx);
7ee4d05790e5a6 io_uring/io_uring.c Jens Axboe              2024-09-30  365  	kvfree(ctx->cancel_table.hbs);
9cfc7e94e42be9 fs/io_uring.c       Jens Axboe              2022-05-01  366  	xa_destroy(&ctx->io_bl_xa);
206aefde4f886f fs/io_uring.c       Jens Axboe              2019-11-07  367  	kfree(ctx);
206aefde4f886f fs/io_uring.c       Jens Axboe              2019-11-07  368  	return NULL;
2b188cc1bb857a fs/io_uring.c       Jens Axboe              2019-01-07  369  }
2b188cc1bb857a fs/io_uring.c       Jens Axboe              2019-01-07  370  

:::::: The code at line 315 was first introduced by commit
:::::: da22bdf38be2f2ba557d3031108614ebbba265e1 io_uring/poll: shrink alloc cache size to 32

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
