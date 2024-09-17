Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F92318C22;
	Tue, 17 Sep 2024 01:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726538387; cv=none; b=NGssIgL1UzCiIiFmEulADPuHdnO4bD+lIB58swXCmA/djRCSOcfzX8bTwoLXuUyYbC48wpxZ/DpUQY3ith1UwMZaoqiOTziWjYbvJc7MY6i2JxEWmN8lOCxI+jnvwMsWVlRrWER0CbvXjX7+xwbjzVQRwO7iSKjL3DNxFobKRcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726538387; c=relaxed/simple;
	bh=PBNscUon1+CtI7ORXXoRyhPkUBWtu17V4/5DauJBbx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mS8l2rDRdQjvea15zK9WiksuqJrbi3YadeAzSBVCxNje7bmwfcgy2yOy8PQqUFvwt7Z24/BKeT2eHyum0y1bQUtJ+H1NaeseBVyBnp0zNSRGDaPjTQkrpUIf6i8huxunBINMmticmtEqP7TIb0yl/OkhZNiMG61+b7igWE+JaEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6ReypGu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6ReypGu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726538385; x=1758074385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PBNscUon1+CtI7ORXXoRyhPkUBWtu17V4/5DauJBbx0=;
  b=S6ReypGuT+CODBy6FL/4mRNyWY5TjLHGsw7rW7O4wwEM2cbYc90O0C2n
   XTmK831Ax6vYRNFgmIPBut3MAJaPQNKSy9bNYNLzojEywgPkodwgWqIwf
   fnPRwVCh5tcBA2joXe+HURfqYK1wIKzy6YbApxlxIj82za8hrt9QLceMG
   1bywDxPKDPLlXK9SjUH+q2o71qtO46xdFpf7ejolKHa91IBo7q6HI/E5x
   laArfnTPVozNi4CMlCxMWdHZzhPXen8ha6foPaiQ0Qb5WGTkdkHNPytud
   UAOvVI/M/2jQa0BFzOyLWQgMvIbOI/DLqbO/aJC1BOchIVcK3N8TJIQV6
   A==;
X-CSE-ConnectionGUID: PE/HQ9JtSWaf/m3WhjkktQ==
X-CSE-MsgGUID: 3z/RYsZTShSj1PQd4B+H5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="28295495"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="28295495"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 18:59:43 -0700
X-CSE-ConnectionGUID: MwtTOmwjQBmbk10gQODHGQ==
X-CSE-MsgGUID: ZdcU930bSAmZVAQDLmeCCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="68925188"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Sep 2024 18:59:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqNVD-000Ahe-1i;
	Tue, 17 Sep 2024 01:59:39 +0000
Date: Tue, 17 Sep 2024 09:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: include/linux/ftrace.h:138:9: error: call to undeclared function
 'arch_ftrace_get_regs'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202409170931.PtyPpRfV-lkp@intel.com>
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
head:   a430d95c5efa2b545d26a094eb5f624e36732af0
commit: 7caa9765465f60b6d88e22264892cee12d971888 ftrace: riscv: move from REGS to ARGS
date:   4 months ago
config: riscv-randconfig-002-20240917 (https://download.01.org/0day-ci/archive/20240917/202409170931.PtyPpRfV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409170931.PtyPpRfV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409170931.PtyPpRfV-lkp@intel.com/

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
   make[3]: *** [scripts/Makefile.build:117: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=2879536417
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2 shuffle=2879536417
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2 shuffle=2879536417
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2 shuffle=2879536417
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
