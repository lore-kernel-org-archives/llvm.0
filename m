Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269D4136E3F;
	Sat,  7 Feb 2026 06:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770445234; cv=none; b=J6eS+uSzwQhfRMcEazxmgpRvOtLf54itROn+KEYopKon/FFaDfqDoyeMA7NV/QEXjUlvQClqSUylgpTsaaVPr9ANBt8/rxfOuy15Y4yM2zDV6+zwC89SAPIvnBRDcA7kOo06jlsRnKS/LBtngjA1z0KLTRdW6CEz2+EJgJx7Mgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770445234; c=relaxed/simple;
	bh=NxP0DbtBPS/jjC+9ZdKl01D87dnNJmPKLOCtB17nvos=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rYJpxwClce1vG4yxsmmlKUN5RrO2fqsyqcRAGcC6rJ8YFv9hW6mLH9yhXFuCUjGqTzjJDbYCstJSVkr1PYWXGIjlhNSYlVEBX98PzD7AP8cmbSEhvbMOavgNCqAJOFUH9AhaYr1wt1di8k6qybKDCLzRZ0ESh+AaBaYZMM5Piis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBiAPS1Q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBiAPS1Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770445234; x=1801981234;
  h=date:from:to:cc:subject:message-id;
  bh=NxP0DbtBPS/jjC+9ZdKl01D87dnNJmPKLOCtB17nvos=;
  b=BBiAPS1QYz4UJVscVLgD6hsPJvtI7lWo45/iVtSUIJ9i8074fBlz4/vW
   aSyGSymHTnZOX4cJPXKY+chTuYPBCUAST1J1rU3ZWzoEyuxJiT4422p9J
   Uyf++Y9Wvw63dIXlsx8/PQNHieSwR4wQ3IokAgEHJjlEg1pRMrFN9yLei
   FiXh9vbBEtU9AJe5yEcwkkyPm2WtyQuRMTDawOf/omqd6hXo8dsqRUZwS
   bOTGvTWyDa9b9d2M82KJ+ft+CE8YOo2uFveoPg+hE3Z2kgcJ2i2j061x2
   K1PeN59rQG3PDKypIjLOdAP0LVxbcnsbpr10xbfNoMQYBE1pTDTW2iMtj
   w==;
X-CSE-ConnectionGUID: Z0RJuuaMSvCVne6d9IKrWQ==
X-CSE-MsgGUID: mlOYB2+7RDekrNHNoVdkuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71828578"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71828578"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 22:20:34 -0800
X-CSE-ConnectionGUID: BTE4wrQrTa+S8fO3t7xQAw==
X-CSE-MsgGUID: F5rYDTGVRhGumChnv34v4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="215557458"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Feb 2026 22:20:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vobgD-00000000lS6-3Cfq;
	Sat, 07 Feb 2026 06:20:29 +0000
Date: Sat, 07 Feb 2026 14:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: Chengjun Yao <Chengjun.Yao@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Bob Zhou <Bob.Zhou@amd.com>
Subject: [agd5f:baseline0 29/81]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_peerdirect.c:362:40: error: no
 member named 'dma_length' in 'struct scatterlist'
Message-ID: <202602071450.W1TnNb5R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git baseline0
head:   b6a8211a7821bf70201912b493ab705f423700c7
commit: 4415c3986b7653907bf72d3150b596a491dbed38 [29/81] drm/amdkcl: kcl-cleanup macro HAVE_HYPERVISOR_IS_TYPE
config: loongarch-randconfig-002-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071450.W1TnNb5R-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071450.W1TnNb5R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071450.W1TnNb5R-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:2428 function parameter 'p' not described in 'kfd_process_unmap_doorbells_if_idle'
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_peerdirect.c:362:40: error: no member named 'dma_length' in 'struct scatterlist'
     362 |                         i, sg->dma_address, sg->length, sg->dma_length);
         |                                                         ~~  ^
   1 error generated.


