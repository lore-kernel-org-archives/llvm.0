Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5015282F1F;
	Wed, 23 Sep 2026 03:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134250; cv=none; b=sVJjlst31Mj0WVd8NVETfy6IyDuRIxY0znfXYV+m4ym5yiXL//wEzjSfWZeMaByZb0bERnDHt2vXVdSTHRHyGL7R3dXybtPXbu5zAbi7bG3cELTJt5VxFip1EZS3lBhfT5NOZSYRSkZCdSNs6RdUuaG8lxSFEBvs3fVuned6T24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134250; c=relaxed/simple;
	bh=8YGXz+Ldj4CxY6y8LAYlv1zGpynguK4DRVfR1UQR1/M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j4You2YzY3+DrM+E0T0FwEtiajjRLRNL53eSNQFVM+azKI6NUr+tswovRvl+8pkarc42VLfWsKxsrXT1YNPOCvDATPsSIFp5aPa5t7YoikRQfylKSz4zyibrod4CscaefA3/znjJ0kFuTbmH2ARf1TYVXR5lV29VjoXuj7c48KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETc7h8IW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETc7h8IW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790134248; x=1821670248;
  h=date:from:to:cc:subject:message-id;
  bh=8YGXz+Ldj4CxY6y8LAYlv1zGpynguK4DRVfR1UQR1/M=;
  b=ETc7h8IWNZDsCV4MGlSWAh9IoiOLqk3AuR9w4J50PnpfYNxiogzcofmY
   W5WLT762TeFDByqYOXgYD1uNyAr9KywipkCmE6rJQLwKqTffth3irWvcf
   EyTHtVN1IhUcRxscXzfEtfNfbFiVdbXvgX0QhSaN5X6avD7znr9YvTATv
   Y2zOg+whXdGDrqC2MEnoaE0erbvqbjF2UB+WyuFszG8itC1C7LK3NozbX
   nSfwJjInWjKk3AS2JjH4PvkFrBgW4zwB4NtZmNJMyqLwmwGcm0tXio8Wz
   xHeT8JJQUUHgHAVEoyZiCDPDiHYKa/g4ICkDztOAvsWiH9CNzzF2XkN46
   Q==;
X-CSE-ConnectionGUID: 3VuLzy8vQjeNCkui/Xk/xg==
X-CSE-MsgGUID: 3FhCMMJmTWm7ANGFZH2hlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="89712610"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="89712610"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 20:30:46 -0700
X-CSE-ConnectionGUID: QUZ2EJwbS0uvOvTYGbfhKA==
X-CSE-MsgGUID: GEO2KnVGR5SOEoH5vAxqBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="281495629"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 22 Sep 2026 20:30:44 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Dgv-000000000Rz-2jyZ;
	Wed, 23 Sep 2026 03:30:41 +0000
Date: Wed, 23 Sep 2026 05:29:45 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Young <sean@mess.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next 1/20]
 drivers/media/rc/rc-main.c:1984:33: error: no member named 'lirc_dev' in
 'struct rc_dev'
Message-ID: <202609230511.Em5Osw74-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.linuxtv.org/media-ci/media-pending.git next
head:   05d9c515cf13056875abbf73adb4a19dd7ba32eb
commit: 37efd09ba2c62e46e3a3a793025c186f8cd1a417 [1/20] media: rc: Ensure registered is cleared in error path
config: s390-randconfig-2001-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230511.Em5Osw74-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 4b99afb361a8cfd45fc17aebc637688661e9e472)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230511.Em5Osw74-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609230511.Em5Osw74-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/rc/rc-main.c:1984:33: error: no member named 'lirc_dev' in 'struct rc_dev'
    1984 |         if (device_is_registered(&dev->lirc_dev))
         |                                   ~~~  ^
   1 error generated.


