Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A8E4F1EC;
	Mon, 29 Jan 2024 07:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706515123; cv=none; b=hvxv6IZCK3zAAgh+NGzSPbnyCb9ZjnSAuc/sqroLCqcrIFmGqGvaBw7jmXUmY0vm135yyLl04jW2BeHUsG+J2nVYWqzSVbtCUibtCcC9D+HwikJ1wvFWesFHkq/R+diIJJvqkvd6wgMrFm64hmtaw1JteKYsm7uPCrFWi/PcUXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706515123; c=relaxed/simple;
	bh=Tk8KUnKV9lRuWunUNEWeTKjr5NmSgZeYfQJVYtCqCFc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J7AJpRnPyhBuxsQ2A+bOiuHfxcCTt6ukH9DoyUoPTu6QpuN1a9zPANRMTUVjt+unanYLMI6rYjuhzXE7Cz2wgsP6SRAAG4yOS+ZS63PvNvdKTMbQY2ne6GTo29jxYB7JV7pBOE8AbhO6t6CCdrBsqjSmZyyS5TvKIxM7H2OCIL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fSowee5n; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fSowee5n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706515122; x=1738051122;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Tk8KUnKV9lRuWunUNEWeTKjr5NmSgZeYfQJVYtCqCFc=;
  b=fSowee5nuNAp4qsRvG18ymAI7/37B7FFJMYrbw0J9AKBtdihUpJqJ9Fg
   aE6qR/+2bPFZOWZke/ZBaGBwgLOA4Nq8Y0Pz0DgfrjvD1n90azIAk0jNK
   kmtwtIew92BtGD6I5+aAnn9vEoehb+tUOB2HAfrUm3GSMfq0gVE2gK1rY
   y9W+qCCBgTLf02psLAf+RZHndI4NhMF8iiMOM0DPiz9VPdYFxE+C4QhBS
   kxqW7/PJTDHfy02wc2FvEkWuHFu8Rdff2ZeFOJ+S6zWYYpYjl3ZqVAzjE
   QBsrWAMZv3c88f/sPPNzsvSwesy9UgeLRvuweQ/7udsFLyuJtp5t2tZAC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="21408676"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="21408676"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 23:58:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="877982461"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="877982461"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Jan 2024 23:58:37 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUMXL-00049I-10;
	Mon, 29 Jan 2024 07:58:35 +0000
Date: Mon, 29 Jan 2024 15:58:31 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [ardb:x86-pie-for-sev-v2 14/15] arch/x86/lib/cmdline.o: warning:
 objtool: __cmdline_find_option+0x8a: can't find switch jump table
Message-ID: <202401291515.ikHJD5qH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Ard Biesheuvel <ardb@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v2
head:   b8b16573b6d0090db2f530fb9c5f049650806e61
commit: 5f61b62f512b52edc3d489a5b335ad2aee489484 [14/15] x86/sev: Use PIC codegen for early SEV startup code
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240129/202401291515.ikHJD5qH-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401291515.ikHJD5qH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401291515.ikHJD5qH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/lib/cmdline.o: warning: objtool: __cmdline_find_option+0x8a: can't find switch jump table
--
>> arch/x86/kernel/sev.o: warning: objtool: vc_raw_handle_exception+0xab: can't find switch jump table


