Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57654366;
	Thu,  7 Sep 2023 00:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694045604; x=1725581604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xdyepx4YscXohhoeJUq5BRx6aaxmdiaCQHaP1T81FNQ=;
  b=azIvfvFahmZAHEVtrG8T//W6Ign44Agc9dUBmsXsqik0+GOnzN5Y4qqM
   doARpZu7EwRAT5J3zgTlJlxBnaOEq5sGpSvRLB4fyOhQg8hEDbrA2bkmh
   pWY9hsp/y2HLRZaeIK+XkeuVlZJUfwKAxGV+IBdBztyBcuGfbER2ocIwv
   qQjmLenU4GxDUZzLf6mxNQiGQn6YEusL3dZL/dzDABp9MMoiSIiE46hhB
   kx2HXDIxwNiZtWuXhfLfYhkFionz6c4vhk+fnmKgIrH3vmL84hegegRSb
   AZ+zAUVGm2cE29FJ7x5z1sXPFkE4DsAzm4WZV8DvbnI4uWMuUZPuFA3IX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="374613183"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="374613183"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 17:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="856680656"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="856680656"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2023 17:13:22 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe2e8-0000it-0B;
	Thu, 07 Sep 2023 00:13:20 +0000
Date: Thu, 7 Sep 2023 08:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-futex 14/18] io_uring/io_uring.c:355:24:
 error: no member named 'futex_list' in 'struct io_ring_ctx'; did you mean
 'tctx_list'?
Message-ID: <202309070853.jtvSFyKG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-futex
head:   cc9de6d501156f64d1aef29b1dc989e804b4aa59
commit: 6149b18ab8b532e255b795075c43c492bf28f43a [14/18] io_uring: add support for futex wake and wait
config: arm-randconfig-001-20230907 (https://download.01.org/0day-ci/archive/20230907/202309070853.jtvSFyKG-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070853.jtvSFyKG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070853.jtvSFyKG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> io_uring/io_uring.c:355:24: error: no member named 'futex_list' in 'struct io_ring_ctx'; did you mean 'tctx_list'?
           INIT_HLIST_HEAD(&ctx->futex_list);
                                 ^~~~~~~~~~
                                 tctx_list
   include/linux/list.h:933:32: note: expanded from macro 'INIT_HLIST_HEAD'
   #define INIT_HLIST_HEAD(ptr) ((ptr)->first = NULL)
                                  ^
   include/linux/io_uring_types.h:368:20: note: 'tctx_list' declared here
           struct list_head                tctx_list;
                                           ^
>> io_uring/io_uring.c:355:2: error: no member named 'first' in 'struct list_head'
           INIT_HLIST_HEAD(&ctx->futex_list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:933:38: note: expanded from macro 'INIT_HLIST_HEAD'
   #define INIT_HLIST_HEAD(ptr) ((ptr)->first = NULL)
                                 ~~~~~  ^
   2 errors generated.


vim +355 io_uring/io_uring.c

   296	
   297	static __cold struct io_ring_ctx *io_ring_ctx_alloc(struct io_uring_params *p)
   298	{
   299		struct io_ring_ctx *ctx;
   300		int hash_bits;
   301	
   302		ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
   303		if (!ctx)
   304			return NULL;
   305	
   306		xa_init(&ctx->io_bl_xa);
   307	
   308		/*
   309		 * Use 5 bits less than the max cq entries, that should give us around
   310		 * 32 entries per hash list if totally full and uniformly spread, but
   311		 * don't keep too many buckets to not overconsume memory.
   312		 */
   313		hash_bits = ilog2(p->cq_entries) - 5;
   314		hash_bits = clamp(hash_bits, 1, 8);
   315		if (io_alloc_hash_table(&ctx->cancel_table, hash_bits))
   316			goto err;
   317		if (io_alloc_hash_table(&ctx->cancel_table_locked, hash_bits))
   318			goto err;
   319		if (percpu_ref_init(&ctx->refs, io_ring_ctx_ref_free,
   320				    0, GFP_KERNEL))
   321			goto err;
   322	
   323		ctx->flags = p->flags;
   324		init_waitqueue_head(&ctx->sqo_sq_wait);
   325		INIT_LIST_HEAD(&ctx->sqd_list);
   326		INIT_LIST_HEAD(&ctx->cq_overflow_list);
   327		INIT_LIST_HEAD(&ctx->io_buffers_cache);
   328		io_alloc_cache_init(&ctx->rsrc_node_cache, IO_NODE_ALLOC_CACHE_MAX,
   329				    sizeof(struct io_rsrc_node));
   330		io_alloc_cache_init(&ctx->apoll_cache, IO_ALLOC_CACHE_MAX,
   331				    sizeof(struct async_poll));
   332		io_alloc_cache_init(&ctx->netmsg_cache, IO_ALLOC_CACHE_MAX,
   333				    sizeof(struct io_async_msghdr));
   334		io_futex_cache_init(ctx);
   335		init_completion(&ctx->ref_comp);
   336		xa_init_flags(&ctx->personalities, XA_FLAGS_ALLOC1);
   337		mutex_init(&ctx->uring_lock);
   338		init_waitqueue_head(&ctx->cq_wait);
   339		init_waitqueue_head(&ctx->poll_wq);
   340		init_waitqueue_head(&ctx->rsrc_quiesce_wq);
   341		spin_lock_init(&ctx->completion_lock);
   342		spin_lock_init(&ctx->timeout_lock);
   343		INIT_WQ_LIST(&ctx->iopoll_list);
   344		INIT_LIST_HEAD(&ctx->io_buffers_pages);
   345		INIT_LIST_HEAD(&ctx->io_buffers_comp);
   346		INIT_LIST_HEAD(&ctx->defer_list);
   347		INIT_LIST_HEAD(&ctx->timeout_list);
   348		INIT_LIST_HEAD(&ctx->ltimeout_list);
   349		INIT_LIST_HEAD(&ctx->rsrc_ref_list);
   350		init_llist_head(&ctx->work_llist);
   351		INIT_LIST_HEAD(&ctx->tctx_list);
   352		ctx->submit_state.free_list.next = NULL;
   353		INIT_WQ_LIST(&ctx->locked_free_list);
   354		INIT_HLIST_HEAD(&ctx->waitid_list);
 > 355		INIT_HLIST_HEAD(&ctx->futex_list);
   356		INIT_DELAYED_WORK(&ctx->fallback_work, io_fallback_req_func);
   357		INIT_WQ_LIST(&ctx->submit_state.compl_reqs);
   358		return ctx;
   359	err:
   360		kfree(ctx->cancel_table.hbs);
   361		kfree(ctx->cancel_table_locked.hbs);
   362		kfree(ctx->io_bl);
   363		xa_destroy(&ctx->io_bl_xa);
   364		kfree(ctx);
   365		return NULL;
   366	}
   367	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
