Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064BE23BC;
	Fri,  5 Jan 2024 04:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRKC1YH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704429024; x=1735965024;
  h=date:from:cc:subject:message-id:mime-version;
  bh=TC6aOYiXccTGxfWP2UbB6bIkDTZeaezOUYBvMh3Lgws=;
  b=aRKC1YH2bEuCRZO0TD0n7OaFx2VNipUQ366jQ+B3ZWm4b7ea6/T6h1ww
   Hf9s9gX9Lc5wUFjnzTgvV864sDvS24rM1HrSXAQcp0QXjEG0XBwH/ZFDm
   8ffDrLhAeKNH//781OPX2dtZTQCBgFKFi5Uy04u5iOXd5F1Lovb9R9EGJ
   vy3ilO57WhmL6WtRG19+TzrFySFSJNp5xc2jN2IKHFssLgs34JU6kSHIc
   5U8IOxqyhezfIwJj8LrqFqdROBrSLu6UJzFWW/YW4/rMrbknpf0clwrof
   uIwBIO6K8OlLkAnYGNP4BjI2E8T4zV00GRZT2HXolpqWe+i+h8MJWeUT+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="400190538"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="400190538"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 20:30:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="756834476"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="756834476"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Jan 2024 20:30:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLbqS-0000mE-1v;
	Fri, 05 Jan 2024 04:30:08 +0000
Date: Fri, 5 Jan 2024 12:29:43 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: mm/pgtable-generic.o: warning: objtool: pte_offset_map_nolock+0x161:
 stack state mismatch: cfa1=4+72 cfa2=-1+0
