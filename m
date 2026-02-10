Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0332B38B7AE;
	Tue, 10 Feb 2026 18:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770749888; cv=none; b=I2/VLEw4oJYrlXerQzaA+SZhYsjIaFCzovjwit3NkVu8MUHu4uFLs8b48eC2ZPrxhx/ReA3D95uwdGNiwLhiT+uy0E1TQ1vyLNDvQMyGXIFtEg3y+cRDrnptCA60vy3uzk7eg7CDD/jKCEWJJA0zUka5c3Sr+swEfZvZ5hYFm/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770749888; c=relaxed/simple;
	bh=1MMvkHcUWUGAYZKAYIUAGMUKEAJv8xriYzD8WcN8hdw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OqQHiu/Ee9yVUfOXp0BPmexJnD7jIo2QgR7Pm1KIumb7N3k7Gnz9AKWlomUHkNhQoy06gVtoyR/EB4f8D8hVchENJnMzCks3jch2yhY/Kf6+VS6Azka96JRrgORscnUUWMc0TtvzWbi3GDkchLDWpP+0eic4nqGSD+SMauC2tNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oKkY0q8j; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oKkY0q8j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770749887; x=1802285887;
  h=date:from:to:cc:subject:message-id;
  bh=1MMvkHcUWUGAYZKAYIUAGMUKEAJv8xriYzD8WcN8hdw=;
  b=oKkY0q8jy5s+C/4ZHH0HdjbVOHhxUOLoU8PeZewFupxe9Rl2JF6lE3/4
   jHaqe8JqDwidiBQwkPFVoV5dkA6a9caI+WNXFl2yv5AOGfwUNRHPNtqEr
   ajjyxtkLFkncZ8qgzw5rTIOOaIUETM8zQTK84P684FgrU3kW+II9TIeE1
   NxPnf4YdyI5PLXQQ8Z6w58zSuNVSvLgJg45IbKBM1cZpRvpBTu9UahbRN
   4dPoshkEjymxcMut+wQSp3wGviljeVpVzWfWeyhK3kFRszQi/htkwafPx
   gmCPCRfN9PcQEwx1kAi66t//8Vuf1GLlhWA83wMMwsGllHYiHhHx1oKSK
   Q==;
X-CSE-ConnectionGUID: 5C8rIPUWS4CZysFrHcMRtA==
X-CSE-MsgGUID: ZCNv9TYTTO22OwWa4iIQVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82618741"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82618741"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 10:57:56 -0800
X-CSE-ConnectionGUID: ASatXQn6SSiDGQQ0XDVNow==
X-CSE-MsgGUID: pSYnf3QZQqGuKA//cge5zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216538357"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Feb 2026 10:57:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpsvo-00000000pJy-1UUQ;
	Tue, 10 Feb 2026 18:57:52 +0000
Date: Wed, 11 Feb 2026 02:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:refactor-umem-v1 77/105]
 drivers/infiniband/hw/qedr/verbs.c:937:8: error: use of undeclared label
 'err_umem'
Message-ID: <202602110253.vdiIP6Wa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git refactor-umem-v1
head:   b6daace542159a3879b60866e24495985ecffc23
commit: e63ddbcab327acd433b4aa0f7c31fc9df8ed651d [77/105] RDMA/qedr: Convert to modern CQ interface
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260211/202602110253.vdiIP6Wa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110253.vdiIP6Wa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110253.vdiIP6Wa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/hw/qedr/verbs.c:937:8: error: use of undeclared label 'err_umem'
     937 |                 goto err_umem;
         |                      ^
   1 error generated.


