Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20B62D7812;
	Mon,  9 Feb 2026 09:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770628624; cv=none; b=YScedFDkXAhfYkGcaZtgLKZpM85zlJm2TyRVQFwJ6H+98roxdsQv4vlXZQq1vyCx04YabPbq9v+6YFavk8M9OlUumgr4975gR5aEHpvX8kf8kHUvNEOcWeuLgGNMArgnynq2rsRGQKxhncPWT8FcevJHq3E+o8S+E+CFh/+UngI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770628624; c=relaxed/simple;
	bh=qrROYE4XpY1NIlCV3UwP8gdBFwTeOzyDOqqLcJ47Vfg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YwxCua1ankbwsmiZJKt38AWABsusys8p+SwfXm8t1V39z8qBzLKxrllUH0MhA0yJV/1CH00j3aGfbaBRIxjAgXmkyuwkwTaAjePwVRW8treqPvXgbdiouOQmC5vsY+3wJjlMjqPqvqHHPT5oBy+mD9ObgSYcEZeREWg/wJ+GLyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kvyeiEA9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvyeiEA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770628624; x=1802164624;
  h=date:from:to:cc:subject:message-id;
  bh=qrROYE4XpY1NIlCV3UwP8gdBFwTeOzyDOqqLcJ47Vfg=;
  b=kvyeiEA9lUGqB8LDGhHnR2sAm4odfs8/a3cl5gEFoO7m3/2Xy4AFQgVZ
   KfKVHMSOlWn49Hn8SPmunc2X20zykshJ6S0dZAvWq7lQr+Zy466vdqXvw
   MhgMUUy32aVtATFmcjzTprw3I327IFuzpH2PHeUpk9PV7Q3bFaEPmu1fd
   ZP0h6sM+yP8X/yt+e1wHzP91RUEdNCg5JLu3zy2lGIJ/PPrsaEbe1/d7y
   I/o3sBys7pOy5UWqGjx4htRMLNPpALPXAyRB0xekc2TNDWpmZbUcTU52p
   rJ1E3bPrgBFafgJZTny7MerEqh0Jc08wyWApj9Rx6+zMcwqwPaXdOOBfP
   Q==;
X-CSE-ConnectionGUID: 5+j0eHbBQLCXojBvrSC+uA==
X-CSE-MsgGUID: zLx7WS7XSf6N1jgSMJATBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71723046"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; 
   d="scan'208";a="71723046"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 01:17:04 -0800
X-CSE-ConnectionGUID: dMDFdJTZRt6othJ4OG3o7w==
X-CSE-MsgGUID: b772faSXR2ehOdUIsDINWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; 
   d="scan'208";a="210687585"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Feb 2026 01:17:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpNO7-00000000mrS-32nA;
	Mon, 09 Feb 2026 09:16:59 +0000
Date: Mon, 09 Feb 2026 17:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:refactor-umem-v1 75/80]
 drivers/infiniband/hw/irdma/verbs.c:2108:16: warning: variable 'kmem_buf' is
 uninitialized when used here
Message-ID: <202602091736.nL6iB1tr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git refactor-umem-v1
head:   a13eb692588830b3d09a9dcb14d384ccfc029902
commit: fc8e26318efebb43d582e9b2cb5ea0f80f5dacb9 [75/80] RDMA/irdma: Remove resize support for kernel CQs
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260209/202602091736.nL6iB1tr-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602091736.nL6iB1tr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602091736.nL6iB1tr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/irdma/verbs.c:2108:16: warning: variable 'kmem_buf' is uninitialized when used here [-Wuninitialized]
    2108 |                 iwcq->kmem = kmem_buf;
         |                              ^~~~~~~~
   drivers/infiniband/hw/irdma/verbs.c:2028:2: note: variable 'kmem_buf' is declared here
    2028 |         struct irdma_dma_mem kmem_buf;
         |         ^
   1 warning generated.


vim +/kmem_buf +2108 drivers/infiniband/hw/irdma/verbs.c

