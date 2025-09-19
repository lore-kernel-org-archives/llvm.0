Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ECA2D29D5;
	Fri, 19 Sep 2025 21:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758316292; cv=none; b=rxh/FVg4wFJwLFEjcTjYXCmgLNQklIBClyo71MT3FzcMoZMBTn+pURwFgVSrlSmpqTQg/4B3iWRNXj3dMXmnsI+WeP7Bgt7EbI97ruE2rnMSY2wQEOuAvRFUXDhAOc9jT2rBmKVNh5H/XkPdd9OIA3O+RbJxjJ96VeNsLhP/nkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758316292; c=relaxed/simple;
	bh=jPHWge33/Zfv3LIUKeMmLAvCpBe5QEmk8inTIA1AfMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LOh2IMtikA0gcpzsbAjkELWJ1Pc9hYGmmx9XaglMS4jtnpebCDNT7wRghZL7fGKLJtnQ9OIvnGCLkmo2iqHHzShs+eZ+88x2Va/tIb9G7yplQJwtn34WVDtrpCz2R3OCx/S83IFQj0X18gSN/SpL2P5T/RbMOuOogOSHhe6Lvnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVyW3UzR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVyW3UzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758316291; x=1789852291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jPHWge33/Zfv3LIUKeMmLAvCpBe5QEmk8inTIA1AfMg=;
  b=GVyW3UzRH/UDPI6yYeGUucCxc1W6XTR2eNnfH+4gNt9GFMAcB3Lz7EgS
   By1vnw5R0IVNvtRLunNaYEYeY4I3CcLM5HtQ3Cy1UQvc14XDJfA1kUs2S
   JmroCEu1wjtHWoGqk0wG90NpLfB/SjUKflWhlSlBr/sbNRCt7WXsWPY14
   hRt+DEHK4LEIdXtpS8UjLSeDR1b4ouqP9QPjAQAQx7BQSYL7/sAd6P6Ns
   4S7S0CH8wkEdULz+f6PmIsCxK4+S8jykJTHYt+i95ljWf2SiC8WVfVhMZ
   8VJMQb0zmtrfi//DULq7cW/DSoVhj36hvHCC8UXfxSD3SZtzTmJ//+Gph
   A==;
X-CSE-ConnectionGUID: dF+uhTmsTA6xTLyb9EJ/CQ==
X-CSE-MsgGUID: n0dD95IGTCOrES9mYi8yxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="63300124"
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="63300124"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 14:11:30 -0700
X-CSE-ConnectionGUID: Qhrc3mBQT3mKUor6tXfaxA==
X-CSE-MsgGUID: KMT3/RMmSTO4z8dfmTpNlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="206678437"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Sep 2025 14:11:29 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uziO6-0004oV-1v;
	Fri, 19 Sep 2025 21:11:26 +0000
Date: Sat, 20 Sep 2025 05:10:44 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 39/44]
 arch/powerpc/platforms/ps3/system-bus.c:594:3: warning: non-void function
 'ps3_ioc0_map_phys' should return a value
Message-ID: <202509200518.VAevT8GF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   d42f66e173967159357a213dd04777137478de3b
commit: 05219b5f489decdb1f4b89b4eeaf14206d2a3f39 [39/44] powerpc: Convert to physical address DMA mapping
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250920/202509200518.VAevT8GF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509200518.VAevT8GF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509200518.VAevT8GF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:352:9: note: previous definition is here
     352 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> arch/powerpc/platforms/ps3/system-bus.c:594:3: warning: non-void function 'ps3_ioc0_map_phys' should return a value [-Wreturn-mismatch]
     594 |                 return;
         |                 ^
   2 warnings generated.


vim +/ps3_ioc0_map_phys +594 arch/powerpc/platforms/ps3/system-bus.c

   581	
   582	static dma_addr_t ps3_ioc0_map_phys(struct device *_dev, phys_addr_t phys,
   583					    size_t size,
   584					    enum dma_data_direction direction,
   585					    unsigned long attrs)
   586	{
   587		struct ps3_system_bus_device *dev = ps3_dev_to_system_bus_dev(_dev);
   588		int result;
   589		dma_addr_t bus_addr;
   590		u64 iopte_flag;
   591		void *ptr = phys_to_virt(phys);
   592	
   593		if (attrs & DMA_ATTR_MMIO)
 > 594			return;
   595	
   596		iopte_flag = CBE_IOPTE_M;
   597		switch (direction) {
   598		case DMA_BIDIRECTIONAL:
   599			iopte_flag |= CBE_IOPTE_PP_R | CBE_IOPTE_PP_W | CBE_IOPTE_SO_RW;
   600			break;
   601		case DMA_TO_DEVICE:
   602			iopte_flag |= CBE_IOPTE_PP_R | CBE_IOPTE_SO_R;
   603			break;
   604		case DMA_FROM_DEVICE:
   605			iopte_flag |= CBE_IOPTE_PP_W | CBE_IOPTE_SO_RW;
   606			break;
   607		default:
   608			/* not happened */
   609			BUG();
   610		}
   611		result = ps3_dma_map(dev->d_region, (unsigned long)ptr, size,
   612				     &bus_addr, iopte_flag);
   613	
   614		if (result) {
   615			pr_debug("%s:%d: ps3_dma_map failed (%d)\n",
   616				__func__, __LINE__, result);
   617		}
   618		return bus_addr;
   619	}
   620	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
