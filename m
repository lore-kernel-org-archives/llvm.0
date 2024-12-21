Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16299188A0E;
	Sat, 21 Dec 2024 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734809982; cv=none; b=Jc9+e/KS4il6GPc8kXxgrtv92HNzEz7GORxuRT72LCwP9OsAZk20KWbzQ6lGq4U46aMehw8aqkULWNkMCEdln9MfkCzO69/rLoQCZiMurJhoEETc1R+YvPMqSGbKWIa4DYYFt4zbF9IHJxJNmsS+ZOxN/4RP2DPQDgvd2JrIQKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734809982; c=relaxed/simple;
	bh=wvum0A2IDdKDiqrLFE+OxiCBj5f3tLMnnRmOr7U7hVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mlT9sMMYH1RUf0xPH33SWDq19WO2VzBljeaJQpktfLqU4dEoQ4iWRPZV/eofCTIGZVyAQ2IMuVuasUwXtY7XpCsHY/nccswl2JILkxUSbcqCKzaqctRwDJeU5tDCJrQ7l63IC/+D0neESBF2l9GnIiOynBbZSJA6HA1kwwS5eKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JnegWMtm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JnegWMtm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734809980; x=1766345980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wvum0A2IDdKDiqrLFE+OxiCBj5f3tLMnnRmOr7U7hVE=;
  b=JnegWMtmsb6mOpGhi/LGXkIz2rrhT6cyrid3ne3aczDimGocgD07obZx
   Wt//J7CToQ+CIyAOfWG6gLlkXFOG71RId6+1G5uVnR+liIrZQvo4XHpI+
   bhXoGutDsoyZ2M0eQORkXEHuD4uYZ+x4EMfxroJ0GShtx34lQBvbQ8z0V
   1grRD+Of6QfDC5KGVJvd3XAaJcUzMmAUry8axJXlEhZVIBBdjUIkuUqc/
   R9zS13Da97FAHSJvXw8AWNYf0Kqs5fFlUZ4Du51rdPuAiUwfL6upcdU7U
   o25PIZA+gMgwl9Lnh/hAL6BB9xKMYq9DEIe0p5OH4Z4/ekEPBCnRzX0Jt
   w==;
X-CSE-ConnectionGUID: nyp+B+BgSne5ydosYkh/JA==
X-CSE-MsgGUID: VpmGYGLZR7enVcVEEl4ulQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35358372"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35358372"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 11:39:39 -0800
X-CSE-ConnectionGUID: MIkOV4JFRCOihNE9dfw7aA==
X-CSE-MsgGUID: /7+rg8EvSwGisn4wGGMrZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99679286"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Dec 2024 11:39:38 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP5K3-0002R3-13;
	Sat, 21 Dec 2024 19:39:35 +0000
Date: Sun, 22 Dec 2024 03:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: include/linux/ftrace.h:138:9: error: call to undeclared function
 'arch_ftrace_get_regs'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202412220318.Yh8KEauV-lkp@intel.com>
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
head:   baa172c77ac52b2058ba3abae7512b7b16d0c461
commit: 7caa9765465f60b6d88e22264892cee12d971888 ftrace: riscv: move from REGS to ARGS
date:   7 months ago
config: riscv-randconfig-001-20241222 (https://download.01.org/0day-ci/archive/20241222/202412220318.Yh8KEauV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220318.Yh8KEauV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220318.Yh8KEauV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/riscv/kernel/asm-offsets.c:12:
>> include/linux/ftrace.h:138:9: error: call to undeclared function 'arch_ftrace_get_regs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     138 |         return arch_ftrace_get_regs(fregs);
         |                ^
   include/linux/ftrace.h:138:9: note: did you mean 'ftrace_get_regs'?
   include/linux/ftrace.h:133:40: note: 'ftrace_get_regs' declared here
     133 | static __always_inline struct pt_regs *ftrace_get_regs(struct ftrace_regs *fregs)
         |                                        ^
     134 | {
     135 |         if (!fregs)
     136 |                 return NULL;
     137 | 
     138 |         return arch_ftrace_get_regs(fregs);
         |                ~~~~~~~~~~~~~~~~~~~~
         |                ftrace_get_regs
>> include/linux/ftrace.h:138:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct pt_regs *' [-Wint-conversion]
     138 |         return arch_ftrace_get_regs(fregs);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.
   make[3]: *** [scripts/Makefile.build:117: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=1151473207
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2 shuffle=1151473207
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2 shuffle=1151473207
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2 shuffle=1151473207
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