vim +1984 drivers/media/rc/rc-main.c

  1901	
  1902	int rc_register_device(struct rc_dev *dev)
  1903	{
  1904		const char *path;
  1905		int attr = 0;
  1906		int minor;
  1907		int rc;
  1908	
  1909		if (!dev)
  1910			return -EINVAL;
  1911	
  1912		minor = ida_alloc_max(&rc_ida, RC_DEV_MAX - 1, GFP_KERNEL);
  1913		if (minor < 0)
  1914			return minor;
  1915	
  1916		dev->minor = minor;
  1917		dev_set_name(&dev->dev, "rc%u", dev->minor);
  1918		dev_set_drvdata(&dev->dev, dev);
  1919	
  1920		dev->dev.groups = dev->sysfs_groups;
  1921		if (dev->driver_type == RC_DRIVER_SCANCODE && !dev->change_protocol)
  1922			dev->sysfs_groups[attr++] = &rc_dev_ro_protocol_attr_grp;
  1923		else if (dev->driver_type != RC_DRIVER_IR_RAW_TX)
  1924			dev->sysfs_groups[attr++] = &rc_dev_rw_protocol_attr_grp;
  1925		if (dev->s_filter)
  1926			dev->sysfs_groups[attr++] = &rc_dev_filter_attr_grp;
  1927		if (dev->s_wakeup_filter)
  1928			dev->sysfs_groups[attr++] = &rc_dev_wakeup_filter_attr_grp;
  1929		dev->sysfs_groups[attr++] = NULL;
  1930	
  1931		if (dev->driver_type != RC_DRIVER_IR_RAW_TX) {
  1932			rc = rc_prepare_rx_device(dev);
  1933			if (rc)
  1934				goto out_raw;
  1935		}
  1936	
  1937		scoped_guard(mutex, &dev->lock)
  1938			dev->registered = true;
  1939	
  1940		rc = device_add(&dev->dev);
  1941		if (rc)
  1942			goto out_rx_free;
  1943	
  1944		path = kobject_get_path(&dev->dev.kobj, GFP_KERNEL);
  1945		dev_info(&dev->dev, "%s as %s\n",
  1946			 dev->device_name ?: "Unspecified device", path ?: "N/A");
  1947		kfree(path);
  1948	
  1949		/*
  1950		 * once the input device is registered in rc_setup_rx_device,
  1951		 * userspace can open the input device and rc_open() will be called
  1952		 * as a result. This results in driver code being allowed to submit
  1953		 * keycodes with rc_keydown, so lirc must be registered first.
  1954		 */
  1955		if (dev->allowed_protocols != RC_PROTO_BIT_CEC) {
  1956			rc = lirc_register(dev);
  1957			if (rc < 0)
  1958				goto out_lirc;
  1959		}
  1960	
  1961		if (dev->driver_type != RC_DRIVER_IR_RAW_TX) {
  1962			rc = rc_setup_rx_device(dev);
  1963			if (rc)
  1964				goto out_lirc;
  1965		}
  1966	
  1967		if (dev->driver_type == RC_DRIVER_IR_RAW) {
  1968			rc = ir_raw_event_register(dev);
  1969			if (rc < 0)
  1970				goto out_rx;
  1971		}
  1972	
  1973		dev_dbg(&dev->dev, "Registered rc%u (driver: %s)\n", dev->minor,
  1974			dev->driver_name ? dev->driver_name : "unknown");
  1975	
  1976		return 0;
  1977	
  1978	out_rx:
  1979		rc_free_rx_device(dev);
  1980	out_lirc:
  1981		scoped_guard(mutex, &dev->lock)
  1982			dev->registered = false;
  1983	
> 1984		if (device_is_registered(&dev->lirc_dev))
  1985			lirc_unregister(dev);
  1986		device_del(&dev->dev);
  1987		/* registered already cleared above */
  1988		goto out_free_table;
  1989	out_rx_free:
  1990		scoped_guard(mutex, &dev->lock)
  1991			dev->registered = false;
  1992	out_free_table:
  1993		ir_free_table(&dev->rc_map);
  1994	out_raw:
  1995		ida_free(&rc_ida, minor);
  1996		return rc;
  1997	}
  1998	EXPORT_SYMBOL_GPL(rc_register_device);
  1999	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
