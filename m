Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9677E1AB914;
	Thu,  4 Jul 2024 10:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720089308; cv=none; b=satd+0emfuiu0cnU/ylgtWCtvDVxPDi34NKhBFLGPeGrgvjFYYi6awbUC8SMe7BCVUEFhF4p1h4gzmLbiyCZWPzIO6tLauQIHDEcQiP9NGDBl2MRhW7SI+bd8z567JBuq2++cLRv2QJAc4JNIKFflckVSifYS19mmOF01xh2few=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720089308; c=relaxed/simple;
	bh=UxKmdl7rBE64r9VxTRb3v+7EHD4ClSK6zr1eNsydv50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bp9gQ+KeMmdUDKL/wor7RBDLSQnFUVsmxJLXevOBDolUD/GbBtfwJlX4/XTXtquxUct1rUpo7QBRf6urUH/MFkpr7QV5+Wv6jsXC3BJQ2pG+2/xJd2/kHUwHmC79AajpaztXJYI8cHWHw15dkiYFhjvnVv08fXSydqoUQNdafms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7tmU1XE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7tmU1XE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720089306; x=1751625306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UxKmdl7rBE64r9VxTRb3v+7EHD4ClSK6zr1eNsydv50=;
  b=E7tmU1XEcsht/G3vZd8dX6V/rK9F6PzfAQImYqFA/DXyvrnpsOVGDN6S
   ksEem7BFQvcUMV2BayAfNAbmBnIzulWk1Y9dh93dM+lw9bI9Wh56nNayo
   C64Am4usBc63fpVB3tqWdOz18mOIoJKH8vM5qK7glHBSsWlJx6ryj2TuS
   oisMOc3Jxw1QpAFqUGqu0XGSIRf4VZPhOZ9xlPaHDxmS7eU43v9qQ6xrP
   A83SAxdiNVvUn6feEsgYCiTURSq4KmF5DEoJ2YSqGfHHbxxwT2Z3XP5jT
   V5BQGR48X6dY2H0K306O3LjysmjkcVs+dSfQbLjGSrr+doN6NbSGECUVo
   g==;
X-CSE-ConnectionGUID: FEBAhj6rRvGpRxTXCvBISg==
X-CSE-MsgGUID: jGlTUPt9R8S4i6rVbFoqzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17199065"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17199065"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 03:35:06 -0700
X-CSE-ConnectionGUID: f/tEF2/QSySnbsE8UA5utw==
X-CSE-MsgGUID: 4ZMRpkqGRjqM1HJCEj+q6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46698714"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Jul 2024 03:35:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPJnp-000Qs2-2N;
	Thu, 04 Jul 2024 10:35:01 +0000
Date: Thu, 4 Jul 2024 18:34:26 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [morimoto:renesas-bsp/v6.1.96-2024-06-28-3-GrayHawk-sound 52/720]
 ld.lld: error: section .rodata virtual address range overlaps with .data
Message-ID: <202407041811.M4KRJocQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.96-2024-06-28-3-GrayHawk-sound
head:   5ccadb6d5d2943e6eefe732f994c5f1039a22284
commit: f12bfbee0d61c17a63d1eaeab9775dc0e34a2bca [52/720] riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
config: riscv-randconfig-001-20240704 (https://download.01.org/0day-ci/archive/20240704/202407041811.M4KRJocQ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041811.M4KRJocQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407041811.M4KRJocQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: section .rodata virtual address range overlaps with .data
   >>> .rodata range is [0xFFFFFFFF81B3B800, 0xFFFFFFFF82035F4C]
   >>> .data range is [0xFFFFFFFF82000000, 0xFFFFFFFF8263A867]
--
>> ld.lld: error: section .data virtual address range overlaps with .pci_fixup
   >>> .data range is [0xFFFFFFFF82000000, 0xFFFFFFFF8263A867]
   >>> .pci_fixup range is [0xFFFFFFFF82035F50, 0xFFFFFFFF82039F0F]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
