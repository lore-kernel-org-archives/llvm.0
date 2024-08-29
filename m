Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35829158DB1;
	Thu, 29 Aug 2024 11:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724930059; cv=none; b=f8q+J/jJV3WsyPBizw7AiGCRF2LYE6BET1TVg7iuFJee9pJZ76w/0d0JJZiX1jL98OlY3RDNWJBJYA3gLpzCwPeZyhypklZhTBun/cXaR7ixGhb/pAwmS3H+k5KAQ5XC0bKLHg8ugRAGmRcVycire3Zkw+2veA+2j5zRRdkWYRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724930059; c=relaxed/simple;
	bh=uILr/qy0RHLOmtShzEktNYq+ufmWtqwIPrSE9I/RCYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=magX0JrjrOT9Of28yIswbPMYV9qAsEnzXNM6UULyHddaHo3eQNFrMDf9bCn26jC5cUip60eqgChV5tweKgr1YAWjsfYfAQvn+XlYYAlvAip/PHFgQgiC8vUMZKLwYiOouMDTP7KiVkRxyyTYMYFh0T5oLDJoJIGzWGTytj/Vls8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHdctZB9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHdctZB9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724930057; x=1756466057;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uILr/qy0RHLOmtShzEktNYq+ufmWtqwIPrSE9I/RCYY=;
  b=GHdctZB9GKRSCM4KT5/QfV6OzVU614hmEVcf0V9nLu9fpH31nFWqhG6w
   zmbkNqVw/6Oxf1Wny3dzt0RhBNX/fzkTRqW5hCbxM7UInfEIxo3GY4L5c
   JQVteGrCT699PxrSGpWF1R+BRwr0B2F4JBhFOW5ae9Ez3EemQLIO5CrT4
   p6yAmIdkPJmZIs50+PyoRlGd9JkwB7TjFA023mmpQGObmfhpATAdp8eu9
   Wf/EK3Z2APaKUorJ/eF1tvEUxVbYTEE10DL0jcUjM6SamxC1J9gtPn2Wp
   GgrbWwUhJcnFItySk6VtGYzdRPn1ctrl3VB5ilD6odTabkS3bOaUxsqMP
   g==;
X-CSE-ConnectionGUID: 7eJTPMMVT9KSvCgYkbi+KQ==
X-CSE-MsgGUID: dwiNaOuUSYqZZDNQs+o61A==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="41017013"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="41017013"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 04:14:17 -0700
X-CSE-ConnectionGUID: 5CorXLLnS2qLq6VkNT0jfg==
X-CSE-MsgGUID: NumjDV7VSZaqHUIhOQxMzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="67920023"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Aug 2024 04:14:15 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjd6T-0000Bq-0n;
	Thu, 29 Aug 2024 11:14:13 +0000
Date: Thu, 29 Aug 2024 19:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] thermal/of: Use thermal_zone_device_param
Message-ID: <202408291826.CqNYP99d-lkp@intel.com>
References: <20240823154245.1553458-2-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823154245.1553458-2-daniel.lezcano@linaro.org>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/thermal]
[also build test ERROR on linus/master v6.11-rc5 next-20240828]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Lezcano/thermal-of-Use-thermal_zone_device_param/20240826-151207
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20240823154245.1553458-2-daniel.lezcano%40linaro.org
patch subject: [RFC PATCH 2/2] thermal/of: Use thermal_zone_device_param
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240829/202408291826.CqNYP99d-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408291826.CqNYP99d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408291826.CqNYP99d-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/thermal/thermal_of.c:15:
   In file included from include/linux/thermal.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thermal/thermal_of.c:492:17: error: use of undeclared identifier 'trips'
     492 |                 ret = PTR_ERR(trips);
         |                               ^
   4 warnings and 1 error generated.


vim +/trips +492 drivers/thermal/thermal_of.c

