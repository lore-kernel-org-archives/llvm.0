Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D414E5C614;
	Thu, 14 Mar 2024 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710402025; cv=none; b=SHrdkRYuddfjKfJlUWByCbTJVKE08+AC60Ut/nZVPQGYpG5IRoMsr1oo6J2uDBvNBUK8VWEOhFPzZUgnm8zDHqc1eMDTrvMaigTC3ZWC8aruuk7e7aMicqfgiKn1Y4M8XRZWfKBzjWLVAlzUYG4rEc3sYVeZ7W5WsrLFAeNxnvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710402025; c=relaxed/simple;
	bh=D4WLO8MlMeoD1gdxeeXG9ao+A+lqd8RvIRIQtqBcs7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J5AUVA9eTe9vBQugWcHhlLzeMMY/GaAmjUNeVMRf1lOQ/LKKPzc/eSMspqJDv0IaelP/nThOodrhl7/VFXG7gMoT+Buozg1bB3yrvR0KJ/HiFJQXIQNzcQ4yzAuRWx3IGEXfUGqvOZjT/jfACBGa9Kr6WB8zjWxeZxYc3BCr44k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+UfJD5v; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+UfJD5v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710402024; x=1741938024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D4WLO8MlMeoD1gdxeeXG9ao+A+lqd8RvIRIQtqBcs7M=;
  b=Q+UfJD5vwKav2yP92aJ9ERzvaYu4Hf7GxhIr2cNewjJDJpBzxh3EnU8/
   oPfB9PLc3YRPPK1N+wopXoiT6P6MbIGrGeLwouB+rg5DZlA6tvXeVxjwX
   kgdieowfg32Sek0ZwLGg0B55ywKWQpd9K8Pshg6C1T/olIypdv+g3VZxw
   udrKgB8zp+e0J1/nxcFJzYzhTOVx8oSUts0hEBpkG/Mw1VYLaS0VA/fwm
   /p+oQgQgq2d2+eL/14o7tgTgGgZC6s0p01dTmjuUv3xoWUHZevlTWAU3M
   i9M0cchGn5k/YY5mwiAbokkFlcghYyvMfT2IVBSD9DG6Qo5R1LK5dyajK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5055762"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5055762"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 00:40:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="43120818"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Mar 2024 00:40:21 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkfhK-000DDd-2Q;
	Thu, 14 Mar 2024 07:40:18 +0000
Date: Thu, 14 Mar 2024 15:39:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-recvsend-bundle 12/16] ld.lld: error:
 undefined symbol: io_uring_mmap_pages
Message-ID: <202403141507.wR1fzAD0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-recvsend-bundle
head:   57fd6bfcfb482b2e57219118e3a9a2c0c95b0f45
commit: 469421fb116f26e61d8e079f98f1bb89d3f3f39a [12/16] io_uring: get rid of remap_pfn_range() for mapping rings/sqes
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240314/202403141507.wR1fzAD0-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141507.wR1fzAD0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141507.wR1fzAD0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: io_uring_mmap_pages
   >>> referenced by kbuf.c
   >>>               io_uring/kbuf.o:(io_pbuf_mmap) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
