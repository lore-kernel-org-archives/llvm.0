Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C011A214F9;
	Wed, 12 Jul 2023 16:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689178982; x=1720714982;
  h=date:from:cc:subject:message-id:mime-version;
  bh=5e4eLr4+RQ07KurVH1ktOT5q/25j8bfJ+hhEXVEr0qE=;
  b=DXtEExbvz1twWFLpyBbGs25CIuA5gJX88g1H97RXxCtsvGU0AI8SWncU
   lofcOGBXmACNGqepGjpWYy3pNVRblG6vnf8MsllqNyrCECmQPVhxzd4o4
   65xadHfP8ipnp11H8uyrpp/fSIRkr8OwEm2BBO4oSkeLqT1HIs9ro0f5W
   p9f8+2xjyi1DeUtY0ata2TgbbaG/nm57Ab7DQZtpZFBwZ5ErOrbcBg05w
   EiTfIi2nCRqt48KQNAPPsiU188eDV0R4wCKnxBBRJOWgVXpbf7sPQcJpu
   bsGaiE8W6JP2Hh0dCFRh8OwpV4I+XRWs41Bn6LYxlWuD0WwwZpPKJLt6w
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="364969222"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="364969222"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 09:23:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="721546428"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="721546428"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Jul 2023 09:23:00 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJccF-0005pV-31;
	Wed, 12 Jul 2023 16:22:59 +0000
Date: Thu, 13 Jul 2023 00:22:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x64: relocation to
 !ENDBR: can_boost+0x8ea
