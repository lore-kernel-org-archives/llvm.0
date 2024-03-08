Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540872D608;
	Fri,  8 Mar 2024 05:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709875962; cv=none; b=NsSCwFVCHi6xpVPtgoOZzL765kWiVq2QBIvqVnqnQcOxBWSnBaL7DTU5yankaTUr1xZxWkYHOP85MQdfQ0YCD0SLa8+BFP19YaYeOcHdMzTkFVidF6NE2VTN0bJlA6bwwCiqllhrpvhciA8fGKi7OwjaNIQczSLPMolEkck27DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709875962; c=relaxed/simple;
	bh=U/w7KJ3k+e71Ms1og6746latLW53wMHmeO+xFBC6B9c=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CxDbbq0XcgGqm10BLLJsSd1B47vOe+hJVUv20epqe/wThMwf5+XWgg5LqZsv5BHkr0cbrvF9pYW3IuSUNxQW6t7tq0vJWD01qCZD2d7t+2mBawyx6hfCMTODBPOl9m0yHN4chflo5NsDSggwMCcXCImig8Y75ZdrRkzQKdXFNyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQZ5TJHw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQZ5TJHw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709875961; x=1741411961;
  h=date:from:cc:subject:message-id:mime-version;
  bh=U/w7KJ3k+e71Ms1og6746latLW53wMHmeO+xFBC6B9c=;
  b=XQZ5TJHwp/iXT/nR50K2wgX5pwfeUe4uXzBajG/qWDATNsMHKjm7U6Af
   308HuWHXp0kcT4IfrCLjRCoKv4vyLwz+oaDKtLN0+ZPBWrjO9bwPZ6mH1
   u6qwwp18Hk2gh/q52XEV5arVr5BbRQCbALxb6j+K1sn9Ket9ZJ6N/LBG2
   bFbUp6m5QnVsRqReRTMm9xEbFOBRsoDmShSEpP2rLD2zDRJvihdwFScZH
   cITg83n8FG/HuvIGX+Vujg6zmOnaqNUPL6WWdZE+METWXnsNQu7fKFqip
   DkvUK/nAEKPpMjAntJ2rTAvBfydD+DPM++No4KP6/OKBgHz2mjeiUriNy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="22037140"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="22037140"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 21:32:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="41335685"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Mar 2024 21:32:37 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riSqQ-00063r-20;
	Fri, 08 Mar 2024 05:32:34 +0000
Date: Fri, 8 Mar 2024 13:31:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: print_insn_state+0x3d6: undefined stack
 state
Message-ID: <202403081332.ZcQxK7Oq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Andrii Nakryiko <andrii@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>

