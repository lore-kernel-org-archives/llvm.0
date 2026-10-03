Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4706737B3E4;
	Sat,  3 Oct 2026 20:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791061048; cv=none; b=tgeC9VbppLr974A8azpnROa7zcZnebqq2XCdB3xipOEVaaG5KvviR8PSsm7/OVWiMaxSmkldyn9FivSC0BpHH2wLqqGqjOmaQ0Py8XMk9nw2QK8kZmNvd6eP4O6DmDHweW2crTjuO2HnKo1lUZ/wUx29NUYa0KUDg9PXZ7l60x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791061048; c=relaxed/simple;
	bh=3m9MiP/b2jbt1U2mfq23UmMzfiU4DMzdvsuJBtx/wX4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U6x5WXd1JsZqSl6ew3IVbkVY3gn8OpMwrC76d/2cSGFSqCLUpQEeIXFdO3CIy8e/bcbk64IQlSk7Bk8/SWRHaD1I6nQLF/GkpbYgkbIM6ALyggE1su/m3H6ftUM+8MuznBkRojdZ1whU7X6Q5fw8TvckZFYv+QHgGSrwnBOMB3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EmduBj3P; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EmduBj3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791061046; x=1822597046;
  h=date:from:to:cc:subject:message-id;
  bh=3m9MiP/b2jbt1U2mfq23UmMzfiU4DMzdvsuJBtx/wX4=;
  b=EmduBj3PmOSJYBac84Z6HGYsOSirQpTFxXNEQ022gOt0jg2c91abNQZU
   CGmsGVmugkd1NEufY7BFxNrIe1kTrLtDnYdjJ73I2P57CeTx+qbOIdp0L
   zvoLO31Ry0UghNy95CF5R/Yjg+D8Q16iwrL2SG0ze8y6U+jGpDhypdqWW
   DQDta01852HHmbc32ESnQmZ3CWLtxZG7QgWsyeXyxUGz9Wv8lJC172JC8
   Y67HgB6OxmY01kSVSjdwp5cUf4CC42r8T+Miq/elUrt5GsmIVwjsepKFo
   OdNJ7no568+EqjJbtSEm7j/bYq1A7P353BqTQ1eftjbKueeULEKx8uaqB
   g==;
X-CSE-ConnectionGUID: Hfus1BEDStGlUUfd06NHUQ==
X-CSE-MsgGUID: xChvW1QTQSK0y4jnOVBl6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="79346360"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="79346360"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 13:57:25 -0700
X-CSE-ConnectionGUID: W6FalPdCQ2yCddvu0Fn+Ow==
X-CSE-MsgGUID: oFhMlE2/T2SABnL+eX0Q9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="284566897"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Oct 2026 13:57:24 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xD6nJ-00000000UCp-1k2j;
	Sat, 03 Oct 2026 20:57:21 +0000
Date: Sun, 04 Oct 2026 04:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: Martin KaFai Lau <martin.lau@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alexei Starovoitov <ast@kernel.org>, Amery Hung <ameryhung@gmail.com>
Subject: [linux-next:master 6668/14185]
 arch/s390/include/asm/jump_label.h:43:11: error: invalid operand for inline
 asm constraint 'i'
