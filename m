Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3103D1FC3;
	Thu, 23 Oct 2025 00:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761179797; cv=none; b=hGgm+AyVBxY581mel+lQ4zntBCKfGjmmzuw/Hr6ZPHkyEc8j0gKvd+7GrAs+vOQc57MRcyedRGBweqVOgnuwMoWqdM/WiIr0HEZ3q5jHhcLnm3/KPheSQcar6yTMgM+OYvMmpOm4GU3vpWMBtyG/BaBkHlXpillOzMLosh4KaNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761179797; c=relaxed/simple;
	bh=G+dXSBJLlOrCI3ro0toOORAH1fukzVjs60000xs8ol8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i5I2ryn3+tBCc7bc6xujDXKU+cuBdVFJEPMAsZYWNsQqzRfMjX7gWkAiLoU+f/Tuyh5Sf8BFmqKhGOkIVMR+/VPkJWG2ZJleL3AtbvT1noqj6aJRf+erw/xZlW6ATuzUlE6qdjZZhh1k73C2xfOQrV1tdOoMF6fzizRFeDc3698=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbt/iDAu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbt/iDAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761179796; x=1792715796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G+dXSBJLlOrCI3ro0toOORAH1fukzVjs60000xs8ol8=;
  b=fbt/iDAu0U0YMFWUJBvMASGpxp5kwBCQHvJfY24nCWSOBjTZM9Ll8LpH
   V3mPyytZk9PVofs11HYQFrlVoqIeAb6JHtXFsI89R0GPxj4K2rOXE66Y9
   nRmAPTvh9xr/LG4rDrzVEf+eBL3daUvQE7LJnt4GFO4/3APsSoN4cBZTp
   6rVMEJOvuHJNggrBjiDQPuVjisgZsoHuP5P9hWxvNqSgNmkPkyIMycIv+
   Skkn1vAj4SS0tKECNqxjl6f/kf69P2DJq+tSvYczNDk4NVmi9bEYAT5ZL
   N+vajt0nKVx1GcdvXY8djcPIaStzjuP0cNg/oSSe1W7Ra/67x7HOijbba
   Q==;
X-CSE-ConnectionGUID: LlwgWAP0QSuMIsRUJ4MEzQ==
X-CSE-MsgGUID: fI5T6fj9SCy9kunMHTOMRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63435287"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="63435287"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 17:36:35 -0700
X-CSE-ConnectionGUID: HrLQ3p47SWGx2jc6fl/iRw==
X-CSE-MsgGUID: V/KO6Q6aSHSFwiXWmBPu1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="184496803"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Oct 2025 17:36:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBjJg-000Crh-1o;
	Thu, 23 Oct 2025 00:36:32 +0000
Date: Thu, 23 Oct 2025 08:36:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/single_direct_ops 2/9] ld.lld: error: duplicate
 symbol: update_ftrace_direct_add
Message-ID: <202510230838.lAi1D40E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/single_direct_ops
head:   3d31a310468694e4395d61e15c65edaa618fbb5c
commit: c40f09f4f868f69ec494cbe90165980d549c4a6e [2/9] ftrace: Add update_ftrace_direct_add function
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251023/202510230838.lAi1D40E-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230838.lAi1D40E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230838.lAi1D40E-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: update_ftrace_direct_add
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_add) in archive vmlinux.a
   >>> defined at noinitramfs.c
   >>>            init/noinitramfs.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_add
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_add) in archive vmlinux.a
   >>> defined at do_mounts.c
   >>>            init/do_mounts.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_add
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_add) in archive vmlinux.a
   >>> defined at core.c
   >>>            arch/x86/events/intel/core.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_add
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_add) in archive vmlinux.a
   >>> defined at bts.c
   >>>            arch/x86/events/intel/bts.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_add
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_add) in archive vmlinux.a
   >>> defined at ds.c
   >>>            arch/x86/events/intel/ds.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_add
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_add) in archive vmlinux.a
   >>> defined at msr.c
   >>>            arch/x86/events/msr.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_add
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_add) in archive vmlinux.a
   >>> defined at knc.c
   >>>            arch/x86/events/intel/knc.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_add
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_add) in archive vmlinux.a
   >>> defined at ibs.c
   >>>            arch/x86/events/amd/ibs.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_add
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_add) in archive vmlinux.a
   >>> defined at lbr.c
   >>>            arch/x86/events/intel/lbr.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_add
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_add) in archive vmlinux.a
   >>> defined at p4.c
   >>>            arch/x86/events/intel/p4.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_add
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_add) in archive vmlinux.a
   >>> defined at p6.c
   >>>            arch/x86/events/intel/p6.o:(.text+0x0) in archive vmlinux.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
