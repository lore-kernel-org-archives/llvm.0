Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B067494;
	Mon,  8 Sep 2025 05:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757309395; cv=none; b=lxob8L3zSqID2cIuzb9zKaNSkIJtsq1DMeezo1Q5xUkilR/k5W2QClb8NnLZshewUlCHlNO7DEO+3yC3CDB2o1UYBMx2pHli2dxWB7PUfkELC11/YfjFPyfhQTSHPbEnB2jVUyZiLwoO2WKprAOwx02O4z80QgUFveaF3z8kO/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757309395; c=relaxed/simple;
	bh=AtSaqzO0nSP+7pWvkNAb+yAsqhx8a/N4sE2jNRGhDio=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MzoQX4YIhWVlR1f+p2YQws6LuYXyAw62IAZam0bB05a3MopuUHAG3Z85EEf/PCX4CYzxdJhFR5tSKqV3UpMRNg2r+YoSsbPmxqPWXOtI4000wM+SOQsZZ4jjlUYQh7wKjcH5lXfIzEf5bawXF7hEhsQo7Jwo1xGcBi2/Go623T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I51HDZXs; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I51HDZXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757309394; x=1788845394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AtSaqzO0nSP+7pWvkNAb+yAsqhx8a/N4sE2jNRGhDio=;
  b=I51HDZXsgCCME0T5wq/KwKDNX3jem6ZKBZ6mTu5I+hFA9flH+GERgymV
   5iBi4on2ucwIWLJdppRDOLUAvJKB6qqnCGu+6lOwZwDf4OQTH5h3adKSQ
   Ddsqeksl17MZwvjKcODGYLPnk3c4d3JdmXFVg+FXiIcW0HsaR1HVYzpix
   fwz70kyLkUnWlJlkcD56EhfpTRMuVExC3w3JWH96LK8YfB2LiZWHb4pQr
   M8AGfWyDezSZcvvoq+iYzxsmqkhnusY9asg7bUYDnqPVM00tyUBzEUdwQ
   vO+YpOjHuedaeedrDJmnHphc2S9y6hc5NhvKLkWV8a43pNsmLxx+bdTKx
   g==;
X-CSE-ConnectionGUID: 6RTHe/KtSSuSVLqKHkKJmw==
X-CSE-MsgGUID: PVUC+UVjTCCNu48+y0aDdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82150128"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="82150128"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 22:29:54 -0700
X-CSE-ConnectionGUID: i5G+EiKaQQa3HzNsR0V4hQ==
X-CSE-MsgGUID: O9mPtMKHToGtTR4HyakFuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="177903682"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Sep 2025 22:29:52 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvURp-0003X9-2u;
	Mon, 08 Sep 2025 05:29:49 +0000
Date: Mon, 8 Sep 2025 13:29:32 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 19/27] drivers/pci/p2pdma.c:265:11: warning:
 variable 'i' is uninitialized when used here
Message-ID: <202509081306.Kn97CBcM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   9bc352426598d13cfd13f8f031157d2b8a674cf1
commit: bb2ce8171dbc417c167ca7cabc946e39728432a5 [19/27] PCI/P2PDMA: Refactor to separate core P2P functionality from memory allocation
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250908/202509081306.Kn97CBcM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250908/202509081306.Kn97CBcM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509081306.Kn97CBcM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/p2pdma.c:265:11: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
     265 |         p2p->mem[i].owner = &pdev->dev;
         |                  ^
   drivers/pci/p2pdma.c:253:7: note: initialize the variable 'i' to silence this warning
     253 |         int i, ret;
         |              ^
         |               = 0
   1 warning generated.


vim +/i +265 drivers/pci/p2pdma.c

   241	
   242	/**
   243	 * pci_p2pdma_enable - Enable peer-to-peer DMA support for a PCI device
   244	 * @pdev: The PCI device to enable P2PDMA for
   245	 *
   246	 * This function initializes the peer-to-peer DMA infrastructure for a PCI
   247	 * device. It allocates and sets up the necessary data structures to support
   248	 * P2PDMA operations, including mapping type tracking.
   249	 */
   250	struct p2pdma_provider *pci_p2pdma_enable(struct pci_dev *pdev)
   251	{
   252		struct pci_p2pdma *p2p;
   253		int i, ret;
   254	
   255		p2p = rcu_dereference_protected(pdev->p2pdma, 1);
   256		if (p2p)
   257			/* PCI device was "rebound" to the driver */
   258			return p2p->mem;
   259	
   260		p2p = devm_kzalloc(&pdev->dev, sizeof(*p2p), GFP_KERNEL);
   261		if (!p2p)
   262			return ERR_PTR(-ENOMEM);
   263	
   264		xa_init(&p2p->map_types);
 > 265		p2p->mem[i].owner = &pdev->dev;
   266		for (i = 0; i < PCI_STD_NUM_BARS; i++)
   267			p2p->mem[i].bus_offset =
   268				pci_bus_address(pdev, i) - pci_resource_start(pdev, i);
   269	
   270		ret = devm_add_action_or_reset(&pdev->dev, pci_p2pdma_release, pdev);
   271		if (ret)
   272			goto out_p2p;
   273	
   274		rcu_assign_pointer(pdev->p2pdma, p2p);
   275		return p2p->mem;
   276	
   277	out_p2p:
   278		devm_kfree(&pdev->dev, p2p);
   279		return ERR_PTR(ret);
   280	}
   281	EXPORT_SYMBOL_GPL(pci_p2pdma_enable);
   282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
