Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE363A1CD;
	Sun,  4 Jan 2026 20:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767556946; cv=none; b=W7zVm33b28CGnZA64oRGA5fYycZ5WblKYU/0I6UjlJmFCgjaQswBpNhSxxrpgwV9qcuKlz8co8wfVSs/L4ugQCJAV94fPVknYf9uPu0zARreemqdqIlWdmR5nf/JExXhvLq1uJBOkpKXdssmbiKNfL8LWlMhlNVVGj6bMsTDGq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767556946; c=relaxed/simple;
	bh=Y9ivLc3/6UA5b1BL4xU+Qc5YDdxrj6fvdTp9IZIZOQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pk5zK0IsKG2ZsJ5nZbGK+q5b+UqDnfsyUHlS7lWo8wroR2qJ0RjTpCkKIVJevl6d8QCBdlgF5Kd87pmGNX+lVs6flRCLUCORQbBOuZOY/FHLPvqECDJNUBTiCZWZjjO3WSAFi8M+6QYcR4UeW9k6yvojsa6iwh3Ok1Qtj8JRg+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USmq4lHL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USmq4lHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767556944; x=1799092944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y9ivLc3/6UA5b1BL4xU+Qc5YDdxrj6fvdTp9IZIZOQI=;
  b=USmq4lHLXKz0Xg/9LxLOgoaEm31pFVouHobx3qmfaXnKnoxtCO2tJnBk
   9zDn2inVw+CPFHvmhF5vLJlInUPX4hG0sMO33lztzGmhdPcO7iH70bllA
   wIapF7H4uuYSzeP5ZkxKNw2/RP355lU4Y0eFcAXpLLvtA1/g/jmadUTr6
   tXHo4jH5tSI5VRnat21Bqw6I4/2dymifNwtS2kc3glIHUkxtIRYOzYkYN
   hujYkK8EuFECExNvL1/yhEeSmS1DW5r+Px9OJ+xvJyJllBiqcH5dx0g6x
   4lXIabiCKiHIw1PcwpIPO9QVg6cNcfTWEC/Xm/yS+3WBiVz8u/F6JUWdr
   w==;
X-CSE-ConnectionGUID: ckB38sZEQHq/GNik0a8aqQ==
X-CSE-MsgGUID: bExCzVhYSzqOVt8Ps4CyRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="72786252"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="72786252"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 12:02:23 -0800
X-CSE-ConnectionGUID: XR5bJNcDQ6uIWp9dYnof7A==
X-CSE-MsgGUID: jRczdp6dSVaEZFQVG1Y7KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="206779188"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Jan 2026 12:02:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcUIu-000000000kf-2SZe;
	Sun, 04 Jan 2026 20:02:20 +0000
Date: Mon, 05 Jan 2026 04:01:58 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Cl=C3=A9ment?= =?utf-8?Q?_L=C3=A9ger"?= <cleger@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>,
 Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [avpatel:riscv_trace_support_v3 23/52] ld.lld: error:
 insufficient padding bytes for R_RISCV_ALIGN: 2 bytes available for requested
 alignment of 4 bytes
Message-ID: <202601050302.WYAVzOpn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v3
head:   5f775d2c6c5439d7fdff647375b6382ba14cb496
commit: 436870e0815c944d7287f1e30e8de020677850fe [23/52] drivers: firmware: add riscv SSE support
config: riscv-randconfig-002-20260104 (https://download.01.org/0day-ci/archive/20260105/202601050302.WYAVzOpn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601050302.WYAVzOpn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601050302.WYAVzOpn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 2 bytes available for requested alignment of 4 bytes
>> ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 2 bytes available for requested alignment of 4 bytes
>> ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 2 bytes available for requested alignment of 4 bytes
>> ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 2 bytes available for requested alignment of 4 bytes
>> ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 2 bytes available for requested alignment of 4 bytes

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
