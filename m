Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E841C232B;
	Thu, 12 Sep 2024 19:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726170022; cv=none; b=APjKw5Dpso0tS/JYM5/qbfpE3TUyiDp+AJOApwQ5kwx7IYBgAYqm+nLs0cP1KxP5VqPVtmayTOu1OLIwm4PFlIV5+JUE0qPErXtJGe344lL7yxdZGqEhuusgRg1Wt0RQ/Ccb/TQPgw2j0uijheC2lDKJoZjgQ75Qq6SVJtyRPrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726170022; c=relaxed/simple;
	bh=RNtkYLqXk3G3HPUjS52k04uzPAd/f2IGlOZPI4Sk0vs=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ppnMAyLiRlERlH7Dj247rPp2ohikpzXgouHUkL1C5BjDw4kNmUXiMt1uAAFsL6pTq5mMNboNgmAwbzP6RGH6IYyZ+folVKZiPmb/dY6aUYttYmcynKJoZJSXKa2fir+mqpFTYCJh+imE8/QJvSlXsvVt+TeqqHijbWgqD31YEe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YH+y7kEm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YH+y7kEm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726170020; x=1757706020;
  h=date:from:cc:subject:message-id:mime-version;
  bh=RNtkYLqXk3G3HPUjS52k04uzPAd/f2IGlOZPI4Sk0vs=;
  b=YH+y7kEmT9L+0D6nvUG1y3ENI3CVgsRiP6ujdoQIg93XlcNUMJKMK64Z
   ZJganY4u2PTJZTb8fM5UBWJGzduYtnfdD1CFUKq7fstPRGUyJsPHKEpx6
   02xS93uKvaZrrofuQ0V4VHmxqQCe2I1MpXlISaIM46h+N/70tFraIHzbS
   P02V4qHsosWdLaxOwlWMPt825DxCGPEiV2Em7o92UZNdoQwH28IItDOYo
   acBbCz4kpVZDvIc7TvLHXVldb5zul0bMoJ+BWgPGX40MbHxbvcxtBUHqM
   ZfYAxY/HG59Fuzn9drNfi46rBnDuqEKEnekdJbMY6zowv4cSffWPW9q3Q
   g==;
X-CSE-ConnectionGUID: /Vir7KybRMuPkyH6fulpgA==
X-CSE-MsgGUID: izHKT+oxTZS8mOSBHfTfIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28792369"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="28792369"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 12:40:19 -0700
X-CSE-ConnectionGUID: clUcP3IjT2e2GGQgRHlK/Q==
X-CSE-MsgGUID: Ms4LgeNVR726Dj+71o3x9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="67796759"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Sep 2024 12:40:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sopfr-0005dK-1Z;
	Thu, 12 Sep 2024 19:40:15 +0000
Date: Fri, 13 Sep 2024 03:40:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [sudeep-holla:android13-5.10/ffa 4325/9999] kernel/dma/swiotlb.o:
 warning: objtool: swiotlb_late_init_with_tbl()+0x31c: unreachable
 instruction
