Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A0210A09;
	Mon, 29 Apr 2024 06:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714371934; cv=none; b=XEp8FtChCHQVBJEfa8MrHCg438DY1N6NwFVlsvTfxB8QJrFTglgXu6nM8tKtJj5mGhMnoUEFzWI2XDpEVt0eSk+zlG3X8A95DGo5FC3NZGnnks32iRO0xdkhVy3yTLlgEYPeXyqbEvSPr/N51psc/YyCZ4ZXbdaIXQFaybJTzkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714371934; c=relaxed/simple;
	bh=xA3+whIRhQaToC2yVi+ZOj7PbImMeYhrND+JXIOUFxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DRzyvr0TPBc4RkGqiMjKhbxz8XolM+7bzUGtVNliAdeThk3/3WDu8r2akT+YCnz62DGWwxaMTIVHhoT9xkZQiJWxMn9N9xVCm+hxihi5KQPE4Eyks35gd0r+lHa1PiArlZf5zCjWBe8L21xMlIo7fdqLdqFdiDlHqqKbKwBtf/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RO5TiGJ4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RO5TiGJ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714371932; x=1745907932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xA3+whIRhQaToC2yVi+ZOj7PbImMeYhrND+JXIOUFxM=;
  b=RO5TiGJ4Vu7cO2xBRRdga8sL5vIrw0KCdJkAAWV5kFrtmKosMdoCly+w
   F5hyEV3Kxrc7kofJ+QUJy013MmaQ0WhI+tuS3dLI62lKVAc0pfTdlS6VL
   Kl579L4uOI+WdCYYi8UvVUcV5Aubbg3QVZQFZyGRXwOMQSnvCt+EYRbH1
   AXzWxeKgZZ4Fd32i6YKDSDMZ5ehYYH6q7RgEzZWqgIMqtLq8uhzVLS3Di
   xFmHDfjsxD9cFWiJIiYHyAS2SPx/gI3PWk48bL0Fz+qoS/6i31WE9aFDq
   MiBMvUXlVaZr+KwV0MyE9dcbrhu/ZqbggkW8P7N8oJ1OxSU1M6pZZFiQP
   g==;
X-CSE-ConnectionGUID: HAIdSFOuSLqYjUrGRhoKMw==
X-CSE-MsgGUID: 8Ztsw8PNQ/C4rzYvjmuZ1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10131897"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="10131897"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 23:25:31 -0700
X-CSE-ConnectionGUID: w/pSfnCUTVWDHeFde0s5rA==
X-CSE-MsgGUID: Krsjo5ZYQGW7DfEbmlyrEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="56904655"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Apr 2024 23:25:30 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1KS7-0006zm-3A;
	Mon, 29 Apr 2024 06:25:27 +0000
Date: Mon, 29 Apr 2024 14:25:26 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 643/992] ld.lld: error: undefined
 symbol: ulpi_write
Message-ID: <202404291402.XGHtrc7i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   2de012957c3555b5d1f46cdd63729f43b9bb4514
commit: aca8761729017fb7d788d9c07e6c50b169b425f6 [643/992] usb: dwc3: core: Add support for disabling vbus when suspended
config: i386-buildonly-randconfig-002-20240429 (https://download.01.org/0day-ci/archive/20240429/202404291402.XGHtrc7i-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291402.XGHtrc7i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291402.XGHtrc7i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ulpi_write
   >>> referenced by core.c
   >>>               drivers/usb/dwc3/core.o:(dwc3_runtime_resume) in archive vmlinux.a
   >>> referenced by core.c
   >>>               drivers/usb/dwc3/core.o:(dwc3_runtime_suspend) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
