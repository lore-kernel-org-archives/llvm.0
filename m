Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D01B3DAABB;
	Tue, 29 Sep 2026 04:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790654437; cv=none; b=Y9HhybfjCrdkhquYFPAbRTBOC2bb77KUadAjgKXUzosu6x9XKqFpKw6/hbiVgID7gq2QRk0EVSM8kuqXCX/3pmSV+FJZBN7e0doH1NxPdn9noVB/Pb6OTtqPkDaB4rwr9YgUGOG993jS0bL1wtUdEKn3eyKbPYNSJHVGKkQSm2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790654437; c=relaxed/simple;
	bh=GdyCnW29NVqEhZpy534MCoD6Z2SnKC6FIk5b2avDU/I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lP0h19Cznh9wBwafESQO5cy7WB/sA96fDbcBGcIOUWNAtdf1ufE4dh1VD5vfSqhDcE213+s6sD0osYZBxFJp4Apaaqgc8ZbeYa3oaZoRhgB2VFx2Xz2PtKCjz3Z8TA3rV673qU5bkPWb1FB/ldBBul1OEVXH7nuhOifh1uvFLPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YB6wPsyZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YB6wPsyZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790654434; x=1822190434;
  h=date:from:to:cc:subject:message-id;
  bh=GdyCnW29NVqEhZpy534MCoD6Z2SnKC6FIk5b2avDU/I=;
  b=YB6wPsyZIVtv1HIkH35aHgoRCCNDN7MBhY+XKtF+LAXHdWmlHjubttVK
   ED7kYjquu+kidCtglqFQGAcOixHvkKfXNCtrtE2ClwUT+rpa28V3xqT/z
   FWziaLC5y/8JvivkE39Ry4aABOT8bhUd1GW9mrkXia0Z3EzY4kYzxvoBv
   wAde380UDu+k9cmbqXvU9+ovjBE3AO5Ekv84y6kfsdYydSrnMPelpG/Ua
   YdJuNonyNRdb8qNf8WvdIvmHKbZ4Lt3mqkq4s4g5c1S3h0JXlpWFCxXiL
   GFl97MDXueRlo/tkGEsB+zPKyYS4h1/rqWOnQbrLmET1On7/uWFl8h5BB
   w==;
X-CSE-ConnectionGUID: M1FuAN5TSfScJArqfQhLkQ==
X-CSE-MsgGUID: vk2MUQviRoWrVDnnQONP1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90494632"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90494632"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 21:00:30 -0700
X-CSE-ConnectionGUID: Q1HsEHBwSrKioAweeMJZ6A==
X-CSE-MsgGUID: QlGv2Z66Th6pJG98rTjckA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="275271272"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Sep 2026 21:00:29 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBP10-00000000Ov7-2tdV;
	Tue, 29 Sep 2026 04:00:26 +0000
Date: Tue, 29 Sep 2026 11:59:45 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 11138/11456]
 drivers/gpu/drm/verisilicon/vs_bridge.c:306:9: error: call to undeclared
 function 'devm_drm_of_get_bridge'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202609291109.OIsGTysr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Luca,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6375e61c01e93e35ee7acd336a689ac1fae4b509
commit: aa8a8c7e4641ebcef02dd6fa387ca334857367f4 [11138/11456] drm/bridge: panel: move all code to drm_panel.c
config: i386-buildonly-randconfig-1005-20260929 (https://download.01.org/0day-ci/archive/20260929/202609291109.OIsGTysr-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609291109.OIsGTysr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609291109.OIsGTysr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/verisilicon/vs_bridge.c:306:9: error: call to undeclared function 'devm_drm_of_get_bridge'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     306 |         next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,
         |                ^
   drivers/gpu/drm/verisilicon/vs_bridge.c:306:9: note: did you mean 'devm_drm_put_bridge'?
   include/drm/drm_bridge.h:1525:6: note: 'devm_drm_put_bridge' declared here
    1525 | void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge);
         |      ^
>> drivers/gpu/drm/verisilicon/vs_bridge.c:306:7: error: incompatible integer to pointer conversion assigning to 'struct drm_bridge *' from 'int' [-Wint-conversion]
     306 |         next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     307 |                                       output, intf);
         |                                       ~~~~~~~~~~~~~
   2 errors generated.
--
>> drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c:336:11: error: call to undeclared function 'devm_drm_of_get_bridge'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     336 |         bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
         |                  ^
   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c:336:11: note: did you mean 'devm_drm_put_bridge'?
   include/drm/drm_bridge.h:1525:6: note: 'devm_drm_put_bridge' declared here
    1525 | void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge);
         |      ^
>> drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c:336:9: error: incompatible integer to pointer conversion assigning to 'struct drm_bridge *' from 'int' [-Wint-conversion]
     336 |         bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
   Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
   Selected by [y]:
   - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]


vim +/devm_drm_of_get_bridge +306 drivers/gpu/drm/verisilicon/vs_bridge.c

dbf21777caa8b8c Icenowy Zheng 2026-01-29  288  
dbf21777caa8b8c Icenowy Zheng 2026-01-29  289  struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
dbf21777caa8b8c Icenowy Zheng 2026-01-29  290  				 struct vs_crtc *crtc)
dbf21777caa8b8c Icenowy Zheng 2026-01-29  291  {
dbf21777caa8b8c Icenowy Zheng 2026-01-29  292  	unsigned int output = crtc->id;
dbf21777caa8b8c Icenowy Zheng 2026-01-29  293  	struct vs_bridge *bridge;
dbf21777caa8b8c Icenowy Zheng 2026-01-29  294  	struct drm_bridge *next;
dbf21777caa8b8c Icenowy Zheng 2026-01-29  295  	enum vs_bridge_output_interface intf;
dbf21777caa8b8c Icenowy Zheng 2026-01-29  296  	const struct drm_bridge_funcs *bridge_funcs;
dbf21777caa8b8c Icenowy Zheng 2026-01-29  297  	int ret, enctype;
dbf21777caa8b8c Icenowy Zheng 2026-01-29  298  
dbf21777caa8b8c Icenowy Zheng 2026-01-29  299  	intf = vs_bridge_detect_output_interface(drm_dev->dev->of_node,
dbf21777caa8b8c Icenowy Zheng 2026-01-29  300  						 output);
dbf21777caa8b8c Icenowy Zheng 2026-01-29  301  	if (intf == -ENODEV) {
dbf21777caa8b8c Icenowy Zheng 2026-01-29  302  		drm_dbg(drm_dev, "Skipping output %u\n", output);
dbf21777caa8b8c Icenowy Zheng 2026-01-29  303  		return NULL;
dbf21777caa8b8c Icenowy Zheng 2026-01-29  304  	}
dbf21777caa8b8c Icenowy Zheng 2026-01-29  305  
dbf21777caa8b8c Icenowy Zheng 2026-01-29 @306  	next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,

:::::: The code at line 306 was first introduced by commit
:::::: dbf21777caa8b8c88c12f7f036b01208fec0d55a drm: verisilicon: add a driver for Verisilicon display controllers

:::::: TO: Icenowy Zheng <uwu@icenowy.me>
:::::: CC: Thomas Zimmermann <tzimmermann@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