Message-ID: <202401051229.g7mWjgi2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Hugh Dickins <hughd@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1f874787ed9a2d78ed59cb21d0d90ac0178eceb0
commit: 0d940a9b270b9220dcff74d8e9123c9788365751 mm/pgtable: allow pte_offset_map[_lock]() to fail
date:   7 months ago
config: x86_64-buildonly-randconfig-005-20240105 (https://download.01.org/0day-ci/archive/20240105/202401051229.g7mWjgi2-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401051229.g7mWjgi2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401051229.g7mWjgi2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/pgtable-generic.o: warning: objtool: pte_offset_map_nolock+0x161: stack state mismatch: cfa1=4+72 cfa2=-1+0
   mm/pgtable-generic.o: warning: objtool: pte_offset_map_nolock+0x18c: unknown CFA base reg -1


objdump-func vmlinux.o pte_offset_map_nolock:
0000 0000000000467700 <pte_offset_map_nolock>:
0000   467700:	55                   	push   %rbp
0001   467701:	41 57                	push   %r15
0003   467703:	41 56                	push   %r14
0005   467705:	41 55                	push   %r13
0007   467707:	41 54                	push   %r12
0009   467709:	53                   	push   %rbx
000a   46770a:	48 83 ec 10          	sub    $0x10,%rsp
000e   46770e:	49 89 ce             	mov    %rcx,%r14
0011   467711:	48 89 d3             	mov    %rdx,%rbx
0014   467714:	49 89 f4             	mov    %rsi,%r12
0017   467717:	e8 00 00 00 00       	call   46771c <pte_offset_map_nolock+0x1c>	467718: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
001c   46771c:	4c 89 e7             	mov    %r12,%rdi
001f   46771f:	e8 00 00 00 00       	call   467724 <pte_offset_map_nolock+0x24>	467720: R_X86_64_PLT32	__tsan_volatile_read8-0x4
0024   467724:	4d 8b 3c 24          	mov    (%r12),%r15
0028   467728:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
002d   46772d:	e8 00 00 00 00       	call   467732 <pte_offset_map_nolock+0x32>	46772e: R_X86_64_PLT32	__tsan_volatile_write8-0x4
0032   467732:	4c 89 7c 24 08       	mov    %r15,0x8(%rsp)
0037   467737:	4c 89 fe             	mov    %r15,%rsi
003a   46773a:	48 83 e6 9f          	and    $0xffffffffffffff9f,%rsi
003e   46773e:	31 ff                	xor    %edi,%edi
0040   467740:	e8 00 00 00 00       	call   467745 <pte_offset_map_nolock+0x45>	467741: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0045   467745:	4c 89 f8             	mov    %r15,%rax
0048   467748:	48 83 e0 9f          	and    $0xffffffffffffff9f,%rax
004c   46774c:	0f 84 26 01 00 00    	je     467878 <pte_offset_map_nolock+0x178>
0052   467752:	4c 89 34 24          	mov    %r14,(%rsp)
0056   467756:	48 b8 db 0f 00 00 00 00 f0 ff 	movabs $0xfff0000000000fdb,%rax
0060   467760:	4c 8d b0 00 f0 1f 00 	lea    0x1ff000(%rax),%r14
0067   467767:	4c 89 fd             	mov    %r15,%rbp
006a   46776a:	48 81 e5 80 00 00 00 	and    $0x80,%rbp
0071   467771:	4c 0f 44 f0          	cmove  %rax,%r14
0075   467775:	31 ff                	xor    %edi,%edi
0077   467777:	48 89 ee             	mov    %rbp,%rsi
007a   46777a:	e8 00 00 00 00       	call   46777f <pte_offset_map_nolock+0x7f>	46777b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
007f   46777f:	4d 21 fe             	and    %r15,%r14
0082   467782:	bf 43 00 00 00       	mov    $0x43,%edi
0087   467787:	4c 89 f6             	mov    %r14,%rsi
008a   46778a:	e8 00 00 00 00       	call   46778f <pte_offset_map_nolock+0x8f>	46778b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
008f   46778f:	4c 89 ff             	mov    %r15,%rdi
0092   467792:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 467798 <pte_offset_map_nolock+0x98>	467794: R_X86_64_PC32	pv_ops+0x1fc
0098   467798:	48 89 e1             	mov    %rsp,%rcx
009b   46779b:	49 83 fe 43          	cmp    $0x43,%r14
009f   46779f:	0f 85 dc 00 00 00    	jne    467881 <pte_offset_map_nolock+0x181>
00a5   4677a5:	49 89 c5             	mov    %rax,%r13
00a8   4677a8:	48 b8 00 00 e0 ff ff ff 0f 00 	movabs $0xfffffffe00000,%rax
00b2   4677b2:	4c 8d a0 00 f0 1f 00 	lea    0x1ff000(%rax),%r12
00b9   4677b9:	48 85 ed             	test   %rbp,%rbp
00bc   4677bc:	48 89 cc             	mov    %rcx,%rsp
00bf   4677bf:	4c 0f 45 e0          	cmovne %rax,%r12
00c3   4677c3:	4d 21 e5             	and    %r12,%r13
00c6   4677c6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4677c9: R_X86_64_32S	page_offset_base
00cd   4677cd:	e8 00 00 00 00       	call   4677d2 <pte_offset_map_nolock+0xd2>	4677ce: R_X86_64_PLT32	__tsan_read8-0x4
00d2   4677d2:	4c 03 2d 00 00 00 00 	add    0x0(%rip),%r13        # 4677d9 <pte_offset_map_nolock+0xd9>	4677d5: R_X86_64_PC32	page_offset_base-0x4
00d9   4677d9:	c1 eb 0c             	shr    $0xc,%ebx
00dc   4677dc:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
00e2   4677e2:	48 c1 e3 03          	shl    $0x3,%rbx
00e6   4677e6:	4c 01 eb             	add    %r13,%rbx
00e9   4677e9:	0f 84 ac 00 00 00    	je     46789b <pte_offset_map_nolock+0x19b>
00ef   4677ef:	e8 00 00 00 00       	call   4677f4 <pte_offset_map_nolock+0xf4>	4677f0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00f4   4677f4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4677f7: R_X86_64_32S	vmemmap_base
00fb   4677fb:	e8 00 00 00 00       	call   467800 <pte_offset_map_nolock+0x100>	4677fc: R_X86_64_PLT32	__tsan_read8-0x4
0100   467800:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # 467807 <pte_offset_map_nolock+0x107>	467803: R_X86_64_PC32	vmemmap_base-0x4
0107   467807:	4c 89 ff             	mov    %r15,%rdi
010a   46780a:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 467810 <pte_offset_map_nolock+0x110>	46780c: R_X86_64_PC32	pv_ops+0x1fc
0110   467810:	49 89 c6             	mov    %rax,%r14
0113   467813:	31 ff                	xor    %edi,%edi
0115   467815:	48 89 c6             	mov    %rax,%rsi
0118   467818:	e8 00 00 00 00       	call   46781d <pte_offset_map_nolock+0x11d>	467819: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
011d   46781d:	4d 85 f6             	test   %r14,%r14
0120   467820:	40 0f 95 c5          	setne  %bpl
0124   467824:	4c 89 f6             	mov    %r14,%rsi
0127   467827:	48 83 e6 01          	and    $0x1,%rsi
012b   46782b:	41 0f 94 c7          	sete   %r15b
012f   46782f:	31 ff                	xor    %edi,%edi
0131   467831:	e8 00 00 00 00       	call   467836 <pte_offset_map_nolock+0x136>	467832: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0136   467836:	41 20 ef             	and    %bpl,%r15b
0139   467839:	41 0f b6 c7          	movzbl %r15b,%eax
013d   46783d:	48 f7 d8             	neg    %rax
0140   467840:	4c 31 f0             	xor    %r14,%rax
0143   467843:	4c 21 e0             	and    %r12,%rax
0146   467846:	48 c1 e8 06          	shr    $0x6,%rax
014a   46784a:	4e 8d 34 28          	lea    (%rax,%r13,1),%r14
014e   46784e:	49 83 c6 28          	add    $0x28,%r14
0152   467852:	4c 8b 3c 24          	mov    (%rsp),%r15
0156   467856:	4c 89 ff             	mov    %r15,%rdi
0159   467859:	e8 00 00 00 00       	call   46785e <pte_offset_map_nolock+0x15e>	46785a: R_X86_64_PLT32	__tsan_write8-0x4
015e   46785e:	4d 89 37             	mov    %r14,(%r15)
0161   467861:	48 89 d8             	mov    %rbx,%rax
0164   467864:	48 83 c4 10          	add    $0x10,%rsp
0168   467868:	5b                   	pop    %rbx
0169   467869:	41 5c                	pop    %r12
016b   46786b:	41 5d                	pop    %r13
016d   46786d:	41 5e                	pop    %r14
016f   46786f:	41 5f                	pop    %r15
0171   467871:	5d                   	pop    %rbp
0172   467872:	2e e9 00 00 00 00    	cs jmp 467878 <pte_offset_map_nolock+0x178>	467874: R_X86_64_PLT32	__x86_return_thunk-0x4
0178   467878:	e8 00 00 00 00       	call   46787d <pte_offset_map_nolock+0x17d>	467879: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
017d   46787d:	31 db                	xor    %ebx,%ebx
017f   46787f:	eb e0                	jmp    467861 <pte_offset_map_nolock+0x161>
0181   467881:	48 89 cb             	mov    %rcx,%rbx
0184   467884:	e8 00 00 00 00       	call   467889 <pte_offset_map_nolock+0x189>	467885: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0189   467889:	48 89 dc             	mov    %rbx,%rsp
018c   46788c:	31 db                	xor    %ebx,%ebx
018e   46788e:	4c 89 e7             	mov    %r12,%rdi
0191   467891:	31 f6                	xor    %esi,%esi
0193   467893:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 467899 <pte_offset_map_nolock+0x199>	467895: R_X86_64_PC32	pv_ops+0x1bc
0199   467899:	eb c6                	jmp    467861 <pte_offset_map_nolock+0x161>
019b   46789b:	e8 00 00 00 00       	call   4678a0 <pte_offset_map_nolock+0x1a0>	46789c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01a0   4678a0:	31 db                	xor    %ebx,%ebx
01a2   4678a2:	eb bd                	jmp    467861 <pte_offset_map_nolock+0x161>
01a4   4678a4:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
01b3   4678b3:	66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
