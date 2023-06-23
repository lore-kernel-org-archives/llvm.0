Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE9B363;
	Fri, 23 Jun 2023 01:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687485021; x=1719021021;
  h=date:from:cc:subject:message-id:mime-version;
  bh=JuPi9K+MszJQ/0iu04DwM7hosucjoLLiTBvF5xXQ8KM=;
  b=TaDE1E2slUu+k8jlzrjQpuqj6LqObyqRq4P6nCfgO3kkd/PVPn3+REE0
   GjnhAe9+oHKT/6urL2EzKqQ0M2ad43XtNHxyijmB1Fw9YM9a0S8UOuomC
   0CCo6lH7Q0Xatn29UeZqzA4vlfGUb4pxmIGJ0O254dQMu93Gl1GPDkR0m
   fd/CwJwL3e9hlE9WLLUzcdzlVNfZfPEFvG10MYurdsJOrvF8CKt+nCXoh
   hRhC6qZIz43g727soJIoWIo3y028pwuGfmR8dp16W8DEEFxv4e48M+1v0
   1ruijZWzc0cOd/cqoYCwE8BXg2SwnJuCjwVR+hjOGLXmbo0QSapuF1G6R
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="360688235"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="360688235"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 18:49:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="839271847"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="839271847"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Jun 2023 18:49:52 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCVvs-0007tD-0H;
	Fri, 23 Jun 2023 01:49:52 +0000
Date: Fri, 23 Jun 2023 09:48:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH] objtool: Make 'sec-address' always on
Message-ID: <202306230927.KZueTqI4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <e7e1de1d01194df3ff4053cb0815fc2ddba33213.1687360711.git.christophe.leroy@csgroup.eu>
References: <e7e1de1d01194df3ff4053cb0815fc2ddba33213.1687360711.git.christophe.leroy@csgroup.eu>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Josh Poimboeuf <jpoimboe@kernel.org>
TO: Peter Zijlstra <peterz@infradead.org>
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org

