Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2AA163;
	Thu,  6 Jul 2023 00:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688601875; x=1720137875;
  h=date:from:cc:subject:message-id:mime-version;
  bh=SC8cKhvsmTPtHvtOtQKFnQZmcMwA1znR2xtH2wg2Qsg=;
  b=XbXFWqreYfWAzEiU5Tk/luFasWSK+6bwjoHHG9ufIUBFgjUO4YAhpMFn
   BuUS0xdDuRuBS//PsHt8slcS1un7BEPdHBt6sNm8EY3hqUKO8t8n5mr4v
   xJYSMeSTql3b0Hoz8IY5Obtm3ncpNHmNytAW7sG7TnPEEw3dBxdoxKnvR
   qP8D66lG3T99t5P9qO349zkc/ydmw8k2eIhffCkgyUemijmvVPNZmcj0I
   pEAuhUrGP2vGwfv4OOUS+r1w2SzUipSBcFdPyJpDe1FaMLYOJTikwDuMg
   614Mnvo+YPn46xiYi4CVHeCRf4zEPwNzjaPA204VWARK9oHlQWTLaPEFo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="360942195"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="360942195"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 17:04:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="843467751"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="843467751"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Jul 2023 17:04:08 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHCTg-0000tY-0T;
	Thu, 06 Jul 2023 00:04:08 +0000
Date: Thu, 6 Jul 2023 08:03:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to
 !ENDBR: .text+0x60493
Message-ID: <202307060759.C50jGX5O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kan Liang <kan.liang@linux.intel.com>
CC: Ingo Molnar <mingo@kernel.org>
CC: Andi Kleen <ak@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   73a3fcdaa73200e38e38f7e8a32c9b901c5b95b5
commit: 38aaf921e92dc5cf87e4a6c5a4b24dd99155cace perf/x86: Add Meteor Lake support
date:   6 months ago
config: x86_64-randconfig-r033-20230706 (https://download.01.org/0day-ci/archive/20230706/202307060759.C50jGX5O-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307060759.C50jGX5O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307060759.C50jGX5O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: balance_leaf+0x3974: stack state mismatch: cfa1=4+296 cfa2=4+288
>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to !ENDBR: .text+0x60493
   vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x39: relocation to !ENDBR: .text+0x6030e


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 000000000005eb00 <set_ftrace_ops_ro>:
0000    5eb00:	f3 0f 1e fa          	endbr64
0004    5eb04:	41 57                	push   %r15
0006    5eb06:	41 56                	push   %r14
0008    5eb08:	41 54                	push   %r12
000a    5eb0a:	53                   	push   %rbx
000b    5eb0b:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	5eb0e: R_X86_64_32S	ftrace_regs_caller
0012    5eb12:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 5eb19 <set_ftrace_ops_ro+0x19>	5eb15: R_X86_64_PC32	ftrace_ops_list-0x4
0019    5eb19:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	5eb1c: R_X86_64_32S	ftrace_list_end
0020    5eb20:	48 f7 d8             	neg    %rax
0023    5eb23:	4c 8d 3c 05 00 00 00 00 	lea    0x0(,%rax,1),%r15	5eb27: R_X86_64_32S	ftrace_regs_caller_end+0x1008
002b    5eb2b:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	5eb2e: R_X86_64_32S	ftrace_caller
0032    5eb32:	48 f7 d8             	neg    %rax
0035    5eb35:	49 c1 ef 0c          	shr    $0xc,%r15
0039    5eb39:	4c 8d 24 05 00 00 00 00 	lea    0x0(,%rax,1),%r12	5eb3d: R_X86_64_32S	ftrace_caller_end+0x1008
0041    5eb41:	49 c1 ec 0c          	shr    $0xc,%r12
0045    5eb45:	48 8b 43 10          	mov    0x10(%rbx),%rax
0049    5eb49:	a9 00 08 00 00       	test   $0x800,%eax
004e    5eb4e:	74 15                	je     5eb65 <set_ftrace_ops_ro+0x65>
0050    5eb50:	48 8b bb 90 01 00 00 	mov    0x190(%rbx),%rdi
0057    5eb57:	a8 04                	test   $0x4,%al
0059    5eb59:	44 89 fe             	mov    %r15d,%esi
005c    5eb5c:	41 0f 44 f4          	cmove  %r12d,%esi
0060    5eb60:	e8 00 00 00 00       	call   5eb65 <set_ftrace_ops_ro+0x65>	5eb61: R_X86_64_PLT32	set_memory_ro-0x4
0065    5eb65:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
0069    5eb69:	48 85 db             	test   %rbx,%rbx
006c    5eb6c:	74 05                	je     5eb73 <set_ftrace_ops_ro+0x73>
006e    5eb6e:	4c 39 f3             	cmp    %r14,%rbx
0071    5eb71:	75 d2                	jne    5eb45 <set_ftrace_ops_ro+0x45>
0073    5eb73:	5b                   	pop    %rbx
0074    5eb74:	41 5c                	pop    %r12
0076    5eb76:	41 5e                	pop    %r14
0078    5eb78:	41 5f                	pop    %r15
007a    5eb7a:	c3                   	ret
007b    5eb7b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
