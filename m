Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FB331618B;
	Sat,  3 Oct 2026 23:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791068733; cv=none; b=Gv7bx+cWKacV9k5+K7RQ+o9boEupHGx23R3vXL2Ue0p68fT/nA3YOGW0u/nAtnSkh0uSNTsAX7VSLs3PChcxh53c4KnoQ8v4LXMhQAu4P/gZojitZYZu2h56pBZ64ZN9fBNJfJ7AaRxyPz+DuZys1GvObh+nsL5mOIg1R24zqGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791068733; c=relaxed/simple;
	bh=7sij8abg9R7n3Nga00K9KM2YBNWRn3pFuIvQi+scEeI=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ud5lVP1JMfKhYrehGTp0M97KWjIxTIQJEvsE4u5zJ0GIR5H1Lq6+TuCk5DyALBiigDPKJFl00WrJT7hBNl/dhKJxxOzGziQXlrp9sCP7H/3bnXxEdoB2QUR2QZO/Ze+GU9CClwjwYad0pX+tb+EJSOG9SvgoH3iGvRtEYVy2KXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BxBqs6pW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxBqs6pW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791068731; x=1822604731;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=7sij8abg9R7n3Nga00K9KM2YBNWRn3pFuIvQi+scEeI=;
  b=BxBqs6pWSQsVVAIXTHnztWFYuZ3b6cyyM+KUhKn6iWpxA62Juwxz12Oc
   mKKNSn7kciOJKuds270O5AnQV9jAjMxfAxwb+bsCuOkb3qCMkzjyg66NZ
   HhRnfr5VAb/hy2XcVagDKQN5DsO+2pD8U68w7hdMrkayPoLqvNu1W4PUZ
   EQR+6/kZGwMY5VQOjdRDwD4gN4/ykhVN0kLpAjQsZqsZHgmcsoHVROOSj
   FRWHvzhrwIi5+N5n3+UyM2Eode14Ub8B/vdfSwTHSQEhR8rR/uhmE2j+H
   nyjC6gDdhKAOb65WfP3kbxUqNP8sF/Q3BUzUwuQ6uzQn6yZAj3NuNCfFv
   Q==;
X-CSE-ConnectionGUID: +u/r4uQiTCK+XLgogFIMAQ==
X-CSE-MsgGUID: 9pN98yb7R2aR2jRY4V0uOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="102370495"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="102370495"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 16:05:30 -0700
X-CSE-ConnectionGUID: iG94rTVoSNuvw6+e0qmTLA==
X-CSE-MsgGUID: rkXB7qMaTgy+bwgzP/Sz5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="504079"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 03 Oct 2026 16:05:29 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xD8nG-00000000UGl-3fW8;
	Sat, 03 Oct 2026 23:05:26 +0000
Date: Sun, 4 Oct 2026 07:05:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: wifi: mt76: mt7996: add thermal zone device registration
Message-ID: <202610040604.2y7T17Mw-lkp@intel.com>
References: <202610040604.2y7T17Mw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610040604.2y7T17Mw-lkp@intel.com>

Hi Ryan,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Leung-via-B4-Relay/wifi-mt76-mt7996-add-thermal-zone-device-registration/20261003-041935
base:   
patch link:    https://lore.kernel.org/r/202610040604.2y7T17Mw-lkp%40intel.com
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261004/202610040604.2y7T17Mw-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610040604.2y7T17Mw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610040604.2y7T17Mw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:262:3: error: call to undeclared function 'thermal_of_zone_unregister'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     262 |                 thermal_of_zone_unregister(phy->tzone);
         |                 ^
   drivers/net/wireless/mediatek/mt76/mt7996/init.c:262:3: note: did you mean 'devm_thermal_of_zone_unregister'?
   include/linux/thermal.h:202:6: note: 'devm_thermal_of_zone_unregister' declared here
     202 | void devm_thermal_of_zone_unregister(struct device *dev, struct thermal_zone_device *tz);
         |      ^
