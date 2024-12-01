Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E562566;
	Sun,  1 Dec 2024 01:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733017335; cv=none; b=OCnDmJ37YeG6I3uQo3gIzm6KpNqjF/TFit5dT7sR3qxbh9yamT6OMMMx4efUah96cPfkXW5Ec76R0dDZMKTUt0yRL4YoOhvu55HG2N/BBrZmJkqFxup4Z6nQbpRtQCOi0uob5cE8XGtpcJLzpEGUXZxRX2oQuNAIeaY2AmDxQ1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733017335; c=relaxed/simple;
	bh=72kbCSe3OyN7jS3TfHtNoISRrHpeb9cjxGqm2HF/5mI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UHJiyvAIY2NfmGLpEEBNvmbH0/MINlayddDpHjj9ktUd9IWX0Xy1QemlZvnIHQeKvBwNrgoJGzkA3a/Aoxwpf748vuiV3S0Lmx5TkPfS8iMKI9WSvXRK8sOmNpA2a/iuKnWkpGR8K3doBVYJGAqXdDJpWD1AT4zqPHp8Kenjg0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JjwBr4Xz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JjwBr4Xz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733017333; x=1764553333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=72kbCSe3OyN7jS3TfHtNoISRrHpeb9cjxGqm2HF/5mI=;
  b=JjwBr4XzUUwp5gQP+gG17zKhAhlMSqybaMScCF1BNc2rYsht9qUiIE+V
   XiTG8sZ+XDEvXhhTZNMwN/7pTvlikSGvS/kb72KwEU7ANn+AC6r5XhMA6
   lWGLkBvvlxl4GHFvyIk/1QRTy5IXV448kfncr9xCDK/pUpOdmJjS3UjPs
   MTlGx4xmluKvJ5I2OfWvO+tw164Sk0YbeufarYcCc1wcUEar1aW85KuNZ
   WS1d3jywsqZr7N9Qpsg83ZZqvUKp0WD+YIO/UQtq3gyTQwXFnVBvJFZxr
   meG6kH+MP1lqeFe2miaX7pBFxQPO2OI+7/TeYEbA1tmBkIKZ51L/xf1l1
   g==;
X-CSE-ConnectionGUID: z7sndHPBT1qzRVtVMWmaxw==
X-CSE-MsgGUID: 3ILQDiifTiqoJ2Fzp6BfCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="43875854"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="43875854"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 17:42:12 -0800
X-CSE-ConnectionGUID: Dfai3mu1S/euEr7/4Lbvfg==
X-CSE-MsgGUID: d5m37Y1STBqQKsb6F3qlPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="130255121"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Nov 2024 17:42:11 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHYy4-00017b-0l;
	Sun, 01 Dec 2024 01:41:54 +0000
Date: Sun, 1 Dec 2024 09:40:23 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-attr 69/71]
 drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c:362:8: error: field
 designator 'show_new' does not refer to any field in type 'struct
 overlay_attribute'
