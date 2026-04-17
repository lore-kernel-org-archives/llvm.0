Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91269BE5E;
	Fri, 17 Apr 2026 02:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776392748; cv=none; b=WG8VGpnsBysOZBdvhfCSsbR3U700jIc53WptzjzX4Y6CsSK64/AvqontoqWbiuHJcjVf0qRKq0w1CwmqRBNvOFFGzq9AeQ22V8ayziMoweQchLxMaTAetNCSuMTgUCjLc5SFKG+lr4DMrDZzPPwdEK9RqYjkjLTNfQomsWXeKT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776392748; c=relaxed/simple;
	bh=mqZMr7mND8Q7gr/+k8exlXGf8usetvwdASnU+KuASgo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V3QQ8/11Bpr0eUWSl0MhjhS6bTx4O4yb2mn54TlDqpKIUy67Gm44UYD++llDHAXPuRcXLxTO1R/hdHvLnU2oeePbNersbtGaVflBUHsCMxbs+CbMC9e+e3l69JK+xshKt4lGDjKT9UD8bUsEdTwa0fuqi/GeKP1/toRe7hq1miI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h3bVTH4A; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h3bVTH4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776392746; x=1807928746;
  h=date:from:to:cc:subject:message-id;
  bh=mqZMr7mND8Q7gr/+k8exlXGf8usetvwdASnU+KuASgo=;
  b=h3bVTH4A8w2YaRbbly4xOQfdHpmIjqlQh0CgdfRqrwAOCyJkseBVRAFx
   N61LEv5TA4FCjbxlyg+B8WZkjGCQ2C6ViYLHDJqIOTW4r88rLMFYXn2Ck
   RJYlZGcda94k1eY0P+9NG5o3+/kyxRZfJeHNX0PRlhzDcmrVF8Tr7MUDl
   7RFqPIedYyf+KFLG63kq3nK/P+tKLPr9pFagSR5Rode4p/1dCGZiwXdyv
   Dx/5IOVpKQVolwusy4tr00ugBrWs02+zlDSQ5OaZKZiOtjWY3Zw+aLmx3
   eDEqXvawaItyIkeEN6GMtx73nSrl264w8+YmtwIMBtxSLR+1N+YA+g1AR
   Q==;
X-CSE-ConnectionGUID: 1nkuZozZQJ6zuDTuVFVEWw==
X-CSE-MsgGUID: WOCRXagNQtCIEkhw6rUGxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77382962"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="77382962"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 19:25:46 -0700
X-CSE-ConnectionGUID: d2pw5H6OTsC7UV6bxsZDyw==
X-CSE-MsgGUID: /0vDbN01Q6KOQWEdkoBlSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="226218678"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Apr 2026 19:25:44 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDYtp-000000002F8-4BoJ;
	Fri, 17 Apr 2026 02:25:42 +0000
Date: Fri, 17 Apr 2026 10:25:30 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:create-cq-entries-v1 12/16]
 drivers/infiniband/hw/bnxt_re/ib_verbs.c:3460:30: warning: unused variable
 'dev_attr'
Message-ID: <202604171039.4AqHMhkZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git create-cq-entries-v1
head:   7f01f0ec98626108c0c8664dbbadac6789903051
commit: c01b77c634fd7d0bce3baf6c8d6663ef3a13c224 [12/16] RDMA/bnxt_re: Rely on core to validate CQE count
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260417/202604171039.4AqHMhkZ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604171039.4AqHMhkZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604171039.4AqHMhkZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/bnxt_re/ib_verbs.c:3460:30: warning: unused variable 'dev_attr' [-Wunused-variable]
    3460 |         struct bnxt_qplib_dev_attr *dev_attr = rdev->dev_attr;
         |                                     ^~~~~~~~
   1 warning generated.


vim +/dev_attr +3460 drivers/infiniband/hw/bnxt_re/ib_verbs.c

cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3454  
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3455  int bnxt_re_create_cq(struct ib_cq *ibcq, const struct ib_cq_init_attr *attr,
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3456  		      struct uverbs_attr_bundle *attrs)
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3457  {
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3458  	struct bnxt_re_cq *cq = container_of(ibcq, struct bnxt_re_cq, ib_cq);
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3459  	struct bnxt_re_dev *rdev = to_bnxt_re_dev(ibcq->device, ibdev);
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02 @3460  	struct bnxt_qplib_dev_attr *dev_attr = rdev->dev_attr;
2b2f078236a445 Leon Romanovsky       2026-03-18  3461  	int rc;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3462  	u32 active_cqs;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3463  
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3464  	if (attr->flags)
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3465  		return -EOPNOTSUPP;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3466  
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3467  	cq->rdev = rdev;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3468  	cq->qplib_cq.cq_handle = (u64)(unsigned long)(&cq->qplib_cq);
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3469  
345f842771ff36 Leon Romanovsky       2026-03-18  3470  	cq->max_cql = attr->cqe + 1;
e69609c5d46917 Leon Romanovsky       2026-03-18  3471  	cq->cql = kzalloc_objs(struct bnxt_qplib_cqe, cq->max_cql);
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3472  	if (!cq->cql)
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3473  		return -ENOMEM;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3474  
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3475  	cq->qplib_cq.sg_info.pgsize = SZ_4K;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3476  	cq->qplib_cq.sg_info.pgshft = __builtin_ctz(SZ_4K);
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3477  	cq->qplib_cq.dpi = &rdev->dpi_privileged;
2b2f078236a445 Leon Romanovsky       2026-03-18  3478  	cq->qplib_cq.max_wqe = cq->max_cql;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3479  	cq->qplib_cq.coalescing = &rdev->cq_coalescing;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3480  	cq->qplib_cq.nq = bnxt_re_get_nq(rdev);
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3481  	cq->qplib_cq.cnq_hw_ring_id = cq->qplib_cq.nq->ring_id;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3482  
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3483  	rc = bnxt_qplib_create_cq(&rdev->qplib_res, &cq->qplib_cq);
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3484  	if (rc) {
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3485  		ibdev_err(&rdev->ibdev, "Failed to create HW CQ");
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3486  		goto fail;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3487  	}
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3488  
2b2f078236a445 Leon Romanovsky       2026-03-18  3489  	cq->ib_cq.cqe = cq->max_cql;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3490  	cq->cq_period = cq->qplib_cq.period;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3491  	active_cqs = atomic_inc_return(&rdev->stats.res.cq_count);
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3492  	if (active_cqs > rdev->stats.res.cq_watermark)
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3493  		rdev->stats.res.cq_watermark = active_cqs;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3494  	spin_lock_init(&cq->cq_lock);
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3495  
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3496  	return 0;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3497  
1ac5a404797523 Selvin Xavier         2017-02-10  3498  fail:
1ac5a404797523 Selvin Xavier         2017-02-10  3499  	kfree(cq->cql);
e39afe3d6dbd90 Leon Romanovsky       2019-05-28  3500  	return rc;
1ac5a404797523 Selvin Xavier         2017-02-10  3501  }
1ac5a404797523 Selvin Xavier         2017-02-10  3502  

:::::: The code at line 3460 was first introduced by commit
:::::: cec5157b6c73e3e43ce868b7726dfece8891c1f8 RDMA/bnxt_re: Separate kernel and user CQ creation paths

:::::: TO: Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
