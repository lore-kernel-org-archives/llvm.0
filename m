Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7373E8669;
	Tue, 14 Apr 2026 14:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175727; cv=none; b=OBswQSv0fh2MIhJSPiOxdbMWpp6i0UjOZKVp1sb0rHpbzXjDv9pWfnhgdK7zZL1rOvG8CdOZTa09m1K9no7Fep8O/YwK+T6P5lBy7si5rHfRkLoBL94FIOqUl5ckMsjihvtzvTtDU9D1hIfNvCc/yslmxXH6MDnZysFkwGKya2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175727; c=relaxed/simple;
	bh=9oSfXUOkK1hnEnKBeXfjWJ+R0VTIouLGsqnqD1+eOos=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cPsfi5R0zq4Jr5gbs0zuKfsSGKQnxp4JoiBUNYSFaGj0YNvPcRI5cBL/V4o2w6hjgPAEq6dTYAWCKECzrMlFjqRsfh3qFgLwIGK74FKn0jVaelqvqzxyoQYurd/lR8I67QnB0WJVz4G2kKyeWEwsxIGfbZPttZWalSGlQHFTD4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kvSDQ2iO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvSDQ2iO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776175725; x=1807711725;
  h=date:from:to:cc:subject:message-id;
  bh=9oSfXUOkK1hnEnKBeXfjWJ+R0VTIouLGsqnqD1+eOos=;
  b=kvSDQ2iOFzhZC3AvH24/Y05XkxItobH4djnYI+YxKKMvdcZo0u/zG32P
   Xb7OFkWq1DaFsszRsxd5hE7//V3xm9+Gx3J5jpeYlkm8SgqPD1Uccml4n
   8Vm/vmeRC9WN1FgzlrBHPw5BNDcgbGVQO3Nh/8KdYSiqTHbuvTDgCNBjT
   v0ZszHL07w5/641EnE2my702mylhe+JbC53Gstzn/Q33gtKj11NYw5WWk
   HicN1SxbTJXX9K2XhjrQS4xj16lbGU6ltmE3A14z7XlqzUxmVDg8R6Zhg
   aUieYiXEyy/bNgsqvC0Yal4UZnXcKKjtndG8x7Phg+uhWmPmUqk9xd4Xo
   Q==;
X-CSE-ConnectionGUID: 3gDXlTRYTzWB4k4E5MJx/w==
X-CSE-MsgGUID: q5YVPXXgTVyKQvjtThf/7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77156998"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77156998"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 07:08:45 -0700
X-CSE-ConnectionGUID: 8VHfFLhSQbGhDvBNvdWOpA==
X-CSE-MsgGUID: g/HEe9h+Qn+18DB74NVL/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="231854990"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Apr 2026 07:08:43 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCeRU-000000001VZ-42ey;
	Tue, 14 Apr 2026 14:08:40 +0000
Date: Tue, 14 Apr 2026 22:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thermal:thermal/cooling-device-with-id 24/25] ld.lld:
 error: duplicate symbol: devm_thermal_of_cooling_device_register
Message-ID: <202604142247.CmAQKZwJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/cooling-device-with-id
head:   4fea531ae8a1095b1fc1122441fc173a33b93005
commit: 1da9dad287e0abae276c2f8cacd7ad105b78293b [24/25] thermal/of: Pass the of_index and add a function to register with an index
config: loongarch-randconfig-002-20260414 (https://download.01.org/0day-ci/archive/20260414/202604142247.CmAQKZwJ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604142247.CmAQKZwJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604142247.CmAQKZwJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: devm_thermal_of_cooling_device_register
   >>> defined at thermal.h:245 (include/linux/thermal.h:245)
   >>>            drivers/acpi/processor_driver.o:(devm_thermal_of_cooling_device_register)
   >>> defined at thermal.h:245 (include/linux/thermal.h:245)
   >>>            drivers/acpi/processor_thermal.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: devm_thermal_of_cooling_device_register
   >>> defined at thermal.h:245 (include/linux/thermal.h:245)
   >>>            drivers/acpi/processor_driver.o:(devm_thermal_of_cooling_device_register)
   >>> defined at thermal.h:245 (include/linux/thermal.h:245)
   >>>            drivers/acpi/processor_perflib.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: devm_thermal_of_cooling_device_register
   >>> defined at thermal.h:245 (include/linux/thermal.h:245)
   >>>            drivers/acpi/processor_driver.o:(devm_thermal_of_cooling_device_register)
   >>> defined at thermal.h:245 (include/linux/thermal.h:245)
   >>>            drivers/acpi/processor_idle.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: devm_thermal_of_cooling_device_register
   >>> defined at thermal.h:245 (include/linux/thermal.h:245)
   >>>            drivers/acpi/processor_driver.o:(devm_thermal_of_cooling_device_register)
   >>> defined at thermal.h:245 (include/linux/thermal.h:245)
   >>>            drivers/acpi/processor_throttling.o:(.text+0x0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
