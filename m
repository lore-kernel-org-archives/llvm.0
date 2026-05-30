Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6551427A;
	Sat, 30 May 2026 05:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780119499; cv=none; b=k4VNJA4jn/2mAYEO7VCR51RLCLmrOGGNDtPg/lgRVHFY8OysUuf2SAZEQy0K/pn/4ropBIlTHFjLV70A7jCt7OssqByjlBDMji+6HL1/m6ldyD5mAUOHuMfEdhTN8yHl9FrtRgMCfxf/+2uB3KpLlbiE+CB60dk0gNSrZ1bADIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780119499; c=relaxed/simple;
	bh=FV4QAJh1viK1hv7mV/Iroc6FIIZi8P4GDerVmKL1sgA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GAlqEWtdbYQYkLIufzQBwr69fnbMioCoXVdCACON/fHbaeuV4ax+68JyM5+3y/L71Q76UNTzywudeVDQCojezkR3qXwHtP0JtJKejNg/qCgZ23LUghtS5TbAEpV6oXA55MgXG3Gr/DnDQNBqRGr4HGY9STX48+zLSs95c5+6GGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DYpy9vV+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DYpy9vV+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780119498; x=1811655498;
  h=date:from:to:cc:subject:message-id;
  bh=FV4QAJh1viK1hv7mV/Iroc6FIIZi8P4GDerVmKL1sgA=;
  b=DYpy9vV+5OznVjATmnsEoGNSHGLKOfHJUZzQqZ7NYQxi5swpR9qb/avr
   H2EsxGn7mv6GbKJzx4/XlbJnxrfaj0PQxPby2asgkVH0xL6CaK3gfvBeM
   0rmwVALLUG6iZU2P7jbOKr2Z9mfvRIubC5oBM+L9fTCUuRyrWvOL7SvV8
   m7+EXUjX5wTsu8WPvvqBtaK2iLqTLH3919Fnw81aygClBIIzYS7j9vhts
   1PqNpXBvVdy7w9jIeyYHSs5t0iyaq3jBWC1LP16/4B/SCEGmthDldnVdO
   Ns58YcLM2/XRfHBm5PLDc7nIJFZ8NV0gP+pc74ZAZDReBrYISZMPETYGD
   A==;
X-CSE-ConnectionGUID: wP7fNT8CTnaLgi8plxKWJQ==
X-CSE-MsgGUID: wvwHyopiQYyEWbMgF5z5dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="103636459"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="103636459"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 22:38:18 -0700
X-CSE-ConnectionGUID: UlXAJ22TQlyceyACWSANSA==
X-CSE-MsgGUID: RCPB6/ozRP2dGxkFgXQtHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="238651943"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 May 2026 22:38:16 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTCOj-0000000088s-3tlt;
	Sat, 30 May 2026 05:38:13 +0000
Date: Sat, 30 May 2026 13:38:05 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Lukasz Luba <lukasz.luba@arm.com>
Subject: [thermal:thermal/bleeding-edge 24/30]
 include/linux/thermal.h:332:1: error: expected identifier or '('
Message-ID: <202605301304.r2MYs4Rz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Daniel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/bleeding-edge
head:   100e27ef9a645f07881160256b7131fb40885215
commit: 06f53fafe3cccbb83d6d6f0812e4d5c8d46bbb63 [24/30] thermal/of: Move cooling device OF helpers out of thermal core
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260530/202605301304.r2MYs4Rz-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301304.r2MYs4Rz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301304.r2MYs4Rz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/loongarch/kernel/topology.c:11:
   In file included from include/acpi/processor.h:11:
>> include/linux/thermal.h:332:1: error: expected identifier or '('
     332 | static inline void thermal_cooling_device_unregister(
         | ^
   1 error generated.


vim +332 include/linux/thermal.h

06f53fafe3cccbb Daniel Lezcano 2026-05-26  331  
12ca7188468ee29 Nishanth Menon 2015-02-13 @332  static inline void thermal_cooling_device_unregister(
12ca7188468ee29 Nishanth Menon 2015-02-13  333  	struct thermal_cooling_device *cdev)
12ca7188468ee29 Nishanth Menon 2015-02-13  334  { }
12ca7188468ee29 Nishanth Menon 2015-02-13  335  static inline struct thermal_zone_device *thermal_zone_get_zone_by_name(
12ca7188468ee29 Nishanth Menon 2015-02-13  336  		const char *name)
12ca7188468ee29 Nishanth Menon 2015-02-13  337  { return ERR_PTR(-ENODEV); }
12ca7188468ee29 Nishanth Menon 2015-02-13  338  static inline int thermal_zone_get_temp(
17e8351a77397e8 Sascha Hauer   2015-07-24  339  		struct thermal_zone_device *tz, int *temp)
12ca7188468ee29 Nishanth Menon 2015-02-13  340  { return -ENODEV; }
4a7069a32c99a81 Rajendra Nayak 2016-05-05  341  static inline int thermal_zone_get_slope(
4a7069a32c99a81 Rajendra Nayak 2016-05-05  342  		struct thermal_zone_device *tz)
4a7069a32c99a81 Rajendra Nayak 2016-05-05  343  { return -ENODEV; }
4a7069a32c99a81 Rajendra Nayak 2016-05-05  344  static inline int thermal_zone_get_offset(
4a7069a32c99a81 Rajendra Nayak 2016-05-05  345  		struct thermal_zone_device *tz)
4a7069a32c99a81 Rajendra Nayak 2016-05-05  346  { return -ENODEV; }
f0129c231772a85 Daniel Lezcano 2020-04-02  347  

:::::: The code at line 332 was first introduced by commit
:::::: 12ca7188468ee29c4e717f73db4bf43c90954fc7 thermal: Introduce dummy functions when thermal is not defined

:::::: TO: Nishanth Menon <nm@ti.com>
:::::: CC: Eduardo Valentin <edubezval@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
