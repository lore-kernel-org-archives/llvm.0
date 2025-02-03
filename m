Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EFA13C3C2;
	Mon,  3 Feb 2025 20:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738613659; cv=none; b=Xix9oOCZ+wJdKyM6ml1RrXdx+1I3nFGaGIs7BbdpDWz6BKDF9zdm5AIaQLqeDm5viLGk9b9JgYypxJkC9Uaa18dxP/71qMIChiGwXOsn3QFgLvnIlGQa1wjC5v+XZRlP2N0Ey7FbsrLfVPdKD2x83RAf2oyTEZ+2xCm44qtyzUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738613659; c=relaxed/simple;
	bh=spYH+zlsX35SgQgy2SttxyNx9kOmpFPVKz6b+Qciaks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AxBkicKQb38RJaYaKgkFPF4BSe0I4lrFKmi/+K2QLYd9WO9e+VBo1Xq8zJFmmw4NPbbR8Vm1DlZV7AMSVj0K34BKO51b+EW92zJ8WKCE7EFSpxSDhg0ZDXCo7aIzoBgmpyXGcNB3lmS8zil8E7tFvRpl3YRZC5xVe5o3cflNGIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZP/TWuoQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZP/TWuoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738613658; x=1770149658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=spYH+zlsX35SgQgy2SttxyNx9kOmpFPVKz6b+Qciaks=;
  b=ZP/TWuoQA9Heh0WM59hfcx9cjPE41IvkVRSxImUeqC12JC/LOinM7feP
   1lh/WEeifZzPBrEFfNbOg3qp8kW3TqB9rv4YKJmovCxTJxwyVeIOENt+a
   v6mZKI8Gem5swA/kVfZq55xtJcHulETqyZAn0OxIWMn37DWAsw4g4b+Kf
   toB91i41bw8TMHKp/85f2fNaf0g2P+J319cYq61rnkICYVRZQ+hxgZSpT
   Gi6oqXaGAIhwhw7JzUhEsd+WkYwJ6XD6kjcxF8zlnr+fvBQB9THzcgauU
   BLGIETqGJ2CuLC/WDyNhBcflhn0uxoJLEgiDLCh3vIaLNMYyPsH7mz1CG
   Q==;
X-CSE-ConnectionGUID: HQxnQGcXQ2WtCB5BXP6mcA==
X-CSE-MsgGUID: vKsT2twGSvaoiwmIgp0eaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50533540"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50533540"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 12:14:17 -0800
X-CSE-ConnectionGUID: iDFqcQREQS6VfFz0Dvw2ng==
X-CSE-MsgGUID: eC29nPuCTrimeZg3kUx9SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111232866"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Feb 2025 12:14:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf2ph-000rRM-2l;
	Mon, 03 Feb 2025 20:14:13 +0000
Date: Tue, 4 Feb 2025 04:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:rdma-next 51/75] drivers/vfio/pci/mlx5/cmd.c:502:12:
 error: call to undeclared function 'alloc_pages_bulk_array'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202502040442.QAAEuVfX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   0fe95c8bb34ec3d2279ba62ae1b185cc1e607d42
commit: be85f7333a1aeed1715592f936dd55c8282aaa94 [51/75] vfio/mlx5: Enable the DMA link API
config: i386-buildonly-randconfig-003-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040442.QAAEuVfX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040442.QAAEuVfX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040442.QAAEuVfX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vfio/pci/mlx5/cmd.c:502:12: error: call to undeclared function 'alloc_pages_bulk_array'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     502 |                 filled = alloc_pages_bulk_array(GFP_KERNEL_ACCOUNT,
         |                          ^
   drivers/vfio/pci/mlx5/cmd.c:502:12: note: did you mean 'alloc_pages_bulk_noprof'?
   include/linux/gfp.h:213:15: note: 'alloc_pages_bulk_noprof' declared here
     213 | unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
         |               ^
   1 error generated.


vim +/alloc_pages_bulk_array +502 drivers/vfio/pci/mlx5/cmd.c

   491	
   492	static int mlx5vf_add_pages(struct page ***page_list, unsigned int npages)
   493	{
   494		unsigned int filled, done = 0;
   495		int i;
   496	
   497		*page_list = kvcalloc(npages, sizeof(struct page *), GFP_KERNEL_ACCOUNT);
   498		if (!*page_list)
   499			return -ENOMEM;
   500	
   501		for (;;) {
 > 502			filled = alloc_pages_bulk_array(GFP_KERNEL_ACCOUNT,
   503							npages - done,
   504							*page_list + done);
   505			if (!filled)
   506				goto err;
   507	
   508			done += filled;
   509			if (done == npages)
   510				break;
   511		}
   512	
   513		return 0;
   514	
   515	err:
   516		for (i = 0; i < done; i++)
   517			__free_page(*page_list[i]);
   518	
   519		kvfree(*page_list);
   520		*page_list = NULL;
   521		return -ENOMEM;
   522	}
   523	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
