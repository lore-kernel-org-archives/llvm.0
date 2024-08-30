Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3803134B6;
	Fri, 30 Aug 2024 02:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724985949; cv=none; b=QADu3dDn9PK2HW9m5mvsWkan+ZjuY82CH77Ey0SLzcE65L7ONte4DvuvtXFVG64m+Exy9UGY0QWfNWPskg1zrfp1k6h65KzINaYj+zRfaixwpqtCxQ/cG/ml62yg7w8Y4dwD36eSdC/tLRd8UAmMi/35/nL4SS0yB/o3+lsgHRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724985949; c=relaxed/simple;
	bh=si0JVNQoCTbh9jZG6zCj/5kSjC4SiFTPz1OB9raPtLw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gt/LkKukCBGFuAQ4l7fk1E9Sp0bMq4hKmizkGhhaalz1vxEqKVfXAn3Ob9yr0zsaiiGh71/oNp/TETOJg32iSOBhA4xK85arVfd4PsF/20jRl9khIiq/9HXGjjm0NJ0fx6+iaxl5DnXNTZe5L118kvoITiYEafbBHuYzq2OiDz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LADAUGcH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LADAUGcH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724985948; x=1756521948;
  h=date:from:cc:subject:message-id:mime-version;
  bh=si0JVNQoCTbh9jZG6zCj/5kSjC4SiFTPz1OB9raPtLw=;
  b=LADAUGcHAS1TwW2JM9N7Ef0b0NNEDalrPgC1W2oWVEwWPbThTwHlFOKa
   RzCTWLoNdcn7894s7LT3+4y5zZVsFjpo6EUEPJIidMW5e3sx5KL3SsZ9k
   8kkdPME037KleBAVCKJaKHps+/BJ8gAmBSPeg8qn8Q6OsXXucrLg2szf/
   6866ARIlKbqnXkzkGUiLngBYVzDKFR/2SOoGdE1f0LMWBhrD0l8tFivOE
   MvKSPUF7C1pgXW+PeS42XU3eb7U8wU7X31jlmPamsRhzxRYYn+V4eBmEl
   ALR060dkUEQ2LAeQG+5NrHljWO5GkwQBF0N22QhUkJ88FRe/5/m8dWG9R
   Q==;
X-CSE-ConnectionGUID: nW1zujR/S3S3WIUJpES+8Q==
X-CSE-MsgGUID: jvn47ym7Q9+2UCJfsAz05w==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23781567"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="23781567"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 19:45:47 -0700
X-CSE-ConnectionGUID: Sa+HnfDfQqWPNUXHjcPEEA==
X-CSE-MsgGUID: XvHOiAlKR+mxEzX2gQkYhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="63456621"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Aug 2024 19:45:46 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjrdv-0000vK-2v;
	Fri, 30 Aug 2024 02:45:43 +0000
Date: Fri, 30 Aug 2024 10:45:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x80: relocation to
 !ENDBR: arch_rethook_prepare+0xe
Message-ID: <202408301007.tdWHDUJo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Breno Leitao <leitao@debian.org>
CC: Ingo Molnar <mingo@kernel.org>
CC: Ariel Miculas <amiculas@cisco.com>

