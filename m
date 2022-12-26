Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAA480C;
	Mon, 26 Dec 2022 10:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672049517; x=1703585517;
  h=date:from:cc:subject:message-id:mime-version;
  bh=GnCKKUW9NYXLwo5jC+zN/Z86GYVzv1KWjHYuFHd5ZDQ=;
  b=Wj/vJnNN2V9M0DimM97tqBE/w23rQcIsngSvZ6yXHOGrRnpt6O/67nWP
   UQLUpuZ23aT14T5OstJL9UFs/4oSXlSZkKZd5oPjtx9Ci+xZ2iVM7hCv9
   JMXnm8TYVi4NuOFBsbcjXPz+pZ0eIFEZ75BspLodPzdrwn/9eJh/7sSLh
   uGO3Yp3W47z7eqd9x8mGTDkrdZW6XmZ5GHnt/HrUfQlfa8536vlrmS8A5
   t52dKN+oMnEgnw+9IMjtIQ5cP97T+I2t5KNP6DphbCtP0TG63bEVwvxlE
   M3CXw8AVCBH2TZH3Ql4vL80oG6QzrsqybBrN2EF4VyjU9IBvR/tDTtOP5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="300914454"
X-IronPort-AV: E=Sophos;i="5.96,275,1665471600"; 
   d="scan'208";a="300914454"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2022 02:11:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="795055953"
X-IronPort-AV: E=Sophos;i="5.96,275,1665471600"; 
   d="scan'208";a="795055953"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Dec 2022 02:11:46 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p9kSP-000EOT-27;
	Mon, 26 Dec 2022 10:11:45 +0000
Date: Mon, 26 Dec 2022 18:11:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.15.y 3221/9999] fs/reiserfs/do_balan.o: warning:
 objtool: balance_leaf()+0x5ff5: stack state mismatch: cfa1=4+312 cfa2=4+328
Message-ID: <202212261813.NED3zZWt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="YCo9i469aO4if6+1"
Content-Disposition: inline


--YCo9i469aO4if6+1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Kees Cook <keescook@chromium.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Marco Elver <elver@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   5827ddaf4534c52d31dd464679a186b41810ef76
commit: 33db9912ff7c491f839c89a08e98f755aa09598f [3221/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: x86_64-buildonly-randconfig-r004-20221226
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=33db9912ff7c491f839c89a08e98f755aa09598f
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 33db9912ff7c491f839c89a08e98f755aa09598f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/reiserfs/do_balan.o: warning: objtool: balance_leaf()+0x5ff5: stack state mismatch: cfa1=4+312 cfa2=4+328


objdump-func vmlinux.o balance_leaf:
0000 00000000005375e0 <balance_leaf>:
0000   5375e0:	55                   	push   %rbp
0001   5375e1:	41 57                	push   %r15
0003   5375e3:	41 56                	push   %r14
0005   5375e5:	41 55                	push   %r13
0007   5375e7:	41 54                	push   %r12
0009   5375e9:	53                   	push   %rbx
000a   5375ea:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
0011   5375f1:	4c 89 8c 24 f8 00 00 00 	mov    %r9,0xf8(%rsp)
0019   5375f9:	4c 89 84 24 f0 00 00 00 	mov    %r8,0xf0(%rsp)
0021   537601:	48 89 8c 24 d0 00 00 00 	mov    %rcx,0xd0(%rsp)
0029   537609:	49 89 d5             	mov    %rdx,%r13
002c   53760c:	48 89 b4 24 a0 00 00 00 	mov    %rsi,0xa0(%rsp)
0034   537614:	49 89 fe             	mov    %rdi,%r14
0037   537617:	e8 00 00 00 00       	call   53761c <balance_leaf+0x3c>	537618: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
003c   53761c:	49 8d 7e 18          	lea    0x18(%r14),%rdi
0040   537620:	48 89 bc 24 88 00 00 00 	mov    %rdi,0x88(%rsp)
0048   537628:	e8 00 00 00 00       	call   53762d <balance_leaf+0x4d>	537629: R_X86_64_PLT32	__asan_load8_noabort-0x4
004d   53762d:	49 8b 5e 18          	mov    0x18(%r14),%rbx
0051   537631:	48 89 df             	mov    %rbx,%rdi
0054   537634:	e8 00 00 00 00       	call   537639 <balance_leaf+0x59>	537635: R_X86_64_PLT32	__asan_load4_noabort-0x4
0059   537639:	48 63 2b             	movslq (%rbx),%rbp
005c   53763c:	48 c1 e5 04          	shl    $0x4,%rbp
0060   537640:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
0064   537644:	48 83 c7 08          	add    $0x8,%rdi
0068   537648:	e8 00 00 00 00       	call   53764d <balance_leaf+0x6d>	537649: R_X86_64_PLT32	__asan_load8_noabort-0x4
006d   53764d:	48 8b 44 2b 08       	mov    0x8(%rbx,%rbp,1),%rax
0072   537652:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
0077   537657:	49 8d 7e 08          	lea    0x8(%r14),%rdi
007b   53765b:	48 89 bc 24 90 00 00 00 	mov    %rdi,0x90(%rsp)
0083   537663:	e8 00 00 00 00       	call   537668 <balance_leaf+0x88>	537664: R_X86_64_PLT32	__asan_load8_noabort-0x4
0088   537668:	49 8b 5e 08          	mov    0x8(%r14),%rbx
008c   53766c:	48 8d bb 80 03 00 00 	lea    0x380(%rbx),%rdi
0093   537673:	e8 00 00 00 00       	call   537678 <balance_leaf+0x98>	537674: R_X86_64_PLT32	__asan_load8_noabort-0x4
0098   537678:	48 8b 9b 80 03 00 00 	mov    0x380(%rbx),%rbx
009f   53767f:	48 8d bb 60 01 00 00 	lea    0x160(%rbx),%rdi
00a6   537686:	e8 00 00 00 00       	call   53768b <balance_leaf+0xab>	537687: R_X86_64_PLT32	__asan_load8_noabort-0x4
00ab   53768b:	48 83 83 60 01 00 00 01 	addq   $0x1,0x160(%rbx)
00b3   537693:	49 8d be f0 01 00 00 	lea    0x1f0(%r14),%rdi
00ba   53769a:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
00bf   53769f:	e8 00 00 00 00       	call   5376a4 <balance_leaf+0xc4>	5376a0: R_X86_64_PLT32	__asan_load4_noabort-0x4
00c4   5376a4:	41 8b 9e f0 01 00 00 	mov    0x1f0(%r14),%ebx
00cb   5376ab:	4d 8b 7e 18          	mov    0x18(%r14),%r15
00cf   5376af:	4c 89 ff             	mov    %r15,%rdi
00d2   5376b2:	e8 00 00 00 00       	call   5376b7 <balance_leaf+0xd7>	5376b3: R_X86_64_PLT32	__asan_load4_noabort-0x4
00d7   5376b7:	49 63 2f             	movslq (%r15),%rbp
00da   5376ba:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
00df   5376bf:	85 db                	test   %ebx,%ebx
00e1   5376c1:	4c 89 34 24          	mov    %r14,(%rsp)
00e5   5376c5:	0f 88 4a 01 00 00    	js     537815 <balance_leaf+0x235>
00eb   5376cb:	48 c1 e5 04          	shl    $0x4,%rbp
00ef   5376cf:	49 8d 3c 2f          	lea    (%r15,%rbp,1),%rdi
00f3   5376d3:	48 83 c7 10          	add    $0x10,%rdi
00f7   5376d7:	e8 00 00 00 00       	call   5376dc <balance_leaf+0xfc>	5376d8: R_X86_64_PLT32	__asan_load4_noabort-0x4
00fc   5376dc:	4d 63 74 2f 10       	movslq 0x10(%r15,%rbp,1),%r14
0101   5376e1:	48 8b 2c 24          	mov    (%rsp),%rbp
0105   5376e5:	48 8d bd 28 02 00 00 	lea    0x228(%rbp),%rdi
010c   5376ec:	48 89 7c 24 70       	mov    %rdi,0x70(%rsp)
0111   5376f1:	e8 00 00 00 00       	call   5376f6 <balance_leaf+0x116>	5376f2: R_X86_64_PLT32	__asan_store4_noabort-0x4
0116   5376f6:	44 89 b5 28 02 00 00 	mov    %r14d,0x228(%rbp)
011d   5376fd:	49 8d 7f 78          	lea    0x78(%r15),%rdi
0121   537701:	e8 00 00 00 00       	call   537706 <balance_leaf+0x126>	537702: R_X86_64_PLT32	__asan_load4_noabort-0x4
0126   537706:	4c 89 eb             	mov    %r13,%rbx
0129   537709:	45 8b 6f 78          	mov    0x78(%r15),%r13d
012d   53770d:	48 8d bd 50 02 00 00 	lea    0x250(%rbp),%rdi
0134   537714:	48 89 7c 24 58       	mov    %rdi,0x58(%rsp)
0139   537719:	e8 00 00 00 00       	call   53771e <balance_leaf+0x13e>	53771a: R_X86_64_PLT32	__asan_store4_noabort-0x4
013e   53771e:	44 89 ad 50 02 00 00 	mov    %r13d,0x250(%rbp)
0145   537725:	48 8d bd 54 02 00 00 	lea    0x254(%rbp),%rdi
014c   53772c:	48 89 7c 24 60       	mov    %rdi,0x60(%rsp)
0151   537731:	e8 00 00 00 00       	call   537736 <balance_leaf+0x156>	537732: R_X86_64_PLT32	__asan_store4_noabort-0x4
0156   537736:	c7 85 54 02 00 00 00 00 00 00 	movl   $0x0,0x254(%rbp)
0160   537740:	48 89 5c 24 48       	mov    %rbx,0x48(%rsp)
0165   537745:	48 85 db             	test   %rbx,%rbx
0168   537748:	0f 85 2c 01 00 00    	jne    53787a <balance_leaf+0x29a>
016e   53774e:	83 bc 24 d0 00 00 00 69 	cmpl   $0x69,0xd0(%rsp)
0176   537756:	0f 85 1e 01 00 00    	jne    53787a <balance_leaf+0x29a>
017c   53775c:	e8 00 00 00 00       	call   537761 <balance_leaf+0x181>	53775d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0181   537761:	48 8b 9c 24 a0 00 00 00 	mov    0xa0(%rsp),%rbx
0189   537769:	48 8d 7b 12          	lea    0x12(%rbx),%rdi
018d   53776d:	be 02 00 00 00       	mov    $0x2,%esi
0192   537772:	e8 00 00 00 00       	call   537777 <balance_leaf+0x197>	537773: R_X86_64_PLT32	__asan_loadN_noabort-0x4
0197   537777:	0f b7 5b 12          	movzwl 0x12(%rbx),%ebx
019b   53777b:	48 8b 6c 24 60       	mov    0x60(%rsp),%rbp
01a0   537780:	48 89 ef             	mov    %rbp,%rdi
01a3   537783:	e8 00 00 00 00       	call   537788 <balance_leaf+0x1a8>	537784: R_X86_64_PLT32	__asan_store4_noabort-0x4
01a8   537788:	89 5d 00             	mov    %ebx,0x0(%rbp)
01ab   53778b:	83 bc 24 d0 00 00 00 69 	cmpl   $0x69,0xd0(%rsp)
01b3   537793:	0f 84 f4 00 00 00    	je     53788d <balance_leaf+0x2ad>
01b9   537799:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
01be   53779e:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
01c2   5377a2:	e8 00 00 00 00       	call   5377a7 <balance_leaf+0x1c7>	5377a3: R_X86_64_PLT32	__asan_load8_noabort-0x4
01c7   5377a7:	48 8b 6b 28          	mov    0x28(%rbx),%rbp
01cb   5377ab:	4c 8d 65 18          	lea    0x18(%rbp),%r12
01cf   5377af:	4b 8d 1c 76          	lea    (%r14,%r14,2),%rbx
01d3   5377b3:	48 8d 3c dd 2e 00 00 00 	lea    0x2e(,%rbx,8),%rdi
01db   5377bb:	48 01 ef             	add    %rbp,%rdi
01de   5377be:	be 02 00 00 00       	mov    $0x2,%esi
01e3   5377c3:	e8 00 00 00 00       	call   5377c8 <balance_leaf+0x1e8>	5377c4: R_X86_64_PLT32	__asan_loadN_noabort-0x4
01e8   5377c8:	66 83 7c dd 2e 00    	cmpw   $0x0,0x2e(%rbp,%rbx,8)
01ee   5377ce:	0f 84 a0 03 00 00    	je     537b74 <balance_leaf+0x594>
01f4   5377d4:	49 8d 3c dc          	lea    (%r12,%rbx,8),%rdi
01f8   5377d8:	48 83 c7 08          	add    $0x8,%rdi
01fc   5377dc:	be 08 00 00 00       	mov    $0x8,%esi
0201   5377e1:	e8 00 00 00 00       	call   5377e6 <balance_leaf+0x206>	5377e2: R_X86_64_PLT32	__asan_loadN_noabort-0x4
0206   5377e6:	49 8b 44 dc 08       	mov    0x8(%r12,%rbx,8),%rax
020b   5377eb:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
0215   5377f5:	48 21 c8             	and    %rcx,%rax
0218   5377f8:	48 b9 00 00 00 00 00 00 00 10 	movabs $0x1000000000000000,%rcx
0222   537802:	48 39 c8             	cmp    %rcx,%rax
0225   537805:	0f 85 a5 03 00 00    	jne    537bb0 <balance_leaf+0x5d0>
022b   53780b:	e8 00 00 00 00       	call   537810 <balance_leaf+0x230>	53780c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0230   537810:	e9 82 03 00 00       	jmp    537b97 <balance_leaf+0x5b7>
0235   537815:	49 89 ee             	mov    %rbp,%r14
0238   537818:	49 c1 e6 04          	shl    $0x4,%r14
023c   53781c:	4b 8d 3c 37          	lea    (%r15,%r14,1),%rdi
0240   537820:	48 83 c7 08          	add    $0x8,%rdi
0244   537824:	e8 00 00 00 00       	call   537829 <balance_leaf+0x249>	537825: R_X86_64_PLT32	__asan_load8_noabort-0x4
0249   537829:	4b 8b 44 37 08       	mov    0x8(%r15,%r14,1),%rax
024e   53782e:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
0253   537833:	48 8b 1c 24          	mov    (%rsp),%rbx
0257   537837:	48 8d bb 98 00 00 00 	lea    0x98(%rbx),%rdi
025e   53783e:	48 89 7c 24 78       	mov    %rdi,0x78(%rsp)
0263   537843:	e8 00 00 00 00       	call   537848 <balance_leaf+0x268>	537844: R_X86_64_PLT32	__asan_load8_noabort-0x4
0268   537848:	4c 8b ab 98 00 00 00 	mov    0x98(%rbx),%r13
026f   53784f:	4d 85 ed             	test   %r13,%r13
0272   537852:	74 43                	je     537897 <balance_leaf+0x2b7>
0274   537854:	49 8d 7d 28          	lea    0x28(%r13),%rdi
0278   537858:	e8 00 00 00 00       	call   53785d <balance_leaf+0x27d>	537859: R_X86_64_PLT32	__asan_load8_noabort-0x4
027d   53785d:	49 8b 5d 28          	mov    0x28(%r13),%rbx
0281   537861:	48 89 df             	mov    %rbx,%rdi
0284   537864:	e8 00 00 00 00       	call   537869 <balance_leaf+0x289>	537865: R_X86_64_PLT32	__asan_load2_noabort-0x4
0289   537869:	66 83 3b 02          	cmpw   $0x2,(%rbx)
028d   53786d:	0f 85 72 56 00 00    	jne    53cee5 <balance_leaf+0x5905>
0293   537873:	e8 00 00 00 00       	call   537878 <balance_leaf+0x298>	537874: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0298   537878:	eb 22                	jmp    53789c <balance_leaf+0x2bc>
029a   53787a:	e8 00 00 00 00       	call   53787f <balance_leaf+0x29f>	53787b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
029f   53787f:	83 bc 24 d0 00 00 00 69 	cmpl   $0x69,0xd0(%rsp)
02a7   537887:	0f 85 0c ff ff ff    	jne    537799 <balance_leaf+0x1b9>
02ad   53788d:	e8 00 00 00 00       	call   537892 <balance_leaf+0x2b2>	53788e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02b2   537892:	e9 45 04 00 00       	jmp    537cdc <balance_leaf+0x6fc>
02b7   537897:	e8 00 00 00 00       	call   53789c <balance_leaf+0x2bc>	537898: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02bc   53789c:	48 8b 1c 24          	mov    (%rsp),%rbx
02c0   5378a0:	48 8d bb 04 02 00 00 	lea    0x204(%rbx),%rdi
02c7   5378a7:	e8 00 00 00 00       	call   5378ac <balance_leaf+0x2cc>	5378a8: R_X86_64_PLT32	__asan_load4_noabort-0x4
02cc   5378ac:	8b 9b 04 02 00 00    	mov    0x204(%rbx),%ebx
02d2   5378b2:	83 fb 02             	cmp    $0x2,%ebx
02d5   5378b5:	4c 8b ac 24 d0 00 00 00 	mov    0xd0(%rsp),%r13
02dd   5378bd:	0f 8d b4 55 00 00    	jge    53ce77 <balance_leaf+0x5897>
02e3   5378c3:	85 db                	test   %ebx,%ebx
02e5   5378c5:	74 07                	je     5378ce <balance_leaf+0x2ee>
02e7   5378c7:	e8 00 00 00 00       	call   5378cc <balance_leaf+0x2ec>	5378c8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02ec   5378cc:	eb 28                	jmp    5378f6 <balance_leaf+0x316>
02ee   5378ce:	83 c5 ff             	add    $0xffffffff,%ebp
02f1   5378d1:	48 63 dd             	movslq %ebp,%rbx
02f4   5378d4:	48 c1 e3 04          	shl    $0x4,%rbx
02f8   5378d8:	49 8d 3c 1f          	lea    (%r15,%rbx,1),%rdi
02fc   5378dc:	48 83 c7 08          	add    $0x8,%rdi
0300   5378e0:	e8 00 00 00 00       	call   5378e5 <balance_leaf+0x305>	5378e1: R_X86_64_PLT32	__asan_load8_noabort-0x4
0305   5378e5:	49 83 7c 1f 08 00    	cmpq   $0x0,0x8(%r15,%rbx,1)
030b   5378eb:	0f 84 34 57 00 00    	je     53d025 <balance_leaf+0x5a45>
0311   5378f1:	e8 00 00 00 00       	call   5378f6 <balance_leaf+0x316>	5378f2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0316   5378f6:	41 8d 45 9b          	lea    -0x65(%r13),%eax
031a   5378fa:	83 f8 fd             	cmp    $0xfffffffd,%eax
031d   5378fd:	0f 86 46 5f 00 00    	jbe    53d849 <balance_leaf+0x6269>
0323   537903:	4b 8d 3c 37          	lea    (%r15,%r14,1),%rdi
0327   537907:	48 83 c7 10          	add    $0x10,%rdi
032b   53790b:	e8 00 00 00 00       	call   537910 <balance_leaf+0x330>	53790c: R_X86_64_PLT32	__asan_load4_noabort-0x4
0330   537910:	4f 63 64 37 10       	movslq 0x10(%r15,%r14,1),%r12
0335   537915:	41 83 fd 64          	cmp    $0x64,%r13d
0339   537919:	0f 85 2a 01 00 00    	jne    537a49 <balance_leaf+0x469>
033f   53791f:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
0344   537924:	e8 00 00 00 00       	call   537929 <balance_leaf+0x349>	537925: R_X86_64_PLT32	__asan_store8_noabort-0x4
0349   537929:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)
0352   537932:	48 8b 5c 24 40       	mov    0x40(%rsp),%rbx
0357   537937:	4c 8d 6b 28          	lea    0x28(%rbx),%r13
035b   53793b:	4c 89 ef             	mov    %r13,%rdi
035e   53793e:	e8 00 00 00 00       	call   537943 <balance_leaf+0x363>	53793f: R_X86_64_PLT32	__asan_load8_noabort-0x4
0363   537943:	4c 8b 73 28          	mov    0x28(%rbx),%r14
0367   537947:	4b 8d 1c 64          	lea    (%r12,%r12,2),%rbx
036b   53794b:	49 8d 3c de          	lea    (%r14,%rbx,8),%rdi
036f   53794f:	48 83 c7 2a          	add    $0x2a,%rdi
0373   537953:	be 02 00 00 00       	mov    $0x2,%esi
0378   537958:	e8 00 00 00 00       	call   53795d <balance_leaf+0x37d>	537959: R_X86_64_PLT32	__asan_loadN_noabort-0x4
037d   53795d:	41 0f b7 44 de 2a    	movzwl 0x2a(%r14,%rbx,8),%eax
0383   537963:	48 83 c0 18          	add    $0x18,%rax
0387   537967:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
038c   53796c:	f7 dd                	neg    %ebp
038e   53796e:	48 63 cd             	movslq %ebp,%rcx
0391   537971:	48 39 c8             	cmp    %rcx,%rax
0394   537974:	0f 85 da 55 00 00    	jne    53cf54 <balance_leaf+0x5974>
039a   53797a:	48 8d 5c 24 20       	lea    0x20(%rsp),%rbx
039f   53797f:	48 89 df             	mov    %rbx,%rdi
03a2   537982:	e8 00 00 00 00       	call   537987 <balance_leaf+0x3a7>	537983: R_X86_64_PLT32	__asan_store8_noabort-0x4
03a7   537987:	4c 8b 34 24          	mov    (%rsp),%r14
03ab   53798b:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
03b0   537990:	4c 89 ff             	mov    %r15,%rdi
03b3   537993:	e8 00 00 00 00       	call   537998 <balance_leaf+0x3b8>	537994: R_X86_64_PLT32	__asan_load4_noabort-0x4
03b8   537998:	49 63 2f             	movslq (%r15),%rbp
03bb   53799b:	48 c1 e5 04          	shl    $0x4,%rbp
03bf   53799f:	49 8d 3c 2f          	lea    (%r15,%rbp,1),%rdi
03c3   5379a3:	48 83 c7 08          	add    $0x8,%rdi
03c7   5379a7:	e8 00 00 00 00       	call   5379ac <balance_leaf+0x3cc>	5379a8: R_X86_64_PLT32	__asan_load8_noabort-0x4
03cc   5379ac:	49 8b 6c 2f 08       	mov    0x8(%r15,%rbp,1),%rbp
03d1   5379b1:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
03d6   5379b6:	e8 00 00 00 00       	call   5379bb <balance_leaf+0x3db>	5379b7: R_X86_64_PLT32	__asan_store8_noabort-0x4
03db   5379bb:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
03e0   5379c0:	41 8b 07             	mov    (%r15),%eax
03e3   5379c3:	83 c0 ff             	add    $0xffffffff,%eax
03e6   5379c6:	48 63 e8             	movslq %eax,%rbp
03e9   5379c9:	48 c1 e5 04          	shl    $0x4,%rbp
03ed   5379cd:	49 8d 3c 2f          	lea    (%r15,%rbp,1),%rdi
03f1   5379d1:	48 83 c7 08          	add    $0x8,%rdi
03f5   5379d5:	e8 00 00 00 00       	call   5379da <balance_leaf+0x3fa>	5379d6: R_X86_64_PLT32	__asan_load8_noabort-0x4
03fa   5379da:	49 8b 6c 2f 08       	mov    0x8(%r15,%rbp,1),%rbp
03ff   5379df:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
0404   5379e4:	e8 00 00 00 00       	call   5379e9 <balance_leaf+0x409>	5379e5: R_X86_64_PLT32	__asan_store8_noabort-0x4
0409   5379e9:	48 89 6c 24 30       	mov    %rbp,0x30(%rsp)
040e   5379ee:	41 8b 07             	mov    (%r15),%eax
0411   5379f1:	83 c0 ff             	add    $0xffffffff,%eax
0414   5379f4:	48 63 e8             	movslq %eax,%rbp
0417   5379f7:	48 c1 e5 04          	shl    $0x4,%rbp
041b   5379fb:	49 8d 3c 2f          	lea    (%r15,%rbp,1),%rdi
041f   5379ff:	48 83 c7 10          	add    $0x10,%rdi
0423   537a03:	e8 00 00 00 00       	call   537a08 <balance_leaf+0x428>	537a04: R_X86_64_PLT32	__asan_load4_noabort-0x4
0428   537a08:	41 8b 6c 2f 10       	mov    0x10(%r15,%rbp,1),%ebp
042d   537a0d:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
0432   537a12:	e8 00 00 00 00       	call   537a17 <balance_leaf+0x437>	537a13: R_X86_64_PLT32	__asan_store4_noabort-0x4
0437   537a17:	89 6c 24 38          	mov    %ebp,0x38(%rsp)
043b   537a1b:	48 89 df             	mov    %rbx,%rdi
043e   537a1e:	31 f6                	xor    %esi,%esi
0440   537a20:	44 89 e2             	mov    %r12d,%edx
0443   537a23:	b9 01 00 00 00       	mov    $0x1,%ecx
0448   537a28:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
044e   537a2e:	e8 00 00 00 00       	call   537a33 <balance_leaf+0x453>	537a2f: R_X86_64_PLT32	leaf_delete_items-0x4
0453   537a33:	45 85 e4             	test   %r12d,%r12d
0456   537a36:	0f 84 2a 02 00 00    	je     537c66 <balance_leaf+0x686>
045c   537a3c:	e8 00 00 00 00       	call   537a41 <balance_leaf+0x461>	537a3d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0461   537a41:	4c 89 f5             	mov    %r14,%rbp
0464   537a44:	e9 b4 06 00 00       	jmp    5380fd <balance_leaf+0xb1d>
0469   537a49:	48 8b 5c 24 40       	mov    0x40(%rsp),%rbx
046e   537a4e:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
0472   537a52:	e8 00 00 00 00       	call   537a57 <balance_leaf+0x477>	537a53: R_X86_64_PLT32	__asan_load8_noabort-0x4
0477   537a57:	4c 8b 6b 28          	mov    0x28(%rbx),%r13
047b   537a5b:	4d 8d 75 18          	lea    0x18(%r13),%r14
047f   537a5f:	49 8d 7f 78          	lea    0x78(%r15),%rdi
0483   537a63:	e8 00 00 00 00       	call   537a68 <balance_leaf+0x488>	537a64: R_X86_64_PLT32	__asan_load4_noabort-0x4
0488   537a68:	41 8b 47 78          	mov    0x78(%r15),%eax
048c   537a6c:	89 44 24 70          	mov    %eax,0x70(%rsp)
0490   537a70:	48 8d 6c 24 38       	lea    0x38(%rsp),%rbp
0495   537a75:	48 89 ef             	mov    %rbp,%rdi
0498   537a78:	e8 00 00 00 00       	call   537a7d <balance_leaf+0x49d>	537a79: R_X86_64_PLT32	__asan_store8_noabort-0x4
049d   537a7d:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)
04a6   537a86:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
04ab   537a8b:	e8 00 00 00 00       	call   537a90 <balance_leaf+0x4b0>	537a8c: R_X86_64_PLT32	__asan_store8_noabort-0x4
04b0   537a90:	48 8b 04 24          	mov    (%rsp),%rax
04b4   537a94:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
04b9   537a99:	4c 89 ff             	mov    %r15,%rdi
04bc   537a9c:	e8 00 00 00 00       	call   537aa1 <balance_leaf+0x4c1>	537a9d: R_X86_64_PLT32	__asan_load4_noabort-0x4
04c1   537aa1:	49 63 1f             	movslq (%r15),%rbx
04c4   537aa4:	48 c1 e3 04          	shl    $0x4,%rbx
04c8   537aa8:	49 8d 3c 1f          	lea    (%r15,%rbx,1),%rdi
04cc   537aac:	48 83 c7 08          	add    $0x8,%rdi
04d0   537ab0:	e8 00 00 00 00       	call   537ab5 <balance_leaf+0x4d5>	537ab1: R_X86_64_PLT32	__asan_load8_noabort-0x4
04d5   537ab5:	49 8b 5c 1f 08       	mov    0x8(%r15,%rbx,1),%rbx
04da   537aba:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
04df   537abf:	e8 00 00 00 00       	call   537ac4 <balance_leaf+0x4e4>	537ac0: R_X86_64_PLT32	__asan_store8_noabort-0x4
04e4   537ac4:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
04e9   537ac9:	41 8b 07             	mov    (%r15),%eax
04ec   537acc:	83 c0 ff             	add    $0xffffffff,%eax
04ef   537acf:	48 63 d8             	movslq %eax,%rbx
04f2   537ad2:	48 c1 e3 04          	shl    $0x4,%rbx
04f6   537ad6:	49 8d 3c 1f          	lea    (%r15,%rbx,1),%rdi
04fa   537ada:	48 83 c7 08          	add    $0x8,%rdi
04fe   537ade:	e8 00 00 00 00       	call   537ae3 <balance_leaf+0x503>	537adf: R_X86_64_PLT32	__asan_load8_noabort-0x4
0503   537ae3:	49 8b 5c 1f 08       	mov    0x8(%r15,%rbx,1),%rbx
0508   537ae8:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
050d   537aed:	e8 00 00 00 00       	call   537af2 <balance_leaf+0x512>	537aee: R_X86_64_PLT32	__asan_store8_noabort-0x4
0512   537af2:	48 89 5c 24 30       	mov    %rbx,0x30(%rsp)
0517   537af7:	41 8b 07             	mov    (%r15),%eax
051a   537afa:	83 c0 ff             	add    $0xffffffff,%eax
051d   537afd:	48 63 d8             	movslq %eax,%rbx
0520   537b00:	48 c1 e3 04          	shl    $0x4,%rbx
0524   537b04:	49 8d 3c 1f          	lea    (%r15,%rbx,1),%rdi
0528   537b08:	48 83 c7 10          	add    $0x10,%rdi
052c   537b0c:	e8 00 00 00 00       	call   537b11 <balance_leaf+0x531>	537b0d: R_X86_64_PLT32	__asan_load4_noabort-0x4
0531   537b11:	41 8b 5c 1f 10       	mov    0x10(%r15,%rbx,1),%ebx
0536   537b16:	48 89 ef             	mov    %rbp,%rdi
0539   537b19:	e8 00 00 00 00       	call   537b1e <balance_leaf+0x53e>	537b1a: R_X86_64_PLT32	__asan_store4_noabort-0x4
053e   537b1e:	89 5c 24 38          	mov    %ebx,0x38(%rsp)
0542   537b22:	4b 8d 2c 64          	lea    (%r12,%r12,2),%rbp
0546   537b26:	48 8d 3c ed 2e 00 00 00 	lea    0x2e(,%rbp,8),%rdi
054e   537b2e:	4c 01 ef             	add    %r13,%rdi
0551   537b31:	be 02 00 00 00       	mov    $0x2,%esi
0556   537b36:	e8 00 00 00 00       	call   537b3b <balance_leaf+0x55b>	537b37: R_X86_64_PLT32	__asan_loadN_noabort-0x4
055b   537b3b:	66 41 83 7c ed 2e 00 	cmpw   $0x0,0x2e(%r13,%rbp,8)
0562   537b42:	74 76                	je     537bba <balance_leaf+0x5da>
0564   537b44:	49 8d 3c ee          	lea    (%r14,%rbp,8),%rdi
0568   537b48:	48 83 c7 08          	add    $0x8,%rdi
056c   537b4c:	be 08 00 00 00       	mov    $0x8,%esi
0571   537b51:	e8 00 00 00 00       	call   537b56 <balance_leaf+0x576>	537b52: R_X86_64_PLT32	__asan_loadN_noabort-0x4
0576   537b56:	49 8b 44 ee 08       	mov    0x8(%r14,%rbp,8),%rax
057b   537b5b:	48 c1 e8 3c          	shr    $0x3c,%rax
057f   537b5f:	83 f8 03             	cmp    $0x3,%eax
0582   537b62:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
0587   537b67:	0f 85 bd 04 00 00    	jne    53802a <balance_leaf+0xa4a>
058d   537b6d:	e8 00 00 00 00       	call   537b72 <balance_leaf+0x592>	537b6e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0592   537b72:	eb 71                	jmp    537be5 <balance_leaf+0x605>
0594   537b74:	49 8d 3c dc          	lea    (%r12,%rbx,8),%rdi
0598   537b78:	48 83 c7 0c          	add    $0xc,%rdi
059c   537b7c:	be 04 00 00 00       	mov    $0x4,%esi
05a1   537b81:	e8 00 00 00 00       	call   537b86 <balance_leaf+0x5a6>	537b82: R_X86_64_PLT32	__asan_loadN_noabort-0x4
05a6   537b86:	41 83 7c dc 0c fe    	cmpl   $0xfffffffe,0xc(%r12,%rbx,8)
05ac   537b8c:	0f 85 45 01 00 00    	jne    537cd7 <balance_leaf+0x6f7>
05b2   537b92:	e8 00 00 00 00       	call   537b97 <balance_leaf+0x5b7>	537b93: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05b7   537b97:	41 c1 e5 02          	shl    $0x2,%r13d
05bb   537b9b:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
05c0   537ba0:	48 89 df             	mov    %rbx,%rdi
05c3   537ba3:	e8 00 00 00 00       	call   537ba8 <balance_leaf+0x5c8>	537ba4: R_X86_64_PLT32	__asan_store4_noabort-0x4
05c8   537ba8:	44 89 2b             	mov    %r13d,(%rbx)
05cb   537bab:	e9 2c 01 00 00       	jmp    537cdc <balance_leaf+0x6fc>
05d0   537bb0:	e8 00 00 00 00       	call   537bb5 <balance_leaf+0x5d5>	537bb1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05d5   537bb5:	e9 22 01 00 00       	jmp    537cdc <balance_leaf+0x6fc>
05da   537bba:	49 8d 3c ee          	lea    (%r14,%rbp,8),%rdi
05de   537bbe:	48 83 c7 0c          	add    $0xc,%rdi
05e2   537bc2:	be 04 00 00 00       	mov    $0x4,%esi
05e7   537bc7:	e8 00 00 00 00       	call   537bcc <balance_leaf+0x5ec>	537bc8: R_X86_64_PLT32	__asan_loadN_noabort-0x4
05ec   537bcc:	41 81 7c ee 0c f4 01 00 00 	cmpl   $0x1f4,0xc(%r14,%rbp,8)
05f5   537bd5:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
05fa   537bda:	0f 85 73 04 00 00    	jne    538053 <balance_leaf+0xa73>
0600   537be0:	e8 00 00 00 00       	call   537be5 <balance_leaf+0x605>	537be1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0605   537be5:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
060a   537bea:	8b 6c 24 70          	mov    0x70(%rsp),%ebp
060e   537bee:	48 89 df             	mov    %rbx,%rdi
0611   537bf1:	e8 00 00 00 00       	call   537bf6 <balance_leaf+0x616>	537bf2: R_X86_64_PLT32	__asan_store4_noabort-0x4
0616   537bf6:	c7 03 ff ff ff ff    	movl   $0xffffffff,(%rbx)
061c   537bfc:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
0621   537c01:	44 89 e6             	mov    %r12d,%esi
0624   537c04:	89 ea                	mov    %ebp,%edx
0626   537c06:	b9 01 00 00 00       	mov    $0x1,%ecx
062b   537c0b:	e8 00 00 00 00       	call   537c10 <balance_leaf+0x630>	537c0c: R_X86_64_PLT32	leaf_cut_from_buffer-0x4
0630   537c10:	41 09 ec             	or     %ebp,%r12d
0633   537c13:	0f 85 2c 04 00 00    	jne    538045 <balance_leaf+0xa65>
0639   537c19:	48 8b 2c 24          	mov    (%rsp),%rbp
063d   537c1d:	48 8d bd c0 00 00 00 	lea    0xc0(%rbp),%rdi
0644   537c24:	e8 00 00 00 00       	call   537c29 <balance_leaf+0x649>	537c25: R_X86_64_PLT32	__asan_load8_noabort-0x4
0649   537c29:	48 8b 9d c0 00 00 00 	mov    0xc0(%rbp),%rbx
0650   537c30:	48 85 db             	test   %rbx,%rbx
0653   537c33:	0f 84 95 56 00 00    	je     53d2ce <balance_leaf+0x5cee>
0659   537c39:	e8 00 00 00 00       	call   537c3e <balance_leaf+0x65e>	537c3a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
065e   537c3e:	48 8d bd c8 01 00 00 	lea    0x1c8(%rbp),%rdi
0665   537c45:	e8 00 00 00 00       	call   537c4a <balance_leaf+0x66a>	537c46: R_X86_64_PLT32	__asan_load4_noabort-0x4
066a   537c4a:	8b 95 c8 01 00 00    	mov    0x1c8(%rbp),%edx
0670   537c50:	48 89 ef             	mov    %rbp,%rdi
0673   537c53:	48 89 de             	mov    %rbx,%rsi
0676   537c56:	4c 89 f9             	mov    %r15,%rcx
0679   537c59:	45 31 c0             	xor    %r8d,%r8d
067c   537c5c:	e8 00 00 00 00       	call   537c61 <balance_leaf+0x681>	537c5d: R_X86_64_PLT32	replace_key-0x4
0681   537c61:	e9 9c 04 00 00       	jmp    538102 <balance_leaf+0xb22>
0686   537c66:	4d 8d be c0 00 00 00 	lea    0xc0(%r14),%r15
068d   537c6d:	4c 89 ff             	mov    %r15,%rdi
0690   537c70:	e8 00 00 00 00       	call   537c75 <balance_leaf+0x695>	537c71: R_X86_64_PLT32	__asan_load8_noabort-0x4
0695   537c75:	4d 8b a6 c0 00 00 00 	mov    0xc0(%r14),%r12
069c   537c7c:	4d 85 e4             	test   %r12,%r12
069f   537c7f:	0f 84 4f 55 00 00    	je     53d1d4 <balance_leaf+0x5bf4>
06a5   537c85:	4c 89 f5             	mov    %r14,%rbp
06a8   537c88:	4c 89 ef             	mov    %r13,%rdi
06ab   537c8b:	e8 00 00 00 00       	call   537c90 <balance_leaf+0x6b0>	537c8c: R_X86_64_PLT32	__asan_load8_noabort-0x4
06b0   537c90:	49 8b 5d 00          	mov    0x0(%r13),%rbx
06b4   537c94:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
06b8   537c98:	e8 00 00 00 00       	call   537c9d <balance_leaf+0x6bd>	537c99: R_X86_64_PLT32	__asan_load2_noabort-0x4
06bd   537c9d:	66 83 7b 02 00       	cmpw   $0x0,0x2(%rbx)
06c2   537ca2:	0f 84 f7 03 00 00    	je     53809f <balance_leaf+0xabf>
06c8   537ca8:	e8 00 00 00 00       	call   537cad <balance_leaf+0x6cd>	537ca9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06cd   537cad:	48 8d bd c8 01 00 00 	lea    0x1c8(%rbp),%rdi
06d4   537cb4:	e8 00 00 00 00       	call   537cb9 <balance_leaf+0x6d9>	537cb5: R_X86_64_PLT32	__asan_load4_noabort-0x4
06d9   537cb9:	8b 95 c8 01 00 00    	mov    0x1c8(%rbp),%edx
06df   537cbf:	48 89 ef             	mov    %rbp,%rdi
06e2   537cc2:	4c 89 e6             	mov    %r12,%rsi
06e5   537cc5:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
06ea   537cca:	45 31 c0             	xor    %r8d,%r8d
06ed   537ccd:	e8 00 00 00 00       	call   537cd2 <balance_leaf+0x6f2>	537cce: R_X86_64_PLT32	replace_key-0x4
06f2   537cd2:	e9 0f 04 00 00       	jmp    5380e6 <balance_leaf+0xb06>
06f7   537cd7:	e8 00 00 00 00       	call   537cdc <balance_leaf+0x6fc>	537cd8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06fc   537cdc:	48 8b 1c 24          	mov    (%rsp),%rbx
0700   537ce0:	48 8d bb a0 01 00 00 	lea    0x1a0(%rbx),%rdi
0707   537ce7:	48 89 7c 24 40       	mov    %rdi,0x40(%rsp)
070c   537cec:	e8 00 00 00 00       	call   537cf1 <balance_leaf+0x711>	537ced: R_X86_64_PLT32	__asan_load4_noabort-0x4
0711   537cf1:	44 8b ab a0 01 00 00 	mov    0x1a0(%rbx),%r13d
0718   537cf8:	45 85 ed             	test   %r13d,%r13d
071b   537cfb:	0f 8e ab 01 00 00    	jle    537eac <balance_leaf+0x8cc>
0721   537d01:	45 39 ee             	cmp    %r13d,%r14d
0724   537d04:	0f 8d a9 01 00 00    	jge    537eb3 <balance_leaf+0x8d3>
072a   537d0a:	48 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%rax
0732   537d12:	83 f8 69             	cmp    $0x69,%eax
0735   537d15:	0f 85 ca 01 00 00    	jne    537ee5 <balance_leaf+0x905>
073b   537d1b:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
0740   537d20:	ba 20 00 00 00       	mov    $0x20,%edx
0745   537d25:	31 f6                	xor    %esi,%esi
0747   537d27:	e8 00 00 00 00       	call   537d2c <balance_leaf+0x74c>	537d28: R_X86_64_PLT32	memset-0x4
074c   537d2c:	48 8b 2c 24          	mov    (%rsp),%rbp
0750   537d30:	4c 8d 65 20          	lea    0x20(%rbp),%r12
0754   537d34:	4c 89 e7             	mov    %r12,%rdi
0757   537d37:	e8 00 00 00 00       	call   537d3c <balance_leaf+0x75c>	537d38: R_X86_64_PLT32	__asan_load8_noabort-0x4
075c   537d3c:	48 8b 5d 20          	mov    0x20(%rbp),%rbx
0760   537d40:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
0764   537d44:	e8 00 00 00 00       	call   537d49 <balance_leaf+0x769>	537d45: R_X86_64_PLT32	__asan_load8_noabort-0x4
0769   537d49:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
076d   537d4d:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0771   537d51:	e8 00 00 00 00       	call   537d56 <balance_leaf+0x776>	537d52: R_X86_64_PLT32	__asan_load2_noabort-0x4
0776   537d56:	44 0f b7 7b 02       	movzwl 0x2(%rbx),%r15d
077b   537d5b:	41 83 c5 ff          	add    $0xffffffff,%r13d
077f   537d5f:	45 39 ee             	cmp    %r13d,%r14d
0782   537d62:	0f 85 c9 02 00 00    	jne    538031 <balance_leaf+0xa51>
0788   537d68:	48 8d 9d 20 02 00 00 	lea    0x220(%rbp),%rbx
078f   537d6f:	48 89 df             	mov    %rbx,%rdi
0792   537d72:	e8 00 00 00 00       	call   537d77 <balance_leaf+0x797>	537d73: R_X86_64_PLT32	__asan_load4_noabort-0x4
0797   537d77:	83 bd 20 02 00 00 ff 	cmpl   $0xffffffff,0x220(%rbp)
079e   537d7e:	0f 84 e1 06 00 00    	je     538465 <balance_leaf+0xe85>
07a4   537d84:	48 89 ef             	mov    %rbp,%rdi
07a7   537d87:	44 89 f6             	mov    %r14d,%esi
07aa   537d8a:	ba ff ff ff ff       	mov    $0xffffffff,%edx
07af   537d8f:	e8 00 00 00 00       	call   537d94 <balance_leaf+0x7b4>	537d90: R_X86_64_PLT32	leaf_shift_left-0x4
07b4   537d94:	89 84 24 80 00 00 00 	mov    %eax,0x80(%rsp)
07bb   537d9b:	49 89 de             	mov    %rbx,%r14
07be   537d9e:	48 8b 9c 24 a0 00 00 00 	mov    0xa0(%rsp),%rbx
07c6   537da6:	48 8d 7b 12          	lea    0x12(%rbx),%rdi
07ca   537daa:	be 02 00 00 00       	mov    $0x2,%esi
07cf   537daf:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
07d4   537db4:	e8 00 00 00 00       	call   537db9 <balance_leaf+0x7d9>	537db5: R_X86_64_PLT32	__asan_loadN_noabort-0x4
07d9   537db9:	0f b7 43 12          	movzwl 0x12(%rbx),%eax
07dd   537dbd:	89 44 24 50          	mov    %eax,0x50(%rsp)
07e1   537dc1:	4c 89 74 24 08       	mov    %r14,0x8(%rsp)
07e6   537dc6:	4c 89 f7             	mov    %r14,%rdi
07e9   537dc9:	e8 00 00 00 00       	call   537dce <balance_leaf+0x7ee>	537dca: R_X86_64_PLT32	__asan_load4_noabort-0x4
07ee   537dce:	8b 85 20 02 00 00    	mov    0x220(%rbp),%eax
07f4   537dd4:	89 c1                	mov    %eax,%ecx
07f6   537dd6:	89 44 24 68          	mov    %eax,0x68(%rsp)
07fa   537dda:	66 89 43 12          	mov    %ax,0x12(%rbx)
07fe   537dde:	81 e1 ff ff 00 00    	and    $0xffff,%ecx
0804   537de4:	89 8c 24 98 00 00 00 	mov    %ecx,0x98(%rsp)
080b   537deb:	0f 84 7c 55 00 00    	je     53d36d <balance_leaf+0x5d8d>
0811   537df1:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
0816   537df6:	e8 00 00 00 00       	call   537dfb <balance_leaf+0x81b>	537df7: R_X86_64_PLT32	__asan_store8_noabort-0x4
081b   537dfb:	48 89 6c 24 20       	mov    %rbp,0x20(%rsp)
0820   537e00:	4c 89 e7             	mov    %r12,%rdi
0823   537e03:	e8 00 00 00 00       	call   537e08 <balance_leaf+0x828>	537e04: R_X86_64_PLT32	__asan_load8_noabort-0x4
0828   537e08:	48 8b 5d 20          	mov    0x20(%rbp),%rbx
082c   537e0c:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
0831   537e11:	e8 00 00 00 00       	call   537e16 <balance_leaf+0x836>	537e12: R_X86_64_PLT32	__asan_store8_noabort-0x4
0836   537e16:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
083b   537e1b:	48 8d 7d 70          	lea    0x70(%rbp),%rdi
083f   537e1f:	e8 00 00 00 00       	call   537e24 <balance_leaf+0x844>	537e20: R_X86_64_PLT32	__asan_load8_noabort-0x4
0844   537e24:	4c 8b 75 70          	mov    0x70(%rbp),%r14
0848   537e28:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
084d   537e2d:	e8 00 00 00 00       	call   537e32 <balance_leaf+0x852>	537e2e: R_X86_64_PLT32	__asan_store8_noabort-0x4
0852   537e32:	4c 89 74 24 30       	mov    %r14,0x30(%rsp)
0857   537e37:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
085f   537e3f:	e8 00 00 00 00       	call   537e44 <balance_leaf+0x864>	537e40: R_X86_64_PLT32	__asan_load8_noabort-0x4
0864   537e44:	48 8b 5d 18          	mov    0x18(%rbp),%rbx
0868   537e48:	48 89 df             	mov    %rbx,%rdi
086b   537e4b:	e8 00 00 00 00       	call   537e50 <balance_leaf+0x870>	537e4c: R_X86_64_PLT32	__asan_load4_noabort-0x4
0870   537e50:	8b 03                	mov    (%rbx),%eax
0872   537e52:	83 c0 ff             	add    $0xffffffff,%eax
0875   537e55:	4c 63 e0             	movslq %eax,%r12
0878   537e58:	49 c1 e4 04          	shl    $0x4,%r12
087c   537e5c:	4a 8d 2c 23          	lea    (%rbx,%r12,1),%rbp
0880   537e60:	48 83 c5 08          	add    $0x8,%rbp
0884   537e64:	4a 8d 3c 23          	lea    (%rbx,%r12,1),%rdi
0888   537e68:	48 83 c7 10          	add    $0x10,%rdi
088c   537e6c:	e8 00 00 00 00       	call   537e71 <balance_leaf+0x891>	537e6d: R_X86_64_PLT32	__asan_load4_noabort-0x4
0891   537e71:	46 8b 6c 23 10       	mov    0x10(%rbx,%r12,1),%r13d
0896   537e76:	48 89 ef             	mov    %rbp,%rdi
0899   537e79:	e8 00 00 00 00       	call   537e7e <balance_leaf+0x89e>	537e7a: R_X86_64_PLT32	__asan_load8_noabort-0x4
089e   537e7e:	4a 8b 5c 23 08       	mov    0x8(%rbx,%r12,1),%rbx
08a3   537e83:	48 85 db             	test   %rbx,%rbx
08a6   537e86:	0f 84 0a 55 00 00    	je     53d396 <balance_leaf+0x5db6>
08ac   537e8c:	4d 85 f6             	test   %r14,%r14
08af   537e8f:	0f 84 01 55 00 00    	je     53d396 <balance_leaf+0x5db6>
08b5   537e95:	45 85 ed             	test   %r13d,%r13d
08b8   537e98:	0f 84 f4 09 00 00    	je     538892 <balance_leaf+0x12b2>
08be   537e9e:	e8 00 00 00 00       	call   537ea3 <balance_leaf+0x8c3>	537e9f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08c3   537ea3:	41 83 c5 ff          	add    $0xffffffff,%r13d
08c7   537ea7:	e9 06 0a 00 00       	jmp    5388b2 <balance_leaf+0x12d2>
08cc   537eac:	e8 00 00 00 00       	call   537eb1 <balance_leaf+0x8d1>	537ead: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08d1   537eb1:	eb 26                	jmp    537ed9 <balance_leaf+0x8f9>
08d3   537eb3:	e8 00 00 00 00       	call   537eb8 <balance_leaf+0x8d8>	537eb4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08d8   537eb8:	48 8b 1c 24          	mov    (%rsp),%rbx
08dc   537ebc:	48 8d bb 20 02 00 00 	lea    0x220(%rbx),%rdi
08e3   537ec3:	e8 00 00 00 00       	call   537ec8 <balance_leaf+0x8e8>	537ec4: R_X86_64_PLT32	__asan_load4_noabort-0x4
08e8   537ec8:	8b 93 20 02 00 00    	mov    0x220(%rbx),%edx
08ee   537ece:	48 89 df             	mov    %rbx,%rdi
08f1   537ed1:	44 89 ee             	mov    %r13d,%esi
08f4   537ed4:	e8 00 00 00 00       	call   537ed9 <balance_leaf+0x8f9>	537ed5: R_X86_64_PLT32	leaf_shift_left-0x4
08f9   537ed9:	31 db                	xor    %ebx,%ebx
08fb   537edb:	48 8b 6c 24 48       	mov    0x48(%rsp),%rbp
0900   537ee0:	e9 48 13 00 00       	jmp    53922d <balance_leaf+0x1c4d>
0905   537ee5:	83 f8 70             	cmp    $0x70,%eax
0908   537ee8:	0f 85 70 59 00 00    	jne    53d85e <balance_leaf+0x627e>
090e   537eee:	41 8d 45 ff          	lea    -0x1(%r13),%eax
0912   537ef2:	41 39 c6             	cmp    %eax,%r14d
0915   537ef5:	0f 85 40 01 00 00    	jne    53803b <balance_leaf+0xa5b>
091b   537efb:	48 8b 2c 24          	mov    (%rsp),%rbp
091f   537eff:	48 8d 9d 20 02 00 00 	lea    0x220(%rbp),%rbx
0926   537f06:	48 89 df             	mov    %rbx,%rdi
0929   537f09:	e8 00 00 00 00       	call   537f0e <balance_leaf+0x92e>	537f0a: R_X86_64_PLT32	__asan_load4_noabort-0x4
092e   537f0e:	8b 85 20 02 00 00    	mov    0x220(%rbp),%eax
0934   537f14:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
0939   537f19:	83 f8 ff             	cmp    $0xffffffff,%eax
093c   537f1c:	0f 84 ab 06 00 00    	je     5385cd <balance_leaf+0xfed>
0942   537f22:	48 89 5c 24 68       	mov    %rbx,0x68(%rsp)
0947   537f27:	4c 89 ff             	mov    %r15,%rdi
094a   537f2a:	e8 00 00 00 00       	call   537f2f <balance_leaf+0x94f>	537f2b: R_X86_64_PLT32	__asan_load4_noabort-0x4
094f   537f2f:	49 63 1f             	movslq (%r15),%rbx
0952   537f32:	48 c1 e3 04          	shl    $0x4,%rbx
0956   537f36:	49 8d 3c 1f          	lea    (%r15,%rbx,1),%rdi
095a   537f3a:	48 83 c7 08          	add    $0x8,%rdi
095e   537f3e:	e8 00 00 00 00       	call   537f43 <balance_leaf+0x963>	537f3f: R_X86_64_PLT32	__asan_load8_noabort-0x4
0963   537f43:	49 8b 6c 1f 08       	mov    0x8(%r15,%rbx,1),%rbp
0968   537f48:	48 8b 1c 24          	mov    (%rsp),%rbx
096c   537f4c:	48 8d 7b 20          	lea    0x20(%rbx),%rdi
0970   537f50:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
0975   537f55:	e8 00 00 00 00       	call   537f5a <balance_leaf+0x97a>	537f56: R_X86_64_PLT32	__asan_load8_noabort-0x4
097a   537f5a:	48 8b 5b 20          	mov    0x20(%rbx),%rbx
097e   537f5e:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
0982   537f62:	e8 00 00 00 00       	call   537f67 <balance_leaf+0x987>	537f63: R_X86_64_PLT32	__asan_load8_noabort-0x4
0987   537f67:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
098b   537f6b:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
098f   537f6f:	48 89 bc 24 80 00 00 00 	mov    %rdi,0x80(%rsp)
0997   537f77:	e8 00 00 00 00       	call   537f7c <balance_leaf+0x99c>	537f78: R_X86_64_PLT32	__asan_load2_noabort-0x4
099c   537f7c:	44 0f b7 63 02       	movzwl 0x2(%rbx),%r12d
09a1   537f81:	48 8d bc 24 c8 00 00 00 	lea    0xc8(%rsp),%rdi
09a9   537f89:	e8 00 00 00 00       	call   537f8e <balance_leaf+0x9ae>	537f8a: R_X86_64_PLT32	__asan_store8_noabort-0x4
09ae   537f8e:	48 c7 84 24 c8 00 00 00 00 00 00 00 	movq   $0x0,0xc8(%rsp)
09ba   537f9a:	48 8d 7d 28          	lea    0x28(%rbp),%rdi
09be   537f9e:	48 89 bc 24 d8 00 00 00 	mov    %rdi,0xd8(%rsp)
09c6   537fa6:	e8 00 00 00 00       	call   537fab <balance_leaf+0x9cb>	537fa7: R_X86_64_PLT32	__asan_load8_noabort-0x4
09cb   537fab:	48 89 ac 24 a8 00 00 00 	mov    %rbp,0xa8(%rsp)
09d3   537fb3:	4c 8b 7d 28          	mov    0x28(%rbp),%r15
09d7   537fb7:	49 8d 6f 18          	lea    0x18(%r15),%rbp
09db   537fbb:	4b 8d 1c 76          	lea    (%r14,%r14,2),%rbx
09df   537fbf:	49 8d 3c df          	lea    (%r15,%rbx,8),%rdi
09e3   537fc3:	48 83 c7 2e          	add    $0x2e,%rdi
09e7   537fc7:	be 02 00 00 00       	mov    $0x2,%esi
09ec   537fcc:	e8 00 00 00 00       	call   537fd1 <balance_leaf+0x9f1>	537fcd: R_X86_64_PLT32	__asan_loadN_noabort-0x4
09f1   537fd1:	4c 89 bc 24 98 00 00 00 	mov    %r15,0x98(%rsp)
09f9   537fd9:	66 41 83 7c df 2e 00 	cmpw   $0x0,0x2e(%r15,%rbx,8)
0a00   537fe0:	0f 84 e9 07 00 00    	je     5387cf <balance_leaf+0x11ef>
0a06   537fe6:	48 8d 3c dd 08 00 00 00 	lea    0x8(,%rbx,8),%rdi
0a0e   537fee:	48 01 ef             	add    %rbp,%rdi
0a11   537ff1:	be 08 00 00 00       	mov    $0x8,%esi
0a16   537ff6:	e8 00 00 00 00       	call   537ffb <balance_leaf+0xa1b>	537ff7: R_X86_64_PLT32	__asan_loadN_noabort-0x4
0a1b   537ffb:	48 8b 44 dd 08       	mov    0x8(%rbp,%rbx,8),%rax
0a20   538000:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
0a2a   53800a:	48 21 c8             	and    %rcx,%rax
0a2d   53800d:	48 b9 00 00 00 00 00 00 00 30 	movabs $0x3000000000000000,%rcx
0a37   538017:	48 39 c8             	cmp    %rcx,%rax
0a3a   53801a:	0f 85 30 0a 00 00    	jne    538a50 <balance_leaf+0x1470>
0a40   538020:	e8 00 00 00 00       	call   538025 <balance_leaf+0xa45>	538021: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a45   538025:	e9 cd 07 00 00       	jmp    5387f7 <balance_leaf+0x1217>
0a4a   53802a:	e8 00 00 00 00       	call   53802f <balance_leaf+0xa4f>	53802b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a4f   53802f:	eb 27                	jmp    538058 <balance_leaf+0xa78>
0a51   538031:	e8 00 00 00 00       	call   538036 <balance_leaf+0xa56>	538032: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a56   538036:	e9 2f 04 00 00       	jmp    53846a <balance_leaf+0xe8a>
0a5b   53803b:	e8 00 00 00 00       	call   538040 <balance_leaf+0xa60>	53803c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a60   538040:	e9 8d 05 00 00       	jmp    5385d2 <balance_leaf+0xff2>
0a65   538045:	e8 00 00 00 00       	call   53804a <balance_leaf+0xa6a>	538046: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a6a   53804a:	48 8b 2c 24          	mov    (%rsp),%rbp
0a6e   53804e:	e9 af 00 00 00       	jmp    538102 <balance_leaf+0xb22>
0a73   538053:	e8 00 00 00 00       	call   538058 <balance_leaf+0xa78>	538054: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a78   538058:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
0a7d   53805d:	8b 54 24 70          	mov    0x70(%rsp),%edx
0a81   538061:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0a86   538066:	f7 d9                	neg    %ecx
0a88   538068:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
0a8d   53806d:	44 89 e6             	mov    %r12d,%esi
0a90   538070:	e8 00 00 00 00       	call   538075 <balance_leaf+0xa95>	538071: R_X86_64_PLT32	leaf_cut_from_buffer-0x4
0a95   538075:	49 8d 3c ee          	lea    (%r14,%rbp,8),%rdi
0a99   538079:	48 83 c7 12          	add    $0x12,%rdi
0a9d   53807d:	be 02 00 00 00       	mov    $0x2,%esi
0aa2   538082:	e8 00 00 00 00       	call   538087 <balance_leaf+0xaa7>	538083: R_X86_64_PLT32	__asan_loadN_noabort-0x4
0aa7   538087:	66 41 83 7c ee 12 00 	cmpw   $0x0,0x12(%r14,%rbp,8)
0aae   53808e:	0f 84 68 50 00 00    	je     53d0fc <balance_leaf+0x5b1c>
0ab4   538094:	e8 00 00 00 00       	call   538099 <balance_leaf+0xab9>	538095: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ab9   538099:	48 8b 2c 24          	mov    (%rsp),%rbp
0abd   53809d:	eb 63                	jmp    538102 <balance_leaf+0xb22>
0abf   53809f:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
0ac7   5380a7:	48 89 df             	mov    %rbx,%rdi
0aca   5380aa:	e8 00 00 00 00       	call   5380af <balance_leaf+0xacf>	5380ab: R_X86_64_PLT32	__asan_load8_noabort-0x4
0acf   5380af:	4c 8b 2b             	mov    (%rbx),%r13
0ad2   5380b2:	4c 89 ef             	mov    %r13,%rdi
0ad5   5380b5:	e8 00 00 00 00       	call   5380ba <balance_leaf+0xada>	5380b6: R_X86_64_PLT32	__asan_load4_noabort-0x4
0ada   5380ba:	41 8b 45 00          	mov    0x0(%r13),%eax
0ade   5380be:	83 c0 ff             	add    $0xffffffff,%eax
0ae1   5380c1:	48 63 d8             	movslq %eax,%rbx
0ae4   5380c4:	48 c1 e3 04          	shl    $0x4,%rbx
0ae8   5380c8:	4a 8d 3c 2b          	lea    (%rbx,%r13,1),%rdi
0aec   5380cc:	48 83 c7 10          	add    $0x10,%rdi
0af0   5380d0:	e8 00 00 00 00       	call   5380d5 <balance_leaf+0xaf5>	5380d1: R_X86_64_PLT32	__asan_load4_noabort-0x4
0af5   5380d5:	41 83 7c 1d 10 00    	cmpl   $0x0,0x10(%r13,%rbx,1)
0afb   5380db:	0f 84 30 09 00 00    	je     538a11 <balance_leaf+0x1431>
0b01   5380e1:	e8 00 00 00 00       	call   5380e6 <balance_leaf+0xb06>	5380e2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b06   5380e6:	4c 89 ff             	mov    %r15,%rdi
0b09   5380e9:	e8 00 00 00 00       	call   5380ee <balance_leaf+0xb0e>	5380ea: R_X86_64_PLT32	__asan_load8_noabort-0x4
0b0e   5380ee:	49 83 3f 00          	cmpq   $0x0,(%r15)
0b12   5380f2:	0f 84 e3 50 00 00    	je     53d1db <balance_leaf+0x5bfb>
0b18   5380f8:	e8 00 00 00 00       	call   5380fd <balance_leaf+0xb1d>	5380f9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b1d   5380fd:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
0b22   538102:	49 8d 7f 28          	lea    0x28(%r15),%rdi
0b26   538106:	e8 00 00 00 00       	call   53810b <balance_leaf+0xb2b>	538107: R_X86_64_PLT32	__asan_load8_noabort-0x4
0b2b   53810b:	49 8b 5f 28          	mov    0x28(%r15),%rbx
0b2f   53810f:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0b33   538113:	e8 00 00 00 00       	call   538118 <balance_leaf+0xb38>	538114: R_X86_64_PLT32	__asan_load2_noabort-0x4
0b38   538118:	44 0f b7 73 02       	movzwl 0x2(%rbx),%r14d
0b3d   53811d:	48 8d bd a0 01 00 00 	lea    0x1a0(%rbp),%rdi
0b44   538124:	e8 00 00 00 00       	call   538129 <balance_leaf+0xb49>	538125: R_X86_64_PLT32	__asan_load4_noabort-0x4
0b49   538129:	44 8b a5 a0 01 00 00 	mov    0x1a0(%rbp),%r12d
0b50   538130:	45 85 e4             	test   %r12d,%r12d
0b53   538133:	0f 84 ea 00 00 00    	je     538223 <balance_leaf+0xc43>
0b59   538139:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
0b61   538141:	e8 00 00 00 00       	call   538146 <balance_leaf+0xb66>	538142: R_X86_64_PLT32	__asan_load8_noabort-0x4
0b66   538146:	4c 8b 6d 18          	mov    0x18(%rbp),%r13
0b6a   53814a:	4c 89 ef             	mov    %r13,%rdi
0b6d   53814d:	e8 00 00 00 00       	call   538152 <balance_leaf+0xb72>	53814e: R_X86_64_PLT32	__asan_load4_noabort-0x4
0b72   538152:	4d 63 7d 00          	movslq 0x0(%r13),%r15
0b76   538156:	4c 89 fb             	mov    %r15,%rbx
0b79   538159:	48 c1 e3 04          	shl    $0x4,%rbx
0b7d   53815d:	4a 8d 3c 2b          	lea    (%rbx,%r13,1),%rdi
0b81   538161:	48 83 c7 08          	add    $0x8,%rdi
0b85   538165:	e8 00 00 00 00       	call   53816a <balance_leaf+0xb8a>	538166: R_X86_64_PLT32	__asan_load8_noabort-0x4
0b8a   53816a:	49 8b 5c 1d 08       	mov    0x8(%r13,%rbx,1),%rbx
0b8f   53816f:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
0b93   538173:	e8 00 00 00 00       	call   538178 <balance_leaf+0xb98>	538174: R_X86_64_PLT32	__asan_load8_noabort-0x4
0b98   538178:	48 89 5c 24 40       	mov    %rbx,0x40(%rsp)
0b9d   53817d:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
0ba1   538181:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0ba5   538185:	e8 00 00 00 00       	call   53818a <balance_leaf+0xbaa>	538186: R_X86_64_PLT32	__asan_load2_noabort-0x4
0baa   53818a:	0f b7 5b 02          	movzwl 0x2(%rbx),%ebx
0bae   53818e:	48 8d bd b4 01 00 00 	lea    0x1b4(%rbp),%rdi
0bb5   538195:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
0bba   53819a:	e8 00 00 00 00       	call   53819f <balance_leaf+0xbbf>	53819b: R_X86_64_PLT32	__asan_load4_noabort-0x4
0bbf   53819f:	44 8b b5 b4 01 00 00 	mov    0x1b4(%rbp),%r14d
0bc6   5381a6:	41 83 fc ff          	cmp    $0xffffffff,%r12d
0bca   5381aa:	0f 84 a0 00 00 00    	je     538250 <balance_leaf+0xc70>
0bd0   5381b0:	43 8d 2c 26          	lea    (%r14,%r12,1),%ebp
0bd4   5381b4:	39 dd                	cmp    %ebx,%ebp
0bd6   5381b6:	0f 8c 2a 4e 00 00    	jl     53cfe6 <balance_leaf+0x5a06>
0bdc   5381bc:	44 8d 7b 01          	lea    0x1(%rbx),%r15d
0be0   5381c0:	44 39 fd             	cmp    %r15d,%ebp
0be3   5381c3:	0f 8f 24 4e 00 00    	jg     53cfed <balance_leaf+0x5a0d>
0be9   5381c9:	39 dd                	cmp    %ebx,%ebp
0beb   5381cb:	0f 85 a9 01 00 00    	jne    53837a <balance_leaf+0xd9a>
0bf1   5381d1:	48 8b 1c 24          	mov    (%rsp),%rbx
0bf5   5381d5:	48 8d bb 20 02 00 00 	lea    0x220(%rbx),%rdi
0bfc   5381dc:	e8 00 00 00 00       	call   5381e1 <balance_leaf+0xc01>	5381dd: R_X86_64_PLT32	__asan_load4_noabort-0x4
0c01   5381e1:	44 8b b3 20 02 00 00 	mov    0x220(%rbx),%r14d
0c08   5381e8:	41 83 fe ff          	cmp    $0xffffffff,%r14d
0c0c   5381ec:	0f 85 3d 4f 00 00    	jne    53d12f <balance_leaf+0x5b4f>
0c12   5381f2:	48 8d bb 24 02 00 00 	lea    0x224(%rbx),%rdi
0c19   5381f9:	e8 00 00 00 00       	call   5381fe <balance_leaf+0xc1e>	5381fa: R_X86_64_PLT32	__asan_load4_noabort-0x4
0c1e   5381fe:	83 bb 24 02 00 00 ff 	cmpl   $0xffffffff,0x224(%rbx)
0c25   538205:	0f 85 2b 4f 00 00    	jne    53d136 <balance_leaf+0x5b56>
0c2b   53820b:	e8 00 00 00 00       	call   538210 <balance_leaf+0xc30>	53820c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c30   538210:	44 39 fd             	cmp    %r15d,%ebp
0c33   538213:	0f 84 6f 01 00 00    	je     538388 <balance_leaf+0xda8>
0c39   538219:	e8 00 00 00 00       	call   53821e <balance_leaf+0xc3e>	53821a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c3e   53821e:	e9 a1 01 00 00       	jmp    5383c4 <balance_leaf+0xde4>
0c43   538223:	48 8d bd b4 01 00 00 	lea    0x1b4(%rbp),%rdi
0c4a   53822a:	e8 00 00 00 00       	call   53822f <balance_leaf+0xc4f>	53822b: R_X86_64_PLT32	__asan_load4_noabort-0x4
0c4f   53822f:	8b 9d b4 01 00 00    	mov    0x1b4(%rbp),%ebx
0c55   538235:	83 fb ff             	cmp    $0xffffffff,%ebx
0c58   538238:	0f 84 db 01 00 00    	je     538419 <balance_leaf+0xe39>
0c5e   53823e:	85 db                	test   %ebx,%ebx
0c60   538240:	0f 85 d9 4f 00 00    	jne    53d21f <balance_leaf+0x5c3f>
0c66   538246:	e8 00 00 00 00       	call   53824b <balance_leaf+0xc6b>	538247: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c6b   53824b:	e9 e1 33 00 00       	jmp    53b631 <balance_leaf+0x4051>
0c70   538250:	45 85 f6             	test   %r14d,%r14d
0c73   538253:	0f 84 e0 01 00 00    	je     538439 <balance_leaf+0xe59>
0c79   538259:	41 83 fe ff          	cmp    $0xffffffff,%r14d
0c7d   53825d:	4c 8b 24 24          	mov    (%rsp),%r12
0c81   538261:	0f 85 9c 50 00 00    	jne    53d303 <balance_leaf+0x5d23>
0c87   538267:	48 89 dd             	mov    %rbx,%rbp
0c8a   53826a:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
0c8f   53826f:	48 89 df             	mov    %rbx,%rdi
0c92   538272:	e8 00 00 00 00       	call   538277 <balance_leaf+0xc97>	538273: R_X86_64_PLT32	__asan_load8_noabort-0x4
0c97   538277:	4c 8b 33             	mov    (%rbx),%r14
0c9a   53827a:	41 83 c7 ff          	add    $0xffffffff,%r15d
0c9e   53827e:	49 63 df             	movslq %r15d,%rbx
0ca1   538281:	48 c1 e3 04          	shl    $0x4,%rbx
0ca5   538285:	4a 8d 3c 2b          	lea    (%rbx,%r13,1),%rdi
0ca9   538289:	48 83 c7 08          	add    $0x8,%rdi
0cad   53828d:	e8 00 00 00 00       	call   538292 <balance_leaf+0xcb2>	53828e: R_X86_64_PLT32	__asan_load8_noabort-0x4
0cb2   538292:	4d 3b 74 1d 08       	cmp    0x8(%r13,%rbx,1),%r14
0cb7   538297:	0f 84 d5 04 00 00    	je     538772 <balance_leaf+0x1192>
0cbd   53829d:	e8 00 00 00 00       	call   5382a2 <balance_leaf+0xcc2>	53829e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0cc2   5382a2:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
0cc7   5382a7:	bf 01 00 00 00       	mov    $0x1,%edi
0ccc   5382ac:	4c 89 e6             	mov    %r12,%rsi
0ccf   5382af:	89 ea                	mov    %ebp,%edx
0cd1   5382b1:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
0cd6   5382b6:	45 31 c0             	xor    %r8d,%r8d
0cd9   5382b9:	e8 00 00 00 00       	call   5382be <balance_leaf+0xcde>	5382ba: R_X86_64_PLT32	leaf_move_items-0x4
0cde   5382be:	4d 8d 74 24 20       	lea    0x20(%r12),%r14
0ce3   5382c3:	4c 89 f7             	mov    %r14,%rdi
0ce6   5382c6:	e8 00 00 00 00       	call   5382cb <balance_leaf+0xceb>	5382c7: R_X86_64_PLT32	__asan_load8_noabort-0x4
0ceb   5382cb:	49 8b 6c 24 20       	mov    0x20(%r12),%rbp
0cf0   5382d0:	48 8d 7d 28          	lea    0x28(%rbp),%rdi
0cf4   5382d4:	e8 00 00 00 00       	call   5382d9 <balance_leaf+0xcf9>	5382d5: R_X86_64_PLT32	__asan_load8_noabort-0x4
0cf9   5382d9:	48 8b 6d 28          	mov    0x28(%rbp),%rbp
0cfd   5382dd:	48 8d 7d 02          	lea    0x2(%rbp),%rdi
0d01   5382e1:	e8 00 00 00 00       	call   5382e6 <balance_leaf+0xd06>	5382e2: R_X86_64_PLT32	__asan_load2_noabort-0x4
0d06   5382e6:	0f b7 55 02          	movzwl 0x2(%rbp),%edx
0d0a   5382ea:	bf 03 00 00 00       	mov    $0x3,%edi
0d0f   5382ef:	4c 89 e6             	mov    %r12,%rsi
0d12   5382f2:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
0d17   5382f7:	45 31 c0             	xor    %r8d,%r8d
0d1a   5382fa:	e8 00 00 00 00       	call   5382ff <balance_leaf+0xd1f>	5382fb: R_X86_64_PLT32	leaf_move_items-0x4
0d1f   5382ff:	49 8d bc 24 e8 00 00 00 	lea    0xe8(%r12),%rdi
0d27   538307:	e8 00 00 00 00       	call   53830c <balance_leaf+0xd2c>	538308: R_X86_64_PLT32	__asan_load8_noabort-0x4
0d2c   53830c:	48 8b 04 24          	mov    (%rsp),%rax
0d30   538310:	4c 8b a0 e8 00 00 00 	mov    0xe8(%rax),%r12
0d37   538317:	48 8b 04 24          	mov    (%rsp),%rax
0d3b   53831b:	48 8d b8 dc 01 00 00 	lea    0x1dc(%rax),%rdi
0d42   538322:	e8 00 00 00 00       	call   538327 <balance_leaf+0xd47>	538323: R_X86_64_PLT32	__asan_load4_noabort-0x4
0d47   538327:	48 8b 04 24          	mov    (%rsp),%rax
0d4b   53832b:	8b a8 dc 01 00 00    	mov    0x1dc(%rax),%ebp
0d51   538331:	48 8b 04 24          	mov    (%rsp),%rax
0d55   538335:	48 8d 78 48          	lea    0x48(%rax),%rdi
0d59   538339:	e8 00 00 00 00       	call   53833e <balance_leaf+0xd5e>	53833a: R_X86_64_PLT32	__asan_load8_noabort-0x4
0d5e   53833e:	48 8b 04 24          	mov    (%rsp),%rax
0d62   538342:	48 8b 48 48          	mov    0x48(%rax),%rcx
0d66   538346:	48 8b 3c 24          	mov    (%rsp),%rdi
0d6a   53834a:	4c 89 e6             	mov    %r12,%rsi
0d6d   53834d:	4c 8b 24 24          	mov    (%rsp),%r12
0d71   538351:	89 ea                	mov    %ebp,%edx
0d73   538353:	45 31 c0             	xor    %r8d,%r8d
0d76   538356:	e8 00 00 00 00       	call   53835b <balance_leaf+0xd7b>	538357: R_X86_64_PLT32	replace_key-0x4
0d7b   53835b:	4c 89 e7             	mov    %r12,%rdi
0d7e   53835e:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
0d83   538363:	e8 00 00 00 00       	call   538368 <balance_leaf+0xd88>	538364: R_X86_64_PLT32	reiserfs_invalidate_buffer-0x4
0d88   538368:	4c 89 f7             	mov    %r14,%rdi
0d8b   53836b:	e8 00 00 00 00       	call   538370 <balance_leaf+0xd90>	53836c: R_X86_64_PLT32	__asan_load8_noabort-0x4
0d90   538370:	49 8b 74 24 20       	mov    0x20(%r12),%rsi
0d95   538375:	e9 de 00 00 00       	jmp    538458 <balance_leaf+0xe78>
0d9a   53837a:	e8 00 00 00 00       	call   53837f <balance_leaf+0xd9f>	53837b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d9f   53837f:	44 39 fd             	cmp    %r15d,%ebp
0da2   538382:	0f 85 91 fe ff ff    	jne    538219 <balance_leaf+0xc39>
0da8   538388:	48 8b 1c 24          	mov    (%rsp),%rbx
0dac   53838c:	48 8d bb 20 02 00 00 	lea    0x220(%rbx),%rdi
0db3   538393:	e8 00 00 00 00       	call   538398 <balance_leaf+0xdb8>	538394: R_X86_64_PLT32	__asan_load4_noabort-0x4
0db8   538398:	8b ab 20 02 00 00    	mov    0x220(%rbx),%ebp
0dbe   53839e:	85 ed                	test   %ebp,%ebp
0dc0   5383a0:	0f 8e dc 4d 00 00    	jle    53d182 <balance_leaf+0x5ba2>
0dc6   5383a6:	48 8d bb 24 02 00 00 	lea    0x224(%rbx),%rdi
0dcd   5383ad:	e8 00 00 00 00       	call   5383b2 <balance_leaf+0xdd2>	5383ae: R_X86_64_PLT32	__asan_load4_noabort-0x4
0dd2   5383b2:	83 bb 24 02 00 00 ff 	cmpl   $0xffffffff,0x224(%rbx)
0dd9   5383b9:	0f 85 ca 4d 00 00    	jne    53d189 <balance_leaf+0x5ba9>
0ddf   5383bf:	e8 00 00 00 00       	call   5383c4 <balance_leaf+0xde4>	5383c0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0de4   5383c4:	48 8b 1c 24          	mov    (%rsp),%rbx
0de8   5383c8:	48 8d bb 20 02 00 00 	lea    0x220(%rbx),%rdi
0def   5383cf:	e8 00 00 00 00       	call   5383d4 <balance_leaf+0xdf4>	5383d0: R_X86_64_PLT32	__asan_load4_noabort-0x4
0df4   5383d4:	8b 93 20 02 00 00    	mov    0x220(%rbx),%edx
0dfa   5383da:	48 89 df             	mov    %rbx,%rdi
0dfd   5383dd:	44 89 e6             	mov    %r12d,%esi
0e00   5383e0:	49 89 dc             	mov    %rbx,%r12
0e03   5383e3:	e8 00 00 00 00       	call   5383e8 <balance_leaf+0xe08>	5383e4: R_X86_64_PLT32	leaf_shift_left-0x4
0e08   5383e8:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
0e0d   5383ed:	e8 00 00 00 00       	call   5383f2 <balance_leaf+0xe12>	5383ee: R_X86_64_PLT32	__asan_load4_noabort-0x4
0e12   5383f2:	8b 9b b4 01 00 00    	mov    0x1b4(%rbx),%ebx
0e18   5383f8:	49 8d bc 24 24 02 00 00 	lea    0x224(%r12),%rdi
0e20   538400:	e8 00 00 00 00       	call   538405 <balance_leaf+0xe25>	538401: R_X86_64_PLT32	__asan_load4_noabort-0x4
0e25   538405:	41 8b 94 24 24 02 00 00 	mov    0x224(%r12),%edx
0e2d   53840d:	4c 89 e7             	mov    %r12,%rdi
0e30   538410:	89 de                	mov    %ebx,%esi
0e32   538412:	e8 00 00 00 00       	call   538417 <balance_leaf+0xe37>	538413: R_X86_64_PLT32	leaf_shift_right-0x4
0e37   538417:	eb 38                	jmp    538451 <balance_leaf+0xe71>
0e39   538419:	e8 00 00 00 00       	call   53841e <balance_leaf+0xe3e>	53841a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e3e   53841e:	48 89 ef             	mov    %rbp,%rdi
0e41   538421:	44 89 f6             	mov    %r14d,%esi
0e44   538424:	ba ff ff ff ff       	mov    $0xffffffff,%edx
0e49   538429:	e8 00 00 00 00       	call   53842e <balance_leaf+0xe4e>	53842a: R_X86_64_PLT32	leaf_shift_right-0x4
0e4e   53842e:	48 89 ef             	mov    %rbp,%rdi
0e51   538431:	4c 89 fe             	mov    %r15,%rsi
0e54   538434:	e9 f1 31 00 00       	jmp    53b62a <balance_leaf+0x404a>
0e59   538439:	e8 00 00 00 00       	call   53843e <balance_leaf+0xe5e>	53843a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e5e   53843e:	4c 8b 24 24          	mov    (%rsp),%r12
0e62   538442:	4c 89 e7             	mov    %r12,%rdi
0e65   538445:	89 de                	mov    %ebx,%esi
0e67   538447:	ba ff ff ff ff       	mov    $0xffffffff,%edx
0e6c   53844c:	e8 00 00 00 00       	call   538451 <balance_leaf+0xe71>	53844d: R_X86_64_PLT32	leaf_shift_left-0x4
0e71   538451:	31 db                	xor    %ebx,%ebx
0e73   538453:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
0e78   538458:	4c 89 e7             	mov    %r12,%rdi
0e7b   53845b:	e8 00 00 00 00       	call   538460 <balance_leaf+0xe80>	53845c: R_X86_64_PLT32	reiserfs_invalidate_buffer-0x4
0e80   538460:	e9 cc 31 00 00       	jmp    53b631 <balance_leaf+0x4051>
0e85   538465:	e8 00 00 00 00       	call   53846a <balance_leaf+0xe8a>	538466: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e8a   53846a:	48 8b 2c 24          	mov    (%rsp),%rbp
0e8e   53846e:	48 8d bd 20 02 00 00 	lea    0x220(%rbp),%rdi
0e95   538475:	e8 00 00 00 00       	call   53847a <balance_leaf+0xe9a>	538476: R_X86_64_PLT32	__asan_load4_noabort-0x4
0e9a   53847a:	8b 95 20 02 00 00    	mov    0x220(%rbp),%edx
0ea0   538480:	48 89 ef             	mov    %rbp,%rdi
0ea3   538483:	44 89 ee             	mov    %r13d,%esi
0ea6   538486:	e8 00 00 00 00       	call   53848b <balance_leaf+0xeab>	538487: R_X86_64_PLT32	leaf_shift_left-0x4
0eab   53848b:	89 44 24 08          	mov    %eax,0x8(%rsp)
0eaf   53848f:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
0eb4   538494:	e8 00 00 00 00       	call   538499 <balance_leaf+0xeb9>	538495: R_X86_64_PLT32	__asan_store8_noabort-0x4
0eb9   538499:	48 89 6c 24 20       	mov    %rbp,0x20(%rsp)
0ebe   53849e:	4c 89 e7             	mov    %r12,%rdi
0ec1   5384a1:	e8 00 00 00 00       	call   5384a6 <balance_leaf+0xec6>	5384a2: R_X86_64_PLT32	__asan_load8_noabort-0x4
0ec6   5384a6:	48 8b 5d 20          	mov    0x20(%rbp),%rbx
0eca   5384aa:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
0ecf   5384af:	e8 00 00 00 00       	call   5384b4 <balance_leaf+0xed4>	5384b0: R_X86_64_PLT32	__asan_store8_noabort-0x4
0ed4   5384b4:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
0ed9   5384b9:	48 8d 7d 70          	lea    0x70(%rbp),%rdi
0edd   5384bd:	e8 00 00 00 00       	call   5384c2 <balance_leaf+0xee2>	5384be: R_X86_64_PLT32	__asan_load8_noabort-0x4
0ee2   5384c2:	4c 8b 65 70          	mov    0x70(%rbp),%r12
0ee6   5384c6:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
0eeb   5384cb:	e8 00 00 00 00       	call   5384d0 <balance_leaf+0xef0>	5384cc: R_X86_64_PLT32	__asan_store8_noabort-0x4
0ef0   5384d0:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
0ef5   5384d5:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
0efd   5384dd:	e8 00 00 00 00       	call   5384e2 <balance_leaf+0xf02>	5384de: R_X86_64_PLT32	__asan_load8_noabort-0x4
0f02   5384e2:	48 8b 6d 18          	mov    0x18(%rbp),%rbp
0f06   5384e6:	48 89 ef             	mov    %rbp,%rdi
0f09   5384e9:	e8 00 00 00 00       	call   5384ee <balance_leaf+0xf0e>	5384ea: R_X86_64_PLT32	__asan_load4_noabort-0x4
0f0e   5384ee:	8b 45 00             	mov    0x0(%rbp),%eax
0f11   5384f1:	83 c0 ff             	add    $0xffffffff,%eax
0f14   5384f4:	4c 63 f0             	movslq %eax,%r14
0f17   5384f7:	49 c1 e6 04          	shl    $0x4,%r14
0f1b   5384fb:	4d 8d 2c 2e          	lea    (%r14,%rbp,1),%r13
0f1f   5384ff:	49 83 c5 08          	add    $0x8,%r13
0f23   538503:	49 8d 3c 2e          	lea    (%r14,%rbp,1),%rdi
0f27   538507:	48 83 c7 10          	add    $0x10,%rdi
0f2b   53850b:	e8 00 00 00 00       	call   538510 <balance_leaf+0xf30>	53850c: R_X86_64_PLT32	__asan_load4_noabort-0x4
0f30   538510:	42 8b 5c 35 10       	mov    0x10(%rbp,%r14,1),%ebx
0f35   538515:	4c 89 ef             	mov    %r13,%rdi
0f38   538518:	e8 00 00 00 00       	call   53851d <balance_leaf+0xf3d>	538519: R_X86_64_PLT32	__asan_load8_noabort-0x4
0f3d   53851d:	4a 8b 6c 35 08       	mov    0x8(%rbp,%r14,1),%rbp
0f42   538522:	48 85 ed             	test   %rbp,%rbp
0f45   538525:	0f 84 20 4d 00 00    	je     53d24b <balance_leaf+0x5c6b>
0f4b   53852b:	4d 85 e4             	test   %r12,%r12
0f4e   53852e:	0f 84 17 4d 00 00    	je     53d24b <balance_leaf+0x5c6b>
0f54   538534:	85 db                	test   %ebx,%ebx
0f56   538536:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
0f5b   53853b:	48 8b 6c 24 48       	mov    0x48(%rsp),%rbp
0f60   538540:	4c 8b 6c 24 60       	mov    0x60(%rsp),%r13
0f65   538545:	74 0a                	je     538551 <balance_leaf+0xf71>
0f67   538547:	e8 00 00 00 00       	call   53854c <balance_leaf+0xf6c>	538548: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0f6c   53854c:	83 c3 ff             	add    $0xffffffff,%ebx
0f6f   53854f:	eb 21                	jmp    538572 <balance_leaf+0xf92>
0f71   538551:	e8 00 00 00 00       	call   538556 <balance_leaf+0xf76>	538552: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0f76   538556:	49 8d 7c 24 28       	lea    0x28(%r12),%rdi
0f7b   53855b:	e8 00 00 00 00       	call   538560 <balance_leaf+0xf80>	53855c: R_X86_64_PLT32	__asan_load8_noabort-0x4
0f80   538560:	49 8b 5c 24 28       	mov    0x28(%r12),%rbx
0f85   538565:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0f89   538569:	e8 00 00 00 00       	call   53856e <balance_leaf+0xf8e>	53856a: R_X86_64_PLT32	__asan_load2_noabort-0x4
0f8e   53856e:	0f b7 5b 02          	movzwl 0x2(%rbx),%ebx
0f92   538572:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
0f97   538577:	e8 00 00 00 00       	call   53857c <balance_leaf+0xf9c>	538578: R_X86_64_PLT32	__asan_store4_noabort-0x4
0f9c   53857c:	89 5c 24 38          	mov    %ebx,0x38(%rsp)
0fa0   538580:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
0fa5   538585:	48 89 df             	mov    %rbx,%rdi
0fa8   538588:	e8 00 00 00 00       	call   53858d <balance_leaf+0xfad>	538589: R_X86_64_PLT32	__asan_load4_noabort-0x4
0fad   53858d:	44 2b 7c 24 08       	sub    0x8(%rsp),%r15d
0fb2   538592:	44 03 3b             	add    (%rbx),%r15d
0fb5   538595:	4c 89 ef             	mov    %r13,%rdi
0fb8   538598:	e8 00 00 00 00       	call   53859d <balance_leaf+0xfbd>	538599: R_X86_64_PLT32	__asan_load4_noabort-0x4
0fbd   53859d:	45 8b 45 00          	mov    0x0(%r13),%r8d
0fc1   5385a1:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
0fc6   5385a6:	44 89 fe             	mov    %r15d,%esi
0fc9   5385a9:	48 8b 94 24 a0 00 00 00 	mov    0xa0(%rsp),%rdx
0fd1   5385b1:	48 89 e9             	mov    %rbp,%rcx
0fd4   5385b4:	e8 00 00 00 00       	call   5385b9 <balance_leaf+0xfd9>	5385b5: R_X86_64_PLT32	leaf_insert_into_buf-0x4
0fd9   5385b9:	4c 89 f7             	mov    %r14,%rdi
0fdc   5385bc:	e8 00 00 00 00       	call   5385c1 <balance_leaf+0xfe1>	5385bd: R_X86_64_PLT32	__asan_store4_noabort-0x4
0fe1   5385c1:	41 c7 06 00 00 00 00 	movl   $0x0,(%r14)
0fe8   5385c8:	e9 4e 0c 00 00       	jmp    53921b <balance_leaf+0x1c3b>
0fed   5385cd:	e8 00 00 00 00       	call   5385d2 <balance_leaf+0xff2>	5385ce: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ff2   5385d2:	4c 89 ff             	mov    %r15,%rdi
0ff5   5385d5:	e8 00 00 00 00       	call   5385da <balance_leaf+0xffa>	5385d6: R_X86_64_PLT32	__asan_load4_noabort-0x4
0ffa   5385da:	49 63 1f             	movslq (%r15),%rbx
0ffd   5385dd:	48 c1 e3 04          	shl    $0x4,%rbx
1001   5385e1:	49 8d 3c 1f          	lea    (%r15,%rbx,1),%rdi
1005   5385e5:	48 83 c7 08          	add    $0x8,%rdi
1009   5385e9:	e8 00 00 00 00       	call   5385ee <balance_leaf+0x100e>	5385ea: R_X86_64_PLT32	__asan_load8_noabort-0x4
100e   5385ee:	4d 8b 7c 1f 08       	mov    0x8(%r15,%rbx,1),%r15
1013   5385f3:	48 8b 1c 24          	mov    (%rsp),%rbx
1017   5385f7:	4c 8d 63 20          	lea    0x20(%rbx),%r12
101b   5385fb:	4c 89 e7             	mov    %r12,%rdi
101e   5385fe:	e8 00 00 00 00       	call   538603 <balance_leaf+0x1023>	5385ff: R_X86_64_PLT32	__asan_load8_noabort-0x4
1023   538603:	48 8b 5b 20          	mov    0x20(%rbx),%rbx
1027   538607:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
102b   53860b:	e8 00 00 00 00       	call   538610 <balance_leaf+0x1030>	53860c: R_X86_64_PLT32	__asan_load8_noabort-0x4
1030   538610:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
1034   538614:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1038   538618:	e8 00 00 00 00       	call   53861d <balance_leaf+0x103d>	538619: R_X86_64_PLT32	__asan_load2_noabort-0x4
103d   53861d:	0f b7 43 02          	movzwl 0x2(%rbx),%eax
1041   538621:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
1046   538626:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
104b   53862b:	e8 00 00 00 00       	call   538630 <balance_leaf+0x1050>	53862c: R_X86_64_PLT32	__asan_store8_noabort-0x4
1050   538630:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)
1059   538639:	45 85 f6             	test   %r14d,%r14d
105c   53863c:	74 0a                	je     538648 <balance_leaf+0x1068>
105e   53863e:	e8 00 00 00 00       	call   538643 <balance_leaf+0x1063>	53863f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1063   538643:	e9 70 08 00 00       	jmp    538eb8 <balance_leaf+0x18d8>
1068   538648:	4d 89 e6             	mov    %r12,%r14
106b   53864b:	49 8d 7f 28          	lea    0x28(%r15),%rdi
106f   53864f:	e8 00 00 00 00       	call   538654 <balance_leaf+0x1074>	538650: R_X86_64_PLT32	__asan_load8_noabort-0x4
1074   538654:	49 8b 5f 28          	mov    0x28(%r15),%rbx
1078   538658:	4c 8d 63 18          	lea    0x18(%rbx),%r12
107c   53865c:	48 8d 7b 20          	lea    0x20(%rbx),%rdi
1080   538660:	be 08 00 00 00       	mov    $0x8,%esi
1085   538665:	e8 00 00 00 00       	call   53866a <balance_leaf+0x108a>	538666: R_X86_64_PLT32	__asan_loadN_noabort-0x4
108a   53866a:	4c 8b 6b 20          	mov    0x20(%rbx),%r13
108e   53866e:	4c 89 e8             	mov    %r13,%rax
1091   538671:	48 c1 e8 3e          	shr    $0x3e,%rax
1095   538675:	0f 85 1a 01 00 00    	jne    538795 <balance_leaf+0x11b5>
109b   53867b:	4c 89 ed             	mov    %r13,%rbp
109e   53867e:	48 c1 ed 3c          	shr    $0x3c,%rbp
10a2   538682:	8d 45 fc             	lea    -0x4(%rbp),%eax
10a5   538685:	66 83 f8 fc          	cmp    $0xfffc,%ax
10a9   538689:	0f 86 06 01 00 00    	jbe    538795 <balance_leaf+0x11b5>
10af   53868f:	48 bb 00 00 00 00 00 00 00 40 	movabs $0x4000000000000000,%rbx
10b9   538699:	e8 00 00 00 00       	call   53869e <balance_leaf+0x10be>	53869a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
10be   53869e:	49 39 dd             	cmp    %rbx,%r13
10c1   5386a1:	bb 0f 00 00 00       	mov    $0xf,%ebx
10c6   5386a6:	48 0f 42 dd          	cmovb  %rbp,%rbx
10ca   5386aa:	48 8d 3c dd 00 00 00 00 	lea    0x0(,%rbx,8),%rdi	5386ae: R_X86_64_32S	item_ops
10d2   5386b2:	e8 00 00 00 00       	call   5386b7 <balance_leaf+0x10d7>	5386b3: R_X86_64_PLT32	__asan_load8_noabort-0x4
10d7   5386b7:	48 8b 1c dd 00 00 00 00 	mov    0x0(,%rbx,8),%rbx	5386bb: R_X86_64_32S	item_ops
10df   5386bf:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
10e3   5386c3:	e8 00 00 00 00       	call   5386c8 <balance_leaf+0x10e8>	5386c4: R_X86_64_PLT32	__asan_load8_noabort-0x4
10e8   5386c8:	48 8b 5b 10          	mov    0x10(%rbx),%rbx
10ec   5386cc:	49 8d 7f 20          	lea    0x20(%r15),%rdi
10f0   5386d0:	e8 00 00 00 00       	call   5386d5 <balance_leaf+0x10f5>	5386d1: R_X86_64_PLT32	__asan_load8_noabort-0x4
10f5   5386d5:	49 8b 77 20          	mov    0x20(%r15),%rsi
10f9   5386d9:	4c 89 e7             	mov    %r12,%rdi
10fc   5386dc:	ff d3                	call   *%rbx
10fe   5386de:	85 c0                	test   %eax,%eax
1100   5386e0:	0f 84 c0 03 00 00    	je     538aa6 <balance_leaf+0x14c6>
1106   5386e6:	4d 89 f4             	mov    %r14,%r12
1109   5386e9:	4c 89 f7             	mov    %r14,%rdi
110c   5386ec:	e8 00 00 00 00       	call   5386f1 <balance_leaf+0x1111>	5386ed: R_X86_64_PLT32	__asan_load8_noabort-0x4
1111   5386f1:	49 8b 1e             	mov    (%r14),%rbx
1114   5386f4:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
1119   5386f9:	48 8d 68 ff          	lea    -0x1(%rax),%rbp
111d   5386fd:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
1121   538701:	e8 00 00 00 00       	call   538706 <balance_leaf+0x1126>	538702: R_X86_64_PLT32	__asan_load8_noabort-0x4
1126   538706:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
112a   53870a:	4c 8d 73 18          	lea    0x18(%rbx),%r14
112e   53870e:	48 8d 6c 6d 00       	lea    0x0(%rbp,%rbp,2),%rbp
1133   538713:	48 8d 3c eb          	lea    (%rbx,%rbp,8),%rdi
1137   538717:	48 83 c7 2e          	add    $0x2e,%rdi
113b   53871b:	be 02 00 00 00       	mov    $0x2,%esi
1140   538720:	e8 00 00 00 00       	call   538725 <balance_leaf+0x1145>	538721: R_X86_64_PLT32	__asan_loadN_noabort-0x4
1145   538725:	66 83 7c eb 2e 00    	cmpw   $0x0,0x2e(%rbx,%rbp,8)
114b   53872b:	0f 84 27 04 00 00    	je     538b58 <balance_leaf+0x1578>
1151   538731:	49 8d 3c ee          	lea    (%r14,%rbp,8),%rdi
1155   538735:	48 83 c7 08          	add    $0x8,%rdi
1159   538739:	be 08 00 00 00       	mov    $0x8,%esi
115e   53873e:	e8 00 00 00 00       	call   538743 <balance_leaf+0x1163>	53873f: R_X86_64_PLT32	__asan_loadN_noabort-0x4
1163   538743:	49 8b 44 ee 08       	mov    0x8(%r14,%rbp,8),%rax
1168   538748:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
1172   538752:	48 21 c8             	and    %rcx,%rax
1175   538755:	48 b9 00 00 00 00 00 00 00 30 	movabs $0x3000000000000000,%rcx
117f   53875f:	48 39 c8             	cmp    %rcx,%rax
1182   538762:	0f 85 9e 06 00 00    	jne    538e06 <balance_leaf+0x1826>
1188   538768:	e8 00 00 00 00       	call   53876d <balance_leaf+0x118d>	538769: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
118d   53876d:	e9 0c 04 00 00       	jmp    538b7e <balance_leaf+0x159e>
1192   538772:	4a 8d 3c 2b          	lea    (%rbx,%r13,1),%rdi
1196   538776:	48 83 c7 10          	add    $0x10,%rdi
119a   53877a:	e8 00 00 00 00       	call   53877f <balance_leaf+0x119f>	53877b: R_X86_64_PLT32	__asan_load4_noabort-0x4
119f   53877f:	41 83 7c 1d 10 00    	cmpl   $0x0,0x10(%r13,%rbx,1)
11a5   538785:	0f 84 64 03 00 00    	je     538aef <balance_leaf+0x150f>
11ab   53878b:	e8 00 00 00 00       	call   538790 <balance_leaf+0x11b0>	53878c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
11b0   538790:	e9 80 06 00 00       	jmp    538e15 <balance_leaf+0x1835>
11b5   538795:	48 8d 7b 24          	lea    0x24(%rbx),%rdi
11b9   538799:	be 04 00 00 00       	mov    $0x4,%esi
11be   53879e:	e8 00 00 00 00       	call   5387a3 <balance_leaf+0x11c3>	53879f: R_X86_64_PLT32	__asan_loadN_noabort-0x4
11c3   5387a3:	8b 43 24             	mov    0x24(%rbx),%eax
11c6   5387a6:	85 c0                	test   %eax,%eax
11c8   5387a8:	0f 89 22 03 00 00    	jns    538ad0 <balance_leaf+0x14f0>
11ce   5387ae:	83 f8 fe             	cmp    $0xfffffffe,%eax
11d1   5387b1:	0f 84 36 3e 00 00    	je     53c5ed <balance_leaf+0x500d>
11d7   5387b7:	83 f8 ff             	cmp    $0xffffffff,%eax
11da   5387ba:	0f 85 1e 3e 00 00    	jne    53c5de <balance_leaf+0x4ffe>
11e0   5387c0:	e8 00 00 00 00       	call   5387c5 <balance_leaf+0x11e5>	5387c1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
11e5   5387c5:	bb 02 00 00 00       	mov    $0x2,%ebx
11ea   5387ca:	e9 db fe ff ff       	jmp    5386aa <balance_leaf+0x10ca>
11ef   5387cf:	48 8d 3c dd 0c 00 00 00 	lea    0xc(,%rbx,8),%rdi
11f7   5387d7:	48 01 ef             	add    %rbp,%rdi
11fa   5387da:	be 04 00 00 00       	mov    $0x4,%esi
11ff   5387df:	e8 00 00 00 00       	call   5387e4 <balance_leaf+0x1204>	5387e0: R_X86_64_PLT32	__asan_loadN_noabort-0x4
1204   5387e4:	81 7c dd 0c f4 01 00 00 	cmpl   $0x1f4,0xc(%rbp,%rbx,8)
120c   5387ec:	0f 85 99 03 00 00    	jne    538b8b <balance_leaf+0x15ab>
1212   5387f2:	e8 00 00 00 00       	call   5387f7 <balance_leaf+0x1217>	5387f3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1217   5387f7:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
121f   5387ff:	48 89 df             	mov    %rbx,%rdi
1222   538802:	e8 00 00 00 00       	call   538807 <balance_leaf+0x1227>	538803: R_X86_64_PLT32	__asan_load2_noabort-0x4
1227   538807:	44 0f b7 23          	movzwl (%rbx),%r12d
122b   53880b:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
1230   538810:	e8 00 00 00 00       	call   538815 <balance_leaf+0x1235>	538811: R_X86_64_PLT32	__asan_store8_noabort-0x4
1235   538815:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)
123e   53881e:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
1243   538823:	48 89 df             	mov    %rbx,%rdi
1246   538826:	e8 00 00 00 00       	call   53882b <balance_leaf+0x124b>	538827: R_X86_64_PLT32	__asan_load4_noabort-0x4
124b   53882b:	83 3b 00             	cmpl   $0x0,(%rbx)
124e   53882e:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
1253   538833:	0f 85 64 4c 00 00    	jne    53d49d <balance_leaf+0x5ebd>
1259   538839:	48 89 df             	mov    %rbx,%rdi
125c   53883c:	e8 00 00 00 00       	call   538841 <balance_leaf+0x1261>	53883d: R_X86_64_PLT32	__asan_load4_noabort-0x4
1261   538841:	8b 2b                	mov    (%rbx),%ebp
1263   538843:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
1268   538848:	39 eb                	cmp    %ebp,%ebx
126a   53884a:	0f 8e 63 02 00 00    	jle    538ab3 <balance_leaf+0x14d3>
1270   538850:	83 c3 ff             	add    $0xffffffff,%ebx
1273   538853:	48 8b 3c 24          	mov    (%rsp),%rdi
1277   538857:	44 89 ee             	mov    %r13d,%esi
127a   53885a:	89 da                	mov    %ebx,%edx
127c   53885c:	e8 00 00 00 00       	call   538861 <balance_leaf+0x1281>	53885d: R_X86_64_PLT32	leaf_shift_left-0x4
1281   538861:	89 44 24 10          	mov    %eax,0x10(%rsp)
1285   538865:	85 c0                	test   %eax,%eax
1287   538867:	0f 84 5c 38 00 00    	je     53c0c9 <balance_leaf+0x4ae9>
128d   53886d:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
1292   538872:	48 89 df             	mov    %rbx,%rdi
1295   538875:	e8 00 00 00 00       	call   53887a <balance_leaf+0x129a>	538876: R_X86_64_PLT32	__asan_load4_noabort-0x4
129a   53887a:	83 3b 00             	cmpl   $0x0,(%rbx)
129d   53887d:	0f 84 92 3d 00 00    	je     53c615 <balance_leaf+0x5035>
12a3   538883:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
12a8   538888:	e8 00 00 00 00       	call   53888d <balance_leaf+0x12ad>	538889: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
12ad   53888d:	e9 e8 3d 00 00       	jmp    53c67a <balance_leaf+0x509a>
12b2   538892:	e8 00 00 00 00       	call   538897 <balance_leaf+0x12b7>	538893: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
12b7   538897:	49 8d 7e 28          	lea    0x28(%r14),%rdi
12bb   53889b:	e8 00 00 00 00       	call   5388a0 <balance_leaf+0x12c0>	53889c: R_X86_64_PLT32	__asan_load8_noabort-0x4
12c0   5388a0:	49 8b 5e 28          	mov    0x28(%r14),%rbx
12c4   5388a4:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
12c8   5388a8:	e8 00 00 00 00       	call   5388ad <balance_leaf+0x12cd>	5388a9: R_X86_64_PLT32	__asan_load2_noabort-0x4
12cd   5388ad:	44 0f b7 6b 02       	movzwl 0x2(%rbx),%r13d
12d2   5388b2:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
12d7   5388b7:	e8 00 00 00 00       	call   5388bc <balance_leaf+0x12dc>	5388b8: R_X86_64_PLT32	__asan_store4_noabort-0x4
12dc   5388bc:	44 89 6c 24 38       	mov    %r13d,0x38(%rsp)
12e1   5388c1:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
12e6   5388c6:	48 89 df             	mov    %rbx,%rdi
12e9   5388c9:	e8 00 00 00 00       	call   5388ce <balance_leaf+0x12ee>	5388ca: R_X86_64_PLT32	__asan_load4_noabort-0x4
12ee   5388ce:	44 2b bc 24 80 00 00 00 	sub    0x80(%rsp),%r15d
12f6   5388d6:	44 03 3b             	add    (%rbx),%r15d
12f9   5388d9:	4c 8b 6c 24 60       	mov    0x60(%rsp),%r13
12fe   5388de:	4c 89 ef             	mov    %r13,%rdi
1301   5388e1:	e8 00 00 00 00       	call   5388e6 <balance_leaf+0x1306>	5388e2: R_X86_64_PLT32	__asan_load4_noabort-0x4
1306   5388e6:	41 8b 45 00          	mov    0x0(%r13),%eax
130a   5388ea:	44 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%r8d
1312   5388f2:	44 39 c0             	cmp    %r8d,%eax
1315   5388f5:	44 0f 4c c0          	cmovl  %eax,%r8d
1319   5388f9:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
131e   5388fe:	44 89 fe             	mov    %r15d,%esi
1321   538901:	48 8b 9c 24 a0 00 00 00 	mov    0xa0(%rsp),%rbx
1329   538909:	48 89 da             	mov    %rbx,%rdx
132c   53890c:	48 8b 6c 24 48       	mov    0x48(%rsp),%rbp
1331   538911:	48 89 e9             	mov    %rbp,%rcx
1334   538914:	e8 00 00 00 00       	call   538919 <balance_leaf+0x1339>	538915: R_X86_64_PLT32	leaf_insert_into_buf-0x4
1339   538919:	48 8d 7b 16          	lea    0x16(%rbx),%rdi
133d   53891d:	be 02 00 00 00       	mov    $0x2,%esi
1342   538922:	e8 00 00 00 00       	call   538927 <balance_leaf+0x1347>	538923: R_X86_64_PLT32	__asan_loadN_noabort-0x4
1347   538927:	66 83 7b 16 00       	cmpw   $0x0,0x16(%rbx)
134c   53892c:	0f 84 81 00 00 00    	je     5389b3 <balance_leaf+0x13d3>
1352   538932:	49 be 00 00 00 00 00 00 00 10 	movabs $0x1000000000000000,%r14
135c   53893c:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
1360   538940:	be 08 00 00 00       	mov    $0x8,%esi
1365   538945:	48 89 bc 24 80 00 00 00 	mov    %rdi,0x80(%rsp)
136d   53894d:	e8 00 00 00 00       	call   538952 <balance_leaf+0x1372>	53894e: R_X86_64_PLT32	__asan_loadN_noabort-0x4
1372   538952:	4c 8b 6b 08          	mov    0x8(%rbx),%r13
1376   538956:	4c 89 eb             	mov    %r13,%rbx
1379   538959:	48 b8 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rax
1383   538963:	48 21 c3             	and    %rax,%rbx
1386   538966:	4c 39 f3             	cmp    %r14,%rbx
1389   538969:	0f 85 eb 00 00 00    	jne    538a5a <balance_leaf+0x147a>
138f   53896f:	e8 00 00 00 00       	call   538974 <balance_leaf+0x1394>	538970: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1394   538974:	4c 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%r15
139c   53897c:	4c 89 ff             	mov    %r15,%rdi
139f   53897f:	e8 00 00 00 00       	call   538984 <balance_leaf+0x13a4>	538980: R_X86_64_PLT32	__asan_load8_noabort-0x4
13a4   538984:	4d 8b 3f             	mov    (%r15),%r15
13a7   538987:	49 8d 7f 14          	lea    0x14(%r15),%rdi
13ab   53898b:	e8 00 00 00 00       	call   538990 <balance_leaf+0x13b0>	53898c: R_X86_64_PLT32	__asan_load1_noabort-0x4
13b0   538990:	45 8a 7f 14          	mov    0x14(%r15),%r15b
13b4   538994:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
13b9   538999:	4c 89 e7             	mov    %r12,%rdi
13bc   53899c:	e8 00 00 00 00       	call   5389a1 <balance_leaf+0x13c1>	53899d: R_X86_64_PLT32	__asan_load4_noabort-0x4
13c1   5389a1:	41 8b 04 24          	mov    (%r12),%eax
13c5   5389a5:	41 80 c7 fe          	add    $0xfe,%r15b
13c9   5389a9:	44 89 f9             	mov    %r15d,%ecx
13cc   5389ac:	d3 e0                	shl    %cl,%eax
13ce   5389ae:	e9 bd 00 00 00       	jmp    538a70 <balance_leaf+0x1490>
13d3   5389b3:	4c 8d 73 08          	lea    0x8(%rbx),%r14
13d7   5389b7:	48 8d 7b 0c          	lea    0xc(%rbx),%rdi
13db   5389bb:	be 04 00 00 00       	mov    $0x4,%esi
13e0   5389c0:	e8 00 00 00 00       	call   5389c5 <balance_leaf+0x13e5>	5389c1: R_X86_64_PLT32	__asan_loadN_noabort-0x4
13e5   5389c5:	83 7b 0c fe          	cmpl   $0xfffffffe,0xc(%rbx)
13e9   5389c9:	0f 85 a8 03 00 00    	jne    538d77 <balance_leaf+0x1797>
13ef   5389cf:	e8 00 00 00 00       	call   5389d4 <balance_leaf+0x13f4>	5389d0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
13f4   5389d4:	48 8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%rbx
13fc   5389dc:	48 89 df             	mov    %rbx,%rdi
13ff   5389df:	e8 00 00 00 00       	call   5389e4 <balance_leaf+0x1404>	5389e0: R_X86_64_PLT32	__asan_load8_noabort-0x4
1404   5389e4:	48 8b 1b             	mov    (%rbx),%rbx
1407   5389e7:	48 8d 7b 14          	lea    0x14(%rbx),%rdi
140b   5389eb:	e8 00 00 00 00       	call   5389f0 <balance_leaf+0x1410>	5389ec: R_X86_64_PLT32	__asan_load1_noabort-0x4
1410   5389f0:	44 8a 7b 14          	mov    0x14(%rbx),%r15b
1414   5389f4:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
1419   5389f9:	48 89 df             	mov    %rbx,%rdi
141c   5389fc:	e8 00 00 00 00       	call   538a01 <balance_leaf+0x1421>	5389fd: R_X86_64_PLT32	__asan_load4_noabort-0x4
1421   538a01:	8b 1b                	mov    (%rbx),%ebx
1423   538a03:	41 80 c7 fe          	add    $0xfe,%r15b
1427   538a07:	44 89 f9             	mov    %r15d,%ecx
142a   538a0a:	d3 e3                	shl    %cl,%ebx
142c   538a0c:	e9 7a 03 00 00       	jmp    538d8b <balance_leaf+0x17ab>
1431   538a11:	e8 00 00 00 00       	call   538a16 <balance_leaf+0x1436>	538a12: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1436   538a16:	48 8d bd c8 01 00 00 	lea    0x1c8(%rbp),%rdi
143d   538a1d:	e8 00 00 00 00       	call   538a22 <balance_leaf+0x1442>	538a1e: R_X86_64_PLT32	__asan_load4_noabort-0x4
1442   538a22:	48 8b 04 24          	mov    (%rsp),%rax
1446   538a26:	8b a8 c8 01 00 00    	mov    0x1c8(%rax),%ebp
144c   538a2c:	4a 8d 3c 2b          	lea    (%rbx,%r13,1),%rdi
1450   538a30:	48 83 c7 08          	add    $0x8,%rdi
1454   538a34:	e8 00 00 00 00       	call   538a39 <balance_leaf+0x1459>	538a35: R_X86_64_PLT32	__asan_load8_noabort-0x4
1459   538a39:	49 8b 4c 1d 08       	mov    0x8(%r13,%rbx,1),%rcx
145e   538a3e:	48 8b 3c 24          	mov    (%rsp),%rdi
1462   538a42:	4c 89 e6             	mov    %r12,%rsi
1465   538a45:	89 ea                	mov    %ebp,%edx
1467   538a47:	48 8b 2c 24          	mov    (%rsp),%rbp
146b   538a4b:	e9 7a f2 ff ff       	jmp    537cca <balance_leaf+0x6ea>
1470   538a50:	e8 00 00 00 00       	call   538a55 <balance_leaf+0x1475>	538a51: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1475   538a55:	e9 36 01 00 00       	jmp    538b90 <balance_leaf+0x15b0>
147a   538a5a:	e8 00 00 00 00       	call   538a5f <balance_leaf+0x147f>	538a5b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
147f   538a5f:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
1484   538a64:	4c 89 e7             	mov    %r12,%rdi
1487   538a67:	e8 00 00 00 00       	call   538a6c <balance_leaf+0x148c>	538a68: R_X86_64_PLT32	__asan_load4_noabort-0x4
148c   538a6c:	41 8b 04 24          	mov    (%r12),%eax
1490   538a70:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
1495   538a75:	48 98                	cltq
1497   538a77:	49 01 c5             	add    %rax,%r13
149a   538a7a:	49 83 c6 ff          	add    $0xffffffffffffffff,%r14
149e   538a7e:	4d 21 ee             	and    %r13,%r14
14a1   538a81:	49 09 de             	or     %rbx,%r14
14a4   538a84:	be 08 00 00 00       	mov    $0x8,%esi
14a9   538a89:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
14b1   538a91:	48 89 df             	mov    %rbx,%rdi
14b4   538a94:	e8 00 00 00 00       	call   538a99 <balance_leaf+0x14b9>	538a95: R_X86_64_PLT32	__asan_storeN_noabort-0x4
14b9   538a99:	4c 89 33             	mov    %r14,(%rbx)
14bc   538a9c:	4c 8b 6c 24 60       	mov    0x60(%rsp),%r13
14c1   538aa1:	e9 ff 02 00 00       	jmp    538da5 <balance_leaf+0x17c5>
14c6   538aa6:	e8 00 00 00 00       	call   538aab <balance_leaf+0x14cb>	538aa7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
14cb   538aab:	4d 89 f4             	mov    %r14,%r12
14ce   538aae:	e9 05 04 00 00       	jmp    538eb8 <balance_leaf+0x18d8>
14d3   538ab3:	e8 00 00 00 00       	call   538ab8 <balance_leaf+0x14d8>	538ab4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
14d8   538ab8:	48 8b 3c 24          	mov    (%rsp),%rdi
14dc   538abc:	44 89 ee             	mov    %r13d,%esi
14df   538abf:	89 da                	mov    %ebx,%edx
14e1   538ac1:	e8 00 00 00 00       	call   538ac6 <balance_leaf+0x14e6>	538ac2: R_X86_64_PLT32	leaf_shift_left-0x4
14e6   538ac6:	48 8b 6c 24 48       	mov    0x48(%rsp),%rbp
14eb   538acb:	e9 41 3d 00 00       	jmp    53c811 <balance_leaf+0x5231>
14f0   538ad0:	3d f4 01 00 00       	cmp    $0x1f4,%eax
14f5   538ad5:	0f 84 21 3b 00 00    	je     53c5fc <balance_leaf+0x501c>
14fb   538adb:	85 c0                	test   %eax,%eax
14fd   538add:	0f 85 fb 3a 00 00    	jne    53c5de <balance_leaf+0x4ffe>
1503   538ae3:	e8 00 00 00 00       	call   538ae8 <balance_leaf+0x1508>	538ae4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1508   538ae8:	31 db                	xor    %ebx,%ebx
150a   538aea:	e9 bb fb ff ff       	jmp    5386aa <balance_leaf+0x10ca>
150f   538aef:	49 8d 7e 28          	lea    0x28(%r14),%rdi
1513   538af3:	e8 00 00 00 00       	call   538af8 <balance_leaf+0x1518>	538af4: R_X86_64_PLT32	__asan_load8_noabort-0x4
1518   538af8:	49 8b 5e 28          	mov    0x28(%r14),%rbx
151c   538afc:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1520   538b00:	e8 00 00 00 00       	call   538b05 <balance_leaf+0x1525>	538b01: R_X86_64_PLT32	__asan_load2_noabort-0x4
1525   538b05:	66 83 7b 02 01       	cmpw   $0x1,0x2(%rbx)
152a   538b0a:	0f 86 00 03 00 00    	jbe    538e10 <balance_leaf+0x1830>
1530   538b10:	e8 00 00 00 00       	call   538b15 <balance_leaf+0x1535>	538b11: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1535   538b15:	49 8d bc 24 c0 00 00 00 	lea    0xc0(%r12),%rdi
153d   538b1d:	e8 00 00 00 00       	call   538b22 <balance_leaf+0x1542>	538b1e: R_X86_64_PLT32	__asan_load8_noabort-0x4
1542   538b22:	49 8b 9c 24 c0 00 00 00 	mov    0xc0(%r12),%rbx
154a   538b2a:	49 8d bc 24 c8 01 00 00 	lea    0x1c8(%r12),%rdi
1552   538b32:	e8 00 00 00 00       	call   538b37 <balance_leaf+0x1557>	538b33: R_X86_64_PLT32	__asan_load4_noabort-0x4
1557   538b37:	41 8b 94 24 c8 01 00 00 	mov    0x1c8(%r12),%edx
155f   538b3f:	4c 89 e7             	mov    %r12,%rdi
1562   538b42:	48 89 de             	mov    %rbx,%rsi
1565   538b45:	4c 89 f1             	mov    %r14,%rcx
1568   538b48:	41 b8 01 00 00 00    	mov    $0x1,%r8d
156e   538b4e:	e8 00 00 00 00       	call   538b53 <balance_leaf+0x1573>	538b4f: R_X86_64_PLT32	replace_key-0x4
1573   538b53:	e9 bd 02 00 00       	jmp    538e15 <balance_leaf+0x1835>
1578   538b58:	49 8d 3c ee          	lea    (%r14,%rbp,8),%rdi
157c   538b5c:	48 83 c7 0c          	add    $0xc,%rdi
1580   538b60:	be 04 00 00 00       	mov    $0x4,%esi
1585   538b65:	e8 00 00 00 00       	call   538b6a <balance_leaf+0x158a>	538b66: R_X86_64_PLT32	__asan_loadN_noabort-0x4
158a   538b6a:	41 81 7c ee 0c f4 01 00 00 	cmpl   $0x1f4,0xc(%r14,%rbp,8)
1593   538b73:	0f 85 12 03 00 00    	jne    538e8b <balance_leaf+0x18ab>
1599   538b79:	e8 00 00 00 00       	call   538b7e <balance_leaf+0x159e>	538b7a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
159e   538b7e:	49 8d 1c ee          	lea    (%r14,%rbp,8),%rbx
15a2   538b82:	48 83 c3 10          	add    $0x10,%rbx
15a6   538b86:	e9 0d 03 00 00       	jmp    538e98 <balance_leaf+0x18b8>
15ab   538b8b:	e8 00 00 00 00       	call   538b90 <balance_leaf+0x15b0>	538b8c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
15b0   538b90:	44 89 a4 24 80 00 00 00 	mov    %r12d,0x80(%rsp)
15b8   538b98:	48 89 6c 24 68       	mov    %rbp,0x68(%rsp)
15bd   538b9d:	83 7c 24 10 00       	cmpl   $0x0,0x10(%rsp)
15c2   538ba2:	0f 8e 28 49 00 00    	jle    53d4d0 <balance_leaf+0x5ef0>
15c8   538ba8:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
15cd   538bad:	48 89 ef             	mov    %rbp,%rdi
15d0   538bb0:	e8 00 00 00 00       	call   538bb5 <balance_leaf+0x15d5>	538bb1: R_X86_64_PLT32	__asan_load4_noabort-0x4
15d5   538bb5:	44 8b 65 00          	mov    0x0(%rbp),%r12d
15d9   538bb9:	4c 8b 7c 24 68       	mov    0x68(%rsp),%r15
15de   538bbe:	4d 8d 34 df          	lea    (%r15,%rbx,8),%r14
15e2   538bc2:	49 83 c6 12          	add    $0x12,%r14
15e6   538bc6:	be 02 00 00 00       	mov    $0x2,%esi
15eb   538bcb:	4c 89 f7             	mov    %r14,%rdi
15ee   538bce:	e8 00 00 00 00       	call   538bd3 <balance_leaf+0x15f3>	538bcf: R_X86_64_PLT32	__asan_loadN_noabort-0x4
15f3   538bd3:	41 0f b7 5c df 12    	movzwl 0x12(%r15,%rbx,8),%ebx
15f9   538bd9:	41 39 dc             	cmp    %ebx,%r12d
15fc   538bdc:	0f 85 25 49 00 00    	jne    53d507 <balance_leaf+0x5f27>
1602   538be2:	44 89 e3             	mov    %r12d,%ebx
1605   538be5:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
160a   538bea:	29 eb                	sub    %ebp,%ebx
160c   538bec:	7e 2b                	jle    538c19 <balance_leaf+0x1639>
160e   538bee:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
1613   538bf3:	4c 89 f7             	mov    %r14,%rdi
1616   538bf6:	e8 00 00 00 00       	call   538bfb <balance_leaf+0x161b>	538bf7: R_X86_64_PLT32	__asan_store4_noabort-0x4
161b   538bfb:	41 89 1e             	mov    %ebx,(%r14)
161e   538bfe:	85 db                	test   %ebx,%ebx
1620   538c00:	0f 8e 3d 4a 00 00    	jle    53d643 <balance_leaf+0x6063>
1626   538c06:	e8 00 00 00 00       	call   538c0b <balance_leaf+0x162b>	538c07: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
162b   538c0b:	48 8b 3c 24          	mov    (%rsp),%rdi
162f   538c0f:	44 89 ee             	mov    %r13d,%esi
1632   538c12:	89 ea                	mov    %ebp,%edx
1634   538c14:	e9 bb f2 ff ff       	jmp    537ed4 <balance_leaf+0x8f4>
1639   538c19:	44 29 e5             	sub    %r12d,%ebp
163c   538c1c:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
1641   538c21:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
1646   538c26:	41 29 ef             	sub    %ebp,%r15d
1649   538c29:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
164e   538c2e:	48 89 df             	mov    %rbx,%rdi
1651   538c31:	e8 00 00 00 00       	call   538c36 <balance_leaf+0x1656>	538c32: R_X86_64_PLT32	__asan_store4_noabort-0x4
1656   538c36:	44 89 3b             	mov    %r15d,(%rbx)
1659   538c39:	45 85 ff             	test   %r15d,%r15d
165c   538c3c:	0f 8e 35 4a 00 00    	jle    53d677 <balance_leaf+0x6097>
1662   538c42:	be 02 00 00 00       	mov    $0x2,%esi
1667   538c47:	4c 89 f7             	mov    %r14,%rdi
166a   538c4a:	e8 00 00 00 00       	call   538c4f <balance_leaf+0x166f>	538c4b: R_X86_64_PLT32	__asan_loadN_noabort-0x4
166f   538c4f:	41 0f b7 16          	movzwl (%r14),%edx
1673   538c53:	48 8b 1c 24          	mov    (%rsp),%rbx
1677   538c57:	48 89 df             	mov    %rbx,%rdi
167a   538c5a:	44 89 ee             	mov    %r13d,%esi
167d   538c5d:	e8 00 00 00 00       	call   538c62 <balance_leaf+0x1682>	538c5e: R_X86_64_PLT32	leaf_shift_left-0x4
1682   538c62:	41 89 c6             	mov    %eax,%r14d
1685   538c65:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
168a   538c6a:	e8 00 00 00 00       	call   538c6f <balance_leaf+0x168f>	538c6b: R_X86_64_PLT32	__asan_load8_noabort-0x4
168f   538c6f:	48 8b 6b 20          	mov    0x20(%rbx),%rbp
1693   538c73:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
1698   538c78:	e8 00 00 00 00       	call   538c7d <balance_leaf+0x169d>	538c79: R_X86_64_PLT32	__asan_load4_noabort-0x4
169d   538c7d:	8b 84 24 80 00 00 00 	mov    0x80(%rsp),%eax
16a4   538c84:	44 29 f0             	sub    %r14d,%eax
16a7   538c87:	44 8b b3 28 02 00 00 	mov    0x228(%rbx),%r14d
16ae   538c8e:	89 84 24 80 00 00 00 	mov    %eax,0x80(%rsp)
16b5   538c95:	41 01 c6             	add    %eax,%r14d
16b8   538c98:	48 8d 7d 28          	lea    0x28(%rbp),%rdi
16bc   538c9c:	e8 00 00 00 00       	call   538ca1 <balance_leaf+0x16c1>	538c9d: R_X86_64_PLT32	__asan_load8_noabort-0x4
16c1   538ca1:	48 8b 45 28          	mov    0x28(%rbp),%rax
16c5   538ca5:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
16ca   538caa:	48 8d bc 24 b0 00 00 00 	lea    0xb0(%rsp),%rdi
16d2   538cb2:	e8 00 00 00 00       	call   538cb7 <balance_leaf+0x16d7>	538cb3: R_X86_64_PLT32	__asan_store8_noabort-0x4
16d7   538cb7:	48 89 9c 24 b0 00 00 00 	mov    %rbx,0xb0(%rsp)
16df   538cbf:	48 8d bc 24 b8 00 00 00 	lea    0xb8(%rsp),%rdi
16e7   538cc7:	e8 00 00 00 00       	call   538ccc <balance_leaf+0x16ec>	538cc8: R_X86_64_PLT32	__asan_store8_noabort-0x4
16ec   538ccc:	48 89 ac 24 b8 00 00 00 	mov    %rbp,0xb8(%rsp)
16f4   538cd4:	48 8d 7b 70          	lea    0x70(%rbx),%rdi
16f8   538cd8:	e8 00 00 00 00       	call   538cdd <balance_leaf+0x16fd>	538cd9: R_X86_64_PLT32	__asan_load8_noabort-0x4
16fd   538cdd:	4c 8b 7b 70          	mov    0x70(%rbx),%r15
1701   538ce1:	48 8d bc 24 c0 00 00 00 	lea    0xc0(%rsp),%rdi
1709   538ce9:	e8 00 00 00 00       	call   538cee <balance_leaf+0x170e>	538cea: R_X86_64_PLT32	__asan_store8_noabort-0x4
170e   538cee:	4c 89 bc 24 c0 00 00 00 	mov    %r15,0xc0(%rsp)
1716   538cf6:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
171e   538cfe:	e8 00 00 00 00       	call   538d03 <balance_leaf+0x1723>	538cff: R_X86_64_PLT32	__asan_load8_noabort-0x4
1723   538d03:	48 8b 5b 18          	mov    0x18(%rbx),%rbx
1727   538d07:	48 89 df             	mov    %rbx,%rdi
172a   538d0a:	e8 00 00 00 00       	call   538d0f <balance_leaf+0x172f>	538d0b: R_X86_64_PLT32	__asan_load4_noabort-0x4
172f   538d0f:	8b 03                	mov    (%rbx),%eax
1731   538d11:	83 c0 ff             	add    $0xffffffff,%eax
1734   538d14:	4c 63 e0             	movslq %eax,%r12
1737   538d17:	49 c1 e4 04          	shl    $0x4,%r12
173b   538d1b:	4a 8d 2c 23          	lea    (%rbx,%r12,1),%rbp
173f   538d1f:	48 83 c5 08          	add    $0x8,%rbp
1743   538d23:	4a 8d 3c 23          	lea    (%rbx,%r12,1),%rdi
1747   538d27:	48 83 c7 10          	add    $0x10,%rdi
174b   538d2b:	e8 00 00 00 00       	call   538d30 <balance_leaf+0x1750>	538d2c: R_X86_64_PLT32	__asan_load4_noabort-0x4
1750   538d30:	46 8b 6c 23 10       	mov    0x10(%rbx,%r12,1),%r13d
1755   538d35:	48 89 ef             	mov    %rbp,%rdi
1758   538d38:	e8 00 00 00 00       	call   538d3d <balance_leaf+0x175d>	538d39: R_X86_64_PLT32	__asan_load8_noabort-0x4
175d   538d3d:	4a 8b 6c 23 08       	mov    0x8(%rbx,%r12,1),%rbp
1762   538d42:	48 85 ed             	test   %rbp,%rbp
1765   538d45:	0f 84 61 49 00 00    	je     53d6ac <balance_leaf+0x60cc>
176b   538d4b:	4d 85 ff             	test   %r15,%r15
176e   538d4e:	0f 84 58 49 00 00    	je     53d6ac <balance_leaf+0x60cc>
1774   538d54:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
1779   538d59:	48 83 c5 18          	add    $0x18,%rbp
177d   538d5d:	4d 63 f6             	movslq %r14d,%r14
1780   538d60:	45 85 ed             	test   %r13d,%r13d
1783   538d63:	0f 84 44 36 00 00    	je     53c3ad <balance_leaf+0x4dcd>
1789   538d69:	e8 00 00 00 00       	call   538d6e <balance_leaf+0x178e>	538d6a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
178e   538d6e:	41 83 c5 ff          	add    $0xffffffff,%r13d
1792   538d72:	e9 56 36 00 00       	jmp    53c3cd <balance_leaf+0x4ded>
1797   538d77:	e8 00 00 00 00       	call   538d7c <balance_leaf+0x179c>	538d78: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
179c   538d7c:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
17a1   538d81:	48 89 df             	mov    %rbx,%rdi
17a4   538d84:	e8 00 00 00 00       	call   538d89 <balance_leaf+0x17a9>	538d85: R_X86_64_PLT32	__asan_load4_noabort-0x4
17a9   538d89:	8b 1b                	mov    (%rbx),%ebx
17ab   538d8b:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
17b0   538d90:	be 04 00 00 00       	mov    $0x4,%esi
17b5   538d95:	4c 89 f7             	mov    %r14,%rdi
17b8   538d98:	e8 00 00 00 00       	call   538d9d <balance_leaf+0x17bd>	538d99: R_X86_64_PLT32	__asan_loadN_noabort-0x4
17bd   538d9d:	41 01 1e             	add    %ebx,(%r14)
17c0   538da0:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
17c5   538da5:	8b 5c 24 50          	mov    0x50(%rsp),%ebx
17c9   538da9:	2b 5c 24 68          	sub    0x68(%rsp),%ebx
17cd   538dad:	be 02 00 00 00       	mov    $0x2,%esi
17d2   538db2:	4c 89 ff             	mov    %r15,%rdi
17d5   538db5:	e8 00 00 00 00       	call   538dba <balance_leaf+0x17da>	538db6: R_X86_64_PLT32	__asan_storeN_noabort-0x4
17da   538dba:	66 41 89 1f          	mov    %bx,(%r15)
17de   538dbe:	4c 89 e7             	mov    %r12,%rdi
17e1   538dc1:	e8 00 00 00 00       	call   538dc6 <balance_leaf+0x17e6>	538dc2: R_X86_64_PLT32	__asan_load4_noabort-0x4
17e6   538dc6:	45 8b 34 24          	mov    (%r12),%r14d
17ea   538dca:	4c 89 ef             	mov    %r13,%rdi
17ed   538dcd:	e8 00 00 00 00       	call   538dd2 <balance_leaf+0x17f2>	538dce: R_X86_64_PLT32	__asan_load4_noabort-0x4
17f2   538dd2:	41 8b 45 00          	mov    0x0(%r13),%eax
17f6   538dd6:	31 c9                	xor    %ecx,%ecx
17f8   538dd8:	44 89 f2             	mov    %r14d,%edx
17fb   538ddb:	29 c2                	sub    %eax,%edx
17fd   538ddd:	bb 00 00 00 00       	mov    $0x0,%ebx
1802   538de2:	0f 4f da             	cmovg  %edx,%ebx
1805   538de5:	f7 da                	neg    %edx
1807   538de7:	41 39 c6             	cmp    %eax,%r14d
180a   538dea:	0f 4f d1             	cmovg  %ecx,%edx
180d   538ded:	41 89 55 00          	mov    %edx,0x0(%r13)
1811   538df1:	66 41 83 3f 00       	cmpw   $0x0,(%r15)
1816   538df6:	0f 84 d4 45 00 00    	je     53d3d0 <balance_leaf+0x5df0>
181c   538dfc:	e8 00 00 00 00       	call   538e01 <balance_leaf+0x1821>	538dfd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1821   538e01:	e9 27 04 00 00       	jmp    53922d <balance_leaf+0x1c4d>
1826   538e06:	e8 00 00 00 00       	call   538e0b <balance_leaf+0x182b>	538e07: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
182b   538e0b:	e9 80 00 00 00       	jmp    538e90 <balance_leaf+0x18b0>
1830   538e10:	e8 00 00 00 00       	call   538e15 <balance_leaf+0x1835>	538e11: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1835   538e15:	31 db                	xor    %ebx,%ebx
1837   538e17:	31 ff                	xor    %edi,%edi
1839   538e19:	4c 89 e6             	mov    %r12,%rsi
183c   538e1c:	89 ea                	mov    %ebp,%edx
183e   538e1e:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
1843   538e23:	45 31 c0             	xor    %r8d,%r8d
1846   538e26:	e8 00 00 00 00       	call   538e2b <balance_leaf+0x184b>	538e27: R_X86_64_PLT32	leaf_move_items-0x4
184b   538e2b:	4d 8d 74 24 48       	lea    0x48(%r12),%r14
1850   538e30:	4c 89 f7             	mov    %r14,%rdi
1853   538e33:	e8 00 00 00 00       	call   538e38 <balance_leaf+0x1858>	538e34: R_X86_64_PLT32	__asan_load8_noabort-0x4
1858   538e38:	49 8b 6c 24 48       	mov    0x48(%r12),%rbp
185d   538e3d:	48 8d 7d 28          	lea    0x28(%rbp),%rdi
1861   538e41:	e8 00 00 00 00       	call   538e46 <balance_leaf+0x1866>	538e42: R_X86_64_PLT32	__asan_load8_noabort-0x4
1866   538e46:	48 8b 6d 28          	mov    0x28(%rbp),%rbp
186a   538e4a:	48 8d 7d 02          	lea    0x2(%rbp),%rdi
186e   538e4e:	e8 00 00 00 00       	call   538e53 <balance_leaf+0x1873>	538e4f: R_X86_64_PLT32	__asan_load2_noabort-0x4
1873   538e53:	0f b7 55 02          	movzwl 0x2(%rbp),%edx
1877   538e57:	bf 02 00 00 00       	mov    $0x2,%edi
187c   538e5c:	4c 89 e6             	mov    %r12,%rsi
187f   538e5f:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
1884   538e64:	45 31 c0             	xor    %r8d,%r8d
1887   538e67:	e8 00 00 00 00       	call   538e6c <balance_leaf+0x188c>	538e68: R_X86_64_PLT32	leaf_move_items-0x4
188c   538e6c:	4c 89 e7             	mov    %r12,%rdi
188f   538e6f:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
1894   538e74:	e8 00 00 00 00       	call   538e79 <balance_leaf+0x1899>	538e75: R_X86_64_PLT32	reiserfs_invalidate_buffer-0x4
1899   538e79:	4c 89 f7             	mov    %r14,%rdi
189c   538e7c:	e8 00 00 00 00       	call   538e81 <balance_leaf+0x18a1>	538e7d: R_X86_64_PLT32	__asan_load8_noabort-0x4
18a1   538e81:	49 8b 74 24 48       	mov    0x48(%r12),%rsi
18a6   538e86:	e9 cd f5 ff ff       	jmp    538458 <balance_leaf+0xe78>
18ab   538e8b:	e8 00 00 00 00       	call   538e90 <balance_leaf+0x18b0>	538e8c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
18b0   538e90:	49 8d 1c ee          	lea    (%r14,%rbp,8),%rbx
18b4   538e94:	48 83 c3 12          	add    $0x12,%rbx
18b8   538e98:	be 02 00 00 00       	mov    $0x2,%esi
18bd   538e9d:	48 89 df             	mov    %rbx,%rdi
18c0   538ea0:	e8 00 00 00 00       	call   538ea5 <balance_leaf+0x18c5>	538ea1: R_X86_64_PLT32	__asan_loadN_noabort-0x4
18c5   538ea5:	0f b7 1b             	movzwl (%rbx),%ebx
18c8   538ea8:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
18cd   538ead:	48 89 ef             	mov    %rbp,%rdi
18d0   538eb0:	e8 00 00 00 00       	call   538eb5 <balance_leaf+0x18d5>	538eb1: R_X86_64_PLT32	__asan_load4_noabort-0x4
18d5   538eb5:	01 5d 00             	add    %ebx,0x0(%rbp)
18d8   538eb8:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
18dd   538ebd:	e8 00 00 00 00       	call   538ec2 <balance_leaf+0x18e2>	538ebe: R_X86_64_PLT32	__asan_load4_noabort-0x4
18e2   538ec2:	48 8b 2c 24          	mov    (%rsp),%rbp
18e6   538ec6:	8b 9d a0 01 00 00    	mov    0x1a0(%rbp),%ebx
18ec   538ecc:	48 8d bd 20 02 00 00 	lea    0x220(%rbp),%rdi
18f3   538ed3:	e8 00 00 00 00       	call   538ed8 <balance_leaf+0x18f8>	538ed4: R_X86_64_PLT32	__asan_load4_noabort-0x4
18f8   538ed8:	8b 95 20 02 00 00    	mov    0x220(%rbp),%edx
18fe   538ede:	48 89 ef             	mov    %rbp,%rdi
1901   538ee1:	89 de                	mov    %ebx,%esi
1903   538ee3:	e8 00 00 00 00       	call   538ee8 <balance_leaf+0x1908>	538ee4: R_X86_64_PLT32	leaf_shift_left-0x4
1908   538ee8:	89 44 24 10          	mov    %eax,0x10(%rsp)
190c   538eec:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
1911   538ef1:	e8 00 00 00 00       	call   538ef6 <balance_leaf+0x1916>	538ef2: R_X86_64_PLT32	__asan_store8_noabort-0x4
1916   538ef6:	48 89 6c 24 20       	mov    %rbp,0x20(%rsp)
191b   538efb:	4d 89 e5             	mov    %r12,%r13
191e   538efe:	4c 89 e7             	mov    %r12,%rdi
1921   538f01:	e8 00 00 00 00       	call   538f06 <balance_leaf+0x1926>	538f02: R_X86_64_PLT32	__asan_load8_noabort-0x4
1926   538f06:	48 8b 5d 20          	mov    0x20(%rbp),%rbx
192a   538f0a:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
192f   538f0f:	e8 00 00 00 00       	call   538f14 <balance_leaf+0x1934>	538f10: R_X86_64_PLT32	__asan_store8_noabort-0x4
1934   538f14:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
1939   538f19:	48 8d 7d 70          	lea    0x70(%rbp),%rdi
193d   538f1d:	e8 00 00 00 00       	call   538f22 <balance_leaf+0x1942>	538f1e: R_X86_64_PLT32	__asan_load8_noabort-0x4
1942   538f22:	4c 8b 75 70          	mov    0x70(%rbp),%r14
1946   538f26:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
194b   538f2b:	e8 00 00 00 00       	call   538f30 <balance_leaf+0x1950>	538f2c: R_X86_64_PLT32	__asan_store8_noabort-0x4
1950   538f30:	4c 89 74 24 30       	mov    %r14,0x30(%rsp)
1955   538f35:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
195d   538f3d:	e8 00 00 00 00       	call   538f42 <balance_leaf+0x1962>	538f3e: R_X86_64_PLT32	__asan_load8_noabort-0x4
1962   538f42:	48 8b 6d 18          	mov    0x18(%rbp),%rbp
1966   538f46:	48 89 ef             	mov    %rbp,%rdi
1969   538f49:	e8 00 00 00 00       	call   538f4e <balance_leaf+0x196e>	538f4a: R_X86_64_PLT32	__asan_load4_noabort-0x4
196e   538f4e:	8b 45 00             	mov    0x0(%rbp),%eax
1971   538f51:	83 c0 ff             	add    $0xffffffff,%eax
1974   538f54:	4c 63 e0             	movslq %eax,%r12
1977   538f57:	49 c1 e4 04          	shl    $0x4,%r12
197b   538f5b:	49 8d 1c 2c          	lea    (%r12,%rbp,1),%rbx
197f   538f5f:	48 83 c3 08          	add    $0x8,%rbx
1983   538f63:	49 8d 3c 2c          	lea    (%r12,%rbp,1),%rdi
1987   538f67:	48 83 c7 10          	add    $0x10,%rdi
198b   538f6b:	e8 00 00 00 00       	call   538f70 <balance_leaf+0x1990>	538f6c: R_X86_64_PLT32	__asan_load4_noabort-0x4
1990   538f70:	46 8b 7c 25 10       	mov    0x10(%rbp,%r12,1),%r15d
1995   538f75:	48 89 df             	mov    %rbx,%rdi
1998   538f78:	e8 00 00 00 00       	call   538f7d <balance_leaf+0x199d>	538f79: R_X86_64_PLT32	__asan_load8_noabort-0x4
199d   538f7d:	4a 8b 5c 25 08       	mov    0x8(%rbp,%r12,1),%rbx
19a2   538f82:	48 85 db             	test   %rbx,%rbx
19a5   538f85:	0f 84 fa 42 00 00    	je     53d285 <balance_leaf+0x5ca5>
19ab   538f8b:	4d 85 f6             	test   %r14,%r14
19ae   538f8e:	0f 84 f1 42 00 00    	je     53d285 <balance_leaf+0x5ca5>
19b4   538f94:	45 85 ff             	test   %r15d,%r15d
19b7   538f97:	4c 8b 64 24 70       	mov    0x70(%rsp),%r12
19bc   538f9c:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
19c1   538fa1:	74 0b                	je     538fae <balance_leaf+0x19ce>
19c3   538fa3:	e8 00 00 00 00       	call   538fa8 <balance_leaf+0x19c8>	538fa4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
19c8   538fa8:	41 83 c7 ff          	add    $0xffffffff,%r15d
19cc   538fac:	eb 20                	jmp    538fce <balance_leaf+0x19ee>
19ce   538fae:	e8 00 00 00 00       	call   538fb3 <balance_leaf+0x19d3>	538faf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
19d3   538fb3:	49 8d 7e 28          	lea    0x28(%r14),%rdi
19d7   538fb7:	e8 00 00 00 00       	call   538fbc <balance_leaf+0x19dc>	538fb8: R_X86_64_PLT32	__asan_load8_noabort-0x4
19dc   538fbc:	49 8b 5e 28          	mov    0x28(%r14),%rbx
19e0   538fc0:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
19e4   538fc4:	e8 00 00 00 00       	call   538fc9 <balance_leaf+0x19e9>	538fc5: R_X86_64_PLT32	__asan_load2_noabort-0x4
19e9   538fc9:	44 0f b7 7b 02       	movzwl 0x2(%rbx),%r15d
19ee   538fce:	8b 5c 24 10          	mov    0x10(%rsp),%ebx
19f2   538fd2:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
19f7   538fd7:	e8 00 00 00 00       	call   538fdc <balance_leaf+0x19fc>	538fd8: R_X86_64_PLT32	__asan_store4_noabort-0x4
19fc   538fdc:	44 89 7c 24 38       	mov    %r15d,0x38(%rsp)
1a01   538fe1:	4c 89 e7             	mov    %r12,%rdi
1a04   538fe4:	e8 00 00 00 00       	call   538fe9 <balance_leaf+0x1a09>	538fe5: R_X86_64_PLT32	__asan_load4_noabort-0x4
1a09   538fe9:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
1a0e   538fee:	41 29 dd             	sub    %ebx,%r13d
1a11   538ff1:	41 8b 1c 24          	mov    (%r12),%ebx
1a15   538ff5:	44 01 eb             	add    %r13d,%ebx
1a18   538ff8:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
1a1d   538ffd:	48 89 ef             	mov    %rbp,%rdi
1a20   539000:	e8 00 00 00 00       	call   539005 <balance_leaf+0x1a25>	539001: R_X86_64_PLT32	__asan_load4_noabort-0x4
1a25   539005:	44 8b 7d 00          	mov    0x0(%rbp),%r15d
1a29   539009:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
1a2e   53900e:	48 89 ef             	mov    %rbp,%rdi
1a31   539011:	e8 00 00 00 00       	call   539016 <balance_leaf+0x1a36>	539012: R_X86_64_PLT32	__asan_load4_noabort-0x4
1a36   539016:	44 8b 75 00          	mov    0x0(%rbp),%r14d
1a3a   53901a:	48 8b 6c 24 60       	mov    0x60(%rsp),%rbp
1a3f   53901f:	48 89 ef             	mov    %rbp,%rdi
1a42   539022:	e8 00 00 00 00       	call   539027 <balance_leaf+0x1a47>	539023: R_X86_64_PLT32	__asan_load4_noabort-0x4
1a47   539027:	44 8b 4d 00          	mov    0x0(%rbp),%r9d
1a4b   53902b:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
1a50   539030:	89 de                	mov    %ebx,%esi
1a52   539032:	44 89 fa             	mov    %r15d,%edx
1a55   539035:	44 89 f1             	mov    %r14d,%ecx
1a58   539038:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
1a5d   53903d:	e8 00 00 00 00       	call   539042 <balance_leaf+0x1a62>	53903e: R_X86_64_PLT32	leaf_paste_in_buffer-0x4
1a62   539042:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
1a67   539047:	48 89 df             	mov    %rbx,%rdi
1a6a   53904a:	e8 00 00 00 00       	call   53904f <balance_leaf+0x1a6f>	53904b: R_X86_64_PLT32	__asan_load8_noabort-0x4
1a6f   53904f:	48 8b 1b             	mov    (%rbx),%rbx
1a72   539052:	4c 89 e7             	mov    %r12,%rdi
1a75   539055:	e8 00 00 00 00       	call   53905a <balance_leaf+0x1a7a>	539056: R_X86_64_PLT32	__asan_load4_noabort-0x4
1a7a   53905a:	45 03 2c 24          	add    (%r12),%r13d
1a7e   53905e:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
1a82   539062:	e8 00 00 00 00       	call   539067 <balance_leaf+0x1a87>	539063: R_X86_64_PLT32	__asan_load8_noabort-0x4
1a87   539067:	48 8b 6b 28          	mov    0x28(%rbx),%rbp
1a8b   53906b:	4c 8d 75 18          	lea    0x18(%rbp),%r14
1a8f   53906f:	4c 89 6c 24 08       	mov    %r13,0x8(%rsp)
1a94   539074:	49 63 c5             	movslq %r13d,%rax
1a97   539077:	48 8d 1c 40          	lea    (%rax,%rax,2),%rbx
1a9b   53907b:	4c 8d 2c dd 2e 00 00 00 	lea    0x2e(,%rbx,8),%r13
1aa3   539083:	49 01 ed             	add    %rbp,%r13
1aa6   539086:	be 02 00 00 00       	mov    $0x2,%esi
1aab   53908b:	4c 89 ef             	mov    %r13,%rdi
1aae   53908e:	e8 00 00 00 00       	call   539093 <balance_leaf+0x1ab3>	53908f: R_X86_64_PLT32	__asan_loadN_noabort-0x4
1ab3   539093:	66 83 7c dd 2e 00    	cmpw   $0x0,0x2e(%rbp,%rbx,8)
1ab9   539099:	74 3a                	je     5390d5 <balance_leaf+0x1af5>
1abb   53909b:	49 8d 3c de          	lea    (%r14,%rbx,8),%rdi
1abf   53909f:	48 83 c7 08          	add    $0x8,%rdi
1ac3   5390a3:	be 08 00 00 00       	mov    $0x8,%esi
1ac8   5390a8:	e8 00 00 00 00       	call   5390ad <balance_leaf+0x1acd>	5390a9: R_X86_64_PLT32	__asan_loadN_noabort-0x4
1acd   5390ad:	49 8b 44 de 08       	mov    0x8(%r14,%rbx,8),%rax
1ad2   5390b2:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
1adc   5390bc:	48 21 c8             	and    %rcx,%rax
1adf   5390bf:	48 b9 00 00 00 00 00 00 00 30 	movabs $0x3000000000000000,%rcx
1ae9   5390c9:	48 39 c8             	cmp    %rcx,%rax
1aec   5390cc:	75 7e                	jne    53914c <balance_leaf+0x1b6c>
1aee   5390ce:	e8 00 00 00 00       	call   5390d3 <balance_leaf+0x1af3>	5390cf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1af3   5390d3:	eb 22                	jmp    5390f7 <balance_leaf+0x1b17>
1af5   5390d5:	49 8d 3c de          	lea    (%r14,%rbx,8),%rdi
1af9   5390d9:	48 83 c7 0c          	add    $0xc,%rdi
1afd   5390dd:	be 04 00 00 00       	mov    $0x4,%esi
1b02   5390e2:	e8 00 00 00 00       	call   5390e7 <balance_leaf+0x1b07>	5390e3: R_X86_64_PLT32	__asan_loadN_noabort-0x4
1b07   5390e7:	41 81 7c de 0c f4 01 00 00 	cmpl   $0x1f4,0xc(%r14,%rbx,8)
1b10   5390f0:	75 61                	jne    539153 <balance_leaf+0x1b73>
1b12   5390f2:	e8 00 00 00 00       	call   5390f7 <balance_leaf+0x1b17>	5390f3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1b17   5390f7:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
1b1c   5390fc:	48 89 ef             	mov    %rbp,%rdi
1b1f   5390ff:	e8 00 00 00 00       	call   539104 <balance_leaf+0x1b24>	539100: R_X86_64_PLT32	__asan_load4_noabort-0x4
1b24   539104:	44 8b 65 00          	mov    0x0(%rbp),%r12d
1b28   539108:	4c 8b 7c 24 48       	mov    0x48(%rsp),%r15
1b2d   53910d:	49 8d 47 10          	lea    0x10(%r15),%rax
1b31   539111:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
1b36   539116:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
1b3b   53911b:	48 89 ef             	mov    %rbp,%rdi
1b3e   53911e:	e8 00 00 00 00       	call   539123 <balance_leaf+0x1b43>	53911f: R_X86_64_PLT32	__asan_load4_noabort-0x4
1b43   539123:	8b 45 00             	mov    0x0(%rbp),%eax
1b46   539126:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
1b4b   53912b:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
1b50   539130:	44 89 e2             	mov    %r12d,%edx
1b53   539133:	b9 01 00 00 00       	mov    $0x1,%ecx
1b58   539138:	4d 89 f8             	mov    %r15,%r8
1b5b   53913b:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
1b60   539140:	50                   	push   %rax
1b61   539141:	e8 00 00 00 00       	call   539146 <balance_leaf+0x1b66>	539142: R_X86_64_PLT32	leaf_paste_entries-0x4
1b66   539146:	48 83 c4 08          	add    $0x8,%rsp
1b6a   53914a:	eb 0c                	jmp    539158 <balance_leaf+0x1b78>
1b6c   53914c:	e8 00 00 00 00       	call   539151 <balance_leaf+0x1b71>	53914d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1b71   539151:	eb 05                	jmp    539158 <balance_leaf+0x1b78>
1b73   539153:	e8 00 00 00 00       	call   539158 <balance_leaf+0x1b78>	539154: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1b78   539158:	be 02 00 00 00       	mov    $0x2,%esi
1b7d   53915d:	4c 89 ef             	mov    %r13,%rdi
1b80   539160:	e8 00 00 00 00       	call   539165 <balance_leaf+0x1b85>	539161: R_X86_64_PLT32	__asan_loadN_noabort-0x4
1b85   539165:	66 41 83 7d 00 00    	cmpw   $0x0,0x0(%r13)
1b8b   53916b:	74 49                	je     5391b6 <balance_leaf+0x1bd6>
1b8d   53916d:	49 8d 3c de          	lea    (%r14,%rbx,8),%rdi
1b91   539171:	48 83 c7 08          	add    $0x8,%rdi
1b95   539175:	be 08 00 00 00       	mov    $0x8,%esi
1b9a   53917a:	e8 00 00 00 00       	call   53917f <balance_leaf+0x1b9f>	53917b: R_X86_64_PLT32	__asan_loadN_noabort-0x4
1b9f   53917f:	49 8b 44 de 08       	mov    0x8(%r14,%rbx,8),%rax
1ba4   539184:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
1bae   53918e:	48 21 c8             	and    %rcx,%rax
1bb1   539191:	48 b9 00 00 00 00 00 00 00 10 	movabs $0x1000000000000000,%rcx
1bbb   53919b:	48 39 c8             	cmp    %rcx,%rax
1bbe   53919e:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
1bc3   5391a3:	48 8b 6c 24 48       	mov    0x48(%rsp),%rbp
1bc8   5391a8:	4c 8b 6c 24 60       	mov    0x60(%rsp),%r13
1bcd   5391ad:	75 51                	jne    539200 <balance_leaf+0x1c20>
1bcf   5391af:	e8 00 00 00 00       	call   5391b4 <balance_leaf+0x1bd4>	5391b0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1bd4   5391b4:	eb 2e                	jmp    5391e4 <balance_leaf+0x1c04>
1bd6   5391b6:	49 8d 3c de          	lea    (%r14,%rbx,8),%rdi
1bda   5391ba:	48 83 c7 0c          	add    $0xc,%rdi
1bde   5391be:	be 04 00 00 00       	mov    $0x4,%esi
1be3   5391c3:	e8 00 00 00 00       	call   5391c8 <balance_leaf+0x1be8>	5391c4: R_X86_64_PLT32	__asan_loadN_noabort-0x4
1be8   5391c8:	41 83 7c de 0c fe    	cmpl   $0xfffffffe,0xc(%r14,%rbx,8)
1bee   5391ce:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
1bf3   5391d3:	48 8b 6c 24 48       	mov    0x48(%rsp),%rbp
1bf8   5391d8:	4c 8b 6c 24 60       	mov    0x60(%rsp),%r13
1bfd   5391dd:	75 28                	jne    539207 <balance_leaf+0x1c27>
1bff   5391df:	e8 00 00 00 00       	call   5391e4 <balance_leaf+0x1c04>	5391e0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1c04   5391e4:	49 8d 3c de          	lea    (%r14,%rbx,8),%rdi
1c08   5391e8:	48 83 c7 10          	add    $0x10,%rdi
1c0c   5391ec:	be 02 00 00 00       	mov    $0x2,%esi
1c11   5391f1:	e8 00 00 00 00       	call   5391f6 <balance_leaf+0x1c16>	5391f2: R_X86_64_PLT32	__asan_storeN_noabort-0x4
1c16   5391f6:	66 41 c7 44 de 10 00 00 	movw   $0x0,0x10(%r14,%rbx,8)
1c1e   5391fe:	eb 0c                	jmp    53920c <balance_leaf+0x1c2c>
1c20   539200:	e8 00 00 00 00       	call   539205 <balance_leaf+0x1c25>	539201: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1c25   539205:	eb 05                	jmp    53920c <balance_leaf+0x1c2c>
1c27   539207:	e8 00 00 00 00       	call   53920c <balance_leaf+0x1c2c>	539208: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1c2c   53920c:	4c 89 ff             	mov    %r15,%rdi
1c2f   53920f:	e8 00 00 00 00       	call   539214 <balance_leaf+0x1c34>	539210: R_X86_64_PLT32	__asan_store4_noabort-0x4
1c34   539214:	41 c7 07 00 00 00 00 	movl   $0x0,(%r15)
1c3b   53921b:	4c 89 ef             	mov    %r13,%rdi
1c3e   53921e:	e8 00 00 00 00       	call   539223 <balance_leaf+0x1c43>	53921f: R_X86_64_PLT32	__asan_store4_noabort-0x4
1c43   539223:	41 c7 45 00 00 00 00 00 	movl   $0x0,0x0(%r13)
1c4b   53922b:	31 db                	xor    %ebx,%ebx
1c4d   53922d:	89 d8                	mov    %ebx,%eax
1c4f   53922f:	48 01 c5             	add    %rax,%rbp
1c52   539232:	48 89 6c 24 48       	mov    %rbp,0x48(%rsp)
1c57   539237:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
1c5c   53923c:	e8 00 00 00 00       	call   539241 <balance_leaf+0x1c61>	53923d: R_X86_64_PLT32	__asan_load4_noabort-0x4
1c61   539241:	48 8b 1c 24          	mov    (%rsp),%rbx
1c65   539245:	44 8b bb a0 01 00 00 	mov    0x1a0(%rbx),%r15d
1c6c   53924c:	48 8d bb 20 02 00 00 	lea    0x220(%rbx),%rdi
1c73   539253:	e8 00 00 00 00       	call   539258 <balance_leaf+0x1c78>	539254: R_X86_64_PLT32	__asan_load4_noabort-0x4
1c78   539258:	31 ed                	xor    %ebp,%ebp
1c7a   53925a:	83 bb 20 02 00 00 ff 	cmpl   $0xffffffff,0x220(%rbx)
1c81   539261:	40 0f 95 c5          	setne  %bpl
1c85   539265:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
1c8a   53926a:	e8 00 00 00 00       	call   53926f <balance_leaf+0x1c8f>	53926b: R_X86_64_PLT32	__asan_load4_noabort-0x4
1c8f   53926f:	44 8b b3 28 02 00 00 	mov    0x228(%rbx),%r14d
1c96   539276:	45 29 fe             	sub    %r15d,%r14d
1c99   539279:	41 01 ee             	add    %ebp,%r14d
1c9c   53927c:	44 89 b3 28 02 00 00 	mov    %r14d,0x228(%rbx)
1ca3   539283:	4c 8d bb b4 01 00 00 	lea    0x1b4(%rbx),%r15
1caa   53928a:	4c 89 ff             	mov    %r15,%rdi
1cad   53928d:	e8 00 00 00 00       	call   539292 <balance_leaf+0x1cb2>	53928e: R_X86_64_PLT32	__asan_load4_noabort-0x4
1cb2   539292:	44 8b ab b4 01 00 00 	mov    0x1b4(%rbx),%r13d
1cb9   539299:	45 85 ed             	test   %r13d,%r13d
1cbc   53929c:	0f 8e 95 01 00 00    	jle    539437 <balance_leaf+0x1e57>
1cc2   5392a2:	48 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%rax
1cca   5392aa:	83 f8 69             	cmp    $0x69,%eax
1ccd   5392ad:	0f 85 93 01 00 00    	jne    539446 <balance_leaf+0x1e66>
1cd3   5392b3:	4c 89 7c 24 08       	mov    %r15,0x8(%rsp)
1cd8   5392b8:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
1ce0   5392c0:	48 89 df             	mov    %rbx,%rdi
1ce3   5392c3:	e8 00 00 00 00       	call   5392c8 <balance_leaf+0x1ce8>	5392c4: R_X86_64_PLT32	__asan_load8_noabort-0x4
1ce8   5392c8:	48 8b 1b             	mov    (%rbx),%rbx
1ceb   5392cb:	48 89 df             	mov    %rbx,%rdi
1cee   5392ce:	e8 00 00 00 00       	call   5392d3 <balance_leaf+0x1cf3>	5392cf: R_X86_64_PLT32	__asan_load4_noabort-0x4
1cf3   5392d3:	48 63 2b             	movslq (%rbx),%rbp
1cf6   5392d6:	48 c1 e5 04          	shl    $0x4,%rbp
1cfa   5392da:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
1cfe   5392de:	48 83 c7 08          	add    $0x8,%rdi
1d02   5392e2:	e8 00 00 00 00       	call   5392e7 <balance_leaf+0x1d07>	5392e3: R_X86_64_PLT32	__asan_load8_noabort-0x4
1d07   5392e7:	48 8b 5c 2b 08       	mov    0x8(%rbx,%rbp,1),%rbx
1d0c   5392ec:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
1d10   5392f0:	e8 00 00 00 00       	call   5392f5 <balance_leaf+0x1d15>	5392f1: R_X86_64_PLT32	__asan_load8_noabort-0x4
1d15   5392f5:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
1d19   5392f9:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1d1d   5392fd:	e8 00 00 00 00       	call   539302 <balance_leaf+0x1d22>	5392fe: R_X86_64_PLT32	__asan_load2_noabort-0x4
1d22   539302:	44 0f b7 7b 02       	movzwl 0x2(%rbx),%r15d
1d27   539307:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
1d2c   53930c:	ba 20 00 00 00       	mov    $0x20,%edx
1d31   539311:	31 f6                	xor    %esi,%esi
1d33   539313:	e8 00 00 00 00       	call   539318 <balance_leaf+0x1d38>	539314: R_X86_64_PLT32	memset-0x4
1d38   539318:	44 89 f8             	mov    %r15d,%eax
1d3b   53931b:	44 29 e8             	sub    %r13d,%eax
1d3e   53931e:	44 39 f0             	cmp    %r14d,%eax
1d41   539321:	0f 8d b3 01 00 00    	jge    5394da <balance_leaf+0x1efa>
1d47   539327:	83 c0 01             	add    $0x1,%eax
1d4a   53932a:	41 39 c6             	cmp    %eax,%r14d
1d4d   53932d:	0f 85 9f 02 00 00    	jne    5395d2 <balance_leaf+0x1ff2>
1d53   539333:	48 8b 1c 24          	mov    (%rsp),%rbx
1d57   539337:	48 8d bb 24 02 00 00 	lea    0x224(%rbx),%rdi
1d5e   53933e:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
1d63   539343:	e8 00 00 00 00       	call   539348 <balance_leaf+0x1d68>	539344: R_X86_64_PLT32	__asan_load4_noabort-0x4
1d68   539348:	83 bb 24 02 00 00 ff 	cmpl   $0xffffffff,0x224(%rbx)
1d6f   53934f:	0f 84 8e 02 00 00    	je     5395e3 <balance_leaf+0x2003>
1d75   539355:	41 83 c5 ff          	add    $0xffffffff,%r13d
1d79   539359:	48 8b 3c 24          	mov    (%rsp),%rdi
1d7d   53935d:	44 89 ee             	mov    %r13d,%esi
1d80   539360:	ba ff ff ff ff       	mov    $0xffffffff,%edx
1d85   539365:	e8 00 00 00 00       	call   53936a <balance_leaf+0x1d8a>	539366: R_X86_64_PLT32	leaf_shift_right-0x4
1d8a   53936a:	48 8b 9c 24 a0 00 00 00 	mov    0xa0(%rsp),%rbx
1d92   539372:	48 8d 7b 16          	lea    0x16(%rbx),%rdi
1d96   539376:	be 02 00 00 00       	mov    $0x2,%esi
1d9b   53937b:	48 89 bc 24 80 00 00 00 	mov    %rdi,0x80(%rsp)
1da3   539383:	e8 00 00 00 00       	call   539388 <balance_leaf+0x1da8>	539384: R_X86_64_PLT32	__asan_loadN_noabort-0x4
1da8   539388:	66 83 7b 16 00       	cmpw   $0x0,0x16(%rbx)
1dad   53938d:	0f 84 41 08 00 00    	je     539bd4 <balance_leaf+0x25f4>
1db3   539393:	49 bc 00 00 00 00 00 00 00 10 	movabs $0x1000000000000000,%r12
1dbd   53939d:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
1dc1   5393a1:	be 08 00 00 00       	mov    $0x8,%esi
1dc6   5393a6:	48 89 bc 24 d8 00 00 00 	mov    %rdi,0xd8(%rsp)
1dce   5393ae:	e8 00 00 00 00       	call   5393b3 <balance_leaf+0x1dd3>	5393af: R_X86_64_PLT32	__asan_loadN_noabort-0x4
1dd3   5393b3:	4c 8b 73 08          	mov    0x8(%rbx),%r14
1dd7   5393b7:	49 8d 44 24 ff       	lea    -0x1(%r12),%rax
1ddc   5393bc:	48 89 84 24 e0 00 00 00 	mov    %rax,0xe0(%rsp)
1de4   5393c4:	4c 89 f5             	mov    %r14,%rbp
1de7   5393c7:	48 b8 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rax
1df1   5393d1:	48 21 c5             	and    %rax,%rbp
1df4   5393d4:	48 8d 7b 12          	lea    0x12(%rbx),%rdi
1df8   5393d8:	be 02 00 00 00       	mov    $0x2,%esi
1dfd   5393dd:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
1e02   5393e2:	e8 00 00 00 00       	call   5393e7 <balance_leaf+0x1e07>	5393e3: R_X86_64_PLT32	__asan_loadN_noabort-0x4
1e07   5393e7:	0f b7 43 12          	movzwl 0x12(%rbx),%eax
1e0b   5393eb:	0f b7 c8             	movzwl %ax,%ecx
1e0e   5393ee:	4c 39 e5             	cmp    %r12,%rbp
1e11   5393f1:	66 89 84 24 98 00 00 00 	mov    %ax,0x98(%rsp)
1e19   5393f9:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
1e1e   5393fe:	0f 85 d4 0a 00 00    	jne    539ed8 <balance_leaf+0x28f8>
1e24   539404:	e8 00 00 00 00       	call   539409 <balance_leaf+0x1e29>	539405: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1e29   539409:	48 8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%rbx
1e31   539411:	48 89 df             	mov    %rbx,%rdi
1e34   539414:	e8 00 00 00 00       	call   539419 <balance_leaf+0x1e39>	539415: R_X86_64_PLT32	__asan_load8_noabort-0x4
1e39   539419:	48 8b 1b             	mov    (%rbx),%rbx
1e3c   53941c:	48 8d 7b 14          	lea    0x14(%rbx),%rdi
1e40   539420:	e8 00 00 00 00       	call   539425 <balance_leaf+0x1e45>	539421: R_X86_64_PLT32	__asan_load1_noabort-0x4
1e45   539425:	0f b6 43 14          	movzbl 0x14(%rbx),%eax
1e49   539429:	41 bd fe ff ff ff    	mov    $0xfffffffe,%r13d
1e4f   53942f:	41 01 c5             	add    %eax,%r13d
1e52   539432:	e9 a9 0a 00 00       	jmp    539ee0 <balance_leaf+0x2900>
1e57   539437:	e8 00 00 00 00       	call   53943c <balance_leaf+0x1e5c>	539438: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1e5c   53943c:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
1e61   539441:	e9 3e 0c 00 00       	jmp    53a084 <balance_leaf+0x2aa4>
1e66   539446:	83 f8 70             	cmp    $0x70,%eax
1e69   539449:	0f 85 01 44 00 00    	jne    53d850 <balance_leaf+0x6270>
1e6f   53944f:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
1e77   539457:	48 89 df             	mov    %rbx,%rdi
1e7a   53945a:	e8 00 00 00 00       	call   53945f <balance_leaf+0x1e7f>	53945b: R_X86_64_PLT32	__asan_load8_noabort-0x4
1e7f   53945f:	48 8b 1b             	mov    (%rbx),%rbx
1e82   539462:	48 89 df             	mov    %rbx,%rdi
1e85   539465:	e8 00 00 00 00       	call   53946a <balance_leaf+0x1e8a>	539466: R_X86_64_PLT32	__asan_load4_noabort-0x4
1e8a   53946a:	48 63 2b             	movslq (%rbx),%rbp
1e8d   53946d:	48 c1 e5 04          	shl    $0x4,%rbp
1e91   539471:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
1e95   539475:	48 83 c7 08          	add    $0x8,%rdi
1e99   539479:	e8 00 00 00 00       	call   53947e <balance_leaf+0x1e9e>	53947a: R_X86_64_PLT32	__asan_load8_noabort-0x4
1e9e   53947e:	48 8b 6c 2b 08       	mov    0x8(%rbx,%rbp,1),%rbp
1ea3   539483:	4c 8d 65 28          	lea    0x28(%rbp),%r12
1ea7   539487:	4c 89 e7             	mov    %r12,%rdi
1eaa   53948a:	e8 00 00 00 00       	call   53948f <balance_leaf+0x1eaf>	53948b: R_X86_64_PLT32	__asan_load8_noabort-0x4
1eaf   53948f:	48 8b 6d 28          	mov    0x28(%rbp),%rbp
1eb3   539493:	48 8d 7d 02          	lea    0x2(%rbp),%rdi
1eb7   539497:	e8 00 00 00 00       	call   53949c <balance_leaf+0x1ebc>	539498: R_X86_64_PLT32	__asan_load2_noabort-0x4
1ebc   53949c:	0f b7 4d 02          	movzwl 0x2(%rbp),%ecx
1ec0   5394a0:	89 c8                	mov    %ecx,%eax
1ec2   5394a2:	44 29 e8             	sub    %r13d,%eax
1ec5   5394a5:	44 39 f0             	cmp    %r14d,%eax
1ec8   5394a8:	7e 60                	jle    53950a <balance_leaf+0x1f2a>
1eca   5394aa:	e8 00 00 00 00       	call   5394af <balance_leaf+0x1ecf>	5394ab: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1ecf   5394af:	48 8b 1c 24          	mov    (%rsp),%rbx
1ed3   5394b3:	48 8d bb 24 02 00 00 	lea    0x224(%rbx),%rdi
1eda   5394ba:	e8 00 00 00 00       	call   5394bf <balance_leaf+0x1edf>	5394bb: R_X86_64_PLT32	__asan_load4_noabort-0x4
1edf   5394bf:	8b 93 24 02 00 00    	mov    0x224(%rbx),%edx
1ee5   5394c5:	48 89 df             	mov    %rbx,%rdi
1ee8   5394c8:	44 89 ee             	mov    %r13d,%esi
1eeb   5394cb:	e8 00 00 00 00       	call   5394d0 <balance_leaf+0x1ef0>	5394cc: R_X86_64_PLT32	leaf_shift_right-0x4
1ef0   5394d0:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
1ef5   5394d5:	e9 aa 0b 00 00       	jmp    53a084 <balance_leaf+0x2aa4>
1efa   5394da:	e8 00 00 00 00       	call   5394df <balance_leaf+0x1eff>	5394db: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1eff   5394df:	48 8b 1c 24          	mov    (%rsp),%rbx
1f03   5394e3:	48 8d bb 24 02 00 00 	lea    0x224(%rbx),%rdi
1f0a   5394ea:	e8 00 00 00 00       	call   5394ef <balance_leaf+0x1f0f>	5394eb: R_X86_64_PLT32	__asan_load4_noabort-0x4
1f0f   5394ef:	8b 93 24 02 00 00    	mov    0x224(%rbx),%edx
1f15   5394f5:	48 89 df             	mov    %rbx,%rdi
1f18   5394f8:	44 89 ee             	mov    %r13d,%esi
1f1b   5394fb:	e8 00 00 00 00       	call   539500 <balance_leaf+0x1f20>	5394fc: R_X86_64_PLT32	leaf_shift_right-0x4
1f20   539500:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
1f25   539505:	e9 75 0b 00 00       	jmp    53a07f <balance_leaf+0x2a9f>
1f2a   53950a:	89 4c 24 50          	mov    %ecx,0x50(%rsp)
1f2e   53950e:	4c 89 7c 24 08       	mov    %r15,0x8(%rsp)
1f33   539513:	0f 85 c0 00 00 00    	jne    5395d9 <balance_leaf+0x1ff9>
1f39   539519:	48 8b 2c 24          	mov    (%rsp),%rbp
1f3d   53951d:	48 8d bd 24 02 00 00 	lea    0x224(%rbp),%rdi
1f44   539524:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
1f49   539529:	e8 00 00 00 00       	call   53952e <balance_leaf+0x1f4e>	53952a: R_X86_64_PLT32	__asan_load4_noabort-0x4
1f4e   53952e:	8b ad 24 02 00 00    	mov    0x224(%rbp),%ebp
1f54   539534:	83 fd ff             	cmp    $0xffffffff,%ebp
1f57   539537:	0f 84 a7 02 00 00    	je     5397e4 <balance_leaf+0x2204>
1f5d   53953d:	48 8d bc 24 c8 00 00 00 	lea    0xc8(%rsp),%rdi
1f65   539545:	e8 00 00 00 00       	call   53954a <balance_leaf+0x1f6a>	539546: R_X86_64_PLT32	__asan_store8_noabort-0x4
1f6a   53954a:	48 c7 84 24 c8 00 00 00 00 00 00 00 	movq   $0x0,0xc8(%rsp)
1f76   539556:	4c 89 e7             	mov    %r12,%rdi
1f79   539559:	e8 00 00 00 00       	call   53955e <balance_leaf+0x1f7e>	53955a: R_X86_64_PLT32	__asan_load8_noabort-0x4
1f7e   53955e:	4d 8b 3c 24          	mov    (%r12),%r15
1f82   539562:	4d 8d 67 18          	lea    0x18(%r15),%r12
1f86   539566:	49 63 c6             	movslq %r14d,%rax
1f89   539569:	4c 8d 34 40          	lea    (%rax,%rax,2),%r14
1f8d   53956d:	4b 8d 3c f7          	lea    (%r15,%r14,8),%rdi
1f91   539571:	48 83 c7 2e          	add    $0x2e,%rdi
1f95   539575:	be 02 00 00 00       	mov    $0x2,%esi
1f9a   53957a:	e8 00 00 00 00       	call   53957f <balance_leaf+0x1f9f>	53957b: R_X86_64_PLT32	__asan_loadN_noabort-0x4
1f9f   53957f:	66 43 83 7c f7 2e 00 	cmpw   $0x0,0x2e(%r15,%r14,8)
1fa6   539586:	0f 84 cd 06 00 00    	je     539c59 <balance_leaf+0x2679>
1fac   53958c:	4b 8d 3c f4          	lea    (%r12,%r14,8),%rdi
1fb0   539590:	48 83 c7 08          	add    $0x8,%rdi
1fb4   539594:	be 08 00 00 00       	mov    $0x8,%esi
1fb9   539599:	e8 00 00 00 00       	call   53959e <balance_leaf+0x1fbe>	53959a: R_X86_64_PLT32	__asan_loadN_noabort-0x4
1fbe   53959e:	4b 8b 44 f4 08       	mov    0x8(%r12,%r14,8),%rax
1fc3   5395a3:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
1fcd   5395ad:	48 21 c8             	and    %rcx,%rax
1fd0   5395b0:	48 b9 00 00 00 00 00 00 00 30 	movabs $0x3000000000000000,%rcx
1fda   5395ba:	48 39 c8             	cmp    %rcx,%rax
1fdd   5395bd:	0f 85 78 09 00 00    	jne    539f3b <balance_leaf+0x295b>
1fe3   5395c3:	48 89 6c 24 50       	mov    %rbp,0x50(%rsp)
1fe8   5395c8:	e8 00 00 00 00       	call   5395cd <balance_leaf+0x1fed>	5395c9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1fed   5395cd:	e9 b2 06 00 00       	jmp    539c84 <balance_leaf+0x26a4>
1ff2   5395d2:	e8 00 00 00 00       	call   5395d7 <balance_leaf+0x1ff7>	5395d3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1ff7   5395d7:	eb 0f                	jmp    5395e8 <balance_leaf+0x2008>
1ff9   5395d9:	e8 00 00 00 00       	call   5395de <balance_leaf+0x1ffe>	5395da: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1ffe   5395de:	e9 06 02 00 00       	jmp    5397e9 <balance_leaf+0x2209>
2003   5395e3:	e8 00 00 00 00       	call   5395e8 <balance_leaf+0x2008>	5395e4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2008   5395e8:	41 83 c5 ff          	add    $0xffffffff,%r13d
200c   5395ec:	48 8b 1c 24          	mov    (%rsp),%rbx
2010   5395f0:	48 8d bb 24 02 00 00 	lea    0x224(%rbx),%rdi
2017   5395f7:	e8 00 00 00 00       	call   5395fc <balance_leaf+0x201c>	5395f8: R_X86_64_PLT32	__asan_load4_noabort-0x4
201c   5395fc:	8b 93 24 02 00 00    	mov    0x224(%rbx),%edx
2022   539602:	48 89 df             	mov    %rbx,%rdi
2025   539605:	44 89 ee             	mov    %r13d,%esi
2028   539608:	e8 00 00 00 00       	call   53960d <balance_leaf+0x202d>	539609: R_X86_64_PLT32	leaf_shift_right-0x4
202d   53960d:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
2032   539612:	e8 00 00 00 00       	call   539617 <balance_leaf+0x2037>	539613: R_X86_64_PLT32	__asan_store8_noabort-0x4
2037   539617:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
203c   53961c:	48 8d 7b 48          	lea    0x48(%rbx),%rdi
2040   539620:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
2045   539625:	e8 00 00 00 00       	call   53962a <balance_leaf+0x204a>	539626: R_X86_64_PLT32	__asan_load8_noabort-0x4
204a   53962a:	48 8b 6b 48          	mov    0x48(%rbx),%rbp
204e   53962e:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
2053   539633:	e8 00 00 00 00       	call   539638 <balance_leaf+0x2058>	539634: R_X86_64_PLT32	__asan_store8_noabort-0x4
2058   539638:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
205d   53963d:	48 8d bb 98 00 00 00 	lea    0x98(%rbx),%rdi
2064   539644:	e8 00 00 00 00       	call   539649 <balance_leaf+0x2069>	539645: R_X86_64_PLT32	__asan_load8_noabort-0x4
2069   539649:	4c 8b a3 98 00 00 00 	mov    0x98(%rbx),%r12
2070   539650:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
2075   539655:	e8 00 00 00 00       	call   53965a <balance_leaf+0x207a>	539656: R_X86_64_PLT32	__asan_store8_noabort-0x4
207a   53965a:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
207f   53965f:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
2087   539667:	e8 00 00 00 00       	call   53966c <balance_leaf+0x208c>	539668: R_X86_64_PLT32	__asan_load8_noabort-0x4
208c   53966c:	48 8b 6b 18          	mov    0x18(%rbx),%rbp
2090   539670:	48 89 ef             	mov    %rbp,%rdi
2093   539673:	e8 00 00 00 00       	call   539678 <balance_leaf+0x2098>	539674: R_X86_64_PLT32	__asan_load4_noabort-0x4
2098   539678:	8b 45 00             	mov    0x0(%rbp),%eax
209b   53967b:	83 c0 ff             	add    $0xffffffff,%eax
209e   53967e:	4c 63 f0             	movslq %eax,%r14
20a1   539681:	49 c1 e6 04          	shl    $0x4,%r14
20a5   539685:	49 8d 1c 2e          	lea    (%r14,%rbp,1),%rbx
20a9   539689:	48 83 c3 08          	add    $0x8,%rbx
20ad   53968d:	49 8d 3c 2e          	lea    (%r14,%rbp,1),%rdi
20b1   539691:	48 83 c7 10          	add    $0x10,%rdi
20b5   539695:	e8 00 00 00 00       	call   53969a <balance_leaf+0x20ba>	539696: R_X86_64_PLT32	__asan_load4_noabort-0x4
20ba   53969a:	46 8b 6c 35 10       	mov    0x10(%rbp,%r14,1),%r13d
20bf   53969f:	48 89 df             	mov    %rbx,%rdi
20c2   5396a2:	e8 00 00 00 00       	call   5396a7 <balance_leaf+0x20c7>	5396a3: R_X86_64_PLT32	__asan_load8_noabort-0x4
20c7   5396a7:	4a 8b 5c 35 08       	mov    0x8(%rbp,%r14,1),%rbx
20cc   5396ac:	48 85 db             	test   %rbx,%rbx
20cf   5396af:	0f 84 da 3b 00 00    	je     53d28f <balance_leaf+0x5caf>
20d5   5396b5:	4d 85 e4             	test   %r12,%r12
20d8   5396b8:	0f 84 d1 3b 00 00    	je     53d28f <balance_leaf+0x5caf>
20de   5396be:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
20e2   5396c2:	e8 00 00 00 00       	call   5396c7 <balance_leaf+0x20e7>	5396c3: R_X86_64_PLT32	__asan_load8_noabort-0x4
20e7   5396c7:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
20eb   5396cb:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
20ef   5396cf:	e8 00 00 00 00       	call   5396d4 <balance_leaf+0x20f4>	5396d0: R_X86_64_PLT32	__asan_load2_noabort-0x4
20f4   5396d4:	0f b7 43 02          	movzwl 0x2(%rbx),%eax
20f8   5396d8:	41 8d 4d 01          	lea    0x1(%r13),%ecx
20fc   5396dc:	31 db                	xor    %ebx,%ebx
20fe   5396de:	41 39 c5             	cmp    %eax,%r13d
2101   5396e1:	0f 45 d9             	cmovne %ecx,%ebx
2104   5396e4:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
2109   5396e9:	e8 00 00 00 00       	call   5396ee <balance_leaf+0x210e>	5396ea: R_X86_64_PLT32	__asan_store4_noabort-0x4
210e   5396ee:	89 5c 24 38          	mov    %ebx,0x38(%rsp)
2112   5396f2:	4c 8b 74 24 70       	mov    0x70(%rsp),%r14
2117   5396f7:	4c 89 f7             	mov    %r14,%rdi
211a   5396fa:	e8 00 00 00 00       	call   5396ff <balance_leaf+0x211f>	5396fb: R_X86_64_PLT32	__asan_load4_noabort-0x4
211f   5396ff:	44 89 fb             	mov    %r15d,%ebx
2122   539702:	f7 d3                	not    %ebx
2124   539704:	41 03 1e             	add    (%r14),%ebx
2127   539707:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
212c   53970c:	4c 89 e7             	mov    %r12,%rdi
212f   53970f:	e8 00 00 00 00       	call   539714 <balance_leaf+0x2134>	539710: R_X86_64_PLT32	__asan_load4_noabort-0x4
2134   539714:	41 03 1c 24          	add    (%r12),%ebx
2138   539718:	48 8b 6c 24 60       	mov    0x60(%rsp),%rbp
213d   53971d:	48 89 ef             	mov    %rbp,%rdi
2140   539720:	e8 00 00 00 00       	call   539725 <balance_leaf+0x2145>	539721: R_X86_64_PLT32	__asan_load4_noabort-0x4
2145   539725:	44 8b 45 00          	mov    0x0(%rbp),%r8d
2149   539729:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
214e   53972e:	89 de                	mov    %ebx,%esi
2150   539730:	48 8b 94 24 a0 00 00 00 	mov    0xa0(%rsp),%rdx
2158   539738:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
215d   53973d:	e8 00 00 00 00       	call   539742 <balance_leaf+0x2162>	53973e: R_X86_64_PLT32	leaf_insert_into_buf-0x4
2162   539742:	4c 89 f7             	mov    %r14,%rdi
2165   539745:	e8 00 00 00 00       	call   53974a <balance_leaf+0x216a>	539746: R_X86_64_PLT32	__asan_load4_noabort-0x4
216a   53974a:	41 8b 1e             	mov    (%r14),%ebx
216d   53974d:	44 29 fb             	sub    %r15d,%ebx
2170   539750:	4d 89 e7             	mov    %r12,%r15
2173   539753:	4c 89 e7             	mov    %r12,%rdi
2176   539756:	e8 00 00 00 00       	call   53975b <balance_leaf+0x217b>	539757: R_X86_64_PLT32	__asan_load4_noabort-0x4
217b   53975b:	41 03 1c 24          	add    (%r12),%ebx
217f   53975f:	83 fb 01             	cmp    $0x1,%ebx
2182   539762:	75 4e                	jne    5397b2 <balance_leaf+0x21d2>
2184   539764:	e8 00 00 00 00       	call   539769 <balance_leaf+0x2189>	539765: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2189   539769:	48 8b 1c 24          	mov    (%rsp),%rbx
218d   53976d:	48 8d bb e8 00 00 00 	lea    0xe8(%rbx),%rdi
2194   539774:	e8 00 00 00 00       	call   539779 <balance_leaf+0x2199>	539775: R_X86_64_PLT32	__asan_load8_noabort-0x4
2199   539779:	4c 8b b3 e8 00 00 00 	mov    0xe8(%rbx),%r14
21a0   539780:	48 8d bb dc 01 00 00 	lea    0x1dc(%rbx),%rdi
21a7   539787:	e8 00 00 00 00       	call   53978c <balance_leaf+0x21ac>	539788: R_X86_64_PLT32	__asan_load4_noabort-0x4
21ac   53978c:	8b ab dc 01 00 00    	mov    0x1dc(%rbx),%ebp
21b2   539792:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
21b7   539797:	e8 00 00 00 00       	call   53979c <balance_leaf+0x21bc>	539798: R_X86_64_PLT32	__asan_load8_noabort-0x4
21bc   53979c:	48 8b 4b 48          	mov    0x48(%rbx),%rcx
21c0   5397a0:	48 89 df             	mov    %rbx,%rdi
21c3   5397a3:	4c 89 f6             	mov    %r14,%rsi
21c6   5397a6:	89 ea                	mov    %ebp,%edx
21c8   5397a8:	45 31 c0             	xor    %r8d,%r8d
21cb   5397ab:	e8 00 00 00 00       	call   5397b0 <balance_leaf+0x21d0>	5397ac: R_X86_64_PLT32	replace_key-0x4
21d0   5397b0:	eb 05                	jmp    5397b7 <balance_leaf+0x21d7>
21d2   5397b2:	e8 00 00 00 00       	call   5397b7 <balance_leaf+0x21d7>	5397b3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
21d7   5397b7:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
21dc   5397bc:	4c 89 ef             	mov    %r13,%rdi
21df   5397bf:	e8 00 00 00 00       	call   5397c4 <balance_leaf+0x21e4>	5397c0: R_X86_64_PLT32	__asan_store4_noabort-0x4
21e4   5397c4:	41 c7 45 00 00 00 00 00 	movl   $0x0,0x0(%r13)
21ec   5397cc:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
21f1   5397d1:	48 89 df             	mov    %rbx,%rdi
21f4   5397d4:	e8 00 00 00 00       	call   5397d9 <balance_leaf+0x21f9>	5397d5: R_X86_64_PLT32	__asan_store4_noabort-0x4
21f9   5397d9:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
21ff   5397df:	e9 a0 08 00 00       	jmp    53a084 <balance_leaf+0x2aa4>
2204   5397e4:	e8 00 00 00 00       	call   5397e9 <balance_leaf+0x2209>	5397e5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2209   5397e9:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
220e   5397ee:	e8 00 00 00 00       	call   5397f3 <balance_leaf+0x2213>	5397ef: R_X86_64_PLT32	__asan_store8_noabort-0x4
2213   5397f3:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)
221c   5397fc:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
2221   539801:	e8 00 00 00 00       	call   539806 <balance_leaf+0x2226>	539802: R_X86_64_PLT32	__asan_store8_noabort-0x4
2226   539806:	48 8b 2c 24          	mov    (%rsp),%rbp
222a   53980a:	48 89 6c 24 20       	mov    %rbp,0x20(%rsp)
222f   53980f:	48 8d 7d 48          	lea    0x48(%rbp),%rdi
2233   539813:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
2238   539818:	e8 00 00 00 00       	call   53981d <balance_leaf+0x223d>	539819: R_X86_64_PLT32	__asan_load8_noabort-0x4
223d   53981d:	4c 8b 75 48          	mov    0x48(%rbp),%r14
2241   539821:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
2246   539826:	e8 00 00 00 00       	call   53982b <balance_leaf+0x224b>	539827: R_X86_64_PLT32	__asan_store8_noabort-0x4
224b   53982b:	4c 89 74 24 28       	mov    %r14,0x28(%rsp)
2250   539830:	48 8d bd 98 00 00 00 	lea    0x98(%rbp),%rdi
2257   539837:	48 89 7c 24 68       	mov    %rdi,0x68(%rsp)
225c   53983c:	e8 00 00 00 00       	call   539841 <balance_leaf+0x2261>	53983d: R_X86_64_PLT32	__asan_load8_noabort-0x4
2261   539841:	4c 8b b5 98 00 00 00 	mov    0x98(%rbp),%r14
2268   539848:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
226d   53984d:	e8 00 00 00 00       	call   539852 <balance_leaf+0x2272>	53984e: R_X86_64_PLT32	__asan_store8_noabort-0x4
2272   539852:	4c 89 74 24 30       	mov    %r14,0x30(%rsp)
2277   539857:	48 89 df             	mov    %rbx,%rdi
227a   53985a:	e8 00 00 00 00       	call   53985f <balance_leaf+0x227f>	53985b: R_X86_64_PLT32	__asan_load4_noabort-0x4
227f   53985f:	8b 03                	mov    (%rbx),%eax
2281   539861:	83 c0 ff             	add    $0xffffffff,%eax
2284   539864:	4c 63 f8             	movslq %eax,%r15
2287   539867:	49 c1 e7 04          	shl    $0x4,%r15
228b   53986b:	4a 8d 2c 3b          	lea    (%rbx,%r15,1),%rbp
228f   53986f:	48 83 c5 08          	add    $0x8,%rbp
2293   539873:	4a 8d 3c 3b          	lea    (%rbx,%r15,1),%rdi
2297   539877:	48 83 c7 10          	add    $0x10,%rdi
229b   53987b:	e8 00 00 00 00       	call   539880 <balance_leaf+0x22a0>	53987c: R_X86_64_PLT32	__asan_load4_noabort-0x4
22a0   539880:	46 8b 64 3b 10       	mov    0x10(%rbx,%r15,1),%r12d
22a5   539885:	48 89 ef             	mov    %rbp,%rdi
22a8   539888:	e8 00 00 00 00       	call   53988d <balance_leaf+0x22ad>	539889: R_X86_64_PLT32	__asan_load8_noabort-0x4
22ad   53988d:	4a 8b 5c 3b 08       	mov    0x8(%rbx,%r15,1),%rbx
22b2   539892:	48 85 db             	test   %rbx,%rbx
22b5   539895:	0f 84 fe 39 00 00    	je     53d299 <balance_leaf+0x5cb9>
22bb   53989b:	4d 85 f6             	test   %r14,%r14
22be   53989e:	0f 84 f5 39 00 00    	je     53d299 <balance_leaf+0x5cb9>
22c4   5398a4:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
22c8   5398a8:	e8 00 00 00 00       	call   5398ad <balance_leaf+0x22cd>	5398a9: R_X86_64_PLT32	__asan_load8_noabort-0x4
22cd   5398ad:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
22d1   5398b1:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
22d5   5398b5:	e8 00 00 00 00       	call   5398ba <balance_leaf+0x22da>	5398b6: R_X86_64_PLT32	__asan_load2_noabort-0x4
22da   5398ba:	0f b7 43 02          	movzwl 0x2(%rbx),%eax
22de   5398be:	41 8d 4c 24 01       	lea    0x1(%r12),%ecx
22e3   5398c3:	31 db                	xor    %ebx,%ebx
22e5   5398c5:	41 39 c4             	cmp    %eax,%r12d
22e8   5398c8:	0f 45 d9             	cmovne %ecx,%ebx
22eb   5398cb:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
22f0   5398d0:	e8 00 00 00 00       	call   5398d5 <balance_leaf+0x22f5>	5398d1: R_X86_64_PLT32	__asan_store4_noabort-0x4
22f5   5398d5:	89 5c 24 38          	mov    %ebx,0x38(%rsp)
22f9   5398d9:	48 8b 2c 24          	mov    (%rsp),%rbp
22fd   5398dd:	48 8d bd 24 02 00 00 	lea    0x224(%rbp),%rdi
2304   5398e4:	e8 00 00 00 00       	call   5398e9 <balance_leaf+0x2309>	5398e5: R_X86_64_PLT32	__asan_load4_noabort-0x4
2309   5398e9:	8b 95 24 02 00 00    	mov    0x224(%rbp),%edx
230f   5398ef:	48 89 ef             	mov    %rbp,%rdi
2312   5398f2:	44 89 ee             	mov    %r13d,%esi
2315   5398f5:	e8 00 00 00 00       	call   5398fa <balance_leaf+0x231a>	5398f6: R_X86_64_PLT32	leaf_shift_right-0x4
231a   5398fa:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
231f   5398ff:	e8 00 00 00 00       	call   539904 <balance_leaf+0x2324>	539900: R_X86_64_PLT32	__asan_load4_noabort-0x4
2324   539904:	8b 85 50 02 00 00    	mov    0x250(%rbp),%eax
232a   53990a:	85 c0                	test   %eax,%eax
232c   53990c:	0f 88 51 01 00 00    	js     539a63 <balance_leaf+0x2483>
2332   539912:	89 84 24 80 00 00 00 	mov    %eax,0x80(%rsp)
2339   539919:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
233e   53991e:	e8 00 00 00 00       	call   539923 <balance_leaf+0x2343>	53991f: R_X86_64_PLT32	__asan_store8_noabort-0x4
2343   539923:	48 89 6c 24 20       	mov    %rbp,0x20(%rsp)
2348   539928:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
234d   53992d:	e8 00 00 00 00       	call   539932 <balance_leaf+0x2352>	53992e: R_X86_64_PLT32	__asan_load8_noabort-0x4
2352   539932:	48 8b 5d 48          	mov    0x48(%rbp),%rbx
2356   539936:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
235b   53993b:	e8 00 00 00 00       	call   539940 <balance_leaf+0x2360>	53993c: R_X86_64_PLT32	__asan_store8_noabort-0x4
2360   539940:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
2365   539945:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
236a   53994a:	e8 00 00 00 00       	call   53994f <balance_leaf+0x236f>	53994b: R_X86_64_PLT32	__asan_load8_noabort-0x4
236f   53994f:	4c 8b bd 98 00 00 00 	mov    0x98(%rbp),%r15
2376   539956:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
237b   53995b:	e8 00 00 00 00       	call   539960 <balance_leaf+0x2380>	53995c: R_X86_64_PLT32	__asan_store8_noabort-0x4
2380   539960:	4c 89 7c 24 30       	mov    %r15,0x30(%rsp)
2385   539965:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
238d   53996d:	e8 00 00 00 00       	call   539972 <balance_leaf+0x2392>	53996e: R_X86_64_PLT32	__asan_load8_noabort-0x4
2392   539972:	48 8b 6d 18          	mov    0x18(%rbp),%rbp
2396   539976:	48 89 ef             	mov    %rbp,%rdi
2399   539979:	e8 00 00 00 00       	call   53997e <balance_leaf+0x239e>	53997a: R_X86_64_PLT32	__asan_load4_noabort-0x4
239e   53997e:	8b 45 00             	mov    0x0(%rbp),%eax
23a1   539981:	83 c0 ff             	add    $0xffffffff,%eax
23a4   539984:	48 63 d8             	movslq %eax,%rbx
23a7   539987:	48 c1 e3 04          	shl    $0x4,%rbx
23ab   53998b:	4c 8d 24 2b          	lea    (%rbx,%rbp,1),%r12
23af   53998f:	49 83 c4 08          	add    $0x8,%r12
23b3   539993:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
23b7   539997:	48 83 c7 10          	add    $0x10,%rdi
23bb   53999b:	e8 00 00 00 00       	call   5399a0 <balance_leaf+0x23c0>	53999c: R_X86_64_PLT32	__asan_load4_noabort-0x4
23c0   5399a0:	44 8b 74 1d 10       	mov    0x10(%rbp,%rbx,1),%r14d
23c5   5399a5:	4c 89 e7             	mov    %r12,%rdi
23c8   5399a8:	e8 00 00 00 00       	call   5399ad <balance_leaf+0x23cd>	5399a9: R_X86_64_PLT32	__asan_load8_noabort-0x4
23cd   5399ad:	48 8b 5c 1d 08       	mov    0x8(%rbp,%rbx,1),%rbx
23d2   5399b2:	48 85 db             	test   %rbx,%rbx
23d5   5399b5:	0f 84 7d 39 00 00    	je     53d338 <balance_leaf+0x5d58>
23db   5399bb:	4d 85 ff             	test   %r15,%r15
23de   5399be:	0f 84 74 39 00 00    	je     53d338 <balance_leaf+0x5d58>
23e4   5399c4:	e8 00 00 00 00       	call   5399c9 <balance_leaf+0x23e9>	5399c5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
23e9   5399c9:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
23ed   5399cd:	e8 00 00 00 00       	call   5399d2 <balance_leaf+0x23f2>	5399ce: R_X86_64_PLT32	__asan_load8_noabort-0x4
23f2   5399d2:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
23f6   5399d6:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
23fa   5399da:	e8 00 00 00 00       	call   5399df <balance_leaf+0x23ff>	5399db: R_X86_64_PLT32	__asan_load2_noabort-0x4
23ff   5399df:	0f b7 43 02          	movzwl 0x2(%rbx),%eax
2403   5399e3:	41 8d 4e 01          	lea    0x1(%r14),%ecx
2407   5399e7:	31 db                	xor    %ebx,%ebx
2409   5399e9:	41 39 c6             	cmp    %eax,%r14d
240c   5399ec:	0f 45 d9             	cmovne %ecx,%ebx
240f   5399ef:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
2414   5399f4:	e8 00 00 00 00       	call   5399f9 <balance_leaf+0x2419>	5399f5: R_X86_64_PLT32	__asan_store4_noabort-0x4
2419   5399f9:	89 5c 24 38          	mov    %ebx,0x38(%rsp)
241d   5399fd:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
2422   539a02:	4c 89 ff             	mov    %r15,%rdi
2425   539a05:	e8 00 00 00 00       	call   539a0a <balance_leaf+0x242a>	539a06: R_X86_64_PLT32	__asan_load4_noabort-0x4
242a   539a0a:	41 8b 1f             	mov    (%r15),%ebx
242d   539a0d:	44 8b 6c 24 50       	mov    0x50(%rsp),%r13d
2432   539a12:	44 29 eb             	sub    %r13d,%ebx
2435   539a15:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
243a   539a1a:	48 89 ef             	mov    %rbp,%rdi
243d   539a1d:	e8 00 00 00 00       	call   539a22 <balance_leaf+0x2442>	539a1e: R_X86_64_PLT32	__asan_load4_noabort-0x4
2442   539a22:	03 5d 00             	add    0x0(%rbp),%ebx
2445   539a25:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
244a   539a2a:	4c 89 f7             	mov    %r14,%rdi
244d   539a2d:	e8 00 00 00 00       	call   539a32 <balance_leaf+0x2452>	539a2e: R_X86_64_PLT32	__asan_load4_noabort-0x4
2452   539a32:	45 8b 36             	mov    (%r14),%r14d
2455   539a35:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
245a   539a3a:	4c 89 e7             	mov    %r12,%rdi
245d   539a3d:	e8 00 00 00 00       	call   539a42 <balance_leaf+0x2462>	539a3e: R_X86_64_PLT32	__asan_load4_noabort-0x4
2462   539a42:	45 8b 0c 24          	mov    (%r12),%r9d
2466   539a46:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
246b   539a4b:	89 de                	mov    %ebx,%esi
246d   539a4d:	8b 94 24 80 00 00 00 	mov    0x80(%rsp),%edx
2474   539a54:	44 89 f1             	mov    %r14d,%ecx
2477   539a57:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
247c   539a5c:	e8 00 00 00 00       	call   539a61 <balance_leaf+0x2481>	539a5d: R_X86_64_PLT32	leaf_paste_in_buffer-0x4
2481   539a61:	eb 14                	jmp    539a77 <balance_leaf+0x2497>
2483   539a63:	e8 00 00 00 00       	call   539a68 <balance_leaf+0x2488>	539a64: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2488   539a68:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
248d   539a6d:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
2492   539a72:	44 8b 6c 24 50       	mov    0x50(%rsp),%r13d
2497   539a77:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
249c   539a7c:	48 89 df             	mov    %rbx,%rdi
249f   539a7f:	e8 00 00 00 00       	call   539a84 <balance_leaf+0x24a4>	539a80: R_X86_64_PLT32	__asan_load8_noabort-0x4
24a4   539a84:	48 8b 1b             	mov    (%rbx),%rbx
24a7   539a87:	4c 89 ff             	mov    %r15,%rdi
24aa   539a8a:	e8 00 00 00 00       	call   539a8f <balance_leaf+0x24af>	539a8b: R_X86_64_PLT32	__asan_load4_noabort-0x4
24af   539a8f:	45 8b 37             	mov    (%r15),%r14d
24b2   539a92:	45 29 ee             	sub    %r13d,%r14d
24b5   539a95:	48 89 ef             	mov    %rbp,%rdi
24b8   539a98:	e8 00 00 00 00       	call   539a9d <balance_leaf+0x24bd>	539a99: R_X86_64_PLT32	__asan_load4_noabort-0x4
24bd   539a9d:	44 03 75 00          	add    0x0(%rbp),%r14d
24c1   539aa1:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
24c5   539aa5:	e8 00 00 00 00       	call   539aaa <balance_leaf+0x24ca>	539aa6: R_X86_64_PLT32	__asan_load8_noabort-0x4
24ca   539aaa:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
24ce   539aae:	4c 8d 63 18          	lea    0x18(%rbx),%r12
24d2   539ab2:	49 63 c6             	movslq %r14d,%rax
24d5   539ab5:	4c 8d 3c 40          	lea    (%rax,%rax,2),%r15
24d9   539ab9:	4a 8d 2c fb          	lea    (%rbx,%r15,8),%rbp
24dd   539abd:	48 83 c5 2e          	add    $0x2e,%rbp
24e1   539ac1:	be 02 00 00 00       	mov    $0x2,%esi
24e6   539ac6:	48 89 ef             	mov    %rbp,%rdi
24e9   539ac9:	e8 00 00 00 00       	call   539ace <balance_leaf+0x24ee>	539aca: R_X86_64_PLT32	__asan_loadN_noabort-0x4
24ee   539ace:	66 42 83 7c fb 2e 00 	cmpw   $0x0,0x2e(%rbx,%r15,8)
24f5   539ad5:	74 3e                	je     539b15 <balance_leaf+0x2535>
24f7   539ad7:	4b 8d 3c fc          	lea    (%r12,%r15,8),%rdi
24fb   539adb:	48 83 c7 08          	add    $0x8,%rdi
24ff   539adf:	be 08 00 00 00       	mov    $0x8,%esi
2504   539ae4:	e8 00 00 00 00       	call   539ae9 <balance_leaf+0x2509>	539ae5: R_X86_64_PLT32	__asan_loadN_noabort-0x4
2509   539ae9:	4b 8b 44 fc 08       	mov    0x8(%r12,%r15,8),%rax
250e   539aee:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
2518   539af8:	48 21 c8             	and    %rcx,%rax
251b   539afb:	48 b9 00 00 00 00 00 00 00 30 	movabs $0x3000000000000000,%rcx
2525   539b05:	48 39 c8             	cmp    %rcx,%rax
2528   539b08:	0f 85 a8 00 00 00    	jne    539bb6 <balance_leaf+0x25d6>
252e   539b0e:	e8 00 00 00 00       	call   539b13 <balance_leaf+0x2533>	539b0f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2533   539b13:	eb 26                	jmp    539b3b <balance_leaf+0x255b>
2535   539b15:	4b 8d 3c fc          	lea    (%r12,%r15,8),%rdi
2539   539b19:	48 83 c7 0c          	add    $0xc,%rdi
253d   539b1d:	be 04 00 00 00       	mov    $0x4,%esi
2542   539b22:	e8 00 00 00 00       	call   539b27 <balance_leaf+0x2547>	539b23: R_X86_64_PLT32	__asan_loadN_noabort-0x4
2547   539b27:	43 81 7c fc 0c f4 01 00 00 	cmpl   $0x1f4,0xc(%r12,%r15,8)
2550   539b30:	0f 85 8a 00 00 00    	jne    539bc0 <balance_leaf+0x25e0>
2556   539b36:	e8 00 00 00 00       	call   539b3b <balance_leaf+0x255b>	539b37: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
255b   539b3b:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
2560   539b40:	4c 89 ef             	mov    %r13,%rdi
2563   539b43:	e8 00 00 00 00       	call   539b48 <balance_leaf+0x2568>	539b44: R_X86_64_PLT32	__asan_load4_noabort-0x4
2568   539b48:	41 8b 5d 00          	mov    0x0(%r13),%ebx
256c   539b4c:	85 db                	test   %ebx,%ebx
256e   539b4e:	78 7a                	js     539bca <balance_leaf+0x25ea>
2570   539b50:	48 89 ac 24 80 00 00 00 	mov    %rbp,0x80(%rsp)
2578   539b58:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
257d   539b5d:	48 83 c0 10          	add    $0x10,%rax
2581   539b61:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
2586   539b66:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
258b   539b6b:	48 89 ef             	mov    %rbp,%rdi
258e   539b6e:	e8 00 00 00 00       	call   539b73 <balance_leaf+0x2593>	539b6f: R_X86_64_PLT32	__asan_load4_noabort-0x4
2593   539b73:	8b 45 00             	mov    0x0(%rbp),%eax
2596   539b76:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
259b   539b7b:	44 89 f6             	mov    %r14d,%esi
259e   539b7e:	89 da                	mov    %ebx,%edx
25a0   539b80:	b9 01 00 00 00       	mov    $0x1,%ecx
25a5   539b85:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
25aa   539b8a:	4c 8b 4c 24 68       	mov    0x68(%rsp),%r9
25af   539b8f:	50                   	push   %rax
25b0   539b90:	e8 00 00 00 00       	call   539b95 <balance_leaf+0x25b5>	539b91: R_X86_64_PLT32	leaf_paste_entries-0x4
25b5   539b95:	48 83 c4 08          	add    $0x8,%rsp
25b9   539b99:	4c 89 ef             	mov    %r13,%rdi
25bc   539b9c:	e8 00 00 00 00       	call   539ba1 <balance_leaf+0x25c1>	539b9d: R_X86_64_PLT32	__asan_load4_noabort-0x4
25c1   539ba1:	41 83 7d 00 00       	cmpl   $0x0,0x0(%r13)
25c6   539ba6:	0f 84 99 03 00 00    	je     539f45 <balance_leaf+0x2965>
25cc   539bac:	e8 00 00 00 00       	call   539bb1 <balance_leaf+0x25d1>	539bad: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
25d1   539bb1:	e9 04 04 00 00       	jmp    539fba <balance_leaf+0x29da>
25d6   539bb6:	e8 00 00 00 00       	call   539bbb <balance_leaf+0x25db>	539bb7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
25db   539bbb:	e9 02 04 00 00       	jmp    539fc2 <balance_leaf+0x29e2>
25e0   539bc0:	e8 00 00 00 00       	call   539bc5 <balance_leaf+0x25e5>	539bc1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
25e5   539bc5:	e9 f8 03 00 00       	jmp    539fc2 <balance_leaf+0x29e2>
25ea   539bca:	e8 00 00 00 00       	call   539bcf <balance_leaf+0x25ef>	539bcb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
25ef   539bcf:	e9 ee 03 00 00       	jmp    539fc2 <balance_leaf+0x29e2>
25f4   539bd4:	4c 8d 6b 08          	lea    0x8(%rbx),%r13
25f8   539bd8:	be 04 00 00 00       	mov    $0x4,%esi
25fd   539bdd:	4c 89 ef             	mov    %r13,%rdi
2600   539be0:	e8 00 00 00 00       	call   539be5 <balance_leaf+0x2605>	539be1: R_X86_64_PLT32	__asan_loadN_noabort-0x4
2605   539be5:	44 8b 63 08          	mov    0x8(%rbx),%r12d
2609   539be9:	48 8d 7b 0c          	lea    0xc(%rbx),%rdi
260d   539bed:	be 04 00 00 00       	mov    $0x4,%esi
2612   539bf2:	e8 00 00 00 00       	call   539bf7 <balance_leaf+0x2617>	539bf3: R_X86_64_PLT32	__asan_loadN_noabort-0x4
2617   539bf7:	8b 6b 0c             	mov    0xc(%rbx),%ebp
261a   539bfa:	48 8d 7b 12          	lea    0x12(%rbx),%rdi
261e   539bfe:	be 02 00 00 00       	mov    $0x2,%esi
2623   539c03:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
2628   539c08:	e8 00 00 00 00       	call   539c0d <balance_leaf+0x262d>	539c09: R_X86_64_PLT32	__asan_loadN_noabort-0x4
262d   539c0d:	0f b7 43 12          	movzwl 0x12(%rbx),%eax
2631   539c11:	66 89 84 24 98 00 00 00 	mov    %ax,0x98(%rsp)
2639   539c19:	44 0f b7 f0          	movzwl %ax,%r14d
263d   539c1d:	83 fd fe             	cmp    $0xfffffffe,%ebp
2640   539c20:	0f 85 5e 1f 00 00    	jne    53bb84 <balance_leaf+0x45a4>
2646   539c26:	e8 00 00 00 00       	call   539c2b <balance_leaf+0x264b>	539c27: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
264b   539c2b:	48 8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%rbx
2653   539c33:	48 89 df             	mov    %rbx,%rdi
2656   539c36:	e8 00 00 00 00       	call   539c3b <balance_leaf+0x265b>	539c37: R_X86_64_PLT32	__asan_load8_noabort-0x4
265b   539c3b:	48 8b 1b             	mov    (%rbx),%rbx
265e   539c3e:	48 8d 7b 14          	lea    0x14(%rbx),%rdi
2662   539c42:	e8 00 00 00 00       	call   539c47 <balance_leaf+0x2667>	539c43: R_X86_64_PLT32	__asan_load1_noabort-0x4
2667   539c47:	0f b6 43 14          	movzbl 0x14(%rbx),%eax
266b   539c4b:	41 bf fe ff ff ff    	mov    $0xfffffffe,%r15d
2671   539c51:	41 01 c7             	add    %eax,%r15d
2674   539c54:	e9 33 1f 00 00       	jmp    53bb8c <balance_leaf+0x45ac>
2679   539c59:	4b 8d 3c f4          	lea    (%r12,%r14,8),%rdi
267d   539c5d:	48 83 c7 0c          	add    $0xc,%rdi
2681   539c61:	be 04 00 00 00       	mov    $0x4,%esi
2686   539c66:	e8 00 00 00 00       	call   539c6b <balance_leaf+0x268b>	539c67: R_X86_64_PLT32	__asan_loadN_noabort-0x4
268b   539c6b:	43 81 7c f4 0c f4 01 00 00 	cmpl   $0x1f4,0xc(%r12,%r14,8)
2694   539c74:	0f 85 d3 21 00 00    	jne    53be4d <balance_leaf+0x486d>
269a   539c7a:	48 89 6c 24 50       	mov    %rbp,0x50(%rsp)
269f   539c7f:	e8 00 00 00 00       	call   539c84 <balance_leaf+0x26a4>	539c80: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
26a4   539c84:	48 89 df             	mov    %rbx,%rdi
26a7   539c87:	e8 00 00 00 00       	call   539c8c <balance_leaf+0x26ac>	539c88: R_X86_64_PLT32	__asan_load4_noabort-0x4
26ac   539c8c:	48 63 2b             	movslq (%rbx),%rbp
26af   539c8f:	48 c1 e5 04          	shl    $0x4,%rbp
26b3   539c93:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
26b7   539c97:	48 83 c7 08          	add    $0x8,%rdi
26bb   539c9b:	e8 00 00 00 00       	call   539ca0 <balance_leaf+0x26c0>	539c9c: R_X86_64_PLT32	__asan_load8_noabort-0x4
26c0   539ca0:	48 8b 5c 2b 08       	mov    0x8(%rbx,%rbp,1),%rbx
26c5   539ca5:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
26ca   539caa:	e8 00 00 00 00       	call   539caf <balance_leaf+0x26cf>	539cab: R_X86_64_PLT32	__asan_store8_noabort-0x4
26cf   539caf:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)
26d8   539cb8:	48 8b 6c 24 60       	mov    0x60(%rsp),%rbp
26dd   539cbd:	48 89 ef             	mov    %rbp,%rdi
26e0   539cc0:	e8 00 00 00 00       	call   539cc5 <balance_leaf+0x26e5>	539cc1: R_X86_64_PLT32	__asan_load4_noabort-0x4
26e5   539cc5:	83 7d 00 00          	cmpl   $0x0,0x0(%rbp)
26e9   539cc9:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
26ee   539cce:	0f 85 69 38 00 00    	jne    53d53d <balance_leaf+0x5f5d>
26f4   539cd4:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
26f8   539cd8:	e8 00 00 00 00       	call   539cdd <balance_leaf+0x26fd>	539cd9: R_X86_64_PLT32	__asan_load8_noabort-0x4
26fd   539cdd:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
2701   539ce1:	4a 8d 3c f3          	lea    (%rbx,%r14,8),%rdi
2705   539ce5:	48 83 c7 28          	add    $0x28,%rdi
2709   539ce9:	be 02 00 00 00       	mov    $0x2,%esi
270e   539cee:	e8 00 00 00 00       	call   539cf3 <balance_leaf+0x2713>	539cef: R_X86_64_PLT32	__asan_loadN_noabort-0x4
2713   539cf3:	46 0f b7 64 f3 28    	movzwl 0x28(%rbx,%r14,8),%r12d
2719   539cf9:	44 89 e3             	mov    %r12d,%ebx
271c   539cfc:	4c 8b 74 24 50       	mov    0x50(%rsp),%r14
2721   539d01:	44 29 f3             	sub    %r14d,%ebx
2724   539d04:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
2729   539d09:	48 89 ef             	mov    %rbp,%rdi
272c   539d0c:	e8 00 00 00 00       	call   539d11 <balance_leaf+0x2731>	539d0d: R_X86_64_PLT32	__asan_load4_noabort-0x4
2731   539d11:	3b 5d 00             	cmp    0x0(%rbp),%ebx
2734   539d14:	0f 8d 0f 1e 00 00    	jge    53bb29 <balance_leaf+0x4549>
273a   539d1a:	4d 89 f7             	mov    %r14,%r15
273d   539d1d:	41 8d 6e ff          	lea    -0x1(%r14),%ebp
2741   539d21:	44 39 e5             	cmp    %r12d,%ebp
2744   539d24:	0f 8d bc 39 00 00    	jge    53d6e6 <balance_leaf+0x6106>
274a   539d2a:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
274f   539d2f:	48 89 df             	mov    %rbx,%rdi
2752   539d32:	e8 00 00 00 00       	call   539d37 <balance_leaf+0x2757>	539d33: R_X86_64_PLT32	__asan_load4_noabort-0x4
2757   539d37:	83 3b 00             	cmpl   $0x0,(%rbx)
275a   539d3a:	0f 84 ad 39 00 00    	je     53d6ed <balance_leaf+0x610d>
2760   539d40:	48 8b 1c 24          	mov    (%rsp),%rbx
2764   539d44:	48 89 df             	mov    %rbx,%rdi
2767   539d47:	44 89 ee             	mov    %r13d,%esi
276a   539d4a:	89 ea                	mov    %ebp,%edx
276c   539d4c:	e8 00 00 00 00       	call   539d51 <balance_leaf+0x2771>	539d4d: R_X86_64_PLT32	leaf_shift_right-0x4
2771   539d51:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
2776   539d56:	e8 00 00 00 00       	call   539d5b <balance_leaf+0x277b>	539d57: R_X86_64_PLT32	__asan_load4_noabort-0x4
277b   539d5b:	41 f7 d4             	not    %r12d
277e   539d5e:	44 03 a3 50 02 00 00 	add    0x250(%rbx),%r12d
2785   539d65:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
278a   539d6a:	e8 00 00 00 00       	call   539d6f <balance_leaf+0x278f>	539d6b: R_X86_64_PLT32	__asan_load4_noabort-0x4
278f   539d6f:	44 03 a3 24 02 00 00 	add    0x224(%rbx),%r12d
2796   539d76:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
279b   539d7b:	e8 00 00 00 00       	call   539d80 <balance_leaf+0x27a0>	539d7c: R_X86_64_PLT32	__asan_store8_noabort-0x4
27a0   539d80:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
27a5   539d85:	48 8d 7b 48          	lea    0x48(%rbx),%rdi
27a9   539d89:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
27ae   539d8e:	e8 00 00 00 00       	call   539d93 <balance_leaf+0x27b3>	539d8f: R_X86_64_PLT32	__asan_load8_noabort-0x4
27b3   539d93:	48 8b 6b 48          	mov    0x48(%rbx),%rbp
27b7   539d97:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
27bc   539d9c:	e8 00 00 00 00       	call   539da1 <balance_leaf+0x27c1>	539d9d: R_X86_64_PLT32	__asan_store8_noabort-0x4
27c1   539da1:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
27c6   539da6:	48 8d bb 98 00 00 00 	lea    0x98(%rbx),%rdi
27cd   539dad:	e8 00 00 00 00       	call   539db2 <balance_leaf+0x27d2>	539dae: R_X86_64_PLT32	__asan_load8_noabort-0x4
27d2   539db2:	4c 8b bb 98 00 00 00 	mov    0x98(%rbx),%r15
27d9   539db9:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
27de   539dbe:	e8 00 00 00 00       	call   539dc3 <balance_leaf+0x27e3>	539dbf: R_X86_64_PLT32	__asan_store8_noabort-0x4
27e3   539dc3:	4c 89 7c 24 30       	mov    %r15,0x30(%rsp)
27e8   539dc8:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
27f0   539dd0:	e8 00 00 00 00       	call   539dd5 <balance_leaf+0x27f5>	539dd1: R_X86_64_PLT32	__asan_load8_noabort-0x4
27f5   539dd5:	48 8b 5b 18          	mov    0x18(%rbx),%rbx
27f9   539dd9:	48 89 df             	mov    %rbx,%rdi
27fc   539ddc:	e8 00 00 00 00       	call   539de1 <balance_leaf+0x2801>	539ddd: R_X86_64_PLT32	__asan_load4_noabort-0x4
2801   539de1:	8b 03                	mov    (%rbx),%eax
2803   539de3:	83 c0 ff             	add    $0xffffffff,%eax
2806   539de6:	4c 63 f0             	movslq %eax,%r14
2809   539de9:	49 c1 e6 04          	shl    $0x4,%r14
280d   539ded:	4a 8d 2c 33          	lea    (%rbx,%r14,1),%rbp
2811   539df1:	48 83 c5 08          	add    $0x8,%rbp
2815   539df5:	4a 8d 3c 33          	lea    (%rbx,%r14,1),%rdi
2819   539df9:	48 83 c7 10          	add    $0x10,%rdi
281d   539dfd:	e8 00 00 00 00       	call   539e02 <balance_leaf+0x2822>	539dfe: R_X86_64_PLT32	__asan_load4_noabort-0x4
2822   539e02:	46 8b 6c 33 10       	mov    0x10(%rbx,%r14,1),%r13d
2827   539e07:	48 89 ef             	mov    %rbp,%rdi
282a   539e0a:	e8 00 00 00 00       	call   539e0f <balance_leaf+0x282f>	539e0b: R_X86_64_PLT32	__asan_load8_noabort-0x4
282f   539e0f:	4a 8b 5c 33 08       	mov    0x8(%rbx,%r14,1),%rbx
2834   539e14:	48 85 db             	test   %rbx,%rbx
2837   539e17:	0f 84 07 39 00 00    	je     53d724 <balance_leaf+0x6144>
283d   539e1d:	4d 85 ff             	test   %r15,%r15
2840   539e20:	0f 84 fe 38 00 00    	je     53d724 <balance_leaf+0x6144>
2846   539e26:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
284a   539e2a:	e8 00 00 00 00       	call   539e2f <balance_leaf+0x284f>	539e2b: R_X86_64_PLT32	__asan_load8_noabort-0x4
284f   539e2f:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
2853   539e33:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
2857   539e37:	e8 00 00 00 00       	call   539e3c <balance_leaf+0x285c>	539e38: R_X86_64_PLT32	__asan_load2_noabort-0x4
285c   539e3c:	0f b7 43 02          	movzwl 0x2(%rbx),%eax
2860   539e40:	41 8d 5d 01          	lea    0x1(%r13),%ebx
2864   539e44:	31 c9                	xor    %ecx,%ecx
2866   539e46:	41 39 c5             	cmp    %eax,%r13d
2869   539e49:	0f 44 d9             	cmove  %ecx,%ebx
286c   539e4c:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
2871   539e51:	e8 00 00 00 00       	call   539e56 <balance_leaf+0x2876>	539e52: R_X86_64_PLT32	__asan_store4_noabort-0x4
2876   539e56:	89 5c 24 38          	mov    %ebx,0x38(%rsp)
287a   539e5a:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
287f   539e5f:	4c 89 ef             	mov    %r13,%rdi
2882   539e62:	e8 00 00 00 00       	call   539e67 <balance_leaf+0x2887>	539e63: R_X86_64_PLT32	__asan_load4_noabort-0x4
2887   539e67:	41 8b 5d 00          	mov    0x0(%r13),%ebx
288b   539e6b:	48 8b 6c 24 60       	mov    0x60(%rsp),%rbp
2890   539e70:	48 89 ef             	mov    %rbp,%rdi
2893   539e73:	e8 00 00 00 00       	call   539e78 <balance_leaf+0x2898>	539e74: R_X86_64_PLT32	__asan_load4_noabort-0x4
2898   539e78:	44 8b 4d 00          	mov    0x0(%rbp),%r9d
289c   539e7c:	4c 8d 74 24 20       	lea    0x20(%rsp),%r14
28a1   539e81:	4c 89 f7             	mov    %r14,%rdi
28a4   539e84:	31 f6                	xor    %esi,%esi
28a6   539e86:	44 89 e2             	mov    %r12d,%edx
28a9   539e89:	89 d9                	mov    %ebx,%ecx
28ab   539e8b:	48 8b 6c 24 48       	mov    0x48(%rsp),%rbp
28b0   539e90:	49 89 e8             	mov    %rbp,%r8
28b3   539e93:	e8 00 00 00 00       	call   539e98 <balance_leaf+0x28b8>	539e94: R_X86_64_PLT32	leaf_paste_in_buffer-0x4
28b8   539e98:	48 8d 5d 10          	lea    0x10(%rbp),%rbx
28bc   539e9c:	4c 89 ef             	mov    %r13,%rdi
28bf   539e9f:	e8 00 00 00 00       	call   539ea4 <balance_leaf+0x28c4>	539ea0: R_X86_64_PLT32	__asan_load4_noabort-0x4
28c4   539ea4:	41 8b 45 00          	mov    0x0(%r13),%eax
28c8   539ea8:	4c 89 f7             	mov    %r14,%rdi
28cb   539eab:	31 f6                	xor    %esi,%esi
28cd   539ead:	44 89 e2             	mov    %r12d,%edx
28d0   539eb0:	b9 01 00 00 00       	mov    $0x1,%ecx
28d5   539eb5:	49 89 e8             	mov    %rbp,%r8
28d8   539eb8:	49 89 d9             	mov    %rbx,%r9
28db   539ebb:	50                   	push   %rax
28dc   539ebc:	e8 00 00 00 00       	call   539ec1 <balance_leaf+0x28e1>	539ebd: R_X86_64_PLT32	leaf_paste_entries-0x4
28e1   539ec1:	48 83 c4 08          	add    $0x8,%rsp
28e5   539ec5:	45 85 e4             	test   %r12d,%r12d
28e8   539ec8:	0f 84 4a 26 00 00    	je     53c518 <balance_leaf+0x4f38>
28ee   539ece:	e8 00 00 00 00       	call   539ed3 <balance_leaf+0x28f3>	539ecf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
28f3   539ed3:	e9 8c 26 00 00       	jmp    53c564 <balance_leaf+0x4f84>
28f8   539ed8:	e8 00 00 00 00       	call   539edd <balance_leaf+0x28fd>	539ed9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
28fd   539edd:	45 31 ed             	xor    %r13d,%r13d
2900   539ee0:	4c 89 f0             	mov    %r14,%rax
2903   539ee3:	4c 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%r15
290b   539eeb:	4c 21 f8             	and    %r15,%rax
290e   539eee:	48 89 84 24 a8 00 00 00 	mov    %rax,0xa8(%rsp)
2916   539ef6:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
291b   539efb:	48 89 df             	mov    %rbx,%rdi
291e   539efe:	e8 00 00 00 00       	call   539f03 <balance_leaf+0x2923>	539eff: R_X86_64_PLT32	__asan_load4_noabort-0x4
2923   539f03:	48 63 03             	movslq (%rbx),%rax
2926   539f06:	4c 8b 64 24 68       	mov    0x68(%rsp),%r12
292b   539f0b:	49 29 c4             	sub    %rax,%r12
292e   539f0e:	44 89 e9             	mov    %r13d,%ecx
2931   539f11:	49 d3 e4             	shl    %cl,%r12
2934   539f14:	4d 01 f4             	add    %r14,%r12
2937   539f17:	4d 21 fc             	and    %r15,%r12
293a   539f1a:	49 09 ec             	or     %rbp,%r12
293d   539f1d:	be 08 00 00 00       	mov    $0x8,%esi
2942   539f22:	48 8b ac 24 d8 00 00 00 	mov    0xd8(%rsp),%rbp
294a   539f2a:	48 89 ef             	mov    %rbp,%rdi
294d   539f2d:	e8 00 00 00 00       	call   539f32 <balance_leaf+0x2952>	539f2e: R_X86_64_PLT32	__asan_storeN_noabort-0x4
2952   539f32:	4c 89 65 00          	mov    %r12,0x0(%rbp)
2956   539f36:	e9 8d 1c 00 00       	jmp    53bbc8 <balance_leaf+0x45e8>
295b   539f3b:	e8 00 00 00 00       	call   539f40 <balance_leaf+0x2960>	539f3c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2960   539f40:	e9 0d 1f 00 00       	jmp    53be52 <balance_leaf+0x4872>
2965   539f45:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
296a   539f4a:	48 89 df             	mov    %rbx,%rdi
296d   539f4d:	e8 00 00 00 00       	call   539f52 <balance_leaf+0x2972>	539f4e: R_X86_64_PLT32	__asan_load4_noabort-0x4
2972   539f52:	8b 1b                	mov    (%rbx),%ebx
2974   539f54:	2b 5c 24 50          	sub    0x50(%rsp),%ebx
2978   539f58:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
297d   539f5d:	48 89 ef             	mov    %rbp,%rdi
2980   539f60:	e8 00 00 00 00       	call   539f65 <balance_leaf+0x2985>	539f61: R_X86_64_PLT32	__asan_load4_noabort-0x4
2985   539f65:	03 5d 00             	add    0x0(%rbp),%ebx
2988   539f68:	0f 85 a2 36 00 00    	jne    53d610 <balance_leaf+0x6030>
298e   539f6e:	e8 00 00 00 00       	call   539f73 <balance_leaf+0x2993>	539f6f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2993   539f73:	48 8b 1c 24          	mov    (%rsp),%rbx
2997   539f77:	48 8d bb e8 00 00 00 	lea    0xe8(%rbx),%rdi
299e   539f7e:	e8 00 00 00 00       	call   539f83 <balance_leaf+0x29a3>	539f7f: R_X86_64_PLT32	__asan_load8_noabort-0x4
29a3   539f83:	4c 8b b3 e8 00 00 00 	mov    0xe8(%rbx),%r14
29aa   539f8a:	48 8d bb dc 01 00 00 	lea    0x1dc(%rbx),%rdi
29b1   539f91:	e8 00 00 00 00       	call   539f96 <balance_leaf+0x29b6>	539f92: R_X86_64_PLT32	__asan_load4_noabort-0x4
29b6   539f96:	8b ab dc 01 00 00    	mov    0x1dc(%rbx),%ebp
29bc   539f9c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
29c1   539fa1:	e8 00 00 00 00       	call   539fa6 <balance_leaf+0x29c6>	539fa2: R_X86_64_PLT32	__asan_load8_noabort-0x4
29c6   539fa6:	48 8b 4b 48          	mov    0x48(%rbx),%rcx
29ca   539faa:	48 89 df             	mov    %rbx,%rdi
29cd   539fad:	4c 89 f6             	mov    %r14,%rsi
29d0   539fb0:	89 ea                	mov    %ebp,%edx
29d2   539fb2:	45 31 c0             	xor    %r8d,%r8d
29d5   539fb5:	e8 00 00 00 00       	call   539fba <balance_leaf+0x29da>	539fb6: R_X86_64_PLT32	replace_key-0x4
29da   539fba:	48 8b ac 24 80 00 00 00 	mov    0x80(%rsp),%rbp
29e2   539fc2:	be 02 00 00 00       	mov    $0x2,%esi
29e7   539fc7:	48 89 ef             	mov    %rbp,%rdi
29ea   539fca:	e8 00 00 00 00       	call   539fcf <balance_leaf+0x29ef>	539fcb: R_X86_64_PLT32	__asan_loadN_noabort-0x4
29ef   539fcf:	66 83 7d 00 00       	cmpw   $0x0,0x0(%rbp)
29f4   539fd4:	74 3a                	je     53a010 <balance_leaf+0x2a30>
29f6   539fd6:	4b 8d 3c fc          	lea    (%r12,%r15,8),%rdi
29fa   539fda:	48 83 c7 08          	add    $0x8,%rdi
29fe   539fde:	be 08 00 00 00       	mov    $0x8,%esi
2a03   539fe3:	e8 00 00 00 00       	call   539fe8 <balance_leaf+0x2a08>	539fe4: R_X86_64_PLT32	__asan_loadN_noabort-0x4
2a08   539fe8:	4b 8b 44 fc 08       	mov    0x8(%r12,%r15,8),%rax
2a0d   539fed:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
2a17   539ff7:	48 21 c8             	and    %rcx,%rax
2a1a   539ffa:	48 b9 00 00 00 00 00 00 00 10 	movabs $0x1000000000000000,%rcx
2a24   53a004:	48 39 c8             	cmp    %rcx,%rax
2a27   53a007:	75 42                	jne    53a04b <balance_leaf+0x2a6b>
2a29   53a009:	e8 00 00 00 00       	call   53a00e <balance_leaf+0x2a2e>	53a00a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2a2e   53a00e:	eb 1f                	jmp    53a02f <balance_leaf+0x2a4f>
2a30   53a010:	4b 8d 3c fc          	lea    (%r12,%r15,8),%rdi
2a34   53a014:	48 83 c7 0c          	add    $0xc,%rdi
2a38   53a018:	be 04 00 00 00       	mov    $0x4,%esi
2a3d   53a01d:	e8 00 00 00 00       	call   53a022 <balance_leaf+0x2a42>	53a01e: R_X86_64_PLT32	__asan_loadN_noabort-0x4
2a42   53a022:	43 83 7c fc 0c fe    	cmpl   $0xfffffffe,0xc(%r12,%r15,8)
2a48   53a028:	75 28                	jne    53a052 <balance_leaf+0x2a72>
2a4a   53a02a:	e8 00 00 00 00       	call   53a02f <balance_leaf+0x2a4f>	53a02b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2a4f   53a02f:	4b 8d 3c fc          	lea    (%r12,%r15,8),%rdi
2a53   53a033:	48 83 c7 10          	add    $0x10,%rdi
2a57   53a037:	be 02 00 00 00       	mov    $0x2,%esi
2a5c   53a03c:	e8 00 00 00 00       	call   53a041 <balance_leaf+0x2a61>	53a03d: R_X86_64_PLT32	__asan_storeN_noabort-0x4
2a61   53a041:	66 43 c7 44 fc 10 00 00 	movw   $0x0,0x10(%r12,%r15,8)
2a69   53a049:	eb 0c                	jmp    53a057 <balance_leaf+0x2a77>
2a6b   53a04b:	e8 00 00 00 00       	call   53a050 <balance_leaf+0x2a70>	53a04c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2a70   53a050:	eb 05                	jmp    53a057 <balance_leaf+0x2a77>
2a72   53a052:	e8 00 00 00 00       	call   53a057 <balance_leaf+0x2a77>	53a053: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2a77   53a057:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
2a7c   53a05c:	4c 89 ef             	mov    %r13,%rdi
2a7f   53a05f:	e8 00 00 00 00       	call   53a064 <balance_leaf+0x2a84>	53a060: R_X86_64_PLT32	__asan_store4_noabort-0x4
2a84   53a064:	41 c7 45 00 00 00 00 00 	movl   $0x0,0x0(%r13)
2a8c   53a06c:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
2a91   53a071:	48 89 df             	mov    %rbx,%rdi
2a94   53a074:	e8 00 00 00 00       	call   53a079 <balance_leaf+0x2a99>	53a075: R_X86_64_PLT32	__asan_store4_noabort-0x4
2a99   53a079:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
2a9f   53a07f:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
2aa4   53a084:	48 8b 1c 24          	mov    (%rsp),%rbx
2aa8   53a088:	48 8d bb 04 02 00 00 	lea    0x204(%rbx),%rdi
2aaf   53a08f:	e8 00 00 00 00       	call   53a094 <balance_leaf+0x2ab4>	53a090: R_X86_64_PLT32	__asan_load4_noabort-0x4
2ab4   53a094:	44 8b b3 04 02 00 00 	mov    0x204(%rbx),%r14d
2abb   53a09b:	41 83 fe 04          	cmp    $0x4,%r14d
2abf   53a09f:	0f 8d 00 2d 00 00    	jge    53cda5 <balance_leaf+0x57c5>
2ac5   53a0a5:	45 85 f6             	test   %r14d,%r14d
2ac8   53a0a8:	0f 88 20 2d 00 00    	js     53cdce <balance_leaf+0x57ee>
2ace   53a0ae:	74 14                	je     53a0c4 <balance_leaf+0x2ae4>
2ad0   53a0b0:	41 83 fe 01          	cmp    $0x1,%r14d
2ad4   53a0b4:	0f 85 0d 01 00 00    	jne    53a1c7 <balance_leaf+0x2be7>
2ada   53a0ba:	e8 00 00 00 00       	call   53a0bf <balance_leaf+0x2adf>	53a0bb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2adf   53a0bf:	e9 a1 13 00 00       	jmp    53b465 <balance_leaf+0x3e85>
2ae4   53a0c4:	48 8b 5c 24 40       	mov    0x40(%rsp),%rbx
2ae9   53a0c9:	48 89 df             	mov    %rbx,%rdi
2aec   53a0cc:	e8 00 00 00 00       	call   53a0d1 <balance_leaf+0x2af1>	53a0cd: R_X86_64_PLT32	__asan_load4_noabort-0x4
2af1   53a0d1:	83 3b 00             	cmpl   $0x0,(%rbx)
2af4   53a0d4:	0f 84 40 2e 00 00    	je     53cf1a <balance_leaf+0x593a>
2afa   53a0da:	4c 89 ff             	mov    %r15,%rdi
2afd   53a0dd:	e8 00 00 00 00       	call   53a0e2 <balance_leaf+0x2b02>	53a0de: R_X86_64_PLT32	__asan_load4_noabort-0x4
2b02   53a0e2:	41 83 3f 00          	cmpl   $0x0,(%r15)
2b06   53a0e6:	0f 84 35 2e 00 00    	je     53cf21 <balance_leaf+0x5941>
2b0c   53a0ec:	48 8b 1c 24          	mov    (%rsp),%rbx
2b10   53a0f0:	4c 8d bb c0 00 00 00 	lea    0xc0(%rbx),%r15
2b17   53a0f7:	4c 89 ff             	mov    %r15,%rdi
2b1a   53a0fa:	e8 00 00 00 00       	call   53a0ff <balance_leaf+0x2b1f>	53a0fb: R_X86_64_PLT32	__asan_load8_noabort-0x4
2b1f   53a0ff:	48 8b 9b c0 00 00 00 	mov    0xc0(%rbx),%rbx
2b26   53a106:	48 85 db             	test   %rbx,%rbx
2b29   53a109:	0f 84 0d 15 00 00    	je     53b61c <balance_leaf+0x403c>
2b2f   53a10f:	48 8b 2c 24          	mov    (%rsp),%rbp
2b33   53a113:	48 8d bd e8 00 00 00 	lea    0xe8(%rbp),%rdi
2b3a   53a11a:	e8 00 00 00 00       	call   53a11f <balance_leaf+0x2b3f>	53a11b: R_X86_64_PLT32	__asan_load8_noabort-0x4
2b3f   53a11f:	4c 8b a5 e8 00 00 00 	mov    0xe8(%rbp),%r12
2b46   53a126:	4d 85 e4             	test   %r12,%r12
2b49   53a129:	0f 84 29 2f 00 00    	je     53d058 <balance_leaf+0x5a78>
2b4f   53a12f:	49 89 ed             	mov    %rbp,%r13
2b52   53a132:	e8 00 00 00 00       	call   53a137 <balance_leaf+0x2b57>	53a133: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2b57   53a137:	48 8d bd c8 01 00 00 	lea    0x1c8(%rbp),%rdi
2b5e   53a13e:	e8 00 00 00 00       	call   53a143 <balance_leaf+0x2b63>	53a13f: R_X86_64_PLT32	__asan_load4_noabort-0x4
2b63   53a143:	48 63 ad c8 01 00 00 	movslq 0x1c8(%rbp),%rbp
2b6a   53a14a:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
2b6e   53a14e:	e8 00 00 00 00       	call   53a153 <balance_leaf+0x2b73>	53a14f: R_X86_64_PLT32	__asan_load8_noabort-0x4
2b73   53a153:	48 8b 43 28          	mov    0x28(%rbx),%rax
2b77   53a157:	48 c1 e5 04          	shl    $0x4,%rbp
2b7b   53a15b:	4c 8d 34 28          	lea    (%rax,%rbp,1),%r14
2b7f   53a15f:	49 83 c6 18          	add    $0x18,%r14
2b83   53a163:	49 8d bd dc 01 00 00 	lea    0x1dc(%r13),%rdi
2b8a   53a16a:	e8 00 00 00 00       	call   53a16f <balance_leaf+0x2b8f>	53a16b: R_X86_64_PLT32	__asan_load4_noabort-0x4
2b8f   53a16f:	49 63 9d dc 01 00 00 	movslq 0x1dc(%r13),%rbx
2b96   53a176:	49 8d 7c 24 28       	lea    0x28(%r12),%rdi
2b9b   53a17b:	e8 00 00 00 00       	call   53a180 <balance_leaf+0x2ba0>	53a17c: R_X86_64_PLT32	__asan_load8_noabort-0x4
2ba0   53a180:	49 8b 44 24 28       	mov    0x28(%r12),%rax
2ba5   53a185:	48 c1 e3 04          	shl    $0x4,%rbx
2ba9   53a189:	48 8d 34 18          	lea    (%rax,%rbx,1),%rsi
2bad   53a18d:	48 83 c6 18          	add    $0x18,%rsi
2bb1   53a191:	ba 10 00 00 00       	mov    $0x10,%edx
2bb6   53a196:	4c 89 f7             	mov    %r14,%rdi
2bb9   53a199:	e8 00 00 00 00       	call   53a19e <balance_leaf+0x2bbe>	53a19a: R_X86_64_PLT32	memcpy-0x4
2bbe   53a19e:	4c 89 ff             	mov    %r15,%rdi
2bc1   53a1a1:	e8 00 00 00 00       	call   53a1a6 <balance_leaf+0x2bc6>	53a1a2: R_X86_64_PLT32	__asan_load8_noabort-0x4
2bc6   53a1a6:	49 8b 9d c0 00 00 00 	mov    0xc0(%r13),%rbx
2bcd   53a1ad:	49 8d 7d 10          	lea    0x10(%r13),%rdi
2bd1   53a1b1:	e8 00 00 00 00       	call   53a1b6 <balance_leaf+0x2bd6>	53a1b2: R_X86_64_PLT32	__asan_load8_noabort-0x4
2bd6   53a1b6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
2bda   53a1ba:	48 89 de             	mov    %rbx,%rsi
2bdd   53a1bd:	e8 00 00 00 00       	call   53a1c2 <balance_leaf+0x2be2>	53a1be: R_X86_64_PLT32	journal_mark_dirty-0x4
2be2   53a1c2:	e9 5a 14 00 00       	jmp    53b621 <balance_leaf+0x4041>
2be7   53a1c7:	48 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%rax
2bef   53a1cf:	83 f8 70             	cmp    $0x70,%eax
2bf2   53a1d2:	75 07                	jne    53a1db <balance_leaf+0x2bfb>
2bf4   53a1d4:	e8 00 00 00 00       	call   53a1d9 <balance_leaf+0x2bf9>	53a1d5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2bf9   53a1d9:	eb 0e                	jmp    53a1e9 <balance_leaf+0x2c09>
2bfb   53a1db:	83 f8 69             	cmp    $0x69,%eax
2bfe   53a1de:	0f 85 73 36 00 00    	jne    53d857 <balance_leaf+0x6277>
2c04   53a1e4:	e8 00 00 00 00       	call   53a1e9 <balance_leaf+0x2c09>	53a1e5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2c09   53a1e9:	48 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%rax
2c11   53a1f1:	48 8d 48 16          	lea    0x16(%rax),%rcx
2c15   53a1f5:	48 89 8c 24 98 00 00 00 	mov    %rcx,0x98(%rsp)
2c1d   53a1fd:	48 8d 48 08          	lea    0x8(%rax),%rcx
2c21   53a201:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
2c26   53a206:	48 8d 48 12          	lea    0x12(%rax),%rcx
2c2a   53a20a:	48 89 8c 24 80 00 00 00 	mov    %rcx,0x80(%rsp)
2c32   53a212:	48 83 c0 0c          	add    $0xc,%rax
2c36   53a216:	48 89 84 24 e8 00 00 00 	mov    %rax,0xe8(%rsp)
2c3e   53a21e:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
2c43   53a223:	48 83 c0 10          	add    $0x10,%rax
2c47   53a227:	48 89 84 24 d8 00 00 00 	mov    %rax,0xd8(%rsp)
2c4f   53a22f:	41 83 c6 fe          	add    $0xfffffffe,%r14d
2c53   53a233:	45 89 f6             	mov    %r14d,%r14d
2c56   53a236:	48 8b 1c 24          	mov    (%rsp),%rbx
2c5a   53a23a:	4a 8d 3c b3          	lea    (%rbx,%r14,4),%rdi
2c5e   53a23e:	48 81 c7 40 02 00 00 	add    $0x240,%rdi
2c65   53a245:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
2c6a   53a24a:	e8 00 00 00 00       	call   53a24f <balance_leaf+0x2c6f>	53a24b: R_X86_64_PLT32	__asan_load4_noabort-0x4
2c6f   53a24f:	42 83 bc b3 40 02 00 00 00 	cmpl   $0x0,0x240(%rbx,%r14,4)
2c78   53a258:	0f 84 84 2a 00 00    	je     53cce2 <balance_leaf+0x5702>
2c7e   53a25e:	48 8b 2c 24          	mov    (%rsp),%rbp
2c82   53a262:	48 89 ef             	mov    %rbp,%rdi
2c85   53a265:	e8 00 00 00 00       	call   53a26a <balance_leaf+0x2c8a>	53a266: R_X86_64_PLT32	get_FEB-0x4
2c8a   53a26a:	48 89 c3             	mov    %rax,%rbx
2c8d   53a26d:	4a 8d 3c f5 30 02 00 00 	lea    0x230(,%r14,8),%rdi
2c95   53a275:	48 01 ef             	add    %rbp,%rdi
2c98   53a278:	48 89 7c 24 78       	mov    %rdi,0x78(%rsp)
2c9d   53a27d:	e8 00 00 00 00       	call   53a282 <balance_leaf+0x2ca2>	53a27e: R_X86_64_PLT32	__asan_store8_noabort-0x4
2ca2   53a282:	4c 89 74 24 40       	mov    %r14,0x40(%rsp)
2ca7   53a287:	4a 89 9c f5 30 02 00 00 	mov    %rbx,0x230(%rbp,%r14,8)
2caf   53a28f:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
2cb3   53a293:	e8 00 00 00 00       	call   53a298 <balance_leaf+0x2cb8>	53a294: R_X86_64_PLT32	__asan_load8_noabort-0x4
2cb8   53a298:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
2cbc   53a29c:	48 89 df             	mov    %rbx,%rdi
2cbf   53a29f:	e8 00 00 00 00       	call   53a2a4 <balance_leaf+0x2cc4>	53a2a0: R_X86_64_PLT32	__asan_store2_noabort-0x4
2cc4   53a2a4:	66 c7 03 01 00       	movw   $0x1,(%rbx)
2cc9   53a2a9:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
2cd1   53a2b1:	e8 00 00 00 00       	call   53a2b6 <balance_leaf+0x2cd6>	53a2b2: R_X86_64_PLT32	__asan_load8_noabort-0x4
2cd6   53a2b6:	48 8b 5d 18          	mov    0x18(%rbp),%rbx
2cda   53a2ba:	48 89 df             	mov    %rbx,%rdi
2cdd   53a2bd:	e8 00 00 00 00       	call   53a2c2 <balance_leaf+0x2ce2>	53a2be: R_X86_64_PLT32	__asan_load4_noabort-0x4
2ce2   53a2c2:	48 63 2b             	movslq (%rbx),%rbp
2ce5   53a2c5:	48 c1 e5 04          	shl    $0x4,%rbp
2ce9   53a2c9:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
2ced   53a2cd:	48 83 c7 08          	add    $0x8,%rdi
2cf1   53a2d1:	e8 00 00 00 00       	call   53a2d6 <balance_leaf+0x2cf6>	53a2d2: R_X86_64_PLT32	__asan_load8_noabort-0x4
2cf6   53a2d6:	48 8b 6c 2b 08       	mov    0x8(%rbx,%rbp,1),%rbp
2cfb   53a2db:	4c 8d 75 28          	lea    0x28(%rbp),%r14
2cff   53a2df:	4c 89 f7             	mov    %r14,%rdi
2d02   53a2e2:	e8 00 00 00 00       	call   53a2e7 <balance_leaf+0x2d07>	53a2e3: R_X86_64_PLT32	__asan_load8_noabort-0x4
2d07   53a2e7:	4c 8b 7d 28          	mov    0x28(%rbp),%r15
2d0b   53a2eb:	49 8d 7f 02          	lea    0x2(%r15),%rdi
2d0f   53a2ef:	e8 00 00 00 00       	call   53a2f4 <balance_leaf+0x2d14>	53a2f0: R_X86_64_PLT32	__asan_load2_noabort-0x4
2d14   53a2f4:	41 0f b7 6f 02       	movzwl 0x2(%r15),%ebp
2d19   53a2f9:	83 bc 24 d0 00 00 00 69 	cmpl   $0x69,0xd0(%rsp)
2d21   53a301:	89 6c 24 10          	mov    %ebp,0x10(%rsp)
2d25   53a305:	0f 85 48 01 00 00    	jne    53a453 <balance_leaf+0x2e73>
2d2b   53a30b:	ba 20 00 00 00       	mov    $0x20,%edx
2d30   53a310:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
2d35   53a315:	31 f6                	xor    %esi,%esi
2d37   53a317:	e8 00 00 00 00       	call   53a31c <balance_leaf+0x2d3c>	53a318: R_X86_64_PLT32	memset-0x4
2d3c   53a31c:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
2d41   53a321:	48 89 df             	mov    %rbx,%rdi
2d44   53a324:	e8 00 00 00 00       	call   53a329 <balance_leaf+0x2d49>	53a325: R_X86_64_PLT32	__asan_load4_noabort-0x4
2d49   53a329:	44 8b 2b             	mov    (%rbx),%r13d
2d4c   53a32c:	44 29 ed             	sub    %r13d,%ebp
2d4f   53a32f:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
2d54   53a334:	48 89 df             	mov    %rbx,%rdi
2d57   53a337:	e8 00 00 00 00       	call   53a33c <balance_leaf+0x2d5c>	53a338: R_X86_64_PLT32	__asan_load4_noabort-0x4
2d5c   53a33c:	8b 03                	mov    (%rbx),%eax
2d5e   53a33e:	39 c5                	cmp    %eax,%ebp
2d60   53a340:	0f 8d 88 01 00 00    	jge    53a4ce <balance_leaf+0x2eee>
2d66   53a346:	83 c5 01             	add    $0x1,%ebp
2d69   53a349:	39 e8                	cmp    %ebp,%eax
2d6b   53a34b:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
2d70   53a350:	0f 85 c2 02 00 00    	jne    53a618 <balance_leaf+0x3038>
2d76   53a356:	48 8b 1c 24          	mov    (%rsp),%rbx
2d7a   53a35a:	4e 8d 3c b3          	lea    (%rbx,%r14,4),%r15
2d7e   53a35e:	49 81 c7 48 02 00 00 	add    $0x248,%r15
2d85   53a365:	4c 89 ff             	mov    %r15,%rdi
2d88   53a368:	e8 00 00 00 00       	call   53a36d <balance_leaf+0x2d8d>	53a369: R_X86_64_PLT32	__asan_load4_noabort-0x4
2d8d   53a36d:	42 83 bc b3 48 02 00 00 ff 	cmpl   $0xffffffff,0x248(%rbx,%r14,4)
2d96   53a376:	0f 84 ad 02 00 00    	je     53a629 <balance_leaf+0x3049>
2d9c   53a37c:	41 83 c5 ff          	add    $0xffffffff,%r13d
2da0   53a380:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
2da5   53a385:	48 89 df             	mov    %rbx,%rdi
2da8   53a388:	e8 00 00 00 00       	call   53a38d <balance_leaf+0x2dad>	53a389: R_X86_64_PLT32	__asan_load8_noabort-0x4
2dad   53a38d:	4c 8b 03             	mov    (%rbx),%r8
2db0   53a390:	bf 04 00 00 00       	mov    $0x4,%edi
2db5   53a395:	48 8b 34 24          	mov    (%rsp),%rsi
2db9   53a399:	44 89 ea             	mov    %r13d,%edx
2dbc   53a39c:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
2dc1   53a3a1:	e8 00 00 00 00       	call   53a3a6 <balance_leaf+0x2dc6>	53a3a2: R_X86_64_PLT32	leaf_move_items-0x4
2dc6   53a3a6:	be 02 00 00 00       	mov    $0x2,%esi
2dcb   53a3ab:	48 8b 9c 24 98 00 00 00 	mov    0x98(%rsp),%rbx
2dd3   53a3b3:	48 89 df             	mov    %rbx,%rdi
2dd6   53a3b6:	e8 00 00 00 00       	call   53a3bb <balance_leaf+0x2ddb>	53a3b7: R_X86_64_PLT32	__asan_loadN_noabort-0x4
2ddb   53a3bb:	66 83 3b 00          	cmpw   $0x0,(%rbx)
2ddf   53a3bf:	4c 89 7c 24 50       	mov    %r15,0x50(%rsp)
2de4   53a3c4:	0f 84 8f 07 00 00    	je     53ab59 <balance_leaf+0x3579>
2dea   53a3ca:	be 08 00 00 00       	mov    $0x8,%esi
2def   53a3cf:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
2df4   53a3d4:	48 89 df             	mov    %rbx,%rdi
2df7   53a3d7:	e8 00 00 00 00       	call   53a3dc <balance_leaf+0x2dfc>	53a3d8: R_X86_64_PLT32	__asan_loadN_noabort-0x4
2dfc   53a3dc:	4c 8b 33             	mov    (%rbx),%r14
2dff   53a3df:	49 bf 00 00 00 00 00 00 00 10 	movabs $0x1000000000000000,%r15
2e09   53a3e9:	4d 8d 67 ff          	lea    -0x1(%r15),%r12
2e0d   53a3ed:	4d 89 f5             	mov    %r14,%r13
2e10   53a3f0:	48 b8 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rax
2e1a   53a3fa:	49 21 c6             	and    %rax,%r14
2e1d   53a3fd:	be 02 00 00 00       	mov    $0x2,%esi
2e22   53a402:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
2e2a   53a40a:	48 89 df             	mov    %rbx,%rdi
2e2d   53a40d:	e8 00 00 00 00       	call   53a412 <balance_leaf+0x2e32>	53a40e: R_X86_64_PLT32	__asan_loadN_noabort-0x4
2e32   53a412:	0f b7 2b             	movzwl (%rbx),%ebp
2e35   53a415:	4c 89 b4 24 a8 00 00 00 	mov    %r14,0xa8(%rsp)
2e3d   53a41d:	4d 39 fe             	cmp    %r15,%r14
2e40   53a420:	0f 85 ce 09 00 00    	jne    53adf4 <balance_leaf+0x3814>
2e46   53a426:	e8 00 00 00 00       	call   53a42b <balance_leaf+0x2e4b>	53a427: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2e4b   53a42b:	48 8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%rbx
2e53   53a433:	48 89 df             	mov    %rbx,%rdi
2e56   53a436:	e8 00 00 00 00       	call   53a43b <balance_leaf+0x2e5b>	53a437: R_X86_64_PLT32	__asan_load8_noabort-0x4
2e5b   53a43b:	48 8b 1b             	mov    (%rbx),%rbx
2e5e   53a43e:	48 8d 7b 14          	lea    0x14(%rbx),%rdi
2e62   53a442:	e8 00 00 00 00       	call   53a447 <balance_leaf+0x2e67>	53a443: R_X86_64_PLT32	__asan_load1_noabort-0x4
2e67   53a447:	0f b6 5b 14          	movzbl 0x14(%rbx),%ebx
2e6b   53a44b:	83 c3 fe             	add    $0xfffffffe,%ebx
2e6e   53a44e:	e9 a8 09 00 00       	jmp    53adfb <balance_leaf+0x381b>
2e73   53a453:	41 89 ed             	mov    %ebp,%r13d
2e76   53a456:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
2e7b   53a45b:	48 89 ef             	mov    %rbp,%rdi
2e7e   53a45e:	e8 00 00 00 00       	call   53a463 <balance_leaf+0x2e83>	53a45f: R_X86_64_PLT32	__asan_load4_noabort-0x4
2e83   53a463:	44 8b 65 00          	mov    0x0(%rbp),%r12d
2e87   53a467:	45 29 e5             	sub    %r12d,%r13d
2e8a   53a46a:	48 8b 6c 24 70       	mov    0x70(%rsp),%rbp
2e8f   53a46f:	48 89 ef             	mov    %rbp,%rdi
2e92   53a472:	e8 00 00 00 00       	call   53a477 <balance_leaf+0x2e97>	53a473: R_X86_64_PLT32	__asan_load4_noabort-0x4
2e97   53a477:	48 63 6d 00          	movslq 0x0(%rbp),%rbp
2e9b   53a47b:	41 39 ed             	cmp    %ebp,%r13d
2e9e   53a47e:	0f 8e a1 00 00 00    	jle    53a525 <balance_leaf+0x2f45>
2ea4   53a484:	e8 00 00 00 00       	call   53a489 <balance_leaf+0x2ea9>	53a485: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2ea9   53a489:	48 8b 2c 24          	mov    (%rsp),%rbp
2ead   53a48d:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
2eb2   53a492:	4a 8d 3c b5 48 02 00 00 	lea    0x248(,%r14,4),%rdi
2eba   53a49a:	48 01 ef             	add    %rbp,%rdi
2ebd   53a49d:	e8 00 00 00 00       	call   53a4a2 <balance_leaf+0x2ec2>	53a49e: R_X86_64_PLT32	__asan_load4_noabort-0x4
2ec2   53a4a2:	42 8b 9c b5 48 02 00 00 	mov    0x248(%rbp,%r14,4),%ebx
2eca   53a4aa:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
2ecf   53a4af:	4c 89 ff             	mov    %r15,%rdi
2ed2   53a4b2:	e8 00 00 00 00       	call   53a4b7 <balance_leaf+0x2ed7>	53a4b3: R_X86_64_PLT32	__asan_load8_noabort-0x4
2ed7   53a4b7:	4e 8b 84 f5 30 02 00 00 	mov    0x230(%rbp,%r14,8),%r8
2edf   53a4bf:	bf 04 00 00 00       	mov    $0x4,%edi
2ee4   53a4c4:	48 89 ee             	mov    %rbp,%rsi
2ee7   53a4c7:	44 89 e2             	mov    %r12d,%edx
2eea   53a4ca:	89 d9                	mov    %ebx,%ecx
2eec   53a4cc:	eb 48                	jmp    53a516 <balance_leaf+0x2f36>
2eee   53a4ce:	e8 00 00 00 00       	call   53a4d3 <balance_leaf+0x2ef3>	53a4cf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2ef3   53a4d3:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
2ef8   53a4d8:	48 8b 1c 24          	mov    (%rsp),%rbx
2efc   53a4dc:	4a 8d 3c b3          	lea    (%rbx,%r14,4),%rdi
2f00   53a4e0:	48 81 c7 48 02 00 00 	add    $0x248,%rdi
2f07   53a4e7:	e8 00 00 00 00       	call   53a4ec <balance_leaf+0x2f0c>	53a4e8: R_X86_64_PLT32	__asan_load4_noabort-0x4
2f0c   53a4ec:	42 8b ac b3 48 02 00 00 	mov    0x248(%rbx,%r14,4),%ebp
2f14   53a4f4:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
2f19   53a4f9:	4c 89 ff             	mov    %r15,%rdi
2f1c   53a4fc:	e8 00 00 00 00       	call   53a501 <balance_leaf+0x2f21>	53a4fd: R_X86_64_PLT32	__asan_load8_noabort-0x4
2f21   53a501:	4e 8b 84 f3 30 02 00 00 	mov    0x230(%rbx,%r14,8),%r8
2f29   53a509:	bf 04 00 00 00       	mov    $0x4,%edi
2f2e   53a50e:	48 89 de             	mov    %rbx,%rsi
2f31   53a511:	44 89 ea             	mov    %r13d,%edx
2f34   53a514:	89 e9                	mov    %ebp,%ecx
2f36   53a516:	e8 00 00 00 00       	call   53a51b <balance_leaf+0x2f3b>	53a517: R_X86_64_PLT32	leaf_move_items-0x4
2f3b   53a51b:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
2f40   53a520:	e9 50 0e 00 00       	jmp    53b375 <balance_leaf+0x3d95>
2f45   53a525:	44 89 64 24 50       	mov    %r12d,0x50(%rsp)
2f4a   53a52a:	44 39 ed             	cmp    %r13d,%ebp
2f4d   53a52d:	0f 85 ec 00 00 00    	jne    53a61f <balance_leaf+0x303f>
2f53   53a533:	4c 8b 64 24 40       	mov    0x40(%rsp),%r12
2f58   53a538:	48 8b 04 24          	mov    (%rsp),%rax
2f5c   53a53c:	4a 8d 3c a0          	lea    (%rax,%r12,4),%rdi
2f60   53a540:	48 81 c7 48 02 00 00 	add    $0x248,%rdi
2f67   53a547:	48 89 bc 24 a8 00 00 00 	mov    %rdi,0xa8(%rsp)
2f6f   53a54f:	e8 00 00 00 00       	call   53a554 <balance_leaf+0x2f74>	53a550: R_X86_64_PLT32	__asan_load4_noabort-0x4
2f74   53a554:	48 8b 04 24          	mov    (%rsp),%rax
2f78   53a558:	46 8b a4 a0 48 02 00 00 	mov    0x248(%rax,%r12,4),%r12d
2f80   53a560:	41 83 fc ff          	cmp    $0xffffffff,%r12d
2f84   53a564:	0f 84 f9 01 00 00    	je     53a763 <balance_leaf+0x3183>
2f8a   53a56a:	4c 89 f7             	mov    %r14,%rdi
2f8d   53a56d:	e8 00 00 00 00       	call   53a572 <balance_leaf+0x2f92>	53a56e: R_X86_64_PLT32	__asan_load8_noabort-0x4
2f92   53a572:	49 8b 2e             	mov    (%r14),%rbp
2f95   53a575:	48 8d bc 24 c8 00 00 00 	lea    0xc8(%rsp),%rdi
2f9d   53a57d:	e8 00 00 00 00       	call   53a582 <balance_leaf+0x2fa2>	53a57e: R_X86_64_PLT32	__asan_store8_noabort-0x4
2fa2   53a582:	48 c7 84 24 c8 00 00 00 00 00 00 00 	movq   $0x0,0xc8(%rsp)
2fae   53a58e:	48 83 bc 24 a0 00 00 00 00 	cmpq   $0x0,0xa0(%rsp)
2fb7   53a597:	0f 85 a7 28 00 00    	jne    53ce44 <balance_leaf+0x5864>
2fbd   53a59d:	48 83 c5 18          	add    $0x18,%rbp
2fc1   53a5a1:	49 63 c5             	movslq %r13d,%rax
2fc4   53a5a4:	4c 8d 34 40          	lea    (%rax,%rax,2),%r14
2fc8   53a5a8:	4a 8d 3c f5 16 00 00 00 	lea    0x16(,%r14,8),%rdi
2fd0   53a5b0:	48 01 ef             	add    %rbp,%rdi
2fd3   53a5b3:	be 02 00 00 00       	mov    $0x2,%esi
2fd8   53a5b8:	e8 00 00 00 00       	call   53a5bd <balance_leaf+0x2fdd>	53a5b9: R_X86_64_PLT32	__asan_loadN_noabort-0x4
2fdd   53a5bd:	66 42 83 7c f5 16 00 	cmpw   $0x0,0x16(%rbp,%r14,8)
2fe4   53a5c4:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
2fe9   53a5c9:	0f 84 03 06 00 00    	je     53abd2 <balance_leaf+0x35f2>
2fef   53a5cf:	4a 8d 3c f5 08 00 00 00 	lea    0x8(,%r14,8),%rdi
2ff7   53a5d7:	48 01 ef             	add    %rbp,%rdi
2ffa   53a5da:	be 08 00 00 00       	mov    $0x8,%esi
2fff   53a5df:	e8 00 00 00 00       	call   53a5e4 <balance_leaf+0x3004>	53a5e0: R_X86_64_PLT32	__asan_loadN_noabort-0x4
3004   53a5e4:	4a 8b 44 f5 08       	mov    0x8(%rbp,%r14,8),%rax
3009   53a5e9:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
3013   53a5f3:	48 21 c8             	and    %rcx,%rax
3016   53a5f6:	48 b9 00 00 00 00 00 00 00 30 	movabs $0x3000000000000000,%rcx
3020   53a600:	48 39 c8             	cmp    %rcx,%rax
3023   53a603:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
3028   53a608:	0f 85 5f 08 00 00    	jne    53ae6d <balance_leaf+0x388d>
302e   53a60e:	e8 00 00 00 00       	call   53a613 <balance_leaf+0x3033>	53a60f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3033   53a613:	e9 e8 05 00 00       	jmp    53ac00 <balance_leaf+0x3620>
3038   53a618:	e8 00 00 00 00       	call   53a61d <balance_leaf+0x303d>	53a619: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
303d   53a61d:	eb 0f                	jmp    53a62e <balance_leaf+0x304e>
303f   53a61f:	e8 00 00 00 00       	call   53a624 <balance_leaf+0x3044>	53a620: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3044   53a624:	e9 3f 01 00 00       	jmp    53a768 <balance_leaf+0x3188>
3049   53a629:	e8 00 00 00 00       	call   53a62e <balance_leaf+0x304e>	53a62a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
304e   53a62e:	41 83 c5 ff          	add    $0xffffffff,%r13d
3052   53a632:	4c 8b 24 24          	mov    (%rsp),%r12
3056   53a636:	4b 8d 3c b4          	lea    (%r12,%r14,4),%rdi
305a   53a63a:	48 81 c7 48 02 00 00 	add    $0x248,%rdi
3061   53a641:	e8 00 00 00 00       	call   53a646 <balance_leaf+0x3066>	53a642: R_X86_64_PLT32	__asan_load4_noabort-0x4
3066   53a646:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
306b   53a64b:	45 8b b4 84 48 02 00 00 	mov    0x248(%r12,%rax,4),%r14d
3073   53a653:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
3078   53a658:	4c 89 ff             	mov    %r15,%rdi
307b   53a65b:	e8 00 00 00 00       	call   53a660 <balance_leaf+0x3080>	53a65c: R_X86_64_PLT32	__asan_load8_noabort-0x4
3080   53a660:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
3085   53a665:	4d 8b 84 c4 30 02 00 00 	mov    0x230(%r12,%rax,8),%r8
308d   53a66d:	bf 04 00 00 00       	mov    $0x4,%edi
3092   53a672:	4c 89 e6             	mov    %r12,%rsi
3095   53a675:	44 89 ea             	mov    %r13d,%edx
3098   53a678:	44 89 f1             	mov    %r14d,%ecx
309b   53a67b:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
30a0   53a680:	e8 00 00 00 00       	call   53a685 <balance_leaf+0x30a5>	53a681: R_X86_64_PLT32	leaf_move_items-0x4
30a5   53a685:	4c 89 ff             	mov    %r15,%rdi
30a8   53a688:	e8 00 00 00 00       	call   53a68d <balance_leaf+0x30ad>	53a689: R_X86_64_PLT32	__asan_load8_noabort-0x4
30ad   53a68d:	4b 8b 9c f4 30 02 00 00 	mov    0x230(%r12,%r14,8),%rbx
30b5   53a695:	4c 8d 6c 24 20       	lea    0x20(%rsp),%r13
30ba   53a69a:	4c 89 ef             	mov    %r13,%rdi
30bd   53a69d:	e8 00 00 00 00       	call   53a6a2 <balance_leaf+0x30c2>	53a69e: R_X86_64_PLT32	__asan_store8_noabort-0x4
30c2   53a6a2:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
30c7   53a6a7:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
30cc   53a6ac:	e8 00 00 00 00       	call   53a6b1 <balance_leaf+0x30d1>	53a6ad: R_X86_64_PLT32	__asan_store8_noabort-0x4
30d1   53a6b1:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
30d6   53a6b6:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
30db   53a6bb:	e8 00 00 00 00       	call   53a6c0 <balance_leaf+0x30e0>	53a6bc: R_X86_64_PLT32	__asan_store8_noabort-0x4
30e0   53a6c0:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)
30e9   53a6c9:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
30ee   53a6ce:	e8 00 00 00 00       	call   53a6d3 <balance_leaf+0x30f3>	53a6cf: R_X86_64_PLT32	__asan_store4_noabort-0x4
30f3   53a6d3:	c7 44 24 38 00 00 00 00 	movl   $0x0,0x38(%rsp)
30fb   53a6db:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
3100   53a6e0:	e8 00 00 00 00       	call   53a6e5 <balance_leaf+0x3105>	53a6e1: R_X86_64_PLT32	__asan_load4_noabort-0x4
3105   53a6e5:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
3109   53a6e9:	f7 d5                	not    %ebp
310b   53a6eb:	41 03 ac 24 28 02 00 00 	add    0x228(%r12),%ebp
3113   53a6f3:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
3118   53a6f8:	e8 00 00 00 00       	call   53a6fd <balance_leaf+0x311d>	53a6f9: R_X86_64_PLT32	__asan_load4_noabort-0x4
311d   53a6fd:	43 03 ac b4 40 02 00 00 	add    0x240(%r12,%r14,4),%ebp
3125   53a705:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
312a   53a70a:	48 89 df             	mov    %rbx,%rdi
312d   53a70d:	e8 00 00 00 00       	call   53a712 <balance_leaf+0x3132>	53a70e: R_X86_64_PLT32	__asan_load4_noabort-0x4
3132   53a712:	45 8b 84 24 54 02 00 00 	mov    0x254(%r12),%r8d
313a   53a71a:	4c 89 ef             	mov    %r13,%rdi
313d   53a71d:	89 ee                	mov    %ebp,%esi
313f   53a71f:	48 8b 94 24 a0 00 00 00 	mov    0xa0(%rsp),%rdx
3147   53a727:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
314c   53a72c:	e8 00 00 00 00       	call   53a731 <balance_leaf+0x3151>	53a72d: R_X86_64_PLT32	leaf_insert_into_buf-0x4
3151   53a731:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
3156   53a736:	4c 89 ef             	mov    %r13,%rdi
3159   53a739:	e8 00 00 00 00       	call   53a73e <balance_leaf+0x315e>	53a73a: R_X86_64_PLT32	__asan_store4_noabort-0x4
315e   53a73e:	41 c7 84 24 f0 01 00 00 00 00 00 00 	movl   $0x0,0x1f0(%r12)
316a   53a74a:	48 89 df             	mov    %rbx,%rdi
316d   53a74d:	e8 00 00 00 00       	call   53a752 <balance_leaf+0x3172>	53a74e: R_X86_64_PLT32	__asan_store4_noabort-0x4
3172   53a752:	41 c7 84 24 54 02 00 00 00 00 00 00 	movl   $0x0,0x254(%r12)
317e   53a75e:	e9 12 0c 00 00       	jmp    53b375 <balance_leaf+0x3d95>
3183   53a763:	e8 00 00 00 00       	call   53a768 <balance_leaf+0x3188>	53a764: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3188   53a768:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
318d   53a76d:	e8 00 00 00 00       	call   53a772 <balance_leaf+0x3192>	53a76e: R_X86_64_PLT32	__asan_store8_noabort-0x4
3192   53a772:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)
319b   53a77b:	4d 8d 77 18          	lea    0x18(%r15),%r14
319f   53a77f:	48 8d 1c 6d 00 00 00 00 	lea    0x0(,%rbp,2),%rbx
31a7   53a787:	48 01 eb             	add    %rbp,%rbx
31aa   53a78a:	49 8d 3c df          	lea    (%r15,%rbx,8),%rdi
31ae   53a78e:	48 83 c7 2e          	add    $0x2e,%rdi
31b2   53a792:	be 02 00 00 00       	mov    $0x2,%esi
31b7   53a797:	e8 00 00 00 00       	call   53a79c <balance_leaf+0x31bc>	53a798: R_X86_64_PLT32	__asan_loadN_noabort-0x4
31bc   53a79c:	66 41 83 7c df 2e 00 	cmpw   $0x0,0x2e(%r15,%rbx,8)
31c3   53a7a3:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
31c8   53a7a8:	74 3e                	je     53a7e8 <balance_leaf+0x3208>
31ca   53a7aa:	49 8d 3c de          	lea    (%r14,%rbx,8),%rdi
31ce   53a7ae:	48 83 c7 08          	add    $0x8,%rdi
31d2   53a7b2:	be 08 00 00 00       	mov    $0x8,%esi
31d7   53a7b7:	e8 00 00 00 00       	call   53a7bc <balance_leaf+0x31dc>	53a7b8: R_X86_64_PLT32	__asan_loadN_noabort-0x4
31dc   53a7bc:	49 8b 44 de 08       	mov    0x8(%r14,%rbx,8),%rax
31e1   53a7c1:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
31eb   53a7cb:	48 21 c8             	and    %rcx,%rax
31ee   53a7ce:	48 b9 00 00 00 00 00 00 00 30 	movabs $0x3000000000000000,%rcx
31f8   53a7d8:	48 39 c8             	cmp    %rcx,%rax
31fb   53a7db:	4c 8b 24 24          	mov    (%rsp),%r12
31ff   53a7df:	75 34                	jne    53a815 <balance_leaf+0x3235>
3201   53a7e1:	e8 00 00 00 00       	call   53a7e6 <balance_leaf+0x3206>	53a7e2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3206   53a7e6:	eb 26                	jmp    53a80e <balance_leaf+0x322e>
3208   53a7e8:	49 8d 3c de          	lea    (%r14,%rbx,8),%rdi
320c   53a7ec:	48 83 c7 0c          	add    $0xc,%rdi
3210   53a7f0:	be 04 00 00 00       	mov    $0x4,%esi
3215   53a7f5:	e8 00 00 00 00       	call   53a7fa <balance_leaf+0x321a>	53a7f6: R_X86_64_PLT32	__asan_loadN_noabort-0x4
321a   53a7fa:	41 81 7c de 0c f4 01 00 00 	cmpl   $0x1f4,0xc(%r14,%rbx,8)
3223   53a803:	4c 8b 24 24          	mov    (%rsp),%r12
3227   53a807:	75 13                	jne    53a81c <balance_leaf+0x323c>
3229   53a809:	e8 00 00 00 00       	call   53a80e <balance_leaf+0x322e>	53a80a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
322e   53a80e:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
3233   53a813:	eb 58                	jmp    53a86d <balance_leaf+0x328d>
3235   53a815:	e8 00 00 00 00       	call   53a81a <balance_leaf+0x323a>	53a816: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
323a   53a81a:	eb 05                	jmp    53a821 <balance_leaf+0x3241>
323c   53a81c:	e8 00 00 00 00       	call   53a821 <balance_leaf+0x3241>	53a81d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3241   53a821:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
3246   53a826:	48 89 ef             	mov    %rbp,%rdi
3249   53a829:	e8 00 00 00 00       	call   53a82e <balance_leaf+0x324e>	53a82a: R_X86_64_PLT32	__asan_load4_noabort-0x4
324e   53a82e:	8b 6d 00             	mov    0x0(%rbp),%ebp
3251   53a831:	49 8d 3c de          	lea    (%r14,%rbx,8),%rdi
3255   53a835:	48 83 c7 12          	add    $0x12,%rdi
3259   53a839:	be 02 00 00 00       	mov    $0x2,%esi
325e   53a83e:	e8 00 00 00 00       	call   53a843 <balance_leaf+0x3263>	53a83f: R_X86_64_PLT32	__asan_loadN_noabort-0x4
3263   53a843:	41 0f b7 44 de 12    	movzwl 0x12(%r14,%rbx,8),%eax
3269   53a849:	39 c5                	cmp    %eax,%ebp
326b   53a84b:	0f 85 b2 25 00 00    	jne    53ce03 <balance_leaf+0x5823>
3271   53a851:	4c 89 ff             	mov    %r15,%rdi
3274   53a854:	e8 00 00 00 00       	call   53a859 <balance_leaf+0x3279>	53a855: R_X86_64_PLT32	__asan_load4_noabort-0x4
3279   53a859:	41 83 3f 00          	cmpl   $0x0,(%r15)
327d   53a85d:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
3282   53a862:	0f 8e a2 25 00 00    	jle    53ce0a <balance_leaf+0x582a>
3288   53a868:	e8 00 00 00 00       	call   53a86d <balance_leaf+0x328d>	53a869: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
328d   53a86d:	49 8d 3c ac          	lea    (%r12,%rbp,4),%rdi
3291   53a871:	48 81 c7 48 02 00 00 	add    $0x248,%rdi
3298   53a878:	e8 00 00 00 00       	call   53a87d <balance_leaf+0x329d>	53a879: R_X86_64_PLT32	__asan_load4_noabort-0x4
329d   53a87d:	41 8b 9c ac 48 02 00 00 	mov    0x248(%r12,%rbp,4),%ebx
32a5   53a885:	4c 8b 6c 24 78       	mov    0x78(%rsp),%r13
32aa   53a88a:	4c 89 ef             	mov    %r13,%rdi
32ad   53a88d:	e8 00 00 00 00       	call   53a892 <balance_leaf+0x32b2>	53a88e: R_X86_64_PLT32	__asan_load8_noabort-0x4
32b2   53a892:	4d 8b 84 ec 30 02 00 00 	mov    0x230(%r12,%rbp,8),%r8
32ba   53a89a:	bf 04 00 00 00       	mov    $0x4,%edi
32bf   53a89f:	4c 89 e6             	mov    %r12,%rsi
32c2   53a8a2:	8b 54 24 50          	mov    0x50(%rsp),%edx
32c6   53a8a6:	89 d9                	mov    %ebx,%ecx
32c8   53a8a8:	e8 00 00 00 00       	call   53a8ad <balance_leaf+0x32cd>	53a8a9: R_X86_64_PLT32	leaf_move_items-0x4
32cd   53a8ad:	85 c0                	test   %eax,%eax
32cf   53a8af:	0f 85 ba 24 00 00    	jne    53cd6f <balance_leaf+0x578f>
32d5   53a8b5:	4c 89 ef             	mov    %r13,%rdi
32d8   53a8b8:	e8 00 00 00 00       	call   53a8bd <balance_leaf+0x32dd>	53a8b9: R_X86_64_PLT32	__asan_load8_noabort-0x4
32dd   53a8bd:	49 8b 5d 00          	mov    0x0(%r13),%rbx
32e1   53a8c1:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
32e6   53a8c6:	e8 00 00 00 00       	call   53a8cb <balance_leaf+0x32eb>	53a8c7: R_X86_64_PLT32	__asan_store8_noabort-0x4
32eb   53a8cb:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
32f0   53a8d0:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
32f5   53a8d5:	e8 00 00 00 00       	call   53a8da <balance_leaf+0x32fa>	53a8d6: R_X86_64_PLT32	__asan_store8_noabort-0x4
32fa   53a8da:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
32ff   53a8df:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
3304   53a8e4:	e8 00 00 00 00       	call   53a8e9 <balance_leaf+0x3309>	53a8e5: R_X86_64_PLT32	__asan_store8_noabort-0x4
3309   53a8e9:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)
3312   53a8f2:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
3317   53a8f7:	e8 00 00 00 00       	call   53a8fc <balance_leaf+0x331c>	53a8f8: R_X86_64_PLT32	__asan_load4_noabort-0x4
331c   53a8fc:	41 8b 9c 24 28 02 00 00 	mov    0x228(%r12),%ebx
3324   53a904:	2b 5c 24 10          	sub    0x10(%rsp),%ebx
3328   53a908:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
332d   53a90d:	4c 89 f7             	mov    %r14,%rdi
3330   53a910:	e8 00 00 00 00       	call   53a915 <balance_leaf+0x3335>	53a911: R_X86_64_PLT32	__asan_load4_noabort-0x4
3335   53a915:	41 03 1e             	add    (%r14),%ebx
3338   53a918:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
333d   53a91d:	e8 00 00 00 00       	call   53a922 <balance_leaf+0x3342>	53a91e: R_X86_64_PLT32	__asan_load4_noabort-0x4
3342   53a922:	41 8b ac 24 50 02 00 00 	mov    0x250(%r12),%ebp
334a   53a92a:	4c 89 ff             	mov    %r15,%rdi
334d   53a92d:	e8 00 00 00 00       	call   53a932 <balance_leaf+0x3352>	53a92e: R_X86_64_PLT32	__asan_load4_noabort-0x4
3352   53a932:	45 8b bc 24 f0 01 00 00 	mov    0x1f0(%r12),%r15d
335a   53a93a:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
335f   53a93f:	e8 00 00 00 00       	call   53a944 <balance_leaf+0x3364>	53a940: R_X86_64_PLT32	__asan_load4_noabort-0x4
3364   53a944:	45 8b 8c 24 54 02 00 00 	mov    0x254(%r12),%r9d
336c   53a94c:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
3371   53a951:	89 de                	mov    %ebx,%esi
3373   53a953:	89 ea                	mov    %ebp,%edx
3375   53a955:	44 89 f9             	mov    %r15d,%ecx
3378   53a958:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
337d   53a95d:	e8 00 00 00 00       	call   53a962 <balance_leaf+0x3382>	53a95e: R_X86_64_PLT32	leaf_paste_in_buffer-0x4
3382   53a962:	4c 89 ef             	mov    %r13,%rdi
3385   53a965:	e8 00 00 00 00       	call   53a96a <balance_leaf+0x338a>	53a966: R_X86_64_PLT32	__asan_load8_noabort-0x4
338a   53a96a:	49 8b 6d 00          	mov    0x0(%r13),%rbp
338e   53a96e:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
3393   53a973:	e8 00 00 00 00       	call   53a978 <balance_leaf+0x3398>	53a974: R_X86_64_PLT32	__asan_load4_noabort-0x4
3398   53a978:	41 8b 9c 24 28 02 00 00 	mov    0x228(%r12),%ebx
33a0   53a980:	2b 5c 24 10          	sub    0x10(%rsp),%ebx
33a4   53a984:	4c 89 f7             	mov    %r14,%rdi
33a7   53a987:	e8 00 00 00 00       	call   53a98c <balance_leaf+0x33ac>	53a988: R_X86_64_PLT32	__asan_load4_noabort-0x4
33ac   53a98c:	41 03 1e             	add    (%r14),%ebx
33af   53a98f:	48 8d 7d 28          	lea    0x28(%rbp),%rdi
33b3   53a993:	e8 00 00 00 00       	call   53a998 <balance_leaf+0x33b8>	53a994: R_X86_64_PLT32	__asan_load8_noabort-0x4
33b8   53a998:	48 8b 6d 28          	mov    0x28(%rbp),%rbp
33bc   53a99c:	4c 8d 6d 18          	lea    0x18(%rbp),%r13
33c0   53a9a0:	48 63 c3             	movslq %ebx,%rax
33c3   53a9a3:	4c 8d 24 40          	lea    (%rax,%rax,2),%r12
33c7   53a9a7:	4e 8d 3c e5 2e 00 00 00 	lea    0x2e(,%r12,8),%r15
33cf   53a9af:	49 01 ef             	add    %rbp,%r15
33d2   53a9b2:	be 02 00 00 00       	mov    $0x2,%esi
33d7   53a9b7:	4c 89 ff             	mov    %r15,%rdi
33da   53a9ba:	e8 00 00 00 00       	call   53a9bf <balance_leaf+0x33df>	53a9bb: R_X86_64_PLT32	__asan_loadN_noabort-0x4
33df   53a9bf:	66 42 83 7c e5 2e 00 	cmpw   $0x0,0x2e(%rbp,%r12,8)
33e6   53a9c6:	74 3d                	je     53aa05 <balance_leaf+0x3425>
33e8   53a9c8:	4a 8d 3c e5 08 00 00 00 	lea    0x8(,%r12,8),%rdi
33f0   53a9d0:	4c 01 ef             	add    %r13,%rdi
33f3   53a9d3:	be 08 00 00 00       	mov    $0x8,%esi
33f8   53a9d8:	e8 00 00 00 00       	call   53a9dd <balance_leaf+0x33fd>	53a9d9: R_X86_64_PLT32	__asan_loadN_noabort-0x4
33fd   53a9dd:	4b 8b 44 e5 08       	mov    0x8(%r13,%r12,8),%rax
3402   53a9e2:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
340c   53a9ec:	48 21 c8             	and    %rcx,%rax
340f   53a9ef:	48 b9 00 00 00 00 00 00 00 30 	movabs $0x3000000000000000,%rcx
3419   53a9f9:	48 39 c8             	cmp    %rcx,%rax
341c   53a9fc:	75 75                	jne    53aa73 <balance_leaf+0x3493>
341e   53a9fe:	e8 00 00 00 00       	call   53aa03 <balance_leaf+0x3423>	53a9ff: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3423   53aa03:	eb 25                	jmp    53aa2a <balance_leaf+0x344a>
3425   53aa05:	4a 8d 3c e5 0c 00 00 00 	lea    0xc(,%r12,8),%rdi
342d   53aa0d:	4c 01 ef             	add    %r13,%rdi
3430   53aa10:	be 04 00 00 00       	mov    $0x4,%esi
3435   53aa15:	e8 00 00 00 00       	call   53aa1a <balance_leaf+0x343a>	53aa16: R_X86_64_PLT32	__asan_loadN_noabort-0x4
343a   53aa1a:	43 81 7c e5 0c f4 01 00 00 	cmpl   $0x1f4,0xc(%r13,%r12,8)
3443   53aa23:	75 55                	jne    53aa7a <balance_leaf+0x349a>
3445   53aa25:	e8 00 00 00 00       	call   53aa2a <balance_leaf+0x344a>	53aa26: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
344a   53aa2a:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
344f   53aa2f:	48 89 ef             	mov    %rbp,%rdi
3452   53aa32:	e8 00 00 00 00       	call   53aa37 <balance_leaf+0x3457>	53aa33: R_X86_64_PLT32	__asan_load4_noabort-0x4
3457   53aa37:	44 8b 75 00          	mov    0x0(%rbp),%r14d
345b   53aa3b:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
3460   53aa40:	48 89 ef             	mov    %rbp,%rdi
3463   53aa43:	e8 00 00 00 00       	call   53aa48 <balance_leaf+0x3468>	53aa44: R_X86_64_PLT32	__asan_load4_noabort-0x4
3468   53aa48:	8b 45 00             	mov    0x0(%rbp),%eax
346b   53aa4b:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
3470   53aa50:	89 de                	mov    %ebx,%esi
3472   53aa52:	44 89 f2             	mov    %r14d,%edx
3475   53aa55:	b9 01 00 00 00       	mov    $0x1,%ecx
347a   53aa5a:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
347f   53aa5f:	4c 8b 8c 24 d8 00 00 00 	mov    0xd8(%rsp),%r9
3487   53aa67:	50                   	push   %rax
3488   53aa68:	e8 00 00 00 00       	call   53aa6d <balance_leaf+0x348d>	53aa69: R_X86_64_PLT32	leaf_paste_entries-0x4
348d   53aa6d:	48 83 c4 08          	add    $0x8,%rsp
3491   53aa71:	eb 0c                	jmp    53aa7f <balance_leaf+0x349f>
3493   53aa73:	e8 00 00 00 00       	call   53aa78 <balance_leaf+0x3498>	53aa74: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3498   53aa78:	eb 05                	jmp    53aa7f <balance_leaf+0x349f>
349a   53aa7a:	e8 00 00 00 00       	call   53aa7f <balance_leaf+0x349f>	53aa7b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
349f   53aa7f:	be 02 00 00 00       	mov    $0x2,%esi
34a4   53aa84:	4c 89 ff             	mov    %r15,%rdi
34a7   53aa87:	e8 00 00 00 00       	call   53aa8c <balance_leaf+0x34ac>	53aa88: R_X86_64_PLT32	__asan_loadN_noabort-0x4
34ac   53aa8c:	66 41 83 3f 00       	cmpw   $0x0,(%r15)
34b1   53aa91:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
34b6   53aa96:	74 42                	je     53aada <balance_leaf+0x34fa>
34b8   53aa98:	4a 8d 3c e5 08 00 00 00 	lea    0x8(,%r12,8),%rdi
34c0   53aaa0:	4c 01 ef             	add    %r13,%rdi
34c3   53aaa3:	be 08 00 00 00       	mov    $0x8,%esi
34c8   53aaa8:	e8 00 00 00 00       	call   53aaad <balance_leaf+0x34cd>	53aaa9: R_X86_64_PLT32	__asan_loadN_noabort-0x4
34cd   53aaad:	4b 8b 44 e5 08       	mov    0x8(%r13,%r12,8),%rax
34d2   53aab2:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
34dc   53aabc:	48 21 c8             	and    %rcx,%rax
34df   53aabf:	48 b9 00 00 00 00 00 00 00 10 	movabs $0x1000000000000000,%rcx
34e9   53aac9:	48 39 c8             	cmp    %rcx,%rax
34ec   53aacc:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
34f1   53aad1:	75 4d                	jne    53ab20 <balance_leaf+0x3540>
34f3   53aad3:	e8 00 00 00 00       	call   53aad8 <balance_leaf+0x34f8>	53aad4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
34f8   53aad8:	eb 27                	jmp    53ab01 <balance_leaf+0x3521>
34fa   53aada:	4a 8d 3c e5 0c 00 00 00 	lea    0xc(,%r12,8),%rdi
3502   53aae2:	4c 01 ef             	add    %r13,%rdi
3505   53aae5:	be 04 00 00 00       	mov    $0x4,%esi
350a   53aaea:	e8 00 00 00 00       	call   53aaef <balance_leaf+0x350f>	53aaeb: R_X86_64_PLT32	__asan_loadN_noabort-0x4
350f   53aaef:	43 83 7c e5 0c fe    	cmpl   $0xfffffffe,0xc(%r13,%r12,8)
3515   53aaf5:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
351a   53aafa:	75 2b                	jne    53ab27 <balance_leaf+0x3547>
351c   53aafc:	e8 00 00 00 00       	call   53ab01 <balance_leaf+0x3521>	53aafd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3521   53ab01:	4a 8d 3c e5 10 00 00 00 	lea    0x10(,%r12,8),%rdi
3529   53ab09:	4c 01 ef             	add    %r13,%rdi
352c   53ab0c:	be 02 00 00 00       	mov    $0x2,%esi
3531   53ab11:	e8 00 00 00 00       	call   53ab16 <balance_leaf+0x3536>	53ab12: R_X86_64_PLT32	__asan_storeN_noabort-0x4
3536   53ab16:	66 43 c7 44 e5 10 00 00 	movw   $0x0,0x10(%r13,%r12,8)
353e   53ab1e:	eb 0c                	jmp    53ab2c <balance_leaf+0x354c>
3540   53ab20:	e8 00 00 00 00       	call   53ab25 <balance_leaf+0x3545>	53ab21: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3545   53ab25:	eb 05                	jmp    53ab2c <balance_leaf+0x354c>
3547   53ab27:	e8 00 00 00 00       	call   53ab2c <balance_leaf+0x354c>	53ab28: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
354c   53ab2c:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
3551   53ab31:	4c 89 ef             	mov    %r13,%rdi
3554   53ab34:	e8 00 00 00 00       	call   53ab39 <balance_leaf+0x3559>	53ab35: R_X86_64_PLT32	__asan_store4_noabort-0x4
3559   53ab39:	41 c7 45 00 00 00 00 00 	movl   $0x0,0x0(%r13)
3561   53ab41:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
3566   53ab46:	48 89 df             	mov    %rbx,%rdi
3569   53ab49:	e8 00 00 00 00       	call   53ab4e <balance_leaf+0x356e>	53ab4a: R_X86_64_PLT32	__asan_store4_noabort-0x4
356e   53ab4e:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
3574   53ab54:	e9 1c 08 00 00       	jmp    53b375 <balance_leaf+0x3d95>
3579   53ab59:	be 04 00 00 00       	mov    $0x4,%esi
357e   53ab5e:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
3583   53ab63:	48 89 df             	mov    %rbx,%rdi
3586   53ab66:	e8 00 00 00 00       	call   53ab6b <balance_leaf+0x358b>	53ab67: R_X86_64_PLT32	__asan_loadN_noabort-0x4
358b   53ab6b:	44 8b 2b             	mov    (%rbx),%r13d
358e   53ab6e:	be 04 00 00 00       	mov    $0x4,%esi
3593   53ab73:	48 8b bc 24 e8 00 00 00 	mov    0xe8(%rsp),%rdi
359b   53ab7b:	e8 00 00 00 00       	call   53ab80 <balance_leaf+0x35a0>	53ab7c: R_X86_64_PLT32	__asan_loadN_noabort-0x4
35a0   53ab80:	8b 5b 04             	mov    0x4(%rbx),%ebx
35a3   53ab83:	be 02 00 00 00       	mov    $0x2,%esi
35a8   53ab88:	48 8b ac 24 80 00 00 00 	mov    0x80(%rsp),%rbp
35b0   53ab90:	48 89 ef             	mov    %rbp,%rdi
35b3   53ab93:	e8 00 00 00 00       	call   53ab98 <balance_leaf+0x35b8>	53ab94: R_X86_64_PLT32	__asan_loadN_noabort-0x4
35b8   53ab98:	0f b7 6d 00          	movzwl 0x0(%rbp),%ebp
35bc   53ab9c:	83 fb fe             	cmp    $0xfffffffe,%ebx
35bf   53ab9f:	0f 85 06 03 00 00    	jne    53aeab <balance_leaf+0x38cb>
35c5   53aba5:	e8 00 00 00 00       	call   53abaa <balance_leaf+0x35ca>	53aba6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
35ca   53abaa:	48 8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%rbx
35d2   53abb2:	48 89 df             	mov    %rbx,%rdi
35d5   53abb5:	e8 00 00 00 00       	call   53abba <balance_leaf+0x35da>	53abb6: R_X86_64_PLT32	__asan_load8_noabort-0x4
35da   53abba:	48 8b 1b             	mov    (%rbx),%rbx
35dd   53abbd:	48 8d 7b 14          	lea    0x14(%rbx),%rdi
35e1   53abc1:	e8 00 00 00 00       	call   53abc6 <balance_leaf+0x35e6>	53abc2: R_X86_64_PLT32	__asan_load1_noabort-0x4
35e6   53abc6:	0f b6 5b 14          	movzbl 0x14(%rbx),%ebx
35ea   53abca:	83 c3 fe             	add    $0xfffffffe,%ebx
35ed   53abcd:	e9 e0 02 00 00       	jmp    53aeb2 <balance_leaf+0x38d2>
35f2   53abd2:	4a 8d 3c f5 0c 00 00 00 	lea    0xc(,%r14,8),%rdi
35fa   53abda:	48 01 ef             	add    %rbp,%rdi
35fd   53abdd:	be 04 00 00 00       	mov    $0x4,%esi
3602   53abe2:	e8 00 00 00 00       	call   53abe7 <balance_leaf+0x3607>	53abe3: R_X86_64_PLT32	__asan_loadN_noabort-0x4
3607   53abe7:	42 81 7c f5 0c f4 01 00 00 	cmpl   $0x1f4,0xc(%rbp,%r14,8)
3610   53abf0:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
3615   53abf5:	0f 85 9a 04 00 00    	jne    53b095 <balance_leaf+0x3ab5>
361b   53abfb:	e8 00 00 00 00       	call   53ac00 <balance_leaf+0x3620>	53abfc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3620   53ac00:	48 89 df             	mov    %rbx,%rdi
3623   53ac03:	e8 00 00 00 00       	call   53ac08 <balance_leaf+0x3628>	53ac04: R_X86_64_PLT32	__asan_load4_noabort-0x4
3628   53ac08:	48 63 2b             	movslq (%rbx),%rbp
362b   53ac0b:	48 c1 e5 04          	shl    $0x4,%rbp
362f   53ac0f:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
3633   53ac13:	48 83 c7 08          	add    $0x8,%rdi
3637   53ac17:	e8 00 00 00 00       	call   53ac1c <balance_leaf+0x363c>	53ac18: R_X86_64_PLT32	__asan_load8_noabort-0x4
363c   53ac1c:	48 8b 5c 2b 08       	mov    0x8(%rbx,%rbp,1),%rbx
3641   53ac21:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
3645   53ac25:	e8 00 00 00 00       	call   53ac2a <balance_leaf+0x364a>	53ac26: R_X86_64_PLT32	__asan_load8_noabort-0x4
364a   53ac2a:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
364e   53ac2e:	4a 8d 3c f3          	lea    (%rbx,%r14,8),%rdi
3652   53ac32:	48 83 c7 28          	add    $0x28,%rdi
3656   53ac36:	be 02 00 00 00       	mov    $0x2,%esi
365b   53ac3b:	e8 00 00 00 00       	call   53ac40 <balance_leaf+0x3660>	53ac3c: R_X86_64_PLT32	__asan_loadN_noabort-0x4
3660   53ac40:	46 0f b7 6c f3 28    	movzwl 0x28(%rbx,%r14,8),%r13d
3666   53ac46:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
366b   53ac4b:	e8 00 00 00 00       	call   53ac50 <balance_leaf+0x3670>	53ac4c: R_X86_64_PLT32	__asan_store8_noabort-0x4
3670   53ac50:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)
3679   53ac59:	44 89 eb             	mov    %r13d,%ebx
367c   53ac5c:	44 29 e3             	sub    %r12d,%ebx
367f   53ac5f:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
3684   53ac64:	48 89 ef             	mov    %rbp,%rdi
3687   53ac67:	e8 00 00 00 00       	call   53ac6c <balance_leaf+0x368c>	53ac68: R_X86_64_PLT32	__asan_load4_noabort-0x4
368c   53ac6c:	8b 45 00             	mov    0x0(%rbp),%eax
368f   53ac6f:	39 c3                	cmp    %eax,%ebx
3691   53ac71:	0f 8d 00 02 00 00    	jge    53ae77 <balance_leaf+0x3897>
3697   53ac77:	44 39 e8             	cmp    %r13d,%eax
369a   53ac7a:	0f 8f f7 01 00 00    	jg     53ae77 <balance_leaf+0x3897>
36a0   53ac80:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
36a5   53ac85:	48 89 df             	mov    %rbx,%rdi
36a8   53ac88:	e8 00 00 00 00       	call   53ac8d <balance_leaf+0x36ad>	53ac89: R_X86_64_PLT32	__asan_load4_noabort-0x4
36ad   53ac8d:	83 3b 00             	cmpl   $0x0,(%rbx)
36b0   53ac90:	0f 84 fc 23 00 00    	je     53d092 <balance_leaf+0x5ab2>
36b6   53ac96:	41 83 c4 ff          	add    $0xffffffff,%r12d
36ba   53ac9a:	45 39 ec             	cmp    %r13d,%r12d
36bd   53ac9d:	8b 5c 24 50          	mov    0x50(%rsp),%ebx
36c1   53aca1:	0f 8d 1e 24 00 00    	jge    53d0c5 <balance_leaf+0x5ae5>
36c7   53aca7:	e8 00 00 00 00       	call   53acac <balance_leaf+0x36cc>	53aca8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
36cc   53acac:	4c 89 ff             	mov    %r15,%rdi
36cf   53acaf:	e8 00 00 00 00       	call   53acb4 <balance_leaf+0x36d4>	53acb0: R_X86_64_PLT32	__asan_load8_noabort-0x4
36d4   53acb4:	4d 8b 07             	mov    (%r15),%r8
36d7   53acb7:	bf 04 00 00 00       	mov    $0x4,%edi
36dc   53acbc:	48 8b 2c 24          	mov    (%rsp),%rbp
36e0   53acc0:	48 89 ee             	mov    %rbp,%rsi
36e3   53acc3:	89 da                	mov    %ebx,%edx
36e5   53acc5:	44 89 e1             	mov    %r12d,%ecx
36e8   53acc8:	e8 00 00 00 00       	call   53accd <balance_leaf+0x36ed>	53acc9: R_X86_64_PLT32	leaf_move_items-0x4
36ed   53accd:	4c 89 ff             	mov    %r15,%rdi
36f0   53acd0:	e8 00 00 00 00       	call   53acd5 <balance_leaf+0x36f5>	53acd1: R_X86_64_PLT32	__asan_load8_noabort-0x4
36f5   53acd5:	49 8b 1f             	mov    (%r15),%rbx
36f8   53acd8:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
36fd   53acdd:	e8 00 00 00 00       	call   53ace2 <balance_leaf+0x3702>	53acde: R_X86_64_PLT32	__asan_store8_noabort-0x4
3702   53ace2:	48 89 6c 24 20       	mov    %rbp,0x20(%rsp)
3707   53ace7:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
370c   53acec:	e8 00 00 00 00       	call   53acf1 <balance_leaf+0x3711>	53aced: R_X86_64_PLT32	__asan_store8_noabort-0x4
3711   53acf1:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
3716   53acf6:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
371b   53acfb:	e8 00 00 00 00       	call   53ad00 <balance_leaf+0x3720>	53acfc: R_X86_64_PLT32	__asan_store8_noabort-0x4
3720   53ad00:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)
3729   53ad09:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
372e   53ad0e:	e8 00 00 00 00       	call   53ad13 <balance_leaf+0x3733>	53ad0f: R_X86_64_PLT32	__asan_load4_noabort-0x4
3733   53ad13:	41 f7 d5             	not    %r13d
3736   53ad16:	8b 9d 50 02 00 00    	mov    0x250(%rbp),%ebx
373c   53ad1c:	44 01 eb             	add    %r13d,%ebx
373f   53ad1f:	4c 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%r15
3747   53ad27:	4c 89 ff             	mov    %r15,%rdi
374a   53ad2a:	e8 00 00 00 00       	call   53ad2f <balance_leaf+0x374f>	53ad2b: R_X86_64_PLT32	__asan_load4_noabort-0x4
374f   53ad2f:	41 03 1f             	add    (%r15),%ebx
3752   53ad32:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
3757   53ad37:	4c 89 e7             	mov    %r12,%rdi
375a   53ad3a:	e8 00 00 00 00       	call   53ad3f <balance_leaf+0x375f>	53ad3b: R_X86_64_PLT32	__asan_load4_noabort-0x4
375f   53ad3f:	44 8b b5 f0 01 00 00 	mov    0x1f0(%rbp),%r14d
3766   53ad46:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
376b   53ad4b:	e8 00 00 00 00       	call   53ad50 <balance_leaf+0x3770>	53ad4c: R_X86_64_PLT32	__asan_load4_noabort-0x4
3770   53ad50:	44 8b 8d 54 02 00 00 	mov    0x254(%rbp),%r9d
3777   53ad57:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
377c   53ad5c:	31 f6                	xor    %esi,%esi
377e   53ad5e:	89 da                	mov    %ebx,%edx
3780   53ad60:	44 89 f1             	mov    %r14d,%ecx
3783   53ad63:	48 8b 5c 24 48       	mov    0x48(%rsp),%rbx
3788   53ad68:	49 89 d8             	mov    %rbx,%r8
378b   53ad6b:	e8 00 00 00 00       	call   53ad70 <balance_leaf+0x3790>	53ad6c: R_X86_64_PLT32	leaf_paste_in_buffer-0x4
3790   53ad70:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
3795   53ad75:	4c 89 f7             	mov    %r14,%rdi
3798   53ad78:	e8 00 00 00 00       	call   53ad7d <balance_leaf+0x379d>	53ad79: R_X86_64_PLT32	__asan_load4_noabort-0x4
379d   53ad7d:	44 03 ad 50 02 00 00 	add    0x250(%rbp),%r13d
37a4   53ad84:	4c 89 ff             	mov    %r15,%rdi
37a7   53ad87:	e8 00 00 00 00       	call   53ad8c <balance_leaf+0x37ac>	53ad88: R_X86_64_PLT32	__asan_load4_noabort-0x4
37ac   53ad8c:	45 03 2f             	add    (%r15),%r13d
37af   53ad8f:	4c 89 e7             	mov    %r12,%rdi
37b2   53ad92:	e8 00 00 00 00       	call   53ad97 <balance_leaf+0x37b7>	53ad93: R_X86_64_PLT32	__asan_load4_noabort-0x4
37b7   53ad97:	8b 85 f0 01 00 00    	mov    0x1f0(%rbp),%eax
37bd   53ad9d:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
37c2   53ada2:	31 f6                	xor    %esi,%esi
37c4   53ada4:	44 89 ea             	mov    %r13d,%edx
37c7   53ada7:	4d 89 e5             	mov    %r12,%r13
37ca   53adaa:	b9 01 00 00 00       	mov    $0x1,%ecx
37cf   53adaf:	49 89 d8             	mov    %rbx,%r8
37d2   53adb2:	4c 8b 8c 24 d8 00 00 00 	mov    0xd8(%rsp),%r9
37da   53adba:	50                   	push   %rax
37db   53adbb:	e8 00 00 00 00       	call   53adc0 <balance_leaf+0x37e0>	53adbc: R_X86_64_PLT32	leaf_paste_entries-0x4
37e0   53adc0:	48 83 c4 08          	add    $0x8,%rsp
37e4   53adc4:	4c 89 e7             	mov    %r12,%rdi
37e7   53adc7:	e8 00 00 00 00       	call   53adcc <balance_leaf+0x37ec>	53adc8: R_X86_64_PLT32	__asan_store4_noabort-0x4
37ec   53adcc:	c7 85 f0 01 00 00 00 00 00 00 	movl   $0x0,0x1f0(%rbp)
37f6   53add6:	4c 89 f7             	mov    %r14,%rdi
37f9   53add9:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
37fe   53adde:	e8 00 00 00 00       	call   53ade3 <balance_leaf+0x3803>	53addf: R_X86_64_PLT32	__asan_load4_noabort-0x4
3803   53ade3:	83 85 50 02 00 00 01 	addl   $0x1,0x250(%rbp)
380a   53adea:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
380f   53adef:	e9 81 05 00 00       	jmp    53b375 <balance_leaf+0x3d95>
3814   53adf4:	e8 00 00 00 00       	call   53adf9 <balance_leaf+0x3819>	53adf5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3819   53adf9:	31 db                	xor    %ebx,%ebx
381b   53adfb:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
3820   53ae00:	4d 89 ee             	mov    %r13,%r14
3823   53ae03:	4c 89 e8             	mov    %r13,%rax
3826   53ae06:	4c 21 e0             	and    %r12,%rax
3829   53ae09:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
382e   53ae0e:	66 89 6c 24 08       	mov    %bp,0x8(%rsp)
3833   53ae13:	4c 89 a4 24 e0 00 00 00 	mov    %r12,0xe0(%rsp)
383b   53ae1b:	44 0f b7 e5          	movzwl %bp,%r12d
383f   53ae1f:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
3844   53ae24:	4c 89 ef             	mov    %r13,%rdi
3847   53ae27:	e8 00 00 00 00       	call   53ae2c <balance_leaf+0x384c>	53ae28: R_X86_64_PLT32	__asan_load4_noabort-0x4
384c   53ae2c:	44 89 e0             	mov    %r12d,%eax
384f   53ae2f:	41 2b 45 00          	sub    0x0(%r13),%eax
3853   53ae33:	89 d9                	mov    %ebx,%ecx
3855   53ae35:	d3 e0                	shl    %cl,%eax
3857   53ae37:	48 63 d8             	movslq %eax,%rbx
385a   53ae3a:	4c 01 f3             	add    %r14,%rbx
385d   53ae3d:	48 23 9c 24 e0 00 00 00 	and    0xe0(%rsp),%rbx
3865   53ae45:	48 0b 9c 24 a8 00 00 00 	or     0xa8(%rsp),%rbx
386d   53ae4d:	be 08 00 00 00       	mov    $0x8,%esi
3872   53ae52:	48 8b 6c 24 68       	mov    0x68(%rsp),%rbp
3877   53ae57:	48 89 ef             	mov    %rbp,%rdi
387a   53ae5a:	e8 00 00 00 00       	call   53ae5f <balance_leaf+0x387f>	53ae5b: R_X86_64_PLT32	__asan_storeN_noabort-0x4
387f   53ae5f:	48 89 5d 00          	mov    %rbx,0x0(%rbp)
3883   53ae63:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
3888   53ae68:	e9 84 00 00 00       	jmp    53aef1 <balance_leaf+0x3911>
388d   53ae6d:	e8 00 00 00 00       	call   53ae72 <balance_leaf+0x3892>	53ae6e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3892   53ae72:	e9 23 02 00 00       	jmp    53b09a <balance_leaf+0x3aba>
3897   53ae77:	e8 00 00 00 00       	call   53ae7c <balance_leaf+0x389c>	53ae78: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
389c   53ae7c:	4c 89 ff             	mov    %r15,%rdi
389f   53ae7f:	e8 00 00 00 00       	call   53ae84 <balance_leaf+0x38a4>	53ae80: R_X86_64_PLT32	__asan_load8_noabort-0x4
38a4   53ae84:	4d 8b 07             	mov    (%r15),%r8
38a7   53ae87:	bf 04 00 00 00       	mov    $0x4,%edi
38ac   53ae8c:	48 8b 34 24          	mov    (%rsp),%rsi
38b0   53ae90:	8b 54 24 50          	mov    0x50(%rsp),%edx
38b4   53ae94:	44 89 e1             	mov    %r12d,%ecx
38b7   53ae97:	e8 00 00 00 00       	call   53ae9c <balance_leaf+0x38bc>	53ae98: R_X86_64_PLT32	leaf_move_items-0x4
38bc   53ae9c:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
38c1   53aea1:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
38c6   53aea6:	e9 ca 04 00 00       	jmp    53b375 <balance_leaf+0x3d95>
38cb   53aeab:	e8 00 00 00 00       	call   53aeb0 <balance_leaf+0x38d0>	53aeac: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
38d0   53aeb0:	31 db                	xor    %ebx,%ebx
38d2   53aeb2:	66 89 6c 24 08       	mov    %bp,0x8(%rsp)
38d7   53aeb7:	44 0f b7 e5          	movzwl %bp,%r12d
38db   53aebb:	4c 89 ff             	mov    %r15,%rdi
38de   53aebe:	e8 00 00 00 00       	call   53aec3 <balance_leaf+0x38e3>	53aebf: R_X86_64_PLT32	__asan_load4_noabort-0x4
38e3   53aec3:	44 89 e5             	mov    %r12d,%ebp
38e6   53aec6:	41 2b 2f             	sub    (%r15),%ebp
38e9   53aec9:	89 d9                	mov    %ebx,%ecx
38eb   53aecb:	d3 e5                	shl    %cl,%ebp
38ed   53aecd:	4c 89 6c 24 10       	mov    %r13,0x10(%rsp)
38f2   53aed2:	44 01 ed             	add    %r13d,%ebp
38f5   53aed5:	be 04 00 00 00       	mov    $0x4,%esi
38fa   53aeda:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
38ff   53aedf:	48 89 df             	mov    %rbx,%rdi
3902   53aee2:	e8 00 00 00 00       	call   53aee7 <balance_leaf+0x3907>	53aee3: R_X86_64_PLT32	__asan_storeN_noabort-0x4
3907   53aee7:	89 2b                	mov    %ebp,(%rbx)
3909   53aee9:	4d 89 fd             	mov    %r15,%r13
390c   53aeec:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
3911   53aef1:	4c 89 ef             	mov    %r13,%rdi
3914   53aef4:	e8 00 00 00 00       	call   53aef9 <balance_leaf+0x3919>	53aef5: R_X86_64_PLT32	__asan_load4_noabort-0x4
3919   53aef9:	41 0f b7 5d 00       	movzwl 0x0(%r13),%ebx
391e   53aefe:	be 02 00 00 00       	mov    $0x2,%esi
3923   53af03:	48 8b ac 24 80 00 00 00 	mov    0x80(%rsp),%rbp
392b   53af0b:	48 89 ef             	mov    %rbp,%rdi
392e   53af0e:	e8 00 00 00 00       	call   53af13 <balance_leaf+0x3933>	53af0f: R_X86_64_PLT32	__asan_storeN_noabort-0x4
3933   53af13:	66 89 5d 00          	mov    %bx,0x0(%rbp)
3937   53af17:	4c 89 ff             	mov    %r15,%rdi
393a   53af1a:	e8 00 00 00 00       	call   53af1f <balance_leaf+0x393f>	53af1b: R_X86_64_PLT32	__asan_load8_noabort-0x4
393f   53af1f:	49 8b 2f             	mov    (%r15),%rbp
3942   53af22:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
3947   53af27:	e8 00 00 00 00       	call   53af2c <balance_leaf+0x394c>	53af28: R_X86_64_PLT32	__asan_store8_noabort-0x4
394c   53af2c:	48 8b 1c 24          	mov    (%rsp),%rbx
3950   53af30:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
3955   53af35:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
395a   53af3a:	e8 00 00 00 00       	call   53af3f <balance_leaf+0x395f>	53af3b: R_X86_64_PLT32	__asan_store8_noabort-0x4
395f   53af3f:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
3964   53af44:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
3969   53af49:	e8 00 00 00 00       	call   53af4e <balance_leaf+0x396e>	53af4a: R_X86_64_PLT32	__asan_store8_noabort-0x4
396e   53af4e:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)
3977   53af57:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
397c   53af5c:	e8 00 00 00 00       	call   53af61 <balance_leaf+0x3981>	53af5d: R_X86_64_PLT32	__asan_store4_noabort-0x4
3981   53af61:	c7 44 24 38 00 00 00 00 	movl   $0x0,0x38(%rsp)
3989   53af69:	45 2b 65 00          	sub    0x0(%r13),%r12d
398d   53af6d:	48 8b 6c 24 60       	mov    0x60(%rsp),%rbp
3992   53af72:	48 89 ef             	mov    %rbp,%rdi
3995   53af75:	e8 00 00 00 00       	call   53af7a <balance_leaf+0x399a>	53af76: R_X86_64_PLT32	__asan_load4_noabort-0x4
399a   53af7a:	48 63 9b 54 02 00 00 	movslq 0x254(%rbx),%rbx
39a1   53af81:	44 39 e3             	cmp    %r12d,%ebx
39a4   53af84:	7d 14                	jge    53af9a <balance_leaf+0x39ba>
39a6   53af86:	e8 00 00 00 00       	call   53af8b <balance_leaf+0x39ab>	53af87: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
39ab   53af8b:	49 63 cc             	movslq %r12d,%rcx
39ae   53af8e:	48 03 4c 24 48       	add    0x48(%rsp),%rcx
39b3   53af93:	48 29 d9             	sub    %rbx,%rcx
39b6   53af96:	31 db                	xor    %ebx,%ebx
39b8   53af98:	eb 19                	jmp    53afb3 <balance_leaf+0x39d3>
39ba   53af9a:	e8 00 00 00 00       	call   53af9f <balance_leaf+0x39bf>	53af9b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
39bf   53af9f:	44 29 e3             	sub    %r12d,%ebx
39c2   53afa2:	48 89 ef             	mov    %rbp,%rdi
39c5   53afa5:	e8 00 00 00 00       	call   53afaa <balance_leaf+0x39ca>	53afa6: R_X86_64_PLT32	__asan_store4_noabort-0x4
39ca   53afaa:	44 89 65 00          	mov    %r12d,0x0(%rbp)
39ce   53afae:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
39d3   53afb3:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
39d8   53afb8:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
39dd   53afbd:	31 f6                	xor    %esi,%esi
39df   53afbf:	48 8b ac 24 a0 00 00 00 	mov    0xa0(%rsp),%rbp
39e7   53afc7:	48 89 ea             	mov    %rbp,%rdx
39ea   53afca:	41 89 d8             	mov    %ebx,%r8d
39ed   53afcd:	e8 00 00 00 00       	call   53afd2 <balance_leaf+0x39f2>	53afce: R_X86_64_PLT32	leaf_insert_into_buf-0x4
39f2   53afd2:	be 02 00 00 00       	mov    $0x2,%esi
39f7   53afd7:	48 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%rdi
39ff   53afdf:	e8 00 00 00 00       	call   53afe4 <balance_leaf+0x3a04>	53afe0: R_X86_64_PLT32	__asan_loadN_noabort-0x4
3a04   53afe4:	66 83 7d 16 00       	cmpw   $0x0,0x16(%rbp)
3a09   53afe9:	44 0f b7 64 24 08    	movzwl 0x8(%rsp),%r12d
3a0f   53afef:	74 47                	je     53b038 <balance_leaf+0x3a58>
3a11   53aff1:	e8 00 00 00 00       	call   53aff6 <balance_leaf+0x3a16>	53aff2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3a16   53aff6:	48 63 44 24 10       	movslq 0x10(%rsp),%rax
3a1b   53affb:	48 b9 00 00 00 00 00 00 00 10 	movabs $0x1000000000000000,%rcx
3a25   53b005:	48 8d 59 ff          	lea    -0x1(%rcx),%rbx
3a29   53b009:	48 21 c3             	and    %rax,%rbx
3a2c   53b00c:	be 08 00 00 00       	mov    $0x8,%esi
3a31   53b011:	48 8b 6c 24 68       	mov    0x68(%rsp),%rbp
3a36   53b016:	48 89 ef             	mov    %rbp,%rdi
3a39   53b019:	e8 00 00 00 00       	call   53b01e <balance_leaf+0x3a3e>	53b01a: R_X86_64_PLT32	__asan_loadN_noabort-0x4
3a3e   53b01e:	48 8b 45 00          	mov    0x0(%rbp),%rax
3a42   53b022:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
3a4c   53b02c:	48 21 c8             	and    %rcx,%rax
3a4f   53b02f:	48 09 d8             	or     %rbx,%rax
3a52   53b032:	48 89 45 00          	mov    %rax,0x0(%rbp)
3a56   53b036:	eb 1e                	jmp    53b056 <balance_leaf+0x3a76>
3a58   53b038:	e8 00 00 00 00       	call   53b03d <balance_leaf+0x3a5d>	53b039: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3a5d   53b03d:	be 04 00 00 00       	mov    $0x4,%esi
3a62   53b042:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
3a67   53b047:	48 89 df             	mov    %rbx,%rdi
3a6a   53b04a:	e8 00 00 00 00       	call   53b04f <balance_leaf+0x3a6f>	53b04b: R_X86_64_PLT32	__asan_storeN_noabort-0x4
3a6f   53b04f:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
3a74   53b054:	89 03                	mov    %eax,(%rbx)
3a76   53b056:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
3a7b   53b05b:	48 89 ef             	mov    %rbp,%rdi
3a7e   53b05e:	e8 00 00 00 00       	call   53b063 <balance_leaf+0x3a83>	53b05f: R_X86_64_PLT32	__asan_load4_noabort-0x4
3a83   53b063:	66 44 2b 65 00       	sub    0x0(%rbp),%r12w
3a88   53b068:	be 02 00 00 00       	mov    $0x2,%esi
3a8d   53b06d:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
3a95   53b075:	48 89 df             	mov    %rbx,%rdi
3a98   53b078:	e8 00 00 00 00       	call   53b07d <balance_leaf+0x3a9d>	53b079: R_X86_64_PLT32	__asan_storeN_noabort-0x4
3a9d   53b07d:	66 44 89 23          	mov    %r12w,(%rbx)
3aa1   53b081:	8b 5d 00             	mov    0x0(%rbp),%ebx
3aa4   53b084:	4c 89 ef             	mov    %r13,%rdi
3aa7   53b087:	e8 00 00 00 00       	call   53b08c <balance_leaf+0x3aac>	53b088: R_X86_64_PLT32	__asan_load4_noabort-0x4
3aac   53b08c:	41 29 5d 00          	sub    %ebx,0x0(%r13)
3ab0   53b090:	e9 e0 02 00 00       	jmp    53b375 <balance_leaf+0x3d95>
3ab5   53b095:	e8 00 00 00 00       	call   53b09a <balance_leaf+0x3aba>	53b096: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3aba   53b09a:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
3abf   53b09f:	48 89 df             	mov    %rbx,%rdi
3ac2   53b0a2:	e8 00 00 00 00       	call   53b0a7 <balance_leaf+0x3ac7>	53b0a3: R_X86_64_PLT32	__asan_load4_noabort-0x4
3ac7   53b0a7:	8b 1b                	mov    (%rbx),%ebx
3ac9   53b0a9:	4a 8d 3c f5 12 00 00 00 	lea    0x12(,%r14,8),%rdi
3ad1   53b0b1:	48 01 ef             	add    %rbp,%rdi
3ad4   53b0b4:	be 02 00 00 00       	mov    $0x2,%esi
3ad9   53b0b9:	e8 00 00 00 00       	call   53b0be <balance_leaf+0x3ade>	53b0ba: R_X86_64_PLT32	__asan_loadN_noabort-0x4
3ade   53b0be:	42 0f b7 44 f5 12    	movzwl 0x12(%rbp,%r14,8),%eax
3ae4   53b0c4:	39 c3                	cmp    %eax,%ebx
3ae6   53b0c6:	0f 85 df 1d 00 00    	jne    53ceab <balance_leaf+0x58cb>
3aec   53b0cc:	4c 89 ef             	mov    %r13,%rdi
3aef   53b0cf:	e8 00 00 00 00       	call   53b0d4 <balance_leaf+0x3af4>	53b0d0: R_X86_64_PLT32	__asan_load4_noabort-0x4
3af4   53b0d4:	41 8b 45 00          	mov    0x0(%r13),%eax
3af8   53b0d8:	85 c0                	test   %eax,%eax
3afa   53b0da:	8b 5c 24 50          	mov    0x50(%rsp),%ebx
3afe   53b0de:	0f 8e ce 1d 00 00    	jle    53ceb2 <balance_leaf+0x58d2>
3b04   53b0e4:	41 29 c4             	sub    %eax,%r12d
3b07   53b0e7:	b8 00 00 00 00       	mov    $0x0,%eax
3b0c   53b0ec:	44 0f 48 e0          	cmovs  %eax,%r12d
3b10   53b0f0:	4c 89 ff             	mov    %r15,%rdi
3b13   53b0f3:	e8 00 00 00 00       	call   53b0f8 <balance_leaf+0x3b18>	53b0f4: R_X86_64_PLT32	__asan_load8_noabort-0x4
3b18   53b0f8:	4d 8b 07             	mov    (%r15),%r8
3b1b   53b0fb:	bf 04 00 00 00       	mov    $0x4,%edi
3b20   53b100:	4c 89 e1             	mov    %r12,%rcx
3b23   53b103:	4c 8b 24 24          	mov    (%rsp),%r12
3b27   53b107:	4c 89 e6             	mov    %r12,%rsi
3b2a   53b10a:	89 da                	mov    %ebx,%edx
3b2c   53b10c:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
3b31   53b111:	e8 00 00 00 00       	call   53b116 <balance_leaf+0x3b36>	53b112: R_X86_64_PLT32	leaf_move_items-0x4
3b36   53b116:	4c 89 ef             	mov    %r13,%rdi
3b39   53b119:	e8 00 00 00 00       	call   53b11e <balance_leaf+0x3b3e>	53b11a: R_X86_64_PLT32	__asan_load4_noabort-0x4
3b3e   53b11e:	41 8b 9c 24 f0 01 00 00 	mov    0x1f0(%r12),%ebx
3b46   53b126:	48 8b ac 24 a8 00 00 00 	mov    0xa8(%rsp),%rbp
3b4e   53b12e:	48 89 ef             	mov    %rbp,%rdi
3b51   53b131:	e8 00 00 00 00       	call   53b136 <balance_leaf+0x3b56>	53b132: R_X86_64_PLT32	__asan_load4_noabort-0x4
3b56   53b136:	89 d8                	mov    %ebx,%eax
3b58   53b138:	2b 45 00             	sub    0x0(%rbp),%eax
3b5b   53b13b:	4c 89 fd             	mov    %r15,%rbp
3b5e   53b13e:	41 bf 00 00 00 00    	mov    $0x0,%r15d
3b64   53b144:	89 44 24 10          	mov    %eax,0x10(%rsp)
3b68   53b148:	44 0f 49 f8          	cmovns %eax,%r15d
3b6c   53b14c:	48 89 ef             	mov    %rbp,%rdi
3b6f   53b14f:	e8 00 00 00 00       	call   53b154 <balance_leaf+0x3b74>	53b150: R_X86_64_PLT32	__asan_load8_noabort-0x4
3b74   53b154:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
3b78   53b158:	48 8d bc 24 b0 00 00 00 	lea    0xb0(%rsp),%rdi
3b80   53b160:	e8 00 00 00 00       	call   53b165 <balance_leaf+0x3b85>	53b161: R_X86_64_PLT32	__asan_store8_noabort-0x4
3b85   53b165:	4c 89 a4 24 b0 00 00 00 	mov    %r12,0xb0(%rsp)
3b8d   53b16d:	48 8d bc 24 b8 00 00 00 	lea    0xb8(%rsp),%rdi
3b95   53b175:	e8 00 00 00 00       	call   53b17a <balance_leaf+0x3b9a>	53b176: R_X86_64_PLT32	__asan_store8_noabort-0x4
3b9a   53b17a:	48 89 ac 24 b8 00 00 00 	mov    %rbp,0xb8(%rsp)
3ba2   53b182:	48 8d bc 24 c0 00 00 00 	lea    0xc0(%rsp),%rdi
3baa   53b18a:	e8 00 00 00 00       	call   53b18f <balance_leaf+0x3baf>	53b18b: R_X86_64_PLT32	__asan_store8_noabort-0x4
3baf   53b18f:	48 c7 84 24 c0 00 00 00 00 00 00 00 	movq   $0x0,0xc0(%rsp)
3bbb   53b19b:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
3bc0   53b1a0:	4c 89 f7             	mov    %r14,%rdi
3bc3   53b1a3:	e8 00 00 00 00       	call   53b1a8 <balance_leaf+0x3bc8>	53b1a4: R_X86_64_PLT32	__asan_load4_noabort-0x4
3bc8   53b1a8:	49 63 ac 24 54 02 00 00 	movslq 0x254(%r12),%rbp
3bd0   53b1b0:	44 39 fd             	cmp    %r15d,%ebp
3bd3   53b1b3:	7d 14                	jge    53b1c9 <balance_leaf+0x3be9>
3bd5   53b1b5:	e8 00 00 00 00       	call   53b1ba <balance_leaf+0x3bda>	53b1b6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3bda   53b1ba:	45 89 f8             	mov    %r15d,%r8d
3bdd   53b1bd:	4c 03 44 24 48       	add    0x48(%rsp),%r8
3be2   53b1c2:	49 29 e8             	sub    %rbp,%r8
3be5   53b1c5:	31 ed                	xor    %ebp,%ebp
3be7   53b1c7:	eb 18                	jmp    53b1e1 <balance_leaf+0x3c01>
3be9   53b1c9:	e8 00 00 00 00       	call   53b1ce <balance_leaf+0x3bee>	53b1ca: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3bee   53b1ce:	44 29 fd             	sub    %r15d,%ebp
3bf1   53b1d1:	4c 89 f7             	mov    %r14,%rdi
3bf4   53b1d4:	e8 00 00 00 00       	call   53b1d9 <balance_leaf+0x3bf9>	53b1d5: R_X86_64_PLT32	__asan_store4_noabort-0x4
3bf9   53b1d9:	45 89 3e             	mov    %r15d,(%r14)
3bfc   53b1dc:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
3c01   53b1e1:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
3c06   53b1e6:	44 29 fb             	sub    %r15d,%ebx
3c09   53b1e9:	48 8d bc 24 b0 00 00 00 	lea    0xb0(%rsp),%rdi
3c11   53b1f1:	31 f6                	xor    %esi,%esi
3c13   53b1f3:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
3c18   53b1f8:	89 d9                	mov    %ebx,%ecx
3c1a   53b1fa:	41 89 e9             	mov    %ebp,%r9d
3c1d   53b1fd:	e8 00 00 00 00       	call   53b202 <balance_leaf+0x3c22>	53b1fe: R_X86_64_PLT32	leaf_paste_in_buffer-0x4
3c22   53b202:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
3c27   53b207:	48 89 df             	mov    %rbx,%rdi
3c2a   53b20a:	e8 00 00 00 00       	call   53b20f <balance_leaf+0x3c2f>	53b20b: R_X86_64_PLT32	__asan_load8_noabort-0x4
3c2f   53b20f:	48 8b 1b             	mov    (%rbx),%rbx
3c32   53b212:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
3c36   53b216:	e8 00 00 00 00       	call   53b21b <balance_leaf+0x3c3b>	53b217: R_X86_64_PLT32	__asan_load8_noabort-0x4
3c3b   53b21b:	48 8b 6b 28          	mov    0x28(%rbx),%rbp
3c3f   53b21f:	4c 8d 65 2e          	lea    0x2e(%rbp),%r12
3c43   53b223:	be 02 00 00 00       	mov    $0x2,%esi
3c48   53b228:	4c 89 e7             	mov    %r12,%rdi
3c4b   53b22b:	e8 00 00 00 00       	call   53b230 <balance_leaf+0x3c50>	53b22c: R_X86_64_PLT32	__asan_loadN_noabort-0x4
3c50   53b230:	66 83 7d 2e 00       	cmpw   $0x0,0x2e(%rbp)
3c55   53b235:	74 35                	je     53b26c <balance_leaf+0x3c8c>
3c57   53b237:	48 8d 7d 20          	lea    0x20(%rbp),%rdi
3c5b   53b23b:	be 08 00 00 00       	mov    $0x8,%esi
3c60   53b240:	e8 00 00 00 00       	call   53b245 <balance_leaf+0x3c65>	53b241: R_X86_64_PLT32	__asan_loadN_noabort-0x4
3c65   53b245:	48 8b 45 20          	mov    0x20(%rbp),%rax
3c69   53b249:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
3c73   53b253:	48 21 c8             	and    %rcx,%rax
3c76   53b256:	48 b9 00 00 00 00 00 00 00 10 	movabs $0x1000000000000000,%rcx
3c80   53b260:	48 39 c8             	cmp    %rcx,%rax
3c83   53b263:	75 59                	jne    53b2be <balance_leaf+0x3cde>
3c85   53b265:	e8 00 00 00 00       	call   53b26a <balance_leaf+0x3c8a>	53b266: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3c8a   53b26a:	eb 19                	jmp    53b285 <balance_leaf+0x3ca5>
3c8c   53b26c:	48 8d 7d 24          	lea    0x24(%rbp),%rdi
3c90   53b270:	be 04 00 00 00       	mov    $0x4,%esi
3c95   53b275:	e8 00 00 00 00       	call   53b27a <balance_leaf+0x3c9a>	53b276: R_X86_64_PLT32	__asan_loadN_noabort-0x4
3c9a   53b27a:	83 7d 24 fe          	cmpl   $0xfffffffe,0x24(%rbp)
3c9e   53b27e:	75 45                	jne    53b2c5 <balance_leaf+0x3ce5>
3ca0   53b280:	e8 00 00 00 00       	call   53b285 <balance_leaf+0x3ca5>	53b281: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3ca5   53b285:	48 8d 7d 28          	lea    0x28(%rbp),%rdi
3ca9   53b289:	be 02 00 00 00       	mov    $0x2,%esi
3cae   53b28e:	e8 00 00 00 00       	call   53b293 <balance_leaf+0x3cb3>	53b28f: R_X86_64_PLT32	__asan_storeN_noabort-0x4
3cb3   53b293:	66 c7 45 28 00 00    	movw   $0x0,0x28(%rbp)
3cb9   53b299:	48 8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%rbx
3cc1   53b2a1:	48 89 df             	mov    %rbx,%rdi
3cc4   53b2a4:	e8 00 00 00 00       	call   53b2a9 <balance_leaf+0x3cc9>	53b2a5: R_X86_64_PLT32	__asan_load8_noabort-0x4
3cc9   53b2a9:	48 8b 1b             	mov    (%rbx),%rbx
3ccc   53b2ac:	48 8d 7b 14          	lea    0x14(%rbx),%rdi
3cd0   53b2b0:	e8 00 00 00 00       	call   53b2b5 <balance_leaf+0x3cd5>	53b2b1: R_X86_64_PLT32	__asan_load1_noabort-0x4
3cd5   53b2b5:	0f b6 4b 14          	movzbl 0x14(%rbx),%ecx
3cd9   53b2b9:	83 c1 fe             	add    $0xfffffffe,%ecx
3cdc   53b2bc:	eb 0e                	jmp    53b2cc <balance_leaf+0x3cec>
3cde   53b2be:	e8 00 00 00 00       	call   53b2c3 <balance_leaf+0x3ce3>	53b2bf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3ce3   53b2c3:	eb 05                	jmp    53b2ca <balance_leaf+0x3cea>
3ce5   53b2c5:	e8 00 00 00 00       	call   53b2ca <balance_leaf+0x3cea>	53b2c6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3cea   53b2ca:	31 c9                	xor    %ecx,%ecx
3cec   53b2cc:	44 89 fb             	mov    %r15d,%ebx
3cef   53b2cf:	d3 e3                	shl    %cl,%ebx
3cf1   53b2d1:	be 02 00 00 00       	mov    $0x2,%esi
3cf6   53b2d6:	4c 89 e7             	mov    %r12,%rdi
3cf9   53b2d9:	e8 00 00 00 00       	call   53b2de <balance_leaf+0x3cfe>	53b2da: R_X86_64_PLT32	__asan_loadN_noabort-0x4
3cfe   53b2de:	66 41 83 3c 24 00    	cmpw   $0x0,(%r12)
3d04   53b2e4:	74 44                	je     53b32a <balance_leaf+0x3d4a>
3d06   53b2e6:	e8 00 00 00 00       	call   53b2eb <balance_leaf+0x3d0b>	53b2e7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3d0b   53b2eb:	48 63 db             	movslq %ebx,%rbx
3d0e   53b2ee:	48 8d 7d 20          	lea    0x20(%rbp),%rdi
3d12   53b2f2:	be 08 00 00 00       	mov    $0x8,%esi
3d17   53b2f7:	e8 00 00 00 00       	call   53b2fc <balance_leaf+0x3d1c>	53b2f8: R_X86_64_PLT32	__asan_loadN_noabort-0x4
3d1c   53b2fc:	48 8b 45 20          	mov    0x20(%rbp),%rax
3d20   53b300:	48 01 c3             	add    %rax,%rbx
3d23   53b303:	48 b9 00 00 00 00 00 00 00 10 	movabs $0x1000000000000000,%rcx
3d2d   53b30d:	48 83 c1 ff          	add    $0xffffffffffffffff,%rcx
3d31   53b311:	48 21 d9             	and    %rbx,%rcx
3d34   53b314:	48 ba 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rdx
3d3e   53b31e:	48 21 d0             	and    %rdx,%rax
3d41   53b321:	48 09 c8             	or     %rcx,%rax
3d44   53b324:	48 89 45 20          	mov    %rax,0x20(%rbp)
3d48   53b328:	eb 16                	jmp    53b340 <balance_leaf+0x3d60>
3d4a   53b32a:	e8 00 00 00 00       	call   53b32f <balance_leaf+0x3d4f>	53b32b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3d4f   53b32f:	48 8d 7d 20          	lea    0x20(%rbp),%rdi
3d53   53b333:	be 04 00 00 00       	mov    $0x4,%esi
3d58   53b338:	e8 00 00 00 00       	call   53b33d <balance_leaf+0x3d5d>	53b339: R_X86_64_PLT32	__asan_loadN_noabort-0x4
3d5d   53b33d:	01 5d 20             	add    %ebx,0x20(%rbp)
3d60   53b340:	8b 5c 24 10          	mov    0x10(%rsp),%ebx
3d64   53b344:	4c 89 ef             	mov    %r13,%rdi
3d67   53b347:	e8 00 00 00 00       	call   53b34c <balance_leaf+0x3d6c>	53b348: R_X86_64_PLT32	__asan_store4_noabort-0x4
3d6c   53b34c:	45 89 7d 00          	mov    %r15d,0x0(%r13)
3d70   53b350:	85 db                	test   %ebx,%ebx
3d72   53b352:	7e 07                	jle    53b35b <balance_leaf+0x3d7b>
3d74   53b354:	e8 00 00 00 00       	call   53b359 <balance_leaf+0x3d79>	53b355: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3d79   53b359:	eb 15                	jmp    53b370 <balance_leaf+0x3d90>
3d7b   53b35b:	e8 00 00 00 00       	call   53b360 <balance_leaf+0x3d80>	53b35c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3d80   53b360:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
3d85   53b365:	48 89 df             	mov    %rbx,%rdi
3d88   53b368:	e8 00 00 00 00       	call   53b36d <balance_leaf+0x3d8d>	53b369: R_X86_64_PLT32	__asan_load4_noabort-0x4
3d8d   53b36d:	83 03 01             	addl   $0x1,(%rbx)
3d90   53b370:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
3d95   53b375:	4b 8d 04 76          	lea    (%r14,%r14,2),%rax
3d99   53b379:	48 8b 8c 24 f0 00 00 00 	mov    0xf0(%rsp),%rcx
3da1   53b381:	48 8d 1c c1          	lea    (%rcx,%rax,8),%rbx
3da5   53b385:	4c 89 ff             	mov    %r15,%rdi
3da8   53b388:	e8 00 00 00 00       	call   53b38d <balance_leaf+0x3dad>	53b389: R_X86_64_PLT32	__asan_load8_noabort-0x4
3dad   53b38d:	49 8b 2f             	mov    (%r15),%rbp
3db0   53b390:	48 8d 7d 28          	lea    0x28(%rbp),%rdi
3db4   53b394:	e8 00 00 00 00       	call   53b399 <balance_leaf+0x3db9>	53b395: R_X86_64_PLT32	__asan_load8_noabort-0x4
3db9   53b399:	48 8b 75 28          	mov    0x28(%rbp),%rsi
3dbd   53b39d:	48 83 c6 18          	add    $0x18,%rsi
3dc1   53b3a1:	ba 10 00 00 00       	mov    $0x10,%edx
3dc6   53b3a6:	48 89 df             	mov    %rbx,%rdi
3dc9   53b3a9:	e8 00 00 00 00       	call   53b3ae <balance_leaf+0x3dce>	53b3aa: R_X86_64_PLT32	memcpy-0x4
3dce   53b3ae:	49 8b 1f             	mov    (%r15),%rbx
3dd1   53b3b1:	48 8b ac 24 f8 00 00 00 	mov    0xf8(%rsp),%rbp
3dd9   53b3b9:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
3de1   53b3c1:	48 01 ef             	add    %rbp,%rdi
3de4   53b3c4:	e8 00 00 00 00       	call   53b3c9 <balance_leaf+0x3de9>	53b3c5: R_X86_64_PLT32	__asan_store8_noabort-0x4
3de9   53b3c9:	4a 89 5c f5 00       	mov    %rbx,0x0(%rbp,%r14,8)
3dee   53b3ce:	49 8b 1f             	mov    (%r15),%rbx
3df1   53b3d1:	48 89 df             	mov    %rbx,%rdi
3df4   53b3d4:	be 08 00 00 00       	mov    $0x8,%esi
3df9   53b3d9:	e8 00 00 00 00       	call   53b3de <balance_leaf+0x3dfe>	53b3da: R_X86_64_PLT32	__kasan_check_read-0x4
3dfe   53b3de:	48 89 df             	mov    %rbx,%rdi
3e01   53b3e1:	e8 00 00 00 00       	call   53b3e6 <balance_leaf+0x3e06>	53b3e2: R_X86_64_PLT32	__asan_load8_noabort-0x4
3e06   53b3e6:	48 f7 03 00 00 01 00 	testq  $0x10000,(%rbx)
3e0d   53b3ed:	0f 84 26 19 00 00    	je     53cd19 <balance_leaf+0x5739>
3e13   53b3f3:	4c 89 ff             	mov    %r15,%rdi
3e16   53b3f6:	e8 00 00 00 00       	call   53b3fb <balance_leaf+0x3e1b>	53b3f7: R_X86_64_PLT32	__asan_load8_noabort-0x4
3e1b   53b3fb:	49 8b 1f             	mov    (%r15),%rbx
3e1e   53b3fe:	48 89 df             	mov    %rbx,%rdi
3e21   53b401:	be 08 00 00 00       	mov    $0x8,%esi
3e26   53b406:	e8 00 00 00 00       	call   53b40b <balance_leaf+0x3e2b>	53b407: R_X86_64_PLT32	__kasan_check_read-0x4
3e2b   53b40b:	48 89 df             	mov    %rbx,%rdi
3e2e   53b40e:	e8 00 00 00 00       	call   53b413 <balance_leaf+0x3e33>	53b40f: R_X86_64_PLT32	__asan_load8_noabort-0x4
3e33   53b413:	48 f7 03 00 00 02 00 	testq  $0x20000,(%rbx)
3e3a   53b41a:	0f 85 00 19 00 00    	jne    53cd20 <balance_leaf+0x5740>
3e40   53b420:	4c 89 ff             	mov    %r15,%rdi
3e43   53b423:	e8 00 00 00 00       	call   53b428 <balance_leaf+0x3e48>	53b424: R_X86_64_PLT32	__asan_load8_noabort-0x4
3e48   53b428:	49 8b 1f             	mov    (%r15),%rbx
3e4b   53b42b:	48 89 df             	mov    %rbx,%rdi
3e4e   53b42e:	be 08 00 00 00       	mov    $0x8,%esi
3e53   53b433:	e8 00 00 00 00       	call   53b438 <balance_leaf+0x3e58>	53b434: R_X86_64_PLT32	__kasan_check_read-0x4
3e58   53b438:	48 89 df             	mov    %rbx,%rdi
3e5b   53b43b:	e8 00 00 00 00       	call   53b440 <balance_leaf+0x3e60>	53b43c: R_X86_64_PLT32	__asan_load8_noabort-0x4
3e60   53b440:	48 f7 03 02 00 00 00 	testq  $0x2,(%rbx)
3e67   53b447:	0f 85 da 18 00 00    	jne    53cd27 <balance_leaf+0x5747>
3e6d   53b44d:	45 85 f6             	test   %r14d,%r14d
3e70   53b450:	7e 0e                	jle    53b460 <balance_leaf+0x3e80>
3e72   53b452:	e8 00 00 00 00       	call   53b457 <balance_leaf+0x3e77>	53b453: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3e77   53b457:	41 83 c6 ff          	add    $0xffffffff,%r14d
3e7b   53b45b:	e9 d3 ed ff ff       	jmp    53a233 <balance_leaf+0x2c53>
3e80   53b460:	e8 00 00 00 00       	call   53b465 <balance_leaf+0x3e85>	53b461: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3e85   53b465:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
3e8a   53b46a:	48 89 df             	mov    %rbx,%rdi
3e8d   53b46d:	e8 00 00 00 00       	call   53b472 <balance_leaf+0x3e92>	53b46e: R_X86_64_PLT32	__asan_load4_noabort-0x4
3e92   53b472:	44 8b 23             	mov    (%rbx),%r12d
3e95   53b475:	45 85 e4             	test   %r12d,%r12d
3e98   53b478:	0f 88 5f 01 00 00    	js     53b5dd <balance_leaf+0x3ffd>
3e9e   53b47e:	48 8b 1c 24          	mov    (%rsp),%rbx
3ea2   53b482:	48 8d bb 1c 02 00 00 	lea    0x21c(%rbx),%rdi
3ea9   53b489:	e8 00 00 00 00       	call   53b48e <balance_leaf+0x3eae>	53b48a: R_X86_64_PLT32	__asan_load4_noabort-0x4
3eae   53b48e:	44 3b a3 1c 02 00 00 	cmp    0x21c(%rbx),%r12d
3eb5   53b495:	0f 8d 6b 01 00 00    	jge    53b606 <balance_leaf+0x4026>
3ebb   53b49b:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
3ec3   53b4a3:	48 89 df             	mov    %rbx,%rdi
3ec6   53b4a6:	e8 00 00 00 00       	call   53b4ab <balance_leaf+0x3ecb>	53b4a7: R_X86_64_PLT32	__asan_load8_noabort-0x4
3ecb   53b4ab:	48 8b 2b             	mov    (%rbx),%rbp
3ece   53b4ae:	48 89 ef             	mov    %rbp,%rdi
3ed1   53b4b1:	e8 00 00 00 00       	call   53b4b6 <balance_leaf+0x3ed6>	53b4b2: R_X86_64_PLT32	__asan_load4_noabort-0x4
3ed6   53b4b6:	48 63 5d 00          	movslq 0x0(%rbp),%rbx
3eda   53b4ba:	48 c1 e3 04          	shl    $0x4,%rbx
3ede   53b4be:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
3ee2   53b4c2:	48 83 c7 08          	add    $0x8,%rdi
3ee6   53b4c6:	e8 00 00 00 00       	call   53b4cb <balance_leaf+0x3eeb>	53b4c7: R_X86_64_PLT32	__asan_load8_noabort-0x4
3eeb   53b4cb:	4c 8b 7c 1d 08       	mov    0x8(%rbp,%rbx,1),%r15
3ef0   53b4d0:	83 bc 24 d0 00 00 00 69 	cmpl   $0x69,0xd0(%rsp)
3ef8   53b4d8:	0f 85 67 01 00 00    	jne    53b645 <balance_leaf+0x4065>
3efe   53b4de:	4c 8d 6c 24 38       	lea    0x38(%rsp),%r13
3f03   53b4e3:	4c 89 ef             	mov    %r13,%rdi
3f06   53b4e6:	e8 00 00 00 00       	call   53b4eb <balance_leaf+0x3f0b>	53b4e7: R_X86_64_PLT32	__asan_store8_noabort-0x4
3f0b   53b4eb:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)
3f14   53b4f4:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
3f19   53b4f9:	e8 00 00 00 00       	call   53b4fe <balance_leaf+0x3f1e>	53b4fa: R_X86_64_PLT32	__asan_store8_noabort-0x4
3f1e   53b4fe:	4c 8b 34 24          	mov    (%rsp),%r14
3f22   53b502:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
3f27   53b507:	48 89 ef             	mov    %rbp,%rdi
3f2a   53b50a:	e8 00 00 00 00       	call   53b50f <balance_leaf+0x3f2f>	53b50b: R_X86_64_PLT32	__asan_load4_noabort-0x4
3f2f   53b50f:	48 63 5d 00          	movslq 0x0(%rbp),%rbx
3f33   53b513:	48 c1 e3 04          	shl    $0x4,%rbx
3f37   53b517:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
3f3b   53b51b:	48 83 c7 08          	add    $0x8,%rdi
3f3f   53b51f:	e8 00 00 00 00       	call   53b524 <balance_leaf+0x3f44>	53b520: R_X86_64_PLT32	__asan_load8_noabort-0x4
3f44   53b524:	48 8b 5c 1d 08       	mov    0x8(%rbp,%rbx,1),%rbx
3f49   53b529:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
3f4e   53b52e:	e8 00 00 00 00       	call   53b533 <balance_leaf+0x3f53>	53b52f: R_X86_64_PLT32	__asan_store8_noabort-0x4
3f53   53b533:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
3f58   53b538:	8b 45 00             	mov    0x0(%rbp),%eax
3f5b   53b53b:	83 c0 ff             	add    $0xffffffff,%eax
3f5e   53b53e:	48 63 d8             	movslq %eax,%rbx
3f61   53b541:	48 c1 e3 04          	shl    $0x4,%rbx
3f65   53b545:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
3f69   53b549:	48 83 c7 08          	add    $0x8,%rdi
3f6d   53b54d:	e8 00 00 00 00       	call   53b552 <balance_leaf+0x3f72>	53b54e: R_X86_64_PLT32	__asan_load8_noabort-0x4
3f72   53b552:	48 8b 5c 1d 08       	mov    0x8(%rbp,%rbx,1),%rbx
3f77   53b557:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
3f7c   53b55c:	e8 00 00 00 00       	call   53b561 <balance_leaf+0x3f81>	53b55d: R_X86_64_PLT32	__asan_store8_noabort-0x4
3f81   53b561:	48 89 5c 24 30       	mov    %rbx,0x30(%rsp)
3f86   53b566:	8b 45 00             	mov    0x0(%rbp),%eax
3f89   53b569:	83 c0 ff             	add    $0xffffffff,%eax
3f8c   53b56c:	48 63 d8             	movslq %eax,%rbx
3f8f   53b56f:	48 c1 e3 04          	shl    $0x4,%rbx
3f93   53b573:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
3f97   53b577:	48 83 c7 10          	add    $0x10,%rdi
3f9b   53b57b:	e8 00 00 00 00       	call   53b580 <balance_leaf+0x3fa0>	53b57c: R_X86_64_PLT32	__asan_load4_noabort-0x4
3fa0   53b580:	8b 5c 1d 10          	mov    0x10(%rbp,%rbx,1),%ebx
3fa4   53b584:	4c 89 ef             	mov    %r13,%rdi
3fa7   53b587:	e8 00 00 00 00       	call   53b58c <balance_leaf+0x3fac>	53b588: R_X86_64_PLT32	__asan_store4_noabort-0x4
3fac   53b58c:	89 5c 24 38          	mov    %ebx,0x38(%rsp)
3fb0   53b590:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
3fb5   53b595:	e8 00 00 00 00       	call   53b59a <balance_leaf+0x3fba>	53b596: R_X86_64_PLT32	__asan_load4_noabort-0x4
3fba   53b59a:	45 8b 86 54 02 00 00 	mov    0x254(%r14),%r8d
3fc1   53b5a1:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
3fc6   53b5a6:	44 89 e6             	mov    %r12d,%esi
3fc9   53b5a9:	4c 89 f5             	mov    %r14,%rbp
3fcc   53b5ac:	48 8b 94 24 a0 00 00 00 	mov    0xa0(%rsp),%rdx
3fd4   53b5b4:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
3fd9   53b5b9:	e8 00 00 00 00       	call   53b5be <balance_leaf+0x3fde>	53b5ba: R_X86_64_PLT32	leaf_insert_into_buf-0x4
3fde   53b5be:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
3fe3   53b5c3:	e8 00 00 00 00       	call   53b5c8 <balance_leaf+0x3fe8>	53b5c4: R_X86_64_PLT32	__asan_load4_noabort-0x4
3fe8   53b5c8:	41 83 be 28 02 00 00 00 	cmpl   $0x0,0x228(%r14)
3ff0   53b5d0:	0f 84 00 01 00 00    	je     53b6d6 <balance_leaf+0x40f6>
3ff6   53b5d6:	e8 00 00 00 00       	call   53b5db <balance_leaf+0x3ffb>	53b5d7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3ffb   53b5db:	eb 52                	jmp    53b62f <balance_leaf+0x404f>
3ffd   53b5dd:	e8 00 00 00 00       	call   53b5e2 <balance_leaf+0x4002>	53b5de: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4002   53b5e2:	83 bc 24 d0 00 00 00 70 	cmpl   $0x70,0xd0(%rsp)
400a   53b5ea:	75 29                	jne    53b615 <balance_leaf+0x4035>
400c   53b5ec:	4c 89 ef             	mov    %r13,%rdi
400f   53b5ef:	e8 00 00 00 00       	call   53b5f4 <balance_leaf+0x4014>	53b5f0: R_X86_64_PLT32	__asan_load4_noabort-0x4
4014   53b5f4:	41 83 7d 00 00       	cmpl   $0x0,0x0(%r13)
4019   53b5f9:	0f 85 92 19 00 00    	jne    53cf91 <balance_leaf+0x59b1>
401f   53b5ff:	e8 00 00 00 00       	call   53b604 <balance_leaf+0x4024>	53b600: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4024   53b604:	eb 29                	jmp    53b62f <balance_leaf+0x404f>
4026   53b606:	e8 00 00 00 00       	call   53b60b <balance_leaf+0x402b>	53b607: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
402b   53b60b:	83 bc 24 d0 00 00 00 70 	cmpl   $0x70,0xd0(%rsp)
4033   53b613:	74 d7                	je     53b5ec <balance_leaf+0x400c>
4035   53b615:	e8 00 00 00 00       	call   53b61a <balance_leaf+0x403a>	53b616: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
403a   53b61a:	eb 13                	jmp    53b62f <balance_leaf+0x404f>
403c   53b61c:	e8 00 00 00 00       	call   53b621 <balance_leaf+0x4041>	53b61d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4041   53b621:	48 8b 3c 24          	mov    (%rsp),%rdi
4045   53b625:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
404a   53b62a:	e8 00 00 00 00       	call   53b62f <balance_leaf+0x404f>	53b62b: R_X86_64_PLT32	reiserfs_invalidate_buffer-0x4
404f   53b62f:	31 db                	xor    %ebx,%ebx
4051   53b631:	89 d8                	mov    %ebx,%eax
4053   53b633:	48 81 c4 00 01 00 00 	add    $0x100,%rsp
405a   53b63a:	5b                   	pop    %rbx
405b   53b63b:	41 5c                	pop    %r12
405d   53b63d:	41 5d                	pop    %r13
405f   53b63f:	41 5e                	pop    %r14
4061   53b641:	41 5f                	pop    %r15
4063   53b643:	5d                   	pop    %rbp
4064   53b644:	c3                   	ret
4065   53b645:	48 8d bc 24 c8 00 00 00 	lea    0xc8(%rsp),%rdi
406d   53b64d:	e8 00 00 00 00       	call   53b652 <balance_leaf+0x4072>	53b64e: R_X86_64_PLT32	__asan_store8_noabort-0x4
4072   53b652:	48 c7 84 24 c8 00 00 00 00 00 00 00 	movq   $0x0,0xc8(%rsp)
407e   53b65e:	49 8d 7f 28          	lea    0x28(%r15),%rdi
4082   53b662:	e8 00 00 00 00       	call   53b667 <balance_leaf+0x4087>	53b663: R_X86_64_PLT32	__asan_load8_noabort-0x4
4087   53b667:	49 8b 5f 28          	mov    0x28(%r15),%rbx
408b   53b66b:	4c 8d 6b 18          	lea    0x18(%rbx),%r13
408f   53b66f:	4f 8d 34 64          	lea    (%r12,%r12,2),%r14
4093   53b673:	4e 8d 3c f3          	lea    (%rbx,%r14,8),%r15
4097   53b677:	49 83 c7 2e          	add    $0x2e,%r15
409b   53b67b:	be 02 00 00 00       	mov    $0x2,%esi
40a0   53b680:	4c 89 ff             	mov    %r15,%rdi
40a3   53b683:	e8 00 00 00 00       	call   53b688 <balance_leaf+0x40a8>	53b684: R_X86_64_PLT32	__asan_loadN_noabort-0x4
40a8   53b688:	66 42 83 7c f3 2e 00 	cmpw   $0x0,0x2e(%rbx,%r14,8)
40af   53b68f:	0f 84 8c 00 00 00    	je     53b721 <balance_leaf+0x4141>
40b5   53b695:	4a 8d 3c f5 08 00 00 00 	lea    0x8(,%r14,8),%rdi
40bd   53b69d:	4c 01 ef             	add    %r13,%rdi
40c0   53b6a0:	be 08 00 00 00       	mov    $0x8,%esi
40c5   53b6a5:	e8 00 00 00 00       	call   53b6aa <balance_leaf+0x40ca>	53b6a6: R_X86_64_PLT32	__asan_loadN_noabort-0x4
40ca   53b6aa:	4b 8b 44 f5 08       	mov    0x8(%r13,%r14,8),%rax
40cf   53b6af:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
40d9   53b6b9:	48 21 c8             	and    %rcx,%rax
40dc   53b6bc:	48 b9 00 00 00 00 00 00 00 30 	movabs $0x3000000000000000,%rcx
40e6   53b6c6:	48 39 c8             	cmp    %rcx,%rax
40e9   53b6c9:	0f 85 09 01 00 00    	jne    53b7d8 <balance_leaf+0x41f8>
40ef   53b6cf:	e8 00 00 00 00       	call   53b6d4 <balance_leaf+0x40f4>	53b6d0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
40f4   53b6d4:	eb 74                	jmp    53b74a <balance_leaf+0x416a>
40f6   53b6d6:	48 8d bd c0 00 00 00 	lea    0xc0(%rbp),%rdi
40fd   53b6dd:	e8 00 00 00 00       	call   53b6e2 <balance_leaf+0x4102>	53b6de: R_X86_64_PLT32	__asan_load8_noabort-0x4
4102   53b6e2:	4c 8b b5 c0 00 00 00 	mov    0xc0(%rbp),%r14
4109   53b6e9:	4d 85 f6             	test   %r14,%r14
410c   53b6ec:	0f 84 2d 04 00 00    	je     53bb1f <balance_leaf+0x453f>
4112   53b6f2:	e8 00 00 00 00       	call   53b6f7 <balance_leaf+0x4117>	53b6f3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4117   53b6f7:	48 8d bd c8 01 00 00 	lea    0x1c8(%rbp),%rdi
411e   53b6fe:	e8 00 00 00 00       	call   53b703 <balance_leaf+0x4123>	53b6ff: R_X86_64_PLT32	__asan_load4_noabort-0x4
4123   53b703:	8b 95 c8 01 00 00    	mov    0x1c8(%rbp),%edx
4129   53b709:	31 db                	xor    %ebx,%ebx
412b   53b70b:	48 89 ef             	mov    %rbp,%rdi
412e   53b70e:	4c 89 f6             	mov    %r14,%rsi
4131   53b711:	4c 89 f9             	mov    %r15,%rcx
4134   53b714:	45 31 c0             	xor    %r8d,%r8d
4137   53b717:	e8 00 00 00 00       	call   53b71c <balance_leaf+0x413c>	53b718: R_X86_64_PLT32	replace_key-0x4
413c   53b71c:	e9 10 ff ff ff       	jmp    53b631 <balance_leaf+0x4051>
4141   53b721:	4a 8d 3c f5 0c 00 00 00 	lea    0xc(,%r14,8),%rdi
4149   53b729:	4c 01 ef             	add    %r13,%rdi
414c   53b72c:	be 04 00 00 00       	mov    $0x4,%esi
4151   53b731:	e8 00 00 00 00       	call   53b736 <balance_leaf+0x4156>	53b732: R_X86_64_PLT32	__asan_loadN_noabort-0x4
4156   53b736:	43 81 7c f5 0c f4 01 00 00 	cmpl   $0x1f4,0xc(%r13,%r14,8)
415f   53b73f:	0f 85 a4 00 00 00    	jne    53b7e9 <balance_leaf+0x4209>
4165   53b745:	e8 00 00 00 00       	call   53b74a <balance_leaf+0x416a>	53b746: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
416a   53b74a:	48 89 ef             	mov    %rbp,%rdi
416d   53b74d:	e8 00 00 00 00       	call   53b752 <balance_leaf+0x4172>	53b74e: R_X86_64_PLT32	__asan_load4_noabort-0x4
4172   53b752:	48 63 5d 00          	movslq 0x0(%rbp),%rbx
4176   53b756:	48 c1 e3 04          	shl    $0x4,%rbx
417a   53b75a:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
417e   53b75e:	48 83 c7 08          	add    $0x8,%rdi
4182   53b762:	e8 00 00 00 00       	call   53b767 <balance_leaf+0x4187>	53b763: R_X86_64_PLT32	__asan_load8_noabort-0x4
4187   53b767:	48 8b 5c 1d 08       	mov    0x8(%rbp,%rbx,1),%rbx
418c   53b76c:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
4190   53b770:	e8 00 00 00 00       	call   53b775 <balance_leaf+0x4195>	53b771: R_X86_64_PLT32	__asan_load8_noabort-0x4
4195   53b775:	48 89 5c 24 40       	mov    %rbx,0x40(%rsp)
419a   53b77a:	4c 8b 6b 28          	mov    0x28(%rbx),%r13
419e   53b77e:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
41a3   53b783:	e8 00 00 00 00       	call   53b788 <balance_leaf+0x41a8>	53b784: R_X86_64_PLT32	__asan_store8_noabort-0x4
41a8   53b788:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)
41b1   53b791:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
41b6   53b796:	48 89 df             	mov    %rbx,%rdi
41b9   53b799:	e8 00 00 00 00       	call   53b79e <balance_leaf+0x41be>	53b79a: R_X86_64_PLT32	__asan_load4_noabort-0x4
41be   53b79e:	44 8b 3b             	mov    (%rbx),%r15d
41c1   53b7a1:	45 85 ff             	test   %r15d,%r15d
41c4   53b7a4:	0f 88 f4 01 00 00    	js     53b99e <balance_leaf+0x43be>
41ca   53b7aa:	4a 8d 3c f5 28 00 00 00 	lea    0x28(,%r14,8),%rdi
41d2   53b7b2:	4c 01 ef             	add    %r13,%rdi
41d5   53b7b5:	be 02 00 00 00       	mov    $0x2,%esi
41da   53b7ba:	e8 00 00 00 00       	call   53b7bf <balance_leaf+0x41df>	53b7bb: R_X86_64_PLT32	__asan_loadN_noabort-0x4
41df   53b7bf:	43 0f b7 44 f5 28    	movzwl 0x28(%r13,%r14,8),%eax
41e5   53b7c5:	41 39 c7             	cmp    %eax,%r15d
41e8   53b7c8:	0f 86 ed 01 00 00    	jbe    53b9bb <balance_leaf+0x43db>
41ee   53b7ce:	e8 00 00 00 00       	call   53b7d3 <balance_leaf+0x41f3>	53b7cf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
41f3   53b7d3:	e9 cb 01 00 00       	jmp    53b9a3 <balance_leaf+0x43c3>
41f8   53b7d8:	4c 89 6c 24 40       	mov    %r13,0x40(%rsp)
41fd   53b7dd:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
4202   53b7e2:	e8 00 00 00 00       	call   53b7e7 <balance_leaf+0x4207>	53b7e3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4207   53b7e7:	eb 0f                	jmp    53b7f8 <balance_leaf+0x4218>
4209   53b7e9:	4c 89 6c 24 40       	mov    %r13,0x40(%rsp)
420e   53b7ee:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
4213   53b7f3:	e8 00 00 00 00       	call   53b7f8 <balance_leaf+0x4218>	53b7f4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4218   53b7f8:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
421d   53b7fd:	48 89 df             	mov    %rbx,%rdi
4220   53b800:	e8 00 00 00 00       	call   53b805 <balance_leaf+0x4225>	53b801: R_X86_64_PLT32	__asan_load4_noabort-0x4
4225   53b805:	44 8b 2b             	mov    (%rbx),%r13d
4228   53b808:	48 8b 5c 24 40       	mov    0x40(%rsp),%rbx
422d   53b80d:	4a 8d 3c f3          	lea    (%rbx,%r14,8),%rdi
4231   53b811:	48 83 c7 12          	add    $0x12,%rdi
4235   53b815:	be 02 00 00 00       	mov    $0x2,%esi
423a   53b81a:	e8 00 00 00 00       	call   53b81f <balance_leaf+0x423f>	53b81b: R_X86_64_PLT32	__asan_loadN_noabort-0x4
423f   53b81f:	42 0f b7 5c f3 12    	movzwl 0x12(%rbx,%r14,8),%ebx
4245   53b825:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
424a   53b82a:	4c 89 ff             	mov    %r15,%rdi
424d   53b82d:	e8 00 00 00 00       	call   53b832 <balance_leaf+0x4252>	53b82e: R_X86_64_PLT32	__asan_load4_noabort-0x4
4252   53b832:	45 8b 3f             	mov    (%r15),%r15d
4255   53b835:	44 89 6c 24 08       	mov    %r13d,0x8(%rsp)
425a   53b83a:	41 39 dd             	cmp    %ebx,%r13d
425d   53b83d:	0f 85 4b 01 00 00    	jne    53b98e <balance_leaf+0x43ae>
4263   53b843:	45 85 ff             	test   %r15d,%r15d
4266   53b846:	0f 8e c3 1b 00 00    	jle    53d40f <balance_leaf+0x5e2f>
426c   53b84c:	48 8d bc 24 b0 00 00 00 	lea    0xb0(%rsp),%rdi
4274   53b854:	e8 00 00 00 00       	call   53b859 <balance_leaf+0x4279>	53b855: R_X86_64_PLT32	__asan_store8_noabort-0x4
4279   53b859:	4c 8b 2c 24          	mov    (%rsp),%r13
427d   53b85d:	4c 89 ac 24 b0 00 00 00 	mov    %r13,0xb0(%rsp)
4285   53b865:	48 89 ef             	mov    %rbp,%rdi
4288   53b868:	e8 00 00 00 00       	call   53b86d <balance_leaf+0x428d>	53b869: R_X86_64_PLT32	__asan_load4_noabort-0x4
428d   53b86d:	48 63 5d 00          	movslq 0x0(%rbp),%rbx
4291   53b871:	48 c1 e3 04          	shl    $0x4,%rbx
4295   53b875:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
4299   53b879:	48 83 c7 08          	add    $0x8,%rdi
429d   53b87d:	e8 00 00 00 00       	call   53b882 <balance_leaf+0x42a2>	53b87e: R_X86_64_PLT32	__asan_load8_noabort-0x4
42a2   53b882:	48 8b 5c 1d 08       	mov    0x8(%rbp,%rbx,1),%rbx
42a7   53b887:	48 8d bc 24 b8 00 00 00 	lea    0xb8(%rsp),%rdi
42af   53b88f:	e8 00 00 00 00       	call   53b894 <balance_leaf+0x42b4>	53b890: R_X86_64_PLT32	__asan_store8_noabort-0x4
42b4   53b894:	48 89 9c 24 b8 00 00 00 	mov    %rbx,0xb8(%rsp)
42bc   53b89c:	8b 45 00             	mov    0x0(%rbp),%eax
42bf   53b89f:	83 c0 ff             	add    $0xffffffff,%eax
42c2   53b8a2:	48 63 d8             	movslq %eax,%rbx
42c5   53b8a5:	48 c1 e3 04          	shl    $0x4,%rbx
42c9   53b8a9:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
42cd   53b8ad:	48 83 c7 08          	add    $0x8,%rdi
42d1   53b8b1:	e8 00 00 00 00       	call   53b8b6 <balance_leaf+0x42d6>	53b8b2: R_X86_64_PLT32	__asan_load8_noabort-0x4
42d6   53b8b6:	48 8b 5c 1d 08       	mov    0x8(%rbp,%rbx,1),%rbx
42db   53b8bb:	48 8d bc 24 c0 00 00 00 	lea    0xc0(%rsp),%rdi
42e3   53b8c3:	e8 00 00 00 00       	call   53b8c8 <balance_leaf+0x42e8>	53b8c4: R_X86_64_PLT32	__asan_store8_noabort-0x4
42e8   53b8c8:	48 89 9c 24 c0 00 00 00 	mov    %rbx,0xc0(%rsp)
42f0   53b8d0:	8b 45 00             	mov    0x0(%rbp),%eax
42f3   53b8d3:	83 c0 ff             	add    $0xffffffff,%eax
42f6   53b8d6:	48 63 d8             	movslq %eax,%rbx
42f9   53b8d9:	48 c1 e3 04          	shl    $0x4,%rbx
42fd   53b8dd:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
4301   53b8e1:	48 83 c7 10          	add    $0x10,%rdi
4305   53b8e5:	e8 00 00 00 00       	call   53b8ea <balance_leaf+0x430a>	53b8e6: R_X86_64_PLT32	__asan_load4_noabort-0x4
430a   53b8ea:	8b 5c 1d 10          	mov    0x10(%rbp,%rbx,1),%ebx
430e   53b8ee:	48 8d bc 24 c8 00 00 00 	lea    0xc8(%rsp),%rdi
4316   53b8f6:	e8 00 00 00 00       	call   53b8fb <balance_leaf+0x431b>	53b8f7: R_X86_64_PLT32	__asan_store4_noabort-0x4
431b   53b8fb:	89 9c 24 c8 00 00 00 	mov    %ebx,0xc8(%rsp)
4322   53b902:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
4327   53b907:	e8 00 00 00 00       	call   53b90c <balance_leaf+0x432c>	53b908: R_X86_64_PLT32	__asan_load4_noabort-0x4
432c   53b90c:	45 8b 8d 54 02 00 00 	mov    0x254(%r13),%r9d
4333   53b913:	48 8d bc 24 b0 00 00 00 	lea    0xb0(%rsp),%rdi
433b   53b91b:	44 89 e6             	mov    %r12d,%esi
433e   53b91e:	8b 54 24 08          	mov    0x8(%rsp),%edx
4342   53b922:	44 89 f9             	mov    %r15d,%ecx
4345   53b925:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
434a   53b92a:	e8 00 00 00 00       	call   53b92f <balance_leaf+0x434f>	53b92b: R_X86_64_PLT32	leaf_paste_in_buffer-0x4
434f   53b92f:	be 02 00 00 00       	mov    $0x2,%esi
4354   53b934:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
4359   53b939:	48 89 df             	mov    %rbx,%rdi
435c   53b93c:	e8 00 00 00 00       	call   53b941 <balance_leaf+0x4361>	53b93d: R_X86_64_PLT32	__asan_loadN_noabort-0x4
4361   53b941:	66 83 3b 00          	cmpw   $0x0,(%rbx)
4365   53b945:	48 8b 5c 24 40       	mov    0x40(%rsp),%rbx
436a   53b94a:	0f 84 ed 01 00 00    	je     53bb3d <balance_leaf+0x455d>
4370   53b950:	4a 8d 3c f3          	lea    (%rbx,%r14,8),%rdi
4374   53b954:	48 83 c7 08          	add    $0x8,%rdi
4378   53b958:	be 08 00 00 00       	mov    $0x8,%esi
437d   53b95d:	e8 00 00 00 00       	call   53b962 <balance_leaf+0x4382>	53b95e: R_X86_64_PLT32	__asan_loadN_noabort-0x4
4382   53b962:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
438c   53b96c:	4a 23 4c f3 08       	and    0x8(%rbx,%r14,8),%rcx
4391   53b971:	48 b8 00 00 00 00 00 00 00 10 	movabs $0x1000000000000000,%rax
439b   53b97b:	48 39 c1             	cmp    %rax,%rcx
439e   53b97e:	0f 85 52 06 00 00    	jne    53bfd6 <balance_leaf+0x49f6>
43a4   53b984:	e8 00 00 00 00       	call   53b989 <balance_leaf+0x43a9>	53b985: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
43a9   53b989:	e9 d2 01 00 00       	jmp    53bb60 <balance_leaf+0x4580>
43ae   53b98e:	45 85 ff             	test   %r15d,%r15d
43b1   53b991:	0f 85 ad 1a 00 00    	jne    53d444 <balance_leaf+0x5e64>
43b7   53b997:	e8 00 00 00 00       	call   53b99c <balance_leaf+0x43bc>	53b998: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
43bc   53b99c:	eb 05                	jmp    53b9a3 <balance_leaf+0x43c3>
43be   53b99e:	e8 00 00 00 00       	call   53b9a3 <balance_leaf+0x43c3>	53b99f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
43c3   53b9a3:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
43c8   53b9a8:	83 bc 24 d0 00 00 00 70 	cmpl   $0x70,0xd0(%rsp)
43d0   53b9b0:	0f 85 5f fc ff ff    	jne    53b615 <balance_leaf+0x4035>
43d6   53b9b6:	e9 31 fc ff ff       	jmp    53b5ec <balance_leaf+0x400c>
43db   53b9bb:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
43e0   53b9c0:	48 89 df             	mov    %rbx,%rdi
43e3   53b9c3:	e8 00 00 00 00       	call   53b9c8 <balance_leaf+0x43e8>	53b9c4: R_X86_64_PLT32	__asan_load4_noabort-0x4
43e8   53b9c8:	8b 03                	mov    (%rbx),%eax
43ea   53b9ca:	85 c0                	test   %eax,%eax
43ec   53b9cc:	0f 84 0b 1c 00 00    	je     53d5dd <balance_leaf+0x5ffd>
43f2   53b9d2:	41 89 c5             	mov    %eax,%r13d
43f5   53b9d5:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
43fa   53b9da:	e8 00 00 00 00       	call   53b9df <balance_leaf+0x43ff>	53b9db: R_X86_64_PLT32	__asan_store8_noabort-0x4
43ff   53b9df:	4c 8b 34 24          	mov    (%rsp),%r14
4403   53b9e3:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
4408   53b9e8:	48 89 ef             	mov    %rbp,%rdi
440b   53b9eb:	e8 00 00 00 00       	call   53b9f0 <balance_leaf+0x4410>	53b9ec: R_X86_64_PLT32	__asan_load4_noabort-0x4
4410   53b9f0:	48 63 5d 00          	movslq 0x0(%rbp),%rbx
4414   53b9f4:	48 c1 e3 04          	shl    $0x4,%rbx
4418   53b9f8:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
441c   53b9fc:	48 83 c7 08          	add    $0x8,%rdi
4420   53ba00:	e8 00 00 00 00       	call   53ba05 <balance_leaf+0x4425>	53ba01: R_X86_64_PLT32	__asan_load8_noabort-0x4
4425   53ba05:	48 8b 5c 1d 08       	mov    0x8(%rbp,%rbx,1),%rbx
442a   53ba0a:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
442f   53ba0f:	e8 00 00 00 00       	call   53ba14 <balance_leaf+0x4434>	53ba10: R_X86_64_PLT32	__asan_store8_noabort-0x4
4434   53ba14:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
4439   53ba19:	8b 45 00             	mov    0x0(%rbp),%eax
443c   53ba1c:	83 c0 ff             	add    $0xffffffff,%eax
443f   53ba1f:	48 63 d8             	movslq %eax,%rbx
4442   53ba22:	48 c1 e3 04          	shl    $0x4,%rbx
4446   53ba26:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
444a   53ba2a:	48 83 c7 08          	add    $0x8,%rdi
444e   53ba2e:	e8 00 00 00 00       	call   53ba33 <balance_leaf+0x4453>	53ba2f: R_X86_64_PLT32	__asan_load8_noabort-0x4
4453   53ba33:	48 8b 5c 1d 08       	mov    0x8(%rbp,%rbx,1),%rbx
4458   53ba38:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
445d   53ba3d:	e8 00 00 00 00       	call   53ba42 <balance_leaf+0x4462>	53ba3e: R_X86_64_PLT32	__asan_store8_noabort-0x4
4462   53ba42:	48 89 5c 24 30       	mov    %rbx,0x30(%rsp)
4467   53ba47:	8b 45 00             	mov    0x0(%rbp),%eax
446a   53ba4a:	83 c0 ff             	add    $0xffffffff,%eax
446d   53ba4d:	48 63 d8             	movslq %eax,%rbx
4470   53ba50:	48 c1 e3 04          	shl    $0x4,%rbx
4474   53ba54:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
4478   53ba58:	48 83 c7 10          	add    $0x10,%rdi
447c   53ba5c:	e8 00 00 00 00       	call   53ba61 <balance_leaf+0x4481>	53ba5d: R_X86_64_PLT32	__asan_load4_noabort-0x4
4481   53ba61:	8b 5c 1d 10          	mov    0x10(%rbp,%rbx,1),%ebx
4485   53ba65:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
448a   53ba6a:	e8 00 00 00 00       	call   53ba6f <balance_leaf+0x448f>	53ba6b: R_X86_64_PLT32	__asan_store4_noabort-0x4
448f   53ba6f:	89 5c 24 38          	mov    %ebx,0x38(%rsp)
4493   53ba73:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
4498   53ba78:	e8 00 00 00 00       	call   53ba7d <balance_leaf+0x449d>	53ba79: R_X86_64_PLT32	__asan_load4_noabort-0x4
449d   53ba7d:	45 8b 8e 54 02 00 00 	mov    0x254(%r14),%r9d
44a4   53ba84:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
44a9   53ba89:	44 89 e6             	mov    %r12d,%esi
44ac   53ba8c:	4c 89 f3             	mov    %r14,%rbx
44af   53ba8f:	44 89 fa             	mov    %r15d,%edx
44b2   53ba92:	44 89 e9             	mov    %r13d,%ecx
44b5   53ba95:	48 8b 6c 24 48       	mov    0x48(%rsp),%rbp
44ba   53ba9a:	49 89 e8             	mov    %rbp,%r8
44bd   53ba9d:	e8 00 00 00 00       	call   53baa2 <balance_leaf+0x44c2>	53ba9e: R_X86_64_PLT32	leaf_paste_in_buffer-0x4
44c2   53baa2:	4c 8b 6c 24 70       	mov    0x70(%rsp),%r13
44c7   53baa7:	4c 89 ef             	mov    %r13,%rdi
44ca   53baaa:	e8 00 00 00 00       	call   53baaf <balance_leaf+0x44cf>	53baab: R_X86_64_PLT32	__asan_load4_noabort-0x4
44cf   53baaf:	45 8b b6 28 02 00 00 	mov    0x228(%r14),%r14d
44d6   53bab6:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
44db   53babb:	e8 00 00 00 00       	call   53bac0 <balance_leaf+0x44e0>	53babc: R_X86_64_PLT32	__asan_load4_noabort-0x4
44e0   53bac0:	44 8b a3 50 02 00 00 	mov    0x250(%rbx),%r12d
44e7   53bac7:	4c 8d 7d 10          	lea    0x10(%rbp),%r15
44eb   53bacb:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
44f0   53bad0:	e8 00 00 00 00       	call   53bad5 <balance_leaf+0x44f5>	53bad1: R_X86_64_PLT32	__asan_load4_noabort-0x4
44f5   53bad5:	8b 83 f0 01 00 00    	mov    0x1f0(%rbx),%eax
44fb   53badb:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
4500   53bae0:	44 89 f6             	mov    %r14d,%esi
4503   53bae3:	44 89 e2             	mov    %r12d,%edx
4506   53bae6:	b9 01 00 00 00       	mov    $0x1,%ecx
450b   53baeb:	49 89 e8             	mov    %rbp,%r8
450e   53baee:	4d 89 f9             	mov    %r15,%r9
4511   53baf1:	50                   	push   %rax
4512   53baf2:	e8 00 00 00 00       	call   53baf7 <balance_leaf+0x4517>	53baf3: R_X86_64_PLT32	leaf_paste_entries-0x4
4517   53baf7:	48 83 c4 08          	add    $0x8,%rsp
451b   53bafb:	4c 89 ef             	mov    %r13,%rdi
451e   53bafe:	e8 00 00 00 00       	call   53bb03 <balance_leaf+0x4523>	53baff: R_X86_64_PLT32	__asan_load4_noabort-0x4
4523   53bb03:	83 bb 28 02 00 00 00 	cmpl   $0x0,0x228(%rbx)
452a   53bb0a:	0f 84 84 05 00 00    	je     53c094 <balance_leaf+0x4ab4>
4530   53bb10:	e8 00 00 00 00       	call   53bb15 <balance_leaf+0x4535>	53bb11: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4535   53bb15:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
453a   53bb1a:	e9 43 11 00 00       	jmp    53cc62 <balance_leaf+0x5682>
453f   53bb1f:	e8 00 00 00 00       	call   53bb24 <balance_leaf+0x4544>	53bb20: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4544   53bb24:	e9 06 fb ff ff       	jmp    53b62f <balance_leaf+0x404f>
4549   53bb29:	e8 00 00 00 00       	call   53bb2e <balance_leaf+0x454e>	53bb2a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
454e   53bb2e:	48 8b 3c 24          	mov    (%rsp),%rdi
4552   53bb32:	44 89 ee             	mov    %r13d,%esi
4555   53bb35:	44 89 f2             	mov    %r14d,%edx
4558   53bb38:	e9 8e d9 ff ff       	jmp    5394cb <balance_leaf+0x1eeb>
455d   53bb3d:	4a 8d 3c f3          	lea    (%rbx,%r14,8),%rdi
4561   53bb41:	48 83 c7 0c          	add    $0xc,%rdi
4565   53bb45:	be 04 00 00 00       	mov    $0x4,%esi
456a   53bb4a:	e8 00 00 00 00       	call   53bb4f <balance_leaf+0x456f>	53bb4b: R_X86_64_PLT32	__asan_loadN_noabort-0x4
456f   53bb4f:	42 83 7c f3 0c fe    	cmpl   $0xfffffffe,0xc(%rbx,%r14,8)
4575   53bb55:	0f 85 5f 05 00 00    	jne    53c0ba <balance_leaf+0x4ada>
457b   53bb5b:	e8 00 00 00 00       	call   53bb60 <balance_leaf+0x4580>	53bb5c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4580   53bb60:	4a 8d 3c f3          	lea    (%rbx,%r14,8),%rdi
4584   53bb64:	48 83 c7 10          	add    $0x10,%rdi
4588   53bb68:	be 02 00 00 00       	mov    $0x2,%esi
458d   53bb6d:	e8 00 00 00 00       	call   53bb72 <balance_leaf+0x4592>	53bb6e: R_X86_64_PLT32	__asan_storeN_noabort-0x4
4592   53bb72:	66 42 c7 44 f3 10 00 00 	movw   $0x0,0x10(%rbx,%r14,8)
459a   53bb7a:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
459f   53bb7f:	e9 de 10 00 00       	jmp    53cc62 <balance_leaf+0x5682>
45a4   53bb84:	e8 00 00 00 00       	call   53bb89 <balance_leaf+0x45a9>	53bb85: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
45a9   53bb89:	45 31 ff             	xor    %r15d,%r15d
45ac   53bb8c:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
45b1   53bb91:	48 89 df             	mov    %rbx,%rdi
45b4   53bb94:	e8 00 00 00 00       	call   53bb99 <balance_leaf+0x45b9>	53bb95: R_X86_64_PLT32	__asan_load4_noabort-0x4
45b9   53bb99:	8b 03                	mov    (%rbx),%eax
45bb   53bb9b:	4c 89 74 24 68       	mov    %r14,0x68(%rsp)
45c0   53bba0:	4c 89 f5             	mov    %r14,%rbp
45c3   53bba3:	48 29 c5             	sub    %rax,%rbp
45c6   53bba6:	44 89 f9             	mov    %r15d,%ecx
45c9   53bba9:	48 d3 e5             	shl    %cl,%rbp
45cc   53bbac:	4c 89 a4 24 a8 00 00 00 	mov    %r12,0xa8(%rsp)
45d4   53bbb4:	44 01 e5             	add    %r12d,%ebp
45d7   53bbb7:	be 04 00 00 00       	mov    $0x4,%esi
45dc   53bbbc:	4c 89 ef             	mov    %r13,%rdi
45df   53bbbf:	e8 00 00 00 00       	call   53bbc4 <balance_leaf+0x45e4>	53bbc0: R_X86_64_PLT32	__asan_storeN_noabort-0x4
45e4   53bbc4:	41 89 6d 00          	mov    %ebp,0x0(%r13)
45e8   53bbc8:	48 89 df             	mov    %rbx,%rdi
45eb   53bbcb:	e8 00 00 00 00       	call   53bbd0 <balance_leaf+0x45f0>	53bbcc: R_X86_64_PLT32	__asan_load4_noabort-0x4
45f0   53bbd0:	48 8b 1c 24          	mov    (%rsp),%rbx
45f4   53bbd4:	44 0f b7 bb 24 02 00 00 	movzwl 0x224(%rbx),%r15d
45fc   53bbdc:	be 02 00 00 00       	mov    $0x2,%esi
4601   53bbe1:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
4606   53bbe6:	48 89 ef             	mov    %rbp,%rdi
4609   53bbe9:	e8 00 00 00 00       	call   53bbee <balance_leaf+0x460e>	53bbea: R_X86_64_PLT32	__asan_storeN_noabort-0x4
460e   53bbee:	66 44 89 7d 00       	mov    %r15w,0x0(%rbp)
4613   53bbf3:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
4618   53bbf8:	e8 00 00 00 00       	call   53bbfd <balance_leaf+0x461d>	53bbf9: R_X86_64_PLT32	__asan_store8_noabort-0x4
461d   53bbfd:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
4622   53bc02:	48 8d 7b 48          	lea    0x48(%rbx),%rdi
4626   53bc06:	48 89 bc 24 d8 00 00 00 	mov    %rdi,0xd8(%rsp)
462e   53bc0e:	e8 00 00 00 00       	call   53bc13 <balance_leaf+0x4633>	53bc0f: R_X86_64_PLT32	__asan_load8_noabort-0x4
4633   53bc13:	48 8b 6b 48          	mov    0x48(%rbx),%rbp
4637   53bc17:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
463c   53bc1c:	e8 00 00 00 00       	call   53bc21 <balance_leaf+0x4641>	53bc1d: R_X86_64_PLT32	__asan_store8_noabort-0x4
4641   53bc21:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
4646   53bc26:	48 8d bb 98 00 00 00 	lea    0x98(%rbx),%rdi
464d   53bc2d:	e8 00 00 00 00       	call   53bc32 <balance_leaf+0x4652>	53bc2e: R_X86_64_PLT32	__asan_load8_noabort-0x4
4652   53bc32:	4c 8b a3 98 00 00 00 	mov    0x98(%rbx),%r12
4659   53bc39:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
465e   53bc3e:	e8 00 00 00 00       	call   53bc43 <balance_leaf+0x4663>	53bc3f: R_X86_64_PLT32	__asan_store8_noabort-0x4
4663   53bc43:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
4668   53bc48:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
4670   53bc50:	e8 00 00 00 00       	call   53bc55 <balance_leaf+0x4675>	53bc51: R_X86_64_PLT32	__asan_load8_noabort-0x4
4675   53bc55:	48 8b 5b 18          	mov    0x18(%rbx),%rbx
4679   53bc59:	48 89 df             	mov    %rbx,%rdi
467c   53bc5c:	e8 00 00 00 00       	call   53bc61 <balance_leaf+0x4681>	53bc5d: R_X86_64_PLT32	__asan_load4_noabort-0x4
4681   53bc61:	8b 03                	mov    (%rbx),%eax
4683   53bc63:	83 c0 ff             	add    $0xffffffff,%eax
4686   53bc66:	48 63 e8             	movslq %eax,%rbp
4689   53bc69:	48 c1 e5 04          	shl    $0x4,%rbp
468d   53bc6d:	4c 8d 3c 2b          	lea    (%rbx,%rbp,1),%r15
4691   53bc71:	49 83 c7 08          	add    $0x8,%r15
4695   53bc75:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
4699   53bc79:	48 83 c7 10          	add    $0x10,%rdi
469d   53bc7d:	e8 00 00 00 00       	call   53bc82 <balance_leaf+0x46a2>	53bc7e: R_X86_64_PLT32	__asan_load4_noabort-0x4
46a2   53bc82:	44 8b 6c 2b 10       	mov    0x10(%rbx,%rbp,1),%r13d
46a7   53bc87:	4c 89 ff             	mov    %r15,%rdi
46aa   53bc8a:	e8 00 00 00 00       	call   53bc8f <balance_leaf+0x46af>	53bc8b: R_X86_64_PLT32	__asan_load8_noabort-0x4
46af   53bc8f:	48 8b 5c 2b 08       	mov    0x8(%rbx,%rbp,1),%rbx
46b4   53bc94:	48 85 db             	test   %rbx,%rbx
46b7   53bc97:	0f 84 68 17 00 00    	je     53d405 <balance_leaf+0x5e25>
46bd   53bc9d:	4d 85 e4             	test   %r12,%r12
46c0   53bca0:	0f 84 5f 17 00 00    	je     53d405 <balance_leaf+0x5e25>
46c6   53bca6:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
46ca   53bcaa:	e8 00 00 00 00       	call   53bcaf <balance_leaf+0x46cf>	53bcab: R_X86_64_PLT32	__asan_load8_noabort-0x4
46cf   53bcaf:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
46d3   53bcb3:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
46d7   53bcb7:	e8 00 00 00 00       	call   53bcbc <balance_leaf+0x46dc>	53bcb8: R_X86_64_PLT32	__asan_load2_noabort-0x4
46dc   53bcbc:	0f b7 43 02          	movzwl 0x2(%rbx),%eax
46e0   53bcc0:	41 8d 6d 01          	lea    0x1(%r13),%ebp
46e4   53bcc4:	45 31 ff             	xor    %r15d,%r15d
46e7   53bcc7:	41 39 c5             	cmp    %eax,%r13d
46ea   53bcca:	41 0f 44 ef          	cmove  %r15d,%ebp
46ee   53bcce:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
46f3   53bcd3:	e8 00 00 00 00       	call   53bcd8 <balance_leaf+0x46f8>	53bcd4: R_X86_64_PLT32	__asan_store4_noabort-0x4
46f8   53bcd8:	89 6c 24 38          	mov    %ebp,0x38(%rsp)
46fc   53bcdc:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
4701   53bce1:	48 89 df             	mov    %rbx,%rdi
4704   53bce4:	e8 00 00 00 00       	call   53bce9 <balance_leaf+0x4709>	53bce5: R_X86_64_PLT32	__asan_load4_noabort-0x4
4709   53bce9:	48 63 03             	movslq (%rbx),%rax
470c   53bcec:	48 8b 6c 24 68       	mov    0x68(%rsp),%rbp
4711   53bcf1:	48 29 c5             	sub    %rax,%rbp
4714   53bcf4:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
4719   53bcf9:	48 89 df             	mov    %rbx,%rdi
471c   53bcfc:	e8 00 00 00 00       	call   53bd01 <balance_leaf+0x4721>	53bcfd: R_X86_64_PLT32	__asan_load4_noabort-0x4
4721   53bd01:	4c 63 33             	movslq (%rbx),%r14
4724   53bd04:	4c 39 f5             	cmp    %r14,%rbp
4727   53bd07:	7e 0f                	jle    53bd18 <balance_leaf+0x4738>
4729   53bd09:	e8 00 00 00 00       	call   53bd0e <balance_leaf+0x472e>	53bd0a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
472e   53bd0e:	48 03 6c 24 48       	add    0x48(%rsp),%rbp
4733   53bd13:	4c 29 f5             	sub    %r14,%rbp
4736   53bd16:	eb 1a                	jmp    53bd32 <balance_leaf+0x4752>
4738   53bd18:	e8 00 00 00 00       	call   53bd1d <balance_leaf+0x473d>	53bd19: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
473d   53bd1d:	48 89 df             	mov    %rbx,%rdi
4740   53bd20:	e8 00 00 00 00       	call   53bd25 <balance_leaf+0x4745>	53bd21: R_X86_64_PLT32	__asan_store4_noabort-0x4
4745   53bd25:	89 2b                	mov    %ebp,(%rbx)
4747   53bd27:	41 29 ee             	sub    %ebp,%r14d
474a   53bd2a:	45 89 f7             	mov    %r14d,%r15d
474d   53bd2d:	48 8b 6c 24 48       	mov    0x48(%rsp),%rbp
4752   53bd32:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
4757   53bd37:	4c 8b a4 24 a8 00 00 00 	mov    0xa8(%rsp),%r12
475f   53bd3f:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
4764   53bd44:	31 f6                	xor    %esi,%esi
4766   53bd46:	48 8b 9c 24 a0 00 00 00 	mov    0xa0(%rsp),%rbx
476e   53bd4e:	48 89 da             	mov    %rbx,%rdx
4771   53bd51:	48 89 e9             	mov    %rbp,%rcx
4774   53bd54:	45 89 f8             	mov    %r15d,%r8d
4777   53bd57:	e8 00 00 00 00       	call   53bd5c <balance_leaf+0x477c>	53bd58: R_X86_64_PLT32	leaf_insert_into_buf-0x4
477c   53bd5c:	48 8b 2c 24          	mov    (%rsp),%rbp
4780   53bd60:	48 8d bd e8 00 00 00 	lea    0xe8(%rbp),%rdi
4787   53bd67:	e8 00 00 00 00       	call   53bd6c <balance_leaf+0x478c>	53bd68: R_X86_64_PLT32	__asan_load8_noabort-0x4
478c   53bd6c:	4c 8b b5 e8 00 00 00 	mov    0xe8(%rbp),%r14
4793   53bd73:	48 8d bd dc 01 00 00 	lea    0x1dc(%rbp),%rdi
479a   53bd7a:	e8 00 00 00 00       	call   53bd7f <balance_leaf+0x479f>	53bd7b: R_X86_64_PLT32	__asan_load4_noabort-0x4
479f   53bd7f:	44 8b bd dc 01 00 00 	mov    0x1dc(%rbp),%r15d
47a6   53bd86:	48 8b bc 24 d8 00 00 00 	mov    0xd8(%rsp),%rdi
47ae   53bd8e:	e8 00 00 00 00       	call   53bd93 <balance_leaf+0x47b3>	53bd8f: R_X86_64_PLT32	__asan_load8_noabort-0x4
47b3   53bd93:	48 8b 4d 48          	mov    0x48(%rbp),%rcx
47b7   53bd97:	48 89 ef             	mov    %rbp,%rdi
47ba   53bd9a:	4c 89 f6             	mov    %r14,%rsi
47bd   53bd9d:	44 89 fa             	mov    %r15d,%edx
47c0   53bda0:	45 31 c0             	xor    %r8d,%r8d
47c3   53bda3:	e8 00 00 00 00       	call   53bda8 <balance_leaf+0x47c8>	53bda4: R_X86_64_PLT32	replace_key-0x4
47c8   53bda8:	be 02 00 00 00       	mov    $0x2,%esi
47cd   53bdad:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
47d5   53bdb5:	e8 00 00 00 00       	call   53bdba <balance_leaf+0x47da>	53bdb6: R_X86_64_PLT32	__asan_loadN_noabort-0x4
47da   53bdba:	66 83 7b 16 00       	cmpw   $0x0,0x16(%rbx)
47df   53bdbf:	74 2d                	je     53bdee <balance_leaf+0x480e>
47e1   53bdc1:	e8 00 00 00 00       	call   53bdc6 <balance_leaf+0x47e6>	53bdc2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
47e6   53bdc6:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
47ea   53bdca:	be 08 00 00 00       	mov    $0x8,%esi
47ef   53bdcf:	e8 00 00 00 00       	call   53bdd4 <balance_leaf+0x47f4>	53bdd0: R_X86_64_PLT32	__asan_loadN_noabort-0x4
47f4   53bdd4:	48 8b 43 08          	mov    0x8(%rbx),%rax
47f8   53bdd8:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
4802   53bde2:	48 21 c8             	and    %rcx,%rax
4805   53bde5:	4c 09 e0             	or     %r12,%rax
4808   53bde8:	48 89 43 08          	mov    %rax,0x8(%rbx)
480c   53bdec:	eb 17                	jmp    53be05 <balance_leaf+0x4825>
480e   53bdee:	e8 00 00 00 00       	call   53bdf3 <balance_leaf+0x4813>	53bdef: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4813   53bdf3:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
4817   53bdf7:	be 04 00 00 00       	mov    $0x4,%esi
481c   53bdfc:	e8 00 00 00 00       	call   53be01 <balance_leaf+0x4821>	53bdfd: R_X86_64_PLT32	__asan_storeN_noabort-0x4
4821   53be01:	44 89 63 08          	mov    %r12d,0x8(%rbx)
4825   53be05:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
482a   53be0a:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
482f   53be0f:	4c 89 f7             	mov    %r14,%rdi
4832   53be12:	e8 00 00 00 00       	call   53be17 <balance_leaf+0x4837>	53be13: R_X86_64_PLT32	__asan_load4_noabort-0x4
4837   53be17:	0f b7 9c 24 98 00 00 00 	movzwl 0x98(%rsp),%ebx
483f   53be1f:	66 41 2b 1e          	sub    (%r14),%bx
4843   53be23:	be 02 00 00 00       	mov    $0x2,%esi
4848   53be28:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
484d   53be2d:	48 89 ef             	mov    %rbp,%rdi
4850   53be30:	e8 00 00 00 00       	call   53be35 <balance_leaf+0x4855>	53be31: R_X86_64_PLT32	__asan_storeN_noabort-0x4
4855   53be35:	66 89 5d 00          	mov    %bx,0x0(%rbp)
4859   53be39:	41 8b 1e             	mov    (%r14),%ebx
485c   53be3c:	4c 89 ef             	mov    %r13,%rdi
485f   53be3f:	e8 00 00 00 00       	call   53be44 <balance_leaf+0x4864>	53be40: R_X86_64_PLT32	__asan_load4_noabort-0x4
4864   53be44:	41 29 5d 00          	sub    %ebx,0x0(%r13)
4868   53be48:	e9 37 e2 ff ff       	jmp    53a084 <balance_leaf+0x2aa4>
486d   53be4d:	e8 00 00 00 00       	call   53be52 <balance_leaf+0x4872>	53be4e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4872   53be52:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
4877   53be57:	48 89 df             	mov    %rbx,%rdi
487a   53be5a:	e8 00 00 00 00       	call   53be5f <balance_leaf+0x487f>	53be5b: R_X86_64_PLT32	__asan_load4_noabort-0x4
487f   53be5f:	45 31 ff             	xor    %r15d,%r15d
4882   53be62:	2b 2b                	sub    (%rbx),%ebp
4884   53be64:	41 0f 48 ef          	cmovs  %r15d,%ebp
4888   53be68:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
488d   53be6d:	48 89 df             	mov    %rbx,%rdi
4890   53be70:	e8 00 00 00 00       	call   53be75 <balance_leaf+0x4895>	53be71: R_X86_64_PLT32	__asan_load4_noabort-0x4
4895   53be75:	8b 1b                	mov    (%rbx),%ebx
4897   53be77:	4b 8d 3c f4          	lea    (%r12,%r14,8),%rdi
489b   53be7b:	48 83 c7 12          	add    $0x12,%rdi
489f   53be7f:	be 02 00 00 00       	mov    $0x2,%esi
48a4   53be84:	e8 00 00 00 00       	call   53be89 <balance_leaf+0x48a9>	53be85: R_X86_64_PLT32	__asan_loadN_noabort-0x4
48a9   53be89:	48 89 ea             	mov    %rbp,%rdx
48ac   53be8c:	43 0f b7 6c f4 12    	movzwl 0x12(%r12,%r14,8),%ebp
48b2   53be92:	39 eb                	cmp    %ebp,%ebx
48b4   53be94:	0f 85 d6 16 00 00    	jne    53d570 <balance_leaf+0x5f90>
48ba   53be9a:	49 bc 00 00 00 00 00 00 00 10 	movabs $0x1000000000000000,%r12
48c4   53bea4:	4c 8b 34 24          	mov    (%rsp),%r14
48c8   53bea8:	4c 89 f7             	mov    %r14,%rdi
48cb   53beab:	44 89 ee             	mov    %r13d,%esi
48ce   53beae:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
48d3   53beb3:	e8 00 00 00 00       	call   53beb8 <balance_leaf+0x48d8>	53beb4: R_X86_64_PLT32	leaf_shift_right-0x4
48d8   53beb8:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
48dd   53bebd:	4c 89 ef             	mov    %r13,%rdi
48e0   53bec0:	e8 00 00 00 00       	call   53bec5 <balance_leaf+0x48e5>	53bec1: R_X86_64_PLT32	__asan_load4_noabort-0x4
48e5   53bec5:	41 8b ae f0 01 00 00 	mov    0x1f0(%r14),%ebp
48ec   53becc:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
48f1   53bed1:	e8 00 00 00 00       	call   53bed6 <balance_leaf+0x48f6>	53bed2: R_X86_64_PLT32	__asan_load4_noabort-0x4
48f6   53bed6:	41 2b ae 24 02 00 00 	sub    0x224(%r14),%ebp
48fd   53bedd:	44 0f 49 fd          	cmovns %ebp,%r15d
4901   53bee1:	4c 89 7c 24 10       	mov    %r15,0x10(%rsp)
4906   53bee6:	49 8d 7e 48          	lea    0x48(%r14),%rdi
490a   53beea:	48 89 7c 24 68       	mov    %rdi,0x68(%rsp)
490f   53beef:	e8 00 00 00 00       	call   53bef4 <balance_leaf+0x4914>	53bef0: R_X86_64_PLT32	__asan_load8_noabort-0x4
4914   53bef4:	49 8b 5e 48          	mov    0x48(%r14),%rbx
4918   53bef8:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
491c   53befc:	e8 00 00 00 00       	call   53bf01 <balance_leaf+0x4921>	53befd: R_X86_64_PLT32	__asan_load8_noabort-0x4
4921   53bf01:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
4925   53bf05:	48 8d 7b 2e          	lea    0x2e(%rbx),%rdi
4929   53bf09:	be 02 00 00 00       	mov    $0x2,%esi
492e   53bf0e:	e8 00 00 00 00       	call   53bf13 <balance_leaf+0x4933>	53bf0f: R_X86_64_PLT32	__asan_loadN_noabort-0x4
4933   53bf13:	66 83 7b 2e 00       	cmpw   $0x0,0x2e(%rbx)
4938   53bf18:	89 ac 24 80 00 00 00 	mov    %ebp,0x80(%rsp)
493f   53bf1f:	74 65                	je     53bf86 <balance_leaf+0x49a6>
4941   53bf21:	4d 89 e6             	mov    %r12,%r14
4944   53bf24:	4c 8d 63 20          	lea    0x20(%rbx),%r12
4948   53bf28:	be 08 00 00 00       	mov    $0x8,%esi
494d   53bf2d:	4c 89 e7             	mov    %r12,%rdi
4950   53bf30:	e8 00 00 00 00       	call   53bf35 <balance_leaf+0x4955>	53bf31: R_X86_64_PLT32	__asan_loadN_noabort-0x4
4955   53bf35:	48 8b 5b 20          	mov    0x20(%rbx),%rbx
4959   53bf39:	49 89 dd             	mov    %rbx,%r13
495c   53bf3c:	48 b8 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rax
4966   53bf46:	49 21 c5             	and    %rax,%r13
4969   53bf49:	4d 39 f5             	cmp    %r14,%r13
496c   53bf4c:	0f 85 93 00 00 00    	jne    53bfe5 <balance_leaf+0x4a05>
4972   53bf52:	e8 00 00 00 00       	call   53bf57 <balance_leaf+0x4977>	53bf53: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4977   53bf57:	48 8b ac 24 90 00 00 00 	mov    0x90(%rsp),%rbp
497f   53bf5f:	48 89 ef             	mov    %rbp,%rdi
4982   53bf62:	e8 00 00 00 00       	call   53bf67 <balance_leaf+0x4987>	53bf63: R_X86_64_PLT32	__asan_load8_noabort-0x4
4987   53bf67:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
498b   53bf6b:	48 8d 7d 14          	lea    0x14(%rbp),%rdi
498f   53bf6f:	e8 00 00 00 00       	call   53bf74 <balance_leaf+0x4994>	53bf70: R_X86_64_PLT32	__asan_load1_noabort-0x4
4994   53bf74:	8a 4d 14             	mov    0x14(%rbp),%cl
4997   53bf77:	80 c1 fe             	add    $0xfe,%cl
499a   53bf7a:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
499f   53bf7f:	d3 e0                	shl    %cl,%eax
49a1   53bf81:	4c 63 f8             	movslq %eax,%r15
49a4   53bf84:	eb 69                	jmp    53bfef <balance_leaf+0x4a0f>
49a6   53bf86:	48 8d 7b 24          	lea    0x24(%rbx),%rdi
49aa   53bf8a:	be 04 00 00 00       	mov    $0x4,%esi
49af   53bf8f:	e8 00 00 00 00       	call   53bf94 <balance_leaf+0x49b4>	53bf90: R_X86_64_PLT32	__asan_loadN_noabort-0x4
49b4   53bf94:	83 7b 24 fe          	cmpl   $0xfffffffe,0x24(%rbx)
49b8   53bf98:	0f 85 3a 01 00 00    	jne    53c0d8 <balance_leaf+0x4af8>
49be   53bf9e:	e8 00 00 00 00       	call   53bfa3 <balance_leaf+0x49c3>	53bf9f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
49c3   53bfa3:	48 8b ac 24 90 00 00 00 	mov    0x90(%rsp),%rbp
49cb   53bfab:	48 89 ef             	mov    %rbp,%rdi
49ce   53bfae:	e8 00 00 00 00       	call   53bfb3 <balance_leaf+0x49d3>	53bfaf: R_X86_64_PLT32	__asan_load8_noabort-0x4
49d3   53bfb3:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
49d7   53bfb7:	48 8d 7d 14          	lea    0x14(%rbp),%rdi
49db   53bfbb:	e8 00 00 00 00       	call   53bfc0 <balance_leaf+0x49e0>	53bfbc: R_X86_64_PLT32	__asan_load1_noabort-0x4
49e0   53bfc0:	8a 4d 14             	mov    0x14(%rbp),%cl
49e3   53bfc3:	80 c1 fe             	add    $0xfe,%cl
49e6   53bfc6:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
49eb   53bfcb:	41 89 c7             	mov    %eax,%r15d
49ee   53bfce:	41 d3 e7             	shl    %cl,%r15d
49f1   53bfd1:	e9 0f 01 00 00       	jmp    53c0e5 <balance_leaf+0x4b05>
49f6   53bfd6:	e8 00 00 00 00       	call   53bfdb <balance_leaf+0x49fb>	53bfd7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
49fb   53bfdb:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
4a00   53bfe0:	e9 7d 0c 00 00       	jmp    53cc62 <balance_leaf+0x5682>
4a05   53bfe5:	e8 00 00 00 00       	call   53bfea <balance_leaf+0x4a0a>	53bfe6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4a0a   53bfea:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
4a0f   53bfef:	4c 01 fb             	add    %r15,%rbx
4a12   53bff2:	49 8d 46 ff          	lea    -0x1(%r14),%rax
4a16   53bff6:	48 89 84 24 98 00 00 00 	mov    %rax,0x98(%rsp)
4a1e   53bffe:	48 21 c3             	and    %rax,%rbx
4a21   53c001:	4c 09 eb             	or     %r13,%rbx
4a24   53c004:	be 08 00 00 00       	mov    $0x8,%esi
4a29   53c009:	4c 89 e7             	mov    %r12,%rdi
4a2c   53c00c:	e8 00 00 00 00       	call   53c011 <balance_leaf+0x4a31>	53c00d: R_X86_64_PLT32	__asan_storeN_noabort-0x4
4a31   53c011:	49 89 1c 24          	mov    %rbx,(%r12)
4a35   53c015:	48 8b 2c 24          	mov    (%rsp),%rbp
4a39   53c019:	4c 8d a5 e8 00 00 00 	lea    0xe8(%rbp),%r12
4a40   53c020:	4c 89 e7             	mov    %r12,%rdi
4a43   53c023:	e8 00 00 00 00       	call   53c028 <balance_leaf+0x4a48>	53c024: R_X86_64_PLT32	__asan_load8_noabort-0x4
4a48   53c028:	4c 8b b5 e8 00 00 00 	mov    0xe8(%rbp),%r14
4a4f   53c02f:	48 8d bd dc 01 00 00 	lea    0x1dc(%rbp),%rdi
4a56   53c036:	e8 00 00 00 00       	call   53c03b <balance_leaf+0x4a5b>	53c037: R_X86_64_PLT32	__asan_load4_noabort-0x4
4a5b   53c03b:	48 63 9d dc 01 00 00 	movslq 0x1dc(%rbp),%rbx
4a62   53c042:	49 8d 7e 28          	lea    0x28(%r14),%rdi
4a66   53c046:	e8 00 00 00 00       	call   53c04b <balance_leaf+0x4a6b>	53c047: R_X86_64_PLT32	__asan_load8_noabort-0x4
4a6b   53c04b:	4d 8b 76 28          	mov    0x28(%r14),%r14
4a6f   53c04f:	48 c1 e3 04          	shl    $0x4,%rbx
4a73   53c053:	49 8d 3c 1e          	lea    (%r14,%rbx,1),%rdi
4a77   53c057:	48 83 c7 20          	add    $0x20,%rdi
4a7b   53c05b:	be 08 00 00 00       	mov    $0x8,%esi
4a80   53c060:	e8 00 00 00 00       	call   53c065 <balance_leaf+0x4a85>	53c061: R_X86_64_PLT32	__asan_loadN_noabort-0x4
4a85   53c065:	49 8b 44 1e 20       	mov    0x20(%r14,%rbx,1),%rax
4a8a   53c06a:	49 01 c7             	add    %rax,%r15
4a8d   53c06d:	4c 23 bc 24 98 00 00 00 	and    0x98(%rsp),%r15
4a95   53c075:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
4a9f   53c07f:	48 21 c8             	and    %rcx,%rax
4aa2   53c082:	4c 09 f8             	or     %r15,%rax
4aa5   53c085:	49 89 44 1e 20       	mov    %rax,0x20(%r14,%rbx,1)
4aaa   53c08a:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
4aaf   53c08f:	e9 b7 00 00 00       	jmp    53c14b <balance_leaf+0x4b6b>
4ab4   53c094:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
4ab9   53c099:	48 89 ef             	mov    %rbp,%rdi
4abc   53c09c:	e8 00 00 00 00       	call   53c0a1 <balance_leaf+0x4ac1>	53c09d: R_X86_64_PLT32	__asan_load4_noabort-0x4
4ac1   53c0a1:	83 7d 00 00          	cmpl   $0x0,0x0(%rbp)
4ac5   53c0a5:	0f 84 58 0b 00 00    	je     53cc03 <balance_leaf+0x5623>
4acb   53c0ab:	e8 00 00 00 00       	call   53c0b0 <balance_leaf+0x4ad0>	53c0ac: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4ad0   53c0b0:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
4ad5   53c0b5:	e9 a8 0b 00 00       	jmp    53cc62 <balance_leaf+0x5682>
4ada   53c0ba:	e8 00 00 00 00       	call   53c0bf <balance_leaf+0x4adf>	53c0bb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4adf   53c0bf:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
4ae4   53c0c4:	e9 99 0b 00 00       	jmp    53cc62 <balance_leaf+0x5682>
4ae9   53c0c9:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
4aee   53c0ce:	e8 00 00 00 00       	call   53c0d3 <balance_leaf+0x4af3>	53c0cf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4af3   53c0d3:	e9 a2 05 00 00       	jmp    53c67a <balance_leaf+0x509a>
4af8   53c0d8:	e8 00 00 00 00       	call   53c0dd <balance_leaf+0x4afd>	53c0d9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4afd   53c0dd:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
4b02   53c0e2:	41 89 c7             	mov    %eax,%r15d
4b05   53c0e5:	48 8d 7b 20          	lea    0x20(%rbx),%rdi
4b09   53c0e9:	be 04 00 00 00       	mov    $0x4,%esi
4b0e   53c0ee:	e8 00 00 00 00       	call   53c0f3 <balance_leaf+0x4b13>	53c0ef: R_X86_64_PLT32	__asan_loadN_noabort-0x4
4b13   53c0f3:	44 01 7b 20          	add    %r15d,0x20(%rbx)
4b17   53c0f7:	4c 89 f5             	mov    %r14,%rbp
4b1a   53c0fa:	4d 8d a6 e8 00 00 00 	lea    0xe8(%r14),%r12
4b21   53c101:	4c 89 e7             	mov    %r12,%rdi
4b24   53c104:	e8 00 00 00 00       	call   53c109 <balance_leaf+0x4b29>	53c105: R_X86_64_PLT32	__asan_load8_noabort-0x4
4b29   53c109:	4d 8b b6 e8 00 00 00 	mov    0xe8(%r14),%r14
4b30   53c110:	48 8d bd dc 01 00 00 	lea    0x1dc(%rbp),%rdi
4b37   53c117:	e8 00 00 00 00       	call   53c11c <balance_leaf+0x4b3c>	53c118: R_X86_64_PLT32	__asan_load4_noabort-0x4
4b3c   53c11c:	48 63 9d dc 01 00 00 	movslq 0x1dc(%rbp),%rbx
4b43   53c123:	49 8d 7e 28          	lea    0x28(%r14),%rdi
4b47   53c127:	e8 00 00 00 00       	call   53c12c <balance_leaf+0x4b4c>	53c128: R_X86_64_PLT32	__asan_load8_noabort-0x4
4b4c   53c12c:	4d 8b 76 28          	mov    0x28(%r14),%r14
4b50   53c130:	48 c1 e3 04          	shl    $0x4,%rbx
4b54   53c134:	49 8d 3c 1e          	lea    (%r14,%rbx,1),%rdi
4b58   53c138:	48 83 c7 20          	add    $0x20,%rdi
4b5c   53c13c:	be 04 00 00 00       	mov    $0x4,%esi
4b61   53c141:	e8 00 00 00 00       	call   53c146 <balance_leaf+0x4b66>	53c142: R_X86_64_PLT32	__asan_loadN_noabort-0x4
4b66   53c146:	45 01 7c 1e 20       	add    %r15d,0x20(%r14,%rbx,1)
4b6b   53c14b:	4c 89 e7             	mov    %r12,%rdi
4b6e   53c14e:	e8 00 00 00 00       	call   53c153 <balance_leaf+0x4b73>	53c14f: R_X86_64_PLT32	__asan_load8_noabort-0x4
4b73   53c153:	48 8b 9d e8 00 00 00 	mov    0xe8(%rbp),%rbx
4b7a   53c15a:	48 8d 7d 10          	lea    0x10(%rbp),%rdi
4b7e   53c15e:	e8 00 00 00 00       	call   53c163 <balance_leaf+0x4b83>	53c15f: R_X86_64_PLT32	__asan_load8_noabort-0x4
4b83   53c163:	48 8b 7d 10          	mov    0x10(%rbp),%rdi
4b87   53c167:	48 89 de             	mov    %rbx,%rsi
4b8a   53c16a:	e8 00 00 00 00       	call   53c16f <balance_leaf+0x4b8f>	53c16b: R_X86_64_PLT32	journal_mark_dirty-0x4
4b8f   53c16f:	48 8d bc 24 b0 00 00 00 	lea    0xb0(%rsp),%rdi
4b97   53c177:	e8 00 00 00 00       	call   53c17c <balance_leaf+0x4b9c>	53c178: R_X86_64_PLT32	__asan_store8_noabort-0x4
4b9c   53c17c:	48 89 ac 24 b0 00 00 00 	mov    %rbp,0xb0(%rsp)
4ba4   53c184:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
4ba9   53c189:	e8 00 00 00 00       	call   53c18e <balance_leaf+0x4bae>	53c18a: R_X86_64_PLT32	__asan_load8_noabort-0x4
4bae   53c18e:	48 8b 5d 48          	mov    0x48(%rbp),%rbx
4bb2   53c192:	48 8d bc 24 b8 00 00 00 	lea    0xb8(%rsp),%rdi
4bba   53c19a:	e8 00 00 00 00       	call   53c19f <balance_leaf+0x4bbf>	53c19b: R_X86_64_PLT32	__asan_store8_noabort-0x4
4bbf   53c19f:	48 89 9c 24 b8 00 00 00 	mov    %rbx,0xb8(%rsp)
4bc7   53c1a7:	48 8d bd 98 00 00 00 	lea    0x98(%rbp),%rdi
4bce   53c1ae:	e8 00 00 00 00       	call   53c1b3 <balance_leaf+0x4bd3>	53c1af: R_X86_64_PLT32	__asan_load8_noabort-0x4
4bd3   53c1b3:	4c 8b a5 98 00 00 00 	mov    0x98(%rbp),%r12
4bda   53c1ba:	48 8d bc 24 c0 00 00 00 	lea    0xc0(%rsp),%rdi
4be2   53c1c2:	e8 00 00 00 00       	call   53c1c7 <balance_leaf+0x4be7>	53c1c3: R_X86_64_PLT32	__asan_store8_noabort-0x4
4be7   53c1c7:	4c 89 a4 24 c0 00 00 00 	mov    %r12,0xc0(%rsp)
4bef   53c1cf:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
4bf7   53c1d7:	e8 00 00 00 00       	call   53c1dc <balance_leaf+0x4bfc>	53c1d8: R_X86_64_PLT32	__asan_load8_noabort-0x4
4bfc   53c1dc:	48 8b 5d 18          	mov    0x18(%rbp),%rbx
4c00   53c1e0:	48 89 df             	mov    %rbx,%rdi
4c03   53c1e3:	e8 00 00 00 00       	call   53c1e8 <balance_leaf+0x4c08>	53c1e4: R_X86_64_PLT32	__asan_load4_noabort-0x4
4c08   53c1e8:	8b 03                	mov    (%rbx),%eax
4c0a   53c1ea:	83 c0 ff             	add    $0xffffffff,%eax
4c0d   53c1ed:	48 63 e8             	movslq %eax,%rbp
4c10   53c1f0:	48 c1 e5 04          	shl    $0x4,%rbp
4c14   53c1f4:	4c 8d 34 2b          	lea    (%rbx,%rbp,1),%r14
4c18   53c1f8:	49 83 c6 08          	add    $0x8,%r14
4c1c   53c1fc:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
4c20   53c200:	48 83 c7 10          	add    $0x10,%rdi
4c24   53c204:	e8 00 00 00 00       	call   53c209 <balance_leaf+0x4c29>	53c205: R_X86_64_PLT32	__asan_load4_noabort-0x4
4c29   53c209:	44 8b 7c 2b 10       	mov    0x10(%rbx,%rbp,1),%r15d
4c2e   53c20e:	4c 89 f7             	mov    %r14,%rdi
4c31   53c211:	e8 00 00 00 00       	call   53c216 <balance_leaf+0x4c36>	53c212: R_X86_64_PLT32	__asan_load8_noabort-0x4
4c36   53c216:	48 8b 5c 2b 08       	mov    0x8(%rbx,%rbp,1),%rbx
4c3b   53c21b:	48 85 db             	test   %rbx,%rbx
4c3e   53c21e:	0f 84 7f 13 00 00    	je     53d5a3 <balance_leaf+0x5fc3>
4c44   53c224:	4d 85 e4             	test   %r12,%r12
4c47   53c227:	0f 84 76 13 00 00    	je     53d5a3 <balance_leaf+0x5fc3>
4c4d   53c22d:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
4c51   53c231:	e8 00 00 00 00       	call   53c236 <balance_leaf+0x4c56>	53c232: R_X86_64_PLT32	__asan_load8_noabort-0x4
4c56   53c236:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
4c5a   53c23a:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4c5e   53c23e:	e8 00 00 00 00       	call   53c243 <balance_leaf+0x4c63>	53c23f: R_X86_64_PLT32	__asan_load2_noabort-0x4
4c63   53c243:	0f b7 43 02          	movzwl 0x2(%rbx),%eax
4c67   53c247:	41 8d 5f 01          	lea    0x1(%r15),%ebx
4c6b   53c24b:	45 31 e4             	xor    %r12d,%r12d
4c6e   53c24e:	41 39 c7             	cmp    %eax,%r15d
4c71   53c251:	41 0f 44 dc          	cmove  %r12d,%ebx
4c75   53c255:	48 8d bc 24 c8 00 00 00 	lea    0xc8(%rsp),%rdi
4c7d   53c25d:	e8 00 00 00 00       	call   53c262 <balance_leaf+0x4c82>	53c25e: R_X86_64_PLT32	__asan_store4_noabort-0x4
4c82   53c262:	89 9c 24 c8 00 00 00 	mov    %ebx,0xc8(%rsp)
4c89   53c269:	48 8b 6c 24 60       	mov    0x60(%rsp),%rbp
4c8e   53c26e:	48 89 ef             	mov    %rbp,%rdi
4c91   53c271:	e8 00 00 00 00       	call   53c276 <balance_leaf+0x4c96>	53c272: R_X86_64_PLT32	__asan_load4_noabort-0x4
4c96   53c276:	48 63 5d 00          	movslq 0x0(%rbp),%rbx
4c9a   53c27a:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
4c9f   53c27f:	44 39 f3             	cmp    %r14d,%ebx
4ca2   53c282:	7d 13                	jge    53c297 <balance_leaf+0x4cb7>
4ca4   53c284:	e8 00 00 00 00       	call   53c289 <balance_leaf+0x4ca9>	53c285: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4ca9   53c289:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
4cae   53c28e:	4a 8d 2c 30          	lea    (%rax,%r14,1),%rbp
4cb2   53c292:	48 29 dd             	sub    %rbx,%rbp
4cb5   53c295:	eb 1c                	jmp    53c2b3 <balance_leaf+0x4cd3>
4cb7   53c297:	e8 00 00 00 00       	call   53c29c <balance_leaf+0x4cbc>	53c298: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4cbc   53c29c:	44 29 f3             	sub    %r14d,%ebx
4cbf   53c29f:	48 89 ef             	mov    %rbp,%rdi
4cc2   53c2a2:	e8 00 00 00 00       	call   53c2a7 <balance_leaf+0x4cc7>	53c2a3: R_X86_64_PLT32	__asan_store4_noabort-0x4
4cc7   53c2a7:	44 89 75 00          	mov    %r14d,0x0(%rbp)
4ccb   53c2ab:	41 89 dc             	mov    %ebx,%r12d
4cce   53c2ae:	48 8b 6c 24 48       	mov    0x48(%rsp),%rbp
4cd3   53c2b3:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
4cd8   53c2b8:	4c 89 ef             	mov    %r13,%rdi
4cdb   53c2bb:	e8 00 00 00 00       	call   53c2c0 <balance_leaf+0x4ce0>	53c2bc: R_X86_64_PLT32	__asan_load4_noabort-0x4
4ce0   53c2c0:	41 8b 4d 00          	mov    0x0(%r13),%ecx
4ce4   53c2c4:	44 29 f1             	sub    %r14d,%ecx
4ce7   53c2c7:	48 8d bc 24 b0 00 00 00 	lea    0xb0(%rsp),%rdi
4cef   53c2cf:	31 f6                	xor    %esi,%esi
4cf1   53c2d1:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
4cf6   53c2d6:	49 89 e8             	mov    %rbp,%r8
4cf9   53c2d9:	45 89 e1             	mov    %r12d,%r9d
4cfc   53c2dc:	e8 00 00 00 00       	call   53c2e1 <balance_leaf+0x4d01>	53c2dd: R_X86_64_PLT32	leaf_paste_in_buffer-0x4
4d01   53c2e1:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
4d06   53c2e6:	48 89 df             	mov    %rbx,%rdi
4d09   53c2e9:	e8 00 00 00 00       	call   53c2ee <balance_leaf+0x4d0e>	53c2ea: R_X86_64_PLT32	__asan_load8_noabort-0x4
4d0e   53c2ee:	48 8b 1b             	mov    (%rbx),%rbx
4d11   53c2f1:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
4d15   53c2f5:	e8 00 00 00 00       	call   53c2fa <balance_leaf+0x4d1a>	53c2f6: R_X86_64_PLT32	__asan_load8_noabort-0x4
4d1a   53c2fa:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
4d1e   53c2fe:	48 8d 7b 2e          	lea    0x2e(%rbx),%rdi
4d22   53c302:	be 02 00 00 00       	mov    $0x2,%esi
4d27   53c307:	e8 00 00 00 00       	call   53c30c <balance_leaf+0x4d2c>	53c308: R_X86_64_PLT32	__asan_loadN_noabort-0x4
4d2c   53c30c:	66 83 7b 2e 00       	cmpw   $0x0,0x2e(%rbx)
4d31   53c311:	74 35                	je     53c348 <balance_leaf+0x4d68>
4d33   53c313:	48 8d 7b 20          	lea    0x20(%rbx),%rdi
4d37   53c317:	be 08 00 00 00       	mov    $0x8,%esi
4d3c   53c31c:	e8 00 00 00 00       	call   53c321 <balance_leaf+0x4d41>	53c31d: R_X86_64_PLT32	__asan_loadN_noabort-0x4
4d41   53c321:	48 8b 43 20          	mov    0x20(%rbx),%rax
4d45   53c325:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
4d4f   53c32f:	48 21 c8             	and    %rcx,%rax
4d52   53c332:	48 b9 00 00 00 00 00 00 00 10 	movabs $0x1000000000000000,%rcx
4d5c   53c33c:	48 39 c8             	cmp    %rcx,%rax
4d5f   53c33f:	75 36                	jne    53c377 <balance_leaf+0x4d97>
4d61   53c341:	e8 00 00 00 00       	call   53c346 <balance_leaf+0x4d66>	53c342: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4d66   53c346:	eb 19                	jmp    53c361 <balance_leaf+0x4d81>
4d68   53c348:	48 8d 7b 24          	lea    0x24(%rbx),%rdi
4d6c   53c34c:	be 04 00 00 00       	mov    $0x4,%esi
4d71   53c351:	e8 00 00 00 00       	call   53c356 <balance_leaf+0x4d76>	53c352: R_X86_64_PLT32	__asan_loadN_noabort-0x4
4d76   53c356:	83 7b 24 fe          	cmpl   $0xfffffffe,0x24(%rbx)
4d7a   53c35a:	75 22                	jne    53c37e <balance_leaf+0x4d9e>
4d7c   53c35c:	e8 00 00 00 00       	call   53c361 <balance_leaf+0x4d81>	53c35d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4d81   53c361:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
4d85   53c365:	be 02 00 00 00       	mov    $0x2,%esi
4d8a   53c36a:	e8 00 00 00 00       	call   53c36f <balance_leaf+0x4d8f>	53c36b: R_X86_64_PLT32	__asan_storeN_noabort-0x4
4d8f   53c36f:	66 c7 43 28 00 00    	movw   $0x0,0x28(%rbx)
4d95   53c375:	eb 0c                	jmp    53c383 <balance_leaf+0x4da3>
4d97   53c377:	e8 00 00 00 00       	call   53c37c <balance_leaf+0x4d9c>	53c378: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4d9c   53c37c:	eb 05                	jmp    53c383 <balance_leaf+0x4da3>
4d9e   53c37e:	e8 00 00 00 00       	call   53c383 <balance_leaf+0x4da3>	53c37f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4da3   53c383:	4c 89 ef             	mov    %r13,%rdi
4da6   53c386:	e8 00 00 00 00       	call   53c38b <balance_leaf+0x4dab>	53c387: R_X86_64_PLT32	__asan_store4_noabort-0x4
4dab   53c38b:	45 89 75 00          	mov    %r14d,0x0(%r13)
4daf   53c38f:	83 bc 24 80 00 00 00 00 	cmpl   $0x0,0x80(%rsp)
4db7   53c397:	7e 0a                	jle    53c3a3 <balance_leaf+0x4dc3>
4db9   53c399:	e8 00 00 00 00       	call   53c39e <balance_leaf+0x4dbe>	53c39a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4dbe   53c39e:	e9 e1 dc ff ff       	jmp    53a084 <balance_leaf+0x2aa4>
4dc3   53c3a3:	e8 00 00 00 00       	call   53c3a8 <balance_leaf+0x4dc8>	53c3a4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4dc8   53c3a8:	e9 cc 01 00 00       	jmp    53c579 <balance_leaf+0x4f99>
4dcd   53c3ad:	e8 00 00 00 00       	call   53c3b2 <balance_leaf+0x4dd2>	53c3ae: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4dd2   53c3b2:	49 8d 7f 28          	lea    0x28(%r15),%rdi
4dd6   53c3b6:	e8 00 00 00 00       	call   53c3bb <balance_leaf+0x4ddb>	53c3b7: R_X86_64_PLT32	__asan_load8_noabort-0x4
4ddb   53c3bb:	49 8b 5f 28          	mov    0x28(%r15),%rbx
4ddf   53c3bf:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4de3   53c3c3:	e8 00 00 00 00       	call   53c3c8 <balance_leaf+0x4de8>	53c3c4: R_X86_64_PLT32	__asan_load2_noabort-0x4
4de8   53c3c8:	44 0f b7 6b 02       	movzwl 0x2(%rbx),%r13d
4ded   53c3cd:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
4df2   53c3d2:	48 8d bc 24 c8 00 00 00 	lea    0xc8(%rsp),%rdi
4dfa   53c3da:	e8 00 00 00 00       	call   53c3df <balance_leaf+0x4dff>	53c3db: R_X86_64_PLT32	__asan_store4_noabort-0x4
4dff   53c3df:	44 89 ac 24 c8 00 00 00 	mov    %r13d,0xc8(%rsp)
4e07   53c3e7:	4f 8d 2c 76          	lea    (%r14,%r14,2),%r13
4e0b   53c3eb:	4a 8d 3c ed 12 00 00 00 	lea    0x12(,%r13,8),%rdi
4e13   53c3f3:	48 01 ef             	add    %rbp,%rdi
4e16   53c3f6:	be 02 00 00 00       	mov    $0x2,%esi
4e1b   53c3fb:	e8 00 00 00 00       	call   53c400 <balance_leaf+0x4e20>	53c3fc: R_X86_64_PLT32	__asan_loadN_noabort-0x4
4e20   53c400:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
4e25   53c405:	46 0f b7 64 ed 12    	movzwl 0x12(%rbp,%r13,8),%r12d
4e2b   53c40b:	48 8b 6c 24 60       	mov    0x60(%rsp),%rbp
4e30   53c410:	48 89 ef             	mov    %rbp,%rdi
4e33   53c413:	e8 00 00 00 00       	call   53c418 <balance_leaf+0x4e38>	53c414: R_X86_64_PLT32	__asan_load4_noabort-0x4
4e38   53c418:	44 8b 4d 00          	mov    0x0(%rbp),%r9d
4e3c   53c41c:	45 39 cf             	cmp    %r9d,%r15d
4e3f   53c41f:	45 0f 4c cf          	cmovl  %r15d,%r9d
4e43   53c423:	48 8d bc 24 b0 00 00 00 	lea    0xb0(%rsp),%rdi
4e4b   53c42b:	44 89 f6             	mov    %r14d,%esi
4e4e   53c42e:	44 89 e2             	mov    %r12d,%edx
4e51   53c431:	44 89 f9             	mov    %r15d,%ecx
4e54   53c434:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
4e59   53c439:	e8 00 00 00 00       	call   53c43e <balance_leaf+0x4e5e>	53c43a: R_X86_64_PLT32	leaf_paste_in_buffer-0x4
4e5e   53c43e:	48 8b 9c 24 98 00 00 00 	mov    0x98(%rsp),%rbx
4e66   53c446:	48 8d 7b 2a          	lea    0x2a(%rbx),%rdi
4e6a   53c44a:	be 02 00 00 00       	mov    $0x2,%esi
4e6f   53c44f:	e8 00 00 00 00       	call   53c454 <balance_leaf+0x4e74>	53c450: R_X86_64_PLT32	__asan_loadN_noabort-0x4
4e74   53c454:	66 83 7b 2a 00       	cmpw   $0x0,0x2a(%rbx)
4e79   53c459:	0f 85 cf 12 00 00    	jne    53d72e <balance_leaf+0x614e>
4e7f   53c45f:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
4e84   53c464:	48 89 df             	mov    %rbx,%rdi
4e87   53c467:	e8 00 00 00 00       	call   53c46c <balance_leaf+0x4e8c>	53c468: R_X86_64_PLT32	__asan_load8_noabort-0x4
4e8c   53c46c:	4c 8b 33             	mov    (%rbx),%r14
4e8f   53c46f:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
4e94   53c474:	48 89 df             	mov    %rbx,%rdi
4e97   53c477:	e8 00 00 00 00       	call   53c47c <balance_leaf+0x4e9c>	53c478: R_X86_64_PLT32	__asan_load4_noabort-0x4
4e9c   53c47c:	8b ac 24 80 00 00 00 	mov    0x80(%rsp),%ebp
4ea3   53c483:	03 2b                	add    (%rbx),%ebp
4ea5   53c485:	49 8d 7e 28          	lea    0x28(%r14),%rdi
4ea9   53c489:	e8 00 00 00 00       	call   53c48e <balance_leaf+0x4eae>	53c48a: R_X86_64_PLT32	__asan_load8_noabort-0x4
4eae   53c48e:	49 8b 46 28          	mov    0x28(%r14),%rax
4eb2   53c492:	48 63 cd             	movslq %ebp,%rcx
4eb5   53c495:	48 8d 0c 49          	lea    (%rcx,%rcx,2),%rcx
4eb9   53c499:	48 8d 34 c8          	lea    (%rax,%rcx,8),%rsi
4ebd   53c49d:	48 83 c6 18          	add    $0x18,%rsi
4ec1   53c4a1:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
4ec6   53c4a6:	e8 00 00 00 00       	call   53c4ab <balance_leaf+0x4ecb>	53c4a7: R_X86_64_PLT32	comp_short_le_keys-0x4
4ecb   53c4ab:	85 c0                	test   %eax,%eax
4ecd   53c4ad:	0f 85 ae 12 00 00    	jne    53d761 <balance_leaf+0x6181>
4ed3   53c4b3:	49 be 00 00 00 00 00 00 00 10 	movabs $0x1000000000000000,%r14
4edd   53c4bd:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
4ee2   53c4c2:	4a 8d 3c eb          	lea    (%rbx,%r13,8),%rdi
4ee6   53c4c6:	48 83 c7 16          	add    $0x16,%rdi
4eea   53c4ca:	be 02 00 00 00       	mov    $0x2,%esi
4eef   53c4cf:	e8 00 00 00 00       	call   53c4d4 <balance_leaf+0x4ef4>	53c4d0: R_X86_64_PLT32	__asan_loadN_noabort-0x4
4ef4   53c4d4:	66 42 83 7c eb 16 00 	cmpw   $0x0,0x16(%rbx,%r13,8)
4efb   53c4db:	0f 84 ad 00 00 00    	je     53c58e <balance_leaf+0x4fae>
4f01   53c4e1:	4a 8d 3c eb          	lea    (%rbx,%r13,8),%rdi
4f05   53c4e5:	48 83 c7 08          	add    $0x8,%rdi
4f09   53c4e9:	be 08 00 00 00       	mov    $0x8,%esi
4f0e   53c4ee:	e8 00 00 00 00       	call   53c4f3 <balance_leaf+0x4f13>	53c4ef: R_X86_64_PLT32	__asan_loadN_noabort-0x4
4f13   53c4f3:	4a 8b 44 eb 08       	mov    0x8(%rbx,%r13,8),%rax
4f18   53c4f8:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
4f22   53c502:	48 21 c8             	and    %rcx,%rax
4f25   53c505:	4c 39 f0             	cmp    %r14,%rax
4f28   53c508:	0f 85 fd 00 00 00    	jne    53c60b <balance_leaf+0x502b>
4f2e   53c50e:	e8 00 00 00 00       	call   53c513 <balance_leaf+0x4f33>	53c50f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4f33   53c513:	e9 99 00 00 00       	jmp    53c5b1 <balance_leaf+0x4fd1>
4f38   53c518:	e8 00 00 00 00       	call   53c51d <balance_leaf+0x4f3d>	53c519: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4f3d   53c51d:	48 8b 1c 24          	mov    (%rsp),%rbx
4f41   53c521:	48 8d bb e8 00 00 00 	lea    0xe8(%rbx),%rdi
4f48   53c528:	e8 00 00 00 00       	call   53c52d <balance_leaf+0x4f4d>	53c529: R_X86_64_PLT32	__asan_load8_noabort-0x4
4f4d   53c52d:	4c 8b b3 e8 00 00 00 	mov    0xe8(%rbx),%r14
4f54   53c534:	48 8d bb dc 01 00 00 	lea    0x1dc(%rbx),%rdi
4f5b   53c53b:	e8 00 00 00 00       	call   53c540 <balance_leaf+0x4f60>	53c53c: R_X86_64_PLT32	__asan_load4_noabort-0x4
4f60   53c540:	8b ab dc 01 00 00    	mov    0x1dc(%rbx),%ebp
4f66   53c546:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
4f6b   53c54b:	e8 00 00 00 00       	call   53c550 <balance_leaf+0x4f70>	53c54c: R_X86_64_PLT32	__asan_load8_noabort-0x4
4f70   53c550:	48 8b 4b 48          	mov    0x48(%rbx),%rcx
4f74   53c554:	48 89 df             	mov    %rbx,%rdi
4f77   53c557:	4c 89 f6             	mov    %r14,%rsi
4f7a   53c55a:	89 ea                	mov    %ebp,%edx
4f7c   53c55c:	45 31 c0             	xor    %r8d,%r8d
4f7f   53c55f:	e8 00 00 00 00       	call   53c564 <balance_leaf+0x4f84>	53c560: R_X86_64_PLT32	replace_key-0x4
4f84   53c564:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
4f89   53c569:	4c 89 ef             	mov    %r13,%rdi
4f8c   53c56c:	e8 00 00 00 00       	call   53c571 <balance_leaf+0x4f91>	53c56d: R_X86_64_PLT32	__asan_store4_noabort-0x4
4f91   53c571:	41 c7 45 00 00 00 00 00 	movl   $0x0,0x0(%r13)
4f99   53c579:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
4f9e   53c57e:	48 89 df             	mov    %rbx,%rdi
4fa1   53c581:	e8 00 00 00 00       	call   53c586 <balance_leaf+0x4fa6>	53c582: R_X86_64_PLT32	__asan_load4_noabort-0x4
4fa6   53c586:	83 03 01             	addl   $0x1,(%rbx)
4fa9   53c589:	e9 f6 da ff ff       	jmp    53a084 <balance_leaf+0x2aa4>
4fae   53c58e:	4a 8d 3c eb          	lea    (%rbx,%r13,8),%rdi
4fb2   53c592:	48 83 c7 0c          	add    $0xc,%rdi
4fb6   53c596:	be 04 00 00 00       	mov    $0x4,%esi
4fbb   53c59b:	e8 00 00 00 00       	call   53c5a0 <balance_leaf+0x4fc0>	53c59c: R_X86_64_PLT32	__asan_loadN_noabort-0x4
4fc0   53c5a0:	42 83 7c eb 0c fe    	cmpl   $0xfffffffe,0xc(%rbx,%r13,8)
4fc6   53c5a6:	0f 85 8a 02 00 00    	jne    53c836 <balance_leaf+0x5256>
4fcc   53c5ac:	e8 00 00 00 00       	call   53c5b1 <balance_leaf+0x4fd1>	53c5ad: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4fd1   53c5b1:	48 8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%rbx
4fd9   53c5b9:	48 89 df             	mov    %rbx,%rdi
4fdc   53c5bc:	e8 00 00 00 00       	call   53c5c1 <balance_leaf+0x4fe1>	53c5bd: R_X86_64_PLT32	__asan_load8_noabort-0x4
4fe1   53c5c1:	48 8b 1b             	mov    (%rbx),%rbx
4fe4   53c5c4:	48 8d 7b 14          	lea    0x14(%rbx),%rdi
4fe8   53c5c8:	e8 00 00 00 00       	call   53c5cd <balance_leaf+0x4fed>	53c5c9: R_X86_64_PLT32	__asan_load1_noabort-0x4
4fed   53c5cd:	8a 4b 14             	mov    0x14(%rbx),%cl
4ff0   53c5d0:	80 c1 fe             	add    $0xfe,%cl
4ff3   53c5d3:	45 89 fc             	mov    %r15d,%r12d
4ff6   53c5d6:	41 d3 e4             	shl    %cl,%r12d
4ff9   53c5d9:	e9 60 02 00 00       	jmp    53c83e <balance_leaf+0x525e>
4ffe   53c5de:	e8 00 00 00 00       	call   53c5e3 <balance_leaf+0x5003>	53c5df: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5003   53c5e3:	bb 0f 00 00 00       	mov    $0xf,%ebx
5008   53c5e8:	e9 bd c0 ff ff       	jmp    5386aa <balance_leaf+0x10ca>
500d   53c5ed:	e8 00 00 00 00       	call   53c5f2 <balance_leaf+0x5012>	53c5ee: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5012   53c5f2:	bb 01 00 00 00       	mov    $0x1,%ebx
5017   53c5f7:	e9 ae c0 ff ff       	jmp    5386aa <balance_leaf+0x10ca>
501c   53c5fc:	e8 00 00 00 00       	call   53c601 <balance_leaf+0x5021>	53c5fd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5021   53c601:	bb 03 00 00 00       	mov    $0x3,%ebx
5026   53c606:	e9 9f c0 ff ff       	jmp    5386aa <balance_leaf+0x10ca>
502b   53c60b:	e8 00 00 00 00       	call   53c610 <balance_leaf+0x5030>	53c60c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5030   53c610:	e9 26 02 00 00       	jmp    53c83b <balance_leaf+0x525b>
5035   53c615:	e8 00 00 00 00       	call   53c61a <balance_leaf+0x503a>	53c616: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
503a   53c61a:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
503f   53c61f:	48 89 df             	mov    %rbx,%rdi
5042   53c622:	e8 00 00 00 00       	call   53c627 <balance_leaf+0x5047>	53c623: R_X86_64_PLT32	__asan_load8_noabort-0x4
5047   53c627:	48 8b 1b             	mov    (%rbx),%rbx
504a   53c62a:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
504e   53c62e:	e8 00 00 00 00       	call   53c633 <balance_leaf+0x5053>	53c62f: R_X86_64_PLT32	__asan_load8_noabort-0x4
5053   53c633:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
5057   53c637:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
505b   53c63b:	e8 00 00 00 00       	call   53c640 <balance_leaf+0x5060>	53c63c: R_X86_64_PLT32	__asan_load2_noabort-0x4
5060   53c640:	0f b7 43 02          	movzwl 0x2(%rbx),%eax
5064   53c644:	4c 8d 34 40          	lea    (%rax,%rax,2),%r14
5068   53c648:	4a 8d 3c f3          	lea    (%rbx,%r14,8),%rdi
506c   53c64c:	48 83 c7 10          	add    $0x10,%rdi
5070   53c650:	be 02 00 00 00       	mov    $0x2,%esi
5075   53c655:	e8 00 00 00 00       	call   53c65a <balance_leaf+0x507a>	53c656: R_X86_64_PLT32	__asan_loadN_noabort-0x4
507a   53c65a:	46 0f b7 74 f3 10    	movzwl 0x10(%rbx,%r14,8),%r14d
5080   53c660:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
5085   53c665:	48 89 df             	mov    %rbx,%rdi
5088   53c668:	e8 00 00 00 00       	call   53c66d <balance_leaf+0x508d>	53c669: R_X86_64_PLT32	__asan_load4_noabort-0x4
508d   53c66d:	2b 2b                	sub    (%rbx),%ebp
508f   53c66f:	44 01 f5             	add    %r14d,%ebp
5092   53c672:	83 c5 01             	add    $0x1,%ebp
5095   53c675:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
509a   53c67a:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
509f   53c67f:	e8 00 00 00 00       	call   53c684 <balance_leaf+0x50a4>	53c680: R_X86_64_PLT32	__asan_store8_noabort-0x4
50a4   53c684:	48 8b 2c 24          	mov    (%rsp),%rbp
50a8   53c688:	48 89 6c 24 20       	mov    %rbp,0x20(%rsp)
50ad   53c68d:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
50b2   53c692:	e8 00 00 00 00       	call   53c697 <balance_leaf+0x50b7>	53c693: R_X86_64_PLT32	__asan_load8_noabort-0x4
50b7   53c697:	48 8b 5d 20          	mov    0x20(%rbp),%rbx
50bb   53c69b:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
50c0   53c6a0:	e8 00 00 00 00       	call   53c6a5 <balance_leaf+0x50c5>	53c6a1: R_X86_64_PLT32	__asan_store8_noabort-0x4
50c5   53c6a5:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
50ca   53c6aa:	48 8d 7d 70          	lea    0x70(%rbp),%rdi
50ce   53c6ae:	e8 00 00 00 00       	call   53c6b3 <balance_leaf+0x50d3>	53c6af: R_X86_64_PLT32	__asan_load8_noabort-0x4
50d3   53c6b3:	4c 8b 6d 70          	mov    0x70(%rbp),%r13
50d7   53c6b7:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
50dc   53c6bc:	e8 00 00 00 00       	call   53c6c1 <balance_leaf+0x50e1>	53c6bd: R_X86_64_PLT32	__asan_store8_noabort-0x4
50e1   53c6c1:	4c 89 6c 24 30       	mov    %r13,0x30(%rsp)
50e6   53c6c6:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
50ee   53c6ce:	e8 00 00 00 00       	call   53c6d3 <balance_leaf+0x50f3>	53c6cf: R_X86_64_PLT32	__asan_load8_noabort-0x4
50f3   53c6d3:	48 8b 6d 18          	mov    0x18(%rbp),%rbp
50f7   53c6d7:	48 89 ef             	mov    %rbp,%rdi
50fa   53c6da:	e8 00 00 00 00       	call   53c6df <balance_leaf+0x50ff>	53c6db: R_X86_64_PLT32	__asan_load4_noabort-0x4
50ff   53c6df:	8b 45 00             	mov    0x0(%rbp),%eax
5102   53c6e2:	83 c0 ff             	add    $0xffffffff,%eax
5105   53c6e5:	4c 63 f0             	movslq %eax,%r14
5108   53c6e8:	49 c1 e6 04          	shl    $0x4,%r14
510c   53c6ec:	49 8d 1c 2e          	lea    (%r14,%rbp,1),%rbx
5110   53c6f0:	48 83 c3 08          	add    $0x8,%rbx
5114   53c6f4:	49 8d 3c 2e          	lea    (%r14,%rbp,1),%rdi
5118   53c6f8:	48 83 c7 10          	add    $0x10,%rdi
511c   53c6fc:	e8 00 00 00 00       	call   53c701 <balance_leaf+0x5121>	53c6fd: R_X86_64_PLT32	__asan_load4_noabort-0x4
5121   53c701:	46 8b 7c 35 10       	mov    0x10(%rbp,%r14,1),%r15d
5126   53c706:	48 89 df             	mov    %rbx,%rdi
5129   53c709:	e8 00 00 00 00       	call   53c70e <balance_leaf+0x512e>	53c70a: R_X86_64_PLT32	__asan_load8_noabort-0x4
512e   53c70e:	4a 8b 5c 35 08       	mov    0x8(%rbp,%r14,1),%rbx
5133   53c713:	48 85 db             	test   %rbx,%rbx
5136   53c716:	0f 84 78 10 00 00    	je     53d794 <balance_leaf+0x61b4>
513c   53c71c:	4d 85 ed             	test   %r13,%r13
513f   53c71f:	0f 84 6f 10 00 00    	je     53d794 <balance_leaf+0x61b4>
5145   53c725:	45 85 ff             	test   %r15d,%r15d
5148   53c728:	48 8d 6c 24 38       	lea    0x38(%rsp),%rbp
514d   53c72d:	45 89 e6             	mov    %r12d,%r14d
5150   53c730:	74 0b                	je     53c73d <balance_leaf+0x515d>
5152   53c732:	e8 00 00 00 00       	call   53c737 <balance_leaf+0x5157>	53c733: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5157   53c737:	41 83 c7 ff          	add    $0xffffffff,%r15d
515b   53c73b:	eb 20                	jmp    53c75d <balance_leaf+0x517d>
515d   53c73d:	e8 00 00 00 00       	call   53c742 <balance_leaf+0x5162>	53c73e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5162   53c742:	49 8d 7d 28          	lea    0x28(%r13),%rdi
5166   53c746:	e8 00 00 00 00       	call   53c74b <balance_leaf+0x516b>	53c747: R_X86_64_PLT32	__asan_load8_noabort-0x4
516b   53c74b:	49 8b 5d 28          	mov    0x28(%r13),%rbx
516f   53c74f:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
5173   53c753:	e8 00 00 00 00       	call   53c758 <balance_leaf+0x5178>	53c754: R_X86_64_PLT32	__asan_load2_noabort-0x4
5178   53c758:	44 0f b7 7b 02       	movzwl 0x2(%rbx),%r15d
517d   53c75d:	48 89 ef             	mov    %rbp,%rdi
5180   53c760:	e8 00 00 00 00       	call   53c765 <balance_leaf+0x5185>	53c761: R_X86_64_PLT32	__asan_store4_noabort-0x4
5185   53c765:	44 89 7c 24 38       	mov    %r15d,0x38(%rsp)
518a   53c76a:	4c 8b 64 24 70       	mov    0x70(%rsp),%r12
518f   53c76f:	4c 89 e7             	mov    %r12,%rdi
5192   53c772:	e8 00 00 00 00       	call   53c777 <balance_leaf+0x5197>	53c773: R_X86_64_PLT32	__asan_load4_noabort-0x4
5197   53c777:	45 89 f7             	mov    %r14d,%r15d
519a   53c77a:	44 2b 7c 24 10       	sub    0x10(%rsp),%r15d
519f   53c77f:	41 8b 1c 24          	mov    (%r12),%ebx
51a3   53c783:	44 01 fb             	add    %r15d,%ebx
51a6   53c786:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
51ab   53c78b:	4c 89 ef             	mov    %r13,%rdi
51ae   53c78e:	e8 00 00 00 00       	call   53c793 <balance_leaf+0x51b3>	53c78f: R_X86_64_PLT32	__asan_load4_noabort-0x4
51b3   53c793:	45 8b 75 00          	mov    0x0(%r13),%r14d
51b7   53c797:	48 8b 6c 24 60       	mov    0x60(%rsp),%rbp
51bc   53c79c:	48 89 ef             	mov    %rbp,%rdi
51bf   53c79f:	e8 00 00 00 00       	call   53c7a4 <balance_leaf+0x51c4>	53c7a0: R_X86_64_PLT32	__asan_load4_noabort-0x4
51c4   53c7a4:	44 8b 4d 00          	mov    0x0(%rbp),%r9d
51c8   53c7a8:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
51cd   53c7ad:	89 de                	mov    %ebx,%esi
51cf   53c7af:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
51d4   53c7b4:	89 da                	mov    %ebx,%edx
51d6   53c7b6:	44 89 f1             	mov    %r14d,%ecx
51d9   53c7b9:	48 8b 6c 24 48       	mov    0x48(%rsp),%rbp
51de   53c7be:	49 89 e8             	mov    %rbp,%r8
51e1   53c7c1:	e8 00 00 00 00       	call   53c7c6 <balance_leaf+0x51e6>	53c7c2: R_X86_64_PLT32	leaf_paste_in_buffer-0x4
51e6   53c7c6:	4c 89 e7             	mov    %r12,%rdi
51e9   53c7c9:	e8 00 00 00 00       	call   53c7ce <balance_leaf+0x51ee>	53c7ca: R_X86_64_PLT32	__asan_load4_noabort-0x4
51ee   53c7ce:	45 03 3c 24          	add    (%r12),%r15d
51f2   53c7d2:	4c 8d 75 10          	lea    0x10(%rbp),%r14
51f6   53c7d6:	4c 89 ef             	mov    %r13,%rdi
51f9   53c7d9:	e8 00 00 00 00       	call   53c7de <balance_leaf+0x51fe>	53c7da: R_X86_64_PLT32	__asan_load4_noabort-0x4
51fe   53c7de:	41 8b 45 00          	mov    0x0(%r13),%eax
5202   53c7e2:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
5207   53c7e7:	44 89 fe             	mov    %r15d,%esi
520a   53c7ea:	89 da                	mov    %ebx,%edx
520c   53c7ec:	b9 01 00 00 00       	mov    $0x1,%ecx
5211   53c7f1:	49 89 e8             	mov    %rbp,%r8
5214   53c7f4:	4d 89 f1             	mov    %r14,%r9
5217   53c7f7:	50                   	push   %rax
5218   53c7f8:	e8 00 00 00 00       	call   53c7fd <balance_leaf+0x521d>	53c7f9: R_X86_64_PLT32	leaf_paste_entries-0x4
521d   53c7fd:	48 83 c4 08          	add    $0x8,%rsp
5221   53c801:	4c 89 ef             	mov    %r13,%rdi
5224   53c804:	e8 00 00 00 00       	call   53c809 <balance_leaf+0x5229>	53c805: R_X86_64_PLT32	__asan_store4_noabort-0x4
5229   53c809:	41 c7 45 00 00 00 00 00 	movl   $0x0,0x0(%r13)
5231   53c811:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
5236   53c816:	48 89 df             	mov    %rbx,%rdi
5239   53c819:	e8 00 00 00 00       	call   53c81e <balance_leaf+0x523e>	53c81a: R_X86_64_PLT32	__asan_load4_noabort-0x4
523e   53c81e:	44 8b 33             	mov    (%rbx),%r14d
5241   53c821:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
5246   53c826:	48 89 df             	mov    %rbx,%rdi
5249   53c829:	e8 00 00 00 00       	call   53c82e <balance_leaf+0x524e>	53c82a: R_X86_64_PLT32	__asan_load4_noabort-0x4
524e   53c82e:	44 29 33             	sub    %r14d,(%rbx)
5251   53c831:	e9 f5 c9 ff ff       	jmp    53922b <balance_leaf+0x1c4b>
5256   53c836:	e8 00 00 00 00       	call   53c83b <balance_leaf+0x525b>	53c837: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
525b   53c83b:	45 89 fc             	mov    %r15d,%r12d
525e   53c83e:	48 8b ac 24 98 00 00 00 	mov    0x98(%rsp),%rbp
5266   53c846:	48 8d 7d 2e          	lea    0x2e(%rbp),%rdi
526a   53c84a:	be 02 00 00 00       	mov    $0x2,%esi
526f   53c84f:	e8 00 00 00 00       	call   53c854 <balance_leaf+0x5274>	53c850: R_X86_64_PLT32	__asan_loadN_noabort-0x4
5274   53c854:	48 8d 5d 20          	lea    0x20(%rbp),%rbx
5278   53c858:	66 83 7d 2e 00       	cmpw   $0x0,0x2e(%rbp)
527d   53c85d:	0f 84 b6 00 00 00    	je     53c919 <balance_leaf+0x5339>
5283   53c863:	4d 89 fd             	mov    %r15,%r13
5286   53c866:	4d 63 fc             	movslq %r12d,%r15
5289   53c869:	e8 00 00 00 00       	call   53c86e <balance_leaf+0x528e>	53c86a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
528e   53c86e:	be 08 00 00 00       	mov    $0x8,%esi
5293   53c873:	48 89 df             	mov    %rbx,%rdi
5296   53c876:	e8 00 00 00 00       	call   53c87b <balance_leaf+0x529b>	53c877: R_X86_64_PLT32	__asan_loadN_noabort-0x4
529b   53c87b:	48 8b 03             	mov    (%rbx),%rax
529e   53c87e:	4a 8d 0c 38          	lea    (%rax,%r15,1),%rcx
52a2   53c882:	49 83 c6 ff          	add    $0xffffffffffffffff,%r14
52a6   53c886:	4c 21 f1             	and    %r14,%rcx
52a9   53c889:	49 bc 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%r12
52b3   53c893:	4c 21 e0             	and    %r12,%rax
52b6   53c896:	48 09 c8             	or     %rcx,%rax
52b9   53c899:	48 89 03             	mov    %rax,(%rbx)
52bc   53c89c:	48 8b 1c 24          	mov    (%rsp),%rbx
52c0   53c8a0:	48 8d bb c0 00 00 00 	lea    0xc0(%rbx),%rdi
52c7   53c8a7:	e8 00 00 00 00       	call   53c8ac <balance_leaf+0x52cc>	53c8a8: R_X86_64_PLT32	__asan_load8_noabort-0x4
52cc   53c8ac:	4d 89 f4             	mov    %r14,%r12
52cf   53c8af:	4c 8b b3 c0 00 00 00 	mov    0xc0(%rbx),%r14
52d6   53c8b6:	48 8d bb c8 01 00 00 	lea    0x1c8(%rbx),%rdi
52dd   53c8bd:	e8 00 00 00 00       	call   53c8c2 <balance_leaf+0x52e2>	53c8be: R_X86_64_PLT32	__asan_load4_noabort-0x4
52e2   53c8c2:	48 63 9b c8 01 00 00 	movslq 0x1c8(%rbx),%rbx
52e9   53c8c9:	49 8d 7e 28          	lea    0x28(%r14),%rdi
52ed   53c8cd:	e8 00 00 00 00       	call   53c8d2 <balance_leaf+0x52f2>	53c8ce: R_X86_64_PLT32	__asan_load8_noabort-0x4
52f2   53c8d2:	49 8b 6e 28          	mov    0x28(%r14),%rbp
52f6   53c8d6:	48 c1 e3 04          	shl    $0x4,%rbx
52fa   53c8da:	4c 8d 34 2b          	lea    (%rbx,%rbp,1),%r14
52fe   53c8de:	49 83 c6 18          	add    $0x18,%r14
5302   53c8e2:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
5306   53c8e6:	48 83 c7 20          	add    $0x20,%rdi
530a   53c8ea:	be 08 00 00 00       	mov    $0x8,%esi
530f   53c8ef:	e8 00 00 00 00       	call   53c8f4 <balance_leaf+0x5314>	53c8f0: R_X86_64_PLT32	__asan_loadN_noabort-0x4
5314   53c8f4:	48 8b 44 1d 20       	mov    0x20(%rbp,%rbx,1),%rax
5319   53c8f9:	49 01 c7             	add    %rax,%r15
531c   53c8fc:	4d 21 e7             	and    %r12,%r15
531f   53c8ff:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
5329   53c909:	48 21 c8             	and    %rcx,%rax
532c   53c90c:	4c 09 f8             	or     %r15,%rax
532f   53c90f:	4d 89 ef             	mov    %r13,%r15
5332   53c912:	48 89 44 1d 20       	mov    %rax,0x20(%rbp,%rbx,1)
5337   53c917:	eb 6f                	jmp    53c988 <balance_leaf+0x53a8>
5339   53c919:	e8 00 00 00 00       	call   53c91e <balance_leaf+0x533e>	53c91a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
533e   53c91e:	be 04 00 00 00       	mov    $0x4,%esi
5343   53c923:	48 89 df             	mov    %rbx,%rdi
5346   53c926:	e8 00 00 00 00       	call   53c92b <balance_leaf+0x534b>	53c927: R_X86_64_PLT32	__asan_loadN_noabort-0x4
534b   53c92b:	44 01 23             	add    %r12d,(%rbx)
534e   53c92e:	48 8b 1c 24          	mov    (%rsp),%rbx
5352   53c932:	48 8d bb c0 00 00 00 	lea    0xc0(%rbx),%rdi
5359   53c939:	e8 00 00 00 00       	call   53c93e <balance_leaf+0x535e>	53c93a: R_X86_64_PLT32	__asan_load8_noabort-0x4
535e   53c93e:	4c 8b b3 c0 00 00 00 	mov    0xc0(%rbx),%r14
5365   53c945:	48 8d bb c8 01 00 00 	lea    0x1c8(%rbx),%rdi
536c   53c94c:	e8 00 00 00 00       	call   53c951 <balance_leaf+0x5371>	53c94d: R_X86_64_PLT32	__asan_load4_noabort-0x4
5371   53c951:	48 63 9b c8 01 00 00 	movslq 0x1c8(%rbx),%rbx
5378   53c958:	49 8d 7e 28          	lea    0x28(%r14),%rdi
537c   53c95c:	e8 00 00 00 00       	call   53c961 <balance_leaf+0x5381>	53c95d: R_X86_64_PLT32	__asan_load8_noabort-0x4
5381   53c961:	49 8b 6e 28          	mov    0x28(%r14),%rbp
5385   53c965:	48 c1 e3 04          	shl    $0x4,%rbx
5389   53c969:	4c 8d 34 2b          	lea    (%rbx,%rbp,1),%r14
538d   53c96d:	49 83 c6 18          	add    $0x18,%r14
5391   53c971:	48 8d 3c 2b          	lea    (%rbx,%rbp,1),%rdi
5395   53c975:	48 83 c7 20          	add    $0x20,%rdi
5399   53c979:	be 04 00 00 00       	mov    $0x4,%esi
539e   53c97e:	e8 00 00 00 00       	call   53c983 <balance_leaf+0x53a3>	53c97f: R_X86_64_PLT32	__asan_loadN_noabort-0x4
53a3   53c983:	44 01 64 1d 20       	add    %r12d,0x20(%rbp,%rbx,1)
53a8   53c988:	48 8b 6c 24 60       	mov    0x60(%rsp),%rbp
53ad   53c98d:	48 89 ef             	mov    %rbp,%rdi
53b0   53c990:	e8 00 00 00 00       	call   53c995 <balance_leaf+0x53b5>	53c991: R_X86_64_PLT32	__asan_load4_noabort-0x4
53b5   53c995:	8b 45 00             	mov    0x0(%rbp),%eax
53b8   53c998:	31 c9                	xor    %ecx,%ecx
53ba   53c99a:	44 89 fa             	mov    %r15d,%edx
53bd   53c99d:	29 c2                	sub    %eax,%edx
53bf   53c99f:	bb 00 00 00 00       	mov    $0x0,%ebx
53c4   53c9a4:	0f 4f da             	cmovg  %edx,%ebx
53c7   53c9a7:	f7 da                	neg    %edx
53c9   53c9a9:	41 39 c7             	cmp    %eax,%r15d
53cc   53c9ac:	0f 4f d1             	cmovg  %ecx,%edx
53cf   53c9af:	89 55 00             	mov    %edx,0x0(%rbp)
53d2   53c9b2:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
53d7   53c9b7:	48 89 ef             	mov    %rbp,%rdi
53da   53c9ba:	e8 00 00 00 00       	call   53c9bf <balance_leaf+0x53df>	53c9bb: R_X86_64_PLT32	__asan_store4_noabort-0x4
53df   53c9bf:	c7 45 00 00 00 00 00 	movl   $0x0,0x0(%rbp)
53e6   53c9c6:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
53eb   53c9cb:	48 89 ef             	mov    %rbp,%rdi
53ee   53c9ce:	e8 00 00 00 00       	call   53c9d3 <balance_leaf+0x53f3>	53c9cf: R_X86_64_PLT32	__asan_load8_noabort-0x4
53f3   53c9d3:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
53f7   53c9d7:	48 8d 7d 28          	lea    0x28(%rbp),%rdi
53fb   53c9db:	e8 00 00 00 00       	call   53c9e0 <balance_leaf+0x5400>	53c9dc: R_X86_64_PLT32	__asan_load8_noabort-0x4
5400   53c9e0:	48 8b 6d 28          	mov    0x28(%rbp),%rbp
5404   53c9e4:	48 8d 7d 02          	lea    0x2(%rbp),%rdi
5408   53c9e8:	e8 00 00 00 00       	call   53c9ed <balance_leaf+0x540d>	53c9e9: R_X86_64_PLT32	__asan_load2_noabort-0x4
540d   53c9ed:	0f b7 45 02          	movzwl 0x2(%rbp),%eax
5411   53c9f1:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
5415   53c9f5:	48 8d 34 c5 00 00 00 00 	lea    0x0(,%rax,8),%rsi
541d   53c9fd:	48 01 ee             	add    %rbp,%rsi
5420   53ca00:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
5425   53ca05:	e8 00 00 00 00       	call   53ca0a <balance_leaf+0x542a>	53ca06: R_X86_64_PLT32	comp_short_le_keys-0x4
542a   53ca0a:	85 c0                	test   %eax,%eax
542c   53ca0c:	0f 85 bc 0d 00 00    	jne    53d7ce <balance_leaf+0x61ee>
5432   53ca12:	49 bf 00 00 00 00 00 00 00 40 	movabs $0x4000000000000000,%r15
543c   53ca1c:	48 8b ac 24 d8 00 00 00 	mov    0xd8(%rsp),%rbp
5444   53ca24:	48 89 ef             	mov    %rbp,%rdi
5447   53ca27:	e8 00 00 00 00       	call   53ca2c <balance_leaf+0x544c>	53ca28: R_X86_64_PLT32	__asan_load8_noabort-0x4
544c   53ca2c:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
5450   53ca30:	48 8d 45 18          	lea    0x18(%rbp),%rax
5454   53ca34:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
5459   53ca39:	48 8d 7d 20          	lea    0x20(%rbp),%rdi
545d   53ca3d:	be 08 00 00 00       	mov    $0x8,%esi
5462   53ca42:	e8 00 00 00 00       	call   53ca47 <balance_leaf+0x5467>	53ca43: R_X86_64_PLT32	__asan_loadN_noabort-0x4
5467   53ca47:	4c 8b 65 20          	mov    0x20(%rbp),%r12
546b   53ca4b:	4c 89 e0             	mov    %r12,%rax
546e   53ca4e:	48 c1 e8 3e          	shr    $0x3e,%rax
5472   53ca52:	0f 85 f8 00 00 00    	jne    53cb50 <balance_leaf+0x5570>
5478   53ca58:	4d 89 e5             	mov    %r12,%r13
547b   53ca5b:	49 c1 ed 3c          	shr    $0x3c,%r13
547f   53ca5f:	41 8d 45 fc          	lea    -0x4(%r13),%eax
5483   53ca63:	66 83 f8 fc          	cmp    $0xfffc,%ax
5487   53ca67:	0f 86 e3 00 00 00    	jbe    53cb50 <balance_leaf+0x5570>
548d   53ca6d:	e8 00 00 00 00       	call   53ca72 <balance_leaf+0x5492>	53ca6e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5492   53ca72:	4d 39 fc             	cmp    %r15,%r12
5495   53ca75:	4d 89 fc             	mov    %r15,%r12
5498   53ca78:	bd 0f 00 00 00       	mov    $0xf,%ebp
549d   53ca7d:	49 0f 42 ed          	cmovb  %r13,%rbp
54a1   53ca81:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi	53ca85: R_X86_64_32S	item_ops
54a9   53ca89:	e8 00 00 00 00       	call   53ca8e <balance_leaf+0x54ae>	53ca8a: R_X86_64_PLT32	__asan_load8_noabort-0x4
54ae   53ca8e:	48 8b 2c ed 00 00 00 00 	mov    0x0(,%rbp,8),%rbp	53ca92: R_X86_64_32S	item_ops
54b6   53ca96:	48 8d 7d 10          	lea    0x10(%rbp),%rdi
54ba   53ca9a:	e8 00 00 00 00       	call   53ca9f <balance_leaf+0x54bf>	53ca9b: R_X86_64_PLT32	__asan_load8_noabort-0x4
54bf   53ca9f:	48 8b 6d 10          	mov    0x10(%rbp),%rbp
54c3   53caa3:	4c 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%r15
54cb   53caab:	4d 8d 6f 20          	lea    0x20(%r15),%r13
54cf   53caaf:	4c 89 ef             	mov    %r13,%rdi
54d2   53cab2:	e8 00 00 00 00       	call   53cab7 <balance_leaf+0x54d7>	53cab3: R_X86_64_PLT32	__asan_load8_noabort-0x4
54d7   53cab7:	49 8b 77 20          	mov    0x20(%r15),%rsi
54db   53cabb:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
54e0   53cac0:	ff d5                	call   *%rbp
54e2   53cac2:	85 c0                	test   %eax,%eax
54e4   53cac4:	0f 84 0b 0d 00 00    	je     53d7d5 <balance_leaf+0x61f5>
54ea   53caca:	49 8d 7e 08          	lea    0x8(%r14),%rdi
54ee   53cace:	be 08 00 00 00       	mov    $0x8,%esi
54f3   53cad3:	e8 00 00 00 00       	call   53cad8 <balance_leaf+0x54f8>	53cad4: R_X86_64_PLT32	__asan_loadN_noabort-0x4
54f8   53cad8:	4d 8b 7e 08          	mov    0x8(%r14),%r15
54fc   53cadc:	4d 39 e7             	cmp    %r12,%r15
54ff   53cadf:	0f 83 a4 00 00 00    	jae    53cb89 <balance_leaf+0x55a9>
5505   53cae5:	4c 89 fd             	mov    %r15,%rbp
5508   53cae8:	48 c1 ed 3c          	shr    $0x3c,%rbp
550c   53caec:	8d 45 fc             	lea    -0x4(%rbp),%eax
550f   53caef:	66 83 f8 fc          	cmp    $0xfffc,%ax
5513   53caf3:	0f 86 90 00 00 00    	jbe    53cb89 <balance_leaf+0x55a9>
5519   53caf9:	e8 00 00 00 00       	call   53cafe <balance_leaf+0x551e>	53cafa: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
551e   53cafe:	4d 39 e7             	cmp    %r12,%r15
5521   53cb01:	41 bf 0f 00 00 00    	mov    $0xf,%r15d
5527   53cb07:	4c 0f 42 fd          	cmovb  %rbp,%r15
552b   53cb0b:	4a 8d 3c fd 00 00 00 00 	lea    0x0(,%r15,8),%rdi	53cb0f: R_X86_64_32S	item_ops
5533   53cb13:	e8 00 00 00 00       	call   53cb18 <balance_leaf+0x5538>	53cb14: R_X86_64_PLT32	__asan_load8_noabort-0x4
5538   53cb18:	4a 8b 2c fd 00 00 00 00 	mov    0x0(,%r15,8),%rbp	53cb1c: R_X86_64_32S	item_ops
5540   53cb20:	48 8d 7d 10          	lea    0x10(%rbp),%rdi
5544   53cb24:	e8 00 00 00 00       	call   53cb29 <balance_leaf+0x5549>	53cb25: R_X86_64_PLT32	__asan_load8_noabort-0x4
5549   53cb29:	48 8b 6d 10          	mov    0x10(%rbp),%rbp
554d   53cb2d:	4c 89 ef             	mov    %r13,%rdi
5550   53cb30:	e8 00 00 00 00       	call   53cb35 <balance_leaf+0x5555>	53cb31: R_X86_64_PLT32	__asan_load8_noabort-0x4
5555   53cb35:	49 8b 75 00          	mov    0x0(%r13),%rsi
5559   53cb39:	4c 89 f7             	mov    %r14,%rdi
555c   53cb3c:	ff d5                	call   *%rbp
555e   53cb3e:	85 c0                	test   %eax,%eax
5560   53cb40:	0f 84 96 0c 00 00    	je     53d7dc <balance_leaf+0x61fc>
5566   53cb46:	e8 00 00 00 00       	call   53cb4b <balance_leaf+0x556b>	53cb47: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
556b   53cb4b:	e9 8b b3 ff ff       	jmp    537edb <balance_leaf+0x8fb>
5570   53cb50:	48 8d 7d 24          	lea    0x24(%rbp),%rdi
5574   53cb54:	be 04 00 00 00       	mov    $0x4,%esi
5579   53cb59:	e8 00 00 00 00       	call   53cb5e <balance_leaf+0x557e>	53cb5a: R_X86_64_PLT32	__asan_loadN_noabort-0x4
557e   53cb5e:	8b 45 24             	mov    0x24(%rbp),%eax
5581   53cb61:	85 c0                	test   %eax,%eax
5583   53cb63:	79 5c                	jns    53cbc1 <balance_leaf+0x55e1>
5585   53cb65:	83 f8 fe             	cmp    $0xfffffffe,%eax
5588   53cb68:	4d 89 fc             	mov    %r15,%r12
558b   53cb6b:	0f 84 14 01 00 00    	je     53cc85 <balance_leaf+0x56a5>
5591   53cb71:	83 f8 ff             	cmp    $0xffffffff,%eax
5594   53cb74:	0f 85 29 01 00 00    	jne    53cca3 <balance_leaf+0x56c3>
559a   53cb7a:	e8 00 00 00 00       	call   53cb7f <balance_leaf+0x559f>	53cb7b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
559f   53cb7f:	bd 02 00 00 00       	mov    $0x2,%ebp
55a4   53cb84:	e9 f8 fe ff ff       	jmp    53ca81 <balance_leaf+0x54a1>
55a9   53cb89:	49 8d 7e 0c          	lea    0xc(%r14),%rdi
55ad   53cb8d:	be 04 00 00 00       	mov    $0x4,%esi
55b2   53cb92:	e8 00 00 00 00       	call   53cb97 <balance_leaf+0x55b7>	53cb93: R_X86_64_PLT32	__asan_loadN_noabort-0x4
55b7   53cb97:	41 8b 46 0c          	mov    0xc(%r14),%eax
55bb   53cb9b:	85 c0                	test   %eax,%eax
55bd   53cb9d:	79 44                	jns    53cbe3 <balance_leaf+0x5603>
55bf   53cb9f:	83 f8 fe             	cmp    $0xfffffffe,%eax
55c2   53cba2:	0f 84 0a 01 00 00    	je     53ccb2 <balance_leaf+0x56d2>
55c8   53cba8:	83 f8 ff             	cmp    $0xffffffff,%eax
55cb   53cbab:	0f 85 21 01 00 00    	jne    53ccd2 <balance_leaf+0x56f2>
55d1   53cbb1:	e8 00 00 00 00       	call   53cbb6 <balance_leaf+0x55d6>	53cbb2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
55d6   53cbb6:	41 bf 02 00 00 00    	mov    $0x2,%r15d
55dc   53cbbc:	e9 4a ff ff ff       	jmp    53cb0b <balance_leaf+0x552b>
55e1   53cbc1:	3d f4 01 00 00       	cmp    $0x1f4,%eax
55e6   53cbc6:	4d 89 fc             	mov    %r15,%r12
55e9   53cbc9:	0f 84 c5 00 00 00    	je     53cc94 <balance_leaf+0x56b4>
55ef   53cbcf:	85 c0                	test   %eax,%eax
55f1   53cbd1:	0f 85 cc 00 00 00    	jne    53cca3 <balance_leaf+0x56c3>
55f7   53cbd7:	e8 00 00 00 00       	call   53cbdc <balance_leaf+0x55fc>	53cbd8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
55fc   53cbdc:	31 ed                	xor    %ebp,%ebp
55fe   53cbde:	e9 9e fe ff ff       	jmp    53ca81 <balance_leaf+0x54a1>
5603   53cbe3:	3d f4 01 00 00       	cmp    $0x1f4,%eax
5608   53cbe8:	0f 84 d4 00 00 00    	je     53ccc2 <balance_leaf+0x56e2>
560e   53cbee:	85 c0                	test   %eax,%eax
5610   53cbf0:	0f 85 dc 00 00 00    	jne    53ccd2 <balance_leaf+0x56f2>
5616   53cbf6:	e8 00 00 00 00       	call   53cbfb <balance_leaf+0x561b>	53cbf7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
561b   53cbfb:	45 31 ff             	xor    %r15d,%r15d
561e   53cbfe:	e9 08 ff ff ff       	jmp    53cb0b <balance_leaf+0x552b>
5623   53cc03:	48 8d bb c0 00 00 00 	lea    0xc0(%rbx),%rdi
562a   53cc0a:	e8 00 00 00 00       	call   53cc0f <balance_leaf+0x562f>	53cc0b: R_X86_64_PLT32	__asan_load8_noabort-0x4
562f   53cc0f:	48 8b ab c0 00 00 00 	mov    0xc0(%rbx),%rbp
5636   53cc16:	48 85 ed             	test   %rbp,%rbp
5639   53cc19:	0f 84 f0 0b 00 00    	je     53d80f <balance_leaf+0x622f>
563f   53cc1f:	48 8d 7b 20          	lea    0x20(%rbx),%rdi
5643   53cc23:	e8 00 00 00 00       	call   53cc28 <balance_leaf+0x5648>	53cc24: R_X86_64_PLT32	__asan_load8_noabort-0x4
5648   53cc28:	48 83 7b 20 00       	cmpq   $0x0,0x20(%rbx)
564d   53cc2d:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
5652   53cc32:	0f 84 de 0b 00 00    	je     53d816 <balance_leaf+0x6236>
5658   53cc38:	e8 00 00 00 00       	call   53cc3d <balance_leaf+0x565d>	53cc39: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
565d   53cc3d:	48 8d bb c8 01 00 00 	lea    0x1c8(%rbx),%rdi
5664   53cc44:	e8 00 00 00 00       	call   53cc49 <balance_leaf+0x5669>	53cc45: R_X86_64_PLT32	__asan_load4_noabort-0x4
5669   53cc49:	8b 93 c8 01 00 00    	mov    0x1c8(%rbx),%edx
566f   53cc4f:	48 89 df             	mov    %rbx,%rdi
5672   53cc52:	48 89 ee             	mov    %rbp,%rsi
5675   53cc55:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
567a   53cc5a:	45 31 c0             	xor    %r8d,%r8d
567d   53cc5d:	e8 00 00 00 00       	call   53cc62 <balance_leaf+0x5682>	53cc5e: R_X86_64_PLT32	replace_key-0x4
5682   53cc62:	4c 89 ef             	mov    %r13,%rdi
5685   53cc65:	e8 00 00 00 00       	call   53cc6a <balance_leaf+0x568a>	53cc66: R_X86_64_PLT32	__asan_store4_noabort-0x4
568a   53cc6a:	41 c7 45 00 00 00 00 00 	movl   $0x0,0x0(%r13)
5692   53cc72:	83 bc 24 d0 00 00 00 70 	cmpl   $0x70,0xd0(%rsp)
569a   53cc7a:	0f 84 6c e9 ff ff    	je     53b5ec <balance_leaf+0x400c>
56a0   53cc80:	e9 90 e9 ff ff       	jmp    53b615 <balance_leaf+0x4035>
56a5   53cc85:	e8 00 00 00 00       	call   53cc8a <balance_leaf+0x56aa>	53cc86: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
56aa   53cc8a:	bd 01 00 00 00       	mov    $0x1,%ebp
56af   53cc8f:	e9 ed fd ff ff       	jmp    53ca81 <balance_leaf+0x54a1>
56b4   53cc94:	e8 00 00 00 00       	call   53cc99 <balance_leaf+0x56b9>	53cc95: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
56b9   53cc99:	bd 03 00 00 00       	mov    $0x3,%ebp
56be   53cc9e:	e9 de fd ff ff       	jmp    53ca81 <balance_leaf+0x54a1>
56c3   53cca3:	e8 00 00 00 00       	call   53cca8 <balance_leaf+0x56c8>	53cca4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
56c8   53cca8:	bd 0f 00 00 00       	mov    $0xf,%ebp
56cd   53ccad:	e9 cf fd ff ff       	jmp    53ca81 <balance_leaf+0x54a1>
56d2   53ccb2:	e8 00 00 00 00       	call   53ccb7 <balance_leaf+0x56d7>	53ccb3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
56d7   53ccb7:	41 bf 01 00 00 00    	mov    $0x1,%r15d
56dd   53ccbd:	e9 49 fe ff ff       	jmp    53cb0b <balance_leaf+0x552b>
56e2   53ccc2:	e8 00 00 00 00       	call   53ccc7 <balance_leaf+0x56e7>	53ccc3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
56e7   53ccc7:	41 bf 03 00 00 00    	mov    $0x3,%r15d
56ed   53cccd:	e9 39 fe ff ff       	jmp    53cb0b <balance_leaf+0x552b>
56f2   53ccd2:	e8 00 00 00 00       	call   53ccd7 <balance_leaf+0x56f7>	53ccd3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
56f7   53ccd7:	41 bf 0f 00 00 00    	mov    $0xf,%r15d
56fd   53ccdd:	e9 29 fe ff ff       	jmp    53cb0b <balance_leaf+0x552b>
5702   53cce2:	e8 00 00 00 00       	call   53cce7 <balance_leaf+0x5707>	53cce3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5707   53cce7:	e8 00 00 00 00       	call   53ccec <balance_leaf+0x570c>	53cce8: R_X86_64_PLT32	__asan_handle_no_return-0x4
570c   53ccec:	31 ff                	xor    %edi,%edi
570e   53ccee:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53ccf1: R_X86_64_32S	.rodata+0xf64c0
5715   53ccf5:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53ccf8: R_X86_64_32S	.rodata.str1.1+0xcf30
571c   53ccfc:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53ccff: R_X86_64_32S	.rodata+0xf8880
5723   53cd03:	41 b8 d1 04 00 00    	mov    $0x4d1,%r8d
5729   53cd09:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53cd0c: R_X86_64_32S	.rodata.str1.1+0xcf30
5730   53cd10:	6a 00                	push   $0x0
5732   53cd12:	41 56                	push   %r14
5734   53cd14:	e8 00 00 00 00       	call   53cd19 <balance_leaf+0x5739>	53cd15: R_X86_64_PLT32	__reiserfs_panic-0x4
5739   53cd19:	e8 00 00 00 00       	call   53cd1e <balance_leaf+0x573e>	53cd1a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
573e   53cd1e:	eb 0c                	jmp    53cd2c <balance_leaf+0x574c>
5740   53cd20:	e8 00 00 00 00       	call   53cd25 <balance_leaf+0x5745>	53cd21: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5745   53cd25:	eb 05                	jmp    53cd2c <balance_leaf+0x574c>
5747   53cd27:	e8 00 00 00 00       	call   53cd2c <balance_leaf+0x574c>	53cd28: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
574c   53cd2c:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
5751   53cd31:	48 89 df             	mov    %rbx,%rdi
5754   53cd34:	e8 00 00 00 00       	call   53cd39 <balance_leaf+0x5759>	53cd35: R_X86_64_PLT32	__asan_load8_noabort-0x4
5759   53cd39:	48 8b 1b             	mov    (%rbx),%rbx
575c   53cd3c:	e8 00 00 00 00       	call   53cd41 <balance_leaf+0x5761>	53cd3d: R_X86_64_PLT32	__asan_handle_no_return-0x4
5761   53cd41:	31 ff                	xor    %edi,%edi
5763   53cd43:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53cd46: R_X86_64_32S	.rodata+0xf64c0
576a   53cd4a:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53cd4d: R_X86_64_32S	.rodata.str1.1+0xcf30
5771   53cd51:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53cd54: R_X86_64_32S	.rodata+0xf8900
5778   53cd58:	41 b8 e8 04 00 00    	mov    $0x4e8,%r8d
577e   53cd5e:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53cd61: R_X86_64_32S	.rodata.str1.1+0xcf30
5785   53cd65:	53                   	push   %rbx
5786   53cd66:	ff 74 24 48          	push   0x48(%rsp)
578a   53cd6a:	e8 00 00 00 00       	call   53cd6f <balance_leaf+0x578f>	53cd6b: R_X86_64_PLT32	__reiserfs_panic-0x4
578f   53cd6f:	89 c3                	mov    %eax,%ebx
5791   53cd71:	e8 00 00 00 00       	call   53cd76 <balance_leaf+0x5796>	53cd72: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5796   53cd76:	e8 00 00 00 00       	call   53cd7b <balance_leaf+0x579b>	53cd77: R_X86_64_PLT32	__asan_handle_no_return-0x4
579b   53cd7b:	31 ff                	xor    %edi,%edi
579d   53cd7d:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53cd80: R_X86_64_32S	.rodata+0xf64c0
57a4   53cd84:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53cd87: R_X86_64_32S	.rodata.str1.1+0x45b3f
57ab   53cd8b:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53cd8e: R_X86_64_32S	.rodata+0xf8d00
57b2   53cd92:	41 b8 8f 04 00 00    	mov    $0x48f,%r8d
57b8   53cd98:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53cd9b: R_X86_64_32S	.rodata.str1.1+0x45b3f
57bf   53cd9f:	53                   	push   %rbx
57c0   53cda0:	e8 00 00 00 00       	call   53cda5 <balance_leaf+0x57c5>	53cda1: R_X86_64_PLT32	__reiserfs_panic-0x4
57c5   53cda5:	e8 00 00 00 00       	call   53cdaa <balance_leaf+0x57ca>	53cda6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
57ca   53cdaa:	e8 00 00 00 00       	call   53cdaf <balance_leaf+0x57cf>	53cdab: R_X86_64_PLT32	__asan_handle_no_return-0x4
57cf   53cdaf:	31 ff                	xor    %edi,%edi
57d1   53cdb1:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53cdb4: R_X86_64_32S	.rodata+0xf64c0
57d8   53cdb8:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53cdbb: R_X86_64_32S	.rodata.str1.1+0xcf05
57df   53cdbf:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53cdc2: R_X86_64_32S	.rodata+0xf7060
57e6   53cdc6:	41 b8 8b 05 00 00    	mov    $0x58b,%r8d
57ec   53cdcc:	eb 27                	jmp    53cdf5 <balance_leaf+0x5815>
57ee   53cdce:	e8 00 00 00 00       	call   53cdd3 <balance_leaf+0x57f3>	53cdcf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
57f3   53cdd3:	e8 00 00 00 00       	call   53cdd8 <balance_leaf+0x57f8>	53cdd4: R_X86_64_PLT32	__asan_handle_no_return-0x4
57f8   53cdd8:	31 ff                	xor    %edi,%edi
57fa   53cdda:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53cddd: R_X86_64_32S	.rodata+0xf64c0
5801   53cde1:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53cde4: R_X86_64_32S	.rodata.str1.1+0xcf05
5808   53cde8:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53cdeb: R_X86_64_32S	.rodata+0xf7100
580f   53cdef:	41 b8 8d 05 00 00    	mov    $0x58d,%r8d
5815   53cdf5:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53cdf8: R_X86_64_32S	.rodata.str1.1+0xcf05
581c   53cdfc:	41 56                	push   %r14
581e   53cdfe:	e8 00 00 00 00       	call   53ce03 <balance_leaf+0x5823>	53cdff: R_X86_64_PLT32	__reiserfs_panic-0x4
5823   53ce03:	e8 00 00 00 00       	call   53ce08 <balance_leaf+0x5828>	53ce04: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5828   53ce08:	eb 05                	jmp    53ce0f <balance_leaf+0x582f>
582a   53ce0a:	e8 00 00 00 00       	call   53ce0f <balance_leaf+0x582f>	53ce0b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
582f   53ce0f:	48 8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%rbx
5837   53ce17:	48 89 df             	mov    %rbx,%rdi
583a   53ce1a:	e8 00 00 00 00       	call   53ce1f <balance_leaf+0x583f>	53ce1b: R_X86_64_PLT32	__asan_load8_noabort-0x4
583f   53ce1f:	48 8b 1b             	mov    (%rbx),%rbx
5842   53ce22:	e8 00 00 00 00       	call   53ce27 <balance_leaf+0x5847>	53ce23: R_X86_64_PLT32	__asan_handle_no_return-0x4
5847   53ce27:	48 89 df             	mov    %rbx,%rdi
584a   53ce2a:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53ce2d: R_X86_64_32S	.rodata+0xf8c80
5851   53ce31:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53ce34: R_X86_64_32S	.rodata.str1.1+0x45b3f
5858   53ce38:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53ce3b: R_X86_64_32S	.rodata+0xf8ca0
585f   53ce3f:	e8 00 00 00 00       	call   53ce44 <balance_leaf+0x5864>	53ce40: R_X86_64_PLT32	__reiserfs_panic-0x4
5864   53ce44:	e8 00 00 00 00       	call   53ce49 <balance_leaf+0x5869>	53ce45: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5869   53ce49:	e8 00 00 00 00       	call   53ce4e <balance_leaf+0x586e>	53ce4a: R_X86_64_PLT32	__asan_handle_no_return-0x4
586e   53ce4e:	31 ff                	xor    %edi,%edi
5870   53ce50:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53ce53: R_X86_64_32S	.rodata+0xf64c0
5877   53ce57:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53ce5a: R_X86_64_32S	.rodata.str1.1+0xa7e2
587e   53ce5e:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53ce61: R_X86_64_32S	.rodata+0xf89e0
5885   53ce65:	41 b8 36 04 00 00    	mov    $0x436,%r8d
588b   53ce6b:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53ce6e: R_X86_64_32S	.rodata.str1.1+0xa7e2
5892   53ce72:	e8 00 00 00 00       	call   53ce77 <balance_leaf+0x5897>	53ce73: R_X86_64_PLT32	__reiserfs_panic-0x4
5897   53ce77:	e8 00 00 00 00       	call   53ce7c <balance_leaf+0x589c>	53ce78: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
589c   53ce7c:	e8 00 00 00 00       	call   53ce81 <balance_leaf+0x58a1>	53ce7d: R_X86_64_PLT32	__asan_handle_no_return-0x4
58a1   53ce81:	31 ff                	xor    %edi,%edi
58a3   53ce83:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53ce86: R_X86_64_32S	.rodata+0xf64c0
58aa   53ce8a:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53ce8d: R_X86_64_32S	.rodata.str1.1+0x3372
58b1   53ce91:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53ce94: R_X86_64_32S	.rodata+0xf7400
58b8   53ce98:	41 b8 f8 00 00 00    	mov    $0xf8,%r8d
58be   53ce9e:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53cea1: R_X86_64_32S	.rodata.str1.1+0x3372
58c5   53cea5:	53                   	push   %rbx
58c6   53cea6:	e8 00 00 00 00       	call   53ceab <balance_leaf+0x58cb>	53cea7: R_X86_64_PLT32	__reiserfs_panic-0x4
58cb   53ceab:	e8 00 00 00 00       	call   53ceb0 <balance_leaf+0x58d0>	53ceac: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
58d0   53ceb0:	eb 05                	jmp    53ceb7 <balance_leaf+0x58d7>
58d2   53ceb2:	e8 00 00 00 00       	call   53ceb7 <balance_leaf+0x58d7>	53ceb3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
58d7   53ceb7:	e8 00 00 00 00       	call   53cebc <balance_leaf+0x58dc>	53ceb8: R_X86_64_PLT32	__asan_handle_no_return-0x4
58dc   53cebc:	31 ff                	xor    %edi,%edi
58de   53cebe:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53cec1: R_X86_64_32S	.rodata+0xf64c0
58e5   53cec5:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53cec8: R_X86_64_32S	.rodata.str1.1+0xa7e2
58ec   53cecc:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53cecf: R_X86_64_32S	.rodata+0xf8a60
58f3   53ced3:	41 b8 43 04 00 00    	mov    $0x443,%r8d
58f9   53ced9:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53cedc: R_X86_64_32S	.rodata.str1.1+0xa7e2
5900   53cee0:	e8 00 00 00 00       	call   53cee5 <balance_leaf+0x5905>	53cee1: R_X86_64_PLT32	__reiserfs_panic-0x4
5905   53cee5:	e8 00 00 00 00       	call   53ceea <balance_leaf+0x590a>	53cee6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
590a   53ceea:	e8 00 00 00 00       	call   53ceef <balance_leaf+0x590f>	53ceeb: R_X86_64_PLT32	__asan_handle_no_return-0x4
590f   53ceef:	31 ff                	xor    %edi,%edi
5911   53cef1:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53cef4: R_X86_64_32S	.rodata+0xf64c0
5918   53cef8:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53cefb: R_X86_64_32S	.rodata.str1.1+0x3372
591f   53ceff:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53cf02: R_X86_64_32S	.rodata+0xf7320
5926   53cf06:	41 b8 f6 00 00 00    	mov    $0xf6,%r8d
592c   53cf0c:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53cf0f: R_X86_64_32S	.rodata.str1.1+0x3372
5933   53cf13:	41 55                	push   %r13
5935   53cf15:	e8 00 00 00 00       	call   53cf1a <balance_leaf+0x593a>	53cf16: R_X86_64_PLT32	__reiserfs_panic-0x4
593a   53cf1a:	e8 00 00 00 00       	call   53cf1f <balance_leaf+0x593f>	53cf1b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
593f   53cf1f:	eb 05                	jmp    53cf26 <balance_leaf+0x5946>
5941   53cf21:	e8 00 00 00 00       	call   53cf26 <balance_leaf+0x5946>	53cf22: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5946   53cf26:	e8 00 00 00 00       	call   53cf2b <balance_leaf+0x594b>	53cf27: R_X86_64_PLT32	__asan_handle_no_return-0x4
594b   53cf2b:	31 ff                	xor    %edi,%edi
594d   53cf2d:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53cf30: R_X86_64_32S	.rodata+0xf64c0
5954   53cf34:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53cf37: R_X86_64_32S	.rodata.str1.1+0xcf05
595b   53cf3b:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53cf3e: R_X86_64_32S	.rodata+0xf71a0
5962   53cf42:	41 b8 97 05 00 00    	mov    $0x597,%r8d
5968   53cf48:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53cf4b: R_X86_64_32S	.rodata.str1.1+0xcf05
596f   53cf4f:	e8 00 00 00 00       	call   53cf54 <balance_leaf+0x5974>	53cf50: R_X86_64_PLT32	__reiserfs_panic-0x4
5974   53cf54:	49 83 c6 18          	add    $0x18,%r14
5978   53cf58:	e8 00 00 00 00       	call   53cf5d <balance_leaf+0x597d>	53cf59: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
597d   53cf5d:	49 8d 1c de          	lea    (%r14,%rbx,8),%rbx
5981   53cf61:	e8 00 00 00 00       	call   53cf66 <balance_leaf+0x5986>	53cf62: R_X86_64_PLT32	__asan_handle_no_return-0x4
5986   53cf66:	31 ff                	xor    %edi,%edi
5988   53cf68:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53cf6b: R_X86_64_32S	.rodata+0xf64c0
598f   53cf6f:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53cf72: R_X86_64_32S	.rodata.str1.1+0x4a9ed
5996   53cf76:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53cf79: R_X86_64_32S	.rodata+0xf7640
599d   53cf7d:	41 b8 58 00 00 00    	mov    $0x58,%r8d
59a3   53cf83:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53cf86: R_X86_64_32S	.rodata.str1.1+0x4a9ed
59aa   53cf8a:	53                   	push   %rbx
59ab   53cf8b:	55                   	push   %rbp
59ac   53cf8c:	e8 00 00 00 00       	call   53cf91 <balance_leaf+0x59b1>	53cf8d: R_X86_64_PLT32	__reiserfs_panic-0x4
59b1   53cf91:	e8 00 00 00 00       	call   53cf96 <balance_leaf+0x59b6>	53cf92: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
59b6   53cf96:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	53cf99: R_X86_64_32S	.rodata+0xf72a0
59bd   53cf9d:	e8 00 00 00 00       	call   53cfa2 <balance_leaf+0x59c2>	53cf9e: R_X86_64_PLT32	print_cur_tb-0x4
59c2   53cfa2:	48 8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%rbx
59ca   53cfaa:	48 89 df             	mov    %rbx,%rdi
59cd   53cfad:	e8 00 00 00 00       	call   53cfb2 <balance_leaf+0x59d2>	53cfae: R_X86_64_PLT32	__asan_load8_noabort-0x4
59d2   53cfb2:	48 8b 1b             	mov    (%rbx),%rbx
59d5   53cfb5:	4c 89 ef             	mov    %r13,%rdi
59d8   53cfb8:	e8 00 00 00 00       	call   53cfbd <balance_leaf+0x59dd>	53cfb9: R_X86_64_PLT32	__asan_load4_noabort-0x4
59dd   53cfbd:	41 8b 6d 00          	mov    0x0(%r13),%ebp
59e1   53cfc1:	e8 00 00 00 00       	call   53cfc6 <balance_leaf+0x59e6>	53cfc2: R_X86_64_PLT32	__asan_handle_no_return-0x4
59e6   53cfc6:	48 89 df             	mov    %rbx,%rdi
59e9   53cfc9:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53cfcc: R_X86_64_32S	.rodata+0xf72c0
59f0   53cfd0:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53cfd3: R_X86_64_32S	.rodata.str1.1+0xcf05
59f7   53cfd7:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53cfda: R_X86_64_32S	.rodata+0xf72e0
59fe   53cfde:	41 89 e8             	mov    %ebp,%r8d
5a01   53cfe1:	e8 00 00 00 00       	call   53cfe6 <balance_leaf+0x5a06>	53cfe2: R_X86_64_PLT32	__reiserfs_panic-0x4
5a06   53cfe6:	e8 00 00 00 00       	call   53cfeb <balance_leaf+0x5a0b>	53cfe7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5a0b   53cfeb:	eb 05                	jmp    53cff2 <balance_leaf+0x5a12>
5a0d   53cfed:	e8 00 00 00 00       	call   53cff2 <balance_leaf+0x5a12>	53cfee: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5a12   53cff2:	e8 00 00 00 00       	call   53cff7 <balance_leaf+0x5a17>	53cff3: R_X86_64_PLT32	__asan_handle_no_return-0x4
5a17   53cff7:	31 ff                	xor    %edi,%edi
5a19   53cff9:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53cffc: R_X86_64_32S	.rodata+0xf64c0
5a20   53d000:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d003: R_X86_64_32S	.rodata.str1.1+0xcf12
5a27   53d007:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d00a: R_X86_64_32S	.rodata+0xf79c0
5a2e   53d00e:	41 b8 d2 00 00 00    	mov    $0xd2,%r8d
5a34   53d014:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d017: R_X86_64_32S	.rodata.str1.1+0xcf12
5a3b   53d01b:	53                   	push   %rbx
5a3c   53d01c:	41 54                	push   %r12
5a3e   53d01e:	41 56                	push   %r14
5a40   53d020:	e8 00 00 00 00       	call   53d025 <balance_leaf+0x5a45>	53d021: R_X86_64_PLT32	__reiserfs_panic-0x4
5a45   53d025:	e8 00 00 00 00       	call   53d02a <balance_leaf+0x5a4a>	53d026: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5a4a   53d02a:	e8 00 00 00 00       	call   53d02f <balance_leaf+0x5a4f>	53d02b: R_X86_64_PLT32	__asan_handle_no_return-0x4
5a4f   53d02f:	31 ff                	xor    %edi,%edi
5a51   53d031:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d034: R_X86_64_32S	.rodata+0xf64c0
5a58   53d038:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d03b: R_X86_64_32S	.rodata.str1.1+0x3372
5a5f   53d03f:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d042: R_X86_64_32S	.rodata+0xf74a0
5a66   53d046:	41 b8 fa 00 00 00    	mov    $0xfa,%r8d
5a6c   53d04c:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d04f: R_X86_64_32S	.rodata.str1.1+0x3372
5a73   53d053:	e8 00 00 00 00       	call   53d058 <balance_leaf+0x5a78>	53d054: R_X86_64_PLT32	__reiserfs_panic-0x4
5a78   53d058:	e8 00 00 00 00       	call   53d05d <balance_leaf+0x5a7d>	53d059: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5a7d   53d05d:	48 8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%rbx
5a85   53d065:	48 89 df             	mov    %rbx,%rdi
5a88   53d068:	e8 00 00 00 00       	call   53d06d <balance_leaf+0x5a8d>	53d069: R_X86_64_PLT32	__asan_load8_noabort-0x4
5a8d   53d06d:	48 8b 1b             	mov    (%rbx),%rbx
5a90   53d070:	e8 00 00 00 00       	call   53d075 <balance_leaf+0x5a95>	53d071: R_X86_64_PLT32	__asan_handle_no_return-0x4
5a95   53d075:	48 89 df             	mov    %rbx,%rdi
5a98   53d078:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d07b: R_X86_64_32S	.rodata+0xf7240
5a9f   53d07f:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d082: R_X86_64_32S	.rodata.str1.1+0xcf05
5aa6   53d086:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d089: R_X86_64_32S	.rodata+0xf7260
5aad   53d08d:	e8 00 00 00 00       	call   53d092 <balance_leaf+0x5ab2>	53d08e: R_X86_64_PLT32	__reiserfs_panic-0x4
5ab2   53d092:	e8 00 00 00 00       	call   53d097 <balance_leaf+0x5ab7>	53d093: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5ab7   53d097:	e8 00 00 00 00       	call   53d09c <balance_leaf+0x5abc>	53d098: R_X86_64_PLT32	__asan_handle_no_return-0x4
5abc   53d09c:	31 ff                	xor    %edi,%edi
5abe   53d09e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d0a1: R_X86_64_32S	.rodata+0xf64c0
5ac5   53d0a5:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d0a8: R_X86_64_32S	.rodata.str1.1+0x7eee
5acc   53d0ac:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d0af: R_X86_64_32S	.rodata+0xf8b60
5ad3   53d0b3:	41 b8 02 04 00 00    	mov    $0x402,%r8d
5ad9   53d0b9:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d0bc: R_X86_64_32S	.rodata.str1.1+0x7eee
5ae0   53d0c0:	e8 00 00 00 00       	call   53d0c5 <balance_leaf+0x5ae5>	53d0c1: R_X86_64_PLT32	__reiserfs_panic-0x4
5ae5   53d0c5:	e8 00 00 00 00       	call   53d0ca <balance_leaf+0x5aea>	53d0c6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5aea   53d0ca:	e8 00 00 00 00       	call   53d0cf <balance_leaf+0x5aef>	53d0cb: R_X86_64_PLT32	__asan_handle_no_return-0x4
5aef   53d0cf:	31 ff                	xor    %edi,%edi
5af1   53d0d1:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d0d4: R_X86_64_32S	.rodata+0xf64c0
5af8   53d0d8:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d0db: R_X86_64_32S	.rodata.str1.1+0x7eee
5aff   53d0df:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d0e2: R_X86_64_32S	.rodata+0xf8be0
5b06   53d0e6:	41 b8 05 04 00 00    	mov    $0x405,%r8d
5b0c   53d0ec:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d0ef: R_X86_64_32S	.rodata.str1.1+0x7eee
5b13   53d0f3:	41 55                	push   %r13
5b15   53d0f5:	41 54                	push   %r12
5b17   53d0f7:	e8 00 00 00 00       	call   53d0fc <balance_leaf+0x5b1c>	53d0f8: R_X86_64_PLT32	__reiserfs_panic-0x4
5b1c   53d0fc:	e8 00 00 00 00       	call   53d101 <balance_leaf+0x5b21>	53d0fd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5b21   53d101:	e8 00 00 00 00       	call   53d106 <balance_leaf+0x5b26>	53d102: R_X86_64_PLT32	__asan_handle_no_return-0x4
5b26   53d106:	31 ff                	xor    %edi,%edi
5b28   53d108:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d10b: R_X86_64_32S	.rodata+0xf64c0
5b2f   53d10f:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d112: R_X86_64_32S	.rodata.str1.1+0x7eb3
5b36   53d116:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d119: R_X86_64_32S	.rodata+0xf7880
5b3d   53d11d:	41 b8 8e 00 00 00    	mov    $0x8e,%r8d
5b43   53d123:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d126: R_X86_64_32S	.rodata.str1.1+0x7eb3
5b4a   53d12a:	e8 00 00 00 00       	call   53d12f <balance_leaf+0x5b4f>	53d12b: R_X86_64_PLT32	__reiserfs_panic-0x4
5b4f   53d12f:	e8 00 00 00 00       	call   53d134 <balance_leaf+0x5b54>	53d130: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5b54   53d134:	eb 05                	jmp    53d13b <balance_leaf+0x5b5b>
5b56   53d136:	e8 00 00 00 00       	call   53d13b <balance_leaf+0x5b5b>	53d137: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5b5b   53d13b:	48 8b 1c 24          	mov    (%rsp),%rbx
5b5f   53d13f:	48 8d bb 24 02 00 00 	lea    0x224(%rbx),%rdi
5b66   53d146:	e8 00 00 00 00       	call   53d14b <balance_leaf+0x5b6b>	53d147: R_X86_64_PLT32	__asan_load4_noabort-0x4
5b6b   53d14b:	8b 9b 24 02 00 00    	mov    0x224(%rbx),%ebx
5b71   53d151:	e8 00 00 00 00       	call   53d156 <balance_leaf+0x5b76>	53d152: R_X86_64_PLT32	__asan_handle_no_return-0x4
5b76   53d156:	31 ff                	xor    %edi,%edi
5b78   53d158:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d15b: R_X86_64_32S	.rodata+0xf64c0
5b7f   53d15f:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d162: R_X86_64_32S	.rodata.str1.1+0xcf12
5b86   53d166:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d169: R_X86_64_32S	.rodata+0xf7aa0
5b8d   53d16d:	41 b8 d7 00 00 00    	mov    $0xd7,%r8d
5b93   53d173:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d176: R_X86_64_32S	.rodata.str1.1+0xcf12
5b9a   53d17a:	41 56                	push   %r14
5b9c   53d17c:	53                   	push   %rbx
5b9d   53d17d:	e8 00 00 00 00       	call   53d182 <balance_leaf+0x5ba2>	53d17e: R_X86_64_PLT32	__reiserfs_panic-0x4
5ba2   53d182:	e8 00 00 00 00       	call   53d187 <balance_leaf+0x5ba7>	53d183: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5ba7   53d187:	eb 05                	jmp    53d18e <balance_leaf+0x5bae>
5ba9   53d189:	e8 00 00 00 00       	call   53d18e <balance_leaf+0x5bae>	53d18a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5bae   53d18e:	48 8b 1c 24          	mov    (%rsp),%rbx
5bb2   53d192:	48 8d bb 24 02 00 00 	lea    0x224(%rbx),%rdi
5bb9   53d199:	e8 00 00 00 00       	call   53d19e <balance_leaf+0x5bbe>	53d19a: R_X86_64_PLT32	__asan_load4_noabort-0x4
5bbe   53d19e:	8b 9b 24 02 00 00    	mov    0x224(%rbx),%ebx
5bc4   53d1a4:	e8 00 00 00 00       	call   53d1a9 <balance_leaf+0x5bc9>	53d1a5: R_X86_64_PLT32	__asan_handle_no_return-0x4
5bc9   53d1a9:	31 ff                	xor    %edi,%edi
5bcb   53d1ab:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d1ae: R_X86_64_32S	.rodata+0xf64c0
5bd2   53d1b2:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d1b5: R_X86_64_32S	.rodata.str1.1+0xcf12
5bd9   53d1b9:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d1bc: R_X86_64_32S	.rodata+0xf7b80
5be0   53d1c0:	41 b8 dc 00 00 00    	mov    $0xdc,%r8d
5be6   53d1c6:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d1c9: R_X86_64_32S	.rodata.str1.1+0xcf12
5bed   53d1cd:	55                   	push   %rbp
5bee   53d1ce:	53                   	push   %rbx
5bef   53d1cf:	e8 00 00 00 00       	call   53d1d4 <balance_leaf+0x5bf4>	53d1d0: R_X86_64_PLT32	__reiserfs_panic-0x4
5bf4   53d1d4:	e8 00 00 00 00       	call   53d1d9 <balance_leaf+0x5bf9>	53d1d5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5bf9   53d1d9:	eb 05                	jmp    53d1e0 <balance_leaf+0x5c00>
5bfb   53d1db:	e8 00 00 00 00       	call   53d1e0 <balance_leaf+0x5c00>	53d1dc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5c00   53d1e0:	48 8b 1c 24          	mov    (%rsp),%rbx
5c04   53d1e4:	48 8d 7b 20          	lea    0x20(%rbx),%rdi
5c08   53d1e8:	e8 00 00 00 00       	call   53d1ed <balance_leaf+0x5c0d>	53d1e9: R_X86_64_PLT32	__asan_load8_noabort-0x4
5c0d   53d1ed:	48 8b 5b 20          	mov    0x20(%rbx),%rbx
5c11   53d1f1:	e8 00 00 00 00       	call   53d1f6 <balance_leaf+0x5c16>	53d1f2: R_X86_64_PLT32	__asan_handle_no_return-0x4
5c16   53d1f6:	31 ff                	xor    %edi,%edi
5c18   53d1f8:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d1fb: R_X86_64_32S	.rodata+0xf64c0
5c1f   53d1ff:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d202: R_X86_64_32S	.rodata.str1.1+0x4a9ed
5c26   53d206:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d209: R_X86_64_32S	.rodata+0xf7720
5c2d   53d20d:	41 b8 69 00 00 00    	mov    $0x69,%r8d
5c33   53d213:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d216: R_X86_64_32S	.rodata.str1.1+0x4a9ed
5c3a   53d21a:	e9 b6 03 00 00       	jmp    53d5d5 <balance_leaf+0x5ff5>
5c3f   53d21f:	e8 00 00 00 00       	call   53d224 <balance_leaf+0x5c44>	53d220: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5c44   53d224:	e8 00 00 00 00       	call   53d229 <balance_leaf+0x5c49>	53d225: R_X86_64_PLT32	__asan_handle_no_return-0x4
5c49   53d229:	31 ff                	xor    %edi,%edi
5c4b   53d22b:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d22e: R_X86_64_32S	.rodata+0xf64c0
5c52   53d232:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d235: R_X86_64_32S	.rodata.str1.1+0x3372
5c59   53d239:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d23c: R_X86_64_32S	.rodata+0xf75c0
5c60   53d240:	41 b8 1a 01 00 00    	mov    $0x11a,%r8d
5c66   53d246:	e9 53 fc ff ff       	jmp    53ce9e <balance_leaf+0x58be>
5c6b   53d24b:	e8 00 00 00 00       	call   53d250 <balance_leaf+0x5c70>	53d24c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5c70   53d250:	e8 00 00 00 00       	call   53d255 <balance_leaf+0x5c75>	53d251: R_X86_64_PLT32	__asan_handle_no_return-0x4
5c75   53d255:	31 ff                	xor    %edi,%edi
5c77   53d257:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d25a: R_X86_64_32S	.rodata+0xf64c0
5c7e   53d25e:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d261: R_X86_64_32S	.rodata.str1.1+0x11d5e
5c85   53d265:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d268: R_X86_64_32S	.rodata+0xf6a20
5c8c   53d26c:	41 b8 31 06 00 00    	mov    $0x631,%r8d
5c92   53d272:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d275: R_X86_64_32S	.rodata.str1.1+0x11d5e
5c99   53d279:	55                   	push   %rbp
5c9a   53d27a:	6a 00                	push   $0x0
5c9c   53d27c:	41 54                	push   %r12
5c9e   53d27e:	6a 00                	push   $0x0
5ca0   53d280:	e8 00 00 00 00       	call   53d285 <balance_leaf+0x5ca5>	53d281: R_X86_64_PLT32	__reiserfs_panic-0x4
5ca5   53d285:	e8 00 00 00 00       	call   53d28a <balance_leaf+0x5caa>	53d286: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5caa   53d28a:	e9 0c 01 00 00       	jmp    53d39b <balance_leaf+0x5dbb>
5caf   53d28f:	e8 00 00 00 00       	call   53d294 <balance_leaf+0x5cb4>	53d290: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5cb4   53d294:	e9 0f 03 00 00       	jmp    53d5a8 <balance_leaf+0x5fc8>
5cb9   53d299:	e8 00 00 00 00       	call   53d29e <balance_leaf+0x5cbe>	53d29a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5cbe   53d29e:	e8 00 00 00 00       	call   53d2a3 <balance_leaf+0x5cc3>	53d29f: R_X86_64_PLT32	__asan_handle_no_return-0x4
5cc3   53d2a3:	31 ff                	xor    %edi,%edi
5cc5   53d2a5:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d2a8: R_X86_64_32S	.rodata+0xf64c0
5ccc   53d2ac:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d2af: R_X86_64_32S	.rodata.str1.1+0x1dc29
5cd3   53d2b3:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d2b6: R_X86_64_32S	.rodata+0xf6b20
5cda   53d2ba:	41 b8 3f 06 00 00    	mov    $0x63f,%r8d
5ce0   53d2c0:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d2c3: R_X86_64_32S	.rodata.str1.1+0x1dc29
5ce7   53d2c7:	41 56                	push   %r14
5ce9   53d2c9:	e9 05 03 00 00       	jmp    53d5d3 <balance_leaf+0x5ff3>
5cee   53d2ce:	e8 00 00 00 00       	call   53d2d3 <balance_leaf+0x5cf3>	53d2cf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5cf3   53d2d3:	e8 00 00 00 00       	call   53d2d8 <balance_leaf+0x5cf8>	53d2d4: R_X86_64_PLT32	__asan_handle_no_return-0x4
5cf8   53d2d8:	31 ff                	xor    %edi,%edi
5cfa   53d2da:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d2dd: R_X86_64_32S	.rodata+0xf64c0
5d01   53d2e1:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d2e4: R_X86_64_32S	.rodata.str1.1+0x7eb3
5d08   53d2e8:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d2eb: R_X86_64_32S	.rodata+0xf77c0
5d0f   53d2ef:	41 b8 84 00 00 00    	mov    $0x84,%r8d
5d15   53d2f5:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d2f8: R_X86_64_32S	.rodata.str1.1+0x7eb3
5d1c   53d2fc:	6a 00                	push   $0x0
5d1e   53d2fe:	e8 00 00 00 00       	call   53d303 <balance_leaf+0x5d23>	53d2ff: R_X86_64_PLT32	__reiserfs_panic-0x4
5d23   53d303:	e8 00 00 00 00       	call   53d308 <balance_leaf+0x5d28>	53d304: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5d28   53d308:	e8 00 00 00 00       	call   53d30d <balance_leaf+0x5d2d>	53d309: R_X86_64_PLT32	__asan_handle_no_return-0x4
5d2d   53d30d:	31 ff                	xor    %edi,%edi
5d2f   53d30f:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d312: R_X86_64_32S	.rodata+0xf64c0
5d36   53d316:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d319: R_X86_64_32S	.rodata.str1.1+0xcf12
5d3d   53d31d:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d320: R_X86_64_32S	.rodata+0xf7940
5d44   53d324:	41 b8 c0 00 00 00    	mov    $0xc0,%r8d
5d4a   53d32a:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d32d: R_X86_64_32S	.rodata.str1.1+0xcf12
5d51   53d331:	41 56                	push   %r14
5d53   53d333:	e8 00 00 00 00       	call   53d338 <balance_leaf+0x5d58>	53d334: R_X86_64_PLT32	__reiserfs_panic-0x4
5d58   53d338:	e8 00 00 00 00       	call   53d33d <balance_leaf+0x5d5d>	53d339: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5d5d   53d33d:	e8 00 00 00 00       	call   53d342 <balance_leaf+0x5d62>	53d33e: R_X86_64_PLT32	__asan_handle_no_return-0x4
5d62   53d342:	31 ff                	xor    %edi,%edi
5d64   53d344:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d347: R_X86_64_32S	.rodata+0xf64c0
5d6b   53d34b:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d34e: R_X86_64_32S	.rodata.str1.1+0x1dc29
5d72   53d352:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d355: R_X86_64_32S	.rodata+0xf6b20
5d79   53d359:	41 b8 3f 06 00 00    	mov    $0x63f,%r8d
5d7f   53d35f:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d362: R_X86_64_32S	.rodata.str1.1+0x1dc29
5d86   53d366:	41 57                	push   %r15
5d88   53d368:	e9 66 02 00 00       	jmp    53d5d3 <balance_leaf+0x5ff3>
5d8d   53d36d:	e8 00 00 00 00       	call   53d372 <balance_leaf+0x5d92>	53d36e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5d92   53d372:	e8 00 00 00 00       	call   53d377 <balance_leaf+0x5d97>	53d373: R_X86_64_PLT32	__asan_handle_no_return-0x4
5d97   53d377:	31 ff                	xor    %edi,%edi
5d99   53d379:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d37c: R_X86_64_32S	.rodata+0xf64c0
5da0   53d380:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d383: R_X86_64_32S	.rodata.str1.1+0x2024a
5da7   53d387:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d38a: R_X86_64_32S	.rodata+0xf7c60
5dae   53d38e:	41 b8 35 01 00 00    	mov    $0x135,%r8d
5db4   53d394:	eb 61                	jmp    53d3f7 <balance_leaf+0x5e17>
5db6   53d396:	e8 00 00 00 00       	call   53d39b <balance_leaf+0x5dbb>	53d397: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5dbb   53d39b:	e8 00 00 00 00       	call   53d3a0 <balance_leaf+0x5dc0>	53d39c: R_X86_64_PLT32	__asan_handle_no_return-0x4
5dc0   53d3a0:	31 ff                	xor    %edi,%edi
5dc2   53d3a2:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d3a5: R_X86_64_32S	.rodata+0xf64c0
5dc9   53d3a9:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d3ac: R_X86_64_32S	.rodata.str1.1+0x11d5e
5dd0   53d3b0:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d3b3: R_X86_64_32S	.rodata+0xf6a20
5dd7   53d3b7:	41 b8 31 06 00 00    	mov    $0x631,%r8d
5ddd   53d3bd:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d3c0: R_X86_64_32S	.rodata.str1.1+0x11d5e
5de4   53d3c4:	53                   	push   %rbx
5de5   53d3c5:	6a 00                	push   $0x0
5de7   53d3c7:	41 56                	push   %r14
5de9   53d3c9:	6a 00                	push   $0x0
5deb   53d3cb:	e8 00 00 00 00       	call   53d3d0 <balance_leaf+0x5df0>	53d3cc: R_X86_64_PLT32	__reiserfs_panic-0x4
5df0   53d3d0:	e8 00 00 00 00       	call   53d3d5 <balance_leaf+0x5df5>	53d3d1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5df5   53d3d5:	e8 00 00 00 00       	call   53d3da <balance_leaf+0x5dfa>	53d3d6: R_X86_64_PLT32	__asan_handle_no_return-0x4
5dfa   53d3da:	31 ff                	xor    %edi,%edi
5dfc   53d3dc:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d3df: R_X86_64_32S	.rodata+0xf64c0
5e03   53d3e3:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d3e6: R_X86_64_32S	.rodata.str1.1+0x2024a
5e0a   53d3ea:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d3ed: R_X86_64_32S	.rodata+0xf7d20
5e11   53d3f1:	41 b8 4f 01 00 00    	mov    $0x14f,%r8d
5e17   53d3f7:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d3fa: R_X86_64_32S	.rodata.str1.1+0x2024a
5e1e   53d3fe:	6a 00                	push   $0x0
5e20   53d400:	e8 00 00 00 00       	call   53d405 <balance_leaf+0x5e25>	53d401: R_X86_64_PLT32	__reiserfs_panic-0x4
5e25   53d405:	e8 00 00 00 00       	call   53d40a <balance_leaf+0x5e2a>	53d406: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5e2a   53d40a:	e9 99 01 00 00       	jmp    53d5a8 <balance_leaf+0x5fc8>
5e2f   53d40f:	e8 00 00 00 00       	call   53d414 <balance_leaf+0x5e34>	53d410: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5e34   53d414:	e8 00 00 00 00       	call   53d419 <balance_leaf+0x5e39>	53d415: R_X86_64_PLT32	__asan_handle_no_return-0x4
5e39   53d419:	31 ff                	xor    %edi,%edi
5e3b   53d41b:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d41e: R_X86_64_32S	.rodata+0xf64c0
5e42   53d422:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d425: R_X86_64_32S	.rodata.str1.1+0x1dc45
5e49   53d429:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d42c: R_X86_64_32S	.rodata+0xf8da0
5e50   53d430:	41 b8 32 05 00 00    	mov    $0x532,%r8d
5e56   53d436:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d439: R_X86_64_32S	.rodata.str1.1+0x1dc45
5e5d   53d43d:	41 57                	push   %r15
5e5f   53d43f:	e8 00 00 00 00       	call   53d444 <balance_leaf+0x5e64>	53d440: R_X86_64_PLT32	__reiserfs_panic-0x4
5e64   53d444:	e8 00 00 00 00       	call   53d449 <balance_leaf+0x5e69>	53d445: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5e69   53d449:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	53d44c: R_X86_64_32S	.rodata+0xf8e40
5e70   53d450:	e8 00 00 00 00       	call   53d455 <balance_leaf+0x5e75>	53d451: R_X86_64_PLT32	print_cur_tb-0x4
5e75   53d455:	48 8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%rbx
5e7d   53d45d:	48 89 df             	mov    %rbx,%rdi
5e80   53d460:	e8 00 00 00 00       	call   53d465 <balance_leaf+0x5e85>	53d461: R_X86_64_PLT32	__asan_load8_noabort-0x4
5e85   53d465:	48 8b 1b             	mov    (%rbx),%rbx
5e88   53d468:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
5e8d   53d46d:	48 89 ef             	mov    %rbp,%rdi
5e90   53d470:	e8 00 00 00 00       	call   53d475 <balance_leaf+0x5e95>	53d471: R_X86_64_PLT32	__asan_load4_noabort-0x4
5e95   53d475:	8b 6d 00             	mov    0x0(%rbp),%ebp
5e98   53d478:	e8 00 00 00 00       	call   53d47d <balance_leaf+0x5e9d>	53d479: R_X86_64_PLT32	__asan_handle_no_return-0x4
5e9d   53d47d:	48 89 df             	mov    %rbx,%rdi
5ea0   53d480:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d483: R_X86_64_32S	.rodata+0xf8e60
5ea7   53d487:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d48a: R_X86_64_32S	.rodata.str1.1+0x1dc45
5eae   53d48e:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d491: R_X86_64_32S	.rodata+0xf8e80
5eb5   53d495:	41 89 e8             	mov    %ebp,%r8d
5eb8   53d498:	e8 00 00 00 00       	call   53d49d <balance_leaf+0x5ebd>	53d499: R_X86_64_PLT32	__reiserfs_panic-0x4
5ebd   53d49d:	e8 00 00 00 00       	call   53d4a2 <balance_leaf+0x5ec2>	53d49e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5ec2   53d4a2:	e8 00 00 00 00       	call   53d4a7 <balance_leaf+0x5ec7>	53d4a3: R_X86_64_PLT32	__asan_handle_no_return-0x4
5ec7   53d4a7:	31 ff                	xor    %edi,%edi
5ec9   53d4a9:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d4ac: R_X86_64_32S	.rodata+0xf64c0
5ed0   53d4b0:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d4b3: R_X86_64_32S	.rodata.str1.1+0x48633
5ed7   53d4b7:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d4ba: R_X86_64_32S	.rodata+0xf84c0
5ede   53d4be:	41 b8 67 01 00 00    	mov    $0x167,%r8d
5ee4   53d4c4:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d4c7: R_X86_64_32S	.rodata.str1.1+0x48633
5eeb   53d4cb:	e8 00 00 00 00       	call   53d4d0 <balance_leaf+0x5ef0>	53d4cc: R_X86_64_PLT32	__reiserfs_panic-0x4
5ef0   53d4d0:	e8 00 00 00 00       	call   53d4d5 <balance_leaf+0x5ef5>	53d4d1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5ef5   53d4d5:	e8 00 00 00 00       	call   53d4da <balance_leaf+0x5efa>	53d4d6: R_X86_64_PLT32	__asan_handle_no_return-0x4
5efa   53d4da:	31 ff                	xor    %edi,%edi
5efc   53d4dc:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d4df: R_X86_64_32S	.rodata+0xf64c0
5f03   53d4e3:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d4e6: R_X86_64_32S	.rodata.str1.1+0x7ed0
5f0a   53d4ea:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d4ed: R_X86_64_32S	.rodata+0xf7de0
5f11   53d4f1:	41 b8 ad 01 00 00    	mov    $0x1ad,%r8d
5f17   53d4f7:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d4fa: R_X86_64_32S	.rodata.str1.1+0x7ed0
5f1e   53d4fe:	ff 74 24 10          	push   0x10(%rsp)
5f22   53d502:	e8 00 00 00 00       	call   53d507 <balance_leaf+0x5f27>	53d503: R_X86_64_PLT32	__reiserfs_panic-0x4
5f27   53d507:	e8 00 00 00 00       	call   53d50c <balance_leaf+0x5f2c>	53d508: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5f2c   53d50c:	e8 00 00 00 00       	call   53d511 <balance_leaf+0x5f31>	53d50d: R_X86_64_PLT32	__asan_handle_no_return-0x4
5f31   53d511:	31 ff                	xor    %edi,%edi
5f33   53d513:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d516: R_X86_64_32S	.rodata+0xf64c0
5f3a   53d51a:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d51d: R_X86_64_32S	.rodata.str1.1+0x7ed0
5f41   53d521:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d524: R_X86_64_32S	.rodata+0xf7e80
5f48   53d528:	41 b8 b1 01 00 00    	mov    $0x1b1,%r8d
5f4e   53d52e:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d531: R_X86_64_32S	.rodata.str1.1+0x7ed0
5f55   53d535:	41 54                	push   %r12
5f57   53d537:	53                   	push   %rbx
5f58   53d538:	e8 00 00 00 00       	call   53d53d <balance_leaf+0x5f5d>	53d539: R_X86_64_PLT32	__reiserfs_panic-0x4
5f5d   53d53d:	e8 00 00 00 00       	call   53d542 <balance_leaf+0x5f62>	53d53e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5f62   53d542:	e8 00 00 00 00       	call   53d547 <balance_leaf+0x5f67>	53d543: R_X86_64_PLT32	__asan_handle_no_return-0x4
5f67   53d547:	31 ff                	xor    %edi,%edi
5f69   53d549:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d54c: R_X86_64_32S	.rodata+0xf64c0
5f70   53d550:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d553: R_X86_64_32S	.rodata.str1.1+0x1686a
5f77   53d557:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d55a: R_X86_64_32S	.rodata+0xf8640
5f7e   53d55e:	41 b8 cc 02 00 00    	mov    $0x2cc,%r8d
5f84   53d564:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d567: R_X86_64_32S	.rodata.str1.1+0x1686a
5f8b   53d56b:	e8 00 00 00 00       	call   53d570 <balance_leaf+0x5f90>	53d56c: R_X86_64_PLT32	__reiserfs_panic-0x4
5f90   53d570:	e8 00 00 00 00       	call   53d575 <balance_leaf+0x5f95>	53d571: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5f95   53d575:	e8 00 00 00 00       	call   53d57a <balance_leaf+0x5f9a>	53d576: R_X86_64_PLT32	__asan_handle_no_return-0x4
5f9a   53d57a:	31 ff                	xor    %edi,%edi
5f9c   53d57c:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d57f: R_X86_64_32S	.rodata+0xf64c0
5fa3   53d583:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d586: R_X86_64_32S	.rodata.str1.1+0x39780
5faa   53d58a:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d58d: R_X86_64_32S	.rodata+0xf8560
5fb1   53d591:	41 b8 13 03 00 00    	mov    $0x313,%r8d
5fb7   53d597:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d59a: R_X86_64_32S	.rodata.str1.1+0x39780
5fbe   53d59e:	e9 2a fc ff ff       	jmp    53d1cd <balance_leaf+0x5bed>
5fc3   53d5a3:	e8 00 00 00 00       	call   53d5a8 <balance_leaf+0x5fc8>	53d5a4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5fc8   53d5a8:	e8 00 00 00 00       	call   53d5ad <balance_leaf+0x5fcd>	53d5a9: R_X86_64_PLT32	__asan_handle_no_return-0x4
5fcd   53d5ad:	31 ff                	xor    %edi,%edi
5fcf   53d5af:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d5b2: R_X86_64_32S	.rodata+0xf64c0
5fd6   53d5b6:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d5b9: R_X86_64_32S	.rodata.str1.1+0x1dc29
5fdd   53d5bd:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d5c0: R_X86_64_32S	.rodata+0xf6b20
5fe4   53d5c4:	41 b8 3f 06 00 00    	mov    $0x63f,%r8d
5fea   53d5ca:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d5cd: R_X86_64_32S	.rodata.str1.1+0x1dc29
5ff1   53d5d1:	41 54                	push   %r12
5ff3   53d5d3:	6a 00                	push   $0x0
5ff5   53d5d5:	53                   	push   %rbx
5ff6   53d5d6:	6a 00                	push   $0x0
5ff8   53d5d8:	e8 00 00 00 00       	call   53d5dd <balance_leaf+0x5ffd>	53d5d9: R_X86_64_PLT32	__reiserfs_panic-0x4
5ffd   53d5dd:	e8 00 00 00 00       	call   53d5e2 <balance_leaf+0x6002>	53d5de: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6002   53d5e2:	e8 00 00 00 00       	call   53d5e7 <balance_leaf+0x6007>	53d5e3: R_X86_64_PLT32	__asan_handle_no_return-0x4
6007   53d5e7:	31 ff                	xor    %edi,%edi
6009   53d5e9:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d5ec: R_X86_64_32S	.rodata+0xf64c0
6010   53d5f0:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d5f3: R_X86_64_32S	.rodata.str1.1+0xf79e
6017   53d5f7:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d5fa: R_X86_64_32S	.rodata+0xf8ec0
601e   53d5fe:	41 b8 07 05 00 00    	mov    $0x507,%r8d
6024   53d604:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d607: R_X86_64_32S	.rodata.str1.1+0xf79e
602b   53d60b:	e8 00 00 00 00       	call   53d610 <balance_leaf+0x6030>	53d60c: R_X86_64_PLT32	__reiserfs_panic-0x4
6030   53d610:	e8 00 00 00 00       	call   53d615 <balance_leaf+0x6035>	53d611: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6035   53d615:	e8 00 00 00 00       	call   53d61a <balance_leaf+0x603a>	53d616: R_X86_64_PLT32	__asan_handle_no_return-0x4
603a   53d61a:	31 ff                	xor    %edi,%edi
603c   53d61c:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d61f: R_X86_64_32S	.rodata+0xf64c0
6043   53d623:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d626: R_X86_64_32S	.rodata.str1.1+0xb6d
604a   53d62a:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d62d: R_X86_64_32S	.rodata+0xf87c0
6051   53d631:	41 b8 64 03 00 00    	mov    $0x364,%r8d
6057   53d637:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d63a: R_X86_64_32S	.rodata.str1.1+0xb6d
605e   53d63e:	e8 00 00 00 00       	call   53d643 <balance_leaf+0x6063>	53d63f: R_X86_64_PLT32	__reiserfs_panic-0x4
6063   53d643:	e8 00 00 00 00       	call   53d648 <balance_leaf+0x6068>	53d644: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6068   53d648:	e8 00 00 00 00       	call   53d64d <balance_leaf+0x606d>	53d649: R_X86_64_PLT32	__asan_handle_no_return-0x4
606d   53d64d:	31 ff                	xor    %edi,%edi
606f   53d64f:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d652: R_X86_64_32S	.rodata+0xf64c0
6076   53d656:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d659: R_X86_64_32S	.rodata.str1.1+0x7ed0
607d   53d65d:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d660: R_X86_64_32S	.rodata+0xf8420
6084   53d664:	41 b8 07 02 00 00    	mov    $0x207,%r8d
608a   53d66a:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d66d: R_X86_64_32S	.rodata.str1.1+0x7ed0
6091   53d671:	53                   	push   %rbx
6092   53d672:	e8 00 00 00 00       	call   53d677 <balance_leaf+0x6097>	53d673: R_X86_64_PLT32	__reiserfs_panic-0x4
6097   53d677:	e8 00 00 00 00       	call   53d67c <balance_leaf+0x609c>	53d678: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
609c   53d67c:	e8 00 00 00 00       	call   53d681 <balance_leaf+0x60a1>	53d67d: R_X86_64_PLT32	__asan_handle_no_return-0x4
60a1   53d681:	31 ff                	xor    %edi,%edi
60a3   53d683:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d686: R_X86_64_32S	.rodata+0xf64c0
60aa   53d68a:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d68d: R_X86_64_32S	.rodata.str1.1+0x7ed0
60b1   53d691:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d694: R_X86_64_32S	.rodata+0xf7f60
60b8   53d698:	41 b8 c8 01 00 00    	mov    $0x1c8,%r8d
60be   53d69e:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d6a1: R_X86_64_32S	.rodata.str1.1+0x7ed0
60c5   53d6a5:	41 57                	push   %r15
60c7   53d6a7:	e8 00 00 00 00       	call   53d6ac <balance_leaf+0x60cc>	53d6a8: R_X86_64_PLT32	__reiserfs_panic-0x4
60cc   53d6ac:	e8 00 00 00 00       	call   53d6b1 <balance_leaf+0x60d1>	53d6ad: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
60d1   53d6b1:	e8 00 00 00 00       	call   53d6b6 <balance_leaf+0x60d6>	53d6b2: R_X86_64_PLT32	__asan_handle_no_return-0x4
60d6   53d6b6:	31 ff                	xor    %edi,%edi
60d8   53d6b8:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d6bb: R_X86_64_32S	.rodata+0xf64c0
60df   53d6bf:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d6c2: R_X86_64_32S	.rodata.str1.1+0x11d5e
60e6   53d6c6:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d6c9: R_X86_64_32S	.rodata+0xf6a20
60ed   53d6cd:	41 b8 31 06 00 00    	mov    $0x631,%r8d
60f3   53d6d3:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d6d6: R_X86_64_32S	.rodata.str1.1+0x11d5e
60fa   53d6da:	55                   	push   %rbp
60fb   53d6db:	6a 00                	push   $0x0
60fd   53d6dd:	41 57                	push   %r15
60ff   53d6df:	6a 00                	push   $0x0
6101   53d6e1:	e8 00 00 00 00       	call   53d6e6 <balance_leaf+0x6106>	53d6e2: R_X86_64_PLT32	__reiserfs_panic-0x4
6106   53d6e6:	e8 00 00 00 00       	call   53d6eb <balance_leaf+0x610b>	53d6e7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
610b   53d6eb:	eb 05                	jmp    53d6f2 <balance_leaf+0x6112>
610d   53d6ed:	e8 00 00 00 00       	call   53d6f2 <balance_leaf+0x6112>	53d6ee: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6112   53d6f2:	e8 00 00 00 00       	call   53d6f7 <balance_leaf+0x6117>	53d6f3: R_X86_64_PLT32	__asan_handle_no_return-0x4
6117   53d6f7:	31 ff                	xor    %edi,%edi
6119   53d6f9:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d6fc: R_X86_64_32S	.rodata+0xf64c0
6120   53d700:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d703: R_X86_64_32S	.rodata.str1.1+0x1686a
6127   53d707:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d70a: R_X86_64_32S	.rodata+0xf86e0
612e   53d70e:	41 b8 d5 02 00 00    	mov    $0x2d5,%r8d
6134   53d714:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d717: R_X86_64_32S	.rodata.str1.1+0x1686a
613b   53d71b:	41 54                	push   %r12
613d   53d71d:	41 57                	push   %r15
613f   53d71f:	e8 00 00 00 00       	call   53d724 <balance_leaf+0x6144>	53d720: R_X86_64_PLT32	__reiserfs_panic-0x4
6144   53d724:	e8 00 00 00 00       	call   53d729 <balance_leaf+0x6149>	53d725: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6149   53d729:	e9 0f fc ff ff       	jmp    53d33d <balance_leaf+0x5d5d>
614e   53d72e:	e8 00 00 00 00       	call   53d733 <balance_leaf+0x6153>	53d72f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6153   53d733:	e8 00 00 00 00       	call   53d738 <balance_leaf+0x6158>	53d734: R_X86_64_PLT32	__asan_handle_no_return-0x4
6158   53d738:	31 ff                	xor    %edi,%edi
615a   53d73a:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d73d: R_X86_64_32S	.rodata+0xf64c0
6161   53d741:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d744: R_X86_64_32S	.rodata.str1.1+0x7ed0
6168   53d748:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d74b: R_X86_64_32S	.rodata+0xf8000
616f   53d74f:	41 b8 dc 01 00 00    	mov    $0x1dc,%r8d
6175   53d755:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d758: R_X86_64_32S	.rodata.str1.1+0x7ed0
617c   53d75c:	e8 00 00 00 00       	call   53d761 <balance_leaf+0x6181>	53d75d: R_X86_64_PLT32	__reiserfs_panic-0x4
6181   53d761:	e8 00 00 00 00       	call   53d766 <balance_leaf+0x6186>	53d762: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6186   53d766:	e8 00 00 00 00       	call   53d76b <balance_leaf+0x618b>	53d767: R_X86_64_PLT32	__asan_handle_no_return-0x4
618b   53d76b:	31 ff                	xor    %edi,%edi
618d   53d76d:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d770: R_X86_64_32S	.rodata+0xf64c0
6194   53d774:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d777: R_X86_64_32S	.rodata.str1.1+0x7ed0
619b   53d77b:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d77e: R_X86_64_32S	.rodata+0xf80a0
61a2   53d782:	41 b8 df 01 00 00    	mov    $0x1df,%r8d
61a8   53d788:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d78b: R_X86_64_32S	.rodata.str1.1+0x7ed0
61af   53d78f:	e8 00 00 00 00       	call   53d794 <balance_leaf+0x61b4>	53d790: R_X86_64_PLT32	__reiserfs_panic-0x4
61b4   53d794:	e8 00 00 00 00       	call   53d799 <balance_leaf+0x61b9>	53d795: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
61b9   53d799:	e8 00 00 00 00       	call   53d79e <balance_leaf+0x61be>	53d79a: R_X86_64_PLT32	__asan_handle_no_return-0x4
61be   53d79e:	31 ff                	xor    %edi,%edi
61c0   53d7a0:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d7a3: R_X86_64_32S	.rodata+0xf64c0
61c7   53d7a7:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d7aa: R_X86_64_32S	.rodata.str1.1+0x11d5e
61ce   53d7ae:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d7b1: R_X86_64_32S	.rodata+0xf6a20
61d5   53d7b5:	41 b8 31 06 00 00    	mov    $0x631,%r8d
61db   53d7bb:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d7be: R_X86_64_32S	.rodata.str1.1+0x11d5e
61e2   53d7c2:	53                   	push   %rbx
61e3   53d7c3:	6a 00                	push   $0x0
61e5   53d7c5:	41 55                	push   %r13
61e7   53d7c7:	6a 00                	push   $0x0
61e9   53d7c9:	e8 00 00 00 00       	call   53d7ce <balance_leaf+0x61ee>	53d7ca: R_X86_64_PLT32	__reiserfs_panic-0x4
61ee   53d7ce:	e8 00 00 00 00       	call   53d7d3 <balance_leaf+0x61f3>	53d7cf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
61f3   53d7d3:	eb 0c                	jmp    53d7e1 <balance_leaf+0x6201>
61f5   53d7d5:	e8 00 00 00 00       	call   53d7da <balance_leaf+0x61fa>	53d7d6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
61fa   53d7da:	eb 05                	jmp    53d7e1 <balance_leaf+0x6201>
61fc   53d7dc:	e8 00 00 00 00       	call   53d7e1 <balance_leaf+0x6201>	53d7dd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6201   53d7e1:	e8 00 00 00 00       	call   53d7e6 <balance_leaf+0x6206>	53d7e2: R_X86_64_PLT32	__asan_handle_no_return-0x4
6206   53d7e6:	31 ff                	xor    %edi,%edi
6208   53d7e8:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d7eb: R_X86_64_32S	.rodata+0xf64c0
620f   53d7ef:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d7f2: R_X86_64_32S	.rodata.str1.1+0x7ed0
6216   53d7f6:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d7f9: R_X86_64_32S	.rodata+0xf8180
621d   53d7fd:	41 b8 fe 01 00 00    	mov    $0x1fe,%r8d
6223   53d803:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d806: R_X86_64_32S	.rodata.str1.1+0x7ed0
622a   53d80a:	e8 00 00 00 00       	call   53d80f <balance_leaf+0x622f>	53d80b: R_X86_64_PLT32	__reiserfs_panic-0x4
622f   53d80f:	e8 00 00 00 00       	call   53d814 <balance_leaf+0x6234>	53d810: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6234   53d814:	eb 05                	jmp    53d81b <balance_leaf+0x623b>
6236   53d816:	e8 00 00 00 00       	call   53d81b <balance_leaf+0x623b>	53d817: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
623b   53d81b:	e8 00 00 00 00       	call   53d820 <balance_leaf+0x6240>	53d81c: R_X86_64_PLT32	__asan_handle_no_return-0x4
6240   53d820:	31 ff                	xor    %edi,%edi
6242   53d822:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	53d825: R_X86_64_32S	.rodata+0xf64c0
6249   53d829:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	53d82c: R_X86_64_32S	.rodata.str1.1+0xf79e
6250   53d830:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	53d833: R_X86_64_32S	.rodata+0xf8f40
6257   53d837:	41 b8 15 05 00 00    	mov    $0x515,%r8d
625d   53d83d:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	53d840: R_X86_64_32S	.rodata.str1.1+0xf79e
6264   53d844:	e8 00 00 00 00       	call   53d849 <balance_leaf+0x6269>	53d845: R_X86_64_PLT32	__reiserfs_panic-0x4
6269   53d849:	e8 00 00 00 00       	call   53d84e <balance_leaf+0x626e>	53d84a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
626e   53d84e:	0f 0b                	ud2
6270   53d850:	e8 00 00 00 00       	call   53d855 <balance_leaf+0x6275>	53d851: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6275   53d855:	0f 0b                	ud2
6277   53d857:	e8 00 00 00 00       	call   53d85c <balance_leaf+0x627c>	53d858: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
627c   53d85c:	0f 0b                	ud2
627e   53d85e:	e8 00 00 00 00       	call   53d863 <balance_leaf+0x6283>	53d85f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6283   53d863:	0f 0b                	ud2
6285   53d865:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
628f   53d86f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--YCo9i469aO4if6+1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 5.15.33 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="clang version 14.0.6 (git://gitmirror/llvm_project f28c006a5895fc0e329fe15fead81e37457cb1d1)"
CONFIG_GCC_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_CLANG_VERSION=140006
CONFIG_AS_IS_LLVM=y
CONFIG_AS_VERSION=140006
CONFIG_LD_VERSION=0
CONFIG_LD_IS_LLD=y
CONFIG_LLD_VERSION=140006
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
CONFIG_KERNEL_XZ=y
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SWAP=y
# CONFIG_SYSVIPC is not set
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
CONFIG_WATCH_QUEUE=y
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_TIME_KUNIT_TEST=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
# CONFIG_NO_HZ_FULL is not set
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_FORCE=y
CONFIG_NO_HZ=y
# CONFIG_HIGH_RES_TIMERS is not set
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT=y
# CONFIG_BPF_JIT_ALWAYS_ON is not set
CONFIG_BPF_JIT_DEFAULT_ON=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
# end of BPF subsystem

# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=y
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPTION=y
CONFIG_PREEMPT_DYNAMIC=y
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
# CONFIG_TICK_CPU_ACCOUNTING is not set
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_TASKSTATS=y
# CONFIG_TASK_DELAY_ACCT is not set
CONFIG_TASK_XACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_PREEMPT_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=64
CONFIG_RCU_FANOUT_LEAF=16
# CONFIG_RCU_FAST_NO_HZ is not set
# CONFIG_RCU_BOOST is not set
# CONFIG_RCU_NOCB_CPU is not set
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=m
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=17
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_ARCH_SUPPORTS_INT128=y
# CONFIG_NUMA_BALANCING is not set
CONFIG_CGROUPS=y
# CONFIG_MEMCG is not set
# CONFIG_BLK_CGROUP is not set
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_RDMA is not set
CONFIG_CGROUP_FREEZER=y
CONFIG_CPUSETS=y
# CONFIG_PROC_PID_CPUSET is not set
# CONFIG_CGROUP_DEVICE is not set
CONFIG_CGROUP_CPUACCT=y
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_BPF is not set
CONFIG_CGROUP_MISC=y
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
CONFIG_TIME_NS=y
# CONFIG_IPC_NS is not set
CONFIG_USER_NS=y
# CONFIG_PID_NS is not set
# CONFIG_NET_NS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
CONFIG_SYSFS_DEPRECATED=y
# CONFIG_SYSFS_DEPRECATED_V2 is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
# CONFIG_RD_BZIP2 is not set
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
# CONFIG_RD_LZO is not set
# CONFIG_RD_LZ4 is not set
# CONFIG_RD_ZSTD is not set
CONFIG_BOOT_CONFIG=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_SYSCTL=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
# CONFIG_EXPERT is not set
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_USERFAULTFD=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# end of Kernel Performance Events And Counters

CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
CONFIG_COMPAT_BRK=y
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLAB_MERGE_DEFAULT is not set
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
# CONFIG_SLUB_CPU_PARTIAL is not set
CONFIG_SYSTEM_DATA_VERIFICATION=y
# CONFIG_PROFILING is not set
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HAS_FILTER_PGPROT=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_NR_GPIO=1024
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_AUDIT_ARCH=y
CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_DYNAMIC_PHYSICAL_MASK=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_X2APIC=y
CONFIG_X86_MPPARSE=y
CONFIG_GOLDFISH=y
# CONFIG_RETPOLINE is not set
CONFIG_X86_CPU_RESCTRL=y
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_VSMP is not set
# CONFIG_X86_GOLDFISH is not set
CONFIG_X86_INTEL_MID=y
CONFIG_IOSF_MBI=m
# CONFIG_IOSF_MBI_DEBUG is not set
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
CONFIG_PARAVIRT_SPINLOCKS=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
# CONFIG_KVM_GUEST is not set
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
CONFIG_PVH=y
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
# CONFIG_JAILHOUSE_GUEST is not set
CONFIG_ACRN_GUEST=y
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
CONFIG_GART_IOMMU=y
CONFIG_NR_CPUS_RANGE_BEGIN=2
CONFIG_NR_CPUS_RANGE_END=512
CONFIG_NR_CPUS_DEFAULT=64
CONFIG_NR_CPUS=64
CONFIG_SCHED_SMT=y
# CONFIG_SCHED_MC is not set
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
# CONFIG_X86_MCE is not set

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_PERF_EVENTS_INTEL_RAPL=m
CONFIG_PERF_EVENTS_INTEL_CSTATE=y
# CONFIG_PERF_EVENTS_AMD_POWER is not set
CONFIG_PERF_EVENTS_AMD_UNCORE=y
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
# CONFIG_I8K is not set
CONFIG_MICROCODE=y
# CONFIG_MICROCODE_INTEL is not set
CONFIG_MICROCODE_AMD=y
# CONFIG_MICROCODE_OLD_INTERFACE is not set
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=m
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
CONFIG_X86_CPA_STATISTICS=y
CONFIG_AMD_MEM_ENCRYPT=y
# CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT is not set
CONFIG_NUMA=y
# CONFIG_AMD_NUMA is not set
# CONFIG_NUMA_EMU is not set
CONFIG_NODES_SHIFT=6
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
# CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=0
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_ARCH_RANDOM=y
CONFIG_X86_SMAP=y
CONFIG_X86_UMIP=y
# CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_X86_SGX is not set
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
CONFIG_KEXEC=y
# CONFIG_KEXEC_FILE is not set
CONFIG_CRASH_DUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
# CONFIG_LEGACY_VSYSCALL_EMULATE is not set
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
CONFIG_HAVE_LIVEPATCH=y
# end of Processor type and features

CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y

#
# Power management and ACPI options
#
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
# CONFIG_HIBERNATION is not set
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
CONFIG_PM_AUTOSLEEP=y
CONFIG_PM_WAKELOCKS=y
CONFIG_PM_WAKELOCKS_LIMIT=100
# CONFIG_PM_WAKELOCKS_GC is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
CONFIG_PM_ADVANCED_DEBUG=y
# CONFIG_PM_TEST_SUSPEND is not set
CONFIG_PM_SLEEP_DEBUG=y
# CONFIG_PM_TRACE_RTC is not set
CONFIG_PM_CLK=y
CONFIG_PM_GENERIC_DOMAINS=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_PM_GENERIC_DOMAINS_SLEEP=y
CONFIG_ENERGY_MODEL=y
CONFIG_ARCH_SUPPORTS_ACPI=y
# CONFIG_ACPI is not set

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
# CONFIG_CPU_FREQ_STAT is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=m
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
# CONFIG_CPU_FREQ_GOV_SCHEDUTIL is not set

#
# CPU frequency scaling drivers
#
# CONFIG_X86_INTEL_PSTATE is not set
# CONFIG_X86_P4_CLOCKMOD is not set

#
# shared options
#
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
# end of CPU Idle

CONFIG_INTEL_IDLE=y
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_ISA_DMA_API=y
CONFIG_AMD_NB=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
# CONFIG_IA32_EMULATION is not set
# end of Binary Emulations

CONFIG_HAVE_KVM=y
# CONFIG_VIRTUALIZATION is not set
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
CONFIG_STATIC_KEYS_SELFTEST=y
CONFIG_STATIC_CALL_SELFTEST=y
CONFIG_OPTPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR is not set
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING=y
CONFIG_HAVE_CONTEXT_TRACKING_OFFSTACK=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_ISA_BUS_API=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
# CONFIG_VMAP_STACK is not set
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
CONFIG_LOCK_EVENT_COUNTS=y
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_ARCH_HAS_CC_PLATFORM=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
# CONFIG_MODULE_FORCE_LOAD is not set
# CONFIG_MODULE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
CONFIG_MODULE_SRCVERSION_ALL=y
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
# CONFIG_MODULE_SIG_ALL is not set
# CONFIG_MODULE_SIG_SHA1 is not set
CONFIG_MODULE_SIG_SHA224=y
# CONFIG_MODULE_SIG_SHA256 is not set
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha224"
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=m
# CONFIG_BLK_DEV_ZONED is not set
# CONFIG_BLK_WBT is not set
# CONFIG_BLK_DEBUG_FS is not set
# CONFIG_BLK_SED_OPAL is not set
CONFIG_BLK_INLINE_ENCRYPTION=y
# CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
# CONFIG_ACORN_PARTITION is not set
CONFIG_AIX_PARTITION=y
CONFIG_OSF_PARTITION=y
CONFIG_AMIGA_PARTITION=y
# CONFIG_ATARI_PARTITION is not set
CONFIG_MAC_PARTITION=y
# CONFIG_MSDOS_PARTITION is not set
CONFIG_LDM_PARTITION=y
# CONFIG_LDM_DEBUG is not set
CONFIG_SGI_PARTITION=y
# CONFIG_ULTRIX_PARTITION is not set
# CONFIG_SUN_PARTITION is not set
CONFIG_KARMA_PARTITION=y
CONFIG_EFI_PARTITION=y
CONFIG_SYSV68_PARTITION=y
# CONFIG_CMDLINE_PARTITION is not set
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
# CONFIG_BINFMT_SCRIPT is not set
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_COMPACTION=y
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_VIRT_TO_BUS=y
CONFIG_MMU_NOTIFIER=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_ARCH_WANTS_THP_SWAP=y
# CONFIG_CLEANCACHE is not set
CONFIG_FRONTSWAP=y
# CONFIG_CMA is not set
CONFIG_ZSWAP=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lz4"
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=y
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT="zbud"
# CONFIG_ZSWAP_DEFAULT_ON is not set
CONFIG_ZPOOL=y
CONFIG_ZBUD=y
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=y
CONFIG_ZSMALLOC_STAT=y
CONFIG_GENERIC_EARLY_IOREMAP=y
# CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_VMAP_PFN=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_MAPPING_DIRTY_HELPERS=y
CONFIG_SECRETMEM=y

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=y
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
CONFIG_UNIX_DIAG=y
# CONFIG_XDP_SOCKETS is not set
# CONFIG_INET is not set
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
# CONFIG_NETFILTER is not set
# CONFIG_ATM is not set
CONFIG_STP=y
CONFIG_GARP=m
CONFIG_BRIDGE=y
CONFIG_BRIDGE_VLAN_FILTERING=y
CONFIG_BRIDGE_MRP=y
# CONFIG_BRIDGE_CFM is not set
CONFIG_VLAN_8021Q=m
CONFIG_VLAN_8021Q_GVRP=y
# CONFIG_VLAN_8021Q_MVRP is not set
# CONFIG_DECNET is not set
CONFIG_LLC=y
CONFIG_LLC2=y
CONFIG_ATALK=m
# CONFIG_DEV_APPLETALK is not set
CONFIG_X25=m
CONFIG_LAPB=m
# CONFIG_PHONET is not set
CONFIG_IEEE802154=m
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
CONFIG_IEEE802154_SOCKET=m
# CONFIG_MAC802154 is not set
# CONFIG_NET_SCHED is not set
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
CONFIG_BATMAN_ADV=y
CONFIG_BATMAN_ADV_NC=y
CONFIG_BATMAN_ADV_DEBUG=y
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
# CONFIG_MPLS is not set
CONFIG_NET_NSH=y
CONFIG_HSR=m
CONFIG_QRTR=y
CONFIG_QRTR_SMD=m
CONFIG_QRTR_TUN=y
# CONFIG_QRTR_MHI is not set
# CONFIG_PCPU_DEV_REFCNT is not set
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_BCM=m
CONFIG_CAN_GW=m
CONFIG_CAN_J1939=m
# CONFIG_CAN_ISOTP is not set

#
# CAN Device Drivers
#
# CONFIG_CAN_VCAN is not set
# CONFIG_CAN_VXCAN is not set
# CONFIG_CAN_SLCAN is not set
CONFIG_CAN_DEV=m
CONFIG_CAN_CALC_BITTIMING=y
# CONFIG_CAN_AT91 is not set
# CONFIG_CAN_FLEXCAN is not set
# CONFIG_CAN_JANZ_ICAN3 is not set
# CONFIG_CAN_KVASER_PCIEFD is not set
# CONFIG_CAN_SUN4I is not set
# CONFIG_CAN_XILINXCAN is not set
# CONFIG_PCH_CAN is not set
# CONFIG_CAN_C_CAN is not set
# CONFIG_CAN_CC770 is not set
# CONFIG_CAN_IFI_CANFD is not set
# CONFIG_CAN_M_CAN is not set
# CONFIG_CAN_PEAK_PCIEFD is not set
# CONFIG_CAN_RCAR is not set
# CONFIG_CAN_RCAR_CANFD is not set
# CONFIG_CAN_SJA1000 is not set
# CONFIG_CAN_SOFTING is not set
# CONFIG_CAN_DEBUG_DEVICES is not set
# end of CAN Device Drivers

CONFIG_BT=m
CONFIG_BT_BREDR=y
CONFIG_BT_RFCOMM=m
# CONFIG_BT_RFCOMM_TTY is not set
CONFIG_BT_BNEP=y
CONFIG_BT_BNEP_MC_FILTER=y
CONFIG_BT_BNEP_PROTO_FILTER=y
CONFIG_BT_HIDP=m
CONFIG_BT_HS=y
CONFIG_BT_LE=y
CONFIG_BT_LEDS=y
# CONFIG_BT_MSFTEXT is not set
CONFIG_BT_AOSPEXT=y
# CONFIG_BT_DEBUGFS is not set

#
# Bluetooth device drivers
#
CONFIG_BT_HCIBTSDIO=m
# CONFIG_BT_HCIUART is not set
# CONFIG_BT_HCIDTL1 is not set
CONFIG_BT_HCIBT3C=m
# CONFIG_BT_HCIBLUECARD is not set
CONFIG_BT_HCIVHCI=m
CONFIG_BT_MRVL=m
CONFIG_BT_MRVL_SDIO=m
CONFIG_BT_MTKSDIO=m
# CONFIG_BT_MTKUART is not set
# CONFIG_BT_QCOMSMD is not set
# CONFIG_BT_VIRTIO is not set
# end of Bluetooth device drivers

CONFIG_MCTP=y
CONFIG_WIRELESS=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
CONFIG_CFG80211_DEBUGFS=y
CONFIG_CFG80211_CRDA_SUPPORT=y
CONFIG_CFG80211_WEXT=y
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
# CONFIG_MAC80211_MESH is not set
# CONFIG_MAC80211_LEDS is not set
CONFIG_MAC80211_DEBUGFS=y
CONFIG_MAC80211_MESSAGE_TRACING=y
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
CONFIG_RFKILL_GPIO=m
# CONFIG_NET_9P is not set
CONFIG_CAIF=m
# CONFIG_CAIF_DEBUG is not set
CONFIG_CAIF_NETDEV=m
CONFIG_CAIF_USB=m
CONFIG_NFC=m
CONFIG_NFC_DIGITAL=m
# CONFIG_NFC_NCI is not set
CONFIG_NFC_HCI=m
# CONFIG_NFC_SHDLC is not set

#
# Near Field Communication (NFC) devices
#
CONFIG_NFC_MEI_PHY=m
CONFIG_NFC_SIM=m
CONFIG_NFC_PN544=m
CONFIG_NFC_PN544_MEI=m
CONFIG_NFC_PN533=m
# CONFIG_NFC_PN533_I2C is not set
CONFIG_NFC_PN532_UART=m
CONFIG_NFC_MICROREAD=m
CONFIG_NFC_MICROREAD_MEI=m
# end of Near Field Communication (NFC) devices

CONFIG_PSAMPLE=y
# CONFIG_NET_IFE is not set
# CONFIG_LWTUNNEL is not set
CONFIG_NET_SOCK_MSG=y
CONFIG_FAILOVER=y
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
# CONFIG_HOTPLUG_PCI_PCIE is not set
CONFIG_PCIEAER=y
# CONFIG_PCIEAER_INJECT is not set
CONFIG_PCIE_ECRC=y
CONFIG_PCIEASPM=y
# CONFIG_PCIEASPM_DEFAULT is not set
CONFIG_PCIEASPM_POWERSAVE=y
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
# CONFIG_PCIE_DPC is not set
CONFIG_PCIE_PTM=y
# CONFIG_PCI_MSI is not set
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
# CONFIG_PCI_STUB is not set
CONFIG_PCI_PF_STUB=m
CONFIG_PCI_ATS=y
CONFIG_PCI_ECAM=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
# CONFIG_PCI_PRI is not set
CONFIG_PCI_PASID=y
CONFIG_PCI_LABEL=y
CONFIG_HOTPLUG_PCI=y
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#
CONFIG_PCI_HOST_COMMON=y
CONFIG_PCIE_XILINX_CPM=y
CONFIG_PCI_VERSATILE=y
CONFIG_PCIE_ALTERA=m

#
# DesignWare PCI Core Support
#
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=y
# end of PCI switch controller drivers

CONFIG_CXL_BUS=y
CONFIG_CXL_MEM=m
CONFIG_CXL_MEM_RAW_COMMANDS=y
CONFIG_PCCARD=y
CONFIG_PCMCIA=y
# CONFIG_PCMCIA_LOAD_CIS is not set
CONFIG_CARDBUS=y

#
# PC-card bridges
#
# CONFIG_YENTA is not set
CONFIG_PD6729=m
# CONFIG_I82092 is not set
CONFIG_PCCARD_NONSTATIC=y
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
# CONFIG_UEVENT_HELPER is not set
# CONFIG_DEVTMPFS is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
CONFIG_FW_LOADER_COMPRESS=y
CONFIG_FW_CACHE=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
CONFIG_PM_QOS_KUNIT_TEST=y
CONFIG_TEST_ASYNC_DRIVER_PROBE=m
CONFIG_DRIVER_PE_KUNIT_TEST=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=m
CONFIG_REGMAP_SPMI=m
CONFIG_REGMAP_W1=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_I3C=m
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_ARM_INTEGRATOR_LM=y
CONFIG_BT1_APB=y
# CONFIG_BT1_AXI is not set
CONFIG_HISILICON_LPC=y
CONFIG_INTEL_IXP4XX_EB=y
CONFIG_QCOM_EBI2=y
CONFIG_MHI_BUS=m
# CONFIG_MHI_BUS_DEBUG is not set
CONFIG_MHI_BUS_PCI_GENERIC=m
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
CONFIG_ARM_SCMI_PROTOCOL=m
CONFIG_ARM_SCMI_HAVE_TRANSPORT=y
CONFIG_ARM_SCMI_HAVE_SHMEM=y
CONFIG_ARM_SCMI_TRANSPORT_MAILBOX=y
# CONFIG_ARM_SCMI_TRANSPORT_VIRTIO is not set
CONFIG_ARM_SCMI_POWER_DOMAIN=m
# end of ARM System Control and Management Interface Protocol

# CONFIG_ARM_SCPI_PROTOCOL is not set
CONFIG_EDD=m
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
# CONFIG_DMIID is not set
# CONFIG_DMI_SYSFS is not set
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_FW_CFG_SYSFS is not set
CONFIG_QCOM_SCM=y
CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT=y
CONFIG_SYSFB=y
CONFIG_SYSFB_SIMPLEFB=y
# CONFIG_BCM47XX_NVRAM is not set
# CONFIG_TEE_BNXT_FW is not set
# CONFIG_GOOGLE_FIRMWARE is not set
# CONFIG_IMX_DSP is not set
CONFIG_IMX_SCU=y
# CONFIG_IMX_SCU_PD is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
CONFIG_GNSS_SERIAL=m
# CONFIG_GNSS_MTK_SERIAL is not set
CONFIG_GNSS_SIRF_SERIAL=m
CONFIG_GNSS_UBX_SERIAL=m
CONFIG_MTD=y
CONFIG_MTD_TESTS=m

#
# Partition parsers
#
CONFIG_MTD_AR7_PARTS=y
# CONFIG_MTD_BCM63XX_PARTS is not set
CONFIG_MTD_CMDLINE_PARTS=y
# CONFIG_MTD_PARSER_IMAGETAG is not set
# CONFIG_MTD_PARSER_TRX is not set
# CONFIG_MTD_SHARPSL_PARTS is not set
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
CONFIG_MTD_REDBOOT_PARTS_READONLY=y
CONFIG_MTD_QCOMSMEM_PARTS=m
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=m
# CONFIG_MTD_BLOCK_RO is not set

#
# Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
#
# CONFIG_FTL is not set
CONFIG_NFTL=y
# CONFIG_NFTL_RW is not set
# CONFIG_INFTL is not set
CONFIG_RFD_FTL=y
# CONFIG_SSFDC is not set
CONFIG_SM_FTL=y
CONFIG_MTD_OOPS=m
# CONFIG_MTD_PSTORE is not set
CONFIG_MTD_SWAP=y
CONFIG_MTD_PARTITIONED_MASTER=y

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=m
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=m
CONFIG_MTD_CFI_STAA=m
CONFIG_MTD_CFI_UTIL=y
# CONFIG_MTD_RAM is not set
CONFIG_MTD_ROM=m
CONFIG_MTD_ABSENT=y
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
CONFIG_MTD_PHYSMAP=y
# CONFIG_MTD_PHYSMAP_COMPAT is not set
# CONFIG_MTD_PHYSMAP_GPIO_ADDR is not set
CONFIG_MTD_SC520CDP=m
CONFIG_MTD_NETSC520=m
CONFIG_MTD_TS5500=m
CONFIG_MTD_SBC_GXX=y
# CONFIG_MTD_AMD76XROM is not set
CONFIG_MTD_ICHXROM=y
# CONFIG_MTD_ESB2ROM is not set
# CONFIG_MTD_CK804XROM is not set
CONFIG_MTD_SCB2_FLASH=m
CONFIG_MTD_NETtel=m
CONFIG_MTD_L440GX=y
# CONFIG_MTD_PCI is not set
# CONFIG_MTD_PCMCIA is not set
# CONFIG_MTD_INTEL_VR_NOR is not set
# CONFIG_MTD_PLATRAM is not set
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
CONFIG_MTD_PMC551=y
CONFIG_MTD_PMC551_BUGFIX=y
# CONFIG_MTD_PMC551_DEBUG is not set
# CONFIG_MTD_SPEAR_SMI is not set
# CONFIG_MTD_SLRAM is not set
CONFIG_MTD_PHRAM=m
CONFIG_MTD_MTDRAM=y
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128
CONFIG_MTD_BLOCK2MTD=m

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=y
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=y
# CONFIG_MTD_ONENAND is not set
CONFIG_MTD_RAW_NAND=m

#
# Raw/parallel NAND flash controllers
#
CONFIG_MTD_NAND_DENALI=m
CONFIG_MTD_NAND_DENALI_PCI=m
CONFIG_MTD_NAND_AMS_DELTA=m
# CONFIG_MTD_NAND_OMAP2 is not set
CONFIG_MTD_NAND_SHARPSL=m
# CONFIG_MTD_NAND_CAFE is not set
# CONFIG_MTD_NAND_ATMEL is not set
CONFIG_MTD_NAND_MARVELL=m
CONFIG_MTD_NAND_SLC_LPC32XX=m
CONFIG_MTD_NAND_MLC_LPC32XX=m
CONFIG_MTD_NAND_BRCMNAND=m
# CONFIG_MTD_NAND_OXNAS is not set
# CONFIG_MTD_NAND_FSL_IFC is not set
CONFIG_MTD_NAND_VF610_NFC=m
# CONFIG_MTD_NAND_SH_FLCTL is not set
CONFIG_MTD_NAND_DAVINCI=m
CONFIG_MTD_NAND_TXX9NDFMC=m
# CONFIG_MTD_NAND_SUNXI is not set
# CONFIG_MTD_NAND_HISI504 is not set
CONFIG_MTD_NAND_QCOM=m
# CONFIG_MTD_NAND_MTK is not set
# CONFIG_MTD_NAND_MXIC is not set
# CONFIG_MTD_NAND_TEGRA is not set
# CONFIG_MTD_NAND_STM32_FMC2 is not set
CONFIG_MTD_NAND_MESON=m
# CONFIG_MTD_NAND_GPIO is not set
# CONFIG_MTD_NAND_PLATFORM is not set
CONFIG_MTD_NAND_CADENCE=m
CONFIG_MTD_NAND_ARASAN=m
# CONFIG_MTD_NAND_INTEL_LGM is not set

#
# Misc
#
CONFIG_MTD_SM_COMMON=m
CONFIG_MTD_NAND_NANDSIM=m
CONFIG_MTD_NAND_RICOH=m
CONFIG_MTD_NAND_DISKONCHIP=m
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=y
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH=y
CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=y

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
# CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=y
CONFIG_MTD_QINFO_PROBE=y
# end of LPDDR & LPDDR2 PCM memory drivers

# CONFIG_MTD_UBI is not set
CONFIG_MTD_HYPERBUS=m
CONFIG_HBMC_AM654=m
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
CONFIG_PARPORT_PC=y
# CONFIG_PARPORT_SERIAL is not set
CONFIG_PARPORT_PC_FIFO=y
# CONFIG_PARPORT_PC_SUPERIO is not set
# CONFIG_PARPORT_PC_PCMCIA is not set
CONFIG_PARPORT_AX88796=y
# CONFIG_PARPORT_1284 is not set
CONFIG_PARPORT_NOT_PC=y
# CONFIG_BLK_DEV is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
CONFIG_BLK_DEV_NVME=m
# CONFIG_NVME_MULTIPATH is not set
# CONFIG_NVME_HWMON is not set
CONFIG_NVME_FABRICS=m
CONFIG_NVME_FC=m
CONFIG_NVME_TARGET=m
CONFIG_NVME_TARGET_PASSTHRU=y
# CONFIG_NVME_TARGET_LOOP is not set
CONFIG_NVME_TARGET_FC=m
CONFIG_NVME_TARGET_FCLOOP=m
# end of NVME Support

#
# Misc devices
#
CONFIG_AD525X_DPOT=m
CONFIG_AD525X_DPOT_I2C=m
CONFIG_DUMMY_IRQ=y
CONFIG_IBM_ASM=m
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
CONFIG_ICS932S401=y
CONFIG_ATMEL_SSC=y
CONFIG_ENCLOSURE_SERVICES=y
# CONFIG_CS5535_MFGPT is not set
# CONFIG_HP_ILO is not set
CONFIG_QCOM_COINCELL=m
# CONFIG_QCOM_FASTRPC is not set
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=y
CONFIG_ISL29020=y
# CONFIG_SENSORS_TSL2550 is not set
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=y
# CONFIG_HMC6352 is not set
CONFIG_DS1682=y
CONFIG_PCH_PHUB=m
CONFIG_SRAM=y
CONFIG_DW_XDATA_PCIE=m
# CONFIG_PCI_ENDPOINT_TEST is not set
CONFIG_XILINX_SDFEC=y
CONFIG_C2PORT=m
# CONFIG_C2PORT_DURAMAR_2150 is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
# CONFIG_EEPROM_LEGACY is not set
# CONFIG_EEPROM_MAX6875 is not set
# CONFIG_EEPROM_93CX6 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
CONFIG_EEPROM_EE1004=m
# end of EEPROM support

CONFIG_CB710_CORE=m
CONFIG_CB710_DEBUG=y
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
CONFIG_TI_ST=y
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
# CONFIG_ALTERA_STAPL is not set
CONFIG_INTEL_MEI=y
CONFIG_INTEL_MEI_ME=y
CONFIG_INTEL_MEI_TXE=m
# CONFIG_INTEL_MEI_HDCP is not set
# CONFIG_VMWARE_VMCI is not set
# CONFIG_GENWQE is not set
CONFIG_ECHO=y
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_HABANA_AI is not set
CONFIG_UACCE=y
CONFIG_PVPANIC=y
CONFIG_PVPANIC_PCI=m
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=m
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
# CONFIG_BLK_DEV_SD is not set
CONFIG_CHR_DEV_ST=y
CONFIG_CHR_DEV_SG=y
# CONFIG_BLK_DEV_BSG is not set
CONFIG_CHR_DEV_SCH=m
# CONFIG_SCSI_ENCLOSURE is not set
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=y
CONFIG_SCSI_FC_ATTRS=y
CONFIG_SCSI_ISCSI_ATTRS=y
CONFIG_SCSI_SAS_ATTRS=y
CONFIG_SCSI_SAS_LIBSAS=m
# CONFIG_SCSI_SAS_HOST_SMP is not set
CONFIG_SCSI_SRP_ATTRS=y
# end of SCSI Transports

# CONFIG_SCSI_LOWLEVEL is not set
# CONFIG_SCSI_DH is not set
# end of SCSI device support

# CONFIG_ATA is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=m
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
# CONFIG_MD_RAID1 is not set
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
# CONFIG_MD_MULTIPATH is not set
CONFIG_MD_FAULTY=m
# CONFIG_BCACHE is not set
# CONFIG_BLK_DEV_DM is not set
CONFIG_TARGET_CORE=m
CONFIG_TCM_IBLOCK=m
CONFIG_TCM_FILEIO=m
# CONFIG_TCM_PSCSI is not set
CONFIG_TCM_USER2=m
CONFIG_LOOPBACK_TARGET=m
# CONFIG_SBP_TARGET is not set
CONFIG_FUSION=y
CONFIG_FUSION_SPI=m
CONFIG_FUSION_FC=y
# CONFIG_FUSION_SAS is not set
CONFIG_FUSION_MAX_SGE=128
CONFIG_FUSION_CTL=m
CONFIG_FUSION_LOGGING=y

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_SBP2=m
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
# CONFIG_NETDEVICES is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=m
CONFIG_INPUT_SPARSEKMAP=m
CONFIG_INPUT_MATRIXKMAP=m

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=y
# CONFIG_INPUT_EVDEV is not set
CONFIG_INPUT_EVBUG=m

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
CONFIG_INPUT_MOUSE=y
# CONFIG_MOUSE_PS2 is not set
# CONFIG_MOUSE_SERIAL is not set
CONFIG_MOUSE_CYAPA=y
# CONFIG_MOUSE_ELAN_I2C is not set
CONFIG_MOUSE_VSXXXAA=y
CONFIG_MOUSE_GPIO=y
CONFIG_MOUSE_SYNAPTICS_I2C=y
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
CONFIG_INPUT_TOUCHSCREEN=y
CONFIG_TOUCHSCREEN_88PM860X=m
# CONFIG_TOUCHSCREEN_AD7879 is not set
CONFIG_TOUCHSCREEN_ADC=m
# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
CONFIG_TOUCHSCREEN_AUO_PIXCIR=y
CONFIG_TOUCHSCREEN_BU21013=y
# CONFIG_TOUCHSCREEN_BU21029 is not set
CONFIG_TOUCHSCREEN_CY8CTMA140=m
CONFIG_TOUCHSCREEN_CY8CTMG110=y
CONFIG_TOUCHSCREEN_CYTTSP_CORE=m
# CONFIG_TOUCHSCREEN_CYTTSP_I2C is not set
CONFIG_TOUCHSCREEN_CYTTSP4_CORE=m
# CONFIG_TOUCHSCREEN_CYTTSP4_I2C is not set
CONFIG_TOUCHSCREEN_DYNAPRO=m
CONFIG_TOUCHSCREEN_HAMPSHIRE=m
# CONFIG_TOUCHSCREEN_EETI is not set
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=m
CONFIG_TOUCHSCREEN_EXC3000=m
CONFIG_TOUCHSCREEN_FUJITSU=y
# CONFIG_TOUCHSCREEN_GOODIX is not set
CONFIG_TOUCHSCREEN_HIDEEP=y
# CONFIG_TOUCHSCREEN_HYCON_HY46XX is not set
# CONFIG_TOUCHSCREEN_ILI210X is not set
CONFIG_TOUCHSCREEN_ILITEK=m
CONFIG_TOUCHSCREEN_IPROC=m
CONFIG_TOUCHSCREEN_S6SY761=m
CONFIG_TOUCHSCREEN_GUNZE=m
CONFIG_TOUCHSCREEN_EKTF2127=y
CONFIG_TOUCHSCREEN_ELAN=m
# CONFIG_TOUCHSCREEN_ELO is not set
CONFIG_TOUCHSCREEN_WACOM_W8001=m
CONFIG_TOUCHSCREEN_WACOM_I2C=m
# CONFIG_TOUCHSCREEN_MAX11801 is not set
CONFIG_TOUCHSCREEN_MCS5000=y
CONFIG_TOUCHSCREEN_MMS114=m
CONFIG_TOUCHSCREEN_MELFAS_MIP4=m
CONFIG_TOUCHSCREEN_MSG2638=y
CONFIG_TOUCHSCREEN_MTOUCH=m
CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
CONFIG_TOUCHSCREEN_INEXIO=y
CONFIG_TOUCHSCREEN_MK712=y
CONFIG_TOUCHSCREEN_PENMOUNT=m
CONFIG_TOUCHSCREEN_EDT_FT5X06=y
CONFIG_TOUCHSCREEN_RASPBERRYPI_FW=y
CONFIG_TOUCHSCREEN_MIGOR=m
# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
CONFIG_TOUCHSCREEN_TOUCHWIN=y
CONFIG_TOUCHSCREEN_TI_AM335X_TSC=m
# CONFIG_TOUCHSCREEN_PIXCIR is not set
CONFIG_TOUCHSCREEN_WDT87XX_I2C=m
CONFIG_TOUCHSCREEN_TOUCHIT213=m
# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
CONFIG_TOUCHSCREEN_TSC200X_CORE=y
CONFIG_TOUCHSCREEN_TSC2004=y
# CONFIG_TOUCHSCREEN_TSC2007 is not set
# CONFIG_TOUCHSCREEN_RM_TS is not set
CONFIG_TOUCHSCREEN_SILEAD=y
CONFIG_TOUCHSCREEN_SIS_I2C=y
CONFIG_TOUCHSCREEN_ST1232=m
CONFIG_TOUCHSCREEN_STMFTS=y
# CONFIG_TOUCHSCREEN_SUN4I is not set
CONFIG_TOUCHSCREEN_SX8654=m
CONFIG_TOUCHSCREEN_TPS6507X=y
CONFIG_TOUCHSCREEN_ZET6223=m
# CONFIG_TOUCHSCREEN_ZFORCE is not set
CONFIG_TOUCHSCREEN_ROHM_BU21023=m
CONFIG_TOUCHSCREEN_IQS5XX=m
# CONFIG_TOUCHSCREEN_ZINITIX is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
# CONFIG_RMI4_I2C is not set
# CONFIG_RMI4_SMB is not set
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
CONFIG_RMI4_F3A=y
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
# CONFIG_SERIO_I8042 is not set
# CONFIG_SERIO_SERPORT is not set
CONFIG_SERIO_CT82C710=y
# CONFIG_SERIO_PARKBD is not set
CONFIG_SERIO_PCIPS2=m
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
CONFIG_SERIO_ALTERA_PS2=y
# CONFIG_SERIO_PS2MULT is not set
# CONFIG_SERIO_ARC_PS2 is not set
CONFIG_SERIO_OLPC_APSP=y
CONFIG_SERIO_SUN4I_PS2=y
CONFIG_SERIO_GPIO_PS2=y
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=y
# CONFIG_GAMEPORT_NS558 is not set
CONFIG_GAMEPORT_L4=y
CONFIG_GAMEPORT_EMU10K1=m
CONFIG_GAMEPORT_FM801=y
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_16550A_VARIANTS=y
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCI=m
CONFIG_SERIAL_8250_EXAR=m
# CONFIG_SERIAL_8250_CS is not set
CONFIG_SERIAL_8250_MEN_MCB=m
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_FSL=y
CONFIG_SERIAL_8250_DW=y
CONFIG_SERIAL_8250_EM=y
# CONFIG_SERIAL_8250_IOC3 is not set
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_OMAP=y
# CONFIG_SERIAL_8250_OMAP_TTYO_FIXUP is not set
CONFIG_SERIAL_8250_MT6577=y
CONFIG_SERIAL_8250_UNIPHIER=m
CONFIG_SERIAL_8250_LPSS=m
CONFIG_SERIAL_8250_MID=m
CONFIG_SERIAL_8250_PXA=y
CONFIG_SERIAL_8250_TEGRA=y
# CONFIG_SERIAL_8250_BCM7271 is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_AMBA_PL010 is not set
# CONFIG_SERIAL_ATMEL is not set
CONFIG_SERIAL_MESON=y
CONFIG_SERIAL_MESON_CONSOLE=y
CONFIG_SERIAL_CLPS711X=y
CONFIG_SERIAL_CLPS711X_CONSOLE=y
CONFIG_SERIAL_SAMSUNG=y
CONFIG_SERIAL_SAMSUNG_UARTS_4=y
CONFIG_SERIAL_SAMSUNG_UARTS=4
CONFIG_SERIAL_SAMSUNG_CONSOLE=y
CONFIG_SERIAL_TEGRA=y
CONFIG_SERIAL_TEGRA_TCU=y
CONFIG_SERIAL_TEGRA_TCU_CONSOLE=y
# CONFIG_SERIAL_IMX is not set
CONFIG_SERIAL_UARTLITE=y
# CONFIG_SERIAL_UARTLITE_CONSOLE is not set
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_SH_SCI=m
CONFIG_SERIAL_SH_SCI_NR_UARTS=2
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_ICOM is not set
CONFIG_SERIAL_JSM=y
# CONFIG_SERIAL_MSM is not set
# CONFIG_SERIAL_QCOM_GENI is not set
CONFIG_SERIAL_VT8500=y
CONFIG_SERIAL_VT8500_CONSOLE=y
CONFIG_SERIAL_OMAP=y
# CONFIG_SERIAL_OMAP_CONSOLE is not set
CONFIG_SERIAL_LANTIQ=m
# CONFIG_SERIAL_SCCNXP is not set
CONFIG_SERIAL_SC16IS7XX_CORE=y
CONFIG_SERIAL_SC16IS7XX=y
CONFIG_SERIAL_SC16IS7XX_I2C=y
CONFIG_SERIAL_TIMBERDALE=y
CONFIG_SERIAL_BCM63XX=y
CONFIG_SERIAL_BCM63XX_CONSOLE=y
CONFIG_SERIAL_ALTERA_JTAGUART=m
CONFIG_SERIAL_ALTERA_UART=m
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
# CONFIG_SERIAL_PCH_UART is not set
# CONFIG_SERIAL_MXS_AUART is not set
# CONFIG_SERIAL_MPS2_UART is not set
# CONFIG_SERIAL_ARC is not set
CONFIG_SERIAL_RP2=m
CONFIG_SERIAL_RP2_NR_UARTS=32
# CONFIG_SERIAL_FSL_LPUART is not set
CONFIG_SERIAL_FSL_LINFLEXUART=m
# CONFIG_SERIAL_ST_ASC is not set
CONFIG_SERIAL_MEN_Z135=y
CONFIG_SERIAL_SPRD=y
# CONFIG_SERIAL_SPRD_CONSOLE is not set
CONFIG_SERIAL_STM32=y
# CONFIG_SERIAL_STM32_CONSOLE is not set
# CONFIG_SERIAL_MVEBU_UART is not set
# CONFIG_SERIAL_OWL is not set
# CONFIG_SERIAL_RDA is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
CONFIG_MOXA_INTELLIO=y
CONFIG_MOXA_SMARTIO=m
CONFIG_SYNCLINK_GT=m
# CONFIG_N_HDLC is not set
CONFIG_GOLDFISH_TTY=y
CONFIG_GOLDFISH_TTY_EARLY_CONSOLE=y
# CONFIG_N_GSM is not set
CONFIG_NOZOMI=y
CONFIG_NULL_TTY=y
CONFIG_HVC_DRIVER=y
CONFIG_SERIAL_DEV_BUS=m
# CONFIG_PRINTER is not set
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=m
# CONFIG_IPMI_HANDLER is not set
CONFIG_IPMI_KCS_BMC=y
CONFIG_ASPEED_KCS_IPMI_BMC=y
CONFIG_NPCM7XX_KCS_IPMI_BMC=y
CONFIG_IPMI_KCS_BMC_CDEV_IPMI=y
# CONFIG_IPMI_KCS_BMC_SERIO is not set
CONFIG_ASPEED_BT_IPMI_BMC=m
CONFIG_IPMB_DEVICE_INTERFACE=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
# CONFIG_HW_RANDOM_INTEL is not set
# CONFIG_HW_RANDOM_AMD is not set
CONFIG_HW_RANDOM_BA431=m
# CONFIG_HW_RANDOM_VIA is not set
CONFIG_HW_RANDOM_IXP4XX=m
CONFIG_HW_RANDOM_VIRTIO=m
CONFIG_HW_RANDOM_IMX_RNGC=m
CONFIG_HW_RANDOM_STM32=m
# CONFIG_HW_RANDOM_MESON is not set
# CONFIG_HW_RANDOM_MTK is not set
# CONFIG_HW_RANDOM_EXYNOS is not set
CONFIG_HW_RANDOM_NPCM=m
CONFIG_HW_RANDOM_XIPHERA=m
CONFIG_APPLICOM=y

#
# PCMCIA character devices
#
CONFIG_SYNCLINK_CS=m
CONFIG_CARDMAN_4000=m
CONFIG_CARDMAN_4040=m
CONFIG_SCR24X=m
# end of PCMCIA character devices

CONFIG_MWAVE=y
# CONFIG_DEVMEM is not set
# CONFIG_NVRAM is not set
CONFIG_DEVPORT=y
CONFIG_HANGCHECK_TIMER=m
CONFIG_TCG_TPM=m
# CONFIG_HW_RANDOM_TPM is not set
# CONFIG_TCG_TIS is not set
CONFIG_TCG_TIS_I2C_CR50=m
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
# CONFIG_TCG_TIS_I2C_NUVOTON is not set
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=m
CONFIG_TCG_VTPM_PROXY=m
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# CONFIG_TELCLOCK is not set
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYBUS=y
# CONFIG_RANDOM_TRUST_CPU is not set
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
CONFIG_I2C_MUX_GPIO=m
# CONFIG_I2C_MUX_GPMUX is not set
CONFIG_I2C_MUX_LTC4306=m
CONFIG_I2C_MUX_PCA9541=m
CONFIG_I2C_MUX_PCA954x=m
# CONFIG_I2C_MUX_PINCTRL is not set
CONFIG_I2C_MUX_REG=m
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=m

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_ALI1535=m
CONFIG_I2C_ALI1563=m
CONFIG_I2C_ALI15X3=m
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
CONFIG_I2C_HIX5HD2=m
CONFIG_I2C_I801=y
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_ISMT is not set
CONFIG_I2C_PIIX4=y
CONFIG_I2C_NFORCE2=m
CONFIG_I2C_NFORCE2_S4985=m
# CONFIG_I2C_NVIDIA_GPU is not set
CONFIG_I2C_SIS5595=m
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=y
# CONFIG_I2C_VIA is not set
CONFIG_I2C_VIAPRO=y

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ASPEED is not set
CONFIG_I2C_AT91=y
CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL=y
CONFIG_I2C_AXXIA=m
# CONFIG_I2C_BCM2835 is not set
CONFIG_I2C_BCM_IPROC=y
CONFIG_I2C_BCM_KONA=y
CONFIG_I2C_BRCMSTB=y
CONFIG_I2C_CADENCE=y
CONFIG_I2C_CBUS_GPIO=y
CONFIG_I2C_DAVINCI=y
CONFIG_I2C_DESIGNWARE_CORE=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=y
CONFIG_I2C_DESIGNWARE_PCI=y
CONFIG_I2C_DIGICOLOR=m
CONFIG_I2C_EG20T=y
CONFIG_I2C_EMEV2=y
CONFIG_I2C_GPIO=y
# CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
# CONFIG_I2C_HIGHLANDER is not set
CONFIG_I2C_HISI=m
CONFIG_I2C_IMG=y
CONFIG_I2C_IMX=m
CONFIG_I2C_IMX_LPI2C=m
# CONFIG_I2C_IOP3XX is not set
# CONFIG_I2C_JZ4780 is not set
CONFIG_I2C_KEMPLD=m
CONFIG_I2C_MESON=m
CONFIG_I2C_MT65XX=y
CONFIG_I2C_MT7621=y
# CONFIG_I2C_MV64XXX is not set
CONFIG_I2C_MXS=y
# CONFIG_I2C_NPCM7XX is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_OMAP=y
CONFIG_I2C_OWL=m
CONFIG_I2C_PCA_PLATFORM=m
# CONFIG_I2C_PNX is not set
CONFIG_I2C_PXA=m
CONFIG_I2C_PXA_SLAVE=y
CONFIG_I2C_QCOM_CCI=y
CONFIG_I2C_QCOM_GENI=m
# CONFIG_I2C_QUP is not set
CONFIG_I2C_RIIC=y
# CONFIG_I2C_S3C2410 is not set
CONFIG_I2C_SH_MOBILE=m
# CONFIG_I2C_SIMTEC is not set
CONFIG_I2C_SPRD=y
# CONFIG_I2C_ST is not set
# CONFIG_I2C_STM32F4 is not set
CONFIG_I2C_STM32F7=y
# CONFIG_I2C_SUN6I_P2WI is not set
CONFIG_I2C_SYNQUACER=m
CONFIG_I2C_TEGRA_BPMP=y
# CONFIG_I2C_UNIPHIER is not set
# CONFIG_I2C_UNIPHIER_F is not set
CONFIG_I2C_VERSATILE=y
CONFIG_I2C_WMT=y
CONFIG_I2C_THUNDERX=y
# CONFIG_I2C_XILINX is not set
# CONFIG_I2C_XLR is not set
CONFIG_I2C_XLP9XX=m
# CONFIG_I2C_RCAR is not set

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_PARPORT=y
# CONFIG_I2C_TAOS_EVM is not set

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_MLXCPLD is not set
CONFIG_I2C_CROS_EC_TUNNEL=m
CONFIG_I2C_VIRTIO=m
# end of I2C Hardware Bus support

# CONFIG_I2C_STUB is not set
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
CONFIG_I2C_SLAVE_TESTUNIT=y
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
CONFIG_I2C_DEBUG_BUS=y
# end of I2C support

CONFIG_I3C=y
CONFIG_CDNS_I3C_MASTER=y
CONFIG_DW_I3C_MASTER=y
CONFIG_SVC_I3C_MASTER=y
CONFIG_MIPI_I3C_HCI=y
# CONFIG_SPI is not set
CONFIG_SPMI=m
CONFIG_SPMI_HISI3670=m
# CONFIG_SPMI_MSM_PMIC_ARB is not set
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
CONFIG_HSI_CHAR=m
CONFIG_PPS=m
CONFIG_PPS_DEBUG=y

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=m
CONFIG_PPS_CLIENT_LDISC=m
# CONFIG_PPS_CLIENT_PARPORT is not set
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
# CONFIG_PTP_1588_CLOCK is not set
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_PINCTRL_AMD is not set
CONFIG_PINCTRL_DA9062=m
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set
# CONFIG_PINCTRL_MERRIFIELD is not set
CONFIG_PINCTRL_PXA=y
CONFIG_PINCTRL_PXA25X=m
CONFIG_PINCTRL_PXA27X=m
CONFIG_PINCTRL_MSM=y
CONFIG_PINCTRL_SM8350=y
# CONFIG_PINCTRL_LPASS_LPI is not set

#
# Renesas pinctrl drivers
#
# CONFIG_PINCTRL_RENESAS is not set
CONFIG_PINCTRL_SH_PFC=y
CONFIG_PINCTRL_SH_PFC_GPIO=y
CONFIG_PINCTRL_SH_FUNC_GPIO=y
# CONFIG_PINCTRL_PFC_EMEV2 is not set
# CONFIG_PINCTRL_PFC_R8A77995 is not set
# CONFIG_PINCTRL_PFC_R8A7794 is not set
# CONFIG_PINCTRL_PFC_R8A77990 is not set
CONFIG_PINCTRL_PFC_R8A7779=y
CONFIG_PINCTRL_PFC_R8A7790=y
# CONFIG_PINCTRL_PFC_R8A77950 is not set
# CONFIG_PINCTRL_PFC_R8A77951 is not set
CONFIG_PINCTRL_PFC_R8A7778=y
# CONFIG_PINCTRL_PFC_R8A7793 is not set
# CONFIG_PINCTRL_PFC_R8A7791 is not set
CONFIG_PINCTRL_PFC_R8A77965=y
CONFIG_PINCTRL_PFC_R8A77960=y
CONFIG_PINCTRL_PFC_R8A77961=y
CONFIG_PINCTRL_PFC_R8A7792=y
# CONFIG_PINCTRL_PFC_R8A77980 is not set
CONFIG_PINCTRL_PFC_R8A77970=y
# CONFIG_PINCTRL_PFC_R8A779A0 is not set
CONFIG_PINCTRL_PFC_R8A7740=y
CONFIG_PINCTRL_PFC_R8A73A4=y
CONFIG_PINCTRL_PFC_R8A77470=y
CONFIG_PINCTRL_PFC_R8A7745=y
CONFIG_PINCTRL_PFC_R8A7742=y
# CONFIG_PINCTRL_PFC_R8A7743 is not set
CONFIG_PINCTRL_PFC_R8A7744=y
CONFIG_PINCTRL_PFC_R8A774C0=y
# CONFIG_PINCTRL_PFC_R8A774E1 is not set
CONFIG_PINCTRL_PFC_R8A774A1=y
# CONFIG_PINCTRL_PFC_R8A774B1 is not set
# CONFIG_PINCTRL_PFC_SH7203 is not set
# CONFIG_PINCTRL_PFC_SH7264 is not set
CONFIG_PINCTRL_PFC_SH7269=y
# CONFIG_PINCTRL_PFC_SH7720 is not set
# CONFIG_PINCTRL_PFC_SH7722 is not set
# CONFIG_PINCTRL_PFC_SH7734 is not set
# CONFIG_PINCTRL_PFC_SH7757 is not set
CONFIG_PINCTRL_PFC_SH7785=y
CONFIG_PINCTRL_PFC_SH7786=y
# CONFIG_PINCTRL_PFC_SH73A0 is not set
CONFIG_PINCTRL_PFC_SH7723=y
# CONFIG_PINCTRL_PFC_SH7724 is not set
# CONFIG_PINCTRL_PFC_SHX3 is not set
# end of Renesas pinctrl drivers

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=m
# end of MediaTek pinctrl drivers

CONFIG_PINCTRL_MADERA=m
CONFIG_PINCTRL_CS47L15=y
CONFIG_PINCTRL_CS47L85=y
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_GPIO_CDEV=y
# CONFIG_GPIO_CDEV_V1 is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y
CONFIG_GPIO_MAX730X=m

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_ATH79=y
CONFIG_GPIO_CLPS711X=m
CONFIG_GPIO_DWAPB=m
CONFIG_GPIO_EXAR=m
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_HISI=y
CONFIG_GPIO_ICH=m
CONFIG_GPIO_IOP=m
CONFIG_GPIO_MB86S7X=y
CONFIG_GPIO_MENZ127=y
# CONFIG_GPIO_MPC8XXX is not set
CONFIG_GPIO_MXC=y
CONFIG_GPIO_MXS=y
CONFIG_GPIO_PXA=y
# CONFIG_GPIO_RCAR is not set
CONFIG_GPIO_ROCKCHIP=y
# CONFIG_GPIO_SIOX is not set
CONFIG_GPIO_VX855=m
# CONFIG_GPIO_XGENE_SB is not set
# CONFIG_GPIO_AMD_FCH is not set
CONFIG_GPIO_IDT3243X=y
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
CONFIG_GPIO_F7188X=m
CONFIG_GPIO_IT87=y
CONFIG_GPIO_SCH311X=m
# CONFIG_GPIO_TS5500 is not set
# CONFIG_GPIO_WINBOND is not set
CONFIG_GPIO_WS16C48=m
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
CONFIG_GPIO_MAX7300=m
CONFIG_GPIO_MAX732X=m
CONFIG_GPIO_PCA953X=m
# CONFIG_GPIO_PCA953X_IRQ is not set
# CONFIG_GPIO_PCA9570 is not set
CONFIG_GPIO_PCF857X=y
CONFIG_GPIO_TPIC2810=y
CONFIG_GPIO_TS4900=y
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=m
CONFIG_GPIO_BD9571MWV=m
CONFIG_GPIO_CS5535=m
CONFIG_GPIO_DA9055=y
CONFIG_GPIO_JANZ_TTL=m
# CONFIG_GPIO_KEMPLD is not set
CONFIG_GPIO_LP3943=m
CONFIG_GPIO_LP873X=m
CONFIG_GPIO_MADERA=m
CONFIG_GPIO_MAX77650=m
CONFIG_GPIO_SL28CPLD=y
CONFIG_GPIO_TPS65086=y
# CONFIG_GPIO_TPS65910 is not set
# CONFIG_GPIO_TQMX86 is not set
# CONFIG_GPIO_TWL6040 is not set
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
CONFIG_GPIO_BT8XX=y
CONFIG_GPIO_MERRIFIELD=m
CONFIG_GPIO_MLXBF=y
CONFIG_GPIO_MLXBF2=m
CONFIG_GPIO_ML_IOH=y
CONFIG_GPIO_PCH=y
CONFIG_GPIO_PCI_IDIO_16=y
# CONFIG_GPIO_PCIE_IDIO_24 is not set
CONFIG_GPIO_RDC321X=m
# end of PCI GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
CONFIG_GPIO_MOCKUP=m
# CONFIG_GPIO_VIRTIO is not set
# end of Virtual GPIO drivers

CONFIG_W1=y
CONFIG_W1_CON=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_MATROX=y
CONFIG_W1_MASTER_DS2482=m
CONFIG_W1_MASTER_MXC=m
CONFIG_W1_MASTER_DS1WM=y
# CONFIG_W1_MASTER_GPIO is not set
CONFIG_W1_MASTER_SGI=m
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
# CONFIG_W1_SLAVE_SMEM is not set
# CONFIG_W1_SLAVE_DS2405 is not set
CONFIG_W1_SLAVE_DS2408=y
CONFIG_W1_SLAVE_DS2408_READBACK=y
CONFIG_W1_SLAVE_DS2413=m
CONFIG_W1_SLAVE_DS2406=y
CONFIG_W1_SLAVE_DS2423=m
CONFIG_W1_SLAVE_DS2805=y
CONFIG_W1_SLAVE_DS2430=m
# CONFIG_W1_SLAVE_DS2431 is not set
# CONFIG_W1_SLAVE_DS2433 is not set
# CONFIG_W1_SLAVE_DS2438 is not set
# CONFIG_W1_SLAVE_DS250X is not set
CONFIG_W1_SLAVE_DS2780=m
CONFIG_W1_SLAVE_DS2781=m
# CONFIG_W1_SLAVE_DS28E04 is not set
CONFIG_W1_SLAVE_DS28E17=m
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
CONFIG_POWER_SUPPLY_DEBUG=y
CONFIG_PDA_POWER=m
# CONFIG_GENERIC_ADC_BATTERY is not set
CONFIG_MAX8925_POWER=y
CONFIG_TEST_POWER=y
# CONFIG_BATTERY_88PM860X is not set
# CONFIG_CHARGER_ADP5061 is not set
CONFIG_BATTERY_ACT8945A=m
# CONFIG_BATTERY_CW2015 is not set
CONFIG_BATTERY_DS2760=m
CONFIG_BATTERY_DS2780=m
CONFIG_BATTERY_DS2781=m
CONFIG_BATTERY_DS2782=m
CONFIG_BATTERY_INGENIC=m
# CONFIG_BATTERY_SBS is not set
CONFIG_CHARGER_SBS=m
CONFIG_MANAGER_SBS=m
CONFIG_BATTERY_BQ27XXX=m
# CONFIG_BATTERY_BQ27XXX_I2C is not set
CONFIG_BATTERY_BQ27XXX_HDQ=m
# CONFIG_BATTERY_DA9150 is not set
CONFIG_CHARGER_AXP20X=m
# CONFIG_BATTERY_AXP20X is not set
CONFIG_AXP20X_POWER=m
# CONFIG_AXP288_FUEL_GAUGE is not set
# CONFIG_BATTERY_MAX17040 is not set
CONFIG_BATTERY_MAX17042=m
CONFIG_BATTERY_MAX1721X=m
# CONFIG_CHARGER_MAX8903 is not set
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_GPIO=y
# CONFIG_CHARGER_MANAGER is not set
CONFIG_CHARGER_LT3651=m
CONFIG_CHARGER_LTC4162L=y
CONFIG_CHARGER_MAX14577=m
CONFIG_CHARGER_MAX77650=m
# CONFIG_CHARGER_MAX77693 is not set
CONFIG_CHARGER_MT6360=m
CONFIG_CHARGER_BQ2415X=m
CONFIG_CHARGER_BQ24257=y
CONFIG_CHARGER_BQ24735=m
# CONFIG_CHARGER_BQ2515X is not set
CONFIG_CHARGER_BQ25890=y
CONFIG_CHARGER_BQ25980=m
CONFIG_CHARGER_BQ256XX=y
CONFIG_CHARGER_SMB347=y
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
CONFIG_BATTERY_GOLDFISH=m
# CONFIG_BATTERY_RT5033 is not set
# CONFIG_CHARGER_RT9455 is not set
CONFIG_CHARGER_SC2731=m
CONFIG_FUEL_GAUGE_SC27XX=m
CONFIG_CHARGER_BD99954=m
CONFIG_BATTERY_ACER_A500=m
CONFIG_HWMON=m
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
# CONFIG_SENSORS_ABITUGURU is not set
CONFIG_SENSORS_ABITUGURU3=m
CONFIG_SENSORS_AD7414=m
# CONFIG_SENSORS_AD7418 is not set
# CONFIG_SENSORS_ADM1021 is not set
# CONFIG_SENSORS_ADM1025 is not set
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
# CONFIG_SENSORS_ADT7470 is not set
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_AHT10 is not set
CONFIG_SENSORS_AS370=m
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_K8TEMP=m
CONFIG_SENSORS_K10TEMP=m
# CONFIG_SENSORS_FAM15H_POWER is not set
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ARM_SCMI=m
CONFIG_SENSORS_ASB100=m
CONFIG_SENSORS_ASPEED=m
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_BT1_PVT is not set
# CONFIG_SENSORS_CORSAIR_CPRO is not set
CONFIG_SENSORS_CORSAIR_PSU=m
# CONFIG_SENSORS_DS620 is not set
CONFIG_SENSORS_DS1621=m
CONFIG_SENSORS_DELL_SMM=m
CONFIG_SENSORS_DA9055=m
# CONFIG_SENSORS_I5K_AMB is not set
CONFIG_SENSORS_SPARX5=m
# CONFIG_SENSORS_F71805F is not set
# CONFIG_SENSORS_F71882FG is not set
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_FSCHMD=m
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=m
# CONFIG_SENSORS_GL520SM is not set
# CONFIG_SENSORS_G760A is not set
CONFIG_SENSORS_G762=m
CONFIG_SENSORS_HIH6130=m
CONFIG_SENSORS_IIO_HWMON=m
CONFIG_SENSORS_I5500=m
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
# CONFIG_SENSORS_JC42 is not set
CONFIG_SENSORS_POWR1220=m
CONFIG_SENSORS_LINEAGE=m
CONFIG_SENSORS_LTC2945=m
# CONFIG_SENSORS_LTC2947_I2C is not set
CONFIG_SENSORS_LTC2990=m
CONFIG_SENSORS_LTC2992=m
# CONFIG_SENSORS_LTC4151 is not set
CONFIG_SENSORS_LTC4215=m
CONFIG_SENSORS_LTC4222=m
# CONFIG_SENSORS_LTC4245 is not set
CONFIG_SENSORS_LTC4260=m
CONFIG_SENSORS_LTC4261=m
CONFIG_SENSORS_MAX127=m
# CONFIG_SENSORS_MAX16065 is not set
# CONFIG_SENSORS_MAX1619 is not set
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=m
CONFIG_SENSORS_MAX31730=m
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
# CONFIG_SENSORS_MAX6642 is not set
# CONFIG_SENSORS_MAX6650 is not set
CONFIG_SENSORS_MAX6697=m
CONFIG_SENSORS_MAX31790=m
CONFIG_SENSORS_MCP3021=m
# CONFIG_SENSORS_MLXREG_FAN is not set
CONFIG_SENSORS_TC654=m
# CONFIG_SENSORS_TPS23861 is not set
# CONFIG_SENSORS_MENF21BMC_HWMON is not set
CONFIG_SENSORS_MR75203=m
# CONFIG_SENSORS_LM63 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
# CONFIG_SENSORS_LM85 is not set
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
CONFIG_SENSORS_NTC_THERMISTOR=m
CONFIG_SENSORS_NCT6683=m
CONFIG_SENSORS_NCT6775=m
CONFIG_SENSORS_NCT7802=m
CONFIG_SENSORS_NCT7904=m
CONFIG_SENSORS_NPCM7XX=m
CONFIG_SENSORS_OCC_P8_I2C=m
CONFIG_SENSORS_OCC=m
# CONFIG_SENSORS_PCF8591 is not set
# CONFIG_PMBUS is not set
CONFIG_SENSORS_PWM_FAN=m
# CONFIG_SENSORS_RASPBERRYPI_HWMON is not set
# CONFIG_SENSORS_SL28CPLD is not set
CONFIG_SENSORS_SBTSI=m
CONFIG_SENSORS_SBRMI=m
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
CONFIG_SENSORS_SHT4x=m
CONFIG_SENSORS_SHTC1=m
# CONFIG_SENSORS_SIS5595 is not set
CONFIG_SENSORS_DME1737=m
# CONFIG_SENSORS_EMC1403 is not set
CONFIG_SENSORS_EMC2103=m
# CONFIG_SENSORS_EMC6W201 is not set
# CONFIG_SENSORS_SMSC47M1 is not set
# CONFIG_SENSORS_SMSC47M192 is not set
# CONFIG_SENSORS_SMSC47B397 is not set
# CONFIG_SENSORS_SCH5627 is not set
# CONFIG_SENSORS_SCH5636 is not set
CONFIG_SENSORS_STTS751=m
# CONFIG_SENSORS_SMM665 is not set
CONFIG_SENSORS_ADC128D818=m
# CONFIG_SENSORS_ADS7828 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
# CONFIG_SENSORS_INA2XX is not set
CONFIG_SENSORS_INA3221=m
# CONFIG_SENSORS_TC74 is not set
# CONFIG_SENSORS_THMC50 is not set
# CONFIG_SENSORS_TMP102 is not set
CONFIG_SENSORS_TMP103=m
CONFIG_SENSORS_TMP108=m
# CONFIG_SENSORS_TMP401 is not set
CONFIG_SENSORS_TMP421=m
CONFIG_SENSORS_TMP513=m
# CONFIG_SENSORS_VIA_CPUTEMP is not set
CONFIG_SENSORS_VIA686A=m
# CONFIG_SENSORS_VT1211 is not set
CONFIG_SENSORS_VT8231=m
CONFIG_SENSORS_W83773G=m
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
# CONFIG_SENSORS_W83795 is not set
CONFIG_SENSORS_W83L785TS=m
# CONFIG_SENSORS_W83L786NG is not set
CONFIG_SENSORS_W83627HF=m
# CONFIG_SENSORS_W83627EHF is not set
# CONFIG_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=m
# CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP is not set
CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=y
CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=y

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=y
CONFIG_SOFT_WATCHDOG_PRETIMEOUT=y
CONFIG_DA9052_WATCHDOG=y
CONFIG_DA9055_WATCHDOG=y
CONFIG_DA9063_WATCHDOG=m
CONFIG_DA9062_WATCHDOG=y
CONFIG_MENF21BMC_WATCHDOG=m
# CONFIG_MENZ069_WATCHDOG is not set
CONFIG_XILINX_WATCHDOG=y
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_MLX_WDT is not set
CONFIG_SL28CPLD_WATCHDOG=y
CONFIG_ARMADA_37XX_WATCHDOG=y
CONFIG_AT91RM9200_WATCHDOG=y
CONFIG_AT91SAM9X_WATCHDOG=y
CONFIG_SAMA5D4_WATCHDOG=y
# CONFIG_CADENCE_WATCHDOG is not set
CONFIG_FTWDT010_WATCHDOG=y
CONFIG_S3C2410_WATCHDOG=m
# CONFIG_DW_WATCHDOG is not set
# CONFIG_EP93XX_WATCHDOG is not set
# CONFIG_OMAP_WATCHDOG is not set
CONFIG_PNX4008_WATCHDOG=m
CONFIG_DAVINCI_WATCHDOG=y
CONFIG_K3_RTI_WATCHDOG=y
CONFIG_RN5T618_WATCHDOG=m
CONFIG_SUNXI_WATCHDOG=m
CONFIG_NPCM7XX_WATCHDOG=m
CONFIG_STMP3XXX_RTC_WATCHDOG=m
CONFIG_TS72XX_WATCHDOG=m
CONFIG_MAX63XX_WATCHDOG=y
# CONFIG_MAX77620_WATCHDOG is not set
# CONFIG_IMX2_WDT is not set
CONFIG_IMX7ULP_WDT=m
# CONFIG_MOXART_WDT is not set
CONFIG_TEGRA_WATCHDOG=y
# CONFIG_QCOM_WDT is not set
CONFIG_MESON_GXBB_WATCHDOG=y
CONFIG_MESON_WATCHDOG=y
# CONFIG_MEDIATEK_WATCHDOG is not set
# CONFIG_DIGICOLOR_WATCHDOG is not set
# CONFIG_LPC18XX_WATCHDOG is not set
# CONFIG_RENESAS_WDT is not set
CONFIG_RENESAS_RZAWDT=y
CONFIG_ASPEED_WATCHDOG=y
CONFIG_SPRD_WATCHDOG=y
CONFIG_VISCONTI_WATCHDOG=m
CONFIG_MSC313E_WATCHDOG=y
CONFIG_ACQUIRE_WDT=y
CONFIG_ADVANTECH_WDT=y
CONFIG_ALIM1535_WDT=m
CONFIG_ALIM7101_WDT=m
CONFIG_EBC_C384_WDT=y
# CONFIG_F71808E_WDT is not set
CONFIG_SP5100_TCO=y
CONFIG_SC520_WDT=m
# CONFIG_SBC_FITPC2_WATCHDOG is not set
CONFIG_EUROTECH_WDT=m
CONFIG_IB700_WDT=m
CONFIG_IBMASR=y
# CONFIG_WAFER_WDT is not set
# CONFIG_I6300ESB_WDT is not set
CONFIG_IE6XX_WDT=y
# CONFIG_INTEL_MID_WATCHDOG is not set
# CONFIG_ITCO_WDT is not set
CONFIG_IT8712F_WDT=y
CONFIG_IT87_WDT=m
CONFIG_HP_WATCHDOG=m
CONFIG_HPWDT_NMI_DECODING=y
CONFIG_KEMPLD_WDT=m
CONFIG_SC1200_WDT=m
CONFIG_PC87413_WDT=y
CONFIG_NV_TCO=y
CONFIG_RDC321X_WDT=y
CONFIG_60XX_WDT=m
CONFIG_CPU5_WDT=m
# CONFIG_SMSC_SCH311X_WDT is not set
CONFIG_SMSC37B787_WDT=y
CONFIG_TQMX86_WDT=y
# CONFIG_VIA_WDT is not set
CONFIG_W83627HF_WDT=m
CONFIG_W83877F_WDT=y
# CONFIG_W83977F_WDT is not set
CONFIG_MACHZ_WDT=y
CONFIG_SBC_EPX_C3_WATCHDOG=m
CONFIG_INTEL_MEI_WDT=y
# CONFIG_BCM47XX_WDT is not set
CONFIG_BCM_KONA_WDT=m
# CONFIG_BCM_KONA_WDT_DEBUG is not set
CONFIG_BCM7038_WDT=y
CONFIG_IMGPDC_WDT=m
CONFIG_MPC5200_WDT=y
CONFIG_MEN_A21_WDT=m
CONFIG_UML_WATCHDOG=m

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=y
# CONFIG_WDTPCI is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=m
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
# CONFIG_SSB_PCMCIAHOST is not set
CONFIG_SSB_SDIOHOST_POSSIBLE=y
CONFIG_SSB_SDIOHOST=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
CONFIG_SSB_DRIVER_PCICORE=y
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
# CONFIG_BCMA_DRIVER_MIPS is not set
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_CS5535=y
CONFIG_MFD_SUN4I_GPADC=m
CONFIG_MFD_AS3711=y
CONFIG_PMIC_ADP5520=y
CONFIG_MFD_AAT2870_CORE=y
CONFIG_MFD_AT91_USART=y
# CONFIG_MFD_BCM590XX is not set
CONFIG_MFD_BD9571MWV=m
CONFIG_MFD_AXP20X=m
CONFIG_MFD_AXP20X_I2C=m
# CONFIG_MFD_CROS_EC_DEV is not set
CONFIG_MFD_MADERA=m
CONFIG_MFD_MADERA_I2C=m
CONFIG_MFD_CS47L15=y
# CONFIG_MFD_CS47L35 is not set
CONFIG_MFD_CS47L85=y
# CONFIG_MFD_CS47L90 is not set
# CONFIG_MFD_CS47L92 is not set
# CONFIG_MFD_ASIC3 is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_I2C is not set
CONFIG_MFD_DA9055=y
CONFIG_MFD_DA9062=y
# CONFIG_MFD_DA9063 is not set
CONFIG_MFD_DA9150=y
CONFIG_MFD_ENE_KB3930=y
# CONFIG_MFD_EXYNOS_LPASS is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MP2629 is not set
# CONFIG_MFD_MXS_LRADC is not set
# CONFIG_MFD_MX25_TSADC is not set
# CONFIG_HTC_PASIC3 is not set
CONFIG_HTC_I2CPLD=y
CONFIG_MFD_INTEL_QUARK_I2C_GPIO=m
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=y
# CONFIG_MFD_INTEL_LPSS_PCI is not set
# CONFIG_MFD_INTEL_PMT is not set
CONFIG_MFD_IQS62X=m
CONFIG_MFD_JANZ_CMODIO=m
CONFIG_MFD_KEMPLD=m
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
CONFIG_MFD_88PM860X=y
CONFIG_MFD_MAX14577=m
# CONFIG_MFD_MAX77620 is not set
CONFIG_MFD_MAX77650=y
# CONFIG_MFD_MAX77686 is not set
CONFIG_MFD_MAX77693=m
# CONFIG_MFD_MAX77843 is not set
CONFIG_MFD_MAX8907=m
CONFIG_MFD_MAX8925=y
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
CONFIG_MFD_MT6360=y
# CONFIG_MFD_MT6397 is not set
CONFIG_MFD_MENF21BMC=y
CONFIG_MFD_NTXEC=y
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_PM8XXX is not set
CONFIG_MFD_RDC321X=m
CONFIG_MFD_RT4831=y
CONFIG_MFD_RT5033=m
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SEC_CORE is not set
CONFIG_MFD_SI476X_CORE=m
CONFIG_MFD_SIMPLE_MFD_I2C=m
CONFIG_MFD_SL28CPLD=m
CONFIG_MFD_SM501=m
# CONFIG_MFD_SM501_GPIO is not set
# CONFIG_MFD_SKY81452 is not set
# CONFIG_ABX500_CORE is not set
CONFIG_MFD_SUN6I_PRCM=y
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
CONFIG_MFD_LP3943=m
# CONFIG_MFD_LP8788 is not set
CONFIG_MFD_TI_LMU=y
# CONFIG_MFD_PALMAS is not set
CONFIG_TPS6105X=y
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=y
CONFIG_MFD_TPS65086=y
# CONFIG_MFD_TPS65090 is not set
CONFIG_MFD_TI_LP873X=y
# CONFIG_MFD_TPS6586X is not set
CONFIG_MFD_TPS65910=y
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS80031 is not set
# CONFIG_TWL4030_CORE is not set
CONFIG_TWL6040_CORE=y
CONFIG_MFD_WL1273_CORE=y
CONFIG_MFD_LM3533=m
# CONFIG_MFD_TIMBERDALE is not set
CONFIG_MFD_TQMX86=y
CONFIG_MFD_VX855=m
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
CONFIG_MFD_STW481X=m
# CONFIG_MFD_STM32_LPTIMER is not set
CONFIG_MFD_STM32_TIMERS=y
# CONFIG_MFD_STMFX is not set
CONFIG_MFD_WCD934X=m
CONFIG_MFD_ATC260X=m
CONFIG_MFD_ATC260X_I2C=m
CONFIG_MFD_KHADAS_MCU=y
CONFIG_MFD_ACER_A500_EC=y
# CONFIG_RAVE_SP_CORE is not set
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
CONFIG_REGULATOR_USERSPACE_CONSUMER=m
CONFIG_REGULATOR_88PG86X=m
# CONFIG_REGULATOR_88PM8607 is not set
CONFIG_REGULATOR_ACT8865=y
CONFIG_REGULATOR_AD5398=y
CONFIG_REGULATOR_ANATOP=y
CONFIG_REGULATOR_AAT2870=m
CONFIG_REGULATOR_AS3711=y
CONFIG_REGULATOR_ATC260X=m
CONFIG_REGULATOR_AXP20X=m
CONFIG_REGULATOR_BD9571MWV=m
CONFIG_REGULATOR_DA9055=y
CONFIG_REGULATOR_DA9062=y
# CONFIG_REGULATOR_DA9210 is not set
CONFIG_REGULATOR_DA9211=m
CONFIG_REGULATOR_FAN53555=y
CONFIG_REGULATOR_FAN53880=y
# CONFIG_REGULATOR_GPIO is not set
# CONFIG_REGULATOR_ISL9305 is not set
CONFIG_REGULATOR_ISL6271A=y
# CONFIG_REGULATOR_LM363X is not set
CONFIG_REGULATOR_LP3971=y
CONFIG_REGULATOR_LP3972=m
# CONFIG_REGULATOR_LP872X is not set
CONFIG_REGULATOR_LP8755=y
# CONFIG_REGULATOR_LTC3589 is not set
CONFIG_REGULATOR_LTC3676=m
CONFIG_REGULATOR_MAX14577=m
# CONFIG_REGULATOR_MAX1586 is not set
# CONFIG_REGULATOR_MAX77620 is not set
CONFIG_REGULATOR_MAX77650=y
# CONFIG_REGULATOR_MAX8649 is not set
CONFIG_REGULATOR_MAX8660=m
CONFIG_REGULATOR_MAX8893=m
CONFIG_REGULATOR_MAX8907=m
CONFIG_REGULATOR_MAX8925=y
# CONFIG_REGULATOR_MAX8952 is not set
CONFIG_REGULATOR_MAX77686=y
# CONFIG_REGULATOR_MAX77693 is not set
CONFIG_REGULATOR_MAX77802=y
CONFIG_REGULATOR_MAX77826=m
CONFIG_REGULATOR_MP8859=y
CONFIG_REGULATOR_MP886X=y
CONFIG_REGULATOR_MT6311=m
CONFIG_REGULATOR_MT6315=m
CONFIG_REGULATOR_MT6360=y
CONFIG_REGULATOR_PBIAS=y
# CONFIG_REGULATOR_PCA9450 is not set
CONFIG_REGULATOR_PV88060=m
CONFIG_REGULATOR_PV88080=m
# CONFIG_REGULATOR_PV88090 is not set
CONFIG_REGULATOR_PWM=y
CONFIG_REGULATOR_QCOM_RPMH=m
CONFIG_REGULATOR_QCOM_SPMI=y
# CONFIG_REGULATOR_QCOM_USB_VBUS is not set
# CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY is not set
CONFIG_REGULATOR_RT4801=y
CONFIG_REGULATOR_RT4831=m
CONFIG_REGULATOR_RT5033=m
CONFIG_REGULATOR_RT6160=y
CONFIG_REGULATOR_RT6245=m
CONFIG_REGULATOR_RTQ2134=y
# CONFIG_REGULATOR_RTMV20 is not set
CONFIG_REGULATOR_RTQ6752=m
# CONFIG_REGULATOR_S2MPA01 is not set
CONFIG_REGULATOR_S2MPS11=m
# CONFIG_REGULATOR_S5M8767 is not set
CONFIG_REGULATOR_SC2731=y
CONFIG_REGULATOR_SLG51000=y
CONFIG_REGULATOR_STM32_BOOSTER=m
CONFIG_REGULATOR_STM32_VREFBUF=m
# CONFIG_REGULATOR_STM32_PWR is not set
CONFIG_REGULATOR_STW481X_VMMC=y
CONFIG_REGULATOR_SY8106A=m
CONFIG_REGULATOR_SY8824X=y
# CONFIG_REGULATOR_SY8827N is not set
CONFIG_REGULATOR_TPS51632=y
# CONFIG_REGULATOR_TPS6105X is not set
CONFIG_REGULATOR_TPS62360=m
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=y
CONFIG_REGULATOR_TPS65086=m
# CONFIG_REGULATOR_TPS65132 is not set
# CONFIG_REGULATOR_TPS65910 is not set
CONFIG_REGULATOR_QCOM_LABIBB=y
# CONFIG_RC_CORE is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y
# CONFIG_MEDIA_CEC_SUPPORT is not set
CONFIG_MEDIA_SUPPORT=m
# CONFIG_MEDIA_SUPPORT_FILTER is not set
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_MEDIA_TEST_SUPPORT=y
# end of Media device types

#
# Media core support
#
# CONFIG_VIDEO_DEV is not set
CONFIG_MEDIA_CONTROLLER=y
CONFIG_DVB_CORE=m
# end of Media core support

#
# Media controller options
#
# CONFIG_MEDIA_CONTROLLER_DVB is not set
# end of Media controller options

#
# Digital TV options
#
CONFIG_DVB_MAX_ADAPTERS=16
# CONFIG_DVB_DYNAMIC_MINORS is not set
CONFIG_DVB_DEMUX_SECTION_LOSS_LOG=y
# CONFIG_DVB_ULE_DEBUG is not set
# end of Digital TV options

#
# Media drivers
#
# CONFIG_MEDIA_PCI_SUPPORT is not set
CONFIG_MEDIA_COMMON_OPTIONS=y

#
# common driver options
#
CONFIG_SMS_SIANO_MDTV=m
# CONFIG_V4L_PLATFORM_DRIVERS is not set
# CONFIG_DVB_PLATFORM_DRIVERS is not set
# CONFIG_SDR_PLATFORM_DRIVERS is not set

#
# MMC/SDIO DVB adapters
#
CONFIG_SMS_SDIO_DRV=m
CONFIG_DVB_TEST_DRIVERS=y
CONFIG_DVB_VIDTV=m

#
# FireWire (IEEE 1394) Adapters
#
# CONFIG_DVB_FIREDTV is not set
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y
CONFIG_MEDIA_TUNER=m

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_SIMPLE=m
CONFIG_MEDIA_TUNER_TDA18250=m
CONFIG_MEDIA_TUNER_TDA8290=m
CONFIG_MEDIA_TUNER_TDA827X=m
CONFIG_MEDIA_TUNER_TDA18271=m
CONFIG_MEDIA_TUNER_TDA9887=m
CONFIG_MEDIA_TUNER_TEA5761=m
CONFIG_MEDIA_TUNER_TEA5767=m
CONFIG_MEDIA_TUNER_MT20XX=m
# CONFIG_MEDIA_TUNER_MT2060 is not set
CONFIG_MEDIA_TUNER_MT2063=m
CONFIG_MEDIA_TUNER_MT2266=m
CONFIG_MEDIA_TUNER_MT2131=m
CONFIG_MEDIA_TUNER_QT1010=m
CONFIG_MEDIA_TUNER_XC2028=m
CONFIG_MEDIA_TUNER_XC5000=m
CONFIG_MEDIA_TUNER_XC4000=m
# CONFIG_MEDIA_TUNER_MXL5005S is not set
# CONFIG_MEDIA_TUNER_MXL5007T is not set
CONFIG_MEDIA_TUNER_MC44S803=m
CONFIG_MEDIA_TUNER_MAX2165=m
CONFIG_MEDIA_TUNER_TDA18218=m
# CONFIG_MEDIA_TUNER_FC0011 is not set
CONFIG_MEDIA_TUNER_FC0012=m
CONFIG_MEDIA_TUNER_FC0013=m
CONFIG_MEDIA_TUNER_TDA18212=m
CONFIG_MEDIA_TUNER_M88RS6000T=m
CONFIG_MEDIA_TUNER_TUA9001=m
CONFIG_MEDIA_TUNER_SI2157=m
# CONFIG_MEDIA_TUNER_IT913X is not set
CONFIG_MEDIA_TUNER_R820T=m
# CONFIG_MEDIA_TUNER_MXL301RF is not set
CONFIG_MEDIA_TUNER_QM1D1C0042=m
CONFIG_MEDIA_TUNER_QM1D1B0004=m
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
CONFIG_DVB_STB0899=m
CONFIG_DVB_STB6100=m
CONFIG_DVB_STV090x=m
CONFIG_DVB_STV0910=m
CONFIG_DVB_STV6110x=m
CONFIG_DVB_STV6111=m
# CONFIG_DVB_MXL5XX is not set
# CONFIG_DVB_M88DS3103 is not set

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=m
# CONFIG_DVB_TDA18271C2DD is not set
CONFIG_DVB_SI2165=m
# CONFIG_DVB_MN88472 is not set
# CONFIG_DVB_MN88473 is not set

#
# DVB-S (satellite) frontends
#
# CONFIG_DVB_CX24110 is not set
CONFIG_DVB_CX24123=m
CONFIG_DVB_MT312=m
CONFIG_DVB_ZL10036=m
CONFIG_DVB_ZL10039=m
CONFIG_DVB_S5H1420=m
CONFIG_DVB_STV0288=m
CONFIG_DVB_STB6000=m
CONFIG_DVB_STV0299=m
CONFIG_DVB_STV6110=m
CONFIG_DVB_STV0900=m
CONFIG_DVB_TDA8083=m
CONFIG_DVB_TDA10086=m
CONFIG_DVB_TDA8261=m
CONFIG_DVB_VES1X93=m
CONFIG_DVB_TUNER_ITD1000=m
# CONFIG_DVB_TUNER_CX24113 is not set
CONFIG_DVB_TDA826X=m
CONFIG_DVB_TUA6100=m
CONFIG_DVB_CX24116=m
# CONFIG_DVB_CX24117 is not set
CONFIG_DVB_CX24120=m
# CONFIG_DVB_SI21XX is not set
CONFIG_DVB_TS2020=m
CONFIG_DVB_DS3000=m
CONFIG_DVB_MB86A16=m
CONFIG_DVB_TDA10071=m

#
# DVB-T (terrestrial) frontends
#
# CONFIG_DVB_SP887X is not set
CONFIG_DVB_CX22700=m
CONFIG_DVB_CX22702=m
CONFIG_DVB_S5H1432=m
# CONFIG_DVB_DRXD is not set
CONFIG_DVB_L64781=m
CONFIG_DVB_TDA1004X=m
CONFIG_DVB_NXT6000=m
CONFIG_DVB_MT352=m
# CONFIG_DVB_ZL10353 is not set
# CONFIG_DVB_DIB3000MB is not set
CONFIG_DVB_DIB3000MC=m
CONFIG_DVB_DIB7000M=m
# CONFIG_DVB_DIB7000P is not set
# CONFIG_DVB_DIB9000 is not set
CONFIG_DVB_TDA10048=m
CONFIG_DVB_AF9013=m
# CONFIG_DVB_EC100 is not set
# CONFIG_DVB_STV0367 is not set
CONFIG_DVB_CXD2820R=m
CONFIG_DVB_CXD2841ER=m
CONFIG_DVB_RTL2830=m
CONFIG_DVB_RTL2832=m
CONFIG_DVB_SI2168=m
CONFIG_DVB_ZD1301_DEMOD=m

#
# DVB-C (cable) frontends
#
CONFIG_DVB_VES1820=m
# CONFIG_DVB_TDA10021 is not set
CONFIG_DVB_TDA10023=m
# CONFIG_DVB_STV0297 is not set

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
# CONFIG_DVB_NXT200X is not set
CONFIG_DVB_OR51211=m
CONFIG_DVB_OR51132=m
# CONFIG_DVB_BCM3510 is not set
# CONFIG_DVB_LGDT330X is not set
CONFIG_DVB_LGDT3305=m
CONFIG_DVB_LGDT3306A=m
CONFIG_DVB_LG2160=m
CONFIG_DVB_S5H1409=m
CONFIG_DVB_AU8522=m
CONFIG_DVB_AU8522_DTV=m
# CONFIG_DVB_S5H1411 is not set
CONFIG_DVB_MXL692=m

#
# ISDB-T (terrestrial) frontends
#
# CONFIG_DVB_S921 is not set
CONFIG_DVB_DIB8000=m
CONFIG_DVB_MB86A20S=m

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_TC90522=m
CONFIG_DVB_MN88443X=m

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=m
CONFIG_DVB_TUNER_DIB0070=m
CONFIG_DVB_TUNER_DIB0090=m

#
# SEC control devices for DVB-S
#
# CONFIG_DVB_DRX39XYJ is not set
CONFIG_DVB_LNBH25=m
# CONFIG_DVB_LNBH29 is not set
CONFIG_DVB_LNBP21=m
CONFIG_DVB_LNBP22=m
# CONFIG_DVB_ISL6405 is not set
CONFIG_DVB_ISL6421=m
CONFIG_DVB_ISL6423=m
# CONFIG_DVB_A8293 is not set
CONFIG_DVB_LGS8GL5=m
CONFIG_DVB_LGS8GXX=m
# CONFIG_DVB_ATBM8830 is not set
CONFIG_DVB_TDA665x=m
CONFIG_DVB_IX2505V=m
CONFIG_DVB_M88RS2000=m
CONFIG_DVB_AF9033=m
CONFIG_DVB_HORUS3A=m
CONFIG_DVB_ASCOT2E=m
# CONFIG_DVB_HELENE is not set

#
# Common Interface (EN50221) controller drivers
#
CONFIG_DVB_CXD2099=m
# CONFIG_DVB_SP2 is not set
# end of Customise DVB Frontends

#
# Tools to develop new frontends
#
# CONFIG_DVB_DUMMY_FE is not set
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_AGP=y
CONFIG_AGP_AMD64=y
# CONFIG_AGP_INTEL is not set
CONFIG_AGP_SIS=m
CONFIG_AGP_VIA=y
CONFIG_INTEL_GTT=m
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_IMX_IPUV3_CORE is not set
CONFIG_DRM=y
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DEBUG_MM is not set
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DP_CEC=y
CONFIG_DRM_TTM=y
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=y
CONFIG_DRM_GEM_CMA_HELPER=y
CONFIG_DRM_KMS_CMA_HELPER=y
CONFIG_DRM_GEM_SHMEM_HELPER=y
CONFIG_DRM_SCHED=y

#
# I2C encoder or helper chips
#
# CONFIG_DRM_I2C_CH7006 is not set
# CONFIG_DRM_I2C_SIL164 is not set
CONFIG_DRM_I2C_NXP_TDA998X=m
CONFIG_DRM_I2C_NXP_TDA9950=y
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

CONFIG_DRM_RADEON=m
CONFIG_DRM_RADEON_USERPTR=y
# CONFIG_DRM_AMDGPU is not set
CONFIG_DRM_NOUVEAU=y
CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT=y
CONFIG_NOUVEAU_DEBUG=5
CONFIG_NOUVEAU_DEBUG_DEFAULT=3
CONFIG_NOUVEAU_DEBUG_MMU=y
CONFIG_NOUVEAU_DEBUG_PUSH=y
# CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
CONFIG_DRM_I915=m
CONFIG_DRM_I915_FORCE_PROBE=""
CONFIG_DRM_I915_CAPTURE_ERROR=y
# CONFIG_DRM_I915_COMPRESS_ERROR is not set
# CONFIG_DRM_I915_USERPTR is not set
# CONFIG_DRM_I915_GVT is not set
CONFIG_DRM_I915_REQUEST_TIMEOUT=20000
CONFIG_DRM_I915_FENCE_TIMEOUT=10000
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
CONFIG_DRM_I915_PREEMPT_TIMEOUT=640
CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=8000
CONFIG_DRM_I915_STOP_TIMEOUT=100
CONFIG_DRM_I915_TIMESLICE_DURATION=1
CONFIG_DRM_KMB_DISPLAY=m
# CONFIG_DRM_VGEM is not set
# CONFIG_DRM_VKMS is not set
CONFIG_DRM_VMWGFX=y
# CONFIG_DRM_VMWGFX_FBCON is not set
CONFIG_DRM_VMWGFX_MKSSTATS=y
CONFIG_DRM_GMA500=y
# CONFIG_DRM_AST is not set
CONFIG_DRM_MGAG200=m
CONFIG_DRM_QXL=y
CONFIG_DRM_PANEL=y

#
# Display Panels
#
CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=y
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_ANALOGIX_ANX78XX=y
CONFIG_DRM_ANALOGIX_DP=y
# end of Display Interface Bridges

CONFIG_DRM_V3D=y
# CONFIG_DRM_ETNAVIV is not set
CONFIG_DRM_BOCHS=m
# CONFIG_DRM_CIRRUS_QEMU is not set
CONFIG_DRM_SIMPLEDRM=m
# CONFIG_DRM_PL111 is not set
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_PANFROST is not set
CONFIG_DRM_LEGACY=y
CONFIG_DRM_TDFX=y
CONFIG_DRM_R128=m
CONFIG_DRM_MGA=m
# CONFIG_DRM_SIS is not set
CONFIG_DRM_VIA=m
# CONFIG_DRM_SAVAGE is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=m
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_DDC=m
CONFIG_FB_CFB_FILLRECT=m
CONFIG_FB_CFB_COPYAREA=m
CONFIG_FB_CFB_IMAGEBLIT=m
CONFIG_FB_CFB_REV_PIXELS_IN_BYTE=y
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_SVGALIB=m
CONFIG_FB_BACKLIGHT=m
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
CONFIG_FB_CIRRUS=m
CONFIG_FB_PM2=m
# CONFIG_FB_PM2_FIFO_DISCONNECT is not set
CONFIG_FB_CLPS711X=m
# CONFIG_FB_IMX is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
CONFIG_FB_VGA16=m
CONFIG_FB_UVESA=m
# CONFIG_FB_N411 is not set
# CONFIG_FB_HGA is not set
CONFIG_FB_PVR2=m
CONFIG_FB_OPENCORES=m
CONFIG_FB_S1D13XXX=m
# CONFIG_FB_NVIDIA is not set
CONFIG_FB_RIVA=m
CONFIG_FB_RIVA_I2C=y
CONFIG_FB_RIVA_DEBUG=y
CONFIG_FB_RIVA_BACKLIGHT=y
# CONFIG_FB_I740 is not set
CONFIG_FB_LE80578=m
CONFIG_FB_CARILLO_RANCH=m
# CONFIG_FB_MATROX is not set
CONFIG_FB_RADEON=m
CONFIG_FB_RADEON_I2C=y
CONFIG_FB_RADEON_BACKLIGHT=y
CONFIG_FB_RADEON_DEBUG=y
CONFIG_FB_ATY128=m
CONFIG_FB_ATY128_BACKLIGHT=y
# CONFIG_FB_ATY is not set
CONFIG_FB_S3=m
CONFIG_FB_S3_DDC=y
CONFIG_FB_SAVAGE=m
CONFIG_FB_SAVAGE_I2C=y
# CONFIG_FB_SAVAGE_ACCEL is not set
CONFIG_FB_SIS=m
CONFIG_FB_SIS_300=y
# CONFIG_FB_SIS_315 is not set
CONFIG_FB_VIA=m
# CONFIG_FB_VIA_DIRECT_PROCFS is not set
# CONFIG_FB_VIA_X_COMPATIBILITY is not set
CONFIG_FB_NEOMAGIC=m
CONFIG_FB_KYRO=m
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
CONFIG_FB_VT8623=m
# CONFIG_FB_TRIDENT is not set
CONFIG_FB_ARK=m
CONFIG_FB_PM3=m
CONFIG_FB_CARMINE=m
# CONFIG_FB_CARMINE_DRAM_EVAL is not set
CONFIG_CARMINE_DRAM_CUSTOM=y
# CONFIG_FB_GEODE is not set
CONFIG_FB_PXA168=m
CONFIG_FB_W100=m
CONFIG_FB_SH_MOBILE_LCDC=m
CONFIG_FB_TMIO=m
# CONFIG_FB_TMIO_ACCELL is not set
# CONFIG_FB_S3C is not set
CONFIG_FB_SM501=m
CONFIG_FB_IBM_GXT4500=m
# CONFIG_FB_GOLDFISH is not set
CONFIG_FB_DA8XX=m
# CONFIG_FB_VIRTUAL is not set
CONFIG_FB_METRONOME=m
CONFIG_FB_MB862XX=m
CONFIG_FB_MB862XX_PCI_GDC=y
CONFIG_FB_MB862XX_I2C=y
CONFIG_FB_BROADSHEET=m
# CONFIG_FB_SIMPLE is not set
CONFIG_FB_SSD1307=m
CONFIG_FB_SM712=m
CONFIG_MMP_DISP=m
# CONFIG_MMP_DISP_CONTROLLER is not set
CONFIG_MMP_FB=m
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
CONFIG_LCD_PLATFORM=m
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_KTD253=y
CONFIG_BACKLIGHT_LM3533=m
# CONFIG_BACKLIGHT_CARILLO_RANCH is not set
CONFIG_BACKLIGHT_PWM=y
CONFIG_BACKLIGHT_MAX8925=m
CONFIG_BACKLIGHT_QCOM_WLED=y
# CONFIG_BACKLIGHT_RT4831 is not set
# CONFIG_BACKLIGHT_SAHARA is not set
CONFIG_BACKLIGHT_ADP5520=m
CONFIG_BACKLIGHT_ADP8860=y
# CONFIG_BACKLIGHT_ADP8870 is not set
CONFIG_BACKLIGHT_88PM860X=y
CONFIG_BACKLIGHT_AAT2870=m
CONFIG_BACKLIGHT_LM3630A=m
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=y
# CONFIG_BACKLIGHT_AS3711 is not set
CONFIG_BACKLIGHT_GPIO=y
CONFIG_BACKLIGHT_LV5207LP=m
CONFIG_BACKLIGHT_BD6107=y
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_VGASTATE=m
CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# end of Console display driver support

# CONFIG_LOGO is not set
# end of Graphics support

# CONFIG_SOUND is not set

#
# HID support
#
CONFIG_HID=m
CONFIG_HID_BATTERY_STRENGTH=y
# CONFIG_HIDRAW is not set
CONFIG_UHID=m
# CONFIG_HID_GENERIC is not set

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
# CONFIG_HID_APPLE is not set
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
CONFIG_HID_CHERRY=m
CONFIG_HID_COUGAR=m
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=m
CONFIG_HID_CYPRESS=m
# CONFIG_HID_DRAGONRISE is not set
CONFIG_HID_EMS_FF=m
CONFIG_HID_ELECOM=m
# CONFIG_HID_EZKEY is not set
# CONFIG_HID_GEMBIRD is not set
CONFIG_HID_GFRM=m
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_VIVALDI is not set
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
CONFIG_HID_GYRATION=m
# CONFIG_HID_ICADE is not set
CONFIG_HID_ITE=m
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=m
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
CONFIG_HID_MAGICMOUSE=m
# CONFIG_HID_MALTRON is not set
CONFIG_HID_MAYFLASH=m
CONFIG_HID_REDRAGON=m
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=m
# CONFIG_HID_NTI is not set
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
# CONFIG_HID_PLANTRONICS is not set
CONFIG_HID_PLAYSTATION=m
CONFIG_PLAYSTATION_FF=y
CONFIG_HID_PRIMAX=m
CONFIG_HID_SAITEK=m
# CONFIG_HID_SEMITEK is not set
CONFIG_HID_SPEEDLINK=m
CONFIG_HID_STEAM=m
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_SMARTJOYPLUS=m
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=m
# CONFIG_HID_TOPSEED is not set
CONFIG_HID_THINGM=m
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_WIIMOTE is not set
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
CONFIG_ZEROPLUS_FF=y
# CONFIG_HID_ZYDACRON is not set
# CONFIG_HID_SENSOR_HUB is not set
CONFIG_HID_ALPS=m
# end of Special HID drivers

#
# I2C HID support
#
# end of I2C HID support

#
# Intel ISH HID support
#
# CONFIG_INTEL_ISH_HID is not set
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
CONFIG_AMD_SFH_HID=m
# end of AMD SFH HID Support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
# CONFIG_USB_SUPPORT is not set
CONFIG_MMC=y
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=y
CONFIG_MMC_TEST=m
# CONFIG_MMC_CRYPTO is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
CONFIG_MMC_DEBUG=y
CONFIG_MMC_SDHCI=y
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
# CONFIG_MMC_SDHCI_PCI is not set
CONFIG_MMC_SDHCI_PLTFM=m
CONFIG_MMC_SDHCI_OF_ESDHC=m
CONFIG_MMC_SDHCI_OF_SPARX5=m
CONFIG_MMC_SDHCI_CNS3XXX=m
# CONFIG_MMC_SDHCI_DOVE is not set
CONFIG_MMC_SDHCI_TEGRA=m
CONFIG_MMC_SDHCI_S3C=m
CONFIG_MMC_SDHCI_PXAV3=m
CONFIG_MMC_SDHCI_PXAV2=m
CONFIG_MMC_SDHCI_S3C_DMA=y
CONFIG_MMC_SDHCI_BCM_KONA=m
# CONFIG_MMC_MESON_GX is not set
CONFIG_MMC_MOXART=y
CONFIG_MMC_SDHCI_ST=m
CONFIG_MMC_OMAP_HS=y
# CONFIG_MMC_WBSD is not set
CONFIG_MMC_SDHCI_MSM=m
# CONFIG_MMC_TIFM_SD is not set
CONFIG_MMC_DAVINCI=y
CONFIG_MMC_S3C=m
CONFIG_MMC_S3C_HW_SDIO_IRQ=y
# CONFIG_MMC_S3C_PIO is not set
CONFIG_MMC_S3C_DMA=y
CONFIG_MMC_SDRICOH_CS=y
CONFIG_MMC_SDHCI_SPRD=m
# CONFIG_MMC_TMIO is not set
# CONFIG_MMC_SDHI is not set
CONFIG_MMC_CB710=m
CONFIG_MMC_VIA_SDMMC=m
CONFIG_MMC_DW=m
CONFIG_MMC_DW_PLTFM=m
CONFIG_MMC_DW_BLUEFIELD=m
# CONFIG_MMC_DW_EXYNOS is not set
CONFIG_MMC_DW_HI3798CV200=m
CONFIG_MMC_DW_K3=m
CONFIG_MMC_DW_PCI=m
CONFIG_MMC_SH_MMCIF=m
CONFIG_MMC_USDHI6ROL0=y
# CONFIG_MMC_SUNXI is not set
CONFIG_MMC_CQHCI=m
CONFIG_MMC_HSQ=y
# CONFIG_MMC_TOSHIBA_PCI is not set
CONFIG_MMC_BCM2835=m
CONFIG_MMC_MTK=m
CONFIG_MMC_SDHCI_XENON=m
# CONFIG_MMC_OWL is not set
CONFIG_MEMSTICK=m
CONFIG_MEMSTICK_DEBUG=y

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y
CONFIG_MSPRO_BLOCK=m
CONFIG_MS_BLOCK=m

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_TIFM_MS=m
# CONFIG_MEMSTICK_JMICRON_38X is not set
CONFIG_MEMSTICK_R592=m
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=m
CONFIG_LEDS_CLASS_MULTICOLOR=y
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
CONFIG_LEDS_88PM860X=y
CONFIG_LEDS_APU=m
CONFIG_LEDS_ARIEL=m
CONFIG_LEDS_LM3530=y
CONFIG_LEDS_LM3532=y
CONFIG_LEDS_LM3533=m
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_S3C24XX is not set
CONFIG_LEDS_COBALT_QUBE=y
CONFIG_LEDS_COBALT_RAQ=y
CONFIG_LEDS_PCA9532=y
# CONFIG_LEDS_PCA9532_GPIO is not set
CONFIG_LEDS_GPIO=y
# CONFIG_LEDS_LP3944 is not set
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP50XX=m
CONFIG_LEDS_PCA955X=y
CONFIG_LEDS_PCA955X_GPIO=y
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_PWM is not set
CONFIG_LEDS_REGULATOR=m
CONFIG_LEDS_BD2802=m
CONFIG_LEDS_INTEL_SS4200=y
# CONFIG_LEDS_LT3593 is not set
# CONFIG_LEDS_ADP5520 is not set
CONFIG_LEDS_NS2=y
CONFIG_LEDS_TCA6507=y
CONFIG_LEDS_TLC591XX=m
# CONFIG_LEDS_MAX77650 is not set
CONFIG_LEDS_LM355x=m
CONFIG_LEDS_OT200=y
CONFIG_LEDS_MENF21BMC=m

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
CONFIG_LEDS_MLXCPLD=m
# CONFIG_LEDS_MLXREG is not set
CONFIG_LEDS_USER=m
CONFIG_LEDS_TI_LMU_COMMON=y
CONFIG_LEDS_LM36274=m
CONFIG_LEDS_TPS6105X=m
# CONFIG_LEDS_IP30 is not set
CONFIG_LEDS_ACER_A500=y

#
# Flash and Torch LED drivers
#
# CONFIG_LEDS_AS3645A is not set
# CONFIG_LEDS_LM3601X is not set
CONFIG_LEDS_RT8515=m
CONFIG_LEDS_SGM3140=m

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
CONFIG_LEDS_TRIGGER_MTD=y
# CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
CONFIG_LEDS_TRIGGER_CPU=y
CONFIG_LEDS_TRIGGER_ACTIVITY=m
CONFIG_LEDS_TRIGGER_GPIO=m
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
CONFIG_LEDS_TRIGGER_CAMERA=y
# CONFIG_LEDS_TRIGGER_PANIC is not set
CONFIG_LEDS_TRIGGER_NETDEV=y
CONFIG_LEDS_TRIGGER_PATTERN=y
CONFIG_LEDS_TRIGGER_AUDIO=m
# CONFIG_LEDS_TRIGGER_TTY is not set
# CONFIG_ACCESSIBILITY is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
CONFIG_EDAC_DEBUG=y
CONFIG_EDAC_AL_MC=m
CONFIG_EDAC_E752X=y
CONFIG_EDAC_I82975X=m
CONFIG_EDAC_I3000=m
# CONFIG_EDAC_I3200 is not set
# CONFIG_EDAC_IE31200 is not set
# CONFIG_EDAC_X38 is not set
# CONFIG_EDAC_I5400 is not set
CONFIG_EDAC_I5000=y
# CONFIG_EDAC_I5100 is not set
CONFIG_EDAC_I7300=y
CONFIG_EDAC_XGENE=y
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
# CONFIG_RTC_HCTOSYS is not set
CONFIG_RTC_SYSTOHC=y
CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
CONFIG_RTC_DEBUG=y
CONFIG_RTC_LIB_KUNIT_TEST=y
# CONFIG_RTC_NVMEM is not set

#
# RTC interfaces
#
# CONFIG_RTC_INTF_SYSFS is not set
CONFIG_RTC_INTF_PROC=y
# CONFIG_RTC_INTF_DEV is not set
CONFIG_RTC_DRV_TEST=m

#
# I2C RTC drivers
#
CONFIG_RTC_DRV_88PM860X=m
CONFIG_RTC_DRV_ABB5ZES3=m
# CONFIG_RTC_DRV_ABEOZ9 is not set
CONFIG_RTC_DRV_ABX80X=m
CONFIG_RTC_DRV_BRCMSTB=y
CONFIG_RTC_DRV_DS1307=y
CONFIG_RTC_DRV_DS1307_CENTURY=y
CONFIG_RTC_DRV_DS1374=m
CONFIG_RTC_DRV_DS1374_WDT=y
# CONFIG_RTC_DRV_DS1672 is not set
CONFIG_RTC_DRV_MAX6900=y
# CONFIG_RTC_DRV_MAX8907 is not set
CONFIG_RTC_DRV_MAX8925=y
CONFIG_RTC_DRV_MAX77686=y
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=m
CONFIG_RTC_DRV_ISL12022=m
CONFIG_RTC_DRV_ISL12026=m
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=y
# CONFIG_RTC_DRV_PCF85063 is not set
CONFIG_RTC_DRV_PCF85363=y
# CONFIG_RTC_DRV_PCF8563 is not set
CONFIG_RTC_DRV_PCF8583=y
# CONFIG_RTC_DRV_M41T80 is not set
CONFIG_RTC_DRV_BQ32K=m
# CONFIG_RTC_DRV_TPS65910 is not set
# CONFIG_RTC_DRV_S35390A is not set
# CONFIG_RTC_DRV_FM3130 is not set
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=m
# CONFIG_RTC_DRV_RX8025 is not set
# CONFIG_RTC_DRV_EM3027 is not set
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
CONFIG_RTC_DRV_S5M=y
CONFIG_RTC_DRV_SD3078=y

#
# SPI RTC drivers
#
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
# CONFIG_RTC_DRV_DS3232 is not set
CONFIG_RTC_DRV_PCF2127=m
CONFIG_RTC_DRV_RV3029C2=m
CONFIG_RTC_DRV_RV3029_HWMON=y
CONFIG_RTC_DRV_RX6110=y

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=y
# CONFIG_RTC_DRV_DS1511 is not set
CONFIG_RTC_DRV_DS1553=y
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=y
CONFIG_RTC_DRV_DA9055=m
CONFIG_RTC_DRV_DA9063=y
# CONFIG_RTC_DRV_STK17TA8 is not set
CONFIG_RTC_DRV_M48T86=y
# CONFIG_RTC_DRV_M48T35 is not set
CONFIG_RTC_DRV_M48T59=y
CONFIG_RTC_DRV_MSM6242=m
# CONFIG_RTC_DRV_BQ4802 is not set
# CONFIG_RTC_DRV_RP5C01 is not set
CONFIG_RTC_DRV_V3020=m
# CONFIG_RTC_DRV_SC27XX is not set
# CONFIG_RTC_DRV_SPEAR is not set
CONFIG_RTC_DRV_CROS_EC=m
CONFIG_RTC_DRV_NTXEC=m

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_ASM9260 is not set
# CONFIG_RTC_DRV_DAVINCI is not set
# CONFIG_RTC_DRV_DIGICOLOR is not set
CONFIG_RTC_DRV_FSL_FTM_ALARM=m
CONFIG_RTC_DRV_MESON=m
CONFIG_RTC_DRV_MESON_VRTC=y
CONFIG_RTC_DRV_S3C=m
CONFIG_RTC_DRV_EP93XX=m
# CONFIG_RTC_DRV_VR41XX is not set
# CONFIG_RTC_DRV_GENERIC is not set
CONFIG_RTC_DRV_VT8500=m
# CONFIG_RTC_DRV_SUN6I is not set
CONFIG_RTC_DRV_SUNXI=m
CONFIG_RTC_DRV_MV=y
# CONFIG_RTC_DRV_FTRTC010 is not set
# CONFIG_RTC_DRV_STMP is not set
CONFIG_RTC_DRV_LPC32XX=m
# CONFIG_RTC_DRV_PM8XXX is not set
# CONFIG_RTC_DRV_TEGRA is not set
CONFIG_RTC_DRV_MOXART=y
# CONFIG_RTC_DRV_MT2712 is not set
CONFIG_RTC_DRV_MT6397=y
CONFIG_RTC_DRV_MT7622=y
CONFIG_RTC_DRV_XGENE=y
# CONFIG_RTC_DRV_STM32 is not set
# CONFIG_RTC_DRV_RTD119X is not set

#
# HID Sensor RTC drivers
#
CONFIG_RTC_DRV_GOLDFISH=m
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
# CONFIG_UDMABUF is not set
CONFIG_DMABUF_MOVE_NOTIFY=y
CONFIG_DMABUF_DEBUG=y
CONFIG_DMABUF_SELFTESTS=m
# CONFIG_DMABUF_HEAPS is not set
CONFIG_DMABUF_SYSFS_STATS=y
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
CONFIG_UIO=y
CONFIG_UIO_CIF=m
CONFIG_UIO_PDRV_GENIRQ=y
CONFIG_UIO_DMEM_GENIRQ=m
CONFIG_UIO_AEC=y
CONFIG_UIO_SERCOS3=y
CONFIG_UIO_PCI_GENERIC=y
CONFIG_UIO_NETX=y
CONFIG_UIO_PRUSS=m
CONFIG_UIO_MF624=m
CONFIG_VFIO=y
CONFIG_VFIO_IOMMU_TYPE1=y
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
# CONFIG_VFIO_PCI is not set
CONFIG_VFIO_PLATFORM=y
CONFIG_VFIO_AMBA=m
CONFIG_VFIO_PLATFORM_CALXEDAXGMAC_RESET=m
CONFIG_VFIO_PLATFORM_AMDXGBE_RESET=y
CONFIG_VFIO_PLATFORM_BCMFLEXRM_RESET=y
# CONFIG_VFIO_MDEV is not set
CONFIG_IRQ_BYPASS_MANAGER=m
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO=y
CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS=y
# CONFIG_VIRTIO_MENU is not set
CONFIG_VDPA=m
CONFIG_VDPA_SIM=m
CONFIG_VDPA_SIM_NET=m
CONFIG_VDPA_SIM_BLOCK=m
# CONFIG_VDPA_USER is not set
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST_RING=m
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
# CONFIG_VHOST_NET is not set
CONFIG_VHOST_SCSI=m
CONFIG_VHOST_VDPA=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=m
# CONFIG_COMEDI is not set
CONFIG_STAGING=y
CONFIG_RTS5208=m
CONFIG_VT6655=m

#
# IIO staging drivers
#

#
# Accelerometers
#
# end of Accelerometers

#
# Analog to digital converters
#
# end of Analog to digital converters

#
# Analog digital bi-direction converters
#
CONFIG_ADT7316=m
CONFIG_ADT7316_I2C=m
# end of Analog digital bi-direction converters

#
# Capacitance to digital converters
#
CONFIG_AD7746=m
# end of Capacitance to digital converters

#
# Direct Digital Synthesis
#
# end of Direct Digital Synthesis

#
# Network Analyzer, Impedance Converters
#
CONFIG_AD5933=m
# end of Network Analyzer, Impedance Converters

#
# Active energy metering IC
#
CONFIG_ADE7854=m
# CONFIG_ADE7854_I2C is not set
# end of Active energy metering IC

#
# Resolver to digital converters
#
# end of Resolver to digital converters
# end of IIO staging drivers

CONFIG_FB_SM750=m
CONFIG_STAGING_MEDIA=y
# CONFIG_VIDEO_SUNXI is not set
# CONFIG_TEGRA_VDE is not set

#
# Android
#
# end of Android

# CONFIG_FIREWIRE_SERIAL is not set
# CONFIG_GS_FPGABOOT is not set
# CONFIG_UNISYSSPAR is not set
# CONFIG_KS7010 is not set
CONFIG_GREYBUS_BOOTROM=m
CONFIG_GREYBUS_HID=m
# CONFIG_GREYBUS_LIGHT is not set
CONFIG_GREYBUS_LOG=m
CONFIG_GREYBUS_LOOPBACK=m
CONFIG_GREYBUS_POWER=m
# CONFIG_GREYBUS_RAW is not set
# CONFIG_GREYBUS_VIBRATOR is not set
CONFIG_GREYBUS_BRIDGED_PHY=m
# CONFIG_GREYBUS_GPIO is not set
CONFIG_GREYBUS_I2C=m
# CONFIG_GREYBUS_PWM is not set
CONFIG_GREYBUS_SDIO=m
# CONFIG_GREYBUS_UART is not set
CONFIG_GREYBUS_ARCHE=m
CONFIG_FIELDBUS_DEV=m
# CONFIG_WFX is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_MERAKI_MX100=m
CONFIG_X86_PLATFORM_DRIVERS_DELL=y
CONFIG_DCDBAS=y
CONFIG_DELL_RBU=y
CONFIG_DELL_SMBIOS=m
# CONFIG_DELL_SMBIOS_SMM is not set
CONFIG_DELL_SMO8800=y
CONFIG_IBM_RTL=y
CONFIG_SENSORS_HDAPS=y
CONFIG_INTEL_ATOMISP2_PDX86=y
CONFIG_INTEL_ATOMISP2_LED=y
CONFIG_INTEL_ATOMISP2_PM=m

#
# Intel Speed Select Technology interface support
#
CONFIG_INTEL_SPEED_SELECT_INTERFACE=m
# end of Intel Speed Select Technology interface support

# CONFIG_INTEL_PUNIT_IPC is not set
CONFIG_INTEL_UNCORE_FREQ_CONTROL=m
CONFIG_XO1_RFKILL=m
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_MLX_PLATFORM=m
CONFIG_INTEL_SCU_IPC=y
CONFIG_INTEL_SCU=y
CONFIG_INTEL_SCU_PCI=y
# CONFIG_INTEL_SCU_IPC_UTIL is not set
CONFIG_PMC_ATOM=y
# CONFIG_GOLDFISH_PIPE is not set
CONFIG_CHROME_PLATFORMS=y
CONFIG_CHROMEOS_LAPTOP=m
# CONFIG_CHROMEOS_PSTORE is not set
CONFIG_CROS_EC=m
# CONFIG_CROS_EC_I2C is not set
CONFIG_CROS_EC_PROTO=y
CONFIG_MELLANOX_PLATFORM=y
CONFIG_MLXREG_HOTPLUG=m
# CONFIG_MLXREG_IO is not set
# CONFIG_OLPC_XO175 is not set
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Clock driver for ARM Reference designs
#
# CONFIG_ICST is not set
CONFIG_CLK_SP810=y
# end of Clock driver for ARM Reference designs

CONFIG_CLK_HSDK=y
CONFIG_COMMON_CLK_MAX77686=m
# CONFIG_COMMON_CLK_MAX9485 is not set
CONFIG_COMMON_CLK_SCMI=m
CONFIG_COMMON_CLK_SCPI=y
CONFIG_COMMON_CLK_SI5341=m
# CONFIG_COMMON_CLK_SI5351 is not set
CONFIG_COMMON_CLK_SI544=m
# CONFIG_COMMON_CLK_BM1880 is not set
CONFIG_COMMON_CLK_CDCE706=m
CONFIG_COMMON_CLK_CS2000_CP=y
CONFIG_COMMON_CLK_FSL_FLEXSPI=m
# CONFIG_COMMON_CLK_FSL_SAI is not set
CONFIG_COMMON_CLK_GEMINI=y
# CONFIG_COMMON_CLK_ASPEED is not set
CONFIG_COMMON_CLK_S2MPS11=m
CONFIG_CLK_TWL6040=m
CONFIG_CLK_LS1028A_PLLDIG=y
# CONFIG_COMMON_CLK_XGENE is not set
# CONFIG_COMMON_CLK_PWM is not set
# CONFIG_COMMON_CLK_OXNAS is not set
# CONFIG_COMMON_CLK_MMP2_AUDIO is not set
CONFIG_CLK_ACTIONS=y
CONFIG_CLK_OWL_S500=y
# CONFIG_CLK_OWL_S700 is not set
# CONFIG_CLK_OWL_S900 is not set
# CONFIG_CLK_BAIKAL_T1 is not set
CONFIG_CLK_BCM2711_DVP=m
# CONFIG_CLK_BCM2835 is not set
CONFIG_CLK_BCM_63XX=y
# CONFIG_CLK_BCM_63XX_GATE is not set
# CONFIG_CLK_BCM_KONA is not set
CONFIG_COMMON_CLK_IPROC=y
CONFIG_CLK_BCM_CYGNUS=y
CONFIG_CLK_BCM_HR2=y
# CONFIG_CLK_BCM_NSP is not set
CONFIG_CLK_BCM_NS2=y
CONFIG_CLK_BCM_SR=y
CONFIG_CLK_RASPBERRYPI=y
CONFIG_COMMON_CLK_HI3516CV300=y
CONFIG_COMMON_CLK_HI3519=m
CONFIG_COMMON_CLK_HI3559A=y
# CONFIG_COMMON_CLK_HI3660 is not set
CONFIG_COMMON_CLK_HI3670=y
# CONFIG_COMMON_CLK_HI3798CV200 is not set
CONFIG_COMMON_CLK_HI6220=y
CONFIG_RESET_HISI=y
CONFIG_STUB_CLK_HI6220=y
CONFIG_COMMON_CLK_BOSTON=y
CONFIG_MXC_CLK=y
CONFIG_CLK_IMX8MM=m
CONFIG_CLK_IMX8MN=m
# CONFIG_CLK_IMX8MP is not set
# CONFIG_CLK_IMX8MQ is not set

#
# Ingenic SoCs drivers
#
CONFIG_INGENIC_CGU_COMMON=y
# CONFIG_INGENIC_CGU_JZ4740 is not set
# CONFIG_INGENIC_CGU_JZ4725B is not set
CONFIG_INGENIC_CGU_JZ4760=y
# CONFIG_INGENIC_CGU_JZ4770 is not set
CONFIG_INGENIC_CGU_JZ4780=y
CONFIG_INGENIC_CGU_X1000=y
# CONFIG_INGENIC_CGU_X1830 is not set
CONFIG_INGENIC_TCU_CLK=y
# end of Ingenic SoCs drivers

# CONFIG_TI_SYSCON_CLK is not set

#
# Clock driver for MediaTek SoC
#
CONFIG_COMMON_CLK_MEDIATEK=y
# CONFIG_COMMON_CLK_MT2701 is not set
CONFIG_COMMON_CLK_MT2712=y
CONFIG_COMMON_CLK_MT2712_BDPSYS=y
CONFIG_COMMON_CLK_MT2712_IMGSYS=y
CONFIG_COMMON_CLK_MT2712_JPGDECSYS=y
# CONFIG_COMMON_CLK_MT2712_MFGCFG is not set
# CONFIG_COMMON_CLK_MT2712_MMSYS is not set
CONFIG_COMMON_CLK_MT2712_VDECSYS=y
# CONFIG_COMMON_CLK_MT2712_VENCSYS is not set
# CONFIG_COMMON_CLK_MT6765 is not set
CONFIG_COMMON_CLK_MT6779=y
# CONFIG_COMMON_CLK_MT6779_MMSYS is not set
CONFIG_COMMON_CLK_MT6779_IMGSYS=y
CONFIG_COMMON_CLK_MT6779_IPESYS=y
# CONFIG_COMMON_CLK_MT6779_CAMSYS is not set
# CONFIG_COMMON_CLK_MT6779_VDECSYS is not set
CONFIG_COMMON_CLK_MT6779_VENCSYS=y
# CONFIG_COMMON_CLK_MT6779_MFGCFG is not set
CONFIG_COMMON_CLK_MT6779_AUDSYS=y
# CONFIG_COMMON_CLK_MT6797 is not set
# CONFIG_COMMON_CLK_MT7622 is not set
CONFIG_COMMON_CLK_MT7629=y
# CONFIG_COMMON_CLK_MT7629_ETHSYS is not set
# CONFIG_COMMON_CLK_MT7629_HIFSYS is not set
# CONFIG_COMMON_CLK_MT8135 is not set
# CONFIG_COMMON_CLK_MT8167 is not set
CONFIG_COMMON_CLK_MT8173=y
CONFIG_COMMON_CLK_MT8173_MMSYS=y
CONFIG_COMMON_CLK_MT8183=y
CONFIG_COMMON_CLK_MT8183_AUDIOSYS=y
# CONFIG_COMMON_CLK_MT8183_CAMSYS is not set
CONFIG_COMMON_CLK_MT8183_IMGSYS=y
# CONFIG_COMMON_CLK_MT8183_IPU_CORE0 is not set
# CONFIG_COMMON_CLK_MT8183_IPU_CORE1 is not set
# CONFIG_COMMON_CLK_MT8183_IPU_ADL is not set
CONFIG_COMMON_CLK_MT8183_IPU_CONN=y
# CONFIG_COMMON_CLK_MT8183_MFGCFG is not set
CONFIG_COMMON_CLK_MT8183_MMSYS=y
# CONFIG_COMMON_CLK_MT8183_VDECSYS is not set
# CONFIG_COMMON_CLK_MT8183_VENCSYS is not set
# CONFIG_COMMON_CLK_MT8192 is not set
CONFIG_COMMON_CLK_MT8516=y
CONFIG_COMMON_CLK_MT8516_AUDSYS=y
# end of Clock driver for MediaTek SoC

#
# Clock support for Amlogic platforms
#
# end of Clock support for Amlogic platforms

# CONFIG_MSTAR_MSC313_MPLL is not set
# CONFIG_COMMON_CLK_PISTACHIO is not set
CONFIG_CLK_MT7621=y
CONFIG_CLK_RENESAS=y
CONFIG_CLK_EMEV2=y
CONFIG_CLK_RZA1=y
# CONFIG_CLK_R7S9210 is not set
# CONFIG_CLK_R8A73A4 is not set
CONFIG_CLK_R8A7740=y
CONFIG_CLK_R8A7742=y
# CONFIG_CLK_R8A7743 is not set
# CONFIG_CLK_R8A7745 is not set
CONFIG_CLK_R8A77470=y
# CONFIG_CLK_R8A774A1 is not set
# CONFIG_CLK_R8A774B1 is not set
# CONFIG_CLK_R8A774C0 is not set
CONFIG_CLK_R8A774E1=y
CONFIG_CLK_R8A7778=y
# CONFIG_CLK_R8A7779 is not set
# CONFIG_CLK_R8A7790 is not set
# CONFIG_CLK_R8A7791 is not set
CONFIG_CLK_R8A7792=y
# CONFIG_CLK_R8A7794 is not set
# CONFIG_CLK_R8A7795 is not set
CONFIG_CLK_R8A77960=y
CONFIG_CLK_R8A77961=y
CONFIG_CLK_R8A77965=y
CONFIG_CLK_R8A77970=y
# CONFIG_CLK_R8A77980 is not set
# CONFIG_CLK_R8A77990 is not set
# CONFIG_CLK_R8A77995 is not set
CONFIG_CLK_R8A779A0=y
# CONFIG_CLK_R9A06G032 is not set
# CONFIG_CLK_R9A07G044 is not set
CONFIG_CLK_SH73A0=y
CONFIG_CLK_RCAR_CPG_LIB=y
CONFIG_CLK_RCAR_GEN2_CPG=y
CONFIG_CLK_RCAR_GEN3_CPG=y
# CONFIG_CLK_RCAR_USB2_CLOCK_SEL is not set
CONFIG_CLK_RZG2L=y
CONFIG_CLK_RENESAS_CPG_MSSR=y
CONFIG_CLK_RENESAS_CPG_MSTP=y
CONFIG_CLK_RENESAS_DIV6=y
CONFIG_COMMON_CLK_SAMSUNG=y
# CONFIG_S3C64XX_COMMON_CLK is not set
# CONFIG_S5PV210_COMMON_CLK is not set
CONFIG_EXYNOS_3250_COMMON_CLK=y
# CONFIG_EXYNOS_4_COMMON_CLK is not set
# CONFIG_EXYNOS_5250_COMMON_CLK is not set
CONFIG_EXYNOS_5260_COMMON_CLK=y
# CONFIG_EXYNOS_5410_COMMON_CLK is not set
# CONFIG_EXYNOS_5420_COMMON_CLK is not set
# CONFIG_EXYNOS_ARM64_COMMON_CLK is not set
CONFIG_EXYNOS_AUDSS_CLK_CON=m
# CONFIG_EXYNOS_CLKOUT is not set
CONFIG_S3C2410_COMMON_CLK=y
CONFIG_S3C2412_COMMON_CLK=y
# CONFIG_S3C2443_COMMON_CLK is not set
# CONFIG_CLK_SIFIVE is not set
CONFIG_CLK_INTEL_SOCFPGA=y
# CONFIG_CLK_INTEL_SOCFPGA32 is not set
CONFIG_CLK_INTEL_SOCFPGA64=y
CONFIG_SPRD_COMMON_CLK=y
CONFIG_SPRD_SC9860_CLK=m
CONFIG_SPRD_SC9863A_CLK=m
# CONFIG_CLK_SUNXI is not set
# CONFIG_SUNXI_CCU is not set
CONFIG_COMMON_CLK_TI_ADPLL=y
# CONFIG_XILINX_VCU is not set
CONFIG_COMMON_CLK_ZYNQMP=y
CONFIG_HWSPINLOCK=y
CONFIG_HWSPINLOCK_OMAP=m
# CONFIG_HWSPINLOCK_QCOM is not set
CONFIG_HWSPINLOCK_SPRD=m
CONFIG_HWSPINLOCK_STM32=m
# CONFIG_HWSPINLOCK_SUN6I is not set
CONFIG_HSEM_U8500=m

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
CONFIG_CLKSRC_MMIO=y
CONFIG_BCM2835_TIMER=y
# CONFIG_BCM_KONA_TIMER is not set
CONFIG_DAVINCI_TIMER=y
CONFIG_DIGICOLOR_TIMER=y
CONFIG_DW_APB_TIMER=y
# CONFIG_FTTMR010_TIMER is not set
CONFIG_IXP4XX_TIMER=y
# CONFIG_MESON6_TIMER is not set
# CONFIG_OWL_TIMER is not set
CONFIG_RDA_TIMER=y
CONFIG_SUN4I_TIMER=y
# CONFIG_SUN5I_HSTIMER is not set
# CONFIG_TEGRA_TIMER is not set
CONFIG_VT8500_TIMER=y
CONFIG_NPCM7XX_TIMER=y
CONFIG_CADENCE_TTC_TIMER=y
CONFIG_ASM9260_TIMER=y
CONFIG_CLKSRC_DBX500_PRCMU=y
CONFIG_CLPS711X_TIMER=y
# CONFIG_MXS_TIMER is not set
CONFIG_NSPIRE_TIMER=y
# CONFIG_INTEGRATOR_AP_TIMER is not set
# CONFIG_CLKSRC_PISTACHIO is not set
# CONFIG_CLKSRC_STM32_LP is not set
# CONFIG_ARMV7M_SYSTICK is not set
# CONFIG_ATMEL_PIT is not set
CONFIG_ATMEL_ST=y
# CONFIG_CLKSRC_SAMSUNG_PWM is not set
# CONFIG_FSL_FTM_TIMER is not set
# CONFIG_OXNAS_RPS_TIMER is not set
CONFIG_MTK_TIMER=y
CONFIG_SH_TIMER_CMT=y
# CONFIG_SH_TIMER_MTU2 is not set
# CONFIG_RENESAS_OSTM is not set
CONFIG_SH_TIMER_TMU=y
# CONFIG_EM_TIMER_STI is not set
# CONFIG_CLKSRC_PXA is not set
# CONFIG_H8300_TMR8 is not set
# CONFIG_H8300_TMR16 is not set
# CONFIG_H8300_TPU is not set
# CONFIG_TIMER_IMX_SYS_CTR is not set
CONFIG_CLKSRC_ST_LPC=y
# CONFIG_ATCPIT100_TIMER is not set
CONFIG_INGENIC_TIMER=y
# CONFIG_INGENIC_SYSOST is not set
# CONFIG_INGENIC_OST is not set
# CONFIG_MICROCHIP_PIT64B is not set
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_IMX_MBOX=m
CONFIG_ROCKCHIP_MBOX=y
CONFIG_ALTERA_MBOX=m
# CONFIG_POLARFIRE_SOC_MAILBOX is not set
# CONFIG_QCOM_APCS_IPC is not set
CONFIG_BCM_PDC_MBOX=y
CONFIG_STM32_IPCC=y
CONFIG_MTK_CMDQ_MBOX=y
CONFIG_SUN6I_MSGBOX=y
CONFIG_SPRD_MBOX=m
CONFIG_QCOM_IPCC=y
CONFIG_IOMMU_IOVA=m
CONFIG_IOMMU_API=y
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
# CONFIG_RPMSG_CHAR is not set
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_QCOM_GLINK=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
CONFIG_RPMSG_QCOM_GLINK_SMEM=m
# CONFIG_RPMSG_QCOM_SMD is not set
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

#
# SOC (System On Chip) specific Drivers
#
# CONFIG_OWL_PM_DOMAINS is not set

#
# Amlogic SoC drivers
#
CONFIG_MESON_CANVAS=y
CONFIG_MESON_CLK_MEASURE=m
CONFIG_MESON_GX_SOCINFO=y
# CONFIG_MESON_MX_SOCINFO is not set
# end of Amlogic SoC drivers

#
# ASPEED SoC drivers
#
CONFIG_ASPEED_LPC_CTRL=y
# CONFIG_ASPEED_LPC_SNOOP is not set
# CONFIG_ASPEED_P2A_CTRL is not set
CONFIG_ASPEED_SOCINFO=y
# end of ASPEED SoC drivers

# CONFIG_AT91_SOC_ID is not set
CONFIG_AT91_SOC_SFR=m

#
# Broadcom SoC drivers
#
# CONFIG_SOC_BCM63XX is not set
# CONFIG_SOC_BRCMSTB is not set
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
CONFIG_FSL_GUTS=y
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
# CONFIG_SOC_IMX8M is not set
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
# CONFIG_IXP4XX_QMGR is not set
CONFIG_IXP4XX_NPE=m
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# CONFIG_LITEX_SOC_CONTROLLER is not set
# end of Enable LiteX SoC Builder specific drivers

#
# MediaTek SoC drivers
#
CONFIG_MTK_CMDQ=y
CONFIG_MTK_DEVAPC=m
CONFIG_MTK_INFRACFG=y
# CONFIG_MTK_PMIC_WRAP is not set
# CONFIG_MTK_SCPSYS is not set
# CONFIG_MTK_SCPSYS_PM_DOMAINS is not set
# CONFIG_MTK_MMSYS is not set
# end of MediaTek SoC drivers

#
# Qualcomm SoC drivers
#
CONFIG_QCOM_AOSS_QMP=m
CONFIG_QCOM_GENI_SE=y
# CONFIG_QCOM_GSBI is not set
# CONFIG_QCOM_LLCC is not set
CONFIG_QCOM_RPMH=m
CONFIG_QCOM_SMEM=m
# CONFIG_QCOM_SMD_RPM is not set
CONFIG_QCOM_SMEM_STATE=y
CONFIG_QCOM_SMP2P=m
CONFIG_QCOM_SMSM=m
# CONFIG_QCOM_SOCINFO is not set
CONFIG_QCOM_WCNSS_CTRL=m
# CONFIG_QCOM_APR is not set
# end of Qualcomm SoC drivers

# CONFIG_SOC_RENESAS is not set
# CONFIG_ROCKCHIP_GRF is not set
CONFIG_ROCKCHIP_PM_DOMAINS=y
# CONFIG_SOC_SAMSUNG is not set
# CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER is not set
# CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER is not set
# CONFIG_SOC_TI is not set
CONFIG_UX500_SOC_ID=y

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=m
CONFIG_DEVFREQ_GOV_PERFORMANCE=y
CONFIG_DEVFREQ_GOV_POWERSAVE=m
# CONFIG_DEVFREQ_GOV_USERSPACE is not set
# CONFIG_DEVFREQ_GOV_PASSIVE is not set

#
# DEVFREQ Drivers
#
# CONFIG_ARM_EXYNOS_BUS_DEVFREQ is not set
# CONFIG_ARM_IMX_BUS_DEVFREQ is not set
CONFIG_ARM_TEGRA_DEVFREQ=m
CONFIG_PM_DEVFREQ_EVENT=y
# CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP is not set
CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU=y
CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI=y
# CONFIG_EXTCON is not set
CONFIG_MEMORY=y
CONFIG_DDR=y
CONFIG_BRCMSTB_DPFE=y
CONFIG_BT1_L2_CTL=y
CONFIG_TI_EMIF=m
CONFIG_FSL_CORENET_CF=m
CONFIG_FSL_IFC=y
# CONFIG_MTK_SMI is not set
CONFIG_DA8XX_DDRCTL=y
CONFIG_RENESAS_RPCIF=y
CONFIG_STM32_FMC2_EBI=m
# CONFIG_SAMSUNG_MC is not set
# CONFIG_TEGRA_MC is not set
CONFIG_IIO=m
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=m
CONFIG_IIO_BUFFER_DMA=m
CONFIG_IIO_BUFFER_DMAENGINE=m
# CONFIG_IIO_BUFFER_HW_CONSUMER is not set
CONFIG_IIO_KFIFO_BUF=m
CONFIG_IIO_TRIGGERED_BUFFER=m
CONFIG_IIO_CONFIGFS=m
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=m
CONFIG_IIO_SW_TRIGGER=m
# CONFIG_IIO_TRIGGERED_EVENT is not set

#
# Accelerometers
#
CONFIG_ADXL345=m
CONFIG_ADXL345_I2C=m
# CONFIG_ADXL372_I2C is not set
CONFIG_BMA180=m
CONFIG_BMA400=m
CONFIG_BMA400_I2C=m
# CONFIG_BMC150_ACCEL is not set
# CONFIG_DA280 is not set
CONFIG_DA311=m
CONFIG_DMARD06=m
CONFIG_DMARD09=m
CONFIG_DMARD10=m
CONFIG_FXLS8962AF=m
CONFIG_FXLS8962AF_I2C=m
CONFIG_IIO_ST_ACCEL_3AXIS=m
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=m
CONFIG_KXSD9=m
CONFIG_KXSD9_I2C=m
# CONFIG_KXCJK1013 is not set
CONFIG_MC3230=m
# CONFIG_MMA7455_I2C is not set
CONFIG_MMA7660=m
CONFIG_MMA8452=m
CONFIG_MMA9551_CORE=m
CONFIG_MMA9551=m
# CONFIG_MMA9553 is not set
CONFIG_MXC4005=m
# CONFIG_MXC6255 is not set
CONFIG_STK8312=m
# CONFIG_STK8BA50 is not set
# end of Accelerometers

#
# Analog to digital converters
#
# CONFIG_AD7091R5 is not set
CONFIG_AD7291=m
# CONFIG_AD7606_IFACE_PARALLEL is not set
CONFIG_AD799X=m
# CONFIG_ASPEED_ADC is not set
# CONFIG_AT91_SAMA5D2_ADC is not set
CONFIG_AXP20X_ADC=m
# CONFIG_AXP288_ADC is not set
CONFIG_BCM_IPROC_ADC=m
CONFIG_CC10001_ADC=m
# CONFIG_DA9150_GPADC is not set
# CONFIG_HX711 is not set
CONFIG_INA2XX_ADC=m
CONFIG_INGENIC_ADC=m
# CONFIG_IMX7D_ADC is not set
CONFIG_LPC32XX_ADC=m
CONFIG_LTC2471=m
# CONFIG_LTC2485 is not set
CONFIG_LTC2497=m
CONFIG_MAX1363=m
CONFIG_MAX9611=m
CONFIG_MCP3422=m
CONFIG_MEDIATEK_MT6360_ADC=m
CONFIG_MEDIATEK_MT6577_AUXADC=m
CONFIG_MEN_Z188_ADC=m
CONFIG_NAU7802=m
CONFIG_NPCM_ADC=m
CONFIG_QCOM_VADC_COMMON=m
# CONFIG_QCOM_SPMI_IADC is not set
CONFIG_QCOM_SPMI_VADC=m
CONFIG_QCOM_SPMI_ADC5=m
# CONFIG_RCAR_GYRO_ADC is not set
CONFIG_ROCKCHIP_SARADC=m
# CONFIG_RZG2L_ADC is not set
# CONFIG_SC27XX_ADC is not set
CONFIG_SPEAR_ADC=m
CONFIG_STM32_DFSDM_CORE=m
# CONFIG_STM32_DFSDM_ADC is not set
# CONFIG_SUN4I_GPADC is not set
CONFIG_TI_ADC081C=m
# CONFIG_TI_ADS1015 is not set
CONFIG_TI_AM335X_ADC=m
# CONFIG_XILINX_XADC is not set
# end of Analog to digital converters

#
# Analog Front Ends
#
# CONFIG_IIO_RESCALE is not set
# end of Analog Front Ends

#
# Amplifiers
#
CONFIG_HMC425=m
# end of Amplifiers

#
# Capacitance to digital converters
#
CONFIG_AD7150=m
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=m
# CONFIG_ATLAS_EZO_SENSOR is not set
CONFIG_BME680=m
CONFIG_BME680_I2C=m
# CONFIG_CCS811 is not set
# CONFIG_IAQCORE is not set
CONFIG_PMS7003=m
# CONFIG_SCD30_CORE is not set
CONFIG_SENSIRION_SGP30=m
# CONFIG_SENSIRION_SGP40 is not set
CONFIG_SPS30=m
CONFIG_SPS30_I2C=m
CONFIG_SPS30_SERIAL=m
CONFIG_VZ89X=m
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=m

#
# IIO SCMI Sensors
#
CONFIG_IIO_SCMI=m
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=m
CONFIG_IIO_ST_SENSORS_CORE=m

#
# Digital to analog converters
#
CONFIG_AD5064=m
CONFIG_AD5380=m
# CONFIG_AD5446 is not set
# CONFIG_AD5593R is not set
CONFIG_AD5686=m
CONFIG_AD5696_I2C=m
# CONFIG_DS4424 is not set
CONFIG_M62332=m
CONFIG_MAX517=m
CONFIG_MCP4725=m
CONFIG_STM32_DAC=m
CONFIG_STM32_DAC_CORE=m
CONFIG_TI_DAC5571=m
# end of Digital to analog converters

#
# IIO dummy driver
#
# CONFIG_IIO_SIMPLE_DUMMY is not set
# end of IIO dummy driver

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# CONFIG_BMG160 is not set
CONFIG_FXAS21002C=m
CONFIG_FXAS21002C_I2C=m
CONFIG_MPU3050=m
CONFIG_MPU3050_I2C=m
# CONFIG_IIO_ST_GYRO_3AXIS is not set
CONFIG_ITG3200=m
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4404=m
CONFIG_MAX30100=m
# CONFIG_MAX30102 is not set
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_AM2315=m
CONFIG_DHT11=m
# CONFIG_HDC100X is not set
CONFIG_HDC2010=m
CONFIG_HTS221=m
CONFIG_HTS221_I2C=m
CONFIG_HTU21=m
CONFIG_SI7005=m
CONFIG_SI7020=m
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_BMI160=m
CONFIG_BMI160_I2C=m
CONFIG_FXOS8700=m
CONFIG_FXOS8700_I2C=m
# CONFIG_KMX61 is not set
# CONFIG_INV_ICM42600_I2C is not set
CONFIG_INV_MPU6050_IIO=m
CONFIG_INV_MPU6050_I2C=m
CONFIG_IIO_ST_LSM6DSX=m
CONFIG_IIO_ST_LSM6DSX_I2C=m
CONFIG_IIO_ST_LSM6DSX_I3C=m
CONFIG_IIO_ST_LSM9DS0=m
CONFIG_IIO_ST_LSM9DS0_I2C=m
# end of Inertial measurement units

#
# Light sensors
#
CONFIG_ADJD_S311=m
CONFIG_ADUX1020=m
CONFIG_AL3010=m
CONFIG_AL3320A=m
CONFIG_APDS9300=m
# CONFIG_APDS9960 is not set
# CONFIG_AS73211 is not set
CONFIG_BH1750=m
CONFIG_BH1780=m
CONFIG_CM32181=m
# CONFIG_CM3232 is not set
CONFIG_CM3323=m
CONFIG_CM36651=m
# CONFIG_GP2AP002 is not set
# CONFIG_GP2AP020A00F is not set
CONFIG_IQS621_ALS=m
CONFIG_SENSORS_ISL29018=m
CONFIG_SENSORS_ISL29028=m
# CONFIG_ISL29125 is not set
CONFIG_JSA1212=m
CONFIG_RPR0521=m
CONFIG_SENSORS_LM3533=m
CONFIG_LTR501=m
CONFIG_LV0104CS=m
CONFIG_MAX44000=m
# CONFIG_MAX44009 is not set
CONFIG_NOA1305=m
# CONFIG_OPT3001 is not set
# CONFIG_PA12203001 is not set
CONFIG_SI1133=m
CONFIG_SI1145=m
# CONFIG_STK3310 is not set
# CONFIG_ST_UVIS25 is not set
CONFIG_TCS3414=m
# CONFIG_TCS3472 is not set
CONFIG_SENSORS_TSL2563=m
CONFIG_TSL2583=m
CONFIG_TSL2591=m
CONFIG_TSL2772=m
CONFIG_TSL4531=m
CONFIG_US5182D=m
# CONFIG_VCNL4000 is not set
CONFIG_VCNL4035=m
# CONFIG_VEML6030 is not set
CONFIG_VEML6070=m
CONFIG_VL6180=m
CONFIG_ZOPT2201=m
# end of Light sensors

#
# Magnetometer sensors
#
CONFIG_AK8975=m
# CONFIG_AK09911 is not set
# CONFIG_BMC150_MAGN_I2C is not set
# CONFIG_MAG3110 is not set
# CONFIG_MMC35240 is not set
CONFIG_IIO_ST_MAGN_3AXIS=m
CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
CONFIG_SENSORS_HMC5843=m
CONFIG_SENSORS_HMC5843_I2C=m
CONFIG_SENSORS_RM3100=m
CONFIG_SENSORS_RM3100_I2C=m
CONFIG_YAMAHA_YAS530=m
# end of Magnetometer sensors

#
# Multiplexers
#
CONFIG_IIO_MUX=m
# end of Multiplexers

#
# Inclinometer sensors
#
# end of Inclinometer sensors

# CONFIG_IIO_TEST_FORMAT is not set

#
# Triggers - standalone
#
CONFIG_IIO_HRTIMER_TRIGGER=m
CONFIG_IIO_INTERRUPT_TRIGGER=m
CONFIG_IIO_STM32_LPTIMER_TRIGGER=m
# CONFIG_IIO_STM32_TIMER_TRIGGER is not set
CONFIG_IIO_TIGHTLOOP_TRIGGER=m
# CONFIG_IIO_SYSFS_TRIGGER is not set
# end of Triggers - standalone

#
# Linear and angular position sensors
#
CONFIG_IQS624_POS=m
# end of Linear and angular position sensors

#
# Digital potentiometers
#
CONFIG_AD5110=m
# CONFIG_AD5272 is not set
CONFIG_DS1803=m
CONFIG_MAX5432=m
# CONFIG_MCP4018 is not set
# CONFIG_MCP4531 is not set
# CONFIG_TPL0102 is not set
# end of Digital potentiometers

#
# Digital potentiostats
#
# CONFIG_LMP91000 is not set
# end of Digital potentiostats

#
# Pressure sensors
#
# CONFIG_ABP060MG is not set
CONFIG_BMP280=m
CONFIG_BMP280_I2C=m
CONFIG_DLHL60D=m
CONFIG_DPS310=m
CONFIG_HP03=m
CONFIG_ICP10100=m
CONFIG_MPL115=m
CONFIG_MPL115_I2C=m
CONFIG_MPL3115=m
# CONFIG_MS5611 is not set
CONFIG_MS5637=m
CONFIG_IIO_ST_PRESS=m
CONFIG_IIO_ST_PRESS_I2C=m
# CONFIG_T5403 is not set
CONFIG_HP206C=m
CONFIG_ZPA2326=m
CONFIG_ZPA2326_I2C=m
# end of Pressure sensors

#
# Lightning sensors
#
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_CROS_EC_MKBP_PROXIMITY=m
CONFIG_ISL29501=m
CONFIG_LIDAR_LITE_V2=m
CONFIG_MB1232=m
CONFIG_PING=m
# CONFIG_RFD77402 is not set
# CONFIG_SRF04 is not set
# CONFIG_SX9310 is not set
# CONFIG_SX9500 is not set
CONFIG_SRF08=m
CONFIG_VCNL3020=m
# CONFIG_VL53L0X_I2C is not set
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# end of Resolver to digital converters

#
# Temperature sensors
#
# CONFIG_IQS620AT_TEMP is not set
CONFIG_MLX90614=m
CONFIG_MLX90632=m
CONFIG_TMP006=m
CONFIG_TMP007=m
# CONFIG_TMP117 is not set
CONFIG_TSYS01=m
CONFIG_TSYS02D=m
# end of Temperature sensors

CONFIG_NTB=y
CONFIG_NTB_AMD=y
CONFIG_NTB_IDT=m
CONFIG_NTB_INTEL=m
CONFIG_NTB_EPF=m
CONFIG_NTB_SWITCHTEC=y
# CONFIG_NTB_PINGPONG is not set
CONFIG_NTB_TOOL=m
# CONFIG_NTB_PERF is not set
CONFIG_NTB_TRANSPORT=y
# CONFIG_VME_BUS is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
CONFIG_PWM_BCM_IPROC=y
CONFIG_PWM_BCM_KONA=m
CONFIG_PWM_BCM2835=y
CONFIG_PWM_BERLIN=m
CONFIG_PWM_BRCMSTB=m
# CONFIG_PWM_CLPS711X is not set
# CONFIG_PWM_CROS_EC is not set
CONFIG_PWM_DWC=y
CONFIG_PWM_EP93XX=m
CONFIG_PWM_HIBVT=m
CONFIG_PWM_IMG=y
CONFIG_PWM_IMX1=m
# CONFIG_PWM_IMX27 is not set
# CONFIG_PWM_IMX_TPM is not set
CONFIG_PWM_INTEL_LGM=m
CONFIG_PWM_IQS620A=y
# CONFIG_PWM_JZ4740 is not set
CONFIG_PWM_KEEMBAY=m
CONFIG_PWM_LP3943=m
CONFIG_PWM_LPC18XX_SCT=y
CONFIG_PWM_LPC32XX=m
CONFIG_PWM_LPSS=m
CONFIG_PWM_LPSS_PCI=m
CONFIG_PWM_LPSS_PLATFORM=m
# CONFIG_PWM_MESON is not set
CONFIG_PWM_MTK_DISP=m
# CONFIG_PWM_MEDIATEK is not set
# CONFIG_PWM_NTXEC is not set
CONFIG_PWM_PCA9685=m
CONFIG_PWM_PXA=m
CONFIG_PWM_RASPBERRYPI_POE=y
CONFIG_PWM_RCAR=m
CONFIG_PWM_RENESAS_TPU=m
# CONFIG_PWM_ROCKCHIP is not set
CONFIG_PWM_SAMSUNG=y
CONFIG_PWM_SL28CPLD=y
CONFIG_PWM_SPRD=y
# CONFIG_PWM_STM32 is not set
CONFIG_PWM_STM32_LP=y
CONFIG_PWM_SUN4I=m
# CONFIG_PWM_TEGRA is not set
CONFIG_PWM_TIECAP=y
# CONFIG_PWM_TIEHRPWM is not set
# CONFIG_PWM_VISCONTI is not set
# CONFIG_PWM_VT8500 is not set

#
# IRQ chip support
#
# CONFIG_AL_FIC is not set
CONFIG_MADERA_IRQ=m
# CONFIG_RENESAS_INTC_IRQPIN is not set
# CONFIG_RENESAS_IRQC is not set
# CONFIG_RENESAS_RZA1_IRQC is not set
CONFIG_SL28CPLD_INTC=y
# CONFIG_TS4800_IRQ is not set
# CONFIG_INGENIC_TCU_IRQ is not set
# CONFIG_RENESAS_H8S_INTC is not set
CONFIG_IRQ_UNIPHIER_AIDET=y
CONFIG_IMX_IRQSTEER=y
# CONFIG_IMX_INTMUX is not set
# CONFIG_EXYNOS_IRQ_COMBINER is not set
# CONFIG_LOONGSON_PCH_PIC is not set
# CONFIG_LOONGSON_PCH_MSI is not set
# CONFIG_MST_IRQ is not set
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_ATH79=y
# CONFIG_RESET_AXS10X is not set
CONFIG_RESET_BCM6345=y
CONFIG_RESET_BERLIN=y
# CONFIG_RESET_BRCMSTB is not set
# CONFIG_RESET_BRCMSTB_RESCAL is not set
CONFIG_RESET_HSDK=y
CONFIG_RESET_IMX7=m
CONFIG_RESET_LANTIQ=y
# CONFIG_RESET_LPC18XX is not set
# CONFIG_RESET_MCHP_SPARX5 is not set
# CONFIG_RESET_MESON is not set
# CONFIG_RESET_MESON_AUDIO_ARB is not set
CONFIG_RESET_NPCM=y
# CONFIG_RESET_PISTACHIO is not set
CONFIG_RESET_QCOM_AOSS=m
# CONFIG_RESET_QCOM_PDC is not set
CONFIG_RESET_RASPBERRYPI=y
CONFIG_RESET_RZG2L_USBPHY_CTRL=m
CONFIG_RESET_SCMI=m
CONFIG_RESET_SIMPLE=y
# CONFIG_RESET_SOCFPGA is not set
CONFIG_RESET_SUNXI=y
CONFIG_RESET_TI_SYSCON=y
CONFIG_RESET_ZYNQ=y
# CONFIG_COMMON_RESET_HI3660 is not set
CONFIG_COMMON_RESET_HI6220=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
# CONFIG_PHY_PISTACHIO_USB is not set
CONFIG_PHY_CAN_TRANSCEIVER=m
CONFIG_PHY_SUN6I_MIPI_DPHY=y
CONFIG_PHY_BCM63XX_USBH=m
# CONFIG_BCM_KONA_USB2_PHY is not set
CONFIG_PHY_HI6220_USB=m
CONFIG_PHY_HI3660_USB=m
CONFIG_PHY_HI3670_USB=m
CONFIG_PHY_HISTB_COMBPHY=m
# CONFIG_PHY_HISI_INNO_USB2 is not set
CONFIG_PHY_PXA_28NM_HSIC=y
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_PXA_USB is not set
CONFIG_PHY_MMP3_USB=m
CONFIG_PHY_MMP3_HSIC=m
CONFIG_PHY_MT7621_PCI=y
CONFIG_PHY_RALINK_USB=y
CONFIG_PHY_RCAR_GEN3_USB3=m
# CONFIG_PHY_ROCKCHIP_DPHY_RX0 is not set
CONFIG_PHY_ROCKCHIP_PCIE=m
CONFIG_PHY_EXYNOS_MIPI_VIDEO=y
CONFIG_PHY_SAMSUNG_USB2=m
# CONFIG_PHY_S5PV210_USB2 is not set
CONFIG_PHY_ST_SPEAR1310_MIPHY=m
CONFIG_PHY_ST_SPEAR1340_MIPHY=m
CONFIG_PHY_STIH407_USB=y
CONFIG_PHY_STM32_USBPHYC=m
CONFIG_PHY_TEGRA194_P2U=m
# CONFIG_PHY_DA8XX_USB is not set
# CONFIG_PHY_AM654_SERDES is not set
CONFIG_OMAP_CONTROL_PHY=y
CONFIG_TI_PIPE3=m
# CONFIG_PHY_INTEL_KEEMBAY_EMMC is not set
# CONFIG_PHY_INTEL_KEEMBAY_USB is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# CONFIG_PHY_XILINX_ZYNQMP is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL_CORE=m
CONFIG_INTEL_RAPL=m
CONFIG_IDLE_INJECT=y
# CONFIG_DTPM is not set
CONFIG_MCB=y
CONFIG_MCB_PCI=m
CONFIG_MCB_LPC=m

#
# Performance monitor support
#
CONFIG_ARM_CMN=m
CONFIG_ARM_DMC620_PMU=m
# end of Performance monitor support

CONFIG_RAS=y
CONFIG_USB4=y
CONFIG_USB4_DEBUGFS_WRITE=y
CONFIG_USB4_KUNIT_TEST=y
CONFIG_USB4_DMA_TEST=m

#
# Android
#
# CONFIG_ANDROID is not set
# end of Android

CONFIG_DAX=m
CONFIG_NVMEM=y
# CONFIG_NVMEM_SYSFS is not set
CONFIG_NVMEM_IMX_IIM=m
# CONFIG_NVMEM_IMX_OCOTP is not set
CONFIG_NVMEM_LPC18XX_EEPROM=y
# CONFIG_NVMEM_LPC18XX_OTP is not set
CONFIG_NVMEM_MXS_OCOTP=m
# CONFIG_MTK_EFUSE is not set
CONFIG_NVMEM_NINTENDO_OTP=y
# CONFIG_QCOM_QFPROM is not set
CONFIG_NVMEM_SPMI_SDAM=m
# CONFIG_ROCKCHIP_EFUSE is not set
# CONFIG_ROCKCHIP_OTP is not set
CONFIG_NVMEM_BCM_OCOTP=y
CONFIG_NVMEM_STM32_ROMEM=y
# CONFIG_UNIPHIER_EFUSE is not set
# CONFIG_NVMEM_VF610_OCOTP is not set
# CONFIG_MESON_MX_EFUSE is not set
CONFIG_NVMEM_SNVS_LPGPR=y
# CONFIG_SC27XX_EFUSE is not set
# CONFIG_SPRD_EFUSE is not set
CONFIG_NVMEM_RMEM=y
CONFIG_NVMEM_BRCM_NVRAM=y

#
# HW tracing support
#
CONFIG_STM=y
CONFIG_STM_PROTO_BASIC=y
# CONFIG_STM_PROTO_SYS_T is not set
# CONFIG_STM_DUMMY is not set
CONFIG_STM_SOURCE_CONSOLE=y
CONFIG_STM_SOURCE_HEARTBEAT=y
CONFIG_INTEL_TH=y
CONFIG_INTEL_TH_PCI=y
CONFIG_INTEL_TH_GTH=m
CONFIG_INTEL_TH_STH=y
CONFIG_INTEL_TH_MSU=y
CONFIG_INTEL_TH_PTI=y
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

# CONFIG_FPGA is not set
CONFIG_TEE=m

#
# TEE drivers
#
# end of TEE drivers

CONFIG_MULTIPLEXER=m

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=m
CONFIG_MUX_GPIO=m
CONFIG_MUX_MMIO=m
# end of Multiplexer drivers

CONFIG_PM_OPP=y
CONFIG_SIOX=m
CONFIG_SIOX_BUS_GPIO=m
CONFIG_SLIMBUS=y
# CONFIG_SLIM_QCOM_CTRL is not set
CONFIG_INTERCONNECT=y
# CONFIG_INTERCONNECT_IMX is not set
# CONFIG_INTERCONNECT_QCOM_OSM_L3 is not set
CONFIG_INTERCONNECT_SAMSUNG=y
CONFIG_INTERCONNECT_EXYNOS=y
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=y
# CONFIG_EXT2_FS_XATTR is not set
CONFIG_EXT3_FS=m
CONFIG_EXT3_FS_POSIX_ACL=y
CONFIG_EXT3_FS_SECURITY=y
CONFIG_EXT4_FS=m
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_EXT4_KUNIT_TESTS=m
CONFIG_JBD2=m
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=m
CONFIG_REISERFS_FS=y
CONFIG_REISERFS_CHECK=y
CONFIG_REISERFS_PROC_INFO=y
# CONFIG_REISERFS_FS_XATTR is not set
CONFIG_JFS_FS=m
CONFIG_JFS_POSIX_ACL=y
CONFIG_JFS_SECURITY=y
# CONFIG_JFS_DEBUG is not set
# CONFIG_JFS_STATISTICS is not set
CONFIG_XFS_FS=y
CONFIG_XFS_SUPPORT_V4=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
# CONFIG_XFS_RT is not set
CONFIG_XFS_ONLINE_SCRUB=y
# CONFIG_XFS_ONLINE_REPAIR is not set
# CONFIG_XFS_WARN is not set
# CONFIG_XFS_DEBUG is not set
CONFIG_GFS2_FS=m
# CONFIG_BTRFS_FS is not set
CONFIG_NILFS2_FS=m
CONFIG_F2FS_FS=m
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
# CONFIG_F2FS_FS_POSIX_ACL is not set
# CONFIG_F2FS_FS_SECURITY is not set
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
CONFIG_F2FS_FS_COMPRESSION=y
# CONFIG_F2FS_FS_LZO is not set
CONFIG_F2FS_FS_LZ4=y
# CONFIG_F2FS_FS_LZ4HC is not set
CONFIG_F2FS_FS_ZSTD=y
CONFIG_F2FS_IOSTAT=y
# CONFIG_FS_DAX is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
CONFIG_FS_VERITY=y
CONFIG_FS_VERITY_DEBUG=y
CONFIG_FS_VERITY_BUILTIN_SIGNATURES=y
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
# CONFIG_INOTIFY_USER is not set
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
# CONFIG_QUOTA_NETLINK_INTERFACE is not set
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=m
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
CONFIG_OVERLAY_FS_INDEX=y
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
CONFIG_OVERLAY_FS_METACOPY=y

#
# Caches
#
# CONFIG_FSCACHE is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
# CONFIG_UDF_FS is not set
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
# CONFIG_VFAT_FS is not set
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_KUNIT_TEST=m
# CONFIG_EXFAT_FS is not set
CONFIG_NTFS_FS=m
# CONFIG_NTFS_DEBUG is not set
# CONFIG_NTFS_RW is not set
CONFIG_NTFS3_FS=y
# CONFIG_NTFS3_64BIT_CLUSTER is not set
# CONFIG_NTFS3_LZX_XPRESS is not set
CONFIG_NTFS3_FS_POSIX_ACL=y
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
# CONFIG_PROC_VMCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_PROC_CPU_RESCTRL=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
# CONFIG_TMPFS_XATTR is not set
# CONFIG_TMPFS_INODE64 is not set
# CONFIG_HUGETLBFS is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
CONFIG_HFS_FS=y
CONFIG_HFSPLUS_FS=y
CONFIG_BEFS_FS=m
CONFIG_BEFS_DEBUG=y
CONFIG_BFS_FS=m
# CONFIG_EFS_FS is not set
CONFIG_JFFS2_FS=m
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_WRITEBUFFER=y
# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
# CONFIG_JFFS2_SUMMARY is not set
CONFIG_JFFS2_FS_XATTR=y
# CONFIG_JFFS2_FS_POSIX_ACL is not set
CONFIG_JFFS2_FS_SECURITY=y
# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_RTIME=y
CONFIG_CRAMFS=m
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_CRAMFS_MTD=y
# CONFIG_SQUASHFS is not set
CONFIG_VXFS_FS=y
# CONFIG_MINIX_FS is not set
CONFIG_OMFS_FS=m
# CONFIG_HPFS_FS is not set
CONFIG_QNX4FS_FS=m
# CONFIG_QNX6FS_FS is not set
CONFIG_ROMFS_FS=y
CONFIG_ROMFS_BACKED_BY_BLOCK=y
# CONFIG_ROMFS_BACKED_BY_MTD is not set
# CONFIG_ROMFS_BACKED_BY_BOTH is not set
CONFIG_ROMFS_ON_BLOCK=y
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
# CONFIG_PSTORE_DEFLATE_COMPRESS is not set
# CONFIG_PSTORE_LZO_COMPRESS is not set
CONFIG_PSTORE_LZ4_COMPRESS=m
CONFIG_PSTORE_LZ4HC_COMPRESS=y
CONFIG_PSTORE_842_COMPRESS=y
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
# CONFIG_PSTORE_LZ4_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT=y
# CONFIG_PSTORE_842_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_COMPRESS_DEFAULT="lz4hc"
# CONFIG_PSTORE_CONSOLE is not set
# CONFIG_PSTORE_PMSG is not set
CONFIG_PSTORE_RAM=m
CONFIG_PSTORE_ZONE=m
CONFIG_PSTORE_BLK=m
CONFIG_PSTORE_BLK_BLKDEV=""
CONFIG_PSTORE_BLK_KMSG_SIZE=64
CONFIG_PSTORE_BLK_MAX_REASON=2
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
CONFIG_EROFS_FS=m
# CONFIG_EROFS_FS_DEBUG is not set
CONFIG_EROFS_FS_XATTR=y
CONFIG_EROFS_FS_POSIX_ACL=y
# CONFIG_EROFS_FS_SECURITY is not set
# CONFIG_EROFS_FS_ZIP is not set
# CONFIG_NETWORK_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=m
# CONFIG_NLS_CODEPAGE_737 is not set
CONFIG_NLS_CODEPAGE_775=m
# CONFIG_NLS_CODEPAGE_850 is not set
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=y
# CONFIG_NLS_CODEPAGE_857 is not set
CONFIG_NLS_CODEPAGE_860=y
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=y
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=y
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=y
CONFIG_NLS_CODEPAGE_1251=y
# CONFIG_NLS_ASCII is not set
CONFIG_NLS_ISO8859_1=m
# CONFIG_NLS_ISO8859_2 is not set
# CONFIG_NLS_ISO8859_3 is not set
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=y
# CONFIG_NLS_ISO8859_13 is not set
CONFIG_NLS_ISO8859_14=m
# CONFIG_NLS_ISO8859_15 is not set
# CONFIG_NLS_KOI8_R is not set
# CONFIG_NLS_KOI8_U is not set
# CONFIG_NLS_MAC_ROMAN is not set
CONFIG_NLS_MAC_CELTIC=y
# CONFIG_NLS_MAC_CENTEURO is not set
# CONFIG_NLS_MAC_CROATIAN is not set
# CONFIG_NLS_MAC_CYRILLIC is not set
# CONFIG_NLS_MAC_GAELIC is not set
# CONFIG_NLS_MAC_GREEK is not set
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=y
# CONFIG_NLS_MAC_ROMANIAN is not set
# CONFIG_NLS_MAC_TURKISH is not set
CONFIG_NLS_UTF8=y
CONFIG_UNICODE=y
CONFIG_UNICODE_NORMALIZATION_SELFTEST=y
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
# CONFIG_PERSISTENT_KEYRINGS is not set
CONFIG_BIG_KEYS=y
CONFIG_TRUSTED_KEYS=m
CONFIG_ENCRYPTED_KEYS=y
CONFIG_KEY_DH_OPERATIONS=y
CONFIG_KEY_NOTIFICATIONS=y
CONFIG_SECURITY_DMESG_RESTRICT=y
# CONFIG_SECURITY is not set
# CONFIG_SECURITYFS is not set
# CONFIG_PAGE_TABLE_ISOLATION is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
# CONFIG_INIT_STACK_ALL_PATTERN is not set
CONFIG_INIT_STACK_ALL_ZERO=y
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
# end of Memory initialization
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_TEST=m
CONFIG_CRYPTO_SIMD=y
CONFIG_CRYPTO_ENGINE=y

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=m
CONFIG_CRYPTO_ECDSA=m
CONFIG_CRYPTO_ECRDSA=y
# CONFIG_CRYPTO_SM2 is not set
CONFIG_CRYPTO_CURVE25519=m
# CONFIG_CRYPTO_CURVE25519_X86 is not set

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=m
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_AEGIS128=m
CONFIG_CRYPTO_AEGIS128_AESNI_SSE2=y
# CONFIG_CRYPTO_SEQIV is not set
CONFIG_CRYPTO_ECHAINIV=y

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=y
CONFIG_CRYPTO_OFB=y
# CONFIG_CRYPTO_PCBC is not set
CONFIG_CRYPTO_XTS=y
# CONFIG_CRYPTO_KEYWRAP is not set
CONFIG_CRYPTO_NHPOLY1305=m
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
CONFIG_CRYPTO_ADIANTUM=m
CONFIG_CRYPTO_ESSIV=m

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=y
# CONFIG_CRYPTO_VMAC is not set

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32=y
# CONFIG_CRYPTO_CRC32_PCLMUL is not set
# CONFIG_CRYPTO_XXHASH is not set
CONFIG_CRYPTO_BLAKE2B=y
# CONFIG_CRYPTO_BLAKE2S is not set
# CONFIG_CRYPTO_BLAKE2S_X86 is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=y
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=m
# CONFIG_CRYPTO_MICHAEL_MIC is not set
# CONFIG_CRYPTO_RMD160 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA1_SSSE3=m
# CONFIG_CRYPTO_SHA256_SSSE3 is not set
CONFIG_CRYPTO_SHA512_SSSE3=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3=m
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_WP512=y
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=y

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_ANUBIS=m
CONFIG_CRYPTO_ARC4=y
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
# CONFIG_CRYPTO_BLOWFISH_X86_64 is not set
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAMELLIA_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST5_AVX_X86_64=y
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_DES3_EDE_X86_64=m
# CONFIG_CRYPTO_FCRYPT is not set
# CONFIG_CRYPTO_KHAZAD is not set
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CHACHA20_X86_64=y
CONFIG_CRYPTO_SEED=y
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=y
# CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64=y
# CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_TEA=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=y
CONFIG_CRYPTO_TWOFISH_X86_64=y
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=m
# CONFIG_CRYPTO_LZO is not set
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=y

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=y
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
CONFIG_CRYPTO_HASH_INFO=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=y
# CONFIG_CRYPTO_LIB_BLAKE2S is not set
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=m
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
CONFIG_CRYPTO_LIB_SHA256=y
CONFIG_CRYPTO_LIB_SM4=y
CONFIG_CRYPTO_HW=y
# CONFIG_CRYPTO_DEV_ALLWINNER is not set
# CONFIG_CRYPTO_DEV_PADLOCK is not set
CONFIG_CRYPTO_DEV_SL3516=y
# CONFIG_CRYPTO_DEV_SL3516_DEBUG is not set
CONFIG_CRYPTO_DEV_EXYNOS_RNG=m
CONFIG_CRYPTO_DEV_S5P=y
# CONFIG_CRYPTO_DEV_ATMEL_AUTHENC is not set
CONFIG_CRYPTO_DEV_ATMEL_AES=m
CONFIG_CRYPTO_DEV_ATMEL_TDES=m
CONFIG_CRYPTO_DEV_ATMEL_SHA=y
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
CONFIG_CRYPTO_DEV_CCP=y
CONFIG_CRYPTO_DEV_CCP_DD=y
# CONFIG_CRYPTO_DEV_SP_PSP is not set
CONFIG_CRYPTO_DEV_QAT=y
# CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
CONFIG_CRYPTO_DEV_QAT_C62X=y
CONFIG_CRYPTO_DEV_QAT_4XXX=m
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=m
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=m
CONFIG_CRYPTO_DEV_QAT_C62XVF=m
CONFIG_CRYPTO_DEV_CAVIUM_ZIP=y
CONFIG_CRYPTO_DEV_QCE=y
CONFIG_CRYPTO_DEV_QCE_SKCIPHER=y
CONFIG_CRYPTO_DEV_QCE_SHA=y
CONFIG_CRYPTO_DEV_QCE_AEAD=y
CONFIG_CRYPTO_DEV_QCE_ENABLE_ALL=y
# CONFIG_CRYPTO_DEV_QCE_ENABLE_SKCIPHER is not set
# CONFIG_CRYPTO_DEV_QCE_ENABLE_SHA is not set
# CONFIG_CRYPTO_DEV_QCE_ENABLE_AEAD is not set
CONFIG_CRYPTO_DEV_QCE_SW_MAX_LEN=512
CONFIG_CRYPTO_DEV_QCOM_RNG=m
# CONFIG_CRYPTO_DEV_IMGTEC_HASH is not set
CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
CONFIG_CRYPTO_DEV_VIRTIO=m
CONFIG_CRYPTO_DEV_SAFEXCEL=m
# CONFIG_CRYPTO_DEV_HISI_SEC is not set
CONFIG_CRYPTO_DEV_AMLOGIC_GXL=m
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG is not set
CONFIG_CRYPTO_DEV_SA2UL=y
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4=m
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4_ECB is not set
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4_CTS=y
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_HCU is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
# CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE is not set
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
CONFIG_PKCS7_MESSAGE_PARSER=y
CONFIG_PKCS7_TEST_KEY=m
CONFIG_SIGNED_PE_FILE_VERIFICATION=y

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
CONFIG_SECONDARY_TRUSTED_KEYRING=y
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
CONFIG_RAID6_PQ_BENCHMARK=y
CONFIG_LINEAR_RANGES=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_GENERIC_FIND_FIRST_BIT=y
CONFIG_CORDIC=m
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_STMP_DEVICE=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y
CONFIG_CRC_CCITT=m
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
CONFIG_CRC32_SELFTEST=m
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=y
# CONFIG_CRC7 is not set
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=m
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=m
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_REED_SOLOMON_ENC16=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=y
CONFIG_BCH_CONST_PARAMS=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
CONFIG_SWIOTLB=y
CONFIG_DMA_COHERENT_POOL=y
CONFIG_DMA_API_DEBUG=y
# CONFIG_DMA_API_DEBUG_SG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_IOMMU_HELPER=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=m
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=m
CONFIG_FONTS=y
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
# CONFIG_FONT_6x11 is not set
# CONFIG_FONT_7x14 is not set
CONFIG_FONT_PEARL_8x8=y
CONFIG_FONT_ACORN_8x8=y
CONFIG_FONT_MINI_4x6=y
# CONFIG_FONT_6x10 is not set
# CONFIG_FONT_10x18 is not set
# CONFIG_FONT_SUN8x16 is not set
CONFIG_FONT_SUN12x22=y
# CONFIG_FONT_TER16x32 is not set
CONFIG_FONT_6x8=y
CONFIG_SG_SPLIT=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACK_HASH_ORDER=20
CONFIG_SBITMAP=y
# CONFIG_PARMAN is not set
# CONFIG_OBJAGG is not set
# end of Library routines

CONFIG_ASN1_ENCODER=m

#
# Kernel hacking
#

#
# printk and dmesg options
#
# CONFIG_PRINTK_TIME is not set
CONFIG_PRINTK_CALLER=y
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

#
# Compile-time checks and compiler options
#
CONFIG_FRAME_WARN=8192
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_HEADERS_INSTALL is not set
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_STACK_VALIDATION=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
# CONFIG_MAGIC_SYSRQ is not set
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
CONFIG_DEBUG_FS_ALLOW_NONE=y
CONFIG_HAVE_ARCH_KGDB=y
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
# CONFIG_UBSAN_BOUNDS is not set
# CONFIG_UBSAN_SHIFT is not set
# CONFIG_UBSAN_DIV_ZERO is not set
CONFIG_UBSAN_BOOL=y
# CONFIG_UBSAN_ENUM is not set
CONFIG_UBSAN_SANITIZE_ALL=y
CONFIG_TEST_UBSAN=m
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

# CONFIG_DEBUG_KERNEL is not set

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
CONFIG_PAGE_POISONING=y
CONFIG_DEBUG_RODATA_TEST=y
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_SLUB_DEBUG_ON is not set
CONFIG_SLUB_STATS=y
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_KASAN_SW_TAGS=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
CONFIG_KASAN_OUTLINE=y
# CONFIG_KASAN_INLINE is not set
CONFIG_KASAN_VMALLOC=y
CONFIG_KASAN_KUNIT_TEST=y
# CONFIG_KASAN_MODULE_TEST is not set
CONFIG_HAVE_ARCH_KFENCE=y
CONFIG_KFENCE=y
CONFIG_KFENCE_SAMPLE_INTERVAL=100
CONFIG_KFENCE_NUM_OBJECTS=255
CONFIG_KFENCE_STRESS_TEST_FAULTS=0
# end of Memory Debugging

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
CONFIG_TEST_LOCKUP=m
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_WW_MUTEX_SELFTEST=m
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
CONFIG_WARN_ALL_UNSEEDED_RANDOM=y

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
CONFIG_BUG_ON_DATA_CORRUPTION=y
# end of Debug kernel data structures

#
# RCU Debugging
#
CONFIG_RCU_CPU_STALL_TIMEOUT=21
# end of RCU Debugging

CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
CONFIG_SAMPLES=y
# CONFIG_SAMPLE_AUXDISPLAY is not set
CONFIG_SAMPLE_KOBJECT=y
CONFIG_SAMPLE_KPROBES=m
# CONFIG_SAMPLE_KRETPROBES is not set
# CONFIG_SAMPLE_HW_BREAKPOINT is not set
CONFIG_SAMPLE_KFIFO=m
# CONFIG_SAMPLE_RPMSG_CLIENT is not set
# CONFIG_SAMPLE_CONFIGFS is not set
# CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB is not set
# CONFIG_SAMPLE_WATCHDOG is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y

#
# x86 Debugging
#
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
# CONFIG_EARLY_PRINTK_DBGP is not set
# CONFIG_EARLY_PRINTK_USB_XDBC is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
CONFIG_PUNIT_ATOM_DEBUG=m
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
CONFIG_KUNIT=y
CONFIG_KUNIT_DEBUGFS=y
CONFIG_KUNIT_TEST=y
CONFIG_KUNIT_EXAMPLE_TEST=y
CONFIG_KUNIT_ALL_TESTS=y
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_KCOV=y
# CONFIG_KCOV_ENABLE_COMPARISONS is not set
CONFIG_KCOV_INSTRUMENT_ALL=y
CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
CONFIG_RUNTIME_TESTING_MENU=y
CONFIG_LKDTM=y
CONFIG_TEST_LIST_SORT=y
CONFIG_TEST_MIN_HEAP=m
CONFIG_TEST_SORT=y
CONFIG_TEST_DIV64=m
CONFIG_REED_SOLOMON_TEST=m
# CONFIG_ATOMIC64_SELFTEST is not set
CONFIG_ASYNC_RAID6_TEST=m
# CONFIG_TEST_HEXDUMP is not set
CONFIG_STRING_SELFTEST=y
CONFIG_TEST_STRING_HELPERS=m
CONFIG_TEST_STRSCPY=m
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
CONFIG_TEST_SCANF=y
CONFIG_TEST_BITMAP=y
CONFIG_TEST_UUID=y
CONFIG_TEST_XARRAY=m
# CONFIG_TEST_OVERFLOW is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_HASH is not set
# CONFIG_TEST_IDA is not set
CONFIG_TEST_LKM=m
CONFIG_TEST_BITOPS=m
CONFIG_TEST_VMALLOC=m
# CONFIG_TEST_USER_COPY is not set
# CONFIG_TEST_BPF is not set
CONFIG_TEST_BLACKHOLE_DEV=m
CONFIG_FIND_BIT_BENCHMARK=y
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_SYSCTL is not set
CONFIG_BITFIELD_KUNIT=y
CONFIG_RESOURCE_KUNIT_TEST=y
CONFIG_SYSCTL_KUNIT_TEST=y
CONFIG_LIST_KUNIT_TEST=y
CONFIG_LINEAR_RANGES_TEST=m
CONFIG_CMDLINE_KUNIT_TEST=y
CONFIG_BITS_TEST=y
CONFIG_SLUB_KUNIT_TEST=y
CONFIG_RATIONAL_KUNIT_TEST=y
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_STACKINIT is not set
# CONFIG_TEST_MEMINIT is not set
CONFIG_TEST_FREE_PAGES=y
CONFIG_TEST_CLOCKSOURCE_WATCHDOG=m
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage

# CONFIG_WARN_MISSING_DOCUMENTS is not set
CONFIG_WARN_ABI_ERRORS=y
# end of Kernel hacking

--YCo9i469aO4if6+1--
