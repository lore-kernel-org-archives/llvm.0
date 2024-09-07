Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFC91662FD;
	Sat,  7 Sep 2024 19:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725738274; cv=none; b=ptd/N7Sahb4MRw9x9Mh+KwH0u+ruY1S97EIUVv8ACRmTSAe6Ob8sUnMqWJ40joX9IESD/juFyeieGSXFOKBE4wkYxVUonzJ9Tip0mozBEUsIHg5IYUBb2Z5udgKQIBB8ut8cSNRu6Gc3S3tyALDoV0G5TdKU+g/kBri5BVWthwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725738274; c=relaxed/simple;
	bh=PeiWFAur7iqZvMzc921zD6QmQgstHWP5L9Bb+Xo/RNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uF5Gl7fdRhVPsrEXOF2TReCZh0CGdtGCGwp2jlfhwnrYLXvM7F5js18AUHYwX0SMvcgHBQ8FQ2iNZvSTw9NVh3uqKNmeJWsLUFnav35wUlS8mchR+ix0VE2upxeM55kg2p3KRshIa0UKEDLte1+EiRFjEifeSYQKn2InPaZTMmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEsofK/r; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEsofK/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725738273; x=1757274273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PeiWFAur7iqZvMzc921zD6QmQgstHWP5L9Bb+Xo/RNU=;
  b=aEsofK/r3Eqx1RRTPsjV2ptcOle7lf0eI00F6urgZ3QRXw10e110jvId
   fLYm+5g6+oQjWzobVwRWy2VLws0poOahKB/Q2P/WOXiX91IeJAfrSmfa5
   UkQ1Eu9nNM1N7A/jfaswsIemgHMliOcbYC706u1UA3DE1ubtYIniv97gX
   waJDWTW2K9B7k3g/xZlT9jNP64PudQ1Q8X6Bm4g95uXl+RODY+j7M2PbB
   3KrVRoF7MvWQn/R3+64BtBvNppanOaua1B0YWOjwn5vmwob8Q54Z7F7+K
   gX3L5aRMuQALCd/4wMp4h3HNmRpuSJgp/+q+yPV7BT/rXdYXVrUBp6/1F
   A==;
X-CSE-ConnectionGUID: OcPOy0fkS/ijpF1zpdIgkw==
X-CSE-MsgGUID: Y/oKoCsnRsypl8DjBEH6Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24667031"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="24667031"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 12:44:30 -0700
X-CSE-ConnectionGUID: C8g/lefTQ3yTvwaGxNQLqQ==
X-CSE-MsgGUID: Bx3Nz/wgRGeJR9VqGXDiEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="70377867"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Sep 2024 12:44:28 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn1MA-000Cuz-21;
	Sat, 07 Sep 2024 19:44:26 +0000
Date: Sun, 8 Sep 2024 03:44:15 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 7/9] power: supply: core: add locking around
 extension access
Message-ID: <202409080331.btTYCUQL-lkp@intel.com>
References: <20240904-power-supply-extensions-v3-7-62efeb93f8ec@weissschuh.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240904-power-supply-extensions-v3-7-62efeb93f8ec@weissschuh.net>

