Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AE8285060;
	Fri, 10 Oct 2025 10:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760091566; cv=none; b=BfiRR2V4WEfKR4umWm6zHPzYpaw1LcwAdu2SRdxtkhH3DKIp7k1XdsyP0gi7NL8aKsTF1wiQVQfKjUQ9S7LtTAqWgsKhS0bDJmmwXwffwG23XdZu+8rwTdGKkgRqZgKgw1G7CWMI5vPefc0hV7kpGLge6X20slxt5scbo/l9BlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760091566; c=relaxed/simple;
	bh=wQIlBG9sQs89jP/0wVDIgDa58MqypRn8Qhj4FpYx1Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crglVC8h8ZhsKb7lUKgNibseR6s11kwfGs9v49Q2jNdRPkHcv7npFxlpxeGByHrn2xP9KkiNkYeXe85QC9GpkWbJMKVC1yX+AUnMduUmOCAR+zsydXCZH01/dAAff0raIVvem89jmssFJ2d/CfhVjRmTqIzhwJzYKAYEpzh8kx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8fmp9Bb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8fmp9Bb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760091564; x=1791627564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wQIlBG9sQs89jP/0wVDIgDa58MqypRn8Qhj4FpYx1Jc=;
  b=j8fmp9BbfEIWMW7D1Y/e6PWyIyL+vUao2GreHnv61rIdbOJVZC9ApbMG
   Tdl/Cpmbk5yW0NRTYlm3TNZeIWE4xEcsQHRkqYdLqaEBVyrz99eMQMF3e
   Prp5teOETmRLuo1ElBs7PF2iwkxGKRmdd8A7ZODpCXtifBdyvaI6lW9K3
   DU+/vXNHzMJkxwsNZ++d45LD9GY1y3Kd4p/cwEUzBURGGtQiw/DHiwClG
   jEPMSBLJS6ZI7ucCykYAm6qlNfuC9kQ/rPbi9jSy4qQPu3vMsM5nsOBuL
   Ya3/JYpAw06bpYkwkH36tnxcRQOZfUq1i5PzxgT320qsw8IZixUd+3mT/
   w==;
X-CSE-ConnectionGUID: mILDCM0TQ5islj8WIwkjQw==
X-CSE-MsgGUID: 0Cll6UcYQHeuN67CNMfMMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73411857"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="73411857"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 03:19:22 -0700
X-CSE-ConnectionGUID: TJpItxSwQN2cElvRuabkaA==
X-CSE-MsgGUID: Uj8D8BTcQmytnIyQvo6ZAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="184977482"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Oct 2025 03:19:20 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7ADV-0002Xr-1d;
	Fri, 10 Oct 2025 10:19:17 +0000
Date: Fri, 10 Oct 2025 18:18:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kaushlendra Kumar <kaushlendra.kumar@intel.com>, rafael@kernel.org,
	lenb@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: Re: [PATCH] ACPI: video: Replace backlight_device_register() with
 devm variant
Message-ID: <202510101817.Xkl2fc9D-lkp@intel.com>
References: <20251007030730.3192901-1-kaushlendra.kumar@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007030730.3192901-1-kaushlendra.kumar@intel.com>

