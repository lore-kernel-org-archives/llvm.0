Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF0E1D5CD4;
	Thu, 23 Jan 2025 06:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737615009; cv=none; b=cYWOwAThLvPgSDMr+hAeWV9FWEy9g7Oqut+ZhCYcIR5LV22vZoTd6NnPGr4SVsfMa9Vn/1aAelPGMlFiqESomBb+oCvGcXOtNxJ0YT6jcV8XSOqyNd9HsvfFw4zI82k+DgK/DZhkgRQccicgj3GQl+xLd9MUuGEtz6IxmwmW51Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737615009; c=relaxed/simple;
	bh=56wEB3sKEhDalvbcT0fvRMtILZ4npHnhd2fhcQL3z+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WoUO+kRDsdLxbhr8FDR0zUtoSPAk9n7fDquKZ8l5eYP/CCF7Dljp00z2i8HxE3zzToNnI17EwLYNDRlc5TtcN2uVx516iaAJ0tM7cRcc413y3jundKeeZtxbeC1jMbi6IcpvoFwwT2yXK5HMHdA+otv0HKQQgi7u+N0ih+suaDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIB2Y0+E; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIB2Y0+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737615007; x=1769151007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=56wEB3sKEhDalvbcT0fvRMtILZ4npHnhd2fhcQL3z+s=;
  b=lIB2Y0+EOg+GLT+U/SL3nmynpbC4Qg+BvBit4FuvvxPtzzvnBTTi/H71
   bt3Lz6I/oCH9NOU8oWhYeKWABsoJQ9V9TvbY92OqTtA2xNkEHaX8zdNvq
   F9kO5ah8YvzCDmo5ajQcOm4IZAl6cysA/AxVDqyzkbWhlkvgbtkJQpaNT
   2ySteOb6b+fGwLb0DEnQRMlx65qNMnde3RX9HpMhBH90ev9bNSehlAHWy
   AmM3Nri7ui5T9nxJ163S9pla0BT0WmyV4TtLaae/Tk1IJc+jqu+Qdn1mw
   TJpKyawPC7gXVuFHWnN42fIReDfn6IfjEfbgR0kIrcTyOwMwHY2XWm5GV
   g==;
X-CSE-ConnectionGUID: EIZZ9DrUR0yKs6aRKGqbvA==
X-CSE-MsgGUID: xr//pW6WQOqDTpklSmVKlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37798417"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="37798417"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 22:50:06 -0800
X-CSE-ConnectionGUID: YD4Cy+vjREO2EVZzFVRHag==
X-CSE-MsgGUID: PIdevys2TQe5Rsn9e0piUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112476234"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Jan 2025 22:50:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tar2Q-000aqb-2h;
	Thu, 23 Jan 2025 06:50:02 +0000
Date: Thu, 23 Jan 2025 14:49:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-6.14 8/8] io_uring/io_uring.c:321:8: error: no
 member named 'init' in 'io_async_msghdr'
Message-ID: <202501231409.sM2oidck-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-6.14
head:   eaf99654a6373a5807ec91dad44f828454a5c218
commit: eaf99654a6373a5807ec91dad44f828454a5c218 [8/8] io_uring: get rid of alloc cache init_once handling
config: i386-buildonly-randconfig-002-20250123 (https://download.01.org/0day-ci/archive/20250123/202501231409.sM2oidck-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231409.sM2oidck-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231409.sM2oidck-lkp@intel.com/

All errors (new ones prefixed by >>):

>> io_uring/io_uring.c:321:8: error: no member named 'init' in 'io_async_msghdr'
     321 |                             offsetof(struct io_async_msghdr, init));
         |                             ^                                ~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
   1 error generated.


