Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EFD291864;
	Tue, 14 Apr 2026 08:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776157024; cv=none; b=dXZ/xmkXnILQclc/MavCCGtE9nd59HYlufKUCg07jcRJN2yaLHJHM7zCdfoD/DwZiZke9aDDK+FLwKeF6uueqLQjIxvE6aj0ew39VeZPnj+EhVwbWCNv59v6eLuKViR2A6ANMdaeRLFgiormObsp+T7F8M97wv1UvmGy0P7XhXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776157024; c=relaxed/simple;
	bh=FV3qkFp35cDKooc0SSdquWO5BYkoZbJK4tx9CbGrBUI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rKPy3pZRP3TFXD0CRhdb1nBcmfQww5tBtI6TmzAmzthQWM1YjK+hw3q6lj7S6QpaXCkNDZDXeD3eo/yfQFzAaMGfvCSpHFlQiF5m4ThFdcGb+1VG+5GYXCqFuwbQhQRPkzhmjdN6sf9+2TaRq1TkLNNR6pSvSRnzhzQ+QyhPzbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f86CiWpk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f86CiWpk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776157024; x=1807693024;
  h=date:from:to:cc:subject:message-id;
  bh=FV3qkFp35cDKooc0SSdquWO5BYkoZbJK4tx9CbGrBUI=;
  b=f86CiWpkbPTIVnHE+y/KqRYfyu7i4DzZUAUr4Aw/+JW4FowYqUkNprPq
   ebrZ/0MD0W03cBJsI0LrJMmYKxg2FsCpNluwJFAz82euTOqYh9yItHuMo
   T+/SCa588VdO93xiJZ3aQh6aLbqfyqBPPj0uGaNSfWG7Em9zeHd9LKy8n
   XGiaa0sRvnfVwQoGOtPIxCeACaNBquSxHIrCFNNSQuFkaYxNvum989bsA
   fjONUvrloPLYk/m99v8vzvJpzO7WeeL+w7zxHKA+csAZ4tnCGsnGpsNRB
   I+1fYyPKGBZV0S3HlqM2fn80UeDJ8fMBh7UApEnT5gqYks5u7C0aUVMDc
   g==;
X-CSE-ConnectionGUID: 2SBTrSt6TB+mfJ+J1+slxw==
X-CSE-MsgGUID: +pIAp0SoQlCdEh2MendDGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88186561"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="88186561"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 01:57:03 -0700
X-CSE-ConnectionGUID: 5nPrVRHvQsmRBToMo20tcg==
X-CSE-MsgGUID: dO3PMGwEReqLyVvyi21u4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="228999728"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 14 Apr 2026 01:57:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCZZp-000000000Nd-3ChQ;
	Tue, 14 Apr 2026 08:56:57 +0000
Date: Tue, 14 Apr 2026 10:56:06 +0200
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thermal:thermal/cooling-device-with-id 24/25]
 include/linux/thermal.h:242:1: warning: no previous prototype for function
 'devm_thermal_of_cooling_device_register'
Message-ID: <202604141053.csPgzNGF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/cooling-device-with-id
head:   4fea531ae8a1095b1fc1122441fc173a33b93005
commit: 1da9dad287e0abae276c2f8cacd7ad105b78293b [24/25] thermal/of: Pass the of_index and add a function to register with an index
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260414/202604141053.csPgzNGF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604141053.csPgzNGF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604141053.csPgzNGF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/thermal/thermal_core.c:18:
>> include/linux/thermal.h:242:1: warning: no previous prototype for function 'devm_thermal_of_cooling_device_register' [-Wmissing-prototypes]
     242 | devm_thermal_of_cooling_device_register(struct device *dev, int of_index,
         | ^
   include/linux/thermal.h:241:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     241 | struct thermal_cooling_device *
         | ^
         | static 
   drivers/thermal/thermal_core.c:1200:10: warning: variable 'tcd' is uninitialized when used here [-Wuninitialized]
    1200 |                 return tcd;
         |                        ^~~
   drivers/thermal/thermal_core.c:1190:43: note: initialize the variable 'tcd' to silence this warning
    1190 |         struct thermal_cooling_device **ptr, *tcd;
         |                                                  ^
         |                                                   = NULL
   2 warnings generated.
--
   In file included from drivers/thermal/thermal_sysfs.c:23:
   In file included from drivers/thermal/thermal_core.h:14:
>> include/linux/thermal.h:242:1: warning: no previous prototype for function 'devm_thermal_of_cooling_device_register' [-Wmissing-prototypes]
     242 | devm_thermal_of_cooling_device_register(struct device *dev, int of_index,
         | ^
   include/linux/thermal.h:241:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     241 | struct thermal_cooling_device *
         | ^
         | static 
   1 warning generated.


vim +/devm_thermal_of_cooling_device_register +242 include/linux/thermal.h

   240	
   241	struct thermal_cooling_device *
 > 242	devm_thermal_of_cooling_device_register(struct device *dev, int of_index,
   243						const char *type, void *devdata,
   244						const struct thermal_cooling_device_ops *ops)
   245	{
   246		return ERR_PTR(-ENODEV);
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