objdump-func vmlinux.o __cmdline_find_option:
0000 0000000000e1b960 <__cmdline_find_option_bool>:
0000   e1b960:	48 85 ff             	test   %rdi,%rdi
0003   e1b963:	74 7a                	je     e1b9df <__cmdline_find_option_bool+0x7f>
0005   e1b965:	31 c9                	xor    %ecx,%ecx
0007   e1b967:	45 31 c9             	xor    %r9d,%r9d
000a   e1b96a:	31 d2                	xor    %edx,%edx
000c   e1b96c:	31 c0                	xor    %eax,%eax
000e   e1b96e:	eb 1b                	jmp    e1b98b <__cmdline_find_option_bool+0x2b>
0010   e1b970:	45 84 c0             	test   %r8b,%r8b
0013   e1b973:	74 67                	je     e1b9dc <__cmdline_find_option_bool+0x7c>
0015   e1b975:	45 31 c9             	xor    %r9d,%r9d
0018   e1b978:	41 80 f8 21          	cmp    $0x21,%r8b
001c   e1b97c:	41 0f 93 c1          	setae  %r9b
0020   e1b980:	45 01 c9             	add    %r9d,%r9d
0023   e1b983:	81 f9 00 08 00 00    	cmp    $0x800,%ecx
0029   e1b989:	74 51                	je     e1b9dc <__cmdline_find_option_bool+0x7c>
002b   e1b98b:	44 0f b6 04 0f       	movzbl (%rdi,%rcx,1),%r8d
0030   e1b990:	48 ff c1             	inc    %rcx
0033   e1b993:	41 83 f9 02          	cmp    $0x2,%r9d
0037   e1b997:	74 d7                	je     e1b970 <__cmdline_find_option_bool+0x10>
0039   e1b999:	41 83 f9 01          	cmp    $0x1,%r9d
003d   e1b99d:	74 18                	je     e1b9b7 <__cmdline_find_option_bool+0x57>
003f   e1b99f:	45 85 c9             	test   %r9d,%r9d
0042   e1b9a2:	75 df                	jne    e1b983 <__cmdline_find_option_bool+0x23>
0044   e1b9a4:	45 84 c0             	test   %r8b,%r8b
0047   e1b9a7:	74 33                	je     e1b9dc <__cmdline_find_option_bool+0x7c>
0049   e1b9a9:	45 31 c9             	xor    %r9d,%r9d
004c   e1b9ac:	41 80 f8 21          	cmp    $0x21,%r8b
0050   e1b9b0:	72 d1                	jb     e1b983 <__cmdline_find_option_bool+0x23>
0052   e1b9b2:	89 c8                	mov    %ecx,%eax
0054   e1b9b4:	48 89 f2             	mov    %rsi,%rdx
0057   e1b9b7:	44 0f b6 12          	movzbl (%rdx),%r10d
005b   e1b9bb:	45 84 d2             	test   %r10b,%r10b
005e   e1b9be:	74 15                	je     e1b9d5 <__cmdline_find_option_bool+0x75>
0060   e1b9c0:	45 84 c0             	test   %r8b,%r8b
0063   e1b9c3:	74 17                	je     e1b9dc <__cmdline_find_option_bool+0x7c>
0065   e1b9c5:	48 ff c2             	inc    %rdx
0068   e1b9c8:	41 b9 01 00 00 00    	mov    $0x1,%r9d
006e   e1b9ce:	45 38 d0             	cmp    %r10b,%r8b
0071   e1b9d1:	75 a2                	jne    e1b975 <__cmdline_find_option_bool+0x15>
0073   e1b9d3:	eb ae                	jmp    e1b983 <__cmdline_find_option_bool+0x23>
0075   e1b9d5:	41 80 f8 20          	cmp    $0x20,%r8b
0079   e1b9d9:	77 9a                	ja     e1b975 <__cmdline_find_option_bool+0x15>
007b   e1b9db:	c3                   	ret
007c   e1b9dc:	31 c0                	xor    %eax,%eax
007e   e1b9de:	c3                   	ret
007f   e1b9df:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
0084   e1b9e4:	c3                   	ret
0085   e1b9e5:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
0000 0000000000001970 <__cmdline_find_option>:
0000     1970:	55                   	push   %rbp
0001     1971:	41 57                	push   %r15
0003     1973:	41 56                	push   %r14
0005     1975:	41 55                	push   %r13
0007     1977:	41 54                	push   %r12
0009     1979:	53                   	push   %rbx
000a     197a:	48 83 ec 20          	sub    $0x20,%rsp
000e     197e:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
0012     1982:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
0017     1987:	48 85 ff             	test   %rdi,%rdi
001a     198a:	0f 84 0c 01 00 00    	je     1a9c <__cmdline_find_option+0x12c>
0020     1990:	49 89 fc             	mov    %rdi,%r12
0023     1993:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%rsp)
002a     199a:	45 31 ed             	xor    %r13d,%r13d
002d     199d:	48 8d 2d 00 00 00 00 	lea    0x0(%rip),%rbp        # 19a4 <__cmdline_find_option+0x34>	19a0: R_X86_64_PC32	.rodata+0x183e9c
0034     19a4:	31 c9                	xor    %ecx,%ecx
0036     19a6:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
003b     19ab:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
0040     19b0:	45 31 ff             	xor    %r15d,%r15d
0043     19b3:	eb 29                	jmp    19de <__cmdline_find_option+0x6e>
0045     19b5:	0f b6 fb             	movzbl %bl,%edi
0048     19b8:	e8 00 00 00 00       	call   19bd <__cmdline_find_option+0x4d>	19b9: R_X86_64_PLT32	.text+0xe1b9ec
004d     19bd:	31 c9                	xor    %ecx,%ecx
004f     19bf:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
0054     19c4:	85 c0                	test   %eax,%eax
0056     19c6:	74 37                	je     19ff <__cmdline_find_option+0x8f>
0058     19c8:	4d 89 fe             	mov    %r15,%r14
005b     19cb:	49 ff c5             	inc    %r13
005e     19ce:	4d 89 f7             	mov    %r14,%r15
0061     19d1:	41 81 fd 00 08 00 00 	cmp    $0x800,%r13d
0068     19d8:	0f 84 aa 00 00 00    	je     1a88 <__cmdline_find_option+0x118>
006e     19de:	43 0f b6 1c 2c       	movzbl (%r12,%r13,1),%ebx
0073     19e3:	84 db                	test   %bl,%bl
0075     19e5:	0f 84 9d 00 00 00    	je     1a88 <__cmdline_find_option+0x118>
007b     19eb:	83 f9 03             	cmp    $0x3,%ecx
007e     19ee:	77 d8                	ja     19c8 <__cmdline_find_option+0x58>
0080     19f0:	89 c8                	mov    %ecx,%eax
0082     19f2:	48 63 44 85 00       	movslq 0x0(%rbp,%rax,4),%rax
0087     19f7:	48 01 e8             	add    %rbp,%rax
008a     19fa:	ff e0                	jmp    *%rax
008c     19fc:	4d 89 fe             	mov    %r15,%r14
008f     19ff:	41 0f b6 06          	movzbl (%r14),%eax
0093     1a03:	80 fb 3d             	cmp    $0x3d,%bl
0096     1a06:	75 5a                	jne    1a62 <__cmdline_find_option+0xf2>
0098     1a08:	84 c0                	test   %al,%al
009a     1a0a:	75 56                	jne    1a62 <__cmdline_find_option+0xf2>
009c     1a0c:	c7 04 24 00 00 00 00 	movl   $0x0,(%rsp)
00a3     1a13:	b9 03 00 00 00       	mov    $0x3,%ecx
00a8     1a18:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
00ad     1a1d:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
00b2     1a22:	eb a7                	jmp    19cb <__cmdline_find_option+0x5b>
00b4     1a24:	4d 89 fe             	mov    %r15,%r14
00b7     1a27:	eb 49                	jmp    1a72 <__cmdline_find_option+0x102>
00b9     1a29:	0f b6 fb             	movzbl %bl,%edi
00bc     1a2c:	e8 00 00 00 00       	call   1a31 <__cmdline_find_option+0xc1>	1a2d: R_X86_64_PLT32	.text+0xe1b9ec
00c1     1a31:	31 c9                	xor    %ecx,%ecx
00c3     1a33:	85 c0                	test   %eax,%eax
00c5     1a35:	75 91                	jne    19c8 <__cmdline_find_option+0x58>
00c7     1a37:	8b 04 24             	mov    (%rsp),%eax
00ca     1a3a:	ff c0                	inc    %eax
00cc     1a3c:	b9 03 00 00 00       	mov    $0x3,%ecx
00d1     1a41:	89 04 24             	mov    %eax,(%rsp)
00d4     1a44:	3b 44 24 04          	cmp    0x4(%rsp),%eax
00d8     1a48:	0f 8d 7a ff ff ff    	jge    19c8 <__cmdline_find_option+0x58>
00de     1a4e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
00e3     1a53:	88 18                	mov    %bl,(%rax)
00e5     1a55:	48 ff c0             	inc    %rax
00e8     1a58:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
00ed     1a5d:	e9 66 ff ff ff       	jmp    19c8 <__cmdline_find_option+0x58>
00f2     1a62:	49 ff c6             	inc    %r14
00f5     1a65:	b9 01 00 00 00       	mov    $0x1,%ecx
00fa     1a6a:	38 c3                	cmp    %al,%bl
00fc     1a6c:	0f 84 59 ff ff ff    	je     19cb <__cmdline_find_option+0x5b>
0102     1a72:	0f b6 fb             	movzbl %bl,%edi
0105     1a75:	e8 00 00 00 00       	call   1a7a <__cmdline_find_option+0x10a>	1a76: R_X86_64_PLT32	.text+0xe1b9ec
010a     1a7a:	31 c9                	xor    %ecx,%ecx
010c     1a7c:	85 c0                	test   %eax,%eax
010e     1a7e:	0f 94 c1             	sete   %cl
0111     1a81:	01 c9                	add    %ecx,%ecx
0113     1a83:	e9 43 ff ff ff       	jmp    19cb <__cmdline_find_option+0x5b>
0118     1a88:	83 7c 24 04 00       	cmpl   $0x0,0x4(%rsp)
011d     1a8d:	74 08                	je     1a97 <__cmdline_find_option+0x127>
011f     1a8f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0124     1a94:	c6 00 00             	movb   $0x0,(%rax)
0127     1a97:	8b 04 24             	mov    (%rsp),%eax
012a     1a9a:	eb 05                	jmp    1aa1 <__cmdline_find_option+0x131>
012c     1a9c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
0131     1aa1:	48 83 c4 20          	add    $0x20,%rsp
0135     1aa5:	5b                   	pop    %rbx
0136     1aa6:	41 5c                	pop    %r12
0138     1aa8:	41 5d                	pop    %r13
013a     1aaa:	41 5e                	pop    %r14
013c     1aac:	41 5f                	pop    %r15
013e     1aae:	5d                   	pop    %rbp
013f     1aaf:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
