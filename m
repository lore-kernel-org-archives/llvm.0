Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B01819C578;
	Mon, 17 Feb 2025 07:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739776143; cv=none; b=YQ+xEMgptzilUNBhwANGwoXMbDy5GIQSq1xk99hJTR9gB6Po2eWYX4bOOY1+CupgaYcx5lZoPS6Y1/W6BeoKA2XmVKRhkO2eX0/GEg321Qbxm8gJ5Er/FbnVrCBCBgMsB7qgi3640oxVhxCcr+Y88YPXZzaOulsPYaynzs7Pt80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739776143; c=relaxed/simple;
	bh=F6bZhNtCSUNfQLAH/cQVLsVOg5XQcn/a4cHvbXQSv/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XnKrVWyF2znVmIA2vlCT3SDC95ppbuBdT9IeCeNl4ujGHxMfHlOvcn7Wd3+y9Xp8mB1eD6zzB7quVp9d9npRaWa1nyXK4nGEikBXNNFs8fnpgdq2iCNV6KPmdde9xaoSTi1Es5sZMwVMFUqS3vcbtbkP0X4qQjMIDeSaLu80pVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fP+kVlLt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fP+kVlLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739776142; x=1771312142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F6bZhNtCSUNfQLAH/cQVLsVOg5XQcn/a4cHvbXQSv/E=;
  b=fP+kVlLtl9ECBrOUtT79wd/6X2z+W+9h/lWD5r1++UPcbjnDOnTk849N
   MuaKe8+VMoc3v3v/W0H3yPYBr9aBY6L2SVxM47Ai2Rkm2ymP0yMxBYpxk
   ZQsl9UrWu8anI6DKxieF0SZrXZ7DxKqo1OTO+sg0ZBxOBXd46iYNRrl6C
   e/M2A4LMX4UXO1mkWwkAm9Vun5U6veEq+yxK1rSycTH5Qj7hJ/qpSnC0x
   O0WpE5w1FznPAQ8L8bCG1srZyCrc/Ggy4JiNV7wmmEH83OWbx8yho6aD5
   GogcE1iyEfvu+5C3xZl79rT3ztB3TslVrydqRmFoMjkV2WMVUzpuLvgKv
   w==;
X-CSE-ConnectionGUID: QXpJT2A6RJuup7Pfv13Q3g==
X-CSE-MsgGUID: u3XBS+LuQQWu0po7JfUM9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="39634127"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="39634127"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 23:08:57 -0800
X-CSE-ConnectionGUID: u/JvIj22Q7C9GrzH4sd4AQ==
X-CSE-MsgGUID: +1pM7j44QyqPL4R42rdYKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="151212114"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Feb 2025 23:08:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjvFN-001CiR-1j;
	Mon, 17 Feb 2025 07:08:53 +0000
Date: Mon, 17 Feb 2025 15:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/phy-exynos-usbdrd-fix 1/2] ld.lld: error: undefined
 symbol: typec_switch_register
Message-ID: <202502171442.aTpA4zSS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/phy-exynos-usbdrd-fix
head:   c2c4065e701bb4eb3d2790fb163d39fe858fff2e
commit: d166a80235d6f2a8d5186c39d834e61920eacdb2 [1/2] phy: exynos5-usbdrd: Fix broken USB on Exynos5422 (TYPEC dependency)
config: arm-defconfig (https://download.01.org/0day-ci/archive/20250217/202502171442.aTpA4zSS-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502171442.aTpA4zSS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502171442.aTpA4zSS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: typec_switch_register
   >>> referenced by phy-exynos5-usbdrd.c:1470 (drivers/phy/samsung/phy-exynos5-usbdrd.c:1470)
   >>>               drivers/phy/samsung/phy-exynos5-usbdrd.o:(exynos5_usbdrd_setup_notifiers) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: typec_switch_unregister
   >>> referenced by phy-exynos5-usbdrd.c:1452 (drivers/phy/samsung/phy-exynos5-usbdrd.c:1452)
   >>>               drivers/phy/samsung/phy-exynos5-usbdrd.o:(exynos5_usbdrd_setup_notifiers) in archive vmlinux.a
   >>> referenced by phy-exynos5-usbdrd.c:1452 (drivers/phy/samsung/phy-exynos5-usbdrd.c:1452)
   >>>               drivers/phy/samsung/phy-exynos5-usbdrd.o:(exynos5_usbdrd_orien_switch_unregister) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: typec_switch_get_drvdata
   >>> referenced by phy-exynos5-usbdrd.c:1408 (drivers/phy/samsung/phy-exynos5-usbdrd.c:1408)
   >>>               drivers/phy/samsung/phy-exynos5-usbdrd.o:(exynos5_usbdrd_orien_sw_set) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