Message-ID: <202610040408.xH9o1XiH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f0406245cb9855e6318335a8a223551354291a46
commit: 369d9dcd8fb855f103a83454f0e1cd1cbc9118be [6668/14185] bpf: Add infrastructure to support attaching struct_ops to cgroups
config: s390-randconfig-1001-20261003 (https://download.01.org/0day-ci/archive/20261004/202610040408.xH9o1XiH-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610040408.xH9o1XiH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610040408.xH9o1XiH-lkp@intel.com/

Note: the linux-next/master HEAD f0406245cb9855e6318335a8a223551354291a46 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/cgroup.c:8:
   In file included from include/linux/kernel.h:23:
   In file included from include/linux/bitops.h:67:
   In file included from arch/s390/include/asm/bitops.h:75:
   In file included from include/asm-generic/bitops/atomic.h:5:
   In file included from include/linux/atomic.h:7:
   In file included from arch/s390/include/asm/atomic.h:16:
   In file included from arch/s390/include/asm/cmpxchg.h:11:
   In file included from include/linux/mmdebug.h:5:
   In file included from include/linux/bug.h:5:
   In file included from arch/s390/include/asm/bug.h:139:
   In file included from include/asm-generic/bug.h:31:
   In file included from include/linux/printk.h:620:
   In file included from include/linux/dynamic_debug.h:6:
   In file included from include/linux/jump_label.h:106:
>> arch/s390/include/asm/jump_label.h:43:11: error: invalid operand for inline asm constraint 'i'
      43 |         asm goto(ARCH_STATIC_BRANCH_ASM("%0+%1", "%l[label]")
         |                  ^
   arch/s390/include/asm/jump_label.h:34:2: note: expanded from macro 'ARCH_STATIC_BRANCH_ASM'
      34 |         "0:     brcl 0," label "\n"             \
         |         ^
   1 error generated.


vim +/i +43 arch/s390/include/asm/jump_label.h

146448524bddbf Ilya Leoshkevich 2019-02-06  21  
6900bec59d0f54 Jan Polensky     2026-06-01  22  #define ARCH_JUMP_TABLE_ENTRY(key, label, local_label)	\
6900bec59d0f54 Jan Polensky     2026-06-01  23  	".pushsection __jump_table,\"aw\"\n"		\
6900bec59d0f54 Jan Polensky     2026-06-01  24  	".balign	8\n"				\
6900bec59d0f54 Jan Polensky     2026-06-01  25  	".long	" local_label "-.," label "-.\n"	\
6900bec59d0f54 Jan Polensky     2026-06-01  26  	".quad	" key "-.\n"				\
6900bec59d0f54 Jan Polensky     2026-06-01  27  	".popsection\n"
6900bec59d0f54 Jan Polensky     2026-06-01  28  
d5caa4dbf9bd2a Heiko Carstens   2015-01-29  29  /*
0c3b61e00a0d08 Ard Biesheuvel   2022-06-15  30   * We use a brcl 0,<offset> instruction for jump labels so it
d5caa4dbf9bd2a Heiko Carstens   2015-01-29  31   * can be easily distinguished from a hotpatch generated instruction.
d5caa4dbf9bd2a Heiko Carstens   2015-01-29  32   */
6900bec59d0f54 Jan Polensky     2026-06-01  33  #define ARCH_STATIC_BRANCH_ASM(key, label)	\
6900bec59d0f54 Jan Polensky     2026-06-01  34  	"0:	brcl 0," label "\n"		\
6900bec59d0f54 Jan Polensky     2026-06-01  35  	ARCH_JUMP_TABLE_ENTRY(key, label, "0b")
6900bec59d0f54 Jan Polensky     2026-06-01  36  
6900bec59d0f54 Jan Polensky     2026-06-01  37  #define ARCH_STATIC_BRANCH_JUMP_ASM(key, label)	\
6900bec59d0f54 Jan Polensky     2026-06-01  38  	"0:	brcl 15," label "\n"		\
6900bec59d0f54 Jan Polensky     2026-06-01  39  	ARCH_JUMP_TABLE_ENTRY(key, label, "0b")
6900bec59d0f54 Jan Polensky     2026-06-01  40  
7f032febb665f6 Heiko Carstens   2019-10-04  41  static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
5373db886b791b Jan Glauber      2011-03-16  42  {
6900bec59d0f54 Jan Polensky     2026-06-01 @43  	asm goto(ARCH_STATIC_BRANCH_ASM("%0+%1", "%l[label]")
146448524bddbf Ilya Leoshkevich 2019-02-06  44  		: : JUMP_LABEL_STATIC_KEY_CONSTRAINT (key), "i" (branch) : : label);
11276d5306b8e5 Peter Zijlstra   2015-07-24  45  	return false;
11276d5306b8e5 Peter Zijlstra   2015-07-24  46  label:
11276d5306b8e5 Peter Zijlstra   2015-07-24  47  	return true;
11276d5306b8e5 Peter Zijlstra   2015-07-24  48  }
11276d5306b8e5 Peter Zijlstra   2015-07-24  49  

:::::: The code at line 43 was first introduced by commit
:::::: 6900bec59d0f54dbb94d0799d204bcd44fbdb623 s390/jump_label: Implement ARCH_STATIC_BRANCH_JUMP_ASM and ARCH_STATIC_BRANCH_ASM macros

:::::: TO: Jan Polensky <japo@linux.ibm.com>
:::::: CC: Alexander Gordeev <agordeev@linux.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
