Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846538F7D;
	Thu, 24 Jul 2025 16:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753374646; cv=none; b=EHx8Rnx5z73k32LpLCxpOTG6ykHeUEnpJXBT+3oVU/DGDcROoJ8XdyieIHDGQdVBkYGFWyc13UaJtRF02aT8iSWbpKEfhSV9lWfSX5TM24QBEzulqteScjfsEq4oRGXh243KZyjewTktUYWhIKHk8JDNY6V9kctZbpppxmZVxvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753374646; c=relaxed/simple;
	bh=3iMqccwxZ/aocz72lsnfIK0SKmrHOCLrGXtwLSDSbXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UAE3d87A9gwJygZq64rkA2cGDxdvy99r5dKf/poISLWd4r+NUcTpkTdN7E9EaXhQCrSbBdb2hTPC/HVIGqD94ilgadFRefPCeensbLjD/i2cdExSbc9WIO4prxUzNWe6XKdBvrmeW9mYXKRwAEJ6DYogT6egfuO0RmRGghOrNjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJVqji7q; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJVqji7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753374644; x=1784910644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3iMqccwxZ/aocz72lsnfIK0SKmrHOCLrGXtwLSDSbXU=;
  b=SJVqji7qWPQe5GhvZJYVe4yvDptTj/Otl4u7/NoxT07fLuitYM4vDJmd
   5OlNU0E4Gu0iQBcuEqt8NfHjWJnaz3ickOA4qTq3rWVSMbfVhFYgooSpb
   Nf/lZyYOcMebOpC+rMDwvjuvFEnDRPmfbqoIK6OwdeAys2kgOIFyQkQCr
   wuNRImugXYog+dezTXMT1Lb55pwEF9Pwn0RSv6Evdf3b6MqTOBcCoTjMt
   6MlBuWyMKeDYapWjHOpj/sPNg13ZTJmzHdPmyu37etGvutgmRAcYS0VlU
   R5XxMktsNUYbCRoA4+l4frD3eModZrd68k6IXT6RhmrBjENIP+7eL6vHv
   w==;
X-CSE-ConnectionGUID: VydNOAM7Swu7eccsRbSZ+A==
X-CSE-MsgGUID: q/t0hSJCR5KQj5G7/zoC2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="67054011"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="67054011"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 09:30:44 -0700
X-CSE-ConnectionGUID: I2x7uk2kQFaYq3x7sDyPPg==
X-CSE-MsgGUID: wrgVoJjFQRaei3JcYVpbNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="164393806"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jul 2025 09:30:43 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueyq9-000KcY-09;
	Thu, 24 Jul 2025 16:30:41 +0000
Date: Fri, 25 Jul 2025 00:30:39 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-sparc64-generic-2 12/17] ld.lld: error:
 arch/sparc/vdso/vclock_gettime.o:(function __vdso_gettimeofday: .text+0x10):
 unknown relocation (46) against symbol vdso_u_time_data
Message-ID: <202507250035.UFpeujZm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-sparc64-generic-2
head:   208f0c23b4f7408dd631508946283c66a08d7f81
commit: 9f35a7f8ae9b4bb1c4d7dc5e89ab1c617cb149bb [12/17] sparc/vdso: Switch to generic vDSO library
config: sparc64-randconfig-002-20250724 (https://download.01.org/0day-ci/archive/20250725/202507250035.UFpeujZm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507250035.UFpeujZm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507250035.UFpeujZm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/sparc/vdso/vclock_gettime.o:(function __vdso_gettimeofday: .text+0x10): unknown relocation (46) against symbol vdso_u_time_data
>> ld.lld: error: arch/sparc/vdso/vclock_gettime.o:(function __vdso_clock_gettime: .text+0x170): unknown relocation (46) against symbol vdso_u_time_data

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
