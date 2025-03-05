Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31DF1DC9B3;
	Wed,  5 Mar 2025 07:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741158931; cv=none; b=fQfuw7z5nVUd5QuX/RONEVJwz2/uH443pOFsy9E9eNm2jkTvAt04uMVwNmB2TUSpJKPL2melkO077vlm6i6j33QPU6nhxlbz+Z+IEbh4CDiWlRRN8aEkvYpWWAfc8blGpzp5UYvJreOUpRRyDF5lWo42YCVm4Fv8bNHNXhuzXiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741158931; c=relaxed/simple;
	bh=puHllwnlCwr9b/WA2+n6Zto6iL+U1L6Kqge2xukgvR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=npKDIQLYzkuGudLOgFaeZB1tnlbIZOh8xKEKxYCRomYSmywQ13DWNBv47AWJEieVt5+I9GqH3JodLq4dY6xxuNfTGfA5dF0baOEOSm3TyN15flNEoAj2p4OpAmzlXazy2lzc4wY807VrqtB8dE8z9Wb+LDqiJwLZpFhj7CW0J+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SaNGUz0D; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SaNGUz0D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741158930; x=1772694930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=puHllwnlCwr9b/WA2+n6Zto6iL+U1L6Kqge2xukgvR8=;
  b=SaNGUz0DQP9XuOpQADKCaARxYLkma+xWUuuZ0oiPy9J1nU6PZQm8wWZI
   1PtGUxIIQd2uYT3LTlvLIhBp4mg3BmGfJm+tfSjqnwGaVcoQ9sPV48fDV
   g38+ese3XoP7rnFBdGLnIo6UMGxzCobccOCyFpCrfLxLWk1Jq7dxzkwZ0
   DvRpNRo/yBP3ONGYermnUzjK8mHdVOuJjQZeyhBJNVDg0fZH864kiZgDg
   7NdmtDlvNx7eI96DPmaUQh8MTChJUn4gtFdSrhP2GVTzDC8K9ehJHZPUs
   Rvpk9ThQSsFNsiBfIGJMB8umZc1dhGpiT0LqI86AdeQGLuRSLV7zlN8TO
   w==;
X-CSE-ConnectionGUID: hu7JYblHRg25WfJIYQg8Rg==
X-CSE-MsgGUID: wr5UCdbNRoSq2oyt8Seh4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41966860"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="41966860"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 23:15:30 -0800
X-CSE-ConnectionGUID: EQkMCLeOTbu33nM3BTW1FA==
X-CSE-MsgGUID: xkou8oacREyo/CxfYX5YLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="118328701"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2025 23:15:28 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpiyU-000KhW-0A;
	Wed, 05 Mar 2025 07:15:26 +0000
Date: Wed, 5 Mar 2025 15:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:string-helper-2025-03-04 52/264]
 arch/arm/mm/pmsa-v7.c:473:4: error: call to undeclared function
 'str_yes_no'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202503051517.tw7zpZN5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux string-helper-2025-03-04
head:   dc1f35422c705e8df42322c71936bd12213d0a46
commit: 02c2077b2f4be41510bc150cc157d523b63020d4 [52/264] arm: mm: pmsa-v7: use string choices helper
config: arm-randconfig-002-20250305 (https://download.01.org/0day-ci/archive/20250305/202503051517.tw7zpZN5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503051517.tw7zpZN5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503051517.tw7zpZN5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/arm/mm/pmsa-v7.c:473:4: error: call to undeclared function 'str_yes_no'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     473 |                         str_yes_no(mpu_iside_independent()),
         |                         ^
>> arch/arm/mm/pmsa-v7.c:473:4: warning: format specifies type 'char *' but the argument has type 'int' [-Wformat]
     472 |                          "Region independence: %s, Used %d of %d regions\n",
         |                                                ~~
         |                                                %d
     473 |                         str_yes_no(mpu_iside_independent()),
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:574:34: note: expanded from macro 'pr_info'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ~~~     ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning and 1 error generated.


vim +/str_yes_no +473 arch/arm/mm/pmsa-v7.c

   451	
   452		/* RAM */
   453		for (i = 0; i < ARRAY_SIZE(mem); i++) {
   454			if (!mem[i].size)
   455				continue;
   456	
   457			err |= mpu_setup_region(region++, mem[i].base, ilog2(mem[i].size),
   458						PMSAv7_AP_PL1RW_PL0RW | PMSAv7_RGN_NORMAL,
   459						mem[i].subreg, false);
   460		}
   461	
   462		/* Vectors */
   463	#ifndef CONFIG_CPU_V7M
   464		err |= mpu_setup_region(region++, vectors_base, ilog2(2 * PAGE_SIZE),
   465					PMSAv7_AP_PL1RW_PL0NA | PMSAv7_RGN_NORMAL,
   466					0, false);
   467	#endif
   468		if (err) {
   469			panic("MPU region initialization failure! %d", err);
   470		} else {
   471			pr_info("Using ARMv7 PMSA Compliant MPU. "
   472				 "Region independence: %s, Used %d of %d regions\n",
 > 473				str_yes_no(mpu_iside_independent()),

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
