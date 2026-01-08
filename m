Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5836E70814;
	Thu,  8 Jan 2026 00:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767831686; cv=none; b=n1boP034smWIiCu8i8ZDrsStrlFf6E6LjKQJlWFdlVnX0Vwx9W3P9HzMxPzCu5YBen2OVmIwykImqdvY7IZgAtfoeR+6TdRuRXYJy64N0drnROi/GAy6tDa5fyBhglwfHp43uqbL5qtTc/FfZaL5pkqcDfROzIfDapmhZJP/x90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767831686; c=relaxed/simple;
	bh=doegLQy+UKIiM7ZkKS9FbOOraAXel28WhjhojfRiivQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AMo4yBgt9mSGEMrti11pm0jJ5ra58Tzg6TUD3r3TExJz1/JTXlzR4qpgTnJpMgtLuvP8T74sP6YGkjchli6u0BPEd+lUkn6pEnlvwm1YZoV+j/i7ozqRxq8PKnxgysE29PxjjQlYVPRO72Ta/aYZo5YE3Y9eaoJrTDXs4Pp5YJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMsBgDjQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMsBgDjQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767831685; x=1799367685;
  h=date:from:to:cc:subject:message-id;
  bh=doegLQy+UKIiM7ZkKS9FbOOraAXel28WhjhojfRiivQ=;
  b=nMsBgDjQgjUD5aXLB+MnYRgnVh7x8EWwbtxlPE2FK8Jv/rhltUBh5XCS
   Rh4fSl5pK57X0qjMm1ld3oRKdfsvi+6worpU+SI1armPsLyuWO/IFSvMZ
   +/+ovZ/woNlQhesW/I6saHKXEd9/F0++vxbTX2mJJbltFm/pmKomQgbqj
   ICNIltv0sEQ4YCHstSs6b4F1xhU2IV1OrWmK89ijm3fpeoIs1H2Sk4ZEr
   SkYoZ6Nf02JjuiWE4RWPudCdFDg/u8LQO2ELao7mIIjhiCtgu2zHsVOsI
   YfnaN0EvcXfisIRPwgmr8JbB13upx8MkAZ3QOBtTtJv+/WGgCX21eGxKF
   A==;
X-CSE-ConnectionGUID: UIkfc3AtTeyZh+31bot+tg==
X-CSE-MsgGUID: fbIz+FNJTAukRa08O9ralw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="68400366"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="68400366"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 16:21:23 -0800
X-CSE-ConnectionGUID: yWCd7V/yR1OOVadn+QKtoQ==
X-CSE-MsgGUID: 1R1wcoQXQI2RcI5aDmiyGw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jan 2026 16:21:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vddmB-000000004GT-3mH3;
	Thu, 08 Jan 2026 00:21:19 +0000
Date: Thu, 08 Jan 2026 08:20:24 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v3 2/9] ld.lld:
 error: undefined symbol: efi_mem_attributes
Message-ID: <202601080818.ELltsMQK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v3
head:   8a4f71e8f0a8aef992da7df176a352073872a47c
commit: 4f450a5bd7e696d6e61362537e159aa1914749ae [2/9] drivers/numa/srat: report EFI_MEMORY_SP regions as spm memblks
config: x86_64-randconfig-075-20260108 (https://download.01.org/0day-ci/archive/20260108/202601080818.ELltsMQK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601080818.ELltsMQK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601080818.ELltsMQK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: efi_mem_attributes
   >>> referenced by srat.c:397 (drivers/acpi/numa/srat.c:397)
   >>>               vmlinux.o:(acpi_parse_memory_affinity)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
