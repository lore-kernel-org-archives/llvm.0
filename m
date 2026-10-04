Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E000945039;
	Sun,  4 Oct 2026 20:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791144094; cv=none; b=oN/TRahPu01z4slrZwaMgHf8CSLYhNxxYhJVsDeJhTV00lQIb3VXIBzNyExF4CEAs1qBTtWloYrzNsDAaiqOubddOk7klyttsEEo6WmlnnDADEaYZmqTHOkL8i7zo31fnbMv8eNVLjtgAlbF6QvnPO0eMD19uhEOpeaeFrMVYKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791144094; c=relaxed/simple;
	bh=Q4X3Jjgh4krQfcazjeOu82Hzsl3dKQUFVs+l8oEPlK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhSHtrVW/jpYnmTlNc7cB9nf5w/fbLsouq8AQm7lDZBu52lGbnM9E7+vV/z66LU9N/0wKm3eI0qzRXBhTGDEqEfHp6eQJCnfqt40gkfYY1pQBnh4U69MjPslOwsQtJXy6Jkzb+ScLb8L6zkUM3eXNDwFsfHvjtcCyjkLgmYKkO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IyF56Lur; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IyF56Lur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791144093; x=1822680093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q4X3Jjgh4krQfcazjeOu82Hzsl3dKQUFVs+l8oEPlK8=;
  b=IyF56LuraRnZm8bkRl3fjXhE1TlOAO6YW/yBBl79HrDU+c9yXKgKBCFr
   g45hzwBVrtZ6vGimk1tYd+I/JwYOlCXB9SJzu/cOvYUIe5GIKwfDGkVcJ
   rmaGNqGKhFCYxe+diKC8NS0UTURCfWvZ8/bsZr4FhUeCeIopDO1oIVEfw
   H0cYXv019rsS12IyVgdwLUKBwXZbqUSyC3DavIM9KVxpg61lMZ5NpED72
   3FwDsPCQqsZ6IAP6Qep26LmKIhdF4ftLx2OUp4ncfPEd8k6pEU9xY5yLd
   uQn8OdjB1eVjbHHpwAri0ZFC9TnaIwrZ+Z9YTmMgb8tVxSmkDCZTil5kn
   g==;
X-CSE-ConnectionGUID: mktn3XwjRjeu5kwh3iV/hw==
X-CSE-MsgGUID: lRITLrkIS+mucCJc9q8JTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90774657"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="90774657"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 13:01:33 -0700
X-CSE-ConnectionGUID: xQ1YUue8RHa9XWVDXuQSvA==
X-CSE-MsgGUID: 5R+5zhG+Qge7t8F/Bnzk1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="279935178"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Oct 2026 13:01:31 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDSOm-00000000V29-11Lx;
	Sun, 04 Oct 2026 20:01:28 +0000
Date: Mon, 5 Oct 2026 04:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Subject: Re: [PATCH 2/2] bus: add Altera timeout bridge driver
Message-ID: <202610050325.ZOPvf8XR-lkp@intel.com>
References: <20261003-feature-timeout-ip-v1-2-8837c311d571@bruker.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003-feature-timeout-ip-v1-2-8837c311d571@bruker.com>

Hi Vyacheslav,

kernel test robot noticed the following build errors:

[auto build test ERROR on a74306e2e676f9775457366fc047a660fbf02f26]

url:    https://github.com/intel-lab-lkp/linux/commits/Vyacheslav-Yurkov-via-B4-Relay/dt-bindings-bus-Add-binding-for-Altera-AXI-Timeout-Bridge/20261003-201919
base:   a74306e2e676f9775457366fc047a660fbf02f26
patch link:    https://lore.kernel.org/r/20261003-feature-timeout-ip-v1-2-8837c311d571%40bruker.com
patch subject: [PATCH 2/2] bus: add Altera timeout bridge driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261005/202610050325.ZOPvf8XR-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610050325.ZOPvf8XR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610050325.ZOPvf8XR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/bus/altera-timeout-bridge.c:60:11: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      60 |         result = readl(driver_data->bridge_registers + offset);
         |                  ^
>> drivers/bus/altera-timeout-bridge.c:69:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      69 |         writel(value, driver_data->bridge_registers + offset);
         |         ^
