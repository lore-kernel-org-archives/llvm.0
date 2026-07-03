Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2A621D3D2;
	Fri,  3 Jul 2026 16:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783094838; cv=none; b=R778UgH0rZ+N4/VYh2Ic96RIxDDljjcY/CEC151G2ixrtSRaA0BIvsDaWbXBJA7lP/swhrBeHK9b0pJrh4qJFzG6ZGUmQ0mI2M2x1Ib3MoSU9V7JqJW60wpr7FG3Gn1oTm37bgeNOgWvgmN+4BykzIHadpKFSX/7dyau3Jh17hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783094838; c=relaxed/simple;
	bh=pHyPUUkDzvqglo3vPTWOfCBgIOjVk8sWMzaX0GChg/c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T93T17lUxrCXFd6Mu0cu1DMDgJlFoRIladVggvm9do1NG4hGLUIgFGkqbP93EWj9fiJiVOzbh6BtgZvs8m8UX1Hp1lQ9FFbQp96BoZUpXeaC3Da3E0EAU6x3yyjGB0losH6udYjbj8z6h6rH2IE23zEvqUtmQAOnP2iY9tHf/OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ThPZpm0Z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ThPZpm0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783094837; x=1814630837;
  h=date:from:to:cc:subject:message-id;
  bh=pHyPUUkDzvqglo3vPTWOfCBgIOjVk8sWMzaX0GChg/c=;
  b=ThPZpm0ZcrCBA7tsDOdIj8qg1qIZTJTGVd+hHDxp6D8UWa0D+TR7/by3
   kPAeuNSwTMAqBiPmletxP9LoACMz52k2usF/mK6Gham5ZSDxuNNwMZ0wd
   IGLS5iLFkyaerROO1f+FYYycDlD4E0L8/lf3g0ZRKy6V4oxaGjrsiGgim
   wyAxpuWiwKOGeuxM7SicyrKe5hRr+WjgdwoFMH6ic7eyzS4VlyE9Y4UMr
   nz/UcGzlDwP4Dlr3TlRfWXG3MwpyLd+94tKC5l1VaO1ui81yyK0hT9+XX
   4lsbrvShCAU9wXaaMs3ER8p7BmMyA5x8HIL7zhtz5yuHELBWJ1LwwzxS7
   g==;
X-CSE-ConnectionGUID: SyKqugPiRNmCeefeVl77iw==
X-CSE-MsgGUID: uZSysIkWR0q67EUmQtZPIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83712675"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83712675"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 09:07:16 -0700
X-CSE-ConnectionGUID: +6UfSMEkQbOPUWAb77pNmQ==
X-CSE-MsgGUID: kjfhg7lHT7ux9lS+qOQrEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="277472315"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jul 2026 09:07:15 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfgQ4-000000001Y5-2ztR;
	Fri, 03 Jul 2026 16:07:12 +0000
Date: Fri, 03 Jul 2026 18:06:53 +0200
From: kernel test robot <lkp@intel.com>
To: Javen Xu <javen_xu@realsil.com.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/net/phy/realtek/realtek_main.c:20:10: fatal error:
 'net/phy/realtek_phy.h' file not found
Message-ID: <202607031838.AH9yVOtc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/javen/r8169-add-speed-in-private-struct/20260703-173649
head:   4088a221c3a777072eddaf9d63a3b69c2eaf9982
commit: 4088a221c3a777072eddaf9d63a3b69c2eaf9982 r8169: add phylink support for RTL8127atf
date:   6 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260703/202607031838.AH9yVOtc-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031838.AH9yVOtc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031838.AH9yVOtc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/realtek/realtek_main.c:20:10: fatal error: 'net/phy/realtek_phy.h' file not found
      20 | #include <net/phy/realtek_phy.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/net/ethernet/realtek/r8169_main.c:35:10: fatal error: 'net/phy/realtek_phy.h' file not found
      35 | #include <net/phy/realtek_phy.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +20 drivers/net/phy/realtek/realtek_main.c

c4277d21ab694c drivers/net/phy/realtek/realtek_main.c Heiner Kallweit 2026-01-10 @20  #include <net/phy/realtek_phy.h>
097c2aa89f22f5 drivers/net/phy/realtek.c              Johnson Leung   2008-02-03  21  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
