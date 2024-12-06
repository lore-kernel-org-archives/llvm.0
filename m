Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A0F201104;
	Fri,  6 Dec 2024 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733480216; cv=none; b=Nidp3YBOxLIkuJ8oZ2gNDvixrUbiejhbhWugZJFwgdVfkygx+j85GFLIAm2zbAEHaHMC+OQfzbap+y61TkcT78CKiTbFHW/GN5ZyyZK6+Z1htHfeUxSGhx6SbiTYHGuR6GrLO99Hc8+ZULWwttQHdqF5kqdmi7c+dw4G8YpTHKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733480216; c=relaxed/simple;
	bh=7FjjWDLe4JtTF5vOGH18ZBI7nFbYj0Q+DlRSQUj2LSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m2QHGGBHdFQYn0Z5+0MVWYeLSFDgagtGQ1KBqbHGImh8SEXVwHr1vkhGnashYiZ+PCdYayq3ZjMkD8gX0R2oSv+CkuntR6QJklIg1tp14rmM3FJqg4a4Hn7rJy4E7lNTUEiJ20D1DPBLq13ly+nu7V/KTM29gPB0iv4YJ9wA1tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1i9AKcK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1i9AKcK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733480213; x=1765016213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7FjjWDLe4JtTF5vOGH18ZBI7nFbYj0Q+DlRSQUj2LSQ=;
  b=M1i9AKcK/sq/eLAxKeveK3Ekbvgp7FUOUmQkt4b+/06llmMqJMgSjMyn
   2bjcgFGgxAJALXjn2rXmRTS6xRl0lQQnb/M/aahwrQGpsnF0Y7Flw3iCH
   BOO+S3uVGnBDjody2gxpIEAGMlCebfZVgalQU0GpZOsOJVa+v+Z9mIB+Z
   BZtzLbt2+CzT9AshvhdUWi1ZsYPTt/z4m88LsTdOx6N9qceGEpVghgRhb
   Nl5UKOMg8Z1PLVPHeLE7VqC0AQuyPX3I4RinR9RXqLNC6ZMh43D7KA9Qf
   gfRtVgVi/0/ewPSQHhG64YY+Txyg/6q7eTUoSZTyPLMCYAOWGjS1ieQSt
   g==;
X-CSE-ConnectionGUID: f5H8cwQyRfihUwoNhZashg==
X-CSE-MsgGUID: IwoGw2VORuGTyawmbGj4/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="44497805"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="44497805"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 02:16:52 -0800
X-CSE-ConnectionGUID: PwwnP0fKSIKq26dlI1U71w==
X-CSE-MsgGUID: ZkJUhPiiRpekVLNVf2fGvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="94818278"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Dec 2024 02:16:51 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJVOC-0000vP-0E;
	Fri, 06 Dec 2024 10:16:48 +0000
Date: Fri, 6 Dec 2024 18:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 18/19]
 arch/arm64/kernel/ftrace.c:147:15: warning: no previous prototype for
 function 'arch_ftrace_get_symaddr'
Message-ID: <202412061804.5VRzF14E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   e6369db4372d722c47a45887eeb6a0f483c20ced
commit: e01d449c6f4e427bd6a67f3c1eee29f46ac59770 [18/19] ftrace: Add ftrace_get_symaddr to convert fentry_ip to symaddr
config: arm64-randconfig-001-20241206 (https://download.01.org/0day-ci/archive/20241206/202412061804.5VRzF14E-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061804.5VRzF14E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061804.5VRzF14E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/ftrace.c:147:15: warning: no previous prototype for function 'arch_ftrace_get_symaddr' [-Wmissing-prototypes]
   unsigned long arch_ftrace_get_symaddr(unsigned long fentry_ip)
                 ^
   arch/arm64/kernel/ftrace.c:147:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long arch_ftrace_get_symaddr(unsigned long fentry_ip)
   ^
   static 
   1 warning generated.


vim +/arch_ftrace_get_symaddr +147 arch/arm64/kernel/ftrace.c

   145	
   146	/* Convert fentry_ip to the symbol address without kallsyms */
 > 147	unsigned long arch_ftrace_get_symaddr(unsigned long fentry_ip)
   148	{
   149		u32 insn;
   150	
   151		/*
   152		 * When using patchable-function-entry without pre-function NOPS, ftrace
   153		 * entry is the address of the first NOP after the function entry point.
   154		 *
   155		 * The compiler has either generated:
   156		 *
   157		 * func+00:	func:	NOP		// To be patched to MOV X9, LR
   158		 * func+04:		NOP		// To be patched to BL <caller>
   159		 *
   160		 * Or:
   161		 *
   162		 * func-04:		BTI	C
   163		 * func+00:	func:	NOP		// To be patched to MOV X9, LR
   164		 * func+04:		NOP		// To be patched to BL <caller>
   165		 *
   166		 * The fentry_ip is the address of `BL <caller>` which is at `func + 4`
   167		 * bytes in either case.
   168		 */
   169		if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS))
   170			return fentry_ip - AARCH64_INSN_SIZE;
   171	
   172		/*
   173		 * When using patchable-function-entry with pre-function NOPs, BTI is
   174		 * a bit different.
   175		 *
   176		 * func+00:	func:	NOP		// To be patched to MOV X9, LR
   177		 * func+04:		NOP		// To be patched to BL <caller>
   178		 *
   179		 * Or:
   180		 *
   181		 * func+00:	func:	BTI	C
   182		 * func+04:		NOP		// To be patched to MOV X9, LR
   183		 * func+08:		NOP		// To be patched to BL <caller>
   184		 *
   185		 * The fentry_ip is the address of `BL <caller>` which is at either
   186		 * `func + 4` or `func + 8` depends on whether there is a BTI.
   187		 */
   188	
   189		/* If there is no BTI, the func address should be one instruction before. */
   190		if (!IS_ENABLED(CONFIG_ARM64_BTI_KERNEL))
   191			return fentry_ip - AARCH64_INSN_SIZE;
   192	
   193		/* We want to be extra safe in case entry ip is on the page edge,
   194		 * but otherwise we need to avoid get_kernel_nofault()'s overhead.
   195		 */
   196		if ((fentry_ip & ~PAGE_MASK) < AARCH64_INSN_SIZE * 2) {
   197			if (get_kernel_nofault(insn, (u32 *)(fentry_ip - AARCH64_INSN_SIZE * 2)))
   198				return 0;
   199		} else {
   200			insn = *(u32 *)(fentry_ip - AARCH64_INSN_SIZE * 2);
   201		}
   202	
   203		if (aarch64_insn_is_bti(le32_to_cpu((__le32)insn)))
   204			return fentry_ip - AARCH64_INSN_SIZE * 2;
   205	
   206		return fentry_ip - AARCH64_INSN_SIZE;
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
