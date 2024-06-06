Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5042199E8D;
	Thu,  6 Jun 2024 20:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717706112; cv=none; b=r0p6Hcr5r9+kU02A8/eWwtVvWCjWa9pSsZmKPumTM5aJ7xsj+nGnZVZj0TJheHOR0xg2J9yKNRsqEjr3sgtNYoxEKRUltMLFfDNEa4UcYtD/VCRjnagnJRxv5M8jiDftuE7L1ha/qeW4booZZjBX3EoXj0jE+5rra/MQH8JtW/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717706112; c=relaxed/simple;
	bh=0hWLNf3Qux6YwlgVPzUwqQ7I4rmjkePIxnoozYuX59U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E7uql11TOLK/LBCZ84G5TU7o/5AAZNWVYseVXS30UReqvJitBAzkjHLlZDmS5sPoX+Qi4BeVWqq7V/wXJeFKNaJWh+Kw2eJRx0HfaklUbQtn0/F8xC2RCPIMNR9iwfxGiqXj4bVxokXdc5WCLwnfeiP1PCqX+XYdlcou/GPPHxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dfs2fQDv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dfs2fQDv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717706111; x=1749242111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0hWLNf3Qux6YwlgVPzUwqQ7I4rmjkePIxnoozYuX59U=;
  b=Dfs2fQDvSRb17enF0zGLhX57HoaRB21UdpxUkcLwmFvLy1d1JVcbHZba
   JIAJQXRwMAYH1+z/aksKPcwizgzT1/voJhaaQCJFpxSZWMqaKPUBfz6Gw
   3ePNLmEKljd1+FWQW4hky2E9u3S4aalgVsl77St0ZdKmK3qVxi79gzykY
   vNZffN+FdI/MKZQdDcSSX+VYa27tBjzDK12DXKQ09UWGV/WinbSA+T+6J
   zffZdE0adVAb4etGaw0TM6l9gCzQKeuUrBwELa6GM/UWwTaU9zaIAWBEB
   GGCY7jHGfAvg1j8sMghD1FncMHHgZNTEdYqpVehj9SuIVyOdKm6/KJQFL
   Q==;
X-CSE-ConnectionGUID: k7nFLQRkRFuFEyeI1w2xWw==
X-CSE-MsgGUID: UgggbvOcSWODiZCZj03uSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14244951"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14244951"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 13:35:09 -0700
X-CSE-ConnectionGUID: qZQduw5SS1ObR6Xhs8OOAQ==
X-CSE-MsgGUID: 3TC1oPouQbiHXBJIgF19Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="37943321"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jun 2024 13:35:07 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFJpB-0003gQ-1s;
	Thu, 06 Jun 2024 20:35:05 +0000
Date: Fri, 7 Jun 2024 04:34:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-msg-ring.1 6/7] io_uring/msg_ring.c:95:6:
 warning: variable 'flags' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202406070408.EifgtOJu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-msg-ring.1
head:   0ffab2e0e86e525c59448ded8bac7bbf256e650f
commit: d11afec0fbe1eaf03077a755e2b9cb5386c22d19 [6/7] io_uring/msg_ring: improve handling of target CQE posting
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240607/202406070408.EifgtOJu-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070408.EifgtOJu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070408.EifgtOJu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/msg_ring.c:11:
   In file included from io_uring/io_uring.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> io_uring/msg_ring.c:95:6: warning: variable 'flags' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      95 |         if (msg->flags & IORING_MSG_RING_FLAGS_PASS)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   io_uring/msg_ring.c:100:35: note: uninitialized use occurs here
     100 |         io_req_set_res(target, msg->len, flags);
         |                                          ^~~~~
   io_uring/msg_ring.c:95:2: note: remove the 'if' if its condition is always true
      95 |         if (msg->flags & IORING_MSG_RING_FLAGS_PASS)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      96 |                 flags = msg->cqe_flags;
   io_uring/msg_ring.c:86:11: note: initialize the variable 'flags' to silence this warning
      86 |         u32 flags;
         |                  ^
         |                   = 0
   2 warnings generated.


vim +95 io_uring/msg_ring.c

56d8e3180c065c Pavel Begunkov 2023-01-20   80  
d11afec0fbe1ea Jens Axboe     2024-03-28   81  static int io_msg_data_remote(struct io_kiocb *req)
6d043ee1164ca3 Pavel Begunkov 2022-12-07   82  {
6d043ee1164ca3 Pavel Begunkov 2022-12-07   83  	struct io_ring_ctx *target_ctx = req->file->private_data;
d11afec0fbe1ea Jens Axboe     2024-03-28   84  	struct io_msg *msg = io_kiocb_to_cmd(req, struct io_msg);
d11afec0fbe1ea Jens Axboe     2024-03-28   85  	struct io_kiocb *target;
d11afec0fbe1ea Jens Axboe     2024-03-28   86  	u32 flags;
6d043ee1164ca3 Pavel Begunkov 2022-12-07   87  
d11afec0fbe1ea Jens Axboe     2024-03-28   88  	BUILD_BUG_ON(sizeof_field(struct io_kiocb, cmd) <
d11afec0fbe1ea Jens Axboe     2024-03-28   89  			sizeof(struct io_overflow_cqe) + sizeof(struct io_uring_cqe));
d11afec0fbe1ea Jens Axboe     2024-03-28   90  
d11afec0fbe1ea Jens Axboe     2024-03-28   91  	target = kmem_cache_alloc(req_cachep, GFP_ATOMIC | __GFP_ZERO);
d11afec0fbe1ea Jens Axboe     2024-03-28   92  	if (!target)
d11afec0fbe1ea Jens Axboe     2024-03-28   93  		return -ENOMEM;
8572df941cbef2 Jens Axboe     2023-01-21   94  
8572df941cbef2 Jens Axboe     2023-01-21  @95  	if (msg->flags & IORING_MSG_RING_FLAGS_PASS)
8572df941cbef2 Jens Axboe     2023-01-21   96  		flags = msg->cqe_flags;
8572df941cbef2 Jens Axboe     2023-01-21   97  
d11afec0fbe1ea Jens Axboe     2024-03-28   98  	target->flags = REQ_F_NOCACHE;
d11afec0fbe1ea Jens Axboe     2024-03-28   99  	target->cqe.user_data = msg->user_data;
d11afec0fbe1ea Jens Axboe     2024-03-28  100  	io_req_set_res(target, msg->len, flags);
d11afec0fbe1ea Jens Axboe     2024-03-28  101  	target->ctx = target_ctx;
d11afec0fbe1ea Jens Axboe     2024-03-28  102  	target->io_task_work.func = io_req_task_complete;
d11afec0fbe1ea Jens Axboe     2024-03-28  103  	target->task = get_task_struct(READ_ONCE(target_ctx->submitter_task));
d11afec0fbe1ea Jens Axboe     2024-03-28  104  	io_req_task_work_add_remote(target, target_ctx, IOU_F_TWQ_LAZY_WAKE);
d11afec0fbe1ea Jens Axboe     2024-03-28  105  	return 0;
6d043ee1164ca3 Pavel Begunkov 2022-12-07  106  }
6d043ee1164ca3 Pavel Begunkov 2022-12-07  107  

:::::: The code at line 95 was first introduced by commit
:::::: 8572df941cbef2b295282535b013828e7df39471 io_uring/msg-ring: ensure flags passing works for task_work completions

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