b48c24c2d710cf Mustafa Ismail  2021-06-02  2008  
b48c24c2d710cf Mustafa Ismail  2021-06-02  2009  /**
b48c24c2d710cf Mustafa Ismail  2021-06-02  2010   * irdma_resize_cq - resize cq
b48c24c2d710cf Mustafa Ismail  2021-06-02  2011   * @ibcq: cq to be resized
b48c24c2d710cf Mustafa Ismail  2021-06-02  2012   * @entries: desired cq size
b48c24c2d710cf Mustafa Ismail  2021-06-02  2013   * @udata: user data
b48c24c2d710cf Mustafa Ismail  2021-06-02  2014   */
b48c24c2d710cf Mustafa Ismail  2021-06-02  2015  static int irdma_resize_cq(struct ib_cq *ibcq, int entries,
b48c24c2d710cf Mustafa Ismail  2021-06-02  2016  			   struct ib_udata *udata)
b48c24c2d710cf Mustafa Ismail  2021-06-02  2017  {
fc8e26318efebb Leon Romanovsky 2026-02-08  2018  	struct irdma_resize_cq_req req = {};
fc8e26318efebb Leon Romanovsky 2026-02-08  2019  	struct irdma_ucontext *ucontext = rdma_udata_to_drv_context(
fc8e26318efebb Leon Romanovsky 2026-02-08  2020  		udata, struct irdma_ucontext, ibucontext);
34acb833cc83bd Shiraz Saleem   2022-09-07  2021  #define IRDMA_RESIZE_CQ_MIN_REQ_LEN offsetofend(struct irdma_resize_cq_req, user_cq_buffer)
b48c24c2d710cf Mustafa Ismail  2021-06-02  2022  	struct irdma_cq *iwcq = to_iwcq(ibcq);
b48c24c2d710cf Mustafa Ismail  2021-06-02  2023  	struct irdma_sc_dev *dev = iwcq->sc_cq.dev;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2024  	struct irdma_cqp_request *cqp_request;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2025  	struct cqp_cmds_info *cqp_info;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2026  	struct irdma_modify_cq_info *m_info;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2027  	struct irdma_modify_cq_info info = {};
b48c24c2d710cf Mustafa Ismail  2021-06-02  2028  	struct irdma_dma_mem kmem_buf;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2029  	struct irdma_cq_mr *cqmr_buf;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2030  	struct irdma_pbl *iwpbl_buf;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2031  	struct irdma_device *iwdev;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2032  	struct irdma_pci_f *rf;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2033  	struct irdma_cq_buf *cq_buf = NULL;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2034  	unsigned long flags;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2035  	int ret;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2036  
b48c24c2d710cf Mustafa Ismail  2021-06-02  2037  	iwdev = to_iwdev(ibcq->device);
b48c24c2d710cf Mustafa Ismail  2021-06-02  2038  	rf = iwdev->rf;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2039  
b48c24c2d710cf Mustafa Ismail  2021-06-02  2040  	if (!(rf->sc_dev.hw_attrs.uk_attrs.feature_flags &
b48c24c2d710cf Mustafa Ismail  2021-06-02  2041  	    IRDMA_FEATURE_CQ_RESIZE))
b48c24c2d710cf Mustafa Ismail  2021-06-02  2042  		return -EOPNOTSUPP;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2043  
fc8e26318efebb Leon Romanovsky 2026-02-08  2044  	if (udata->inlen < IRDMA_RESIZE_CQ_MIN_REQ_LEN)
34acb833cc83bd Shiraz Saleem   2022-09-07  2045  		return -EINVAL;
34acb833cc83bd Shiraz Saleem   2022-09-07  2046  
b48c24c2d710cf Mustafa Ismail  2021-06-02  2047  	if (entries > rf->max_cqe)
b48c24c2d710cf Mustafa Ismail  2021-06-02  2048  		return -EINVAL;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2049  
b48c24c2d710cf Mustafa Ismail  2021-06-02  2050  	info.cq_size = max(entries, 4);
b48c24c2d710cf Mustafa Ismail  2021-06-02  2051  
b48c24c2d710cf Mustafa Ismail  2021-06-02  2052  	if (info.cq_size == iwcq->sc_cq.cq_uk.cq_size - 1)
b48c24c2d710cf Mustafa Ismail  2021-06-02  2053  		return 0;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2054  
b48c24c2d710cf Mustafa Ismail  2021-06-02  2055  	/* CQ resize not supported with legacy GEN_1 libi40iw */
b48c24c2d710cf Mustafa Ismail  2021-06-02  2056  	if (ucontext->legacy_mode)
b48c24c2d710cf Mustafa Ismail  2021-06-02  2057  		return -EOPNOTSUPP;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2058  
fc8e26318efebb Leon Romanovsky 2026-02-08  2059  	if (ib_copy_from_udata(&req, udata, min(sizeof(req), udata->inlen)))
b48c24c2d710cf Mustafa Ismail  2021-06-02  2060  		return -EINVAL;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2061  
b48c24c2d710cf Mustafa Ismail  2021-06-02  2062  	spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
b48c24c2d710cf Mustafa Ismail  2021-06-02  2063  	iwpbl_buf = irdma_get_pbl((unsigned long)req.user_cq_buffer,
b48c24c2d710cf Mustafa Ismail  2021-06-02  2064  				  &ucontext->cq_reg_mem_list);
b48c24c2d710cf Mustafa Ismail  2021-06-02  2065  	spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, flags);
b48c24c2d710cf Mustafa Ismail  2021-06-02  2066  
b48c24c2d710cf Mustafa Ismail  2021-06-02  2067  	if (!iwpbl_buf)
b48c24c2d710cf Mustafa Ismail  2021-06-02  2068  		return -ENOMEM;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2069  
b48c24c2d710cf Mustafa Ismail  2021-06-02  2070  	cqmr_buf = &iwpbl_buf->cq_mr;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2071  	if (iwpbl_buf->pbl_allocated) {
b48c24c2d710cf Mustafa Ismail  2021-06-02  2072  		info.virtual_map = true;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2073  		info.pbl_chunk_size = 1;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2074  		info.first_pm_pbl_idx = cqmr_buf->cq_pbl.idx;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2075  	} else {
b48c24c2d710cf Mustafa Ismail  2021-06-02  2076  		info.cq_pa = cqmr_buf->cq_pbl.addr;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2077  	}
b48c24c2d710cf Mustafa Ismail  2021-06-02  2078  
b48c24c2d710cf Mustafa Ismail  2021-06-02  2079  	cqp_request = irdma_alloc_and_get_cqp_request(&rf->cqp, true);
b48c24c2d710cf Mustafa Ismail  2021-06-02  2080  	if (!cqp_request) {
b48c24c2d710cf Mustafa Ismail  2021-06-02  2081  		ret = -ENOMEM;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2082  		goto error;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2083  	}
b48c24c2d710cf Mustafa Ismail  2021-06-02  2084  
b48c24c2d710cf Mustafa Ismail  2021-06-02  2085  	info.shadow_read_threshold = iwcq->sc_cq.shadow_read_threshold;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2086  	info.cq_resize = true;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2087  
b48c24c2d710cf Mustafa Ismail  2021-06-02  2088  	cqp_info = &cqp_request->info;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2089  	m_info = &cqp_info->in.u.cq_modify.info;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2090  	memcpy(m_info, &info, sizeof(*m_info));
b48c24c2d710cf Mustafa Ismail  2021-06-02  2091  
b48c24c2d710cf Mustafa Ismail  2021-06-02  2092  	cqp_info->cqp_cmd = IRDMA_OP_CQ_MODIFY;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2093  	cqp_info->in.u.cq_modify.cq = &iwcq->sc_cq;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2094  	cqp_info->in.u.cq_modify.scratch = (uintptr_t)cqp_request;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2095  	cqp_info->post_sq = 1;
2322d17abf0a6c Shiraz Saleem   2022-02-17  2096  	ret = irdma_handle_cqp_op(rf, cqp_request);
b48c24c2d710cf Mustafa Ismail  2021-06-02  2097  	irdma_put_cqp_request(&rf->cqp, cqp_request);
2322d17abf0a6c Shiraz Saleem   2022-02-17  2098  	if (ret)
b48c24c2d710cf Mustafa Ismail  2021-06-02  2099  		goto error;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2100  
b48c24c2d710cf Mustafa Ismail  2021-06-02  2101  	spin_lock_irqsave(&iwcq->lock, flags);
b48c24c2d710cf Mustafa Ismail  2021-06-02  2102  	if (cq_buf) {
b48c24c2d710cf Mustafa Ismail  2021-06-02  2103  		cq_buf->kmem_buf = iwcq->kmem;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2104  		cq_buf->hw = dev->hw;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2105  		memcpy(&cq_buf->cq_uk, &iwcq->sc_cq.cq_uk, sizeof(cq_buf->cq_uk));
b48c24c2d710cf Mustafa Ismail  2021-06-02  2106  		INIT_WORK(&cq_buf->work, irdma_free_cqbuf);
b48c24c2d710cf Mustafa Ismail  2021-06-02  2107  		list_add_tail(&cq_buf->list, &iwcq->resize_list);
b48c24c2d710cf Mustafa Ismail  2021-06-02 @2108  		iwcq->kmem = kmem_buf;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2109  	}
b48c24c2d710cf Mustafa Ismail  2021-06-02  2110  
b48c24c2d710cf Mustafa Ismail  2021-06-02  2111  	irdma_sc_cq_resize(&iwcq->sc_cq, &info);
b48c24c2d710cf Mustafa Ismail  2021-06-02  2112  	ibcq->cqe = info.cq_size - 1;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2113  	spin_unlock_irqrestore(&iwcq->lock, flags);
b48c24c2d710cf Mustafa Ismail  2021-06-02  2114  
b48c24c2d710cf Mustafa Ismail  2021-06-02  2115  	return 0;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2116  error:
b48c24c2d710cf Mustafa Ismail  2021-06-02  2117  	kfree(cq_buf);
b48c24c2d710cf Mustafa Ismail  2021-06-02  2118  	return ret;
b48c24c2d710cf Mustafa Ismail  2021-06-02  2119  }
b48c24c2d710cf Mustafa Ismail  2021-06-02  2120  

:::::: The code at line 2108 was first introduced by commit
:::::: b48c24c2d710cf34810c555dcef883a3d35a9c08 RDMA/irdma: Implement device supported verb APIs

:::::: TO: Mustafa Ismail <mustafa.ismail@intel.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