vim +321 io_uring/io_uring.c

   284	
   285	static __cold struct io_ring_ctx *io_ring_ctx_alloc(struct io_uring_params *p)
   286	{
   287		struct io_ring_ctx *ctx;
   288		int hash_bits;
   289		bool ret;
   290	
   291		ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
   292		if (!ctx)
   293			return NULL;
   294	
   295		xa_init(&ctx->io_bl_xa);
   296	
   297		/*
   298		 * Use 5 bits less than the max cq entries, that should give us around
   299		 * 32 entries per hash list if totally full and uniformly spread, but
   300		 * don't keep too many buckets to not overconsume memory.
   301		 */
   302		hash_bits = ilog2(p->cq_entries) - 5;
   303		hash_bits = clamp(hash_bits, 1, 8);
   304		if (io_alloc_hash_table(&ctx->cancel_table, hash_bits))
   305			goto err;
   306		if (percpu_ref_init(&ctx->refs, io_ring_ctx_ref_free,
   307				    0, GFP_KERNEL))
   308			goto err;
   309	
   310		ctx->flags = p->flags;
   311		ctx->hybrid_poll_time = LLONG_MAX;
   312		atomic_set(&ctx->cq_wait_nr, IO_CQ_WAKE_INIT);
   313		init_waitqueue_head(&ctx->sqo_sq_wait);
   314		INIT_LIST_HEAD(&ctx->sqd_list);
   315		INIT_LIST_HEAD(&ctx->cq_overflow_list);
   316		INIT_LIST_HEAD(&ctx->io_buffers_cache);
   317		ret = io_alloc_cache_init(&ctx->apoll_cache, IO_POLL_ALLOC_CACHE_MAX,
   318				    sizeof(struct async_poll), 0);
   319		ret |= io_alloc_cache_init(&ctx->netmsg_cache, IO_ALLOC_CACHE_MAX,
   320				    sizeof(struct io_async_msghdr),
 > 321				    offsetof(struct io_async_msghdr, init));
   322		ret |= io_alloc_cache_init(&ctx->rw_cache, IO_ALLOC_CACHE_MAX,
   323				    sizeof(struct io_async_rw),
   324				    offsetof(struct io_async_rw, init));
   325		ret |= io_alloc_cache_init(&ctx->uring_cache, IO_ALLOC_CACHE_MAX,
   326				    sizeof(struct io_uring_cmd_data),
   327				    offsetof(struct io_uring_cmd_data, init));
   328		spin_lock_init(&ctx->msg_lock);
   329		ret |= io_alloc_cache_init(&ctx->msg_cache, IO_ALLOC_CACHE_MAX,
   330				    sizeof(struct io_kiocb), 0);
   331		ret |= io_futex_cache_init(ctx);
   332		if (ret)
   333			goto free_ref;
   334		init_completion(&ctx->ref_comp);
   335		xa_init_flags(&ctx->personalities, XA_FLAGS_ALLOC1);
   336		mutex_init(&ctx->uring_lock);
   337		init_waitqueue_head(&ctx->cq_wait);
   338		init_waitqueue_head(&ctx->poll_wq);
   339		spin_lock_init(&ctx->completion_lock);
   340		raw_spin_lock_init(&ctx->timeout_lock);
   341		INIT_WQ_LIST(&ctx->iopoll_list);
   342		INIT_LIST_HEAD(&ctx->io_buffers_comp);
   343		INIT_LIST_HEAD(&ctx->defer_list);
   344		INIT_LIST_HEAD(&ctx->timeout_list);
   345		INIT_LIST_HEAD(&ctx->ltimeout_list);
   346		init_llist_head(&ctx->work_llist);
   347		INIT_LIST_HEAD(&ctx->tctx_list);
   348		ctx->submit_state.free_list.next = NULL;
   349		INIT_HLIST_HEAD(&ctx->waitid_list);
   350	#ifdef CONFIG_FUTEX
   351		INIT_HLIST_HEAD(&ctx->futex_list);
   352	#endif
   353		INIT_DELAYED_WORK(&ctx->fallback_work, io_fallback_req_func);
   354		INIT_WQ_LIST(&ctx->submit_state.compl_reqs);
   355		INIT_HLIST_HEAD(&ctx->cancelable_uring_cmd);
   356		io_napi_init(ctx);
   357		mutex_init(&ctx->mmap_lock);
   358	
   359		return ctx;
   360	
   361	free_ref:
   362		percpu_ref_exit(&ctx->refs);
   363	err:
   364		io_alloc_cache_free(&ctx->apoll_cache, kfree);
   365		io_alloc_cache_free(&ctx->netmsg_cache, io_netmsg_cache_free);
   366		io_alloc_cache_free(&ctx->rw_cache, io_rw_cache_free);
   367		io_alloc_cache_free(&ctx->uring_cache, kfree);
   368		io_alloc_cache_free(&ctx->msg_cache, kfree);
   369		io_futex_cache_free(ctx);
   370		kvfree(ctx->cancel_table.hbs);
   371		xa_destroy(&ctx->io_bl_xa);
   372		kfree(ctx);
   373		return NULL;
   374	}
   375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
