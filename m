Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DB41482E7;
	Tue, 19 Nov 2024 06:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731997672; cv=none; b=XC238WsMM7K4yxHQuSNBVnaq23q2JY/C9Xv+pAgikFx9f21OERxOGN+MRNIHMUlEJPimPdx0j1N75Jsfs4y0YZ8FaayiHX2nNIipefM9vKIRGOuXX7RRbcWQUNyl6aeQp9BsalI6UtpTzYxIS3UM8Fr5z5D6YnBTqB2Pv4AGqng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731997672; c=relaxed/simple;
	bh=Jj4NEhXIkwDtw2Enn8mV6BMlnJVqzl4cthGqN6lfcdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FSAiNJDTEWrdtgWvfS/1iTznVe4oijFFgqSnb3TsMp5GRFUHgUceV91ARFVHfQzNFFCxCkaA4lhlWsU2KTu6Dav1dg74jRmrt3xBJzrkt5r8vUoLD6fjgq+z+RzmtrrCWasHVfE755yXdYN1Jap9RJaP43fFEYyp5t/tbvIG/Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8PphDIP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8PphDIP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731997670; x=1763533670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jj4NEhXIkwDtw2Enn8mV6BMlnJVqzl4cthGqN6lfcdQ=;
  b=F8PphDIPhSu55zMylp1buL+vykFv7ZlEmysAJGdMj+KG85ESo5xc6MKO
   S8nvfcwHFGryxvf+16u5g+HfxYIiaDAYtY16zS4rNIpyarbLdJYsj461h
   yaWtuPeh1UOPRinqFYBRWZx2PVbpMoejW8uHvB7el2EteqlZd75JctvPZ
   A5GsBbDiw3vipO9broRPYh/DzLdsTRCY/TJPTnzRQI4fLEiOqHWtEioNJ
   aQNGQPkHLol6+TbZavBVKOGuMt/CqrbFsAlbsm6C+qFnDgJz9PyspviTn
   +G5JqFWqmviUWZ63yvRGXD0HRtD3bbwziZTfpsHcnYNlkf8DQ6PRQ8+gv
   w==;
X-CSE-ConnectionGUID: 6uVDyIOVRGGhzYhUTegxUg==
X-CSE-MsgGUID: /156ROu0QiKOmyBHicegzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35888976"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="35888976"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 22:27:50 -0800
X-CSE-ConnectionGUID: Iclknjk2Qce/VmxkSVANAA==
X-CSE-MsgGUID: j1cfxSD/Q56xwcG38BUXVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="94279307"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 18 Nov 2024 22:27:48 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDHhK-00008s-1u;
	Tue, 19 Nov 2024 06:26:51 +0000
Date: Tue, 19 Nov 2024 14:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dave Jiang <dave.jiang@intel.com>
Subject: [jgunthorpe:fwctl 20/23] ERROR: modpost: "auxiliary_device_init"
 [drivers/cxl/core/cxl_core.ko] undefined!
Message-ID: <202411191458.yqwYzZd8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux fwctl
head:   e4450fb1459bf712009c7cb1461643287e0f9e75
commit: e7b7ae31414a4f3db3fecb2bab0a2f101fff1bcf [20/23] cxl: Create an auxiliary device for fwctl_cxl
config: riscv-randconfig-002-20241119 (https://download.01.org/0day-ci/archive/20241119/202411191458.yqwYzZd8-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191458.yqwYzZd8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191458.yqwYzZd8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
>> ERROR: modpost: "auxiliary_device_init" [drivers/cxl/core/cxl_core.ko] undefined!
>> ERROR: modpost: "__auxiliary_device_add" [drivers/cxl/core/cxl_core.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
