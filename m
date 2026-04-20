Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B7C2E8B67;
	Mon, 20 Apr 2026 14:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776694089; cv=none; b=r8QtbWwm/uXlSLVZ+Ab1LGJ903K2/CF9MOWgmYG0MOlYH0J9Hdh6C8j3s+ESzFsMTf0ONf+CLp6bCle3V5M4aQ4jITd6PntTg/FrKUJj18e+nwrA4YRYJJxF0XhQfDCYYglPBU0nKtoNH2Zm5zfbKvjZN9GUpVDvLk9k9yzNEYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776694089; c=relaxed/simple;
	bh=dGK7UoJ8ImjCjN1Fc3E8sTXlAsMZM7BvS8mh1S4QpgY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MNpWjIHBFgFq41JcpnxxMBtvD5+Cig3CH/Md4VUkS0swKo9IsLJgI5gixyUWP6q2DZM9+y2Q0hrDZ/IfueFHCm6MBYbkAMnXwWLqC2vXXqlwnJPcGNauCPzhxKlmIRyYkPnN7XqHl8dAY0P9AOhOAoRqWTkszgpzR5e0RJEZ3wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=liMTpHZd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="liMTpHZd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776694087; x=1808230087;
  h=date:from:to:cc:subject:message-id;
  bh=dGK7UoJ8ImjCjN1Fc3E8sTXlAsMZM7BvS8mh1S4QpgY=;
  b=liMTpHZdUIPf6kRsGdx9Kh9B/5+JyhSykeBdj8EwAVNwzU/b21Yf4swe
   zw+yqImJ/R5IAlX6rrmj1KuvmB/uZ9FjPASzu3ErhwokfF27xHDPHbTrq
   8AFpnj2v27PPf4JQcDzM/cWcqMVJINreJWnNsrD5Zhd5V/0Wq+LNgHR1L
   UPTJURFUCzeqvdqTshnS6OIXwMjafKiPgz/OI5ksAOURjINUSWbshxo/X
   CKgF3oAub54R63oY7BsojVGf1VBMfwpsDquVAhoQ2m9aoPHfPYPqiRw+I
   MXjPkASF0D9pKG0i5RMkTEVgByAXVKwL2kLCkmiBvLt1+Mx6Beq18b6yF
   w==;
X-CSE-ConnectionGUID: v9QBuHbSTRiIhAkskkmowQ==
X-CSE-MsgGUID: /aK86sKNSIuBdht9Y/E+8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="100266205"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="100266205"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 07:08:07 -0700
X-CSE-ConnectionGUID: tqWFC8LgT7OqH8vr/9Yv8A==
X-CSE-MsgGUID: APBeJ3XPTDaFdAOZVr4nQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="230859948"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Apr 2026 07:08:05 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEpIA-000000002SM-3wIF;
	Mon, 20 Apr 2026 14:08:02 +0000
Date: Mon, 20 Apr 2026 22:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thermal:thermal/cooling-device-with-id-v2 6/14]
 include/linux/thermal.h:327:1: warning: no previous prototype for function
 'devm_thermal_cooling_device_register'
Message-ID: <202604202218.R6fI5MvG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/cooling-device-with-id-v2
head:   a1f086d250b04a9b833e71a6fa865e3600c5dac0
commit: 729cfe840489da5dcaf0bf3b57361263c2cbf125 [6/14] thermal/core: Register cooling device non-OF drivers
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260420/202604202218.R6fI5MvG-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260420/202604202218.R6fI5MvG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604202218.R6fI5MvG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/loongarch/kernel/topology.c:11:
   In file included from include/acpi/processor.h:11:
>> include/linux/thermal.h:327:1: warning: no previous prototype for function 'devm_thermal_cooling_device_register' [-Wmissing-prototypes]
     327 | devm_thermal_cooling_device_register(struct device *dev, const char *type,
         | ^
   include/linux/thermal.h:326:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     326 | struct thermal_cooling_device *
         | ^
         | static 
   1 warning generated.


vim +/devm_thermal_cooling_device_register +327 include/linux/thermal.h

   325	
   326	struct thermal_cooling_device *
 > 327	devm_thermal_cooling_device_register(struct device *dev, const char *type,
   328					     void *devdata, const struct thermal_cooling_device_ops *ops)
   329	{
   330		return ERR_PTR(-ENODEV);
   331	}
   332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