vim +362 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_peerdirect.c

9e3a766b718144c Felix Kuehling 2020-04-23  304  
9e3a766b718144c Felix Kuehling 2020-04-23  305  
9e3a766b718144c Felix Kuehling 2020-04-23  306  static int amd_dma_map(struct sg_table *sg_head, void *client_context,
9e3a766b718144c Felix Kuehling 2020-04-23  307  			struct device *dma_device, int dmasync, int *nmap)
9e3a766b718144c Felix Kuehling 2020-04-23  308  {
9e3a766b718144c Felix Kuehling 2020-04-23  309  	struct sg_table *sg_table_tmp;
9d3646354db30f9 Philip Yang    2024-04-05  310  	struct scatterlist *sg;
9e3a766b718144c Felix Kuehling 2020-04-23  311  	int ret;
9d3646354db30f9 Philip Yang    2024-04-05  312  	int i;
9e3a766b718144c Felix Kuehling 2020-04-23  313  
9e3a766b718144c Felix Kuehling 2020-04-23  314  	/*
9e3a766b718144c Felix Kuehling 2020-04-23  315  	 * NOTE/TODO:
9e3a766b718144c Felix Kuehling 2020-04-23  316  	 * We could have potentially three cases for real memory
9e3a766b718144c Felix Kuehling 2020-04-23  317  	 *	location:
9e3a766b718144c Felix Kuehling 2020-04-23  318  	 *		- all memory in the local
9e3a766b718144c Felix Kuehling 2020-04-23  319  	 *		- all memory in the system (RAM)
9e3a766b718144c Felix Kuehling 2020-04-23  320  	 *		- memory is spread (s/g) between local and system.
9e3a766b718144c Felix Kuehling 2020-04-23  321  	 *
9e3a766b718144c Felix Kuehling 2020-04-23  322  	 *	In the case of all memory in the system we could use
9e3a766b718144c Felix Kuehling 2020-04-23  323  	 *	iommu driver to build DMA addresses but not in the case
9e3a766b718144c Felix Kuehling 2020-04-23  324  	 *	of local memory because currently iommu driver doesn't
9e3a766b718144c Felix Kuehling 2020-04-23  325  	 *	deal with local/device memory addresses (it requires "struct
9e3a766b718144c Felix Kuehling 2020-04-23  326  	 *	page").
9e3a766b718144c Felix Kuehling 2020-04-23  327  	 *
9e3a766b718144c Felix Kuehling 2020-04-23  328  	 *	Accordingly returning assumes that iommu funcutionality
9e3a766b718144c Felix Kuehling 2020-04-23  329  	 *	should be disabled so we can assume that sg_table already
9e3a766b718144c Felix Kuehling 2020-04-23  330  	 *	contains DMA addresses.
9e3a766b718144c Felix Kuehling 2020-04-23  331  	 *
9e3a766b718144c Felix Kuehling 2020-04-23  332  	 */
9e3a766b718144c Felix Kuehling 2020-04-23  333  	struct amd_mem_context *mem_context =
9e3a766b718144c Felix Kuehling 2020-04-23  334  		(struct amd_mem_context *)client_context;
9e3a766b718144c Felix Kuehling 2020-04-23  335  
9e3a766b718144c Felix Kuehling 2020-04-23  336  	pr_debug("Client context: 0x%p, sg_head: 0x%p\n",
9e3a766b718144c Felix Kuehling 2020-04-23  337  			client_context, sg_head);
9e3a766b718144c Felix Kuehling 2020-04-23  338  
9d3646354db30f9 Philip Yang    2024-04-05  339  	if (!mem_context || !mem_context->bo) {
9e3a766b718144c Felix Kuehling 2020-04-23  340  		pr_warn("Invalid client context");
9e3a766b718144c Felix Kuehling 2020-04-23  341  		return -EINVAL;
9e3a766b718144c Felix Kuehling 2020-04-23  342  	}
9e3a766b718144c Felix Kuehling 2020-04-23  343  
9e3a766b718144c Felix Kuehling 2020-04-23  344  	pr_debug("pid: %d, address: %#llx, size: %#llx\n",
9e3a766b718144c Felix Kuehling 2020-04-23  345  			mem_context->pid,
9e3a766b718144c Felix Kuehling 2020-04-23  346  			mem_context->va,
9e3a766b718144c Felix Kuehling 2020-04-23  347  			mem_context->size);
9e3a766b718144c Felix Kuehling 2020-04-23  348  
9e3a766b718144c Felix Kuehling 2020-04-23  349  	/* Build sg_table for buffer being exported, including DMA mapping */
9e3a766b718144c Felix Kuehling 2020-04-23  350  	ret = amdgpu_amdkfd_gpuvm_get_sg_table(
2246c819e466f03 Leslie Shi     2021-11-15  351  		mem_context->dev->adev, mem_context->bo, mem_context->flags,
9e3a766b718144c Felix Kuehling 2020-04-23  352  		mem_context->offset, mem_context->size,
9e3a766b718144c Felix Kuehling 2020-04-23  353  		dma_device, DMA_BIDIRECTIONAL, &sg_table_tmp);
9e3a766b718144c Felix Kuehling 2020-04-23  354  	if (ret) {
9e3a766b718144c Felix Kuehling 2020-04-23  355  		pr_err("Building of sg_table failed\n");
9e3a766b718144c Felix Kuehling 2020-04-23  356  		return ret;
9e3a766b718144c Felix Kuehling 2020-04-23  357  	}
9e3a766b718144c Felix Kuehling 2020-04-23  358  
9d3646354db30f9 Philip Yang    2024-04-05  359  	pr_debug("size 0x%llx nents %d\n", mem_context->size, sg_table_tmp->nents);
9d3646354db30f9 Philip Yang    2024-04-05  360  	for_each_sgtable_sg(sg_table_tmp, sg, i)
9d3646354db30f9 Philip Yang    2024-04-05  361  		pr_debug("segment_%d dma_address 0x%llx length 0x%x dma_length 0x%x\n",
9d3646354db30f9 Philip Yang    2024-04-05 @362  			i, sg->dma_address, sg->length, sg->dma_length);
9d3646354db30f9 Philip Yang    2024-04-05  363  
9e3a766b718144c Felix Kuehling 2020-04-23  364  	/* Maintain a copy of the handle to sg_table */
9e3a766b718144c Felix Kuehling 2020-04-23  365  	mem_context->pages = sg_table_tmp;
9e3a766b718144c Felix Kuehling 2020-04-23  366  	mem_context->dma_dev = dma_device;
9e3a766b718144c Felix Kuehling 2020-04-23  367  
9e3a766b718144c Felix Kuehling 2020-04-23  368  	/* Copy information about previosly allocated sg_table */
9e3a766b718144c Felix Kuehling 2020-04-23  369  	*sg_head = *mem_context->pages;
9e3a766b718144c Felix Kuehling 2020-04-23  370  
9d3646354db30f9 Philip Yang    2024-04-05  371  	/* Return number of sg table segments */
9e3a766b718144c Felix Kuehling 2020-04-23  372  	*nmap = mem_context->pages->nents;
9e3a766b718144c Felix Kuehling 2020-04-23  373  
9e3a766b718144c Felix Kuehling 2020-04-23  374  	return ret;
9e3a766b718144c Felix Kuehling 2020-04-23  375  }
9e3a766b718144c Felix Kuehling 2020-04-23  376  

:::::: The code at line 362 was first introduced by commit
:::::: 9d3646354db30f9a0472caa9e3bce3c34cf0a883 drm/amdkfd: Allow peer direct dma map with null RDMA device

:::::: TO: Philip Yang <Philip.Yang@amd.com>
:::::: CC: Bob Zhou <bob.zhou@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
