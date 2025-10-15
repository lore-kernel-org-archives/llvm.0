Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227F02D061B;
	Wed, 15 Oct 2025 20:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760561934; cv=none; b=qyEbn3ohezw5VrrLcefetUtdzyELBWUByWbjjNh4/wHPtCwYAiFZYGLSLmG9Tt8oijUuMBYMXOATGo0uSqhja2JbAVOAM0xafRkkSZHbweA5VJtXP5k5NSnAlJkrxSLD/3oVc7Q9Q9trAVQMmhxKfppEgOgKY5ysOqFWSai0sdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760561934; c=relaxed/simple;
	bh=j7tLpJkQ2403J44PFm0M0xioWFYXeloLWMOvyjHAZ9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bpM5UlKxMl9Q11aJtySKNyrvhbPKa48+giLbwGcyu3oh4nhH/MF9CrugQ+iheCGqurrhXaUVajvv8detR9n5HN7tTAE/IiOrTNSwdt3+1Yoc7cucNAD3U4y6+cK1gSmi+X6/I5P/42MolsbDKYkKXsnGBoUFZ62hfq24Mz5kjcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lf7tXXL4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lf7tXXL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760561932; x=1792097932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j7tLpJkQ2403J44PFm0M0xioWFYXeloLWMOvyjHAZ9w=;
  b=Lf7tXXL4mH496A1UirgnVMp7s3dyHbM5HVwFxOkfnrsCjW4J1WHFDFQG
   yi5YJgXgMG5/p/r9ArcU6G7MLxe7q5T3mTKKcpMsBlEMM58KyoD5gTX1h
   HymdmBr+Hf72EUtXaBTFZ+f9H8c3J14QllBZM6d/j1UDljinXESkYwT0D
   S0hM/DUQbzsqLhQTwK6HSYhoyHY3YihgOHaDS3mXJ90KoOLkpDFRC46IB
   lwckRuwaiN8IlZME7ft5W1OgEpmlHk3YidxWXq7K1yjB6Df28uBh1R7J1
   KMMdUp+CljAVUHGpWNuKQgtp7BShnrEyeLYs0YseBzDw8n0dr1l1LDHB+
   g==;
X-CSE-ConnectionGUID: 7ZRDDMV+SVu+aXltm8ml1w==
X-CSE-MsgGUID: HzxsMn41T8mfYKsMDTK3TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73348569"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="73348569"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 13:58:51 -0700
X-CSE-ConnectionGUID: ERi2th30SZOnxLhMJ8rSUg==
X-CSE-MsgGUID: 0mg+24sRSNKXvPQCVKwVYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="182260199"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 15 Oct 2025 13:58:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v98a6-0004Dz-1u;
	Wed, 15 Oct 2025 20:58:46 +0000
Date: Thu, 16 Oct 2025 04:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jeff Kirsher <jeff.kirsher@gmail.com>,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: [jkirsher-net-queue:master 4/4]
 arch/arm64/net/bpf_jit_comp.c:2258:6: warning: no previous prototype for
 function 'bpf_jit_supports_private_stack'
Message-ID: <202510160449.pcIYMJSz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/net-queue.git master
head:   c9a8544415241209a476e56cc98a09ab074e29a8
commit: c9a8544415241209a476e56cc98a09ab074e29a8 [4/4] bpf: Add support for certain atomics in bpf_arena to x86 JIT
config: arm64-randconfig-004-20251016 (https://download.01.org/0day-ci/archive/20251016/202510160449.pcIYMJSz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160449.pcIYMJSz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160449.pcIYMJSz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/net/bpf_jit_comp.c:2258:6: warning: no previous prototype for function 'bpf_jit_supports_private_stack' [-Wmissing-prototypes]
    2258 | bool bpf_jit_supports_private_stack(void)
         |      ^
   arch/arm64/net/bpf_jit_comp.c:2258:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2258 | bool bpf_jit_supports_private_stack(void)
         | ^
         | static 
>> arch/arm64/net/bpf_jit_comp.c:3096:6: warning: no previous prototype for function 'bpf_jit_supports_timed_may_goto' [-Wmissing-prototypes]
    3096 | bool bpf_jit_supports_timed_may_goto(void)
         |      ^
   arch/arm64/net/bpf_jit_comp.c:3096:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3096 | bool bpf_jit_supports_timed_may_goto(void)
         | ^
         | static 
   2 warnings generated.


vim +/bpf_jit_supports_private_stack +2258 arch/arm64/net/bpf_jit_comp.c

91fc957c9b1d6c5 Ard Biesheuvel 2018-11-23  2257  
6c17a882d3804dc Puranjay Mohan 2025-07-24 @2258  bool bpf_jit_supports_private_stack(void)
6c17a882d3804dc Puranjay Mohan 2025-07-24  2259  {
6c17a882d3804dc Puranjay Mohan 2025-07-24  2260  	return true;
6c17a882d3804dc Puranjay Mohan 2025-07-24  2261  }
6c17a882d3804dc Puranjay Mohan 2025-07-24  2262  

:::::: The code at line 2258 was first introduced by commit
:::::: 6c17a882d3804dce1c66e1fec25f96d39a184067 bpf, arm64: JIT support for private stack

:::::: TO: Puranjay Mohan <puranjay@kernel.org>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
