Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ED83A7F62;
	Wed, 29 Jul 2026 21:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785359781; cv=none; b=hbNaurU6YJsEDUUxkvQP3iM4/mkVtayHt2z+76hV2VTKpXnRgmu1hP+N4pqR9KZHHEJmP0rL6/fSkEdHQgkkxrczDHylEwWHv6CPUu2uy/dANMWdKJLgLwBzMMA0fV3uI4jGDuiFq+Z1EmqRlhGDIPJC/ZJRh3Aw5dHy+pB2ZWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785359781; c=relaxed/simple;
	bh=/E9S0+w5sV2vcAaEfaye2O1aU3oewtHO6IOTKhHxi0Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cqysNlkDLMnXD5DYCZeI7KS97VDNpmIpojCe9sKuGAZTsvqDwo0aYHe3VDB1GyRGN3d1M9w8graW4BPiU//f3DuV0z2QsgVarLI2Mr3uvShRKFrkyiuCYpHhXFYIpYoVZ5WMAy/xFQAcUj7c5HruDTqrxBWb2dHWz02z2TQ6w2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3LFvkXm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3LFvkXm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785359779; x=1816895779;
  h=date:from:to:cc:subject:message-id;
  bh=/E9S0+w5sV2vcAaEfaye2O1aU3oewtHO6IOTKhHxi0Y=;
  b=Z3LFvkXmcVA1Tj80HJv/2qu+bqpzBnWzDBy5YiFUtACjAiRbWRYNi3Kt
   dbw9tHQKlxErEgE9ImOB/lmspMM4BsXrf3U4751VswyMlTlFv21jW6+S1
   R58xGDEWI3HbFcUhSKolAX6heZNMSmWBM5aD9MgpZdYMZrtDlDVRjNKhG
   sSltegb9AbjHiAY27b1/fe+QASyh8avIbfqJViXbzqwKbKOWzR1jhKNS/
   DavGig+AQGurLI27p8bys8EeaQGXGVaiRWPbGHCY0VhvfQ/OKLDkTPfQ5
   dQkUaPsaOTp3/m2c9Dt1G2XxoumBKM9+9ZCC8tvzfN5wPMlb60CYpm5s8
   g==;
X-CSE-ConnectionGUID: Yq9qs8GpRg2OqJnfD3Xnbw==
X-CSE-MsgGUID: JMXVRFx6TwCKNq61sUE5DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86166034"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="86166034"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 14:16:17 -0700
X-CSE-ConnectionGUID: gNLVPEK1SWGgAohSkvvOew==
X-CSE-MsgGUID: 2zsAQkTeSGCncilBwLNyZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="264386231"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 Jul 2026 14:16:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpBdM-00000000fgd-41kV;
	Wed, 29 Jul 2026 21:16:12 +0000
Date: Thu, 30 Jul 2026 05:15:35 +0800
From: kernel test robot <lkp@intel.com>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: drivers/gpu/drm/tiny/pixpaper.c:579:12: warning: stack frame
 size (19320) exceeds limit (8192) in 'pixpaper_panel_hw_init'
