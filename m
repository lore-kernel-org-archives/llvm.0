Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2178C6ABB;
	Fri,  8 Dec 2023 06:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gG4MkKRW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702015886; x=1733551886;
  h=date:from:cc:subject:message-id:mime-version;
  bh=yOxwwhB8G5hwHdJVGV764DpSyd51dGvgRh2J1c59Ctk=;
  b=gG4MkKRWxBBOwJBegkyAlOncqNn1MMfHbPXBP2TRj7aJOP1p+qHYHOtx
   g/0hFlrFqhxRPAk/MG5j2BfVtPsZJztok7fTSkDX2pa67haejkVqS+ohm
   KhhL6ic/QdYbgAk900veOWZQH0wquMLlg0/MpbjD4kiYIheIzrd3i94E6
   jdcXhdsP+BfOFpldWYmgM13NhvUqBaih/KLOrosUWI6bgdSSj/1T5WPN5
   lisIj7GSh2RqGFZxY50LVlwgvxLTbtRwdGd9vZZ0wrhVePWladOZOgv8a
   q06jhsatP1P+bsecX+6cyVTO9snQiR32Jv9KwFazrP8Qk3O3n6Eba0YKo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="13061901"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="13061901"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 22:11:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="945312893"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="945312893"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 07 Dec 2023 22:11:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBU52-000DLX-0K;
	Fri, 08 Dec 2023 06:11:20 +0000
Date: Fri, 8 Dec 2023 14:10:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH v13 13/35] x86/ptrace: Cleanup the definition of the
 pt_regs structure
Message-ID: <202312081436.4qSl1Jd4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20231205105030.8698-14-xin3.li@intel.com>
References: <20231205105030.8698-14-xin3.li@intel.com>
TO: Xin Li <xin3.li@intel.com>

Hi Xin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5d868f6ec314aaee65ec5d12c03f18d79e632043]

