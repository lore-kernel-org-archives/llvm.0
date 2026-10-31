Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793416329;
	b=nULejxufovRpq0XA2YbCHK+Cex8oaNDqFF7lwd2ILDcUtvb8FCoAryXM+qGBjqRfHyqy
	 Jzz/wB7YhoM5b8MoqcW624UsmZ/rgSlMj2uY06CZU5nYLMHibt+Yd6PaZgOeXhMt7us0t
	 dE18iSdOntWHa/6UFx4MILoGupuJq6r5x4ovU5+hds3zE1+3SuaA96lA/jpzHtwPHkMIa
	 EXoWUm5+CY1SX+JNZMS2q7ATF1KXSqamHyGLv3mDfY9ShUyHl0aaB6MABfdTY2nzRFcer
	 NHSDgpSm8BgFhlij6X1zM6ZCTNZuzmC1aV/r3/99Zskx0UOsFFNr+UfP8w2ZC8xESCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793416329;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=J0HrcKF1CdRwEzwcAUL1nNteds2mu3FA+nNKdV/v4Aw=;
	b=c4P4sWemcQhQQVQ2ejDWfGQeu3uuoaVmPvlLP3z5kJYR47pzd5TMtHBcDx/H9FYZRkHf
	 xnSpoLyzDq7YoJhfhZNQVjh0kEHDQPeHCzFOIj8qaKgthrtnkauMLfap05QB1grjDvroJ
	 GOaPbX7qDh4pKxS1t+1seemXEQWYKkWNS1CeihgVV0VBdLgYPcFLqtxp/eto/RZWfvM4B
	 4Dl7k/XQmu3E3cpzh37CmZNIJwrfXC/ACr+wlpS+KFvq+2X+k5m06d5G8k079zm37msmH
	 LjaGBkzsWrDyrLNSfLDUoM6Whf4ksFpo+UjTLzlhyOFhcPf3jc5bhoX8i6jkEO6q/1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BFoPA0kF;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E1A606A31A;
	Sat, 31 Oct 2026 03:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E1A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BFoPA0kF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793416328; x=1824952328;
  h=date:from:to:cc:subject:message-id;
  bh=q03yGqdzMvcjvgUO2ynhorXgjsw+J6MitN1rl9MDqcQ=;
  b=BFoPA0kFWGQ8jK5gQrvAAYFzf4gKw+84FkGnjemFOGYsLsS9mFVvQ1Fz
   GfmbVuhoOv/rDqkps9gq2//gICkDxaRUf2hOGYugdH/9D9RXcbs3o/qB1
   37jIPvgYeml26o+kVddvxIbu454CmeMq7TNC4TqT1NtLZFsIeuRCxg7FX
   EBKCLd3tt2jOJ/2dZiPrDwI3NahAxWZLwMbmi7ZukfbRY1v11rtKKhN7K
   LZKm4kQUI7dKpc5dehzm0mHLpZQ496XGxkWfVr9NrOrgJd+tUz3Evg37N
   1oONvQ4ZT22Q52+LAPCDnJyZbvMWnC3ECEf5BJYugUtEsfhbIehcHCiC7
   Q==;
X-CSE-ConnectionGUID: 8oNCMqySTdKiBTSS8q2C9g==
X-CSE-MsgGUID: n1FuRCK9TkuSgdSS0ztc5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2187888"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2187888"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 20:12:08 -0700
X-CSE-ConnectionGUID: iuIkoq4LQ1WxKxO/j48WsQ==
X-CSE-MsgGUID: GY9wuKzySSybMCROwILijQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5975906"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 30 Oct 2026 20:12:06 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMzVj-000000005qZ-3ykj;
	Sat, 31 Oct 2026 03:12:03 +0000
Date: Sat, 31 Oct 2026 04:11:45 +0100
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kuba:dma 2/11] drivers/xen/swiotlb-xen.c:435:11: error:
 incompatible function pointer types initializing 'void *(*)(struct device *,
 size_t, dma_addr_t *, gfp_t, unsigned long)' (aka 'void *(*)(struct device *,
 unsigned long, unsigned long long *, unsigned int, unsigned...
Message-ID: <202610310459.Y3UJp0xu-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

Hi Jakub,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kuba/linux.git dma
head:   cd9029ebe3033a797c066b493e4cfcf5337cf829
commit: 40f9c52cdcf8713402ec7a31c47511d06bdcf5d2 [2/11] dma-direct: pass the NUMA node to dma_direct_alloc()
config: arm64-randconfig-2000-20261031 (https://download.01.org/0day-ci/archive/20261031/202610310459.Y3UJp0xu-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8f6b51ca8bab1d49006ddaa042bc7e4e7306975d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310459.Y3UJp0xu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310459.Y3UJp0xu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/xen/swiotlb-xen.c:435:11: error: incompatible function pointer types initializing 'void *(*)(struct device *, size_t, dma_addr_t *, gfp_t, unsigned long)' (aka 'void *(*)(struct device *, unsigned long, unsigned long long *, unsigned int, unsigned long)') with an expression of type 'void *(struct device *, size_t, dma_addr_t *, gfp_t, unsigned long, int)' (aka 'void *(struct device *, unsigned long, unsigned long long *, unsigned int, unsigned long, int)') [-Wincompatible-function-pointer-types]
     435 |         .alloc = dma_direct_alloc,
         |                  ^~~~~~~~~~~~~~~~
   1 error generated.


vim +435 drivers/xen/swiotlb-xen.c

eb1ddc00b81cb8 Stefano Stabellini 2013-10-09  429  
dceb1a6819ab2c Christoph Hellwig  2017-05-21  430  const struct dma_map_ops xen_swiotlb_dma_ops = {
566fb90e050dfa Christoph Hellwig  2022-04-22  431  #ifdef CONFIG_X86
dceb1a6819ab2c Christoph Hellwig  2017-05-21  432  	.alloc = xen_swiotlb_alloc_coherent,
dceb1a6819ab2c Christoph Hellwig  2017-05-21  433  	.free = xen_swiotlb_free_coherent,
566fb90e050dfa Christoph Hellwig  2022-04-22  434  #else
566fb90e050dfa Christoph Hellwig  2022-04-22 @435  	.alloc = dma_direct_alloc,

:::::: The code at line 435 was first introduced by commit
:::::: 566fb90e050dfa2132340bbdab9533b727dda6f1 swiotlb-xen: fix DMA_ATTR_NO_KERNEL_MAPPING on arm

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