Message-ID: <202307130044.oSflbGGx-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f01e9fed8454dcd89727016c3e5b2fbb8f8e50c
commit: fee86a4ed536f4e521f3a4530242e152dd2a466b ftrace: selftest: remove broken trace_direct_tramp
date:   4 months ago
config: x86_64-randconfig-r025-20230712 (https://download.01.org/0day-ci/archive/20230713/202307130044.oSflbGGx-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130044.oSflbGGx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130044.oSflbGGx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ibt_selftest+0x14: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ibt_selftest+0x1e: return with modified stack frame
>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x64: relocation to !ENDBR: can_boost+0x8ea


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 00000000000f29b0 <set_ftrace_ops_ro>:
0000    f29b0:	f3 0f 1e fa          	endbr64
0004    f29b4:	55                   	push   %rbp
0005    f29b5:	48 89 e5             	mov    %rsp,%rbp
0008    f29b8:	41 57                	push   %r15
000a    f29ba:	41 56                	push   %r14
000c    f29bc:	41 55                	push   %r13
000e    f29be:	41 54                	push   %r12
0010    f29c0:	53                   	push   %rbx
0011    f29c1:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	f29c4: R_X86_64_32S	ftrace_ops_list
0018    f29c8:	48 c1 e8 03          	shr    $0x3,%rax
001c    f29cc:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0026    f29d6:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
002a    f29da:	74 0c                	je     f29e8 <set_ftrace_ops_ro+0x38>
002c    f29dc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	f29df: R_X86_64_32S	ftrace_ops_list
0033    f29e3:	e8 00 00 00 00       	call   f29e8 <set_ftrace_ops_ro+0x38>	f29e4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0038    f29e8:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # f29ef <set_ftrace_ops_ro+0x3f>	f29eb: R_X86_64_PC32	ftrace_ops_list-0x4
003f    f29ef:	e8 00 00 00 00       	call   f29f4 <set_ftrace_ops_ro+0x44>	f29f0: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
0044    f29f4:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	f29f7: R_X86_64_32S	ftrace_regs_caller
004b    f29fb:	48 f7 d8             	neg    %rax
004e    f29fe:	4c 8d 2c 05 00 00 00 00 	lea    0x0(,%rax,1),%r13	f2a02: R_X86_64_32S	ftrace_regs_caller_end+0x100c
0056    f2a06:	49 c1 ed 0c          	shr    $0xc,%r13
005a    f2a0a:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	f2a0d: R_X86_64_32S	ftrace_caller
0061    f2a11:	48 f7 d8             	neg    %rax
0064    f2a14:	4c 8d 24 05 00 00 00 00 	lea    0x0(,%rax,1),%r12	f2a18: R_X86_64_32S	ftrace_caller_end+0x100c
006c    f2a1c:	49 c1 ec 0c          	shr    $0xc,%r12
0070    f2a20:	4c 8d 73 10          	lea    0x10(%rbx),%r14
0074    f2a24:	4c 89 f0             	mov    %r14,%rax
0077    f2a27:	48 c1 e8 03          	shr    $0x3,%rax
007b    f2a2b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0085    f2a35:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0089    f2a39:	74 08                	je     f2a43 <set_ftrace_ops_ro+0x93>
008b    f2a3b:	4c 89 f7             	mov    %r14,%rdi
008e    f2a3e:	e8 00 00 00 00       	call   f2a43 <set_ftrace_ops_ro+0x93>	f2a3f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0093    f2a43:	4d 8b 3e             	mov    (%r14),%r15
0096    f2a46:	41 f7 c7 00 08 00 00 	test   $0x800,%r15d
009d    f2a4d:	74 39                	je     f2a88 <set_ftrace_ops_ro+0xd8>
009f    f2a4f:	4c 8d b3 60 01 00 00 	lea    0x160(%rbx),%r14
00a6    f2a56:	4c 89 f0             	mov    %r14,%rax
00a9    f2a59:	48 c1 e8 03          	shr    $0x3,%rax
00ad    f2a5d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
00b7    f2a67:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
00bb    f2a6b:	74 08                	je     f2a75 <set_ftrace_ops_ro+0xc5>
00bd    f2a6d:	4c 89 f7             	mov    %r14,%rdi
00c0    f2a70:	e8 00 00 00 00       	call   f2a75 <set_ftrace_ops_ro+0xc5>	f2a71: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00c5    f2a75:	41 f6 c7 04          	test   $0x4,%r15b
00c9    f2a79:	49 8b 3e             	mov    (%r14),%rdi
00cc    f2a7c:	44 89 ee             	mov    %r13d,%esi
00cf    f2a7f:	41 0f 44 f4          	cmove  %r12d,%esi
00d3    f2a83:	e8 00 00 00 00       	call   f2a88 <set_ftrace_ops_ro+0xd8>	f2a84: R_X86_64_PLT32	set_memory_ro-0x4
00d8    f2a88:	48 83 c3 08          	add    $0x8,%rbx
00dc    f2a8c:	48 89 d8             	mov    %rbx,%rax
00df    f2a8f:	48 c1 e8 03          	shr    $0x3,%rax
00e3    f2a93:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
00ed    f2a9d:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
00f1    f2aa1:	74 08                	je     f2aab <set_ftrace_ops_ro+0xfb>
00f3    f2aa3:	48 89 df             	mov    %rbx,%rdi
00f6    f2aa6:	e8 00 00 00 00       	call   f2aab <set_ftrace_ops_ro+0xfb>	f2aa7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00fb    f2aab:	48 8b 1b             	mov    (%rbx),%rbx
00fe    f2aae:	e8 00 00 00 00       	call   f2ab3 <set_ftrace_ops_ro+0x103>	f2aaf: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
0103    f2ab3:	48 85 db             	test   %rbx,%rbx
0106    f2ab6:	74 10                	je     f2ac8 <set_ftrace_ops_ro+0x118>
0108    f2ab8:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	f2abb: R_X86_64_32S	ftrace_list_end
010f    f2abf:	48 39 c3             	cmp    %rax,%rbx
0112    f2ac2:	0f 85 58 ff ff ff    	jne    f2a20 <set_ftrace_ops_ro+0x70>
0118    f2ac8:	5b                   	pop    %rbx
0119    f2ac9:	41 5c                	pop    %r12
011b    f2acb:	41 5d                	pop    %r13
011d    f2acd:	41 5e                	pop    %r14
011f    f2acf:	41 5f                	pop    %r15
0121    f2ad1:	5d                   	pop    %rbp
0122    f2ad2:	e9 00 00 00 00       	jmp    f2ad7 <set_ftrace_ops_ro+0x127>	f2ad3: R_X86_64_PLT32	__x86_return_thunk-0x4
0127    f2ad7:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
