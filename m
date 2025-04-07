Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EC4134A8;
	Mon,  7 Apr 2025 00:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743986904; cv=none; b=NS/MsVucYmAlPYg8pSqYvIhi7LjWAGahxG6K/lppDYr+PhmmkwbX5Ywo8U6yhNvftN3pMqTENSjzGAlv58RcXp6iUP6XDu0BvoEWNq1r3aK2QtpOqRzdHOkjrifeFrhh1cwCOy4HDl3Qj+dOduWlsONJQnuqq/wuMtqqsNU/2R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743986904; c=relaxed/simple;
	bh=ry03d21xu8vetCMNmIX7jso03TxGBaRL0DKyzrQBBM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BPhuqik/QvQscTKKoz7hTOC7FYfngIrlIWHe3kh3wt0r60LmPR9q9FQ/HNYNDKBatRYclMy/P7fQMtP6F81Vs1lvdKJlWeIPmaC5BkBdnzKh65is7KRyMFJLH54CEFpfycAB7I6DoM0wgx5sSdnY8Z3yOf8BhwlRUx+Ebwn7qH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBiy4YXW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBiy4YXW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743986903; x=1775522903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ry03d21xu8vetCMNmIX7jso03TxGBaRL0DKyzrQBBM4=;
  b=OBiy4YXWkYMs1DNpWnYwg6A3MbKesRP9wtcRd6MD9WeqkqXWJatK60Y5
   57wXHhZ2USpq9YZaMeDgdGC0+N6XYEG4LuBLBuSOamunt0/wRxuRG4cxo
   IvkEU9MhktkoGvprY3L0StdZYljtALpQ5GRkj2ynlVkw+9ptj5yTwHfSP
   +clQX1vuK2yoIgGV+PgIMKC7P3TwjFx4/E9MmDAVea4xDCX64ep4zmESq
   hL1/2oYvGApQW2plP4hRa4a4sNvxywdAF5A/C44gUYWRd5Ou58bQ9eYtV
   1gmaJmoXqDh6tGQ8hj5HaZbL5Ee1Lr+sDkRHgRwjRzGDcFgAIkAkSVmNc
   A==;
X-CSE-ConnectionGUID: UWHskfVaQgerx8q/C/4Acw==
X-CSE-MsgGUID: xpMlTdM/RHWC0wCH2k2N4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="44600860"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="44600860"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 17:48:22 -0700
X-CSE-ConnectionGUID: 0Q1fh9dGSDCRA+KY9zinLg==
X-CSE-MsgGUID: TMDJ/EFZQhu93JX9a0jQWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="133015050"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Apr 2025 17:48:20 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1aev-0002ql-1f;
	Mon, 07 Apr 2025 00:48:17 +0000
Date: Mon, 7 Apr 2025 08:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: Raju Rangoju <Raju.Rangoju@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	Akshata MukundShetty <akshata.mukundshetty@amd.com>
Subject: [broonie-ci:fileH5Eyqu 4/4] drivers/spi/spi-amd-pci.c:67:1: error:
 type specifier missing, defaults to 'int'; ISO C99 and later do not support
 implicit int
Message-ID: <202504070813.rpqefNrP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileH5Eyqu
head:   b644c2776652671256edcd7a8e71161e212b59ac
commit: b644c2776652671256edcd7a8e71161e212b59ac [4/4] spi: spi_amd: Add PCI-based driver for AMD HID2 SPI controller
config: arm-randconfig-002-20250407 (https://download.01.org/0day-ci/archive/20250407/202504070813.rpqefNrP-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504070813.rpqefNrP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504070813.rpqefNrP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-amd-pci.c:67:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      67 | module_pci_driver(amd_spi_pci_driver);
         | ^
         | int
>> drivers/spi/spi-amd-pci.c:67:19: error: a parameter list without types is only allowed in a function definition
      67 | module_pci_driver(amd_spi_pci_driver);
         |                   ^
   2 errors generated.


vim +/int +67 drivers/spi/spi-amd-pci.c

    66	
  > 67	module_pci_driver(amd_spi_pci_driver);
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
