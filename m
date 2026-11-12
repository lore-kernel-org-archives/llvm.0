Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511071;
	b=JJrhQngyNInEIFE9JgObtL0roZTCTcf+NKpcToafGyzWIt3vjyICVmWUVYLcxz2ws+15
	 E+VRvCbzcguZk04asySifPeopAlqdauS/4TeJoJ997wzlkzY5ezwfqaoOikk5SlXWxPvM
	 nX6mdCw24txmWnOoyZMbsQUQzgXloN+XLJoa1hXFhmd204SNuXXfvwQMtTaY8wYGUwhrv
	 ARAM6eMx4BBqJJci75emAkD+5XKVTr8SQQk6hcC6YYw0lF/w/9H06Woa7fAuOcl7MPjh7
	 Zb4SXeeFBxqvBM8PBQz6pmG4Hw/7Sg7ADthPCofpH+hw6+3Kzd9H1weZlz1Xny7q5kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511071;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=hXJ+459RTW/hLOB+ostc+u78KG2/mtl4rfyui+oSV4A=;
	b=nIczBaSXda9265akhOxNejsNI0ed18rNvHlwm/WYja1anGDEbTrucpnJARdOG51pgZW4
	 WdFRRqE3IZgmuEJW2iuxfT71X6lGoq2ARH0UEUp9wcRLT6rWAuVUEsm03vvMpvF2+rna+
	 qo2SI2JzauuaqoCvqCTiaVW0FDjuhiesMqxES9uUT9VkwOCOkB1WIuM+3HzPK5tCBGEum
	 7L2+w1jgH3XCfXnbqOFOmYGUFNvE4FF8PlYrJ7osKYW3Pk4CIZLrY7pwrI/YTqb8/Nms+
	 Y2XS6NeRJvNIC7Ep8y2gZtIStjX7fzc3aMCLI0kdpzcZwFbHUkqHcY/qIHo6iNIcjbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mUOHYW49;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACA8606A31C;
	Thu, 12 Nov 2026 19:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AACA8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mUOHYW49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794511070; x=1826047070;
  h=date:from:to:cc:subject:message-id;
  bh=aiqjqbN4v5ptRE5+pUVd4+obBUtXgVnsnZFIrT77zG8=;
  b=mUOHYW49nKSnYm7jEwfUQ4/cv2y0zvuYUazJqH6FprvY0XMlHywG8k62
   WtPDoERga4bkfblLS1mAWFpV6ZSwYY1ITttTn3SEX3f08i7iGk8Fa9XX/
   i1mEqLaqv5Fsx09r9WA7s2CuhhGExLEzJArBPlndp7TXBTRpYa8KfG3o9
   xr3Q/aW2HpU1uiuKpRIuEFZJvrdHGjEWWceVWea8jM092INRnVUe2iV+v
   MYzqR1j08i3gFzwYVIF79JAWtuPJT9LI5dJIfHK+7hJg4d/hEI+8ZB6T+
   UU1ReKPzZmOUKLv3nJcDN0cHLkhZh1Is1lYFTGGgOnQJYlGLOvsu761XY
   w==;
X-CSE-ConnectionGUID: Ed718ongROeiXyOtxoVYTA==
X-CSE-MsgGUID: rEQeiuNAQ/CEnU4p5KkAIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3312408"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3312408"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 11:17:49 -0800
X-CSE-ConnectionGUID: bZBLvx+IQfmUTc8TprlU+g==
X-CSE-MsgGUID: v56iXrKWQ5GMR2E0x3eBDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="9293175"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Nov 2026 11:17:48 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRaIq-000000011xd-3zpG;
	Thu, 12 Nov 2026 19:17:44 +0000
Date: Fri, 13 Nov 2026 03:17:38 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 112/444] block/blk-ioc.c:395:2:
 warning: releasing local_lock 'radix_tree_preloads.lock' that was not held
Message-ID: <202611130329.F827oeQy-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   31d2f6adb5d0feeb2be269c03dc5bb6245e05a88
commit: 93f09e59393af702a2e9c35b2a085b6513b6dc87 [112/444] treewide: Add lock context annotations in all include files
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261113/202611130329.F827oeQy-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c628d639fc66f8e6d8ab1f0cc6b1df38f974e020)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130329.F827oeQy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130329.F827oeQy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-ioc.c:395:2: warning: releasing local_lock 'radix_tree_preloads.lock' that was not held [-Wthread-safety-analysis]
     395 |         radix_tree_preload_end();
         |         ^
   1 warning generated.


vim +395 block/blk-ioc.c

