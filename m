Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029BD1C2AA;
	Sun, 12 Jul 2026 01:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783820076; cv=none; b=T0UheTwgxD4BApAdUuZolFMF/8mA7QvzaFJGVx3I68zvrTLF7o5+flX1CyLEXStOGR3ATXTzrAlHMhlBmPR1+L9NPPHmPfPc5GJE9LZXIxq4cE3rnW/uozZF56N5Za9JU384uqT5ri/d9L/Bvnidn4rpJEw2TRZrh0vSMuWgqEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783820076; c=relaxed/simple;
	bh=UZBZzBbplXSsak8/Dic8aLO8brkQP82H27fieWq9/EA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CdTzUa1V5fYBOuLQIEzbDI2EYopOnIqarYzPxfFT1qhdu6+kztPKwOEw1zUbD+0DGTDlbvIrDxZBEhj9491bieOAwMb2ueI4I8ejUOUDzyycFOAMlLlTajlruMM0clDN0Rc/H09wd6s83iV77CHM9uIgNAbCNAwyMN9gUIkK6cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+ppVor7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+ppVor7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783820073; x=1815356073;
  h=date:from:to:cc:subject:message-id;
  bh=UZBZzBbplXSsak8/Dic8aLO8brkQP82H27fieWq9/EA=;
  b=m+ppVor7L0aUtqjetFLC2tQ41ZZx9wh3jpuR1QVv/rdKGeqX27GExVF+
   uewSihxh0CYZ9U0dggTB3hi/4xkJsAdWZE+uXbADnfEK0u4C2Dr5AGSFy
   xu5mAkbzA2FY+hVh0MrLrpBl9CDtvXpvUtu6tqaKBHTNlAaUYVM/sA1tq
   pSwqIhG+HMdjYqW8RoY71UMGj86HKmsCbDSzPYHsx/H/F8Cnk5ZyUlX5o
   lOGXeA1/D5/NI/wgdecq/HD9QpEWKdwKwhq1mh+0pZhLD/5APSn5CW4L8
   C8zgpd4j2nMJ6UBcbCHL68F5z3SqJh6JAEuMEqxYfZoOWnaB+ft4eqB+Y
   A==;
X-CSE-ConnectionGUID: Z2OOZrD4R4yCTK2t6LEZEg==
X-CSE-MsgGUID: qhHu24oeScWWqUq1uw0hZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94829489"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94829489"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 18:34:33 -0700
X-CSE-ConnectionGUID: 9fe0BP0pQbGxGApSBKNzCA==
X-CSE-MsgGUID: oAI/Zn/nRGilxZbdB0noog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255865449"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 11 Jul 2026 18:34:32 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wij5R-000000003Td-150a;
	Sun, 12 Jul 2026 01:34:29 +0000
Date: Sun, 12 Jul 2026 03:34:09 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 58/59]
 arch/x86/kernel/apic/hw_nmi.c:29:15: error: use of undeclared identifier
 'cpu_khz'
Message-ID: <202607120340.wT6082g7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 27019f00127af90a16c3b8c54e976cdc8a711b0a [58/59] x86: Select ARCH_HAS_RANDOM_ENTROPY
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260712/202607120340.wT6082g7-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120340.wT6082g7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607120340.wT6082g7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/apic/hw_nmi.c:29:15: error: use of undeclared identifier 'cpu_khz'
      29 |         return (u64)(cpu_khz) * 1000 * watchdog_thresh;
         |                      ^~~~~~~
   1 error generated.


vim +/cpu_khz +29 arch/x86/kernel/apic/hw_nmi.c

28b8235238fa39 Dave Hansen          2023-08-09  25  
05a4a95279311c Nicholas Piggin      2017-07-12  26  #ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
4eec42f3920430 Mandeep Singh Baines 2011-05-22  27  u64 hw_nmi_get_sample_period(int watchdog_thresh)
504d7cf10ee42b Don Zickus           2010-02-12  28  {
4eec42f3920430 Mandeep Singh Baines 2011-05-22 @29  	return (u64)(cpu_khz) * 1000 * watchdog_thresh;
504d7cf10ee42b Don Zickus           2010-02-12  30  }
5f2b0ba4d94b3a Don Zickus           2010-11-12  31  #endif
504d7cf10ee42b Don Zickus           2010-02-12  32  

:::::: The code at line 29 was first introduced by commit
:::::: 4eec42f392043063d0f019640b4ccc2a45570002 watchdog: Change the default timeout and configure nmi watchdog period based on watchdog_thresh

:::::: TO: Mandeep Singh Baines <msb@chromium.org>
:::::: CC: Ingo Molnar <mingo@elte.hu>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
