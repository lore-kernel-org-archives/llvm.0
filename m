Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61B619B3CB;
	Wed, 29 Jan 2025 08:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738138177; cv=none; b=iOTyXoe0BWNA4HXIBsl/5qAjWh9N49Punn19g12Ev/NGNAqaK8zVRhJscjE84QqphBOrr7EWhtDF4k3uwSBDjPSILltWI0tUtXrszcsCnYEE9fcvb58m/Aot+0SPwYU68ccEeX50WrtlJstIwaXg6NKH5/CdIbBpJ2CBl4cdCyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738138177; c=relaxed/simple;
	bh=0uIxjEV5UgPkEu6sF6iYdFlijA47E4P/xIdKHZFMREw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iN4/Ij+ElnZqSu/N6FlYsCGnv2sBRiTJ1Lcn9C12nLR6HZRXNCEyFqwAy14Ga1i4B4NXXIZ5UcWlhVfTC2xfqqfIvFvRyPiDLCvQk7me2nv8Lq9sg2ehlFfG0i8+KsG0hdR1QJOTJyIY5wzOre88mGAmRIHr0wfAwNRPr8569Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AzVVwXdo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AzVVwXdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738138175; x=1769674175;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0uIxjEV5UgPkEu6sF6iYdFlijA47E4P/xIdKHZFMREw=;
  b=AzVVwXdoVg6xZKgWNGoGe0D0CC9xHr6N6xb/MQsc8PPz+p3faMkXtQm5
   HWLk8Kxs+wx7yZeSY0EiHRSsraDMLT57WjkebEUExT3X/+58MlwaQN0/j
   0zrxveypnsMpNzIwFUebIF/0BiSyJ6gQGq/ZWtA4FhYSWT4pmFhQW+1uZ
   YsG05Pdn1TNTp83NTJ38nVWcEvnwbG73BHecVSCOL+pjFGF4upVsqCqJu
   k5I/L9+owYBKLkNWGkQZHz641APrUXckeAZFEJeVvlXQNdhqRNaFVnyCf
   sx66G+fxMZf3nzuQYX9TyP/qqWSnnuWY0PCeyT7lpJKhqWw3LOhP93jPw
   A==;
X-CSE-ConnectionGUID: ESDtEILURYyduJRfUPw5sA==
X-CSE-MsgGUID: VqV8ITXFSlOYEbn9LRJs7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38524041"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="38524041"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 00:09:35 -0800
X-CSE-ConnectionGUID: tNqToKeqSHu0ViVv2bQpOw==
X-CSE-MsgGUID: TZAUG+y0T7G8emQDXm108A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="139855812"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Jan 2025 00:09:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1td38b-000ikV-32;
	Wed, 29 Jan 2025 08:09:29 +0000
Date: Wed, 29 Jan 2025 16:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: drivers/platform/surface/surface3_power.c:243:2: warning: 'snprintf'
 will always be truncated; specified size is 10, but format string expands to
 at least 12
Message-ID: <202501291646.VtwF98qd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
commit: 85f7582cd484dbf491b6d9bb2af6ef1467a024d2 platform/surface: Move Surface 3 Power OpRegion driver to platform/surface
date:   4 years, 3 months ago
config: x86_64-randconfig-071-20241231 (https://download.01.org/0day-ci/archive/20250129/202501291646.VtwF98qd-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501291646.VtwF98qd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501291646.VtwF98qd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/surface/surface3_power.c:243:2: warning: 'snprintf' will always be truncated; specified size is 10, but format string expands to at least 12 [-Wformat-truncation-non-kprintf]
     243 |         snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3pE%6pE", buf + 7, buf);
         |         ^
   1 warning generated.


vim +/snprintf +243 drivers/platform/surface/surface3_power.c

b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  207  
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  208  static int mshw0011_bix(struct mshw0011_data *cdata, struct bix *bix)
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  209  {
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  210  	struct i2c_client *client = cdata->bat0;
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  211  	char buf[SURFACE_3_STRLEN];
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  212  	int ret;
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  213  
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  214  	*bix = default_bix;
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  215  
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  216  	/* get design capacity */
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  217  	ret = i2c_smbus_read_word_data(client,
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  218  				       MSHW0011_BAT0_REG_DESIGN_CAPACITY);
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  219  	if (ret < 0) {
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  220  		dev_err(&client->dev, "Error reading design capacity: %d\n",
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  221  			ret);
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  222  		return ret;
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  223  	}
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  224  	bix->design_capacity = ret;
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  225  
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  226  	/* get last full charge capacity */
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  227  	ret = i2c_smbus_read_word_data(client,
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  228  				       MSHW0011_BAT0_REG_FULL_CHG_CAPACITY);
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  229  	if (ret < 0) {
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  230  		dev_err(&client->dev,
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  231  			"Error reading last full charge capacity: %d\n", ret);
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  232  		return ret;
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  233  	}
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  234  	bix->last_full_charg_capacity = ret;
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  235  
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  236  	/* get serial number */
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  237  	ret = i2c_smbus_read_i2c_block_data(client, MSHW0011_BAT0_REG_SERIAL_NO,
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  238  					    sizeof(buf), buf);
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  239  	if (ret != sizeof(buf)) {
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  240  		dev_err(&client->dev, "Error reading serial no: %d\n", ret);
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  241  		return ret;
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  242  	}
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21 @243  	snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3pE%6pE", buf + 7, buf);
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  244  
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  245  	/* get cycle count */
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  246  	ret = i2c_smbus_read_word_data(client, MSHW0011_BAT0_REG_CYCLE_CNT);
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  247  	if (ret < 0) {
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  248  		dev_err(&client->dev, "Error reading cycle count: %d\n", ret);
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  249  		return ret;
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  250  	}
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  251  	bix->cycle_count = ret;
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  252  
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  253  	/* get OEM name */
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  254  	ret = i2c_smbus_read_i2c_block_data(client, MSHW0011_BAT0_REG_OEM,
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  255  					    4, buf);
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  256  	if (ret != 4) {
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  257  		dev_err(&client->dev, "Error reading cycle count: %d\n", ret);
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  258  		return ret;
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  259  	}
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  260  	snprintf(bix->OEM, ARRAY_SIZE(bix->OEM), "%3pE", buf);
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  261  
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  262  	return 0;
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  263  }
b1f81b496b0d14 drivers/platform/x86/surface3_power.c Blaž Hrastnik 2020-03-21  264  

:::::: The code at line 243 was first introduced by commit
:::::: b1f81b496b0d14382a9cf160cc4dbdefb233f936 platform/x86: surface3_power: MSHW0011 rev-eng implementation

:::::: TO: Blaž Hrastnik <blaz@mxxn.io>
:::::: CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
