Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2D535E93B;
	Mon, 22 Jun 2026 22:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782166973; cv=none; b=TVoe9dl8jjC6HyBU2zyRRqWKARG1WzokEQufJ62cdBxquyotnamU43SqtSw2vXGoeHh8j6EPYMf/TUnbM14gCTrPQnEfYyw6doDY/ympq2pcEAe5lEfJgbFRtHLsppHv7pBX/Lr9HAphwWtSTY8/DIMI6q7N7FmKXqaUjAx/ibw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782166973; c=relaxed/simple;
	bh=NGhbZb21//AHvUjp14aTgxjSClU4yPXQD1V1Z+N+dPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oHKPobdGuJBWMkOcBy0igh3Bf3lyWf9bJ0Xlo3tffOlwZGv0oFSisv+2ZxDaTWcah7ovyxXb7PEvXY8CPvLca/ehNckm1saL1W18GlLRcFJpoTVL98tYVVeYRn0b/iDz6mUM0exbSo/kFaNvGkcCryylB17tYUeKGQhb9W6XYzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZYO+gac; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZYO+gac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782166971; x=1813702971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NGhbZb21//AHvUjp14aTgxjSClU4yPXQD1V1Z+N+dPk=;
  b=AZYO+gacDV/EouvNZEDV6gOgN9C63wyjoaB8bynYNvWBgNTHHZrj/2YD
   J20eKuwEym/srzyrIGfC8fy+SBgSo/44Ijnk5tWxGT2B5Fi3qI/liGOKG
   DqddhvpoqoEr5RMayqhy3wfBZbNu70WenLiXbBXWaFfipkyvgxRTSTqoD
   +FewT6GoCly+o1TSy34yKnWM2ATvdw5GBOEzJyVYpIVFJ86W39y3H2O5+
   2v+Zb4sF6DAZiagBp9842mZnUh9TH9HTjr86k7XHfxEYmgdVp7Fh4AezG
   dPGgEVYzE/c0pKEVwbl+DeZR20aE0BwSyHhc+an1Gpa3c8kFIBct4j8AU
   g==;
X-CSE-ConnectionGUID: OqNReJ71RTOvdNHyNVOOuA==
X-CSE-MsgGUID: uj+V6hPSSQyr1gC4rFLuyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82676851"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="82676851"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 15:22:50 -0700
X-CSE-ConnectionGUID: ETh0or9RTXaG7sM32mwaiw==
X-CSE-MsgGUID: QXMZjpQMROWCBHMItxiJww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="246430591"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Jun 2026 15:22:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbn2U-00000000211-2ZAQ;
	Mon, 22 Jun 2026 22:22:46 +0000
Date: Tue, 23 Jun 2026 06:22:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:mfd 69/124]
 drivers/spi/spi-zx.c:477:17: warning: implicit conversion from 'unsigned
 long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551614
 to 4294967294
Message-ID: <202606230616.8oCztMjD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel mfd
head:   c94d760b3ed42a18ecbae9e63d7010c770a8c042
commit: 412031528a775a2630dc7a0b13acf7e31b07defc [69/124] zx29 qspi driver
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606230616.8oCztMjD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230616.8oCztMjD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230616.8oCztMjD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-zx.c:477:17: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551614 to 4294967294 [-Wconstant-conversion]
     477 |         writel_relaxed(~ZX_QSPI_EN, qspi->io_base + ZX_QSPI_EN_REG);
         |         ~~~~~~~~~~~~~~ ^~~~~~~~~~~
   1 warning generated.


vim +477 drivers/spi/spi-zx.c

   473	
   474	static void zx_qspi_remove(struct platform_device *pdev)
   475	{
   476		struct zx_qspi *qspi = platform_get_drvdata(pdev);
 > 477		writel_relaxed(~ZX_QSPI_EN, qspi->io_base + ZX_QSPI_EN_REG);
   478	}
   479	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
