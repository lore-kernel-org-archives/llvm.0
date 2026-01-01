Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D2E2E62C3;
	Thu,  1 Jan 2026 21:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767301854; cv=none; b=HqseOwUSYlNJyToDOXIjjj7HC27zO83sPKUtpmfAAscYY8FRZQyja7Trb6g3q1WD8WoZzseH3EMLOnXL5THFCADI9iJPar7BSQOLSbGGIvOIWZkzO7EbgL+rF6BiqIbXwnmBLmQcsy145ZCFjZmPIbNtAr5kgYKcTaN1+LP8akE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767301854; c=relaxed/simple;
	bh=86Ln23Vif1EKGE44X2NHTBz/d6s9wpGgmLDrlpyXVVI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bq2O3HgaRIUbWXBtwXqnycNszbs2X+2+6hKVgidzM798Q/cgwaqJUYGiAttRuvOe2Gd7i5G9XeWzDVv2R41yI2rknUVcjo2UuvclkZmMn3JPdhrEbvoT2ZqtowNZSuoO7OYBKrRk6iefpVyncVlFrECtyqr139LSQwDhY2zDtVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2z5tR+m; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2z5tR+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767301853; x=1798837853;
  h=date:from:to:cc:subject:message-id;
  bh=86Ln23Vif1EKGE44X2NHTBz/d6s9wpGgmLDrlpyXVVI=;
  b=g2z5tR+msPPxgOQ6skNAwbmFqmwUpqaMeEAwP6GSSkIfYwpRIsjEOelA
   e5032GOAFFrolS376g7WPCB5wz50fE/GS6sRTQqRIEl6B2d12yuT09MTg
   dZixRHwntxARvVOIBWjvFyH0cbK4nks6NqsA772PyFedLfWnYdfs+40uQ
   dGkJ1JMql2J05OE94cPJBBHOF7S77R6vBNRHyI1GNe38XntkYGh3J7T2L
   3BcaTCTnNh3hwkUE1duGdiogBcrz5UR4tvGkhdqDERfzeh24gVbCbEW4M
   jF0AdmoMEZqETrGyJDfibZ5xMTXr+WQnlCRX5CcFtzeRZy7/0+A62ni99
   w==;
X-CSE-ConnectionGUID: JGwkkwA6QPK63d/3Pst8LQ==
X-CSE-MsgGUID: dsOWZp4eTh6MGR+VMa9JHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68887519"
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="68887519"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 13:10:50 -0800
X-CSE-ConnectionGUID: QzA3NkI2T5W/gNTprPAskQ==
X-CSE-MsgGUID: RR9UNWXKTPuHI4wrKaUowA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="200914602"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jan 2026 13:10:49 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbPwT-00000000225-3kPY;
	Thu, 01 Jan 2026 21:10:45 +0000
Date: Fri, 02 Jan 2026 05:10:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [rafael-pm:pm-runtime-cleanup 24/25]
 drivers/clk/tegra/clk-device.c:178:2: error: expected function body after
 function declarator
Message-ID: <202601020507.LzWANVpm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git pm-runtime-cleanup
head:   e853e6ed1e01eb6846357d4692bf6131e218837e
commit: a7e9532f30c77611ad48560b165326ce96e6e8dc [24/25] clk: tegra: Discard pm_runtime_put() return value
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260102/202601020507.LzWANVpm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260102/202601020507.LzWANVpm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601020507.LzWANVpm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/tegra/clk-device.c:178:2: error: expected function body after function declarator
     178 |         return pm_runtime_resume_and_get(dev);
         |         ^
>> drivers/clk/tegra/clk-device.c:179:1: error: extraneous closing brace ('}')
     179 | }
         | ^
>> drivers/clk/tegra/clk-device.c:188:26: error: use of undeclared identifier 'tegra_clock_suspend'
     188 |         SET_SYSTEM_SLEEP_PM_OPS(tegra_clock_suspend, tegra_clock_resume)
         |                                 ^~~~~~~~~~~~~~~~~~~
>> drivers/clk/tegra/clk-device.c:188:26: error: use of undeclared identifier 'tegra_clock_suspend'
     188 |         SET_SYSTEM_SLEEP_PM_OPS(tegra_clock_suspend, tegra_clock_resume)
         |                                 ^~~~~~~~~~~~~~~~~~~
>> drivers/clk/tegra/clk-device.c:188:26: error: use of undeclared identifier 'tegra_clock_suspend'
     188 |         SET_SYSTEM_SLEEP_PM_OPS(tegra_clock_suspend, tegra_clock_resume)
         |                                 ^~~~~~~~~~~~~~~~~~~
   5 errors generated.


vim +178 drivers/clk/tegra/clk-device.c

   169	
   170	/*
   171	 * Tegra GENPD driver enables clocks during NOIRQ phase. It can't be done
   172	 * for clocks served by this driver because runtime PM is unavailable in
   173	 * NOIRQ phase. We will keep clocks resumed during suspend to mitigate this
   174	 * problem. In practice this makes no difference from a power management
   175	 * perspective since voltage is kept at a nominal level during suspend anyways.
   176	 */
   177	static inline int tegra_clock_suspend(struct device *dev)
 > 178		return pm_runtime_resume_and_get(dev);
 > 179	}
   180	
   181	static inline int tegra_clock_resume(struct device *dev)
   182	{
   183		pm_runtime_put(dev);
   184		return 0;
   185	}
   186	
   187	static const struct dev_pm_ops tegra_clock_pm = {
 > 188		SET_SYSTEM_SLEEP_PM_OPS(tegra_clock_suspend, tegra_clock_resume)
   189	};
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
