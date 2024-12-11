Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DB81A2872;
	Wed, 11 Dec 2024 21:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733954173; cv=none; b=rdd0QWZqf5BqnFjLJdxo/wOlxsiCZMG0xqFyT/Na2hFtzB0UMR4wHJXrVIiZepPiNknX00/yuOvAgx0w9l16iP1vd1hUl0UMw1U3rfxEdXwW88LjBk/PQHeBi43WlO8S+7xT0Vh/OOlYWR9kVB2h/5C8bHtK2la6zM8pjNVCvGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733954173; c=relaxed/simple;
	bh=PxkaDCI1QYgQbqTeAqt2TX6uojv6WPrRZRKP4ilPtog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lsnd3bPOR6nrF64S7V74IlNEGgCnwK/lfpcRswbsbkSziQnWRjyxmp7BZBKFMYSTrStoIcZ76jb+A+GIY3CRNEMUhY7XmE42eoswyHLThFG9tw39+HfHHQGpYzI6BTxSmopFKsysKAQ2ko8NxY1nJrqGQ87/JdIyeU6PJrYJGHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDMrGWNs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDMrGWNs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733954171; x=1765490171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PxkaDCI1QYgQbqTeAqt2TX6uojv6WPrRZRKP4ilPtog=;
  b=IDMrGWNsEuP/hQiUawejFlpEPcIasA0lsyEchOHCPFWS8jnnX1ig9BK2
   MVv9dHC2LbcDnyp6VTNbqXGFHjCd9HhYv/He2aHa2FYBxyDwI3s90z690
   TY0hVEhOT94W8p78ZERu3sqxMiutIUux1bpyNoKliYDCCCAOENZOA9sVx
   UxewxuAWHeEK+DGqx2NMnksZilYfgo9aET5UjEpBJQQ82GjUOYmS0devd
   8fRGrpcb412u6Px3YAdF+n3J6pdHxFlkaIwDjhCLkgYlA7Fk+gTBKNlOn
   T1BuwaYGyOWan2jQZDYz1NHiIWScTCb8NwXlx6upKWWTTPJGYDIApN8D4
   A==;
X-CSE-ConnectionGUID: b6BEGdJCReC5Y15hsiOxBA==
X-CSE-MsgGUID: FXvOvbH+SYSTP67AXJKodg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34272972"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="34272972"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 13:56:11 -0800
X-CSE-ConnectionGUID: WfWj9JQXTjW74FrreRXB6A==
X-CSE-MsgGUID: kQUzB44TRFuxjoPfcSxB1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="96473421"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Dec 2024 13:56:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLUgh-000781-0J;
	Wed, 11 Dec 2024 21:56:07 +0000
Date: Thu, 12 Dec 2024 05:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt 3/12]
 arch/arm/probes/uprobes/core.c:33:42: error: too few arguments to function
 call, expected 5, have 4
Message-ID: <202412120551.c2u7Wttu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt
head:   71a73540cd512eab6cdd0aad1711b3a76e86e76d
commit: b67b8b3af4cc6776e68fe57b357e5ba4015747d8 [3/12] uprobes: Add nbytes argument to uprobe_write_opcode
config: arm-randconfig-003-20241211 (https://download.01.org/0day-ci/archive/20241212/202412120551.c2u7Wttu-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120551.c2u7Wttu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120551.c2u7Wttu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/probes/uprobes/core.c:9:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/arm/probes/uprobes/core.c:33:42: error: too few arguments to function call, expected 5, have 4
      32 |         return uprobe_write_opcode(auprobe, mm, vaddr,
         |                ~~~~~~~~~~~~~~~~~~~
      33 |                    __opcode_to_mem_arm(auprobe->bpinsn));
         |                                                        ^
   include/linux/uprobes.h:184:12: note: 'uprobe_write_opcode' declared here
     184 | extern int uprobe_write_opcode(struct arch_uprobe *auprobe, struct mm_struct *mm, unsigned long vaddr,
         |            ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     185 |                                uprobe_opcode_t *insn, int nbytes);
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +33 arch/arm/probes/uprobes/core.c

c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  @9  #include <linux/highmem.h>
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  10  #include <linux/sched.h>
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  11  #include <linux/uprobes.h>
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  12  #include <linux/notifier.h>
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  13  
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  14  #include <asm/opcodes.h>
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  15  #include <asm/traps.h>
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  16  
fca08f326ae0423 arch/arm/probes/uprobes/core.c Wang Nan      2015-01-09  17  #include "../decode.h"
fca08f326ae0423 arch/arm/probes/uprobes/core.c Wang Nan      2015-01-09  18  #include "../decode-arm.h"
fca08f326ae0423 arch/arm/probes/uprobes/core.c Wang Nan      2015-01-09  19  #include "core.h"
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  20  
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  21  #define UPROBE_TRAP_NR	UINT_MAX
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  22  
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  23  bool is_swbp_insn(uprobe_opcode_t *insn)
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  24  {
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  25  	return (__mem_to_opcode_arm(*insn) & 0x0fffffff) ==
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  26  		(UPROBE_SWBP_ARM_INSN & 0x0fffffff);
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  27  }
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  28  
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  29  int set_swbp(struct arch_uprobe *auprobe, struct mm_struct *mm,
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  30  	     unsigned long vaddr)
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  31  {
6d43743e9079ac0 arch/arm/probes/uprobes/core.c Ravi Bangoria 2018-08-09  32  	return uprobe_write_opcode(auprobe, mm, vaddr,
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07 @33  		   __opcode_to_mem_arm(auprobe->bpinsn));
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  34  }
c7edc9e326d53ca arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  35  

:::::: The code at line 33 was first introduced by commit
:::::: c7edc9e326d53ca5ef9bed82de0740c6b107d55b ARM: add uprobes support

:::::: TO: David A. Long <dave.long@linaro.org>
:::::: CC: David A. Long <dave.long@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
