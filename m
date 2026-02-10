Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E881C5D5E;
	Tue, 10 Feb 2026 21:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770760264; cv=none; b=nqUppXZFktct1Xa02UWXRukyjpF3ZwWuaVUXFzh35cDZ6miPJYLB4CLIYVbxj4SRwQgBp9jLCaqbo9OJYsSFLbpC3cWHmqpaptS5TkMRQY8fT9fohCaoKlnQs0v3sOnwDaceIKIrER7g3+F74EjFLpC42SIhxNi4HR6PP5D2Iao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770760264; c=relaxed/simple;
	bh=5U82iWvNy3m7PTW5wFSkZFwKw9BUK/IE8Pd47DCnoVw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q8/t8lJwaa8O+1L6yzVLUnQnI52WjaGPfQx73wYr+GSiJEastOLvyUNjH2o+qspZ6rXEl/UQZ/UHuwnaqLD+L9NHpdjVugwpZ/vwjeXMFhOnyCCdSNy0Zjg+8LckGc7rQb1ecYSrtjyr8VfIKGzCZ7EcJ/p8rmgXUSxP0jENlFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nr+nobhi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nr+nobhi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770760263; x=1802296263;
  h=date:from:to:cc:subject:message-id;
  bh=5U82iWvNy3m7PTW5wFSkZFwKw9BUK/IE8Pd47DCnoVw=;
  b=nr+nobhizln8sy1FiAwwuQ0kWBnl/d1dQ3wTvBW3I8YJvmbMLpMHYJL1
   r1MZM3MXFLBSon2pzM3Dpw9kjGB4imHaVkCCFpm2SrkibyNZt2PCv0DeN
   PXD88akZejKoyNQ7RfDH3iNZZelIQ2oEhmeY6fUlMaiScxk37HOMKcta8
   k6RwNACHuH20d4Hp/FG5x8hJ34hsx4Ik92vWKufRXlqxSR3I1fFlpUOxR
   5wMxhnC/IGxRozZ4pRfLnx0r3j4/aR4vXoxZIJ+ZX+VqjSi72pufkIB0X
   UEabs7CSFoWfSJCQmvsQ3AFkmsRT/5vqfcGN7jIt9zdg3ulX+bdTbl1bm
   A==;
X-CSE-ConnectionGUID: 4EqJn2IORgWeJqeUQWWtew==
X-CSE-MsgGUID: 2iciczW0QMq9wkcOJUmlEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="59468332"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="59468332"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 13:51:02 -0800
X-CSE-ConnectionGUID: 6PIwPuYyTJ21zLS6fMWHaw==
X-CSE-MsgGUID: awEhYdkoRrOIdV86IAT/6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216997397"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Feb 2026 13:51:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpvdK-00000000pRc-1plp;
	Tue, 10 Feb 2026 21:50:58 +0000
Date: Wed, 11 Feb 2026 05:50:06 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:refactor-umem-v1 /105]
 drivers/infiniband/hw/bnxt_re/ib_verbs.c:3341:6: warning: variable 'umem' is
 used uninitialized whenever 'if' condition is true
Message-ID: <202602110530.OqNbB1CS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git refactor-umem-v1
head:   a8cb76e03ec9b6ee0466d41aa185a28e1e6b5574
commit: f33e262712c165b44fe8885a13244f452c3cc333 [/105] RDMA/bnxt_re: Reduce CQ memory footprint
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260211/202602110530.OqNbB1CS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110530.OqNbB1CS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110530.OqNbB1CS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/bnxt_re/ib_verbs.c:3341:6: warning: variable 'umem' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    3341 |         if (ib_copy_from_udata(&req, udata, sizeof(req))) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/bnxt_re/ib_verbs.c:3377:18: note: uninitialized use occurs here
    3377 |         ib_umem_release(umem);
         |                         ^~~~
   drivers/infiniband/hw/bnxt_re/ib_verbs.c:3341:2: note: remove the 'if' if its condition is always false
    3341 |         if (ib_copy_from_udata(&req, udata, sizeof(req))) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3342 |                 rc = -EFAULT;
         |                 ~~~~~~~~~~~~~
    3343 |                 goto fail;
         |                 ~~~~~~~~~~
    3344 |         }
         |         ~
   drivers/infiniband/hw/bnxt_re/ib_verbs.c:3323:22: note: initialize the variable 'umem' to silence this warning
    3323 |         struct ib_umem *umem;
         |                             ^
         |                              = NULL
   1 warning generated.


