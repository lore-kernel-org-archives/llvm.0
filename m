Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B23225D7;
	Wed,  8 Jan 2025 06:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736316775; cv=none; b=sx5IOG64ZJd6rRBza9Mf6ch7g4puwJOLxVa9arHlN4mmaKgPqq6eLWjWkbIhZAVDGhN78F7EN6MOKKaD57KR/NyRvKdYf8IuidHGjMNfifpxl1zHlzzqDyIpi11RnEe2uGdbRfVBogxcRcVoA25F5yzE+EF2F0oGP2g8bGKXrSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736316775; c=relaxed/simple;
	bh=VqxxnRtlfAx43ASDeMjZUHwKdePTk1sp4wEFD/3fNyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N/oV+t1yOOylbssDizgZvP4Aa9RoCVBE9s2JPuYW98ZfePpw5vxYQOUvyfRzu4pDxE1aJH3FIai+FeyoYGPPyrQtlkRThGY4Br4heAfjqAS/sVoQw09mG//AQr83xuD+ARXpRC07VaCyZcLazH1m2H08GJjk0cjkgLBGYR5Oms4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RqqIIWl+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RqqIIWl+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736316774; x=1767852774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VqxxnRtlfAx43ASDeMjZUHwKdePTk1sp4wEFD/3fNyI=;
  b=RqqIIWl+BpTo15eOkzst80uGQKMsd/s6SOYdUaQi9R4suQlcBev3AWBP
   S3GzWC/GmPTspkXzhDxd2GceRF9o7RmMVTlfX6/aC8NmiWEBO1xDSuC+K
   8SioHqTsDliiAsJbX+NXt9iYH2eY6knvUkH0mhdJtLg9RyNtBuPs308fc
   UNmwDw9aIL4oiIzNamkDDSP1uFQ7FCJ3+pwR0AEK+5oTmw7S42ZQ95bQO
   n7zbWHayi0Pk8tacVz2PO5abm7t27te+ZqXloIgbSePK+Kn9s/Zshwoxk
   dJYEzQX9lchZIEyx0t4eYiISzD0XJfwUpZNLs6D4+M3u0WXIDuW5eQPAi
   g==;
X-CSE-ConnectionGUID: TYlcT8Y+Tj6fYJpEWrvQ2Q==
X-CSE-MsgGUID: ETeM8tkzSGeIJmt4YqfWWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47519498"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="47519498"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 22:12:53 -0800
X-CSE-ConnectionGUID: EMZAWn0ASna8glhp4LUs4Q==
X-CSE-MsgGUID: RaOd9UJXROiofvyrZ5jYeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="103499995"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Jan 2025 22:12:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVPJB-000FgB-1T;
	Wed, 08 Jan 2025 06:12:49 +0000
Date: Wed, 8 Jan 2025 14:12:18 +0800
From: kernel test robot <lkp@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 6430/6768] drivers/watchdog/da9052_wdt.c:176:14:
 error: no member named 'fault_log' in 'struct da9052'
Message-ID: <202501081401.S714JKUr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7b4b9bf203da94fbeac75ed3116c84aa03e74578
commit: 651b5fde35d67a2f669d2c0f5e1b702cac3400b2 [6430/6768] watchdog: da9052_wdt: add support for bootstatus bits
config: i386-randconfig-016-20250108 (https://download.01.org/0day-ci/archive/20250108/202501081401.S714JKUr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081401.S714JKUr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081401.S714JKUr-lkp@intel.com/

Note: the linux-next/master HEAD 7b4b9bf203da94fbeac75ed3116c84aa03e74578 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/watchdog/da9052_wdt.c:176:14: error: no member named 'fault_log' in 'struct da9052'
     176 |         if (da9052->fault_log & DA9052_FAULTLOG_TWDERROR)
         |             ~~~~~~  ^
   drivers/watchdog/da9052_wdt.c:178:14: error: no member named 'fault_log' in 'struct da9052'
     178 |         if (da9052->fault_log & DA9052_FAULTLOG_TEMPOVER)
         |             ~~~~~~  ^
   drivers/watchdog/da9052_wdt.c:180:14: error: no member named 'fault_log' in 'struct da9052'
     180 |         if (da9052->fault_log & DA9052_FAULTLOG_VDDFAULT)
         |             ~~~~~~  ^
   3 errors generated.


vim +176 drivers/watchdog/da9052_wdt.c

   153	
   154	
   155	static int da9052_wdt_probe(struct platform_device *pdev)
   156	{
   157		struct device *dev = &pdev->dev;
   158		struct da9052 *da9052 = dev_get_drvdata(dev->parent);
   159		struct da9052_wdt_data *driver_data;
   160		struct watchdog_device *da9052_wdt;
   161		int ret;
   162	
   163		driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
   164		if (!driver_data)
   165			return -ENOMEM;
   166		driver_data->da9052 = da9052;
   167	
   168		da9052_wdt = &driver_data->wdt;
   169	
   170		da9052_wdt->timeout = DA9052_DEF_TIMEOUT;
   171		da9052_wdt->info = &da9052_wdt_info;
   172		da9052_wdt->ops = &da9052_wdt_ops;
   173		da9052_wdt->parent = dev;
   174		watchdog_set_drvdata(da9052_wdt, driver_data);
   175	
 > 176		if (da9052->fault_log & DA9052_FAULTLOG_TWDERROR)
   177			da9052_wdt->bootstatus |= WDIOF_CARDRESET;
   178		if (da9052->fault_log & DA9052_FAULTLOG_TEMPOVER)
   179			da9052_wdt->bootstatus |= WDIOF_OVERHEAT;
   180		if (da9052->fault_log & DA9052_FAULTLOG_VDDFAULT)
   181			da9052_wdt->bootstatus |= WDIOF_POWERUNDER;
   182	
   183		ret = da9052_reg_update(da9052, DA9052_CONTROL_D_REG,
   184					DA9052_CONTROLD_TWDSCALE, 0);
   185		if (ret < 0) {
   186			dev_err(dev, "Failed to disable watchdog bits, %d\n", ret);
   187			return ret;
   188		}
   189	
   190		return devm_watchdog_register_device(dev, &driver_data->wdt);
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
