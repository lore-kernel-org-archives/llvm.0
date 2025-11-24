Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A34A24A043;
	Mon, 24 Nov 2025 10:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763978701; cv=none; b=e6OHgIW0BSYE2llyW3d/eTqqHe+FLanG6/38ClfOT+Sx39tIeiV0eQofFqy+4PZqfyblr8zvEO3wFUwUSxVGqGWxIRjSiyLUC5vZREEfTPlyyYhfJzKHV3rvzHzb1vCr81d4dYW8l2aTRCxfCh4l+ypalO/c4vq4DnrEhfrXvSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763978701; c=relaxed/simple;
	bh=OugCfz/qvZZOiB0DPe/fAHh+3Od4xnh9uePeSNANJ4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sKk9e/ak/5as6a7g6ZyU+x7mcOIfYQf6zdvzn2FGyCfVk47e+9c4oXx4e9mxW3AaEa3gHyqLwD5cr1mMe0EcpYL6Xw+JET4PEgYvGWpR685HAKQCYljbejtRJRfNFcMAdxw+XBDQqrustNm0pViVtHyIHXCGz63op7Fgwf9kJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hIXPX4S9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hIXPX4S9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763978701; x=1795514701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OugCfz/qvZZOiB0DPe/fAHh+3Od4xnh9uePeSNANJ4g=;
  b=hIXPX4S9W4UhhRYDPnHUmI2MmWzkdCjCnydsbsqZs1nSOBrVM6JdXimo
   yZqm2v/0dWU1wrD9/E88Ab5kXCk9PKTlHrP03COBHXMRvWitdzebUi/QF
   hXbO3qU+vdKF6M+6IijPfkbCQ4277sHU8SYzkLCDmBiXQ/hVhwCAlnD4I
   CxZZzSGKipv8FPj80VZQynq6YkG8bKCptKbVZWPF4LN+zxmsGmHihD6+m
   TQ9YpIHdEkKABhQaAq8c1PZ9yfmcWqPOJCRzLuKXGAXpUhbJmzx7OlVJM
   0gNlYA7FyPO7/NBkzJeg78cyzEiMHG3mTqs8CQiR+EdYnq7lbngEramDN
   Q==;
X-CSE-ConnectionGUID: sZLDFXISTPugUTzlCXSqQQ==
X-CSE-MsgGUID: WMw7nRS2RT6VRuC2zGDf8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65669157"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="65669157"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 02:05:00 -0800
X-CSE-ConnectionGUID: /iv/yDxYT1eNfeuEVHlyhQ==
X-CSE-MsgGUID: UaRwTaJ9Ts6R1T57f1qzWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="191450124"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Nov 2025 02:04:58 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNTRI-000000000aP-0uhW;
	Mon, 24 Nov 2025 10:04:56 +0000
Date: Mon, 24 Nov 2025 18:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chanwoo Choi <cw00.choi@samsung.com>
Subject: [chanwoo-extcon:extcon-testing 9/9]
 drivers/extcon/extcon-s2m.c:15:10: fatal error:
 'linux/mfd/samsung/s2mu005.h' file not found
Message-ID: <202511241812.6tbQFtTJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git extcon-testing
head:   925e04713b380ad2b73ffcf2ece5ee1bfaa2689f
commit: 925e04713b380ad2b73ffcf2ece5ee1bfaa2689f [9/9] extcon: add support for Samsung S2M series PMIC extcon devices
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20251124/202511241812.6tbQFtTJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241812.6tbQFtTJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241812.6tbQFtTJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/extcon/extcon-s2m.c:15:10: fatal error: 'linux/mfd/samsung/s2mu005.h' file not found
      15 | #include <linux/mfd/samsung/s2mu005.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +15 drivers/extcon/extcon-s2m.c

  > 15	#include <linux/mfd/samsung/s2mu005.h>
    16	#include <linux/of.h>
    17	#include <linux/platform_device.h>
    18	#include <linux/power_supply.h>
    19	#include <linux/regmap.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
