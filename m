Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9229514900E;
	Fri, 18 Oct 2024 17:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729274041; cv=none; b=S8EwNowSTMbIZ4j1MmUxEFNsswQZf1MbybDcSute8GHUnu8cK+LVcKVjj2JEnwB9rRsg4gH6Hz9ylfDPbHTnzELWKdAu6t3J7ldD+SAepfM75uM4ru8xH4ov5WB9J/pE3TrkAM/a/BQ8BQOLWXev8ftrv4CIAZqPry1+5JBKKGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729274041; c=relaxed/simple;
	bh=9Hb1ZoaLuzUwCvltKII0T8s/Of2MHigpgwk4CdxcD4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WKvxI5OyJDThI7RJnDCyWqz27kfP4YTtv8jK6DaMhYb/Ve8mkROuRxcL595Ezv4QirTJDvplb59L+jI3O0pedpDrWQS8FhlA+lamnxAaLR8BysIN/juSm5X6wyhPMtc72jgir0BetQdNoX1Agb0okohmjtp1pU7iYN3x6ldAv9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfzg0DFW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfzg0DFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729274039; x=1760810039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Hb1ZoaLuzUwCvltKII0T8s/Of2MHigpgwk4CdxcD4k=;
  b=nfzg0DFWyo40Htc/8DV4Iz2+n6KuLw8uXhudaxzP0MZ2MA2GNJ/C9my/
   Hxq2ZFFFmtE3TIwoDhGIqM0jO33zyUC+IeN2lb7r4aehvzLbYMIez7vuW
   t/x24hgllnf0ngBeSGoFn0THPTks1EOMYMi7rvJsw+R5g4tdcPwoV6Pe+
   gcxJPh3T/6K/MO5BbjzZdSbRrTETJUM0TaWuVgDOQ/oUpiaVxWGpu3agP
   il4n3Y9YSc85SMn7CW8S5k9MnXa1pEoA5xBCW62rm4h++EMRNO5P+G/E5
   JUHtmUkM4wcV5X6wgLszd3ue5B9cZGH5Jh8KlFGl16+CtNDAdE2hmVBSY
   Q==;
X-CSE-ConnectionGUID: h1QLCbKaT3eGh24E+e2t+Q==
X-CSE-MsgGUID: 9vgPG/wSRimgr0pWzgZfUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32502537"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32502537"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 10:53:58 -0700
X-CSE-ConnectionGUID: 2qFaqh4ySV+lVmoIblKNBQ==
X-CSE-MsgGUID: r/ip/swuRh2GBE+qJdIQWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="109680176"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Oct 2024 10:53:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1rAg-000O9R-0C;
	Fri, 18 Oct 2024 17:53:54 +0000
Date: Sat, 19 Oct 2024 01:53:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jens-wiklander-tee:testing/tuxbuild 1/2]
 drivers/tee/tee_rstmem.c:40:29: error: call to undeclared function
 'phys_to_page'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202410190146.hY3MF4rH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   http://git.linaro.org/people/jens.wiklander/linux-tee testing/tuxbuild
head:   971e80da23e2fbfd044ec231e75a61dfeb6ce61a
commit: bc4386e9f6899baeaf60b57076495f2336c1f7f7 [1/2] tee: add restricted memory allocation
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241019/202410190146.hY3MF4rH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190146.hY3MF4rH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190146.hY3MF4rH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tee/tee_rstmem.c:40:29: error: call to undeclared function 'phys_to_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      40 |                 sg_set_page(a->table.sgl, phys_to_page(shm->paddr), shm->size,
         |                                           ^
   drivers/tee/tee_rstmem.c:40:29: note: did you mean 'phys_to_virt'?
   arch/x86/include/asm/io.h:148:21: note: 'phys_to_virt' declared here
     148 | static inline void *phys_to_virt(phys_addr_t address)
         |                     ^
>> drivers/tee/tee_rstmem.c:40:29: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct page *' [-Wint-conversion]
      40 |                 sg_set_page(a->table.sgl, phys_to_page(shm->paddr), shm->size,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/scatterlist.h:136:69: note: passing argument to parameter 'page' here
     136 | static inline void sg_set_page(struct scatterlist *sg, struct page *page,
         |                                                                     ^
   2 errors generated.


vim +/phys_to_page +40 drivers/tee/tee_rstmem.c

    17	
    18	static int rstmem_dma_attach(struct dma_buf *dmabuf,
    19				     struct dma_buf_attachment *attachment)
    20	{
    21		struct tee_shm *shm = dmabuf->priv;
    22		struct tee_rstmem_attachment *a;
    23		int rc;
    24	
    25		a = kzalloc(sizeof(*a), GFP_KERNEL);
    26		if (!a)
    27			return -ENOMEM;
    28	
    29		if (shm->pages) {
    30			rc = sg_alloc_table_from_pages(&a->table, shm->pages,
    31						       shm->num_pages, 0,
    32						       shm->num_pages * PAGE_SIZE,
    33						       GFP_KERNEL);
    34			if (rc)
    35				goto err;
    36		} else {
    37			rc = sg_alloc_table(&a->table, 1, GFP_KERNEL);
    38			if (rc)
    39				goto err;
  > 40			sg_set_page(a->table.sgl, phys_to_page(shm->paddr), shm->size,
    41				    0);
    42		}
    43	
    44		a->dev = attachment->dev;
    45		attachment->priv = a;
    46	
    47		return 0;
    48	err:
    49		kfree(a);
    50		return rc;
    51	}
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
