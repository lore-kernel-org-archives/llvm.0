Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D65C35E93E;
	Fri, 12 Jun 2026 07:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249566; cv=none; b=Du/aq4T1u0qhcSqHEsCCNx0hxZwNVXh+vB8vJ7mxSLDxDab9i1XQjyd3BpUETGAZuS4V5As8YnaA4Z55Qg51gzukUOAmV0CLmosKdxVC7awCqXoFywv0kNR7jxfZ0un6IUSftRbjuv1A4uyOyZN8df42OKxABO9SvKgGicn7LnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249566; c=relaxed/simple;
	bh=wLfvdcGC6inqXE3MZbzbTKYNVxNQ4x0yEziFonfwWqI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q7ZQ9uw8bppNSSEZrCPEqND/6aPr1jTMh8ReFeZtSYEDTJDpJ1dgSwAdBd3zbpHTLB+tPI0Nb3rAM87LRnA6dvCWEvxaOPpe/Q8AEm3roimKYIDsh0YdUISz+gsXs/hjFk+1HOUEuTblG118XMd2ZiGTmaBMAqh7KaBWONdHRbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsHiZQjC; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsHiZQjC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781249565; x=1812785565;
  h=date:from:to:cc:subject:message-id;
  bh=wLfvdcGC6inqXE3MZbzbTKYNVxNQ4x0yEziFonfwWqI=;
  b=HsHiZQjCGLi33FTnc3jk8H+bQCMSJnHOpCQsC/SlI89OWqQWM5D4zNUB
   tMH2Avw8YanVEk4N/ph5H3HyIT5sIUAj2WyZ/lMhQR9sUHn00vBe//CIz
   wF8k7L2CXFQZ5dQXKfwD6uG+Qnzs1DjIXPT+BPhLerSwC6ncO8tpy3J0/
   79EgSKx2LTCK0actaf1XW8woIKiA3vmCVnsVJ/YgkE+PMfEdrsMbCykAO
   A1QrMDceNdtmvVfSJkKRFhg6LYuy2zLYYLh7ulaRtwKCjCVXQFXdFt6L9
   oI9/3l/6xhGz1fcyO3YzMr+dSUOtz/6NXvwUXwmprI6zeCGr84+Fd1KxR
   A==;
X-CSE-ConnectionGUID: gkLBATSVQ/irf3SdJ/eL/w==
X-CSE-MsgGUID: b1oUWiwHTN+dTDtv/xViWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92755193"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="92755193"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 00:32:44 -0700
X-CSE-ConnectionGUID: kFaPmlx6TJySkiW91628pA==
X-CSE-MsgGUID: YPwTw4yMRuWJRztEcRoO9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="245856376"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jun 2026 00:32:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXwNb-00000000OS7-3Uz5;
	Fri, 12 Jun 2026 07:32:39 +0000
Date: Fri, 12 Jun 2026 15:31:53 +0800
From: kernel test robot <lkp@intel.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sbates130272-p2pmem:switchtec-dma-sysfs 3/5] ld.lld: error:
 undefined symbol: dma_chan_kobject_add
Message-ID: <202606121508.oga9gQxg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sbates130272/linux-p2pmem.git switchtec-dma-sysfs
head:   ee2dacad5e6a8e8addc55cd39fe061ec8f008c71
commit: d613c4bb7e9ff70c482e71c63911a20f51d13b84 [3/5] dmaengine: switchtec-dma: Add config sysfs attributes
config: s390-randconfig-001-20260612 (https://download.01.org/0day-ci/archive/20260612/202606121508.oga9gQxg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c8ad049db78ae52052722b6f42b54cd2a666072b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121508.oga9gQxg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121508.oga9gQxg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dma_chan_kobject_add
   >>> referenced by switchtec_dma.c:1428 (drivers/dma/switchtec_dma.c:1428)
   >>>               drivers/dma/switchtec_dma.o:(switchtec_dma_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_chan_sysfs_ops
   >>> referenced by switchtec_dma.c
   >>>               drivers/dma/switchtec_dma.o:(switchtec_ktype) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
