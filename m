Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FFF219FF;
	Sat, 14 Sep 2024 06:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726294550; cv=none; b=Alq7W8T4q4YjzSCmXeMr3GRTdGIsao9ff6xiqUjXNPKlS8V4ERsZrwETjZkSrzRkk4/ZIYK/t3SHVkppFFgCRE8juU+pMn4exN/QFT+v7dV+co6N9GH97IzXbrR2zAzNZ3A4ycVjzbHge6CkGOIOFGImRgBsILB1hRZJJMWaZxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726294550; c=relaxed/simple;
	bh=Oe93Z2cy+cgy1Nzx71diGy/cUvsuf6JK1fjtJROCNCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GYMLD4yRsZH+arTZT/quJu8YZfJ4nYCg5IlGbKSeY2BKFumHzbtdgFB5zGlhRrmolxtgQuCcX+tzuaoAnmeSgq3FUPnYQ+D+i3R84BpO9hLCYLj7e/9xtlis/2Fy0uQAJyPiZMCuJ7gzSTcS9rd81Yf4KzSXFSQc5D4LgTTSBtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WNwToMgk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WNwToMgk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726294547; x=1757830547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oe93Z2cy+cgy1Nzx71diGy/cUvsuf6JK1fjtJROCNCg=;
  b=WNwToMgkdAYOGJ15xiJU2mesW32fpDqmKsD5gWVDlqzravoRJC0X/3z3
   zXlnW9lTGUm1012Tk/lKX8gln6TOBvZ82iL5179I9GfrBxveVNsrkw1oB
   Ownnr806dJ7zwgtBvY+ttp6CCpTZOQDOvJjpizrPVU/DrvilhZa8axvk3
   CzDehvqVoo3W7WrWj1Krd9I1WeRM+F51XHPxTqeVPO/T+xcPuFDb9OR8R
   bXrGQgONiE5Ezow+cZBJuNot6ktmh8jPKCx6S2bQL8ipMWI/v4gCnHlOZ
   GMhpozr1bmwvBVv6HtB+BiU14jQCtdLit+TkIHWty8YVDKKZfCBRzXnGm
   w==;
X-CSE-ConnectionGUID: FnWr6m9HQ9uHSk9ocprYWQ==
X-CSE-MsgGUID: T/7YMgjZTeup6VvzSP1smQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25353212"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="25353212"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 23:15:46 -0700
X-CSE-ConnectionGUID: u9Lim47+Sw6VFHVXsktZ9g==
X-CSE-MsgGUID: zBdZO+wlSM2Xsj5U+TcrXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="68268862"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Sep 2024 23:15:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spM4M-0007Ry-1H;
	Sat, 14 Sep 2024 06:15:42 +0000
Date: Sat, 14 Sep 2024 14:14:42 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [wens:mtk-wip 45/45]
 drivers/platform/chrome/chromeos_of_hw_prober.c:197:38: warning: unused
 variable 'chromeos_i2c_probe_simple_trackpad_cfg'
Message-ID: <202409141404.gwkpFNUq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   42c21929aeb3c7ca7b0ce9cacb1d0ff915d3c783
commit: 42c21929aeb3c7ca7b0ce9cacb1d0ff915d3c783 [45/45] hana trackpad probe rework
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240914/202409141404.gwkpFNUq-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141404.gwkpFNUq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141404.gwkpFNUq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/chrome/chromeos_of_hw_prober.c:197:38: warning: unused variable 'chromeos_i2c_probe_simple_trackpad_cfg' [-Wunused-const-variable]
     197 | static const struct i2c_of_probe_cfg chromeos_i2c_probe_simple_trackpad_cfg = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/chrome/chromeos_of_hw_prober.c:207:45: warning: unused variable 'chromeos_i2c_probe_hana_trackpad' [-Wunused-const-variable]
     207 | static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +/chromeos_i2c_probe_simple_trackpad_cfg +197 drivers/platform/chrome/chromeos_of_hw_prober.c

   196	
 > 197	static const struct i2c_of_probe_cfg chromeos_i2c_probe_simple_trackpad_cfg = {
   198		.ops = &i2c_of_probe_simple_ops,
   199		.type = "trackpad"
   200	};
   201	
   202	static const struct i2c_of_probe_cfg chromeos_i2c_probe_simple_touchscreen_cfg = {
   203		.ops = &i2c_of_probe_simple_ops,
   204		.type = "touchscreen"
   205	};
   206	
 > 207	static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
   208		.cfg = &chromeos_i2c_probe_simple_touchscreen_cfg,
   209		.opts = &(const struct i2c_of_probe_simple_opts) {
   210			.res_node_compatible = "elan,ekth3000",
   211			.supply_name = "vcc",
   212			.post_power_on_delay_ms = 1,
   213		}
   214	};
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
