Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A78D567B;
	Tue,  4 Jul 2023 14:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688481599; x=1720017599;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Hb6owbd0NSn/EAr8ZZJFi3FKXXbByStNMoWcjzjHGEY=;
  b=gLVaQX39k4uwxzrmaNfEZvVaPART6P2xx12OrckU71ejZdNCMNVBHIPi
   cZjEfKkoYysLzJFSFILGAC9k3Uqm5qh1SX7WLpkJ+uGoqkcdfnvPMWg1C
   4nilVOlXlmhyFp76clZiVbQkNV1vpGJ6ddLvZG6OwVWKJkq0uILm3H4c/
   lqHDVa5NVcFMrQHjIRXtpdKBiu9WHDqNIOe+H2YzXhSCQTB6LXajKjK3+
   P2z2Q25gBLgeDMRogafvM6gVSrTffGvP0a9Wv62yansYcmuvBH3njktYb
   lpKQmCWcTfz/zc6cWByHh0SvRDEcyv7tdiSLBhSKfwCWUs0gZrf7dCcl/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="352965123"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="352965123"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 07:39:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="808959275"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="808959275"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Jul 2023 07:39:56 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGhC7-000IIs-33;
	Tue, 04 Jul 2023 14:39:55 +0000
Date: Tue, 4 Jul 2023 22:39:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: leaf_move_items+0xf7c: stack state
 mismatch: cfa1=4+160 cfa2=4+152
Message-ID: <202307042205.pXGI96VN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

