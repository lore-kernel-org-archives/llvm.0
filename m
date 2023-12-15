Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7F210F8;
	Fri, 15 Dec 2023 00:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aut+BgR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702601929; x=1734137929;
  h=date:from:cc:subject:message-id:mime-version;
  bh=NweWkUaSimlxGtTPNxfmzhxKa2QURj0y4u/4KhNcv4o=;
  b=Aut+BgR+1Okh2HAQgOn4rA4J/rfy1BC91yAZaWJaoLlWfum9l8lo0uEm
   dHeQ5QpCVpxM2nfjEjjXfrVf1ZTlc7WQoF7E99pd0Qk+BL95DWcDuZ0r6
   kgr9E2D1kvXaCAsFJw1PaB6b71+7EOkJCLyi12C8uYze3y+N3QiLRXBvq
   Ws0zMl0J1fxjHx8GA+/dwqkd6UryXGpJY6kBZgjrymmpEv2kTf6W5KbKL
   KhnQ6GVJmVEG30TBqYA6rKE6tyQUrMwletGGkBasLDW0ik0FiEsWk9SzX
   YR+HKwLDFJgYvdJ3f2uXTzxVlHJikwGPvxSkx4JsK/0vUunI4CI5g25sq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="374718072"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="374718072"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 16:58:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="840481251"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="840481251"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 14 Dec 2023 16:58:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDwXN-000Mu2-0L;
	Fri, 15 Dec 2023 00:58:45 +0000
Date: Fri, 15 Dec 2023 08:57:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: __send_ipi_one+0x3bc: undefined stack
 state