url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Li/x86-cpufeatures-opcode-msr-Add-the-WRMSRNS-instruction-support/20231205-192522
base:   5d868f6ec314aaee65ec5d12c03f18d79e632043
patch link:    https://lore.kernel.org/r/20231205105030.8698-14-xin3.li%40intel.com
patch subject: [PATCH v13 13/35] x86/ptrace: Cleanup the definition of the pt_regs structure
config: x86_64-randconfig-071-20231208 (https://download.01.org/0day-ci/archive/20231208/202312081436.4qSl1Jd4-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312081436.4qSl1Jd4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312081436.4qSl1Jd4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: balance_leaf+0xeb8a: stack state mismatch: cfa1=4+488 cfa2=4+480
>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x62: relocation to !ENDBR: recover_probed_instruction+0xe


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 0000000000112210 <set_ftrace_ops_ro>:
0000   112210:	f3 0f 1e fa          	endbr64
0004   112214:	55                   	push   %rbp
0005   112215:	41 57                	push   %r15
0007   112217:	41 56                	push   %r14
0009   112219:	41 55                	push   %r13
000b   11221b:	41 54                	push   %r12
000d   11221d:	53                   	push   %rbx
000e   11221e:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	112221: R_X86_64_32S	ftrace_ops_list
0015   112225:	48 c1 e8 03          	shr    $0x3,%rax
0019   112229:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
0023   112233:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
0028   112238:	74 0c                	je     112246 <set_ftrace_ops_ro+0x36>
002a   11223a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	11223d: R_X86_64_32S	ftrace_ops_list
0031   112241:	e8 00 00 00 00       	call   112246 <set_ftrace_ops_ro+0x36>	112242: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0036   112246:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 11224d <set_ftrace_ops_ro+0x3d>	112249: R_X86_64_PC32	ftrace_ops_list-0x4
003d   11224d:	e8 00 00 00 00       	call   112252 <set_ftrace_ops_ro+0x42>	11224e: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
0042   112252:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	112255: R_X86_64_32S	ftrace_regs_caller
0049   112259:	48 f7 d8             	neg    %rax
004c   11225c:	4c 8d 2c 05 00 00 00 00 	lea    0x0(,%rax,1),%r13	112260: R_X86_64_32S	ftrace_regs_caller_end+0x1008
0054   112264:	49 c1 ed 0c          	shr    $0xc,%r13
0058   112268:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	11226b: R_X86_64_32S	ftrace_caller
005f   11226f:	48 f7 d8             	neg    %rax
0062   112272:	48 8d 2c 05 00 00 00 00 	lea    0x0(,%rax,1),%rbp	112276: R_X86_64_32S	ftrace_caller_end+0x1008
006a   11227a:	48 c1 ed 0c          	shr    $0xc,%rbp
006e   11227e:	4c 8d 73 10          	lea    0x10(%rbx),%r14
0072   112282:	4c 89 f0             	mov    %r14,%rax
0075   112285:	48 c1 e8 03          	shr    $0x3,%rax
0079   112289:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
007e   11228e:	74 08                	je     112298 <set_ftrace_ops_ro+0x88>
0080   112290:	4c 89 f7             	mov    %r14,%rdi
0083   112293:	e8 00 00 00 00       	call   112298 <set_ftrace_ops_ro+0x88>	112294: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0088   112298:	4d 8b 26             	mov    (%r14),%r12
008b   11229b:	41 f7 c4 00 08 00 00 	test   $0x800,%r12d
0092   1122a2:	74 2f                	je     1122d3 <set_ftrace_ops_ro+0xc3>
0094   1122a4:	4c 8d b3 70 01 00 00 	lea    0x170(%rbx),%r14
009b   1122ab:	4c 89 f0             	mov    %r14,%rax
009e   1122ae:	48 c1 e8 03          	shr    $0x3,%rax
00a2   1122b2:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
00a7   1122b7:	74 08                	je     1122c1 <set_ftrace_ops_ro+0xb1>
00a9   1122b9:	4c 89 f7             	mov    %r14,%rdi
00ac   1122bc:	e8 00 00 00 00       	call   1122c1 <set_ftrace_ops_ro+0xb1>	1122bd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00b1   1122c1:	41 f6 c4 04          	test   $0x4,%r12b
00b5   1122c5:	49 8b 3e             	mov    (%r14),%rdi
00b8   1122c8:	44 89 ee             	mov    %r13d,%esi
00bb   1122cb:	0f 44 f5             	cmove  %ebp,%esi
00be   1122ce:	e8 00 00 00 00       	call   1122d3 <set_ftrace_ops_ro+0xc3>	1122cf: R_X86_64_PLT32	set_memory_ro-0x4
00c3   1122d3:	48 83 c3 08          	add    $0x8,%rbx
00c7   1122d7:	48 89 d8             	mov    %rbx,%rax
00ca   1122da:	48 c1 e8 03          	shr    $0x3,%rax
00ce   1122de:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
00d3   1122e3:	74 08                	je     1122ed <set_ftrace_ops_ro+0xdd>
00d5   1122e5:	48 89 df             	mov    %rbx,%rdi
00d8   1122e8:	e8 00 00 00 00       	call   1122ed <set_ftrace_ops_ro+0xdd>	1122e9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00dd   1122ed:	48 8b 1b             	mov    (%rbx),%rbx
00e0   1122f0:	e8 00 00 00 00       	call   1122f5 <set_ftrace_ops_ro+0xe5>	1122f1: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
00e5   1122f5:	48 85 db             	test   %rbx,%rbx
00e8   1122f8:	74 10                	je     11230a <set_ftrace_ops_ro+0xfa>
00ea   1122fa:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	1122fd: R_X86_64_32S	ftrace_list_end
00f1   112301:	48 39 c3             	cmp    %rax,%rbx
00f4   112304:	0f 85 74 ff ff ff    	jne    11227e <set_ftrace_ops_ro+0x6e>
00fa   11230a:	5b                   	pop    %rbx
00fb   11230b:	41 5c                	pop    %r12
00fd   11230d:	41 5d                	pop    %r13
00ff   11230f:	41 5e                	pop    %r14
0101   112311:	41 5f                	pop    %r15
0103   112313:	5d                   	pop    %rbp
0104   112314:	c3                   	ret
0105   112315:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
