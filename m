Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E904134DE;
	Sat,  3 Aug 2024 17:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722707404; cv=none; b=QN2NIzeUTmO/FsSmUHUDGEamB74NzydBTRfe16fDEEOY3OtZT8QLRZeiwEpQjGa3Khe66Jg7g0aaoS0K9RboLVu84R0Vckwd0bAi82RfzwcILAGpsmNcSUPKcVPJGObY/WliTaDyS8c4Rcc3HescAW/tI8WzFy01SHVsumyLq28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722707404; c=relaxed/simple;
	bh=A5o5LHqWhEO+4lQPZ4aCBGbDnieeQy9b62Gb/1gwWao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GSFcnsXlrI4co007mjiXJPlH8rbMJ3/E55xMy4BxmS5aiJSE61W48i7HxC9nWQYZJw3+jm65Zr4/LduOJELpQrwMxv/jpbo17V9+ZMloodTOqbmcwDslZU7SGz8HFlHo7tNGTORQYXfDqtpu1A4u8C6FRx5i3HsH0tCG/fEdbzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6hSEOw3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6hSEOw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722707402; x=1754243402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A5o5LHqWhEO+4lQPZ4aCBGbDnieeQy9b62Gb/1gwWao=;
  b=S6hSEOw3/mqFbp6E83NlxWTOBxpEJI1b6Dq/89K2JFoJHv3TPa9EhC0X
   7CO/Ej0QpRoIaFZE2UXvLHayynGTGfO+aNUgcOjWe4Di3zottDoFTCsSL
   QlYwKRXS7V1cGrYk+YICbPDdWEFCOHbFoDnQaYC4MGbAzhZ1NRrkOSxj6
   mTPVSoWtxSPLfnDiyiMxXkKXFspLAf9N67P/OGERLAzDE66onNrhZIaE+
   bwkgZicS5z5HSEytNsOEoKSdb5IZ5urIe9dan//WqAnOqMG21QnaxKnqu
   zJYgb1sNmGGeHmhHhfIsKVVbOI30GsiEXY/uf2k3x/1YQqoZEvxWsMpTX
   A==;
X-CSE-ConnectionGUID: A4pIY029QwaPBaJgf9SzpA==
X-CSE-MsgGUID: IX2gupfZS/69aNSJTQVSDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="20524869"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="20524869"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 10:49:59 -0700
X-CSE-ConnectionGUID: fN2pFUeXQNKpynmDPhz5Ig==
X-CSE-MsgGUID: yKm4N/LZRLel7q0RguOamw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="60752981"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Aug 2024 10:49:57 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saIt9-0000oC-1D;
	Sat, 03 Aug 2024 17:49:55 +0000
Date: Sun, 4 Aug 2024 01:49:39 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 595/1093] ld.lld: error: undefined
 symbol: dma_buf_attach
Message-ID: <202408040156.mFTJ6COO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   868286d51b5753a66ab89c1c899510c6047b998d
commit: dc67651172095c04c4e6e1a64983036f4e654fd2 [595/1093] fpga: support loading from a pre-allocated buffer
config: hexagon-randconfig-001-20240803 (https://download.01.org/0day-ci/archive/20240804/202408040156.mFTJ6COO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040156.mFTJ6COO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040156.mFTJ6COO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dma_buf_attach
   >>> referenced by fpga-mgr.c
   >>>               drivers/fpga/fpga-mgr.o:(fpga_mgr_load) in archive vmlinux.a
   >>> referenced by fpga-mgr.c
   >>>               drivers/fpga/fpga-mgr.o:(fpga_mgr_load) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_buf_map_attachment
   >>> referenced by fpga-mgr.c
   >>>               drivers/fpga/fpga-mgr.o:(fpga_mgr_load) in archive vmlinux.a
   >>> referenced by fpga-mgr.c
   >>>               drivers/fpga/fpga-mgr.o:(fpga_mgr_load) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_buf_unmap_attachment
   >>> referenced by fpga-mgr.c
   >>>               drivers/fpga/fpga-mgr.o:(fpga_mgr_load) in archive vmlinux.a
   >>> referenced by fpga-mgr.c
   >>>               drivers/fpga/fpga-mgr.o:(fpga_mgr_load) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_buf_detach
   >>> referenced by fpga-mgr.c
   >>>               drivers/fpga/fpga-mgr.o:(fpga_mgr_load) in archive vmlinux.a
   >>> referenced by fpga-mgr.c
   >>>               drivers/fpga/fpga-mgr.o:(fpga_mgr_load) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_buf_put
   >>> referenced by fpga-mgr.c
   >>>               drivers/fpga/fpga-mgr.o:(fpga_mgr_load) in archive vmlinux.a
   >>> referenced by fpga-mgr.c
   >>>               drivers/fpga/fpga-mgr.o:(fpga_mgr_load) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_buf_get
   >>> referenced by fpga-mgr.c
   >>>               drivers/fpga/fpga-mgr.o:(fpga_device_ioctl) in archive vmlinux.a
   >>> referenced by fpga-mgr.c
   >>>               drivers/fpga/fpga-mgr.o:(fpga_device_ioctl) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
