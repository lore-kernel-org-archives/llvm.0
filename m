Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DE729BDB0;
	Tue,  2 Dec 2025 07:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764662350; cv=none; b=NEafEXykFXlrUGR6cHlGOphUyuFLgcCuwxidEQIiKqlW7w2RBelk9fBzIJXe4UBw8sQYvYbqwP2Y1cMTbgn7t1Bh8Yu7A+j9K8h7qCroLMTWruVWyzjkJb6QxTjWgYqEdzcdhimB4Obq1FHps961cVH0wKQG9sl0kObhGluzMqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764662350; c=relaxed/simple;
	bh=3Z+nBbIMOLUq1vWUro3Z4gh+jgAVKUsoeElGu9CCsqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i7ksQA87AlqkPQl1ILWiJDuR0MhueytU2pCc2u/d7MONU5MEMuK8TEObI3OdAwFpWJuzu+bdN2Qhca3piMXsW0hJf8dvGqxDJAgQ7rrlAdKf7HP8opNJ7O4A0HW5dS/hWn2th11AJQKChsKbw3zfHkQT3INEP4iX+tzRe1ckwr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4oWZd0t; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4oWZd0t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764662349; x=1796198349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Z+nBbIMOLUq1vWUro3Z4gh+jgAVKUsoeElGu9CCsqA=;
  b=m4oWZd0tji5dJDPJOvaMA1kcQeepQQPdTZ6+MXbceV0nfSIgUfw4jfdY
   N+mLeSyhYTY2lSELgcZWxXosNMVuKw0DWG2/S11UADa9+28aBz6fE7hnM
   knDQaJKYOVFLdVrkQbnBfEeHd2VXyH4s854lcmj/rwRKdIQEkAR8zpaBl
   m/Pqj7XV+zD9qJ8RLaKkiDWk/O/8eRRAZLU/QhK/36v2/4agtFWcCSwFh
   rgHGxbULhfDKUJG/0GZMyjsmBvqIKHHm5A8xljjdCcmgOpm99IcVJLw43
   gZKr2vgkHzr7kxju/OziUFShRmdxAG1Gb1ZUA2Ml3Rjjna4yTh0xEJQ7f
   A==;
X-CSE-ConnectionGUID: 3G+HbzL9SqyBdeBJ9GM91A==
X-CSE-MsgGUID: 23Hi9qqCR0SLIdBc5xKSvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66786671"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="66786671"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 23:59:08 -0800
X-CSE-ConnectionGUID: wUt/MvqcTci5wj4g0CwGOA==
X-CSE-MsgGUID: F0whD4GSSGunZDGrGHj9xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="194398877"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Dec 2025 23:59:07 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQLHs-000000009YL-3QMg;
	Tue, 02 Dec 2025 07:59:04 +0000
Date: Tue, 2 Dec 2025 15:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: [broonie-ci:v6_20251125_haibo_chen_add_support_for_nxp_xspi 2/2]
 drivers/spi/spi-nxp-xspi.c:997:2: error: call to undeclared function
 'PM_RUNTIME_ACQUIRE_AUTOSUSPEND'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202512021519.6wCd1iB6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v6_20251125_haibo_chen_add_support_for_nxp_xspi
head:   4105df382bd80d3ea5431c6065afe270a55a6dda
commit: 4105df382bd80d3ea5431c6065afe270a55a6dda [2/2] spi: add driver for NXP XSPI controller
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20251202/202512021519.6wCd1iB6-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021519.6wCd1iB6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512021519.6wCd1iB6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/spi/spi-nxp-xspi.c:40:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/spi/spi-nxp-xspi.c:997:2: error: call to undeclared function 'PM_RUNTIME_ACQUIRE_AUTOSUSPEND'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     997 |         PM_RUNTIME_ACQUIRE_AUTOSUSPEND(xspi->dev, pm);
         |         ^
>> drivers/spi/spi-nxp-xspi.c:997:44: error: use of undeclared identifier 'pm'
     997 |         PM_RUNTIME_ACQUIRE_AUTOSUSPEND(xspi->dev, pm);
         |                                                   ^
>> drivers/spi/spi-nxp-xspi.c:998:8: error: call to undeclared function 'PM_RUNTIME_ACQUIRE_ERR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     998 |         err = PM_RUNTIME_ACQUIRE_ERR(&pm);
         |               ^
   drivers/spi/spi-nxp-xspi.c:998:32: error: use of undeclared identifier 'pm'
     998 |         err = PM_RUNTIME_ACQUIRE_ERR(&pm);
         |                                       ^
   drivers/spi/spi-nxp-xspi.c:1265:2: error: call to undeclared function 'PM_RUNTIME_ACQUIRE_AUTOSUSPEND'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1265 |         PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
         |         ^
   drivers/spi/spi-nxp-xspi.c:1265:38: error: use of undeclared identifier 'pm'
    1265 |         PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
         |                                             ^
   drivers/spi/spi-nxp-xspi.c:1266:8: error: call to undeclared function 'PM_RUNTIME_ACQUIRE_ERR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1266 |         ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
         |               ^
   drivers/spi/spi-nxp-xspi.c:1266:32: error: use of undeclared identifier 'pm'
    1266 |         ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
         |                                       ^
   1 warning and 8 errors generated.


vim +/PM_RUNTIME_ACQUIRE_AUTOSUSPEND +997 drivers/spi/spi-nxp-xspi.c

   987	
   988	static int nxp_xspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
   989	{
   990		struct nxp_xspi *xspi = spi_controller_get_devdata(mem->spi->controller);
   991		void __iomem *base = xspi->iobase;
   992		u32 reg;
   993		int err;
   994	
   995		guard(mutex)(&xspi->lock);
   996	
 > 997		PM_RUNTIME_ACQUIRE_AUTOSUSPEND(xspi->dev, pm);
 > 998		err = PM_RUNTIME_ACQUIRE_ERR(&pm);
   999		if (err)
  1000			return err;
  1001	
  1002		/* Wait for controller being ready. */
  1003		err = readl_poll_timeout(base + XSPI_SR, reg,
  1004				      !(reg & XSPI_SR_BUSY), 1, POLL_TOUT_US);
  1005		if (err) {
  1006			dev_err(xspi->dev, "SR keeps in BUSY!");
  1007			return err;
  1008		}
  1009	
  1010		nxp_xspi_select_mem(xspi, mem->spi, op);
  1011	
  1012		nxp_xspi_prepare_lut(xspi, op);
  1013	
  1014		/*
  1015		 * For read:
  1016		 *     the address in AHB mapped range will use AHB read.
  1017		 *     the address out of AHB mapped range will use IP read.
  1018		 * For write:
  1019		 *     all use IP write.
  1020		 */
  1021		if ((op->data.dir == SPI_MEM_DATA_IN) && !needs_ip_only(xspi)
  1022			&& ((op->addr.val + op->data.nbytes) <= xspi->memmap_phy_size))
  1023			err = nxp_xspi_ahb_read(xspi, op);
  1024		else
  1025			err = nxp_xspi_do_op(xspi, op);
  1026	
  1027		nxp_xspi_sw_reset(xspi);
  1028	
  1029		return err;
  1030	}
  1031	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