>> drivers/bus/altera-timeout-bridge.c:187:38: warning: cast from 'void (*)(struct kernfs_node *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
     187 |         ret = devm_add_action_or_reset(dev, (void (*)(void *))sysfs_put, driver_data->irq_node);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device/devres.h:181:34: note: expanded from macro 'devm_add_action_or_reset'
     181 |         __devm_add_action_or_reset(dev, action, data, #action)
         |                                         ^~~~~~
   1 warning and 2 errors generated.


vim +/readl +60 drivers/bus/altera-timeout-bridge.c

    53	
    54	static u32
    55	bridge_reg_read(struct altera_timeout_bridge_data *driver_data,
    56			u32 offset)
    57	{
    58		u32 result;
    59	
  > 60		result = readl(driver_data->bridge_registers + offset);
    61	
    62		return result;
    63	}
    64	
    65	static void bridge_reg_write(
    66		struct altera_timeout_bridge_data *driver_data,
    67		int offset, u32 value)
    68	{
  > 69		writel(value, driver_data->bridge_registers + offset);
    70	}
    71	
    72	static irqreturn_t altera_timeout_bridge_isr(int irq, void *data)
    73	{
    74		struct altera_timeout_bridge_data *driver_data = data;
    75		u32 timed_out_address;
    76		resource_size_t effective_base_address;
    77		resource_size_t effective_timed_out_address;
    78	
    79		atomic_inc(&driver_data->irq_count);
    80	
    81		// Read and print the timed-out address (encoded in the lower nibble
    82		// 0x8..0xF according to AXI Timeout Bridge IP (CSR Interrupt Status Information)
    83		timed_out_address = bridge_reg_read(
    84			driver_data,
    85			ALTERA_TIMEOUT_BRIDGE_REG_TIMED_OUT_ADDRESS);
    86		effective_base_address = driver_data->bridge_register_resource->start;
    87		effective_timed_out_address = effective_base_address + timed_out_address;
    88		pr_err("%s: timeout at address 0x%llx\n",
    89			__func__, (unsigned long long)effective_timed_out_address);
    90	
    91		// Reset IRQ status in the bridge
    92		bridge_reg_write(
    93			driver_data,
    94			ALTERA_TIMEOUT_BRIDGE_REG_IRQ_STATUS_RESET,
    95			0x1);
    96		// notify the user space
    97		sysfs_notify_dirent(driver_data->irq_node);
    98	
    99		return IRQ_HANDLED;
   100	}
   101	static int altera_timeout_bridge_probe(struct platform_device *pdev)
   102	{
   103		struct device *dev = &pdev->dev;
   104		const struct of_device_id *match;
   105		const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
   106		struct device_node *np = dev->of_node;
   107		struct altera_timeout_bridge_data *driver_data;
   108		int ret = 0;
   109		int irq = -1;
   110	
   111		/*
   112		 * Allow user to use driver_override to bind this driver to a
   113		 * transparent bus device which has a different compatible string
   114		 * that's not listed in simple_pm_bus_of_match. We don't want to do any
   115		 * of the simple-pm-bus tasks for these devices, so return early.
   116		 */
   117		if (device_has_driver_override(&pdev->dev))
   118			return 0;
   119	
   120		match = of_match_device(dev->driver->of_match_table, dev);
   121	
   122		/* Use a fall back logic like in simple-pm-bus */
   123		if (match && match->data) {
   124			if (of_property_match_string(np, "compatible", match->compatible) == 0)
   125				return 0;
   126			else
   127				return -ENODEV;
   128		}
   129	
   130		driver_data =
   131			devm_kzalloc(&pdev->dev, sizeof(*driver_data), GFP_KERNEL);
   132		if (!driver_data) {
   133			dev_err(&pdev->dev,
   134				"%s: kzalloc failed: no memory for the driver's data, returning ENOMEM\n",
   135				__func__);
   136			return -ENOMEM;
   137		}
   138	
   139		driver_data->dev = dev;
   140		platform_set_drvdata(pdev, driver_data);
   141	
   142		driver_data->bridge_register_resource =
   143			platform_get_resource(pdev, IORESOURCE_MEM, 0);
   144		if (!driver_data->bridge_register_resource) {
   145			dev_err(dev,
   146				"%s: missing required reg binding\n",
   147				__func__);
   148			return -ENOENT;
   149		}
   150		driver_data->bridge_registers =
   151			devm_ioremap_resource(dev,
   152					     driver_data->bridge_register_resource);
   153		if (IS_ERR(driver_data->bridge_registers)) {
   154			dev_err(dev,
   155				"%s: ioremap_resource failed for bridge-status MMIO, returning PTR_ERR(%ld)\n",
   156				__func__, PTR_ERR(driver_data->bridge_registers));
   157			return PTR_ERR(driver_data->bridge_registers);
   158		}
   159	
   160		irq = platform_get_irq(pdev, 0);
   161		if (irq < 0) {
   162			dev_err(dev,
   163				"%s: platform_get_irq failed: %d\n", __func__, irq);
   164			return irq;
   165		}
   166	
   167		ret = devm_request_irq(dev, irq,
   168				       altera_timeout_bridge_isr,
   169				       0,
   170				       dev_name(dev),
   171				       driver_data);
   172		if (ret) {
   173			dev_err(dev,
   174				"%s: devm_request_irq failed for IRQ %d: %d\n",
   175				__func__, irq, ret);
   176			return ret;
   177		}
   178	
   179		ret = devm_device_add_group(dev, &altera_timeout_bridge_sysfs_group);
   180		if (ret)
   181			return ret;
   182	
   183		driver_data->irq_node = sysfs_get_dirent(dev->kobj.sd, "timeout_irq");
   184		if (!driver_data->irq_node)
   185			return -ENOENT;
   186	
 > 187		ret = devm_add_action_or_reset(dev, (void (*)(void *))sysfs_put, driver_data->irq_node);
   188		if (ret)
   189			return ret;
   190	
   191		if (np)
   192			of_platform_populate(np, NULL, lookup, &pdev->dev);
   193	
   194		return 0;
   195	}
   196	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
