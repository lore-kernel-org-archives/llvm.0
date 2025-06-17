Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D848BEC;
	Tue, 17 Jun 2025 03:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750130740; cv=none; b=ZLnLZ9IRHQhQvA3cB8egcJTxkChlW+wkShx2YHgoOmBjfgnXqYgp5N4NgspKLXDCKtx1w+jNbepNg3Q8kkSydNKhjNSuhtqRntBdpYXQfPdY05ZWGF/xYuqPMHqpjhfyvCGb99t2xBslSwyEpulhSxyTtRQ7C2DTGM1ruyzMPMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750130740; c=relaxed/simple;
	bh=EnLyahfp0cNSXhOYZIXsYBo4hpSNh36oGoLwjGI3clc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iph5j5FDh5hAnNLLGfoQONn/RwXxvHbKeblRS2iifnFXmKpahGYfZyUMuyY3CDxLfyW4+3MiYNWXzjKvRybKfwrBmoWatwxOpqwTxZd0tq5+1kI15pH9h/pKbcXWAkCvj+Tr5qL4xfuthSp4GLVMZqXZfVgLNUC8oElviClQD9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=et20d2to; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="et20d2to"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750130739; x=1781666739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EnLyahfp0cNSXhOYZIXsYBo4hpSNh36oGoLwjGI3clc=;
  b=et20d2toH6xHXdlYO/m7T8kJApsMu3QETyBv8Nduz4+0CVmbmmUZSYF0
   AdXuzcbe5F8LkcZJe8i0Wxy3+mq4M41Uy3sM73UGzj+rnKnZdWcqWYFJV
   MZh6gTH4CIeZT4wjCPSOdOhnp+tBM2zC7+Tn0a/60zgXUAW80SIY3dQWc
   M28nA52B2EUG6T/XcLAQkrS3eOuBwjctBiJhrnFbYbPqs6PqQ2oYe55J3
   vgRPHuhkMZmS08cT/FokpvqBCAaYFrhcHoozvCm6HYLIA5mM8zXefOZ91
   34Y/JTEC/TWWq/q0NSNP4L/tGHEm3SRVEftzm/5Uyy0NvQmoR2Ss43hT1
   w==;
X-CSE-ConnectionGUID: 58JpHmSaTy+cvBTG+Gdwyg==
X-CSE-MsgGUID: i4dV8p+qTaKudcZhel/XeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63323445"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="63323445"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 20:25:38 -0700
X-CSE-ConnectionGUID: 9M1ukGwTTu2TWWoKE79U4g==
X-CSE-MsgGUID: rh/ebMbjS2mr3BcMQ655Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="153422982"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Jun 2025 20:25:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRMx4-000FXk-0k;
	Tue, 17 Jun 2025 03:25:34 +0000
Date: Tue, 17 Jun 2025 11:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-defer-tw.3 2/6] io_uring/io_uring.c:1319:16:
 warning: variable 'limit' is uninitialized when used here
Message-ID: <202506171136.vGBhfwci-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-defer-tw.3
head:   72dca7c06951833c040a26f09385b0d936e29bcc
commit: 6b0b61ad1d57fb323c15925dcdbbc80d0b820b97 [2/6] io_uring: replace defer task_work llist with io_wq_work_list
config: i386-buildonly-randconfig-002-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171136.vGBhfwci-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171136.vGBhfwci-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171136.vGBhfwci-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/io_uring.c:1319:16: warning: variable 'limit' is uninitialized when used here [-Wuninitialized]
    1319 |                 if (++ret >= limit)
         |                              ^~~~~
   io_uring/io_uring.c:1294:20: note: initialize the variable 'limit' to silence this warning
    1294 |         int ret = 0, limit, nitems;
         |                           ^
         |                            = 0
   1 warning generated.


vim +/limit +1319 io_uring/io_uring.c

  1289	
  1290	static int __io_run_local_work(struct io_ring_ctx *ctx, io_tw_token_t tw,
  1291				       int min_events, int max_events)
  1292	{
  1293		struct io_wq_work_node *node, *tail;
  1294		int ret = 0, limit, nitems;
  1295		unsigned int loops = 0;
  1296	
  1297		if (WARN_ON_ONCE(ctx->submitter_task != current))
  1298			return -EEXIST;
  1299		if (ctx->flags & IORING_SETUP_TASKRUN_FLAG)
  1300			atomic_andnot(IORING_SQ_TASKRUN, &ctx->rings->sq_flags);
  1301	again:
  1302		min_events -= ret;
  1303		spin_lock_irq(&ctx->work_lock);
  1304		node = ctx->work_list.first;
  1305		tail = ctx->work_list.last;
  1306		nitems = ctx->work_items;
  1307		INIT_WQ_LIST(&ctx->work_list);
  1308		ctx->work_items = 0;
  1309		spin_unlock_irq(&ctx->work_lock);
  1310	
  1311		while (node) {
  1312			struct io_kiocb *req = container_of(node, struct io_kiocb,
  1313							    io_task_work.work_node);
  1314			node = node->next;
  1315			INDIRECT_CALL_2(req->io_task_work.func,
  1316					io_poll_task_func, io_req_rw_complete,
  1317					req, tw);
  1318			nitems--;
> 1319			if (++ret >= limit)
  1320				break;
  1321		}
  1322	
  1323		if (unlikely(node)) {
  1324			spin_lock_irq(&ctx->work_lock);
  1325			tail->next = ctx->work_list.first;
  1326			ctx->work_list.first = node;
  1327			if (!ctx->work_list.last)
  1328				ctx->work_list.last = tail;
  1329			ctx->work_items += nitems;
  1330			spin_unlock_irq(&ctx->work_lock);
  1331			goto retry_done;
  1332		}
  1333	
  1334		loops++;
  1335	
  1336		if (io_run_local_work_continue(ctx, ret, min_events))
  1337			goto again;
  1338	retry_done:
  1339		io_submit_flush_completions(ctx);
  1340		if (io_run_local_work_continue(ctx, ret, min_events))
  1341			goto again;
  1342	
  1343		trace_io_uring_local_work_run(ctx, ret, loops);
  1344		return ret;
  1345	}
  1346	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