Message-ID: <202607300433.8npIqx2t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi LiangCheng,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc02acf6ac0ccde0c805c2daa9148683cdd01ba8
commit: c9e70639f5915f2d084a0126e62fe53a52c29cea drm: tiny: Add support for Mayqueen Pixpaper e-ink panel
date:   11 months ago
config: x86_64-randconfig-014-20260730 (https://download.01.org/0day-ci/archive/20260730/202607300433.8npIqx2t-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300433.8npIqx2t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c9e70639f591 ("drm: tiny: Add support for Mayqueen Pixpaper e-ink panel")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607300433.8npIqx2t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/gpu/drm/tiny/pixpaper.c:579:12: warning: stack frame size (19320) exceeds limit (8192) in 'pixpaper_panel_hw_init' [-Wframe-larger-than]
     579 | static int pixpaper_panel_hw_init(struct pixpaper_panel *panel)
         |            ^
   2 warnings generated.


vim +/pixpaper_panel_hw_init +579 drivers/gpu/drm/tiny/pixpaper.c

   578	
 > 579	static int pixpaper_panel_hw_init(struct pixpaper_panel *panel)
   580	{
   581		struct pixpaper_error_ctx err = { .errno_code = 0 };
   582	
   583		gpiod_set_value_cansleep(panel->reset, 0);
   584		msleep(50);
   585		gpiod_set_value_cansleep(panel->reset, 1);
   586		msleep(50);
   587	
   588		pixpaper_wait_for_panel(panel);
   589	
   590		pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_4D, &err);
   591		pixpaper_send_data(panel, PIXPAPER_UNKNOWN_4D_CONFIG, &err);
   592		if (err.errno_code)
   593			goto init_fail;
   594		pixpaper_wait_for_panel(panel);
   595	
   596		pixpaper_send_cmd(panel, PIXPAPER_CMD_PANEL_SETTING, &err);
   597		pixpaper_send_data(panel, PIXPAPER_PSR_CONFIG, &err);
   598		pixpaper_send_data(panel, PIXPAPER_PSR_CONFIG2, &err);
   599		if (err.errno_code)
   600			goto init_fail;
   601		pixpaper_wait_for_panel(panel);
   602	
   603		pixpaper_send_cmd(panel, PIXPAPER_CMD_POWER_SETTING, &err);
   604		pixpaper_send_data(panel, PIXPAPER_PWR_CONFIG1, &err);
   605		pixpaper_send_data(panel, PIXPAPER_PWR_CONFIG2, &err);
   606		pixpaper_send_data(panel, PIXPAPER_PWR_VSP_8_2V, &err);
   607		pixpaper_send_data(panel, PIXPAPER_PWR_VSPL_15V, &err);
   608		pixpaper_send_data(panel, PIXPAPER_PWR_VSN_4V, &err);
   609		pixpaper_send_data(panel, PIXPAPER_PWR_VSP_8_2V, &err);
   610		if (err.errno_code)
   611			goto init_fail;
   612		pixpaper_wait_for_panel(panel);
   613	
   614		pixpaper_send_cmd(panel, PIXPAPER_CMD_POWER_OFF_SEQUENCE, &err);
   615		pixpaper_send_data(panel, PIXPAPER_PFS_CONFIG1, &err);
   616		pixpaper_send_data(panel, PIXPAPER_PFS_CONFIG2, &err);
   617		pixpaper_send_data(panel, PIXPAPER_PFS_CONFIG3, &err);
   618		if (err.errno_code)
   619			goto init_fail;
   620		pixpaper_wait_for_panel(panel);
   621	
   622		pixpaper_send_cmd(panel, PIXPAPER_CMD_BOOSTER_SOFT_START, &err);
   623		pixpaper_send_data(panel, PIXPAPER_BTST_CONFIG1, &err);
   624		pixpaper_send_data(panel, PIXPAPER_BTST_CONFIG2, &err);
   625		pixpaper_send_data(panel, PIXPAPER_BTST_CONFIG3, &err);
   626		pixpaper_send_data(panel, PIXPAPER_BTST_CONFIG4, &err);
   627		pixpaper_send_data(panel, PIXPAPER_BTST_CONFIG5, &err);
   628		pixpaper_send_data(panel, PIXPAPER_BTST_CONFIG6, &err);
   629		pixpaper_send_data(panel, PIXPAPER_BTST_CONFIG7, &err);
   630		if (err.errno_code)
   631			goto init_fail;
   632		pixpaper_wait_for_panel(panel);
   633	
   634		pixpaper_send_cmd(panel, PIXPAPER_CMD_PLL_CONTROL, &err);
   635		pixpaper_send_data(panel, PIXPAPER_PLL_CONFIG, &err);
   636		if (err.errno_code)
   637			goto init_fail;
   638		pixpaper_wait_for_panel(panel);
   639	
   640		pixpaper_send_cmd(panel, PIXPAPER_CMD_TEMP_SENSOR_CALIB, &err);
   641		pixpaper_send_data(panel, PIXPAPER_TSE_CONFIG, &err);
   642		if (err.errno_code)
   643			goto init_fail;
   644		pixpaper_wait_for_panel(panel);
   645	
   646		pixpaper_send_cmd(panel, PIXPAPER_CMD_VCOM_INTERVAL, &err);
   647		pixpaper_send_data(panel, PIXPAPER_CDI_CONFIG, &err);
   648		if (err.errno_code)
   649			goto init_fail;
   650		pixpaper_wait_for_panel(panel);
   651	
   652		pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_60, &err);
   653		pixpaper_send_data(panel, PIXPAPER_UNKNOWN_60_CONFIG1, &err);
   654		pixpaper_send_data(panel, PIXPAPER_UNKNOWN_60_CONFIG2, &err);
   655		if (err.errno_code)
   656			goto init_fail;
   657		pixpaper_wait_for_panel(panel);
   658	
   659		pixpaper_send_cmd(panel, PIXPAPER_CMD_RESOLUTION_SETTING, &err);
   660		pixpaper_send_data(panel, PIXPAPER_TRES_HRES_H, &err);
   661		pixpaper_send_data(panel, PIXPAPER_TRES_HRES_L, &err);
   662		pixpaper_send_data(panel, PIXPAPER_TRES_VRES_H, &err);
   663		pixpaper_send_data(panel, PIXPAPER_TRES_VRES_L, &err);
   664		if (err.errno_code)
   665			goto init_fail;
   666		pixpaper_wait_for_panel(panel);
   667	
   668		pixpaper_send_cmd(panel, PIXPAPER_CMD_GATE_SOURCE_START, &err);
   669		pixpaper_send_data(panel, PIXPAPER_GSST_S_START, &err);
   670		pixpaper_send_data(panel, PIXPAPER_GSST_RESERVED, &err);
   671		pixpaper_send_data(panel, PIXPAPER_GSST_G_START_H, &err);
   672		pixpaper_send_data(panel, PIXPAPER_GSST_G_START_L, &err);
   673		if (err.errno_code)
   674			goto init_fail;
   675		pixpaper_wait_for_panel(panel);
   676	
   677		pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_E7, &err);
   678		pixpaper_send_data(panel, PIXPAPER_UNKNOWN_E7_CONFIG, &err);
   679		if (err.errno_code)
   680			goto init_fail;
   681		pixpaper_wait_for_panel(panel);
   682	
   683		pixpaper_send_cmd(panel, PIXPAPER_CMD_POWER_SAVING, &err);
   684		pixpaper_send_data(panel, PIXPAPER_PWS_CONFIG, &err);
   685		if (err.errno_code)
   686			goto init_fail;
   687		pixpaper_wait_for_panel(panel);
   688	
   689		pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_E0, &err);
   690		pixpaper_send_data(panel, PIXPAPER_UNKNOWN_E0_CONFIG, &err);
   691		if (err.errno_code)
   692			goto init_fail;
   693		pixpaper_wait_for_panel(panel);
   694	
   695		pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_B4, &err);
   696		pixpaper_send_data(panel, PIXPAPER_UNKNOWN_B4_CONFIG, &err);
   697		if (err.errno_code)
   698			goto init_fail;
   699		pixpaper_wait_for_panel(panel);
   700	
   701		pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_B5, &err);
   702		pixpaper_send_data(panel, PIXPAPER_UNKNOWN_B5_CONFIG, &err);
   703		if (err.errno_code)
   704			goto init_fail;
   705		pixpaper_wait_for_panel(panel);
   706	
   707		pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_E9, &err);
   708		pixpaper_send_data(panel, PIXPAPER_UNKNOWN_E9_CONFIG, &err);
   709		if (err.errno_code)
   710			goto init_fail;
   711		pixpaper_wait_for_panel(panel);
   712	
   713		return 0;
   714	
   715	init_fail:
   716		drm_err(&panel->drm, "Hardware initialization failed (err=%d)\n",
   717			err.errno_code);
   718		return err.errno_code;
   719	}
   720	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