Hi Breno,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1b5fe53681d9c388f1600310fe3488091701d4d0
commit: aefb2f2e619b6c334bcb31de830aa00ba0b11129 x86/bugs: Rename CONFIG_RETPOLINE            => CONFIG_MITIGATION_RETPOLINE
date:   8 months ago
config: x86_64-buildonly-randconfig-001-20240830 (https://download.01.org/0day-ci/archive/20240830/202408301007.tdWHDUJo-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408301007.tdWHDUJo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408301007.tdWHDUJo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: leaf_copy_boundary_item+0x2b11: stack state mismatch: cfa1=4+280 cfa2=4+288
>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x80: relocation to !ENDBR: arch_rethook_prepare+0xe


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 00000000001758c0 <set_ftrace_ops_ro>:
0000   1758c0:	f3 0f 1e fa          	endbr64
0004   1758c4:	55                   	push   %rbp
0005   1758c5:	41 57                	push   %r15
0007   1758c7:	41 56                	push   %r14
0009   1758c9:	41 55                	push   %r13
000b   1758cb:	41 54                	push   %r12
000d   1758cd:	53                   	push   %rbx
000e   1758ce:	48 8d 64 24 d8       	lea    -0x28(%rsp),%rsp
0013   1758d3:	e8 00 00 00 00       	call   1758d8 <set_ftrace_ops_ro+0x18>	1758d4: R_X86_64_PLT32	__msan_get_context_state-0x4
0018   1758d8:	48 89 c3             	mov    %rax,%rbx
001b   1758db:	e8 00 00 00 00       	call   1758e0 <set_ftrace_ops_ro+0x20>	1758dc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0020   1758e0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1758e3: R_X86_64_32S	ftrace_ops_list
0027   1758e7:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # 1758ee <set_ftrace_ops_ro+0x2e>	1758ea: R_X86_64_PC32	ftrace_ops_list-0x4
002e   1758ee:	e8 00 00 00 00       	call   1758f3 <set_ftrace_ops_ro+0x33>	1758ef: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0033   1758f3:	48 8b 28             	mov    (%rax),%rbp
0036   1758f6:	8b 02                	mov    (%rdx),%eax
0038   1758f8:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
003d   1758fd:	c7 83 20 03 00 00 00 00 00 00 	movl   $0x0,0x320(%rbx)
0047   175907:	89 44 24 04          	mov    %eax,0x4(%rsp)
004b   17590b:	e8 00 00 00 00       	call   175910 <set_ftrace_ops_ro+0x50>	17590c: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
0050   175910:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	175913: R_X86_64_32S	ftrace_regs_caller
0057   175917:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	17591a: R_X86_64_32S	ftrace_regs_caller_end
005e   17591e:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	175921: R_X86_64_32S	ftrace_caller
0065   175925:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	175928: R_X86_64_32S	ftrace_caller_end
006c   17592c:	48 29 c2             	sub    %rax,%rdx
006f   17592f:	48 29 ce             	sub    %rcx,%rsi
0072   175932:	48 f7 d8             	neg    %rax
0075   175935:	48 f7 d9             	neg    %rcx
0078   175938:	48 8d 04 05 00 00 00 00 	lea    0x0(,%rax,1),%rax	17593c: R_X86_64_32S	ftrace_regs_caller_end+0x1008
0080   175940:	48 8d 0c 0d 00 00 00 00 	lea    0x0(,%rcx,1),%rcx	175944: R_X86_64_32S	ftrace_caller_end+0x1008
0088   175948:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
008d   17594d:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
0092   175952:	48 31 c1             	xor    %rax,%rcx
0095   175955:	48 c1 e9 0c          	shr    $0xc,%rcx
0099   175959:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
009e   17595e:	48 85 ed             	test   %rbp,%rbp
00a1   175961:	0f 85 7e 01 00 00    	jne    175ae5 <set_ftrace_ops_ro+0x225>
00a7   175967:	49 8d 7d 10          	lea    0x10(%r13),%rdi
00ab   17596b:	4c 8b 3f             	mov    (%rdi),%r15
00ae   17596e:	e8 00 00 00 00       	call   175973 <set_ftrace_ops_ro+0xb3>	17596f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
00b3   175973:	4c 8b 20             	mov    (%rax),%r12
00b6   175976:	44 89 fb             	mov    %r15d,%ebx
00b9   175979:	44 8b 32             	mov    (%rdx),%r14d
00bc   17597c:	44 89 e0             	mov    %r12d,%eax
00bf   17597f:	81 e3 00 08 00 00    	and    $0x800,%ebx
00c5   175985:	25 00 08 00 00       	and    $0x800,%eax
00ca   17598a:	48 85 c0             	test   %rax,%rax
00cd   17598d:	74 06                	je     175995 <set_ftrace_ops_ro+0xd5>
00cf   17598f:	f7 d0                	not    %eax
00d1   175991:	21 d8                	and    %ebx,%eax
00d3   175993:	74 0f                	je     1759a4 <set_ftrace_ops_ro+0xe4>
00d5   175995:	48 85 db             	test   %rbx,%rbx
00d8   175998:	75 17                	jne    1759b1 <set_ftrace_ops_ro+0xf1>
00da   17599a:	e8 00 00 00 00       	call   17599f <set_ftrace_ops_ro+0xdf>	17599b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00df   17599f:	e9 9b 00 00 00       	jmp    175a3f <set_ftrace_ops_ro+0x17f>
00e4   1759a4:	44 89 f7             	mov    %r14d,%edi
00e7   1759a7:	e8 00 00 00 00       	call   1759ac <set_ftrace_ops_ro+0xec>	1759a8: R_X86_64_PLT32	__msan_warning-0x4
00ec   1759ac:	48 85 db             	test   %rbx,%rbx
00ef   1759af:	74 e9                	je     17599a <set_ftrace_ops_ro+0xda>
00f1   1759b1:	e8 00 00 00 00       	call   1759b6 <set_ftrace_ops_ro+0xf6>	1759b2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00f6   1759b6:	41 83 e4 04          	and    $0x4,%r12d
00fa   1759ba:	41 83 e7 04          	and    $0x4,%r15d
00fe   1759be:	b9 00 00 00 00       	mov    $0x0,%ecx
0103   1759c3:	4d 85 e4             	test   %r12,%r12
0106   1759c6:	41 f7 d4             	not    %r12d
0109   1759c9:	0f 94 c0             	sete   %al
010c   1759cc:	45 85 e7             	test   %r12d,%r15d
010f   1759cf:	0f 95 c3             	setne  %bl
0112   1759d2:	08 c3                	or     %al,%bl
0114   1759d4:	44 0f 45 f1          	cmovne %ecx,%r14d
0118   1759d8:	4d 85 ff             	test   %r15,%r15
011b   1759db:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
0120   1759e0:	4c 0f 44 7c 24 18    	cmove  0x18(%rsp),%r15
0126   1759e6:	48 85 ed             	test   %rbp,%rbp
0129   1759e9:	0f 85 12 01 00 00    	jne    175b01 <set_ftrace_ops_ro+0x241>
012f   1759ef:	49 8d bd 90 01 00 00 	lea    0x190(%r13),%rdi
0136   1759f6:	4c 8b 27             	mov    (%rdi),%r12
0139   1759f9:	e8 00 00 00 00       	call   1759fe <set_ftrace_ops_ro+0x13e>	1759fa: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
013e   1759fe:	48 83 38 00          	cmpq   $0x0,(%rax)
0142   175a02:	8b 3a                	mov    (%rdx),%edi
0144   175a04:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0149   175a09:	c7 81 20 03 00 00 00 00 00 00 	movl   $0x0,0x320(%rcx)
0153   175a13:	0f 85 f6 00 00 00    	jne    175b0f <set_ftrace_ops_ro+0x24f>
0159   175a19:	83 7c 24 10 00       	cmpl   $0x0,0x10(%rsp)
015e   175a1e:	0f 94 c0             	sete   %al
0161   175a21:	08 c3                	or     %al,%bl
0163   175a23:	0f 84 f0 00 00 00    	je     175b19 <set_ftrace_ops_ro+0x259>
0169   175a29:	49 81 c7 08 10 00 00 	add    $0x1008,%r15
0170   175a30:	4c 89 e7             	mov    %r12,%rdi
0173   175a33:	49 c1 ef 0c          	shr    $0xc,%r15
0177   175a37:	44 89 fe             	mov    %r15d,%esi
017a   175a3a:	e8 00 00 00 00       	call   175a3f <set_ftrace_ops_ro+0x17f>	175a3b: R_X86_64_PLT32	set_memory_ro-0x4
017f   175a3f:	48 85 ed             	test   %rbp,%rbp
0182   175a42:	0f 85 ab 00 00 00    	jne    175af3 <set_ftrace_ops_ro+0x233>
0188   175a48:	49 8d 7d 00          	lea    0x0(%r13),%rdi
018c   175a4c:	48 8d 7f 08          	lea    0x8(%rdi),%rdi
0190   175a50:	4c 8b 2f             	mov    (%rdi),%r13
0193   175a53:	e8 00 00 00 00       	call   175a58 <set_ftrace_ops_ro+0x198>	175a54: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0198   175a58:	48 8b 28             	mov    (%rax),%rbp
019b   175a5b:	8b 0a                	mov    (%rdx),%ecx
019d   175a5d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
01a2   175a62:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
01a6   175a66:	c7 80 20 03 00 00 00 00 00 00 	movl   $0x0,0x320(%rax)
01b0   175a70:	e8 00 00 00 00       	call   175a75 <set_ftrace_ops_ro+0x1b5>	175a71: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
01b5   175a75:	48 89 e8             	mov    %rbp,%rax
01b8   175a78:	4c 89 ea             	mov    %r13,%rdx
01bb   175a7b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	175a7e: R_X86_64_32S	ftrace_list_end
01c2   175a82:	48 f7 d0             	not    %rax
01c5   175a85:	4c 85 e8             	test   %r13,%rax
01c8   175a88:	0f 94 c1             	sete   %cl
01cb   175a8b:	4d 85 ed             	test   %r13,%r13
01ce   175a8e:	0f 94 c3             	sete   %bl
01d1   175a91:	40 0f 95 c6          	setne  %sil
01d5   175a95:	48 31 fa             	xor    %rdi,%rdx
01d8   175a98:	48 85 c2             	test   %rax,%rdx
01db   175a9b:	0f 94 c0             	sete   %al
01de   175a9e:	49 81 fd 00 00 00 00 	cmp    $0x0,%r13	175aa1: R_X86_64_32S	ftrace_list_end
01e5   175aa5:	0f 95 c2             	setne  %dl
01e8   175aa8:	41 0f 94 c6          	sete   %r14b
01ec   175aac:	40 20 c6             	and    %al,%sil
01ef   175aaf:	08 c2                	or     %al,%dl
01f1   175ab1:	20 ca                	and    %cl,%dl
01f3   175ab3:	40 08 f2             	or     %sil,%dl
01f6   175ab6:	80 fa 01             	cmp    $0x1,%dl
01f9   175ab9:	75 05                	jne    175ac0 <set_ftrace_ops_ro+0x200>
01fb   175abb:	48 85 ed             	test   %rbp,%rbp
01fe   175abe:	75 15                	jne    175ad5 <set_ftrace_ops_ro+0x215>
0200   175ac0:	44 08 f3             	or     %r14b,%bl
0203   175ac3:	75 61                	jne    175b26 <set_ftrace_ops_ro+0x266>
0205   175ac5:	e8 00 00 00 00       	call   175aca <set_ftrace_ops_ro+0x20a>	175ac6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
020a   175aca:	48 85 ed             	test   %rbp,%rbp
020d   175acd:	0f 84 94 fe ff ff    	je     175967 <set_ftrace_ops_ro+0xa7>
0213   175ad3:	eb 10                	jmp    175ae5 <set_ftrace_ops_ro+0x225>
0215   175ad5:	8b 7c 24 04          	mov    0x4(%rsp),%edi
0219   175ad9:	e8 00 00 00 00       	call   175ade <set_ftrace_ops_ro+0x21e>	175ada: R_X86_64_PLT32	__msan_warning-0x4
021e   175ade:	44 08 f3             	or     %r14b,%bl
0221   175ae1:	75 43                	jne    175b26 <set_ftrace_ops_ro+0x266>
0223   175ae3:	eb e0                	jmp    175ac5 <set_ftrace_ops_ro+0x205>
0225   175ae5:	8b 7c 24 04          	mov    0x4(%rsp),%edi
0229   175ae9:	e8 00 00 00 00       	call   175aee <set_ftrace_ops_ro+0x22e>	175aea: R_X86_64_PLT32	__msan_warning-0x4
022e   175aee:	e9 74 fe ff ff       	jmp    175967 <set_ftrace_ops_ro+0xa7>
0233   175af3:	8b 7c 24 04          	mov    0x4(%rsp),%edi
0237   175af7:	e8 00 00 00 00       	call   175afc <set_ftrace_ops_ro+0x23c>	175af8: R_X86_64_PLT32	__msan_warning-0x4
023c   175afc:	e9 47 ff ff ff       	jmp    175a48 <set_ftrace_ops_ro+0x188>
0241   175b01:	8b 7c 24 04          	mov    0x4(%rsp),%edi
0245   175b05:	e8 00 00 00 00       	call   175b0a <set_ftrace_ops_ro+0x24a>	175b06: R_X86_64_PLT32	__msan_warning-0x4
024a   175b0a:	e9 e0 fe ff ff       	jmp    1759ef <set_ftrace_ops_ro+0x12f>
024f   175b0f:	e8 00 00 00 00       	call   175b14 <set_ftrace_ops_ro+0x254>	175b10: R_X86_64_PLT32	__msan_warning-0x4
0254   175b14:	e9 00 ff ff ff       	jmp    175a19 <set_ftrace_ops_ro+0x159>
0259   175b19:	44 89 f7             	mov    %r14d,%edi
025c   175b1c:	e8 00 00 00 00       	call   175b21 <set_ftrace_ops_ro+0x261>	175b1d: R_X86_64_PLT32	__msan_warning-0x4
0261   175b21:	e9 03 ff ff ff       	jmp    175a29 <set_ftrace_ops_ro+0x169>
0266   175b26:	e8 00 00 00 00       	call   175b2b <set_ftrace_ops_ro+0x26b>	175b27: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
026b   175b2b:	48 8d 64 24 28       	lea    0x28(%rsp),%rsp
0270   175b30:	5b                   	pop    %rbx
0271   175b31:	41 5c                	pop    %r12
0273   175b33:	41 5d                	pop    %r13
0275   175b35:	41 5e                	pop    %r14
0277   175b37:	41 5f                	pop    %r15
0279   175b39:	5d                   	pop    %rbp
027a   175b3a:	c3                   	ret
027b   175b3b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
