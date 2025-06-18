Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FB91E8323;
	Wed, 18 Jun 2025 22:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750284163; cv=none; b=Yj5RIC3kfaVwZ/7OzD5ufK2UIMErizzA0VZEJxNIssdttTRFzRlsdPoLdnxjjozpbijUjRRRU38c4qwQBVetgWnqEnDL++GSRa/o4tWMSuFrePkkf23WdvV1zetW1QLzIhF9txIBD23+DoRIhylPwd0ewGw8kfp0AIDYaIOCyEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750284163; c=relaxed/simple;
	bh=LE42sSovu5S81Vb+6l6WjkWfjS87Oqv7Fx78by7SMbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bmTxc65XaqUXEbQxemuqsTQGsMwDLVkEXUD8A00TbUwgVfZErS5lL0UXm50V5KHI0ikq6hhEUNlG3y+aBfKUmOBEuviyUKrkauinn0/EXX4dR9ZkyF2OpNNAm/z/kJd4LHUMHnSpdVJ4LD/98AqeLGmXcGZR8YvITY/FJy6fNhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tuh26UKT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tuh26UKT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750284162; x=1781820162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LE42sSovu5S81Vb+6l6WjkWfjS87Oqv7Fx78by7SMbA=;
  b=Tuh26UKT4/6F/dIpDktYZGDZ0IBmqYG7Pv2pD/9gHEWdxYwFul+JvYVW
   WxzPcgJRvJD5Ni0rdUJNHnkgQqsnypay0y3dwegTW0yLZw9hZjOctWEgC
   9aRo6c5+6gUWt1qyuvphb5r7gt+RgYgbvf39FkqobbRpaVPq1VNqlDOsC
   XGau3FFSjCufBHz4JWgGfB1/+HF1lxi+HffCnASR6A85ZoWX7peyfq2xY
   UzbqV1MJPNjd0Q3WKJtj9WEHlCDY/It3SERJkJ8iWbOFADsUJigelG6JN
   lSeIIZYVMgELPHH4/11BqmeB0frmaQVJdMEyf2ybtTgVvj06RKfWKRlCA
   w==;
X-CSE-ConnectionGUID: DCc6nsBNREWqxsJVkZ6T4w==
X-CSE-MsgGUID: qTG1euP+Tdee4tj/AArWCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56321060"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="56321060"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 15:02:41 -0700
X-CSE-ConnectionGUID: nxBdDkEVR5+WsR+9EKgmtw==
X-CSE-MsgGUID: aIA8Y3YCQm23uf4g3vdVNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="150630212"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Jun 2025 15:02:40 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS0re-000KDK-0l;
	Wed, 18 Jun 2025 22:02:38 +0000
Date: Thu, 19 Jun 2025 06:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-direct-pfn 4/13]
 arch/powerpc/kernel/dma-iommu.c:27:6: warning: no previous prototype for
 function 'arch_dma_unmap_phys_direct'
Message-ID: <202506190527.hsOoFOg7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-direct-pfn
head:   a7679860d78d4379f88e33c3f5cf972a17180db0
commit: 023d9f0376459ba6bc5e05cccdacbd2cc0b9fa6e [4/13] dma-mapping: convert dma_direct_*map_page to be phys_addr_t based
config: powerpc64-randconfig-002-20250619 (https://download.01.org/0day-ci/archive/20250619/202506190527.hsOoFOg7-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506190527.hsOoFOg7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506190527.hsOoFOg7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/dma-iommu.c:27:6: warning: no previous prototype for function 'arch_dma_unmap_phys_direct' [-Wmissing-prototypes]
      27 | bool arch_dma_unmap_phys_direct(struct device *dev, dma_addr_t dma_handle)
         |      ^
   arch/powerpc/kernel/dma-iommu.c:27:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      27 | bool arch_dma_unmap_phys_direct(struct device *dev, dma_addr_t dma_handle)
         | ^
         | static 
   1 warning generated.


vim +/arch_dma_unmap_phys_direct +27 arch/powerpc/kernel/dma-iommu.c

    26	
  > 27	bool arch_dma_unmap_phys_direct(struct device *dev, dma_addr_t dma_handle)
    28	{
    29		if (likely(!dev->bus_dma_limit))
    30			return false;
    31	
    32		return is_direct_handle(dev, dma_handle);
    33	}
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