Hi Christophe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.4-rc7 next-20230622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/objtool-Make-sec-address-always-on/20230621-232305
base:   linus/master
patch link:    https://lore.kernel.org/r/e7e1de1d01194df3ff4053cb0815fc2ddba33213.1687360711.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH] objtool: Make 'sec-address' always on
config: x86_64-randconfig-a005-20230622 (https://download.01.org/0day-ci/archive/20230623/202306230927.KZueTqI4-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230927.KZueTqI4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230927.KZueTqI4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/fault.o: warning: objtool: do_user_addr_fault+0x1c2 (.text+0xac2): unreachable instruction


objdump-func vmlinux.o do_user_addr_fault:
0000 000000000008ead0 <do_user_addr_fault>:
0000    8ead0:	55                   	push   %rbp
0001    8ead1:	48 89 e5             	mov    %rsp,%rbp
0004    8ead4:	41 57                	push   %r15
0006    8ead6:	41 56                	push   %r14
0008    8ead8:	41 55                	push   %r13
000a    8eada:	41 54                	push   %r12
000c    8eadc:	53                   	push   %rbx
000d    8eadd:	48 83 ec 38          	sub    $0x38,%rsp
0011    8eae1:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
0015    8eae5:	49 89 f4             	mov    %rsi,%r12
0018    8eae8:	49 89 ff             	mov    %rdi,%r15
001b    8eaeb:	e8 00 00 00 00       	call   8eaf0 <do_user_addr_fault+0x20>	8eaec: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0020    8eaf0:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # 8eaf7 <do_user_addr_fault+0x27>	8eaf3: R_X86_64_PC32	pcpu_hot-0x4
0027    8eaf7:	4d 8b b5 70 02 00 00 	mov    0x270(%r13),%r14
002e    8eafe:	44 89 e3             	mov    %r12d,%ebx
0031    8eb01:	83 e3 14             	and    $0x14,%ebx
0034    8eb04:	31 f6                	xor    %esi,%esi
0036    8eb06:	48 83 fb 10          	cmp    $0x10,%rbx
003a    8eb0a:	40 0f 94 c6          	sete   %sil
003e    8eb0e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8eb11: R_X86_64_32S	_ftrace_annotated_branch+0x15d50
0045    8eb15:	31 d2                	xor    %edx,%edx
0047    8eb17:	31 c9                	xor    %ecx,%ecx
0049    8eb19:	e8 00 00 00 00       	call   8eb1e <do_user_addr_fault+0x4e>	8eb1a: R_X86_64_PLT32	ftrace_likely_update-0x4
004e    8eb1e:	48 83 fb 10          	cmp    $0x10,%rbx
0052    8eb22:	75 19                	jne    8eb3d <do_user_addr_fault+0x6d>
0054    8eb24:	e8 00 00 00 00       	call   8eb29 <do_user_addr_fault+0x59>	8eb25: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0059    8eb29:	4c 89 ff             	mov    %r15,%rdi
005c    8eb2c:	4c 89 e6             	mov    %r12,%rsi
005f    8eb2f:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
0063    8eb33:	e8 38 0d 00 00       	call   8f870 <page_fault_oops>
0068    8eb38:	e9 72 07 00 00       	jmp    8f2af <do_user_addr_fault+0x7df>
006d    8eb3d:	41 f6 87 88 00 00 00 03 	testb  $0x3,0x88(%r15)
0075    8eb45:	74 76                	je     8ebbd <do_user_addr_fault+0xed>
0077    8eb47:	e8 00 00 00 00       	call   8eb4c <do_user_addr_fault+0x7c>	8eb48: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
007c    8eb4c:	31 c0                	xor    %eax,%eax
007e    8eb4e:	0f b6 d8             	movzbl %al,%ebx
0081    8eb51:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8eb54: R_X86_64_32S	_ftrace_annotated_branch+0x15d80
0088    8eb58:	89 de                	mov    %ebx,%esi
008a    8eb5a:	31 d2                	xor    %edx,%edx
008c    8eb5c:	31 c9                	xor    %ecx,%ecx
008e    8eb5e:	e8 00 00 00 00       	call   8eb63 <do_user_addr_fault+0x93>	8eb5f: R_X86_64_PLT32	ftrace_likely_update-0x4
0093    8eb63:	84 db                	test   %bl,%bl
0095    8eb65:	74 1e                	je     8eb85 <do_user_addr_fault+0xb5>
0097    8eb67:	e8 00 00 00 00       	call   8eb6c <do_user_addr_fault+0x9c>	8eb68: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
009c    8eb6c:	0f 0b                	ud2
009e    8eb6e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8eb71: R_X86_64_32S	_ftrace_annotated_branch+0x15db0
00a5    8eb75:	89 de                	mov    %ebx,%esi
00a7    8eb77:	31 d2                	xor    %edx,%edx
00a9    8eb79:	31 c9                	xor    %ecx,%ecx
00ab    8eb7b:	e8 00 00 00 00       	call   8eb80 <do_user_addr_fault+0xb0>	8eb7c: R_X86_64_PLT32	ftrace_likely_update-0x4
00b0    8eb80:	e9 2a 07 00 00       	jmp    8f2af <do_user_addr_fault+0x7df>
00b5    8eb85:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8eb88: R_X86_64_32S	_ftrace_annotated_branch+0x15db0
00bc    8eb8c:	89 de                	mov    %ebx,%esi
00be    8eb8e:	31 d2                	xor    %edx,%edx
00c0    8eb90:	31 c9                	xor    %ecx,%ecx
00c2    8eb92:	e8 00 00 00 00       	call   8eb97 <do_user_addr_fault+0xc7>	8eb93: R_X86_64_PLT32	ftrace_likely_update-0x4
00c7    8eb97:	44 89 e3             	mov    %r12d,%ebx
00ca    8eb9a:	c1 eb 03             	shr    $0x3,%ebx
00cd    8eb9d:	83 e3 01             	and    $0x1,%ebx
00d0    8eba0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8eba3: R_X86_64_32S	_ftrace_annotated_branch+0x15de0
00d7    8eba7:	89 de                	mov    %ebx,%esi
00d9    8eba9:	31 d2                	xor    %edx,%edx
00db    8ebab:	31 c9                	xor    %ecx,%ecx
00dd    8ebad:	e8 00 00 00 00       	call   8ebb2 <do_user_addr_fault+0xe2>	8ebae: R_X86_64_PLT32	ftrace_likely_update-0x4
00e2    8ebb2:	85 db                	test   %ebx,%ebx
00e4    8ebb4:	75 1b                	jne    8ebd1 <do_user_addr_fault+0x101>
00e6    8ebb6:	e8 00 00 00 00       	call   8ebbb <do_user_addr_fault+0xeb>	8ebb7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00eb    8ebbb:	eb 28                	jmp    8ebe5 <do_user_addr_fault+0x115>
00ed    8ebbd:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 8ebc3 <do_user_addr_fault+0xf3>	8ebbf: R_X86_64_PC32	pcpu_hot+0x4
00f3    8ebc3:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
00f8    8ebc8:	74 65                	je     8ec2f <do_user_addr_fault+0x15f>
00fa    8ebca:	e8 00 00 00 00       	call   8ebcf <do_user_addr_fault+0xff>	8ebcb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00ff    8ebcf:	eb 7e                	jmp    8ec4f <do_user_addr_fault+0x17f>
0101    8ebd1:	e8 00 00 00 00       	call   8ebd6 <do_user_addr_fault+0x106>	8ebd2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0106    8ebd6:	4c 89 ff             	mov    %r15,%rdi
0109    8ebd9:	4c 89 e6             	mov    %r12,%rsi
010c    8ebdc:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
0110    8ebe0:	e8 db 14 00 00       	call   900c0 <pgtable_bad>
0115    8ebe5:	e9 00 00 00 00       	jmp    8ebea <do_user_addr_fault+0x11a>	8ebe6: R_X86_64_PLT32	.altinstr_aux+0x11d8
011a    8ebea:	e8 00 00 00 00       	call   8ebef <do_user_addr_fault+0x11f>	8ebeb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
011f    8ebef:	41 f6 c4 04          	test   $0x4,%r12b
0123    8ebf3:	0f 85 a8 00 00 00    	jne    8eca1 <do_user_addr_fault+0x1d1>
0129    8ebf9:	49 8b 9f 90 00 00 00 	mov    0x90(%r15),%rbx
0130    8ec00:	81 e3 00 00 04 00    	and    $0x40000,%ebx
0136    8ec06:	48 89 de             	mov    %rbx,%rsi
0139    8ec09:	48 c1 ee 12          	shr    $0x12,%rsi
013d    8ec0d:	83 f6 01             	xor    $0x1,%esi
0140    8ec10:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8ec13: R_X86_64_32S	_ftrace_annotated_branch+0x15e10
0147    8ec17:	31 d2                	xor    %edx,%edx
0149    8ec19:	31 c9                	xor    %ecx,%ecx
014b    8ec1b:	e8 00 00 00 00       	call   8ec20 <do_user_addr_fault+0x150>	8ec1c: R_X86_64_PLT32	ftrace_likely_update-0x4
0150    8ec20:	48 85 db             	test   %rbx,%rbx
0153    8ec23:	75 52                	jne    8ec77 <do_user_addr_fault+0x1a7>
0155    8ec25:	e8 00 00 00 00       	call   8ec2a <do_user_addr_fault+0x15a>	8ec26: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
015a    8ec2a:	e9 fa fe ff ff       	jmp    8eb29 <do_user_addr_fault+0x59>
015f    8ec2f:	48 b8 aa aa aa aa aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaaa,%rax
0169    8ec39:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
016d    8ec3d:	9c                   	pushf
016e    8ec3e:	8f 45 a8             	pop    -0x58(%rbp)
0171    8ec41:	f7 45 a8 00 02 00 00 	testl  $0x200,-0x58(%rbp)
0178    8ec48:	75 3e                	jne    8ec88 <do_user_addr_fault+0x1b8>
017a    8ec4a:	e8 00 00 00 00       	call   8ec4f <do_user_addr_fault+0x17f>	8ec4b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
017f    8ec4f:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 8ec56 <do_user_addr_fault+0x186>	8ec52: R_X86_64_PC32	current_kprobe-0x4
0186    8ec56:	48 85 c0             	test   %rax,%rax
0189    8ec59:	74 23                	je     8ec7e <do_user_addr_fault+0x1ae>
018b    8ec5b:	e8 00 00 00 00       	call   8ec60 <do_user_addr_fault+0x190>	8ec5c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0190    8ec60:	4c 89 ff             	mov    %r15,%rdi
0193    8ec63:	be 0e 00 00 00       	mov    $0xe,%esi
0198    8ec68:	e8 00 00 00 00       	call   8ec6d <do_user_addr_fault+0x19d>	8ec69: R_X86_64_PLT32	kprobe_fault_handler-0x4
019d    8ec6d:	85 c0                	test   %eax,%eax
019f    8ec6f:	0f 95 c0             	setne  %al
01a2    8ec72:	e9 d7 fe ff ff       	jmp    8eb4e <do_user_addr_fault+0x7e>
01a7    8ec77:	e8 00 00 00 00       	call   8ec7c <do_user_addr_fault+0x1ac>	8ec78: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01ac    8ec7c:	eb 3a                	jmp    8ecb8 <do_user_addr_fault+0x1e8>
01ae    8ec7e:	e8 00 00 00 00       	call   8ec83 <do_user_addr_fault+0x1b3>	8ec7f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01b3    8ec83:	e9 c4 fe ff ff       	jmp    8eb4c <do_user_addr_fault+0x7c>
01b8    8ec88:	e8 00 00 00 00       	call   8ec8d <do_user_addr_fault+0x1bd>	8ec89: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01bd    8ec8d:	e9 ba fe ff ff       	jmp    8eb4c <do_user_addr_fault+0x7c>
01c2    8ec92:	e8 00 00 00 00       	call   8ec97 <do_user_addr_fault+0x1c7>	8ec93: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01c7    8ec97:	41 f6 c4 04          	test   $0x4,%r12b
01cb    8ec9b:	0f 84 58 ff ff ff    	je     8ebf9 <do_user_addr_fault+0x129>
01d1    8eca1:	e8 00 00 00 00       	call   8eca6 <do_user_addr_fault+0x1d6>	8eca2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01d6    8eca6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8eca9: R_X86_64_32S	_ftrace_annotated_branch+0x15e10
01dd    8ecad:	31 f6                	xor    %esi,%esi
01df    8ecaf:	31 d2                	xor    %edx,%edx
01e1    8ecb1:	31 c9                	xor    %ecx,%ecx
01e3    8ecb3:	e8 00 00 00 00       	call   8ecb8 <do_user_addr_fault+0x1e8>	8ecb4: R_X86_64_PLT32	ftrace_likely_update-0x4
01e8    8ecb8:	41 83 bd 34 11 00 00 00 	cmpl   $0x0,0x1134(%r13)
01f0    8ecc0:	0f 85 b8 01 00 00    	jne    8ee7e <do_user_addr_fault+0x3ae>
01f6    8ecc6:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 8eccc <do_user_addr_fault+0x1fc>	8ecc8: R_X86_64_PC32	pcpu_hot+0x4
01fc    8eccc:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
0201    8ecd1:	0f 95 c0             	setne  %al
0204    8ecd4:	4d 85 f6             	test   %r14,%r14
0207    8ecd7:	0f 94 c1             	sete   %cl
020a    8ecda:	08 c1                	or     %al,%cl
020c    8ecdc:	0f b6 d9             	movzbl %cl,%ebx
020f    8ecdf:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8ece2: R_X86_64_32S	_ftrace_annotated_branch+0x15e40
0216    8ece6:	89 de                	mov    %ebx,%esi
0218    8ece8:	31 d2                	xor    %edx,%edx
021a    8ecea:	31 c9                	xor    %ecx,%ecx
021c    8ecec:	e8 00 00 00 00       	call   8ecf1 <do_user_addr_fault+0x221>	8eced: R_X86_64_PLT32	ftrace_likely_update-0x4
0221    8ecf1:	80 fb 01             	cmp    $0x1,%bl
0224    8ecf4:	75 19                	jne    8ed0f <do_user_addr_fault+0x23f>
0226    8ecf6:	e8 00 00 00 00       	call   8ecfb <do_user_addr_fault+0x22b>	8ecf7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
022b    8ecfb:	4c 89 ff             	mov    %r15,%rdi
022e    8ecfe:	4c 89 e6             	mov    %r12,%rsi
0231    8ed01:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
0235    8ed05:	e8 66 07 00 00       	call   8f470 <bad_area_nosemaphore>
023a    8ed0a:	e9 a0 05 00 00       	jmp    8f2af <do_user_addr_fault+0x7df>
023f    8ed0f:	41 f6 87 88 00 00 00 03 	testb  $0x3,0x88(%r15)
0247    8ed17:	4c 89 7d c8          	mov    %r15,-0x38(%rbp)
024b    8ed1b:	74 13                	je     8ed30 <do_user_addr_fault+0x260>
024d    8ed1d:	e8 00 00 00 00       	call   8ed22 <do_user_addr_fault+0x252>	8ed1e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0252    8ed22:	e8 00 00 00 00       	call   8ed27 <do_user_addr_fault+0x257>	8ed23: R_X86_64_PLT32	trace_hardirqs_on-0x4
0257    8ed27:	fb                   	sti
0258    8ed28:	41 bf 54 02 00 00    	mov    $0x254,%r15d
025e    8ed2e:	eb 22                	jmp    8ed52 <do_user_addr_fault+0x282>
0260    8ed30:	41 f6 87 91 00 00 00 02 	testb  $0x2,0x91(%r15)
0268    8ed38:	75 07                	jne    8ed41 <do_user_addr_fault+0x271>
026a    8ed3a:	e8 00 00 00 00       	call   8ed3f <do_user_addr_fault+0x26f>	8ed3b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
026f    8ed3f:	eb 0b                	jmp    8ed4c <do_user_addr_fault+0x27c>
0271    8ed41:	e8 00 00 00 00       	call   8ed46 <do_user_addr_fault+0x276>	8ed42: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0276    8ed46:	e8 00 00 00 00       	call   8ed4b <do_user_addr_fault+0x27b>	8ed47: R_X86_64_PLT32	trace_hardirqs_on-0x4
027b    8ed4b:	fb                   	sti
027c    8ed4c:	41 bf 14 02 00 00    	mov    $0x214,%r15d
0282    8ed52:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0287    8ed57:	e8 00 00 00 00       	call   8ed5c <do_user_addr_fault+0x28c>	8ed58: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
028c    8ed5c:	48 8b 5d d0          	mov    -0x30(%rbp),%rbx
0290    8ed60:	48 81 e3 00 f0 ff ff 	and    $0xfffffffffffff000,%rbx
0297    8ed67:	31 f6                	xor    %esi,%esi
0299    8ed69:	48 81 fb 00 00 60 ff 	cmp    $0xffffffffff600000,%rbx
02a0    8ed70:	40 0f 94 c6          	sete   %sil
02a4    8ed74:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8ed77: R_X86_64_32S	_ftrace_annotated_branch+0x15ba0
02ab    8ed7b:	31 d2                	xor    %edx,%edx
02ad    8ed7d:	31 c9                	xor    %ecx,%ecx
02af    8ed7f:	e8 00 00 00 00       	call   8ed84 <do_user_addr_fault+0x2b4>	8ed80: R_X86_64_PLT32	ftrace_likely_update-0x4
02b4    8ed84:	48 81 fb 00 00 60 ff 	cmp    $0xffffffffff600000,%rbx
02bb    8ed8b:	75 1e                	jne    8edab <do_user_addr_fault+0x2db>
02bd    8ed8d:	4c 89 e7             	mov    %r12,%rdi
02c0    8ed90:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
02c4    8ed94:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
02c8    8ed98:	e8 00 00 00 00       	call   8ed9d <do_user_addr_fault+0x2cd>	8ed99: R_X86_64_PLT32	emulate_vsyscall-0x4
02cd    8ed9d:	84 c0                	test   %al,%al
02cf    8ed9f:	74 11                	je     8edb2 <do_user_addr_fault+0x2e2>
02d1    8eda1:	e8 00 00 00 00       	call   8eda6 <do_user_addr_fault+0x2d6>	8eda2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02d6    8eda6:	e9 04 05 00 00       	jmp    8f2af <do_user_addr_fault+0x7df>
02db    8edab:	e8 00 00 00 00       	call   8edb0 <do_user_addr_fault+0x2e0>	8edac: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02e0    8edb0:	eb 05                	jmp    8edb7 <do_user_addr_fault+0x2e7>
02e2    8edb2:	e8 00 00 00 00       	call   8edb7 <do_user_addr_fault+0x2e7>	8edb3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02e7    8edb7:	44 89 e3             	mov    %r12d,%ebx
02ea    8edba:	83 e3 02             	and    $0x2,%ebx
02ed    8edbd:	48 d1 eb             	shr    %rbx
02f0    8edc0:	44 89 e0             	mov    %r12d,%eax
02f3    8edc3:	83 e0 10             	and    $0x10,%eax
02f6    8edc6:	c1 e0 04             	shl    $0x4,%eax
02f9    8edc9:	89 45 c4             	mov    %eax,-0x3c(%rbp)
02fc    8edcc:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0301    8edd1:	e8 00 00 00 00       	call   8edd6 <do_user_addr_fault+0x306>	8edd2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0306    8edd6:	01 5d c4             	add    %ebx,-0x3c(%rbp)
0309    8edd9:	49 8d be e8 00 00 00 	lea    0xe8(%r14),%rdi
0310    8ede0:	48 89 7d a0          	mov    %rdi,-0x60(%rbp)
0314    8ede4:	e8 00 00 00 00       	call   8ede9 <do_user_addr_fault+0x319>	8ede5: R_X86_64_PLT32	down_read_trylock-0x4
0319    8ede9:	89 c3                	mov    %eax,%ebx
031b    8edeb:	4c 89 6d b8          	mov    %r13,-0x48(%rbp)
031f    8edef:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0324    8edf4:	e8 00 00 00 00       	call   8edf9 <do_user_addr_fault+0x329>	8edf5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0329    8edf9:	44 09 7d c4          	or     %r15d,-0x3c(%rbp)
032d    8edfd:	31 f6                	xor    %esi,%esi
032f    8edff:	85 db                	test   %ebx,%ebx
0331    8ee01:	40 0f 94 c6          	sete   %sil
0335    8ee05:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8ee08: R_X86_64_32S	_ftrace_annotated_branch+0x15e70
033c    8ee0c:	31 d2                	xor    %edx,%edx
033e    8ee0e:	31 c9                	xor    %ecx,%ecx
0340    8ee10:	e8 00 00 00 00       	call   8ee15 <do_user_addr_fault+0x345>	8ee11: R_X86_64_PLT32	ftrace_likely_update-0x4
0345    8ee15:	85 db                	test   %ebx,%ebx
0347    8ee17:	4c 89 75 b0          	mov    %r14,-0x50(%rbp)
034b    8ee1b:	74 24                	je     8ee41 <do_user_addr_fault+0x371>
034d    8ee1d:	e8 00 00 00 00       	call   8ee22 <do_user_addr_fault+0x352>	8ee1e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0352    8ee22:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8ee25: R_X86_64_32S	.rodata.str1.1+0xd5180
0359    8ee29:	be 76 05 00 00       	mov    $0x576,%esi
035e    8ee2e:	e8 00 00 00 00       	call   8ee33 <do_user_addr_fault+0x363>	8ee2f: R_X86_64_PLT32	__might_sleep-0x4
0363    8ee33:	e8 00 00 00 00       	call   8ee38 <do_user_addr_fault+0x368>	8ee34: R_X86_64_PLT32	__cond_resched-0x4
0368    8ee38:	4c 8b 7d c8          	mov    -0x38(%rbp),%r15
036c    8ee3c:	e9 bb 00 00 00       	jmp    8eefc <do_user_addr_fault+0x42c>
0371    8ee41:	4c 8b 7d c8          	mov    -0x38(%rbp),%r15
0375    8ee45:	41 f6 87 88 00 00 00 03 	testb  $0x3,0x88(%r15)
037d    8ee4d:	74 0a                	je     8ee59 <do_user_addr_fault+0x389>
037f    8ee4f:	e8 00 00 00 00       	call   8ee54 <do_user_addr_fault+0x384>	8ee50: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0384    8ee54:	e9 5f 03 00 00       	jmp    8f1b8 <do_user_addr_fault+0x6e8>
0389    8ee59:	49 8b bf 80 00 00 00 	mov    0x80(%r15),%rdi
0390    8ee60:	e8 00 00 00 00       	call   8ee65 <do_user_addr_fault+0x395>	8ee61: R_X86_64_PLT32	search_exception_tables-0x4
0395    8ee65:	48 85 c0             	test   %rax,%rax
0398    8ee68:	74 0a                	je     8ee74 <do_user_addr_fault+0x3a4>
039a    8ee6a:	e8 00 00 00 00       	call   8ee6f <do_user_addr_fault+0x39f>	8ee6b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
039f    8ee6f:	e9 44 03 00 00       	jmp    8f1b8 <do_user_addr_fault+0x6e8>
03a4    8ee74:	e8 00 00 00 00       	call   8ee79 <do_user_addr_fault+0x3a9>	8ee75: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03a9    8ee79:	e9 7d fe ff ff       	jmp    8ecfb <do_user_addr_fault+0x22b>
03ae    8ee7e:	e8 00 00 00 00       	call   8ee83 <do_user_addr_fault+0x3b3>	8ee7f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03b3    8ee83:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8ee86: R_X86_64_32S	_ftrace_annotated_branch+0x15e40
03ba    8ee8a:	be 01 00 00 00       	mov    $0x1,%esi
03bf    8ee8f:	31 d2                	xor    %edx,%edx
03c1    8ee91:	31 c9                	xor    %ecx,%ecx
03c3    8ee93:	e8 00 00 00 00       	call   8ee98 <do_user_addr_fault+0x3c8>	8ee94: R_X86_64_PLT32	ftrace_likely_update-0x4
03c8    8ee98:	e9 5e fe ff ff       	jmp    8ecfb <do_user_addr_fault+0x22b>
03cd    8ee9d:	e8 00 00 00 00       	call   8eea2 <do_user_addr_fault+0x3d2>	8ee9e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03d2    8eea2:	e9 ff fd ff ff       	jmp    8eca6 <do_user_addr_fault+0x1d6>
03d7    8eea7:	e8 00 00 00 00       	call   8eeac <do_user_addr_fault+0x3dc>	8eea8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03dc    8eeac:	be 01 00 00 00       	mov    $0x1,%esi
03e1    8eeb1:	bf 02 00 00 00       	mov    $0x2,%edi
03e6    8eeb6:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
03ea    8eeba:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
03ee    8eebe:	e8 00 00 00 00       	call   8eec3 <do_user_addr_fault+0x3f3>	8eebf: R_X86_64_PLT32	__perf_sw_event-0x4
03f3    8eec3:	e9 94 fe ff ff       	jmp    8ed5c <do_user_addr_fault+0x28c>
03f8    8eec8:	e8 00 00 00 00       	call   8eecd <do_user_addr_fault+0x3fd>	8eec9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03fd    8eecd:	4c 89 f7             	mov    %r14,%rdi
0400    8eed0:	31 f6                	xor    %esi,%esi
0402    8eed2:	e8 00 00 00 00       	call   8eed7 <do_user_addr_fault+0x407>	8eed3: R_X86_64_PLT32	__mmap_lock_do_trace_start_locking-0x4
0407    8eed7:	e9 fa fe ff ff       	jmp    8edd6 <do_user_addr_fault+0x306>
040c    8eedc:	45 31 ed             	xor    %r13d,%r13d
040f    8eedf:	85 db                	test   %ebx,%ebx
0411    8eee1:	41 0f 95 c5          	setne  %r13b
0415    8eee5:	e8 00 00 00 00       	call   8eeea <do_user_addr_fault+0x41a>	8eee6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
041a    8eeea:	4c 89 f7             	mov    %r14,%rdi
041d    8eeed:	31 f6                	xor    %esi,%esi
041f    8eeef:	44 89 ea             	mov    %r13d,%edx
0422    8eef2:	e8 00 00 00 00       	call   8eef7 <do_user_addr_fault+0x427>	8eef3: R_X86_64_PLT32	__mmap_lock_do_trace_acquire_returned-0x4
0427    8eef7:	e9 fd fe ff ff       	jmp    8edf9 <do_user_addr_fault+0x329>
042c    8eefc:	4c 89 f7             	mov    %r14,%rdi
042f    8eeff:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
0433    8ef03:	e8 00 00 00 00       	call   8ef08 <do_user_addr_fault+0x438>	8ef04: R_X86_64_PLT32	find_vma-0x4
0438    8ef08:	49 89 c5             	mov    %rax,%r13
043b    8ef0b:	31 f6                	xor    %esi,%esi
043d    8ef0d:	48 85 c0             	test   %rax,%rax
0440    8ef10:	40 0f 94 c6          	sete   %sil
0444    8ef14:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8ef17: R_X86_64_32S	_ftrace_annotated_branch+0x15ea0
044b    8ef1b:	31 d2                	xor    %edx,%edx
044d    8ef1d:	31 c9                	xor    %ecx,%ecx
044f    8ef1f:	e8 00 00 00 00       	call   8ef24 <do_user_addr_fault+0x454>	8ef20: R_X86_64_PLT32	ftrace_likely_update-0x4
0454    8ef24:	4d 85 ed             	test   %r13,%r13
0457    8ef27:	0f 84 ad 02 00 00    	je     8f1da <do_user_addr_fault+0x70a>
045d    8ef2d:	4d 8b 75 00          	mov    0x0(%r13),%r14
0461    8ef31:	31 f6                	xor    %esi,%esi
0463    8ef33:	48 8b 5d d0          	mov    -0x30(%rbp),%rbx
0467    8ef37:	49 39 de             	cmp    %rbx,%r14
046a    8ef3a:	40 0f 96 c6          	setbe  %sil
046e    8ef3e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8ef41: R_X86_64_32S	_ftrace_annotated_branch+0x15ed0
0475    8ef45:	ba 01 00 00 00       	mov    $0x1,%edx
047a    8ef4a:	31 c9                	xor    %ecx,%ecx
047c    8ef4c:	e8 00 00 00 00       	call   8ef51 <do_user_addr_fault+0x481>	8ef4d: R_X86_64_PLT32	ftrace_likely_update-0x4
0481    8ef51:	49 39 de             	cmp    %rbx,%r14
0484    8ef54:	77 07                	ja     8ef5d <do_user_addr_fault+0x48d>
0486    8ef56:	e8 00 00 00 00       	call   8ef5b <do_user_addr_fault+0x48b>	8ef57: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
048b    8ef5b:	eb 5a                	jmp    8efb7 <do_user_addr_fault+0x4e7>
048d    8ef5d:	41 8b 5d 20          	mov    0x20(%r13),%ebx
0491    8ef61:	c1 eb 08             	shr    $0x8,%ebx
0494    8ef64:	83 e3 01             	and    $0x1,%ebx
0497    8ef67:	89 de                	mov    %ebx,%esi
0499    8ef69:	83 f6 01             	xor    $0x1,%esi
049c    8ef6c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8ef6f: R_X86_64_32S	_ftrace_annotated_branch+0x15f00
04a3    8ef73:	31 d2                	xor    %edx,%edx
04a5    8ef75:	31 c9                	xor    %ecx,%ecx
04a7    8ef77:	e8 00 00 00 00       	call   8ef7c <do_user_addr_fault+0x4ac>	8ef78: R_X86_64_PLT32	ftrace_likely_update-0x4
04ac    8ef7c:	85 db                	test   %ebx,%ebx
04ae    8ef7e:	0f 84 e5 02 00 00    	je     8f269 <do_user_addr_fault+0x799>
04b4    8ef84:	4c 89 ef             	mov    %r13,%rdi
04b7    8ef87:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
04bb    8ef8b:	e8 00 00 00 00       	call   8ef90 <do_user_addr_fault+0x4c0>	8ef8c: R_X86_64_PLT32	expand_stack-0x4
04c0    8ef90:	89 c3                	mov    %eax,%ebx
04c2    8ef92:	31 f6                	xor    %esi,%esi
04c4    8ef94:	85 c0                	test   %eax,%eax
04c6    8ef96:	40 0f 95 c6          	setne  %sil
04ca    8ef9a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8ef9d: R_X86_64_32S	_ftrace_annotated_branch+0x15f30
04d1    8efa1:	31 d2                	xor    %edx,%edx
04d3    8efa3:	31 c9                	xor    %ecx,%ecx
04d5    8efa5:	e8 00 00 00 00       	call   8efaa <do_user_addr_fault+0x4da>	8efa6: R_X86_64_PLT32	ftrace_likely_update-0x4
04da    8efaa:	85 db                	test   %ebx,%ebx
04dc    8efac:	0f 85 be 02 00 00    	jne    8f270 <do_user_addr_fault+0x7a0>
04e2    8efb2:	e8 00 00 00 00       	call   8efb7 <do_user_addr_fault+0x4e7>	8efb3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04e7    8efb7:	41 f6 c4 20          	test   $0x20,%r12b
04eb    8efbb:	4c 8b 75 b0          	mov    -0x50(%rbp),%r14
04ef    8efbf:	0f 85 1f 02 00 00    	jne    8f1e4 <do_user_addr_fault+0x714>
04f5    8efc5:	44 89 e3             	mov    %r12d,%ebx
04f8    8efc8:	81 e3 00 80 00 00    	and    $0x8000,%ebx
04fe    8efce:	48 89 de             	mov    %rbx,%rsi
0501    8efd1:	48 c1 ee 0f          	shr    $0xf,%rsi
0505    8efd5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8efd8: R_X86_64_32S	_ftrace_annotated_branch+0x15ff0
050c    8efdc:	31 d2                	xor    %edx,%edx
050e    8efde:	31 c9                	xor    %ecx,%ecx
0510    8efe0:	e8 00 00 00 00       	call   8efe5 <do_user_addr_fault+0x515>	8efe1: R_X86_64_PLT32	ftrace_likely_update-0x4
0515    8efe5:	48 85 db             	test   %rbx,%rbx
0518    8efe8:	0f 85 00 02 00 00    	jne    8f1ee <do_user_addr_fault+0x71e>
051e    8efee:	41 f6 c4 02          	test   $0x2,%r12b
0522    8eff2:	75 39                	jne    8f02d <do_user_addr_fault+0x55d>
0524    8eff4:	44 89 e3             	mov    %r12d,%ebx
0527    8eff7:	83 e3 01             	and    $0x1,%ebx
052a    8effa:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8effd: R_X86_64_32S	_ftrace_annotated_branch+0x16050
0531    8f001:	89 de                	mov    %ebx,%esi
0533    8f003:	31 d2                	xor    %edx,%edx
0535    8f005:	31 c9                	xor    %ecx,%ecx
0537    8f007:	e8 00 00 00 00       	call   8f00c <do_user_addr_fault+0x53c>	8f008: R_X86_64_PLT32	ftrace_likely_update-0x4
053c    8f00c:	48 85 db             	test   %rbx,%rbx
053f    8f00f:	0f 85 71 02 00 00    	jne    8f286 <do_user_addr_fault+0x7b6>
0545    8f015:	e8 00 00 00 00       	call   8f01a <do_user_addr_fault+0x54a>	8f016: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
054a    8f01a:	31 db                	xor    %ebx,%ebx
054c    8f01c:	41 f6 45 20 07       	testb  $0x7,0x20(%r13)
0551    8f021:	0f 94 c3             	sete   %bl
0554    8f024:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8f027: R_X86_64_32S	_ftrace_annotated_branch+0x16080
055b    8f02b:	eb 16                	jmp    8f043 <do_user_addr_fault+0x573>
055d    8f02d:	e8 00 00 00 00       	call   8f032 <do_user_addr_fault+0x562>	8f02e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0562    8f032:	31 db                	xor    %ebx,%ebx
0564    8f034:	41 f6 45 20 02       	testb  $0x2,0x20(%r13)
0569    8f039:	0f 94 c3             	sete   %bl
056c    8f03c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8f03f: R_X86_64_32S	_ftrace_annotated_branch+0x16020
0573    8f043:	89 de                	mov    %ebx,%esi
0575    8f045:	31 d2                	xor    %edx,%edx
0577    8f047:	31 c9                	xor    %ecx,%ecx
0579    8f049:	e8 00 00 00 00       	call   8f04e <do_user_addr_fault+0x57e>	8f04a: R_X86_64_PLT32	ftrace_likely_update-0x4
057e    8f04e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8f051: R_X86_64_32S	_ftrace_annotated_branch+0x15f60
0585    8f055:	89 de                	mov    %ebx,%esi
0587    8f057:	31 d2                	xor    %edx,%edx
0589    8f059:	31 c9                	xor    %ecx,%ecx
058b    8f05b:	e8 00 00 00 00       	call   8f060 <do_user_addr_fault+0x590>	8f05c: R_X86_64_PLT32	ftrace_likely_update-0x4
0590    8f060:	85 db                	test   %ebx,%ebx
0592    8f062:	0f 85 90 01 00 00    	jne    8f1f8 <do_user_addr_fault+0x728>
0598    8f068:	4c 89 ef             	mov    %r13,%rdi
059b    8f06b:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
059f    8f06f:	8b 55 c4             	mov    -0x3c(%rbp),%edx
05a2    8f072:	4c 89 f9             	mov    %r15,%rcx
05a5    8f075:	e8 00 00 00 00       	call   8f07a <do_user_addr_fault+0x5aa>	8f076: R_X86_64_PLT32	handle_mm_fault-0x4
05aa    8f07a:	41 89 c7             	mov    %eax,%r15d
05ad    8f07d:	41 89 c5             	mov    %eax,%r13d
05b0    8f080:	41 81 e5 00 04 00 00 	and    $0x400,%r13d
05b7    8f087:	75 0a                	jne    8f093 <do_user_addr_fault+0x5c3>
05b9    8f089:	e8 00 00 00 00       	call   8f08e <do_user_addr_fault+0x5be>	8f08a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05be    8f08e:	e9 e2 00 00 00       	jmp    8f175 <do_user_addr_fault+0x6a5>
05c3    8f093:	4c 8b 75 b8          	mov    -0x48(%rbp),%r14
05c7    8f097:	49 8b 1e             	mov    (%r14),%rbx
05ca    8f09a:	89 de                	mov    %ebx,%esi
05cc    8f09c:	c1 ee 02             	shr    $0x2,%esi
05cf    8f09f:	83 e6 01             	and    $0x1,%esi
05d2    8f0a2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8f0a5: R_X86_64_32S	_ftrace_annotated_branch+0x16110
05d9    8f0a9:	31 d2                	xor    %edx,%edx
05db    8f0ab:	31 c9                	xor    %ecx,%ecx
05dd    8f0ad:	e8 00 00 00 00       	call   8f0b2 <do_user_addr_fault+0x5e2>	8f0ae: R_X86_64_PLT32	ftrace_likely_update-0x4
05e2    8f0b2:	0f ba e3 02          	bt     $0x2,%ebx
05e6    8f0b6:	72 07                	jb     8f0bf <do_user_addr_fault+0x5ef>
05e8    8f0b8:	e8 00 00 00 00       	call   8f0bd <do_user_addr_fault+0x5ed>	8f0b9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05ed    8f0bd:	eb 2d                	jmp    8f0ec <do_user_addr_fault+0x61c>
05ef    8f0bf:	41 8b 9e 58 05 00 00 	mov    0x558(%r14),%ebx
05f6    8f0c6:	c1 eb 08             	shr    $0x8,%ebx
05f9    8f0c9:	89 de                	mov    %ebx,%esi
05fb    8f0cb:	83 e6 01             	and    $0x1,%esi
05fe    8f0ce:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8f0d1: R_X86_64_32S	_ftrace_annotated_branch+0x16140
0605    8f0d5:	31 d2                	xor    %edx,%edx
0607    8f0d7:	31 c9                	xor    %ecx,%ecx
0609    8f0d9:	e8 00 00 00 00       	call   8f0de <do_user_addr_fault+0x60e>	8f0da: R_X86_64_PLT32	ftrace_likely_update-0x4
060e    8f0de:	83 e3 01             	and    $0x1,%ebx
0611    8f0e1:	0f 85 ec 01 00 00    	jne    8f2d3 <do_user_addr_fault+0x803>
0617    8f0e7:	e8 00 00 00 00       	call   8f0ec <do_user_addr_fault+0x61c>	8f0e8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
061c    8f0ec:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
0620    8f0f0:	f6 80 88 00 00 00 03 	testb  $0x3,0x88(%rax)
0627    8f0f7:	74 73                	je     8f16c <do_user_addr_fault+0x69c>
0629    8f0f9:	4c 8b 75 b8          	mov    -0x48(%rbp),%r14
062d    8f0fd:	49 8b 1e             	mov    (%r14),%rbx
0630    8f100:	81 e3 00 00 02 00    	and    $0x20000,%ebx
0636    8f106:	48 89 de             	mov    %rbx,%rsi
0639    8f109:	48 c1 ee 11          	shr    $0x11,%rsi
063d    8f10d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8f110: R_X86_64_32S	_ftrace_annotated_branch+0x160e0
0644    8f114:	31 d2                	xor    %edx,%edx
0646    8f116:	31 c9                	xor    %ecx,%ecx
0648    8f118:	e8 00 00 00 00       	call   8f11d <do_user_addr_fault+0x64d>	8f119: R_X86_64_PLT32	ftrace_likely_update-0x4
064d    8f11d:	48 85 db             	test   %rbx,%rbx
0650    8f120:	0f 85 9f 01 00 00    	jne    8f2c5 <do_user_addr_fault+0x7f5>
0656    8f126:	4d 8b 36             	mov    (%r14),%r14
0659    8f129:	41 c1 ee 02          	shr    $0x2,%r14d
065d    8f12d:	44 89 f3             	mov    %r14d,%ebx
0660    8f130:	83 e3 01             	and    $0x1,%ebx
0663    8f133:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8f136: R_X86_64_32S	_ftrace_annotated_branch+0x16110
066a    8f13a:	89 de                	mov    %ebx,%esi
066c    8f13c:	31 d2                	xor    %edx,%edx
066e    8f13e:	31 c9                	xor    %ecx,%ecx
0670    8f140:	e8 00 00 00 00       	call   8f145 <do_user_addr_fault+0x675>	8f141: R_X86_64_PLT32	ftrace_likely_update-0x4
0675    8f145:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8f148: R_X86_64_32S	_ftrace_annotated_branch+0x160b0
067c    8f14c:	89 de                	mov    %ebx,%esi
067e    8f14e:	31 d2                	xor    %edx,%edx
0680    8f150:	31 c9                	xor    %ecx,%ecx
0682    8f152:	e8 00 00 00 00       	call   8f157 <do_user_addr_fault+0x687>	8f153: R_X86_64_PLT32	ftrace_likely_update-0x4
0687    8f157:	41 83 e6 01          	and    $0x1,%r14d
068b    8f15b:	0f 85 6b 01 00 00    	jne    8f2cc <do_user_addr_fault+0x7fc>
0691    8f161:	e8 00 00 00 00       	call   8f166 <do_user_addr_fault+0x696>	8f162: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0696    8f166:	4c 8b 75 b0          	mov    -0x50(%rbp),%r14
069a    8f16a:	eb 1b                	jmp    8f187 <do_user_addr_fault+0x6b7>
069c    8f16c:	e8 00 00 00 00       	call   8f171 <do_user_addr_fault+0x6a1>	8f16d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06a1    8f171:	4c 8b 75 b0          	mov    -0x50(%rbp),%r14
06a5    8f175:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8f178: R_X86_64_32S	_ftrace_annotated_branch+0x160b0
06ac    8f17c:	31 f6                	xor    %esi,%esi
06ae    8f17e:	31 d2                	xor    %edx,%edx
06b0    8f180:	31 c9                	xor    %ecx,%ecx
06b2    8f182:	e8 00 00 00 00       	call   8f187 <do_user_addr_fault+0x6b7>	8f183: R_X86_64_PLT32	ftrace_likely_update-0x4
06b7    8f187:	41 f7 c7 00 40 00 00 	test   $0x4000,%r15d
06be    8f18e:	75 72                	jne    8f202 <do_user_addr_fault+0x732>
06c0    8f190:	44 89 ee             	mov    %r13d,%esi
06c3    8f193:	c1 ee 0a             	shr    $0xa,%esi
06c6    8f196:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8f199: R_X86_64_32S	_ftrace_annotated_branch+0x15f90
06cd    8f19d:	31 d2                	xor    %edx,%edx
06cf    8f19f:	31 c9                	xor    %ecx,%ecx
06d1    8f1a1:	e8 00 00 00 00       	call   8f1a6 <do_user_addr_fault+0x6d6>	8f1a2: R_X86_64_PLT32	ftrace_likely_update-0x4
06d6    8f1a6:	45 85 ed             	test   %r13d,%r13d
06d9    8f1a9:	74 61                	je     8f20c <do_user_addr_fault+0x73c>
06db    8f1ab:	e8 00 00 00 00       	call   8f1b0 <do_user_addr_fault+0x6e0>	8f1ac: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06e0    8f1b0:	83 4d c4 20          	orl    $0x20,-0x3c(%rbp)
06e4    8f1b4:	4c 8b 7d c8          	mov    -0x38(%rbp),%r15
06e8    8f1b8:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
06ed    8f1bd:	e8 00 00 00 00       	call   8f1c2 <do_user_addr_fault+0x6f2>	8f1be: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06f2    8f1c2:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
06f6    8f1c6:	e8 00 00 00 00       	call   8f1cb <do_user_addr_fault+0x6fb>	8f1c7: R_X86_64_PLT32	down_read-0x4
06fb    8f1cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0700    8f1d0:	e8 00 00 00 00       	call   8f1d5 <do_user_addr_fault+0x705>	8f1d1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0705    8f1d5:	e9 22 fd ff ff       	jmp    8eefc <do_user_addr_fault+0x42c>
070a    8f1da:	e8 00 00 00 00       	call   8f1df <do_user_addr_fault+0x70f>	8f1db: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
070f    8f1df:	e9 91 00 00 00       	jmp    8f275 <do_user_addr_fault+0x7a5>
0714    8f1e4:	e8 00 00 00 00       	call   8f1e9 <do_user_addr_fault+0x719>	8f1e5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0719    8f1e9:	e9 9d 00 00 00       	jmp    8f28b <do_user_addr_fault+0x7bb>
071e    8f1ee:	e8 00 00 00 00       	call   8f1f3 <do_user_addr_fault+0x723>	8f1ef: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0723    8f1f3:	e9 93 00 00 00       	jmp    8f28b <do_user_addr_fault+0x7bb>
0728    8f1f8:	e8 00 00 00 00       	call   8f1fd <do_user_addr_fault+0x72d>	8f1f9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
072d    8f1fd:	e9 9e 00 00 00       	jmp    8f2a0 <do_user_addr_fault+0x7d0>
0732    8f202:	e8 00 00 00 00       	call   8f207 <do_user_addr_fault+0x737>	8f203: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0737    8f207:	e9 a3 00 00 00       	jmp    8f2af <do_user_addr_fault+0x7df>
073c    8f20c:	4c 89 f7             	mov    %r14,%rdi
073f    8f20f:	e8 0c 10 00 00       	call   90220 <mmap_read_unlock>
0744    8f214:	31 f6                	xor    %esi,%esi
0746    8f216:	41 f7 c7 73 08 00 00 	test   $0x873,%r15d
074d    8f21d:	40 0f 94 c6          	sete   %sil
0751    8f221:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8f224: R_X86_64_32S	_ftrace_annotated_branch+0x15fc0
0758    8f228:	ba 01 00 00 00       	mov    $0x1,%edx
075d    8f22d:	31 c9                	xor    %ecx,%ecx
075f    8f22f:	e8 00 00 00 00       	call   8f234 <do_user_addr_fault+0x764>	8f230: R_X86_64_PLT32	ftrace_likely_update-0x4
0764    8f234:	41 f7 c7 73 08 00 00 	test   $0x873,%r15d
076b    8f23b:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
076f    8f23f:	74 7d                	je     8f2be <do_user_addr_fault+0x7ee>
0771    8f241:	e8 1a 10 00 00       	call   90260 <fatal_signal_pending>
0776    8f246:	85 c0                	test   %eax,%eax
0778    8f248:	0f 84 d4 00 00 00    	je     8f322 <do_user_addr_fault+0x852>
077e    8f24e:	48 8b 5d c8          	mov    -0x38(%rbp),%rbx
0782    8f252:	f6 83 88 00 00 00 03 	testb  $0x3,0x88(%rbx)
0789    8f259:	0f 84 0a 01 00 00    	je     8f369 <do_user_addr_fault+0x899>
078f    8f25f:	e8 00 00 00 00       	call   8f264 <do_user_addr_fault+0x794>	8f260: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0794    8f264:	e9 be 00 00 00       	jmp    8f327 <do_user_addr_fault+0x857>
0799    8f269:	e8 00 00 00 00       	call   8f26e <do_user_addr_fault+0x79e>	8f26a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
079e    8f26e:	eb 05                	jmp    8f275 <do_user_addr_fault+0x7a5>
07a0    8f270:	e8 00 00 00 00       	call   8f275 <do_user_addr_fault+0x7a5>	8f271: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07a5    8f275:	4c 89 ff             	mov    %r15,%rdi
07a8    8f278:	4c 89 e6             	mov    %r12,%rsi
07ab    8f27b:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
07af    8f27f:	e8 bc 0e 00 00       	call   90140 <bad_area>
07b4    8f284:	eb 29                	jmp    8f2af <do_user_addr_fault+0x7df>
07b6    8f286:	e8 00 00 00 00       	call   8f28b <do_user_addr_fault+0x7bb>	8f287: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07bb    8f28b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8f28e: R_X86_64_32S	_ftrace_annotated_branch+0x15f60
07c2    8f292:	be 01 00 00 00       	mov    $0x1,%esi
07c7    8f297:	31 d2                	xor    %edx,%edx
07c9    8f299:	31 c9                	xor    %ecx,%ecx
07cb    8f29b:	e8 00 00 00 00       	call   8f2a0 <do_user_addr_fault+0x7d0>	8f29c: R_X86_64_PLT32	ftrace_likely_update-0x4
07d0    8f2a0:	4c 89 ff             	mov    %r15,%rdi
07d3    8f2a3:	4c 89 e6             	mov    %r12,%rsi
07d6    8f2a6:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
07da    8f2aa:	e8 01 0f 00 00       	call   901b0 <bad_area_access_error>
07df    8f2af:	48 83 c4 38          	add    $0x38,%rsp
07e3    8f2b3:	5b                   	pop    %rbx
07e4    8f2b4:	41 5c                	pop    %r12
07e6    8f2b6:	41 5d                	pop    %r13
07e8    8f2b8:	41 5e                	pop    %r14
07ea    8f2ba:	41 5f                	pop    %r15
07ec    8f2bc:	5d                   	pop    %rbp
07ed    8f2bd:	c3                   	ret
07ee    8f2be:	e8 00 00 00 00       	call   8f2c3 <do_user_addr_fault+0x7f3>	8f2bf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07f3    8f2c3:	eb ea                	jmp    8f2af <do_user_addr_fault+0x7df>
07f5    8f2c5:	e8 00 00 00 00       	call   8f2ca <do_user_addr_fault+0x7fa>	8f2c6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07fa    8f2ca:	eb 0c                	jmp    8f2d8 <do_user_addr_fault+0x808>
07fc    8f2cc:	e8 00 00 00 00       	call   8f2d1 <do_user_addr_fault+0x801>	8f2cd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0801    8f2d1:	eb 1a                	jmp    8f2ed <do_user_addr_fault+0x81d>
0803    8f2d3:	e8 00 00 00 00       	call   8f2d8 <do_user_addr_fault+0x808>	8f2d4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0808    8f2d8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8f2db: R_X86_64_32S	_ftrace_annotated_branch+0x160b0
080f    8f2df:	be 01 00 00 00       	mov    $0x1,%esi
0814    8f2e4:	31 d2                	xor    %edx,%edx
0816    8f2e6:	31 c9                	xor    %ecx,%ecx
0818    8f2e8:	e8 00 00 00 00       	call   8f2ed <do_user_addr_fault+0x81d>	8f2e9: R_X86_64_PLT32	ftrace_likely_update-0x4
081d    8f2ed:	48 8b 5d c8          	mov    -0x38(%rbp),%rbx
0821    8f2f1:	f6 83 88 00 00 00 03 	testb  $0x3,0x88(%rbx)
0828    8f2f8:	74 07                	je     8f301 <do_user_addr_fault+0x831>
082a    8f2fa:	e8 00 00 00 00       	call   8f2ff <do_user_addr_fault+0x82f>	8f2fb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
082f    8f2ff:	eb ae                	jmp    8f2af <do_user_addr_fault+0x7df>
0831    8f301:	e8 00 00 00 00       	call   8f306 <do_user_addr_fault+0x836>	8f302: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0836    8f306:	48 89 df             	mov    %rbx,%rdi
0839    8f309:	4c 89 e6             	mov    %r12,%rsi
083c    8f30c:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
0840    8f310:	b9 07 00 00 00       	mov    $0x7,%ecx
0845    8f315:	41 b8 02 00 00 00    	mov    $0x2,%r8d
084b    8f31b:	e8 00 04 00 00       	call   8f720 <kernelmode_fixup_or_oops>
0850    8f320:	eb 8d                	jmp    8f2af <do_user_addr_fault+0x7df>
0852    8f322:	e8 00 00 00 00       	call   8f327 <do_user_addr_fault+0x857>	8f323: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0857    8f327:	41 f6 c7 01          	test   $0x1,%r15b
085b    8f32b:	75 20                	jne    8f34d <do_user_addr_fault+0x87d>
085d    8f32d:	41 f6 c7 32          	test   $0x32,%r15b
0861    8f331:	74 54                	je     8f387 <do_user_addr_fault+0x8b7>
0863    8f333:	e8 00 00 00 00       	call   8f338 <do_user_addr_fault+0x868>	8f334: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0868    8f338:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
086c    8f33c:	4c 89 e6             	mov    %r12,%rsi
086f    8f33f:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
0873    8f343:	e8 88 0f 00 00       	call   902d0 <do_sigbus>
0878    8f348:	e9 62 ff ff ff       	jmp    8f2af <do_user_addr_fault+0x7df>
087d    8f34d:	48 8b 5d c8          	mov    -0x38(%rbp),%rbx
0881    8f351:	f6 83 88 00 00 00 03 	testb  $0x3,0x88(%rbx)
0888    8f358:	74 41                	je     8f39b <do_user_addr_fault+0x8cb>
088a    8f35a:	e8 00 00 00 00       	call   8f35f <do_user_addr_fault+0x88f>	8f35b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
088f    8f35f:	e8 00 00 00 00       	call   8f364 <do_user_addr_fault+0x894>	8f360: R_X86_64_PLT32	pagefault_out_of_memory-0x4
0894    8f364:	e9 46 ff ff ff       	jmp    8f2af <do_user_addr_fault+0x7df>
0899    8f369:	e8 00 00 00 00       	call   8f36e <do_user_addr_fault+0x89e>	8f36a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
089e    8f36e:	48 89 df             	mov    %rbx,%rdi
08a1    8f371:	4c 89 e6             	mov    %r12,%rsi
08a4    8f374:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
08a8    8f378:	31 c9                	xor    %ecx,%ecx
08aa    8f37a:	45 31 c0             	xor    %r8d,%r8d
08ad    8f37d:	e8 9e 03 00 00       	call   8f720 <kernelmode_fixup_or_oops>
08b2    8f382:	e9 28 ff ff ff       	jmp    8f2af <do_user_addr_fault+0x7df>
08b7    8f387:	41 f6 c7 40          	test   $0x40,%r15b
08bb    8f38b:	74 5f                	je     8f3ec <do_user_addr_fault+0x91c>
08bd    8f38d:	e8 00 00 00 00       	call   8f392 <do_user_addr_fault+0x8c2>	8f38e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08c2    8f392:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
08c6    8f396:	e9 63 f9 ff ff       	jmp    8ecfe <do_user_addr_fault+0x22e>
08cb    8f39b:	e8 00 00 00 00       	call   8f3a0 <do_user_addr_fault+0x8d0>	8f39c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08d0    8f3a0:	48 89 df             	mov    %rbx,%rdi
08d3    8f3a3:	4c 89 e6             	mov    %r12,%rsi
08d6    8f3a6:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
08da    8f3aa:	b9 0b 00 00 00       	mov    $0xb,%ecx
08df    8f3af:	41 b8 01 00 00 00    	mov    $0x1,%r8d
08e5    8f3b5:	e8 66 03 00 00       	call   8f720 <kernelmode_fixup_or_oops>
08ea    8f3ba:	e9 f0 fe ff ff       	jmp    8f2af <do_user_addr_fault+0x7df>
08ef    8f3bf:	e8 00 00 00 00       	call   8f3c4 <do_user_addr_fault+0x8f4>	8f3c0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08f4    8f3c4:	4c 89 f7             	mov    %r14,%rdi
08f7    8f3c7:	31 f6                	xor    %esi,%esi
08f9    8f3c9:	e8 00 00 00 00       	call   8f3ce <do_user_addr_fault+0x8fe>	8f3ca: R_X86_64_PLT32	__mmap_lock_do_trace_start_locking-0x4
08fe    8f3ce:	e9 ef fd ff ff       	jmp    8f1c2 <do_user_addr_fault+0x6f2>
0903    8f3d3:	e8 00 00 00 00       	call   8f3d8 <do_user_addr_fault+0x908>	8f3d4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0908    8f3d8:	4c 89 f7             	mov    %r14,%rdi
090b    8f3db:	31 f6                	xor    %esi,%esi
090d    8f3dd:	ba 01 00 00 00       	mov    $0x1,%edx
0912    8f3e2:	e8 00 00 00 00       	call   8f3e7 <do_user_addr_fault+0x917>	8f3e3: R_X86_64_PLT32	__mmap_lock_do_trace_acquire_returned-0x4
0917    8f3e7:	e9 10 fb ff ff       	jmp    8eefc <do_user_addr_fault+0x42c>
091c    8f3ec:	e8 00 00 00 00       	call   8f3f1 <do_user_addr_fault+0x921>	8f3ed: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0921    8f3f1:	0f 0b                	ud2
0923    8f3f3:	66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
