Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A71037708;
	Sun, 21 Jan 2024 16:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705853899; cv=none; b=TkxYauOUuZEofHe4p2gsFdKG1KntkkV3iFHl3c9Ews58MpFocMK36jKlrHc5wW7V6IRhlZqcfi7xpSmFKl3PkNfHKNimM0ImpBA2r99t8v/t3V9g9ufZrwX8R4I5X1wNkwrvZLNFES3Z50cUz/dg2GMA8AWXjJhPvdyNiNP33VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705853899; c=relaxed/simple;
	bh=cfB6Hu7r5ElvvBDXacj4AiYWhdmH3+YRWWxon4CkmSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p1jIf5rAyrJZd7Tq4SjoTr35vximLWVDxbsJNeo27D2O5CUrRz2EGEQV065Oe8gQZgIua9xGNRiJrZ+bDf9abp3NmGiOJLf/TpUebL2ikyfgZd+3QPjVgR+aF/unuPieAnvSCvdTItvKDstDtXeohBuz7A9nD/ih4x48qQx7oH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BD6n674p; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BD6n674p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705853898; x=1737389898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cfB6Hu7r5ElvvBDXacj4AiYWhdmH3+YRWWxon4CkmSU=;
  b=BD6n674pJ3Yv56PmWVu2064PyDPNeM3hJuLm0KQI33Y9D1jZ2Ze7ww/4
   JGYShfKWueurcwsEnq7FDjBt0MMqw3eSMGO1lFBgXK3kwZ3XcSWiCeQoW
   cJ2d/16orfNQ4yGvooEBYLa99/AXuMs8a9Y6e/uhnUH5x2sUcezkS8OIq
   E2ZUoUvx81iA4BkDrIwJsXfbRzstgrbdtNBnlMsQN2w4SVkFMlteStCun
   Rdb1L9vkJteJWmsDyRPxsGuKPKcsg75BvoqM9p/znW+zRFRi/hw3qK9ia
   rwnWUTcws92h5bfj9Ypt/DtNHrh/RQxZlB2OO+inm/1q6xLTqKhIG+Xqz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7800620"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="7800620"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 08:18:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="785463697"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="785463697"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Jan 2024 08:18:15 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRaWT-00062Q-0e;
	Sun, 21 Jan 2024 16:18:13 +0000
Date: Mon, 22 Jan 2024 00:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:sa1100 29/36] arch/arm/mach-sa1100/ipaq-sleeve-bus.c:69:12:
 error: incompatible function pointer types initializing 'int (*)(const
 struct device *, struct kobj_uevent_env *)' with an expression of type 'int
 (struct device *, struct kobj_uevent_env *)'
Message-ID: <202401220005.5PIfifhJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git sa1100
head:   d48f5d1fae0e3af56746dd83ee7bcef43ddff4b3
commit: e4833d4836599cf7f9f588e62d00e137c4d79ccd [29/36] ARM: sa1100/h3xxx: sleeve support
config: arm-neponset_defconfig (https://download.01.org/0day-ci/archive/20240122/202401220005.5PIfifhJ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401220005.5PIfifhJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401220005.5PIfifhJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/mach-sa1100/ipaq-sleeve-bus.c:69:12: error: incompatible function pointer types initializing 'int (*)(const struct device *, struct kobj_uevent_env *)' with an expression of type 'int (struct device *, struct kobj_uevent_env *)' [-Wincompatible-function-pointer-types]
           .uevent = ipaq_option_sleeve_uevent,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +69 arch/arm/mach-sa1100/ipaq-sleeve-bus.c

    64	
    65	struct bus_type ipaq_option_sleeve_bus = {
    66		.name = "ipaq-sleeve",
    67		.dev_groups = ipaq_option_sleeve_dev_groups,
    68		.match = ipaq_option_sleeve_match,
  > 69		.uevent = ipaq_option_sleeve_uevent,
    70	};
    71	EXPORT_SYMBOL_GPL(ipaq_option_sleeve_bus);
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
