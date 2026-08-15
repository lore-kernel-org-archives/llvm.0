Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051B217AE11;
	Sat, 15 Aug 2026 21:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786828232; cv=none; b=lNEGFflzvWxgiiVVegY9jm4d5W4ZaPDjz0Rx79v3oOM98UyBXPPplXxPocU3VlUKiGkwK9k8CayYipaP9Lcs2CTQv9DpNsBnChDD+06bDlhoSgokMb6NQtBLS0GY/2CBICziapOwXsYONr3dnMlMcT7fScQSVTZPKfvYZf+jzKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786828232; c=relaxed/simple;
	bh=q/NH2kcqOVjARhPUyFshnYbT24Ye3Z0dzOFrbQVMGSw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BXjdKbZwahaS59jW5Do5pyU+JdOEEn9k4iNhVoA55BetW/J8ozTxhTGAp0iKmPMpEBhSZ59ztzJSnuXc+6/4MQf+yjDlyLJKwgGd1GlfNQv6VSLB3FHBOQv+jaLF6cIRowGm/GbC+0yFlbnBLc0WZ/gCyumjdpIcaBeGUKGcgts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPlRJs6R; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPlRJs6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786828230; x=1818364230;
  h=date:from:to:cc:subject:message-id;
  bh=q/NH2kcqOVjARhPUyFshnYbT24Ye3Z0dzOFrbQVMGSw=;
  b=HPlRJs6RtmMb5rKvKaYTZufG53Cgd/E7H/2UKCnJfhiv3Ay2tuDx0rLo
   gEEQ+aHr5f8JaeluVwB+OhrSasRhykfa26zV/P2K7uxsJO0BPieByhuXy
   eOllHRrRcKa7JZh+fkWVgpdySxto0SEIV3PRbqydpQMwR4vRuOU+1RsJt
   GxWG/5FVGjfSB+5b8lXQUkp15JGZdagCoofvs5V5rZNfG4uQUicyzxNCL
   TxHRAv5Q6VuMCQ41IrLW+mrWoiW37sR6mhZ25C92y2TZxTVjLKUjuzK9s
   Af1WJrecuXziBn4LBbHPEMkuJ96V1mpYH6BAX/AQf66ra31BKLXZUL4af
   A==;
X-CSE-ConnectionGUID: 9QSteZoxQOaj8iDO0eO5IA==
X-CSE-MsgGUID: irguPy9oTCeL/2o5yz7EQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="104898563"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="104898563"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 14:10:30 -0700
X-CSE-ConnectionGUID: UFbQObKFSgmW7KprTfdbEw==
X-CSE-MsgGUID: avTLc3UKQuCtp/S6vLmVKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="260756595"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Aug 2026 14:10:27 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvLe5-00000000cUe-1AHP;
	Sat, 15 Aug 2026 21:10:25 +0000
Date: Sun, 16 Aug 2026 05:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:board-remove 24/217]
 arch/arm/mach-orion5x/common.c:18:10: fatal error: 'plat/time.h' file not
 found
Message-ID: <202608160508.L84PCmp5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 061991b5690f233fb8a0248fa1ccb1172443e5c5 [24/217] ARM: orion/dove/mv78xx0: remove all board files
config: arm-orion5x_defconfig (https://download.01.org/0day-ci/archive/20260816/202608160508.L84PCmp5-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160508.L84PCmp5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160508.L84PCmp5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/mach-orion5x/common.c:18:10: fatal error: 'plat/time.h' file not found
      18 | #include <plat/time.h>
         |          ^~~~~~~~~~~~~
   1 error generated.
--
>> arch/arm/mach-orion5x/board-dt.c:21:10: fatal error: 'plat/time.h' file not found
      21 | #include <plat/time.h>
         |          ^~~~~~~~~~~~~
   1 error generated.
--
>> arch/arm/plat-orion/pcie.c:16:10: fatal error: 'plat/addr-map.h' file not found
      16 | #include <plat/addr-map.h>
         |          ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +18 arch/arm/mach-orion5x/common.c

6f088f1d215be5 Lennert Buytenhek 2008-08-09 @18  #include <plat/time.h>
28a2b45054f2e3 Andrew Lunn       2011-05-15  19  #include <plat/common.h>
c22c2c6008d69f Arnd Bergmann     2015-12-02  20  

:::::: The code at line 18 was first introduced by commit
:::::: 6f088f1d215be5250582b974f83f0e3aa6ad3a28 [ARM] Move include/asm-arm/plat-orion to arch/arm/plat-orion/include/plat

:::::: TO: Lennert Buytenhek <buytenh@wantstofly.org>
:::::: CC: Lennert Buytenhek <buytenh@marvell.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
