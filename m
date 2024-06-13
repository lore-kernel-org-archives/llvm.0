Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2F35A4FD;
	Thu, 13 Jun 2024 07:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718263484; cv=none; b=fxmknWw57si47AZK9PqKt7DWQAxtTB+YxzXDVlpiUQZ9ucqlxQRAv17mTbwvrGg/L8Opah8OYa+vxE/NHBKVG95SNcbhobOJ1rQZIZ8Z6UAhf0MQabzHLQB5jkHXYUy8NXezgxUpDUcEtkwxsWHge/KIJFTtHHzZsE/NrZTzSYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718263484; c=relaxed/simple;
	bh=UlGqCdzT+5lfQviT1Tf4SwXpYwVs+qlLIIPpGJ5vLLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fIHNI66IAZCoZ4OeDSAr/mzzt6BJeia/7bvufcZbwRCBF42DRU5QRkJDviPHIOEq9c0TrWo4MxjpH52WMnD5q0iLLjd+eKsyKA58SFJ1+73RiVWP0M4YitX5QB68qwpm+2vBGBOvmN4ddKR2JkI368G+oNRE2p4NgSsDGbJD+5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jApFBbMF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jApFBbMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718263483; x=1749799483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UlGqCdzT+5lfQviT1Tf4SwXpYwVs+qlLIIPpGJ5vLLk=;
  b=jApFBbMFrKtbbZA/NKUaSM1yzoaQosefACBNIOrPJDvn2HYf5N9331AJ
   58Jgxuba5kdYt9R9VSQwt6oKWmzMsbplLotidhOKMN8cQ6crhEHIAesrK
   DerPMXYZv1IQ7dKvxeSTh2lttqaxHWt8wex99ZOW5XPQan5SINwP2giHu
   GtQHpIe5GYlXc8xuvfpjWE7BY1C/5f0TrZBM7CjWA7LQWJJwuyt0cTB3j
   SLstzlQHaHis1tfC4Ssah2qrGiPDwlukMgDEaHd3Sor0jIMiviFnhzgsI
   /RnbMJvKqeieJtKlhnyqs1SrLbfMeJh5WKOpm7KrFo1ID/rtCBcT31ufw
   Q==;
X-CSE-ConnectionGUID: U8MUKLPBSGeSOeir/4hwig==
X-CSE-MsgGUID: Swg90spRRj2iCz7oqepWJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14939728"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="14939728"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 00:24:42 -0700
X-CSE-ConnectionGUID: Tncw7NLPSWarSTHV5jZn7w==
X-CSE-MsgGUID: fY4AP2L1RKGtDzUI67ByIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="44434570"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2024 00:24:41 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHep5-0002Jj-0f;
	Thu, 13 Jun 2024 07:24:39 +0000
Date: Thu, 13 Jun 2024 15:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot+extras/v6.10-rc1 126/127]
 arch/x86/include/asm/resctrl.h:148:33: error: too few arguments provided to
 function-like macro invocation
Message-ID: <202406131519.PW7OYEbe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot+extras/v6.10-rc1
head:   928de66ad5fff2f15e2478fec40f5fbb4532314e
commit: b2c797b4b20c2a70a022477d75d5de1cdd78480e [126/127] fs/resctrl: Add cranky debug for reading CPU msr values
config: i386-buildonly-randconfig-003-20240613 (https://download.01.org/0day-ci/archive/20240613/202406131519.PW7OYEbe-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131519.PW7OYEbe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131519.PW7OYEbe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/proc/base.c:97:
   In file included from include/linux/resctrl.h:12:
>> arch/x86/include/asm/resctrl.h:148:33: error: too few arguments provided to function-like macro invocation
     148 |         return rdmsr(MSR_IA32_PQR_ASSOC);
         |                                        ^
   arch/x86/include/asm/msr.h:260:9: note: macro 'rdmsr' defined here
     260 | #define rdmsr(msr, low, high)                                   \
         |         ^
   In file included from fs/proc/base.c:97:
   In file included from include/linux/resctrl.h:12:
>> arch/x86/include/asm/resctrl.h:148:9: error: use of undeclared identifier 'rdmsr'
     148 |         return rdmsr(MSR_IA32_PQR_ASSOC);
         |                ^
   2 errors generated.


vim +148 arch/x86/include/asm/resctrl.h

   145	
   146	static inline u64 resctrl_arch_get_cpu_msr(void)
   147	{
 > 148		return rdmsr(MSR_IA32_PQR_ASSOC);
   149	}
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