Hi Kaushlendra,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master v6.17 next-20251009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kaushlendra-Kumar/ACPI-video-Replace-backlight_device_register-with-devm-variant/20251010-133230
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20251007030730.3192901-1-kaushlendra.kumar%40intel.com
patch subject: [PATCH] ACPI: video: Replace backlight_device_register() with devm variant
config: i386-buildonly-randconfig-002-20251010 (https://download.01.org/0day-ci/archive/20251010/202510101817.Xkl2fc9D-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101817.Xkl2fc9D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101817.Xkl2fc9D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/acpi_video.c:1732:6: warning: variable 'pdev' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1732 |         if (ACPI_SUCCESS(acpi_get_parent(device->dev->handle, &acpi_parent))) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/acpi/acexcep.h:57:41: note: expanded from macro 'ACPI_SUCCESS'
      57 | #define ACPI_SUCCESS(a)                 (!(a))
         |                                         ^~~~~~
   drivers/acpi/acpi_video.c:1744:54: note: uninitialized use occurs here
    1744 |         device->backlight = devm_backlight_device_register(&pdev->dev,
         |                                                             ^~~~
   drivers/acpi/acpi_video.c:1732:2: note: remove the 'if' if its condition is always true
    1732 |         if (ACPI_SUCCESS(acpi_get_parent(device->dev->handle, &acpi_parent))) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpi_video.c:1716:22: note: initialize the variable 'pdev' to silence this warning
    1716 |         struct pci_dev *pdev;
         |                             ^
         |                              = NULL
   1 warning generated.


vim +1732 drivers/acpi/acpi_video.c

c504f8cb68eb0d drivers/acpi/video.c      Zhang Rui         2009-12-30  1712  
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1713  static void acpi_video_dev_register_backlight(struct acpi_video_device *device)
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1714  {
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1715  	struct backlight_properties props;
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1716  	struct pci_dev *pdev;
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1717  	acpi_handle acpi_parent;
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1718  	struct device *parent = NULL;
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1719  	int result;
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1720  	static int count;
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1721  	char *name;
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1722  
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1723  	result = acpi_video_init_brightness(device);
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1724  	if (result)
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1725  		return;
654a182d8562d5 drivers/acpi/video.c      Hans de Goede     2015-06-09  1726  
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1727  	name = kasprintf(GFP_KERNEL, "acpi_video%d", count);
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1728  	if (!name)
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1729  		return;
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1730  	count++;
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1731  
ccd45faf497374 drivers/acpi/acpi_video.c Nikita Kiryushin  2023-11-09 @1732  	if (ACPI_SUCCESS(acpi_get_parent(device->dev->handle, &acpi_parent))) {
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1733  		pdev = acpi_get_pci_dev(acpi_parent);
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1734  		if (pdev) {
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1735  			parent = &pdev->dev;
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1736  			pci_dev_put(pdev);
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1737  		}
ccd45faf497374 drivers/acpi/acpi_video.c Nikita Kiryushin  2023-11-09  1738  	}
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1739  
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1740  	memset(&props, 0, sizeof(struct backlight_properties));
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1741  	props.type = BACKLIGHT_FIRMWARE;
d485ef43072e54 drivers/acpi/acpi_video.c Dmitry Frank      2017-04-19  1742  	props.max_brightness =
d485ef43072e54 drivers/acpi/acpi_video.c Dmitry Frank      2017-04-19  1743  		device->brightness->count - ACPI_VIDEO_FIRST_LEVEL - 1;
ef5cc540f10200 drivers/acpi/acpi_video.c Kaushlendra Kumar 2025-10-07  1744  	device->backlight = devm_backlight_device_register(&pdev->dev,
ef5cc540f10200 drivers/acpi/acpi_video.c Kaushlendra Kumar 2025-10-07  1745  							  name,
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1746  							  parent,
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1747  							  device,
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1748  							  &acpi_backlight_ops,
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1749  							  &props);
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1750  	kfree(name);
ef5cc540f10200 drivers/acpi/acpi_video.c Kaushlendra Kumar 2025-10-07  1751  	if (IS_ERR(device->backlight))
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1752  		return;
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1753  
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1754  	/*
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1755  	 * Save current brightness level in case we have to restore it
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1756  	 * before acpi_video_device_lcd_set_level() is called next time.
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1757  	 */
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1758  	device->backlight->props.brightness =
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1759  			acpi_video_get_brightness(device->backlight);
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1760  
172c48caed91a9 drivers/acpi/acpi_video.c Hans de Goede     2023-11-27  1761  	device->cooling_dev = thermal_cooling_device_register("LCD", device,
172c48caed91a9 drivers/acpi/acpi_video.c Hans de Goede     2023-11-27  1762  							      &video_cooling_ops);
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1763  	if (IS_ERR(device->cooling_dev)) {
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1764  		/*
99678ed73a50d2 drivers/acpi/video.c      Hans de Goede     2014-05-15  1765  		 * Set cooling_dev to NULL so we don't crash trying to free it.
99678ed73a50d2 drivers/acpi/video.c      Hans de Goede     2014-05-15  1766  		 * Also, why the hell we are returning early and not attempt to
99678ed73a50d2 drivers/acpi/video.c      Hans de Goede     2014-05-15  1767  		 * register video output if cooling device registration failed?
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1768  		 * -- dtor
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1769  		 */
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1770  		device->cooling_dev = NULL;
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1771  		return;
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1772  	}
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1773  
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1774  	dev_info(&device->dev->dev, "registered as cooling_device%d\n",
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1775  		 device->cooling_dev->id);
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1776  	result = sysfs_create_link(&device->dev->dev.kobj,
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1777  			&device->cooling_dev->device.kobj,
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1778  			"thermal_cooling");
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1779  	if (result)
2924d2f837788b drivers/acpi/acpi_video.c Rafael J. Wysocki 2021-02-03  1780  		pr_info("sysfs link creation failed\n");
2924d2f837788b drivers/acpi/acpi_video.c Rafael J. Wysocki 2021-02-03  1781  
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1782  	result = sysfs_create_link(&device->cooling_dev->device.kobj,
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1783  			&device->dev->dev.kobj, "device");
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1784  	if (result)
2924d2f837788b drivers/acpi/acpi_video.c Rafael J. Wysocki 2021-02-03  1785  		pr_info("Reverse sysfs link creation failed\n");
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1786  }
67b662e189f469 drivers/acpi/video.c      Aaron Lu          2013-10-11  1787  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
