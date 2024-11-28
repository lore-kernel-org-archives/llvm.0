Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0158684D29;
	Thu, 28 Nov 2024 03:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732764298; cv=none; b=fn+qkLY2kEQXYy7LJ16YVoj0oMcx/euw5VKrfVdEeGHG9ATKUp54ZM84El96lKHhB2K58B2SjFyViybzVPXwVa4eBrrWD90tlpeVRfO7NV0FX9EE3VvAF4hpd73HcAMq4H8FAVjoFrHbS1SbW+1u/q6b0V1ZuV/vNQ652yfmsXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732764298; c=relaxed/simple;
	bh=F1Eb3pOCUtr4EDo5OAIeb0Xq9frzvA0LlRem5hjK8cU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wr1UWT6GvseDyl6CRyaSBauWRwI8rXNr04h+53Gr0WgaA0RgUWDfNX3iMzzOga9ty+f6c9SvT05SCgk6mn/2EJmoaRcqNgLy6eJc9Cg0FpjGnC/WpABoQpWQTjCRb5tlYE/dprgy8agc461UpB0K5EZ/G3/moPbBs010lr4Knrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSq/25DZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSq/25DZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732764297; x=1764300297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F1Eb3pOCUtr4EDo5OAIeb0Xq9frzvA0LlRem5hjK8cU=;
  b=CSq/25DZlegs0EBDtpKfiJBYUoElFwlRsynXvfokD5VUXZd17DPbIF0W
   BEyGesJsXfbc/XbbTvX09rzBOIr6OrWFsU/vOzxNntdHHO1zQSQUKNRpp
   M6bhHe+8LYlnNFrwo34gmx/3tNkLET8ZSgcAcqdYROYJLS/4p1Uan2c3J
   zbfCe6eToQgoK+HFPC4zCZMXxSyk68zpU78F7S0KzQN9MS3wloP3lhHBz
   +CaTC/7zLpYm6Ka5vo6/B6kOUu3RhA+mX8bceu6XQa6aujRS0uYRsr83a
   pIcAPxnr/aML06bwfX8vhpwyS0mSSwHv1iO+mSvfDCToXPkcrLspea2Lb
   A==;
X-CSE-ConnectionGUID: AOIuy1okRjiozvNjxHdI1A==
X-CSE-MsgGUID: p/SIlyMeSeiwTj6vw2tb8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="20578983"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="20578983"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 19:24:54 -0800
X-CSE-ConnectionGUID: zdBbfUqGRTO9Hv6GoXGVWg==
X-CSE-MsgGUID: TZ5bhEl2RfWffAm3tVojCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="123075992"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Nov 2024 19:24:53 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGV98-0008rF-2h;
	Thu, 28 Nov 2024 03:24:50 +0000
Date: Thu, 28 Nov 2024 11:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_9 3/12]
 arch/arm/probes/uprobes/core.c:33:42: error: too few arguments to function
 call, expected 5, have 4
Message-ID: <202411281128.56UJgtvI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_9
head:   b1d916ea335d828e290e0c2bb8bb5bebdf0b633a
commit: e4bd7580c798ae727d6c9c8dc7040d8970e054b6 [3/12] uprobes: Add nbytes argument to uprobe_write_opcode
config: arm-mxs_defconfig (https://download.01.org/0day-ci/archive/20241128/202411281128.56UJgtvI-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281128.56UJgtvI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281128.56UJgtvI-lkp@intel.com/

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

c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  @9  #include <linux/highmem.h>
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  10  #include <linux/sched.h>
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  11  #include <linux/uprobes.h>
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  12  #include <linux/notifier.h>
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  13  
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  14  #include <asm/opcodes.h>
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  15  #include <asm/traps.h>
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  16  
fca08f326ae042 arch/arm/probes/uprobes/core.c Wang Nan      2015-01-09  17  #include "../decode.h"
fca08f326ae042 arch/arm/probes/uprobes/core.c Wang Nan      2015-01-09  18  #include "../decode-arm.h"
fca08f326ae042 arch/arm/probes/uprobes/core.c Wang Nan      2015-01-09  19  #include "core.h"
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  20  
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  21  #define UPROBE_TRAP_NR	UINT_MAX
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  22  
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  23  bool is_swbp_insn(uprobe_opcode_t *insn)
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  24  {
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  25  	return (__mem_to_opcode_arm(*insn) & 0x0fffffff) ==
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  26  		(UPROBE_SWBP_ARM_INSN & 0x0fffffff);
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  27  }
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  28  
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  29  int set_swbp(struct arch_uprobe *auprobe, struct mm_struct *mm,
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  30  	     unsigned long vaddr)
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  31  {
6d43743e9079ac arch/arm/probes/uprobes/core.c Ravi Bangoria 2018-08-09  32  	return uprobe_write_opcode(auprobe, mm, vaddr,
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07 @33  		   __opcode_to_mem_arm(auprobe->bpinsn));
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  34  }
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  35  

:::::: The code at line 33 was first introduced by commit
:::::: c7edc9e326d53ca5ef9bed82de0740c6b107d55b ARM: add uprobes support

:::::: TO: David A. Long <dave.long@linaro.org>
:::::: CC: David A. Long <dave.long@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
