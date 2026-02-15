Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA851257830;
	Sun, 15 Feb 2026 19:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771184884; cv=none; b=E5Ycoqzp9aIXsoUcDacH1jBf+cq5luwSTM76EPh10ut88iRaQYVasmsx6o8OiNdht+3z1XWK96pbSLmsxQvSL4X+LykxuPi5Mngzv0+Crv6QZjqIbhV27PJt4dogfSDa77A9tCa+esgaO3efk8TUQOpWB1eY86OYO7Wv1VVq3SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771184884; c=relaxed/simple;
	bh=P4YHp16Qw5oQXI8e3efqqupsnBNNOZakVsFfFKdlR5s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mUIPVi/k+p7JzgMijdLjXU0CWgpGNZm+1wTQ7ldByfhY37RyKwz7iNhMvt/40J0SBjIcT3YtAd4M2o9CX3+5kS/bvFxtxQwpV+DIkg0ZxRMC6wS4MnSa5wJFzOUZVBqP0DAs3rcLFd09DZV7Vnfn+HNrZGyhRhuqvAwVlVNWgRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGWV7zO8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGWV7zO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771184883; x=1802720883;
  h=date:from:to:cc:subject:message-id;
  bh=P4YHp16Qw5oQXI8e3efqqupsnBNNOZakVsFfFKdlR5s=;
  b=YGWV7zO8Msm9FyQ5L1GlKfznen0u5jh5PhaGUtQM+c9Qin5ODreIshe4
   7fgRzZ0Xg3f4IZkTvCWEcJZdr7xrgacTm7heUaMLmr/eTp/FvA0v4drzb
   wE7RZs57WzMv4olwozQvDcBp508Cq+NUvAIxE6E1eIfAy4h3gXVP2J3rX
   czrbXz2lMc/re7nePvneYgjpViHJrQ1GPyYq+Th5S8eIlXYh8cc4gvfZ+
   yyr9sjAmXDIqGkA8SntCYg4vsnduI+YabjSICCaMGASaiB36HhwDCCISD
   /E1WdMTuc+xic1D34+bHlXWqkVZgcCDI0s25GBmG4+68vXU3jz7zktNID
   Q==;
X-CSE-ConnectionGUID: RoHpULMvRlCesBppo7x5kA==
X-CSE-MsgGUID: SDwkTGVvTiSV+fqdvrHs+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72176950"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="72176950"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 11:48:01 -0800
X-CSE-ConnectionGUID: Ihd9MOQeQ+WquQeDGaZYEg==
X-CSE-MsgGUID: DxKfw60HSCa73Y4edWE8pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="218400721"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Feb 2026 11:47:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vri61-00000000z6k-0S9M;
	Sun, 15 Feb 2026 19:47:57 +0000
Date: Mon, 16 Feb 2026 03:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:refactor-umem-v2 87/107]
 drivers/infiniband/hw/hns/hns_roce_hw_v2.c:2922:44: error: too many arguments
 to function call, expected 2, have 3
