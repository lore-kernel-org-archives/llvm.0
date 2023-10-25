Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9196F1F612;
	Wed, 25 Oct 2023 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JCnzyk3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698224347; x=1729760347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c5Xrd1zs1O8boNPXHoyXHq6njyNJdxPVi6zrAKd0MTI=;
  b=JCnzyk3hRR3/ddtFWZIMoSB/AK1mRu5QxzfriQDcCMtQhmiJIorJyJqG
   5mffOGlOX5vRweUvVeav0WEO7QKwZJnJEo+UW78uAurkv3Q41NxT6ppej
   L4suSuNCSKACM+T0hNseRKa59KCRlrZEpzjNGolR8Za+ToiKIMaUKZbt8
   opxNoyjzsfL1gB7vLheIRwUdIeBhzHbZekcgJPff5G/34Qp5sej36Voji
   tuspWwfarg0WJ/5T8zzUh9V1SdIGjstswc5nSzWL378FnLGpDhwYusWQf
   XMHQfKppiLIravYycnMsIOExs2zWEEIc51tpZZmPKnRHFC74MSpsrVahJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="8825520"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="8825520"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 01:59:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="762390070"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="762390070"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 25 Oct 2023 01:58:58 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvZj6-0008lq-1s;
	Wed, 25 Oct 2023 08:58:56 +0000
Date: Wed, 25 Oct 2023 16:58:53 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:block-for-next 2/2] block/bfq-iosched.c:5838:8: error:
 must use 'enum' tag to refer to type 'ioprio_prio_class'
Message-ID: <202310251600.7K5lN9p5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux block-for-next
head:   3b3855ed6aff9f5ad440102a6df1c5e582cbdc6a
commit: 3b3855ed6aff9f5ad440102a6df1c5e582cbdc6a [2/2] block: Introduce an enumeration type for the I/O priority classes
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231025/202310251600.7K5lN9p5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310251600.7K5lN9p5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310251600.7K5lN9p5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/bfq-iosched.c:118:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from block/bfq-iosched.c:118:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from block/bfq-iosched.c:118:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> block/bfq-iosched.c:5838:8: error: must use 'enum' tag to refer to type 'ioprio_prio_class'
    5838 |         const ioprio_prio_class ioprio_class = IOPRIO_PRIO_CLASS(bic->ioprio);
         |               ^
         |               enum 
   12 warnings and 1 error generated.


vim +5838 block/bfq-iosched.c

  5830	
  5831	
  5832	static struct bfq_queue *bfq_get_queue(struct bfq_data *bfqd,
  5833					       struct bio *bio, bool is_sync,
  5834					       struct bfq_io_cq *bic,
  5835					       bool respawn)
  5836	{
  5837		const int ioprio = IOPRIO_PRIO_LEVEL(bic->ioprio);
> 5838		const ioprio_prio_class ioprio_class = IOPRIO_PRIO_CLASS(bic->ioprio);
  5839		struct bfq_queue **async_bfqq = NULL;
  5840		struct bfq_queue *bfqq;
  5841		struct bfq_group *bfqg;
  5842	
  5843		bfqg = bfq_bio_bfqg(bfqd, bio);
  5844		if (!is_sync) {
  5845			async_bfqq = bfq_async_queue_prio(bfqd, bfqg, ioprio_class,
  5846							  ioprio,
  5847							  bfq_actuator_index(bfqd, bio));
  5848			bfqq = *async_bfqq;
  5849			if (bfqq)
  5850				goto out;
  5851		}
  5852	
  5853		bfqq = kmem_cache_alloc_node(bfq_pool,
  5854					     GFP_NOWAIT | __GFP_ZERO | __GFP_NOWARN,
  5855					     bfqd->queue->node);
  5856	
  5857		if (bfqq) {
  5858			bfq_init_bfqq(bfqd, bfqq, bic, current->pid,
  5859				      is_sync, bfq_actuator_index(bfqd, bio));
  5860			bfq_init_entity(&bfqq->entity, bfqg);
  5861			bfq_log_bfqq(bfqd, bfqq, "allocated");
  5862		} else {
  5863			bfqq = &bfqd->oom_bfqq;
  5864			bfq_log_bfqq(bfqd, bfqq, "using oom bfqq");
  5865			goto out;
  5866		}
  5867	
  5868		/*
  5869		 * Pin the queue now that it's allocated, scheduler exit will
  5870		 * prune it.
  5871		 */
  5872		if (async_bfqq) {
  5873			bfqq->ref++; /*
  5874				      * Extra group reference, w.r.t. sync
  5875				      * queue. This extra reference is removed
  5876				      * only if bfqq->bfqg disappears, to
  5877				      * guarantee that this queue is not freed
  5878				      * until its group goes away.
  5879				      */
  5880			bfq_log_bfqq(bfqd, bfqq, "get_queue, bfqq not in async: %p, %d",
  5881				     bfqq, bfqq->ref);
  5882			*async_bfqq = bfqq;
  5883		}
  5884	
  5885	out:
  5886		bfqq->ref++; /* get a process reference to this queue */
  5887	
  5888		if (bfqq != &bfqd->oom_bfqq && is_sync && !respawn)
  5889			bfqq = bfq_do_or_sched_stable_merge(bfqd, bfqq, bic);
  5890		return bfqq;
  5891	}
  5892	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
