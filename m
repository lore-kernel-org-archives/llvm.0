Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141541F9411;
	Fri,  3 Jan 2025 10:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735901815; cv=none; b=foW6gcaQtTqVUaNJO5gNFDaLyUUzweOQ0nDZorf+D6Gd8vYqfmgGCjOPV5cLbMmNhH7yLNVCc7Nylng1nl9HyzdIXtVHrfiwneR0gAqhF0hu3kA4aYUi30A7AkmzWr+eJN/ftB/a8Wdh8HKevpMQPSq4kKmKV4D65gL2pgUCe3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735901815; c=relaxed/simple;
	bh=0vxAy4uHx1ZS2VNTgwtn+Xc3FoHiG0w4tVnrFiDfEeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ej/7uJ7nCxY7/Z0Bix1gYx0vutITzYEbWcN51MUd9iFe7CiQ2m8C21H4tkoTczwWPVtiPXbLBjOrGzB89Uv/U7bTSsrETcV/X2zdgEEoBIEItHO72OsDGt6ga6hy/I2/L/tH3jy5am7hc+2wsi25pDfQ+i21kOeS/072snE2dro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j+smUC6U; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+smUC6U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735901814; x=1767437814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0vxAy4uHx1ZS2VNTgwtn+Xc3FoHiG0w4tVnrFiDfEeg=;
  b=j+smUC6UoEQdRkP7MHi2QUzln75POPWxAMj/yselfYtpUqMpTltGxHJR
   PqC+wkBZxzjUBbMCgNiqxOIwczZFKhy+aGBz4wQlJinN43WehPPicfOe4
   oS39TJqUu4o3hXtEtz/p4L6u8Tk/4rCwlcktOXMB3ifM61znYM6S+Rc5N
   FBlpNOIzLIJD/Vf+j6mm+EbkleVCMHh+bCYPsuXzOO/3ayEzGO8ytKy0U
   vXmFllgvPgaKXkHJiM0A/iGC7htBKqFVui+laoPn2DHs8achzK722SVDM
   atNkqKo4HaPNmIttQ63ZzPqBODPslmpnYHBmdNE99Dyf6ICuQ6ou6dAcj
   g==;
X-CSE-ConnectionGUID: vlQ9GTcFRlGW5wx+XIkfgA==
X-CSE-MsgGUID: eHyQYw2ZTTmE5x40Ns2Qzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="46646353"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="46646353"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 02:56:53 -0800
X-CSE-ConnectionGUID: gyKupznlTBW5TiUbsG+GDA==
X-CSE-MsgGUID: 7592snUvQnOV3CdJoi91wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="132617380"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Jan 2025 02:56:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTfMH-0009cN-1A;
	Fri, 03 Jan 2025 10:56:49 +0000
Date: Fri, 3 Jan 2025 18:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Weikang <guoweikang.kernel@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/memmap: Prevent double scanning of memmap by kmemleak
Message-ID: <202501031757.LDH2bhm8-lkp@intel.com>
References: <20250102065704.647693-1-guoweikang.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102065704.647693-1-guoweikang.kernel@gmail.com>

Hi Guo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Guo-Weikang/mm-memmap-Prevent-double-scanning-of-memmap-by-kmemleak/20250102-145930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250102065704.647693-1-guoweikang.kernel%40gmail.com
patch subject: [PATCH] mm/memmap: Prevent double scanning of memmap by kmemleak
config: x86_64-randconfig-072-20250103 (https://download.01.org/0day-ci/archive/20250103/202501031757.LDH2bhm8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031757.LDH2bhm8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031757.LDH2bhm8-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: vmemmap_alloc_block+0x8c (section: .text.vmemmap_alloc_block) -> memmap_alloc (section: .init.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