Message-ID: <202602160332.1O2QNg1W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git refactor-umem-v2
head:   6270611a6aa0e2a782cf3849ccd6ee63b7f36d19
commit: 3b2c97078b14fbbdd2a1ae8a0bcffa17c81f976c [87/107] RDMA/core: Remove legacy CQ creation fallback path
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260216/202602160332.1O2QNg1W-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602160332.1O2QNg1W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602160332.1O2QNg1W-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:2922:44: error: too many arguments to function call, expected 2, have 3
    2922 |         if (hns_roce_create_cq(cq, &cq_init_attr, NULL)) {
         |             ~~~~~~~~~~~~~~~~~~                    ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   drivers/infiniband/hw/hns/hns_roce_device.h:1295:5: note: 'hns_roce_create_cq' declared here
    1295 | int hns_roce_create_cq(struct ib_cq *ib_cq, const struct ib_cq_init_attr *attr);
         |     ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +2922 drivers/infiniband/hw/hns/hns_roce_hw_v2.c

487d65090a3dce1 Yixing Liu 2022-11-26  2903  
487d65090a3dce1 Yixing Liu 2022-11-26  2904  static struct ib_cq *free_mr_init_cq(struct hns_roce_dev *hr_dev)
487d65090a3dce1 Yixing Liu 2022-11-26  2905  {
487d65090a3dce1 Yixing Liu 2022-11-26  2906  	struct hns_roce_v2_priv *priv = hr_dev->priv;
487d65090a3dce1 Yixing Liu 2022-11-26  2907  	struct hns_roce_v2_free_mr *free_mr = &priv->free_mr;
487d65090a3dce1 Yixing Liu 2022-11-26  2908  	struct ib_device *ibdev = &hr_dev->ib_dev;
487d65090a3dce1 Yixing Liu 2022-11-26  2909  	struct ib_cq_init_attr cq_init_attr = {};
487d65090a3dce1 Yixing Liu 2022-11-26  2910  	struct hns_roce_cq *hr_cq;
487d65090a3dce1 Yixing Liu 2022-11-26  2911  	struct ib_cq *cq;
487d65090a3dce1 Yixing Liu 2022-11-26  2912  
487d65090a3dce1 Yixing Liu 2022-11-26  2913  	cq_init_attr.cqe = HNS_ROCE_FREE_MR_USED_CQE_NUM;
487d65090a3dce1 Yixing Liu 2022-11-26  2914  
487d65090a3dce1 Yixing Liu 2022-11-26  2915  	hr_cq = kzalloc(sizeof(*hr_cq), GFP_KERNEL);
1f505a4a4250798 luoqing    2025-06-05  2916  	if (!hr_cq)
487d65090a3dce1 Yixing Liu 2022-11-26  2917  		return NULL;
487d65090a3dce1 Yixing Liu 2022-11-26  2918  
487d65090a3dce1 Yixing Liu 2022-11-26  2919  	cq = &hr_cq->ib_cq;
487d65090a3dce1 Yixing Liu 2022-11-26  2920  	cq->device = ibdev;
487d65090a3dce1 Yixing Liu 2022-11-26  2921  
487d65090a3dce1 Yixing Liu 2022-11-26 @2922  	if (hns_roce_create_cq(cq, &cq_init_attr, NULL)) {
487d65090a3dce1 Yixing Liu 2022-11-26  2923  		ibdev_err(ibdev, "failed to create cq for free mr.\n");
487d65090a3dce1 Yixing Liu 2022-11-26  2924  		kfree(hr_cq);
487d65090a3dce1 Yixing Liu 2022-11-26  2925  		return NULL;
487d65090a3dce1 Yixing Liu 2022-11-26  2926  	}
487d65090a3dce1 Yixing Liu 2022-11-26  2927  	free_mr->rsv_cq = to_hr_cq(cq);
487d65090a3dce1 Yixing Liu 2022-11-26  2928  	free_mr->rsv_cq->ib_cq.device = &hr_dev->ib_dev;
487d65090a3dce1 Yixing Liu 2022-11-26  2929  	free_mr->rsv_cq->ib_cq.uobject = NULL;
487d65090a3dce1 Yixing Liu 2022-11-26  2930  	free_mr->rsv_cq->ib_cq.comp_handler = NULL;
487d65090a3dce1 Yixing Liu 2022-11-26  2931  	free_mr->rsv_cq->ib_cq.event_handler = NULL;
487d65090a3dce1 Yixing Liu 2022-11-26  2932  	free_mr->rsv_cq->ib_cq.cq_context = NULL;
487d65090a3dce1 Yixing Liu 2022-11-26  2933  	atomic_set(&free_mr->rsv_cq->ib_cq.usecnt, 0);
487d65090a3dce1 Yixing Liu 2022-11-26  2934  
487d65090a3dce1 Yixing Liu 2022-11-26  2935  	return cq;
487d65090a3dce1 Yixing Liu 2022-11-26  2936  }
487d65090a3dce1 Yixing Liu 2022-11-26  2937  

:::::: The code at line 2922 was first introduced by commit
:::::: 487d65090a3dce1ae54946aded55d0f8ac87cbab RDMA/hns: Fix the gid problem caused by free mr

:::::: TO: Yixing Liu <liuyixing1@huawei.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
