Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957DD3F9F5B;
	Thu,  3 Sep 2026 07:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419650; cv=none; b=u05gRyId7MCVS81RETwAE7vDSCNP5igVFnwXTE6KSxgbgSQ7xpJwtjyr6KrjSM7AFoMM1QA5D0X3+H03BCJcu7z9wBOhTWXbsr9ELHiPXJtz4CrfD3AbJY3qLJ5AzQtVmOaVJV53fU2TeY4e6Wv4vtSsHOTM7yuVUOdWnpRig4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419650; c=relaxed/simple;
	bh=2Zi2dF3e7N7uDJbBwukAXAJGxhBZR9DEXWX3Q55oMSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=anjinxS/q379PKZxBw7vtixHSK7rLIlpOiX76FXXAoLa5DtoxMTdVftOai/5vHtSu011DXXMz+MkwfMKhk6/D6idtVISQzrBBfpJgKHq1WJFk1zVON71ZzEY/Gui2Wmj6OUmCjP9NWK3dL0xTCgawBzGQZsuqfNrqAdV9V+70v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aog9wkZr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aog9wkZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788419649; x=1819955649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Zi2dF3e7N7uDJbBwukAXAJGxhBZR9DEXWX3Q55oMSo=;
  b=Aog9wkZrE5EXQok/D7M+XxKHUpnfNnOBLh6nZUunY7jMi4tI90zriVtP
   AW26EFJsKNGJME8pgaE1qCqRCcZBFcR2YbLw9uXiKqOJvZyFOCaexfvoa
   DlYKelDdNHt68NyuCidK9T0oLThYYjr/fXb8W3RtfnBmQVi2er8TENSf5
   jsGmEZ8wL3LGR2LDFcNeSiY8q9aH19vN6plTvknmD0l/BhWRKY1tNPz+k
   6GE1d0Y3/xdQqVRRf6M70CfpINRqCnKHjZXRbGUAiBG1WhbWEOQosgVem
   3Eo6Gulj9p7d415oE6gVkt5hBL8xgcGuDp5gUZ2wFpXBW1Idits9fTb9g
   g==;
X-CSE-ConnectionGUID: odBl8q9eSTWCUMiPw6p2Kg==
X-CSE-MsgGUID: l50oypPzS6qMJ38iEB0Vhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88814833"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88814833"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 00:14:08 -0700
X-CSE-ConnectionGUID: 2tmr42BhQ46O6wwkntjoSQ==
X-CSE-MsgGUID: IT3afwwQSKuE2lF2Lasfog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="263459315"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Sep 2026 00:14:06 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x21e8-000000004He-0Xce;
	Thu, 03 Sep 2026 07:14:04 +0000
Date: Thu, 03 Sep 2026 15:13:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 76/131]
 drivers/spi/spi-zx.c:477:17: warning: implicit conversion from 'unsigned
 long' to 'unsigned int' changes value from 18446744073709551614 to 4294967294
Message-ID: <202609031544.3GtJCt1k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   4132307830800b020a6d29d27cb3fec3cb5fbb90
commit: fce785fadfd6abf34e775c2793e49a37e1c426d5 [76/131] zx29 qspi driver
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260903/202609031544.3GtJCt1k-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031544.3GtJCt1k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609031544.3GtJCt1k-lkp@intel.com/

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
