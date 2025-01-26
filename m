Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7865570838;
	Sun, 26 Jan 2025 17:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737912781; cv=none; b=DMgYbc3YnAa+dPAXcOBE2FUMzCmr0nr3PZ2wx6WWH+CfMfy86AwP1Tio8IUpkMZf1r+Zyl/gLpIibKALTEFS+iAWyh8v2BCsUdJmeuXHokR3tgtooJgV4RAdzUbNZr0/OgQbFe0o0qdITqpSXDjLeHs04nJBP3nUyJF+QEYzL1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737912781; c=relaxed/simple;
	bh=BQctYNtSLOoIPFjdQfrVV5zXYN/YYnvAjkW6DxvgAbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TAXtOgkIwuQDATm+qp73NdicQsVRETN6Otq9KuuM7rE1UeZVdk/Eqb6qW/Kfe7F1cN9uJVjQuoNl4hBPF3fMgWnJavet3iqepXUj6rWf+StNmrfH/Rzgcr0k9cDCBYHruJkS/eJOiQ7+ReniYX0si7CcCTGt+6RQiyfiN59LFdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uiauu7nG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uiauu7nG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737912780; x=1769448780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BQctYNtSLOoIPFjdQfrVV5zXYN/YYnvAjkW6DxvgAbk=;
  b=Uiauu7nGs/mrvxeiS8mfpELRK3bcg2O1EtLcDKEzdwBtdMk0YdWjByQv
   qf6CYfBt8nsXg7DVsREezcdT1rBrKL7r4ugfB3kK0NDPBBERo2lW8ZRtD
   tUQfj54Dz3H+E43C9MHEC7BP4MZIq3qNy5SH+WyTvnETApGltd2ce+elo
   mCA0jJzQhgyIzXvzZVQE86qymIGCXvEV2f+iJJnQkvsLzd3L2z20Yf3k8
   L/v+p9jks/O8b7h0NBOqKeXv3Z+Y1xnT6c792tIOLTdx+b2EyTEMqajOZ
   qaT34lYB1djfoMBu9K6IcbUtWiRCmZZX34ky1ot1avFYNB8BdjcJYcfTL
   w==;
X-CSE-ConnectionGUID: 8n2qwPR7RpKR5+MIf3E9pg==
X-CSE-MsgGUID: 43mpkoOTS5umIyFXeXf8kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="42139585"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="42139585"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 09:32:59 -0800
X-CSE-ConnectionGUID: BzxpIR/iTzeoQQhVfC0N5g==
X-CSE-MsgGUID: 4IDWNxUHSRGF8KEuUKYExQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="108816157"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jan 2025 09:32:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tc6VC-000fZh-2k;
	Sun, 26 Jan 2025 17:32:54 +0000
Date: Mon, 27 Jan 2025 01:32:35 +0800
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: include/linux/ftrace.h:138:9: error: call to undeclared function
 'arch_ftrace_get_regs'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202501270111.x1TyJKg8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Puranjay,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aa22f4da2a46b484a257d167c67a2adc1b7aaf68
commit: 7caa9765465f60b6d88e22264892cee12d971888 ftrace: riscv: move from REGS to ARGS
date:   8 months ago
config: riscv-randconfig-002-20250127 (https://download.01.org/0day-ci/archive/20250127/202501270111.x1TyJKg8-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501270111.x1TyJKg8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501270111.x1TyJKg8-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from arch/riscv/kernel/asm-offsets.c:12:
>> include/linux/ftrace.h:138:9: error: call to undeclared function 'arch_ftrace_get_regs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return arch_ftrace_get_regs(fregs);
                  ^
   include/linux/ftrace.h:138:9: note: did you mean 'ftrace_get_regs'?
   include/linux/ftrace.h:133:40: note: 'ftrace_get_regs' declared here
   static __always_inline struct pt_regs *ftrace_get_regs(struct ftrace_regs *fregs)
                                          ^
>> include/linux/ftrace.h:138:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct pt_regs *' [-Wint-conversion]
           return arch_ftrace_get_regs(fregs);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
   make[3]: *** [scripts/Makefile.build:117: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=3312181336
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2 shuffle=3312181336
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2 shuffle=3312181336
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2 shuffle=3312181336
   make: Target 'prepare' not remade because of errors.


vim +/arch_ftrace_get_regs +138 include/linux/ftrace.h

d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  132) 
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  133) static __always_inline struct pt_regs *ftrace_get_regs(struct ftrace_regs *fregs)
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  134) {
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  135) 	if (!fregs)
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  136) 		return NULL;
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  137) 
02a474ca266a47 Steven Rostedt (VMware  2020-10-27 @138) 	return arch_ftrace_get_regs(fregs);
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  139) }
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  140) 

:::::: The code at line 138 was first introduced by commit
:::::: 02a474ca266a47ea8f4d5a11f4ffa120f83730ad ftrace/x86: Allow for arguments to be passed in to ftrace_regs by default

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
