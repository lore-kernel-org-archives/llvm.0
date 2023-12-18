Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44CC49893;
	Mon, 18 Dec 2023 22:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MaCcpc6z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702939464; x=1734475464;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Db2rUnV+9PkumFk9lUJ8SC3prJA+6j00yxsYlM5j6JM=;
  b=MaCcpc6zCToxPvq/vNaQQcoTM5doLgmHf+ARCIFEA5VCAIJEFmKv6aAd
   rPTp+vTt6ZCAjx0y644qE4LWAtvofn/ZzBujXDTUPq2+RCz68ZMl9Az9H
   JmrS8kIr57jSuqpEVbDINd6zNCB61KRr+x/szs4DGvP8TE8DFsK61znqM
   qCJhoDnVDqxnYjzg+7rrO79ms6c63ZhxMal1X8LnPfvNAQN8bzWryWECN
   ybC67mhnZG2uMVzxXhlsShWRrelyIhSqTnHv9Xy9KxC9XHgS1qHIiYAj1
   YBdTs47gIuyEHXVPqcff2D2tq63YBbYqxyaZsJhLD3W69LRkbvSkirkJc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="395304918"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="395304918"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 14:44:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="1022913941"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="1022913941"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 18 Dec 2023 14:44:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFMLU-0004bI-1k;
	Mon, 18 Dec 2023 22:44:20 +0000
Date: Tue, 19 Dec 2023 06:43:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to
 !ENDBR: arch_kexec_pre_free_pages+0x33
Message-ID: <202312190630.DujmQGO4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Ze Gao <zegao2021@gmail.com>
CC: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2cf4f94d8e8646803f8fb0facf134b0cd7fb691a
commit: 571a2a50a8fc546145ffd3bf673547e9fe128ed2 rethook, fprobe: do not trace rethook related functions
date:   7 months ago
config: x86_64-buildonly-randconfig-006-20231219 (https://download.01.org/0day-ci/archive/20231219/202312190630.DujmQGO4-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190630.DujmQGO4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190630.DujmQGO4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to !ENDBR: arch_kexec_pre_free_pages+0x33
   vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0x105: relocation to !ENDBR: native_write_cr4+0x4
   vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0x111: relocation to !ENDBR: native_write_cr4+0x4


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 000000000006d3a0 <set_ftrace_ops_ro>:
0000    6d3a0:	f3 0f 1e fa          	endbr64
0004    6d3a4:	41 57                	push   %r15
0006    6d3a6:	41 56                	push   %r14
0008    6d3a8:	41 54                	push   %r12
000a    6d3aa:	53                   	push   %rbx
000b    6d3ab:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 6d3b2 <set_ftrace_ops_ro+0x12>	6d3ae: R_X86_64_PC32	ftrace_ops_list-0x4
0012    6d3b2:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	6d3b5: R_X86_64_32S	ftrace_list_end
0019    6d3b9:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	6d3bc: R_X86_64_32S	ftrace_regs_caller
0020    6d3c0:	48 f7 d8             	neg    %rax
0023    6d3c3:	4c 8d 3c 05 00 00 00 00 	lea    0x0(,%rax,1),%r15	6d3c7: R_X86_64_32S	ftrace_regs_caller_end+0x1008
002b    6d3cb:	49 c1 ef 0c          	shr    $0xc,%r15
002f    6d3cf:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	6d3d2: R_X86_64_32S	ftrace_caller
0036    6d3d6:	48 f7 d8             	neg    %rax
0039    6d3d9:	4c 8d 24 05 00 00 00 00 	lea    0x0(,%rax,1),%r12	6d3dd: R_X86_64_32S	ftrace_caller_end+0x1008
0041    6d3e1:	49 c1 ec 0c          	shr    $0xc,%r12
0045    6d3e5:	48 8b 43 10          	mov    0x10(%rbx),%rax
0049    6d3e9:	a9 00 08 00 00       	test   $0x800,%eax
004e    6d3ee:	74 15                	je     6d405 <set_ftrace_ops_ro+0x65>
0050    6d3f0:	a8 04                	test   $0x4,%al
0052    6d3f2:	48 8b bb 60 01 00 00 	mov    0x160(%rbx),%rdi
0059    6d3f9:	44 89 fe             	mov    %r15d,%esi
005c    6d3fc:	41 0f 44 f4          	cmove  %r12d,%esi
0060    6d400:	e8 00 00 00 00       	call   6d405 <set_ftrace_ops_ro+0x65>	6d401: R_X86_64_PLT32	set_memory_ro-0x4
0065    6d405:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
0069    6d409:	48 85 db             	test   %rbx,%rbx
006c    6d40c:	74 05                	je     6d413 <set_ftrace_ops_ro+0x73>
006e    6d40e:	4c 39 f3             	cmp    %r14,%rbx
0071    6d411:	75 d2                	jne    6d3e5 <set_ftrace_ops_ro+0x45>
0073    6d413:	5b                   	pop    %rbx
0074    6d414:	41 5c                	pop    %r12
0076    6d416:	41 5e                	pop    %r14
0078    6d418:	41 5f                	pop    %r15
007a    6d41a:	31 c0                	xor    %eax,%eax
007c    6d41c:	31 ff                	xor    %edi,%edi
007e    6d41e:	31 f6                	xor    %esi,%esi
0080    6d420:	c3                   	ret
0081    6d421:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
