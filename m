Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D44C3EC2D1;
	Tue, 14 Apr 2026 15:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776181315; cv=none; b=Jm7nElsWRk5BCa7rghVzVcyTaKttDAe7aOC6GfzVfGGYRR09sUnbYaEras45Dk4VcDr6Cs96VWGLtSluPDrlGLRuAzQnpl4TBbhXO5kMdeW3uYFRhNuGSU0lNdF0iqxUckeq0irELDqAc5uM6wQLvkV+icli3JQlx1ywVGKwLOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776181315; c=relaxed/simple;
	bh=Kg093gCVcaGpodKcyWhDTC3jiecNLAdoZfOHvn3+IF8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cuF1o/IIJfLxuApr7NDABBFxvRMhnPpnMlkNgLBAXMKgDAD11YYBUzq6DxfHyDdPXIZbEqeQvJW/BTSYgEP0PInrHZrx+05DvTYbaazATg2WKsdE0hGYMtlMOQDjKO+OVmhnBsWRDtEfX3r2BAotEKmHHKhQY+7gmovABGFOddI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HlZ2WuqW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HlZ2WuqW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776181315; x=1807717315;
  h=date:from:to:cc:subject:message-id;
  bh=Kg093gCVcaGpodKcyWhDTC3jiecNLAdoZfOHvn3+IF8=;
  b=HlZ2WuqWFL2VLrY9xzzPdkiysIIzYfSfEL8Q9JRBxYYK+wFPWFOL/bEi
   H2ZyPX54qy7hsXeH4XMwo/2MaLhma5bYVvtIh4Vqw32PAZa/V+4uE4Tel
   w0dRtKKzH0J138B739NJkBDyyUEPMwt9McyVnB4+F/yiMalvEfOzjT4BV
   E6MCjNrF8lHm2n2nFSkYGX0qNrU+VhJ3fij2n0/vWlYJvSxgXryA3UMmU
   EmXxtlO4d865MW4aBYGGQFdOei/XE40ULvjtZ1VqgwycdLZs8i7HiA2eR
   iup8olG3bitGSwKU0flY+NtxfuGt21oCmTa2FwvfYWZYosCNOn8NclOx3
   A==;
X-CSE-ConnectionGUID: fWnu7luOSFmgZMlsP2K/bA==
X-CSE-MsgGUID: Dd1USZv0R7ujJZMpS3HJdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88589630"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="88589630"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 08:41:53 -0700
X-CSE-ConnectionGUID: GHilPLHCQTmhsaUzt9uIeg==
X-CSE-MsgGUID: 1q3tNkBWRvih6wvpRDb8TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="225412719"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Apr 2026 08:41:51 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCftc-000000001b5-1V43;
	Tue, 14 Apr 2026 15:41:48 +0000
Date: Tue, 14 Apr 2026 23:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thermal:thermal/cooling-device-with-id 18/25] ld.lld:
 error: duplicate symbol: devm_thermal_cooling_device_register
Message-ID: <202604142345.qIvUgaun-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/cooling-device-with-id
head:   4fea531ae8a1095b1fc1122441fc173a33b93005
commit: 10ad4e2ee1d7bd68d2c7c0d50cb052920305f455 [18/25] thermal/core: Register cooling device non-OF drivers
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260414/202604142345.qIvUgaun-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604142345.qIvUgaun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604142345.qIvUgaun-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: devm_thermal_cooling_device_register
   >>> defined at topology.c
   >>>            arch/loongarch/kernel/topology.o:(devm_thermal_cooling_device_register) in archive vmlinux.a
   >>> defined at pptt.c
   >>>            drivers/acpi/pptt.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: devm_thermal_cooling_device_register
   >>> defined at topology.c
   >>>            arch/loongarch/kernel/topology.o:(devm_thermal_cooling_device_register) in archive vmlinux.a
   >>> defined at acpi_processor.c
   >>>            drivers/acpi/acpi_processor.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: devm_thermal_cooling_device_register
   >>> defined at topology.c
   >>>            arch/loongarch/kernel/topology.o:(devm_thermal_cooling_device_register) in archive vmlinux.a
   >>> defined at processor_core.c
   >>>            drivers/acpi/processor_core.o:(.text+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
