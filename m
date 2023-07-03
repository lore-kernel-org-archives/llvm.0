Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93925EAD0;
	Mon,  3 Jul 2023 13:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688391975; x=1719927975;
  h=date:from:cc:subject:message-id:mime-version;
  bh=8jjWZR4eEMn3Zi4S4r/z37QMIw7p5XMbOh3qF8QttZU=;
  b=jpMLo8gje6EqrTxRGT3mQn9z3Rkztv1BM2brGXv0wYDHipzxvHdHijec
   vKgnvfYDbzO84W+fK3640yQzHLLnROnL6ck1Mew8I5Nnn/GUKk+pgcXfi
   pX3XHmm1uqRgvOiMVXYarQpTwGUVc7oGfmoJ14fQpb5BaQFPukww7Dnp+
   Y31kIgCM5pNLDlIGOtEVqOQG51klw0L6Hb9GBUHf9G8bm2vCFI1tfZ5Nz
   ohF4PJejy/UFhmRaqBfvjxJtMrpnUMbC5roI/L2e6zPiLxGbOxy2hNeWW
   DgW3XXRgvioVbwzQzCUQjasvmOxbgYguWogTVi0NfJ9O7FAMExI6UCrl9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="347671923"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="347671923"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 06:46:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="965194581"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="965194581"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Jul 2023 06:46:12 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGJsZ-000HOl-0Q;
	Mon, 03 Jul 2023 13:46:11 +0000
Date: Mon, 3 Jul 2023 21:45:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: arch/x86/mm/fault.o: warning: objtool: do_user_addr_fault+0x860:
 __stack_chk_fail() is missing a __noreturn annotation