Message-ID: <202409130339.wCJMJxhX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Christoph Hellwig <hch@lst.de>
CC: Will Deacon <willdeacon@google.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.10/ffa
head:   9e12ac4f9c69befe08119567c073adc938aafc4d
commit: 2f2f753c199491c64863b901a23e50b953c1aa3c [4325/9999] UPSTREAM: swiotlb: dynamically allocate io_tlb_default_mem
config: x86_64-buildonly-randconfig-002-20240912 (https://download.01.org/0day-ci/archive/20240913/202409130339.wCJMJxhX-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409130339.wCJMJxhX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409130339.wCJMJxhX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/swiotlb.o: warning: objtool: swiotlb_late_init_with_tbl()+0x31c: unreachable instruction


objdump-func vmlinux.o swiotlb_late_init_with_tbl:
0000 000000000025a619 <swiotlb_late_init_with_tbl>:
0000   25a619:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	25a61a: R_X86_64_NONE	__fentry__-0x4
0005   25a61e:	55                   	push   %rbp
0006   25a61f:	48 89 e5             	mov    %rsp,%rbp
0009   25a622:	41 57                	push   %r15
000b   25a624:	41 56                	push   %r14
000d   25a626:	41 55                	push   %r13
000f   25a628:	41 54                	push   %r12
0011   25a62a:	53                   	push   %rbx
0012   25a62b:	48 8d 64 24 d8       	lea    -0x28(%rsp),%rsp
0017   25a630:	49 89 f6             	mov    %rsi,%r14
001a   25a633:	49 89 fd             	mov    %rdi,%r13
001d   25a636:	e8 00 00 00 00       	call   25a63b <swiotlb_late_init_with_tbl+0x22>	25a637: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0022   25a63b:	48 83 3d 00 00 00 00 00 	cmpq   $0x0,0x0(%rip)        # 25a643 <swiotlb_late_init_with_tbl+0x2a>	25a63e: R_X86_64_PC32	io_tlb_default_mem-0x5
002a   25a643:	0f 85 e5 02 00 00    	jne    25a92e <swiotlb_late_init_with_tbl+0x315>
0030   25a649:	b9 18 00 00 00       	mov    $0x18,%ecx
0035   25a64e:	4c 89 f0             	mov    %r14,%rax
0038   25a651:	be ff ff ff ff       	mov    $0xffffffff,%esi
003d   25a656:	bf c0 0c 00 00       	mov    $0xcc0,%edi
0042   25a65b:	48 f7 e1             	mul    %rcx
0045   25a65e:	0f 90 c1             	seto   %cl
0048   25a661:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
004f   25a668:	48 83 c0 38          	add    $0x38,%rax
0053   25a66c:	48 0f 43 d0          	cmovae %rax,%rdx
0057   25a670:	48 b8 ff ff ff ff ff ff 0f 00 	movabs $0xfffffffffffff,%rax
0061   25a67a:	48 ff ca             	dec    %rdx
0064   25a67d:	48 c1 ea 0c          	shr    $0xc,%rdx
0068   25a681:	84 c9                	test   %cl,%cl
006a   25a683:	48 0f 44 c2          	cmove  %rdx,%rax
006e   25a687:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
0072   25a68b:	48 0f bd 75 b0       	bsr    -0x50(%rbp),%rsi
0077   25a690:	ff c6                	inc    %esi
0079   25a692:	e8 00 00 00 00       	call   25a697 <swiotlb_late_init_with_tbl+0x7e>	25a693: R_X86_64_PLT32	__get_free_pages-0x4
007e   25a697:	48 85 c0             	test   %rax,%rax
0081   25a69a:	74 64                	je     25a700 <swiotlb_late_init_with_tbl+0xe7>
0083   25a69c:	4c 8d 78 10          	lea    0x10(%rax),%r15
0087   25a6a0:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
008b   25a6a4:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
0095   25a6ae:	4c 89 f8             	mov    %r15,%rax
0098   25a6b1:	48 c1 e8 03          	shr    $0x3,%rax
009c   25a6b5:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
00a1   25a6ba:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
00a5   25a6be:	74 08                	je     25a6c8 <swiotlb_late_init_with_tbl+0xaf>
00a7   25a6c0:	4c 89 ff             	mov    %r15,%rdi
00aa   25a6c3:	e8 00 00 00 00       	call   25a6c8 <swiotlb_late_init_with_tbl+0xaf>	25a6c4: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
00af   25a6c8:	49 81 fd 00 00 00 80 	cmp    $0xffffffff80000000,%r13
00b6   25a6cf:	4d 89 37             	mov    %r14,(%r15)
00b9   25a6d2:	72 3b                	jb     25a70f <swiotlb_late_init_with_tbl+0xf6>
00bb   25a6d4:	e8 00 00 00 00       	call   25a6d9 <swiotlb_late_init_with_tbl+0xc0>	25a6d5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00c0   25a6d9:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	25a6dc: R_X86_64_32S	phys_base
00c7   25a6e0:	48 c1 e8 03          	shr    $0x3,%rax
00cb   25a6e4:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
00d0   25a6e9:	74 0c                	je     25a6f7 <swiotlb_late_init_with_tbl+0xde>
00d2   25a6eb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	25a6ee: R_X86_64_32S	phys_base
00d9   25a6f2:	e8 00 00 00 00       	call   25a6f7 <swiotlb_late_init_with_tbl+0xde>	25a6f3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00de   25a6f7:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 25a6fe <swiotlb_late_init_with_tbl+0xe5>	25a6fa: R_X86_64_PC32	phys_base-0x4
00e5   25a6fe:	eb 40                	jmp    25a740 <swiotlb_late_init_with_tbl+0x127>
00e7   25a700:	e8 00 00 00 00       	call   25a705 <swiotlb_late_init_with_tbl+0xec>	25a701: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00ec   25a705:	bb f4 ff ff ff       	mov    $0xfffffff4,%ebx
00f1   25a70a:	e9 0d 02 00 00       	jmp    25a91c <swiotlb_late_init_with_tbl+0x303>
00f6   25a70f:	e8 00 00 00 00       	call   25a714 <swiotlb_late_init_with_tbl+0xfb>	25a710: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00fb   25a714:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	25a717: R_X86_64_32S	page_offset_base
0102   25a71b:	48 c1 e8 03          	shr    $0x3,%rax
0106   25a71f:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
010b   25a724:	74 0c                	je     25a732 <swiotlb_late_init_with_tbl+0x119>
010d   25a726:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	25a729: R_X86_64_32S	page_offset_base
0114   25a72d:	e8 00 00 00 00       	call   25a732 <swiotlb_late_init_with_tbl+0x119>	25a72e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0119   25a732:	48 c7 c3 00 00 00 80 	mov    $0xffffffff80000000,%rbx
0120   25a739:	48 2b 1d 00 00 00 00 	sub    0x0(%rip),%rbx        # 25a740 <swiotlb_late_init_with_tbl+0x127>	25a73c: R_X86_64_PC32	page_offset_base-0x4
0127   25a740:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
012b   25a744:	4c 01 eb             	add    %r13,%rbx
012e   25a747:	49 c1 e6 0b          	shl    $0xb,%r14
0132   25a74b:	48 89 d0             	mov    %rdx,%rax
0135   25a74e:	48 81 eb 00 00 00 80 	sub    $0xffffffff80000000,%rbx
013c   25a755:	48 c1 e8 03          	shr    $0x3,%rax
0140   25a759:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0145   25a75e:	74 0c                	je     25a76c <swiotlb_late_init_with_tbl+0x153>
0147   25a760:	48 89 d7             	mov    %rdx,%rdi
014a   25a763:	e8 00 00 00 00       	call   25a768 <swiotlb_late_init_with_tbl+0x14f>	25a764: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
014f   25a768:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
0153   25a76c:	48 8d 7a 08          	lea    0x8(%rdx),%rdi
0157   25a770:	48 89 1a             	mov    %rbx,(%rdx)
015a   25a773:	4c 01 f3             	add    %r14,%rbx
015d   25a776:	48 89 f8             	mov    %rdi,%rax
0160   25a779:	48 c1 e8 03          	shr    $0x3,%rax
0164   25a77d:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0169   25a782:	74 09                	je     25a78d <swiotlb_late_init_with_tbl+0x174>
016b   25a784:	e8 00 00 00 00       	call   25a789 <swiotlb_late_init_with_tbl+0x170>	25a785: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0170   25a789:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
0174   25a78d:	48 8d 7a 20          	lea    0x20(%rdx),%rdi
0178   25a791:	48 89 5a 08          	mov    %rbx,0x8(%rdx)
017c   25a795:	4c 89 6d b8          	mov    %r13,-0x48(%rbp)
0180   25a799:	48 89 f8             	mov    %rdi,%rax
0183   25a79c:	48 c1 e8 03          	shr    $0x3,%rax
0187   25a7a0:	42 8a 04 20          	mov    (%rax,%r12,1),%al
018b   25a7a4:	84 c0                	test   %al,%al
018d   25a7a6:	0f 85 90 01 00 00    	jne    25a93c <swiotlb_late_init_with_tbl+0x323>
0193   25a7ac:	4c 8d 6a 30          	lea    0x30(%rdx),%r13
0197   25a7b0:	c7 42 20 00 00 00 00 	movl   $0x0,0x20(%rdx)
019e   25a7b7:	4c 89 e8             	mov    %r13,%rax
01a1   25a7ba:	48 c1 e8 03          	shr    $0x3,%rax
01a5   25a7be:	42 8a 04 20          	mov    (%rax,%r12,1),%al
01a9   25a7c2:	84 c0                	test   %al,%al
01ab   25a7c4:	0f 85 90 01 00 00    	jne    25a95a <swiotlb_late_init_with_tbl+0x341>
01b1   25a7ca:	41 c6 45 00 01       	movb   $0x1,0x0(%r13)
01b6   25a7cf:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
01ba   25a7d3:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
01bf   25a7d8:	74 0c                	je     25a7e6 <swiotlb_late_init_with_tbl+0x1cd>
01c1   25a7da:	4c 89 ff             	mov    %r15,%rdi
01c4   25a7dd:	e8 00 00 00 00       	call   25a7e2 <swiotlb_late_init_with_tbl+0x1c9>	25a7de: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01c9   25a7e2:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
01cd   25a7e6:	49 83 3f 00          	cmpq   $0x0,(%r15)
01d1   25a7ea:	0f 84 c7 00 00 00    	je     25a8b7 <swiotlb_late_init_with_tbl+0x29e>
01d7   25a7f0:	48 89 d3             	mov    %rdx,%rbx
01da   25a7f3:	4c 89 75 c0          	mov    %r14,-0x40(%rbp)
01de   25a7f7:	4c 8d 6a 38          	lea    0x38(%rdx),%r13
01e2   25a7fb:	41 be 01 00 00 00    	mov    $0x1,%r14d
01e8   25a801:	48 83 c3 48          	add    $0x48,%rbx
01ec   25a805:	49 8d 7d 10          	lea    0x10(%r13),%rdi
01f0   25a809:	48 89 f8             	mov    %rdi,%rax
01f3   25a80c:	48 c1 e8 03          	shr    $0x3,%rax
01f7   25a810:	42 8a 04 20          	mov    (%rax,%r12,1),%al
01fb   25a814:	84 c0                	test   %al,%al
01fd   25a816:	75 7a                	jne    25a892 <swiotlb_late_init_with_tbl+0x279>
01ff   25a818:	41 8d 46 ff          	lea    -0x1(%r14),%eax
0203   25a81c:	b9 80 00 00 00       	mov    $0x80,%ecx
0208   25a821:	4c 89 ea             	mov    %r13,%rdx
020b   25a824:	83 e0 7f             	and    $0x7f,%eax
020e   25a827:	48 c1 ea 03          	shr    $0x3,%rdx
0212   25a82b:	29 c1                	sub    %eax,%ecx
0214   25a82d:	89 0b                	mov    %ecx,(%rbx)
0216   25a82f:	42 80 3c 22 00       	cmpb   $0x0,(%rdx,%r12,1)
021b   25a834:	74 08                	je     25a83e <swiotlb_late_init_with_tbl+0x225>
021d   25a836:	4c 89 ef             	mov    %r13,%rdi
0220   25a839:	e8 00 00 00 00       	call   25a83e <swiotlb_late_init_with_tbl+0x225>	25a83a: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0225   25a83e:	49 8d 7d 08          	lea    0x8(%r13),%rdi
0229   25a842:	48 c7 43 f0 ff ff ff ff 	movq   $0xffffffffffffffff,-0x10(%rbx)
0231   25a84a:	48 89 f8             	mov    %rdi,%rax
0234   25a84d:	48 c1 e8 03          	shr    $0x3,%rax
0238   25a851:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
023d   25a856:	74 05                	je     25a85d <swiotlb_late_init_with_tbl+0x244>
023f   25a858:	e8 00 00 00 00       	call   25a85d <swiotlb_late_init_with_tbl+0x244>	25a859: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0244   25a85d:	48 c7 43 f8 00 00 00 00 	movq   $0x0,-0x8(%rbx)
024c   25a865:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
0250   25a869:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0255   25a86e:	74 08                	je     25a878 <swiotlb_late_init_with_tbl+0x25f>
0257   25a870:	4c 89 ff             	mov    %r15,%rdi
025a   25a873:	e8 00 00 00 00       	call   25a878 <swiotlb_late_init_with_tbl+0x25f>	25a874: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
025f   25a878:	4d 3b 37             	cmp    (%r15),%r14
0262   25a87b:	73 2f                	jae    25a8ac <swiotlb_late_init_with_tbl+0x293>
0264   25a87d:	e8 00 00 00 00       	call   25a882 <swiotlb_late_init_with_tbl+0x269>	25a87e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0269   25a882:	49 ff c6             	inc    %r14
026c   25a885:	49 83 c5 18          	add    $0x18,%r13
0270   25a889:	48 83 c3 18          	add    $0x18,%rbx
0274   25a88d:	e9 73 ff ff ff       	jmp    25a805 <swiotlb_late_init_with_tbl+0x1ec>
0279   25a892:	89 f9                	mov    %edi,%ecx
027b   25a894:	80 e1 07             	and    $0x7,%cl
027e   25a897:	80 c1 03             	add    $0x3,%cl
0281   25a89a:	38 c1                	cmp    %al,%cl
0283   25a89c:	0f 8c 76 ff ff ff    	jl     25a818 <swiotlb_late_init_with_tbl+0x1ff>
0289   25a8a2:	e8 00 00 00 00       	call   25a8a7 <swiotlb_late_init_with_tbl+0x28e>	25a8a3: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
028e   25a8a7:	e9 6c ff ff ff       	jmp    25a818 <swiotlb_late_init_with_tbl+0x1ff>
0293   25a8ac:	e8 00 00 00 00       	call   25a8b1 <swiotlb_late_init_with_tbl+0x298>	25a8ad: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0298   25a8b1:	4c 8b 75 c0          	mov    -0x40(%rbp),%r14
029c   25a8b5:	eb 05                	jmp    25a8bc <swiotlb_late_init_with_tbl+0x2a3>
029e   25a8b7:	e8 00 00 00 00       	call   25a8bc <swiotlb_late_init_with_tbl+0x2a3>	25a8b8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02a3   25a8bc:	4c 89 f6             	mov    %r14,%rsi
02a6   25a8bf:	48 8b 5d b8          	mov    -0x48(%rbp),%rbx
02aa   25a8c3:	48 c1 ee 0c          	shr    $0xc,%rsi
02ae   25a8c7:	48 89 df             	mov    %rbx,%rdi
02b1   25a8ca:	e8 00 00 00 00       	call   25a8cf <swiotlb_late_init_with_tbl+0x2b6>	25a8cb: R_X86_64_PLT32	set_memory_decrypted-0x4
02b6   25a8cf:	48 89 df             	mov    %rbx,%rdi
02b9   25a8d2:	31 f6                	xor    %esi,%esi
02bb   25a8d4:	4c 89 f2             	mov    %r14,%rdx
02be   25a8d7:	31 db                	xor    %ebx,%ebx
02c0   25a8d9:	e8 00 00 00 00       	call   25a8de <swiotlb_late_init_with_tbl+0x2c5>	25a8da: R_X86_64_PLT32	memset-0x4
02c5   25a8de:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
02c9   25a8e2:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 25a8e9 <swiotlb_late_init_with_tbl+0x2d0>	25a8e5: R_X86_64_PC32	io_tlb_default_mem-0x4
02d0   25a8e9:	e8 00 00 00 00       	call   25a8ee <swiotlb_late_init_with_tbl+0x2d5>	25a8ea: R_X86_64_PLT32	swiotlb_print_info-0x4
02d5   25a8ee:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
02d9   25a8f2:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
02de   25a8f7:	74 08                	je     25a901 <swiotlb_late_init_with_tbl+0x2e8>
02e0   25a8f9:	4c 89 ff             	mov    %r15,%rdi
02e3   25a8fc:	e8 00 00 00 00       	call   25a901 <swiotlb_late_init_with_tbl+0x2e8>	25a8fd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02e8   25a901:	41 8b 07             	mov    (%r15),%eax
02eb   25a904:	8b 0d 00 00 00 00    	mov    0x0(%rip),%ecx        # 25a90a <swiotlb_late_init_with_tbl+0x2f1>	25a906: R_X86_64_PC32	swiotlb_force-0x4
02f1   25a90a:	83 e0 fe             	and    $0xfffffffe,%eax
02f4   25a90d:	c1 e0 0b             	shl    $0xb,%eax
02f7   25a910:	83 f9 01             	cmp    $0x1,%ecx
02fa   25a913:	0f 44 c1             	cmove  %ecx,%eax
02fd   25a916:	89 05 00 00 00 00    	mov    %eax,0x0(%rip)        # 25a91c <swiotlb_late_init_with_tbl+0x303>	25a918: R_X86_64_PC32	.bss+0x8f23c
0303   25a91c:	89 d8                	mov    %ebx,%eax
0305   25a91e:	48 8d 64 24 28       	lea    0x28(%rsp),%rsp
030a   25a923:	5b                   	pop    %rbx
030b   25a924:	41 5c                	pop    %r12
030d   25a926:	41 5d                	pop    %r13
030f   25a928:	41 5e                	pop    %r14
0311   25a92a:	41 5f                	pop    %r15
0313   25a92c:	5d                   	pop    %rbp
0314   25a92d:	c3                   	ret
0315   25a92e:	e8 00 00 00 00       	call   25a933 <swiotlb_late_init_with_tbl+0x31a>	25a92f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
031a   25a933:	0f 0b                	ud2
031c   25a935:	bb f4 ff ff ff       	mov    $0xfffffff4,%ebx
0321   25a93a:	eb e0                	jmp    25a91c <swiotlb_late_init_with_tbl+0x303>
0323   25a93c:	89 f9                	mov    %edi,%ecx
0325   25a93e:	80 e1 07             	and    $0x7,%cl
0328   25a941:	80 c1 03             	add    $0x3,%cl
032b   25a944:	38 c1                	cmp    %al,%cl
032d   25a946:	0f 8c 60 fe ff ff    	jl     25a7ac <swiotlb_late_init_with_tbl+0x193>
0333   25a94c:	e8 00 00 00 00       	call   25a951 <swiotlb_late_init_with_tbl+0x338>	25a94d: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0338   25a951:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
033c   25a955:	e9 52 fe ff ff       	jmp    25a7ac <swiotlb_late_init_with_tbl+0x193>
0341   25a95a:	44 89 e9             	mov    %r13d,%ecx
0344   25a95d:	80 e1 07             	and    $0x7,%cl
0347   25a960:	38 c1                	cmp    %al,%cl
0349   25a962:	0f 8c 62 fe ff ff    	jl     25a7ca <swiotlb_late_init_with_tbl+0x1b1>
034f   25a968:	4c 89 ef             	mov    %r13,%rdi
0352   25a96b:	e8 00 00 00 00       	call   25a970 <swiotlb_late_init_with_tbl+0x357>	25a96c: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
0357   25a970:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
035b   25a974:	e9 51 fe ff ff       	jmp    25a7ca <swiotlb_late_init_with_tbl+0x1b1>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