Hi Jason,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24be4d0b46bb0c3c1dc7bacd30957d6144a70dfc
commit: ca7984dff94c091a68454b61eb754ec9d4b782a6 Revert "crypto: poly1305 - cleanup stray CRYPTO_LIB_POLY1305_RSIZE"
date:   1 year, 1 month ago
config: x86_64-randconfig-x014-20230704 (https://download.01.org/0day-ci/archive/20230704/202307042205.pXGI96VN-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307042205.pXGI96VN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307042205.pXGI96VN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: balance_leaf+0xe668: stack state mismatch: cfa1=4+400 cfa2=4+416
>> vmlinux.o: warning: objtool: leaf_move_items+0xf7c: stack state mismatch: cfa1=4+160 cfa2=4+152
   vmlinux.o: warning: objtool: leaf_copy_boundary_item+0x3695: stack state mismatch: cfa1=4+240 cfa2=4+232
   vmlinux.o: warning: objtool: leaf_copy_items_entirely+0xd1d: stack state mismatch: cfa1=4+256 cfa2=4+248
   vmlinux.o: warning: objtool: balance_internal+0x4ecb: stack state mismatch: cfa1=4+320 cfa2=4+328
   vmlinux.o: warning: objtool: internal_move_pointers_items+0x798: stack state mismatch: cfa1=4+224 cfa2=4+240
   vmlinux.o: warning: objtool: do_syscall_64+0x1e: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_syscall_32+0x2a: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __do_fast_syscall_32+0x28: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sync_regs+0x23: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x25: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0xf1: call to __kasan_check_read() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_page_fault+0x35: call to __kasan_check_read() leaves .noinstr.text section


objdump-func vmlinux.o leaf_move_items:
0000 00000000007058c0 <leaf_move_items>:
0000   7058c0:	f3 0f 1e fa          	endbr64
0004   7058c4:	55                   	push   %rbp
0005   7058c5:	41 57                	push   %r15
0007   7058c7:	41 56                	push   %r14
0009   7058c9:	41 55                	push   %r13
000b   7058cb:	41 54                	push   %r12
000d   7058cd:	53                   	push   %rbx
000e   7058ce:	48 83 ec 60          	sub    $0x60,%rsp
0012   7058d2:	4c 89 44 24 48       	mov    %r8,0x48(%rsp)
0017   7058d7:	41 89 cc             	mov    %ecx,%r12d
001a   7058da:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
001f   7058df:	49 89 f7             	mov    %rsi,%r15
0022   7058e2:	41 89 fe             	mov    %edi,%r14d
0025   7058e5:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
002f   7058ef:	4c 8d 6c 24 20       	lea    0x20(%rsp),%r13
0034   7058f4:	ba 20 00 00 00       	mov    $0x20,%edx
0039   7058f9:	4c 89 ef             	mov    %r13,%rdi
003c   7058fc:	31 f6                	xor    %esi,%esi
003e   7058fe:	e8 00 00 00 00       	call   705903 <leaf_move_items+0x43>	7058ff: R_X86_64_PLT32	memset-0x4
0043   705903:	48 89 e3             	mov    %rsp,%rbx
0046   705906:	ba 20 00 00 00       	mov    $0x20,%edx
004b   70590b:	48 89 df             	mov    %rbx,%rdi
004e   70590e:	31 f6                	xor    %esi,%esi
0050   705910:	e8 00 00 00 00       	call   705915 <leaf_move_items+0x55>	705911: R_X86_64_PLT32	memset-0x4
0055   705915:	41 83 fe 01          	cmp    $0x1,%r14d
0059   705919:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
005e   70591e:	0f 8e 57 02 00 00    	jle    705b7b <leaf_move_items+0x2bb>
0064   705924:	41 83 fe 02          	cmp    $0x2,%r14d
0068   705928:	0f 84 bf 04 00 00    	je     705ded <leaf_move_items+0x52d>
006e   70592e:	41 83 fe 03          	cmp    $0x3,%r14d
0072   705932:	0f 84 f4 05 00 00    	je     705f2c <leaf_move_items+0x66c>
0078   705938:	41 83 fe 04          	cmp    $0x4,%r14d
007c   70593c:	0f 85 3c 0f 00 00    	jne    70687e <leaf_move_items+0xfbe>
0082   705942:	44 89 64 24 44       	mov    %r12d,0x44(%rsp)
0087   705947:	48 c1 eb 03          	shr    $0x3,%rbx
008b   70594b:	80 3c 2b 00          	cmpb   $0x0,(%rbx,%rbp,1)
008f   70594f:	74 08                	je     705959 <leaf_move_items+0x99>
0091   705951:	48 89 e7             	mov    %rsp,%rdi
0094   705954:	e8 00 00 00 00       	call   705959 <leaf_move_items+0x99>	705955: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0099   705959:	4c 89 3c 24          	mov    %r15,(%rsp)
009d   70595d:	4d 8d 67 18          	lea    0x18(%r15),%r12
00a1   705961:	4d 89 e6             	mov    %r12,%r14
00a4   705964:	49 c1 ee 03          	shr    $0x3,%r14
00a8   705968:	41 80 3c 2e 00       	cmpb   $0x0,(%r14,%rbp,1)
00ad   70596d:	74 08                	je     705977 <leaf_move_items+0xb7>
00af   70596f:	4c 89 e7             	mov    %r12,%rdi
00b2   705972:	e8 00 00 00 00       	call   705977 <leaf_move_items+0xb7>	705973: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00b7   705977:	49 8b 2c 24          	mov    (%r12),%rbp
00bb   70597b:	48 89 e8             	mov    %rbp,%rax
00be   70597e:	48 c1 e8 03          	shr    $0x3,%rax
00c2   705982:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
00cc   70598c:	8a 04 08             	mov    (%rax,%rcx,1),%al
00cf   70598f:	84 c0                	test   %al,%al
00d1   705991:	0f 85 1b 0c 00 00    	jne    7065b2 <leaf_move_items+0xcf2>
00d7   705997:	48 63 5d 00          	movslq 0x0(%rbp),%rbx
00db   70599b:	48 83 c5 08          	add    $0x8,%rbp
00df   70599f:	48 83 fb 08          	cmp    $0x8,%rbx
00e3   7059a3:	0f 83 99 0e 00 00    	jae    706842 <leaf_move_items+0xf82>
00e9   7059a9:	48 c1 e3 04          	shl    $0x4,%rbx
00ed   7059ad:	48 01 dd             	add    %rbx,%rbp
00f0   7059b0:	48 89 e8             	mov    %rbp,%rax
00f3   7059b3:	48 c1 e8 03          	shr    $0x3,%rax
00f7   7059b7:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0101   7059c1:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0105   7059c5:	74 08                	je     7059cf <leaf_move_items+0x10f>
0107   7059c7:	48 89 ef             	mov    %rbp,%rdi
010a   7059ca:	e8 00 00 00 00       	call   7059cf <leaf_move_items+0x10f>	7059cb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
010f   7059cf:	48 8b 5d 00          	mov    0x0(%rbp),%rbx
0113   7059d3:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
0118   7059d8:	48 89 f8             	mov    %rdi,%rax
011b   7059db:	48 c1 e8 03          	shr    $0x3,%rax
011f   7059df:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0129   7059e9:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
012d   7059ed:	74 05                	je     7059f4 <leaf_move_items+0x134>
012f   7059ef:	e8 00 00 00 00       	call   7059f4 <leaf_move_items+0x134>	7059f0: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0134   7059f4:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
0139   7059f9:	41 80 3c 2e 00       	cmpb   $0x0,(%r14,%rbp,1)
013e   7059fe:	74 08                	je     705a08 <leaf_move_items+0x148>
0140   705a00:	4c 89 e7             	mov    %r12,%rdi
0143   705a03:	e8 00 00 00 00       	call   705a08 <leaf_move_items+0x148>	705a04: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0148   705a08:	49 8b 2c 24          	mov    (%r12),%rbp
014c   705a0c:	48 89 e8             	mov    %rbp,%rax
014f   705a0f:	48 c1 e8 03          	shr    $0x3,%rax
0153   705a13:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
015d   705a1d:	8a 04 08             	mov    (%rax,%rcx,1),%al
0160   705a20:	84 c0                	test   %al,%al
0162   705a22:	0f 85 a7 0b 00 00    	jne    7065cf <leaf_move_items+0xd0f>
0168   705a28:	8b 45 00             	mov    0x0(%rbp),%eax
016b   705a2b:	48 83 c5 08          	add    $0x8,%rbp
016f   705a2f:	ff c8                	dec    %eax
0171   705a31:	48 63 d8             	movslq %eax,%rbx
0174   705a34:	83 fb 08             	cmp    $0x8,%ebx
0177   705a37:	0f 83 19 0e 00 00    	jae    706856 <leaf_move_items+0xf96>
017d   705a3d:	48 c1 e3 04          	shl    $0x4,%rbx
0181   705a41:	48 01 dd             	add    %rbx,%rbp
0184   705a44:	48 89 e8             	mov    %rbp,%rax
0187   705a47:	48 c1 e8 03          	shr    $0x3,%rax
018b   705a4b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0195   705a55:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0199   705a59:	74 08                	je     705a63 <leaf_move_items+0x1a3>
019b   705a5b:	48 89 ef             	mov    %rbp,%rdi
019e   705a5e:	e8 00 00 00 00       	call   705a63 <leaf_move_items+0x1a3>	705a5f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01a3   705a63:	48 8b 5d 00          	mov    0x0(%rbp),%rbx
01a7   705a67:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
01ac   705a6c:	48 89 f8             	mov    %rdi,%rax
01af   705a6f:	48 c1 e8 03          	shr    $0x3,%rax
01b3   705a73:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
01bd   705a7d:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
01c1   705a81:	74 05                	je     705a88 <leaf_move_items+0x1c8>
01c3   705a83:	e8 00 00 00 00       	call   705a88 <leaf_move_items+0x1c8>	705a84: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
01c8   705a88:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
01cd   705a8d:	41 80 3c 2e 00       	cmpb   $0x0,(%r14,%rbp,1)
01d2   705a92:	74 08                	je     705a9c <leaf_move_items+0x1dc>
01d4   705a94:	4c 89 e7             	mov    %r12,%rdi
01d7   705a97:	e8 00 00 00 00       	call   705a9c <leaf_move_items+0x1dc>	705a98: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01dc   705a9c:	49 8b 1c 24          	mov    (%r12),%rbx
01e0   705aa0:	48 89 d8             	mov    %rbx,%rax
01e3   705aa3:	48 c1 e8 03          	shr    $0x3,%rax
01e7   705aa7:	8a 04 28             	mov    (%rax,%rbp,1),%al
01ea   705aaa:	84 c0                	test   %al,%al
01ec   705aac:	44 8b 64 24 44       	mov    0x44(%rsp),%r12d
01f1   705ab1:	0f 85 35 0b 00 00    	jne    7065ec <leaf_move_items+0xd2c>
01f7   705ab7:	8b 03                	mov    (%rbx),%eax
01f9   705ab9:	48 83 c3 08          	add    $0x8,%rbx
01fd   705abd:	ff c8                	dec    %eax
01ff   705abf:	48 63 e8             	movslq %eax,%rbp
0202   705ac2:	83 fd 08             	cmp    $0x8,%ebp
0205   705ac5:	0f 83 9f 0d 00 00    	jae    70686a <leaf_move_items+0xfaa>
020b   705acb:	48 c1 e5 04          	shl    $0x4,%rbp
020f   705acf:	48 01 eb             	add    %rbp,%rbx
0212   705ad2:	48 83 c3 08          	add    $0x8,%rbx
0216   705ad6:	48 89 d8             	mov    %rbx,%rax
0219   705ad9:	48 c1 e8 03          	shr    $0x3,%rax
021d   705add:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0227   705ae7:	8a 04 28             	mov    (%rax,%rbp,1),%al
022a   705aea:	84 c0                	test   %al,%al
022c   705aec:	0f 85 17 0b 00 00    	jne    706609 <leaf_move_items+0xd49>
0232   705af2:	8b 1b                	mov    (%rbx),%ebx
0234   705af4:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
0239   705af9:	48 89 f8             	mov    %rdi,%rax
023c   705afc:	48 c1 e8 03          	shr    $0x3,%rax
0240   705b00:	8a 04 28             	mov    (%rax,%rbp,1),%al
0243   705b03:	84 c0                	test   %al,%al
0245   705b05:	0f 85 1b 0b 00 00    	jne    706626 <leaf_move_items+0xd66>
024b   705b0b:	89 5c 24 18          	mov    %ebx,0x18(%rsp)
024f   705b0f:	49 c1 ed 03          	shr    $0x3,%r13
0253   705b13:	41 80 7c 2d 00 00    	cmpb   $0x0,0x0(%r13,%rbp,1)
0259   705b19:	74 0a                	je     705b25 <leaf_move_items+0x265>
025b   705b1b:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
0260   705b20:	e8 00 00 00 00       	call   705b25 <leaf_move_items+0x265>	705b21: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0265   705b25:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
026a   705b2a:	4c 89 7f f8          	mov    %r15,-0x8(%rdi)
026e   705b2e:	48 89 f8             	mov    %rdi,%rax
0271   705b31:	48 c1 e8 03          	shr    $0x3,%rax
0275   705b35:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0279   705b39:	74 05                	je     705b40 <leaf_move_items+0x280>
027b   705b3b:	e8 00 00 00 00       	call   705b40 <leaf_move_items+0x280>	705b3c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0280   705b40:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
0285   705b45:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
028a   705b4a:	48 89 47 f8          	mov    %rax,-0x8(%rdi)
028e   705b4e:	48 89 f8             	mov    %rdi,%rax
0291   705b51:	48 c1 e8 03          	shr    $0x3,%rax
0295   705b55:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0299   705b59:	74 05                	je     705b60 <leaf_move_items+0x2a0>
029b   705b5b:	e8 00 00 00 00       	call   705b60 <leaf_move_items+0x2a0>	705b5c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
02a0   705b60:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)
02a9   705b69:	c7 44 24 48 01 00 00 00 	movl   $0x1,0x48(%rsp)
02b1   705b71:	31 db                	xor    %ebx,%ebx
02b3   705b73:	45 31 f6             	xor    %r14d,%r14d
02b6   705b76:	e9 72 07 00 00       	jmp    7062ed <leaf_move_items+0xa2d>
02bb   705b7b:	45 85 f6             	test   %r14d,%r14d
02be   705b7e:	44 89 64 24 44       	mov    %r12d,0x44(%rsp)
02c3   705b83:	0f 84 fa 04 00 00    	je     706083 <leaf_move_items+0x7c3>
02c9   705b89:	41 83 fe 01          	cmp    $0x1,%r14d
02cd   705b8d:	0f 85 eb 0c 00 00    	jne    70687e <leaf_move_items+0xfbe>
02d3   705b93:	48 c1 eb 03          	shr    $0x3,%rbx
02d7   705b97:	80 3c 2b 00          	cmpb   $0x0,(%rbx,%rbp,1)
02db   705b9b:	74 08                	je     705ba5 <leaf_move_items+0x2e5>
02dd   705b9d:	48 89 e7             	mov    %rsp,%rdi
02e0   705ba0:	e8 00 00 00 00       	call   705ba5 <leaf_move_items+0x2e5>	705ba1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
02e5   705ba5:	4c 89 3c 24          	mov    %r15,(%rsp)
02e9   705ba9:	4d 8d 67 18          	lea    0x18(%r15),%r12
02ed   705bad:	4d 89 e6             	mov    %r12,%r14
02f0   705bb0:	49 c1 ee 03          	shr    $0x3,%r14
02f4   705bb4:	41 80 3c 2e 00       	cmpb   $0x0,(%r14,%rbp,1)
02f9   705bb9:	74 08                	je     705bc3 <leaf_move_items+0x303>
02fb   705bbb:	4c 89 e7             	mov    %r12,%rdi
02fe   705bbe:	e8 00 00 00 00       	call   705bc3 <leaf_move_items+0x303>	705bbf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0303   705bc3:	49 8b 2c 24          	mov    (%r12),%rbp
0307   705bc7:	48 89 e8             	mov    %rbp,%rax
030a   705bca:	48 c1 e8 03          	shr    $0x3,%rax
030e   705bce:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0318   705bd8:	8a 04 08             	mov    (%rax,%rcx,1),%al
031b   705bdb:	84 c0                	test   %al,%al
031d   705bdd:	0f 85 5d 0a 00 00    	jne    706640 <leaf_move_items+0xd80>
0323   705be3:	48 63 5d 00          	movslq 0x0(%rbp),%rbx
0327   705be7:	48 83 c5 08          	add    $0x8,%rbp
032b   705beb:	48 83 fb 08          	cmp    $0x8,%rbx
032f   705bef:	0f 83 ab 0c 00 00    	jae    7068a0 <leaf_move_items+0xfe0>
0335   705bf5:	48 c1 e3 04          	shl    $0x4,%rbx
0339   705bf9:	48 01 dd             	add    %rbx,%rbp
033c   705bfc:	48 89 e8             	mov    %rbp,%rax
033f   705bff:	48 c1 e8 03          	shr    $0x3,%rax
0343   705c03:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
034d   705c0d:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0351   705c11:	74 08                	je     705c1b <leaf_move_items+0x35b>
0353   705c13:	48 89 ef             	mov    %rbp,%rdi
0356   705c16:	e8 00 00 00 00       	call   705c1b <leaf_move_items+0x35b>	705c17: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
035b   705c1b:	48 8b 5d 00          	mov    0x0(%rbp),%rbx
035f   705c1f:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
0364   705c24:	48 89 f8             	mov    %rdi,%rax
0367   705c27:	48 c1 e8 03          	shr    $0x3,%rax
036b   705c2b:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0375   705c35:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0379   705c39:	74 05                	je     705c40 <leaf_move_items+0x380>
037b   705c3b:	e8 00 00 00 00       	call   705c40 <leaf_move_items+0x380>	705c3c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0380   705c40:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
0385   705c45:	41 80 3c 2e 00       	cmpb   $0x0,(%r14,%rbp,1)
038a   705c4a:	74 08                	je     705c54 <leaf_move_items+0x394>
038c   705c4c:	4c 89 e7             	mov    %r12,%rdi
038f   705c4f:	e8 00 00 00 00       	call   705c54 <leaf_move_items+0x394>	705c50: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0394   705c54:	49 8b 2c 24          	mov    (%r12),%rbp
0398   705c58:	48 89 e8             	mov    %rbp,%rax
039b   705c5b:	48 c1 e8 03          	shr    $0x3,%rax
039f   705c5f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
03a9   705c69:	8a 04 08             	mov    (%rax,%rcx,1),%al
03ac   705c6c:	84 c0                	test   %al,%al
03ae   705c6e:	0f 85 e9 09 00 00    	jne    70665d <leaf_move_items+0xd9d>
03b4   705c74:	8b 45 00             	mov    0x0(%rbp),%eax
03b7   705c77:	48 83 c5 08          	add    $0x8,%rbp
03bb   705c7b:	ff c8                	dec    %eax
03bd   705c7d:	48 63 d8             	movslq %eax,%rbx
03c0   705c80:	83 fb 08             	cmp    $0x8,%ebx
03c3   705c83:	0f 83 2b 0c 00 00    	jae    7068b4 <leaf_move_items+0xff4>
03c9   705c89:	48 c1 e3 04          	shl    $0x4,%rbx
03cd   705c8d:	48 01 dd             	add    %rbx,%rbp
03d0   705c90:	48 89 e8             	mov    %rbp,%rax
03d3   705c93:	48 c1 e8 03          	shr    $0x3,%rax
03d7   705c97:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
03e1   705ca1:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
03e5   705ca5:	74 08                	je     705caf <leaf_move_items+0x3ef>
03e7   705ca7:	48 89 ef             	mov    %rbp,%rdi
03ea   705caa:	e8 00 00 00 00       	call   705caf <leaf_move_items+0x3ef>	705cab: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03ef   705caf:	48 8b 5d 00          	mov    0x0(%rbp),%rbx
03f3   705cb3:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
03f8   705cb8:	48 89 f8             	mov    %rdi,%rax
03fb   705cbb:	48 c1 e8 03          	shr    $0x3,%rax
03ff   705cbf:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0409   705cc9:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
040d   705ccd:	74 05                	je     705cd4 <leaf_move_items+0x414>
040f   705ccf:	e8 00 00 00 00       	call   705cd4 <leaf_move_items+0x414>	705cd0: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0414   705cd4:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
0419   705cd9:	41 80 3c 2e 00       	cmpb   $0x0,(%r14,%rbp,1)
041e   705cde:	74 08                	je     705ce8 <leaf_move_items+0x428>
0420   705ce0:	4c 89 e7             	mov    %r12,%rdi
0423   705ce3:	e8 00 00 00 00       	call   705ce8 <leaf_move_items+0x428>	705ce4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0428   705ce8:	49 8b 1c 24          	mov    (%r12),%rbx
042c   705cec:	48 89 d8             	mov    %rbx,%rax
042f   705cef:	48 c1 e8 03          	shr    $0x3,%rax
0433   705cf3:	8a 04 28             	mov    (%rax,%rbp,1),%al
0436   705cf6:	84 c0                	test   %al,%al
0438   705cf8:	44 8b 64 24 44       	mov    0x44(%rsp),%r12d
043d   705cfd:	0f 85 77 09 00 00    	jne    70667a <leaf_move_items+0xdba>
0443   705d03:	8b 03                	mov    (%rbx),%eax
0445   705d05:	48 83 c3 08          	add    $0x8,%rbx
0449   705d09:	ff c8                	dec    %eax
044b   705d0b:	48 63 e8             	movslq %eax,%rbp
044e   705d0e:	83 fd 08             	cmp    $0x8,%ebp
0451   705d11:	0f 83 b1 0b 00 00    	jae    7068c8 <leaf_move_items+0x1008>
0457   705d17:	48 c1 e5 04          	shl    $0x4,%rbp
045b   705d1b:	48 01 eb             	add    %rbp,%rbx
045e   705d1e:	48 83 c3 08          	add    $0x8,%rbx
0462   705d22:	48 89 d8             	mov    %rbx,%rax
0465   705d25:	48 c1 e8 03          	shr    $0x3,%rax
0469   705d29:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0473   705d33:	8a 04 28             	mov    (%rax,%rbp,1),%al
0476   705d36:	84 c0                	test   %al,%al
0478   705d38:	0f 85 59 09 00 00    	jne    706697 <leaf_move_items+0xdd7>
047e   705d3e:	8b 1b                	mov    (%rbx),%ebx
0480   705d40:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
0485   705d45:	48 89 f8             	mov    %rdi,%rax
0488   705d48:	48 c1 e8 03          	shr    $0x3,%rax
048c   705d4c:	8a 04 28             	mov    (%rax,%rbp,1),%al
048f   705d4f:	84 c0                	test   %al,%al
0491   705d51:	0f 85 5d 09 00 00    	jne    7066b4 <leaf_move_items+0xdf4>
0497   705d57:	89 5c 24 18          	mov    %ebx,0x18(%rsp)
049b   705d5b:	49 c1 ed 03          	shr    $0x3,%r13
049f   705d5f:	41 80 7c 2d 00 00    	cmpb   $0x0,0x0(%r13,%rbp,1)
04a5   705d65:	74 0a                	je     705d71 <leaf_move_items+0x4b1>
04a7   705d67:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
04ac   705d6c:	e8 00 00 00 00       	call   705d71 <leaf_move_items+0x4b1>	705d6d: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
04b1   705d71:	4c 89 7c 24 20       	mov    %r15,0x20(%rsp)
04b6   705d76:	49 8d 5f 48          	lea    0x48(%r15),%rbx
04ba   705d7a:	48 89 d8             	mov    %rbx,%rax
04bd   705d7d:	48 c1 e8 03          	shr    $0x3,%rax
04c1   705d81:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
04c5   705d85:	74 08                	je     705d8f <leaf_move_items+0x4cf>
04c7   705d87:	48 89 df             	mov    %rbx,%rdi
04ca   705d8a:	e8 00 00 00 00       	call   705d8f <leaf_move_items+0x4cf>	705d8b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04cf   705d8f:	48 8b 1b             	mov    (%rbx),%rbx
04d2   705d92:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
04d7   705d97:	48 89 f8             	mov    %rdi,%rax
04da   705d9a:	48 c1 e8 03          	shr    $0x3,%rax
04de   705d9e:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
04e2   705da2:	74 05                	je     705da9 <leaf_move_items+0x4e9>
04e4   705da4:	e8 00 00 00 00       	call   705da9 <leaf_move_items+0x4e9>	705da5: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
04e9   705da9:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
04ee   705dae:	49 8d 9f 98 00 00 00 	lea    0x98(%r15),%rbx
04f5   705db5:	48 89 d8             	mov    %rbx,%rax
04f8   705db8:	48 c1 e8 03          	shr    $0x3,%rax
04fc   705dbc:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0500   705dc0:	74 08                	je     705dca <leaf_move_items+0x50a>
0502   705dc2:	48 89 df             	mov    %rbx,%rdi
0505   705dc5:	e8 00 00 00 00       	call   705dca <leaf_move_items+0x50a>	705dc6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
050a   705dca:	48 8b 1b             	mov    (%rbx),%rbx
050d   705dcd:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
0512   705dd2:	48 89 f8             	mov    %rdi,%rax
0515   705dd5:	48 c1 e8 03          	shr    $0x3,%rax
0519   705dd9:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
051d   705ddd:	0f 84 7f 02 00 00    	je     706062 <leaf_move_items+0x7a2>
0523   705de3:	e8 00 00 00 00       	call   705de8 <leaf_move_items+0x528>	705de4: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0528   705de8:	e9 75 02 00 00       	jmp    706062 <leaf_move_items+0x7a2>
052d   705ded:	48 c1 eb 03          	shr    $0x3,%rbx
0531   705df1:	80 3c 2b 00          	cmpb   $0x0,(%rbx,%rbp,1)
0535   705df5:	74 08                	je     705dff <leaf_move_items+0x53f>
0537   705df7:	48 89 e7             	mov    %rsp,%rdi
053a   705dfa:	e8 00 00 00 00       	call   705dff <leaf_move_items+0x53f>	705dfb: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
053f   705dff:	4c 89 3c 24          	mov    %r15,(%rsp)
0543   705e03:	49 8d 5f 48          	lea    0x48(%r15),%rbx
0547   705e07:	48 89 d8             	mov    %rbx,%rax
054a   705e0a:	48 c1 e8 03          	shr    $0x3,%rax
054e   705e0e:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0552   705e12:	74 08                	je     705e1c <leaf_move_items+0x55c>
0554   705e14:	48 89 df             	mov    %rbx,%rdi
0557   705e17:	e8 00 00 00 00       	call   705e1c <leaf_move_items+0x55c>	705e18: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
055c   705e1c:	48 8b 1b             	mov    (%rbx),%rbx
055f   705e1f:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
0564   705e24:	48 89 f8             	mov    %rdi,%rax
0567   705e27:	48 c1 e8 03          	shr    $0x3,%rax
056b   705e2b:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
056f   705e2f:	74 05                	je     705e36 <leaf_move_items+0x576>
0571   705e31:	e8 00 00 00 00       	call   705e36 <leaf_move_items+0x576>	705e32: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0576   705e36:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
057b   705e3b:	49 8d 9f 98 00 00 00 	lea    0x98(%r15),%rbx
0582   705e42:	48 89 d8             	mov    %rbx,%rax
0585   705e45:	48 c1 e8 03          	shr    $0x3,%rax
0589   705e49:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
058d   705e4d:	74 08                	je     705e57 <leaf_move_items+0x597>
058f   705e4f:	48 89 df             	mov    %rbx,%rdi
0592   705e52:	e8 00 00 00 00       	call   705e57 <leaf_move_items+0x597>	705e53: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0597   705e57:	48 8b 1b             	mov    (%rbx),%rbx
059a   705e5a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
059f   705e5f:	48 89 f8             	mov    %rdi,%rax
05a2   705e62:	48 c1 e8 03          	shr    $0x3,%rax
05a6   705e66:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
05aa   705e6a:	74 05                	je     705e71 <leaf_move_items+0x5b1>
05ac   705e6c:	e8 00 00 00 00       	call   705e71 <leaf_move_items+0x5b1>	705e6d: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
05b1   705e71:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
05b6   705e76:	4c 89 ff             	mov    %r15,%rdi
05b9   705e79:	31 f6                	xor    %esi,%esi
05bb   705e7b:	e8 00 00 00 00       	call   705e80 <leaf_move_items+0x5c0>	705e7c: R_X86_64_PLT32	get_right_neighbor_position-0x4
05c0   705e80:	89 c3                	mov    %eax,%ebx
05c2   705e82:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
05c7   705e87:	48 89 f8             	mov    %rdi,%rax
05ca   705e8a:	48 c1 e8 03          	shr    $0x3,%rax
05ce   705e8e:	8a 04 28             	mov    (%rax,%rbp,1),%al
05d1   705e91:	84 c0                	test   %al,%al
05d3   705e93:	0f 85 35 08 00 00    	jne    7066ce <leaf_move_items+0xe0e>
05d9   705e99:	89 5c 24 18          	mov    %ebx,0x18(%rsp)
05dd   705e9d:	49 c1 ed 03          	shr    $0x3,%r13
05e1   705ea1:	41 80 7c 2d 00 00    	cmpb   $0x0,0x0(%r13,%rbp,1)
05e7   705ea7:	74 0a                	je     705eb3 <leaf_move_items+0x5f3>
05e9   705ea9:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
05ee   705eae:	e8 00 00 00 00       	call   705eb3 <leaf_move_items+0x5f3>	705eaf: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
05f3   705eb3:	4c 89 7c 24 20       	mov    %r15,0x20(%rsp)
05f8   705eb8:	49 8d 5f 20          	lea    0x20(%r15),%rbx
05fc   705ebc:	48 89 d8             	mov    %rbx,%rax
05ff   705ebf:	48 c1 e8 03          	shr    $0x3,%rax
0603   705ec3:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0607   705ec7:	74 08                	je     705ed1 <leaf_move_items+0x611>
0609   705ec9:	48 89 df             	mov    %rbx,%rdi
060c   705ecc:	e8 00 00 00 00       	call   705ed1 <leaf_move_items+0x611>	705ecd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0611   705ed1:	48 8b 1b             	mov    (%rbx),%rbx
0614   705ed4:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
0619   705ed9:	48 89 f8             	mov    %rdi,%rax
061c   705edc:	48 c1 e8 03          	shr    $0x3,%rax
0620   705ee0:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0624   705ee4:	74 05                	je     705eeb <leaf_move_items+0x62b>
0626   705ee6:	e8 00 00 00 00       	call   705eeb <leaf_move_items+0x62b>	705ee7: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
062b   705eeb:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
0630   705ef0:	49 8d 5f 70          	lea    0x70(%r15),%rbx
0634   705ef4:	48 89 d8             	mov    %rbx,%rax
0637   705ef7:	48 c1 e8 03          	shr    $0x3,%rax
063b   705efb:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
063f   705eff:	74 08                	je     705f09 <leaf_move_items+0x649>
0641   705f01:	48 89 df             	mov    %rbx,%rdi
0644   705f04:	e8 00 00 00 00       	call   705f09 <leaf_move_items+0x649>	705f05: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0649   705f09:	48 8b 1b             	mov    (%rbx),%rbx
064c   705f0c:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
0651   705f11:	48 89 f8             	mov    %rdi,%rax
0654   705f14:	48 c1 e8 03          	shr    $0x3,%rax
0658   705f18:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
065c   705f1c:	0f 84 af 03 00 00    	je     7062d1 <leaf_move_items+0xa11>
0662   705f22:	e8 00 00 00 00       	call   705f27 <leaf_move_items+0x667>	705f23: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0667   705f27:	e9 a5 03 00 00       	jmp    7062d1 <leaf_move_items+0xa11>
066c   705f2c:	48 c1 eb 03          	shr    $0x3,%rbx
0670   705f30:	80 3c 2b 00          	cmpb   $0x0,(%rbx,%rbp,1)
0674   705f34:	74 08                	je     705f3e <leaf_move_items+0x67e>
0676   705f36:	48 89 e7             	mov    %rsp,%rdi
0679   705f39:	e8 00 00 00 00       	call   705f3e <leaf_move_items+0x67e>	705f3a: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
067e   705f3e:	4c 89 3c 24          	mov    %r15,(%rsp)
0682   705f42:	49 8d 5f 20          	lea    0x20(%r15),%rbx
0686   705f46:	48 89 d8             	mov    %rbx,%rax
0689   705f49:	48 c1 e8 03          	shr    $0x3,%rax
068d   705f4d:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0691   705f51:	74 08                	je     705f5b <leaf_move_items+0x69b>
0693   705f53:	48 89 df             	mov    %rbx,%rdi
0696   705f56:	e8 00 00 00 00       	call   705f5b <leaf_move_items+0x69b>	705f57: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
069b   705f5b:	48 8b 1b             	mov    (%rbx),%rbx
069e   705f5e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
06a3   705f63:	48 89 f8             	mov    %rdi,%rax
06a6   705f66:	48 c1 e8 03          	shr    $0x3,%rax
06aa   705f6a:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
06ae   705f6e:	74 05                	je     705f75 <leaf_move_items+0x6b5>
06b0   705f70:	e8 00 00 00 00       	call   705f75 <leaf_move_items+0x6b5>	705f71: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
06b5   705f75:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
06ba   705f7a:	49 8d 5f 70          	lea    0x70(%r15),%rbx
06be   705f7e:	48 89 d8             	mov    %rbx,%rax
06c1   705f81:	48 c1 e8 03          	shr    $0x3,%rax
06c5   705f85:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
06c9   705f89:	74 08                	je     705f93 <leaf_move_items+0x6d3>
06cb   705f8b:	48 89 df             	mov    %rbx,%rdi
06ce   705f8e:	e8 00 00 00 00       	call   705f93 <leaf_move_items+0x6d3>	705f8f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
06d3   705f93:	48 8b 1b             	mov    (%rbx),%rbx
06d6   705f96:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
06db   705f9b:	48 89 f8             	mov    %rdi,%rax
06de   705f9e:	48 c1 e8 03          	shr    $0x3,%rax
06e2   705fa2:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
06e6   705fa6:	74 05                	je     705fad <leaf_move_items+0x6ed>
06e8   705fa8:	e8 00 00 00 00       	call   705fad <leaf_move_items+0x6ed>	705fa9: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
06ed   705fad:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
06f2   705fb2:	4c 89 ff             	mov    %r15,%rdi
06f5   705fb5:	31 f6                	xor    %esi,%esi
06f7   705fb7:	e8 00 00 00 00       	call   705fbc <leaf_move_items+0x6fc>	705fb8: R_X86_64_PLT32	get_left_neighbor_position-0x4
06fc   705fbc:	89 c3                	mov    %eax,%ebx
06fe   705fbe:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
0703   705fc3:	48 89 f8             	mov    %rdi,%rax
0706   705fc6:	48 c1 e8 03          	shr    $0x3,%rax
070a   705fca:	8a 04 28             	mov    (%rax,%rbp,1),%al
070d   705fcd:	84 c0                	test   %al,%al
070f   705fcf:	0f 85 13 07 00 00    	jne    7066e8 <leaf_move_items+0xe28>
0715   705fd5:	89 5c 24 18          	mov    %ebx,0x18(%rsp)
0719   705fd9:	49 c1 ed 03          	shr    $0x3,%r13
071d   705fdd:	41 80 7c 2d 00 00    	cmpb   $0x0,0x0(%r13,%rbp,1)
0723   705fe3:	74 0a                	je     705fef <leaf_move_items+0x72f>
0725   705fe5:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
072a   705fea:	e8 00 00 00 00       	call   705fef <leaf_move_items+0x72f>	705feb: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
072f   705fef:	4c 89 7c 24 20       	mov    %r15,0x20(%rsp)
0734   705ff4:	49 8d 5f 48          	lea    0x48(%r15),%rbx
0738   705ff8:	48 89 d8             	mov    %rbx,%rax
073b   705ffb:	48 c1 e8 03          	shr    $0x3,%rax
073f   705fff:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0743   706003:	74 08                	je     70600d <leaf_move_items+0x74d>
0745   706005:	48 89 df             	mov    %rbx,%rdi
0748   706008:	e8 00 00 00 00       	call   70600d <leaf_move_items+0x74d>	706009: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
074d   70600d:	48 8b 1b             	mov    (%rbx),%rbx
0750   706010:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
0755   706015:	48 89 f8             	mov    %rdi,%rax
0758   706018:	48 c1 e8 03          	shr    $0x3,%rax
075c   70601c:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0760   706020:	74 05                	je     706027 <leaf_move_items+0x767>
0762   706022:	e8 00 00 00 00       	call   706027 <leaf_move_items+0x767>	706023: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0767   706027:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
076c   70602c:	49 8d 9f 98 00 00 00 	lea    0x98(%r15),%rbx
0773   706033:	48 89 d8             	mov    %rbx,%rax
0776   706036:	48 c1 e8 03          	shr    $0x3,%rax
077a   70603a:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
077e   70603e:	74 08                	je     706048 <leaf_move_items+0x788>
0780   706040:	48 89 df             	mov    %rbx,%rdi
0783   706043:	e8 00 00 00 00       	call   706048 <leaf_move_items+0x788>	706044: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0788   706048:	48 8b 1b             	mov    (%rbx),%rbx
078b   70604b:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
0790   706050:	48 89 f8             	mov    %rdi,%rax
0793   706053:	48 c1 e8 03          	shr    $0x3,%rax
0797   706057:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
079b   70605b:	74 05                	je     706062 <leaf_move_items+0x7a2>
079d   70605d:	e8 00 00 00 00       	call   706062 <leaf_move_items+0x7a2>	70605e: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
07a2   706062:	48 89 5c 24 30       	mov    %rbx,0x30(%rsp)
07a7   706067:	45 31 f6             	xor    %r14d,%r14d
07aa   70606a:	4c 89 ff             	mov    %r15,%rdi
07ad   70606d:	31 f6                	xor    %esi,%esi
07af   70606f:	e8 00 00 00 00       	call   706074 <leaf_move_items+0x7b4>	706070: R_X86_64_PLT32	get_right_neighbor_position-0x4
07b4   706074:	89 c3                	mov    %eax,%ebx
07b6   706076:	c7 44 24 48 01 00 00 00 	movl   $0x1,0x48(%rsp)
07be   70607e:	e9 6a 02 00 00       	jmp    7062ed <leaf_move_items+0xa2d>
07c3   706083:	48 c1 eb 03          	shr    $0x3,%rbx
07c7   706087:	80 3c 2b 00          	cmpb   $0x0,(%rbx,%rbp,1)
07cb   70608b:	74 08                	je     706095 <leaf_move_items+0x7d5>
07cd   70608d:	48 89 e7             	mov    %rsp,%rdi
07d0   706090:	e8 00 00 00 00       	call   706095 <leaf_move_items+0x7d5>	706091: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
07d5   706095:	4c 89 3c 24          	mov    %r15,(%rsp)
07d9   706099:	4d 8d 67 18          	lea    0x18(%r15),%r12
07dd   70609d:	4d 89 e6             	mov    %r12,%r14
07e0   7060a0:	49 c1 ee 03          	shr    $0x3,%r14
07e4   7060a4:	41 80 3c 2e 00       	cmpb   $0x0,(%r14,%rbp,1)
07e9   7060a9:	74 08                	je     7060b3 <leaf_move_items+0x7f3>
07eb   7060ab:	4c 89 e7             	mov    %r12,%rdi
07ee   7060ae:	e8 00 00 00 00       	call   7060b3 <leaf_move_items+0x7f3>	7060af: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
07f3   7060b3:	49 8b 2c 24          	mov    (%r12),%rbp
07f7   7060b7:	48 89 e8             	mov    %rbp,%rax
07fa   7060ba:	48 c1 e8 03          	shr    $0x3,%rax
07fe   7060be:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0808   7060c8:	8a 04 08             	mov    (%rax,%rcx,1),%al
080b   7060cb:	84 c0                	test   %al,%al
080d   7060cd:	0f 85 2f 06 00 00    	jne    706702 <leaf_move_items+0xe42>
0813   7060d3:	48 63 5d 00          	movslq 0x0(%rbp),%rbx
0817   7060d7:	48 83 c5 08          	add    $0x8,%rbp
081b   7060db:	48 83 fb 08          	cmp    $0x8,%rbx
081f   7060df:	0f 83 f7 07 00 00    	jae    7068dc <leaf_move_items+0x101c>
0825   7060e5:	48 c1 e3 04          	shl    $0x4,%rbx
0829   7060e9:	48 01 dd             	add    %rbx,%rbp
082c   7060ec:	48 89 e8             	mov    %rbp,%rax
082f   7060ef:	48 c1 e8 03          	shr    $0x3,%rax
0833   7060f3:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
083d   7060fd:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0841   706101:	74 08                	je     70610b <leaf_move_items+0x84b>
0843   706103:	48 89 ef             	mov    %rbp,%rdi
0846   706106:	e8 00 00 00 00       	call   70610b <leaf_move_items+0x84b>	706107: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
084b   70610b:	48 8b 5d 00          	mov    0x0(%rbp),%rbx
084f   70610f:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
0854   706114:	48 89 f8             	mov    %rdi,%rax
0857   706117:	48 c1 e8 03          	shr    $0x3,%rax
085b   70611b:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0865   706125:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0869   706129:	74 05                	je     706130 <leaf_move_items+0x870>
086b   70612b:	e8 00 00 00 00       	call   706130 <leaf_move_items+0x870>	70612c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0870   706130:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
0875   706135:	41 80 3c 2e 00       	cmpb   $0x0,(%r14,%rbp,1)
087a   70613a:	74 08                	je     706144 <leaf_move_items+0x884>
087c   70613c:	4c 89 e7             	mov    %r12,%rdi
087f   70613f:	e8 00 00 00 00       	call   706144 <leaf_move_items+0x884>	706140: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0884   706144:	49 8b 2c 24          	mov    (%r12),%rbp
0888   706148:	48 89 e8             	mov    %rbp,%rax
088b   70614b:	48 c1 e8 03          	shr    $0x3,%rax
088f   70614f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0899   706159:	8a 04 08             	mov    (%rax,%rcx,1),%al
089c   70615c:	84 c0                	test   %al,%al
089e   70615e:	0f 85 bb 05 00 00    	jne    70671f <leaf_move_items+0xe5f>
08a4   706164:	8b 45 00             	mov    0x0(%rbp),%eax
08a7   706167:	48 83 c5 08          	add    $0x8,%rbp
08ab   70616b:	ff c8                	dec    %eax
08ad   70616d:	48 63 d8             	movslq %eax,%rbx
08b0   706170:	83 fb 08             	cmp    $0x8,%ebx
08b3   706173:	0f 83 77 07 00 00    	jae    7068f0 <leaf_move_items+0x1030>
08b9   706179:	48 c1 e3 04          	shl    $0x4,%rbx
08bd   70617d:	48 01 dd             	add    %rbx,%rbp
08c0   706180:	48 89 e8             	mov    %rbp,%rax
08c3   706183:	48 c1 e8 03          	shr    $0x3,%rax
08c7   706187:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
08d1   706191:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
08d5   706195:	74 08                	je     70619f <leaf_move_items+0x8df>
08d7   706197:	48 89 ef             	mov    %rbp,%rdi
08da   70619a:	e8 00 00 00 00       	call   70619f <leaf_move_items+0x8df>	70619b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
08df   70619f:	48 8b 5d 00          	mov    0x0(%rbp),%rbx
08e3   7061a3:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
08e8   7061a8:	48 89 f8             	mov    %rdi,%rax
08eb   7061ab:	48 c1 e8 03          	shr    $0x3,%rax
08ef   7061af:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
08f9   7061b9:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
08fd   7061bd:	74 05                	je     7061c4 <leaf_move_items+0x904>
08ff   7061bf:	e8 00 00 00 00       	call   7061c4 <leaf_move_items+0x904>	7061c0: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0904   7061c4:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
0909   7061c9:	41 80 3c 2e 00       	cmpb   $0x0,(%r14,%rbp,1)
090e   7061ce:	74 08                	je     7061d8 <leaf_move_items+0x918>
0910   7061d0:	4c 89 e7             	mov    %r12,%rdi
0913   7061d3:	e8 00 00 00 00       	call   7061d8 <leaf_move_items+0x918>	7061d4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0918   7061d8:	49 8b 1c 24          	mov    (%r12),%rbx
091c   7061dc:	48 89 d8             	mov    %rbx,%rax
091f   7061df:	48 c1 e8 03          	shr    $0x3,%rax
0923   7061e3:	8a 04 28             	mov    (%rax,%rbp,1),%al
0926   7061e6:	84 c0                	test   %al,%al
0928   7061e8:	44 8b 64 24 44       	mov    0x44(%rsp),%r12d
092d   7061ed:	0f 85 49 05 00 00    	jne    70673c <leaf_move_items+0xe7c>
0933   7061f3:	8b 03                	mov    (%rbx),%eax
0935   7061f5:	48 83 c3 08          	add    $0x8,%rbx
0939   7061f9:	ff c8                	dec    %eax
093b   7061fb:	48 63 e8             	movslq %eax,%rbp
093e   7061fe:	83 fd 08             	cmp    $0x8,%ebp
0941   706201:	0f 83 fd 06 00 00    	jae    706904 <leaf_move_items+0x1044>
0947   706207:	48 c1 e5 04          	shl    $0x4,%rbp
094b   70620b:	48 01 eb             	add    %rbp,%rbx
094e   70620e:	48 83 c3 08          	add    $0x8,%rbx
0952   706212:	48 89 d8             	mov    %rbx,%rax
0955   706215:	48 c1 e8 03          	shr    $0x3,%rax
0959   706219:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0963   706223:	8a 04 28             	mov    (%rax,%rbp,1),%al
0966   706226:	84 c0                	test   %al,%al
0968   706228:	0f 85 2b 05 00 00    	jne    706759 <leaf_move_items+0xe99>
096e   70622e:	8b 1b                	mov    (%rbx),%ebx
0970   706230:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
0975   706235:	48 89 f8             	mov    %rdi,%rax
0978   706238:	48 c1 e8 03          	shr    $0x3,%rax
097c   70623c:	8a 04 28             	mov    (%rax,%rbp,1),%al
097f   70623f:	84 c0                	test   %al,%al
0981   706241:	0f 85 2f 05 00 00    	jne    706776 <leaf_move_items+0xeb6>
0987   706247:	89 5c 24 18          	mov    %ebx,0x18(%rsp)
098b   70624b:	49 c1 ed 03          	shr    $0x3,%r13
098f   70624f:	41 80 7c 2d 00 00    	cmpb   $0x0,0x0(%r13,%rbp,1)
0995   706255:	74 0a                	je     706261 <leaf_move_items+0x9a1>
0997   706257:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
099c   70625c:	e8 00 00 00 00       	call   706261 <leaf_move_items+0x9a1>	70625d: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
09a1   706261:	4c 89 7c 24 20       	mov    %r15,0x20(%rsp)
09a6   706266:	49 8d 5f 20          	lea    0x20(%r15),%rbx
09aa   70626a:	48 89 d8             	mov    %rbx,%rax
09ad   70626d:	48 c1 e8 03          	shr    $0x3,%rax
09b1   706271:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
09b5   706275:	74 08                	je     70627f <leaf_move_items+0x9bf>
09b7   706277:	48 89 df             	mov    %rbx,%rdi
09ba   70627a:	e8 00 00 00 00       	call   70627f <leaf_move_items+0x9bf>	70627b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
09bf   70627f:	48 8b 1b             	mov    (%rbx),%rbx
09c2   706282:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
09c7   706287:	48 89 f8             	mov    %rdi,%rax
09ca   70628a:	48 c1 e8 03          	shr    $0x3,%rax
09ce   70628e:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
09d2   706292:	74 05                	je     706299 <leaf_move_items+0x9d9>
09d4   706294:	e8 00 00 00 00       	call   706299 <leaf_move_items+0x9d9>	706295: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
09d9   706299:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
09de   70629e:	49 8d 5f 70          	lea    0x70(%r15),%rbx
09e2   7062a2:	48 89 d8             	mov    %rbx,%rax
09e5   7062a5:	48 c1 e8 03          	shr    $0x3,%rax
09e9   7062a9:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
09ed   7062ad:	74 08                	je     7062b7 <leaf_move_items+0x9f7>
09ef   7062af:	48 89 df             	mov    %rbx,%rdi
09f2   7062b2:	e8 00 00 00 00       	call   7062b7 <leaf_move_items+0x9f7>	7062b3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
09f7   7062b7:	48 8b 1b             	mov    (%rbx),%rbx
09fa   7062ba:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
09ff   7062bf:	48 89 f8             	mov    %rdi,%rax
0a02   7062c2:	48 c1 e8 03          	shr    $0x3,%rax
0a06   7062c6:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0a0a   7062ca:	74 05                	je     7062d1 <leaf_move_items+0xa11>
0a0c   7062cc:	e8 00 00 00 00       	call   7062d1 <leaf_move_items+0xa11>	7062cd: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0a11   7062d1:	48 89 5c 24 30       	mov    %rbx,0x30(%rsp)
0a16   7062d6:	c7 44 24 48 00 00 00 00 	movl   $0x0,0x48(%rsp)
0a1e   7062de:	4c 89 ff             	mov    %r15,%rdi
0a21   7062e1:	31 f6                	xor    %esi,%esi
0a23   7062e3:	e8 00 00 00 00       	call   7062e8 <leaf_move_items+0xa28>	7062e4: R_X86_64_PLT32	get_left_neighbor_position-0x4
0a28   7062e8:	89 c3                	mov    %eax,%ebx
0a2a   7062ea:	41 b6 01             	mov    $0x1,%r14b
0a2d   7062ed:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
0a32   7062f2:	48 89 f8             	mov    %rdi,%rax
0a35   7062f5:	48 c1 e8 03          	shr    $0x3,%rax
0a39   7062f9:	8a 04 28             	mov    (%rax,%rbp,1),%al
0a3c   7062fc:	84 c0                	test   %al,%al
0a3e   7062fe:	0f 85 63 02 00 00    	jne    706567 <leaf_move_items+0xca7>
0a44   706304:	89 5c 24 38          	mov    %ebx,0x38(%rsp)
0a48   706308:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
0a4d   70630d:	49 89 fd             	mov    %rdi,%r13
0a50   706310:	49 c1 ed 03          	shr    $0x3,%r13
0a54   706314:	41 80 7c 2d 00 00    	cmpb   $0x0,0x0(%r13,%rbp,1)
0a5a   70631a:	74 05                	je     706321 <leaf_move_items+0xa61>
0a5c   70631c:	e8 00 00 00 00       	call   706321 <leaf_move_items+0xa61>	70631d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a61   706321:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
0a66   706326:	4d 85 ff             	test   %r15,%r15
0a69   706329:	0f 84 61 04 00 00    	je     706790 <leaf_move_items+0xed0>
0a6f   70632f:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
0a74   706334:	48 89 f8             	mov    %rdi,%rax
0a77   706337:	48 c1 e8 03          	shr    $0x3,%rax
0a7b   70633b:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0a7f   70633f:	74 05                	je     706346 <leaf_move_items+0xa86>
0a81   706341:	e8 00 00 00 00       	call   706346 <leaf_move_items+0xa86>	706342: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a86   706346:	48 83 7c 24 28 00    	cmpq   $0x0,0x28(%rsp)
0a8c   70634c:	0f 84 3e 04 00 00    	je     706790 <leaf_move_items+0xed0>
0a92   706352:	49 8d 5f 28          	lea    0x28(%r15),%rbx
0a96   706356:	48 89 d8             	mov    %rbx,%rax
0a99   706359:	48 c1 e8 03          	shr    $0x3,%rax
0a9d   70635d:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0aa1   706361:	74 08                	je     70636b <leaf_move_items+0xaab>
0aa3   706363:	48 89 df             	mov    %rbx,%rdi
0aa6   706366:	e8 00 00 00 00       	call   70636b <leaf_move_items+0xaab>	706367: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0aab   70636b:	48 8b 1b             	mov    (%rbx),%rbx
0aae   70636e:	48 83 c3 02          	add    $0x2,%rbx
0ab2   706372:	48 89 d8             	mov    %rbx,%rax
0ab5   706375:	48 c1 e8 03          	shr    $0x3,%rax
0ab9   706379:	8a 04 28             	mov    (%rax,%rbp,1),%al
0abc   70637c:	84 c0                	test   %al,%al
0abe   70637e:	0f 85 fd 01 00 00    	jne    706581 <leaf_move_items+0xcc1>
0ac4   706384:	0f b7 1b             	movzwl (%rbx),%ebx
0ac7   706387:	89 dd                	mov    %ebx,%ebp
0ac9   706389:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
0ace   70638e:	29 c5                	sub    %eax,%ebp
0ad0   706390:	0f 8c 4b 04 00 00    	jl     7067e1 <leaf_move_items+0xf21>
0ad6   706396:	85 c0                	test   %eax,%eax
0ad8   706398:	0f 88 72 04 00 00    	js     706810 <leaf_move_items+0xf50>
0ade   70639e:	0f 84 8e 00 00 00    	je     706432 <leaf_move_items+0xb72>
0ae4   7063a4:	83 f8 01             	cmp    $0x1,%eax
0ae7   7063a7:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
0aec   7063ac:	44 89 e2             	mov    %r12d,%edx
0aef   7063af:	41 0f 44 cc          	cmove  %r12d,%ecx
0af3   7063b3:	45 84 f6             	test   %r14b,%r14b
0af6   7063b6:	49 89 c6             	mov    %rax,%r14
0af9   7063b9:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
0afe   7063be:	0f 84 86 00 00 00    	je     70644a <leaf_move_items+0xb8a>
0b04   7063c4:	31 ed                	xor    %ebp,%ebp
0b06   7063c6:	4c 89 fe             	mov    %r15,%rsi
0b09   7063c9:	31 d2                	xor    %edx,%edx
0b0b   7063cb:	e8 bc 67 00 00       	call   70cb8c <leaf_copy_boundary_item>
0b10   7063d0:	41 89 c5             	mov    %eax,%r13d
0b13   7063d3:	45 89 f0             	mov    %r14d,%r8d
0b16   7063d6:	44 89 f3             	mov    %r14d,%ebx
0b19   7063d9:	41 29 c0             	sub    %eax,%r8d
0b1c   7063dc:	4c 89 f0             	mov    %r14,%rax
0b1f   7063df:	45 89 e6             	mov    %r12d,%r14d
0b22   7063e2:	0f 84 5b 01 00 00    	je     706543 <leaf_move_items+0xc83>
0b28   7063e8:	41 83 fe ff          	cmp    $0xffffffff,%r14d
0b2c   7063ec:	0f 84 ad 00 00 00    	je     70649f <leaf_move_items+0xbdf>
0b32   7063f2:	41 ff c8             	dec    %r8d
0b35   7063f5:	4c 8d 74 24 20       	lea    0x20(%rsp),%r14
0b3a   7063fa:	31 ed                	xor    %ebp,%ebp
0b3c   7063fc:	4c 89 f7             	mov    %r14,%rdi
0b3f   7063ff:	4c 89 fe             	mov    %r15,%rsi
0b42   706402:	31 d2                	xor    %edx,%edx
0b44   706404:	44 89 e9             	mov    %r13d,%ecx
0b47   706407:	e8 7b 9f 00 00       	call   710387 <leaf_copy_items_entirely>
0b4c   70640c:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
0b51   706411:	8d 4b ff             	lea    -0x1(%rbx),%ecx
0b54   706414:	4c 89 f7             	mov    %r14,%rdi
0b57   706417:	45 89 e6             	mov    %r12d,%r14d
0b5a   70641a:	4c 89 fe             	mov    %r15,%rsi
0b5d   70641d:	31 d2                	xor    %edx,%edx
0b5f   70641f:	45 89 e0             	mov    %r12d,%r8d
0b62   706422:	e8 83 ac 00 00       	call   7110aa <leaf_item_bottle>
0b67   706427:	48 89 d8             	mov    %rbx,%rax
0b6a   70642a:	44 89 eb             	mov    %r13d,%ebx
0b6d   70642d:	e9 11 01 00 00       	jmp    706543 <leaf_move_items+0xc83>
0b72   706432:	31 db                	xor    %ebx,%ebx
0b74   706434:	bd 00 00 00 00       	mov    $0x0,%ebp
0b79   706439:	45 84 f6             	test   %r14b,%r14b
0b7c   70643c:	45 89 e6             	mov    %r12d,%r14d
0b7f   70643f:	0f 84 8f 00 00 00    	je     7064d4 <leaf_move_items+0xc14>
0b85   706445:	e9 f9 00 00 00       	jmp    706543 <leaf_move_items+0xc83>
0b8a   70644a:	4c 89 fe             	mov    %r15,%rsi
0b8d   70644d:	ba 01 00 00 00       	mov    $0x1,%edx
0b92   706452:	e8 35 67 00 00       	call   70cb8c <leaf_copy_boundary_item>
0b97   706457:	45 89 f0             	mov    %r14d,%r8d
0b9a   70645a:	44 89 f3             	mov    %r14d,%ebx
0b9d   70645d:	41 29 c0             	sub    %eax,%r8d
0ba0   706460:	45 89 e6             	mov    %r12d,%r14d
0ba3   706463:	74 6f                	je     7064d4 <leaf_move_items+0xc14>
0ba5   706465:	89 c3                	mov    %eax,%ebx
0ba7   706467:	41 83 fe ff          	cmp    $0xffffffff,%r14d
0bab   70646b:	74 53                	je     7064c0 <leaf_move_items+0xc00>
0bad   70646d:	8d 4d 01             	lea    0x1(%rbp),%ecx
0bb0   706470:	41 ff c8             	dec    %r8d
0bb3   706473:	4c 8d 64 24 20       	lea    0x20(%rsp),%r12
0bb8   706478:	4c 89 e7             	mov    %r12,%rdi
0bbb   70647b:	4c 89 fe             	mov    %r15,%rsi
0bbe   70647e:	ba 01 00 00 00       	mov    $0x1,%edx
0bc3   706483:	e8 ff 9e 00 00       	call   710387 <leaf_copy_items_entirely>
0bc8   706488:	4c 89 e7             	mov    %r12,%rdi
0bcb   70648b:	4c 89 fe             	mov    %r15,%rsi
0bce   70648e:	ba 01 00 00 00       	mov    $0x1,%edx
0bd3   706493:	89 e9                	mov    %ebp,%ecx
0bd5   706495:	45 89 f0             	mov    %r14d,%r8d
0bd8   706498:	e8 0d ac 00 00       	call   7110aa <leaf_item_bottle>
0bdd   70649d:	eb 35                	jmp    7064d4 <leaf_move_items+0xc14>
0bdf   70649f:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
0be4   7064a4:	31 ed                	xor    %ebp,%ebp
0be6   7064a6:	4c 89 fe             	mov    %r15,%rsi
0be9   7064a9:	31 d2                	xor    %edx,%edx
0beb   7064ab:	44 89 e9             	mov    %r13d,%ecx
0bee   7064ae:	e8 d4 9e 00 00       	call   710387 <leaf_copy_items_entirely>
0bf3   7064b3:	44 89 eb             	mov    %r13d,%ebx
0bf6   7064b6:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
0bfb   7064bb:	e9 83 00 00 00       	jmp    706543 <leaf_move_items+0xc83>
0c00   7064c0:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
0c05   7064c5:	4c 89 fe             	mov    %r15,%rsi
0c08   7064c8:	ba 01 00 00 00       	mov    $0x1,%edx
0c0d   7064cd:	89 e9                	mov    %ebp,%ecx
0c0f   7064cf:	e8 b3 9e 00 00       	call   710387 <leaf_copy_items_entirely>
0c14   7064d4:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0c1e   7064de:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
0c24   7064e4:	74 0a                	je     7064f0 <leaf_move_items+0xc30>
0c26   7064e6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
0c2b   7064eb:	e8 00 00 00 00       	call   7064f0 <leaf_move_items+0xc30>	7064ec: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0c30   7064f0:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
0c35   7064f5:	48 83 c5 28          	add    $0x28,%rbp
0c39   7064f9:	48 89 e8             	mov    %rbp,%rax
0c3c   7064fc:	48 c1 e8 03          	shr    $0x3,%rax
0c40   706500:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0c4a   70650a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0c4e   70650e:	74 08                	je     706518 <leaf_move_items+0xc58>
0c50   706510:	48 89 ef             	mov    %rbp,%rdi
0c53   706513:	e8 00 00 00 00       	call   706518 <leaf_move_items+0xc58>	706514: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0c58   706518:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
0c5c   70651c:	48 83 c5 02          	add    $0x2,%rbp
0c60   706520:	48 89 e8             	mov    %rbp,%rax
0c63   706523:	48 c1 e8 03          	shr    $0x3,%rax
0c67   706527:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0c71   706531:	8a 04 08             	mov    (%rax,%rcx,1),%al
0c74   706534:	84 c0                	test   %al,%al
0c76   706536:	75 65                	jne    70659d <leaf_move_items+0xcdd>
0c78   706538:	0f b7 6d 00          	movzwl 0x0(%rbp),%ebp
0c7c   70653c:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
0c81   706541:	29 c5                	sub    %eax,%ebp
0c83   706543:	48 89 e7             	mov    %rsp,%rdi
0c86   706546:	8b 74 24 48          	mov    0x48(%rsp),%esi
0c8a   70654a:	89 ea                	mov    %ebp,%edx
0c8c   70654c:	89 c1                	mov    %eax,%ecx
0c8e   70654e:	45 89 f0             	mov    %r14d,%r8d
0c91   706551:	e8 00 00 00 00       	call   706556 <leaf_move_items+0xc96>	706552: R_X86_64_PLT32	leaf_delete_items-0x4
0c96   706556:	89 d8                	mov    %ebx,%eax
0c98   706558:	48 83 c4 60          	add    $0x60,%rsp
0c9c   70655c:	5b                   	pop    %rbx
0c9d   70655d:	41 5c                	pop    %r12
0c9f   70655f:	41 5d                	pop    %r13
0ca1   706561:	41 5e                	pop    %r14
0ca3   706563:	41 5f                	pop    %r15
0ca5   706565:	5d                   	pop    %rbp
0ca6   706566:	c3                   	ret
0ca7   706567:	89 f9                	mov    %edi,%ecx
0ca9   706569:	80 e1 07             	and    $0x7,%cl
0cac   70656c:	80 c1 03             	add    $0x3,%cl
0caf   70656f:	38 c1                	cmp    %al,%cl
0cb1   706571:	0f 8c 8d fd ff ff    	jl     706304 <leaf_move_items+0xa44>
0cb7   706577:	e8 00 00 00 00       	call   70657c <leaf_move_items+0xcbc>	706578: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0cbc   70657c:	e9 83 fd ff ff       	jmp    706304 <leaf_move_items+0xa44>
0cc1   706581:	89 d9                	mov    %ebx,%ecx
0cc3   706583:	80 e1 07             	and    $0x7,%cl
0cc6   706586:	fe c1                	inc    %cl
0cc8   706588:	38 c1                	cmp    %al,%cl
0cca   70658a:	0f 8c f4 fd ff ff    	jl     706384 <leaf_move_items+0xac4>
0cd0   706590:	48 89 df             	mov    %rbx,%rdi
0cd3   706593:	e8 00 00 00 00       	call   706598 <leaf_move_items+0xcd8>	706594: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
0cd8   706598:	e9 e7 fd ff ff       	jmp    706384 <leaf_move_items+0xac4>
0cdd   70659d:	89 e9                	mov    %ebp,%ecx
0cdf   70659f:	80 e1 07             	and    $0x7,%cl
0ce2   7065a2:	fe c1                	inc    %cl
0ce4   7065a4:	38 c1                	cmp    %al,%cl
0ce6   7065a6:	7c 90                	jl     706538 <leaf_move_items+0xc78>
0ce8   7065a8:	48 89 ef             	mov    %rbp,%rdi
0ceb   7065ab:	e8 00 00 00 00       	call   7065b0 <leaf_move_items+0xcf0>	7065ac: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
0cf0   7065b0:	eb 86                	jmp    706538 <leaf_move_items+0xc78>
0cf2   7065b2:	89 e9                	mov    %ebp,%ecx
0cf4   7065b4:	80 e1 07             	and    $0x7,%cl
0cf7   7065b7:	80 c1 03             	add    $0x3,%cl
0cfa   7065ba:	38 c1                	cmp    %al,%cl
0cfc   7065bc:	0f 8c d5 f3 ff ff    	jl     705997 <leaf_move_items+0xd7>
0d02   7065c2:	48 89 ef             	mov    %rbp,%rdi
0d05   7065c5:	e8 00 00 00 00       	call   7065ca <leaf_move_items+0xd0a>	7065c6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d0a   7065ca:	e9 c8 f3 ff ff       	jmp    705997 <leaf_move_items+0xd7>
0d0f   7065cf:	89 e9                	mov    %ebp,%ecx
0d11   7065d1:	80 e1 07             	and    $0x7,%cl
0d14   7065d4:	80 c1 03             	add    $0x3,%cl
0d17   7065d7:	38 c1                	cmp    %al,%cl
0d19   7065d9:	0f 8c 49 f4 ff ff    	jl     705a28 <leaf_move_items+0x168>
0d1f   7065df:	48 89 ef             	mov    %rbp,%rdi
0d22   7065e2:	e8 00 00 00 00       	call   7065e7 <leaf_move_items+0xd27>	7065e3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d27   7065e7:	e9 3c f4 ff ff       	jmp    705a28 <leaf_move_items+0x168>
0d2c   7065ec:	89 d9                	mov    %ebx,%ecx
0d2e   7065ee:	80 e1 07             	and    $0x7,%cl
0d31   7065f1:	80 c1 03             	add    $0x3,%cl
0d34   7065f4:	38 c1                	cmp    %al,%cl
0d36   7065f6:	0f 8c bb f4 ff ff    	jl     705ab7 <leaf_move_items+0x1f7>
0d3c   7065fc:	48 89 df             	mov    %rbx,%rdi
0d3f   7065ff:	e8 00 00 00 00       	call   706604 <leaf_move_items+0xd44>	706600: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d44   706604:	e9 ae f4 ff ff       	jmp    705ab7 <leaf_move_items+0x1f7>
0d49   706609:	89 d9                	mov    %ebx,%ecx
0d4b   70660b:	80 e1 07             	and    $0x7,%cl
0d4e   70660e:	80 c1 03             	add    $0x3,%cl
0d51   706611:	38 c1                	cmp    %al,%cl
0d53   706613:	0f 8c d9 f4 ff ff    	jl     705af2 <leaf_move_items+0x232>
0d59   706619:	48 89 df             	mov    %rbx,%rdi
0d5c   70661c:	e8 00 00 00 00       	call   706621 <leaf_move_items+0xd61>	70661d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d61   706621:	e9 cc f4 ff ff       	jmp    705af2 <leaf_move_items+0x232>
0d66   706626:	89 f9                	mov    %edi,%ecx
0d68   706628:	80 e1 07             	and    $0x7,%cl
0d6b   70662b:	80 c1 03             	add    $0x3,%cl
0d6e   70662e:	38 c1                	cmp    %al,%cl
0d70   706630:	0f 8c d5 f4 ff ff    	jl     705b0b <leaf_move_items+0x24b>
0d76   706636:	e8 00 00 00 00       	call   70663b <leaf_move_items+0xd7b>	706637: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0d7b   70663b:	e9 cb f4 ff ff       	jmp    705b0b <leaf_move_items+0x24b>
0d80   706640:	89 e9                	mov    %ebp,%ecx
0d82   706642:	80 e1 07             	and    $0x7,%cl
0d85   706645:	80 c1 03             	add    $0x3,%cl
0d88   706648:	38 c1                	cmp    %al,%cl
0d8a   70664a:	0f 8c 93 f5 ff ff    	jl     705be3 <leaf_move_items+0x323>
0d90   706650:	48 89 ef             	mov    %rbp,%rdi
0d93   706653:	e8 00 00 00 00       	call   706658 <leaf_move_items+0xd98>	706654: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d98   706658:	e9 86 f5 ff ff       	jmp    705be3 <leaf_move_items+0x323>
0d9d   70665d:	89 e9                	mov    %ebp,%ecx
0d9f   70665f:	80 e1 07             	and    $0x7,%cl
0da2   706662:	80 c1 03             	add    $0x3,%cl
0da5   706665:	38 c1                	cmp    %al,%cl
0da7   706667:	0f 8c 07 f6 ff ff    	jl     705c74 <leaf_move_items+0x3b4>
0dad   70666d:	48 89 ef             	mov    %rbp,%rdi
0db0   706670:	e8 00 00 00 00       	call   706675 <leaf_move_items+0xdb5>	706671: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0db5   706675:	e9 fa f5 ff ff       	jmp    705c74 <leaf_move_items+0x3b4>
0dba   70667a:	89 d9                	mov    %ebx,%ecx
0dbc   70667c:	80 e1 07             	and    $0x7,%cl
0dbf   70667f:	80 c1 03             	add    $0x3,%cl
0dc2   706682:	38 c1                	cmp    %al,%cl
0dc4   706684:	0f 8c 79 f6 ff ff    	jl     705d03 <leaf_move_items+0x443>
0dca   70668a:	48 89 df             	mov    %rbx,%rdi
0dcd   70668d:	e8 00 00 00 00       	call   706692 <leaf_move_items+0xdd2>	70668e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0dd2   706692:	e9 6c f6 ff ff       	jmp    705d03 <leaf_move_items+0x443>
0dd7   706697:	89 d9                	mov    %ebx,%ecx
0dd9   706699:	80 e1 07             	and    $0x7,%cl
0ddc   70669c:	80 c1 03             	add    $0x3,%cl
0ddf   70669f:	38 c1                	cmp    %al,%cl
0de1   7066a1:	0f 8c 97 f6 ff ff    	jl     705d3e <leaf_move_items+0x47e>
0de7   7066a7:	48 89 df             	mov    %rbx,%rdi
0dea   7066aa:	e8 00 00 00 00       	call   7066af <leaf_move_items+0xdef>	7066ab: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0def   7066af:	e9 8a f6 ff ff       	jmp    705d3e <leaf_move_items+0x47e>
0df4   7066b4:	89 f9                	mov    %edi,%ecx
0df6   7066b6:	80 e1 07             	and    $0x7,%cl
0df9   7066b9:	80 c1 03             	add    $0x3,%cl
0dfc   7066bc:	38 c1                	cmp    %al,%cl
0dfe   7066be:	0f 8c 93 f6 ff ff    	jl     705d57 <leaf_move_items+0x497>
0e04   7066c4:	e8 00 00 00 00       	call   7066c9 <leaf_move_items+0xe09>	7066c5: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0e09   7066c9:	e9 89 f6 ff ff       	jmp    705d57 <leaf_move_items+0x497>
0e0e   7066ce:	89 f9                	mov    %edi,%ecx
0e10   7066d0:	80 e1 07             	and    $0x7,%cl
0e13   7066d3:	80 c1 03             	add    $0x3,%cl
0e16   7066d6:	38 c1                	cmp    %al,%cl
0e18   7066d8:	0f 8c bb f7 ff ff    	jl     705e99 <leaf_move_items+0x5d9>
0e1e   7066de:	e8 00 00 00 00       	call   7066e3 <leaf_move_items+0xe23>	7066df: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0e23   7066e3:	e9 b1 f7 ff ff       	jmp    705e99 <leaf_move_items+0x5d9>
0e28   7066e8:	89 f9                	mov    %edi,%ecx
0e2a   7066ea:	80 e1 07             	and    $0x7,%cl
0e2d   7066ed:	80 c1 03             	add    $0x3,%cl
0e30   7066f0:	38 c1                	cmp    %al,%cl
0e32   7066f2:	0f 8c dd f8 ff ff    	jl     705fd5 <leaf_move_items+0x715>
0e38   7066f8:	e8 00 00 00 00       	call   7066fd <leaf_move_items+0xe3d>	7066f9: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0e3d   7066fd:	e9 d3 f8 ff ff       	jmp    705fd5 <leaf_move_items+0x715>
0e42   706702:	89 e9                	mov    %ebp,%ecx
0e44   706704:	80 e1 07             	and    $0x7,%cl
0e47   706707:	80 c1 03             	add    $0x3,%cl
0e4a   70670a:	38 c1                	cmp    %al,%cl
0e4c   70670c:	0f 8c c1 f9 ff ff    	jl     7060d3 <leaf_move_items+0x813>
0e52   706712:	48 89 ef             	mov    %rbp,%rdi
0e55   706715:	e8 00 00 00 00       	call   70671a <leaf_move_items+0xe5a>	706716: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0e5a   70671a:	e9 b4 f9 ff ff       	jmp    7060d3 <leaf_move_items+0x813>
0e5f   70671f:	89 e9                	mov    %ebp,%ecx
0e61   706721:	80 e1 07             	and    $0x7,%cl
0e64   706724:	80 c1 03             	add    $0x3,%cl
0e67   706727:	38 c1                	cmp    %al,%cl
0e69   706729:	0f 8c 35 fa ff ff    	jl     706164 <leaf_move_items+0x8a4>
0e6f   70672f:	48 89 ef             	mov    %rbp,%rdi
0e72   706732:	e8 00 00 00 00       	call   706737 <leaf_move_items+0xe77>	706733: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0e77   706737:	e9 28 fa ff ff       	jmp    706164 <leaf_move_items+0x8a4>
0e7c   70673c:	89 d9                	mov    %ebx,%ecx
0e7e   70673e:	80 e1 07             	and    $0x7,%cl
0e81   706741:	80 c1 03             	add    $0x3,%cl
0e84   706744:	38 c1                	cmp    %al,%cl
0e86   706746:	0f 8c a7 fa ff ff    	jl     7061f3 <leaf_move_items+0x933>
0e8c   70674c:	48 89 df             	mov    %rbx,%rdi
0e8f   70674f:	e8 00 00 00 00       	call   706754 <leaf_move_items+0xe94>	706750: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0e94   706754:	e9 9a fa ff ff       	jmp    7061f3 <leaf_move_items+0x933>
0e99   706759:	89 d9                	mov    %ebx,%ecx
0e9b   70675b:	80 e1 07             	and    $0x7,%cl
0e9e   70675e:	80 c1 03             	add    $0x3,%cl
0ea1   706761:	38 c1                	cmp    %al,%cl
0ea3   706763:	0f 8c c5 fa ff ff    	jl     70622e <leaf_move_items+0x96e>
0ea9   706769:	48 89 df             	mov    %rbx,%rdi
0eac   70676c:	e8 00 00 00 00       	call   706771 <leaf_move_items+0xeb1>	70676d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0eb1   706771:	e9 b8 fa ff ff       	jmp    70622e <leaf_move_items+0x96e>
0eb6   706776:	89 f9                	mov    %edi,%ecx
0eb8   706778:	80 e1 07             	and    $0x7,%cl
0ebb   70677b:	80 c1 03             	add    $0x3,%cl
0ebe   70677e:	38 c1                	cmp    %al,%cl
0ec0   706780:	0f 8c c1 fa ff ff    	jl     706247 <leaf_move_items+0x987>
0ec6   706786:	e8 00 00 00 00       	call   70678b <leaf_move_items+0xecb>	706787: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0ecb   70678b:	e9 b7 fa ff ff       	jmp    706247 <leaf_move_items+0x987>
0ed0   706790:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
0ed5   706795:	48 89 f8             	mov    %rdi,%rax
0ed8   706798:	48 c1 e8 03          	shr    $0x3,%rax
0edc   70679c:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0ee0   7067a0:	74 05                	je     7067a7 <leaf_move_items+0xee7>
0ee2   7067a2:	e8 00 00 00 00       	call   7067a7 <leaf_move_items+0xee7>	7067a3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0ee7   7067a7:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
0eec   7067ac:	e8 00 00 00 00       	call   7067b1 <leaf_move_items+0xef1>	7067ad: R_X86_64_PLT32	__asan_handle_no_return-0x4
0ef1   7067b1:	31 ff                	xor    %edi,%edi
0ef3   7067b3:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	7067b6: R_X86_64_32S	.rodata+0xfaa00
0efa   7067ba:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	7067bd: R_X86_64_32S	.rodata.str1.1+0x67b56
0f01   7067c1:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	7067c4: R_X86_64_32S	.rodata+0xfb7e0
0f08   7067c8:	41 b8 c4 02 00 00    	mov    $0x2c4,%r8d
0f0e   7067ce:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	7067d1: R_X86_64_32S	.rodata.str1.1+0x67b56
0f15   7067d5:	53                   	push   %rbx
0f16   7067d6:	41 57                	push   %r15
0f18   7067d8:	ff 74 24 68          	push   0x68(%rsp)
0f1c   7067dc:	e8 00 00 00 00       	call   7067e1 <leaf_move_items+0xf21>	7067dd: R_X86_64_PLT32	__reiserfs_panic-0x4
0f21   7067e1:	48 89 c5             	mov    %rax,%rbp
0f24   7067e4:	e8 00 00 00 00       	call   7067e9 <leaf_move_items+0xf29>	7067e5: R_X86_64_PLT32	__asan_handle_no_return-0x4
0f29   7067e9:	31 ff                	xor    %edi,%edi
0f2b   7067eb:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	7067ee: R_X86_64_32S	.rodata+0xfaa00
0f32   7067f2:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	7067f5: R_X86_64_32S	.rodata.str1.1+0x6fa7a
0f39   7067f9:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	7067fc: R_X86_64_32S	.rodata+0xfb8a0
0f40   706800:	41 b8 15 02 00 00    	mov    $0x215,%r8d
0f46   706806:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	706809: R_X86_64_32S	.rodata.str1.1+0x6fa7a
0f4d   70680d:	55                   	push   %rbp
0f4e   70680e:	eb 2c                	jmp    70683c <leaf_move_items+0xf7c>
0f50   706810:	48 89 c3             	mov    %rax,%rbx
0f53   706813:	e8 00 00 00 00       	call   706818 <leaf_move_items+0xf58>	706814: R_X86_64_PLT32	__asan_handle_no_return-0x4
0f58   706818:	31 ff                	xor    %edi,%edi
0f5a   70681a:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	70681d: R_X86_64_32S	.rodata+0xfaa00
0f61   706821:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	706824: R_X86_64_32S	.rodata.str1.1+0x6fa7a
0f68   706828:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	70682b: R_X86_64_32S	.rodata+0xfb980
0f6f   70682f:	41 b8 16 02 00 00    	mov    $0x216,%r8d
0f75   706835:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	706838: R_X86_64_32S	.rodata.str1.1+0x6fa7a
0f7c   70683c:	53                   	push   %rbx
0f7d   70683d:	e8 00 00 00 00       	call   706842 <leaf_move_items+0xf82>	70683e: R_X86_64_PLT32	__reiserfs_panic-0x4
0f82   706842:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	706845: R_X86_64_32S	.data+0x5b3020
0f89   706849:	48 89 de             	mov    %rbx,%rsi
0f8c   70684c:	e8 00 00 00 00       	call   706851 <leaf_move_items+0xf91>	70684d: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0f91   706851:	e9 53 f1 ff ff       	jmp    7059a9 <leaf_move_items+0xe9>
0f96   706856:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	706859: R_X86_64_32S	.data+0x5b3040
0f9d   70685d:	48 89 de             	mov    %rbx,%rsi
0fa0   706860:	e8 00 00 00 00       	call   706865 <leaf_move_items+0xfa5>	706861: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0fa5   706865:	e9 d3 f1 ff ff       	jmp    705a3d <leaf_move_items+0x17d>
0faa   70686a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	70686d: R_X86_64_32S	.data+0x5b3060
0fb1   706871:	48 89 ee             	mov    %rbp,%rsi
0fb4   706874:	e8 00 00 00 00       	call   706879 <leaf_move_items+0xfb9>	706875: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0fb9   706879:	e9 4d f2 ff ff       	jmp    705acb <leaf_move_items+0x20b>
0fbe   70687e:	48 c1 eb 03          	shr    $0x3,%rbx
0fc2   706882:	80 3c 2b 00          	cmpb   $0x0,(%rbx,%rbp,1)
0fc6   706886:	74 08                	je     706890 <leaf_move_items+0xfd0>
0fc8   706888:	48 89 e7             	mov    %rsp,%rdi
0fcb   70688b:	e8 00 00 00 00       	call   706890 <leaf_move_items+0xfd0>	70688c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0fd0   706890:	48 8b 1c 24          	mov    (%rsp),%rbx
0fd4   706894:	48 85 db             	test   %rbx,%rbx
0fd7   706897:	75 7f                	jne    706918 <leaf_move_items+0x1058>
0fd9   706899:	31 db                	xor    %ebx,%ebx
0fdb   70689b:	e9 9e 00 00 00       	jmp    70693e <leaf_move_items+0x107e>
0fe0   7068a0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	7068a3: R_X86_64_32S	.data+0x5b2fc0
0fe7   7068a7:	48 89 de             	mov    %rbx,%rsi
0fea   7068aa:	e8 00 00 00 00       	call   7068af <leaf_move_items+0xfef>	7068ab: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0fef   7068af:	e9 41 f3 ff ff       	jmp    705bf5 <leaf_move_items+0x335>
0ff4   7068b4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	7068b7: R_X86_64_32S	.data+0x5b2fe0
0ffb   7068bb:	48 89 de             	mov    %rbx,%rsi
0ffe   7068be:	e8 00 00 00 00       	call   7068c3 <leaf_move_items+0x1003>	7068bf: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
1003   7068c3:	e9 c1 f3 ff ff       	jmp    705c89 <leaf_move_items+0x3c9>
1008   7068c8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	7068cb: R_X86_64_32S	.data+0x5b3000
100f   7068cf:	48 89 ee             	mov    %rbp,%rsi
1012   7068d2:	e8 00 00 00 00       	call   7068d7 <leaf_move_items+0x1017>	7068d3: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
1017   7068d7:	e9 3b f4 ff ff       	jmp    705d17 <leaf_move_items+0x457>
101c   7068dc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	7068df: R_X86_64_32S	.data+0x5b2f60
1023   7068e3:	48 89 de             	mov    %rbx,%rsi
1026   7068e6:	e8 00 00 00 00       	call   7068eb <leaf_move_items+0x102b>	7068e7: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
102b   7068eb:	e9 f5 f7 ff ff       	jmp    7060e5 <leaf_move_items+0x825>
1030   7068f0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	7068f3: R_X86_64_32S	.data+0x5b2f80
1037   7068f7:	48 89 de             	mov    %rbx,%rsi
103a   7068fa:	e8 00 00 00 00       	call   7068ff <leaf_move_items+0x103f>	7068fb: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
103f   7068ff:	e9 75 f8 ff ff       	jmp    706179 <leaf_move_items+0x8b9>
1044   706904:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	706907: R_X86_64_32S	.data+0x5b2fa0
104b   70690b:	48 89 ee             	mov    %rbp,%rsi
104e   70690e:	e8 00 00 00 00       	call   706913 <leaf_move_items+0x1053>	70690f: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
1053   706913:	e9 ef f8 ff ff       	jmp    706207 <leaf_move_items+0x947>
1058   706918:	48 83 c3 08          	add    $0x8,%rbx
105c   70691c:	48 89 d8             	mov    %rbx,%rax
105f   70691f:	48 c1 e8 03          	shr    $0x3,%rax
1063   706923:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
106d   70692d:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1071   706931:	74 08                	je     70693b <leaf_move_items+0x107b>
1073   706933:	48 89 df             	mov    %rbx,%rdi
1076   706936:	e8 00 00 00 00       	call   70693b <leaf_move_items+0x107b>	706937: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
107b   70693b:	48 8b 1b             	mov    (%rbx),%rbx
107e   70693e:	e8 00 00 00 00       	call   706943 <leaf_move_items+0x1083>	70693f: R_X86_64_PLT32	__asan_handle_no_return-0x4
1083   706943:	48 89 df             	mov    %rbx,%rdi
1086   706946:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	706949: R_X86_64_32S	.rodata+0xfb720
108d   70694d:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	706950: R_X86_64_32S	.rodata.str1.1+0x67b56
1094   706954:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	706957: R_X86_64_32S	.rodata+0xfb7a0
109b   70695b:	45 89 f0             	mov    %r14d,%r8d
109e   70695e:	e8 00 00 00 00       	call   706963 <leaf_delete_items>	70695f: R_X86_64_PLT32	__reiserfs_panic-0x4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
