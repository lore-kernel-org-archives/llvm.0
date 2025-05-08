Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283D728BA98;
	Thu,  8 May 2025 20:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746735528; cv=none; b=P/r3UrCzwFaWmEZUxdtASGtCuPYAYB9jWhf1e50U3Iw0+9ojwQIa3BwBpFMgI+3bpFa+JeLi8eO1OK8a7U3yBohx3SOWdK2Qe9Yq0EJAQpa3GiUaHKoGch8+WGdOv7Lv3ObW0KTAvdgiY+02q50UhckCoVz+L+ANktsi2M5WKIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746735528; c=relaxed/simple;
	bh=xVjgERXFr455eqN1kELoTptEgV0dIKsPs5QgBgnBcsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rPEWKEO2efoqYQ4ok2/IZG87Lpphu4HeojVbzGyJ+nXMhhKwHrkrBeb8oWAdDx2my8V9JaSaRtRxDulmvBd6s1z/HG1iAH/Q1QDvLx7DBkA38v0WiCMYDFI2vzccRGTKjnXynYDB4m1qrk7WI0WhEb6mjAyN+v/JAULyS8Fv0RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jR+QAX3m; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jR+QAX3m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746735526; x=1778271526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xVjgERXFr455eqN1kELoTptEgV0dIKsPs5QgBgnBcsM=;
  b=jR+QAX3m3XlMqY/wjmTsZBe3tp6OOmRwPjvYcsGLLUHBWR8r6I1o9Z+m
   CPloggAm68NQgPnELJeIM316ojtcHtpowr2DhVr4MKohi8IleDX3k67A+
   bY9KcpGfenKrNmSYWP0boim10+A+r7SyItMGUgtjFmvTs3ljNvd+yzZYp
   9/X3jGL/B9rhNFxJI7aSeF5tu0Rlz530FHQzEojYkGfuu75Zk/GTMay2H
   UzFur0EcYBtHsoPKudXvjCDK7rLkSDJDGaGPU+9W321IdXjw/gr5BXsBd
   3IURz2GRJ4nqWTmJD1DB1YEFO6aRgDcbkCUFwoeOq5o+aNKRKa32bn+BV
   A==;
X-CSE-ConnectionGUID: Bn7f0qjIRD2ASPZZ6A5YfQ==
X-CSE-MsgGUID: 8uKxzqAGSeasOFrJuIO0TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48623609"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="48623609"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 13:18:43 -0700
X-CSE-ConnectionGUID: wFsA8NrLQ/uakyvbps39bw==
X-CSE-MsgGUID: Trp/hE8tRjK9vULW9M6j8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="159699408"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 May 2025 13:18:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD7hX-000BLN-1y;
	Thu, 08 May 2025 20:18:39 +0000
Date: Fri, 9 May 2025 04:18:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Luke D. Jones" <luke@ljones.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 74/89]
 drivers/platform/x86/asus-wmi.c:5028:35: error: variable has incomplete type
 'struct acpi_s2idle_dev_ops'
Message-ID: <202505090418.DaeaXe4i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   83579675331059689e2869bf752ca9e17fadbd82
commit: feea7bd6b02d43a794e3f065650d89cf8d8e8e59 [74/89] platform/x86: asus-wmi: Refactor Ally suspend/resume
config: x86_64-buildonly-randconfig-004-20250509 (https://download.01.org/0day-ci/archive/20250509/202505090418.DaeaXe4i-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090418.DaeaXe4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090418.DaeaXe4i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/asus-wmi.c:5028:35: error: variable has incomplete type 'struct acpi_s2idle_dev_ops'
    5028 | static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
         |                                   ^
   drivers/platform/x86/asus-wmi.c:5028:15: note: forward declaration of 'struct acpi_s2idle_dev_ops'
    5028 | static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
         |               ^
>> drivers/platform/x86/asus-wmi.c:5063:8: error: call to undeclared function 'acpi_register_lps0_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5063 |         ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
         |               ^
>> drivers/platform/x86/asus-wmi.c:5099:2: error: call to undeclared function 'acpi_unregister_lps0_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5099 |         acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
         |         ^
   3 errors generated.


vim +5028 drivers/platform/x86/asus-wmi.c

  5026	
  5027	/* Use only for Ally devices due to the wake_on_ac */
> 5028	static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
  5029		.restore = asus_ally_s2idle_restore,
  5030	};
  5031	
  5032	static const struct dev_pm_ops asus_pm_ops = {
  5033		.thaw = asus_hotk_thaw,
  5034		.restore = asus_hotk_restore,
  5035		.resume = asus_hotk_resume,
  5036		.prepare = asus_hotk_prepare,
  5037	};
  5038	
  5039	/* Registration ***************************************************************/
  5040	
  5041	static int asus_wmi_probe(struct platform_device *pdev)
  5042	{
  5043		struct platform_driver *pdrv = to_platform_driver(pdev->dev.driver);
  5044		struct asus_wmi_driver *wdrv = to_asus_wmi_driver(pdrv);
  5045		int ret;
  5046	
  5047		if (!wmi_has_guid(ASUS_WMI_MGMT_GUID)) {
  5048			pr_warn("ASUS Management GUID not found\n");
  5049			return -ENODEV;
  5050		}
  5051	
  5052		if (wdrv->event_guid && !wmi_has_guid(wdrv->event_guid)) {
  5053			pr_warn("ASUS Event GUID not found\n");
  5054			return -ENODEV;
  5055		}
  5056	
  5057		if (wdrv->probe) {
  5058			ret = wdrv->probe(pdev);
  5059			if (ret)
  5060				return ret;
  5061		}
  5062	
> 5063		ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
  5064		if (ret)
  5065			pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
  5066	
  5067		return asus_wmi_add(pdev);
  5068	}
  5069	
  5070	static bool used;
  5071	
  5072	int __init_or_module asus_wmi_register_driver(struct asus_wmi_driver *driver)
  5073	{
  5074		struct platform_driver *platform_driver;
  5075		struct platform_device *platform_device;
  5076	
  5077		if (used)
  5078			return -EBUSY;
  5079	
  5080		platform_driver = &driver->platform_driver;
  5081		platform_driver->remove = asus_wmi_remove;
  5082		platform_driver->driver.owner = driver->owner;
  5083		platform_driver->driver.name = driver->name;
  5084		platform_driver->driver.pm = &asus_pm_ops;
  5085	
  5086		platform_device = platform_create_bundle(platform_driver,
  5087							 asus_wmi_probe,
  5088							 NULL, 0, NULL, 0);
  5089		if (IS_ERR(platform_device))
  5090			return PTR_ERR(platform_device);
  5091	
  5092		used = true;
  5093		return 0;
  5094	}
  5095	EXPORT_SYMBOL_GPL(asus_wmi_register_driver);
  5096	
  5097	void asus_wmi_unregister_driver(struct asus_wmi_driver *driver)
  5098	{
> 5099		acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
  5100		platform_device_unregister(driver->platform_device);
  5101		platform_driver_unregister(&driver->platform_driver);
  5102		used = false;
  5103	}
  5104	EXPORT_SYMBOL_GPL(asus_wmi_unregister_driver);
  5105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