Message-ID: <202307032151.QlCffvjL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Miroslav Benes <mbenes@suse.cz>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a901a3568fd26ca9c4a82d8bc5ed5b3ed844d451
commit: fedb724c3db5490234ddde0103811c28c2fedae0 objtool: Detect missing __noreturn annotations
date:   7 weeks ago
config: x86_64-randconfig-r026-20230703 (https://download.01.org/0day-ci/archive/20230703/202307032151.QlCffvjL-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307032151.QlCffvjL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307032151.QlCffvjL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/fault.o: warning: objtool: do_user_addr_fault+0x860: __stack_chk_fail() is missing a __noreturn annotation


objdump-func vmlinux.o do_user_addr_fault:
0000 0000000000124a80 <do_user_addr_fault>:
0000   124a80:	55                   	push   %rbp
0001   124a81:	48 89 e5             	mov    %rsp,%rbp
0004   124a84:	41 57                	push   %r15
0006   124a86:	41 56                	push   %r14
0008   124a88:	41 55                	push   %r13
000a   124a8a:	41 54                	push   %r12
000c   124a8c:	53                   	push   %rbx
000d   124a8d:	48 83 ec 58          	sub    $0x58,%rsp
0011   124a91:	49 89 d5             	mov    %rdx,%r13
0014   124a94:	49 89 f7             	mov    %rsi,%r15
0017   124a97:	49 89 fe             	mov    %rdi,%r14
001a   124a9a:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0023   124aa3:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
0027   124aa7:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
0031   124ab1:	e8 00 00 00 00       	call   124ab6 <do_user_addr_fault+0x36>	124ab2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0036   124ab6:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 124abd <do_user_addr_fault+0x3d>	124ab9: R_X86_64_PC32	pcpu_hot-0x4
003d   124abd:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
0041   124ac1:	48 8d 98 18 04 00 00 	lea    0x418(%rax),%rbx
0048   124ac8:	48 89 d8             	mov    %rbx,%rax
004b   124acb:	48 c1 e8 03          	shr    $0x3,%rax
004f   124acf:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0054   124ad4:	74 08                	je     124ade <do_user_addr_fault+0x5e>
0056   124ad6:	48 89 df             	mov    %rbx,%rdi
0059   124ad9:	e8 00 00 00 00       	call   124ade <do_user_addr_fault+0x5e>	124ada: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
005e   124ade:	48 8b 03             	mov    (%rbx),%rax
0061   124ae1:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
0065   124ae5:	44 89 fb             	mov    %r15d,%ebx
0068   124ae8:	83 e3 14             	and    $0x14,%ebx
006b   124aeb:	31 f6                	xor    %esi,%esi
006d   124aed:	48 83 fb 10          	cmp    $0x10,%rbx
0071   124af1:	40 0f 94 c6          	sete   %sil
0075   124af5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	124af8: R_X86_64_32S	_ftrace_annotated_branch+0x19140
007c   124afc:	31 d2                	xor    %edx,%edx
007e   124afe:	31 c9                	xor    %ecx,%ecx
0080   124b00:	e8 00 00 00 00       	call   124b05 <do_user_addr_fault+0x85>	124b01: R_X86_64_PLT32	ftrace_likely_update-0x4
0085   124b05:	48 83 fb 10          	cmp    $0x10,%rbx
0089   124b09:	75 77                	jne    124b82 <do_user_addr_fault+0x102>
008b   124b0b:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	124b0e: R_X86_64_32S	boot_cpu_data+0x1
0092   124b12:	48 c1 e8 03          	shr    $0x3,%rax
0096   124b16:	42 8a 04 20          	mov    (%rax,%r12,1),%al
009a   124b1a:	84 c0                	test   %al,%al
009c   124b1c:	0f 85 f0 06 00 00    	jne    125212 <do_user_addr_fault+0x792>
00a2   124b22:	80 3d 00 00 00 00 02 	cmpb   $0x2,0x0(%rip)        # 124b29 <do_user_addr_fault+0xa9>	124b24: R_X86_64_PC32	boot_cpu_data-0x4
00a9   124b29:	0f 85 c4 00 00 00    	jne    124bf3 <do_user_addr_fault+0x173>
00af   124b2f:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	124b32: R_X86_64_32S	boot_cpu_data
00b6   124b36:	48 c1 e8 03          	shr    $0x3,%rax
00ba   124b3a:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
00bf   124b3f:	0f 85 f0 06 00 00    	jne    125235 <do_user_addr_fault+0x7b5>
00c5   124b45:	80 3d 00 00 00 00 0f 	cmpb   $0xf,0x0(%rip)        # 124b4c <do_user_addr_fault+0xcc>	124b47: R_X86_64_PC32	boot_cpu_data-0x5
00cc   124b4c:	0f 85 fe 00 00 00    	jne    124c50 <do_user_addr_fault+0x1d0>
00d2   124b52:	49 8d 9e 88 00 00 00 	lea    0x88(%r14),%rbx
00d9   124b59:	48 89 d8             	mov    %rbx,%rax
00dc   124b5c:	48 c1 e8 03          	shr    $0x3,%rax
00e0   124b60:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
00e5   124b65:	74 08                	je     124b6f <do_user_addr_fault+0xef>
00e7   124b67:	48 89 df             	mov    %rbx,%rdi
00ea   124b6a:	e8 00 00 00 00       	call   124b6f <do_user_addr_fault+0xef>	124b6b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00ef   124b6f:	f6 03 03             	testb  $0x3,(%rbx)
00f2   124b72:	0f 84 b1 02 00 00    	je     124e29 <do_user_addr_fault+0x3a9>
00f8   124b78:	e8 00 00 00 00       	call   124b7d <do_user_addr_fault+0xfd>	124b79: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00fd   124b7d:	e9 70 03 00 00       	jmp    124ef2 <do_user_addr_fault+0x472>
0102   124b82:	49 8d 86 88 00 00 00 	lea    0x88(%r14),%rax
0109   124b89:	48 89 c1             	mov    %rax,%rcx
010c   124b8c:	48 c1 e9 03          	shr    $0x3,%rcx
0110   124b90:	48 89 4d 88          	mov    %rcx,-0x78(%rbp)
0114   124b94:	42 80 3c 21 00       	cmpb   $0x0,(%rcx,%r12,1)
0119   124b99:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
011d   124b9d:	74 0d                	je     124bac <do_user_addr_fault+0x12c>
011f   124b9f:	48 8b 7d b0          	mov    -0x50(%rbp),%rdi
0123   124ba3:	e8 00 00 00 00       	call   124ba8 <do_user_addr_fault+0x128>	124ba4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0128   124ba8:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
012c   124bac:	f6 00 03             	testb  $0x3,(%rax)
012f   124baf:	0f 84 80 00 00 00    	je     124c35 <do_user_addr_fault+0x1b5>
0135   124bb5:	e8 00 00 00 00       	call   124bba <do_user_addr_fault+0x13a>	124bb6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
013a   124bba:	31 c0                	xor    %eax,%eax
013c   124bbc:	0f b6 d8             	movzbl %al,%ebx
013f   124bbf:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	124bc2: R_X86_64_32S	_ftrace_annotated_branch+0x19170
0146   124bc6:	89 de                	mov    %ebx,%esi
0148   124bc8:	31 d2                	xor    %edx,%edx
014a   124bca:	31 c9                	xor    %ecx,%ecx
014c   124bcc:	e8 00 00 00 00       	call   124bd1 <do_user_addr_fault+0x151>	124bcd: R_X86_64_PLT32	ftrace_likely_update-0x4
0151   124bd1:	84 db                	test   %bl,%bl
0153   124bd3:	74 28                	je     124bfd <do_user_addr_fault+0x17d>
0155   124bd5:	e8 00 00 00 00       	call   124bda <do_user_addr_fault+0x15a>	124bd6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
015a   124bda:	0f 0b                	ud2
015c   124bdc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	124bdf: R_X86_64_32S	_ftrace_annotated_branch+0x191a0
0163   124be3:	89 de                	mov    %ebx,%esi
0165   124be5:	31 d2                	xor    %edx,%edx
0167   124be7:	31 c9                	xor    %ecx,%ecx
0169   124be9:	e8 00 00 00 00       	call   124bee <do_user_addr_fault+0x16e>	124bea: R_X86_64_PLT32	ftrace_likely_update-0x4
016e   124bee:	e9 0d 03 00 00       	jmp    124f00 <do_user_addr_fault+0x480>
0173   124bf3:	e8 00 00 00 00       	call   124bf8 <do_user_addr_fault+0x178>	124bf4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0178   124bf8:	e9 f5 02 00 00       	jmp    124ef2 <do_user_addr_fault+0x472>
017d   124bfd:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	124c00: R_X86_64_32S	_ftrace_annotated_branch+0x191a0
0184   124c04:	89 de                	mov    %ebx,%esi
0186   124c06:	31 d2                	xor    %edx,%edx
0188   124c08:	31 c9                	xor    %ecx,%ecx
018a   124c0a:	e8 00 00 00 00       	call   124c0f <do_user_addr_fault+0x18f>	124c0b: R_X86_64_PLT32	ftrace_likely_update-0x4
018f   124c0f:	44 89 fb             	mov    %r15d,%ebx
0192   124c12:	c1 eb 03             	shr    $0x3,%ebx
0195   124c15:	83 e3 01             	and    $0x1,%ebx
0198   124c18:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	124c1b: R_X86_64_32S	_ftrace_annotated_branch+0x191d0
019f   124c1f:	89 de                	mov    %ebx,%esi
01a1   124c21:	31 d2                	xor    %edx,%edx
01a3   124c23:	31 c9                	xor    %ecx,%ecx
01a5   124c25:	e8 00 00 00 00       	call   124c2a <do_user_addr_fault+0x1aa>	124c26: R_X86_64_PLT32	ftrace_likely_update-0x4
01aa   124c2a:	85 db                	test   %ebx,%ebx
01ac   124c2c:	75 2c                	jne    124c5a <do_user_addr_fault+0x1da>
01ae   124c2e:	e8 00 00 00 00       	call   124c33 <do_user_addr_fault+0x1b3>	124c2f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01b3   124c33:	eb 38                	jmp    124c6d <do_user_addr_fault+0x1ed>
01b5   124c35:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 124c3b <do_user_addr_fault+0x1bb>	124c37: R_X86_64_PC32	pcpu_hot+0x4
01bb   124c3b:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
01c0   124c40:	0f 84 aa 00 00 00    	je     124cf0 <do_user_addr_fault+0x270>
01c6   124c46:	e8 00 00 00 00       	call   124c4b <do_user_addr_fault+0x1cb>	124c47: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01cb   124c4b:	e9 ea 00 00 00       	jmp    124d3a <do_user_addr_fault+0x2ba>
01d0   124c50:	e8 00 00 00 00       	call   124c55 <do_user_addr_fault+0x1d5>	124c51: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01d5   124c55:	e9 98 02 00 00       	jmp    124ef2 <do_user_addr_fault+0x472>
01da   124c5a:	e8 00 00 00 00       	call   124c5f <do_user_addr_fault+0x1df>	124c5b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01df   124c5f:	4c 89 f7             	mov    %r14,%rdi
01e2   124c62:	4c 89 fe             	mov    %r15,%rsi
01e5   124c65:	4c 89 ea             	mov    %r13,%rdx
01e8   124c68:	e8 83 2f 00 00       	call   127bf0 <pgtable_bad>
01ed   124c6d:	48 8b 5d a0          	mov    -0x60(%rbp),%rbx
01f1   124c71:	e9 00 00 00 00       	jmp    124c76 <do_user_addr_fault+0x1f6>	124c72: R_X86_64_PLT32	.altinstr_aux+0x10ca
01f6   124c76:	e8 00 00 00 00       	call   124c7b <do_user_addr_fault+0x1fb>	124c77: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01fb   124c7b:	41 f6 c7 04          	test   $0x4,%r15b
01ff   124c7f:	75 53                	jne    124cd4 <do_user_addr_fault+0x254>
0201   124c81:	49 8d 9e 90 00 00 00 	lea    0x90(%r14),%rbx
0208   124c88:	48 89 d8             	mov    %rbx,%rax
020b   124c8b:	48 c1 e8 03          	shr    $0x3,%rax
020f   124c8f:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0214   124c94:	74 08                	je     124c9e <do_user_addr_fault+0x21e>
0216   124c96:	48 89 df             	mov    %rbx,%rdi
0219   124c99:	e8 00 00 00 00       	call   124c9e <do_user_addr_fault+0x21e>	124c9a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
021e   124c9e:	48 8b 1b             	mov    (%rbx),%rbx
0221   124ca1:	81 e3 00 00 04 00    	and    $0x40000,%ebx
0227   124ca7:	48 89 de             	mov    %rbx,%rsi
022a   124caa:	48 c1 ee 12          	shr    $0x12,%rsi
022e   124cae:	83 f6 01             	xor    $0x1,%esi
0231   124cb1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	124cb4: R_X86_64_32S	_ftrace_annotated_branch+0x19200
0238   124cb8:	31 d2                	xor    %edx,%edx
023a   124cba:	31 c9                	xor    %ecx,%ecx
023c   124cbc:	e8 00 00 00 00       	call   124cc1 <do_user_addr_fault+0x241>	124cbd: R_X86_64_PLT32	ftrace_likely_update-0x4
0241   124cc1:	48 85 db             	test   %rbx,%rbx
0244   124cc4:	0f 85 a8 00 00 00    	jne    124d72 <do_user_addr_fault+0x2f2>
024a   124cca:	e8 00 00 00 00       	call   124ccf <do_user_addr_fault+0x24f>	124ccb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
024f   124ccf:	e9 1e 02 00 00       	jmp    124ef2 <do_user_addr_fault+0x472>
0254   124cd4:	e8 00 00 00 00       	call   124cd9 <do_user_addr_fault+0x259>	124cd5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0259   124cd9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	124cdc: R_X86_64_32S	_ftrace_annotated_branch+0x19200
0260   124ce0:	31 f6                	xor    %esi,%esi
0262   124ce2:	31 d2                	xor    %edx,%edx
0264   124ce4:	31 c9                	xor    %ecx,%ecx
0266   124ce6:	e8 00 00 00 00       	call   124ceb <do_user_addr_fault+0x26b>	124ce7: R_X86_64_PLT32	ftrace_likely_update-0x4
026b   124ceb:	e9 8b 00 00 00       	jmp    124d7b <do_user_addr_fault+0x2fb>
0270   124cf0:	48 8d 5d c8          	lea    -0x38(%rbp),%rbx
0274   124cf4:	48 c1 eb 03          	shr    $0x3,%rbx
0278   124cf8:	42 80 3c 23 00       	cmpb   $0x0,(%rbx,%r12,1)
027d   124cfd:	74 09                	je     124d08 <do_user_addr_fault+0x288>
027f   124cff:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
0283   124d03:	e8 00 00 00 00       	call   124d08 <do_user_addr_fault+0x288>	124d04: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0288   124d08:	48 b8 aa aa aa aa aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaaa,%rax
0292   124d12:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
0296   124d16:	9c                   	pushf
0297   124d17:	8f 45 c8             	pop    -0x38(%rbp)
029a   124d1a:	42 80 3c 23 00       	cmpb   $0x0,(%rbx,%r12,1)
029f   124d1f:	74 09                	je     124d2a <do_user_addr_fault+0x2aa>
02a1   124d21:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
02a5   124d25:	e8 00 00 00 00       	call   124d2a <do_user_addr_fault+0x2aa>	124d26: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02aa   124d2a:	0f ba 65 c8 09       	btl    $0x9,-0x38(%rbp)
02af   124d2f:	0f 82 84 01 00 00    	jb     124eb9 <do_user_addr_fault+0x439>
02b5   124d35:	e8 00 00 00 00       	call   124d3a <do_user_addr_fault+0x2ba>	124d36: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02ba   124d3a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	124d3d: R_X86_64_32S	.rodata+0x59f20
02c1   124d41:	e8 00 00 00 00       	call   124d46 <do_user_addr_fault+0x2c6>	124d42: R_X86_64_PLT32	__this_cpu_preempt_check-0x4
02c6   124d46:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 124d4d <do_user_addr_fault+0x2cd>	124d49: R_X86_64_PC32	current_kprobe-0x4
02cd   124d4d:	48 85 c0             	test   %rax,%rax
02d0   124d50:	0f 84 c9 00 00 00    	je     124e1f <do_user_addr_fault+0x39f>
02d6   124d56:	e8 00 00 00 00       	call   124d5b <do_user_addr_fault+0x2db>	124d57: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02db   124d5b:	4c 89 f7             	mov    %r14,%rdi
02de   124d5e:	be 0e 00 00 00       	mov    $0xe,%esi
02e3   124d63:	e8 00 00 00 00       	call   124d68 <do_user_addr_fault+0x2e8>	124d64: R_X86_64_PLT32	kprobe_fault_handler-0x4
02e8   124d68:	85 c0                	test   %eax,%eax
02ea   124d6a:	0f 95 c0             	setne  %al
02ed   124d6d:	e9 4a fe ff ff       	jmp    124bbc <do_user_addr_fault+0x13c>
02f2   124d72:	e8 00 00 00 00       	call   124d77 <do_user_addr_fault+0x2f7>	124d73: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02f7   124d77:	48 8b 5d a0          	mov    -0x60(%rbp),%rbx
02fb   124d7b:	48 81 c3 34 24 00 00 	add    $0x2434,%rbx
0302   124d82:	48 89 d8             	mov    %rbx,%rax
0305   124d85:	48 c1 e8 03          	shr    $0x3,%rax
0309   124d89:	42 8a 04 20          	mov    (%rax,%r12,1),%al
030d   124d8d:	84 c0                	test   %al,%al
030f   124d8f:	0f 85 b7 04 00 00    	jne    12524c <do_user_addr_fault+0x7cc>
0315   124d95:	83 3b 00             	cmpl   $0x0,(%rbx)
0318   124d98:	0f 85 55 04 00 00    	jne    1251f3 <do_user_addr_fault+0x773>
031e   124d9e:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 124da4 <do_user_addr_fault+0x324>	124da0: R_X86_64_PC32	pcpu_hot+0x4
0324   124da4:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
0329   124da9:	0f 95 c0             	setne  %al
032c   124dac:	48 83 7d a8 00       	cmpq   $0x0,-0x58(%rbp)
0331   124db1:	0f 94 c1             	sete   %cl
0334   124db4:	08 c1                	or     %al,%cl
0336   124db6:	0f b6 d9             	movzbl %cl,%ebx
0339   124db9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	124dbc: R_X86_64_32S	_ftrace_annotated_branch+0x19230
0340   124dc0:	89 de                	mov    %ebx,%esi
0342   124dc2:	31 d2                	xor    %edx,%edx
0344   124dc4:	31 c9                	xor    %ecx,%ecx
0346   124dc6:	e8 00 00 00 00       	call   124dcb <do_user_addr_fault+0x34b>	124dc7: R_X86_64_PLT32	ftrace_likely_update-0x4
034b   124dcb:	80 fb 01             	cmp    $0x1,%bl
034e   124dce:	75 18                	jne    124de8 <do_user_addr_fault+0x368>
0350   124dd0:	e8 00 00 00 00       	call   124dd5 <do_user_addr_fault+0x355>	124dd1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0355   124dd5:	4c 89 f7             	mov    %r14,%rdi
0358   124dd8:	4c 89 fe             	mov    %r15,%rsi
035b   124ddb:	4c 89 ea             	mov    %r13,%rdx
035e   124dde:	e8 1d 0d 00 00       	call   125b00 <bad_area_nosemaphore>
0363   124de3:	e9 18 01 00 00       	jmp    124f00 <do_user_addr_fault+0x480>
0368   124de8:	48 8b 45 88          	mov    -0x78(%rbp),%rax
036c   124dec:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0371   124df1:	48 8b 5d b0          	mov    -0x50(%rbp),%rbx
0375   124df5:	74 08                	je     124dff <do_user_addr_fault+0x37f>
0377   124df7:	48 89 df             	mov    %rbx,%rdi
037a   124dfa:	e8 00 00 00 00       	call   124dff <do_user_addr_fault+0x37f>	124dfb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
037f   124dff:	f6 03 03             	testb  $0x3,(%rbx)
0382   124e02:	0f 84 bb 00 00 00    	je     124ec3 <do_user_addr_fault+0x443>
0388   124e08:	e8 00 00 00 00       	call   124e0d <do_user_addr_fault+0x38d>	124e09: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
038d   124e0d:	e8 00 00 00 00       	call   124e12 <do_user_addr_fault+0x392>	124e0e: R_X86_64_PLT32	trace_hardirqs_on-0x4
0392   124e12:	fb                   	sti
0393   124e13:	c7 45 c4 54 02 00 00 	movl   $0x254,-0x3c(%rbp)
039a   124e1a:	e9 15 01 00 00       	jmp    124f34 <do_user_addr_fault+0x4b4>
039f   124e1f:	e8 00 00 00 00       	call   124e24 <do_user_addr_fault+0x3a4>	124e20: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03a4   124e24:	e9 91 fd ff ff       	jmp    124bba <do_user_addr_fault+0x13a>
03a9   124e29:	4c 89 e0             	mov    %r12,%rax
03ac   124e2c:	4d 8d a6 80 00 00 00 	lea    0x80(%r14),%r12
03b3   124e33:	4c 89 e3             	mov    %r12,%rbx
03b6   124e36:	48 c1 eb 03          	shr    $0x3,%rbx
03ba   124e3a:	80 3c 03 00          	cmpb   $0x0,(%rbx,%rax,1)
03be   124e3e:	74 08                	je     124e48 <do_user_addr_fault+0x3c8>
03c0   124e40:	4c 89 e7             	mov    %r12,%rdi
03c3   124e43:	e8 00 00 00 00       	call   124e48 <do_user_addr_fault+0x3c8>	124e44: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03c8   124e48:	4c 89 e8             	mov    %r13,%rax
03cb   124e4b:	48 c1 e8 20          	shr    $0x20,%rax
03cf   124e4f:	0f 85 98 00 00 00    	jne    124eed <do_user_addr_fault+0x46d>
03d5   124e55:	4d 39 2c 24          	cmp    %r13,(%r12)
03d9   124e59:	0f 85 8e 00 00 00    	jne    124eed <do_user_addr_fault+0x46d>
03df   124e5f:	4c 89 75 b8          	mov    %r14,-0x48(%rbp)
03e3   124e63:	4c 89 e8             	mov    %r13,%rax
03e6   124e66:	49 bd 00 00 00 00 ff ff ff ff 	movabs $0xffffffff00000000,%r13
03f0   124e70:	49 89 c6             	mov    %rax,%r14
03f3   124e73:	49 09 c5             	or     %rax,%r13
03f6   124e76:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	124e79: R_X86_64_32S	_stext
03fd   124e7d:	49 39 c5             	cmp    %rax,%r13
0400   124e80:	0f 93 c0             	setae  %al
0403   124e83:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	124e86: R_X86_64_32S	_etext
040a   124e8a:	49 39 cd             	cmp    %rcx,%r13
040d   124e8d:	0f 96 c1             	setbe  %cl
0410   124e90:	84 c8                	test   %cl,%al
0412   124e92:	0f 85 71 02 00 00    	jne    125109 <do_user_addr_fault+0x689>
0418   124e98:	49 8d 85 00 00 00 60 	lea    0x60000000(%r13),%rax
041f   124e9f:	48 3d 01 00 00 5e    	cmp    $0x5e000001,%rax
0425   124ea5:	0f 82 5e 02 00 00    	jb     125109 <do_user_addr_fault+0x689>
042b   124eab:	e8 00 00 00 00       	call   124eb0 <do_user_addr_fault+0x430>	124eac: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0430   124eb0:	4d 89 f5             	mov    %r14,%r13
0433   124eb3:	4c 8b 75 b8          	mov    -0x48(%rbp),%r14
0437   124eb7:	eb 39                	jmp    124ef2 <do_user_addr_fault+0x472>
0439   124eb9:	e8 00 00 00 00       	call   124ebe <do_user_addr_fault+0x43e>	124eba: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
043e   124ebe:	e9 f7 fc ff ff       	jmp    124bba <do_user_addr_fault+0x13a>
0443   124ec3:	49 8d 9e 90 00 00 00 	lea    0x90(%r14),%rbx
044a   124eca:	48 89 d8             	mov    %rbx,%rax
044d   124ecd:	48 c1 e8 03          	shr    $0x3,%rax
0451   124ed1:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0456   124ed6:	74 08                	je     124ee0 <do_user_addr_fault+0x460>
0458   124ed8:	48 89 df             	mov    %rbx,%rdi
045b   124edb:	e8 00 00 00 00       	call   124ee0 <do_user_addr_fault+0x460>	124edc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0460   124ee0:	f6 43 01 02          	testb  $0x2,0x1(%rbx)
0464   124ee4:	75 3c                	jne    124f22 <do_user_addr_fault+0x4a2>
0466   124ee6:	e8 00 00 00 00       	call   124eeb <do_user_addr_fault+0x46b>	124ee7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
046b   124eeb:	eb 40                	jmp    124f2d <do_user_addr_fault+0x4ad>
046d   124eed:	e8 00 00 00 00       	call   124ef2 <do_user_addr_fault+0x472>	124eee: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0472   124ef2:	4c 89 f7             	mov    %r14,%rdi
0475   124ef5:	4c 89 fe             	mov    %r15,%rsi
0478   124ef8:	4c 89 ea             	mov    %r13,%rdx
047b   124efb:	e8 f0 10 00 00       	call   125ff0 <page_fault_oops>
0480   124f00:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0489   124f09:	48 3b 45 d0          	cmp    -0x30(%rbp),%rax
048d   124f0d:	0f 85 c8 03 00 00    	jne    1252db <do_user_addr_fault+0x85b>
0493   124f13:	48 83 c4 58          	add    $0x58,%rsp
0497   124f17:	5b                   	pop    %rbx
0498   124f18:	41 5c                	pop    %r12
049a   124f1a:	41 5d                	pop    %r13
049c   124f1c:	41 5e                	pop    %r14
049e   124f1e:	41 5f                	pop    %r15
04a0   124f20:	5d                   	pop    %rbp
04a1   124f21:	c3                   	ret
04a2   124f22:	e8 00 00 00 00       	call   124f27 <do_user_addr_fault+0x4a7>	124f23: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04a7   124f27:	e8 00 00 00 00       	call   124f2c <do_user_addr_fault+0x4ac>	124f28: R_X86_64_PLT32	trace_hardirqs_on-0x4
04ac   124f2c:	fb                   	sti
04ad   124f2d:	c7 45 c4 14 02 00 00 	movl   $0x214,-0x3c(%rbp)
04b4   124f34:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	124f37: R_X86_64_32S	perf_swevent_enabled+0x8
04bb   124f3b:	48 c1 e8 03          	shr    $0x3,%rax
04bf   124f3f:	42 8a 04 20          	mov    (%rax,%r12,1),%al
04c3   124f43:	84 c0                	test   %al,%al
04c5   124f45:	0f 85 1e 03 00 00    	jne    125269 <do_user_addr_fault+0x7e9>
04cb   124f4b:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 124f52 <do_user_addr_fault+0x4d2>	124f4d: R_X86_64_PC32	perf_swevent_enabled+0x3
04d2   124f52:	7e 1c                	jle    124f70 <do_user_addr_fault+0x4f0>
04d4   124f54:	e8 00 00 00 00       	call   124f59 <do_user_addr_fault+0x4d9>	124f55: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04d9   124f59:	be 01 00 00 00       	mov    $0x1,%esi
04de   124f5e:	bf 02 00 00 00       	mov    $0x2,%edi
04e3   124f63:	4c 89 f2             	mov    %r14,%rdx
04e6   124f66:	4c 89 e9             	mov    %r13,%rcx
04e9   124f69:	e8 00 00 00 00       	call   124f6e <do_user_addr_fault+0x4ee>	124f6a: R_X86_64_PLT32	__perf_sw_event-0x4
04ee   124f6e:	eb 05                	jmp    124f75 <do_user_addr_fault+0x4f5>
04f0   124f70:	e8 00 00 00 00       	call   124f75 <do_user_addr_fault+0x4f5>	124f71: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04f5   124f75:	4c 89 eb             	mov    %r13,%rbx
04f8   124f78:	48 81 e3 00 f0 ff ff 	and    $0xfffffffffffff000,%rbx
04ff   124f7f:	31 f6                	xor    %esi,%esi
0501   124f81:	48 81 fb 00 00 60 ff 	cmp    $0xffffffffff600000,%rbx
0508   124f88:	40 0f 94 c6          	sete   %sil
050c   124f8c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	124f8f: R_X86_64_32S	_ftrace_annotated_branch+0x18f90
0513   124f93:	31 d2                	xor    %edx,%edx
0515   124f95:	31 c9                	xor    %ecx,%ecx
0517   124f97:	e8 00 00 00 00       	call   124f9c <do_user_addr_fault+0x51c>	124f98: R_X86_64_PLT32	ftrace_likely_update-0x4
051c   124f9c:	48 81 fb 00 00 60 ff 	cmp    $0xffffffffff600000,%rbx
0523   124fa3:	4c 89 6d 90          	mov    %r13,-0x70(%rbp)
0527   124fa7:	75 1c                	jne    124fc5 <do_user_addr_fault+0x545>
0529   124fa9:	4c 89 ff             	mov    %r15,%rdi
052c   124fac:	4c 89 f6             	mov    %r14,%rsi
052f   124faf:	4c 89 ea             	mov    %r13,%rdx
0532   124fb2:	e8 00 00 00 00       	call   124fb7 <do_user_addr_fault+0x537>	124fb3: R_X86_64_PLT32	emulate_vsyscall-0x4
0537   124fb7:	84 c0                	test   %al,%al
0539   124fb9:	74 11                	je     124fcc <do_user_addr_fault+0x54c>
053b   124fbb:	e8 00 00 00 00       	call   124fc0 <do_user_addr_fault+0x540>	124fbc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0540   124fc0:	e9 3b ff ff ff       	jmp    124f00 <do_user_addr_fault+0x480>
0545   124fc5:	e8 00 00 00 00       	call   124fca <do_user_addr_fault+0x54a>	124fc6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
054a   124fca:	eb 05                	jmp    124fd1 <do_user_addr_fault+0x551>
054c   124fcc:	e8 00 00 00 00       	call   124fd1 <do_user_addr_fault+0x551>	124fcd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0551   124fd1:	4c 89 7d 98          	mov    %r15,-0x68(%rbp)
0555   124fd5:	45 89 fd             	mov    %r15d,%r13d
0558   124fd8:	41 83 e5 02          	and    $0x2,%r13d
055c   124fdc:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	124fdf: R_X86_64_32S	__tracepoint_mmap_lock_start_locking+0x8
0563   124fe3:	48 c1 e8 03          	shr    $0x3,%rax
0567   124fe7:	42 8a 04 20          	mov    (%rax,%r12,1),%al
056b   124feb:	84 c0                	test   %al,%al
056d   124fed:	0f 85 9c 02 00 00    	jne    12528f <do_user_addr_fault+0x80f>
0573   124ff3:	49 d1 ed             	shr    %r13
0576   124ff6:	41 83 e7 10          	and    $0x10,%r15d
057a   124ffa:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 125001 <do_user_addr_fault+0x581>	124ffc: R_X86_64_PC32	__tracepoint_mmap_lock_start_locking+0x3
0581   125001:	4c 89 75 b8          	mov    %r14,-0x48(%rbp)
0585   125005:	7e 15                	jle    12501c <do_user_addr_fault+0x59c>
0587   125007:	e8 00 00 00 00       	call   12500c <do_user_addr_fault+0x58c>	125008: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
058c   12500c:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
0590   125010:	48 89 df             	mov    %rbx,%rdi
0593   125013:	31 f6                	xor    %esi,%esi
0595   125015:	e8 00 00 00 00       	call   12501a <do_user_addr_fault+0x59a>	125016: R_X86_64_PLT32	__mmap_lock_do_trace_start_locking-0x4
059a   12501a:	eb 09                	jmp    125025 <do_user_addr_fault+0x5a5>
059c   12501c:	e8 00 00 00 00       	call   125021 <do_user_addr_fault+0x5a1>	12501d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05a1   125021:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
05a5   125025:	41 c1 e7 04          	shl    $0x4,%r15d
05a9   125029:	48 8d bb e8 00 00 00 	lea    0xe8(%rbx),%rdi
05b0   125030:	48 89 7d 80          	mov    %rdi,-0x80(%rbp)
05b4   125034:	e8 00 00 00 00       	call   125039 <do_user_addr_fault+0x5b9>	125035: R_X86_64_PLT32	down_read_trylock-0x4
05b9   125039:	41 89 c6             	mov    %eax,%r14d
05bc   12503c:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	12503f: R_X86_64_32S	__tracepoint_mmap_lock_acquire_returned+0x8
05c3   125043:	48 c1 e8 03          	shr    $0x3,%rax
05c7   125047:	42 8a 04 20          	mov    (%rax,%r12,1),%al
05cb   12504b:	84 c0                	test   %al,%al
05cd   12504d:	0f 85 62 02 00 00    	jne    1252b5 <do_user_addr_fault+0x835>
05d3   125053:	45 09 ef             	or     %r13d,%r15d
05d6   125056:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 12505d <do_user_addr_fault+0x5dd>	125058: R_X86_64_PC32	__tracepoint_mmap_lock_acquire_returned+0x3
05dd   12505d:	7e 1c                	jle    12507b <do_user_addr_fault+0x5fb>
05df   12505f:	31 db                	xor    %ebx,%ebx
05e1   125061:	45 85 f6             	test   %r14d,%r14d
05e4   125064:	0f 95 c3             	setne  %bl
05e7   125067:	e8 00 00 00 00       	call   12506c <do_user_addr_fault+0x5ec>	125068: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05ec   12506c:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
05f0   125070:	31 f6                	xor    %esi,%esi
05f2   125072:	89 da                	mov    %ebx,%edx
05f4   125074:	e8 00 00 00 00       	call   125079 <do_user_addr_fault+0x5f9>	125075: R_X86_64_PLT32	__mmap_lock_do_trace_acquire_returned-0x4
05f9   125079:	eb 05                	jmp    125080 <do_user_addr_fault+0x600>
05fb   12507b:	e8 00 00 00 00       	call   125080 <do_user_addr_fault+0x600>	12507c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0600   125080:	4c 8b 6d 90          	mov    -0x70(%rbp),%r13
0604   125084:	44 0b 7d c4          	or     -0x3c(%rbp),%r15d
0608   125088:	44 89 7d c4          	mov    %r15d,-0x3c(%rbp)
060c   12508c:	31 f6                	xor    %esi,%esi
060e   12508e:	45 85 f6             	test   %r14d,%r14d
0611   125091:	40 0f 94 c6          	sete   %sil
0615   125095:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	125098: R_X86_64_32S	_ftrace_annotated_branch+0x19260
061c   12509c:	31 d2                	xor    %edx,%edx
061e   12509e:	31 c9                	xor    %ecx,%ecx
0620   1250a0:	e8 00 00 00 00       	call   1250a5 <do_user_addr_fault+0x625>	1250a1: R_X86_64_PLT32	ftrace_likely_update-0x4
0625   1250a5:	45 85 f6             	test   %r14d,%r14d
0628   1250a8:	74 28                	je     1250d2 <do_user_addr_fault+0x652>
062a   1250aa:	e8 00 00 00 00       	call   1250af <do_user_addr_fault+0x62f>	1250ab: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
062f   1250af:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1250b2: R_X86_64_32S	.rodata+0x59e00
0636   1250b6:	be 76 05 00 00       	mov    $0x576,%esi
063b   1250bb:	e8 00 00 00 00       	call   1250c0 <do_user_addr_fault+0x640>	1250bc: R_X86_64_PLT32	__might_sleep-0x4
0640   1250c0:	e8 00 00 00 00       	call   1250c5 <do_user_addr_fault+0x645>	1250c1: R_X86_64_PLT32	__SCT__might_resched-0x4
0645   1250c5:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
0649   1250c9:	4c 8b 7d 98          	mov    -0x68(%rbp),%r15
064d   1250cd:	e9 9c 02 00 00       	jmp    12536e <do_user_addr_fault+0x8ee>
0652   1250d2:	48 8b 45 88          	mov    -0x78(%rbp),%rax
0656   1250d6:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
065b   1250db:	4c 8b 75 b0          	mov    -0x50(%rbp),%r14
065f   1250df:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
0663   1250e3:	74 08                	je     1250ed <do_user_addr_fault+0x66d>
0665   1250e5:	4c 89 f7             	mov    %r14,%rdi
0668   1250e8:	e8 00 00 00 00       	call   1250ed <do_user_addr_fault+0x66d>	1250e9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
066d   1250ed:	41 f6 06 03          	testb  $0x3,(%r14)
0671   1250f1:	4c 8b 75 b8          	mov    -0x48(%rbp),%r14
0675   1250f5:	4c 8b 7d 98          	mov    -0x68(%rbp),%r15
0679   1250f9:	0f 84 86 00 00 00    	je     125185 <do_user_addr_fault+0x705>
067f   1250ff:	e8 00 00 00 00       	call   125104 <do_user_addr_fault+0x684>	125100: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0684   125104:	e9 eb 01 00 00       	jmp    1252f4 <do_user_addr_fault+0x874>
0689   125109:	44 0f b6 3d 00 00 00 00 	movzbl 0x0(%rip),%r15d        # 125111 <do_user_addr_fault+0x691>	12510d: R_X86_64_PC32	.data.once+0x37
0691   125111:	45 89 fe             	mov    %r15d,%r14d
0694   125114:	41 83 f6 01          	xor    $0x1,%r14d
0698   125118:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	12511b: R_X86_64_32S	_ftrace_annotated_branch+0x193e0
069f   12511f:	44 89 f6             	mov    %r14d,%esi
06a2   125122:	31 d2                	xor    %edx,%edx
06a4   125124:	31 c9                	xor    %ecx,%ecx
06a6   125126:	e8 00 00 00 00       	call   12512b <do_user_addr_fault+0x6ab>	125127: R_X86_64_PLT32	ftrace_likely_update-0x4
06ab   12512b:	45 85 ff             	test   %r15d,%r15d
06ae   12512e:	0f 84 8f 00 00 00    	je     1251c3 <do_user_addr_fault+0x743>
06b4   125134:	e8 00 00 00 00       	call   125139 <do_user_addr_fault+0x6b9>	125135: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06b9   125139:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	12513c: R_X86_64_32S	_ftrace_annotated_branch+0x19410
06c0   125140:	44 89 f6             	mov    %r14d,%esi
06c3   125143:	31 d2                	xor    %edx,%edx
06c5   125145:	31 c9                	xor    %ecx,%ecx
06c7   125147:	e8 00 00 00 00       	call   12514c <do_user_addr_fault+0x6cc>	125148: R_X86_64_PLT32	ftrace_likely_update-0x4
06cc   12514c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	12514f: R_X86_64_32S	_ftrace_annotated_branch+0x19440
06d3   125153:	be 01 00 00 00       	mov    $0x1,%esi
06d8   125158:	31 d2                	xor    %edx,%edx
06da   12515a:	b9 01 00 00 00       	mov    $0x1,%ecx
06df   12515f:	e8 00 00 00 00       	call   125164 <do_user_addr_fault+0x6e4>	125160: R_X86_64_PLT32	ftrace_likely_update-0x4
06e4   125164:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
06ee   12516e:	80 3c 03 00          	cmpb   $0x0,(%rbx,%rax,1)
06f2   125172:	74 08                	je     12517c <do_user_addr_fault+0x6fc>
06f4   125174:	4c 89 e7             	mov    %r12,%rdi
06f7   125177:	e8 00 00 00 00       	call   12517c <do_user_addr_fault+0x6fc>	125178: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
06fc   12517c:	4d 89 2c 24          	mov    %r13,(%r12)
0700   125180:	e9 7b fd ff ff       	jmp    124f00 <do_user_addr_fault+0x480>
0705   125185:	49 8d 9e 80 00 00 00 	lea    0x80(%r14),%rbx
070c   12518c:	48 89 d8             	mov    %rbx,%rax
070f   12518f:	48 c1 e8 03          	shr    $0x3,%rax
0713   125193:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0718   125198:	74 08                	je     1251a2 <do_user_addr_fault+0x722>
071a   12519a:	48 89 df             	mov    %rbx,%rdi
071d   12519d:	e8 00 00 00 00       	call   1251a2 <do_user_addr_fault+0x722>	12519e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0722   1251a2:	48 8b 3b             	mov    (%rbx),%rdi
0725   1251a5:	e8 00 00 00 00       	call   1251aa <do_user_addr_fault+0x72a>	1251a6: R_X86_64_PLT32	search_exception_tables-0x4
072a   1251aa:	48 85 c0             	test   %rax,%rax
072d   1251ad:	74 0a                	je     1251b9 <do_user_addr_fault+0x739>
072f   1251af:	e8 00 00 00 00       	call   1251b4 <do_user_addr_fault+0x734>	1251b0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0734   1251b4:	e9 b2 05 00 00       	jmp    12576b <do_user_addr_fault+0xceb>
0739   1251b9:	e8 00 00 00 00       	call   1251be <do_user_addr_fault+0x73e>	1251ba: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
073e   1251be:	e9 12 fc ff ff       	jmp    124dd5 <do_user_addr_fault+0x355>
0743   1251c3:	e8 00 00 00 00       	call   1251c8 <do_user_addr_fault+0x748>	1251c4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0748   1251c8:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 1251cf <do_user_addr_fault+0x74f>	1251ca: R_X86_64_PC32	.data.once+0x36
074f   1251cf:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1251d2: R_X86_64_32S	_ftrace_annotated_branch+0x19410
0756   1251d6:	44 89 f6             	mov    %r14d,%esi
0759   1251d9:	31 d2                	xor    %edx,%edx
075b   1251db:	31 c9                	xor    %ecx,%ecx
075d   1251dd:	e8 00 00 00 00       	call   1251e2 <do_user_addr_fault+0x762>	1251de: R_X86_64_PLT32	ftrace_likely_update-0x4
0762   1251e2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1251e5: R_X86_64_32S	.rodata+0x5a8e0
0769   1251e9:	e8 00 00 00 00       	call   1251ee <do_user_addr_fault+0x76e>	1251ea: R_X86_64_PLT32	_printk-0x4
076e   1251ee:	e9 59 ff ff ff       	jmp    12514c <do_user_addr_fault+0x6cc>
0773   1251f3:	e8 00 00 00 00       	call   1251f8 <do_user_addr_fault+0x778>	1251f4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0778   1251f8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1251fb: R_X86_64_32S	_ftrace_annotated_branch+0x19230
077f   1251ff:	be 01 00 00 00       	mov    $0x1,%esi
0784   125204:	31 d2                	xor    %edx,%edx
0786   125206:	31 c9                	xor    %ecx,%ecx
0788   125208:	e8 00 00 00 00       	call   12520d <do_user_addr_fault+0x78d>	125209: R_X86_64_PLT32	ftrace_likely_update-0x4
078d   12520d:	e9 c3 fb ff ff       	jmp    124dd5 <do_user_addr_fault+0x355>
0792   125212:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	125215: R_X86_64_32S	boot_cpu_data+0x1
0799   125219:	80 e1 07             	and    $0x7,%cl
079c   12521c:	38 c1                	cmp    %al,%cl
079e   12521e:	0f 8c fe f8 ff ff    	jl     124b22 <do_user_addr_fault+0xa2>
07a4   125224:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	125227: R_X86_64_32S	boot_cpu_data+0x1
07ab   12522b:	e8 00 00 00 00       	call   125230 <do_user_addr_fault+0x7b0>	12522c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
07b0   125230:	e9 ed f8 ff ff       	jmp    124b22 <do_user_addr_fault+0xa2>
07b5   125235:	0f 8f 0a f9 ff ff    	jg     124b45 <do_user_addr_fault+0xc5>
07bb   12523b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	12523e: R_X86_64_32S	boot_cpu_data
07c2   125242:	e8 00 00 00 00       	call   125247 <do_user_addr_fault+0x7c7>	125243: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
07c7   125247:	e9 f9 f8 ff ff       	jmp    124b45 <do_user_addr_fault+0xc5>
07cc   12524c:	89 d9                	mov    %ebx,%ecx
07ce   12524e:	80 e1 07             	and    $0x7,%cl
07d1   125251:	80 c1 03             	add    $0x3,%cl
07d4   125254:	38 c1                	cmp    %al,%cl
07d6   125256:	0f 8c 39 fb ff ff    	jl     124d95 <do_user_addr_fault+0x315>
07dc   12525c:	48 89 df             	mov    %rbx,%rdi
07df   12525f:	e8 00 00 00 00       	call   125264 <do_user_addr_fault+0x7e4>	125260: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
07e4   125264:	e9 2c fb ff ff       	jmp    124d95 <do_user_addr_fault+0x315>
07e9   125269:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	12526c: R_X86_64_32S	perf_swevent_enabled+0x8
07f0   125270:	80 e1 07             	and    $0x7,%cl
07f3   125273:	80 c1 03             	add    $0x3,%cl
07f6   125276:	38 c1                	cmp    %al,%cl
07f8   125278:	0f 8c cd fc ff ff    	jl     124f4b <do_user_addr_fault+0x4cb>
07fe   12527e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	125281: R_X86_64_32S	perf_swevent_enabled+0x8
0805   125285:	e8 00 00 00 00       	call   12528a <do_user_addr_fault+0x80a>	125286: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
080a   12528a:	e9 bc fc ff ff       	jmp    124f4b <do_user_addr_fault+0x4cb>
080f   12528f:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	125292: R_X86_64_32S	__tracepoint_mmap_lock_start_locking+0x8
0816   125296:	80 e1 07             	and    $0x7,%cl
0819   125299:	80 c1 03             	add    $0x3,%cl
081c   12529c:	38 c1                	cmp    %al,%cl
081e   12529e:	0f 8c 4f fd ff ff    	jl     124ff3 <do_user_addr_fault+0x573>
0824   1252a4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1252a7: R_X86_64_32S	__tracepoint_mmap_lock_start_locking+0x8
082b   1252ab:	e8 00 00 00 00       	call   1252b0 <do_user_addr_fault+0x830>	1252ac: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0830   1252b0:	e9 3e fd ff ff       	jmp    124ff3 <do_user_addr_fault+0x573>
0835   1252b5:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	1252b8: R_X86_64_32S	__tracepoint_mmap_lock_acquire_returned+0x8
083c   1252bc:	80 e1 07             	and    $0x7,%cl
083f   1252bf:	80 c1 03             	add    $0x3,%cl
0842   1252c2:	38 c1                	cmp    %al,%cl
0844   1252c4:	0f 8c 89 fd ff ff    	jl     125053 <do_user_addr_fault+0x5d3>
084a   1252ca:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1252cd: R_X86_64_32S	__tracepoint_mmap_lock_acquire_returned+0x8
0851   1252d1:	e8 00 00 00 00       	call   1252d6 <do_user_addr_fault+0x856>	1252d2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0856   1252d6:	e9 78 fd ff ff       	jmp    125053 <do_user_addr_fault+0x5d3>
085b   1252db:	e8 00 00 00 00       	call   1252e0 <do_user_addr_fault+0x860>	1252dc: R_X86_64_PLT32	__stack_chk_fail-0x4
0860   1252e0:	e8 00 00 00 00       	call   1252e5 <do_user_addr_fault+0x865>	1252e1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0865   1252e5:	e9 91 f9 ff ff       	jmp    124c7b <do_user_addr_fault+0x1fb>
086a   1252ea:	e8 00 00 00 00       	call   1252ef <do_user_addr_fault+0x86f>	1252eb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
086f   1252ef:	e9 e5 f9 ff ff       	jmp    124cd9 <do_user_addr_fault+0x259>
0874   1252f4:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	1252f7: R_X86_64_32S	__tracepoint_mmap_lock_start_locking+0x8
087b   1252fb:	48 c1 e8 03          	shr    $0x3,%rax
087f   1252ff:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0883   125303:	84 c0                	test   %al,%al
0885   125305:	0f 85 9a 06 00 00    	jne    1259a5 <do_user_addr_fault+0xf25>
088b   12530b:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 125312 <do_user_addr_fault+0x892>	12530d: R_X86_64_PC32	__tracepoint_mmap_lock_start_locking+0x3
0892   125312:	7e 11                	jle    125325 <do_user_addr_fault+0x8a5>
0894   125314:	e8 00 00 00 00       	call   125319 <do_user_addr_fault+0x899>	125315: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0899   125319:	48 89 df             	mov    %rbx,%rdi
089c   12531c:	31 f6                	xor    %esi,%esi
089e   12531e:	e8 00 00 00 00       	call   125323 <do_user_addr_fault+0x8a3>	12531f: R_X86_64_PLT32	__mmap_lock_do_trace_start_locking-0x4
08a3   125323:	eb 05                	jmp    12532a <do_user_addr_fault+0x8aa>
08a5   125325:	e8 00 00 00 00       	call   12532a <do_user_addr_fault+0x8aa>	125326: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08aa   12532a:	48 8b 7d 80          	mov    -0x80(%rbp),%rdi
08ae   12532e:	e8 00 00 00 00       	call   125333 <do_user_addr_fault+0x8b3>	12532f: R_X86_64_PLT32	down_read-0x4
08b3   125333:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	125336: R_X86_64_32S	__tracepoint_mmap_lock_acquire_returned+0x8
08ba   12533a:	48 c1 e8 03          	shr    $0x3,%rax
08be   12533e:	42 8a 04 20          	mov    (%rax,%r12,1),%al
08c2   125342:	84 c0                	test   %al,%al
08c4   125344:	0f 85 81 06 00 00    	jne    1259cb <do_user_addr_fault+0xf4b>
08ca   12534a:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 125351 <do_user_addr_fault+0x8d1>	12534c: R_X86_64_PC32	__tracepoint_mmap_lock_acquire_returned+0x3
08d1   125351:	7e 16                	jle    125369 <do_user_addr_fault+0x8e9>
08d3   125353:	e8 00 00 00 00       	call   125358 <do_user_addr_fault+0x8d8>	125354: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08d8   125358:	48 89 df             	mov    %rbx,%rdi
08db   12535b:	31 f6                	xor    %esi,%esi
08dd   12535d:	ba 01 00 00 00       	mov    $0x1,%edx
08e2   125362:	e8 00 00 00 00       	call   125367 <do_user_addr_fault+0x8e7>	125363: R_X86_64_PLT32	__mmap_lock_do_trace_acquire_returned-0x4
08e7   125367:	eb 05                	jmp    12536e <do_user_addr_fault+0x8ee>
08e9   125369:	e8 00 00 00 00       	call   12536e <do_user_addr_fault+0x8ee>	12536a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08ee   12536e:	48 89 df             	mov    %rbx,%rdi
08f1   125371:	4c 89 ee             	mov    %r13,%rsi
08f4   125374:	e8 00 00 00 00       	call   125379 <do_user_addr_fault+0x8f9>	125375: R_X86_64_PLT32	find_vma-0x4
08f9   125379:	49 89 c6             	mov    %rax,%r14
08fc   12537c:	31 f6                	xor    %esi,%esi
08fe   12537e:	48 85 c0             	test   %rax,%rax
0901   125381:	40 0f 94 c6          	sete   %sil
0905   125385:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	125388: R_X86_64_32S	_ftrace_annotated_branch+0x19290
090c   12538c:	31 d2                	xor    %edx,%edx
090e   12538e:	31 c9                	xor    %ecx,%ecx
0910   125390:	e8 00 00 00 00       	call   125395 <do_user_addr_fault+0x915>	125391: R_X86_64_PLT32	ftrace_likely_update-0x4
0915   125395:	4d 85 f6             	test   %r14,%r14
0918   125398:	0f 84 d6 03 00 00    	je     125774 <do_user_addr_fault+0xcf4>
091e   12539e:	4c 89 f0             	mov    %r14,%rax
0921   1253a1:	48 c1 e8 03          	shr    $0x3,%rax
0925   1253a5:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
092a   1253aa:	74 08                	je     1253b4 <do_user_addr_fault+0x934>
092c   1253ac:	4c 89 f7             	mov    %r14,%rdi
092f   1253af:	e8 00 00 00 00       	call   1253b4 <do_user_addr_fault+0x934>	1253b0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0934   1253b4:	49 8b 1e             	mov    (%r14),%rbx
0937   1253b7:	31 f6                	xor    %esi,%esi
0939   1253b9:	4c 39 eb             	cmp    %r13,%rbx
093c   1253bc:	40 0f 96 c6          	setbe  %sil
0940   1253c0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1253c3: R_X86_64_32S	_ftrace_annotated_branch+0x192c0
0947   1253c7:	ba 01 00 00 00       	mov    $0x1,%edx
094c   1253cc:	31 c9                	xor    %ecx,%ecx
094e   1253ce:	e8 00 00 00 00       	call   1253d3 <do_user_addr_fault+0x953>	1253cf: R_X86_64_PLT32	ftrace_likely_update-0x4
0953   1253d3:	4c 39 eb             	cmp    %r13,%rbx
0956   1253d6:	77 07                	ja     1253df <do_user_addr_fault+0x95f>
0958   1253d8:	e8 00 00 00 00       	call   1253dd <do_user_addr_fault+0x95d>	1253d9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
095d   1253dd:	eb 71                	jmp    125450 <do_user_addr_fault+0x9d0>
095f   1253df:	49 8d 5e 20          	lea    0x20(%r14),%rbx
0963   1253e3:	48 89 d8             	mov    %rbx,%rax
0966   1253e6:	48 c1 e8 03          	shr    $0x3,%rax
096a   1253ea:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
096f   1253ef:	74 08                	je     1253f9 <do_user_addr_fault+0x979>
0971   1253f1:	48 89 df             	mov    %rbx,%rdi
0974   1253f4:	e8 00 00 00 00       	call   1253f9 <do_user_addr_fault+0x979>	1253f5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0979   1253f9:	8b 1b                	mov    (%rbx),%ebx
097b   1253fb:	c1 eb 08             	shr    $0x8,%ebx
097e   1253fe:	83 e3 01             	and    $0x1,%ebx
0981   125401:	89 de                	mov    %ebx,%esi
0983   125403:	83 f6 01             	xor    $0x1,%esi
0986   125406:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	125409: R_X86_64_32S	_ftrace_annotated_branch+0x192f0
098d   12540d:	31 d2                	xor    %edx,%edx
098f   12540f:	31 c9                	xor    %ecx,%ecx
0991   125411:	e8 00 00 00 00       	call   125416 <do_user_addr_fault+0x996>	125412: R_X86_64_PLT32	ftrace_likely_update-0x4
0996   125416:	85 db                	test   %ebx,%ebx
0998   125418:	0f 84 05 04 00 00    	je     125823 <do_user_addr_fault+0xda3>
099e   12541e:	4c 89 f7             	mov    %r14,%rdi
09a1   125421:	4c 89 ee             	mov    %r13,%rsi
09a4   125424:	e8 00 00 00 00       	call   125429 <do_user_addr_fault+0x9a9>	125425: R_X86_64_PLT32	expand_stack-0x4
09a9   125429:	89 c3                	mov    %eax,%ebx
09ab   12542b:	31 f6                	xor    %esi,%esi
09ad   12542d:	85 c0                	test   %eax,%eax
09af   12542f:	40 0f 95 c6          	setne  %sil
09b3   125433:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	125436: R_X86_64_32S	_ftrace_annotated_branch+0x19320
09ba   12543a:	31 d2                	xor    %edx,%edx
09bc   12543c:	31 c9                	xor    %ecx,%ecx
09be   12543e:	e8 00 00 00 00       	call   125443 <do_user_addr_fault+0x9c3>	12543f: R_X86_64_PLT32	ftrace_likely_update-0x4
09c3   125443:	85 db                	test   %ebx,%ebx
09c5   125445:	0f 85 df 03 00 00    	jne    12582a <do_user_addr_fault+0xdaa>
09cb   12544b:	e8 00 00 00 00       	call   125450 <do_user_addr_fault+0x9d0>	12544c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09d0   125450:	41 f6 c7 20          	test   $0x20,%r15b
09d4   125454:	0f 85 24 03 00 00    	jne    12577e <do_user_addr_fault+0xcfe>
09da   12545a:	44 89 fb             	mov    %r15d,%ebx
09dd   12545d:	81 e3 00 80 00 00    	and    $0x8000,%ebx
09e3   125463:	48 89 de             	mov    %rbx,%rsi
09e6   125466:	48 c1 ee 0f          	shr    $0xf,%rsi
09ea   12546a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	12546d: R_X86_64_32S	_ftrace_annotated_branch+0x19470
09f1   125471:	31 d2                	xor    %edx,%edx
09f3   125473:	31 c9                	xor    %ecx,%ecx
09f5   125475:	e8 00 00 00 00       	call   12547a <do_user_addr_fault+0x9fa>	125476: R_X86_64_PLT32	ftrace_likely_update-0x4
09fa   12547a:	48 85 db             	test   %rbx,%rbx
09fd   12547d:	0f 85 05 03 00 00    	jne    125788 <do_user_addr_fault+0xd08>
0a03   125483:	41 f6 c7 02          	test   $0x2,%r15b
0a07   125487:	75 58                	jne    1254e1 <do_user_addr_fault+0xa61>
0a09   125489:	44 89 fb             	mov    %r15d,%ebx
0a0c   12548c:	83 e3 01             	and    $0x1,%ebx
0a0f   12548f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	125492: R_X86_64_32S	_ftrace_annotated_branch+0x194d0
0a16   125496:	89 de                	mov    %ebx,%esi
0a18   125498:	31 d2                	xor    %edx,%edx
0a1a   12549a:	31 c9                	xor    %ecx,%ecx
0a1c   12549c:	e8 00 00 00 00       	call   1254a1 <do_user_addr_fault+0xa21>	12549d: R_X86_64_PLT32	ftrace_likely_update-0x4
0a21   1254a1:	48 85 db             	test   %rbx,%rbx
0a24   1254a4:	0f 85 99 03 00 00    	jne    125843 <do_user_addr_fault+0xdc3>
0a2a   1254aa:	e8 00 00 00 00       	call   1254af <do_user_addr_fault+0xa2f>	1254ab: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a2f   1254af:	4c 89 e1             	mov    %r12,%rcx
0a32   1254b2:	4d 89 f4             	mov    %r14,%r12
0a35   1254b5:	49 83 c4 20          	add    $0x20,%r12
0a39   1254b9:	4c 89 e0             	mov    %r12,%rax
0a3c   1254bc:	48 c1 e8 03          	shr    $0x3,%rax
0a40   1254c0:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0a44   1254c4:	74 08                	je     1254ce <do_user_addr_fault+0xa4e>
0a46   1254c6:	4c 89 e7             	mov    %r12,%rdi
0a49   1254c9:	e8 00 00 00 00       	call   1254ce <do_user_addr_fault+0xa4e>	1254ca: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a4e   1254ce:	31 db                	xor    %ebx,%ebx
0a50   1254d0:	41 f6 04 24 07       	testb  $0x7,(%r12)
0a55   1254d5:	0f 94 c3             	sete   %bl
0a58   1254d8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1254db: R_X86_64_32S	_ftrace_annotated_branch+0x19500
0a5f   1254df:	eb 35                	jmp    125516 <do_user_addr_fault+0xa96>
0a61   1254e1:	e8 00 00 00 00       	call   1254e6 <do_user_addr_fault+0xa66>	1254e2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a66   1254e6:	4c 89 e1             	mov    %r12,%rcx
0a69   1254e9:	4d 89 f4             	mov    %r14,%r12
0a6c   1254ec:	49 83 c4 20          	add    $0x20,%r12
0a70   1254f0:	4c 89 e0             	mov    %r12,%rax
0a73   1254f3:	48 c1 e8 03          	shr    $0x3,%rax
0a77   1254f7:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0a7b   1254fb:	74 08                	je     125505 <do_user_addr_fault+0xa85>
0a7d   1254fd:	4c 89 e7             	mov    %r12,%rdi
0a80   125500:	e8 00 00 00 00       	call   125505 <do_user_addr_fault+0xa85>	125501: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a85   125505:	31 db                	xor    %ebx,%ebx
0a87   125507:	41 f6 04 24 02       	testb  $0x2,(%r12)
0a8c   12550c:	0f 94 c3             	sete   %bl
0a8f   12550f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	125512: R_X86_64_32S	_ftrace_annotated_branch+0x194a0
0a96   125516:	89 de                	mov    %ebx,%esi
0a98   125518:	31 d2                	xor    %edx,%edx
0a9a   12551a:	31 c9                	xor    %ecx,%ecx
0a9c   12551c:	e8 00 00 00 00       	call   125521 <do_user_addr_fault+0xaa1>	12551d: R_X86_64_PLT32	ftrace_likely_update-0x4
0aa1   125521:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	125524: R_X86_64_32S	_ftrace_annotated_branch+0x19350
0aa8   125528:	89 de                	mov    %ebx,%esi
0aaa   12552a:	31 d2                	xor    %edx,%edx
0aac   12552c:	31 c9                	xor    %ecx,%ecx
0aae   12552e:	e8 00 00 00 00       	call   125533 <do_user_addr_fault+0xab3>	12552f: R_X86_64_PLT32	ftrace_likely_update-0x4
0ab3   125533:	85 db                	test   %ebx,%ebx
0ab5   125535:	0f 85 57 02 00 00    	jne    125792 <do_user_addr_fault+0xd12>
0abb   12553b:	4c 89 f7             	mov    %r14,%rdi
0abe   12553e:	4c 89 ee             	mov    %r13,%rsi
0ac1   125541:	8b 55 c4             	mov    -0x3c(%rbp),%edx
0ac4   125544:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
0ac8   125548:	e8 00 00 00 00       	call   12554d <do_user_addr_fault+0xacd>	125549: R_X86_64_PLT32	handle_mm_fault-0x4
0acd   12554d:	89 c3                	mov    %eax,%ebx
0acf   12554f:	41 89 c6             	mov    %eax,%r14d
0ad2   125552:	41 81 e6 00 04 00 00 	and    $0x400,%r14d
0ad9   125559:	75 0e                	jne    125569 <do_user_addr_fault+0xae9>
0adb   12555b:	e8 00 00 00 00       	call   125560 <do_user_addr_fault+0xae0>	12555c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ae0   125560:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
0ae4   125564:	e9 bc 01 00 00       	jmp    125725 <do_user_addr_fault+0xca5>
0ae9   125569:	41 89 df             	mov    %ebx,%r15d
0aec   12556c:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
0af0   125570:	4c 89 e7             	mov    %r12,%rdi
0af3   125573:	be 08 00 00 00       	mov    $0x8,%esi
0af8   125578:	e8 00 00 00 00       	call   12557d <do_user_addr_fault+0xafd>	125579: R_X86_64_PLT32	__kasan_check_read-0x4
0afd   12557d:	4d 89 e5             	mov    %r12,%r13
0b00   125580:	49 c1 ed 03          	shr    $0x3,%r13
0b04   125584:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0b0e   12558e:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
0b14   125594:	74 08                	je     12559e <do_user_addr_fault+0xb1e>
0b16   125596:	4c 89 e7             	mov    %r12,%rdi
0b19   125599:	e8 00 00 00 00       	call   12559e <do_user_addr_fault+0xb1e>	12559a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b1e   12559e:	49 8b 1c 24          	mov    (%r12),%rbx
0b22   1255a2:	89 de                	mov    %ebx,%esi
0b24   1255a4:	c1 ee 02             	shr    $0x2,%esi
0b27   1255a7:	83 e6 01             	and    $0x1,%esi
0b2a   1255aa:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1255ad: R_X86_64_32S	_ftrace_annotated_branch+0x19590
0b31   1255b1:	31 d2                	xor    %edx,%edx
0b33   1255b3:	31 c9                	xor    %ecx,%ecx
0b35   1255b5:	e8 00 00 00 00       	call   1255ba <do_user_addr_fault+0xb3a>	1255b6: R_X86_64_PLT32	ftrace_likely_update-0x4
0b3a   1255ba:	0f ba e3 02          	bt     $0x2,%ebx
0b3e   1255be:	72 0a                	jb     1255ca <do_user_addr_fault+0xb4a>
0b40   1255c0:	e8 00 00 00 00       	call   1255c5 <do_user_addr_fault+0xb45>	1255c1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b45   1255c5:	44 89 fb             	mov    %r15d,%ebx
0b48   1255c8:	eb 56                	jmp    125620 <do_user_addr_fault+0xba0>
0b4a   1255ca:	49 8d 9c 24 18 08 00 00 	lea    0x818(%r12),%rbx
0b52   1255d2:	48 89 d8             	mov    %rbx,%rax
0b55   1255d5:	48 c1 e8 03          	shr    $0x3,%rax
0b59   1255d9:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0b63   1255e3:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0b67   1255e7:	74 08                	je     1255f1 <do_user_addr_fault+0xb71>
0b69   1255e9:	48 89 df             	mov    %rbx,%rdi
0b6c   1255ec:	e8 00 00 00 00       	call   1255f1 <do_user_addr_fault+0xb71>	1255ed: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b71   1255f1:	8b 1b                	mov    (%rbx),%ebx
0b73   1255f3:	c1 eb 08             	shr    $0x8,%ebx
0b76   1255f6:	89 de                	mov    %ebx,%esi
0b78   1255f8:	83 e6 01             	and    $0x1,%esi
0b7b   1255fb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1255fe: R_X86_64_32S	_ftrace_annotated_branch+0x195c0
0b82   125602:	31 d2                	xor    %edx,%edx
0b84   125604:	31 c9                	xor    %ecx,%ecx
0b86   125606:	e8 00 00 00 00       	call   12560b <do_user_addr_fault+0xb8b>	125607: R_X86_64_PLT32	ftrace_likely_update-0x4
0b8b   12560b:	83 e3 01             	and    $0x1,%ebx
0b8e   12560e:	0f 85 75 02 00 00    	jne    125889 <do_user_addr_fault+0xe09>
0b94   125614:	44 89 fb             	mov    %r15d,%ebx
0b97   125617:	e8 00 00 00 00       	call   12561c <do_user_addr_fault+0xb9c>	125618: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b9c   12561c:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
0ba0   125620:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0baa   12562a:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
0bae   12562e:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0bb2   125632:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
0bb6   125636:	74 0d                	je     125645 <do_user_addr_fault+0xbc5>
0bb8   125638:	48 8b 7d b0          	mov    -0x50(%rbp),%rdi
0bbc   12563c:	e8 00 00 00 00       	call   125641 <do_user_addr_fault+0xbc1>	12563d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0bc1   125641:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
0bc5   125645:	f6 00 03             	testb  $0x3,(%rax)
0bc8   125648:	0f 84 ca 00 00 00    	je     125718 <do_user_addr_fault+0xc98>
0bce   12564e:	4c 89 e7             	mov    %r12,%rdi
0bd1   125651:	be 08 00 00 00       	mov    $0x8,%esi
0bd6   125656:	e8 00 00 00 00       	call   12565b <do_user_addr_fault+0xbdb>	125657: R_X86_64_PLT32	__kasan_check_read-0x4
0bdb   12565b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0be5   125665:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
0beb   12566b:	74 08                	je     125675 <do_user_addr_fault+0xbf5>
0bed   12566d:	4c 89 e7             	mov    %r12,%rdi
0bf0   125670:	e8 00 00 00 00       	call   125675 <do_user_addr_fault+0xbf5>	125671: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0bf5   125675:	49 8b 1c 24          	mov    (%r12),%rbx
0bf9   125679:	81 e3 00 00 02 00    	and    $0x20000,%ebx
0bff   12567f:	48 89 de             	mov    %rbx,%rsi
0c02   125682:	48 c1 ee 11          	shr    $0x11,%rsi
0c06   125686:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	125689: R_X86_64_32S	_ftrace_annotated_branch+0x19560
0c0d   12568d:	31 d2                	xor    %edx,%edx
0c0f   12568f:	31 c9                	xor    %ecx,%ecx
0c11   125691:	e8 00 00 00 00       	call   125696 <do_user_addr_fault+0xc16>	125692: R_X86_64_PLT32	ftrace_likely_update-0x4
0c16   125696:	48 85 db             	test   %rbx,%rbx
0c19   125699:	0f 85 dc 01 00 00    	jne    12587b <do_user_addr_fault+0xdfb>
0c1f   12569f:	4c 89 e7             	mov    %r12,%rdi
0c22   1256a2:	be 08 00 00 00       	mov    $0x8,%esi
0c27   1256a7:	e8 00 00 00 00       	call   1256ac <do_user_addr_fault+0xc2c>	1256a8: R_X86_64_PLT32	__kasan_check_read-0x4
0c2c   1256ac:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0c36   1256b6:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
0c3c   1256bc:	74 08                	je     1256c6 <do_user_addr_fault+0xc46>
0c3e   1256be:	4c 89 e7             	mov    %r12,%rdi
0c41   1256c1:	e8 00 00 00 00       	call   1256c6 <do_user_addr_fault+0xc46>	1256c2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0c46   1256c6:	4d 8b 2c 24          	mov    (%r12),%r13
0c4a   1256ca:	41 c1 ed 02          	shr    $0x2,%r13d
0c4e   1256ce:	44 89 eb             	mov    %r13d,%ebx
0c51   1256d1:	83 e3 01             	and    $0x1,%ebx
0c54   1256d4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1256d7: R_X86_64_32S	_ftrace_annotated_branch+0x19590
0c5b   1256db:	89 de                	mov    %ebx,%esi
0c5d   1256dd:	31 d2                	xor    %edx,%edx
0c5f   1256df:	31 c9                	xor    %ecx,%ecx
0c61   1256e1:	e8 00 00 00 00       	call   1256e6 <do_user_addr_fault+0xc66>	1256e2: R_X86_64_PLT32	ftrace_likely_update-0x4
0c66   1256e6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1256e9: R_X86_64_32S	_ftrace_annotated_branch+0x19530
0c6d   1256ed:	89 de                	mov    %ebx,%esi
0c6f   1256ef:	31 d2                	xor    %edx,%edx
0c71   1256f1:	31 c9                	xor    %ecx,%ecx
0c73   1256f3:	e8 00 00 00 00       	call   1256f8 <do_user_addr_fault+0xc78>	1256f4: R_X86_64_PLT32	ftrace_likely_update-0x4
0c78   1256f8:	41 83 e5 01          	and    $0x1,%r13d
0c7c   1256fc:	0f 85 80 01 00 00    	jne    125882 <do_user_addr_fault+0xe02>
0c82   125702:	e8 00 00 00 00       	call   125707 <do_user_addr_fault+0xc87>	125703: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c87   125707:	4c 8b 6d 90          	mov    -0x70(%rbp),%r13
0c8b   12570b:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
0c8f   12570f:	44 89 fb             	mov    %r15d,%ebx
0c92   125712:	4c 8b 7d 98          	mov    -0x68(%rbp),%r15
0c96   125716:	eb 1f                	jmp    125737 <do_user_addr_fault+0xcb7>
0c98   125718:	e8 00 00 00 00       	call   12571d <do_user_addr_fault+0xc9d>	125719: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c9d   12571d:	4c 8b 6d 90          	mov    -0x70(%rbp),%r13
0ca1   125721:	4c 8b 7d 98          	mov    -0x68(%rbp),%r15
0ca5   125725:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	125728: R_X86_64_32S	_ftrace_annotated_branch+0x19530
0cac   12572c:	31 f6                	xor    %esi,%esi
0cae   12572e:	31 d2                	xor    %edx,%edx
0cb0   125730:	31 c9                	xor    %ecx,%ecx
0cb2   125732:	e8 00 00 00 00       	call   125737 <do_user_addr_fault+0xcb7>	125733: R_X86_64_PLT32	ftrace_likely_update-0x4
0cb7   125737:	0f ba e3 0e          	bt     $0xe,%ebx
0cbb   12573b:	72 5f                	jb     12579c <do_user_addr_fault+0xd1c>
0cbd   12573d:	44 89 f6             	mov    %r14d,%esi
0cc0   125740:	c1 ee 0a             	shr    $0xa,%esi
0cc3   125743:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	125746: R_X86_64_32S	_ftrace_annotated_branch+0x19380
0cca   12574a:	31 d2                	xor    %edx,%edx
0ccc   12574c:	31 c9                	xor    %ecx,%ecx
0cce   12574e:	e8 00 00 00 00       	call   125753 <do_user_addr_fault+0xcd3>	12574f: R_X86_64_PLT32	ftrace_likely_update-0x4
0cd3   125753:	45 85 f6             	test   %r14d,%r14d
0cd6   125756:	74 4e                	je     1257a6 <do_user_addr_fault+0xd26>
0cd8   125758:	e8 00 00 00 00       	call   12575d <do_user_addr_fault+0xcdd>	125759: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0cdd   12575d:	83 4d c4 20          	orl    $0x20,-0x3c(%rbp)
0ce1   125761:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
0ceb   12576b:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
0cef   12576f:	e9 80 fb ff ff       	jmp    1252f4 <do_user_addr_fault+0x874>
0cf4   125774:	e8 00 00 00 00       	call   125779 <do_user_addr_fault+0xcf9>	125775: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0cf9   125779:	e9 b1 00 00 00       	jmp    12582f <do_user_addr_fault+0xdaf>
0cfe   12577e:	e8 00 00 00 00       	call   125783 <do_user_addr_fault+0xd03>	12577f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d03   125783:	e9 c0 00 00 00       	jmp    125848 <do_user_addr_fault+0xdc8>
0d08   125788:	e8 00 00 00 00       	call   12578d <do_user_addr_fault+0xd0d>	125789: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d0d   12578d:	e9 b6 00 00 00       	jmp    125848 <do_user_addr_fault+0xdc8>
0d12   125792:	e8 00 00 00 00       	call   125797 <do_user_addr_fault+0xd17>	125793: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d17   125797:	e9 c1 00 00 00       	jmp    12585d <do_user_addr_fault+0xddd>
0d1c   12579c:	e8 00 00 00 00       	call   1257a1 <do_user_addr_fault+0xd21>	12579d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d21   1257a1:	e9 5a f7 ff ff       	jmp    124f00 <do_user_addr_fault+0x480>
0d26   1257a6:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
0d2a   1257aa:	e8 41 25 00 00       	call   127cf0 <mmap_read_unlock>
0d2f   1257af:	31 f6                	xor    %esi,%esi
0d31   1257b1:	f7 c3 73 08 00 00    	test   $0x873,%ebx
0d37   1257b7:	40 0f 94 c6          	sete   %sil
0d3b   1257bb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1257be: R_X86_64_32S	_ftrace_annotated_branch+0x193b0
0d42   1257c2:	ba 01 00 00 00       	mov    $0x1,%edx
0d47   1257c7:	31 c9                	xor    %ecx,%ecx
0d49   1257c9:	e8 00 00 00 00       	call   1257ce <do_user_addr_fault+0xd4e>	1257ca: R_X86_64_PLT32	ftrace_likely_update-0x4
0d4e   1257ce:	f7 c3 73 08 00 00    	test   $0x873,%ebx
0d54   1257d4:	4c 8b 75 b8          	mov    -0x48(%rbp),%r14
0d58   1257d8:	0f 84 93 00 00 00    	je     125871 <do_user_addr_fault+0xdf1>
0d5e   1257de:	4c 89 e7             	mov    %r12,%rdi
0d61   1257e1:	e8 8a 25 00 00       	call   127d70 <fatal_signal_pending>
0d66   1257e6:	85 c0                	test   %eax,%eax
0d68   1257e8:	0f 84 13 01 00 00    	je     125901 <do_user_addr_fault+0xe81>
0d6e   1257ee:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0d78   1257f8:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
0d7c   1257fc:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0d80   125800:	4c 8b 65 b0          	mov    -0x50(%rbp),%r12
0d84   125804:	74 08                	je     12580e <do_user_addr_fault+0xd8e>
0d86   125806:	4c 89 e7             	mov    %r12,%rdi
0d89   125809:	e8 00 00 00 00       	call   12580e <do_user_addr_fault+0xd8e>	12580a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0d8e   12580e:	41 f6 04 24 03       	testb  $0x3,(%r12)
0d93   125813:	0f 84 45 01 00 00    	je     12595e <do_user_addr_fault+0xede>
0d99   125819:	e8 00 00 00 00       	call   12581e <do_user_addr_fault+0xd9e>	12581a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d9e   12581e:	e9 e3 00 00 00       	jmp    125906 <do_user_addr_fault+0xe86>
0da3   125823:	e8 00 00 00 00       	call   125828 <do_user_addr_fault+0xda8>	125824: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0da8   125828:	eb 05                	jmp    12582f <do_user_addr_fault+0xdaf>
0daa   12582a:	e8 00 00 00 00       	call   12582f <do_user_addr_fault+0xdaf>	12582b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0daf   12582f:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
0db3   125833:	4c 89 fe             	mov    %r15,%rsi
0db6   125836:	4c 89 ea             	mov    %r13,%rdx
0db9   125839:	e8 32 24 00 00       	call   127c70 <bad_area>
0dbe   12583e:	e9 bd f6 ff ff       	jmp    124f00 <do_user_addr_fault+0x480>
0dc3   125843:	e8 00 00 00 00       	call   125848 <do_user_addr_fault+0xdc8>	125844: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0dc8   125848:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	12584b: R_X86_64_32S	_ftrace_annotated_branch+0x19350
0dcf   12584f:	be 01 00 00 00       	mov    $0x1,%esi
0dd4   125854:	31 d2                	xor    %edx,%edx
0dd6   125856:	31 c9                	xor    %ecx,%ecx
0dd8   125858:	e8 00 00 00 00       	call   12585d <do_user_addr_fault+0xddd>	125859: R_X86_64_PLT32	ftrace_likely_update-0x4
0ddd   12585d:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
0de1   125861:	4c 89 fe             	mov    %r15,%rsi
0de4   125864:	4c 89 ea             	mov    %r13,%rdx
0de7   125867:	e8 44 24 00 00       	call   127cb0 <bad_area_access_error>
0dec   12586c:	e9 8f f6 ff ff       	jmp    124f00 <do_user_addr_fault+0x480>
0df1   125871:	e8 00 00 00 00       	call   125876 <do_user_addr_fault+0xdf6>	125872: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0df6   125876:	e9 85 f6 ff ff       	jmp    124f00 <do_user_addr_fault+0x480>
0dfb   12587b:	e8 00 00 00 00       	call   125880 <do_user_addr_fault+0xe00>	12587c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e00   125880:	eb 0c                	jmp    12588e <do_user_addr_fault+0xe0e>
0e02   125882:	e8 00 00 00 00       	call   125887 <do_user_addr_fault+0xe07>	125883: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e07   125887:	eb 1a                	jmp    1258a3 <do_user_addr_fault+0xe23>
0e09   125889:	e8 00 00 00 00       	call   12588e <do_user_addr_fault+0xe0e>	12588a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e0e   12588e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	125891: R_X86_64_32S	_ftrace_annotated_branch+0x19530
0e15   125895:	be 01 00 00 00       	mov    $0x1,%esi
0e1a   12589a:	31 d2                	xor    %edx,%edx
0e1c   12589c:	31 c9                	xor    %ecx,%ecx
0e1e   12589e:	e8 00 00 00 00       	call   1258a3 <do_user_addr_fault+0xe23>	12589f: R_X86_64_PLT32	ftrace_likely_update-0x4
0e23   1258a3:	4c 8b 75 90          	mov    -0x70(%rbp),%r14
0e27   1258a7:	4c 8b 7d b8          	mov    -0x48(%rbp),%r15
0e2b   1258ab:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0e35   1258b5:	48 8b 5d 98          	mov    -0x68(%rbp),%rbx
0e39   1258b9:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
0e3d   1258bd:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0e41   1258c1:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
0e45   1258c5:	74 0d                	je     1258d4 <do_user_addr_fault+0xe54>
0e47   1258c7:	48 8b 7d b0          	mov    -0x50(%rbp),%rdi
0e4b   1258cb:	e8 00 00 00 00       	call   1258d0 <do_user_addr_fault+0xe50>	1258cc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0e50   1258d0:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
0e54   1258d4:	f6 00 03             	testb  $0x3,(%rax)
0e57   1258d7:	74 0a                	je     1258e3 <do_user_addr_fault+0xe63>
0e59   1258d9:	e8 00 00 00 00       	call   1258de <do_user_addr_fault+0xe5e>	1258da: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e5e   1258de:	e9 1d f6 ff ff       	jmp    124f00 <do_user_addr_fault+0x480>
0e63   1258e3:	e8 00 00 00 00       	call   1258e8 <do_user_addr_fault+0xe68>	1258e4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e68   1258e8:	4c 89 ff             	mov    %r15,%rdi
0e6b   1258eb:	48 89 de             	mov    %rbx,%rsi
0e6e   1258ee:	4c 89 f2             	mov    %r14,%rdx
0e71   1258f1:	b9 07 00 00 00       	mov    $0x7,%ecx
0e76   1258f6:	41 b8 02 00 00 00    	mov    $0x2,%r8d
0e7c   1258fc:	e9 9a 00 00 00       	jmp    12599b <do_user_addr_fault+0xf1b>
0e81   125901:	e8 00 00 00 00       	call   125906 <do_user_addr_fault+0xe86>	125902: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e86   125906:	f6 c3 01             	test   $0x1,%bl
0e89   125909:	75 1f                	jne    12592a <do_user_addr_fault+0xeaa>
0e8b   12590b:	f6 c3 32             	test   $0x32,%bl
0e8e   12590e:	74 63                	je     125973 <do_user_addr_fault+0xef3>
0e90   125910:	e8 00 00 00 00       	call   125915 <do_user_addr_fault+0xe95>	125911: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e95   125915:	4c 89 f7             	mov    %r14,%rdi
0e98   125918:	4c 89 fe             	mov    %r15,%rsi
0e9b   12591b:	4c 89 ea             	mov    %r13,%rdx
0e9e   12591e:	89 d9                	mov    %ebx,%ecx
0ea0   125920:	e8 0b 25 00 00       	call   127e30 <do_sigbus>
0ea5   125925:	e9 d6 f5 ff ff       	jmp    124f00 <do_user_addr_fault+0x480>
0eaa   12592a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0eb4   125934:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
0eb8   125938:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0ebc   12593c:	48 8b 5d b0          	mov    -0x50(%rbp),%rbx
0ec0   125940:	74 08                	je     12594a <do_user_addr_fault+0xeca>
0ec2   125942:	48 89 df             	mov    %rbx,%rdi
0ec5   125945:	e8 00 00 00 00       	call   12594a <do_user_addr_fault+0xeca>	125946: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0eca   12594a:	f6 03 03             	testb  $0x3,(%rbx)
0ecd   12594d:	74 33                	je     125982 <do_user_addr_fault+0xf02>
0ecf   12594f:	e8 00 00 00 00       	call   125954 <do_user_addr_fault+0xed4>	125950: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ed4   125954:	e8 00 00 00 00       	call   125959 <do_user_addr_fault+0xed9>	125955: R_X86_64_PLT32	pagefault_out_of_memory-0x4
0ed9   125959:	e9 a2 f5 ff ff       	jmp    124f00 <do_user_addr_fault+0x480>
0ede   12595e:	e8 00 00 00 00       	call   125963 <do_user_addr_fault+0xee3>	12595f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ee3   125963:	4c 89 f7             	mov    %r14,%rdi
0ee6   125966:	4c 89 fe             	mov    %r15,%rsi
0ee9   125969:	4c 89 ea             	mov    %r13,%rdx
0eec   12596c:	31 c9                	xor    %ecx,%ecx
0eee   12596e:	45 31 c0             	xor    %r8d,%r8d
0ef1   125971:	eb 28                	jmp    12599b <do_user_addr_fault+0xf1b>
0ef3   125973:	f6 c3 40             	test   $0x40,%bl
0ef6   125976:	74 79                	je     1259f1 <do_user_addr_fault+0xf71>
0ef8   125978:	e8 00 00 00 00       	call   12597d <do_user_addr_fault+0xefd>	125979: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0efd   12597d:	e9 53 f4 ff ff       	jmp    124dd5 <do_user_addr_fault+0x355>
0f02   125982:	e8 00 00 00 00       	call   125987 <do_user_addr_fault+0xf07>	125983: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0f07   125987:	4c 89 f7             	mov    %r14,%rdi
0f0a   12598a:	4c 89 fe             	mov    %r15,%rsi
0f0d   12598d:	4c 89 ea             	mov    %r13,%rdx
0f10   125990:	b9 0b 00 00 00       	mov    $0xb,%ecx
0f15   125995:	41 b8 01 00 00 00    	mov    $0x1,%r8d
0f1b   12599b:	e8 40 04 00 00       	call   125de0 <kernelmode_fixup_or_oops>
0f20   1259a0:	e9 5b f5 ff ff       	jmp    124f00 <do_user_addr_fault+0x480>
0f25   1259a5:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	1259a8: R_X86_64_32S	__tracepoint_mmap_lock_start_locking+0x8
0f2c   1259ac:	80 e1 07             	and    $0x7,%cl
0f2f   1259af:	80 c1 03             	add    $0x3,%cl
0f32   1259b2:	38 c1                	cmp    %al,%cl
0f34   1259b4:	0f 8c 51 f9 ff ff    	jl     12530b <do_user_addr_fault+0x88b>
0f3a   1259ba:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1259bd: R_X86_64_32S	__tracepoint_mmap_lock_start_locking+0x8
0f41   1259c1:	e8 00 00 00 00       	call   1259c6 <do_user_addr_fault+0xf46>	1259c2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0f46   1259c6:	e9 40 f9 ff ff       	jmp    12530b <do_user_addr_fault+0x88b>
0f4b   1259cb:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	1259ce: R_X86_64_32S	__tracepoint_mmap_lock_acquire_returned+0x8
0f52   1259d2:	80 e1 07             	and    $0x7,%cl
0f55   1259d5:	80 c1 03             	add    $0x3,%cl
0f58   1259d8:	38 c1                	cmp    %al,%cl
0f5a   1259da:	0f 8c 6a f9 ff ff    	jl     12534a <do_user_addr_fault+0x8ca>
0f60   1259e0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1259e3: R_X86_64_32S	__tracepoint_mmap_lock_acquire_returned+0x8
0f67   1259e7:	e8 00 00 00 00       	call   1259ec <do_user_addr_fault+0xf6c>	1259e8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0f6c   1259ec:	e9 59 f9 ff ff       	jmp    12534a <do_user_addr_fault+0x8ca>
0f71   1259f1:	e8 00 00 00 00       	call   1259f6 <do_user_addr_fault+0xf76>	1259f2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0f76   1259f6:	0f 0b                	ud2
0f78   1259f8:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