Message-ID: <202312150857.4ksaRgEN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Dexuan Cui <decui@microsoft.com>
CC: Wei Liu <wei.liu@kernel.org>
CC: Michael Kelley <mikelley@microsoft.com>
CC: Tianyu Lan <tiala@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c7402612e2e61b76177f22e6e7f705adcbecc6fe
commit: e3131f1c81448a87e08dffd21867312a5ce563d9 x86/hyperv: Remove hv_isolation_type_en_snp
date:   4 months ago
config: x86_64-buildonly-randconfig-006-20231215 (https://download.01.org/0day-ci/archive/20231215/202312150857.4ksaRgEN-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150857.4ksaRgEN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150857.4ksaRgEN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __send_ipi_one+0x3bc: undefined stack state
   vmlinux.o: warning: objtool: handle_bug+0x4: call to kmsan_unpoison_entry_regs() leaves .noinstr.text section


objdump-func vmlinux.o __send_ipi_one:
0000 0000000000070d40 <__send_ipi_one>:
0000    70d40:	55                   	push   %rbp
0001    70d41:	41 57                	push   %r15
0003    70d43:	41 56                	push   %r14
0005    70d45:	41 55                	push   %r13
0007    70d47:	41 54                	push   %r12
0009    70d49:	53                   	push   %rbx
000a    70d4a:	48 83 ec 20          	sub    $0x20,%rsp
000e    70d4e:	41 89 f6             	mov    %esi,%r14d
0011    70d51:	41 89 ff             	mov    %edi,%r15d
0014    70d54:	e8 00 00 00 00       	call   70d59 <__send_ipi_one+0x19>	70d55: R_X86_64_PLT32	__msan_get_context_state-0x4
0019    70d59:	48 89 c3             	mov    %rax,%rbx
001c    70d5c:	4d 63 ef             	movslq %r15d,%r13
001f    70d5f:	49 c1 e5 02          	shl    $0x2,%r13
0023    70d63:	4c 03 2d 00 00 00 00 	add    0x0(%rip),%r13        # 70d6a <__send_ipi_one+0x2a>	70d66: R_X86_64_PC32	hv_vp_index-0x4
002a    70d6a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	70d6d: R_X86_64_32S	hv_vp_index
0031    70d71:	e8 00 00 00 00       	call   70d76 <__send_ipi_one+0x36>	70d72: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0036    70d76:	48 83 38 00          	cmpq   $0x0,(%rax)
003a    70d7a:	75 76                	jne    70df2 <__send_ipi_one+0xb2>
003c    70d7c:	45 8b 65 00          	mov    0x0(%r13),%r12d
0040    70d80:	4c 89 ef             	mov    %r13,%rdi
0043    70d83:	e8 00 00 00 00       	call   70d88 <__send_ipi_one+0x48>	70d84: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
0048    70d88:	44 8b 28             	mov    (%rax),%r13d
004b    70d8b:	8b 2a                	mov    (%rdx),%ebp
004d    70d8d:	45 85 ed             	test   %r13d,%r13d
0050    70d90:	74 0b                	je     70d9d <__send_ipi_one+0x5d>
0052    70d92:	44 89 e8             	mov    %r13d,%eax
0055    70d95:	44 09 e0             	or     %r12d,%eax
0058    70d98:	83 f8 ff             	cmp    $0xffffffff,%eax
005b    70d9b:	74 5e                	je     70dfb <__send_ipi_one+0xbb>
005d    70d9d:	41 83 fc ff          	cmp    $0xffffffff,%r12d
0061    70da1:	74 65                	je     70e08 <__send_ipi_one+0xc8>
0063    70da3:	89 2c 24             	mov    %ebp,(%rsp)
0066    70da6:	48 8b 2d 00 00 00 00 	mov    0x0(%rip),%rbp        # 70dad <__send_ipi_one+0x6d>	70da9: R_X86_64_PC32	hv_hypercall_pg-0x4
006d    70dad:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	70db0: R_X86_64_32S	hv_hypercall_pg
0074    70db4:	e8 00 00 00 00       	call   70db9 <__send_ipi_one+0x79>	70db5: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0079    70db9:	48 8b 00             	mov    (%rax),%rax
007c    70dbc:	48 85 c0             	test   %rax,%rax
007f    70dbf:	74 08                	je     70dc9 <__send_ipi_one+0x89>
0081    70dc1:	48 f7 d0             	not    %rax
0084    70dc4:	48 21 e8             	and    %rbp,%rax
0087    70dc7:	74 4a                	je     70e13 <__send_ipi_one+0xd3>
0089    70dc9:	48 85 ed             	test   %rbp,%rbp
008c    70dcc:	74 51                	je     70e1f <__send_ipi_one+0xdf>
008e    70dce:	41 8d b6 00 ff ff ff 	lea    -0x100(%r14),%esi
0095    70dd5:	31 d2                	xor    %edx,%edx
0097    70dd7:	b9 00 00 00 00       	mov    $0x0,%ecx
009c    70ddc:	b8 00 00 00 00       	mov    $0x0,%eax
00a1    70de1:	81 fe 10 ff ff ff    	cmp    $0xffffff10,%esi
00a7    70de7:	0f 83 b5 00 00 00    	jae    70ea2 <__send_ipi_one+0x162>
00ad    70ded:	e9 3a 03 00 00       	jmp    7112c <__send_ipi_one+0x3ec>
00b2    70df2:	8b 3a                	mov    (%rdx),%edi
00b4    70df4:	e8 00 00 00 00       	call   70df9 <__send_ipi_one+0xb9>	70df5: R_X86_64_PLT32	__msan_warning-0x4
00b9    70df9:	eb 81                	jmp    70d7c <__send_ipi_one+0x3c>
00bb    70dfb:	89 ef                	mov    %ebp,%edi
00bd    70dfd:	e8 00 00 00 00       	call   70e02 <__send_ipi_one+0xc2>	70dfe: R_X86_64_PLT32	__msan_warning-0x4
00c2    70e02:	41 83 fc ff          	cmp    $0xffffffff,%r12d
00c6    70e06:	75 9b                	jne    70da3 <__send_ipi_one+0x63>
00c8    70e08:	31 d2                	xor    %edx,%edx
00ca    70e0a:	31 c9                	xor    %ecx,%ecx
00cc    70e0c:	31 c0                	xor    %eax,%eax
00ce    70e0e:	e9 19 03 00 00       	jmp    7112c <__send_ipi_one+0x3ec>
00d3    70e13:	8b 3a                	mov    (%rdx),%edi
00d5    70e15:	e8 00 00 00 00       	call   70e1a <__send_ipi_one+0xda>	70e16: R_X86_64_PLT32	__msan_warning-0x4
00da    70e1a:	48 85 ed             	test   %rbp,%rbp
00dd    70e1d:	75 af                	jne    70dce <__send_ipi_one+0x8e>
00df    70e1f:	8b 2d 00 00 00 00    	mov    0x0(%rip),%ebp        # 70e25 <__send_ipi_one+0xe5>	70e21: R_X86_64_PC32	ms_hyperv+0x18
00e5    70e25:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	70e28: R_X86_64_32S	ms_hyperv+0x1c
00ec    70e2c:	e8 00 00 00 00       	call   70e31 <__send_ipi_one+0xf1>	70e2d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
00f1    70e31:	8b 00                	mov    (%rax),%eax
00f3    70e33:	83 e0 01             	and    $0x1,%eax
00f6    70e36:	83 e5 01             	and    $0x1,%ebp
00f9    70e39:	85 c0                	test   %eax,%eax
00fb    70e3b:	74 0a                	je     70e47 <__send_ipi_one+0x107>
00fd    70e3d:	f7 d0                	not    %eax
00ff    70e3f:	21 e8                	and    %ebp,%eax
0101    70e41:	0f 84 79 01 00 00    	je     70fc0 <__send_ipi_one+0x280>
0107    70e47:	31 d2                	xor    %edx,%edx
0109    70e49:	b9 00 00 00 00       	mov    $0x0,%ecx
010e    70e4e:	b8 00 00 00 00       	mov    $0x0,%eax
0113    70e53:	85 ed                	test   %ebp,%ebp
0115    70e55:	0f 85 d1 02 00 00    	jne    7112c <__send_ipi_one+0x3ec>
011b    70e5b:	c6 83 20 03 00 00 00 	movb   $0x0,0x320(%rbx)
0122    70e62:	e8 00 00 00 00       	call   70e67 <__send_ipi_one+0x127>	70e63: R_X86_64_PLT32	hv_isolation_type_tdx-0x4
0127    70e67:	41 8d 4e f0          	lea    -0x10(%r14),%ecx
012b    70e6b:	81 f9 f0 00 00 00    	cmp    $0xf0,%ecx
0131    70e71:	40 0f 92 c5          	setb   %bpl
0135    70e75:	40 20 c5             	and    %al,%bpl
0138    70e78:	81 f9 ef 00 00 00    	cmp    $0xef,%ecx
013e    70e7e:	77 0d                	ja     70e8d <__send_ipi_one+0x14d>
0140    70e80:	f6 83 20 03 00 00 01 	testb  $0x1,0x320(%rbx)
0147    70e87:	0f 85 ee 01 00 00    	jne    7107b <__send_ipi_one+0x33b>
014d    70e8d:	31 d2                	xor    %edx,%edx
014f    70e8f:	b9 00 00 00 00       	mov    $0x0,%ecx
0154    70e94:	b8 00 00 00 00       	mov    $0x0,%eax
0159    70e99:	40 84 ed             	test   %bpl,%bpl
015c    70e9c:	0f 84 8a 02 00 00    	je     7112c <__send_ipi_one+0x3ec>
0162    70ea2:	45 85 ed             	test   %r13d,%r13d
0165    70ea5:	8b 2c 24             	mov    (%rsp),%ebp
0168    70ea8:	75 45                	jne    70eef <__send_ipi_one+0x1af>
016a    70eaa:	41 83 fc 40          	cmp    $0x40,%r12d
016e    70eae:	7c 4c                	jl     70efc <__send_ipi_one+0x1bc>
0170    70eb0:	44 89 f8             	mov    %r15d,%eax
0173    70eb3:	83 e0 3f             	and    $0x3f,%eax
0176    70eb6:	48 c1 e0 03          	shl    $0x3,%rax
017a    70eba:	41 c1 ef 06          	shr    $0x6,%r15d
017e    70ebe:	49 c1 e7 03          	shl    $0x3,%r15
0182    70ec2:	4c 29 f8             	sub    %r15,%rax
0185    70ec5:	48 8d b8 00 00 00 00 	lea    0x0(%rax),%rdi	70ec8: R_X86_64_32S	cpu_bit_bitmap+0x8
018c    70ecc:	c6 83 20 03 00 00 00 	movb   $0x0,0x320(%rbx)
0193    70ed3:	44 89 f6             	mov    %r14d,%esi
0196    70ed6:	31 d2                	xor    %edx,%edx
0198    70ed8:	e8 b3 02 00 00       	call   71190 <__send_ipi_mask_ex>
019d    70edd:	0f b6 93 20 03 00 00 	movzbl 0x320(%rbx),%edx
01a4    70ee4:	8b 8b a8 0f 00 00    	mov    0xfa8(%rbx),%ecx
01aa    70eea:	e9 3d 02 00 00       	jmp    7112c <__send_ipi_one+0x3ec>
01af    70eef:	89 ef                	mov    %ebp,%edi
01b1    70ef1:	e8 00 00 00 00       	call   70ef6 <__send_ipi_one+0x1b6>	70ef2: R_X86_64_PLT32	__msan_warning-0x4
01b6    70ef6:	41 83 fc 40          	cmp    $0x40,%r12d
01ba    70efa:	7d b4                	jge    70eb0 <__send_ipi_one+0x170>
01bc    70efc:	44 89 f0             	mov    %r14d,%eax
01bf    70eff:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
01c4    70f04:	45 85 ed             	test   %r13d,%r13d
01c7    70f07:	41 0f 44 ed          	cmove  %r13d,%ebp
01cb    70f0b:	89 2c 24             	mov    %ebp,(%rsp)
01ce    70f0e:	41 bf 01 00 00 00    	mov    $0x1,%r15d
01d4    70f14:	44 89 e1             	mov    %r12d,%ecx
01d7    70f17:	49 d3 e7             	shl    %cl,%r15
01da    70f1a:	c6 83 20 03 00 00 00 	movb   $0x0,0x320(%rbx)
01e1    70f21:	e8 00 00 00 00       	call   70f26 <__send_ipi_one+0x1e6>	70f22: R_X86_64_PLT32	hv_isolation_type_tdx-0x4
01e6    70f26:	41 89 c4             	mov    %eax,%r12d
01e9    70f29:	44 0f b6 b3 20 03 00 00 	movzbl 0x320(%rbx),%r14d
01f1    70f31:	8b 83 a8 0f 00 00    	mov    0xfa8(%rbx),%eax
01f7    70f37:	89 44 24 04          	mov    %eax,0x4(%rsp)
01fb    70f3b:	0f b6 2d 00 00 00 00 	movzbl 0x0(%rip),%ebp        # 70f42 <__send_ipi_one+0x202>	70f3e: R_X86_64_PC32	hyperv_paravisor_present-0x4
0202    70f42:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	70f45: R_X86_64_32S	hyperv_paravisor_present
0209    70f49:	e8 00 00 00 00       	call   70f4e <__send_ipi_one+0x20e>	70f4a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
020e    70f4e:	0f b6 00             	movzbl (%rax),%eax
0211    70f51:	84 c0                	test   %al,%al
0213    70f53:	0f 95 c1             	setne  %cl
0216    70f56:	f6 d0                	not    %al
0218    70f58:	40 84 c5             	test   %al,%bpl
021b    70f5b:	0f 94 c0             	sete   %al
021e    70f5e:	20 c8                	and    %cl,%al
0220    70f60:	40 84 ed             	test   %bpl,%bpl
0223    70f63:	40 0f 94 c5          	sete   %bpl
0227    70f67:	44 89 e1             	mov    %r12d,%ecx
022a    70f6a:	20 c1                	and    %al,%cl
022c    70f6c:	40 08 e8             	or     %bpl,%al
022f    70f6f:	0f b6 c0             	movzbl %al,%eax
0232    70f72:	0f b6 c9             	movzbl %cl,%ecx
0235    70f75:	45 84 f6             	test   %r14b,%r14b
0238    70f78:	0f 45 c8             	cmovne %eax,%ecx
023b    70f7b:	44 20 e5             	and    %r12b,%bpl
023e    70f7e:	80 f9 01             	cmp    $0x1,%cl
0241    70f81:	74 49                	je     70fcc <__send_ipi_one+0x28c>
0243    70f83:	40 84 ed             	test   %bpl,%bpl
0246    70f86:	74 61                	je     70fe9 <__send_ipi_one+0x2a9>
0248    70f88:	48 c7 83 20 03 00 00 00 00 00 00 	movq   $0x0,0x320(%rbx)
0253    70f93:	45 85 ed             	test   %r13d,%r13d
0256    70f96:	0f 85 ef 00 00 00    	jne    7108b <__send_ipi_one+0x34b>
025c    70f9c:	bf 0b 00 01 00       	mov    $0x1000b,%edi
0261    70fa1:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
0266    70fa6:	4c 89 fa             	mov    %r15,%rdx
0269    70fa9:	e8 00 00 00 00       	call   70fae <__send_ipi_one+0x26e>	70faa: R_X86_64_PLT32	hv_tdx_hypercall-0x4
026e    70fae:	0f b7 93 20 03 00 00 	movzwl 0x320(%rbx),%edx
0275    70fb5:	8b 8b a8 0f 00 00    	mov    0xfa8(%rbx),%ecx
027b    70fbb:	e9 52 01 00 00       	jmp    71112 <__send_ipi_one+0x3d2>
0280    70fc0:	8b 3a                	mov    (%rdx),%edi
0282    70fc2:	e8 00 00 00 00       	call   70fc7 <__send_ipi_one+0x287>	70fc3: R_X86_64_PLT32	__msan_warning-0x4
0287    70fc7:	e9 7b fe ff ff       	jmp    70e47 <__send_ipi_one+0x107>
028c    70fcc:	8b 44 24 04          	mov    0x4(%rsp),%eax
0290    70fd0:	31 ff                	xor    %edi,%edi
0292    70fd2:	45 84 e4             	test   %r12b,%r12b
0295    70fd5:	74 02                	je     70fd9 <__send_ipi_one+0x299>
0297    70fd7:	8b 3a                	mov    (%rdx),%edi
0299    70fd9:	45 84 f6             	test   %r14b,%r14b
029c    70fdc:	0f 45 f8             	cmovne %eax,%edi
029f    70fdf:	e8 00 00 00 00       	call   70fe4 <__send_ipi_one+0x2a4>	70fe0: R_X86_64_PLT32	__msan_warning-0x4
02a4    70fe4:	40 84 ed             	test   %bpl,%bpl
02a7    70fe7:	75 9f                	jne    70f88 <__send_ipi_one+0x248>
02a9    70fe9:	c6 83 20 03 00 00 00 	movb   $0x0,0x320(%rbx)
02b0    70ff0:	e8 00 00 00 00       	call   70ff5 <__send_ipi_one+0x2b5>	70ff1: R_X86_64_PLT32	hv_isolation_type_snp-0x4
02b5    70ff5:	41 89 c4             	mov    %eax,%r12d
02b8    70ff8:	44 0f b6 b3 20 03 00 00 	movzbl 0x320(%rbx),%r14d
02c0    71000:	8b 83 a8 0f 00 00    	mov    0xfa8(%rbx),%eax
02c6    71006:	89 44 24 04          	mov    %eax,0x4(%rsp)
02ca    7100a:	0f b6 2d 00 00 00 00 	movzbl 0x0(%rip),%ebp        # 71011 <__send_ipi_one+0x2d1>	7100d: R_X86_64_PC32	hyperv_paravisor_present-0x4
02d1    71011:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	71014: R_X86_64_32S	hyperv_paravisor_present
02d8    71018:	e8 00 00 00 00       	call   7101d <__send_ipi_one+0x2dd>	71019: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
02dd    7101d:	48 89 e6             	mov    %rsp,%rsi
02e0    71020:	0f b6 00             	movzbl (%rax),%eax
02e3    71023:	84 c0                	test   %al,%al
02e5    71025:	0f 95 c1             	setne  %cl
02e8    71028:	f6 d0                	not    %al
02ea    7102a:	40 84 c5             	test   %al,%bpl
02ed    7102d:	0f 94 c0             	sete   %al
02f0    71030:	20 c8                	and    %cl,%al
02f2    71032:	40 84 ed             	test   %bpl,%bpl
02f5    71035:	40 0f 94 c5          	sete   %bpl
02f9    71039:	44 89 e1             	mov    %r12d,%ecx
02fc    7103c:	20 c1                	and    %al,%cl
02fe    7103e:	40 08 e8             	or     %bpl,%al
0301    71041:	0f b6 c0             	movzbl %al,%eax
0304    71044:	0f b6 c9             	movzbl %cl,%ecx
0307    71047:	45 84 f6             	test   %r14b,%r14b
030a    7104a:	0f 45 c8             	cmovne %eax,%ecx
030d    7104d:	44 20 e5             	and    %r12b,%bpl
0310    71050:	80 f9 01             	cmp    $0x1,%cl
0313    71053:	74 43                	je     71098 <__send_ipi_one+0x358>
0315    71055:	40 84 ed             	test   %bpl,%bpl
0318    71058:	74 65                	je     710bf <__send_ipi_one+0x37f>
031a    7105a:	45 85 ed             	test   %r13d,%r13d
031d    7105d:	0f 85 ef 00 00 00    	jne    71152 <__send_ipi_one+0x412>
0323    71063:	48 89 f4             	mov    %rsi,%rsp
0326    71066:	b9 0b 00 01 00       	mov    $0x1000b,%ecx
032b    7106b:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0330    71070:	4d 89 f8             	mov    %r15,%r8
0333    71073:	0f 01 d9             	vmmcall
0336    71076:	e9 8d 00 00 00       	jmp    71108 <__send_ipi_one+0x3c8>
033b    7107b:	8b bb a8 0f 00 00    	mov    0xfa8(%rbx),%edi
0341    71081:	e8 00 00 00 00       	call   71086 <__send_ipi_one+0x346>	71082: R_X86_64_PLT32	__msan_warning-0x4
0346    71086:	e9 02 fe ff ff       	jmp    70e8d <__send_ipi_one+0x14d>
034b    7108b:	8b 3c 24             	mov    (%rsp),%edi
034e    7108e:	e8 00 00 00 00       	call   71093 <__send_ipi_one+0x353>	7108f: R_X86_64_PLT32	__msan_warning-0x4
0353    71093:	e9 04 ff ff ff       	jmp    70f9c <__send_ipi_one+0x25c>
0358    71098:	8b 44 24 04          	mov    0x4(%rsp),%eax
035c    7109c:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
0361    710a1:	31 ff                	xor    %edi,%edi
0363    710a3:	45 84 e4             	test   %r12b,%r12b
0366    710a6:	74 02                	je     710aa <__send_ipi_one+0x36a>
0368    710a8:	8b 3a                	mov    (%rdx),%edi
036a    710aa:	45 84 f6             	test   %r14b,%r14b
036d    710ad:	0f 45 f8             	cmovne %eax,%edi
0370    710b0:	e8 00 00 00 00       	call   710b5 <__send_ipi_one+0x375>	710b1: R_X86_64_PLT32	__msan_warning-0x4
0375    710b5:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
037a    710ba:	40 84 ed             	test   %bpl,%bpl
037d    710bd:	75 9b                	jne    7105a <__send_ipi_one+0x31a>
037f    710bf:	49 89 f4             	mov    %rsi,%r12
0382    710c2:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 710c9 <__send_ipi_one+0x389>	710c5: R_X86_64_PC32	hv_hypercall_pg-0x4
0389    710c9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	710cc: R_X86_64_32S	hv_hypercall_pg
0390    710d0:	e8 00 00 00 00       	call   710d5 <__send_ipi_one+0x395>	710d1: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0395    710d5:	48 8b 28             	mov    (%rax),%rbp
0398    710d8:	8b 3a                	mov    (%rdx),%edi
039a    710da:	45 85 ed             	test   %r13d,%r13d
039d    710dd:	0f 85 82 00 00 00    	jne    71165 <__send_ipi_one+0x425>
03a3    710e3:	48 85 ed             	test   %rbp,%rbp
03a6    710e6:	4c 89 e0             	mov    %r12,%rax
03a9    710e9:	0f 85 89 00 00 00    	jne    71178 <__send_ipi_one+0x438>
03af    710ef:	4c 89 74 24 18       	mov    %r14,0x18(%rsp)
03b4    710f4:	48 89 c4             	mov    %rax,%rsp
03b7    710f7:	b9 0b 00 01 00       	mov    $0x1000b,%ecx
03bc    710fc:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
03c1    71101:	4d 89 f8             	mov    %r15,%r8
03c4    71104:	ff 54 24 18          	call   *0x18(%rsp)
03c8    71108:	48 89 e1             	mov    %rsp,%rcx
03cb    7110b:	48 89 cc             	mov    %rcx,%rsp
03ce    7110e:	31 d2                	xor    %edx,%edx
03d0    71110:	31 c9                	xor    %ecx,%ecx
03d2    71112:	0f b7 c0             	movzwl %ax,%eax
03d5    71115:	48 85 d2             	test   %rdx,%rdx
03d8    71118:	40 0f 95 c6          	setne  %sil
03dc    7111c:	f7 d2                	not    %edx
03de    7111e:	85 d0                	test   %edx,%eax
03e0    71120:	0f 94 c2             	sete   %dl
03e3    71123:	40 20 f2             	and    %sil,%dl
03e6    71126:	48 85 c0             	test   %rax,%rax
03e9    71129:	0f 94 c0             	sete   %al
03ec    7112c:	80 e2 01             	and    $0x1,%dl
03ef    7112f:	88 93 20 03 00 00    	mov    %dl,0x320(%rbx)
03f5    71135:	89 8b a8 0f 00 00    	mov    %ecx,0xfa8(%rbx)
03fb    7113b:	48 83 c4 20          	add    $0x20,%rsp
03ff    7113f:	5b                   	pop    %rbx
0400    71140:	41 5c                	pop    %r12
0402    71142:	41 5d                	pop    %r13
0404    71144:	41 5e                	pop    %r14
0406    71146:	41 5f                	pop    %r15
0408    71148:	5d                   	pop    %rbp
0409    71149:	31 c9                	xor    %ecx,%ecx
040b    7114b:	31 ff                	xor    %edi,%edi
040d    7114d:	31 d2                	xor    %edx,%edx
040f    7114f:	31 f6                	xor    %esi,%esi
0411    71151:	c3                   	ret
0412    71152:	8b 3c 24             	mov    (%rsp),%edi
0415    71155:	49 89 f6             	mov    %rsi,%r14
0418    71158:	e8 00 00 00 00       	call   7115d <__send_ipi_one+0x41d>	71159: R_X86_64_PLT32	__msan_warning-0x4
041d    7115d:	4c 89 f6             	mov    %r14,%rsi
0420    71160:	e9 fe fe ff ff       	jmp    71063 <__send_ipi_one+0x323>
0425    71165:	41 89 fd             	mov    %edi,%r13d
0428    71168:	8b 3c 24             	mov    (%rsp),%edi
042b    7116b:	e8 00 00 00 00       	call   71170 <__send_ipi_one+0x430>	7116c: R_X86_64_PLT32	__msan_warning-0x4
0430    71170:	44 89 ef             	mov    %r13d,%edi
0433    71173:	e9 6b ff ff ff       	jmp    710e3 <__send_ipi_one+0x3a3>
0438    71178:	e8 00 00 00 00       	call   7117d <__send_ipi_one+0x43d>	71179: R_X86_64_PLT32	__msan_warning-0x4
043d    7117d:	4c 89 e0             	mov    %r12,%rax
0440    71180:	e9 6a ff ff ff       	jmp    710ef <__send_ipi_one+0x3af>
0445    71185:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
