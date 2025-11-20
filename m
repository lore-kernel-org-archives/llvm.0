Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05841A9F86;
	Thu, 20 Nov 2025 14:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763647316; cv=none; b=JmtyZbB0B3SPskbwp4X4S75S++MzDZywa/i4hPpYNHPYm8JBC7+OSSjdoKd5B3jAj9bpvX0Llo1+FwmeeokKd3rbFXheI2GXuLWKveoj+FChV4IWQofYpYreuKFEcMCwdhoMxRH7nGoAYAZQHMcBz786G3xZzeCEtpPc/UepxD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763647316; c=relaxed/simple;
	bh=Ve4ukX2iF8Bmh+Ua/lNcl8rPEjusU3aGWQoWKZ6TY8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TWmLAmLY0/4gyjvYLX1W5RM7xHNPIW4VyClXciB8p8JAamalCUf+kmeqJQLMhGBZq4QwaIc4+FhaQAUxUZlh9wIsb0iaE8V36BzcL+CJAUMBLBrPFmcfpqNnzM8UiB7lmjcFUH5SUkbhoFBT3kkR8ebWdJEGiPNJgyzGp46DV8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XbK7bmLM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XbK7bmLM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763647315; x=1795183315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ve4ukX2iF8Bmh+Ua/lNcl8rPEjusU3aGWQoWKZ6TY8E=;
  b=XbK7bmLMxDoyS/0Xb1jLfqGC7s3GjDb9CQuptwt4kbQor8xyW8qTcozH
   qikgGoASLsJwssLJ/Xd6NIUxJZT/NkhmHoRlSK73ZFJSwppPZXzZ7uFBe
   yntECzzhNXyHot5v9AHX2x7gWKr2BJ/7R9/6f/VHOgwwzsrbGsDhsNDwQ
   HswrIDg9wJ8Z0TEVQ5REexMvME+c9F4DkxI1Nm80V7Kk52q5ZJ7flsveQ
   evf2XeDZhSChv8vbVX40IavyhYzR0Yg2vgt4F7oHWmOQkm1LDtATr1Zv9
   xqkc6S2SHFZkRXbAlrs1NDa6YcPnD5uiHBHnXW+yqC3Wi7VHRyWwDg2F0
   g==;
X-CSE-ConnectionGUID: ljQOeAdNSvufqN68cjTkwg==
X-CSE-MsgGUID: TRhR3EWbSlKQqcoudJNQ4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="53286788"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="53286788"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 06:01:54 -0800
X-CSE-ConnectionGUID: aF8CD+LGRpSPdOWx+wSVfA==
X-CSE-MsgGUID: NNBOTj6mQXmoSHn10fsH4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="222022409"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2025 06:01:53 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vM5EM-000000001Tn-1rvg;
	Thu, 20 Nov 2025 14:01:50 +0000
Date: Thu, 20 Nov 2025 15:00:51 +0100
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [leon-rdma:dmabuf-vfio-v9 7/14] Warning:
 drivers/dma-buf/dma-buf-mapping.c:219 function parameter 'dir' not described
 in 'dma_buf_free_sgt'
Message-ID: <202511201538.ZFwb2NVs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Leon,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio-v9
head:   09061b11c680a5382fe99b312e49eb13386b40ee
commit: b70c2e4d528c67dbd0635b4ee3a8e2b1cac2b4a9 [7/14] dma-buf: provide phys_vec to scatter-gather mapping routine
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251120/202511201538.ZFwb2NVs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201538.ZFwb2NVs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201538.ZFwb2NVs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dma-buf/dma-buf-mapping.c:219 function parameter 'dir' not described in 'dma_buf_free_sgt'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
