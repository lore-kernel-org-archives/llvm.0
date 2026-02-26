Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC804313549;
	Thu, 26 Feb 2026 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772103035; cv=none; b=nhdBpiWrG5sa+EkdMeM11dXQfdlnErTtiYu3V6wCQM/krTAQKCA8agJRVkzArGs2Qp+mIOlmEMTqqftP79FexfBEcXb2TmDb9B5nK4TLDytJsrQ57sL/kgoNY2bBVKei209Ytm+uUdOhK/g6f6MoJGWf2WBdDwbtkgYj0XM6zmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772103035; c=relaxed/simple;
	bh=PLnmVvSakw+XELdFSe/TPJz8Bd88GokE+zUf0m9rHv8=;
	h=Date:From:Cc:Subject:Message-ID; b=eMnOuMpA4izFcz4GEyto5PvBzWrQ8B+XjorrbV0IybOQnAFr7mGOIgOhytUPJDygry577Q8NLAF1e/PKfuvzrcN6JfLAHY/ykaBahiJv6mU0+Wc9xZeYN5jyYDZcYwuhuFfunvu/6s1FgYC3gD0bBLvBiIbHdmX3ZaiNzE6umDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzF1eyuH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzF1eyuH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772103034; x=1803639034;
  h=date:from:cc:subject:message-id;
  bh=PLnmVvSakw+XELdFSe/TPJz8Bd88GokE+zUf0m9rHv8=;
  b=XzF1eyuHB+gU2XR4GoB/Lb7F5almofGSkXsL4fkuUhRPai9GUMv24zQY
   cJ4JiQlnNfhjc5YUwqcYlZdhkxyMIPpNsAixCTCJBxfvxyzKq/iaFJS4u
   45W35lf8OX1AA7+CSOqRybYmQpkAjPmPivDyl5z0HlaHTP3sf6vaRTjVm
   sunrKhZZqZt8U3ZKqPNMl9OjQSLQPn/MvO3lDJa9WHgGgRxpplD+BRfX3
   28X1/3yB12QHfZrvKnNjO3ZRcTu8GxbWEYwBbkjTSpjObz65qr2xrhiMe
   8JRKjU85Khwe2tZXXGGp0xgfGEw4+jZSuEfoEANMXcsI5XVF98txhwI4S
   A==;
X-CSE-ConnectionGUID: 1EE1iOlaQsyNsNX0zQOVww==
X-CSE-MsgGUID: Rs31cJu+S3WgAMoBg+QHGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73203360"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73203360"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 02:50:33 -0800
X-CSE-ConnectionGUID: a/YWaxwyTBCUmv+13RCzLg==
X-CSE-MsgGUID: yDoif+RST92JBtKvHGIg7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="216666686"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Feb 2026 02:50:31 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvYwv-0000000095p-1URf;
	Thu, 26 Feb 2026 10:50:29 +0000
Date: Thu, 26 Feb 2026 18:49:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Maxime Ripard <mripard@kernel.org>
Subject: [linux-next:master 999/2193]
 drivers/infiniband/core/ib_core_uverbs.c:249:3: error: call to undeclared
 function 'dma_buf_move_notify'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202602261854.pBeCvcz8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   877552aa875839314afad7154b5a561889e87ea9
commit: 8b85987d3cf50178f67618122d9f3bb202f62f42 [999/2193] Merge drm/drm-next into drm-misc-next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260226/202602261854.pBeCvcz8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602261854.pBeCvcz8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602261854.pBeCvcz8-lkp@intel.com/

Note: the linux-next/master HEAD 877552aa875839314afad7154b5a561889e87ea9 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/infiniband/core/ib_core_uverbs.c:249:3: error: call to undeclared function 'dma_buf_move_notify'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     249 |                 dma_buf_move_notify(uverbs_dmabuf->dmabuf);
         |                 ^
   1 error generated.
--
>> drivers/infiniband/core/uverbs_std_types_dmabuf.c:170:3: error: call to undeclared function 'dma_buf_move_notify'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     170 |                 dma_buf_move_notify(uverbs_dmabuf->dmabuf);
         |                 ^
   1 error generated.


vim +/dma_buf_move_notify +249 drivers/infiniband/core/ib_core_uverbs.c

