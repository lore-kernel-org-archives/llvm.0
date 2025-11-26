Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B0630DD3F;
	Wed, 26 Nov 2025 03:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764128331; cv=none; b=MGNjxiQNBnt3wxjAKC/Si9kVesfcdN6d1xiZ7Fu5+tIIWm3f9xz6CWZkeZ88wwJq62lOsbrrPFhdgxBJagpFPTcRi9xSjrHFpiPXWgNxzF/QCF3uxjbbHEdFWQdsGhVz5fIXdl2PzTh5SMj8ZzsllF5U3+wOi5rKC2+umLVCqac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764128331; c=relaxed/simple;
	bh=vAkEMonUDt9Lx6WG94p1cDBrRgahkfC4sYAgtrbDRrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I7iO1lqPmJksqLkv1/22YDMFaIjGaVzFffc3Oi6/p2keZY3Pv8oeWHb4gjSjtCClkrzKl1Eiatg9qkZHQ8cHgnIjzjgKAlPFwOTiB9hdC1jB7V8szzQjl0VizWeutoiCkOOr33+39cZBa7nCiNi8aLtMA8p4fBYBej9dX5spvbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BG9wQMe8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BG9wQMe8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764128330; x=1795664330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vAkEMonUDt9Lx6WG94p1cDBrRgahkfC4sYAgtrbDRrg=;
  b=BG9wQMe8lLenRaq6X/Va4ZMY0wvKQUaEwmbQUGjPij/I2cDxF4/eZgrC
   bZ/mSWOFZgOyVABuB1ucEsBsXbIC150hYnFf0Ca8bjIyhAJbZISAIfkyp
   TlpKjxmHokHMyyKP7oRVuBh0gcY3t18IwS8vFU9evp6OGG4FWAcIPaC70
   D+EIrh5lF/IGNNLOAR3zEwqMzQFmkm4kh4d/X70UntCtTnrAXkbkNxkZf
   oF7+B/CF/Ls4YRSEGR5pFKbAH1OWNTBxUpzRUctnmIzKMXPchoGK0vQWN
   1FjjONnY1mJHqBcCSO8W3zJDbKQk09UfdUwhZZaRXbcsmwxWPX+Rohhc2
   w==;
X-CSE-ConnectionGUID: Xp1qfNaJQaqae424NaOnfA==
X-CSE-MsgGUID: UX+UmSgrRYmaPEPay/RxfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65865774"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="65865774"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 19:38:50 -0800
X-CSE-ConnectionGUID: AGT9bCDwQleTKYt7SeOVZA==
X-CSE-MsgGUID: VxmX6gDtScKQB0pUe3T2iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="197300645"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 25 Nov 2025 19:38:49 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO6Mg-000000000d3-0VAH;
	Wed, 26 Nov 2025 03:38:46 +0000
Date: Wed, 26 Nov 2025 04:37:53 +0100
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:randomize-kstack-siphash 1/1]
 arch/x86/include/asm/entry-common.h:95:2: error: call to undeclared function
 'choose_random_kstack_offset'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202511260422.Q4byvNJU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git randomize-kstack-siphash
head:   0783912db6e30339d55a5dc7eb6a696b440bedb3
commit: 0783912db6e30339d55a5dc7eb6a696b440bedb3 [1/1] HACK: use siphash to generate kstack offset per-task
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251126/202511260422.Q4byvNJU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260422.Q4byvNJU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511260422.Q4byvNJU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/entry/syscall_64.c:8:
   In file included from include/linux/entry-common.h:5:
   In file included from include/linux/irq-entry-common.h:12:
>> arch/x86/include/asm/entry-common.h:95:2: error: call to undeclared function 'choose_random_kstack_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      95 |         choose_random_kstack_offset(rdtsc());
         |         ^
>> arch/x86/entry/syscall_64.c:89:2: error: call to undeclared function 'add_random_kstack_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      89 |         add_random_kstack_offset();
         |         ^
   2 errors generated.
--
   In file included from arch/x86/entry/entry_fred.c:12:
   In file included from arch/x86/include/asm/idtentry.h:11:
   In file included from include/linux/entry-common.h:5:
   In file included from include/linux/irq-entry-common.h:12:
>> arch/x86/include/asm/entry-common.h:95:2: error: call to undeclared function 'choose_random_kstack_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      95 |         choose_random_kstack_offset(rdtsc());
         |         ^
   1 error generated.


vim +/choose_random_kstack_offset +95 arch/x86/include/asm/entry-common.h

fe950f6020338c Kees Cook       2021-04-01   84  
fe950f6020338c Kees Cook       2021-04-01   85  	/*
6db1208bf95b4c Kees Cook       2024-06-19   86  	 * This value will get limited by KSTACK_OFFSET_MAX(), which is 10
6db1208bf95b4c Kees Cook       2024-06-19   87  	 * bits. The actual entropy will be further reduced by the compiler
6db1208bf95b4c Kees Cook       2024-06-19   88  	 * when applying stack alignment constraints (see cc_stack_align4/8 in
fe950f6020338c Kees Cook       2021-04-01   89  	 * arch/x86/Makefile), which will remove the 3 (x86_64) or 2 (ia32)
fe950f6020338c Kees Cook       2021-04-01   90  	 * low bits from any entropy chosen here.
fe950f6020338c Kees Cook       2021-04-01   91  	 *
6db1208bf95b4c Kees Cook       2024-06-19   92  	 * Therefore, final stack offset entropy will be 7 (x86_64) or
6db1208bf95b4c Kees Cook       2024-06-19   93  	 * 8 (ia32) bits.
fe950f6020338c Kees Cook       2021-04-01   94  	 */
6db1208bf95b4c Kees Cook       2024-06-19  @95  	choose_random_kstack_offset(rdtsc());
2f8f173413f1cb Pawan Gupta     2025-08-14   96  
2f8f173413f1cb Pawan Gupta     2025-08-14   97  	/* Avoid unnecessary reads of 'x86_ibpb_exit_to_user' */
2f8f173413f1cb Pawan Gupta     2025-08-14   98  	if (cpu_feature_enabled(X86_FEATURE_IBPB_EXIT_TO_USER) &&
2f8f173413f1cb Pawan Gupta     2025-08-14   99  	    this_cpu_read(x86_ibpb_exit_to_user)) {
2f8f173413f1cb Pawan Gupta     2025-08-14  100  		indirect_branch_prediction_barrier();
2f8f173413f1cb Pawan Gupta     2025-08-14  101  		this_cpu_write(x86_ibpb_exit_to_user, false);
2f8f173413f1cb Pawan Gupta     2025-08-14  102  	}
167fd210ec0555 Thomas Gleixner 2020-07-23  103  }
167fd210ec0555 Thomas Gleixner 2020-07-23  104  #define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
167fd210ec0555 Thomas Gleixner 2020-07-23  105  

:::::: The code at line 95 was first introduced by commit
:::::: 6db1208bf95b4c091897b597c415e11edeab2e2d randomize_kstack: Remove non-functional per-arch entropy filtering

:::::: TO: Kees Cook <kees@kernel.org>
:::::: CC: Kees Cook <kees@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