3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  451  
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  452  /**
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  453   * thermal_of_zone_register - Register a thermal zone with device node
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  454   * sensor
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  455   *
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  456   * The thermal_of_zone_register() parses a device tree given a device
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  457   * node sensor and identifier. It searches for the thermal zone
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  458   * associated to the couple sensor/id and retrieves all the thermal
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  459   * zone properties and registers new thermal zone with those
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  460   * properties.
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  461   *
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  462   * @sensor: A device node pointer corresponding to the sensor in the device tree
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  463   * @id: An integer as sensor identifier
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  464   * @data: A private data to be stored in the thermal zone dedicated private area
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  465   * @ops: A set of thermal sensor ops
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  466   *
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  467   * Return: a valid thermal zone structure pointer on success.
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  468   *	- EINVAL: if the device tree thermal description is malformed
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  469   *	- ENOMEM: if one structure can not be allocated
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  470   *	- Other negative errors are returned by the underlying called functions
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  471   */
ac614a9b4c35bf Daniel Lezcano      2023-04-04  472  static struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  473  							    const struct thermal_zone_device_ops *ops)
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  474  {
698a1eb1f75eb6 Rafael J. Wysocki   2024-02-22  475  	struct thermal_zone_device_ops of_ops = *ops;
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  476  	struct thermal_zone_device *tz;
5313e239ab6b58 Daniel Lezcano      2024-08-23  477  	struct thermal_zone_params tzp = { .devdata = data, .ops = &of_ops };
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  478  	struct device_node *np;
62e79e38b257a5 Fabio Estevam       2023-11-29  479  	const char *action;
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  480  	int ret;
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  481  
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  482  	np = of_thermal_zone_find(sensor, id);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  483  	if (IS_ERR(np)) {
9d6792df07367a Daniel Lezcano      2022-08-09  484  		if (PTR_ERR(np) != -ENODEV)
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  485  			pr_err("Failed to find thermal zone for %pOFn id=%d\n", sensor, id);
698a1eb1f75eb6 Rafael J. Wysocki   2024-02-22  486  		return ERR_CAST(np);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  487  	}
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  488  
5313e239ab6b58 Daniel Lezcano      2024-08-23  489  	tzp.trips = thermal_of_trips_init(np, &tzp.num_trips);
5313e239ab6b58 Daniel Lezcano      2024-08-23  490  	if (IS_ERR(tzp.trips)) {
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  491  		pr_err("Failed to find trip points for %pOFn id=%d\n", sensor, id);
662b52b761bfe0 Krzysztof Kozlowski 2024-08-14 @492  		ret = PTR_ERR(trips);
662b52b761bfe0 Krzysztof Kozlowski 2024-08-14  493  		goto out_of_node_put;
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  494  	}
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  495  
5313e239ab6b58 Daniel Lezcano      2024-08-23  496  	ret = thermal_of_monitor_init(np, &tzp.polling_delay, &tzp.passive_delay);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  497  	if (ret) {
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  498  		pr_err("Failed to initialize monitoring delays from %pOFn\n", np);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  499  		goto out_kfree_trips;
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  500  	}
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  501  
ac4436a5b20e0e Ahmad Fatoum        2023-07-08  502  	thermal_of_parameters_init(np, &tzp);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  503  
698a1eb1f75eb6 Rafael J. Wysocki   2024-02-22  504  	of_ops.bind = thermal_of_bind;
698a1eb1f75eb6 Rafael J. Wysocki   2024-02-22  505  	of_ops.unbind = thermal_of_unbind;
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  506  
62e79e38b257a5 Fabio Estevam       2023-11-29  507  	ret = of_property_read_string(np, "critical-action", &action);
62e79e38b257a5 Fabio Estevam       2023-11-29  508  	if (!ret)
698a1eb1f75eb6 Rafael J. Wysocki   2024-02-22  509  		if (!of_ops.critical && !strcasecmp(action, "reboot"))
698a1eb1f75eb6 Rafael J. Wysocki   2024-02-22  510  			of_ops.critical = thermal_zone_device_critical_reboot;
62e79e38b257a5 Fabio Estevam       2023-11-29  511  
5313e239ab6b58 Daniel Lezcano      2024-08-23  512  	tz = thermal_zone_device_register(np->name, &tzp);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  513  	if (IS_ERR(tz)) {
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  514  		ret = PTR_ERR(tz);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  515  		pr_err("Failed to register thermal zone %pOFn: %d\n", np, ret);
ac4436a5b20e0e Ahmad Fatoum        2023-07-08  516  		goto out_kfree_trips;
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  517  	}
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  518  
662b52b761bfe0 Krzysztof Kozlowski 2024-08-14  519  	of_node_put(np);
5313e239ab6b58 Daniel Lezcano      2024-08-23  520  	kfree(tzp.trips);
9b0a62758665e4 Rafael J. Wysocki   2024-02-22  521  
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  522  	ret = thermal_zone_device_enable(tz);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  523  	if (ret) {
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  524  		pr_err("Failed to enabled thermal zone '%s', id=%d: %d\n",
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  525  		       tz->type, tz->id, ret);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  526  		thermal_of_zone_unregister(tz);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  527  		return ERR_PTR(ret);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  528  	}
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  529  
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  530  	return tz;
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  531  
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  532  out_kfree_trips:
5313e239ab6b58 Daniel Lezcano      2024-08-23  533  	kfree(tzp.trips);
662b52b761bfe0 Krzysztof Kozlowski 2024-08-14  534  out_of_node_put:
662b52b761bfe0 Krzysztof Kozlowski 2024-08-14  535  	of_node_put(np);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  536  
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  537  	return ERR_PTR(ret);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  538  }
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  539  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
