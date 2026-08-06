Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FF9252917;
	Thu,  6 Aug 2026 05:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785995245; cv=none; b=MdYTNkQyXseirKhL50D9W27VFniJCwCDS4jb0YEQNRJNvS+7AUmMoH/UZbIRFtwz2dtqOyAPkQx1AXe328YL4LGIWBBFScmpCDuDdvp/6Q9tFVTOG9tox2YG3H/6O2LdpLQuVw7DO9MCl42mxuJcFUwAByUQP3OiD4nvVmOxXUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785995245; c=relaxed/simple;
	bh=9whEcVi+bZ76hr7pVy5xXsniCrbyjEpX1fcP7rpzGNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMyIizvP4MbpU3BGfyu8s3v15jR+mgkrWYUogkEoxrgXRh6INRs7pwjSIfIcNF1Q75XvztaO4zE3CJ2DBiM5LkCgx9sGnk6B6B4gqBXZ1JzC06nyvmFqDNfJbZQD/Bhg1Ox9dBjABG+G7D9//qRKAtW5IyPoV75Gma9v23lv6t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yzvmb+5M; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yzvmb+5M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785995244; x=1817531244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9whEcVi+bZ76hr7pVy5xXsniCrbyjEpX1fcP7rpzGNc=;
  b=Yzvmb+5MDrAdpZWC5mPC6kKzsNh5gkS660g10BjhpHLWBQY8ojip7w3H
   VxIp/UY1ms0OYE3Y8hNm4LAbCX0fT8hKOZNpAwrcz0+kpJuwPydyYmZP9
   PEkwA93uKJEm0PVPLwIumNINklxs6IwQZEHR95VeP8DEWlPfr/ckx2F1/
   ta7bfjji/kDYnyEm97j1Y5wz+aJTXlfvSJtxP1lzLNXrnInibbTERWc/R
   xbes7I2BYbShUjIdk6+Njxp2XYLvENUeMqTYWLyNWII8+VHQhdzeJfP3m
   4qd7f5523qoQWZXDPVNIoDQ06lTWK9algtEbE0TdjuqHiFvNHkRVQYyVP
   w==;
X-CSE-ConnectionGUID: 8TwwZET8Ql6O+WtVBbt8FA==
X-CSE-MsgGUID: mcYheGAHS/aWp4HC4gd6YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97941167"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="97941167"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 22:47:23 -0700
X-CSE-ConnectionGUID: E+Nkj0+0Ra6BdBMaxB89jQ==
X-CSE-MsgGUID: K6YnMC3aSRq/uy52CQCB/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="263991239"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Aug 2026 22:47:22 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrqwp-00000000EI5-3NBh;
	Thu, 06 Aug 2026 05:47:19 +0000
Date: Thu, 6 Aug 2026 13:46:20 +0800
From: kernel test robot <lkp@intel.com>
To: Aakarsh Jain <aakarsh.jain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] x86/pci-dma: add "any" keyword to swiotlb= kernel
 parameter
Message-ID: <202608061320.CdWO5wPP-lkp@intel.com>
References: <20260708114244.246176-1-aakarsh.jain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708114244.246176-1-aakarsh.jain@oss.qualcomm.com>

Hi Aakarsh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v7.2-rc6 next-20260805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aakarsh-Jain/x86-pci-dma-add-any-keyword-to-swiotlb-kernel-parameter/20260805-183105
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260708114244.246176-1-aakarsh.jain%40oss.qualcomm.com
patch subject: [RFC PATCH] x86/pci-dma: add "any" keyword to swiotlb= kernel parameter
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260806/202608061320.CdWO5wPP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061320.CdWO5wPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608061320.CdWO5wPP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/dma/swiotlb.c:451:2: error: use of undeclared identifier 'flags'
     451 |         flags |= swiotlb_param_flags;
         |         ^~~~~
   1 error generated.


vim +/flags +451 kernel/dma/swiotlb.c

   426	
   427	/*
   428	 * Systems with larger DMA zones (those that don't support ISA) can
   429	 * initialize the swiotlb later using the slab allocator if needed.
   430	 * This should be just like above, but with some error catching.
   431	 */
   432	int swiotlb_init_late(size_t size, gfp_t gfp_mask,
   433			int (*remap)(void *tlb, unsigned long nslabs))
   434	{
   435		struct io_tlb_pool *mem = &io_tlb_default_mem.defpool;
   436		unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
   437		unsigned int nareas;
   438		unsigned char *vstart = NULL;
   439		unsigned int order, area_order;
   440		bool retried = false;
   441		int rc = 0;
   442	
   443		if (io_tlb_default_mem.nslabs)
   444			return 0;
   445	
   446		if (swiotlb_force_disable)
   447			return 0;
   448	
   449		io_tlb_default_mem.force_bounce = swiotlb_force_bounce;
   450	
 > 451		flags |= swiotlb_param_flags;
   452	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
