Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066FB36606B;
	Mon, 22 Jun 2026 22:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782168606; cv=none; b=alQjL5NNkfsW0IiGpdS+w4MEpP7jLER3bZAhtEFJ8URzzBtRHtcu+FNhMWBPhbSKvDc9RbDSw5Bxi5FvLtHU6U15l2u/RqovJpH5wmRlflAVm8vFqV6HMszgloNMkDmB48n7n8+a040YOnRcGsiyU0yt7BH6Vms24VuKUxhQRp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782168606; c=relaxed/simple;
	bh=AN6vFmriFs/QExAimWDmggMme2DD88oH0cLAr4bpmJ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c2wG/t/QCzbimbUByHpgB9aId5CSZL+Y/KszblXascoDoB9HALXQsJ7pacew7gE2qZ7vRQnp9IPXX1iHfZDH8s3DaL+cgkbp3eiLfI6TzwYwyoL2UjfW9XB+XVj20rkM2JflBSSgmA0MBQZq2ZrKd/A2vIkIDm28Zz0UcRrmpiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJtS+rrF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJtS+rrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782168605; x=1813704605;
  h=date:from:to:cc:subject:message-id;
  bh=AN6vFmriFs/QExAimWDmggMme2DD88oH0cLAr4bpmJ4=;
  b=KJtS+rrFOiszLTld/9EFfy8wJrmR4r+rbu3D3B1HbWUsQeo3kCX0dcgQ
   0LbZizYm1MfKDhEWOtWutBLijk8X1hZ68xPNa8KI4p/JgNh9LKGnDaeQm
   OWNGgA+AhNmHh18cItO3UG0YJcQMGRiqf4fr/LPKF8Y42QaYooVmHX1AQ
   0EZ0QuTulI3EjlY5BTo6qIuBVRNjmrjLD7K1JfTj3aQfivyUxG+SDVrym
   yPdD5RS9ZnQn35PIxhoE1Q2jQ5JEuuiM/0CxJHZB1i14P/vsyRpAVrlM8
   bAm4JcKU+EWEYm+B/XhSXS5FEpXC8oqlaFT/Cpcf4IOPFvr3qnOIs4uAt
   Q==;
X-CSE-ConnectionGUID: CpG9bQXcTbyUjSduFpF4oQ==
X-CSE-MsgGUID: IhYtbq+EQEGc/cmQ7ujCpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82947524"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="82947524"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 15:50:03 -0700
X-CSE-ConnectionGUID: 2eVVaQkoTrmXSGEDVcEyTw==
X-CSE-MsgGUID: anNN4wzKQGeiPF+HE4H0IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="253242837"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Jun 2026 15:50:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbnSo-0000000022L-1b6O;
	Mon, 22 Jun 2026 22:49:58 +0000
Date: Tue, 23 Jun 2026 06:49:21 +0800
From: kernel test robot <lkp@intel.com>
To: YoungSoo Shin <shinys000114@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-7.1.y 64/64]
 drivers/video/fbdev/sh1106fb.c:20:10: fatal error: 'linux/of_gpio.h' file not
 found
Message-ID: <202606230622.K2Spbhzu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/tobetter/linux odroid-7.1.y
head:   dbb4f6bd9fe8a1786673783249095632aff93442
commit: 5c91927d862c0529165cdba04283fa5ab793215a [64/64] ODROID-COMMON: fbdev: add support for Sino Wealth SH1106 OLED controller
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606230622.K2Spbhzu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230622.K2Spbhzu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230622.K2Spbhzu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/sh1106fb.c:20:10: fatal error: 'linux/of_gpio.h' file not found
      20 | #include <linux/of_gpio.h>
         |          ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +20 drivers/video/fbdev/sh1106fb.c

  > 20	#include <linux/of_gpio.h>
    21	#include <linux/uaccess.h>
    22	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
