Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4653374736;
	Tue,  7 Apr 2026 03:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533766; cv=none; b=VFp89ZIjLB3fp1ZpR2dDLNWuEeG1lmP+S2iUVA1FVltEpJrWRsfukWNWBx2hTXa3ED+3BD5UCjbU+NpfFhgcYNfP/0vFgnJqd9sW4Bn9A7kC5rplJIJa69GUAKkA/+dFeZW+SpZ+JbDcn1Hv004LrEAymsPo8taklK3rD8w5Mhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533766; c=relaxed/simple;
	bh=YZSRcu/ePjhbAsGnEjHiG0g5nc278Ti4pcWmE3LBz3U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sy0mVIRsXfdviXA2qgbn4F85ZUip4wHxo3TgTE4B9kyVQjoktWyTB9J5fxhGEdsnqRqH3aqTo8GP4TXNk7xUW3u8aLDEmYhaVhhweuI+yst/YpfPwjZ90r+ZU5MQCdeiqqWHvAntxO4W/7zF3h7PNdDkwv75L26mwkQ25D/TeV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3rEhADP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3rEhADP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533764; x=1807069764;
  h=date:from:to:cc:subject:message-id;
  bh=YZSRcu/ePjhbAsGnEjHiG0g5nc278Ti4pcWmE3LBz3U=;
  b=U3rEhADPbWoPikeRPC2x8Xu+bsdoePUfzTvpH5XnlCjhkmD+8nD5yBgH
   HqCEPfKLCpNilSIX/NrjdyMYVPY/aadKGjG0tMbbENUhxyDNWHmDOhZGC
   c9dzn2a7AK6WtlSWrJQMobMehoTS749/eR5cJn5rF2WJ7e6UKTzqaID2F
   rQ/ULC/Tm9qy987hQbuelagTqAybxZEzGDuNkaL7AE5FNtq6Bk6D6Jf0l
   bNrsvkWCOzAoRlYtYF8BInRHNNuLOMP+eZMfT718Htb2aqIYutH+NltCk
   Og6vv42t7qjlPMjU0ieEHrjpVTlUcSTiGOrnZGOTJ96V9fx7ZhRaxUFCB
   A==;
X-CSE-ConnectionGUID: MKsbY5ilSu2TK+m2A5JzYw==
X-CSE-MsgGUID: PAqvQ9YHTSWlQVFAL7bY8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87191971"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87191971"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:49:22 -0700
X-CSE-ConnectionGUID: hGqpek0SSuuy6nO2mWKjJA==
X-CSE-MsgGUID: iTsnamkOSGmeZZpfteueSA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Apr 2026 20:49:20 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xRG-0000000001N-0wEm;
	Tue, 07 Apr 2026 03:49:18 +0000
Date: Tue, 07 Apr 2026 11:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Dubey <adubey@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [linuxppc:next-test 41/45]
 arch/powerpc/net/bpf_jit_comp32.c:153:7: error: call to undeclared function
 'PPC_RAW_LI32'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202604040005.1ocss28U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/linuxppc/linux next-test
head:   e1f7a0e196e293c223a882788c6d1a884d06d6d8
commit: 92258b5bf1ec10204c23a793793a65dc92d17014 [41/45] powerpc32/bpf: Add fsession support
config: powerpc-randconfig-001-20260403 (https://download.01.org/0day-ci/archive/20260404/202604040005.1ocss28U-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040005.1ocss28U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040005.1ocss28U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/net/bpf_jit_comp32.c:153:7: error: call to undeclared function 'PPC_RAW_LI32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     153 |         EMIT(PPC_RAW_LI32(bpf_to_ppc(TMP_REG), (u32)func_meta));
         |              ^
   arch/powerpc/net/bpf_jit_comp32.c:157:7: error: call to undeclared function 'PPC_RAW_LI32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     157 |         EMIT(PPC_RAW_LI32(bpf_to_ppc(TMP_REG), (u32)(func_meta >> 32)));
         |              ^
   2 errors generated.


vim +/PPC_RAW_LI32 +153 arch/powerpc/net/bpf_jit_comp32.c

   144	
   145	void store_func_meta(u32 *image, struct codegen_context *ctx,
   146						u64 func_meta, int func_meta_off)
   147	{
   148		/*
   149		 * Store func_meta to stack: [R1 + func_meta_off] = func_meta
   150		 * func_meta := argument count in first byte + cookie value
   151		 */
   152		/* Store lower word */
 > 153		EMIT(PPC_RAW_LI32(bpf_to_ppc(TMP_REG), (u32)func_meta));
   154		EMIT(PPC_RAW_STW(bpf_to_ppc(TMP_REG), _R1, func_meta_off));
   155	
   156		/* Store upper word */
   157		EMIT(PPC_RAW_LI32(bpf_to_ppc(TMP_REG), (u32)(func_meta >> 32)));
   158		EMIT(PPC_RAW_STW(bpf_to_ppc(TMP_REG), _R1, func_meta_off + 4));
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
