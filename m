Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364D02C190;
	Sun, 16 Nov 2025 04:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763266867; cv=none; b=N87+oDSY7G4IjPqdZINkWmyKwXSxy/g806PH+5/U3B08lJS82RT3GsLMmuZrxIIzpGh/iQzYTSfw+cWaIC/pT/KzoSkM6nn9HNvozI3jU+tktA2LViVmUnMW0tUer8x2loeEYl2RxmeChXfmO+1xSzBn9bbgDweQKq6NDy8v76A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763266867; c=relaxed/simple;
	bh=I2mT8fMoXkxXi8uWcpJOeMJBzJQv1W1eTjQ6T9aL+K4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fFBpeLxAuiha4buY7mri3jmGJ3HgeVxfvDLI6H8uAJiCI7mUHqetgxT7S1jPX5KhWqAYTq7oY54WBRaw0fHcfmBvYDZ/cnvrXhf/FIN6g9xDKlXDG0hyK66IFb3AR3I9Gf2qQOoEc7SXTLElQptS0X1jDAf5gvHh+mMqS9HG7Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGXZCLhI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGXZCLhI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763266866; x=1794802866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I2mT8fMoXkxXi8uWcpJOeMJBzJQv1W1eTjQ6T9aL+K4=;
  b=MGXZCLhIb99rvVU1lKt9CHAklIVq2lVtcrm2IoqYLpeN7RWA7D8FX2SS
   HVSfw4i6frqPu8kOS9eE2QbhFagYZlthMGZqtOIh6KGW/m+WI3yTAG5G5
   CjkDs9hTlu94YMEVocPYam6WPniGFf2KlZy0Kipa9Mn4IofM14rEVRaVk
   g+dRGALe9zTHYYDjSHiQpLBzQoygPKVvA81Svyr7LXZrLHRPak1CaNyaX
   71SPTEcGyHEr+Utf3L4ISIqZEg58UcUmAghMIY37FBL8jh2nt29FiLE8N
   gmfHDyAeHz8FI50lSk+QUaJ/sw7/SY7EleVbfESQjUDhzH9xqBOA0Ex3e
   A==;
X-CSE-ConnectionGUID: hhgwOl0ASpeCC+D2tIWEtQ==
X-CSE-MsgGUID: O2Tiqr1wRAu44cEVUVxJKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="68928584"
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="68928584"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 20:21:05 -0800
X-CSE-ConnectionGUID: Q0Rs5scxRn6TC2+Bc2wCiQ==
X-CSE-MsgGUID: V1vHxlV2QIKZCv+ggho0gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="195281272"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Nov 2025 20:21:03 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKUG5-0008V3-1W;
	Sun, 16 Nov 2025 04:21:01 +0000
Date: Sun, 16 Nov 2025 12:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:string-helper-2025-11-13 120/145]
 drivers/gpu/drm/panel/panel-sony-acx565akm.c:562:3: error: call to
 undeclared function 'str_enabled_disabled'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202511161228.QJ6IRBJQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux string-helper-2025-11-13
head:   3ba5ad9182bc6de3e8699129d61a66cbc8d480a9
commit: 57dce640516332444cd0930a853c65c9fe36e2ee [120/145] drm/panel: sony-acx565akm: use string choices helper
config: powerpc-randconfig-002-20251116 (https://download.01.org/0day-ci/archive/20251116/202511161228.QJ6IRBJQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511161228.QJ6IRBJQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511161228.QJ6IRBJQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-sony-acx565akm.c:562:3: error: call to undeclared function 'str_enabled_disabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     562 |                 str_enabled_disabled(lcd->enabled), status);
         |                 ^
>> drivers/gpu/drm/panel/panel-sony-acx565akm.c:562:3: warning: format specifies type 'char *' but the argument has type 'int' [-Wformat]
     561 |                 "LCD panel %s by bootloader (status 0x%04x)\n",
         |                            ~~
         |                            %d
     562 |                 str_enabled_disabled(lcd->enabled), status);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:171:49: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:139:35: note: expanded from macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ~~~    ^~~~~~~~~~~
   1 warning and 1 error generated.


vim +/str_enabled_disabled +562 drivers/gpu/drm/panel/panel-sony-acx565akm.c

   538	
   539	/* -----------------------------------------------------------------------------
   540	 * Probe, Detect and Remove
   541	 */
   542	
   543	static int acx565akm_detect(struct acx565akm_panel *lcd)
   544	{
   545		__be32 value;
   546		u32 status;
   547		int ret = 0;
   548	
   549		/*
   550		 * After being taken out of reset the panel needs 5ms before the first
   551		 * command can be sent.
   552		 */
   553		gpiod_set_value(lcd->reset_gpio, 1);
   554		usleep_range(5000, 10000);
   555	
   556		acx565akm_read(lcd, MIPI_DCS_GET_DISPLAY_STATUS, (u8 *)&value, 4);
   557		status = __be32_to_cpu(value);
   558		lcd->enabled = (status & (1 << 17)) && (status & (1 << 10));
   559	
   560		dev_dbg(&lcd->spi->dev,
   561			"LCD panel %s by bootloader (status 0x%04x)\n",
 > 562			str_enabled_disabled(lcd->enabled), status);
   563	
   564		acx565akm_read(lcd, MIPI_DCS_GET_DISPLAY_ID, lcd->display_id, 3);
   565		dev_dbg(&lcd->spi->dev, "MIPI display ID: %3phN\n", lcd->display_id);
   566	
   567		switch (lcd->display_id[0]) {
   568		case 0x10:
   569			lcd->model = MIPID_VER_ACX565AKM;
   570			lcd->name = "acx565akm";
   571			lcd->has_bc = 1;
   572			lcd->has_cabc = 1;
   573			break;
   574		case 0x29:
   575			lcd->model = MIPID_VER_L4F00311;
   576			lcd->name = "l4f00311";
   577			break;
   578		case 0x45:
   579			lcd->model = MIPID_VER_LPH8923;
   580			lcd->name = "lph8923";
   581			break;
   582		case 0x83:
   583			lcd->model = MIPID_VER_LS041Y3;
   584			lcd->name = "ls041y3";
   585			break;
   586		default:
   587			lcd->name = "unknown";
   588			dev_err(&lcd->spi->dev, "unknown display ID\n");
   589			ret = -ENODEV;
   590			goto done;
   591		}
   592	
   593		lcd->revision = lcd->display_id[1];
   594	
   595		dev_info(&lcd->spi->dev, "%s rev %02x panel detected\n",
   596			 lcd->name, lcd->revision);
   597	
   598	done:
   599		if (!lcd->enabled)
   600			gpiod_set_value(lcd->reset_gpio, 0);
   601	
   602		return ret;
   603	}
   604	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