vim +3341 drivers/infiniband/hw/bnxt_re/ib_verbs.c

1ac5a404797523 Selvin Xavier      2017-02-10  3311  
d54bd5abf4d26e Selvin Xavier      2023-03-15  3312  
8fccf7e25fa477 Leon Romanovsky    2026-02-10  3313  int bnxt_re_resize_cq(struct ib_cq *ibcq, unsigned int cqe,
8fccf7e25fa477 Leon Romanovsky    2026-02-10  3314  		      struct ib_udata *udata)
d54bd5abf4d26e Selvin Xavier      2023-03-15  3315  {
d54bd5abf4d26e Selvin Xavier      2023-03-15  3316  	struct bnxt_qplib_sg_info sg_info = {};
d54bd5abf4d26e Selvin Xavier      2023-03-15  3317  	struct bnxt_qplib_dpi *orig_dpi = NULL;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3318  	struct bnxt_qplib_dev_attr *dev_attr;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3319  	struct bnxt_re_ucontext *uctx = NULL;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3320  	struct bnxt_re_resize_cq_req req;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3321  	struct bnxt_re_dev *rdev;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3322  	struct bnxt_re_cq *cq;
f33e262712c165 Leon Romanovsky    2026-02-10  3323  	struct ib_umem *umem;
f33e262712c165 Leon Romanovsky    2026-02-10  3324  
d54bd5abf4d26e Selvin Xavier      2023-03-15  3325  	int rc, entries;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3326  
d54bd5abf4d26e Selvin Xavier      2023-03-15  3327  	cq =  container_of(ibcq, struct bnxt_re_cq, ib_cq);
d54bd5abf4d26e Selvin Xavier      2023-03-15  3328  	rdev = cq->rdev;
9264cd6aa8f194 Kalesh AP          2025-01-09  3329  	dev_attr = rdev->dev_attr;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3330  
d54bd5abf4d26e Selvin Xavier      2023-03-15  3331  	/* Check the requested cq depth out of supported depth */
8fccf7e25fa477 Leon Romanovsky    2026-02-10  3332  	if (cqe > dev_attr->max_cq_wqes)
d54bd5abf4d26e Selvin Xavier      2023-03-15  3333  		return -EINVAL;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3334  
48f996d4adf15a Chandramohan Akula 2023-10-23  3335  	uctx = rdma_udata_to_drv_context(udata, struct bnxt_re_ucontext, ib_uctx);
48f996d4adf15a Chandramohan Akula 2023-10-23  3336  	entries = bnxt_re_init_depth(cqe + 1, uctx);
d54bd5abf4d26e Selvin Xavier      2023-03-15  3337  	if (entries > dev_attr->max_cq_wqes + 1)
d54bd5abf4d26e Selvin Xavier      2023-03-15  3338  		entries = dev_attr->max_cq_wqes + 1;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3339  
d54bd5abf4d26e Selvin Xavier      2023-03-15  3340  	/* uverbs consumer */
d54bd5abf4d26e Selvin Xavier      2023-03-15 @3341  	if (ib_copy_from_udata(&req, udata, sizeof(req))) {
d54bd5abf4d26e Selvin Xavier      2023-03-15  3342  		rc = -EFAULT;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3343  		goto fail;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3344  	}
d54bd5abf4d26e Selvin Xavier      2023-03-15  3345  
f33e262712c165 Leon Romanovsky    2026-02-10  3346  	umem = ib_umem_get(&rdev->ibdev, req.cq_va,
d54bd5abf4d26e Selvin Xavier      2023-03-15  3347  			   entries * sizeof(struct cq_base),
d54bd5abf4d26e Selvin Xavier      2023-03-15  3348  			   IB_ACCESS_LOCAL_WRITE);
f33e262712c165 Leon Romanovsky    2026-02-10  3349  	if (IS_ERR(umem))
f33e262712c165 Leon Romanovsky    2026-02-10  3350  		return PTR_ERR(umem);
d54bd5abf4d26e Selvin Xavier      2023-03-15  3351  	memcpy(&sg_info, &cq->qplib_cq.sg_info, sizeof(sg_info));
d54bd5abf4d26e Selvin Xavier      2023-03-15  3352  	orig_dpi = cq->qplib_cq.dpi;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3353  
f33e262712c165 Leon Romanovsky    2026-02-10  3354  	cq->qplib_cq.sg_info.umem = umem;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3355  	cq->qplib_cq.sg_info.pgsize = PAGE_SIZE;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3356  	cq->qplib_cq.sg_info.pgshft = PAGE_SHIFT;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3357  	cq->qplib_cq.dpi = &uctx->dpi;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3358  
d54bd5abf4d26e Selvin Xavier      2023-03-15  3359  	rc = bnxt_qplib_resize_cq(&rdev->qplib_res, &cq->qplib_cq, entries);
d54bd5abf4d26e Selvin Xavier      2023-03-15  3360  	if (rc) {
d54bd5abf4d26e Selvin Xavier      2023-03-15  3361  		ibdev_err(&rdev->ibdev, "Resize HW CQ %#x failed!",
d54bd5abf4d26e Selvin Xavier      2023-03-15  3362  			  cq->qplib_cq.id);
d54bd5abf4d26e Selvin Xavier      2023-03-15  3363  		goto fail;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3364  	}
d54bd5abf4d26e Selvin Xavier      2023-03-15  3365  
1bfb5269c1c9bd Leon Romanovsky    2026-02-08  3366  	bnxt_qplib_resize_cq_complete(&rdev->qplib_res, &cq->qplib_cq);
1bfb5269c1c9bd Leon Romanovsky    2026-02-08  3367  
f33e262712c165 Leon Romanovsky    2026-02-10  3368  	cq->qplib_cq.max_wqe = entries;
1bfb5269c1c9bd Leon Romanovsky    2026-02-08  3369  	ib_umem_release(cq->ib_cq.umem);
f33e262712c165 Leon Romanovsky    2026-02-10  3370  	cq->ib_cq.umem = umem;
1bfb5269c1c9bd Leon Romanovsky    2026-02-08  3371  	cq->ib_cq.cqe = entries;
cb95709e0dca7a Chandramohan Akula 2023-07-26  3372  	atomic_inc(&rdev->stats.res.resize_count);
d54bd5abf4d26e Selvin Xavier      2023-03-15  3373  
d54bd5abf4d26e Selvin Xavier      2023-03-15  3374  	return 0;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3375  
d54bd5abf4d26e Selvin Xavier      2023-03-15  3376  fail:
f33e262712c165 Leon Romanovsky    2026-02-10  3377  	ib_umem_release(umem);
d54bd5abf4d26e Selvin Xavier      2023-03-15  3378  	memcpy(&cq->qplib_cq.sg_info, &sg_info, sizeof(sg_info));
d54bd5abf4d26e Selvin Xavier      2023-03-15  3379  	cq->qplib_cq.dpi = orig_dpi;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3380  	return rc;
d54bd5abf4d26e Selvin Xavier      2023-03-15  3381  }
d54bd5abf4d26e Selvin Xavier      2023-03-15  3382  

:::::: The code at line 3341 was first introduced by commit
:::::: d54bd5abf4d26e1b6722238f75e36069ea91def9 RDMA/bnxt_re: Add resize_cq support

:::::: TO: Selvin Xavier <selvin.xavier@broadcom.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