3411f9f01b76bd Michal Kalderon 2019-10-30  223  
3411f9f01b76bd Michal Kalderon 2019-10-30  224  /**
3411f9f01b76bd Michal Kalderon 2019-10-30  225   * rdma_user_mmap_entry_remove() - Drop reference to entry and
3411f9f01b76bd Michal Kalderon 2019-10-30  226   *				   mark it as unmmapable
3411f9f01b76bd Michal Kalderon 2019-10-30  227   *
3411f9f01b76bd Michal Kalderon 2019-10-30  228   * @entry: the entry to insert into the mmap_xa
3411f9f01b76bd Michal Kalderon 2019-10-30  229   *
3411f9f01b76bd Michal Kalderon 2019-10-30  230   * Drivers can call this to prevent userspace from creating more mappings for
3411f9f01b76bd Michal Kalderon 2019-10-30  231   * entry, however existing mmaps continue to exist and ops->mmap_free() will
3411f9f01b76bd Michal Kalderon 2019-10-30  232   * not be called until all user mmaps are destroyed.
3411f9f01b76bd Michal Kalderon 2019-10-30  233   */
3411f9f01b76bd Michal Kalderon 2019-10-30  234  void rdma_user_mmap_entry_remove(struct rdma_user_mmap_entry *entry)
3411f9f01b76bd Michal Kalderon 2019-10-30  235  {
0ac6f4056c4a25 Yishai Hadas    2026-02-01  236  	struct ib_uverbs_dmabuf_file *uverbs_dmabuf, *tmp;
0ac6f4056c4a25 Yishai Hadas    2026-02-01  237  
3411f9f01b76bd Michal Kalderon 2019-10-30  238  	if (!entry)
3411f9f01b76bd Michal Kalderon 2019-10-30  239  		return;
3411f9f01b76bd Michal Kalderon 2019-10-30  240  
0ac6f4056c4a25 Yishai Hadas    2026-02-01  241  	mutex_lock(&entry->dmabufs_lock);
6b3712c0246ca7 Jason Gunthorpe 2020-01-15  242  	xa_lock(&entry->ucontext->mmap_xa);
3411f9f01b76bd Michal Kalderon 2019-10-30  243  	entry->driver_removed = true;
6b3712c0246ca7 Jason Gunthorpe 2020-01-15  244  	xa_unlock(&entry->ucontext->mmap_xa);
0ac6f4056c4a25 Yishai Hadas    2026-02-01  245  	list_for_each_entry_safe(uverbs_dmabuf, tmp, &entry->dmabufs, dmabufs_elm) {
0ac6f4056c4a25 Yishai Hadas    2026-02-01  246  		dma_resv_lock(uverbs_dmabuf->dmabuf->resv, NULL);
0ac6f4056c4a25 Yishai Hadas    2026-02-01  247  		list_del(&uverbs_dmabuf->dmabufs_elm);
0ac6f4056c4a25 Yishai Hadas    2026-02-01  248  		uverbs_dmabuf->revoked = true;
0ac6f4056c4a25 Yishai Hadas    2026-02-01 @249  		dma_buf_move_notify(uverbs_dmabuf->dmabuf);
0ac6f4056c4a25 Yishai Hadas    2026-02-01  250  		dma_resv_wait_timeout(uverbs_dmabuf->dmabuf->resv,
0ac6f4056c4a25 Yishai Hadas    2026-02-01  251  				      DMA_RESV_USAGE_BOOKKEEP, false,
0ac6f4056c4a25 Yishai Hadas    2026-02-01  252  				      MAX_SCHEDULE_TIMEOUT);
0ac6f4056c4a25 Yishai Hadas    2026-02-01  253  		dma_resv_unlock(uverbs_dmabuf->dmabuf->resv);
0ac6f4056c4a25 Yishai Hadas    2026-02-01  254  		kref_put(&uverbs_dmabuf->kref, ib_uverbs_dmabuf_done);
0ac6f4056c4a25 Yishai Hadas    2026-02-01  255  		wait_for_completion(&uverbs_dmabuf->comp);
0ac6f4056c4a25 Yishai Hadas    2026-02-01  256  	}
0ac6f4056c4a25 Yishai Hadas    2026-02-01  257  	mutex_unlock(&entry->dmabufs_lock);
0ac6f4056c4a25 Yishai Hadas    2026-02-01  258  
3411f9f01b76bd Michal Kalderon 2019-10-30  259  	kref_put(&entry->ref, rdma_user_mmap_entry_free);
3411f9f01b76bd Michal Kalderon 2019-10-30  260  }
3411f9f01b76bd Michal Kalderon 2019-10-30  261  EXPORT_SYMBOL(rdma_user_mmap_entry_remove);
3411f9f01b76bd Michal Kalderon 2019-10-30  262  

:::::: The code at line 249 was first introduced by commit
:::::: 0ac6f4056c4a257f4b230b910e3e6fee6c6fc9b9 RDMA/uverbs: Add DMABUF object type and operations

:::::: TO: Yishai Hadas <yishaih@nvidia.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
