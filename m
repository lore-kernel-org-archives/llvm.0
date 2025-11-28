Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04A281724;
	Fri, 28 Nov 2025 02:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764297714; cv=none; b=LH7JNdzI4OsJ9ZkPHbI88GNwK+zMbfZhedvvfKzVkb5ErRyy7MT8TPLG9Mf4/NqUtQo/kOi4XjNGHKljWOlsUHY/LJ1VBhnjcIGuOqtnAvjJTAdVpOA7Br8Pf4hKV/D9TOueZ929eAHgnVZ+oGaEHVjLSSVm0OHuvBGdESDA0Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764297714; c=relaxed/simple;
	bh=JrreKOGy8fVi0NuOuKgyab2Zvd9rEWjrB41J9wje3dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5SDwuJr6dr+IU4Rr8DwzihlGiOzxjJjDL1+rjcPDUcltCkL+19XRJ7X/0OvFzr6FPh6FL36kN/m2hQE1VX+GPLNlS1TNsZLv/aXAEtrIy00zqMMR9KRUrSbZBT1ravXxdB0CruvTGbIRnzHaQB57rYQgKm+aWjGIejVV+flJ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jn4cm4TZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jn4cm4TZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764297713; x=1795833713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JrreKOGy8fVi0NuOuKgyab2Zvd9rEWjrB41J9wje3dg=;
  b=jn4cm4TZTdvcmCvx9Wgrn8xrNC//FbBw9dP+0vrw7vywD42RJm8f3IfP
   UFxenq+6lEdOVCrCeK2zgLOhr1aliHJctZH+4bAjyvTC0QAv11MIQgogg
   kGltXmgeg35IVZtExEmjemTm7cNZSWhzaEwNOpz0qrj0kNly8qN7LyU5P
   0bbs4Fxque5oiJty8cUMpjs5EiwBePYPThsPk+zAKhYyw2u31EBO9WttI
   a3GZZPQWDVdtz91fwHtadWihA8XQuc+zX4pw1IHYo+lzJFeEQ2QgBYESN
   nnrTMSBzfRobHovb7n0LbtiNrsqCyU9dStZMf15lXzBDbfMAxSdJAou50
   A==;
X-CSE-ConnectionGUID: CswZzy2qRj+W5/g14oljEQ==
X-CSE-MsgGUID: 7YYN9mBPQ1iNNUFr7hfUYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66296060"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66296060"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 18:41:52 -0800
X-CSE-ConnectionGUID: yTwd8rZATgm/rWBAoESr/w==
X-CSE-MsgGUID: oKevCgOSR/Ov00lsm3JErw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198463500"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Nov 2025 18:41:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOoQd-000000005w5-1Rq6;
	Fri, 28 Nov 2025 02:41:47 +0000
Date: Fri, 28 Nov 2025 10:41:17 +0800
From: kernel test robot <lkp@intel.com>
To: Osama Abdelkader <osama.abdelkader@gmail.com>, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, ada.coupriediaz@arm.com,
	smostafa@google.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: Re: [PATCH] arm64: Remove unreachable break after die
Message-ID: <202511281049.oCzxmRVJ-lkp@intel.com>
References: <20251126222620.215245-1-osama.abdelkader@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126222620.215245-1-osama.abdelkader@gmail.com>

