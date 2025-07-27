Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBF81C36;
	Sun, 27 Jul 2025 07:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753600754; cv=none; b=Q6p6EKc+RxYeYZG7xPR93VfVeuSBkLu8Tm2+riKsYJEqX+EanlUWqNOxVgDb48swL20greLrX/6tA3ilDjPto/4WkzKQaSMRZerWXLBUzD2ByY5x3xQSlP3JVhulqYfQ2kwEXR0EUJWoqVnA0S4fCzcevDWYuOkvcfla0M+QMBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753600754; c=relaxed/simple;
	bh=UcN5ps6cXIdtr8awP3R7VxQkz6IMOViAcEFq3r+PFLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d3Qum7NuGx4gAhBkrXViriJK4ygVdV7+vXVJjolF28+n3kHh745On1tQ0cdUpgKxScM8i0eZF/Png3BBP0WQ8xM8Wr/mt87ExpyDm7PUs1Pwm4FjlarZgFKiLfqdTT5pN9Oa8T0YLG33vSsdTeW/6Hxwh8YFhl5xbDwSJY98Qv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jy1Qx0UT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jy1Qx0UT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753600753; x=1785136753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UcN5ps6cXIdtr8awP3R7VxQkz6IMOViAcEFq3r+PFLY=;
  b=Jy1Qx0UTn2uD+jj7bnsmO65YMo79A+BRmJETgEfG4qcaO/vRQT8XCpTa
   HkGHZUN7sJrb9nWofWy8WlISZjpHUwud5cu9e7Fnz99OQL2Q/X4P8B/W8
   tYqkFqPJ8YcLy/sZBE6TRvqF0IrvDvyUlbfRBKUqi4DbZfIQwEtZxOF6q
   X8g3tb7zRn3ysUwTf1bI66H5SHywGw6e1b7jpXsA4QrgOt6ynYSD8hdCM
   gryfwK2ByOaNmQA9qhA2pU7rJ6O7G0KYoswTXNIksCsGU6sWg+ek1Y2Qh
   Ir+1bAzak/GjOVy90H21t6yQRnIUHjE1KmIDlB8hn+G5qfOhL6XXL6ZkJ
   w==;
X-CSE-ConnectionGUID: nyQPd4ifQEe88HPCa057Aw==
X-CSE-MsgGUID: UGTcvaJGQf+VOJnIOB/0FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55972702"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55972702"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 00:19:12 -0700
X-CSE-ConnectionGUID: 3tK7obAKQjyDJZeI/Pw3Zw==
X-CSE-MsgGUID: e44YR4iTT3yzcDaSUz1RDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161636120"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Jul 2025 00:19:10 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufvf2-000MWJ-1v;
	Sun, 27 Jul 2025 07:19:08 +0000
Date: Sun, 27 Jul 2025 15:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [avpatel:riscv_trace_support_v1 69/84]
 ./include/generated/asm-offsets.h:334:9: warning: 'NR_CPUS' macro redefined
Message-ID: <202507271553.Fgmuwj93-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   98af6b96ffbc0a67f7b2e6d66b366fe05d008adf
commit: 7148a1b3cd1fe5034e3e5cdbc4962f420dbfab21 [69/84] drivers: firmware: add riscv SSE support
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20250727/202507271553.Fgmuwj93-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507271553.Fgmuwj93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507271553.Fgmuwj93-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from samples/ftrace/ftrace-direct.c:7:
   In file included from arch/riscv/include/asm/asm-offsets.h:1:
>> ./include/generated/asm-offsets.h:334:9: warning: 'NR_CPUS' macro redefined [-Wmacro-redefined]
   #define NR_CPUS 64 /* NR_CPUS */
           ^
   include/linux/threads.h:21:9: note: previous definition is here
   #define NR_CPUS         CONFIG_NR_CPUS
           ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
