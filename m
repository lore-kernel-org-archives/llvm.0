Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A853E1FF5E3;
	Sun, 12 Jul 2026 14:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783866108; cv=none; b=uYYuekteapnWJPuWw6vpSXcW30zbimSgFk0taCpGd+7TI5jqIfhOzOMtsxC/rhjOyR1xylkohM+tySSS9J58EES7821VLEQgRMeht6dAIHPp2ivAgP3zgG57RDTCeVRrANKatWfMQ7SgCL+HBJGJKe7SASNZrEKCaPgHytupsik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783866108; c=relaxed/simple;
	bh=jMCw8F7y3IsWsV/qUMov2Qw2sODxS7+VwrTywsNWQ+w=;
	h=Date:From:Cc:Subject:Message-ID; b=oWaQDjw1ti93RS8RpPTg/H9tz4b9QvR94PMLcL27LVqsL+QEL3LOg8VJ80amzeM5w+WlCAok/jhHw/nBumYqE0xr/++79PJZXCVmECaJls2L1hTmx1DYj8Oe0JWsqMRcK6u7FYxULA7+cNI7skoMgtXhk43YfWeVhjAiVWMHgfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAIfEgQ+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAIfEgQ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783866105; x=1815402105;
  h=date:from:cc:subject:message-id;
  bh=jMCw8F7y3IsWsV/qUMov2Qw2sODxS7+VwrTywsNWQ+w=;
  b=RAIfEgQ+JModzYl3GoFp+f/hyAHRqsJhVwclS2n3wM8c40FKxgXctDJK
   mhEBugsnl7LI/MHDx5w8omO5xbcnO7j89C4xIVhUd8EmZvkfZuTn4xkij
   mPQCLu/QC+MtBQepiaqxJ9stmv2mucdZ+bfWPoIiVTX4o77v4y01vVJGr
   V7ZUPo8NshJqCqfV/QqSp9kgz6YtYUYxqGX7R/fvcL8k81wTPM3sf9zGY
   eev170rDvXFcWZaXXulRrgvwRj20jcwgBR8ZcybOQdFSoT92qbWs7Dky2
   0A9DhQHrX0fsjgXVCk77zHjBFyW+qhMZp9WHq6MKIjNA++pQvgCSUrG+1
   A==;
X-CSE-ConnectionGUID: /FMGR1fcQSGMYvDGFk/KIQ==
X-CSE-MsgGUID: AmEXxRICTmSFmgYetv2aLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107295123"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107295123"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 07:21:45 -0700
X-CSE-ConnectionGUID: C/ez+rxdStu5jT20Hld1gQ==
X-CSE-MsgGUID: nFhdxqgfToqn6tZsCnjVNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="293520610"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 12 Jul 2026 07:21:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiv3t-00000000KuM-27Kn;
	Sun, 12 Jul 2026 14:21:41 +0000
Date: Sun, 12 Jul 2026 22:21:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:locking/core 4/9] ld.lld: error:
 vmlinux.a(fs/namei.o):(function getname_flags: .text+0x1c): relocation
 R_RISCV_HI20 out of range: 563901 is not in [-524288, 524287]; references ''
Message-ID: <202607122232.5iBywkxh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

TO: K Prateek Nayak <kprateek.nayak@amd.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Charlie Jenkins <thecharlesjenkins@gmail.com>
CC: Guo Ren <guoren@kernel.org>

Hi Prateek,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   79d3fca9230cbd2108fa34ec54f2b1a319057252
commit: af9ae17c5bcc45648d9acf85b28369ed66e31e0f [4/9] riscv/runtime-const: Replace open-coded placeholder with RUNTIME_MAGIC
config: riscv-randconfig-002-20260712 (https://download.01.org/0day-ci/archive/20260712/202607122232.5iBywkxh-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607122232.5iBywkxh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607122232.5iBywkxh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(fs/namei.o):(function getname_flags: .text+0x1c): relocation R_RISCV_HI20 out of range: 563901 is not in [-524288, 524287]; references ''
   >>> referenced by namei.c:147 (fs/namei.c:147)
   >>> defined in vmlinux.a(fs/namei.o)
--
>> ld.lld: error: vmlinux.a(fs/namei.o):(function getname_uflags: .text+0xdc): relocation R_RISCV_HI20 out of range: 563901 is not in [-524288, 524287]; references ''
   >>> referenced by namei.c:188 (fs/namei.c:188)
   >>> defined in vmlinux.a(fs/namei.o)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