Hi Osama,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master v6.18-rc7 next-20251127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Osama-Abdelkader/arm64-Remove-unreachable-break-after-die/20251127-062758
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20251126222620.215245-1-osama.abdelkader%40gmail.com
patch subject: [PATCH] arm64: Remove unreachable break after die
config: arm64-randconfig-001-20251128 (https://download.01.org/0day-ci/archive/20251128/202511281049.oCzxmRVJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511281049.oCzxmRVJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511281049.oCzxmRVJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:862:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     862 |         [ESR_ELx_EC_DABT_CUR]           = "DABT (current EL)",
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:863:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     863 |         [ESR_ELx_EC_SP_ALIGN]           = "SP Alignment",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:864:23: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     864 |         [ESR_ELx_EC_MOPS]               = "MOPS",
         |                                           ^~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:865:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     865 |         [ESR_ELx_EC_FP_EXC32]           = "FP (AArch32)",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:866:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     866 |         [ESR_ELx_EC_FP_EXC64]           = "FP (AArch64)",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:867:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     867 |         [ESR_ELx_EC_GCS]                = "Guarded Control Stack",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:868:25: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     868 |         [ESR_ELx_EC_SERROR]             = "SError",
         |                                           ^~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:869:29: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     869 |         [ESR_ELx_EC_BREAKPT_LOW]        = "Breakpoint (lower EL)",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:870:29: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     870 |         [ESR_ELx_EC_BREAKPT_CUR]        = "Breakpoint (current EL)",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:871:29: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     871 |         [ESR_ELx_EC_SOFTSTP_LOW]        = "Software Step (lower EL)",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:872:29: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     872 |         [ESR_ELx_EC_SOFTSTP_CUR]        = "Software Step (current EL)",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:873:29: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     873 |         [ESR_ELx_EC_WATCHPT_LOW]        = "Watchpoint (lower EL)",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:874:29: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     874 |         [ESR_ELx_EC_WATCHPT_CUR]        = "Watchpoint (current EL)",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:875:25: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     875 |         [ESR_ELx_EC_BKPT32]             = "BKPT (AArch32)",
         |                                           ^~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:876:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     876 |         [ESR_ELx_EC_VECTOR32]           = "Vector catch (AArch32)",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:877:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     877 |         [ESR_ELx_EC_BRK64]              = "BRK (AArch64)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/traps.c:1007:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    1007 |         case BUG_TRAP_TYPE_WARN:
         |         ^
   arch/arm64/kernel/traps.c:1007:2: note: insert 'break;' to avoid fall-through
    1007 |         case BUG_TRAP_TYPE_WARN:
         |         ^
         |         break; 
   45 warnings generated.


vim +1007 arch/arm64/kernel/traps.c

9fb7410f955f7a Dave P Martin    2015-07-24  1000  
6adfdc5e2ef9c7 Ada Couprie Diaz 2025-07-07  1001  int bug_brk_handler(struct pt_regs *regs, unsigned long esr)
9fb7410f955f7a Dave P Martin    2015-07-24  1002  {
9fb7410f955f7a Dave P Martin    2015-07-24  1003  	switch (report_bug(regs->pc, regs)) {
9fb7410f955f7a Dave P Martin    2015-07-24  1004  	case BUG_TRAP_TYPE_BUG:
0f2cb928a1547a Mark Rutland     2022-09-13  1005  		die("Oops - BUG", regs, esr);
9fb7410f955f7a Dave P Martin    2015-07-24  1006  
9fb7410f955f7a Dave P Martin    2015-07-24 @1007  	case BUG_TRAP_TYPE_WARN:
9fb7410f955f7a Dave P Martin    2015-07-24  1008  		break;
9fb7410f955f7a Dave P Martin    2015-07-24  1009  
9fb7410f955f7a Dave P Martin    2015-07-24  1010  	default:
9fb7410f955f7a Dave P Martin    2015-07-24  1011  		/* unknown/unrecognised bug trap type */
9fb7410f955f7a Dave P Martin    2015-07-24  1012  		return DBG_HOOK_ERROR;
9fb7410f955f7a Dave P Martin    2015-07-24  1013  	}
9fb7410f955f7a Dave P Martin    2015-07-24  1014  
9fb7410f955f7a Dave P Martin    2015-07-24  1015  	/* If thread survives, skip over the BUG instruction and continue: */
6436beeee5721a Julien Thierry   2017-10-25  1016  	arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
9fb7410f955f7a Dave P Martin    2015-07-24  1017  	return DBG_HOOK_HANDLED;
9fb7410f955f7a Dave P Martin    2015-07-24  1018  }
9fb7410f955f7a Dave P Martin    2015-07-24  1019  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
