Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42C833EC;
	Tue, 25 Nov 2025 15:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764086038; cv=none; b=nmkSsBMbrOhtAO8O6LUZGc5oL+Em5ZiSbfReTW9iBlBRsYR5RJ3pSpwM8HSupbc1bBfRk5shIjS0C+pWs+wV9+CBbmKqH4jTUxYSCqr7iNzXiEm4HRVoQgSfZ2HVubBtXn5hRsW/fHE3UNovUaauGwxzB/ZMfhrn9YchWkbbJY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764086038; c=relaxed/simple;
	bh=aY+9PNeaLfifJfzy2k0Lg4Scxmv/dwPWJOtcHJkmjv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tjXuJVqgPrLRsaXr7c4F6xnOKmqo1W9lktLbgliReM4CqOTxlsm27uXlFc54uYvEbr0eKZZkBcWLhbD7DshBwu2tAesAMWma8tcbpmzWhRNTgtftIVq2GPjwPnX+kQyZUST/Gw8B9JB1UPOvJEsoNc2RL324AM5WHZAcg+vEnMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9rPIwKv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9rPIwKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764086037; x=1795622037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aY+9PNeaLfifJfzy2k0Lg4Scxmv/dwPWJOtcHJkmjv4=;
  b=E9rPIwKvCuqf3bf1gmklo8qVWAy3op37Fy/lYkUnfe5q4r76gruDR1/7
   uJ44QYpx+NZ/zKpmENk/aYofVzHG/c/EGMDdz0EqIfkCcXZScGOtzeHyl
   x5THb/NlO1KPSBMMo2WLHYzMAnMi4JMDb8S1Uuh3ACX5C0a/bIlaEa+bO
   01VivN0oxnOj4CWcksX2h/7zV73GT9B8ohOhtFUwdPWp+6l270zubYck8
   0vivSkBXqfAbXcAGfsyF9Evb9Wdy9+BRW7SB6HRPIoTsaTQvnITqXCT+R
   o/Qc62XOOqeMPsNtL3fy5WfIDEEHKO0kvi0jChkk0w97ckhQc+WwNBaYN
   Q==;
X-CSE-ConnectionGUID: cOdNNm9jQECNgEAxpcQsbg==
X-CSE-MsgGUID: o7/+EKPgSA2jUPtObRRMfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66144038"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="66144038"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 07:53:57 -0800
X-CSE-ConnectionGUID: ko3R22r8QUealj0/dOLb4A==
X-CSE-MsgGUID: R1SnBKZcTsynov0tK1kOhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="192559310"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Nov 2025 07:53:55 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNvMX-000000001yz-0CEe;
	Tue, 25 Nov 2025 15:53:53 +0000
Date: Tue, 25 Nov 2025 23:53:32 +0800
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lyude Paul <lyude@redhat.com>
Subject: [linux-next:master 11391/11746]
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.c:84:37: warning: result of
 comparison of constant 1099511627775 with expression of type 'dma_addr_t'
 (aka 'unsigned int') is always false
Message-ID: <202511252350.7SSB6nMU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   92fd6e84175befa1775e5c0ab682938eca27c0b2
commit: 31d3354f42c0da34415164a1f621a195caa1f1bc [11391/11746] drm/nouveau: verify that hardware supports the flush page address
config: i386-buildonly-randconfig-002-20251125 (https://download.01.org/0day-ci/archive/20251125/202511252350.7SSB6nMU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511252350.7SSB6nMU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511252350.7SSB6nMU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.c:84:37: warning: result of comparison of constant 1099511627775 with expression of type 'dma_addr_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
      84 |         WARN_ON(fb->sysmem.flush_page_addr > DMA_BIT_MASK(40));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   1 warning generated.
--
>> drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c:19:37: warning: result of comparison of constant 4503599627370495 with expression of type 'dma_addr_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
      19 |         WARN_ON(fb->sysmem.flush_page_addr > DMA_BIT_MASK(52));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   1 warning generated.
--
>> drivers/gpu/drm/nouveau/nvkm/subdev/fb/gh100.c:17:37: warning: result of comparison of constant 4503599627370495 with expression of type 'dma_addr_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
      17 |         WARN_ON(fb->sysmem.flush_page_addr > DMA_BIT_MASK(52));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   1 warning generated.
--
>> drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.c:218:37: warning: result of comparison of constant 1099511627775 with expression of type 'dma_addr_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     218 |         WARN_ON(fb->sysmem.flush_page_addr > DMA_BIT_MASK(40));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   1 warning generated.
--
>> drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c:17:37: warning: result of comparison of constant 4503599627370495 with expression of type 'dma_addr_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
      17 |         WARN_ON(fb->sysmem.flush_page_addr > DMA_BIT_MASK(52));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   1 warning generated.


vim +84 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.c

    79	
    80	void
    81	gf100_fb_sysmem_flush_page_init(struct nvkm_fb *fb)
    82	{
    83		// Ensure that the address can actually fit in the register
  > 84		WARN_ON(fb->sysmem.flush_page_addr > DMA_BIT_MASK(40));
    85	
    86		nvkm_wr32(fb->subdev.device, 0x100c10, fb->sysmem.flush_page_addr >> 8);
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
