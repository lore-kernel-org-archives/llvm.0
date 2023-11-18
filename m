Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE64A37B;
	Sat, 18 Nov 2023 00:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBkNHXRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700266888; x=1731802888;
  h=date:from:cc:subject:message-id:mime-version;
  bh=3HIUZUvMVyKXyYxoAVrldgQCEQeNv68QqQiyNZejCrE=;
  b=FBkNHXRXMAzTfC4lyQu3tLtsYWFY9/41WTOA+aXGxMs5XA3+LWesuGkk
   3e1Kgh0/O2zZgvdluSyQoA8N3n1A5B0gIkZ4xpWkVoZWy9k+lcuTaVThw
   JV/3hYWZRWu54Te90RiAOA57su9PCg5dKoNuNuu7B94yEksHQnoHYqvo3
   wflqVVeSwcOrt5fAt0g1wmjC7VCw7fUgx3umcx2bIM7QdGB3xseXjhbsP
   yWSh6IGaqbQ4dzcFcKQK7CEMJ/KrQ5iQCMBiqy/GXrwm2jwAIK27e/vxa
   Rzw+8qg7XHMYgabQajsZB9QorzqDY+ig6XGToMtdZOYv5BtH3QzISnMxS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="455687970"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="455687970"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 16:21:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="939301319"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="939301319"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Nov 2023 16:21:25 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r495O-0003LG-2j;
	Sat, 18 Nov 2023 00:21:22 +0000
Date: Sat, 18 Nov 2023 08:20:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x47: relocation to
 !ENDBR: machine_kexec_prepare+0xbe3
Message-ID: <202311180849.TgTMsx6P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>
CC: Florent Revest <revest@chromium.org>

Hi Mark,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   791c8ab095f71327899023223940dd52257a4173
commit: fee86a4ed536f4e521f3a4530242e152dd2a466b ftrace: selftest: remove broken trace_direct_tramp
date:   8 months ago
config: x86_64-rhel-8.3-kunit (https://download.01.org/0day-ci/archive/20231118/202311180849.TgTMsx6P-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311180849.TgTMsx6P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311180849.TgTMsx6P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x47: relocation to !ENDBR: machine_kexec_prepare+0xbe3


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 00000000000e35f0 <set_ftrace_ops_ro>:
0000    e35f0:	f3 0f 1e fa          	endbr64
0004    e35f4:	55                   	push   %rbp
0005    e35f5:	41 57                	push   %r15
0007    e35f7:	41 56                	push   %r14
0009    e35f9:	41 55                	push   %r13
000b    e35fb:	41 54                	push   %r12
000d    e35fd:	53                   	push   %rbx
000e    e35fe:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	e3601: R_X86_64_32S	ftrace_ops_list
0015    e3605:	48 c1 e8 03          	shr    $0x3,%rax
0019    e3609:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
0023    e3613:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
0028    e3618:	74 0c                	je     e3626 <set_ftrace_ops_ro+0x36>
002a    e361a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e361d: R_X86_64_32S	ftrace_ops_list
0031    e3621:	e8 00 00 00 00       	call   e3626 <set_ftrace_ops_ro+0x36>	e3622: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0036    e3626:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # e362d <set_ftrace_ops_ro+0x3d>	e3629: R_X86_64_PC32	ftrace_ops_list-0x4
003d    e362d:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	e3630: R_X86_64_32S	ftrace_regs_caller
0044    e3634:	48 f7 d8             	neg    %rax
0047    e3637:	4c 8d 2c 05 00 00 00 00 	lea    0x0(,%rax,1),%r13	e363b: R_X86_64_32S	ftrace_regs_caller_end+0x1008
004f    e363f:	49 c1 ed 0c          	shr    $0xc,%r13
0053    e3643:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	e3646: R_X86_64_32S	ftrace_caller
005a    e364a:	48 f7 d8             	neg    %rax
005d    e364d:	48 8d 2c 05 00 00 00 00 	lea    0x0(,%rax,1),%rbp	e3651: R_X86_64_32S	ftrace_caller_end+0x1008
0065    e3655:	48 c1 ed 0c          	shr    $0xc,%rbp
0069    e3659:	4c 8d 73 10          	lea    0x10(%rbx),%r14
006d    e365d:	4c 89 f0             	mov    %r14,%rax
0070    e3660:	48 c1 e8 03          	shr    $0x3,%rax
0074    e3664:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
0079    e3669:	74 08                	je     e3673 <set_ftrace_ops_ro+0x83>
007b    e366b:	4c 89 f7             	mov    %r14,%rdi
007e    e366e:	e8 00 00 00 00       	call   e3673 <set_ftrace_ops_ro+0x83>	e366f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0083    e3673:	4d 8b 26             	mov    (%r14),%r12
0086    e3676:	41 f7 c4 00 08 00 00 	test   $0x800,%r12d
008d    e367d:	74 2f                	je     e36ae <set_ftrace_ops_ro+0xbe>
008f    e367f:	4c 8d b3 90 00 00 00 	lea    0x90(%rbx),%r14
0096    e3686:	4c 89 f0             	mov    %r14,%rax
0099    e3689:	48 c1 e8 03          	shr    $0x3,%rax
009d    e368d:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
00a2    e3692:	74 08                	je     e369c <set_ftrace_ops_ro+0xac>
00a4    e3694:	4c 89 f7             	mov    %r14,%rdi
00a7    e3697:	e8 00 00 00 00       	call   e369c <set_ftrace_ops_ro+0xac>	e3698: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00ac    e369c:	41 f6 c4 04          	test   $0x4,%r12b
00b0    e36a0:	49 8b 3e             	mov    (%r14),%rdi
00b3    e36a3:	44 89 ee             	mov    %r13d,%esi
00b6    e36a6:	0f 44 f5             	cmove  %ebp,%esi
00b9    e36a9:	e8 00 00 00 00       	call   e36ae <set_ftrace_ops_ro+0xbe>	e36aa: R_X86_64_PLT32	set_memory_ro-0x4
00be    e36ae:	48 83 c3 08          	add    $0x8,%rbx
00c2    e36b2:	48 89 d8             	mov    %rbx,%rax
00c5    e36b5:	48 c1 e8 03          	shr    $0x3,%rax
00c9    e36b9:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
00ce    e36be:	74 08                	je     e36c8 <set_ftrace_ops_ro+0xd8>
00d0    e36c0:	48 89 df             	mov    %rbx,%rdi
00d3    e36c3:	e8 00 00 00 00       	call   e36c8 <set_ftrace_ops_ro+0xd8>	e36c4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00d8    e36c8:	48 8b 1b             	mov    (%rbx),%rbx
00db    e36cb:	48 85 db             	test   %rbx,%rbx
00de    e36ce:	74 10                	je     e36e0 <set_ftrace_ops_ro+0xf0>
00e0    e36d0:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	e36d3: R_X86_64_32S	ftrace_list_end
00e7    e36d7:	48 39 c3             	cmp    %rax,%rbx
00ea    e36da:	0f 85 79 ff ff ff    	jne    e3659 <set_ftrace_ops_ro+0x69>
00f0    e36e0:	5b                   	pop    %rbx
00f1    e36e1:	41 5c                	pop    %r12
00f3    e36e3:	41 5d                	pop    %r13
00f5    e36e5:	41 5e                	pop    %r14
00f7    e36e7:	41 5f                	pop    %r15
00f9    e36e9:	5d                   	pop    %rbp
00fa    e36ea:	c3                   	ret
00fb    e36eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