47fdd4ca96bf4b2 Tejun Heo         2011-12-14  344  
f1f8cc94651738b Tejun Heo         2011-12-14  345  /**
f1f8cc94651738b Tejun Heo         2011-12-14  346   * ioc_create_icq - create and link io_cq
f1f8cc94651738b Tejun Heo         2011-12-14  347   * @q: request_queue of interest
f1f8cc94651738b Tejun Heo         2011-12-14  348   *
24acfc34fba0b4f Tejun Heo         2012-03-05  349   * Make sure io_cq linking @ioc and @q exists.  If icq doesn't exist, they
24acfc34fba0b4f Tejun Heo         2012-03-05  350   * will be created using @gfp_mask.
f1f8cc94651738b Tejun Heo         2011-12-14  351   *
f1f8cc94651738b Tejun Heo         2011-12-14  352   * The caller is responsible for ensuring @ioc won't go away and @q is
f1f8cc94651738b Tejun Heo         2011-12-14  353   * alive and will stay alive until this function returns.
f1f8cc94651738b Tejun Heo         2011-12-14  354   */
18b74c4dcad8150 Christoph Hellwig 2021-11-26  355  static struct io_cq *ioc_create_icq(struct request_queue *q)
f1f8cc94651738b Tejun Heo         2011-12-14  356  {
18b74c4dcad8150 Christoph Hellwig 2021-11-26  357  	struct io_context *ioc = current->io_context;
f1f8cc94651738b Tejun Heo         2011-12-14  358  	struct elevator_type *et = q->elevator->type;
f1f8cc94651738b Tejun Heo         2011-12-14  359  	struct io_cq *icq;
f1f8cc94651738b Tejun Heo         2011-12-14  360  
f1f8cc94651738b Tejun Heo         2011-12-14  361  	/* allocate stuff */
18b74c4dcad8150 Christoph Hellwig 2021-11-26  362  	icq = kmem_cache_alloc_node(et->icq_cache, GFP_ATOMIC | __GFP_ZERO,
f1f8cc94651738b Tejun Heo         2011-12-14  363  				    q->node);
f1f8cc94651738b Tejun Heo         2011-12-14  364  	if (!icq)
f1f8cc94651738b Tejun Heo         2011-12-14  365  		return NULL;
f1f8cc94651738b Tejun Heo         2011-12-14  366  
18b74c4dcad8150 Christoph Hellwig 2021-11-26  367  	if (radix_tree_maybe_preload(GFP_ATOMIC) < 0) {
f1f8cc94651738b Tejun Heo         2011-12-14  368  		kmem_cache_free(et->icq_cache, icq);
f1f8cc94651738b Tejun Heo         2011-12-14  369  		return NULL;
f1f8cc94651738b Tejun Heo         2011-12-14  370  	}
f1f8cc94651738b Tejun Heo         2011-12-14  371  
f1f8cc94651738b Tejun Heo         2011-12-14  372  	icq->ioc = ioc;
f1f8cc94651738b Tejun Heo         2011-12-14  373  	icq->q = q;
f1f8cc94651738b Tejun Heo         2011-12-14  374  	INIT_LIST_HEAD(&icq->q_node);
f1f8cc94651738b Tejun Heo         2011-12-14  375  	INIT_HLIST_NODE(&icq->ioc_node);
f1f8cc94651738b Tejun Heo         2011-12-14  376  
f1f8cc94651738b Tejun Heo         2011-12-14  377  	/* lock both q and ioc and try to link @icq */
0d945c1f966b2bc Christoph Hellwig 2018-11-15  378  	spin_lock_irq(&q->queue_lock);
f1f8cc94651738b Tejun Heo         2011-12-14  379  	spin_lock(&ioc->lock);
f1f8cc94651738b Tejun Heo         2011-12-14  380  
f1f8cc94651738b Tejun Heo         2011-12-14  381  	if (likely(!radix_tree_insert(&ioc->icq_tree, q->id, icq))) {
f1f8cc94651738b Tejun Heo         2011-12-14  382  		hlist_add_head(&icq->ioc_node, &ioc->icq_list);
f1f8cc94651738b Tejun Heo         2011-12-14  383  		list_add(&icq->q_node, &q->icq_list);
f9cd4bfe96955e7 Jens Axboe        2018-11-01  384  		if (et->ops.init_icq)
f9cd4bfe96955e7 Jens Axboe        2018-11-01  385  			et->ops.init_icq(icq);
f1f8cc94651738b Tejun Heo         2011-12-14  386  	} else {
f1f8cc94651738b Tejun Heo         2011-12-14  387  		kmem_cache_free(et->icq_cache, icq);
eca5892a5d616d3 Christoph Hellwig 2021-11-26  388  		icq = ioc_lookup_icq(q);
f1f8cc94651738b Tejun Heo         2011-12-14  389  		if (!icq)
f1f8cc94651738b Tejun Heo         2011-12-14  390  			printk(KERN_ERR "cfq: icq link failed!\n");
f1f8cc94651738b Tejun Heo         2011-12-14  391  	}
f1f8cc94651738b Tejun Heo         2011-12-14  392  
f1f8cc94651738b Tejun Heo         2011-12-14  393  	spin_unlock(&ioc->lock);
0d945c1f966b2bc Christoph Hellwig 2018-11-15  394  	spin_unlock_irq(&q->queue_lock);
f1f8cc94651738b Tejun Heo         2011-12-14 @395  	radix_tree_preload_end();
f1f8cc94651738b Tejun Heo         2011-12-14  396  	return icq;
f1f8cc94651738b Tejun Heo         2011-12-14  397  }
f1f8cc94651738b Tejun Heo         2011-12-14  398  

:::::: The code at line 395 was first introduced by commit
:::::: f1f8cc94651738b418ba54c039df536303b91704 block, cfq: move icq creation and rq->elv.icq association to block core

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Jens Axboe <axboe@kernel.dk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
