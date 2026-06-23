Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9E0218592;
	Tue, 23 Jun 2026 13:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220471; cv=none; b=uPcUGJcbcW4hBieOHdWnYwdGj9CG1/YXYtc/j3kkZL9VQdp9B3aCdDcU5hjQqn4uhawWp/+IZ8eKUrhVm+u8oQXh3ZwGf8C7QVhDzYwDCYugAk5O9iHL0Cw3K1mLUgnspAHF370AfPRWTPBjTmpUkPs7Xj4tZfBAXB+1rtyakOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220471; c=relaxed/simple;
	bh=/Cvp1NxX22/3gOUQlP36MK448Q/uV3R9fdlZmFEEPKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SPB7+hKSqhQXaZL5Uwd3p5EyyPr65EfLxuZvcEYneRQk3scRbxyHK3kC+gueV4fgoNyDCWYnYMqZ29lChSEczdV8k902wMbXs/2QsLRtIH9KQkGpmSwQ+G3ybmEU4czkKJblajewAjE82k5rT6b7tU6iC+7mYC9dHTlCOc76CiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bo98EwNB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bo98EwNB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782220469; x=1813756469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Cvp1NxX22/3gOUQlP36MK448Q/uV3R9fdlZmFEEPKA=;
  b=Bo98EwNBlMPRDeBK1HliGqR0bfk7ucTpaF2lIdX6Dq01RRbR6Zq3UPJ+
   ZszmjAJ6mVGSdNoj135IIKky1UNFJI+vy3SYaOo0gfYMdwW/Z2dB8bYoF
   tJef4aae+/0gbmHGksT9vDl7GR8zMXD/+xR/B45d7F3+bSlP3jqjBzKsa
   udTlcVCTfmja1BU3dkWZWTFelD+g7WmzSMbkFES5PbnLXzL/2zFyRNwFX
   ZGWhxUaImpq+cQz2PvseDieYHAp7G9Yfgk6qwguyyO9clp6cY+XIotCIl
   O3Upjh7af/L5hVymqjRzp+VdPbejmVEewbVg43dzCmCT4dwX4AYLjUdir
   Q==;
X-CSE-ConnectionGUID: s6BCt383QHil9Thea+dxRA==
X-CSE-MsgGUID: u5XErY2sQbONekqjEDRPSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94454917"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="94454917"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 06:14:28 -0700
X-CSE-ConnectionGUID: L0fgcQQORsCIlRvLUls56w==
X-CSE-MsgGUID: 2t3TdQnhSyKS8prHEzQ7DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="249549884"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Jun 2026 06:14:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc0xM-000000002Xl-1Kn0;
	Tue, 23 Jun 2026 13:14:24 +0000
Date: Tue, 23 Jun 2026 21:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 70/120]
 drivers/spi/spi-zx.c:477:17: warning: implicit conversion from 'unsigned
 long' to 'unsigned int' changes value from 18446744073709551614 to 4294967294
Message-ID: <202606232147.eVluRCks-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   e837c4a4d860d6896e61ca44c5bac69b2500abcc
commit: 679817917e82e5c1fc5cddd6add8729171bcfc4e [70/120] zx29 qspi driver
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606232147.eVluRCks-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606232147.eVluRCks-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606232147.eVluRCks-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-zx.c:477:17: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551614 to 4294967294 [-Wconstant-conversion]
     477 |         writel_relaxed(~ZX_QSPI_EN, qspi->io_base + ZX_QSPI_EN_REG);
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/io.h:88:39: note: expanded from macro 'writel_relaxed'
      88 | #define writel_relaxed(v, a) __writel(v, a)
         |                              ~~~~~~~~ ^
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
