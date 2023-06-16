Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76776398;
	Fri, 16 Jun 2023 23:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686957245; x=1718493245;
  h=date:from:cc:subject:message-id:mime-version;
  bh=JBlIJP78VbRgv33bQFDWjNFzb+rgpPjZTv8aQm6ZitY=;
  b=Q+UT5mWsQw0Z+REWVXAq1cW5TyQvqdgvN0mUv/eCE3Buh8Z14bnRk0Y8
   yutukcUqo/urBLHFejvGgdwSM+zHrEemykpVP/33LDQuiOTh2+sFJm37o
   JMHZYOEX+TWhVy8uGc41esZ4dcXMEeYzWF5iehctEJD5PHzvcrPjpCoxQ
   I3QZh1wGo2ED20twO7DP8yLhkfNCIkK5d0sjZNytzgL14mIfVFv2ly2jn
   /D1dgFm3AH4hUJAflCm1Y+vi/77OhDs30eqGXZpV5GdNVOwg0DllK3Da3
   JNeJi+7jHS9yd3w23KDnRrA03NOUoF2CdfJ3zCeDzORfnRV5SFLqmdnWy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="445714052"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="445714052"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 16:14:00 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="746521711"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="746521711"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Jun 2023 16:13:59 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAIdi-0001u0-11;
	Fri, 16 Jun 2023 23:13:58 +0000
Date: Sat, 17 Jun 2023 07:13:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to
 !ENDBR: kprobe_emulate_loop+0x13
Message-ID: <202306170722.zsVkjVO4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@kernel.org>
CC: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4973ca29552864a7a047ab8a15611a585827412f
commit: db7adcfd1cec4e95155e37bc066fddab302c6340 x86/alternatives: Introduce int3_emulate_jcc()
date:   5 months ago
config: x86_64-randconfig-a014-20230617 (https://download.01.org/0day-ci/archive/20230617/202306170722.zsVkjVO4-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306170722.zsVkjVO4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306170722.zsVkjVO4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: resume_play_dead+0x1d: unreachable instruction
>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to !ENDBR: kprobe_emulate_loop+0x13


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 0000000000080810 <set_ftrace_ops_ro>:
0000    80810:	f3 0f 1e fa          	endbr64
0004    80814:	41 57                	push   %r15
0006    80816:	41 56                	push   %r14
0008    80818:	41 54                	push   %r12
000a    8081a:	53                   	push   %rbx
000b    8081b:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 80822 <set_ftrace_ops_ro+0x12>	8081e: R_X86_64_PC32	ftrace_ops_list-0x4
0012    80822:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	80825: R_X86_64_32S	ftrace_list_end
0019    80829:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	8082c: R_X86_64_32S	ftrace_regs_caller
0020    80830:	48 f7 d8             	neg    %rax
0023    80833:	4c 8d 3c 05 00 00 00 00 	lea    0x0(,%rax,1),%r15	80837: R_X86_64_32S	ftrace_regs_caller_end+0x1008
002b    8083b:	49 c1 ef 0c          	shr    $0xc,%r15
002f    8083f:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	80842: R_X86_64_32S	ftrace_caller
0036    80846:	48 f7 d8             	neg    %rax
0039    80849:	4c 8d 24 05 00 00 00 00 	lea    0x0(,%rax,1),%r12	8084d: R_X86_64_32S	ftrace_caller_end+0x1008
0041    80851:	49 c1 ec 0c          	shr    $0xc,%r12
0045    80855:	48 8b 43 10          	mov    0x10(%rbx),%rax
0049    80859:	0f ba e0 0b          	bt     $0xb,%eax
004d    8085d:	73 15                	jae    80874 <set_ftrace_ops_ro+0x64>
004f    8085f:	a8 04                	test   $0x4,%al
0051    80861:	48 8b bb 70 01 00 00 	mov    0x170(%rbx),%rdi
0058    80868:	44 89 fe             	mov    %r15d,%esi
005b    8086b:	41 0f 44 f4          	cmove  %r12d,%esi
005f    8086f:	e8 00 00 00 00       	call   80874 <set_ftrace_ops_ro+0x64>	80870: R_X86_64_PLT32	set_memory_ro-0x4
0064    80874:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
0068    80878:	48 85 db             	test   %rbx,%rbx
006b    8087b:	74 05                	je     80882 <set_ftrace_ops_ro+0x72>
006d    8087d:	4c 39 f3             	cmp    %r14,%rbx
0070    80880:	75 d3                	jne    80855 <set_ftrace_ops_ro+0x45>
0072    80882:	5b                   	pop    %rbx
0073    80883:	41 5c                	pop    %r12
0075    80885:	41 5e                	pop    %r14
0077    80887:	41 5f                	pop    %r15
0079    80889:	31 c0                	xor    %eax,%eax
007b    8088b:	31 ff                	xor    %edi,%edi
007d    8088d:	31 f6                	xor    %esi,%esi
007f    8088f:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