Message-ID: <202412010956.bI8sPKhN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-attr
head:   aed513ca2679dc1dac28c9fc5e230c9102c73a72
commit: a0965582e0a49944224cef0b8ea6dd3f961630fd [69/71] _Generic
config: i386-buildonly-randconfig-003-20241201 (https://download.01.org/0day-ci/archive/20241201/202412010956.bI8sPKhN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010956.bI8sPKhN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010956.bI8sPKhN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c:362:8: error: field designator 'show_new' does not refer to any field in type 'struct overlay_attribute'
     362 | static OVERLAY_ATTR(name, S_IRUGO, overlay_name_show, NULL);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c:360:2: note: expanded from macro 'OVERLAY_ATTR'
     360 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:254:2: note: expanded from macro '__ATTR'
     254 |         __ATTR_SHOW(_show),                                             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:239:3: note: expanded from macro '__ATTR_SHOW'
     239 |         .show_new = _Generic(_show,                                     \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     240 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     241 |         )
         |         ~
>> drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c:362:8: error: field designator 'store_new' does not refer to any field in type 'struct overlay_attribute'
     362 | static OVERLAY_ATTR(name, S_IRUGO, overlay_name_show, NULL);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c:360:2: note: expanded from macro 'OVERLAY_ATTR'
     360 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:255:2: note: expanded from macro '__ATTR'
     255 |         __ATTR_STORE(_store),                                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:247:3: note: expanded from macro '__ATTR_STORE'
     247 |         .store_new = _Generic(_store,                                   \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     248 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     249 |         )
         |         ~
   drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c:363:8: error: field designator 'show_new' does not refer to any field in type 'struct overlay_attribute'
     363 | static OVERLAY_ATTR(manager, S_IRUGO|S_IWUSR,
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     364 |                 overlay_manager_show, overlay_manager_store);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c:360:2: note: expanded from macro 'OVERLAY_ATTR'
     360 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:254:2: note: expanded from macro '__ATTR'
     254 |         __ATTR_SHOW(_show),                                             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:239:3: note: expanded from macro '__ATTR_SHOW'
     239 |         .show_new = _Generic(_show,                                     \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     240 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     241 |         )
         |         ~
   drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c:363:8: error: field designator 'store_new' does not refer to any field in type 'struct overlay_attribute'
     363 | static OVERLAY_ATTR(manager, S_IRUGO|S_IWUSR,
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     364 |                 overlay_manager_show, overlay_manager_store);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c:360:2: note: expanded from macro 'OVERLAY_ATTR'
     360 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:255:2: note: expanded from macro '__ATTR'
     255 |         __ATTR_STORE(_store),                                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:247:3: note: expanded from macro '__ATTR_STORE'
     247 |         .store_new = _Generic(_store,                                   \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     248 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     249 |         )
         |         ~
   drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c:365:8: error: field designator 'show_new' does not refer to any field in type 'struct overlay_attribute'
     365 | static OVERLAY_ATTR(input_size, S_IRUGO, overlay_input_size_show, NULL);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c:360:2: note: expanded from macro 'OVERLAY_ATTR'
     360 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:254:2: note: expanded from macro '__ATTR'
     254 |         __ATTR_SHOW(_show),                                             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:239:3: note: expanded from macro '__ATTR_SHOW'
     239 |         .show_new = _Generic(_show,                                     \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     240 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     241 |         )
         |         ~
   drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c:365:8: error: field designator 'store_new' does not refer to any field in type 'struct overlay_attribute'
     365 | static OVERLAY_ATTR(input_size, S_IRUGO, overlay_input_size_show, NULL);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c:360:2: note: expanded from macro 'OVERLAY_ATTR'
     360 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:255:2: note: expanded from macro '__ATTR'
     255 |         __ATTR_STORE(_store),                                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:247:3: note: expanded from macro '__ATTR_STORE'
     247 |         .store_new = _Generic(_store,                                   \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     248 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     249 |         )
         |         ~
   drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c:366:8: error: field designator 'show_new' does not refer to any field in type 'struct overlay_attribute'
     366 | static OVERLAY_ATTR(screen_width, S_IRUGO, overlay_screen_width_show, NULL);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c:360:2: note: expanded from macro 'OVERLAY_ATTR'
     360 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:254:2: note: expanded from macro '__ATTR'
     254 |         __ATTR_SHOW(_show),                                             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:239:3: note: expanded from macro '__ATTR_SHOW'
     239 |         .show_new = _Generic(_show,                                     \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     240 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     241 |         )
         |         ~
   drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c:366:8: error: field designator 'store_new' does not refer to any field in type 'struct overlay_attribute'
--
>> drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c:243:8: error: field designator 'show_new' does not refer to any field in type 'struct display_attribute'
     243 | static DISPLAY_ATTR(name, S_IRUGO, display_name_show, NULL);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c:241:2: note: expanded from macro 'DISPLAY_ATTR'
     241 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:254:2: note: expanded from macro '__ATTR'
     254 |         __ATTR_SHOW(_show),                                             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:239:3: note: expanded from macro '__ATTR_SHOW'
     239 |         .show_new = _Generic(_show,                                     \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     240 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     241 |         )
         |         ~
>> drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c:243:8: error: field designator 'store_new' does not refer to any field in type 'struct display_attribute'
     243 | static DISPLAY_ATTR(name, S_IRUGO, display_name_show, NULL);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c:241:2: note: expanded from macro 'DISPLAY_ATTR'
     241 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:255:2: note: expanded from macro '__ATTR'
     255 |         __ATTR_STORE(_store),                                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:247:3: note: expanded from macro '__ATTR_STORE'
     247 |         .store_new = _Generic(_store,                                   \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     248 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     249 |         )
         |         ~
   drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c:244:8: error: field designator 'show_new' does not refer to any field in type 'struct display_attribute'
     244 | static DISPLAY_ATTR(display_name, S_IRUGO, display_name_show, NULL);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c:241:2: note: expanded from macro 'DISPLAY_ATTR'
     241 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:254:2: note: expanded from macro '__ATTR'
     254 |         __ATTR_SHOW(_show),                                             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:239:3: note: expanded from macro '__ATTR_SHOW'
     239 |         .show_new = _Generic(_show,                                     \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     240 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     241 |         )
         |         ~
   drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c:244:8: error: field designator 'store_new' does not refer to any field in type 'struct display_attribute'
     244 | static DISPLAY_ATTR(display_name, S_IRUGO, display_name_show, NULL);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c:241:2: note: expanded from macro 'DISPLAY_ATTR'
     241 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:255:2: note: expanded from macro '__ATTR'
     255 |         __ATTR_STORE(_store),                                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:247:3: note: expanded from macro '__ATTR_STORE'
     247 |         .store_new = _Generic(_store,                                   \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     248 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     249 |         )
         |         ~
   drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c:245:8: error: field designator 'show_new' does not refer to any field in type 'struct display_attribute'
     245 | static DISPLAY_ATTR(enabled, S_IRUGO|S_IWUSR,
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     246 |                 display_enabled_show, display_enabled_store);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c:241:2: note: expanded from macro 'DISPLAY_ATTR'
     241 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:254:2: note: expanded from macro '__ATTR'
     254 |         __ATTR_SHOW(_show),                                             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:239:3: note: expanded from macro '__ATTR_SHOW'
     239 |         .show_new = _Generic(_show,                                     \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     240 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     241 |         )
         |         ~
   drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c:245:8: error: field designator 'store_new' does not refer to any field in type 'struct display_attribute'
     245 | static DISPLAY_ATTR(enabled, S_IRUGO|S_IWUSR,
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     246 |                 display_enabled_show, display_enabled_store);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c:241:2: note: expanded from macro 'DISPLAY_ATTR'
     241 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:255:2: note: expanded from macro '__ATTR'
     255 |         __ATTR_STORE(_store),                                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:247:3: note: expanded from macro '__ATTR_STORE'
     247 |         .store_new = _Generic(_store,                                   \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     248 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     249 |         )
         |         ~
   drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c:247:8: error: field designator 'show_new' does not refer to any field in type 'struct display_attribute'
     247 | static DISPLAY_ATTR(tear_elim, S_IRUGO|S_IWUSR,
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     248 |                 display_tear_show, display_tear_store);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c:241:2: note: expanded from macro 'DISPLAY_ATTR'
     241 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:254:2: note: expanded from macro '__ATTR'
     254 |         __ATTR_SHOW(_show),                                             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:239:3: note: expanded from macro '__ATTR_SHOW'
     239 |         .show_new = _Generic(_show,                                     \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     240 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     241 |         )
--
>> drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c:426:8: error: field designator 'show_new' does not refer to any field in type 'struct manager_attribute'
     426 | static MANAGER_ATTR(name, S_IRUGO, manager_name_show, NULL);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c:424:2: note: expanded from macro 'MANAGER_ATTR'
     424 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:254:2: note: expanded from macro '__ATTR'
     254 |         __ATTR_SHOW(_show),                                             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:239:3: note: expanded from macro '__ATTR_SHOW'
     239 |         .show_new = _Generic(_show,                                     \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     240 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     241 |         )
         |         ~
>> drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c:426:8: error: field designator 'store_new' does not refer to any field in type 'struct manager_attribute'
     426 | static MANAGER_ATTR(name, S_IRUGO, manager_name_show, NULL);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c:424:2: note: expanded from macro 'MANAGER_ATTR'
     424 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:255:2: note: expanded from macro '__ATTR'
     255 |         __ATTR_STORE(_store),                                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:247:3: note: expanded from macro '__ATTR_STORE'
     247 |         .store_new = _Generic(_store,                                   \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     248 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     249 |         )
         |         ~
   drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c:427:8: error: field designator 'show_new' does not refer to any field in type 'struct manager_attribute'
     427 | static MANAGER_ATTR(display, S_IRUGO|S_IWUSR,
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     428 |                 manager_display_show, manager_display_store);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c:424:2: note: expanded from macro 'MANAGER_ATTR'
     424 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:254:2: note: expanded from macro '__ATTR'
     254 |         __ATTR_SHOW(_show),                                             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:239:3: note: expanded from macro '__ATTR_SHOW'
     239 |         .show_new = _Generic(_show,                                     \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     240 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     241 |         )
         |         ~
   drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c:427:8: error: field designator 'store_new' does not refer to any field in type 'struct manager_attribute'
     427 | static MANAGER_ATTR(display, S_IRUGO|S_IWUSR,
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     428 |                 manager_display_show, manager_display_store);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c:424:2: note: expanded from macro 'MANAGER_ATTR'
     424 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:255:2: note: expanded from macro '__ATTR'
     255 |         __ATTR_STORE(_store),                                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:247:3: note: expanded from macro '__ATTR_STORE'
     247 |         .store_new = _Generic(_store,                                   \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     248 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     249 |         )
         |         ~
   drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c:429:8: error: field designator 'show_new' does not refer to any field in type 'struct manager_attribute'
     429 | static MANAGER_ATTR(default_color, S_IRUGO|S_IWUSR,
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     430 |                 manager_default_color_show, manager_default_color_store);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c:424:2: note: expanded from macro 'MANAGER_ATTR'
     424 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:254:2: note: expanded from macro '__ATTR'
     254 |         __ATTR_SHOW(_show),                                             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:239:3: note: expanded from macro '__ATTR_SHOW'
     239 |         .show_new = _Generic(_show,                                     \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     240 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     241 |         )
         |         ~
   drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c:429:8: error: field designator 'store_new' does not refer to any field in type 'struct manager_attribute'
     429 | static MANAGER_ATTR(default_color, S_IRUGO|S_IWUSR,
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     430 |                 manager_default_color_show, manager_default_color_store);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c:424:2: note: expanded from macro 'MANAGER_ATTR'
     424 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:255:2: note: expanded from macro '__ATTR'
     255 |         __ATTR_STORE(_store),                                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:247:3: note: expanded from macro '__ATTR_STORE'
     247 |         .store_new = _Generic(_store,                                   \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     248 |                 default : NULL                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     249 |         )
         |         ~
   drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c:431:8: error: field designator 'show_new' does not refer to any field in type 'struct manager_attribute'
     431 | static MANAGER_ATTR(trans_key_type, S_IRUGO|S_IWUSR,
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     432 |                 manager_trans_key_type_show, manager_trans_key_type_store);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c:424:2: note: expanded from macro 'MANAGER_ATTR'
     424 |         __ATTR(_name, _mode, _show, _store)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:254:2: note: expanded from macro '__ATTR'
     254 |         __ATTR_SHOW(_show),                                             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:239:3: note: expanded from macro '__ATTR_SHOW'
     239 |         .show_new = _Generic(_show,                                     \


vim +362 drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c

f76ee892a99e68 Tomi Valkeinen 2015-12-09  357  
f76ee892a99e68 Tomi Valkeinen 2015-12-09  358  #define OVERLAY_ATTR(_name, _mode, _show, _store) \
f76ee892a99e68 Tomi Valkeinen 2015-12-09  359  	struct overlay_attribute overlay_attr_##_name = \
f76ee892a99e68 Tomi Valkeinen 2015-12-09  360  	__ATTR(_name, _mode, _show, _store)
f76ee892a99e68 Tomi Valkeinen 2015-12-09  361  
f76ee892a99e68 Tomi Valkeinen 2015-12-09 @362  static OVERLAY_ATTR(name, S_IRUGO, overlay_name_show, NULL);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  363  static OVERLAY_ATTR(manager, S_IRUGO|S_IWUSR,
f76ee892a99e68 Tomi Valkeinen 2015-12-09  364  		overlay_manager_show, overlay_manager_store);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  365  static OVERLAY_ATTR(input_size, S_IRUGO, overlay_input_size_show, NULL);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  366  static OVERLAY_ATTR(screen_width, S_IRUGO, overlay_screen_width_show, NULL);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  367  static OVERLAY_ATTR(position, S_IRUGO|S_IWUSR,
f76ee892a99e68 Tomi Valkeinen 2015-12-09  368  		overlay_position_show, overlay_position_store);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  369  static OVERLAY_ATTR(output_size, S_IRUGO|S_IWUSR,
f76ee892a99e68 Tomi Valkeinen 2015-12-09  370  		overlay_output_size_show, overlay_output_size_store);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  371  static OVERLAY_ATTR(enabled, S_IRUGO|S_IWUSR,
f76ee892a99e68 Tomi Valkeinen 2015-12-09  372  		overlay_enabled_show, overlay_enabled_store);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  373  static OVERLAY_ATTR(global_alpha, S_IRUGO|S_IWUSR,
f76ee892a99e68 Tomi Valkeinen 2015-12-09  374  		overlay_global_alpha_show, overlay_global_alpha_store);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  375  static OVERLAY_ATTR(pre_mult_alpha, S_IRUGO|S_IWUSR,
f76ee892a99e68 Tomi Valkeinen 2015-12-09  376  		overlay_pre_mult_alpha_show,
f76ee892a99e68 Tomi Valkeinen 2015-12-09  377  		overlay_pre_mult_alpha_store);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  378  static OVERLAY_ATTR(zorder, S_IRUGO|S_IWUSR,
f76ee892a99e68 Tomi Valkeinen 2015-12-09  379  		overlay_zorder_show, overlay_zorder_store);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  380  

:::::: The code at line 362 was first introduced by commit
:::::: f76ee892a99e68b55402b8d4b8aeffcae2aff34d omapfb: copy omapdss & displays for omapfb

:::::: TO: Tomi Valkeinen <tomi.valkeinen@ti.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