vim +/err_umem +937 drivers/infiniband/hw/qedr/verbs.c

   882	
   883	int qedr_create_user_cq(struct ib_cq *ibcq, const struct ib_cq_init_attr *attr,
   884				struct uverbs_attr_bundle *attrs)
   885	{
   886		struct ib_udata *udata = &attrs->driver_udata;
   887		struct ib_device *ibdev = ibcq->device;
   888		struct qedr_ucontext *ctx = rdma_udata_to_drv_context(
   889			udata, struct qedr_ucontext, ibucontext);
   890		struct qed_rdma_destroy_cq_out_params destroy_oparams;
   891		struct qed_rdma_destroy_cq_in_params destroy_iparams;
   892		struct qedr_dev *dev = get_qedr_dev(ibdev);
   893		struct qed_rdma_create_cq_in_params params;
   894		struct qedr_create_cq_ureq ureq = {};
   895		int vector = attr->comp_vector;
   896		int entries = attr->cqe;
   897		struct qedr_cq *cq = get_qedr_cq(ibcq);
   898		int chain_entries;
   899		u32 db_offset;
   900		int page_cnt;
   901		u64 pbl_ptr;
   902		u16 icid;
   903		int rc;
   904	
   905		DP_DEBUG(dev, QEDR_MSG_INIT,
   906			 "create_cq: called from User Lib. entries=%d, vector=%d\n",
   907			 entries, vector);
   908	
   909		if (attr->flags)
   910			return -EOPNOTSUPP;
   911	
   912		if (attr->cqe > QEDR_MAX_CQES)
   913			return -EINVAL;
   914	
   915		chain_entries = qedr_align_cq_entries(entries);
   916		chain_entries = min_t(int, chain_entries, QEDR_MAX_CQES);
   917	
   918		/* calc db offset. user will add DPI base, kernel will add db addr */
   919		db_offset = DB_ADDR_SHIFT(DQ_PWM_OFFSET_UCM_RDMA_CQ_CONS_32BIT);
   920	
   921		if (ib_copy_from_udata(&ureq, udata, min(sizeof(ureq), udata->inlen)))
   922			return -EINVAL;
   923	
   924		cq->cq_type = QEDR_CQ_TYPE_USER;
   925	
   926		cq->q.buf_addr = ureq.addr;
   927		cq->q.buf_len = ureq.len;
   928		if (!ibcq->umem)
   929			ibcq->umem = ib_umem_get(&dev->ibdev, ureq.addr, ureq.len,
   930						 IB_ACCESS_LOCAL_WRITE);
   931		if (IS_ERR(ibcq->umem))
   932			return PTR_ERR(ibcq->umem);
   933		cq->q.umem = ibcq->umem;
   934	
   935		rc = qedr_init_user_queue(udata, dev, &cq->q, true, 1);
   936		if (rc)
 > 937			goto err_umem;
   938	
   939		pbl_ptr = cq->q.pbl_tbl->pa;
   940		page_cnt = cq->q.pbl_info.num_pbes;
   941	
   942		cq->ibcq.cqe = chain_entries;
   943		cq->q.db_addr = ctx->dpi_addr + db_offset;
   944	
   945		qedr_init_cq_params(cq, ctx, dev, vector, chain_entries, page_cnt,
   946				    pbl_ptr, &params);
   947	
   948		rc = dev->ops->rdma_create_cq(dev->rdma_ctx, &params, &icid);
   949		if (rc)
   950			goto err1;
   951	
   952		cq->icid = icid;
   953		cq->sig = QEDR_CQ_MAGIC_NUMBER;
   954		spin_lock_init(&cq->cq_lock);
   955	
   956		rc = qedr_copy_cq_uresp(dev, cq, udata, db_offset);
   957		if (rc)
   958			goto err2;
   959	
   960		rc = qedr_db_recovery_add(dev, cq->q.db_addr,
   961					  &cq->q.db_rec_data->db_data,
   962					  DB_REC_WIDTH_64B,
   963					  DB_REC_USER);
   964		if (rc)
   965			goto err2;
   966	
   967		DP_DEBUG(dev, QEDR_MSG_CQ,
   968			 "create cq: icid=0x%0x, addr=%p, size(entries)=0x%0x\n",
   969			 cq->icid, cq, params.cq_size);
   970	
   971		return 0;
   972	
   973	err2:
   974		destroy_iparams.icid = cq->icid;
   975		dev->ops->rdma_destroy_cq(dev->rdma_ctx, &destroy_iparams,
   976					  &destroy_oparams);
   977	err1:
   978		qedr_free_pbl(dev, &cq->q.pbl_info, cq->q.pbl_tbl);
   979		if (cq->q.db_mmap_entry)
   980			rdma_user_mmap_entry_remove(cq->q.db_mmap_entry);
   981		return rc;
   982	}
   983	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