>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:303:15: error: call to undeclared function 'thermal_of_zone_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     303 |         phy->tzone = thermal_of_zone_register(phy->dev->mt76.dev,
         |                      ^
   drivers/net/wireless/mediatek/mt76/mt7996/init.c:303:15: note: did you mean 'devm_thermal_of_zone_register'?
   include/linux/thermal.h:199:29: note: 'devm_thermal_of_zone_register' declared here
     199 | struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, int id, void *data,
         |                             ^
>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:303:13: error: incompatible integer to pointer conversion assigning to 'struct thermal_zone_device *' from 'int' [-Wint-conversion]
     303 |         phy->tzone = thermal_of_zone_register(phy->dev->mt76.dev,
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     304 |                                               phy->mt76->band_idx, phy,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~
     305 |                                               &mt7996_tz_ops);
         |                                               ~~~~~~~~~~~~~~~
   3 errors generated.


vim +/thermal_of_zone_unregister +262 drivers/net/wireless/mediatek/mt76/mt7996/init.c

   255	
   256	static void mt7996_unregister_thermal(struct mt7996_phy *phy)
   257	{
   258		struct wiphy *wiphy = phy->mt76->hw->wiphy;
   259		char name[sizeof("cooling_deviceXXX")];
   260	
   261		if (phy->tzone) {
 > 262			thermal_of_zone_unregister(phy->tzone);
   263			phy->tzone = NULL;
   264		}
   265	
   266		if (!phy->cdev)
   267			return;
   268	
   269		snprintf(name, sizeof(name), "cooling_device%d", phy->mt76->band_idx);
   270		sysfs_remove_link(&wiphy->dev.kobj, name);
   271		thermal_cooling_device_unregister(phy->cdev);
   272		phy->cdev = NULL;
   273	}
   274	
   275	static int mt7996_thermal_init(struct mt7996_phy *phy)
   276	{
   277		struct wiphy *wiphy = phy->mt76->hw->wiphy;
   278		char cname[sizeof("cooling_deviceXXX")];
   279		struct thermal_cooling_device *cdev;
   280		struct device *hwmon;
   281		const char *name;
   282	
   283		name = devm_kasprintf(&wiphy->dev, GFP_KERNEL, "mt7996_%s.%d",
   284				      wiphy_name(wiphy), phy->mt76->band_idx);
   285		if (!name)
   286			return -ENOMEM;
   287	
   288		snprintf(cname, sizeof(cname), "cooling_device%d", phy->mt76->band_idx);
   289	
   290		cdev = thermal_cooling_device_register(name, phy, &mt7996_thermal_ops);
   291		if (!IS_ERR(cdev)) {
   292			if (sysfs_create_link(&wiphy->dev.kobj, &cdev->device.kobj,
   293					      cname) < 0)
   294				thermal_cooling_device_unregister(cdev);
   295			else
   296				phy->cdev = cdev;
   297		}
   298	
   299		/* initialize critical/maximum high temperature */
   300		phy->throttle_temp[MT7996_CRIT_TEMP_IDX] = MT7996_CRIT_TEMP;
   301		phy->throttle_temp[MT7996_MAX_TEMP_IDX] = MT7996_MAX_TEMP;
   302	
 > 303		phy->tzone = thermal_of_zone_register(phy->dev->mt76.dev,
   304						      phy->mt76->band_idx, phy,
   305						      &mt7996_tz_ops);
   306		if (IS_ERR(phy->tzone)) {
   307			if (PTR_ERR(phy->tzone) != -ENODEV)
   308				dev_warn(phy->dev->mt76.dev,
   309					 "failed to register thermal zone %d: %ld\n",
   310					 phy->mt76->band_idx, PTR_ERR(phy->tzone));
   311			phy->tzone = NULL;
   312		}
   313	
   314		if (!IS_REACHABLE(CONFIG_HWMON))
   315			return 0;
   316	
   317		hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev, name, phy,
   318							       mt7996_hwmon_groups);
   319	
   320		if (IS_ERR(hwmon)) {
   321			mt7996_unregister_thermal(phy);
   322			return PTR_ERR(hwmon);
   323		}
   324	
   325		return 0;
   326	}
   327	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