Hi Thomas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on d8abb73f584772eaafa95a447c90f1c02dba0dec]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/power-supply-core-rename-psy_has_property-to-psy_desc_has_property/20240905-032916
base:   d8abb73f584772eaafa95a447c90f1c02dba0dec
patch link:    https://lore.kernel.org/r/20240904-power-supply-extensions-v3-7-62efeb93f8ec%40weissschuh.net
patch subject: [PATCH RFC v3 7/9] power: supply: core: add locking around extension access
config: i386-buildonly-randconfig-001-20240907 (https://download.01.org/0day-ci/archive/20240908/202409080331.btTYCUQL-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080331.btTYCUQL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080331.btTYCUQL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/power/supply/power_supply_sysfs.c:502:3: error: cannot jump from this goto statement to its label
     502 |                 goto out;
         |                 ^
   drivers/power/supply/power_supply_sysfs.c:504:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     504 |         guard(rwsem_read)(&psy->extensions_sem);
         |         ^
   include/linux/cleanup.h:167:15: note: expanded from macro 'guard'
     167 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:75:1: note: expanded from here
      75 | __UNIQUE_ID_guard178
         | ^
   1 error generated.
--
>> drivers/power/supply/power_supply_core.c:1579:3: error: cannot jump from this goto statement to its label
    1579 |                 goto register_thermal_failed;
         |                 ^
   drivers/power/supply/power_supply_core.c:1581:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1581 |         guard(rwsem_read)(&psy->extensions_sem);
         |         ^
   include/linux/cleanup.h:167:15: note: expanded from macro 'guard'
     167 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:79:1: note: expanded from here
      79 | __UNIQUE_ID_guard216
         | ^
   drivers/power/supply/power_supply_core.c:1575:3: error: cannot jump from this goto statement to its label
    1575 |                 goto wakeup_init_failed;
         |                 ^
   drivers/power/supply/power_supply_core.c:1581:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1581 |         guard(rwsem_read)(&psy->extensions_sem);
         |         ^
   include/linux/cleanup.h:167:15: note: expanded from macro 'guard'
     167 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:79:1: note: expanded from here
      79 | __UNIQUE_ID_guard216
         | ^
   drivers/power/supply/power_supply_core.c:1571:3: error: cannot jump from this goto statement to its label
    1571 |                 goto device_add_failed;
         |                 ^
   drivers/power/supply/power_supply_core.c:1581:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1581 |         guard(rwsem_read)(&psy->extensions_sem);
         |         ^
   include/linux/cleanup.h:167:15: note: expanded from macro 'guard'
     167 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:79:1: note: expanded from here
      79 | __UNIQUE_ID_guard216
         | ^
   drivers/power/supply/power_supply_core.c:1562:4: error: cannot jump from this goto statement to its label
    1562 |                         goto check_supplies_failed;
         |                         ^
   drivers/power/supply/power_supply_core.c:1581:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1581 |         guard(rwsem_read)(&psy->extensions_sem);
         |         ^
   include/linux/cleanup.h:167:15: note: expanded from macro 'guard'
     167 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:79:1: note: expanded from here
      79 | __UNIQUE_ID_guard216
         | ^
   drivers/power/supply/power_supply_core.c:1551:3: error: cannot jump from this goto statement to its label
    1551 |                 goto check_supplies_failed;
         |                 ^
   drivers/power/supply/power_supply_core.c:1581:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1581 |         guard(rwsem_read)(&psy->extensions_sem);
         |         ^
   include/linux/cleanup.h:167:15: note: expanded from macro 'guard'
     167 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b


vim +502 drivers/power/supply/power_supply_sysfs.c

2ad3d74e3c69fb drivers/power/supply/power_supply_sysfs.c Mathew King         2020-05-04  473  
23680f0b7d7f67 drivers/power/supply/power_supply_sysfs.c Greg Kroah-Hartman  2022-11-23  474  int power_supply_uevent(const struct device *dev, struct kobj_uevent_env *env)
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  475  {
aeab24ab7f1d7d drivers/power/supply/power_supply_sysfs.c Thomas Weiﬂschuh    2024-09-04  476  	struct power_supply *psy = dev_get_drvdata(dev);
7eff2e7a8b65c2 drivers/power/power_supply_sysfs.c        Kay Sievers         2007-08-14  477  	int ret = 0, j;
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  478  	char *prop_buf;
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  479  
297d716f6260cc drivers/power/power_supply_sysfs.c        Krzysztof Kozlowski 2015-03-12  480  	if (!psy || !psy->desc) {
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  481  		dev_dbg(dev, "No power supply yet\n");
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  482  		return ret;
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  483  	}
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  484  
297d716f6260cc drivers/power/power_supply_sysfs.c        Krzysztof Kozlowski 2015-03-12  485  	ret = add_uevent_var(env, "POWER_SUPPLY_NAME=%s", psy->desc->name);
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  486  	if (ret)
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  487  		return ret;
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  488  
3dc0bab23dba53 drivers/power/supply/power_supply_sysfs.c Sebastian Reichel   2023-09-19  489  	/*
3dc0bab23dba53 drivers/power/supply/power_supply_sysfs.c Sebastian Reichel   2023-09-19  490  	 * Kernel generates KOBJ_REMOVE uevent in device removal path, after
3dc0bab23dba53 drivers/power/supply/power_supply_sysfs.c Sebastian Reichel   2023-09-19  491  	 * resources have been freed. Exit early to avoid use-after-free.
3dc0bab23dba53 drivers/power/supply/power_supply_sysfs.c Sebastian Reichel   2023-09-19  492  	 */
3dc0bab23dba53 drivers/power/supply/power_supply_sysfs.c Sebastian Reichel   2023-09-19  493  	if (psy->removing)
3dc0bab23dba53 drivers/power/supply/power_supply_sysfs.c Sebastian Reichel   2023-09-19  494  		return 0;
3dc0bab23dba53 drivers/power/supply/power_supply_sysfs.c Sebastian Reichel   2023-09-19  495  
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  496  	prop_buf = (char *)get_zeroed_page(GFP_KERNEL);
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  497  	if (!prop_buf)
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  498  		return -ENOMEM;
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  499  
2ad3d74e3c69fb drivers/power/supply/power_supply_sysfs.c Mathew King         2020-05-04  500  	ret = add_prop_uevent(dev, env, POWER_SUPPLY_PROP_TYPE, prop_buf);
2ad3d74e3c69fb drivers/power/supply/power_supply_sysfs.c Mathew King         2020-05-04  501  	if (ret)
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04 @502  		goto out;
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  503  
b3fcf7aeab01f6 drivers/power/supply/power_supply_sysfs.c Thomas Weiﬂschuh    2024-09-04  504  	guard(rwsem_read)(&psy->extensions_sem);
b3fcf7aeab01f6 drivers/power/supply/power_supply_sysfs.c Thomas Weiﬂschuh    2024-09-04  505  
aeab24ab7f1d7d drivers/power/supply/power_supply_sysfs.c Thomas Weiﬂschuh    2024-09-04  506  	for (j = 0; j < POWER_SUPPLY_ATTR_CNT; j++) {
aeab24ab7f1d7d drivers/power/supply/power_supply_sysfs.c Thomas Weiﬂschuh    2024-09-04  507  		ret = add_prop_uevent(dev, env, j, prop_buf);
27a2195efa8d26 drivers/power/supply/power_supply_sysfs.c Sebastian Reichel   2023-03-17  508  		if (ret)
27a2195efa8d26 drivers/power/supply/power_supply_sysfs.c Sebastian Reichel   2023-03-17  509  			goto out;
27a2195efa8d26 drivers/power/supply/power_supply_sysfs.c Sebastian Reichel   2023-03-17  510  	}
27a2195efa8d26 drivers/power/supply/power_supply_sysfs.c Sebastian Reichel   2023-03-17  511  
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  512  out:
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  513  	free_page((unsigned long)prop_buf);
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  514  
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  515  	return ret;
4a11b59d828366 drivers/power/power_supply_sysfs.c        Anton Vorontsov     2007-05-04  516  }
539b9c94ac8356 drivers/power/supply/power_supply_sysfs.c Thomas Weiﬂschuh    2021-11-24  517  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
