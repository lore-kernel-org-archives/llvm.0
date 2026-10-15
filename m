Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A091D346E70;
	Thu, 15 Oct 2026 07:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049476; cv=none; b=jFiuZTIvKDcxFF1CaPbM8waiUHw1qD0HB+THuiFdXMR2p6XiMwQw/gEcGD8msSJ/dMZD710v2zBurB7gVse1EMqEFkYyEQmUFzqfV/178/0UJz2tMtNrbbBipm7Sd4ekXFG2r+Kf2q2slB8oeUNApLAXHvQc1gylW5Lprb53GSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049476; c=relaxed/simple;
	bh=rJG8nPFeypOFktzYW1XKphX8OB/G7v9lU6lkJIFUOBk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZjiBt86m6Z79BUBdUpl1CQLAlxC1UjqUKDc7rqAPwrAr1lBCXF5uc9OY9maALWn+AuGHymhYIOfJpLjc/03pz+2evkkMQEgg4PzWZGgIec3dW5ZxgMCxnvp5h/HBBwqtsW/RrPOyUB7SSKx5LWY1wgFwu+QesNDldC2pKsqGdts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gmnlo80+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gmnlo80+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792049467; x=1823585467;
  h=date:from:to:cc:subject:message-id;
  bh=rJG8nPFeypOFktzYW1XKphX8OB/G7v9lU6lkJIFUOBk=;
  b=gmnlo80+lfjvAKI9HxLjVFR5lXeD1iil05zdgN8UypMtMONx7A61t8EZ
   5Qr0Aa+wFBqdf2B3nq4Ck7/mmPDMrLLBTiljB++uUa9FLUlgAilJAegos
   g5UyBaVOzip9vrrIV5nrPX3qOK3QpxbqXCsNC1pQg5h+RP46l1RVojUNz
   8Uy1Ej7eg/icPvqOzyJRlcMZINR+AsqKFrql+F4TrFI7Is8WFTVMr5Lfi
   mhsgYWA1S4B0QuiEOy9l3WKxQzJl7rIwiiiCIkHhHUyajWY1Uc66s5QPZ
   bNl+Y4WIntywDoGotIePRx7bmbfvUkM7bsImTR/w7XtUH0TkuZfvdXDnF
   Q==;
X-CSE-ConnectionGUID: kijdkP2eTT2M50u1Na0vbA==
X-CSE-MsgGUID: Z9DWBVirQOCBY8Ep1KZ95Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="685481"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="685481"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 00:31:06 -0700
X-CSE-ConnectionGUID: 4tDSCYAPRomxMN5NoCZfcQ==
X-CSE-MsgGUID: XnEwXwrrRdK5ChsLB+PShw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1724530"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Oct 2026 00:31:05 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHFvZ-00000000G12-3EXp;
	Thu, 15 Oct 2026 07:31:01 +0000
Date: Thu, 15 Oct 2026 15:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Zhang <zhangyu1@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Joerg Roedel <joerg.roedel@amd.com>, Wei Liu <wei.liu@kernel.org>,
 Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
 Jacob Pan <jacob.pan@linux.microsoft.com>,
 Michael Kelley <mhklinux@outlook.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [linux-next:master 14844/16276] ld.lld: error: undefined
 symbol: pci_request_acs
Message-ID: <202610151508.QwElcR9D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4eb2586bd40db27d77cc5b724ca9386ed0c71d53
commit: 2690d4156b51f7e9fe874dd480fc928594615552 [14844/16276] iommu/hyperv: Add para-virtualized IOMMU support for Hyper-V guest
config: x86_64-buildonly-randconfig-1003-20261014 (https://download.01.org/0day-ci/archive/20261015/202610151508.QwElcR9D-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610151508.QwElcR9D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610151508.QwElcR9D-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: pci_request_acs
   >>> referenced by hv-iommu-guest.c:574 (drivers/iommu/hyperv/hv-iommu-guest.c:574)
   >>>               drivers/iommu/hyperv/hv-iommu-guest.o:(hv_iommu_init) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
