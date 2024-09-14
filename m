Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D9D1CF2A7;
	Sat, 14 Sep 2024 18:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726337298; cv=none; b=lbCL7IWq7AB1yBaeE4sBfAfd0lvqiA4Fk942VcO5eCQ6Kdqs2ZdLr8FPQT60TBdYBHB3vGdtDGG4H1HBMdnLeYtA8Gol98HWyfG12w+j1enNzmuV8Sjnp/gfYiwm51YTuUOJl+eIsnMfqJW6juitu0IRPrEuU8CDF5GaayLwHV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726337298; c=relaxed/simple;
	bh=/KWrybP3RzbLA7o+2XDTUeMAr2PLqtPfZDVZbt8wTfQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a91haxqZQjL5TFebOkybAyRNBFln04pT3BZe/sfAn/1m1EMRMtakA1wJs21RM9zZ/xeESn6UzBepDT+9k1HKzYRUmvXjlYhSOb4n/znRxBwyZV0w6oVT4wjZcYiAQfTRe36BdfL0lYf1FwUz75N7JNzK2NHFl4ayke5GOQ6ebaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TgeSE6Qd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TgeSE6Qd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726337296; x=1757873296;
  h=date:from:cc:subject:message-id:mime-version;
  bh=/KWrybP3RzbLA7o+2XDTUeMAr2PLqtPfZDVZbt8wTfQ=;
  b=TgeSE6QdgB+8ftpX1i3JmlOa2zrWBLF5CR3ZvjHDzXb38utoPyXxu/KD
   UZBLri+JxcLWXKXpkOFni1EAqhORfsMSOjt6KNOpSKDc8QVQzeYMWjdNk
   rlSCDjTUvzo2UqzwPhqCy+/6i89pYmtp4AVBYoIsT/5gQGdcy8FciLT7a
   6rksAoxZ096t0pNHhP2wOMmsadGp7939l6iVHLS7xErR67CVc4iYxs1QH
   fZzrpGY1vE1U55aD/jSTvcN8IoJ7UVssrTX9AqqohIhN5DCMpIGrdt/7A
   kKLm5Xt9OBolVV/FULKdpL5SZ87SPHGELKhfhDCxcznbHyOU6QoGPFqbq
   Q==;
X-CSE-ConnectionGUID: 3hZ/GjSfS5mZzTFzfZcfiw==
X-CSE-MsgGUID: 2Dr4pA9sQySdx1U86+Ki1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="35806443"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="35806443"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 11:08:15 -0700
X-CSE-ConnectionGUID: LAPxkwyjTY6Seoes+iUrHg==
X-CSE-MsgGUID: glC/yfo4TAWhL7Srfep16A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="68067909"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Sep 2024 11:08:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spXBr-00082k-2E;
	Sat, 14 Sep 2024 18:08:11 +0000
Date: Sun, 15 Sep 2024 02:07:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [sudeep-holla:android13-5.10/ffa 2043/9999] mm/userfaultfd.o:
 warning: objtool: pfn_pte()+0xc1: unreachable instruction