Hi Andrii,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3aaa8ce7a3350d95b241046ae2401103a4384ba2
commit: 42feb6620accded89cad5f455665e21281813d79 bpf: move verifier state printing code to kernel/bpf/log.c
date:   4 months ago
config: x86_64-buildonly-randconfig-004-20240306 (https://download.01.org/0day-ci/archive/20240308/202403081332.ZcQxK7Oq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081332.ZcQxK7Oq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081332.ZcQxK7Oq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ___bpf_prog_run+0x1d2: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: print_insn_state+0x3d6: undefined stack state
   vmlinux.o: warning: objtool: vhci_coredump_hdr() falls through to next function vhci_open_timeout()
   vmlinux.o: warning: objtool: vhost_get_vq_desc+0x4f2: undefined stack state


objdump-func vmlinux.o print_insn_state:
0000 0000000000632a80 <print_insn_state>:
0000   632a80:	f3 0f 1e fa          	endbr64
0004   632a84:	e8 00 00 00 00       	call   632a89 <print_insn_state+0x9>	632a85: R_X86_64_PLT32	__fentry__-0x4
0009   632a89:	55                   	push   %rbp
000a   632a8a:	41 57                	push   %r15
000c   632a8c:	41 56                	push   %r14
000e   632a8e:	41 55                	push   %r13
0010   632a90:	41 54                	push   %r12
0012   632a92:	53                   	push   %rbx
0013   632a93:	48 83 ec 48          	sub    $0x48,%rsp
0017   632a97:	49 89 f5             	mov    %rsi,%r13
001a   632a9a:	49 89 ff             	mov    %rdi,%r15
001d   632a9d:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0026   632aa6:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
002b   632aab:	e8 00 00 00 00       	call   632ab0 <print_insn_state+0x30>	632aac: R_X86_64_PLT32	__msan_get_context_state-0x4
0030   632ab0:	49 89 c4             	mov    %rax,%r12
0033   632ab3:	49 8d bf 58 2e 00 00 	lea    0x2e58(%r15),%rdi
003a   632aba:	49 8b 9f 58 2e 00 00 	mov    0x2e58(%r15),%rbx
0041   632ac1:	e8 00 00 00 00       	call   632ac6 <print_insn_state+0x46>	632ac2: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0046   632ac6:	4c 8b 30             	mov    (%rax),%r14
0049   632ac9:	8b 2a                	mov    (%rdx),%ebp
004b   632acb:	4d 85 f6             	test   %r14,%r14
004e   632ace:	74 0f                	je     632adf <print_insn_state+0x5f>
0050   632ad0:	4c 89 f0             	mov    %r14,%rax
0053   632ad3:	48 f7 d0             	not    %rax
0056   632ad6:	48 21 d8             	and    %rbx,%rax
0059   632ad9:	0f 84 86 01 00 00    	je     632c65 <print_insn_state+0x1e5>
005f   632adf:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
0063   632ae3:	48 85 db             	test   %rbx,%rbx
0066   632ae6:	0f 84 09 01 00 00    	je     632bf5 <print_insn_state+0x175>
006c   632aec:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
0071   632af1:	49 8d af 78 06 00 00 	lea    0x678(%r15),%rbp
0078   632af8:	4d 8b af 78 06 00 00 	mov    0x678(%r15),%r13
007f   632aff:	48 89 ef             	mov    %rbp,%rdi
0082   632b02:	e8 00 00 00 00       	call   632b07 <print_insn_state+0x87>	632b03: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0087   632b07:	48 8b 00             	mov    (%rax),%rax
008a   632b0a:	4c 89 f1             	mov    %r14,%rcx
008d   632b0d:	48 09 c1             	or     %rax,%rcx
0090   632b10:	74 12                	je     632b24 <print_insn_state+0xa4>
0092   632b12:	48 89 de             	mov    %rbx,%rsi
0095   632b15:	4c 31 ee             	xor    %r13,%rsi
0098   632b18:	48 f7 d1             	not    %rcx
009b   632b1b:	48 21 f1             	and    %rsi,%rcx
009e   632b1e:	0f 84 54 01 00 00    	je     632c78 <print_insn_state+0x1f8>
00a4   632b24:	4c 39 eb             	cmp    %r13,%rbx
00a7   632b27:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
00ac   632b2c:	0f 85 c3 00 00 00    	jne    632bf5 <print_insn_state+0x175>
00b2   632b32:	4c 89 f8             	mov    %r15,%rax
00b5   632b35:	48 05 70 06 00 00    	add    $0x670,%rax
00bb   632b3b:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
00c0   632b40:	74 2c                	je     632b6e <print_insn_state+0xee>
00c2   632b42:	49 8d bf 88 06 00 00 	lea    0x688(%r15),%rdi
00c9   632b49:	45 8b af 88 06 00 00 	mov    0x688(%r15),%r13d
00d0   632b50:	e8 00 00 00 00       	call   632b55 <print_insn_state+0xd5>	632b51: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
00d5   632b55:	8b 08                	mov    (%rax),%ecx
00d7   632b57:	8b 02                	mov    (%rdx),%eax
00d9   632b59:	85 c9                	test   %ecx,%ecx
00db   632b5b:	0f 85 36 01 00 00    	jne    632c97 <print_insn_state+0x217>
00e1   632b61:	41 f7 c5 ef ff ff ff 	test   $0xffffffef,%r13d
00e8   632b68:	0f 85 4f 01 00 00    	jne    632cbd <print_insn_state+0x23d>
00ee   632b6e:	49 8d bf 60 2e 00 00 	lea    0x2e60(%r15),%rdi
00f5   632b75:	45 8b b7 60 2e 00 00 	mov    0x2e60(%r15),%r14d
00fc   632b7c:	e8 00 00 00 00       	call   632b81 <print_insn_state+0x101>	632b7d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0101   632b81:	8b 00                	mov    (%rax),%eax
0103   632b83:	8b 3a                	mov    (%rdx),%edi
0105   632b85:	41 8d 4e 04          	lea    0x4(%r14),%ecx
0109   632b89:	83 f9 29             	cmp    $0x29,%ecx
010c   632b8c:	bb 28 00 00 00       	mov    $0x28,%ebx
0111   632b91:	0f 43 d9             	cmovae %ecx,%ebx
0114   632b94:	ff cb                	dec    %ebx
0116   632b96:	83 cb 07             	or     $0x7,%ebx
0119   632b99:	44 29 f3             	sub    %r14d,%ebx
011c   632b9c:	41 89 84 24 50 06 00 00 	mov    %eax,0x650(%r12)
0124   632ba4:	41 89 bc 24 70 09 00 00 	mov    %edi,0x970(%r12)
012c   632bac:	41 c7 84 24 58 06 00 00 00 00 00 00 	movl   $0x0,0x658(%r12)
0138   632bb8:	41 c7 84 24 78 09 00 00 00 00 00 00 	movl   $0x0,0x978(%r12)
0144   632bc4:	49 c7 84 24 80 0c 00 00 00 00 00 00 	movq   $0x0,0xc80(%r12)
0150   632bd0:	85 c0                	test   %eax,%eax
0152   632bd2:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
0157   632bd7:	0f 85 b0 00 00 00    	jne    632c8d <print_insn_state+0x20d>
015d   632bdd:	4c 89 ff             	mov    %r15,%rdi
0160   632be0:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	632be3: R_X86_64_32S	.rodata.str1.1+0x7ccc7
0167   632be7:	89 da                	mov    %ebx,%edx
0169   632be9:	b9 20 00 00 00       	mov    $0x20,%ecx
016e   632bee:	e8 00 00 00 00       	call   632bf3 <print_insn_state+0x173>	632bef: R_X86_64_PLT32	bpf_verifier_log_write-0x4
0173   632bf3:	eb 40                	jmp    632c35 <print_insn_state+0x1b5>
0175   632bf5:	41 8b 1f             	mov    (%r15),%ebx
0178   632bf8:	4c 89 ff             	mov    %r15,%rdi
017b   632bfb:	e8 00 00 00 00       	call   632c00 <print_insn_state+0x180>	632bfc: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
0180   632c00:	8b 00                	mov    (%rax),%eax
0182   632c02:	8b 3a                	mov    (%rdx),%edi
0184   632c04:	41 89 84 24 50 06 00 00 	mov    %eax,0x650(%r12)
018c   632c0c:	41 89 bc 24 70 09 00 00 	mov    %edi,0x970(%r12)
0194   632c14:	49 c7 84 24 80 0c 00 00 00 00 00 00 	movq   $0x0,0xc80(%r12)
01a0   632c20:	85 c0                	test   %eax,%eax
01a2   632c22:	75 4d                	jne    632c71 <print_insn_state+0x1f1>
01a4   632c24:	4c 89 ff             	mov    %r15,%rdi
01a7   632c27:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	632c2a: R_X86_64_32S	.rodata.str1.1+0xf15a
01ae   632c2e:	89 da                	mov    %ebx,%edx
01b0   632c30:	e8 00 00 00 00       	call   632c35 <print_insn_state+0x1b5>	632c31: R_X86_64_PLT32	bpf_verifier_log_write-0x4
01b5   632c35:	4c 89 ff             	mov    %r15,%rdi
01b8   632c38:	4c 89 ee             	mov    %r13,%rsi
01bb   632c3b:	31 d2                	xor    %edx,%edx
01bd   632c3d:	e8 00 00 00 00       	call   632c42 <print_insn_state+0x1c2>	632c3e: R_X86_64_PLT32	print_verifier_state-0x4
01c2   632c42:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
01cb   632c4b:	48 3b 44 24 40       	cmp    0x40(%rsp),%rax
01d0   632c50:	0f 85 16 03 00 00    	jne    632f6c <print_insn_state+0x4ec>
01d6   632c56:	48 83 c4 48          	add    $0x48,%rsp
01da   632c5a:	5b                   	pop    %rbx
01db   632c5b:	41 5c                	pop    %r12
01dd   632c5d:	41 5d                	pop    %r13
01df   632c5f:	41 5e                	pop    %r14
01e1   632c61:	41 5f                	pop    %r15
01e3   632c63:	5d                   	pop    %rbp
01e4   632c64:	c3                   	ret
01e5   632c65:	89 ef                	mov    %ebp,%edi
01e7   632c67:	e8 00 00 00 00       	call   632c6c <print_insn_state+0x1ec>	632c68: R_X86_64_PLT32	__msan_warning-0x4
01ec   632c6c:	e9 6e fe ff ff       	jmp    632adf <print_insn_state+0x5f>
01f1   632c71:	e8 00 00 00 00       	call   632c76 <print_insn_state+0x1f6>	632c72: R_X86_64_PLT32	__msan_warning-0x4
01f6   632c76:	eb ac                	jmp    632c24 <print_insn_state+0x1a4>
01f8   632c78:	8b 7c 24 08          	mov    0x8(%rsp),%edi
01fc   632c7c:	48 85 c0             	test   %rax,%rax
01ff   632c7f:	74 02                	je     632c83 <print_insn_state+0x203>
0201   632c81:	8b 3a                	mov    (%rdx),%edi
0203   632c83:	e8 00 00 00 00       	call   632c88 <print_insn_state+0x208>	632c84: R_X86_64_PLT32	__msan_warning-0x4
0208   632c88:	e9 97 fe ff ff       	jmp    632b24 <print_insn_state+0xa4>
020d   632c8d:	e8 00 00 00 00       	call   632c92 <print_insn_state+0x212>	632c8e: R_X86_64_PLT32	__msan_warning-0x4
0212   632c92:	e9 46 ff ff ff       	jmp    632bdd <print_insn_state+0x15d>
0217   632c97:	89 44 24 10          	mov    %eax,0x10(%rsp)
021b   632c9b:	8b 7c 24 10          	mov    0x10(%rsp),%edi
021f   632c9f:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
0223   632ca3:	e8 00 00 00 00       	call   632ca8 <print_insn_state+0x228>	632ca4: R_X86_64_PLT32	__msan_warning-0x4
0228   632ca8:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
022c   632cac:	8b 44 24 10          	mov    0x10(%rsp),%eax
0230   632cb0:	41 f7 c5 ef ff ff ff 	test   $0xffffffef,%r13d
0237   632cb7:	0f 84 b1 fe ff ff    	je     632b6e <print_insn_state+0xee>
023d   632cbd:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
0241   632cc1:	89 44 24 10          	mov    %eax,0x10(%rsp)
0245   632cc5:	44 89 6c 24 0c       	mov    %r13d,0xc(%rsp)
024a   632cca:	48 ff cb             	dec    %rbx
024d   632ccd:	48 89 ef             	mov    %rbp,%rdi
0250   632cd0:	e8 00 00 00 00       	call   632cd5 <print_insn_state+0x255>	632cd1: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
0255   632cd5:	4c 89 30             	mov    %r14,(%rax)
0258   632cd8:	4d 85 f6             	test   %r14,%r14
025b   632cdb:	0f 85 b1 01 00 00    	jne    632e92 <print_insn_state+0x412>
0261   632ce1:	48 89 5d 00          	mov    %rbx,0x0(%rbp)
0265   632ce5:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
026a   632cea:	49 8b 6d 00          	mov    0x0(%r13),%rbp
026e   632cee:	4c 89 ef             	mov    %r13,%rdi
0271   632cf1:	e8 00 00 00 00       	call   632cf6 <print_insn_state+0x276>	632cf2: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0276   632cf6:	48 8b 00             	mov    (%rax),%rax
0279   632cf9:	4c 09 f0             	or     %r14,%rax
027c   632cfc:	0f 85 b1 01 00 00    	jne    632eb3 <print_insn_state+0x433>
0282   632d02:	48 39 dd             	cmp    %rbx,%rbp
0285   632d05:	76 18                	jbe    632d1f <print_insn_state+0x29f>
0287   632d07:	4c 89 ef             	mov    %r13,%rdi
028a   632d0a:	e8 00 00 00 00       	call   632d0f <print_insn_state+0x28f>	632d0b: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
028f   632d0f:	4c 89 30             	mov    %r14,(%rax)
0292   632d12:	4d 85 f6             	test   %r14,%r14
0295   632d15:	0f 85 e8 01 00 00    	jne    632f03 <print_insn_state+0x483>
029b   632d1b:	49 89 5d 00          	mov    %rbx,0x0(%r13)
029f   632d1f:	49 8d bf 80 06 00 00 	lea    0x680(%r15),%rdi
02a6   632d26:	4d 8b af 80 06 00 00 	mov    0x680(%r15),%r13
02ad   632d2d:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
02b2   632d32:	e8 00 00 00 00       	call   632d37 <print_insn_state+0x2b7>	632d33: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
02b7   632d37:	48 8b 28             	mov    (%rax),%rbp
02ba   632d3a:	8b 02                	mov    (%rdx),%eax
02bc   632d3c:	89 44 24 24          	mov    %eax,0x24(%rsp)
02c0   632d40:	48 85 ed             	test   %rbp,%rbp
02c3   632d43:	74 0f                	je     632d54 <print_insn_state+0x2d4>
02c5   632d45:	48 89 e8             	mov    %rbp,%rax
02c8   632d48:	48 f7 d0             	not    %rax
02cb   632d4b:	4c 21 e8             	and    %r13,%rax
02ce   632d4e:	0f 84 7d 01 00 00    	je     632ed1 <print_insn_state+0x451>
02d4   632d54:	4d 85 ed             	test   %r13,%r13
02d7   632d57:	8b 44 24 0c          	mov    0xc(%rsp),%eax
02db   632d5b:	8b 7c 24 10          	mov    0x10(%rsp),%edi
02df   632d5f:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
02e3   632d63:	0f 84 05 fe ff ff    	je     632b6e <print_insn_state+0xee>
02e9   632d69:	83 e1 08             	and    $0x8,%ecx
02ec   632d6c:	83 e0 08             	and    $0x8,%eax
02ef   632d6f:	85 c9                	test   %ecx,%ecx
02f1   632d71:	74 0a                	je     632d7d <print_insn_state+0x2fd>
02f3   632d73:	f7 d1                	not    %ecx
02f5   632d75:	21 c1                	and    %eax,%ecx
02f7   632d77:	0f 84 62 01 00 00    	je     632edf <print_insn_state+0x45f>
02fd   632d7d:	4c 89 6c 24 10       	mov    %r13,0x10(%rsp)
0302   632d82:	85 c0                	test   %eax,%eax
0304   632d84:	75 3e                	jne    632dc4 <print_insn_state+0x344>
0306   632d86:	49 8d bf 8c 06 00 00 	lea    0x68c(%r15),%rdi
030d   632d8d:	41 8b 87 8c 06 00 00 	mov    0x68c(%r15),%eax
0314   632d94:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0319   632d99:	e8 00 00 00 00       	call   632d9e <print_insn_state+0x31e>	632d9a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
031e   632d9e:	44 8b 28             	mov    (%rax),%r13d
0321   632da1:	8b 3a                	mov    (%rdx),%edi
0323   632da3:	45 85 ed             	test   %r13d,%r13d
0326   632da6:	0f 85 78 01 00 00    	jne    632f24 <print_insn_state+0x4a4>
032c   632dac:	48 89 d8             	mov    %rbx,%rax
032f   632daf:	48 c1 e8 20          	shr    $0x20,%rax
0333   632db3:	74 30                	je     632de5 <print_insn_state+0x365>
0335   632db5:	48 89 d8             	mov    %rbx,%rax
0338   632db8:	31 d2                	xor    %edx,%edx
033a   632dba:	48 f7 74 24 18       	divq   0x18(%rsp)
033f   632dbf:	48 89 d3             	mov    %rdx,%rbx
0342   632dc2:	eb 2b                	jmp    632def <print_insn_state+0x36f>
0344   632dc4:	ff c3                	inc    %ebx
0346   632dc6:	49 8d bf 8c 06 00 00 	lea    0x68c(%r15),%rdi
034d   632dcd:	41 8b 87 8c 06 00 00 	mov    0x68c(%r15),%eax
0354   632dd4:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0359   632dd9:	e8 00 00 00 00       	call   632dde <print_insn_state+0x35e>	632dda: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
035e   632dde:	44 8b 28             	mov    (%rax),%r13d
0361   632de1:	8b 3a                	mov    (%rdx),%edi
0363   632de3:	eb 0a                	jmp    632def <print_insn_state+0x36f>
0365   632de5:	89 d8                	mov    %ebx,%eax
0367   632de7:	31 d2                	xor    %edx,%edx
0369   632de9:	f7 74 24 18          	divl   0x18(%rsp)
036d   632ded:	89 d3                	mov    %edx,%ebx
036f   632def:	44 89 f0             	mov    %r14d,%eax
0372   632df2:	44 09 e8             	or     %r13d,%eax
0375   632df5:	0f 85 f6 00 00 00    	jne    632ef1 <print_insn_state+0x471>
037b   632dfb:	3b 5c 24 18          	cmp    0x18(%rsp),%ebx
037f   632dff:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
0384   632e04:	0f 83 64 fd ff ff    	jae    632b6e <print_insn_state+0xee>
038a   632e0a:	48 8d 7c 24 3f       	lea    0x3f(%rsp),%rdi
038f   632e0f:	be 01 00 00 00       	mov    $0x1,%esi
0394   632e14:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	632e17: R_X86_64_32S	.rodata+0x430b7d
039b   632e1b:	e8 00 00 00 00       	call   632e20 <print_insn_state+0x3a0>	632e1c: R_X86_64_PLT32	__msan_poison_alloca-0x4
03a0   632e20:	48 8d 7c 24 3f       	lea    0x3f(%rsp),%rdi
03a5   632e25:	e8 00 00 00 00       	call   632e2a <print_insn_state+0x3aa>	632e26: R_X86_64_PLT32	__msan_metadata_ptr_for_store_1-0x4
03aa   632e2a:	48 89 e2             	mov    %rsp,%rdx
03ad   632e2d:	c6 00 00             	movb   $0x0,(%rax)
03b0   632e30:	c6 44 24 3f 00       	movb   $0x0,0x3f(%rsp)
03b5   632e35:	44 89 f0             	mov    %r14d,%eax
03b8   632e38:	89 d9                	mov    %ebx,%ecx
03ba   632e3a:	49 01 cd             	add    %rcx,%r13
03bd   632e3d:	48 09 c5             	or     %rax,%rbp
03c0   632e40:	0f 85 f4 00 00 00    	jne    632f3a <print_insn_state+0x4ba>
03c6   632e46:	31 c0                	xor    %eax,%eax
03c8   632e48:	48 89 d4             	mov    %rdx,%rsp
03cb   632e4b:	4c 89 e9             	mov    %r13,%rcx
03ce   632e4e:	e8 00 00 00 00       	call   632e53 <print_insn_state+0x3d3>	632e4f: R_X86_64_PLT32	__put_user_1-0x4
03d3   632e53:	48 89 cb             	mov    %rcx,%rbx
03d6   632e56:	48 8d 74 24 3f       	lea    0x3f(%rsp),%rsi
03db   632e5b:	ba 01 00 00 00       	mov    $0x1,%edx
03e0   632e60:	4c 89 ef             	mov    %r13,%rdi
03e3   632e63:	31 c9                	xor    %ecx,%ecx
03e5   632e65:	e8 00 00 00 00       	call   632e6a <print_insn_state+0x3ea>	632e66: R_X86_64_PLT32	kmsan_copy_to_user-0x4
03ea   632e6a:	85 db                	test   %ebx,%ebx
03ec   632e6c:	0f 84 fc fc ff ff    	je     632b6e <print_insn_state+0xee>
03f2   632e72:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
03f7   632e77:	48 89 df             	mov    %rbx,%rdi
03fa   632e7a:	e8 00 00 00 00       	call   632e7f <print_insn_state+0x3ff>	632e7b: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
03ff   632e7f:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
0406   632e86:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
040d   632e8d:	e9 dc fc ff ff       	jmp    632b6e <print_insn_state+0xee>
0412   632e92:	49 89 d5             	mov    %rdx,%r13
0415   632e95:	8b 7c 24 08          	mov    0x8(%rsp),%edi
0419   632e99:	e8 00 00 00 00       	call   632e9e <print_insn_state+0x41e>	632e9a: R_X86_64_PLT32	__msan_chain_origin-0x4
041e   632e9e:	89 c0                	mov    %eax,%eax
0420   632ea0:	48 89 c1             	mov    %rax,%rcx
0423   632ea3:	48 c1 e1 20          	shl    $0x20,%rcx
0427   632ea7:	48 09 c1             	or     %rax,%rcx
042a   632eaa:	49 89 4d 00          	mov    %rcx,0x0(%r13)
042e   632eae:	e9 2e fe ff ff       	jmp    632ce1 <print_insn_state+0x261>
0433   632eb3:	8b 7c 24 08          	mov    0x8(%rsp),%edi
0437   632eb7:	4d 85 f6             	test   %r14,%r14
043a   632eba:	75 02                	jne    632ebe <print_insn_state+0x43e>
043c   632ebc:	8b 3a                	mov    (%rdx),%edi
043e   632ebe:	e8 00 00 00 00       	call   632ec3 <print_insn_state+0x443>	632ebf: R_X86_64_PLT32	__msan_warning-0x4
0443   632ec3:	48 39 dd             	cmp    %rbx,%rbp
0446   632ec6:	0f 87 3b fe ff ff    	ja     632d07 <print_insn_state+0x287>
044c   632ecc:	e9 4e fe ff ff       	jmp    632d1f <print_insn_state+0x29f>
0451   632ed1:	8b 7c 24 24          	mov    0x24(%rsp),%edi
0455   632ed5:	e8 00 00 00 00       	call   632eda <print_insn_state+0x45a>	632ed6: R_X86_64_PLT32	__msan_warning-0x4
045a   632eda:	e9 75 fe ff ff       	jmp    632d54 <print_insn_state+0x2d4>
045f   632edf:	89 44 24 0c          	mov    %eax,0xc(%rsp)
0463   632ee3:	e8 00 00 00 00       	call   632ee8 <print_insn_state+0x468>	632ee4: R_X86_64_PLT32	__msan_warning-0x4
0468   632ee8:	8b 44 24 0c          	mov    0xc(%rsp),%eax
046c   632eec:	e9 8c fe ff ff       	jmp    632d7d <print_insn_state+0x2fd>
0471   632ef1:	45 85 ed             	test   %r13d,%r13d
0474   632ef4:	0f 44 7c 24 08       	cmove  0x8(%rsp),%edi
0479   632ef9:	e8 00 00 00 00       	call   632efe <print_insn_state+0x47e>	632efa: R_X86_64_PLT32	__msan_warning-0x4
047e   632efe:	e9 f8 fe ff ff       	jmp    632dfb <print_insn_state+0x37b>
0483   632f03:	48 89 d5             	mov    %rdx,%rbp
0486   632f06:	8b 7c 24 08          	mov    0x8(%rsp),%edi
048a   632f0a:	e8 00 00 00 00       	call   632f0f <print_insn_state+0x48f>	632f0b: R_X86_64_PLT32	__msan_chain_origin-0x4
048f   632f0f:	89 c0                	mov    %eax,%eax
0491   632f11:	48 89 c1             	mov    %rax,%rcx
0494   632f14:	48 c1 e1 20          	shl    $0x20,%rcx
0498   632f18:	48 09 c1             	or     %rax,%rcx
049b   632f1b:	48 89 4d 00          	mov    %rcx,0x0(%rbp)
049f   632f1f:	e9 f7 fd ff ff       	jmp    632d1b <print_insn_state+0x29b>
04a4   632f24:	89 7c 24 04          	mov    %edi,0x4(%rsp)
04a8   632f28:	8b 7c 24 04          	mov    0x4(%rsp),%edi
04ac   632f2c:	e8 00 00 00 00       	call   632f31 <print_insn_state+0x4b1>	632f2d: R_X86_64_PLT32	__msan_warning-0x4
04b1   632f31:	8b 7c 24 04          	mov    0x4(%rsp),%edi
04b5   632f35:	e9 72 fe ff ff       	jmp    632dac <print_insn_state+0x32c>
04ba   632f3a:	48 85 c0             	test   %rax,%rax
04bd   632f3d:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
04c1   632f41:	0f 44 6c 24 24       	cmove  0x24(%rsp),%ebp
04c6   632f46:	89 ef                	mov    %ebp,%edi
04c8   632f48:	48 89 d3             	mov    %rdx,%rbx
04cb   632f4b:	e8 00 00 00 00       	call   632f50 <print_insn_state+0x4d0>	632f4c: R_X86_64_PLT32	__msan_warning-0x4
04d0   632f50:	31 c0                	xor    %eax,%eax
04d2   632f52:	48 89 dc             	mov    %rbx,%rsp
04d5   632f55:	4c 89 e9             	mov    %r13,%rcx
04d8   632f58:	e8 00 00 00 00       	call   632f5d <print_insn_state+0x4dd>	632f59: R_X86_64_PLT32	__put_user_1-0x4
04dd   632f5d:	48 89 cb             	mov    %rcx,%rbx
04e0   632f60:	89 ef                	mov    %ebp,%edi
04e2   632f62:	e8 00 00 00 00       	call   632f67 <print_insn_state+0x4e7>	632f63: R_X86_64_PLT32	__msan_warning-0x4
04e7   632f67:	e9 ea fe ff ff       	jmp    632e56 <print_insn_state+0x3d6>
04ec   632f6c:	e8 00 00 00 00       	call   632f71 <print_insn_state+0x4f1>	632f6d: R_X86_64_PLT32	__stack_chk_fail-0x4
04f1   632f71:	cc                   	int3
04f2   632f72:	cc                   	int3
04f3   632f73:	cc                   	int3
04f4   632f74:	cc                   	int3
04f5   632f75:	cc                   	int3
04f6   632f76:	cc                   	int3
04f7   632f77:	cc                   	int3
04f8   632f78:	cc                   	int3
04f9   632f79:	cc                   	int3
04fa   632f7a:	cc                   	int3
04fb   632f7b:	cc                   	int3
04fc   632f7c:	cc                   	int3
04fd   632f7d:	cc                   	int3
04fe   632f7e:	cc                   	int3
04ff   632f7f:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