Message-ID: <202409150234.w6OXxECf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Axel Rasmussen <axelrasmussen@google.com>
CC: Suren Baghdasaryan <surenb@google.com>
CC: Peter Xu <peterx@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Lokesh Gidra <lokeshgidra@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.10/ffa
head:   9e12ac4f9c69befe08119567c073adc938aafc4d
commit: 0b161cf6fc3df505fc34731a732fa9dca3c3989e [2043/9999] FROMGIT: userfaultfd/shmem: modify shmem_mfill_atomic_pte to use install_pte()
config: x86_64-buildonly-randconfig-003-20240912 (https://download.01.org/0day-ci/archive/20240915/202409150234.w6OXxECf-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409150234.w6OXxECf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150234.w6OXxECf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/userfaultfd.o: warning: objtool: pfn_pte()+0xc1: unreachable instruction


objdump-func vmlinux.o pfn_pte:
0000 0000000000030c50 <pfn_pte>:
0000    30c50:	55                   	push   %rbp
0001    30c51:	48 89 e5             	mov    %rsp,%rbp
0004    30c54:	41 57                	push   %r15
0006    30c56:	41 56                	push   %r14
0008    30c58:	41 55                	push   %r13
000a    30c5a:	41 54                	push   %r12
000c    30c5c:	53                   	push   %rbx
000d    30c5d:	49 89 f6             	mov    %rsi,%r14
0010    30c60:	31 f6                	xor    %esi,%esi
0012    30c62:	48 89 fb             	mov    %rdi,%rbx
0015    30c65:	41 bd 00 00 00 00    	mov    $0x0,%r13d
001b    30c6b:	41 bc 00 00 00 00    	mov    $0x0,%r12d
0021    30c71:	41 f6 c6 01          	test   $0x1,%r14b
0025    30c75:	4d 89 f7             	mov    %r14,%r15
0028    30c78:	74 36                	je     30cb0 <pfn_pte+0x60>
002a    30c7a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	30c7d: R_X86_64_32S	__supported_pte_mask
0031    30c81:	e8 00 00 00 00       	call   30c86 <pfn_pte+0x36>	30c82: R_X86_64_PLT32	__asan_load8_noabort-0x4
0036    30c86:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 30c8d <pfn_pte+0x3d>	30c89: R_X86_64_PC32	__supported_pte_mask-0x4
003d    30c8d:	31 f6                	xor    %esi,%esi
003f    30c8f:	4d 89 f7             	mov    %r14,%r15
0042    30c92:	4c 21 f0             	and    %r14,%rax
0045    30c95:	4c 39 f0             	cmp    %r14,%rax
0048    30c98:	74 16                	je     30cb0 <pfn_pte+0x60>
004a    30c9a:	0f b6 35 00 00 00 00 	movzbl 0x0(%rip),%esi        # 30ca1 <pfn_pte+0x51>	30c9d: R_X86_64_PC32	.data.once+0x1
0051    30ca1:	41 bc 01 00 00 00    	mov    $0x1,%r12d
0057    30ca7:	49 89 c7             	mov    %rax,%r15
005a    30caa:	83 f6 01             	xor    $0x1,%esi
005d    30cad:	41 89 f5             	mov    %esi,%r13d
0060    30cb0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	30cb3: R_X86_64_32S	_ftrace_annotated_branch+0x4f80
0067    30cb7:	31 d2                	xor    %edx,%edx
0069    30cb9:	31 c9                	xor    %ecx,%ecx
006b    30cbb:	e8 00 00 00 00       	call   30cc0 <pfn_pte+0x70>	30cbc: R_X86_64_PLT32	ftrace_likely_update-0x4
0070    30cc0:	45 84 ed             	test   %r13b,%r13b
0073    30cc3:	74 64                	je     30d29 <pfn_pte+0xd9>
0075    30cc5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	30cc8: R_X86_64_32S	_ftrace_annotated_branch+0x4fb0
007c    30ccc:	be 01 00 00 00       	mov    $0x1,%esi
0081    30cd1:	31 d2                	xor    %edx,%edx
0083    30cd3:	b9 01 00 00 00       	mov    $0x1,%ecx
0088    30cd8:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 30cdf <pfn_pte+0x8f>	30cda: R_X86_64_PC32	.data.once
008f    30cdf:	e8 00 00 00 00       	call   30ce4 <pfn_pte+0x94>	30ce0: R_X86_64_PLT32	ftrace_likely_update-0x4
0094    30ce4:	4d 89 fd             	mov    %r15,%r13
0097    30ce7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	30cea: R_X86_64_32S	__supported_pte_mask
009e    30cee:	4d 31 f5             	xor    %r14,%r13
00a1    30cf1:	e8 00 00 00 00       	call   30cf6 <pfn_pte+0xa6>	30cf2: R_X86_64_PLT32	__asan_load8_noabort-0x4
00a6    30cf6:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 30cfd <pfn_pte+0xad>	30cf9: R_X86_64_PC32	__supported_pte_mask-0x4
00ad    30cfd:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	30d00: R_X86_64_32S	.rodata+0x138e0
00b4    30d04:	4c 89 f6             	mov    %r14,%rsi
00b7    30d07:	4c 89 ea             	mov    %r13,%rdx
00ba    30d0a:	e8 00 00 00 00       	call   30d0f <pfn_pte+0xbf>	30d0b: R_X86_64_PLT32	__warn_printk-0x4
00bf    30d0f:	0f 0b                	ud2
00c1    30d11:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	30d14: R_X86_64_32S	_ftrace_annotated_branch+0x4fe0
00c8    30d18:	be 01 00 00 00       	mov    $0x1,%esi
00cd    30d1d:	31 d2                	xor    %edx,%edx
00cf    30d1f:	b9 01 00 00 00       	mov    $0x1,%ecx
00d4    30d24:	e8 00 00 00 00       	call   30d29 <pfn_pte+0xd9>	30d25: R_X86_64_PLT32	ftrace_likely_update-0x4
00d9    30d29:	41 f6 c6 01          	test   $0x1,%r14b
00dd    30d2d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	30d30: R_X86_64_32S	_ftrace_annotated_branch+0x5010
00e4    30d34:	44 89 e6             	mov    %r12d,%esi
00e7    30d37:	0f 94 c0             	sete   %al
00ea    30d3a:	48 c1 e3 0c          	shl    $0xc,%rbx
00ee    30d3e:	4d 85 f6             	test   %r14,%r14
00f1    30d41:	0f 95 c1             	setne  %cl
00f4    30d44:	31 d2                	xor    %edx,%edx
00f6    30d46:	20 c1                	and    %al,%cl
00f8    30d48:	0f b6 c1             	movzbl %cl,%eax
00fb    30d4b:	31 c9                	xor    %ecx,%ecx
00fd    30d4d:	48 f7 d8             	neg    %rax
0100    30d50:	48 31 d8             	xor    %rbx,%rax
0103    30d53:	48 bb 00 f0 ff ff ff ff 0f 00 	movabs $0xffffffffff000,%rbx
010d    30d5d:	48 21 c3             	and    %rax,%rbx
0110    30d60:	e8 00 00 00 00       	call   30d65 <pfn_pte+0x115>	30d61: R_X86_64_PLT32	ftrace_likely_update-0x4
0115    30d65:	49 09 df             	or     %rbx,%r15
0118    30d68:	4c 89 f8             	mov    %r15,%rax
011b    30d6b:	5b                   	pop    %rbx
011c    30d6c:	41 5c                	pop    %r12
011e    30d6e:	41 5d                	pop    %r13
0120    30d70:	41 5e                	pop    %r14
0122    30d72:	41 5f                	pop    %r15
0124    30d74:	5d                   	pop    %rbp
0125    30d75:	c3                   	ret
0126    30d76:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0000 00000000000691e0 <pfn_pte>:
0000    691e0:	55                   	push   %rbp
0001    691e1:	48 89 e5             	mov    %rsp,%rbp
0004    691e4:	41 57                	push   %r15
0006    691e6:	41 56                	push   %r14
0008    691e8:	41 55                	push   %r13
000a    691ea:	41 54                	push   %r12
000c    691ec:	53                   	push   %rbx
000d    691ed:	49 89 f6             	mov    %rsi,%r14
0010    691f0:	31 f6                	xor    %esi,%esi
0012    691f2:	48 89 fb             	mov    %rdi,%rbx
0015    691f5:	41 bd 00 00 00 00    	mov    $0x0,%r13d
001b    691fb:	41 bc 00 00 00 00    	mov    $0x0,%r12d
0021    69201:	41 f6 c6 01          	test   $0x1,%r14b
0025    69205:	4d 89 f7             	mov    %r14,%r15
0028    69208:	74 2a                	je     69234 <pfn_pte+0x54>
002a    6920a:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 69211 <pfn_pte+0x31>	6920d: R_X86_64_PC32	__supported_pte_mask-0x4
0031    69211:	31 f6                	xor    %esi,%esi
0033    69213:	4d 89 f7             	mov    %r14,%r15
0036    69216:	4c 21 f0             	and    %r14,%rax
0039    69219:	4c 39 f0             	cmp    %r14,%rax
003c    6921c:	74 16                	je     69234 <pfn_pte+0x54>
003e    6921e:	0f b6 35 00 00 00 00 	movzbl 0x0(%rip),%esi        # 69225 <pfn_pte+0x45>	69221: R_X86_64_PC32	.data.once+0x30
0045    69225:	41 bc 01 00 00 00    	mov    $0x1,%r12d
004b    6922b:	49 89 c7             	mov    %rax,%r15
004e    6922e:	83 f6 01             	xor    $0x1,%esi
0051    69231:	41 89 f5             	mov    %esi,%r13d
0054    69234:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	69237: R_X86_64_32S	_ftrace_annotated_branch+0xc600
005b    6923b:	31 d2                	xor    %edx,%edx
005d    6923d:	31 c9                	xor    %ecx,%ecx
005f    6923f:	e8 00 00 00 00       	call   69244 <pfn_pte+0x64>	69240: R_X86_64_PLT32	ftrace_likely_update-0x4
0064    69244:	45 84 ed             	test   %r13b,%r13b
0067    69247:	74 55                	je     6929e <pfn_pte+0xbe>
0069    69249:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6924c: R_X86_64_32S	_ftrace_annotated_branch+0xc630
0070    69250:	be 01 00 00 00       	mov    $0x1,%esi
0075    69255:	31 d2                	xor    %edx,%edx
0077    69257:	b9 01 00 00 00       	mov    $0x1,%ecx
007c    6925c:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 69263 <pfn_pte+0x83>	6925e: R_X86_64_PC32	.data.once+0x2f
0083    69263:	e8 00 00 00 00       	call   69268 <pfn_pte+0x88>	69264: R_X86_64_PLT32	ftrace_likely_update-0x4
0088    69268:	4c 89 fa             	mov    %r15,%rdx
008b    6926b:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 69272 <pfn_pte+0x92>	6926e: R_X86_64_PC32	__supported_pte_mask-0x4
0092    69272:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	69275: R_X86_64_32S	.rodata+0x335e0
0099    69279:	4c 89 f6             	mov    %r14,%rsi
009c    6927c:	4c 31 f2             	xor    %r14,%rdx
009f    6927f:	e8 00 00 00 00       	call   69284 <pfn_pte+0xa4>	69280: R_X86_64_PLT32	__warn_printk-0x4
00a4    69284:	0f 0b                	ud2
00a6    69286:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	69289: R_X86_64_32S	_ftrace_annotated_branch+0xc660
00ad    6928d:	be 01 00 00 00       	mov    $0x1,%esi
00b2    69292:	31 d2                	xor    %edx,%edx
00b4    69294:	b9 01 00 00 00       	mov    $0x1,%ecx
00b9    69299:	e8 00 00 00 00       	call   6929e <pfn_pte+0xbe>	6929a: R_X86_64_PLT32	ftrace_likely_update-0x4
00be    6929e:	41 f6 c6 01          	test   $0x1,%r14b
00c2    692a2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	692a5: R_X86_64_32S	_ftrace_annotated_branch+0xc690
00c9    692a9:	44 89 e6             	mov    %r12d,%esi
00cc    692ac:	0f 94 c0             	sete   %al
00cf    692af:	48 c1 e3 0c          	shl    $0xc,%rbx
00d3    692b3:	4d 85 f6             	test   %r14,%r14
00d6    692b6:	0f 95 c1             	setne  %cl
00d9    692b9:	31 d2                	xor    %edx,%edx
00db    692bb:	20 c1                	and    %al,%cl
00dd    692bd:	0f b6 c1             	movzbl %cl,%eax
00e0    692c0:	31 c9                	xor    %ecx,%ecx
00e2    692c2:	48 f7 d8             	neg    %rax
00e5    692c5:	48 31 d8             	xor    %rbx,%rax
00e8    692c8:	48 bb 00 f0 ff ff ff ff 0f 00 	movabs $0xffffffffff000,%rbx
00f2    692d2:	48 21 c3             	and    %rax,%rbx
00f5    692d5:	e8 00 00 00 00       	call   692da <pfn_pte+0xfa>	692d6: R_X86_64_PLT32	ftrace_likely_update-0x4
00fa    692da:	49 09 df             	or     %rbx,%r15
00fd    692dd:	4c 89 f8             	mov    %r15,%rax
0100    692e0:	5b                   	pop    %rbx
0101    692e1:	41 5c                	pop    %r12
0103    692e3:	41 5d                	pop    %r13
0105    692e5:	41 5e                	pop    %r14
0107    692e7:	41 5f                	pop    %r15
0109    692e9:	5d                   	pop    %rbp
010a    692ea:	c3                   	ret
010b    692eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0000 000000000006d630 <pfn_pte>:
0000    6d630:	55                   	push   %rbp
0001    6d631:	48 89 e5             	mov    %rsp,%rbp
0004    6d634:	41 57                	push   %r15
0006    6d636:	41 56                	push   %r14
0008    6d638:	41 55                	push   %r13
000a    6d63a:	41 54                	push   %r12
000c    6d63c:	53                   	push   %rbx
000d    6d63d:	49 89 f6             	mov    %rsi,%r14
0010    6d640:	31 f6                	xor    %esi,%esi
0012    6d642:	48 89 fb             	mov    %rdi,%rbx
0015    6d645:	41 bd 00 00 00 00    	mov    $0x0,%r13d
001b    6d64b:	41 bc 00 00 00 00    	mov    $0x0,%r12d
0021    6d651:	41 f6 c6 01          	test   $0x1,%r14b
0025    6d655:	4d 89 f7             	mov    %r14,%r15
0028    6d658:	74 36                	je     6d690 <pfn_pte+0x60>
002a    6d65a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6d65d: R_X86_64_32S	__supported_pte_mask
0031    6d661:	e8 00 00 00 00       	call   6d666 <pfn_pte+0x36>	6d662: R_X86_64_PLT32	__asan_load8_noabort-0x4
0036    6d666:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 6d66d <pfn_pte+0x3d>	6d669: R_X86_64_PC32	__supported_pte_mask-0x4
003d    6d66d:	31 f6                	xor    %esi,%esi
003f    6d66f:	4d 89 f7             	mov    %r14,%r15
0042    6d672:	4c 21 f0             	and    %r14,%rax
0045    6d675:	4c 39 f0             	cmp    %r14,%rax
0048    6d678:	74 16                	je     6d690 <pfn_pte+0x60>
004a    6d67a:	0f b6 35 00 00 00 00 	movzbl 0x0(%rip),%esi        # 6d681 <pfn_pte+0x51>	6d67d: R_X86_64_PC32	.data.once+0x38
0051    6d681:	41 bc 01 00 00 00    	mov    $0x1,%r12d
0057    6d687:	49 89 c7             	mov    %rax,%r15
005a    6d68a:	83 f6 01             	xor    $0x1,%esi
005d    6d68d:	41 89 f5             	mov    %esi,%r13d
0060    6d690:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6d693: R_X86_64_32S	_ftrace_annotated_branch+0xd710
0067    6d697:	31 d2                	xor    %edx,%edx
0069    6d699:	31 c9                	xor    %ecx,%ecx
006b    6d69b:	e8 00 00 00 00       	call   6d6a0 <pfn_pte+0x70>	6d69c: R_X86_64_PLT32	ftrace_likely_update-0x4
0070    6d6a0:	45 84 ed             	test   %r13b,%r13b
0073    6d6a3:	74 64                	je     6d709 <pfn_pte+0xd9>
0075    6d6a5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6d6a8: R_X86_64_32S	_ftrace_annotated_branch+0xd740
007c    6d6ac:	be 01 00 00 00       	mov    $0x1,%esi
0081    6d6b1:	31 d2                	xor    %edx,%edx
0083    6d6b3:	b9 01 00 00 00       	mov    $0x1,%ecx
0088    6d6b8:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 6d6bf <pfn_pte+0x8f>	6d6ba: R_X86_64_PC32	.data.once+0x37
008f    6d6bf:	e8 00 00 00 00       	call   6d6c4 <pfn_pte+0x94>	6d6c0: R_X86_64_PLT32	ftrace_likely_update-0x4
0094    6d6c4:	4d 89 fd             	mov    %r15,%r13
0097    6d6c7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6d6ca: R_X86_64_32S	__supported_pte_mask
009e    6d6ce:	4d 31 f5             	xor    %r14,%r13
00a1    6d6d1:	e8 00 00 00 00       	call   6d6d6 <pfn_pte+0xa6>	6d6d2: R_X86_64_PLT32	__asan_load8_noabort-0x4
00a6    6d6d6:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 6d6dd <pfn_pte+0xad>	6d6d9: R_X86_64_PC32	__supported_pte_mask-0x4
00ad    6d6dd:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6d6e0: R_X86_64_32S	.rodata+0x356e0
00b4    6d6e4:	4c 89 f6             	mov    %r14,%rsi
00b7    6d6e7:	4c 89 ea             	mov    %r13,%rdx
00ba    6d6ea:	e8 00 00 00 00       	call   6d6ef <pfn_pte+0xbf>	6d6eb: R_X86_64_PLT32	__warn_printk-0x4
00bf    6d6ef:	0f 0b                	ud2
00c1    6d6f1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6d6f4: R_X86_64_32S	_ftrace_annotated_branch+0xd770
00c8    6d6f8:	be 01 00 00 00       	mov    $0x1,%esi
00cd    6d6fd:	31 d2                	xor    %edx,%edx
00cf    6d6ff:	b9 01 00 00 00       	mov    $0x1,%ecx
00d4    6d704:	e8 00 00 00 00       	call   6d709 <pfn_pte+0xd9>	6d705: R_X86_64_PLT32	ftrace_likely_update-0x4
00d9    6d709:	41 f6 c6 01          	test   $0x1,%r14b
00dd    6d70d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6d710: R_X86_64_32S	_ftrace_annotated_branch+0xd7a0
00e4    6d714:	44 89 e6             	mov    %r12d,%esi
00e7    6d717:	0f 94 c0             	sete   %al
00ea    6d71a:	48 c1 e3 0c          	shl    $0xc,%rbx
00ee    6d71e:	4d 85 f6             	test   %r14,%r14
00f1    6d721:	0f 95 c1             	setne  %cl
00f4    6d724:	31 d2                	xor    %edx,%edx
00f6    6d726:	20 c1                	and    %al,%cl
00f8    6d728:	0f b6 c1             	movzbl %cl,%eax
00fb    6d72b:	31 c9                	xor    %ecx,%ecx
00fd    6d72d:	48 f7 d8             	neg    %rax
0100    6d730:	48 31 d8             	xor    %rbx,%rax
0103    6d733:	48 bb 00 f0 ff ff ff ff 0f 00 	movabs $0xffffffffff000,%rbx
010d    6d73d:	48 21 c3             	and    %rax,%rbx
0110    6d740:	e8 00 00 00 00       	call   6d745 <pfn_pte+0x115>	6d741: R_X86_64_PLT32	ftrace_likely_update-0x4
0115    6d745:	49 09 df             	or     %rbx,%r15
0118    6d748:	4c 89 f8             	mov    %r15,%rax
011b    6d74b:	5b                   	pop    %rbx
011c    6d74c:	41 5c                	pop    %r12
011e    6d74e:	41 5d                	pop    %r13
0120    6d750:	41 5e                	pop    %r14
0122    6d752:	41 5f                	pop    %r15
0124    6d754:	5d                   	pop    %rbp
0125    6d755:	c3                   	ret
0126    6d756:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0000 0000000000073ff0 <pfn_pte>:
0000    73ff0:	55                   	push   %rbp
0001    73ff1:	48 89 e5             	mov    %rsp,%rbp
0004    73ff4:	41 57                	push   %r15
0006    73ff6:	41 56                	push   %r14
0008    73ff8:	41 55                	push   %r13
000a    73ffa:	41 54                	push   %r12
000c    73ffc:	53                   	push   %rbx
000d    73ffd:	49 89 f6             	mov    %rsi,%r14
0010    74000:	31 f6                	xor    %esi,%esi
0012    74002:	48 89 fb             	mov    %rdi,%rbx
0015    74005:	41 bd 00 00 00 00    	mov    $0x0,%r13d
001b    7400b:	41 bc 00 00 00 00    	mov    $0x0,%r12d
0021    74011:	41 f6 c6 01          	test   $0x1,%r14b
0025    74015:	4d 89 f7             	mov    %r14,%r15
0028    74018:	74 36                	je     74050 <pfn_pte+0x60>
002a    7401a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	7401d: R_X86_64_32S	__supported_pte_mask
0031    74021:	e8 00 00 00 00       	call   74026 <pfn_pte+0x36>	74022: R_X86_64_PLT32	__asan_load8_noabort-0x4
0036    74026:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 7402d <pfn_pte+0x3d>	74029: R_X86_64_PC32	__supported_pte_mask-0x4
003d    7402d:	31 f6                	xor    %esi,%esi
003f    7402f:	4d 89 f7             	mov    %r14,%r15
0042    74032:	4c 21 f0             	and    %r14,%rax
0045    74035:	4c 39 f0             	cmp    %r14,%rax
0048    74038:	74 16                	je     74050 <pfn_pte+0x60>
004a    7403a:	0f b6 35 00 00 00 00 	movzbl 0x0(%rip),%esi        # 74041 <pfn_pte+0x51>	7403d: R_X86_64_PC32	.data.once+0x3a
0051    74041:	41 bc 01 00 00 00    	mov    $0x1,%r12d
0057    74047:	49 89 c7             	mov    %rax,%r15
005a    7404a:	83 f6 01             	xor    $0x1,%esi
005d    7404d:	41 89 f5             	mov    %esi,%r13d
0060    74050:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	74053: R_X86_64_32S	_ftrace_annotated_branch+0xea90
0067    74057:	31 d2                	xor    %edx,%edx
0069    74059:	31 c9                	xor    %ecx,%ecx
006b    7405b:	e8 00 00 00 00       	call   74060 <pfn_pte+0x70>	7405c: R_X86_64_PLT32	ftrace_likely_update-0x4
0070    74060:	45 84 ed             	test   %r13b,%r13b
0073    74063:	74 64                	je     740c9 <pfn_pte+0xd9>
0075    74065:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	74068: R_X86_64_32S	_ftrace_annotated_branch+0xeac0
007c    7406c:	be 01 00 00 00       	mov    $0x1,%esi
0081    74071:	31 d2                	xor    %edx,%edx
0083    74073:	b9 01 00 00 00       	mov    $0x1,%ecx
0088    74078:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 7407f <pfn_pte+0x8f>	7407a: R_X86_64_PC32	.data.once+0x39
008f    7407f:	e8 00 00 00 00       	call   74084 <pfn_pte+0x94>	74080: R_X86_64_PLT32	ftrace_likely_update-0x4
0094    74084:	4d 89 fd             	mov    %r15,%r13
0097    74087:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	7408a: R_X86_64_32S	__supported_pte_mask
009e    7408e:	4d 31 f5             	xor    %r14,%r13
00a1    74091:	e8 00 00 00 00       	call   74096 <pfn_pte+0xa6>	74092: R_X86_64_PLT32	__asan_load8_noabort-0x4
00a6    74096:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 7409d <pfn_pte+0xad>	74099: R_X86_64_PC32	__supported_pte_mask-0x4
00ad    7409d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	740a0: R_X86_64_32S	.rodata+0x36a20
00b4    740a4:	4c 89 f6             	mov    %r14,%rsi
00b7    740a7:	4c 89 ea             	mov    %r13,%rdx
00ba    740aa:	e8 00 00 00 00       	call   740af <pfn_pte+0xbf>	740ab: R_X86_64_PLT32	__warn_printk-0x4
00bf    740af:	0f 0b                	ud2
00c1    740b1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	740b4: R_X86_64_32S	_ftrace_annotated_branch+0xeaf0
00c8    740b8:	be 01 00 00 00       	mov    $0x1,%esi
00cd    740bd:	31 d2                	xor    %edx,%edx
00cf    740bf:	b9 01 00 00 00       	mov    $0x1,%ecx
00d4    740c4:	e8 00 00 00 00       	call   740c9 <pfn_pte+0xd9>	740c5: R_X86_64_PLT32	ftrace_likely_update-0x4
00d9    740c9:	41 f6 c6 01          	test   $0x1,%r14b
00dd    740cd:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	740d0: R_X86_64_32S	_ftrace_annotated_branch+0xeb20
00e4    740d4:	44 89 e6             	mov    %r12d,%esi
00e7    740d7:	0f 94 c0             	sete   %al
00ea    740da:	48 c1 e3 0c          	shl    $0xc,%rbx
00ee    740de:	4d 85 f6             	test   %r14,%r14
00f1    740e1:	0f 95 c1             	setne  %cl
00f4    740e4:	31 d2                	xor    %edx,%edx
00f6    740e6:	20 c1                	and    %al,%cl
00f8    740e8:	0f b6 c1             	movzbl %cl,%eax
00fb    740eb:	31 c9                	xor    %ecx,%ecx
00fd    740ed:	48 f7 d8             	neg    %rax
0100    740f0:	48 31 d8             	xor    %rbx,%rax
0103    740f3:	48 bb 00 f0 ff ff ff ff 0f 00 	movabs $0xffffffffff000,%rbx
010d    740fd:	48 21 c3             	and    %rax,%rbx
0110    74100:	e8 00 00 00 00       	call   74105 <pfn_pte+0x115>	74101: R_X86_64_PLT32	ftrace_likely_update-0x4
0115    74105:	49 09 df             	or     %rbx,%r15
0118    74108:	4c 89 f8             	mov    %r15,%rax
011b    7410b:	5b                   	pop    %rbx
011c    7410c:	41 5c                	pop    %r12
011e    7410e:	41 5d                	pop    %r13
0120    74110:	41 5e                	pop    %r14
0122    74112:	41 5f                	pop    %r15
0124    74114:	5d                   	pop    %rbp
0125    74115:	c3                   	ret
0126    74116:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0000 00000000003404c0 <pfn_pte>:
0000   3404c0:	55                   	push   %rbp
0001   3404c1:	48 89 e5             	mov    %rsp,%rbp
0004   3404c4:	41 57                	push   %r15
0006   3404c6:	41 56                	push   %r14
0008   3404c8:	41 55                	push   %r13
000a   3404ca:	41 54                	push   %r12
000c   3404cc:	53                   	push   %rbx
000d   3404cd:	49 89 f6             	mov    %rsi,%r14
0010   3404d0:	31 f6                	xor    %esi,%esi
0012   3404d2:	48 89 fb             	mov    %rdi,%rbx
0015   3404d5:	41 bd 00 00 00 00    	mov    $0x0,%r13d
001b   3404db:	41 bc 00 00 00 00    	mov    $0x0,%r12d
0021   3404e1:	41 f6 c6 01          	test   $0x1,%r14b
0025   3404e5:	4d 89 f7             	mov    %r14,%r15
0028   3404e8:	74 36                	je     340520 <pfn_pte+0x60>
002a   3404ea:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3404ed: R_X86_64_32S	__supported_pte_mask
0031   3404f1:	e8 00 00 00 00       	call   3404f6 <pfn_pte+0x36>	3404f2: R_X86_64_PLT32	__asan_load8_noabort-0x4
0036   3404f6:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 3404fd <pfn_pte+0x3d>	3404f9: R_X86_64_PC32	__supported_pte_mask-0x4
003d   3404fd:	31 f6                	xor    %esi,%esi
003f   3404ff:	4d 89 f7             	mov    %r14,%r15
0042   340502:	4c 21 f0             	and    %r14,%rax
0045   340505:	4c 39 f0             	cmp    %r14,%rax
0048   340508:	74 16                	je     340520 <pfn_pte+0x60>
004a   34050a:	0f b6 35 00 00 00 00 	movzbl 0x0(%rip),%esi        # 340511 <pfn_pte+0x51>	34050d: R_X86_64_PC32	.data.once+0xa1
0051   340511:	41 bc 01 00 00 00    	mov    $0x1,%r12d
0057   340517:	49 89 c7             	mov    %rax,%r15
005a   34051a:	83 f6 01             	xor    $0x1,%esi
005d   34051d:	41 89 f5             	mov    %esi,%r13d
0060   340520:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	340523: R_X86_64_32S	_ftrace_annotated_branch+0x57cf0
0067   340527:	31 d2                	xor    %edx,%edx
0069   340529:	31 c9                	xor    %ecx,%ecx
006b   34052b:	e8 00 00 00 00       	call   340530 <pfn_pte+0x70>	34052c: R_X86_64_PLT32	ftrace_likely_update-0x4
0070   340530:	45 84 ed             	test   %r13b,%r13b
0073   340533:	74 64                	je     340599 <pfn_pte+0xd9>
0075   340535:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	340538: R_X86_64_32S	_ftrace_annotated_branch+0x57d20
007c   34053c:	be 01 00 00 00       	mov    $0x1,%esi
0081   340541:	31 d2                	xor    %edx,%edx
0083   340543:	b9 01 00 00 00       	mov    $0x1,%ecx
0088   340548:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 34054f <pfn_pte+0x8f>	34054a: R_X86_64_PC32	.data.once+0xa0
008f   34054f:	e8 00 00 00 00       	call   340554 <pfn_pte+0x94>	340550: R_X86_64_PLT32	ftrace_likely_update-0x4
0094   340554:	4d 89 fd             	mov    %r15,%r13
0097   340557:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	34055a: R_X86_64_32S	__supported_pte_mask
009e   34055e:	4d 31 f5             	xor    %r14,%r13
00a1   340561:	e8 00 00 00 00       	call   340566 <pfn_pte+0xa6>	340562: R_X86_64_PLT32	__asan_load8_noabort-0x4
00a6   340566:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 34056d <pfn_pte+0xad>	340569: R_X86_64_PC32	__supported_pte_mask-0x4
00ad   34056d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	340570: R_X86_64_32S	.rodata+0x47a060
00b4   340574:	4c 89 f6             	mov    %r14,%rsi
00b7   340577:	4c 89 ea             	mov    %r13,%rdx
00ba   34057a:	e8 00 00 00 00       	call   34057f <pfn_pte+0xbf>	34057b: R_X86_64_PLT32	__warn_printk-0x4
00bf   34057f:	0f 0b                	ud2
00c1   340581:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	340584: R_X86_64_32S	_ftrace_annotated_branch+0x57d50
00c8   340588:	be 01 00 00 00       	mov    $0x1,%esi
00cd   34058d:	31 d2                	xor    %edx,%edx
00cf   34058f:	b9 01 00 00 00       	mov    $0x1,%ecx
00d4   340594:	e8 00 00 00 00       	call   340599 <pfn_pte+0xd9>	340595: R_X86_64_PLT32	ftrace_likely_update-0x4
00d9   340599:	41 f6 c6 01          	test   $0x1,%r14b
00dd   34059d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3405a0: R_X86_64_32S	_ftrace_annotated_branch+0x57d80
00e4   3405a4:	44 89 e6             	mov    %r12d,%esi
00e7   3405a7:	0f 94 c0             	sete   %al
00ea   3405aa:	48 c1 e3 0c          	shl    $0xc,%rbx
00ee   3405ae:	4d 85 f6             	test   %r14,%r14
00f1   3405b1:	0f 95 c1             	setne  %cl
00f4   3405b4:	31 d2                	xor    %edx,%edx
00f6   3405b6:	20 c1                	and    %al,%cl
00f8   3405b8:	0f b6 c1             	movzbl %cl,%eax
00fb   3405bb:	31 c9                	xor    %ecx,%ecx
00fd   3405bd:	48 f7 d8             	neg    %rax
0100   3405c0:	48 31 d8             	xor    %rbx,%rax
0103   3405c3:	48 bb 00 f0 ff ff ff ff 0f 00 	movabs $0xffffffffff000,%rbx
010d   3405cd:	48 21 c3             	and    %rax,%rbx
0110   3405d0:	e8 00 00 00 00       	call   3405d5 <pfn_pte+0x115>	3405d1: R_X86_64_PLT32	ftrace_likely_update-0x4
0115   3405d5:	49 09 df             	or     %rbx,%r15
0118   3405d8:	4c 89 f8             	mov    %r15,%rax
011b   3405db:	5b                   	pop    %rbx
011c   3405dc:	41 5c                	pop    %r12
011e   3405de:	41 5d                	pop    %r13
0120   3405e0:	41 5e                	pop    %r14
0122   3405e2:	41 5f                	pop    %r15
0124   3405e4:	5d                   	pop    %rbp
0125   3405e5:	c3                   	ret
0126   3405e6:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0000 00000000003a4fd0 <pfn_pte>:
0000   3a4fd0:	55                   	push   %rbp
0001   3a4fd1:	48 89 e5             	mov    %rsp,%rbp
0004   3a4fd4:	41 57                	push   %r15
0006   3a4fd6:	41 56                	push   %r14
0008   3a4fd8:	41 55                	push   %r13
000a   3a4fda:	41 54                	push   %r12
000c   3a4fdc:	53                   	push   %rbx
000d   3a4fdd:	49 89 f6             	mov    %rsi,%r14
0010   3a4fe0:	31 f6                	xor    %esi,%esi
0012   3a4fe2:	48 89 fb             	mov    %rdi,%rbx
0015   3a4fe5:	41 bd 00 00 00 00    	mov    $0x0,%r13d
001b   3a4feb:	41 bc 00 00 00 00    	mov    $0x0,%r12d
0021   3a4ff1:	41 f6 c6 01          	test   $0x1,%r14b
0025   3a4ff5:	4d 89 f7             	mov    %r14,%r15
0028   3a4ff8:	74 36                	je     3a5030 <pfn_pte+0x60>
002a   3a4ffa:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a4ffd: R_X86_64_32S	__supported_pte_mask
0031   3a5001:	e8 00 00 00 00       	call   3a5006 <pfn_pte+0x36>	3a5002: R_X86_64_PLT32	__asan_load8_noabort-0x4
0036   3a5006:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 3a500d <pfn_pte+0x3d>	3a5009: R_X86_64_PC32	__supported_pte_mask-0x4
003d   3a500d:	31 f6                	xor    %esi,%esi
003f   3a500f:	4d 89 f7             	mov    %r14,%r15
0042   3a5012:	4c 21 f0             	and    %r14,%rax
0045   3a5015:	4c 39 f0             	cmp    %r14,%rax
0048   3a5018:	74 16                	je     3a5030 <pfn_pte+0x60>
004a   3a501a:	0f b6 35 00 00 00 00 	movzbl 0x0(%rip),%esi        # 3a5021 <pfn_pte+0x51>	3a501d: R_X86_64_PC32	.data.once+0xb2
0051   3a5021:	41 bc 01 00 00 00    	mov    $0x1,%r12d
0057   3a5027:	49 89 c7             	mov    %rax,%r15
005a   3a502a:	83 f6 01             	xor    $0x1,%esi
005d   3a502d:	41 89 f5             	mov    %esi,%r13d
0060   3a5030:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a5033: R_X86_64_32S	_ftrace_annotated_branch+0x66bd0
0067   3a5037:	31 d2                	xor    %edx,%edx
0069   3a5039:	31 c9                	xor    %ecx,%ecx
006b   3a503b:	e8 00 00 00 00       	call   3a5040 <pfn_pte+0x70>	3a503c: R_X86_64_PLT32	ftrace_likely_update-0x4
0070   3a5040:	45 84 ed             	test   %r13b,%r13b
0073   3a5043:	74 64                	je     3a50a9 <pfn_pte+0xd9>
0075   3a5045:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a5048: R_X86_64_32S	_ftrace_annotated_branch+0x66c00
007c   3a504c:	be 01 00 00 00       	mov    $0x1,%esi
0081   3a5051:	31 d2                	xor    %edx,%edx
0083   3a5053:	b9 01 00 00 00       	mov    $0x1,%ecx
0088   3a5058:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 3a505f <pfn_pte+0x8f>	3a505a: R_X86_64_PC32	.data.once+0xb1
008f   3a505f:	e8 00 00 00 00       	call   3a5064 <pfn_pte+0x94>	3a5060: R_X86_64_PLT32	ftrace_likely_update-0x4
0094   3a5064:	4d 89 fd             	mov    %r15,%r13
0097   3a5067:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a506a: R_X86_64_32S	__supported_pte_mask
009e   3a506e:	4d 31 f5             	xor    %r14,%r13
00a1   3a5071:	e8 00 00 00 00       	call   3a5076 <pfn_pte+0xa6>	3a5072: R_X86_64_PLT32	__asan_load8_noabort-0x4
00a6   3a5076:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 3a507d <pfn_pte+0xad>	3a5079: R_X86_64_PC32	__supported_pte_mask-0x4
00ad   3a507d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a5080: R_X86_64_32S	.rodata+0x490640
00b4   3a5084:	4c 89 f6             	mov    %r14,%rsi
00b7   3a5087:	4c 89 ea             	mov    %r13,%rdx
00ba   3a508a:	e8 00 00 00 00       	call   3a508f <pfn_pte+0xbf>	3a508b: R_X86_64_PLT32	__warn_printk-0x4
00bf   3a508f:	0f 0b                	ud2
00c1   3a5091:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a5094: R_X86_64_32S	_ftrace_annotated_branch+0x66c30
00c8   3a5098:	be 01 00 00 00       	mov    $0x1,%esi
00cd   3a509d:	31 d2                	xor    %edx,%edx
00cf   3a509f:	b9 01 00 00 00       	mov    $0x1,%ecx
00d4   3a50a4:	e8 00 00 00 00       	call   3a50a9 <pfn_pte+0xd9>	3a50a5: R_X86_64_PLT32	ftrace_likely_update-0x4
00d9   3a50a9:	41 f6 c6 01          	test   $0x1,%r14b
00dd   3a50ad:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a50b0: R_X86_64_32S	_ftrace_annotated_branch+0x66c60
00e4   3a50b4:	44 89 e6             	mov    %r12d,%esi
00e7   3a50b7:	0f 94 c0             	sete   %al
00ea   3a50ba:	48 c1 e3 0c          	shl    $0xc,%rbx
00ee   3a50be:	4d 85 f6             	test   %r14,%r14
00f1   3a50c1:	0f 95 c1             	setne  %cl
00f4   3a50c4:	31 d2                	xor    %edx,%edx
00f6   3a50c6:	20 c1                	and    %al,%cl
00f8   3a50c8:	0f b6 c1             	movzbl %cl,%eax
00fb   3a50cb:	31 c9                	xor    %ecx,%ecx
00fd   3a50cd:	48 f7 d8             	neg    %rax
0100   3a50d0:	48 31 d8             	xor    %rbx,%rax
0103   3a50d3:	48 bb 00 f0 ff ff ff ff 0f 00 	movabs $0xffffffffff000,%rbx
010d   3a50dd:	48 21 c3             	and    %rax,%rbx
0110   3a50e0:	e8 00 00 00 00       	call   3a50e5 <pfn_pte+0x115>	3a50e1: R_X86_64_PLT32	ftrace_likely_update-0x4
0115   3a50e5:	49 09 df             	or     %rbx,%r15
0118   3a50e8:	4c 89 f8             	mov    %r15,%rax
011b   3a50eb:	5b                   	pop    %rbx
011c   3a50ec:	41 5c                	pop    %r12
011e   3a50ee:	41 5d                	pop    %r13
0120   3a50f0:	41 5e                	pop    %r14
0122   3a50f2:	41 5f                	pop    %r15
0124   3a50f4:	5d                   	pop    %rbp
0125   3a50f5:	c3                   	ret
0126   3a50f6:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
