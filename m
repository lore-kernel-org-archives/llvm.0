Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58336ABC;
	Thu, 15 Dec 2022 22:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671144132; x=1702680132;
  h=date:from:cc:subject:message-id:mime-version;
  bh=FMAX9FkrOhvtOpB6uq+QiTIclo6wTPpyjo5o1VQ6HjQ=;
  b=iSWnjW4Kr3kdmc6LzdgXJeQfEcWBTb/mC29VPElumtleIsr2jbkh3U8F
   6+jon+vjQOpUqZqxi9AMurxlEynLwYxqJBW3ouPkOnJA92BGblkEd7TNc
   gGjRkvFxKKM/F+6N3IJdXqQ1KGHbZIadMMw1YaK0nHB/LDBvjBjnAM83Q
   O9gxgkyZFFXRP4Qa/fxbq5JhjvQb0WQidpKEBSDNpfFcU/9HBauUs8l1T
   tfdvuMUNt9dNUoVJnv5P7wzNcYJa7Gorsz8u+FWt/JNxW0PGDxOIiCt77
   8OaQUD8+yHE9ZLDN0g9yhcwEw7HHfWjDt5V1tZFcmLaeHrIcJB1ZEdsbe
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="298490434"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; 
   d="scan'208";a="298490434"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2022 14:42:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="651695553"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; 
   d="scan'208";a="651695553"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Dec 2022 14:42:08 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p5wvX-0006fy-27;
	Thu, 15 Dec 2022 22:42:07 +0000
Date: Fri, 16 Dec 2022 06:41:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH] reiserfs: avoid objtool warning after panic
Message-ID: <202212160630.kXQYD5AQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Q2pkyq/Ly02OquLo"
Content-Disposition: inline


--Q2pkyq/Ly02OquLo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20221215162759.3883282-1-arnd@kernel.org>
References: <20221215162759.3883282-1-arnd@kernel.org>
TO: Arnd Bergmann <arnd@kernel.org>
TO: reiserfs-devel@vger.kernel.org
CC: Arnd Bergmann <arnd@arndb.de>
CC: linux-kernel@vger.kernel.org

Hi Arnd,

I love your patch! Perhaps something to improve:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.1 next-20221215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/reiserfs-avoid-objtool-warning-after-panic/20221216-003104
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20221215162759.3883282-1-arnd%40kernel.org
patch subject: [PATCH] reiserfs: avoid objtool warning after panic
config: x86_64-randconfig-a014
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6717d6cf61015a15ca3b1a8623a5f3b2569312be
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Arnd-Bergmann/reiserfs-avoid-objtool-warning-after-panic/20221216-003104
        git checkout 6717d6cf61015a15ca3b1a8623a5f3b2569312be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/reiserfs/bitmap.o: warning: objtool: reiserfs_free_block+0x1bd: unreachable instruction
--
>> fs/reiserfs/do_balan.o: warning: objtool: make_empty_node+0x1cb: unreachable instruction
--
>> fs/reiserfs/namei.o: warning: objtool: search_by_entry_key+0xa2a: unreachable instruction
--
>> fs/reiserfs/inode.o: warning: objtool: reiserfs_get_block+0x18b1: unreachable instruction
--
>> fs/reiserfs/dir.o: warning: objtool: reiserfs_readdir_inode+0x1067: unreachable instruction
--
>> fs/reiserfs/fix_node.o: warning: objtool: fix_nodes+0x17eb: unreachable instruction
--
>> fs/reiserfs/super.o: warning: objtool: add_save_link+0x566: unreachable instruction
--
>> fs/reiserfs/objectid.o: warning: objtool: reiserfs_get_unused_objectid+0x3cd: unreachable instruction
--
>> fs/reiserfs/lbalance.o: warning: objtool: leaf_move_items+0xda3: unreachable instruction
--
>> fs/reiserfs/ibalance.o: warning: objtool: balance_internal+0x1cf2: unreachable instruction
--
>> fs/reiserfs/stree.o: warning: objtool: B_IS_IN_TREE+0xd6: unreachable instruction
..


objdump-func vmlinux.o fix_nodes:
0000 0000000000e11730 <fix_nodes>:
0000   e11730:	55                   	push   %rbp
0001   e11731:	48 89 e5             	mov    %rsp,%rbp
0004   e11734:	41 57                	push   %r15
0006   e11736:	41 56                	push   %r14
0008   e11738:	41 55                	push   %r13
000a   e1173a:	41 54                	push   %r12
000c   e1173c:	53                   	push   %rbx
000d   e1173d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
0011   e11741:	48 81 ec d0 01 00 00 	sub    $0x1d0,%rsp
0018   e11748:	48 89 8c 24 68 01 00 00 	mov    %rcx,0x168(%rsp)
0020   e11750:	48 89 94 24 60 01 00 00 	mov    %rdx,0x160(%rsp)
0028   e11758:	49 89 f6             	mov    %rsi,%r14
002b   e1175b:	48 89 bc 24 d8 00 00 00 	mov    %rdi,0xd8(%rsp)
0033   e11763:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
003c   e1176c:	48 89 84 24 c0 01 00 00 	mov    %rax,0x1c0(%rsp)
0044   e11774:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
004e   e1177e:	e8 00 00 00 00       	call   e11783 <fix_nodes+0x53>	e1177f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0053   e11783:	49 8d 5e 18          	lea    0x18(%r14),%rbx
0057   e11787:	48 89 d8             	mov    %rbx,%rax
005a   e1178a:	48 c1 e8 03          	shr    $0x3,%rax
005e   e1178e:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
0063   e11793:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0068   e11798:	74 08                	je     e117a2 <fix_nodes+0x72>
006a   e1179a:	48 89 df             	mov    %rbx,%rdi
006d   e1179d:	e8 00 00 00 00       	call   e117a2 <fix_nodes+0x72>	e1179e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0072   e117a2:	4c 89 74 24 08       	mov    %r14,0x8(%rsp)
0077   e117a7:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
007c   e117ac:	4c 8b 33             	mov    (%rbx),%r14
007f   e117af:	4c 89 f0             	mov    %r14,%rax
0082   e117b2:	48 c1 e8 03          	shr    $0x3,%rax
0086   e117b6:	42 8a 04 20          	mov    (%rax,%r12,1),%al
008a   e117ba:	84 c0                	test   %al,%al
008c   e117bc:	0f 85 29 98 00 00    	jne    e1afeb <fix_nodes+0x98bb>
0092   e117c2:	49 63 1e             	movslq (%r14),%rbx
0095   e117c5:	bf 08 00 00 00       	mov    $0x8,%edi
009a   e117ca:	89 de                	mov    %ebx,%esi
009c   e117cc:	e8 00 00 00 00       	call   e117d1 <fix_nodes+0xa1>	e117cd: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00a1   e117d1:	48 83 fb 07          	cmp    $0x7,%rbx
00a5   e117d5:	0f 87 e4 99 00 00    	ja     e1b1bf <fix_nodes+0x9a8f>
00ab   e117db:	e8 00 00 00 00       	call   e117e0 <fix_nodes+0xb0>	e117dc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00b0   e117e0:	48 c1 e3 04          	shl    $0x4,%rbx
00b4   e117e4:	4c 01 f3             	add    %r14,%rbx
00b7   e117e7:	48 83 c3 10          	add    $0x10,%rbx
00bb   e117eb:	48 89 d8             	mov    %rbx,%rax
00be   e117ee:	48 c1 e8 03          	shr    $0x3,%rax
00c2   e117f2:	42 8a 04 20          	mov    (%rax,%r12,1),%al
00c6   e117f6:	84 c0                	test   %al,%al
00c8   e117f8:	0f 85 0b 98 00 00    	jne    e1b009 <fix_nodes+0x98d9>
00ce   e117fe:	8b 03                	mov    (%rbx),%eax
00d0   e11800:	89 84 24 c0 00 00 00 	mov    %eax,0xc0(%rsp)
00d7   e11807:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
00dc   e1180c:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
00e1   e11811:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
00e6   e11816:	74 08                	je     e11820 <fix_nodes+0xf0>
00e8   e11818:	48 89 df             	mov    %rbx,%rdi
00eb   e1181b:	e8 00 00 00 00       	call   e11820 <fix_nodes+0xf0>	e1181c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00f0   e11820:	4c 8b 33             	mov    (%rbx),%r14
00f3   e11823:	4c 89 f0             	mov    %r14,%rax
00f6   e11826:	48 c1 e8 03          	shr    $0x3,%rax
00fa   e1182a:	42 8a 04 20          	mov    (%rax,%r12,1),%al
00fe   e1182e:	84 c0                	test   %al,%al
0100   e11830:	0f 85 f0 97 00 00    	jne    e1b026 <fix_nodes+0x98f6>
0106   e11836:	49 63 1e             	movslq (%r14),%rbx
0109   e11839:	bf 08 00 00 00       	mov    $0x8,%edi
010e   e1183e:	89 de                	mov    %ebx,%esi
0110   e11840:	e8 00 00 00 00       	call   e11845 <fix_nodes+0x115>	e11841: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0115   e11845:	48 83 fb 07          	cmp    $0x7,%rbx
0119   e11849:	0f 87 89 99 00 00    	ja     e1b1d8 <fix_nodes+0x9aa8>
011f   e1184f:	e8 00 00 00 00       	call   e11854 <fix_nodes+0x124>	e11850: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0124   e11854:	48 c1 e3 04          	shl    $0x4,%rbx
0128   e11858:	4c 01 f3             	add    %r14,%rbx
012b   e1185b:	48 83 c3 08          	add    $0x8,%rbx
012f   e1185f:	48 89 d8             	mov    %rbx,%rax
0132   e11862:	48 c1 e8 03          	shr    $0x3,%rax
0136   e11866:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
013b   e1186b:	74 08                	je     e11875 <fix_nodes+0x145>
013d   e1186d:	48 89 df             	mov    %rbx,%rdi
0140   e11870:	e8 00 00 00 00       	call   e11875 <fix_nodes+0x145>	e11871: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0145   e11875:	4c 8b 3b             	mov    (%rbx),%r15
0148   e11878:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
014d   e1187d:	4c 8d 70 08          	lea    0x8(%rax),%r14
0151   e11881:	4c 89 f0             	mov    %r14,%rax
0154   e11884:	48 c1 e8 03          	shr    $0x3,%rax
0158   e11888:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
015d   e1188d:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0162   e11892:	74 08                	je     e1189c <fix_nodes+0x16c>
0164   e11894:	4c 89 f7             	mov    %r14,%rdi
0167   e11897:	e8 00 00 00 00       	call   e1189c <fix_nodes+0x16c>	e11898: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
016c   e1189c:	bb d8 06 00 00       	mov    $0x6d8,%ebx
0171   e118a1:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
0176   e118a6:	49 03 1e             	add    (%r14),%rbx
0179   e118a9:	48 89 d8             	mov    %rbx,%rax
017c   e118ac:	48 c1 e8 03          	shr    $0x3,%rax
0180   e118b0:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0185   e118b5:	74 08                	je     e118bf <fix_nodes+0x18f>
0187   e118b7:	48 89 df             	mov    %rbx,%rdi
018a   e118ba:	e8 00 00 00 00       	call   e118bf <fix_nodes+0x18f>	e118bb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
018f   e118bf:	41 be 88 01 00 00    	mov    $0x188,%r14d
0195   e118c5:	4c 03 33             	add    (%rbx),%r14
0198   e118c8:	4c 89 f0             	mov    %r14,%rax
019b   e118cb:	48 c1 e8 03          	shr    $0x3,%rax
019f   e118cf:	42 8a 04 20          	mov    (%rax,%r12,1),%al
01a3   e118d3:	84 c0                	test   %al,%al
01a5   e118d5:	0f 85 69 97 00 00    	jne    e1b044 <fix_nodes+0x9914>
01ab   e118db:	41 83 06 01          	addl   $0x1,(%r14)
01af   e118df:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
01b4   e118e4:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
01b9   e118e9:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
01be   e118ee:	74 08                	je     e118f8 <fix_nodes+0x1c8>
01c0   e118f0:	48 89 df             	mov    %rbx,%rdi
01c3   e118f3:	e8 00 00 00 00       	call   e118f8 <fix_nodes+0x1c8>	e118f4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01c8   e118f8:	48 8b 1b             	mov    (%rbx),%rbx
01cb   e118fb:	48 83 c3 78          	add    $0x78,%rbx
01cf   e118ff:	48 89 d8             	mov    %rbx,%rax
01d2   e11902:	48 c1 e8 03          	shr    $0x3,%rax
01d6   e11906:	42 8a 04 20          	mov    (%rax,%r12,1),%al
01da   e1190a:	84 c0                	test   %al,%al
01dc   e1190c:	0f 85 50 97 00 00    	jne    e1b062 <fix_nodes+0x9932>
01e2   e11912:	8b 03                	mov    (%rbx),%eax
01e4   e11914:	89 84 24 4c 01 00 00 	mov    %eax,0x14c(%rsp)
01eb   e1191b:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
01f0   e11920:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
01f5   e11925:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
01fa   e1192a:	74 08                	je     e11934 <fix_nodes+0x204>
01fc   e1192c:	4c 89 f7             	mov    %r14,%rdi
01ff   e1192f:	e8 00 00 00 00       	call   e11934 <fix_nodes+0x204>	e11930: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0204   e11934:	bb d8 06 00 00       	mov    $0x6d8,%ebx
0209   e11939:	49 03 1e             	add    (%r14),%rbx
020c   e1193c:	48 89 d8             	mov    %rbx,%rax
020f   e1193f:	48 c1 e8 03          	shr    $0x3,%rax
0213   e11943:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0218   e11948:	74 08                	je     e11952 <fix_nodes+0x222>
021a   e1194a:	48 89 df             	mov    %rbx,%rdi
021d   e1194d:	e8 00 00 00 00       	call   e11952 <fix_nodes+0x222>	e1194e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0222   e11952:	41 be 70 01 00 00    	mov    $0x170,%r14d
0228   e11958:	4c 03 33             	add    (%rbx),%r14
022b   e1195b:	4c 89 f7             	mov    %r14,%rdi
022e   e1195e:	be 04 00 00 00       	mov    $0x4,%esi
0233   e11963:	e8 00 00 00 00       	call   e11968 <fix_nodes+0x238>	e11964: R_X86_64_PLT32	__kasan_check_read-0x4
0238   e11968:	4c 89 f0             	mov    %r14,%rax
023b   e1196b:	48 c1 e8 03          	shr    $0x3,%rax
023f   e1196f:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0243   e11973:	84 c0                	test   %al,%al
0245   e11975:	0f 85 04 97 00 00    	jne    e1b07f <fix_nodes+0x994f>
024b   e1197b:	41 8b 1e             	mov    (%r14),%ebx
024e   e1197e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0253   e11983:	48 8d 90 a8 02 00 00 	lea    0x2a8(%rax),%rdx
025a   e1198a:	48 89 d0             	mov    %rdx,%rax
025d   e1198d:	48 c1 e8 03          	shr    $0x3,%rax
0261   e11991:	48 89 84 24 e8 00 00 00 	mov    %rax,0xe8(%rsp)
0269   e11999:	42 8a 04 20          	mov    (%rax,%r12,1),%al
026d   e1199d:	84 c0                	test   %al,%al
026f   e1199f:	48 89 54 24 78       	mov    %rdx,0x78(%rsp)
0274   e119a4:	0f 85 f3 96 00 00    	jne    e1b09d <fix_nodes+0x996d>
027a   e119aa:	89 1a                	mov    %ebx,(%rdx)
027c   e119ac:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
0281   e119b1:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0286   e119b6:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
028b   e119bb:	74 08                	je     e119c5 <fix_nodes+0x295>
028d   e119bd:	48 89 df             	mov    %rbx,%rdi
0290   e119c0:	e8 00 00 00 00       	call   e119c5 <fix_nodes+0x295>	e119c1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0295   e119c5:	4c 8b 33             	mov    (%rbx),%r14
0298   e119c8:	49 8d 9e d8 06 00 00 	lea    0x6d8(%r14),%rbx
029f   e119cf:	48 89 d8             	mov    %rbx,%rax
02a2   e119d2:	48 c1 e8 03          	shr    $0x3,%rax
02a6   e119d6:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
02ab   e119db:	74 08                	je     e119e5 <fix_nodes+0x2b5>
02ad   e119dd:	48 89 df             	mov    %rbx,%rdi
02b0   e119e0:	e8 00 00 00 00       	call   e119e5 <fix_nodes+0x2b5>	e119e1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02b5   e119e5:	48 8b 1b             	mov    (%rbx),%rbx
02b8   e119e8:	48 89 d8             	mov    %rbx,%rax
02bb   e119eb:	48 c1 e8 03          	shr    $0x3,%rax
02bf   e119ef:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
02c4   e119f4:	74 08                	je     e119fe <fix_nodes+0x2ce>
02c6   e119f6:	48 89 df             	mov    %rbx,%rdi
02c9   e119f9:	e8 00 00 00 00       	call   e119fe <fix_nodes+0x2ce>	e119fa: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02ce   e119fe:	48 8b 33             	mov    (%rbx),%rsi
02d1   e11a01:	4c 89 f7             	mov    %r14,%rdi
02d4   e11a04:	ba 01 00 00 00       	mov    $0x1,%edx
02d9   e11a09:	e8 00 00 00 00       	call   e11a0e <fix_nodes+0x2de>	e11a0a: R_X86_64_PLT32	reiserfs_prepare_for_journal-0x4
02de   e11a0e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
02e3   e11a13:	48 8d 58 10          	lea    0x10(%rax),%rbx
02e7   e11a17:	48 89 d8             	mov    %rbx,%rax
02ea   e11a1a:	48 c1 e8 03          	shr    $0x3,%rax
02ee   e11a1e:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
02f3   e11a23:	74 08                	je     e11a2d <fix_nodes+0x2fd>
02f5   e11a25:	48 89 df             	mov    %rbx,%rdi
02f8   e11a28:	e8 00 00 00 00       	call   e11a2d <fix_nodes+0x2fd>	e11a29: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02fd   e11a2d:	4c 8b 33             	mov    (%rbx),%r14
0300   e11a30:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
0305   e11a35:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
030a   e11a3a:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
030f   e11a3f:	74 08                	je     e11a49 <fix_nodes+0x319>
0311   e11a41:	4c 89 ef             	mov    %r13,%rdi
0314   e11a44:	e8 00 00 00 00       	call   e11a49 <fix_nodes+0x319>	e11a45: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0319   e11a49:	bb d8 06 00 00       	mov    $0x6d8,%ebx
031e   e11a4e:	49 03 5d 00          	add    0x0(%r13),%rbx
0322   e11a52:	48 89 d8             	mov    %rbx,%rax
0325   e11a55:	48 c1 e8 03          	shr    $0x3,%rax
0329   e11a59:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
032e   e11a5e:	74 08                	je     e11a68 <fix_nodes+0x338>
0330   e11a60:	48 89 df             	mov    %rbx,%rdi
0333   e11a63:	e8 00 00 00 00       	call   e11a68 <fix_nodes+0x338>	e11a64: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0338   e11a68:	48 8b 1b             	mov    (%rbx),%rbx
033b   e11a6b:	48 89 d8             	mov    %rbx,%rax
033e   e11a6e:	48 c1 e8 03          	shr    $0x3,%rax
0342   e11a72:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0347   e11a77:	74 08                	je     e11a81 <fix_nodes+0x351>
0349   e11a79:	48 89 df             	mov    %rbx,%rdi
034c   e11a7c:	e8 00 00 00 00       	call   e11a81 <fix_nodes+0x351>	e11a7d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0351   e11a81:	48 8b 33             	mov    (%rbx),%rsi
0354   e11a84:	4c 89 f7             	mov    %r14,%rdi
0357   e11a87:	e8 00 00 00 00       	call   e11a8c <fix_nodes+0x35c>	e11a88: R_X86_64_PLT32	journal_mark_dirty-0x4
035c   e11a8c:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
0361   e11a91:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0366   e11a96:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
036b   e11a9b:	74 08                	je     e11aa5 <fix_nodes+0x375>
036d   e11a9d:	4c 89 f7             	mov    %r14,%rdi
0370   e11aa0:	e8 00 00 00 00       	call   e11aa5 <fix_nodes+0x375>	e11aa1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0375   e11aa5:	bb d8 06 00 00       	mov    $0x6d8,%ebx
037a   e11aaa:	49 03 1e             	add    (%r14),%rbx
037d   e11aad:	48 89 d8             	mov    %rbx,%rax
0380   e11ab0:	48 c1 e8 03          	shr    $0x3,%rax
0384   e11ab4:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0389   e11ab9:	74 08                	je     e11ac3 <fix_nodes+0x393>
038b   e11abb:	48 89 df             	mov    %rbx,%rdi
038e   e11abe:	e8 00 00 00 00       	call   e11ac3 <fix_nodes+0x393>	e11abf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0393   e11ac3:	41 be 70 01 00 00    	mov    $0x170,%r14d
0399   e11ac9:	4c 03 33             	add    (%rbx),%r14
039c   e11acc:	4c 89 f7             	mov    %r14,%rdi
039f   e11acf:	be 04 00 00 00       	mov    $0x4,%esi
03a4   e11ad4:	e8 00 00 00 00       	call   e11ad9 <fix_nodes+0x3a9>	e11ad5: R_X86_64_PLT32	__kasan_check_read-0x4
03a9   e11ad9:	4c 89 f0             	mov    %r14,%rax
03ac   e11adc:	48 c1 e8 03          	shr    $0x3,%rax
03b0   e11ae0:	42 8a 04 20          	mov    (%rax,%r12,1),%al
03b4   e11ae4:	84 c0                	test   %al,%al
03b6   e11ae6:	0f 85 d5 95 00 00    	jne    e1b0c1 <fix_nodes+0x9991>
03bc   e11aec:	45 8b 36             	mov    (%r14),%r14d
03bf   e11aef:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
03c7   e11af7:	42 8a 04 20          	mov    (%rax,%r12,1),%al
03cb   e11afb:	84 c0                	test   %al,%al
03cd   e11afd:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
03d2   e11b02:	0f 85 d7 95 00 00    	jne    e1b0df <fix_nodes+0x99af>
03d8   e11b08:	8b 1a                	mov    (%rdx),%ebx
03da   e11b0a:	44 89 f7             	mov    %r14d,%edi
03dd   e11b0d:	89 de                	mov    %ebx,%esi
03df   e11b0f:	e8 00 00 00 00       	call   e11b14 <fix_nodes+0x3e4>	e11b10: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
03e4   e11b14:	41 39 de             	cmp    %ebx,%r14d
03e7   e11b17:	75 44                	jne    e11b5d <fix_nodes+0x42d>
03e9   e11b19:	4c 89 ff             	mov    %r15,%rdi
03ec   e11b1c:	be 08 00 00 00       	mov    $0x8,%esi
03f1   e11b21:	e8 00 00 00 00       	call   e11b26 <fix_nodes+0x3f6>	e11b22: R_X86_64_PLT32	__kasan_check_read-0x4
03f6   e11b26:	4c 89 f8             	mov    %r15,%rax
03f9   e11b29:	48 c1 e8 03          	shr    $0x3,%rax
03fd   e11b2d:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0402   e11b32:	74 08                	je     e11b3c <fix_nodes+0x40c>
0404   e11b34:	4c 89 ff             	mov    %r15,%rdi
0407   e11b37:	e8 00 00 00 00       	call   e11b3c <fix_nodes+0x40c>	e11b38: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
040c   e11b3c:	49 8b 1f             	mov    (%r15),%rbx
040f   e11b3f:	48 89 de             	mov    %rbx,%rsi
0412   e11b42:	48 83 e6 04          	and    $0x4,%rsi
0416   e11b46:	31 ff                	xor    %edi,%edi
0418   e11b48:	e8 00 00 00 00       	call   e11b4d <fix_nodes+0x41d>	e11b49: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
041d   e11b4d:	48 83 e3 04          	and    $0x4,%rbx
0421   e11b51:	75 19                	jne    e11b6c <fix_nodes+0x43c>
0423   e11b53:	e8 00 00 00 00       	call   e11b58 <fix_nodes+0x428>	e11b54: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0428   e11b58:	e9 e9 00 00 00       	jmp    e11c46 <fix_nodes+0x516>
042d   e11b5d:	e8 00 00 00 00       	call   e11b62 <fix_nodes+0x432>	e11b5e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0432   e11b62:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
0437   e11b67:	e9 fa 8e 00 00       	jmp    e1aa66 <fix_nodes+0x9336>
043c   e11b6c:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
0441   e11b71:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0446   e11b76:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
044b   e11b7b:	74 08                	je     e11b85 <fix_nodes+0x455>
044d   e11b7d:	4c 89 f7             	mov    %r14,%rdi
0450   e11b80:	e8 00 00 00 00       	call   e11b85 <fix_nodes+0x455>	e11b81: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0455   e11b85:	49 8b 3e             	mov    (%r14),%rdi
0458   e11b88:	e8 00 00 00 00       	call   e11b8d <fix_nodes+0x45d>	e11b89: R_X86_64_PLT32	reiserfs_write_unlock_nested-0x4
045d   e11b8d:	89 c3                	mov    %eax,%ebx
045f   e11b8f:	4c 89 ff             	mov    %r15,%rdi
0462   e11b92:	e8 00 00 00 00       	call   e11b97 <fix_nodes+0x467>	e11b93: R_X86_64_PLT32	__wait_on_buffer-0x4
0467   e11b97:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
046c   e11b9c:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0471   e11ba1:	74 08                	je     e11bab <fix_nodes+0x47b>
0473   e11ba3:	4c 89 f7             	mov    %r14,%rdi
0476   e11ba6:	e8 00 00 00 00       	call   e11bab <fix_nodes+0x47b>	e11ba7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
047b   e11bab:	49 8b 3e             	mov    (%r14),%rdi
047e   e11bae:	89 de                	mov    %ebx,%esi
0480   e11bb0:	e8 00 00 00 00       	call   e11bb5 <fix_nodes+0x485>	e11bb1: R_X86_64_PLT32	reiserfs_write_lock_nested-0x4
0485   e11bb5:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
048a   e11bba:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
048f   e11bbf:	74 08                	je     e11bc9 <fix_nodes+0x499>
0491   e11bc1:	4c 89 f7             	mov    %r14,%rdi
0494   e11bc4:	e8 00 00 00 00       	call   e11bc9 <fix_nodes+0x499>	e11bc5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0499   e11bc9:	bb d8 06 00 00       	mov    $0x6d8,%ebx
049e   e11bce:	49 03 1e             	add    (%r14),%rbx
04a1   e11bd1:	48 89 d8             	mov    %rbx,%rax
04a4   e11bd4:	48 c1 e8 03          	shr    $0x3,%rax
04a8   e11bd8:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
04ad   e11bdd:	74 08                	je     e11be7 <fix_nodes+0x4b7>
04af   e11bdf:	48 89 df             	mov    %rbx,%rdi
04b2   e11be2:	e8 00 00 00 00       	call   e11be7 <fix_nodes+0x4b7>	e11be3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04b7   e11be7:	41 be 70 01 00 00    	mov    $0x170,%r14d
04bd   e11bed:	4c 03 33             	add    (%rbx),%r14
04c0   e11bf0:	4c 89 f7             	mov    %r14,%rdi
04c3   e11bf3:	be 04 00 00 00       	mov    $0x4,%esi
04c8   e11bf8:	e8 00 00 00 00       	call   e11bfd <fix_nodes+0x4cd>	e11bf9: R_X86_64_PLT32	__kasan_check_read-0x4
04cd   e11bfd:	4c 89 f0             	mov    %r14,%rax
04d0   e11c00:	48 c1 e8 03          	shr    $0x3,%rax
04d4   e11c04:	42 8a 04 20          	mov    (%rax,%r12,1),%al
04d8   e11c08:	84 c0                	test   %al,%al
04da   e11c0a:	0f 85 4b 95 00 00    	jne    e1b15b <fix_nodes+0x9a2b>
04e0   e11c10:	45 8b 36             	mov    (%r14),%r14d
04e3   e11c13:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
04eb   e11c1b:	42 8a 04 20          	mov    (%rax,%r12,1),%al
04ef   e11c1f:	84 c0                	test   %al,%al
04f1   e11c21:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
04f6   e11c26:	0f 85 4d 95 00 00    	jne    e1b179 <fix_nodes+0x9a49>
04fc   e11c2c:	8b 1a                	mov    (%rdx),%ebx
04fe   e11c2e:	44 89 f7             	mov    %r14d,%edi
0501   e11c31:	89 de                	mov    %ebx,%esi
0503   e11c33:	e8 00 00 00 00       	call   e11c38 <fix_nodes+0x508>	e11c34: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
0508   e11c38:	41 39 de             	cmp    %ebx,%r14d
050b   e11c3b:	0f 85 fc 00 00 00    	jne    e11d3d <fix_nodes+0x60d>
0511   e11c41:	e8 00 00 00 00       	call   e11c46 <fix_nodes+0x516>	e11c42: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0516   e11c46:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
051b   e11c4b:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0520   e11c50:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
0525   e11c55:	74 08                	je     e11c5f <fix_nodes+0x52f>
0527   e11c57:	48 89 df             	mov    %rbx,%rdi
052a   e11c5a:	e8 00 00 00 00       	call   e11c5f <fix_nodes+0x52f>	e11c5b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
052f   e11c5f:	41 be d8 06 00 00    	mov    $0x6d8,%r14d
0535   e11c65:	4c 03 33             	add    (%rbx),%r14
0538   e11c68:	4c 89 f0             	mov    %r14,%rax
053b   e11c6b:	48 c1 e8 03          	shr    $0x3,%rax
053f   e11c6f:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0544   e11c74:	74 08                	je     e11c7e <fix_nodes+0x54e>
0546   e11c76:	4c 89 f7             	mov    %r14,%rdi
0549   e11c79:	e8 00 00 00 00       	call   e11c7e <fix_nodes+0x54e>	e11c7a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
054e   e11c7e:	bb e0 06 00 00       	mov    $0x6e0,%ebx
0553   e11c83:	49 03 1e             	add    (%r14),%rbx
0556   e11c86:	48 89 d8             	mov    %rbx,%rax
0559   e11c89:	48 c1 e8 03          	shr    $0x3,%rax
055d   e11c8d:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0562   e11c92:	74 08                	je     e11c9c <fix_nodes+0x56c>
0564   e11c94:	48 89 df             	mov    %rbx,%rdi
0567   e11c97:	e8 00 00 00 00       	call   e11c9c <fix_nodes+0x56c>	e11c98: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
056c   e11c9c:	48 83 3b 00          	cmpq   $0x0,(%rbx)
0570   e11ca0:	0f 85 6c 83 00 00    	jne    e1a012 <fix_nodes+0x88e2>
0576   e11ca6:	e8 00 00 00 00       	call   e11cab <fix_nodes+0x57b>	e11ca7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
057b   e11cab:	4c 89 ff             	mov    %r15,%rdi
057e   e11cae:	be 08 00 00 00       	mov    $0x8,%esi
0583   e11cb3:	e8 00 00 00 00       	call   e11cb8 <fix_nodes+0x588>	e11cb4: R_X86_64_PLT32	__kasan_check_read-0x4
0588   e11cb8:	31 f6                	xor    %esi,%esi
058a   e11cba:	41 f6 07 01          	testb  $0x1,(%r15)
058e   e11cbe:	0f 95 c3             	setne  %bl
0591   e11cc1:	40 0f 95 c6          	setne  %sil
0595   e11cc5:	31 ff                	xor    %edi,%edi
0597   e11cc7:	e8 00 00 00 00       	call   e11ccc <fix_nodes+0x59c>	e11cc8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
059c   e11ccc:	84 db                	test   %bl,%bl
059e   e11cce:	0f 84 8c 83 00 00    	je     e1a060 <fix_nodes+0x8930>
05a4   e11cd4:	4c 89 ff             	mov    %r15,%rdi
05a7   e11cd7:	e8 00 00 00 00       	call   e11cdc <fix_nodes+0x5ac>	e11cd8: R_X86_64_PLT32	B_IS_IN_TREE-0x4
05ac   e11cdc:	89 c3                	mov    %eax,%ebx
05ae   e11cde:	31 ff                	xor    %edi,%edi
05b0   e11ce0:	89 c6                	mov    %eax,%esi
05b2   e11ce2:	e8 00 00 00 00       	call   e11ce7 <fix_nodes+0x5b7>	e11ce3: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
05b7   e11ce7:	85 db                	test   %ebx,%ebx
05b9   e11ce9:	0f 84 78 83 00 00    	je     e1a067 <fix_nodes+0x8937>
05bf   e11cef:	e8 00 00 00 00       	call   e11cf4 <fix_nodes+0x5c4>	e11cf0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05c4   e11cf4:	48 8b 9c 24 d8 00 00 00 	mov    0xd8(%rsp),%rbx
05cc   e11cfc:	89 df                	mov    %ebx,%edi
05ce   e11cfe:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e11d01: R_X86_64_32S	.data+0x66ed70
05d5   e11d05:	e8 00 00 00 00       	call   e11d0a <fix_nodes+0x5da>	e11d06: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
05da   e11d0a:	83 fb 68             	cmp    $0x68,%ebx
05dd   e11d0d:	7f 15                	jg     e11d24 <fix_nodes+0x5f4>
05df   e11d0f:	83 fb 63             	cmp    $0x63,%ebx
05e2   e11d12:	74 38                	je     e11d4c <fix_nodes+0x61c>
05e4   e11d14:	83 fb 64             	cmp    $0x64,%ebx
05e7   e11d17:	0f 85 db 8d 00 00    	jne    e1aaf8 <fix_nodes+0x93c8>
05ed   e11d1d:	e8 00 00 00 00       	call   e11d22 <fix_nodes+0x5f2>	e11d1e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05f2   e11d22:	eb 2d                	jmp    e11d51 <fix_nodes+0x621>
05f4   e11d24:	83 fb 69             	cmp    $0x69,%ebx
05f7   e11d27:	0f 84 95 00 00 00    	je     e11dc2 <fix_nodes+0x692>
05fd   e11d2d:	83 fb 70             	cmp    $0x70,%ebx
0600   e11d30:	0f 85 c2 8d 00 00    	jne    e1aaf8 <fix_nodes+0x93c8>
0606   e11d36:	e8 00 00 00 00       	call   e11d3b <fix_nodes+0x60b>	e11d37: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
060b   e11d3b:	eb 14                	jmp    e11d51 <fix_nodes+0x621>
060d   e11d3d:	e8 00 00 00 00       	call   e11d42 <fix_nodes+0x612>	e11d3e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0612   e11d42:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
0617   e11d47:	e9 1a 8d 00 00       	jmp    e1aa66 <fix_nodes+0x9336>
061c   e11d4c:	e8 00 00 00 00       	call   e11d51 <fix_nodes+0x621>	e11d4d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0621   e11d51:	31 ff                	xor    %edi,%edi
0623   e11d53:	8b 9c 24 c0 00 00 00 	mov    0xc0(%rsp),%ebx
062a   e11d5a:	89 de                	mov    %ebx,%esi
062c   e11d5c:	e8 00 00 00 00       	call   e11d61 <fix_nodes+0x631>	e11d5d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0631   e11d61:	85 db                	test   %ebx,%ebx
0633   e11d63:	0f 88 ce 83 00 00    	js     e1a137 <fix_nodes+0x8a07>
0639   e11d69:	49 8d 5f 28          	lea    0x28(%r15),%rbx
063d   e11d6d:	48 89 d8             	mov    %rbx,%rax
0640   e11d70:	48 c1 e8 03          	shr    $0x3,%rax
0644   e11d74:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0649   e11d79:	74 08                	je     e11d83 <fix_nodes+0x653>
064b   e11d7b:	48 89 df             	mov    %rbx,%rdi
064e   e11d7e:	e8 00 00 00 00       	call   e11d83 <fix_nodes+0x653>	e11d7f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0653   e11d83:	48 8b 1b             	mov    (%rbx),%rbx
0656   e11d86:	48 83 c3 02          	add    $0x2,%rbx
065a   e11d8a:	48 89 d8             	mov    %rbx,%rax
065d   e11d8d:	48 c1 e8 03          	shr    $0x3,%rax
0661   e11d91:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0665   e11d95:	84 c0                	test   %al,%al
0667   e11d97:	0f 85 a1 93 00 00    	jne    e1b13e <fix_nodes+0x9a0e>
066d   e11d9d:	44 0f b7 33          	movzwl (%rbx),%r14d
0671   e11da1:	8b 9c 24 c0 00 00 00 	mov    0xc0(%rsp),%ebx
0678   e11da8:	89 df                	mov    %ebx,%edi
067a   e11daa:	44 89 f6             	mov    %r14d,%esi
067d   e11dad:	e8 00 00 00 00       	call   e11db2 <fix_nodes+0x682>	e11dae: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
0682   e11db2:	44 39 f3             	cmp    %r14d,%ebx
0685   e11db5:	0f 83 83 83 00 00    	jae    e1a13e <fix_nodes+0x8a0e>
068b   e11dbb:	e8 00 00 00 00       	call   e11dc0 <fix_nodes+0x690>	e11dbc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0690   e11dc0:	eb 72                	jmp    e11e34 <fix_nodes+0x704>
0692   e11dc2:	bf 01 00 00 00       	mov    $0x1,%edi
0697   e11dc7:	8b 9c 24 c0 00 00 00 	mov    0xc0(%rsp),%ebx
069e   e11dce:	89 de                	mov    %ebx,%esi
06a0   e11dd0:	e8 00 00 00 00       	call   e11dd5 <fix_nodes+0x6a5>	e11dd1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
06a5   e11dd5:	85 db                	test   %ebx,%ebx
06a7   e11dd7:	0f 8e 5b 8d 00 00    	jle    e1ab38 <fix_nodes+0x9408>
06ad   e11ddd:	49 8d 5f 28          	lea    0x28(%r15),%rbx
06b1   e11de1:	48 89 d8             	mov    %rbx,%rax
06b4   e11de4:	48 c1 e8 03          	shr    $0x3,%rax
06b8   e11de8:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
06bd   e11ded:	74 08                	je     e11df7 <fix_nodes+0x6c7>
06bf   e11def:	48 89 df             	mov    %rbx,%rdi
06c2   e11df2:	e8 00 00 00 00       	call   e11df7 <fix_nodes+0x6c7>	e11df3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
06c7   e11df7:	48 8b 1b             	mov    (%rbx),%rbx
06ca   e11dfa:	48 83 c3 02          	add    $0x2,%rbx
06ce   e11dfe:	48 89 d8             	mov    %rbx,%rax
06d1   e11e01:	48 c1 e8 03          	shr    $0x3,%rax
06d5   e11e05:	42 8a 04 20          	mov    (%rax,%r12,1),%al
06d9   e11e09:	84 c0                	test   %al,%al
06db   e11e0b:	0f 85 e0 93 00 00    	jne    e1b1f1 <fix_nodes+0x9ac1>
06e1   e11e11:	44 0f b7 33          	movzwl (%rbx),%r14d
06e5   e11e15:	8b 9c 24 c0 00 00 00 	mov    0xc0(%rsp),%ebx
06ec   e11e1c:	89 df                	mov    %ebx,%edi
06ee   e11e1e:	44 89 f6             	mov    %r14d,%esi
06f1   e11e21:	e8 00 00 00 00       	call   e11e26 <fix_nodes+0x6f6>	e11e22: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
06f6   e11e26:	44 39 f3             	cmp    %r14d,%ebx
06f9   e11e29:	0f 87 10 8d 00 00    	ja     e1ab3f <fix_nodes+0x940f>
06ff   e11e2f:	e8 00 00 00 00       	call   e11e34 <fix_nodes+0x704>	e11e30: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0704   e11e34:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
0709   e11e39:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
070e   e11e3e:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0713   e11e43:	74 08                	je     e11e4d <fix_nodes+0x71d>
0715   e11e45:	4c 89 ff             	mov    %r15,%rdi
0718   e11e48:	e8 00 00 00 00       	call   e11e4d <fix_nodes+0x71d>	e11e49: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
071d   e11e4d:	4d 8b 37             	mov    (%r15),%r14
0720   e11e50:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
0725   e11e55:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
072a   e11e5a:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
072f   e11e5f:	74 08                	je     e11e69 <fix_nodes+0x739>
0731   e11e61:	48 89 df             	mov    %rbx,%rdi
0734   e11e64:	e8 00 00 00 00       	call   e11e69 <fix_nodes+0x739>	e11e65: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0739   e11e69:	48 8b 1b             	mov    (%rbx),%rbx
073c   e11e6c:	48 89 d8             	mov    %rbx,%rax
073f   e11e6f:	48 c1 e8 03          	shr    $0x3,%rax
0743   e11e73:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0747   e11e77:	84 c0                	test   %al,%al
0749   e11e79:	0f 85 84 92 00 00    	jne    e1b103 <fix_nodes+0x99d3>
074f   e11e7f:	48 63 1b             	movslq (%rbx),%rbx
0752   e11e82:	bf 08 00 00 00       	mov    $0x8,%edi
0757   e11e87:	89 de                	mov    %ebx,%esi
0759   e11e89:	e8 00 00 00 00       	call   e11e8e <fix_nodes+0x75e>	e11e8a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
075e   e11e8e:	48 83 fb 07          	cmp    $0x7,%rbx
0762   e11e92:	0f 87 b8 93 00 00    	ja     e1b250 <fix_nodes+0x9b20>
0768   e11e98:	e8 00 00 00 00       	call   e11e9d <fix_nodes+0x76d>	e11e99: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
076d   e11e9d:	49 83 c6 18          	add    $0x18,%r14
0771   e11ea1:	4c 89 f0             	mov    %r14,%rax
0774   e11ea4:	48 c1 e8 03          	shr    $0x3,%rax
0778   e11ea8:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
077d   e11ead:	74 08                	je     e11eb7 <fix_nodes+0x787>
077f   e11eaf:	4c 89 f7             	mov    %r14,%rdi
0782   e11eb2:	e8 00 00 00 00       	call   e11eb7 <fix_nodes+0x787>	e11eb3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0787   e11eb7:	49 8b 0e             	mov    (%r14),%rcx
078a   e11eba:	48 8d 71 e8          	lea    -0x18(%rcx),%rsi
078e   e11ebe:	48 ba 15 ae 47 e1 7a 14 ae 47 	movabs $0x47ae147ae147ae15,%rdx
0798   e11ec8:	48 89 f0             	mov    %rsi,%rax
079b   e11ecb:	48 f7 e2             	mul    %rdx
079e   e11ece:	48 29 d6             	sub    %rdx,%rsi
07a1   e11ed1:	48 d1 ee             	shr    %rsi
07a4   e11ed4:	48 01 d6             	add    %rdx,%rsi
07a7   e11ed7:	48 c1 ee 04          	shr    $0x4,%rsi
07ab   e11edb:	48 83 c1 d0          	add    $0xffffffffffffffd0,%rcx
07af   e11edf:	48 ba f1 f0 f0 f0 f0 f0 f0 f0 	movabs $0xf0f0f0f0f0f0f0f1,%rdx
07b9   e11ee9:	48 89 c8             	mov    %rcx,%rax
07bc   e11eec:	48 f7 e2             	mul    %rdx
07bf   e11eef:	48 83 e2 f0          	and    $0xfffffffffffffff0,%rdx
07c3   e11ef3:	48 c1 e2 1c          	shl    $0x1c,%rdx
07c7   e11ef7:	48 63 c6             	movslq %esi,%rax
07ca   e11efa:	48 c1 e0 03          	shl    $0x3,%rax
07ce   e11efe:	4c 8d 34 80          	lea    (%rax,%rax,4),%r14
07d2   e11f02:	48 bb 00 00 00 00 ff ff ff ff 	movabs $0xffffffff00000000,%rbx
07dc   e11f0c:	48 01 d3             	add    %rdx,%rbx
07df   e11f0f:	48 c1 fb 1f          	sar    $0x1f,%rbx
07e3   e11f13:	48 83 c3 30          	add    $0x30,%rbx
07e7   e11f17:	4c 89 f7             	mov    %r14,%rdi
07ea   e11f1a:	48 89 de             	mov    %rbx,%rsi
07ed   e11f1d:	e8 00 00 00 00       	call   e11f22 <fix_nodes+0x7f2>	e11f1e: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
07f2   e11f22:	49 39 de             	cmp    %rbx,%r14
07f5   e11f25:	41 0f 47 de          	cmova  %r14d,%ebx
07f9   e11f29:	83 c3 30             	add    $0x30,%ebx
07fc   e11f2c:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0801   e11f31:	4c 8d a8 98 02 00 00 	lea    0x298(%rax),%r13
0808   e11f38:	4c 89 e8             	mov    %r13,%rax
080b   e11f3b:	48 c1 e8 03          	shr    $0x3,%rax
080f   e11f3f:	48 89 84 24 f0 00 00 00 	mov    %rax,0xf0(%rsp)
0817   e11f47:	42 8a 04 20          	mov    (%rax,%r12,1),%al
081b   e11f4b:	84 c0                	test   %al,%al
081d   e11f4d:	0f 85 cd 91 00 00    	jne    e1b120 <fix_nodes+0x99f0>
0823   e11f53:	45 8b 75 00          	mov    0x0(%r13),%r14d
0827   e11f57:	89 df                	mov    %ebx,%edi
0829   e11f59:	44 89 f6             	mov    %r14d,%esi
082c   e11f5c:	e8 00 00 00 00       	call   e11f61 <fix_nodes+0x831>	e11f5d: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
0831   e11f61:	44 39 f3             	cmp    %r14d,%ebx
0834   e11f64:	7e 4e                	jle    e11fb4 <fix_nodes+0x884>
0836   e11f66:	4c 89 6c 24 38       	mov    %r13,0x38(%rsp)
083b   e11f6b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0840   e11f70:	4c 8d a8 90 02 00 00 	lea    0x290(%rax),%r13
0847   e11f77:	4c 89 e8             	mov    %r13,%rax
084a   e11f7a:	48 c1 e8 03          	shr    $0x3,%rax
084e   e11f7e:	48 89 84 24 18 01 00 00 	mov    %rax,0x118(%rsp)
0856   e11f86:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
085b   e11f8b:	74 08                	je     e11f95 <fix_nodes+0x865>
085d   e11f8d:	4c 89 ef             	mov    %r13,%rdi
0860   e11f90:	e8 00 00 00 00       	call   e11f95 <fix_nodes+0x865>	e11f91: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0865   e11f95:	4d 8b 75 00          	mov    0x0(%r13),%r14
0869   e11f99:	4d 85 f6             	test   %r14,%r14
086c   e11f9c:	0f 84 69 6a 00 00    	je     e18a0b <fix_nodes+0x72db>
0872   e11fa2:	e8 00 00 00 00       	call   e11fa7 <fix_nodes+0x877>	e11fa3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0877   e11fa7:	4c 89 f7             	mov    %r14,%rdi
087a   e11faa:	e8 00 00 00 00       	call   e11faf <fix_nodes+0x87f>	e11fab: R_X86_64_PLT32	kfree-0x4
087f   e11faf:	e9 5c 6a 00 00       	jmp    e18a10 <fix_nodes+0x72e0>
0884   e11fb4:	e8 00 00 00 00       	call   e11fb9 <fix_nodes+0x889>	e11fb5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0889   e11fb9:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
088e   e11fbe:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
0893   e11fc3:	48 8d 83 90 02 00 00 	lea    0x290(%rbx),%rax
089a   e11fca:	48 89 84 24 18 01 00 00 	mov    %rax,0x118(%rsp)
08a2   e11fd2:	48 8d 83 a0 02 00 00 	lea    0x2a0(%rbx),%rax
08a9   e11fd9:	48 89 84 24 f0 00 00 00 	mov    %rax,0xf0(%rsp)
08b1   e11fe1:	bf 69 00 00 00       	mov    $0x69,%edi
08b6   e11fe6:	4c 8b ac 24 d8 00 00 00 	mov    0xd8(%rsp),%r13
08be   e11fee:	44 89 ee             	mov    %r13d,%esi
08c1   e11ff1:	e8 00 00 00 00       	call   e11ff6 <fix_nodes+0x8c6>	e11ff2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
08c6   e11ff6:	41 83 fd 69          	cmp    $0x69,%r13d
08ca   e11ffa:	0f 94 c0             	sete   %al
08cd   e11ffd:	48 83 bc 24 60 01 00 00 00 	cmpq   $0x0,0x160(%rsp)
08d6   e12006:	0f 94 c1             	sete   %cl
08d9   e12009:	20 c1                	and    %al,%cl
08db   e1200b:	88 8c 24 cf 00 00 00 	mov    %cl,0xcf(%rsp)
08e2   e12012:	48 8d 83 98 00 00 00 	lea    0x98(%rbx),%rax
08e9   e12019:	48 89 84 24 58 01 00 00 	mov    %rax,0x158(%rsp)
08f1   e12021:	48 8d 43 70          	lea    0x70(%rbx),%rax
08f5   e12025:	48 89 84 24 00 01 00 00 	mov    %rax,0x100(%rsp)
08fd   e1202d:	48 8d 83 e8 00 00 00 	lea    0xe8(%rbx),%rax
0904   e12034:	48 89 84 24 50 01 00 00 	mov    %rax,0x150(%rsp)
090c   e1203c:	48 8d 83 dc 01 00 00 	lea    0x1dc(%rbx),%rax
0913   e12043:	48 89 84 24 38 01 00 00 	mov    %rax,0x138(%rsp)
091b   e1204b:	48 8d 83 a0 01 00 00 	lea    0x1a0(%rbx),%rax
0922   e12052:	48 89 84 24 e0 00 00 00 	mov    %rax,0xe0(%rsp)
092a   e1205a:	48 8d 83 b4 01 00 00 	lea    0x1b4(%rbx),%rax
0931   e12061:	48 89 84 24 88 00 00 00 	mov    %rax,0x88(%rsp)
0939   e12069:	48 8d 83 04 02 00 00 	lea    0x204(%rbx),%rax
0940   e12070:	48 89 84 24 b8 00 00 00 	mov    %rax,0xb8(%rsp)
0948   e12078:	48 8d 83 20 02 00 00 	lea    0x220(%rbx),%rax
094f   e1207f:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
0954   e12084:	48 8d 83 24 02 00 00 	lea    0x224(%rbx),%rax
095b   e1208b:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
0960   e12090:	48 8d 83 1c 02 00 00 	lea    0x21c(%rbx),%rax
0967   e12097:	48 89 84 24 40 01 00 00 	mov    %rax,0x140(%rsp)
096f   e1209f:	45 31 ed             	xor    %r13d,%r13d
0972   e120a2:	4a 8d 1c ab          	lea    (%rbx,%r13,4),%rbx
0976   e120a6:	48 81 c3 f0 01 00 00 	add    $0x1f0,%rbx
097d   e120ad:	48 89 d8             	mov    %rbx,%rax
0980   e120b0:	48 c1 e8 03          	shr    $0x3,%rax
0984   e120b4:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
0989   e120b9:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
098e   e120be:	84 c0                	test   %al,%al
0990   e120c0:	0f 85 63 4e 00 00    	jne    e16f29 <fix_nodes+0x57f9>
0996   e120c6:	48 89 5c 24 30       	mov    %rbx,0x30(%rsp)
099b   e120cb:	8b 1b                	mov    (%rbx),%ebx
099d   e120cd:	31 ff                	xor    %edi,%edi
099f   e120cf:	89 de                	mov    %ebx,%esi
09a1   e120d1:	e8 00 00 00 00       	call   e120d6 <fix_nodes+0x9a6>	e120d2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
09a6   e120d6:	85 db                	test   %ebx,%ebx
09a8   e120d8:	0f 84 b4 6d 00 00    	je     e18e92 <fix_nodes+0x7762>
09ae   e120de:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
09b3   e120e3:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
09b8   e120e8:	74 08                	je     e120f2 <fix_nodes+0x9c2>
09ba   e120ea:	4c 89 f7             	mov    %r14,%rdi
09bd   e120ed:	e8 00 00 00 00       	call   e120f2 <fix_nodes+0x9c2>	e120ee: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
09c2   e120f2:	49 8b 1e             	mov    (%r14),%rbx
09c5   e120f5:	48 89 d8             	mov    %rbx,%rax
09c8   e120f8:	48 c1 e8 03          	shr    $0x3,%rax
09cc   e120fc:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
09d1   e12101:	84 c0                	test   %al,%al
09d3   e12103:	0f 85 3d 4e 00 00    	jne    e16f46 <fix_nodes+0x5816>
09d9   e12109:	44 8b 23             	mov    (%rbx),%r12d
09dc   e1210c:	45 29 ec             	sub    %r13d,%r12d
09df   e1210f:	bf 03 00 00 00       	mov    $0x3,%edi
09e4   e12114:	44 89 e6             	mov    %r12d,%esi
09e7   e12117:	e8 00 00 00 00       	call   e1211c <fix_nodes+0x9ec>	e12118: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
09ec   e1211c:	41 83 fc 02          	cmp    $0x2,%r12d
09f0   e12120:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
09f5   e12125:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
09fa   e1212a:	0f 8f c8 01 00 00    	jg     e122f8 <fix_nodes+0xbc8>
0a00   e12130:	bf 01 00 00 00       	mov    $0x1,%edi
0a05   e12135:	44 89 e6             	mov    %r12d,%esi
0a08   e12138:	e8 00 00 00 00       	call   e1213d <fix_nodes+0xa0d>	e12139: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0a0d   e1213d:	45 85 e4             	test   %r12d,%r12d
0a10   e12140:	0f 8e a8 13 00 00    	jle    e134ee <fix_nodes+0x1dbe>
0a16   e12146:	e8 00 00 00 00       	call   e1214b <fix_nodes+0xa1b>	e12147: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a1b   e1214b:	48 83 c3 28          	add    $0x28,%rbx
0a1f   e1214f:	48 89 d8             	mov    %rbx,%rax
0a22   e12152:	48 c1 e8 03          	shr    $0x3,%rax
0a26   e12156:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0a30   e12160:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0a34   e12164:	74 08                	je     e1216e <fix_nodes+0xa3e>
0a36   e12166:	48 89 df             	mov    %rbx,%rdi
0a39   e12169:	e8 00 00 00 00       	call   e1216e <fix_nodes+0xa3e>	e1216a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a3e   e1216e:	48 8b 1b             	mov    (%rbx),%rbx
0a41   e12171:	48 83 c3 18          	add    $0x18,%rbx
0a45   e12175:	48 89 d8             	mov    %rbx,%rax
0a48   e12178:	48 c1 e8 03          	shr    $0x3,%rax
0a4c   e1217c:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0a56   e12186:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0a5a   e1218a:	74 08                	je     e12194 <fix_nodes+0xa64>
0a5c   e1218c:	48 89 df             	mov    %rbx,%rdi
0a5f   e1218f:	e8 00 00 00 00       	call   e12194 <fix_nodes+0xa64>	e12190: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a64   e12194:	4c 8b 33             	mov    (%rbx),%r14
0a67   e12197:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0a71   e121a1:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
0a76   e121a6:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0a7a   e121aa:	74 08                	je     e121b4 <fix_nodes+0xa84>
0a7c   e121ac:	4c 89 ff             	mov    %r15,%rdi
0a7f   e121af:	e8 00 00 00 00       	call   e121b4 <fix_nodes+0xa84>	e121b0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a84   e121b4:	49 8b 1f             	mov    (%r15),%rbx
0a87   e121b7:	b8 d8 06 00 00       	mov    $0x6d8,%eax
0a8c   e121bc:	48 01 c3             	add    %rax,%rbx
0a8f   e121bf:	48 89 d8             	mov    %rbx,%rax
0a92   e121c2:	48 c1 e8 03          	shr    $0x3,%rax
0a96   e121c6:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0aa0   e121d0:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0aa4   e121d4:	74 08                	je     e121de <fix_nodes+0xaae>
0aa6   e121d6:	48 89 df             	mov    %rbx,%rdi
0aa9   e121d9:	e8 00 00 00 00       	call   e121de <fix_nodes+0xaae>	e121da: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0aae   e121de:	48 8b 1b             	mov    (%rbx),%rbx
0ab1   e121e1:	48 83 c3 08          	add    $0x8,%rbx
0ab5   e121e5:	48 89 d8             	mov    %rbx,%rax
0ab8   e121e8:	48 c1 e8 03          	shr    $0x3,%rax
0abc   e121ec:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0ac6   e121f6:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0aca   e121fa:	74 08                	je     e12204 <fix_nodes+0xad4>
0acc   e121fc:	48 89 df             	mov    %rbx,%rdi
0acf   e121ff:	e8 00 00 00 00       	call   e12204 <fix_nodes+0xad4>	e12200: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0ad4   e12204:	48 8b 1b             	mov    (%rbx),%rbx
0ad7   e12207:	4c 8d 7b 08          	lea    0x8(%rbx),%r15
0adb   e1220b:	48 83 c3 0b          	add    $0xb,%rbx
0adf   e1220f:	4c 89 f8             	mov    %r15,%rax
0ae2   e12212:	48 c1 e8 03          	shr    $0x3,%rax
0ae6   e12216:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0af0   e12220:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0af5   e12225:	84 c0                	test   %al,%al
0af7   e12227:	0f 85 58 4e 00 00    	jne    e17085 <fix_nodes+0x5955>
0afd   e1222d:	48 89 d8             	mov    %rbx,%rax
0b00   e12230:	48 c1 e8 03          	shr    $0x3,%rax
0b04   e12234:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0b09   e12239:	84 c0                	test   %al,%al
0b0b   e1223b:	0f 85 64 4e 00 00    	jne    e170a5 <fix_nodes+0x5975>
0b11   e12241:	41 8b 1f             	mov    (%r15),%ebx
0b14   e12244:	4c 89 f7             	mov    %r14,%rdi
0b17   e12247:	48 89 de             	mov    %rbx,%rsi
0b1a   e1224a:	e8 00 00 00 00       	call   e1224f <fix_nodes+0xb1f>	e1224b: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
0b1f   e1224f:	49 39 de             	cmp    %rbx,%r14
0b22   e12252:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
0b27   e12257:	0f 85 66 7e 00 00    	jne    e1a0c3 <fix_nodes+0x8993>
0b2d   e1225d:	41 83 c4 ff          	add    $0xffffffff,%r12d
0b31   e12261:	4d 63 fc             	movslq %r12d,%r15
0b34   e12264:	bf 08 00 00 00       	mov    $0x8,%edi
0b39   e12269:	44 89 fe             	mov    %r15d,%esi
0b3c   e1226c:	e8 00 00 00 00       	call   e12271 <fix_nodes+0xb41>	e1226d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0b41   e12271:	41 83 ff 08          	cmp    $0x8,%r15d
0b45   e12275:	0f 83 d2 51 00 00    	jae    e1744d <fix_nodes+0x5d1d>
0b4b   e1227b:	e8 00 00 00 00       	call   e12280 <fix_nodes+0xb50>	e1227c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b50   e12280:	4c 89 f8             	mov    %r15,%rax
0b53   e12283:	48 c1 e0 04          	shl    $0x4,%rax
0b57   e12287:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
0b5c   e1228c:	48 8d 1c 01          	lea    (%rcx,%rax,1),%rbx
0b60   e12290:	48 83 c3 08          	add    $0x8,%rbx
0b64   e12294:	48 89 d8             	mov    %rbx,%rax
0b67   e12297:	48 c1 e8 03          	shr    $0x3,%rax
0b6b   e1229b:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
0b75   e122a5:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0b7a   e122aa:	4c 8b b4 24 f0 00 00 00 	mov    0xf0(%rsp),%r14
0b82   e122b2:	74 08                	je     e122bc <fix_nodes+0xb8c>
0b84   e122b4:	48 89 df             	mov    %rbx,%rdi
0b87   e122b7:	e8 00 00 00 00       	call   e122bc <fix_nodes+0xb8c>	e122b8: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0b8c   e122bc:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
0b93   e122c3:	49 c1 e7 04          	shl    $0x4,%r15
0b97   e122c7:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0b9c   e122cc:	4a 8d 1c 38          	lea    (%rax,%r15,1),%rbx
0ba0   e122d0:	48 83 c3 10          	add    $0x10,%rbx
0ba4   e122d4:	48 89 d8             	mov    %rbx,%rax
0ba7   e122d7:	48 c1 e8 03          	shr    $0x3,%rax
0bab   e122db:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
0bb0   e122e0:	84 c0                	test   %al,%al
0bb2   e122e2:	0f 85 dc 4d 00 00    	jne    e170c4 <fix_nodes+0x5994>
0bb8   e122e8:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
0bbe   e122ee:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
0bc3   e122f3:	e9 f6 02 00 00       	jmp    e125ee <fix_nodes+0xebe>
0bc8   e122f8:	45 8d 6c 24 ff       	lea    -0x1(%r12),%r13d
0bcd   e122fd:	bf 08 00 00 00       	mov    $0x8,%edi
0bd2   e12302:	44 89 ee             	mov    %r13d,%esi
0bd5   e12305:	e8 00 00 00 00       	call   e1230a <fix_nodes+0xbda>	e12306: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0bda   e1230a:	41 83 fd 07          	cmp    $0x7,%r13d
0bde   e1230e:	0f 87 8b 50 00 00    	ja     e1739f <fix_nodes+0x5c6f>
0be4   e12314:	e8 00 00 00 00       	call   e12319 <fix_nodes+0xbe9>	e12315: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0be9   e12319:	4d 89 ee             	mov    %r13,%r14
0bec   e1231c:	49 c1 e6 04          	shl    $0x4,%r14
0bf0   e12320:	4c 01 f3             	add    %r14,%rbx
0bf3   e12323:	48 83 c3 08          	add    $0x8,%rbx
0bf7   e12327:	48 89 d8             	mov    %rbx,%rax
0bfa   e1232a:	48 c1 e8 03          	shr    $0x3,%rax
0bfe   e1232e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0c08   e12338:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0c0c   e1233c:	74 08                	je     e12346 <fix_nodes+0xc16>
0c0e   e1233e:	48 89 df             	mov    %rbx,%rdi
0c11   e12341:	e8 00 00 00 00       	call   e12346 <fix_nodes+0xc16>	e12342: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0c16   e12346:	4c 8b 3b             	mov    (%rbx),%r15
0c19   e12349:	4c 89 ff             	mov    %r15,%rdi
0c1c   e1234c:	e8 00 00 00 00       	call   e12351 <fix_nodes+0xc21>	e1234d: R_X86_64_PLT32	B_IS_IN_TREE-0x4
0c21   e12351:	89 c3                	mov    %eax,%ebx
0c23   e12353:	31 ff                	xor    %edi,%edi
0c25   e12355:	89 c6                	mov    %eax,%esi
0c27   e12357:	e8 00 00 00 00       	call   e1235c <fix_nodes+0xc2c>	e12358: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0c2c   e1235c:	85 db                	test   %ebx,%ebx
0c2e   e1235e:	0f 84 58 7d 00 00    	je     e1a0bc <fix_nodes+0x898c>
0c34   e12364:	41 83 fd 07          	cmp    $0x7,%r13d
0c38   e12368:	0f 87 58 51 00 00    	ja     e174c6 <fix_nodes+0x5d96>
0c3e   e1236e:	e8 00 00 00 00       	call   e12373 <fix_nodes+0xc43>	e1236f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c43   e12373:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0c48   e12378:	4a 8d 1c 30          	lea    (%rax,%r14,1),%rbx
0c4c   e1237c:	48 83 c3 10          	add    $0x10,%rbx
0c50   e12380:	48 89 d8             	mov    %rbx,%rax
0c53   e12383:	48 c1 e8 03          	shr    $0x3,%rax
0c57   e12387:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0c61   e12391:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0c66   e12396:	84 c0                	test   %al,%al
0c68   e12398:	0f 85 43 4d 00 00    	jne    e170e1 <fix_nodes+0x59b1>
0c6e   e1239e:	4c 63 33             	movslq (%rbx),%r14
0c71   e123a1:	49 8d 5f 28          	lea    0x28(%r15),%rbx
0c75   e123a5:	48 89 d8             	mov    %rbx,%rax
0c78   e123a8:	48 c1 e8 03          	shr    $0x3,%rax
0c7c   e123ac:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0c81   e123b1:	74 08                	je     e123bb <fix_nodes+0xc8b>
0c83   e123b3:	48 89 df             	mov    %rbx,%rdi
0c86   e123b6:	e8 00 00 00 00       	call   e123bb <fix_nodes+0xc8b>	e123b7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0c8b   e123bb:	4c 8b 2b             	mov    (%rbx),%r13
0c8e   e123be:	49 8d 5d 02          	lea    0x2(%r13),%rbx
0c92   e123c2:	48 89 d8             	mov    %rbx,%rax
0c95   e123c5:	48 c1 e8 03          	shr    $0x3,%rax
0c99   e123c9:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0ca3   e123d3:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
0ca7   e123d7:	84 c0                	test   %al,%al
0ca9   e123d9:	0f 85 1f 4d 00 00    	jne    e170fe <fix_nodes+0x59ce>
0caf   e123df:	0f b7 1b             	movzwl (%rbx),%ebx
0cb2   e123e2:	44 89 f7             	mov    %r14d,%edi
0cb5   e123e5:	89 de                	mov    %ebx,%esi
0cb7   e123e7:	e8 00 00 00 00       	call   e123ec <fix_nodes+0xcbc>	e123e8: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
0cbc   e123ec:	41 39 de             	cmp    %ebx,%r14d
0cbf   e123ef:	0f 8f d5 7c 00 00    	jg     e1a0ca <fix_nodes+0x899a>
0cc5   e123f5:	48 c1 e3 04          	shl    $0x4,%rbx
0cc9   e123f9:	49 01 dd             	add    %rbx,%r13
0ccc   e123fc:	4a 8d 1c f5 18 00 00 00 	lea    0x18(,%r14,8),%rbx
0cd4   e12404:	4c 01 eb             	add    %r13,%rbx
0cd7   e12407:	48 89 d8             	mov    %rbx,%rax
0cda   e1240a:	48 c1 e8 03          	shr    $0x3,%rax
0cde   e1240e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0ce8   e12418:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
0cec   e1241c:	84 c0                	test   %al,%al
0cee   e1241e:	0f 85 f7 4c 00 00    	jne    e1711b <fix_nodes+0x59eb>
0cf4   e12424:	44 8b 33             	mov    (%rbx),%r14d
0cf7   e12427:	44 89 e3             	mov    %r12d,%ebx
0cfa   e1242a:	bf 08 00 00 00       	mov    $0x8,%edi
0cff   e1242f:	44 89 e6             	mov    %r12d,%esi
0d02   e12432:	e8 00 00 00 00       	call   e12437 <fix_nodes+0xd07>	e12433: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0d07   e12437:	41 83 fc 07          	cmp    $0x7,%r12d
0d0b   e1243b:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
0d10   e12440:	0f 87 99 50 00 00    	ja     e174df <fix_nodes+0x5daf>
0d16   e12446:	e8 00 00 00 00       	call   e1244b <fix_nodes+0xd1b>	e12447: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d1b   e1244b:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
0d25   e12455:	48 c1 e3 04          	shl    $0x4,%rbx
0d29   e12459:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0d2e   e1245e:	48 01 c3             	add    %rax,%rbx
0d31   e12461:	48 83 c3 08          	add    $0x8,%rbx
0d35   e12465:	48 89 d8             	mov    %rbx,%rax
0d38   e12468:	48 c1 e8 03          	shr    $0x3,%rax
0d3c   e1246c:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0d41   e12471:	74 08                	je     e1247b <fix_nodes+0xd4b>
0d43   e12473:	48 89 df             	mov    %rbx,%rdi
0d46   e12476:	e8 00 00 00 00       	call   e1247b <fix_nodes+0xd4b>	e12477: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0d4b   e1247b:	48 8b 1b             	mov    (%rbx),%rbx
0d4e   e1247e:	48 83 c3 18          	add    $0x18,%rbx
0d52   e12482:	48 89 d8             	mov    %rbx,%rax
0d55   e12485:	48 c1 e8 03          	shr    $0x3,%rax
0d59   e12489:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0d5e   e1248e:	74 08                	je     e12498 <fix_nodes+0xd68>
0d60   e12490:	48 89 df             	mov    %rbx,%rdi
0d63   e12493:	e8 00 00 00 00       	call   e12498 <fix_nodes+0xd68>	e12494: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0d68   e12498:	48 8b 1b             	mov    (%rbx),%rbx
0d6b   e1249b:	48 89 df             	mov    %rbx,%rdi
0d6e   e1249e:	4c 89 f6             	mov    %r14,%rsi
0d71   e124a1:	e8 00 00 00 00       	call   e124a6 <fix_nodes+0xd76>	e124a2: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
0d76   e124a6:	4c 39 f3             	cmp    %r14,%rbx
0d79   e124a9:	0f 85 40 7c 00 00    	jne    e1a0ef <fix_nodes+0x89bf>
0d7f   e124af:	4c 89 ff             	mov    %r15,%rdi
0d82   e124b2:	be 08 00 00 00       	mov    $0x8,%esi
0d87   e124b7:	e8 00 00 00 00       	call   e124bc <fix_nodes+0xd8c>	e124b8: R_X86_64_PLT32	__kasan_check_read-0x4
0d8c   e124bc:	4c 89 f8             	mov    %r15,%rax
0d8f   e124bf:	48 c1 e8 03          	shr    $0x3,%rax
0d93   e124c3:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0d98   e124c8:	74 08                	je     e124d2 <fix_nodes+0xda2>
0d9a   e124ca:	4c 89 ff             	mov    %r15,%rdi
0d9d   e124cd:	e8 00 00 00 00       	call   e124d2 <fix_nodes+0xda2>	e124ce: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0da2   e124d2:	49 8b 1f             	mov    (%r15),%rbx
0da5   e124d5:	48 89 de             	mov    %rbx,%rsi
0da8   e124d8:	48 83 e6 04          	and    $0x4,%rsi
0dac   e124dc:	31 ff                	xor    %edi,%edi
0dae   e124de:	e8 00 00 00 00       	call   e124e3 <fix_nodes+0xdb3>	e124df: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0db3   e124e3:	48 83 e3 04          	and    $0x4,%rbx
0db7   e124e7:	4c 8b b4 24 f0 00 00 00 	mov    0xf0(%rsp),%r14
0dbf   e124ef:	75 0f                	jne    e12500 <fix_nodes+0xdd0>
0dc1   e124f1:	e8 00 00 00 00       	call   e124f6 <fix_nodes+0xdc6>	e124f2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0dc6   e124f6:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
0dcb   e124fb:	e9 ee 00 00 00       	jmp    e125ee <fix_nodes+0xebe>
0dd0   e12500:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
0dd5   e12505:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0dda   e1250a:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
0ddf   e1250f:	74 08                	je     e12519 <fix_nodes+0xde9>
0de1   e12511:	48 89 df             	mov    %rbx,%rdi
0de4   e12514:	e8 00 00 00 00       	call   e12519 <fix_nodes+0xde9>	e12515: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0de9   e12519:	48 8b 3b             	mov    (%rbx),%rdi
0dec   e1251c:	e8 00 00 00 00       	call   e12521 <fix_nodes+0xdf1>	e1251d: R_X86_64_PLT32	reiserfs_write_unlock_nested-0x4
0df1   e12521:	41 89 c6             	mov    %eax,%r14d
0df4   e12524:	4c 89 ff             	mov    %r15,%rdi
0df7   e12527:	e8 00 00 00 00       	call   e1252c <fix_nodes+0xdfc>	e12528: R_X86_64_PLT32	__wait_on_buffer-0x4
0dfc   e1252c:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
0e01   e12531:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0e06   e12536:	49 89 df             	mov    %rbx,%r15
0e09   e12539:	74 08                	je     e12543 <fix_nodes+0xe13>
0e0b   e1253b:	4c 89 ff             	mov    %r15,%rdi
0e0e   e1253e:	e8 00 00 00 00       	call   e12543 <fix_nodes+0xe13>	e1253f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0e13   e12543:	49 8b 3f             	mov    (%r15),%rdi
0e16   e12546:	44 89 f6             	mov    %r14d,%esi
0e19   e12549:	e8 00 00 00 00       	call   e1254e <fix_nodes+0xe1e>	e1254a: R_X86_64_PLT32	reiserfs_write_lock_nested-0x4
0e1e   e1254e:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
0e23   e12553:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0e28   e12558:	74 08                	je     e12562 <fix_nodes+0xe32>
0e2a   e1255a:	4c 89 ff             	mov    %r15,%rdi
0e2d   e1255d:	e8 00 00 00 00       	call   e12562 <fix_nodes+0xe32>	e1255e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0e32   e12562:	49 8b 1f             	mov    (%r15),%rbx
0e35   e12565:	b8 d8 06 00 00       	mov    $0x6d8,%eax
0e3a   e1256a:	48 01 c3             	add    %rax,%rbx
0e3d   e1256d:	48 89 d8             	mov    %rbx,%rax
0e40   e12570:	48 c1 e8 03          	shr    $0x3,%rax
0e44   e12574:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0e49   e12579:	74 08                	je     e12583 <fix_nodes+0xe53>
0e4b   e1257b:	48 89 df             	mov    %rbx,%rdi
0e4e   e1257e:	e8 00 00 00 00       	call   e12583 <fix_nodes+0xe53>	e1257f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0e53   e12583:	48 8b 1b             	mov    (%rbx),%rbx
0e56   e12586:	b8 70 01 00 00       	mov    $0x170,%eax
0e5b   e1258b:	48 01 c3             	add    %rax,%rbx
0e5e   e1258e:	48 89 df             	mov    %rbx,%rdi
0e61   e12591:	be 04 00 00 00       	mov    $0x4,%esi
0e66   e12596:	e8 00 00 00 00       	call   e1259b <fix_nodes+0xe6b>	e12597: R_X86_64_PLT32	__kasan_check_read-0x4
0e6b   e1259b:	48 89 d8             	mov    %rbx,%rax
0e6e   e1259e:	48 c1 e8 03          	shr    $0x3,%rax
0e72   e125a2:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
0e77   e125a7:	84 c0                	test   %al,%al
0e79   e125a9:	0f 85 e2 4b 00 00    	jne    e17191 <fix_nodes+0x5a61>
0e7f   e125af:	44 8b 33             	mov    (%rbx),%r14d
0e82   e125b2:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
0e8a   e125ba:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
0e8f   e125bf:	84 c0                	test   %al,%al
0e91   e125c1:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
0e96   e125c6:	0f 85 e2 4b 00 00    	jne    e171ae <fix_nodes+0x5a7e>
0e9c   e125cc:	8b 1a                	mov    (%rdx),%ebx
0e9e   e125ce:	44 89 f7             	mov    %r14d,%edi
0ea1   e125d1:	89 de                	mov    %ebx,%esi
0ea3   e125d3:	e8 00 00 00 00       	call   e125d8 <fix_nodes+0xea8>	e125d4: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
0ea8   e125d8:	41 39 de             	cmp    %ebx,%r14d
0eab   e125db:	0f 85 ab 84 00 00    	jne    e1aa8c <fix_nodes+0x935c>
0eb1   e125e1:	e8 00 00 00 00       	call   e125e6 <fix_nodes+0xeb6>	e125e2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0eb6   e125e6:	4c 8b b4 24 f0 00 00 00 	mov    0xf0(%rsp),%r14
0ebe   e125ee:	48 8b 9c 24 18 01 00 00 	mov    0x118(%rsp),%rbx
0ec6   e125f6:	48 89 d8             	mov    %rbx,%rax
0ec9   e125f9:	48 c1 e8 03          	shr    $0x3,%rax
0ecd   e125fd:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0ed2   e12602:	74 08                	je     e1260c <fix_nodes+0xedc>
0ed4   e12604:	48 89 df             	mov    %rbx,%rdi
0ed7   e12607:	e8 00 00 00 00       	call   e1260c <fix_nodes+0xedc>	e12608: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0edc   e1260c:	48 8b 1b             	mov    (%rbx),%rbx
0edf   e1260f:	4d 89 f4             	mov    %r14,%r12
0ee2   e12612:	49 c1 ec 03          	shr    $0x3,%r12
0ee6   e12616:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0ef0   e12620:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
0ef5   e12625:	74 08                	je     e1262f <fix_nodes+0xeff>
0ef7   e12627:	4c 89 f7             	mov    %r14,%rdi
0efa   e1262a:	e8 00 00 00 00       	call   e1262f <fix_nodes+0xeff>	e1262b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0eff   e1262f:	49 89 1e             	mov    %rbx,(%r14)
0f02   e12632:	4c 8d 73 30          	lea    0x30(%rbx),%r14
0f06   e12636:	48 89 d8             	mov    %rbx,%rax
0f09   e12639:	48 c1 e8 03          	shr    $0x3,%rax
0f0d   e1263d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0f17   e12647:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0f1b   e1264b:	74 08                	je     e12655 <fix_nodes+0xf25>
0f1d   e1264d:	48 89 df             	mov    %rbx,%rdi
0f20   e12650:	e8 00 00 00 00       	call   e12655 <fix_nodes+0xf25>	e12651: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0f25   e12655:	4c 89 33             	mov    %r14,(%rbx)
0f28   e12658:	48 8d 7b 0c          	lea    0xc(%rbx),%rdi
0f2c   e1265c:	48 89 f8             	mov    %rdi,%rax
0f2f   e1265f:	48 c1 e8 03          	shr    $0x3,%rax
0f33   e12663:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
0f3d   e1266d:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
0f42   e12672:	84 c0                	test   %al,%al
0f44   e12674:	0f 85 e9 48 00 00    	jne    e16f63 <fix_nodes+0x5833>
0f4a   e1267a:	48 8b 84 24 d8 00 00 00 	mov    0xd8(%rsp),%rax
0f52   e12682:	66 89 43 0c          	mov    %ax,0xc(%rbx)
0f56   e12686:	48 8d 7b 0e          	lea    0xe(%rbx),%rdi
0f5a   e1268a:	48 89 f8             	mov    %rdi,%rax
0f5d   e1268d:	48 c1 e8 03          	shr    $0x3,%rax
0f61   e12691:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
0f66   e12696:	84 c0                	test   %al,%al
0f68   e12698:	0f 85 df 48 00 00    	jne    e16f7d <fix_nodes+0x584d>
0f6e   e1269e:	8b 84 24 c0 00 00 00 	mov    0xc0(%rsp),%eax
0f75   e126a5:	66 89 43 0e          	mov    %ax,0xe(%rbx)
0f79   e126a9:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
0f7d   e126ad:	48 89 f8             	mov    %rdi,%rax
0f80   e126b0:	48 c1 e8 03          	shr    $0x3,%rax
0f84   e126b4:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
0f89   e126b9:	84 c0                	test   %al,%al
0f8b   e126bb:	0f 85 d6 48 00 00    	jne    e16f97 <fix_nodes+0x5867>
0f91   e126c1:	8b 84 24 4c 01 00 00 	mov    0x14c(%rsp),%eax
0f98   e126c8:	66 89 43 10          	mov    %ax,0x10(%rbx)
0f9c   e126cc:	48 8d 7b 18          	lea    0x18(%rbx),%rdi
0fa0   e126d0:	48 89 f8             	mov    %rdi,%rax
0fa3   e126d3:	48 c1 e8 03          	shr    $0x3,%rax
0fa7   e126d7:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
0fac   e126dc:	74 05                	je     e126e3 <fix_nodes+0xfb3>
0fae   e126de:	e8 00 00 00 00       	call   e126e3 <fix_nodes+0xfb3>	e126df: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0fb3   e126e3:	48 8b 84 24 60 01 00 00 	mov    0x160(%rsp),%rax
0fbb   e126eb:	48 89 43 18          	mov    %rax,0x18(%rbx)
0fbf   e126ef:	48 83 c3 20          	add    $0x20,%rbx
0fc3   e126f3:	48 89 d8             	mov    %rbx,%rax
0fc6   e126f6:	48 c1 e8 03          	shr    $0x3,%rax
0fca   e126fa:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0fd4   e12704:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0fd8   e12708:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
0fdd   e1270d:	74 08                	je     e12717 <fix_nodes+0xfe7>
0fdf   e1270f:	48 89 df             	mov    %rbx,%rdi
0fe2   e12712:	e8 00 00 00 00       	call   e12717 <fix_nodes+0xfe7>	e12713: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0fe7   e12717:	48 8b 84 24 68 01 00 00 	mov    0x168(%rsp),%rax
0fef   e1271f:	48 89 03             	mov    %rax,(%rbx)
0ff2   e12722:	80 bc 24 cf 00 00 00 00 	cmpb   $0x0,0xcf(%rsp)
0ffa   e1272a:	0f 85 bd 07 00 00    	jne    e12eed <fix_nodes+0x17bd>
1000   e12730:	e8 00 00 00 00       	call   e12735 <fix_nodes+0x1005>	e12731: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1005   e12735:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
100a   e1273a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1014   e12744:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
1019   e12749:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
101d   e1274d:	84 c0                	test   %al,%al
101f   e1274f:	0f 85 5c 48 00 00    	jne    e16fb1 <fix_nodes+0x5881>
1025   e12755:	8b 1b                	mov    (%rbx),%ebx
1027   e12757:	31 ff                	xor    %edi,%edi
1029   e12759:	89 de                	mov    %ebx,%esi
102b   e1275b:	e8 00 00 00 00       	call   e12760 <fix_nodes+0x1030>	e1275c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1030   e12760:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
103a   e1276a:	85 db                	test   %ebx,%ebx
103c   e1276c:	0f 8e 15 01 00 00    	jle    e12887 <fix_nodes+0x1157>
1042   e12772:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
1047   e12777:	49 89 c4             	mov    %rax,%r12
104a   e1277a:	48 8b 9c 24 f0 00 00 00 	mov    0xf0(%rsp),%rbx
1052   e12782:	74 08                	je     e1278c <fix_nodes+0x105c>
1054   e12784:	48 89 df             	mov    %rbx,%rdi
1057   e12787:	e8 00 00 00 00       	call   e1278c <fix_nodes+0x105c>	e12788: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
105c   e1278c:	48 8b 03             	mov    (%rbx),%rax
105f   e1278f:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
1064   e12794:	ba 50 00 00 00       	mov    $0x50,%edx
1069   e12799:	48 8d bc 24 70 01 00 00 	lea    0x170(%rsp),%rdi
1071   e127a1:	31 f6                	xor    %esi,%esi
1073   e127a3:	e8 00 00 00 00       	call   e127a8 <fix_nodes+0x1078>	e127a4: R_X86_64_PLT32	memset-0x4
1078   e127a8:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
107d   e127ad:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
1082   e127b2:	74 08                	je     e127bc <fix_nodes+0x108c>
1084   e127b4:	4c 89 f7             	mov    %r14,%rdi
1087   e127b7:	e8 00 00 00 00       	call   e127bc <fix_nodes+0x108c>	e127b8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
108c   e127bc:	4d 8b 36             	mov    (%r14),%r14
108f   e127bf:	4c 89 f0             	mov    %r14,%rax
1092   e127c2:	48 c1 e8 03          	shr    $0x3,%rax
1096   e127c6:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
109b   e127cb:	84 c0                	test   %al,%al
109d   e127cd:	0f 85 36 48 00 00    	jne    e17009 <fix_nodes+0x58d9>
10a3   e127d3:	41 8b 06             	mov    (%r14),%eax
10a6   e127d6:	44 29 e8             	sub    %r13d,%eax
10a9   e127d9:	48 63 d8             	movslq %eax,%rbx
10ac   e127dc:	bf 08 00 00 00       	mov    $0x8,%edi
10b1   e127e1:	89 de                	mov    %ebx,%esi
10b3   e127e3:	e8 00 00 00 00       	call   e127e8 <fix_nodes+0x10b8>	e127e4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
10b8   e127e8:	83 fb 07             	cmp    $0x7,%ebx
10bb   e127eb:	0f 87 0c 4b 00 00    	ja     e172fd <fix_nodes+0x5bcd>
10c1   e127f1:	e8 00 00 00 00       	call   e127f6 <fix_nodes+0x10c6>	e127f2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
10c6   e127f6:	48 c1 e3 04          	shl    $0x4,%rbx
10ca   e127fa:	4c 01 f3             	add    %r14,%rbx
10cd   e127fd:	48 83 c3 08          	add    $0x8,%rbx
10d1   e12801:	48 89 d8             	mov    %rbx,%rax
10d4   e12804:	48 c1 e8 03          	shr    $0x3,%rax
10d8   e12808:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
10dd   e1280d:	74 08                	je     e12817 <fix_nodes+0x10e7>
10df   e1280f:	48 89 df             	mov    %rbx,%rdi
10e2   e12812:	e8 00 00 00 00       	call   e12817 <fix_nodes+0x10e7>	e12813: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
10e7   e12817:	48 8b 1b             	mov    (%rbx),%rbx
10ea   e1281a:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
10ef   e1281f:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
10f4   e12824:	84 c0                	test   %al,%al
10f6   e12826:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
10fb   e1282b:	0f 85 f6 47 00 00    	jne    e17027 <fix_nodes+0x58f7>
1101   e12831:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
1106   e12836:	8b 00                	mov    (%rax),%eax
1108   e12838:	89 84 24 80 00 00 00 	mov    %eax,0x80(%rsp)
110f   e1283f:	48 89 9c 24 d0 00 00 00 	mov    %rbx,0xd0(%rsp)
1117   e12847:	48 85 db             	test   %rbx,%rbx
111a   e1284a:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
111f   e1284f:	0f 84 81 02 00 00    	je     e12ad6 <fix_nodes+0x13a6>
1125   e12855:	e8 00 00 00 00       	call   e1285a <fix_nodes+0x112a>	e12856: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
112a   e1285a:	48 89 df             	mov    %rbx,%rdi
112d   e1285d:	44 89 ee             	mov    %r13d,%esi
1130   e12860:	e8 1b cb 00 00       	call   e1f380 <get_parents>
1135   e12865:	89 c3                	mov    %eax,%ebx
1137   e12867:	31 ff                	xor    %edi,%edi
1139   e12869:	89 c6                	mov    %eax,%esi
113b   e1286b:	e8 00 00 00 00       	call   e12870 <fix_nodes+0x1140>	e1286c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1140   e12870:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
1145   e12875:	85 db                	test   %ebx,%ebx
1147   e12877:	0f 84 bc 02 00 00    	je     e12b39 <fix_nodes+0x1409>
114d   e1287d:	e8 00 00 00 00       	call   e12882 <fix_nodes+0x1152>	e1287e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1152   e12882:	e9 d8 1a 00 00       	jmp    e1435f <fix_nodes+0x2c2f>
1157   e12887:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
115c   e1288c:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
1160   e12890:	74 08                	je     e1289a <fix_nodes+0x116a>
1162   e12892:	4c 89 f7             	mov    %r14,%rdi
1165   e12895:	e8 00 00 00 00       	call   e1289a <fix_nodes+0x116a>	e12896: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
116a   e1289a:	4d 8b 36             	mov    (%r14),%r14
116d   e1289d:	4c 89 f0             	mov    %r14,%rax
1170   e128a0:	48 c1 e8 03          	shr    $0x3,%rax
1174   e128a4:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
117e   e128ae:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
1182   e128b2:	84 c0                	test   %al,%al
1184   e128b4:	0f 85 7e 48 00 00    	jne    e17138 <fix_nodes+0x5a08>
118a   e128ba:	41 8b 06             	mov    (%r14),%eax
118d   e128bd:	44 29 e8             	sub    %r13d,%eax
1190   e128c0:	48 63 d8             	movslq %eax,%rbx
1193   e128c3:	bf 08 00 00 00       	mov    $0x8,%edi
1198   e128c8:	89 de                	mov    %ebx,%esi
119a   e128ca:	e8 00 00 00 00       	call   e128cf <fix_nodes+0x119f>	e128cb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
119f   e128cf:	83 fb 07             	cmp    $0x7,%ebx
11a2   e128d2:	0f 87 78 4c 00 00    	ja     e17550 <fix_nodes+0x5e20>
11a8   e128d8:	e8 00 00 00 00       	call   e128dd <fix_nodes+0x11ad>	e128d9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
11ad   e128dd:	48 c1 e3 04          	shl    $0x4,%rbx
11b1   e128e1:	4c 01 f3             	add    %r14,%rbx
11b4   e128e4:	48 83 c3 08          	add    $0x8,%rbx
11b8   e128e8:	48 89 d8             	mov    %rbx,%rax
11bb   e128eb:	48 c1 e8 03          	shr    $0x3,%rax
11bf   e128ef:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
11c9   e128f9:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
11cd   e128fd:	74 08                	je     e12907 <fix_nodes+0x11d7>
11cf   e128ff:	48 89 df             	mov    %rbx,%rdi
11d2   e12902:	e8 00 00 00 00       	call   e12907 <fix_nodes+0x11d7>	e12903: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
11d7   e12907:	48 83 3b 00          	cmpq   $0x0,(%rbx)
11db   e1290b:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
11e0   e12910:	48 8b 9c 24 f0 00 00 00 	mov    0xf0(%rsp),%rbx
11e8   e12918:	0f 84 90 0d 00 00    	je     e136ae <fix_nodes+0x1f7e>
11ee   e1291e:	e8 00 00 00 00       	call   e12923 <fix_nodes+0x11f3>	e1291f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
11f3   e12923:	31 ff                	xor    %edi,%edi
11f5   e12925:	4c 89 ee             	mov    %r13,%rsi
11f8   e12928:	e8 00 00 00 00       	call   e1292d <fix_nodes+0x11fd>	e12929: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
11fd   e1292d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1207   e12937:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
120c   e1293c:	74 08                	je     e12946 <fix_nodes+0x1216>
120e   e1293e:	48 89 df             	mov    %rbx,%rdi
1211   e12941:	e8 00 00 00 00       	call   e12946 <fix_nodes+0x1216>	e12942: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1216   e12946:	48 8b 03             	mov    (%rbx),%rax
1219   e12949:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
121e   e1294e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1228   e12958:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
122d   e1295d:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
1231   e12961:	74 08                	je     e1296b <fix_nodes+0x123b>
1233   e12963:	4c 89 f7             	mov    %r14,%rdi
1236   e12966:	e8 00 00 00 00       	call   e1296b <fix_nodes+0x123b>	e12967: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
123b   e1296b:	4d 8b 36             	mov    (%r14),%r14
123e   e1296e:	4c 89 f0             	mov    %r14,%rax
1241   e12971:	48 c1 e8 03          	shr    $0x3,%rax
1245   e12975:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
124f   e1297f:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
1253   e12983:	84 c0                	test   %al,%al
1255   e12985:	0f 85 cb 47 00 00    	jne    e17156 <fix_nodes+0x5a26>
125b   e1298b:	49 63 1e             	movslq (%r14),%rbx
125e   e1298e:	4d 85 ed             	test   %r13,%r13
1261   e12991:	0f 84 9d 03 00 00    	je     e12d34 <fix_nodes+0x1604>
1267   e12997:	44 29 eb             	sub    %r13d,%ebx
126a   e1299a:	48 63 db             	movslq %ebx,%rbx
126d   e1299d:	bf 08 00 00 00       	mov    $0x8,%edi
1272   e129a2:	89 de                	mov    %ebx,%esi
1274   e129a4:	e8 00 00 00 00       	call   e129a9 <fix_nodes+0x1279>	e129a5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1279   e129a9:	83 fb 07             	cmp    $0x7,%ebx
127c   e129ac:	0f 87 06 4f 00 00    	ja     e178b8 <fix_nodes+0x6188>
1282   e129b2:	e8 00 00 00 00       	call   e129b7 <fix_nodes+0x1287>	e129b3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1287   e129b7:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
1291   e129c1:	48 c1 e3 04          	shl    $0x4,%rbx
1295   e129c5:	4c 01 f3             	add    %r14,%rbx
1298   e129c8:	48 83 c3 08          	add    $0x8,%rbx
129c   e129cc:	48 89 d8             	mov    %rbx,%rax
129f   e129cf:	48 c1 e8 03          	shr    $0x3,%rax
12a3   e129d3:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
12a8   e129d8:	74 08                	je     e129e2 <fix_nodes+0x12b2>
12aa   e129da:	48 89 df             	mov    %rbx,%rdi
12ad   e129dd:	e8 00 00 00 00       	call   e129e2 <fix_nodes+0x12b2>	e129de: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
12b2   e129e2:	48 8b 03             	mov    (%rbx),%rax
12b5   e129e5:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
12ba   e129ea:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
12bf   e129ef:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
12c4   e129f4:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
12c9   e129f9:	74 08                	je     e12a03 <fix_nodes+0x12d3>
12cb   e129fb:	48 89 df             	mov    %rbx,%rdi
12ce   e129fe:	e8 00 00 00 00       	call   e12a03 <fix_nodes+0x12d3>	e129ff: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
12d3   e12a03:	4c 8b 3b             	mov    (%rbx),%r15
12d6   e12a06:	4c 89 f8             	mov    %r15,%rax
12d9   e12a09:	48 c1 e8 03          	shr    $0x3,%rax
12dd   e12a0d:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
12e2   e12a12:	84 c0                	test   %al,%al
12e4   e12a14:	0f 85 b8 47 00 00    	jne    e171d2 <fix_nodes+0x5aa2>
12ea   e12a1a:	41 8b 07             	mov    (%r15),%eax
12ed   e12a1d:	45 8d 75 01          	lea    0x1(%r13),%r14d
12f1   e12a21:	44 29 f0             	sub    %r14d,%eax
12f4   e12a24:	48 63 d8             	movslq %eax,%rbx
12f7   e12a27:	bf 08 00 00 00       	mov    $0x8,%edi
12fc   e12a2c:	89 de                	mov    %ebx,%esi
12fe   e12a2e:	e8 00 00 00 00       	call   e12a33 <fix_nodes+0x1303>	e12a2f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1303   e12a33:	83 fb 07             	cmp    $0x7,%ebx
1306   e12a36:	0f 87 95 4e 00 00    	ja     e178d1 <fix_nodes+0x61a1>
130c   e12a3c:	e8 00 00 00 00       	call   e12a41 <fix_nodes+0x1311>	e12a3d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1311   e12a41:	48 c1 e3 04          	shl    $0x4,%rbx
1315   e12a45:	4c 01 fb             	add    %r15,%rbx
1318   e12a48:	48 83 c3 08          	add    $0x8,%rbx
131c   e12a4c:	48 89 d8             	mov    %rbx,%rax
131f   e12a4f:	48 c1 e8 03          	shr    $0x3,%rax
1323   e12a53:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
132d   e12a5d:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1331   e12a61:	74 08                	je     e12a6b <fix_nodes+0x133b>
1333   e12a63:	48 89 df             	mov    %rbx,%rdi
1336   e12a66:	e8 00 00 00 00       	call   e12a6b <fix_nodes+0x133b>	e12a67: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
133b   e12a6b:	48 8b 1b             	mov    (%rbx),%rbx
133e   e12a6e:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
1343   e12a73:	4c 89 ef             	mov    %r13,%rdi
1346   e12a76:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
134b   e12a7b:	e8 e0 de 00 00       	call   e20960 <create_virtual_node>
1350   e12a80:	48 85 db             	test   %rbx,%rbx
1353   e12a83:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
1358   e12a88:	0f 84 ca 03 00 00    	je     e12e58 <fix_nodes+0x1728>
135e   e12a8e:	48 89 5c 24 50       	mov    %rbx,0x50(%rsp)
1363   e12a93:	4c 89 ef             	mov    %r13,%rdi
1366   e12a96:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
136b   e12a9b:	e8 e0 c8 00 00       	call   e1f380 <get_parents>
1370   e12aa0:	89 c3                	mov    %eax,%ebx
1372   e12aa2:	31 ff                	xor    %edi,%edi
1374   e12aa4:	89 c6                	mov    %eax,%esi
1376   e12aa6:	e8 00 00 00 00       	call   e12aab <fix_nodes+0x137b>	e12aa7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
137b   e12aab:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
1380   e12ab0:	85 db                	test   %ebx,%ebx
1382   e12ab2:	0f 84 d4 07 00 00    	je     e1328c <fix_nodes+0x1b5c>
1388   e12ab8:	e8 00 00 00 00       	call   e12abd <fix_nodes+0x138d>	e12ab9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
138d   e12abd:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
1397   e12ac7:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
139c   e12acc:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
13a1   e12ad1:	e9 89 18 00 00       	jmp    e1435f <fix_nodes+0x2c2f>
13a6   e12ad6:	31 ff                	xor    %edi,%edi
13a8   e12ad8:	4c 89 ee             	mov    %r13,%rsi
13ab   e12adb:	e8 00 00 00 00       	call   e12ae0 <fix_nodes+0x13b0>	e12adc: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
13b0   e12ae0:	4d 85 ed             	test   %r13,%r13
13b3   e12ae3:	0f 84 07 15 00 00    	je     e13ff0 <fix_nodes+0x28c0>
13b9   e12ae9:	e8 00 00 00 00       	call   e12aee <fix_nodes+0x13be>	e12aea: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
13be   e12aee:	48 89 df             	mov    %rbx,%rdi
13c1   e12af1:	4c 89 eb             	mov    %r13,%rbx
13c4   e12af4:	44 89 ee             	mov    %r13d,%esi
13c7   e12af7:	e8 44 a6 00 00       	call   e1d140 <get_empty_nodes>
13cc   e12afc:	41 89 c5             	mov    %eax,%r13d
13cf   e12aff:	89 c7                	mov    %eax,%edi
13d1   e12b01:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e12b04: R_X86_64_32S	.data+0x66eda0
13d8   e12b08:	e8 00 00 00 00       	call   e12b0d <fix_nodes+0x13dd>	e12b09: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
13dd   e12b0d:	41 83 fd fd          	cmp    $0xfffffffd,%r13d
13e1   e12b11:	0f 84 b2 03 00 00    	je     e12ec9 <fix_nodes+0x1799>
13e7   e12b17:	45 85 ed             	test   %r13d,%r13d
13ea   e12b1a:	0f 84 bb 03 00 00    	je     e12edb <fix_nodes+0x17ab>
13f0   e12b20:	4c 89 6c 24 38       	mov    %r13,0x38(%rsp)
13f5   e12b25:	41 83 fd ff          	cmp    $0xffffffff,%r13d
13f9   e12b29:	0f 85 c9 30 00 00    	jne    e15bf8 <fix_nodes+0x44c8>
13ff   e12b2f:	e8 00 00 00 00       	call   e12b34 <fix_nodes+0x1404>	e12b30: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1404   e12b34:	e9 9a 03 00 00       	jmp    e12ed3 <fix_nodes+0x17a3>
1409   e12b39:	48 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%rax
1411   e12b41:	48 8d 58 28          	lea    0x28(%rax),%rbx
1415   e12b45:	48 89 d8             	mov    %rbx,%rax
1418   e12b48:	48 c1 e8 03          	shr    $0x3,%rax
141c   e12b4c:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
1421   e12b51:	74 08                	je     e12b5b <fix_nodes+0x142b>
1423   e12b53:	48 89 df             	mov    %rbx,%rdi
1426   e12b56:	e8 00 00 00 00       	call   e12b5b <fix_nodes+0x142b>	e12b57: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
142b   e12b5b:	48 8b 1b             	mov    (%rbx),%rbx
142e   e12b5e:	48 83 c3 04          	add    $0x4,%rbx
1432   e12b62:	48 89 d8             	mov    %rbx,%rax
1435   e12b65:	48 c1 e8 03          	shr    $0x3,%rax
1439   e12b69:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
143e   e12b6e:	84 c0                	test   %al,%al
1440   e12b70:	0f 85 7a 46 00 00    	jne    e171f0 <fix_nodes+0x5ac0>
1446   e12b76:	0f b7 03             	movzwl (%rbx),%eax
1449   e12b79:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
144e   e12b7e:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
1453   e12b83:	48 89 df             	mov    %rbx,%rdi
1456   e12b86:	44 89 ee             	mov    %r13d,%esi
1459   e12b89:	e8 62 d7 00 00       	call   e202f0 <get_rfree>
145e   e12b8e:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
1463   e12b93:	48 89 df             	mov    %rbx,%rdi
1466   e12b96:	44 89 ee             	mov    %r13d,%esi
1469   e12b99:	e8 62 da 00 00       	call   e20600 <get_lfree>
146e   e12b9e:	89 84 24 98 00 00 00 	mov    %eax,0x98(%rsp)
1475   e12ba5:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
147a   e12baa:	48 8d 58 0c          	lea    0xc(%rax),%rbx
147e   e12bae:	48 89 d8             	mov    %rbx,%rax
1481   e12bb1:	48 c1 e8 03          	shr    $0x3,%rax
1485   e12bb5:	48 89 84 24 f8 00 00 00 	mov    %rax,0xf8(%rsp)
148d   e12bbd:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
1492   e12bc2:	84 c0                	test   %al,%al
1494   e12bc4:	0f 85 43 46 00 00    	jne    e1720d <fix_nodes+0x5add>
149a   e12bca:	0f b7 03             	movzwl (%rbx),%eax
149d   e12bcd:	66 89 84 24 cc 00 00 00 	mov    %ax,0xcc(%rsp)
14a5   e12bd5:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
14aa   e12bda:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
14af   e12bdf:	74 08                	je     e12be9 <fix_nodes+0x14b9>
14b1   e12be1:	4c 89 f7             	mov    %r14,%rdi
14b4   e12be4:	e8 00 00 00 00       	call   e12be9 <fix_nodes+0x14b9>	e12be5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
14b9   e12be9:	48 89 5c 24 68       	mov    %rbx,0x68(%rsp)
14be   e12bee:	4d 8b 36             	mov    (%r14),%r14
14c1   e12bf1:	4c 89 f0             	mov    %r14,%rax
14c4   e12bf4:	48 c1 e8 03          	shr    $0x3,%rax
14c8   e12bf8:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
14cd   e12bfd:	84 c0                	test   %al,%al
14cf   e12bff:	0f 85 25 46 00 00    	jne    e1722a <fix_nodes+0x5afa>
14d5   e12c05:	41 8b 06             	mov    (%r14),%eax
14d8   e12c08:	44 29 e8             	sub    %r13d,%eax
14db   e12c0b:	48 63 d8             	movslq %eax,%rbx
14de   e12c0e:	bf 08 00 00 00       	mov    $0x8,%edi
14e3   e12c13:	89 de                	mov    %ebx,%esi
14e5   e12c15:	e8 00 00 00 00       	call   e12c1a <fix_nodes+0x14ea>	e12c16: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
14ea   e12c1a:	83 fb 07             	cmp    $0x7,%ebx
14ed   e12c1d:	0f 87 4e 4f 00 00    	ja     e17b71 <fix_nodes+0x6441>
14f3   e12c23:	e8 00 00 00 00       	call   e12c28 <fix_nodes+0x14f8>	e12c24: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
14f8   e12c28:	48 c1 e3 04          	shl    $0x4,%rbx
14fc   e12c2c:	4c 01 f3             	add    %r14,%rbx
14ff   e12c2f:	48 83 c3 08          	add    $0x8,%rbx
1503   e12c33:	48 89 d8             	mov    %rbx,%rax
1506   e12c36:	48 c1 e8 03          	shr    $0x3,%rax
150a   e12c3a:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
150f   e12c3f:	74 08                	je     e12c49 <fix_nodes+0x1519>
1511   e12c41:	48 89 df             	mov    %rbx,%rdi
1514   e12c44:	e8 00 00 00 00       	call   e12c49 <fix_nodes+0x1519>	e12c45: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1519   e12c49:	4c 8b 2b             	mov    (%rbx),%r13
151c   e12c4c:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
1521   e12c51:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
1526   e12c56:	84 c0                	test   %al,%al
1528   e12c58:	0f 85 ea 45 00 00    	jne    e17248 <fix_nodes+0x5b18>
152e   e12c5e:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
1533   e12c63:	8b 00                	mov    (%rax),%eax
1535   e12c65:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
153a   e12c6a:	4d 8d 75 28          	lea    0x28(%r13),%r14
153e   e12c6e:	4c 89 f0             	mov    %r14,%rax
1541   e12c71:	48 c1 e8 03          	shr    $0x3,%rax
1545   e12c75:	48 89 84 24 20 01 00 00 	mov    %rax,0x120(%rsp)
154d   e12c7d:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
1552   e12c82:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
1557   e12c87:	74 08                	je     e12c91 <fix_nodes+0x1561>
1559   e12c89:	4c 89 f7             	mov    %r14,%rdi
155c   e12c8c:	e8 00 00 00 00       	call   e12c91 <fix_nodes+0x1561>	e12c8d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1561   e12c91:	49 8b 06             	mov    (%r14),%rax
1564   e12c94:	48 89 84 24 a0 00 00 00 	mov    %rax,0xa0(%rsp)
156c   e12c9c:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
1571   e12ca1:	48 8d 1c c3          	lea    (%rbx,%rax,8),%rbx
1575   e12ca5:	48 81 c3 e8 00 00 00 	add    $0xe8,%rbx
157c   e12cac:	48 89 d8             	mov    %rbx,%rax
157f   e12caf:	48 c1 e8 03          	shr    $0x3,%rax
1583   e12cb3:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
1588   e12cb8:	74 08                	je     e12cc2 <fix_nodes+0x1592>
158a   e12cba:	48 89 df             	mov    %rbx,%rdi
158d   e12cbd:	e8 00 00 00 00       	call   e12cc2 <fix_nodes+0x1592>	e12cbe: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1592   e12cc2:	4c 89 b4 24 28 01 00 00 	mov    %r14,0x128(%rsp)
159a   e12cca:	48 8b 1b             	mov    (%rbx),%rbx
159d   e12ccd:	48 85 db             	test   %rbx,%rbx
15a0   e12cd0:	0f 84 4a 02 00 00    	je     e12f20 <fix_nodes+0x17f0>
15a6   e12cd6:	e8 00 00 00 00       	call   e12cdb <fix_nodes+0x15ab>	e12cd7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
15ab   e12cdb:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
15b0   e12ce0:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
15b5   e12ce5:	4c 8d 34 88          	lea    (%rax,%rcx,4),%r14
15b9   e12ce9:	49 81 c6 dc 01 00 00 	add    $0x1dc,%r14
15c0   e12cf0:	4c 89 f0             	mov    %r14,%rax
15c3   e12cf3:	48 c1 e8 03          	shr    $0x3,%rax
15c7   e12cf7:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
15cc   e12cfc:	84 c0                	test   %al,%al
15ce   e12cfe:	0f 85 a2 45 00 00    	jne    e172a6 <fix_nodes+0x5b76>
15d4   e12d04:	4d 63 36             	movslq (%r14),%r14
15d7   e12d07:	48 83 c3 28          	add    $0x28,%rbx
15db   e12d0b:	48 89 d8             	mov    %rbx,%rax
15de   e12d0e:	48 c1 e8 03          	shr    $0x3,%rax
15e2   e12d12:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
15e7   e12d17:	74 08                	je     e12d21 <fix_nodes+0x15f1>
15e9   e12d19:	48 89 df             	mov    %rbx,%rdi
15ec   e12d1c:	e8 00 00 00 00       	call   e12d21 <fix_nodes+0x15f1>	e12d1d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
15f1   e12d21:	48 8b 03             	mov    (%rbx),%rax
15f4   e12d24:	49 c1 e6 04          	shl    $0x4,%r14
15f8   e12d28:	4c 01 f0             	add    %r14,%rax
15fb   e12d2b:	48 83 c0 18          	add    $0x18,%rax
15ff   e12d2f:	e9 f3 01 00 00       	jmp    e12f27 <fix_nodes+0x17f7>
1604   e12d34:	bf 08 00 00 00       	mov    $0x8,%edi
1609   e12d39:	89 de                	mov    %ebx,%esi
160b   e12d3b:	e8 00 00 00 00       	call   e12d40 <fix_nodes+0x1610>	e12d3c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1610   e12d40:	83 fb 07             	cmp    $0x7,%ebx
1613   e12d43:	0f 87 a0 4e 00 00    	ja     e17be9 <fix_nodes+0x64b9>
1619   e12d49:	e8 00 00 00 00       	call   e12d4e <fix_nodes+0x161e>	e12d4a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
161e   e12d4e:	48 c1 e3 04          	shl    $0x4,%rbx
1622   e12d52:	4c 01 f3             	add    %r14,%rbx
1625   e12d55:	48 83 c3 08          	add    $0x8,%rbx
1629   e12d59:	48 89 d8             	mov    %rbx,%rax
162c   e12d5c:	48 c1 e8 03          	shr    $0x3,%rax
1630   e12d60:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
163a   e12d6a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
163e   e12d6e:	74 08                	je     e12d78 <fix_nodes+0x1648>
1640   e12d70:	48 89 df             	mov    %rbx,%rdi
1643   e12d73:	e8 00 00 00 00       	call   e12d78 <fix_nodes+0x1648>	e12d74: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1648   e12d78:	4c 8b 3b             	mov    (%rbx),%r15
164b   e12d7b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1655   e12d85:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
165a   e12d8a:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
165e   e12d8e:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
1663   e12d93:	74 08                	je     e12d9d <fix_nodes+0x166d>
1665   e12d95:	48 89 df             	mov    %rbx,%rdi
1668   e12d98:	e8 00 00 00 00       	call   e12d9d <fix_nodes+0x166d>	e12d99: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
166d   e12d9d:	4c 8b 33             	mov    (%rbx),%r14
1670   e12da0:	4c 89 f0             	mov    %r14,%rax
1673   e12da3:	48 c1 e8 03          	shr    $0x3,%rax
1677   e12da7:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1681   e12db1:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
1685   e12db5:	84 c0                	test   %al,%al
1687   e12db7:	0f 85 ad 44 00 00    	jne    e1726a <fix_nodes+0x5b3a>
168d   e12dbd:	41 8b 06             	mov    (%r14),%eax
1690   e12dc0:	83 c0 ff             	add    $0xffffffff,%eax
1693   e12dc3:	48 63 d8             	movslq %eax,%rbx
1696   e12dc6:	bf 08 00 00 00       	mov    $0x8,%edi
169b   e12dcb:	89 de                	mov    %ebx,%esi
169d   e12dcd:	e8 00 00 00 00       	call   e12dd2 <fix_nodes+0x16a2>	e12dce: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
16a2   e12dd2:	83 fb 07             	cmp    $0x7,%ebx
16a5   e12dd5:	0f 87 27 4e 00 00    	ja     e17c02 <fix_nodes+0x64d2>
16ab   e12ddb:	e8 00 00 00 00       	call   e12de0 <fix_nodes+0x16b0>	e12ddc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
16b0   e12de0:	48 c1 e3 04          	shl    $0x4,%rbx
16b4   e12de4:	4c 01 f3             	add    %r14,%rbx
16b7   e12de7:	48 83 c3 08          	add    $0x8,%rbx
16bb   e12deb:	48 89 d8             	mov    %rbx,%rax
16be   e12dee:	48 c1 e8 03          	shr    $0x3,%rax
16c2   e12df2:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
16cc   e12dfc:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
16d0   e12e00:	74 08                	je     e12e0a <fix_nodes+0x16da>
16d2   e12e02:	48 89 df             	mov    %rbx,%rdi
16d5   e12e05:	e8 00 00 00 00       	call   e12e0a <fix_nodes+0x16da>	e12e06: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
16da   e12e0a:	48 83 3b 00          	cmpq   $0x0,(%rbx)
16de   e12e0e:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
16e3   e12e13:	0f 84 ab 7d 00 00    	je     e1abc4 <fix_nodes+0x9494>
16e9   e12e19:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
16ee   e12e1e:	31 f6                	xor    %esi,%esi
16f0   e12e20:	e8 5b c5 00 00       	call   e1f380 <get_parents>
16f5   e12e25:	41 89 c7             	mov    %eax,%r15d
16f8   e12e28:	31 ff                	xor    %edi,%edi
16fa   e12e2a:	89 c6                	mov    %eax,%esi
16fc   e12e2c:	e8 00 00 00 00       	call   e12e31 <fix_nodes+0x1701>	e12e2d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1701   e12e31:	45 85 ff             	test   %r15d,%r15d
1704   e12e34:	0f 84 c3 05 00 00    	je     e133fd <fix_nodes+0x1ccd>
170a   e12e3a:	4c 89 7c 24 38       	mov    %r15,0x38(%rsp)
170f   e12e3f:	e8 00 00 00 00       	call   e12e44 <fix_nodes+0x1714>	e12e40: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1714   e12e44:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
171e   e12e4e:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
1723   e12e53:	e9 07 15 00 00       	jmp    e1435f <fix_nodes+0x2c2f>
1728   e12e58:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
172d   e12e5d:	48 83 c7 08          	add    $0x8,%rdi
1731   e12e61:	48 89 f8             	mov    %rdi,%rax
1734   e12e64:	48 c1 e8 03          	shr    $0x3,%rax
1738   e12e68:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
1742   e12e72:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
1747   e12e77:	84 c0                	test   %al,%al
1749   e12e79:	0f 85 45 44 00 00    	jne    e172c4 <fix_nodes+0x5b94>
174f   e12e7f:	0f b7 1f             	movzwl (%rdi),%ebx
1752   e12e82:	31 ff                	xor    %edi,%edi
1754   e12e84:	89 de                	mov    %ebx,%esi
1756   e12e86:	e8 00 00 00 00       	call   e12e8b <fix_nodes+0x175b>	e12e87: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
175b   e12e8b:	85 db                	test   %ebx,%ebx
175d   e12e8d:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
1762   e12e92:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
1767   e12e97:	0f 85 26 7f 00 00    	jne    e1adc3 <fix_nodes+0x9693>
176d   e12e9d:	e8 00 00 00 00       	call   e12ea2 <fix_nodes+0x1772>	e12e9e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1772   e12ea2:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
1777   e12ea7:	48 89 df             	mov    %rbx,%rdi
177a   e12eaa:	44 89 ee             	mov    %r13d,%esi
177d   e12ead:	31 d2                	xor    %edx,%edx
177f   e12eaf:	31 c9                	xor    %ecx,%ecx
1781   e12eb1:	45 31 c0             	xor    %r8d,%r8d
1784   e12eb4:	45 31 c9             	xor    %r9d,%r9d
1787   e12eb7:	6a ff                	push   $0xffffffffffffffff
1789   e12eb9:	6a ff                	push   $0xffffffffffffffff
178b   e12ebb:	e8 e0 bb 00 00       	call   e1eaa0 <set_parameters>
1790   e12ec0:	48 83 c4 10          	add    $0x10,%rsp
1794   e12ec4:	e9 bb 14 00 00       	jmp    e14384 <fix_nodes+0x2c54>
1799   e12ec9:	4c 89 6c 24 38       	mov    %r13,0x38(%rsp)
179e   e12ece:	e8 00 00 00 00       	call   e12ed3 <fix_nodes+0x17a3>	e12ecf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
17a3   e12ed3:	49 89 dd             	mov    %rbx,%r13
17a6   e12ed6:	e9 84 14 00 00       	jmp    e1435f <fix_nodes+0x2c2f>
17ab   e12edb:	e8 00 00 00 00       	call   e12ee0 <fix_nodes+0x17b0>	e12edc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
17b0   e12ee0:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
17b5   e12ee5:	49 89 dd             	mov    %rbx,%r13
17b8   e12ee8:	e9 4b 14 00 00       	jmp    e14338 <fix_nodes+0x2c08>
17bd   e12eed:	e8 00 00 00 00       	call   e12ef2 <fix_nodes+0x17c2>	e12eee: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
17c2   e12ef2:	31 ff                	xor    %edi,%edi
17c4   e12ef4:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e12ef7: R_X86_64_32S	.rodata+0x1b9240
17cb   e12efb:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e12efe: R_X86_64_32S	.rodata.str1.1+0x8ee9c
17d2   e12f02:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e12f05: R_X86_64_32S	.rodata+0x1b9460
17d9   e12f09:	41 b8 1f 08 00 00    	mov    $0x81f,%r8d
17df   e12f0f:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	e12f12: R_X86_64_32S	.rodata.str1.1+0x8ee9c
17e6   e12f16:	e8 00 00 00 00       	call   e12f1b <fix_nodes+0x17eb>	e12f17: R_X86_64_PLT32	__reiserfs_panic-0x4
17eb   e12f1b:	e9 15 f8 ff ff       	jmp    e12735 <fix_nodes+0x1005>
17f0   e12f20:	e8 00 00 00 00       	call   e12f25 <fix_nodes+0x17f5>	e12f21: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
17f5   e12f25:	31 c0                	xor    %eax,%eax
17f7   e12f27:	48 89 84 24 a8 00 00 00 	mov    %rax,0xa8(%rsp)
17ff   e12f2f:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
1804   e12f34:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
1809   e12f39:	8d 1c 01             	lea    (%rcx,%rax,1),%ebx
180c   e12f3c:	03 9c 24 98 00 00 00 	add    0x98(%rsp),%ebx
1813   e12f43:	49 83 c5 20          	add    $0x20,%r13
1817   e12f47:	4c 89 e8             	mov    %r13,%rax
181a   e12f4a:	48 c1 e8 03          	shr    $0x3,%rax
181e   e12f4e:	48 89 84 24 30 01 00 00 	mov    %rax,0x130(%rsp)
1826   e12f56:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
182b   e12f5b:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
1830   e12f60:	74 08                	je     e12f6a <fix_nodes+0x183a>
1832   e12f62:	4c 89 ef             	mov    %r13,%rdi
1835   e12f65:	e8 00 00 00 00       	call   e12f6a <fix_nodes+0x183a>	e12f66: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
183a   e12f6a:	48 63 c3             	movslq %ebx,%rax
183d   e12f6d:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
1842   e12f72:	49 8b 45 00          	mov    0x0(%r13),%rax
1846   e12f76:	4c 89 ac 24 08 01 00 00 	mov    %r13,0x108(%rsp)
184e   e12f7e:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
1853   e12f83:	48 89 84 24 90 00 00 00 	mov    %rax,0x90(%rsp)
185b   e12f8b:	44 01 e8             	add    %r13d,%eax
185e   e12f8e:	83 c0 e8             	add    $0xffffffe8,%eax
1861   e12f91:	4c 63 e8             	movslq %eax,%r13
1864   e12f94:	31 ff                	xor    %edi,%edi
1866   e12f96:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
186b   e12f9b:	48 89 de             	mov    %rbx,%rsi
186e   e12f9e:	e8 00 00 00 00       	call   e12fa3 <fix_nodes+0x1873>	e12f9f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1873   e12fa3:	48 85 db             	test   %rbx,%rbx
1876   e12fa6:	74 4f                	je     e12ff7 <fix_nodes+0x18c7>
1878   e12fa8:	49 83 c5 10          	add    $0x10,%r13
187c   e12fac:	4c 89 ef             	mov    %r13,%rdi
187f   e12faf:	48 8b 74 24 50       	mov    0x50(%rsp),%rsi
1884   e12fb4:	e8 00 00 00 00       	call   e12fb9 <fix_nodes+0x1889>	e12fb5: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
1889   e12fb9:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
188e   e12fbe:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
1893   e12fc3:	89 de                	mov    %ebx,%esi
1895   e12fc5:	e8 00 00 00 00       	call   e12fca <fix_nodes+0x189a>	e12fc6: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
189a   e12fca:	4c 3b 6c 24 50       	cmp    0x50(%rsp),%r13
189f   e12fcf:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
18a4   e12fd4:	0f 86 0a 05 00 00    	jbe    e134e4 <fix_nodes+0x1db4>
18aa   e12fda:	41 39 dd             	cmp    %ebx,%r13d
18ad   e12fdd:	0f 8f 01 05 00 00    	jg     e134e4 <fix_nodes+0x1db4>
18b3   e12fe3:	e8 00 00 00 00       	call   e12fe8 <fix_nodes+0x18b8>	e12fe4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
18b8   e12fe8:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
18bd   e12fed:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
18c2   e12ff2:	e9 41 13 00 00       	jmp    e14338 <fix_nodes+0x2c08>
18c7   e12ff7:	4c 89 ac 24 b0 00 00 00 	mov    %r13,0xb0(%rsp)
18cf   e12fff:	48 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%rax
18d7   e13007:	48 8d 58 20          	lea    0x20(%rax),%rbx
18db   e1300b:	4c 8d 70 27          	lea    0x27(%rax),%r14
18df   e1300f:	48 89 d8             	mov    %rbx,%rax
18e2   e13012:	48 c1 e8 03          	shr    $0x3,%rax
18e6   e13016:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
18eb   e1301b:	84 c0                	test   %al,%al
18ed   e1301d:	0f 85 f3 42 00 00    	jne    e17316 <fix_nodes+0x5be6>
18f3   e13023:	4c 89 f0             	mov    %r14,%rax
18f6   e13026:	4c 89 b4 24 10 01 00 00 	mov    %r14,0x110(%rsp)
18fe   e1302e:	49 c1 ee 03          	shr    $0x3,%r14
1902   e13032:	43 0f b6 04 26       	movzbl (%r14,%r12,1),%eax
1907   e13037:	84 c0                	test   %al,%al
1909   e13039:	0f 85 f6 42 00 00    	jne    e17335 <fix_nodes+0x5c05>
190f   e1303f:	48 8b 1b             	mov    (%rbx),%rbx
1912   e13042:	48 bf 00 00 00 00 00 00 00 40 	movabs $0x4000000000000000,%rdi
191c   e1304c:	48 89 de             	mov    %rbx,%rsi
191f   e1304f:	e8 00 00 00 00       	call   e13054 <fix_nodes+0x1924>	e13050: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1924   e13054:	49 89 df             	mov    %rbx,%r15
1927   e13057:	49 c1 ef 3c          	shr    $0x3c,%r15
192b   e1305b:	45 8d 67 fc          	lea    -0x4(%r15),%r12d
192f   e1305f:	41 0f b7 f4          	movzwl %r12w,%esi
1933   e13063:	bf fd ff 00 00       	mov    $0xfffd,%edi
1938   e13068:	e8 00 00 00 00       	call   e1306d <fix_nodes+0x193d>	e13069: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
193d   e1306d:	48 89 d8             	mov    %rbx,%rax
1940   e13070:	48 c1 e8 3e          	shr    $0x3e,%rax
1944   e13074:	0f 85 a7 04 00 00    	jne    e13521 <fix_nodes+0x1df1>
194a   e1307a:	66 41 83 fc fc       	cmp    $0xfffc,%r12w
194f   e1307f:	0f 86 9c 04 00 00    	jbe    e13521 <fix_nodes+0x1df1>
1955   e13085:	e8 00 00 00 00       	call   e1308a <fix_nodes+0x195a>	e13086: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
195a   e1308a:	48 b8 00 00 00 00 00 00 00 40 	movabs $0x4000000000000000,%rax
1964   e13094:	48 39 c3             	cmp    %rax,%rbx
1967   e13097:	72 06                	jb     e1309f <fix_nodes+0x196f>
1969   e13099:	41 bf 0f 00 00 00    	mov    $0xf,%r15d
196f   e1309f:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
1979   e130a9:	4c 8b b4 24 b0 00 00 00 	mov    0xb0(%rsp),%r14
1981   e130b1:	48 8b b4 24 90 00 00 00 	mov    0x90(%rsp),%rsi
1989   e130b9:	4a 8d 1c fd 00 00 00 00 	lea    0x0(,%r15,8),%rbx	e130bd: R_X86_64_32S	item_ops
1991   e130c1:	48 89 d8             	mov    %rbx,%rax
1994   e130c4:	48 c1 e8 03          	shr    $0x3,%rax
1998   e130c8:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
199d   e130cd:	74 10                	je     e130df <fix_nodes+0x19af>
199f   e130cf:	48 89 df             	mov    %rbx,%rdi
19a2   e130d2:	e8 00 00 00 00       	call   e130d7 <fix_nodes+0x19a7>	e130d3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
19a7   e130d7:	48 8b b4 24 90 00 00 00 	mov    0x90(%rsp),%rsi
19af   e130df:	48 83 84 24 a0 00 00 00 18 	addq   $0x18,0xa0(%rsp)
19b8   e130e8:	48 8b 1b             	mov    (%rbx),%rbx
19bb   e130eb:	48 83 c3 10          	add    $0x10,%rbx
19bf   e130ef:	48 89 d8             	mov    %rbx,%rax
19c2   e130f2:	48 c1 e8 03          	shr    $0x3,%rax
19c6   e130f6:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
19cb   e130fb:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
19d0   e13100:	74 10                	je     e13112 <fix_nodes+0x19e2>
19d2   e13102:	48 89 df             	mov    %rbx,%rdi
19d5   e13105:	e8 00 00 00 00       	call   e1310a <fix_nodes+0x19da>	e13106: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
19da   e1310a:	48 8b b4 24 90 00 00 00 	mov    0x90(%rsp),%rsi
19e2   e13112:	4c 8b 1b             	mov    (%rbx),%r11
19e5   e13115:	48 8b bc 24 a0 00 00 00 	mov    0xa0(%rsp),%rdi
19ed   e1311d:	e8 00 00 00 00       	call   e13122 <fix_nodes+0x19f2>	e1311e: R_X86_64_PLT32	__x86_indirect_thunk_r11-0x4
19f2   e13122:	89 c3                	mov    %eax,%ebx
19f4   e13124:	31 ff                	xor    %edi,%edi
19f6   e13126:	89 c6                	mov    %eax,%esi
19f8   e13128:	e8 00 00 00 00       	call   e1312d <fix_nodes+0x19fd>	e13129: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
19fd   e1312d:	85 db                	test   %ebx,%ebx
19ff   e1312f:	74 0c                	je     e1313d <fix_nodes+0x1a0d>
1a01   e13131:	49 83 c6 e8          	add    $0xffffffffffffffe8,%r14
1a05   e13135:	4c 89 b4 24 b0 00 00 00 	mov    %r14,0xb0(%rsp)
1a0d   e1313d:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
1a12   e13142:	48 8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%rax
1a1a   e1314a:	48 85 c0             	test   %rax,%rax
1a1d   e1314d:	0f 84 8e 05 00 00    	je     e136e1 <fix_nodes+0x1fb1>
1a23   e13153:	48 8d 58 08          	lea    0x8(%rax),%rbx
1a27   e13157:	4c 8d 70 0f          	lea    0xf(%rax),%r14
1a2b   e1315b:	48 89 d8             	mov    %rbx,%rax
1a2e   e1315e:	48 c1 e8 03          	shr    $0x3,%rax
1a32   e13162:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
1a37   e13167:	84 c0                	test   %al,%al
1a39   e13169:	0f 85 fa 43 00 00    	jne    e17569 <fix_nodes+0x5e39>
1a3f   e1316f:	4c 89 f0             	mov    %r14,%rax
1a42   e13172:	4c 89 b4 24 a0 00 00 00 	mov    %r14,0xa0(%rsp)
1a4a   e1317a:	49 c1 ee 03          	shr    $0x3,%r14
1a4e   e1317e:	43 0f b6 04 26       	movzbl (%r14,%r12,1),%eax
1a53   e13183:	84 c0                	test   %al,%al
1a55   e13185:	0f 85 fd 43 00 00    	jne    e17588 <fix_nodes+0x5e58>
1a5b   e1318b:	48 8b 1b             	mov    (%rbx),%rbx
1a5e   e1318e:	49 bd 00 00 00 00 00 00 00 40 	movabs $0x4000000000000000,%r13
1a68   e13198:	4c 89 ef             	mov    %r13,%rdi
1a6b   e1319b:	48 89 de             	mov    %rbx,%rsi
1a6e   e1319e:	e8 00 00 00 00       	call   e131a3 <fix_nodes+0x1a73>	e1319f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1a73   e131a3:	49 89 df             	mov    %rbx,%r15
1a76   e131a6:	49 c1 ef 3c          	shr    $0x3c,%r15
1a7a   e131aa:	45 8d 67 fc          	lea    -0x4(%r15),%r12d
1a7e   e131ae:	41 0f b7 f4          	movzwl %r12w,%esi
1a82   e131b2:	bf fd ff 00 00       	mov    $0xfffd,%edi
1a87   e131b7:	e8 00 00 00 00       	call   e131bc <fix_nodes+0x1a8c>	e131b8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
1a8c   e131bc:	4c 39 eb             	cmp    %r13,%rbx
1a8f   e131bf:	0f 83 32 05 00 00    	jae    e136f7 <fix_nodes+0x1fc7>
1a95   e131c5:	66 41 83 fc fc       	cmp    $0xfffc,%r12w
1a9a   e131ca:	0f 86 27 05 00 00    	jbe    e136f7 <fix_nodes+0x1fc7>
1aa0   e131d0:	e8 00 00 00 00       	call   e131d5 <fix_nodes+0x1aa5>	e131d1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1aa5   e131d5:	48 b8 00 00 00 00 00 00 00 40 	movabs $0x4000000000000000,%rax
1aaf   e131df:	48 39 c3             	cmp    %rax,%rbx
1ab2   e131e2:	72 06                	jb     e131ea <fix_nodes+0x1aba>
1ab4   e131e4:	41 bf 0f 00 00 00    	mov    $0xf,%r15d
1aba   e131ea:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
1ac4   e131f4:	4c 8b b4 24 a8 00 00 00 	mov    0xa8(%rsp),%r14
1acc   e131fc:	4c 8b ac 24 08 01 00 00 	mov    0x108(%rsp),%r13
1ad4   e13204:	4a 8d 1c fd 00 00 00 00 	lea    0x0(,%r15,8),%rbx	e13208: R_X86_64_32S	item_ops
1adc   e1320c:	48 89 d8             	mov    %rbx,%rax
1adf   e1320f:	48 c1 e8 03          	shr    $0x3,%rax
1ae3   e13213:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
1ae8   e13218:	74 08                	je     e13222 <fix_nodes+0x1af2>
1aea   e1321a:	48 89 df             	mov    %rbx,%rdi
1aed   e1321d:	e8 00 00 00 00       	call   e13222 <fix_nodes+0x1af2>	e1321e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1af2   e13222:	48 8b 1b             	mov    (%rbx),%rbx
1af5   e13225:	48 83 c3 10          	add    $0x10,%rbx
1af9   e13229:	48 89 d8             	mov    %rbx,%rax
1afc   e1322c:	48 c1 e8 03          	shr    $0x3,%rax
1b00   e13230:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
1b05   e13235:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
1b0a   e1323a:	74 08                	je     e13244 <fix_nodes+0x1b14>
1b0c   e1323c:	48 89 df             	mov    %rbx,%rdi
1b0f   e1323f:	e8 00 00 00 00       	call   e13244 <fix_nodes+0x1b14>	e13240: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1b14   e13244:	48 8b 1b             	mov    (%rbx),%rbx
1b17   e13247:	48 8b 84 24 30 01 00 00 	mov    0x130(%rsp),%rax
1b1f   e1324f:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
1b24   e13254:	74 08                	je     e1325e <fix_nodes+0x1b2e>
1b26   e13256:	4c 89 ef             	mov    %r13,%rdi
1b29   e13259:	e8 00 00 00 00       	call   e1325e <fix_nodes+0x1b2e>	e1325a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1b2e   e1325e:	49 8b 75 00          	mov    0x0(%r13),%rsi
1b32   e13262:	4c 89 f7             	mov    %r14,%rdi
1b35   e13265:	49 89 db             	mov    %rbx,%r11
1b38   e13268:	e8 00 00 00 00       	call   e1326d <fix_nodes+0x1b3d>	e13269: R_X86_64_PLT32	__x86_indirect_thunk_r11-0x4
1b3d   e1326d:	89 c3                	mov    %eax,%ebx
1b3f   e1326f:	31 ff                	xor    %edi,%edi
1b41   e13271:	89 c6                	mov    %eax,%esi
1b43   e13273:	e8 00 00 00 00       	call   e13278 <fix_nodes+0x1b48>	e13274: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1b48   e13278:	85 db                	test   %ebx,%ebx
1b4a   e1327a:	0f 84 f9 04 00 00    	je     e13779 <fix_nodes+0x2049>
1b50   e13280:	48 c7 c0 e8 ff ff ff 	mov    $0xffffffffffffffe8,%rax
1b57   e13287:	e9 ef 04 00 00       	jmp    e1377b <fix_nodes+0x204b>
1b5c   e1328c:	4c 89 ef             	mov    %r13,%rdi
1b5f   e1328f:	4c 8b 64 24 28       	mov    0x28(%rsp),%r12
1b64   e13294:	44 89 e6             	mov    %r12d,%esi
1b67   e13297:	e8 54 d0 00 00       	call   e202f0 <get_rfree>
1b6c   e1329c:	41 89 c7             	mov    %eax,%r15d
1b6f   e1329f:	4c 89 ef             	mov    %r13,%rdi
1b72   e132a2:	44 89 e6             	mov    %r12d,%esi
1b75   e132a5:	e8 56 d3 00 00       	call   e20600 <get_lfree>
1b7a   e132aa:	4c 89 ef             	mov    %r13,%rdi
1b7d   e132ad:	44 89 e6             	mov    %r12d,%esi
1b80   e132b0:	89 c2                	mov    %eax,%edx
1b82   e132b2:	e8 f9 fb 00 00       	call   e22eb0 <check_left>
1b87   e132b7:	4c 89 ef             	mov    %r13,%rdi
1b8a   e132ba:	44 89 e6             	mov    %r12d,%esi
1b8d   e132bd:	44 89 fa             	mov    %r15d,%edx
1b90   e132c0:	e8 3b 05 01 00       	call   e23800 <check_right>
1b95   e132c5:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
1b9a   e132ca:	48 83 c7 08          	add    $0x8,%rdi
1b9e   e132ce:	49 89 fd             	mov    %rdi,%r13
1ba1   e132d1:	49 c1 ed 03          	shr    $0x3,%r13
1ba5   e132d5:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
1baf   e132df:	43 0f b6 44 25 00    	movzbl 0x0(%r13,%r12,1),%eax
1bb5   e132e5:	84 c0                	test   %al,%al
1bb7   e132e7:	48 89 f9             	mov    %rdi,%rcx
1bba   e132ea:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
1bbf   e132ef:	0f 85 6a 40 00 00    	jne    e1735f <fix_nodes+0x5c2f>
1bc5   e132f5:	44 0f b7 3f          	movzwl (%rdi),%r15d
1bc9   e132f9:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
1bce   e132fe:	48 83 c3 20          	add    $0x20,%rbx
1bd2   e13302:	48 89 d8             	mov    %rbx,%rax
1bd5   e13305:	48 c1 e8 03          	shr    $0x3,%rax
1bd9   e13309:	48 89 84 24 d0 00 00 00 	mov    %rax,0xd0(%rsp)
1be1   e13311:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
1be6   e13316:	74 08                	je     e13320 <fix_nodes+0x1bf0>
1be8   e13318:	48 89 df             	mov    %rbx,%rdi
1beb   e1331b:	e8 00 00 00 00       	call   e13320 <fix_nodes+0x1bf0>	e1331c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1bf0   e13320:	48 89 5c 24 30       	mov    %rbx,0x30(%rsp)
1bf5   e13325:	8b 03                	mov    (%rbx),%eax
1bf7   e13327:	83 c0 e8             	add    $0xffffffe8,%eax
1bfa   e1332a:	48 98                	cltq
1bfc   e1332c:	48 83 c0 f8          	add    $0xfffffffffffffff8,%rax
1c00   e13330:	48 b9 ab aa aa aa aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rcx
1c0a   e1333a:	48 f7 e1             	mul    %rcx
1c0d   e1333d:	48 89 d3             	mov    %rdx,%rbx
1c10   e13340:	48 c1 eb 05          	shr    $0x5,%rbx
1c14   e13344:	48 89 df             	mov    %rbx,%rdi
1c17   e13347:	4c 89 fe             	mov    %r15,%rsi
1c1a   e1334a:	e8 00 00 00 00       	call   e1334f <fix_nodes+0x1c1f>	e1334b: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
1c1f   e1334f:	4c 39 fb             	cmp    %r15,%rbx
1c22   e13352:	45 89 f4             	mov    %r14d,%r12d
1c25   e13355:	0f 86 40 02 00 00    	jbe    e1359b <fix_nodes+0x1e6b>
1c2b   e1335b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
1c30   e13360:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
1c35   e13365:	4c 8d 3c 88          	lea    (%rax,%rcx,4),%r15
1c39   e13369:	49 81 c7 a0 01 00 00 	add    $0x1a0,%r15
1c40   e13370:	4c 89 f8             	mov    %r15,%rax
1c43   e13373:	48 c1 e8 03          	shr    $0x3,%rax
1c47   e13377:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
1c51   e13381:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
1c56   e13386:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
1c5a   e1338a:	84 c0                	test   %al,%al
1c5c   e1338c:	0f 85 3c 43 00 00    	jne    e176ce <fix_nodes+0x5f9e>
1c62   e13392:	4c 89 bc 24 80 00 00 00 	mov    %r15,0x80(%rsp)
1c6a   e1339a:	45 8b 3f             	mov    (%r15),%r15d
1c6d   e1339d:	41 0f b6 44 1d 00    	movzbl 0x0(%r13,%rbx,1),%eax
1c73   e133a3:	84 c0                	test   %al,%al
1c75   e133a5:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
1c7a   e133aa:	0f 85 3c 43 00 00    	jne    e176ec <fix_nodes+0x5fbc>
1c80   e133b0:	0f b7 1f             	movzwl (%rdi),%ebx
1c83   e133b3:	44 89 ff             	mov    %r15d,%edi
1c86   e133b6:	89 de                	mov    %ebx,%esi
1c88   e133b8:	e8 00 00 00 00       	call   e133bd <fix_nodes+0x1c8d>	e133b9: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
1c8d   e133bd:	41 39 df             	cmp    %ebx,%r15d
1c90   e133c0:	0f 8e 65 0c 00 00    	jle    e1402b <fix_nodes+0x28fb>
1c96   e133c6:	4c 89 6c 24 38       	mov    %r13,0x38(%rsp)
1c9b   e133cb:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
1ca0   e133d0:	4c 89 ff             	mov    %r15,%rdi
1ca3   e133d3:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
1ca8   e133d8:	44 89 ee             	mov    %r13d,%esi
1cab   e133db:	e8 10 2b 01 00       	call   e25ef0 <is_left_neighbor_in_cache>
1cb0   e133e0:	89 c3                	mov    %eax,%ebx
1cb2   e133e2:	31 ff                	xor    %edi,%edi
1cb4   e133e4:	89 c6                	mov    %eax,%esi
1cb6   e133e6:	e8 00 00 00 00       	call   e133eb <fix_nodes+0x1cbb>	e133e7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1cbb   e133eb:	85 db                	test   %ebx,%ebx
1cbd   e133ed:	0f 84 35 27 00 00    	je     e15b28 <fix_nodes+0x43f8>
1cc3   e133f3:	e8 00 00 00 00       	call   e133f8 <fix_nodes+0x1cc8>	e133f4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1cc8   e133f8:	e9 11 32 00 00       	jmp    e1660e <fix_nodes+0x4ede>
1ccd   e133fd:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1cd7   e13407:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
1cdc   e1340c:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
1ce0   e13410:	74 08                	je     e1341a <fix_nodes+0x1cea>
1ce2   e13412:	4c 89 f7             	mov    %r14,%rdi
1ce5   e13415:	e8 00 00 00 00       	call   e1341a <fix_nodes+0x1cea>	e13416: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1cea   e1341a:	4d 8b 36             	mov    (%r14),%r14
1ced   e1341d:	4c 89 f0             	mov    %r14,%rax
1cf0   e13420:	48 c1 e8 03          	shr    $0x3,%rax
1cf4   e13424:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1cfe   e1342e:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
1d02   e13432:	84 c0                	test   %al,%al
1d04   e13434:	0f 85 7e 3f 00 00    	jne    e173b8 <fix_nodes+0x5c88>
1d0a   e1343a:	41 8b 06             	mov    (%r14),%eax
1d0d   e1343d:	83 c0 ff             	add    $0xffffffff,%eax
1d10   e13440:	48 63 d8             	movslq %eax,%rbx
1d13   e13443:	bf 08 00 00 00       	mov    $0x8,%edi
1d18   e13448:	89 de                	mov    %ebx,%esi
1d1a   e1344a:	e8 00 00 00 00       	call   e1344f <fix_nodes+0x1d1f>	e1344b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1d1f   e1344f:	83 fb 07             	cmp    $0x7,%ebx
1d22   e13452:	0f 87 a2 4f 00 00    	ja     e183fa <fix_nodes+0x6cca>
1d28   e13458:	e8 00 00 00 00       	call   e1345d <fix_nodes+0x1d2d>	e13459: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1d2d   e1345d:	48 c1 e3 04          	shl    $0x4,%rbx
1d31   e13461:	4c 01 f3             	add    %r14,%rbx
1d34   e13464:	48 83 c3 08          	add    $0x8,%rbx
1d38   e13468:	48 89 d8             	mov    %rbx,%rax
1d3b   e1346b:	48 c1 e8 03          	shr    $0x3,%rax
1d3f   e1346f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1d49   e13479:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1d4d   e1347d:	74 08                	je     e13487 <fix_nodes+0x1d57>
1d4f   e1347f:	48 89 df             	mov    %rbx,%rdi
1d52   e13482:	e8 00 00 00 00       	call   e13487 <fix_nodes+0x1d57>	e13483: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1d57   e13487:	4c 8b 2b             	mov    (%rbx),%r13
1d5a   e1348a:	4d 85 ed             	test   %r13,%r13
1d5d   e1348d:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
1d62   e13492:	0f 84 55 02 00 00    	je     e136ed <fix_nodes+0x1fbd>
1d68   e13498:	48 8b 9c 24 58 01 00 00 	mov    0x158(%rsp),%rbx
1d70   e134a0:	48 89 d8             	mov    %rbx,%rax
1d73   e134a3:	48 c1 e8 03          	shr    $0x3,%rax
1d77   e134a7:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1d81   e134b1:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1d85   e134b5:	74 08                	je     e134bf <fix_nodes+0x1d8f>
1d87   e134b7:	48 89 df             	mov    %rbx,%rdi
1d8a   e134ba:	e8 00 00 00 00       	call   e134bf <fix_nodes+0x1d8f>	e134bb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1d8f   e134bf:	48 8b 1b             	mov    (%rbx),%rbx
1d92   e134c2:	48 85 db             	test   %rbx,%rbx
1d95   e134c5:	0f 84 4a 0e 00 00    	je     e14315 <fix_nodes+0x2be5>
1d9b   e134cb:	49 39 dd             	cmp    %rbx,%r13
1d9e   e134ce:	0f 84 2b 19 00 00    	je     e14dff <fix_nodes+0x36cf>
1da4   e134d4:	e8 00 00 00 00       	call   e134d9 <fix_nodes+0x1da9>	e134d5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1da9   e134d9:	49 89 dd             	mov    %rbx,%r13
1dac   e134dc:	45 31 f6             	xor    %r14d,%r14d
1daf   e134df:	e9 b2 19 00 00       	jmp    e14e96 <fix_nodes+0x3766>
1db4   e134e4:	e8 00 00 00 00       	call   e134e9 <fix_nodes+0x1db9>	e134e5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1db9   e134e9:	e9 6f 03 00 00       	jmp    e1385d <fix_nodes+0x212d>
1dbe   e134ee:	e8 00 00 00 00       	call   e134f3 <fix_nodes+0x1dc3>	e134ef: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1dc3   e134f3:	31 ff                	xor    %edi,%edi
1dc5   e134f5:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e134f8: R_X86_64_32S	.rodata+0x1b9240
1dcc   e134fc:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e134ff: R_X86_64_32S	.rodata.str1.1+0x2197c
1dd3   e13503:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e13506: R_X86_64_32S	.rodata+0x1b93e0
1dda   e1350a:	41 b8 35 08 00 00    	mov    $0x835,%r8d
1de0   e13510:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	e13513: R_X86_64_32S	.rodata.str1.1+0x2197c
1de7   e13517:	e8 00 00 00 00       	call   e1351c <fix_nodes+0x1dec>	e13518: R_X86_64_PLT32	__reiserfs_panic-0x4
1dec   e1351c:	e9 2a ec ff ff       	jmp    e1214b <fix_nodes+0xa1b>
1df1   e13521:	48 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%rax
1df9   e13529:	48 8d 58 24          	lea    0x24(%rax),%rbx
1dfd   e1352d:	48 89 d8             	mov    %rbx,%rax
1e00   e13530:	48 c1 e8 03          	shr    $0x3,%rax
1e04   e13534:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
1e0e   e1353e:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
1e13   e13543:	84 c0                	test   %al,%al
1e15   e13545:	0f 85 bf 40 00 00    	jne    e1760a <fix_nodes+0x5eda>
1e1b   e1354b:	43 0f b6 04 26       	movzbl (%r14,%r12,1),%eax
1e20   e13550:	84 c0                	test   %al,%al
1e22   e13552:	0f 85 d1 40 00 00    	jne    e17629 <fix_nodes+0x5ef9>
1e28   e13558:	8b 1b                	mov    (%rbx),%ebx
1e2a   e1355a:	48 89 df             	mov    %rbx,%rdi
1e2d   e1355d:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e13560: R_X86_64_32S	.data+0x66edd0
1e34   e13564:	e8 00 00 00 00       	call   e13569 <fix_nodes+0x1e39>	e13565: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
1e39   e13569:	85 db                	test   %ebx,%ebx
1e3b   e1356b:	4c 8b b4 24 b0 00 00 00 	mov    0xb0(%rsp),%r14
1e43   e13573:	0f 89 ca 09 00 00    	jns    e13f43 <fix_nodes+0x2813>
1e49   e13579:	83 fb fe             	cmp    $0xfffffffe,%ebx
1e4c   e1357c:	0f 84 22 25 00 00    	je     e15aa4 <fix_nodes+0x4374>
1e52   e13582:	83 fb ff             	cmp    $0xffffffff,%ebx
1e55   e13585:	0f 85 39 25 00 00    	jne    e15ac4 <fix_nodes+0x4394>
1e5b   e1358b:	e8 00 00 00 00       	call   e13590 <fix_nodes+0x1e60>	e1358c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1e60   e13590:	41 bf 02 00 00 00    	mov    $0x2,%r15d
1e66   e13596:	e9 16 fb ff ff       	jmp    e130b1 <fix_nodes+0x1981>
1e6b   e1359b:	4c 89 6c 24 38       	mov    %r13,0x38(%rsp)
1e70   e135a0:	48 89 df             	mov    %rbx,%rdi
1e73   e135a3:	4c 89 fe             	mov    %r15,%rsi
1e76   e135a6:	e8 00 00 00 00       	call   e135ab <fix_nodes+0x1e7b>	e135a7: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
1e7b   e135ab:	4c 39 fb             	cmp    %r15,%rbx
1e7e   e135ae:	0f 85 e0 0b 00 00    	jne    e14194 <fix_nodes+0x2a64>
1e84   e135b4:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
1e89   e135b9:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
1e8e   e135be:	4e 8d 34 a8          	lea    (%rax,%r13,4),%r14
1e92   e135c2:	49 81 c6 a0 01 00 00 	add    $0x1a0,%r14
1e99   e135c9:	4c 89 f0             	mov    %r14,%rax
1e9c   e135cc:	48 c1 e8 03          	shr    $0x3,%rax
1ea0   e135d0:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1eaa   e135da:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
1eae   e135de:	84 c0                	test   %al,%al
1eb0   e135e0:	0f 85 c1 45 00 00    	jne    e17ba7 <fix_nodes+0x6477>
1eb6   e135e6:	41 8b 1e             	mov    (%r14),%ebx
1eb9   e135e9:	89 df                	mov    %ebx,%edi
1ebb   e135eb:	44 89 fe             	mov    %r15d,%esi
1ebe   e135ee:	e8 00 00 00 00       	call   e135f3 <fix_nodes+0x1ec3>	e135ef: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
1ec3   e135f3:	44 39 fb             	cmp    %r15d,%ebx
1ec6   e135f6:	0f 8e ce 22 00 00    	jle    e158ca <fix_nodes+0x419a>
1ecc   e135fc:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1ed6   e13606:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
1edb   e1360b:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
1edf   e1360f:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
1ee4   e13614:	74 08                	je     e1361e <fix_nodes+0x1eee>
1ee6   e13616:	48 89 df             	mov    %rbx,%rdi
1ee9   e13619:	e8 00 00 00 00       	call   e1361e <fix_nodes+0x1eee>	e1361a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1eee   e1361e:	4c 8b 33             	mov    (%rbx),%r14
1ef1   e13621:	4c 89 f0             	mov    %r14,%rax
1ef4   e13624:	48 c1 e8 03          	shr    $0x3,%rax
1ef8   e13628:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1f02   e13632:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
1f06   e13636:	84 c0                	test   %al,%al
1f08   e13638:	0f 85 e8 49 00 00    	jne    e18026 <fix_nodes+0x68f6>
1f0e   e1363e:	41 8b 06             	mov    (%r14),%eax
1f11   e13641:	44 29 e0             	sub    %r12d,%eax
1f14   e13644:	48 63 d8             	movslq %eax,%rbx
1f17   e13647:	bf 08 00 00 00       	mov    $0x8,%edi
1f1c   e1364c:	89 de                	mov    %ebx,%esi
1f1e   e1364e:	e8 00 00 00 00       	call   e13653 <fix_nodes+0x1f23>	e1364f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1f23   e13653:	83 fb 07             	cmp    $0x7,%ebx
1f26   e13656:	0f 87 3d 52 00 00    	ja     e18899 <fix_nodes+0x7169>
1f2c   e1365c:	e8 00 00 00 00       	call   e13661 <fix_nodes+0x1f31>	e1365d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1f31   e13661:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
1f3b   e1366b:	48 c1 e3 04          	shl    $0x4,%rbx
1f3f   e1366f:	4c 01 f3             	add    %r14,%rbx
1f42   e13672:	48 83 c3 10          	add    $0x10,%rbx
1f46   e13676:	48 89 d8             	mov    %rbx,%rax
1f49   e13679:	48 c1 e8 03          	shr    $0x3,%rax
1f4d   e1367d:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
1f52   e13682:	84 c0                	test   %al,%al
1f54   e13684:	0f 85 ba 49 00 00    	jne    e18044 <fix_nodes+0x6914>
1f5a   e1368a:	44 8b 33             	mov    (%rbx),%r14d
1f5d   e1368d:	31 ff                	xor    %edi,%edi
1f5f   e1368f:	44 89 f6             	mov    %r14d,%esi
1f62   e13692:	e8 00 00 00 00       	call   e13697 <fix_nodes+0x1f67>	e13693: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1f67   e13697:	45 85 f6             	test   %r14d,%r14d
1f6a   e1369a:	0f 84 59 29 00 00    	je     e15ff9 <fix_nodes+0x48c9>
1f70   e136a0:	e8 00 00 00 00       	call   e136a5 <fix_nodes+0x1f75>	e136a1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1f75   e136a5:	41 83 c6 ff          	add    $0xffffffff,%r14d
1f79   e136a9:	e9 af 29 00 00       	jmp    e1605d <fix_nodes+0x492d>
1f7e   e136ae:	e8 00 00 00 00       	call   e136b3 <fix_nodes+0x1f83>	e136af: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1f83   e136b3:	31 ff                	xor    %edi,%edi
1f85   e136b5:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e136b8: R_X86_64_32S	.rodata+0x1b9240
1f8c   e136bc:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e136bf: R_X86_64_32S	.rodata.str1.1+0x81a8d
1f93   e136c3:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e136c6: R_X86_64_32S	.rodata+0x1ba920
1f9a   e136ca:	41 b8 f2 07 00 00    	mov    $0x7f2,%r8d
1fa0   e136d0:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	e136d3: R_X86_64_32S	.rodata.str1.1+0x81a8d
1fa7   e136d7:	e8 00 00 00 00       	call   e136dc <fix_nodes+0x1fac>	e136d8: R_X86_64_PLT32	__reiserfs_panic-0x4
1fac   e136dc:	e9 42 f2 ff ff       	jmp    e12923 <fix_nodes+0x11f3>
1fb1   e136e1:	e8 00 00 00 00       	call   e136e6 <fix_nodes+0x1fb6>	e136e2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1fb6   e136e6:	31 c0                	xor    %eax,%eax
1fb8   e136e8:	e9 93 00 00 00       	jmp    e13780 <fix_nodes+0x2050>
1fbd   e136ed:	e8 00 00 00 00       	call   e136f2 <fix_nodes+0x1fc2>	e136ee: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1fc2   e136f2:	e9 23 0c 00 00       	jmp    e1431a <fix_nodes+0x2bea>
1fc7   e136f7:	48 8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%rax
1fcf   e136ff:	48 8d 58 0c          	lea    0xc(%rax),%rbx
1fd3   e13703:	48 89 d8             	mov    %rbx,%rax
1fd6   e13706:	48 c1 e8 03          	shr    $0x3,%rax
1fda   e1370a:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
1fe4   e13714:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
1fe9   e13719:	84 c0                	test   %al,%al
1feb   e1371b:	0f 85 fa 42 00 00    	jne    e17a1b <fix_nodes+0x62eb>
1ff1   e13721:	43 0f b6 04 26       	movzbl (%r14,%r12,1),%eax
1ff6   e13726:	84 c0                	test   %al,%al
1ff8   e13728:	0f 85 0c 43 00 00    	jne    e17a3a <fix_nodes+0x630a>
1ffe   e1372e:	8b 1b                	mov    (%rbx),%ebx
2000   e13730:	48 89 df             	mov    %rbx,%rdi
2003   e13733:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e13736: R_X86_64_32S	.data+0x66ee00
200a   e1373a:	e8 00 00 00 00       	call   e1373f <fix_nodes+0x200f>	e1373b: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
200f   e1373f:	85 db                	test   %ebx,%ebx
2011   e13741:	4c 8b b4 24 a8 00 00 00 	mov    0xa8(%rsp),%r14
2019   e13749:	0f 89 d2 15 00 00    	jns    e14d21 <fix_nodes+0x35f1>
201f   e1374f:	83 fb fe             	cmp    $0xfffffffe,%ebx
2022   e13752:	4c 8b ac 24 08 01 00 00 	mov    0x108(%rsp),%r13
202a   e1375a:	0f 84 f3 26 00 00    	je     e15e53 <fix_nodes+0x4723>
2030   e13760:	83 fb ff             	cmp    $0xffffffff,%ebx
2033   e13763:	0f 85 0a 27 00 00    	jne    e15e73 <fix_nodes+0x4743>
2039   e13769:	e8 00 00 00 00       	call   e1376e <fix_nodes+0x203e>	e1376a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
203e   e1376e:	41 bf 02 00 00 00    	mov    $0x2,%r15d
2044   e13774:	e9 8b fa ff ff       	jmp    e13204 <fix_nodes+0x1ad4>
2049   e13779:	31 c0                	xor    %eax,%eax
204b   e1377b:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
2050   e13780:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
2055   e13785:	4c 8b b4 24 b0 00 00 00 	mov    0xb0(%rsp),%r14
205d   e1378d:	49 01 c6             	add    %rax,%r14
2060   e13790:	4c 89 f7             	mov    %r14,%rdi
2063   e13793:	4c 89 ee             	mov    %r13,%rsi
2066   e13796:	e8 00 00 00 00       	call   e1379b <fix_nodes+0x206b>	e13797: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
206b   e1379b:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
2070   e137a0:	89 de                	mov    %ebx,%esi
2072   e137a2:	e8 00 00 00 00       	call   e137a7 <fix_nodes+0x2077>	e137a3: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
2077   e137a7:	4d 39 ee             	cmp    %r13,%r14
207a   e137aa:	0f 86 a8 00 00 00    	jbe    e13858 <fix_nodes+0x2128>
2080   e137b0:	39 5c 24 30          	cmp    %ebx,0x30(%rsp)
2084   e137b4:	0f 8f 9e 00 00 00    	jg     e13858 <fix_nodes+0x2128>
208a   e137ba:	e8 00 00 00 00       	call   e137bf <fix_nodes+0x208f>	e137bb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
208f   e137bf:	48 8b 84 24 20 01 00 00 	mov    0x120(%rsp),%rax
2097   e137c7:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
209c   e137cc:	48 8b 9c 24 28 01 00 00 	mov    0x128(%rsp),%rbx
20a4   e137d4:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
20a9   e137d9:	74 08                	je     e137e3 <fix_nodes+0x20b3>
20ab   e137db:	48 89 df             	mov    %rbx,%rdi
20ae   e137de:	e8 00 00 00 00       	call   e137e3 <fix_nodes+0x20b3>	e137df: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
20b3   e137e3:	48 8b 1b             	mov    (%rbx),%rbx
20b6   e137e6:	48 83 c3 02          	add    $0x2,%rbx
20ba   e137ea:	48 89 d8             	mov    %rbx,%rax
20bd   e137ed:	48 c1 e8 03          	shr    $0x3,%rax
20c1   e137f1:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
20c6   e137f6:	84 c0                	test   %al,%al
20c8   e137f8:	0f 85 55 3e 00 00    	jne    e17653 <fix_nodes+0x5f23>
20ce   e137fe:	44 0f b7 3b          	movzwl (%rbx),%r15d
20d2   e13802:	44 0f b7 b4 24 cc 00 00 00 	movzwl 0xcc(%rsp),%r14d
20db   e1380b:	bf 69 00 00 00       	mov    $0x69,%edi
20e0   e13810:	44 89 f6             	mov    %r14d,%esi
20e3   e13813:	e8 00 00 00 00       	call   e13818 <fix_nodes+0x20e8>	e13814: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
20e8   e13818:	31 db                	xor    %ebx,%ebx
20ea   e1381a:	66 41 83 fe 69       	cmp    $0x69,%r14w
20ef   e1381f:	0f 94 c3             	sete   %bl
20f2   e13822:	44 01 fb             	add    %r15d,%ebx
20f5   e13825:	4c 8b b4 24 40 01 00 00 	mov    0x140(%rsp),%r14
20fd   e1382d:	4c 89 f0             	mov    %r14,%rax
2100   e13830:	48 c1 e8 03          	shr    $0x3,%rax
2104   e13834:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
2109   e13839:	84 c0                	test   %al,%al
210b   e1383b:	0f 85 2f 3e 00 00    	jne    e17670 <fix_nodes+0x5f40>
2111   e13841:	41 89 1e             	mov    %ebx,(%r14)
2114   e13844:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
2119   e13849:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
211e   e1384e:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
2123   e13853:	e9 e0 0a 00 00       	jmp    e14338 <fix_nodes+0x2c08>
2128   e13858:	e8 00 00 00 00       	call   e1385d <fix_nodes+0x212d>	e13859: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
212d   e1385d:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
2132   e13862:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
2137   e13867:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
213c   e1386c:	74 08                	je     e13876 <fix_nodes+0x2146>
213e   e1386e:	4c 89 ff             	mov    %r15,%rdi
2141   e13871:	e8 00 00 00 00       	call   e13876 <fix_nodes+0x2146>	e13872: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2146   e13876:	49 8b 1f             	mov    (%r15),%rbx
2149   e13879:	b8 d8 06 00 00       	mov    $0x6d8,%eax
214e   e1387e:	48 01 c3             	add    %rax,%rbx
2151   e13881:	48 89 d8             	mov    %rbx,%rax
2154   e13884:	48 c1 e8 03          	shr    $0x3,%rax
2158   e13888:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
215d   e1388d:	74 08                	je     e13897 <fix_nodes+0x2167>
215f   e1388f:	48 89 df             	mov    %rbx,%rdi
2162   e13892:	e8 00 00 00 00       	call   e13897 <fix_nodes+0x2167>	e13893: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2167   e13897:	48 8b 03             	mov    (%rbx),%rax
216a   e1389a:	4a 8d 1c e8          	lea    (%rax,%r13,8),%rbx
216e   e1389e:	48 81 c3 50 03 00 00 	add    $0x350,%rbx
2175   e138a5:	48 89 d8             	mov    %rbx,%rax
2178   e138a8:	48 c1 e8 03          	shr    $0x3,%rax
217c   e138ac:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
2181   e138b1:	74 08                	je     e138bb <fix_nodes+0x218b>
2183   e138b3:	48 89 df             	mov    %rbx,%rdi
2186   e138b6:	e8 00 00 00 00       	call   e138bb <fix_nodes+0x218b>	e138b7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
218b   e138bb:	48 83 03 01          	addq   $0x1,(%rbx)
218f   e138bf:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
2194   e138c4:	48 89 df             	mov    %rbx,%rdi
2197   e138c7:	44 89 ee             	mov    %r13d,%esi
219a   e138ca:	e8 91 d0 00 00       	call   e20960 <create_virtual_node>
219f   e138cf:	48 89 df             	mov    %rbx,%rdi
21a2   e138d2:	44 89 ee             	mov    %r13d,%esi
21a5   e138d5:	8b 94 24 98 00 00 00 	mov    0x98(%rsp),%edx
21ac   e138dc:	e8 cf f5 00 00       	call   e22eb0 <check_left>
21b1   e138e1:	48 89 df             	mov    %rbx,%rdi
21b4   e138e4:	44 89 ee             	mov    %r13d,%esi
21b7   e138e7:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
21bc   e138ec:	e8 0f ff 00 00       	call   e23800 <check_right>
21c1   e138f1:	4d 85 ed             	test   %r13,%r13
21c4   e138f4:	0f 84 4a 01 00 00    	je     e13a44 <fix_nodes+0x2314>
21ca   e138fa:	4a 8d 0c ab          	lea    (%rbx,%r13,4),%rcx
21ce   e138fe:	48 81 c1 b4 01 00 00 	add    $0x1b4,%rcx
21d5   e13905:	48 89 c8             	mov    %rcx,%rax
21d8   e13908:	48 c1 e8 03          	shr    $0x3,%rax
21dc   e1390c:	48 89 84 24 98 00 00 00 	mov    %rax,0x98(%rsp)
21e4   e13914:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
21e9   e13919:	84 c0                	test   %al,%al
21eb   e1391b:	4d 89 ee             	mov    %r13,%r14
21ee   e1391e:	4d 89 e5             	mov    %r12,%r13
21f1   e13921:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
21f6   e13926:	0f 85 cc 3b 00 00    	jne    e174f8 <fix_nodes+0x5dc8>
21fc   e1392c:	46 8b a4 b3 b4 01 00 00 	mov    0x1b4(%rbx,%r14,4),%r12d
2204   e13934:	4e 8d 34 b3          	lea    (%rbx,%r14,4),%r14
2208   e13938:	49 81 c6 a0 01 00 00 	add    $0x1a0,%r14
220f   e1393f:	4c 89 f0             	mov    %r14,%rax
2212   e13942:	48 c1 e8 03          	shr    $0x3,%rax
2216   e13946:	48 89 84 24 a0 00 00 00 	mov    %rax,0xa0(%rsp)
221e   e1394e:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2223   e13953:	84 c0                	test   %al,%al
2225   e13955:	0f 85 ba 3b 00 00    	jne    e17515 <fix_nodes+0x5de5>
222b   e1395b:	45 8b 3e             	mov    (%r14),%r15d
222e   e1395e:	45 01 fc             	add    %r15d,%r12d
2231   e13961:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
2236   e13966:	48 8d 58 08          	lea    0x8(%rax),%rbx
223a   e1396a:	48 89 d8             	mov    %rbx,%rax
223d   e1396d:	48 c1 e8 03          	shr    $0x3,%rax
2241   e13971:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
2246   e13976:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
224b   e1397b:	84 c0                	test   %al,%al
224d   e1397d:	0f 85 b0 3b 00 00    	jne    e17533 <fix_nodes+0x5e03>
2253   e13983:	48 89 5c 24 30       	mov    %rbx,0x30(%rsp)
2258   e13988:	0f b7 1b             	movzwl (%rbx),%ebx
225b   e1398b:	44 89 e7             	mov    %r12d,%edi
225e   e1398e:	89 de                	mov    %ebx,%esi
2260   e13990:	e8 00 00 00 00       	call   e13995 <fix_nodes+0x2265>	e13991: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
2265   e13995:	41 39 dc             	cmp    %ebx,%r12d
2268   e13998:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
226d   e1399d:	0f 8e 00 01 00 00    	jle    e13aa3 <fix_nodes+0x2373>
2273   e139a3:	e8 00 00 00 00       	call   e139a8 <fix_nodes+0x2278>	e139a4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2278   e139a8:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
2282   e139b2:	48 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%rax
228a   e139ba:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
228f   e139bf:	84 c0                	test   %al,%al
2291   e139c1:	0f 85 8d 3e 00 00    	jne    e17854 <fix_nodes+0x6124>
2297   e139c7:	49 63 1e             	movslq (%r14),%rbx
229a   e139ca:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
22a2   e139d2:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
22a7   e139d7:	84 c0                	test   %al,%al
22a9   e139d9:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
22ae   e139de:	0f 85 8e 3e 00 00    	jne    e17872 <fix_nodes+0x6142>
22b4   e139e4:	4c 63 3a             	movslq (%rdx),%r15
22b7   e139e7:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
22bc   e139ec:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
22c1   e139f1:	84 c0                	test   %al,%al
22c3   e139f3:	0f 85 9d 3e 00 00    	jne    e17896 <fix_nodes+0x6166>
22c9   e139f9:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
22ce   e139fe:	0f b7 10             	movzwl (%rax),%edx
22d1   e13a01:	4c 01 fb             	add    %r15,%rbx
22d4   e13a04:	48 89 d0             	mov    %rdx,%rax
22d7   e13a07:	48 29 d8             	sub    %rbx,%rax
22da   e13a0a:	48 83 c0 03          	add    $0x3,%rax
22de   e13a0e:	48 d1 e8             	shr    %rax
22e1   e13a11:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
22e5   e13a15:	83 c1 ff             	add    $0xffffffff,%ecx
22e8   e13a18:	29 ca                	sub    %ecx,%edx
22ea   e13a1a:	83 c2 01             	add    $0x1,%edx
22ed   e13a1d:	31 c0                	xor    %eax,%eax
22ef   e13a1f:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
22f4   e13a24:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
22f9   e13a29:	44 89 ee             	mov    %r13d,%esi
22fc   e13a2c:	45 31 c0             	xor    %r8d,%r8d
22ff   e13a2f:	45 31 c9             	xor    %r9d,%r9d
2302   e13a32:	6a ff                	push   $0xffffffffffffffff
2304   e13a34:	6a ff                	push   $0xffffffffffffffff
2306   e13a36:	e8 65 b0 00 00       	call   e1eaa0 <set_parameters>
230b   e13a3b:	48 83 c4 10          	add    $0x10,%rsp
230f   e13a3f:	e9 f0 04 00 00       	jmp    e13f34 <fix_nodes+0x2804>
2314   e13a44:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
231c   e13a4c:	48 89 f8             	mov    %rdi,%rax
231f   e13a4f:	48 c1 e8 03          	shr    $0x3,%rax
2323   e13a53:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
2328   e13a58:	84 c0                	test   %al,%al
232a   e13a5a:	4d 89 e7             	mov    %r12,%r15
232d   e13a5d:	0f 85 2b 3c 00 00    	jne    e1768e <fix_nodes+0x5f5e>
2333   e13a63:	8b 1f                	mov    (%rdi),%ebx
2335   e13a65:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
233a   e13a6a:	4c 8d 70 08          	lea    0x8(%rax),%r14
233e   e13a6e:	4d 89 f4             	mov    %r14,%r12
2341   e13a71:	49 c1 ec 03          	shr    $0x3,%r12
2345   e13a75:	43 0f b6 04 3c       	movzbl (%r12,%r15,1),%eax
234a   e13a7a:	84 c0                	test   %al,%al
234c   e13a7c:	0f 85 2e 3c 00 00    	jne    e176b0 <fix_nodes+0x5f80>
2352   e13a82:	45 0f b7 3e          	movzwl (%r14),%r15d
2356   e13a86:	89 df                	mov    %ebx,%edi
2358   e13a88:	44 89 fe             	mov    %r15d,%esi
235b   e13a8b:	e8 00 00 00 00       	call   e13a90 <fix_nodes+0x2360>	e13a8c: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
2360   e13a90:	44 39 fb             	cmp    %r15d,%ebx
2363   e13a93:	0f 8d cb 04 00 00    	jge    e13f64 <fix_nodes+0x2834>
2369   e13a99:	e8 00 00 00 00       	call   e13a9e <fix_nodes+0x236e>	e13a9a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
236e   e13a9e:	e9 ff 04 00 00       	jmp    e13fa2 <fix_nodes+0x2872>
2373   e13aa3:	44 89 ff             	mov    %r15d,%edi
2376   e13aa6:	89 de                	mov    %ebx,%esi
2378   e13aa8:	e8 00 00 00 00       	call   e13aad <fix_nodes+0x237d>	e13aa9: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
237d   e13aad:	41 39 df             	cmp    %ebx,%r15d
2380   e13ab0:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
238a   e13aba:	4c 89 b4 24 b0 00 00 00 	mov    %r14,0xb0(%rsp)
2392   e13ac2:	0f 8f d5 29 00 00    	jg     e1649d <fix_nodes+0x4d6d>
2398   e13ac8:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
23a0   e13ad0:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
23a5   e13ad5:	84 c0                	test   %al,%al
23a7   e13ad7:	0f 85 0d 3e 00 00    	jne    e178ea <fix_nodes+0x61ba>
23ad   e13add:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
23b2   e13ae2:	44 8b 38             	mov    (%rax),%r15d
23b5   e13ae5:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
23ba   e13aea:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
23bf   e13aef:	84 c0                	test   %al,%al
23c1   e13af1:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
23c6   e13af6:	0f 85 10 3e 00 00    	jne    e1790c <fix_nodes+0x61dc>
23cc   e13afc:	0f b7 1b             	movzwl (%rbx),%ebx
23cf   e13aff:	44 89 ff             	mov    %r15d,%edi
23d2   e13b02:	89 de                	mov    %ebx,%esi
23d4   e13b04:	e8 00 00 00 00       	call   e13b09 <fix_nodes+0x23d9>	e13b05: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
23d9   e13b09:	41 39 df             	cmp    %ebx,%r15d
23dc   e13b0c:	0f 8f ac 29 00 00    	jg     e164be <fix_nodes+0x4d8e>
23e2   e13b12:	e8 00 00 00 00       	call   e13b17 <fix_nodes+0x23e7>	e13b13: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
23e7   e13b17:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
23ec   e13b1c:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
23f1   e13b21:	44 8b b4 24 80 00 00 00 	mov    0x80(%rsp),%r14d
23f9   e13b29:	44 89 f7             	mov    %r14d,%edi
23fc   e13b2c:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
2401   e13b31:	44 89 ee             	mov    %r13d,%esi
2404   e13b34:	e8 00 00 00 00       	call   e13b39 <fix_nodes+0x2409>	e13b35: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
2409   e13b39:	45 39 ee             	cmp    %r13d,%r14d
240c   e13b3c:	0f 8e e4 07 00 00    	jle    e14326 <fix_nodes+0x2bf6>
2412   e13b42:	48 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%rax
241a   e13b4a:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
241f   e13b4f:	84 c0                	test   %al,%al
2421   e13b51:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
2426   e13b56:	0f 85 95 41 00 00    	jne    e17cf1 <fix_nodes+0x65c1>
242c   e13b5c:	44 8b b4 93 a0 01 00 00 	mov    0x1a0(%rbx,%rdx,4),%r14d
2434   e13b64:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
243c   e13b6c:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
2441   e13b71:	84 c0                	test   %al,%al
2443   e13b73:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
2448   e13b78:	4c 8b bc 24 f8 00 00 00 	mov    0xf8(%rsp),%r15
2450   e13b80:	48 8b 74 24 60       	mov    0x60(%rsp),%rsi
2455   e13b85:	0f 85 94 41 00 00    	jne    e17d1f <fix_nodes+0x65ef>
245b   e13b8b:	8b 06                	mov    (%rsi),%eax
245d   e13b8d:	89 84 24 80 00 00 00 	mov    %eax,0x80(%rsp)
2464   e13b94:	43 0f b6 04 27       	movzbl (%r15,%r12,1),%eax
2469   e13b99:	84 c0                	test   %al,%al
246b   e13b9b:	0f 85 a8 41 00 00    	jne    e17d49 <fix_nodes+0x6619>
2471   e13ba1:	0f bf 5b 0c          	movswl 0xc(%rbx),%ebx
2475   e13ba5:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
247a   e13baa:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
247f   e13baf:	84 c0                	test   %al,%al
2481   e13bb1:	0f 85 ba 41 00 00    	jne    e17d71 <fix_nodes+0x6641>
2487   e13bb7:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
248c   e13bbc:	44 0f b7 08          	movzwl (%rax),%r9d
2490   e13bc0:	89 df                	mov    %ebx,%edi
2492   e13bc2:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
2497   e13bc7:	31 c9                	xor    %ecx,%ecx
2499   e13bc9:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
249f   e13bcf:	6a 00                	push   $0x0
24a1   e13bd1:	48 8d 84 24 78 01 00 00 	lea    0x178(%rsp),%rax
24a9   e13bd9:	50                   	push   %rax
24aa   e13bda:	6a ff                	push   $0xffffffffffffffff
24ac   e13bdc:	e8 4f 0e 01 00       	call   e24a30 <get_num_ver>
24b1   e13be1:	48 83 c4 18          	add    $0x18,%rsp
24b5   e13be5:	41 89 c5             	mov    %eax,%r13d
24b8   e13be8:	43 0f b6 04 27       	movzbl (%r15,%r12,1),%eax
24bd   e13bed:	84 c0                	test   %al,%al
24bf   e13bef:	0f 85 a4 41 00 00    	jne    e17d99 <fix_nodes+0x6669>
24c5   e13bf5:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
24ca   e13bfa:	0f bf 18             	movswl (%rax),%ebx
24cd   e13bfd:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
24d2   e13c02:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
24d7   e13c07:	84 c0                	test   %al,%al
24d9   e13c09:	0f 85 ac 41 00 00    	jne    e17dbb <fix_nodes+0x668b>
24df   e13c0f:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
24e4   e13c14:	44 0f b7 08          	movzwl (%rax),%r9d
24e8   e13c18:	89 df                	mov    %ebx,%edi
24ea   e13c1a:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
24ef   e13c1f:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
24f4   e13c24:	44 89 f1             	mov    %r14d,%ecx
24f7   e13c27:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
24fd   e13c2d:	6a 00                	push   $0x0
24ff   e13c2f:	48 8d 84 24 8c 01 00 00 	lea    0x18c(%rsp),%rax
2507   e13c37:	50                   	push   %rax
2508   e13c38:	6a ff                	push   $0xffffffffffffffff
250a   e13c3a:	e8 f1 0d 01 00       	call   e24a30 <get_num_ver>
250f   e13c3f:	48 83 c4 18          	add    $0x18,%rsp
2513   e13c43:	89 84 24 a8 00 00 00 	mov    %eax,0xa8(%rsp)
251a   e13c4a:	43 0f b6 04 27       	movzbl (%r15,%r12,1),%eax
251f   e13c4f:	84 c0                	test   %al,%al
2521   e13c51:	0f 85 86 41 00 00    	jne    e17ddd <fix_nodes+0x66ad>
2527   e13c57:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
252c   e13c5c:	0f bf 18             	movswl (%rax),%ebx
252f   e13c5f:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
2534   e13c64:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
2539   e13c69:	84 c0                	test   %al,%al
253b   e13c6b:	0f 85 8e 41 00 00    	jne    e17dff <fix_nodes+0x66cf>
2541   e13c71:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
2546   e13c76:	44 0f b7 08          	movzwl (%rax),%r9d
254a   e13c7a:	44 2b 8c 24 80 00 00 00 	sub    0x80(%rsp),%r9d
2552   e13c82:	89 df                	mov    %ebx,%edi
2554   e13c84:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
2559   e13c89:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
255e   e13c8e:	31 c9                	xor    %ecx,%ecx
2560   e13c90:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
2566   e13c96:	6a 00                	push   $0x0
2568   e13c98:	48 8d 84 24 a0 01 00 00 	lea    0x1a0(%rsp),%rax
2570   e13ca0:	50                   	push   %rax
2571   e13ca1:	6a ff                	push   $0xffffffffffffffff
2573   e13ca3:	e8 88 0d 01 00       	call   e24a30 <get_num_ver>
2578   e13ca8:	48 83 c4 18          	add    $0x18,%rsp
257c   e13cac:	89 84 24 90 00 00 00 	mov    %eax,0x90(%rsp)
2583   e13cb3:	43 0f b6 04 27       	movzbl (%r15,%r12,1),%eax
2588   e13cb8:	84 c0                	test   %al,%al
258a   e13cba:	0f 85 61 41 00 00    	jne    e17e21 <fix_nodes+0x66f1>
2590   e13cc0:	44 89 6c 24 38       	mov    %r13d,0x38(%rsp)
2595   e13cc5:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
259a   e13cca:	0f bf 18             	movswl (%rax),%ebx
259d   e13ccd:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
25a2   e13cd2:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
25a7   e13cd7:	84 c0                	test   %al,%al
25a9   e13cd9:	44 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%r15d
25b1   e13ce1:	0f 85 5c 41 00 00    	jne    e17e43 <fix_nodes+0x6713>
25b7   e13ce7:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
25bc   e13cec:	44 0f b7 08          	movzwl (%rax),%r9d
25c0   e13cf0:	44 2b 8c 24 80 00 00 00 	sub    0x80(%rsp),%r9d
25c8   e13cf8:	89 df                	mov    %ebx,%edi
25ca   e13cfa:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
25cf   e13cff:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
25d4   e13d04:	44 89 74 24 30       	mov    %r14d,0x30(%rsp)
25d9   e13d09:	44 89 f1             	mov    %r14d,%ecx
25dc   e13d0c:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
25e2   e13d12:	6a 00                	push   $0x0
25e4   e13d14:	48 8d 84 24 b4 01 00 00 	lea    0x1b4(%rsp),%rax
25ec   e13d1c:	50                   	push   %rax
25ed   e13d1d:	6a ff                	push   $0xffffffffffffffff
25ef   e13d1f:	e8 0c 0d 01 00       	call   e24a30 <get_num_ver>
25f4   e13d24:	48 83 c4 18          	add    $0x18,%rsp
25f8   e13d28:	41 89 c4             	mov    %eax,%r12d
25fb   e13d2b:	89 c7                	mov    %eax,%edi
25fd   e13d2d:	44 89 fe             	mov    %r15d,%esi
2600   e13d30:	e8 00 00 00 00       	call   e13d35 <fix_nodes+0x2605>	e13d31: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
2605   e13d35:	44 89 e7             	mov    %r12d,%edi
2608   e13d38:	44 8b ac 24 90 00 00 00 	mov    0x90(%rsp),%r13d
2610   e13d40:	44 89 ee             	mov    %r13d,%esi
2613   e13d43:	e8 00 00 00 00       	call   e13d48 <fix_nodes+0x2618>	e13d44: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
2618   e13d48:	45 39 fc             	cmp    %r15d,%r12d
261b   e13d4b:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
2620   e13d50:	0f 8d 32 1d 00 00    	jge    e15a88 <fix_nodes+0x4358>
2626   e13d56:	45 39 ec             	cmp    %r13d,%r12d
2629   e13d59:	0f 8d 29 1d 00 00    	jge    e15a88 <fix_nodes+0x4358>
262f   e13d5f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2639   e13d69:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
2641   e13d71:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
2645   e13d75:	84 c0                	test   %al,%al
2647   e13d77:	0f 85 60 43 00 00    	jne    e180dd <fix_nodes+0x69ad>
264d   e13d7d:	4c 8b b4 24 b0 00 00 00 	mov    0xb0(%rsp),%r14
2655   e13d85:	41 8b 1e             	mov    (%r14),%ebx
2658   e13d88:	bf 01 00 00 00       	mov    $0x1,%edi
265d   e13d8d:	89 de                	mov    %ebx,%esi
265f   e13d8f:	e8 00 00 00 00       	call   e13d94 <fix_nodes+0x2664>	e13d90: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2664   e13d94:	83 fb 01             	cmp    $0x1,%ebx
2667   e13d97:	0f 85 56 2e 00 00    	jne    e16bf3 <fix_nodes+0x54c3>
266d   e13d9d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2677   e13da7:	48 8b 8c 24 98 00 00 00 	mov    0x98(%rsp),%rcx
267f   e13daf:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
2683   e13db3:	84 c0                	test   %al,%al
2685   e13db5:	0f 85 4a 43 00 00    	jne    e18105 <fix_nodes+0x69d5>
268b   e13dbb:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
2690   e13dc0:	44 8b 28             	mov    (%rax),%r13d
2693   e13dc3:	bf 01 00 00 00       	mov    $0x1,%edi
2698   e13dc8:	44 89 ee             	mov    %r13d,%esi
269b   e13dcb:	e8 00 00 00 00       	call   e13dd0 <fix_nodes+0x26a0>	e13dcc: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
26a0   e13dd0:	bf 01 00 00 00       	mov    $0x1,%edi
26a5   e13dd5:	44 89 e6             	mov    %r12d,%esi
26a8   e13dd8:	e8 00 00 00 00       	call   e13ddd <fix_nodes+0x26ad>	e13dd9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
26ad   e13ddd:	bf 02 00 00 00       	mov    $0x2,%edi
26b2   e13de2:	8b b4 24 90 00 00 00 	mov    0x90(%rsp),%esi
26b9   e13de9:	e8 00 00 00 00       	call   e13dee <fix_nodes+0x26be>	e13dea: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
26be   e13dee:	bf 02 00 00 00       	mov    $0x2,%edi
26c3   e13df3:	44 89 fe             	mov    %r15d,%esi
26c6   e13df6:	e8 00 00 00 00       	call   e13dfb <fix_nodes+0x26cb>	e13df7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
26cb   e13dfb:	bf 01 00 00 00       	mov    $0x1,%edi
26d0   e13e00:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
26d5   e13e05:	48 89 de             	mov    %rbx,%rsi
26d8   e13e08:	e8 00 00 00 00       	call   e13e0d <fix_nodes+0x26dd>	e13e09: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
26dd   e13e0d:	48 83 fb 01          	cmp    $0x1,%rbx
26e1   e13e11:	0f 85 ed 2d 00 00    	jne    e16c04 <fix_nodes+0x54d4>
26e7   e13e17:	41 83 fd 01          	cmp    $0x1,%r13d
26eb   e13e1b:	0f 85 e3 2d 00 00    	jne    e16c04 <fix_nodes+0x54d4>
26f1   e13e21:	41 83 fc 01          	cmp    $0x1,%r12d
26f5   e13e25:	0f 85 d9 2d 00 00    	jne    e16c04 <fix_nodes+0x54d4>
26fb   e13e2b:	83 bc 24 90 00 00 00 02 	cmpl   $0x2,0x90(%rsp)
2703   e13e33:	0f 85 cb 2d 00 00    	jne    e16c04 <fix_nodes+0x54d4>
2709   e13e39:	41 83 ff 02          	cmp    $0x2,%r15d
270d   e13e3d:	0f 85 c1 2d 00 00    	jne    e16c04 <fix_nodes+0x54d4>
2713   e13e43:	e8 00 00 00 00       	call   e13e48 <fix_nodes+0x2718>	e13e44: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2718   e13e48:	41 bc 01 00 00 00    	mov    $0x1,%r12d
271e   e13e4e:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
2723   e13e53:	4c 89 f0             	mov    %r14,%rax
2726   e13e56:	48 c1 e8 03          	shr    $0x3,%rax
272a   e13e5a:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
2734   e13e64:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2739   e13e69:	84 c0                	test   %al,%al
273b   e13e6b:	0f 85 34 41 00 00    	jne    e17fa5 <fix_nodes+0x6875>
2741   e13e71:	45 8b 36             	mov    (%r14),%r14d
2744   e13e74:	48 89 d8             	mov    %rbx,%rax
2747   e13e77:	48 c1 e8 03          	shr    $0x3,%rax
274b   e13e7b:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2750   e13e80:	84 c0                	test   %al,%al
2752   e13e82:	0f 85 3b 41 00 00    	jne    e17fc3 <fix_nodes+0x6893>
2758   e13e88:	8b 1b                	mov    (%rbx),%ebx
275a   e13e8a:	bf ff ff ff ff       	mov    $0xffffffff,%edi
275f   e13e8f:	89 de                	mov    %ebx,%esi
2761   e13e91:	e8 00 00 00 00       	call   e13e96 <fix_nodes+0x2766>	e13e92: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2766   e13e96:	45 31 ff             	xor    %r15d,%r15d
2769   e13e99:	83 fb ff             	cmp    $0xffffffff,%ebx
276c   e13e9c:	0f 95 c3             	setne  %bl
276f   e13e9f:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
2774   e13ea4:	48 89 d0             	mov    %rdx,%rax
2777   e13ea7:	48 c1 e8 03          	shr    $0x3,%rax
277b   e13eab:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2780   e13eb0:	84 c0                	test   %al,%al
2782   e13eb2:	0f 85 28 41 00 00    	jne    e17fe0 <fix_nodes+0x68b0>
2788   e13eb8:	41 88 df             	mov    %bl,%r15b
278b   e13ebb:	45 29 fe             	sub    %r15d,%r14d
278e   e13ebe:	44 8b 3a             	mov    (%rdx),%r15d
2791   e13ec1:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
2796   e13ec6:	48 c1 e8 03          	shr    $0x3,%rax
279a   e13eca:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
279f   e13ecf:	84 c0                	test   %al,%al
27a1   e13ed1:	0f 85 2d 41 00 00    	jne    e18004 <fix_nodes+0x68d4>
27a7   e13ed7:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
27ac   e13edc:	41 8b 9d 24 02 00 00 	mov    0x224(%r13),%ebx
27b3   e13ee3:	bf ff ff ff ff       	mov    $0xffffffff,%edi
27b8   e13ee8:	89 de                	mov    %ebx,%esi
27ba   e13eea:	e8 00 00 00 00       	call   e13eef <fix_nodes+0x27bf>	e13eeb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
27bf   e13eef:	31 c0                	xor    %eax,%eax
27c1   e13ef1:	83 fb ff             	cmp    $0xffffffff,%ebx
27c4   e13ef4:	4c 89 ef             	mov    %r13,%rdi
27c7   e13ef7:	0f 95 c0             	setne  %al
27ca   e13efa:	41 29 c7             	sub    %eax,%r15d
27cd   e13efd:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
27d2   e13f02:	44 89 ee             	mov    %r13d,%esi
27d5   e13f05:	44 89 f2             	mov    %r14d,%edx
27d8   e13f08:	44 89 f9             	mov    %r15d,%ecx
27db   e13f0b:	45 89 e0             	mov    %r12d,%r8d
27de   e13f0e:	4c 8d 8c 24 ac 01 00 00 	lea    0x1ac(%rsp),%r9
27e6   e13f16:	6a ff                	push   $0xffffffffffffffff
27e8   e13f18:	6a ff                	push   $0xffffffffffffffff
27ea   e13f1a:	e8 81 ab 00 00       	call   e1eaa0 <set_parameters>
27ef   e13f1f:	48 83 c4 10          	add    $0x10,%rsp
27f3   e13f23:	31 c0                	xor    %eax,%eax
27f5   e13f25:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
27fa   e13f2a:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
2804   e13f34:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
2809   e13f39:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
280e   e13f3e:	e9 1c 04 00 00       	jmp    e1435f <fix_nodes+0x2c2f>
2813   e13f43:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
2819   e13f49:	0f 84 65 1b 00 00    	je     e15ab4 <fix_nodes+0x4384>
281f   e13f4f:	85 db                	test   %ebx,%ebx
2821   e13f51:	0f 85 6d 1b 00 00    	jne    e15ac4 <fix_nodes+0x4394>
2827   e13f57:	e8 00 00 00 00       	call   e13f5c <fix_nodes+0x282c>	e13f58: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
282c   e13f5c:	45 31 ff             	xor    %r15d,%r15d
282f   e13f5f:	e9 4d f1 ff ff       	jmp    e130b1 <fix_nodes+0x1981>
2834   e13f64:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
2839   e13f69:	48 89 d8             	mov    %rbx,%rax
283c   e13f6c:	48 c1 e8 03          	shr    $0x3,%rax
2840   e13f70:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
284a   e13f7a:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
284e   e13f7e:	84 c0                	test   %al,%al
2850   e13f80:	0f 85 04 3c 00 00    	jne    e17b8a <fix_nodes+0x645a>
2856   e13f86:	8b 1b                	mov    (%rbx),%ebx
2858   e13f88:	bf ff ff ff ff       	mov    $0xffffffff,%edi
285d   e13f8d:	89 de                	mov    %ebx,%esi
285f   e13f8f:	e8 00 00 00 00       	call   e13f94 <fix_nodes+0x2864>	e13f90: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2864   e13f94:	83 fb ff             	cmp    $0xffffffff,%ebx
2867   e13f97:	0f 84 99 28 00 00    	je     e16836 <fix_nodes+0x5106>
286d   e13f9d:	e8 00 00 00 00       	call   e13fa2 <fix_nodes+0x2872>	e13f9e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2872   e13fa2:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
287a   e13faa:	48 89 d0             	mov    %rdx,%rax
287d   e13fad:	48 c1 e8 03          	shr    $0x3,%rax
2881   e13fb1:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
288b   e13fbb:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
288f   e13fbf:	84 c0                	test   %al,%al
2891   e13fc1:	0f 85 4c 37 00 00    	jne    e17713 <fix_nodes+0x5fe3>
2897   e13fc7:	8b 1a                	mov    (%rdx),%ebx
2899   e13fc9:	89 df                	mov    %ebx,%edi
289b   e13fcb:	44 89 fe             	mov    %r15d,%esi
289e   e13fce:	e8 00 00 00 00       	call   e13fd3 <fix_nodes+0x28a3>	e13fcf: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
28a3   e13fd3:	44 39 fb             	cmp    %r15d,%ebx
28a6   e13fd6:	0f 8d b9 02 00 00    	jge    e14295 <fix_nodes+0x2b65>
28ac   e13fdc:	e8 00 00 00 00       	call   e13fe1 <fix_nodes+0x28b1>	e13fdd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
28b1   e13fe1:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
28b6   e13fe6:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
28bb   e13feb:	e9 ed 02 00 00       	jmp    e142dd <fix_nodes+0x2bad>
28c0   e13ff0:	e8 00 00 00 00       	call   e13ff5 <fix_nodes+0x28c5>	e13ff1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
28c5   e13ff5:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
28ca   e13ffa:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
28cf   e13fff:	74 08                	je     e14009 <fix_nodes+0x28d9>
28d1   e14001:	4c 89 ff             	mov    %r15,%rdi
28d4   e14004:	e8 00 00 00 00       	call   e14009 <fix_nodes+0x28d9>	e14005: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
28d9   e14009:	49 8b 3f             	mov    (%r15),%rdi
28dc   e1400c:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e1400f: R_X86_64_32S	.rodata+0x1b9500
28e3   e14013:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e14016: R_X86_64_32S	.rodata.str1.1+0x13e7
28ea   e1401a:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e1401d: R_X86_64_32S	.rodata+0x1b9520
28f1   e14021:	e8 00 00 00 00       	call   e14026 <fix_nodes+0x28f6>	e14022: R_X86_64_PLT32	__reiserfs_panic-0x4
28f6   e14026:	e9 c3 ea ff ff       	jmp    e12aee <fix_nodes+0x13be>
28fb   e1402b:	e8 00 00 00 00       	call   e14030 <fix_nodes+0x2900>	e1402c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2900   e14030:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
2905   e14035:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
290a   e1403a:	48 8d 3c 88          	lea    (%rax,%rcx,4),%rdi
290e   e1403e:	48 81 c7 b4 01 00 00 	add    $0x1b4,%rdi
2915   e14045:	48 89 f8             	mov    %rdi,%rax
2918   e14048:	48 c1 e8 03          	shr    $0x3,%rax
291c   e1404c:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
2926   e14056:	48 89 84 24 a0 00 00 00 	mov    %rax,0xa0(%rsp)
292e   e1405e:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
2932   e14062:	84 c0                	test   %al,%al
2934   e14064:	48 89 bc 24 98 00 00 00 	mov    %rdi,0x98(%rsp)
293c   e1406c:	0f 85 b6 3a 00 00    	jne    e17b28 <fix_nodes+0x63f8>
2942   e14072:	44 8b 3f             	mov    (%rdi),%r15d
2945   e14075:	41 0f b6 44 1d 00    	movzbl 0x0(%r13,%rbx,1),%eax
294b   e1407b:	84 c0                	test   %al,%al
294d   e1407d:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
2952   e14082:	0f 85 c2 3a 00 00    	jne    e17b4a <fix_nodes+0x641a>
2958   e14088:	0f b7 1f             	movzwl (%rdi),%ebx
295b   e1408b:	44 89 ff             	mov    %r15d,%edi
295e   e1408e:	89 de                	mov    %ebx,%esi
2960   e14090:	e8 00 00 00 00       	call   e14095 <fix_nodes+0x2965>	e14091: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
2965   e14095:	41 39 df             	cmp    %ebx,%r15d
2968   e14098:	0f 8e ac 0c 00 00    	jle    e14d4a <fix_nodes+0x361a>
296e   e1409e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2978   e140a8:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
297d   e140ad:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2981   e140b1:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
2986   e140b6:	74 08                	je     e140c0 <fix_nodes+0x2990>
2988   e140b8:	48 89 df             	mov    %rbx,%rdi
298b   e140bb:	e8 00 00 00 00       	call   e140c0 <fix_nodes+0x2990>	e140bc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2990   e140c0:	4c 8b 33             	mov    (%rbx),%r14
2993   e140c3:	4c 89 f0             	mov    %r14,%rax
2996   e140c6:	48 c1 e8 03          	shr    $0x3,%rax
299a   e140ca:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
29a4   e140d4:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
29a8   e140d8:	84 c0                	test   %al,%al
29aa   e140da:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
29af   e140df:	0f 85 ae 3d 00 00    	jne    e17e93 <fix_nodes+0x6763>
29b5   e140e5:	41 8b 06             	mov    (%r14),%eax
29b8   e140e8:	44 29 e0             	sub    %r12d,%eax
29bb   e140eb:	48 63 d8             	movslq %eax,%rbx
29be   e140ee:	bf 08 00 00 00       	mov    $0x8,%edi
29c3   e140f3:	89 de                	mov    %ebx,%esi
29c5   e140f5:	e8 00 00 00 00       	call   e140fa <fix_nodes+0x29ca>	e140f6: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
29ca   e140fa:	83 fb 07             	cmp    $0x7,%ebx
29cd   e140fd:	0f 87 4b 47 00 00    	ja     e1884e <fix_nodes+0x711e>
29d3   e14103:	e8 00 00 00 00       	call   e14108 <fix_nodes+0x29d8>	e14104: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
29d8   e14108:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
29e2   e14112:	48 c1 e3 04          	shl    $0x4,%rbx
29e6   e14116:	4c 01 f3             	add    %r14,%rbx
29e9   e14119:	48 83 c3 10          	add    $0x10,%rbx
29ed   e1411d:	48 89 d8             	mov    %rbx,%rax
29f0   e14120:	48 c1 e8 03          	shr    $0x3,%rax
29f4   e14124:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
29f9   e14129:	84 c0                	test   %al,%al
29fb   e1412b:	0f 85 80 3d 00 00    	jne    e17eb1 <fix_nodes+0x6781>
2a01   e14131:	44 8b 33             	mov    (%rbx),%r14d
2a04   e14134:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
2a09   e14139:	48 83 c3 28          	add    $0x28,%rbx
2a0d   e1413d:	48 89 d8             	mov    %rbx,%rax
2a10   e14140:	48 c1 e8 03          	shr    $0x3,%rax
2a14   e14144:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
2a19   e14149:	74 08                	je     e14153 <fix_nodes+0x2a23>
2a1b   e1414b:	48 89 df             	mov    %rbx,%rdi
2a1e   e1414e:	e8 00 00 00 00       	call   e14153 <fix_nodes+0x2a23>	e1414f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2a23   e14153:	48 8b 1b             	mov    (%rbx),%rbx
2a26   e14156:	48 83 c3 02          	add    $0x2,%rbx
2a2a   e1415a:	48 89 d8             	mov    %rbx,%rax
2a2d   e1415d:	48 c1 e8 03          	shr    $0x3,%rax
2a31   e14161:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
2a36   e14166:	84 c0                	test   %al,%al
2a38   e14168:	0f 85 60 3d 00 00    	jne    e17ece <fix_nodes+0x679e>
2a3e   e1416e:	0f b7 1b             	movzwl (%rbx),%ebx
2a41   e14171:	44 89 f7             	mov    %r14d,%edi
2a44   e14174:	89 de                	mov    %ebx,%esi
2a46   e14176:	e8 00 00 00 00       	call   e1417b <fix_nodes+0x2a4b>	e14177: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
2a4b   e1417b:	41 39 de             	cmp    %ebx,%r14d
2a4e   e1417e:	0f 84 cc 1b 00 00    	je     e15d50 <fix_nodes+0x4620>
2a54   e14184:	41 83 c6 01          	add    $0x1,%r14d
2a58   e14188:	4d 63 f6             	movslq %r14d,%r14
2a5b   e1418b:	49 c1 e6 03          	shl    $0x3,%r14
2a5f   e1418f:	e9 bf 1b 00 00       	jmp    e15d53 <fix_nodes+0x4623>
2a64   e14194:	e8 00 00 00 00       	call   e14199 <fix_nodes+0x2a69>	e14195: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2a69   e14199:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
2a6e   e1419e:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
2a73   e141a3:	4f 8d 34 af          	lea    (%r15,%r13,4),%r14
2a77   e141a7:	49 81 c6 b4 01 00 00 	add    $0x1b4,%r14
2a7e   e141ae:	4c 89 f0             	mov    %r14,%rax
2a81   e141b1:	4c 89 74 24 30       	mov    %r14,0x30(%rsp)
2a86   e141b6:	49 c1 ee 03          	shr    $0x3,%r14
2a8a   e141ba:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
2a94   e141c4:	41 0f b6 04 1e       	movzbl (%r14,%rbx,1),%eax
2a99   e141c9:	84 c0                	test   %al,%al
2a9b   e141cb:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
2aa0   e141d0:	0f 85 8e 38 00 00    	jne    e17a64 <fix_nodes+0x6334>
2aa6   e141d6:	47 8b a4 af b4 01 00 00 	mov    0x1b4(%r15,%r13,4),%r12d
2aae   e141de:	4f 8d 3c af          	lea    (%r15,%r13,4),%r15
2ab2   e141e2:	49 81 c7 a0 01 00 00 	add    $0x1a0,%r15
2ab9   e141e9:	4c 89 f8             	mov    %r15,%rax
2abc   e141ec:	48 c1 e8 03          	shr    $0x3,%rax
2ac0   e141f0:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
2ac4   e141f4:	84 c0                	test   %al,%al
2ac6   e141f6:	0f 85 94 38 00 00    	jne    e17a90 <fix_nodes+0x6360>
2acc   e141fc:	4d 63 3f             	movslq (%r15),%r15
2acf   e141ff:	45 01 fc             	add    %r15d,%r12d
2ad2   e14202:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
2ad7   e14207:	41 0f b6 44 1d 00    	movzbl 0x0(%r13,%rbx,1),%eax
2add   e1420d:	84 c0                	test   %al,%al
2adf   e1420f:	0f 85 a3 38 00 00    	jne    e17ab8 <fix_nodes+0x6388>
2ae5   e14215:	0f b7 1f             	movzwl (%rdi),%ebx
2ae8   e14218:	44 89 e7             	mov    %r12d,%edi
2aeb   e1421b:	89 de                	mov    %ebx,%esi
2aed   e1421d:	e8 00 00 00 00       	call   e14222 <fix_nodes+0x2af2>	e1421e: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
2af2   e14222:	41 39 dc             	cmp    %ebx,%r12d
2af5   e14225:	0f 8e 48 6d 00 00    	jle    e1af73 <fix_nodes+0x9843>
2afb   e1422b:	e8 00 00 00 00       	call   e14230 <fix_nodes+0x2b00>	e1422c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2b00   e14230:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
2b0a   e1423a:	43 0f b6 04 26       	movzbl (%r14,%r12,1),%eax
2b0f   e1423f:	84 c0                	test   %al,%al
2b11   e14241:	0f 85 98 38 00 00    	jne    e17adf <fix_nodes+0x63af>
2b17   e14247:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
2b1c   e1424c:	48 63 18             	movslq (%rax),%rbx
2b1f   e1424f:	43 0f b6 44 25 00    	movzbl 0x0(%r13,%r12,1),%eax
2b25   e14255:	84 c0                	test   %al,%al
2b27   e14257:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
2b2c   e1425c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
2b31   e14261:	0f 85 9a 38 00 00    	jne    e17b01 <fix_nodes+0x63d1>
2b37   e14267:	0f b7 17             	movzwl (%rdi),%edx
2b3a   e1426a:	49 01 df             	add    %rbx,%r15
2b3d   e1426d:	48 89 d0             	mov    %rdx,%rax
2b40   e14270:	4c 29 f8             	sub    %r15,%rax
2b43   e14273:	48 83 c0 03          	add    $0x3,%rax
2b47   e14277:	48 d1 e8             	shr    %rax
2b4a   e1427a:	8d 0c 18             	lea    (%rax,%rbx,1),%ecx
2b4d   e1427d:	83 c1 ff             	add    $0xffffffff,%ecx
2b50   e14280:	29 ca                	sub    %ecx,%edx
2b52   e14282:	83 c2 01             	add    $0x1,%edx
2b55   e14285:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
2b5a   e1428a:	48 89 df             	mov    %rbx,%rdi
2b5d   e1428d:	44 89 ee             	mov    %r13d,%esi
2b60   e14290:	e9 2d 25 00 00       	jmp    e167c2 <fix_nodes+0x5092>
2b65   e14295:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
2b6a   e1429a:	48 89 d0             	mov    %rdx,%rax
2b6d   e1429d:	48 c1 e8 03          	shr    $0x3,%rax
2b71   e142a1:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2b7b   e142ab:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
2b7f   e142af:	84 c0                	test   %al,%al
2b81   e142b1:	0f 85 0e 39 00 00    	jne    e17bc5 <fix_nodes+0x6495>
2b87   e142b7:	8b 1a                	mov    (%rdx),%ebx
2b89   e142b9:	bf ff ff ff ff       	mov    $0xffffffff,%edi
2b8e   e142be:	89 de                	mov    %ebx,%esi
2b90   e142c0:	e8 00 00 00 00       	call   e142c5 <fix_nodes+0x2b95>	e142c1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2b95   e142c5:	83 fb ff             	cmp    $0xffffffff,%ebx
2b98   e142c8:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
2b9d   e142cd:	0f 84 74 25 00 00    	je     e16847 <fix_nodes+0x5117>
2ba3   e142d3:	e8 00 00 00 00       	call   e142d8 <fix_nodes+0x2ba8>	e142d4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2ba8   e142d8:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
2bad   e142dd:	48 89 df             	mov    %rbx,%rdi
2bb0   e142e0:	e8 eb fe 00 00       	call   e241d0 <is_leaf_removable>
2bb5   e142e5:	89 c3                	mov    %eax,%ebx
2bb7   e142e7:	31 ff                	xor    %edi,%edi
2bb9   e142e9:	89 c6                	mov    %eax,%esi
2bbb   e142eb:	e8 00 00 00 00       	call   e142f0 <fix_nodes+0x2bc0>	e142ec: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2bc0   e142f0:	85 db                	test   %ebx,%ebx
2bc2   e142f2:	0f 84 fd 03 00 00    	je     e146f5 <fix_nodes+0x2fc5>
2bc8   e142f8:	e8 00 00 00 00       	call   e142fd <fix_nodes+0x2bcd>	e142f9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2bcd   e142fd:	31 c0                	xor    %eax,%eax
2bcf   e142ff:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
2bd4   e14304:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
2bde   e1430e:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
2be3   e14313:	eb 4a                	jmp    e1435f <fix_nodes+0x2c2f>
2be5   e14315:	e8 00 00 00 00       	call   e1431a <fix_nodes+0x2bea>	e14316: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2bea   e1431a:	31 c0                	xor    %eax,%eax
2bec   e1431c:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
2bf1   e14321:	e9 1c 0c 00 00       	jmp    e14f42 <fix_nodes+0x3812>
2bf6   e14326:	e8 00 00 00 00       	call   e1432b <fix_nodes+0x2bfb>	e14327: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2bfb   e1432b:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
2c00   e14330:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
2c05   e14335:	48 89 df             	mov    %rbx,%rdi
2c08   e14338:	44 89 ee             	mov    %r13d,%esi
2c0b   e1433b:	31 d2                	xor    %edx,%edx
2c0d   e1433d:	31 c9                	xor    %ecx,%ecx
2c0f   e1433f:	41 b8 01 00 00 00    	mov    $0x1,%r8d
2c15   e14345:	45 31 c9             	xor    %r9d,%r9d
2c18   e14348:	6a ff                	push   $0xffffffffffffffff
2c1a   e1434a:	6a ff                	push   $0xffffffffffffffff
2c1c   e1434c:	e8 4f a7 00 00       	call   e1eaa0 <set_parameters>
2c21   e14351:	48 83 c4 10          	add    $0x10,%rsp
2c25   e14355:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
2c2a   e1435a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
2c2f   e1435f:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
2c34   e14364:	89 df                	mov    %ebx,%edi
2c36   e14366:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e14369: R_X86_64_32S	.data+0x66ee30
2c3d   e1436d:	e8 00 00 00 00       	call   e14372 <fix_nodes+0x2c42>	e1436e: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
2c42   e14372:	85 db                	test   %ebx,%ebx
2c44   e14374:	0f 85 c4 4a 00 00    	jne    e18e3e <fix_nodes+0x770e>
2c4a   e1437a:	e8 00 00 00 00       	call   e1437f <fix_nodes+0x2c4f>	e1437b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2c4f   e1437f:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
2c54   e14384:	48 89 df             	mov    %rbx,%rdi
2c57   e14387:	44 89 ee             	mov    %r13d,%esi
2c5a   e1438a:	e8 61 72 00 00       	call   e1b5f0 <get_neighbors>
2c5f   e1438f:	49 89 df             	mov    %rbx,%r15
2c62   e14392:	89 c3                	mov    %eax,%ebx
2c64   e14394:	31 ff                	xor    %edi,%edi
2c66   e14396:	89 c6                	mov    %eax,%esi
2c68   e14398:	e8 00 00 00 00       	call   e1439d <fix_nodes+0x2c6d>	e14399: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2c6d   e1439d:	85 db                	test   %ebx,%ebx
2c6f   e1439f:	0f 85 08 4b 00 00    	jne    e18ead <fix_nodes+0x777d>
2c75   e143a5:	4c 89 ff             	mov    %r15,%rdi
2c78   e143a8:	4d 89 ec             	mov    %r13,%r12
2c7b   e143ab:	44 89 ee             	mov    %r13d,%esi
2c7e   e143ae:	e8 8d 8d 00 00       	call   e1d140 <get_empty_nodes>
2c83   e143b3:	89 c3                	mov    %eax,%ebx
2c85   e143b5:	31 ff                	xor    %edi,%edi
2c87   e143b7:	89 c6                	mov    %eax,%esi
2c89   e143b9:	e8 00 00 00 00       	call   e143be <fix_nodes+0x2c8e>	e143ba: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2c8e   e143be:	85 db                	test   %ebx,%ebx
2c90   e143c0:	0f 85 fe 4a 00 00    	jne    e18ec4 <fix_nodes+0x7794>
2c96   e143c6:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
2c9b   e143cb:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2ca5   e143d5:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2ca9   e143d9:	74 08                	je     e143e3 <fix_nodes+0x2cb3>
2cab   e143db:	4c 89 f7             	mov    %r14,%rdi
2cae   e143de:	e8 00 00 00 00       	call   e143e3 <fix_nodes+0x2cb3>	e143df: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2cb3   e143e3:	4d 8b 36             	mov    (%r14),%r14
2cb6   e143e6:	4c 89 f0             	mov    %r14,%rax
2cb9   e143e9:	48 c1 e8 03          	shr    $0x3,%rax
2cbd   e143ed:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2cc7   e143f7:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
2ccb   e143fb:	84 c0                	test   %al,%al
2ccd   e143fd:	4d 89 e5             	mov    %r12,%r13
2cd0   e14400:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
2cd5   e14405:	0f 85 c3 2b 00 00    	jne    e16fce <fix_nodes+0x589e>
2cdb   e1440b:	41 8b 06             	mov    (%r14),%eax
2cde   e1440e:	44 29 e8             	sub    %r13d,%eax
2ce1   e14411:	48 63 d8             	movslq %eax,%rbx
2ce4   e14414:	bf 08 00 00 00       	mov    $0x8,%edi
2ce9   e14419:	89 de                	mov    %ebx,%esi
2ceb   e1441b:	e8 00 00 00 00       	call   e14420 <fix_nodes+0x2cf0>	e1441c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2cf0   e14420:	83 fb 07             	cmp    $0x7,%ebx
2cf3   e14423:	0f 87 bb 2e 00 00    	ja     e172e4 <fix_nodes+0x5bb4>
2cf9   e14429:	e8 00 00 00 00       	call   e1442e <fix_nodes+0x2cfe>	e1442a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2cfe   e1442e:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
2d08   e14438:	48 c1 e3 04          	shl    $0x4,%rbx
2d0c   e1443c:	4c 01 f3             	add    %r14,%rbx
2d0f   e1443f:	48 83 c3 08          	add    $0x8,%rbx
2d13   e14443:	48 89 d8             	mov    %rbx,%rax
2d16   e14446:	48 c1 e8 03          	shr    $0x3,%rax
2d1a   e1444a:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
2d1f   e1444f:	74 08                	je     e14459 <fix_nodes+0x2d29>
2d21   e14451:	48 89 df             	mov    %rbx,%rdi
2d24   e14454:	e8 00 00 00 00       	call   e14459 <fix_nodes+0x2d29>	e14455: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2d29   e14459:	48 83 3b 00          	cmpq   $0x0,(%rbx)
2d2d   e1445d:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
2d32   e14462:	0f 84 f5 00 00 00    	je     e1455d <fix_nodes+0x2e2d>
2d38   e14468:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
2d3d   e1446d:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
2d42   e14472:	74 08                	je     e1447c <fix_nodes+0x2d4c>
2d44   e14474:	48 89 df             	mov    %rbx,%rdi
2d47   e14477:	e8 00 00 00 00       	call   e1447c <fix_nodes+0x2d4c>	e14478: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2d4c   e1447c:	4c 8b 3b             	mov    (%rbx),%r15
2d4f   e1447f:	4c 89 f8             	mov    %r15,%rax
2d52   e14482:	48 c1 e8 03          	shr    $0x3,%rax
2d56   e14486:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
2d5b   e1448b:	84 c0                	test   %al,%al
2d5d   e1448d:	0f 85 b6 2b 00 00    	jne    e17049 <fix_nodes+0x5919>
2d63   e14493:	41 8b 07             	mov    (%r15),%eax
2d66   e14496:	4d 8d 75 01          	lea    0x1(%r13),%r14
2d6a   e1449a:	44 29 f0             	sub    %r14d,%eax
2d6d   e1449d:	48 63 d8             	movslq %eax,%rbx
2d70   e144a0:	bf 08 00 00 00       	mov    $0x8,%edi
2d75   e144a5:	89 de                	mov    %ebx,%esi
2d77   e144a7:	e8 00 00 00 00       	call   e144ac <fix_nodes+0x2d7c>	e144a8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2d7c   e144ac:	83 fb 07             	cmp    $0x7,%ebx
2d7f   e144af:	0f 87 d1 2e 00 00    	ja     e17386 <fix_nodes+0x5c56>
2d85   e144b5:	e8 00 00 00 00       	call   e144ba <fix_nodes+0x2d8a>	e144b6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2d8a   e144ba:	48 c1 e3 04          	shl    $0x4,%rbx
2d8e   e144be:	4c 01 fb             	add    %r15,%rbx
2d91   e144c1:	48 83 c3 08          	add    $0x8,%rbx
2d95   e144c5:	48 89 d8             	mov    %rbx,%rax
2d98   e144c8:	48 c1 e8 03          	shr    $0x3,%rax
2d9c   e144cc:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
2da1   e144d1:	74 08                	je     e144db <fix_nodes+0x2dab>
2da3   e144d3:	48 89 df             	mov    %rbx,%rdi
2da6   e144d6:	e8 00 00 00 00       	call   e144db <fix_nodes+0x2dab>	e144d7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2dab   e144db:	4c 8b 2b             	mov    (%rbx),%r13
2dae   e144de:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
2db3   e144e3:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
2db8   e144e8:	4c 8d 3c 88          	lea    (%rax,%rcx,4),%r15
2dbc   e144ec:	49 81 c7 04 02 00 00 	add    $0x204,%r15
2dc3   e144f3:	4d 89 fc             	mov    %r15,%r12
2dc6   e144f6:	49 c1 ec 03          	shr    $0x3,%r12
2dca   e144fa:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2dd4   e14504:	41 0f b6 04 04       	movzbl (%r12,%rax,1),%eax
2dd9   e14509:	84 c0                	test   %al,%al
2ddb   e1450b:	0f 85 56 2b 00 00    	jne    e17067 <fix_nodes+0x5937>
2de1   e14511:	41 8b 1f             	mov    (%r15),%ebx
2de4   e14514:	4d 85 ed             	test   %r13,%r13
2de7   e14517:	0f 84 aa 00 00 00    	je     e145c7 <fix_nodes+0x2e97>
2ded   e1451d:	8d 04 5b             	lea    (%rbx,%rbx,2),%eax
2df0   e14520:	44 8d 3c c5 e8 ff ff ff 	lea    -0x18(,%rax,8),%r15d
2df8   e14528:	bf 04 00 00 00       	mov    $0x4,%edi
2dfd   e1452d:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
2e02   e14532:	48 89 de             	mov    %rbx,%rsi
2e05   e14535:	e8 00 00 00 00       	call   e1453a <fix_nodes+0x2e0a>	e14536: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2e0a   e1453a:	48 83 fb 04          	cmp    $0x4,%rbx
2e0e   e1453e:	0f 83 6e 30 00 00    	jae    e175b2 <fix_nodes+0x5e82>
2e14   e14544:	e8 00 00 00 00       	call   e14549 <fix_nodes+0x2e19>	e14545: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2e19   e14549:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
2e23   e14553:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
2e28   e14558:	e9 e4 00 00 00       	jmp    e14641 <fix_nodes+0x2f11>
2e2d   e1455d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
2e32   e14562:	4a 8d 1c a8          	lea    (%rax,%r13,4),%rbx
2e36   e14566:	48 81 c3 04 02 00 00 	add    $0x204,%rbx
2e3d   e1456d:	48 89 d8             	mov    %rbx,%rax
2e40   e14570:	48 c1 e8 03          	shr    $0x3,%rax
2e44   e14574:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
2e49   e14579:	84 c0                	test   %al,%al
2e4b   e1457b:	0f 85 f3 2b 00 00    	jne    e17174 <fix_nodes+0x5a44>
2e51   e14581:	8b 1b                	mov    (%rbx),%ebx
2e53   e14583:	bf 01 00 00 00       	mov    $0x1,%edi
2e58   e14588:	89 de                	mov    %ebx,%esi
2e5a   e1458a:	e8 00 00 00 00       	call   e1458f <fix_nodes+0x2e5f>	e1458b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2e5f   e1458f:	83 fb 01             	cmp    $0x1,%ebx
2e62   e14592:	0f 85 2a 01 00 00    	jne    e146c2 <fix_nodes+0x2f92>
2e68   e14598:	e8 00 00 00 00       	call   e1459d <fix_nodes+0x2e6d>	e14599: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2e6d   e1459d:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
2e72   e145a2:	bf 04 00 00 00       	mov    $0x4,%edi
2e77   e145a7:	4c 89 ee             	mov    %r13,%rsi
2e7a   e145aa:	e8 00 00 00 00       	call   e145af <fix_nodes+0x2e7f>	e145ab: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2e7f   e145af:	4d 8d 75 01          	lea    0x1(%r13),%r14
2e83   e145b3:	49 83 fd 04          	cmp    $0x4,%r13
2e87   e145b7:	0f 83 cc 00 00 00    	jae    e14689 <fix_nodes+0x2f59>
2e8d   e145bd:	e8 00 00 00 00       	call   e145c2 <fix_nodes+0x2e92>	e145be: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2e92   e145c2:	45 31 ff             	xor    %r15d,%r15d
2e95   e145c5:	eb 7a                	jmp    e14641 <fix_nodes+0x2f11>
2e97   e145c7:	bf 01 00 00 00       	mov    $0x1,%edi
2e9c   e145cc:	89 de                	mov    %ebx,%esi
2e9e   e145ce:	e8 00 00 00 00       	call   e145d3 <fix_nodes+0x2ea3>	e145cf: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2ea3   e145d3:	83 fb 02             	cmp    $0x2,%ebx
2ea6   e145d6:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
2eab   e145db:	bf 04 00 00 00       	mov    $0x4,%edi
2eb0   e145e0:	4c 89 ee             	mov    %r13,%rsi
2eb3   e145e3:	0f 8c b0 00 00 00    	jl     e14699 <fix_nodes+0x2f69>
2eb9   e145e9:	e8 00 00 00 00       	call   e145ee <fix_nodes+0x2ebe>	e145ea: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2ebe   e145ee:	49 83 fd 04          	cmp    $0x4,%r13
2ec2   e145f2:	0f 84 21 14 00 00    	je     e15a19 <fix_nodes+0x42e9>
2ec8   e145f8:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2ed2   e14602:	41 0f b6 04 0c       	movzbl (%r12,%rcx,1),%eax
2ed7   e14607:	49 89 cc             	mov    %rcx,%r12
2eda   e1460a:	84 c0                	test   %al,%al
2edc   e1460c:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
2ee1   e14611:	0f 85 71 2c 00 00    	jne    e17288 <fix_nodes+0x5b58>
2ee7   e14617:	41 8b 07             	mov    (%r15),%eax
2eea   e1461a:	8d 04 40             	lea    (%rax,%rax,2),%eax
2eed   e1461d:	44 8d 3c c5 f0 ff ff ff 	lea    -0x10(,%rax,8),%r15d
2ef5   e14625:	bf 04 00 00 00       	mov    $0x4,%edi
2efa   e1462a:	4c 89 ee             	mov    %r13,%rsi
2efd   e1462d:	e8 00 00 00 00       	call   e14632 <fix_nodes+0x2f02>	e1462e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2f02   e14632:	49 83 fd 04          	cmp    $0x4,%r13
2f06   e14636:	0f 83 4d 38 00 00    	jae    e17e89 <fix_nodes+0x6759>
2f0c   e1463c:	e8 00 00 00 00       	call   e14641 <fix_nodes+0x2f11>	e1463d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2f11   e14641:	4a 8d 1c b3          	lea    (%rbx,%r14,4),%rbx
2f15   e14645:	48 81 c3 f0 01 00 00 	add    $0x1f0,%rbx
2f1c   e1464c:	48 89 d8             	mov    %rbx,%rax
2f1f   e1464f:	48 c1 e8 03          	shr    $0x3,%rax
2f23   e14653:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
2f28   e14658:	84 c0                	test   %al,%al
2f2a   e1465a:	0f 85 8c 29 00 00    	jne    e16fec <fix_nodes+0x58bc>
2f30   e14660:	44 89 3b             	mov    %r15d,(%rbx)
2f33   e14663:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
2f38   e14668:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
2f3d   e1466d:	49 83 fe 05          	cmp    $0x5,%r14
2f41   e14671:	0f 84 6e 48 00 00    	je     e18ee5 <fix_nodes+0x77b5>
2f47   e14677:	e8 00 00 00 00       	call   e1467c <fix_nodes+0x2f4c>	e14678: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2f4c   e1467c:	4d 89 f5             	mov    %r14,%r13
2f4f   e1467f:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
2f54   e14684:	e9 19 da ff ff       	jmp    e120a2 <fix_nodes+0x972>
2f59   e14689:	e8 00 00 00 00       	call   e1468e <fix_nodes+0x2f5e>	e1468a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2f5e   e1468e:	49 83 fe 05          	cmp    $0x5,%r14
2f62   e14692:	75 e3                	jne    e14677 <fix_nodes+0x2f47>
2f64   e14694:	e9 4c 48 00 00       	jmp    e18ee5 <fix_nodes+0x77b5>
2f69   e14699:	e8 00 00 00 00       	call   e1469e <fix_nodes+0x2f6e>	e1469a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2f6e   e1469e:	49 83 fd 04          	cmp    $0x4,%r13
2f72   e146a2:	73 0d                	jae    e146b1 <fix_nodes+0x2f81>
2f74   e146a4:	e8 00 00 00 00       	call   e146a9 <fix_nodes+0x2f79>	e146a5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2f79   e146a9:	45 31 ff             	xor    %r15d,%r15d
2f7c   e146ac:	e9 98 fe ff ff       	jmp    e14549 <fix_nodes+0x2e19>
2f81   e146b1:	e8 00 00 00 00       	call   e146b6 <fix_nodes+0x2f86>	e146b2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2f86   e146b6:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
2f90   e146c0:	eb a1                	jmp    e14663 <fix_nodes+0x2f33>
2f92   e146c2:	e8 00 00 00 00       	call   e146c7 <fix_nodes+0x2f97>	e146c3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2f97   e146c7:	31 ff                	xor    %edi,%edi
2f99   e146c9:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e146cc: R_X86_64_32S	.rodata+0x1b9240
2fa0   e146d0:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e146d3: R_X86_64_32S	.rodata+0x1b8fa0
2fa7   e146d7:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e146da: R_X86_64_32S	.rodata+0x1b9280
2fae   e146de:	41 b8 71 0a 00 00    	mov    $0xa71,%r8d
2fb4   e146e4:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	e146e7: R_X86_64_32S	.rodata+0x1b8fa0
2fbb   e146eb:	e8 00 00 00 00       	call   e146f0 <fix_nodes+0x2fc0>	e146ec: R_X86_64_PLT32	__reiserfs_panic-0x4
2fc0   e146f0:	e9 a8 fe ff ff       	jmp    e1459d <fix_nodes+0x2e6d>
2fc5   e146f5:	4c 89 74 24 30       	mov    %r14,0x30(%rsp)
2fca   e146fa:	4d 89 ee             	mov    %r13,%r14
2fcd   e146fd:	44 8b ac 24 80 00 00 00 	mov    0x80(%rsp),%r13d
2fd5   e14705:	44 89 ef             	mov    %r13d,%edi
2fd8   e14708:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
2fdd   e1470d:	89 de                	mov    %ebx,%esi
2fdf   e1470f:	e8 00 00 00 00       	call   e14714 <fix_nodes+0x2fe4>	e14710: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
2fe4   e14714:	41 39 dd             	cmp    %ebx,%r13d
2fe7   e14717:	0f 8e b7 13 00 00    	jle    e15ad4 <fix_nodes+0x43a4>
2fed   e1471d:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
2ff2   e14722:	4c 89 f3             	mov    %r14,%rbx
2ff5   e14725:	4e 8d 34 b5 a0 01 00 00 	lea    0x1a0(,%r14,4),%r14
2ffd   e1472d:	4d 01 ee             	add    %r13,%r14
3000   e14730:	4c 89 f0             	mov    %r14,%rax
3003   e14733:	48 c1 e8 03          	shr    $0x3,%rax
3007   e14737:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
3011   e14741:	48 89 84 24 28 01 00 00 	mov    %rax,0x128(%rsp)
3019   e14749:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
301e   e1474e:	84 c0                	test   %al,%al
3020   e14750:	0f 85 d1 39 00 00    	jne    e18127 <fix_nodes+0x69f7>
3026   e14756:	41 8b 84 9d a0 01 00 00 	mov    0x1a0(%r13,%rbx,4),%eax
302e   e1475e:	89 44 24 30          	mov    %eax,0x30(%rsp)
3032   e14762:	48 8d 14 9d b4 01 00 00 	lea    0x1b4(,%rbx,4),%rdx
303a   e1476a:	4c 01 ea             	add    %r13,%rdx
303d   e1476d:	48 89 d0             	mov    %rdx,%rax
3040   e14770:	48 c1 e8 03          	shr    $0x3,%rax
3044   e14774:	48 89 84 24 20 01 00 00 	mov    %rax,0x120(%rsp)
304c   e1477c:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
3051   e14781:	84 c0                	test   %al,%al
3053   e14783:	48 8b 9c 24 f8 00 00 00 	mov    0xf8(%rsp),%rbx
305b   e1478b:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
3060   e14790:	0f 85 af 39 00 00    	jne    e18145 <fix_nodes+0x6a15>
3066   e14796:	4c 89 b4 24 b0 00 00 00 	mov    %r14,0xb0(%rsp)
306e   e1479e:	8b 02                	mov    (%rdx),%eax
3070   e147a0:	89 84 24 80 00 00 00 	mov    %eax,0x80(%rsp)
3077   e147a7:	42 0f b6 04 23       	movzbl (%rbx,%r12,1),%eax
307c   e147ac:	84 c0                	test   %al,%al
307e   e147ae:	4d 89 e7             	mov    %r12,%r15
3081   e147b1:	0f 85 b2 39 00 00    	jne    e18169 <fix_nodes+0x6a39>
3087   e147b7:	4c 8b 74 24 68       	mov    0x68(%rsp),%r14
308c   e147bc:	41 0f bf 3e          	movswl (%r14),%edi
3090   e147c0:	4c 89 ee             	mov    %r13,%rsi
3093   e147c3:	31 d2                	xor    %edx,%edx
3095   e147c5:	31 c9                	xor    %ecx,%ecx
3097   e147c7:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
309d   e147cd:	45 31 c9             	xor    %r9d,%r9d
30a0   e147d0:	6a 00                	push   $0x0
30a2   e147d2:	48 8d 84 24 78 01 00 00 	lea    0x178(%rsp),%rax
30aa   e147da:	50                   	push   %rax
30ab   e147db:	6a ff                	push   $0xffffffffffffffff
30ad   e147dd:	e8 4e 02 01 00       	call   e24a30 <get_num_ver>
30b2   e147e2:	48 83 c4 18          	add    $0x18,%rsp
30b6   e147e6:	41 89 c4             	mov    %eax,%r12d
30b9   e147e9:	42 0f b6 04 3b       	movzbl (%rbx,%r15,1),%eax
30be   e147ee:	84 c0                	test   %al,%al
30c0   e147f0:	0f 85 95 39 00 00    	jne    e1818b <fix_nodes+0x6a5b>
30c6   e147f6:	41 0f bf 3e          	movswl (%r14),%edi
30ca   e147fa:	4c 89 ee             	mov    %r13,%rsi
30cd   e147fd:	31 d2                	xor    %edx,%edx
30cf   e147ff:	31 c9                	xor    %ecx,%ecx
30d1   e14801:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
30d7   e14807:	45 31 c9             	xor    %r9d,%r9d
30da   e1480a:	6a 01                	push   $0x1
30dc   e1480c:	48 8d 84 24 82 01 00 00 	lea    0x182(%rsp),%rax
30e4   e14814:	50                   	push   %rax
30e5   e14815:	6a ff                	push   $0xffffffffffffffff
30e7   e14817:	e8 14 02 01 00       	call   e24a30 <get_num_ver>
30ec   e1481c:	48 83 c4 18          	add    $0x18,%rsp
30f0   e14820:	89 c3                	mov    %eax,%ebx
30f2   e14822:	44 89 e7             	mov    %r12d,%edi
30f5   e14825:	89 c6                	mov    %eax,%esi
30f7   e14827:	e8 00 00 00 00       	call   e1482c <fix_nodes+0x30fc>	e14828: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
30fc   e1482c:	41 39 dc             	cmp    %ebx,%r12d
30ff   e1482f:	0f 9f 84 24 08 01 00 00 	setg   0x108(%rsp)
3107   e14837:	44 0f 4f e3          	cmovg  %ebx,%r12d
310b   e1483b:	48 8b 84 24 f8 00 00 00 	mov    0xf8(%rsp),%rax
3113   e14843:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
3118   e14848:	84 c0                	test   %al,%al
311a   e1484a:	0f 85 59 39 00 00    	jne    e181a9 <fix_nodes+0x6a79>
3120   e14850:	45 0f bf 36          	movswl (%r14),%r14d
3124   e14854:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
3129   e14859:	48 c1 e8 03          	shr    $0x3,%rax
312d   e1485d:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
3132   e14862:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
3137   e14867:	84 c0                	test   %al,%al
3139   e14869:	4d 89 fd             	mov    %r15,%r13
313c   e1486c:	0f 85 55 39 00 00    	jne    e181c7 <fix_nodes+0x6a97>
3142   e14872:	44 89 64 24 38       	mov    %r12d,0x38(%rsp)
3147   e14877:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
314c   e1487c:	41 8b 9f 20 02 00 00 	mov    0x220(%r15),%ebx
3153   e14883:	bf ff ff ff ff       	mov    $0xffffffff,%edi
3158   e14888:	89 de                	mov    %ebx,%esi
315a   e1488a:	e8 00 00 00 00       	call   e1488f <fix_nodes+0x315f>	e1488b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
315f   e1488f:	31 c0                	xor    %eax,%eax
3161   e14891:	83 fb ff             	cmp    $0xffffffff,%ebx
3164   e14894:	0f 95 c0             	setne  %al
3167   e14897:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
316b   e1489b:	29 c1                	sub    %eax,%ecx
316d   e1489d:	44 89 f7             	mov    %r14d,%edi
3170   e148a0:	4c 89 fe             	mov    %r15,%rsi
3173   e148a3:	31 d2                	xor    %edx,%edx
3175   e148a5:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
317b   e148ab:	45 31 c9             	xor    %r9d,%r9d
317e   e148ae:	6a 00                	push   $0x0
3180   e148b0:	48 8d 84 24 8c 01 00 00 	lea    0x18c(%rsp),%rax
3188   e148b8:	50                   	push   %rax
3189   e148b9:	6a ff                	push   $0xffffffffffffffff
318b   e148bb:	e8 70 01 01 00       	call   e24a30 <get_num_ver>
3190   e148c0:	48 83 c4 18          	add    $0x18,%rsp
3194   e148c4:	89 c3                	mov    %eax,%ebx
3196   e148c6:	48 8b 84 24 f8 00 00 00 	mov    0xf8(%rsp),%rax
319e   e148ce:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
31a3   e148d3:	84 c0                	test   %al,%al
31a5   e148d5:	4d 89 ec             	mov    %r13,%r12
31a8   e148d8:	0f 85 0b 39 00 00    	jne    e181e9 <fix_nodes+0x6ab9>
31ae   e148de:	41 89 dd             	mov    %ebx,%r13d
31b1   e148e1:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
31b6   e148e6:	44 0f bf 30          	movswl (%rax),%r14d
31ba   e148ea:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
31bf   e148ef:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
31c4   e148f4:	84 c0                	test   %al,%al
31c6   e148f6:	0f 85 0f 39 00 00    	jne    e1820b <fix_nodes+0x6adb>
31cc   e148fc:	41 8b 9f 20 02 00 00 	mov    0x220(%r15),%ebx
31d3   e14903:	bf ff ff ff ff       	mov    $0xffffffff,%edi
31d8   e14908:	89 de                	mov    %ebx,%esi
31da   e1490a:	e8 00 00 00 00       	call   e1490f <fix_nodes+0x31df>	e1490b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
31df   e1490f:	31 c0                	xor    %eax,%eax
31e1   e14911:	83 fb ff             	cmp    $0xffffffff,%ebx
31e4   e14914:	0f 95 c0             	setne  %al
31e7   e14917:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
31eb   e1491b:	29 c1                	sub    %eax,%ecx
31ed   e1491d:	44 89 f7             	mov    %r14d,%edi
31f0   e14920:	4c 89 fe             	mov    %r15,%rsi
31f3   e14923:	31 d2                	xor    %edx,%edx
31f5   e14925:	41 89 d8             	mov    %ebx,%r8d
31f8   e14928:	45 31 c9             	xor    %r9d,%r9d
31fb   e1492b:	6a 01                	push   $0x1
31fd   e1492d:	48 8d 84 24 96 01 00 00 	lea    0x196(%rsp),%rax
3205   e14935:	50                   	push   %rax
3206   e14936:	6a ff                	push   $0xffffffffffffffff
3208   e14938:	e8 f3 00 01 00       	call   e24a30 <get_num_ver>
320d   e1493d:	48 83 c4 18          	add    $0x18,%rsp
3211   e14941:	89 c3                	mov    %eax,%ebx
3213   e14943:	45 89 ee             	mov    %r13d,%r14d
3216   e14946:	44 89 ef             	mov    %r13d,%edi
3219   e14949:	89 c6                	mov    %eax,%esi
321b   e1494b:	e8 00 00 00 00       	call   e14950 <fix_nodes+0x3220>	e1494c: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
3220   e14950:	41 39 dd             	cmp    %ebx,%r13d
3223   e14953:	0f 9f 84 24 30 01 00 00 	setg   0x130(%rsp)
322b   e1495b:	44 0f 4f f3          	cmovg  %ebx,%r14d
322f   e1495f:	48 8b 84 24 f8 00 00 00 	mov    0xf8(%rsp),%rax
3237   e14967:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
323c   e1496c:	84 c0                	test   %al,%al
323e   e1496e:	0f 85 b9 38 00 00    	jne    e1822d <fix_nodes+0x6afd>
3244   e14974:	44 89 b4 24 a8 00 00 00 	mov    %r14d,0xa8(%rsp)
324c   e1497c:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
3251   e14981:	44 0f bf 30          	movswl (%rax),%r14d
3255   e14985:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
325a   e1498a:	48 c1 e8 03          	shr    $0x3,%rax
325e   e1498e:	48 89 84 24 98 00 00 00 	mov    %rax,0x98(%rsp)
3266   e14996:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
326b   e1499b:	84 c0                	test   %al,%al
326d   e1499d:	0f 85 ac 38 00 00    	jne    e1824f <fix_nodes+0x6b1f>
3273   e149a3:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
3278   e149a8:	41 8b 9f 24 02 00 00 	mov    0x224(%r15),%ebx
327f   e149af:	bf ff ff ff ff       	mov    $0xffffffff,%edi
3284   e149b4:	89 de                	mov    %ebx,%esi
3286   e149b6:	e8 00 00 00 00       	call   e149bb <fix_nodes+0x328b>	e149b7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
328b   e149bb:	31 c0                	xor    %eax,%eax
328d   e149bd:	83 fb ff             	cmp    $0xffffffff,%ebx
3290   e149c0:	0f 95 c0             	setne  %al
3293   e149c3:	44 8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%r9d
329b   e149cb:	41 29 c1             	sub    %eax,%r9d
329e   e149ce:	44 89 f7             	mov    %r14d,%edi
32a1   e149d1:	4c 89 fe             	mov    %r15,%rsi
32a4   e149d4:	31 d2                	xor    %edx,%edx
32a6   e149d6:	31 c9                	xor    %ecx,%ecx
32a8   e149d8:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
32ae   e149de:	6a 00                	push   $0x0
32b0   e149e0:	48 8d 84 24 a0 01 00 00 	lea    0x1a0(%rsp),%rax
32b8   e149e8:	50                   	push   %rax
32b9   e149e9:	6a ff                	push   $0xffffffffffffffff
32bb   e149eb:	e8 40 00 01 00       	call   e24a30 <get_num_ver>
32c0   e149f0:	48 83 c4 18          	add    $0x18,%rsp
32c4   e149f4:	41 89 c5             	mov    %eax,%r13d
32c7   e149f7:	48 8b 84 24 f8 00 00 00 	mov    0xf8(%rsp),%rax
32cf   e149ff:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
32d4   e14a04:	84 c0                	test   %al,%al
32d6   e14a06:	0f 85 65 38 00 00    	jne    e18271 <fix_nodes+0x6b41>
32dc   e14a0c:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
32e1   e14a11:	44 0f bf 30          	movswl (%rax),%r14d
32e5   e14a15:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
32ed   e14a1d:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
32f2   e14a22:	84 c0                	test   %al,%al
32f4   e14a24:	0f 85 69 38 00 00    	jne    e18293 <fix_nodes+0x6b63>
32fa   e14a2a:	41 8b 9f 24 02 00 00 	mov    0x224(%r15),%ebx
3301   e14a31:	bf ff ff ff ff       	mov    $0xffffffff,%edi
3306   e14a36:	89 de                	mov    %ebx,%esi
3308   e14a38:	e8 00 00 00 00       	call   e14a3d <fix_nodes+0x330d>	e14a39: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
330d   e14a3d:	31 c0                	xor    %eax,%eax
330f   e14a3f:	83 fb ff             	cmp    $0xffffffff,%ebx
3312   e14a42:	0f 95 c0             	setne  %al
3315   e14a45:	44 8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%r9d
331d   e14a4d:	41 29 c1             	sub    %eax,%r9d
3320   e14a50:	44 89 f7             	mov    %r14d,%edi
3323   e14a53:	4c 89 fe             	mov    %r15,%rsi
3326   e14a56:	31 d2                	xor    %edx,%edx
3328   e14a58:	31 c9                	xor    %ecx,%ecx
332a   e14a5a:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
3330   e14a60:	6a 01                	push   $0x1
3332   e14a62:	48 8d 84 24 aa 01 00 00 	lea    0x1aa(%rsp),%rax
333a   e14a6a:	50                   	push   %rax
333b   e14a6b:	53                   	push   %rbx
333c   e14a6c:	e8 bf ff 00 00       	call   e24a30 <get_num_ver>
3341   e14a71:	48 83 c4 18          	add    $0x18,%rsp
3345   e14a75:	89 c3                	mov    %eax,%ebx
3347   e14a77:	44 89 ef             	mov    %r13d,%edi
334a   e14a7a:	89 c6                	mov    %eax,%esi
334c   e14a7c:	e8 00 00 00 00       	call   e14a81 <fix_nodes+0x3351>	e14a7d: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
3351   e14a81:	41 39 dd             	cmp    %ebx,%r13d
3354   e14a84:	0f 9f 84 24 cc 00 00 00 	setg   0xcc(%rsp)
335c   e14a8c:	44 0f 4f eb          	cmovg  %ebx,%r13d
3360   e14a90:	48 8b 84 24 f8 00 00 00 	mov    0xf8(%rsp),%rax
3368   e14a98:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
336d   e14a9d:	84 c0                	test   %al,%al
336f   e14a9f:	0f 85 10 38 00 00    	jne    e182b5 <fix_nodes+0x6b85>
3375   e14aa5:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
337a   e14aaa:	44 0f bf 30          	movswl (%rax),%r14d
337e   e14aae:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
3383   e14ab3:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
3388   e14ab8:	84 c0                	test   %al,%al
338a   e14aba:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
338f   e14abf:	0f 85 12 38 00 00    	jne    e182d7 <fix_nodes+0x6ba7>
3395   e14ac5:	44 89 ac 24 90 00 00 00 	mov    %r13d,0x90(%rsp)
339d   e14acd:	8b 1b                	mov    (%rbx),%ebx
339f   e14acf:	bf ff ff ff ff       	mov    $0xffffffff,%edi
33a4   e14ad4:	89 de                	mov    %ebx,%esi
33a6   e14ad6:	e8 00 00 00 00       	call   e14adb <fix_nodes+0x33ab>	e14ad7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
33ab   e14adb:	31 c0                	xor    %eax,%eax
33ad   e14add:	83 fb ff             	cmp    $0xffffffff,%ebx
33b0   e14ae0:	0f 95 c0             	setne  %al
33b3   e14ae3:	44 8b 7c 24 30       	mov    0x30(%rsp),%r15d
33b8   e14ae8:	41 29 c7             	sub    %eax,%r15d
33bb   e14aeb:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
33c3   e14af3:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
33c8   e14af8:	84 c0                	test   %al,%al
33ca   e14afa:	0f 85 f4 37 00 00    	jne    e182f4 <fix_nodes+0x6bc4>
33d0   e14b00:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
33d5   e14b05:	41 8b 9d 24 02 00 00 	mov    0x224(%r13),%ebx
33dc   e14b0c:	bf ff ff ff ff       	mov    $0xffffffff,%edi
33e1   e14b11:	89 de                	mov    %ebx,%esi
33e3   e14b13:	e8 00 00 00 00       	call   e14b18 <fix_nodes+0x33e8>	e14b14: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
33e8   e14b18:	31 c0                	xor    %eax,%eax
33ea   e14b1a:	83 fb ff             	cmp    $0xffffffff,%ebx
33ed   e14b1d:	4c 89 ee             	mov    %r13,%rsi
33f0   e14b20:	0f 95 c0             	setne  %al
33f3   e14b23:	44 8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%r9d
33fb   e14b2b:	41 29 c1             	sub    %eax,%r9d
33fe   e14b2e:	44 89 f7             	mov    %r14d,%edi
3401   e14b31:	31 d2                	xor    %edx,%edx
3403   e14b33:	44 89 f9             	mov    %r15d,%ecx
3406   e14b36:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
340c   e14b3c:	6a 00                	push   $0x0
340e   e14b3e:	48 8d 84 24 b4 01 00 00 	lea    0x1b4(%rsp),%rax
3416   e14b46:	50                   	push   %rax
3417   e14b47:	6a ff                	push   $0xffffffffffffffff
3419   e14b49:	e8 e2 fe 00 00       	call   e24a30 <get_num_ver>
341e   e14b4e:	48 83 c4 18          	add    $0x18,%rsp
3422   e14b52:	41 89 c6             	mov    %eax,%r14d
3425   e14b55:	48 8b 84 24 f8 00 00 00 	mov    0xf8(%rsp),%rax
342d   e14b5d:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
3432   e14b62:	84 c0                	test   %al,%al
3434   e14b64:	4d 89 e7             	mov    %r12,%r15
3437   e14b67:	0f 85 a9 37 00 00    	jne    e18316 <fix_nodes+0x6be6>
343d   e14b6d:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
3442   e14b72:	0f bf 00             	movswl (%rax),%eax
3445   e14b75:	89 84 24 a0 00 00 00 	mov    %eax,0xa0(%rsp)
344c   e14b7c:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
3451   e14b81:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
3456   e14b86:	84 c0                	test   %al,%al
3458   e14b88:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
345d   e14b8d:	0f 85 a5 37 00 00    	jne    e18338 <fix_nodes+0x6c08>
3463   e14b93:	44 8b 23             	mov    (%rbx),%r12d
3466   e14b96:	bf ff ff ff ff       	mov    $0xffffffff,%edi
346b   e14b9b:	44 89 e6             	mov    %r12d,%esi
346e   e14b9e:	e8 00 00 00 00       	call   e14ba3 <fix_nodes+0x3473>	e14b9f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
3473   e14ba3:	31 c0                	xor    %eax,%eax
3475   e14ba5:	41 83 fc ff          	cmp    $0xffffffff,%r12d
3479   e14ba9:	0f 95 c0             	setne  %al
347c   e14bac:	8b 5c 24 30          	mov    0x30(%rsp),%ebx
3480   e14bb0:	29 c3                	sub    %eax,%ebx
3482   e14bb2:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
348a   e14bba:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
348f   e14bbf:	84 c0                	test   %al,%al
3491   e14bc1:	0f 85 8e 37 00 00    	jne    e18355 <fix_nodes+0x6c25>
3497   e14bc7:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
349c   e14bcc:	45 8b bd 24 02 00 00 	mov    0x224(%r13),%r15d
34a3   e14bd3:	bf ff ff ff ff       	mov    $0xffffffff,%edi
34a8   e14bd8:	44 89 fe             	mov    %r15d,%esi
34ab   e14bdb:	e8 00 00 00 00       	call   e14be0 <fix_nodes+0x34b0>	e14bdc: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
34b0   e14be0:	31 c0                	xor    %eax,%eax
34b2   e14be2:	41 83 ff ff          	cmp    $0xffffffff,%r15d
34b6   e14be6:	0f 95 c0             	setne  %al
34b9   e14be9:	44 8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%r9d
34c1   e14bf1:	41 29 c1             	sub    %eax,%r9d
34c4   e14bf4:	8b bc 24 a0 00 00 00 	mov    0xa0(%rsp),%edi
34cb   e14bfb:	4c 89 ee             	mov    %r13,%rsi
34ce   e14bfe:	31 d2                	xor    %edx,%edx
34d0   e14c00:	89 d9                	mov    %ebx,%ecx
34d2   e14c02:	45 89 e0             	mov    %r12d,%r8d
34d5   e14c05:	6a 01                	push   $0x1
34d7   e14c07:	48 8d 84 24 be 01 00 00 	lea    0x1be(%rsp),%rax
34df   e14c0f:	50                   	push   %rax
34e0   e14c10:	41 57                	push   %r15
34e2   e14c12:	e8 19 fe 00 00       	call   e24a30 <get_num_ver>
34e7   e14c17:	48 83 c4 18          	add    $0x18,%rsp
34eb   e14c1b:	41 89 c7             	mov    %eax,%r15d
34ee   e14c1e:	44 89 f7             	mov    %r14d,%edi
34f1   e14c21:	89 c6                	mov    %eax,%esi
34f3   e14c23:	e8 00 00 00 00       	call   e14c28 <fix_nodes+0x34f8>	e14c24: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
34f8   e14c28:	45 39 fe             	cmp    %r15d,%r14d
34fb   e14c2b:	45 89 f4             	mov    %r14d,%r12d
34fe   e14c2e:	45 0f 4f e7          	cmovg  %r15d,%r12d
3502   e14c32:	44 89 e7             	mov    %r12d,%edi
3505   e14c35:	8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%ebx
350c   e14c3c:	89 de                	mov    %ebx,%esi
350e   e14c3e:	e8 00 00 00 00       	call   e14c43 <fix_nodes+0x3513>	e14c3f: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
3513   e14c43:	44 89 e7             	mov    %r12d,%edi
3516   e14c46:	44 8b ac 24 90 00 00 00 	mov    0x90(%rsp),%r13d
351e   e14c4e:	44 89 ee             	mov    %r13d,%esi
3521   e14c51:	e8 00 00 00 00       	call   e14c56 <fix_nodes+0x3526>	e14c52: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
3526   e14c56:	41 39 dc             	cmp    %ebx,%r12d
3529   e14c59:	0f 8d 33 12 00 00    	jge    e15e92 <fix_nodes+0x4762>
352f   e14c5f:	45 39 ec             	cmp    %r13d,%r12d
3532   e14c62:	0f 8d 2a 12 00 00    	jge    e15e92 <fix_nodes+0x4762>
3538   e14c68:	45 39 fe             	cmp    %r15d,%r14d
353b   e14c6b:	0f 8e 33 18 00 00    	jle    e164a4 <fix_nodes+0x4d74>
3541   e14c71:	e8 00 00 00 00       	call   e14c76 <fix_nodes+0x3546>	e14c72: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3546   e14c76:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
3550   e14c80:	48 8b 84 24 28 01 00 00 	mov    0x128(%rsp),%rax
3558   e14c88:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
355d   e14c8d:	84 c0                	test   %al,%al
355f   e14c8f:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
3564   e14c94:	0f 85 6e 3a 00 00    	jne    e18708 <fix_nodes+0x6fd8>
356a   e14c9a:	48 8b 84 24 b0 00 00 00 	mov    0xb0(%rsp),%rax
3572   e14ca2:	8b 10                	mov    (%rax),%edx
3574   e14ca4:	48 8b 84 24 20 01 00 00 	mov    0x120(%rsp),%rax
357c   e14cac:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
3581   e14cb1:	84 c0                	test   %al,%al
3583   e14cb3:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
3588   e14cb8:	48 8b 74 24 60       	mov    0x60(%rsp),%rsi
358d   e14cbd:	0f 85 6d 3a 00 00    	jne    e18730 <fix_nodes+0x7000>
3593   e14cc3:	44 8b 3e             	mov    (%rsi),%r15d
3596   e14cc6:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
359b   e14ccb:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
35a0   e14cd0:	84 c0                	test   %al,%al
35a2   e14cd2:	0f 85 82 3a 00 00    	jne    e1875a <fix_nodes+0x702a>
35a8   e14cd8:	8b 1b                	mov    (%rbx),%ebx
35aa   e14cda:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
35b2   e14ce2:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
35b7   e14ce7:	84 c0                	test   %al,%al
35b9   e14ce9:	0f 85 90 3a 00 00    	jne    e1877f <fix_nodes+0x704f>
35bf   e14cef:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
35c4   e14cf4:	8b 87 24 02 00 00    	mov    0x224(%rdi),%eax
35ca   e14cfa:	31 c9                	xor    %ecx,%ecx
35cc   e14cfc:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
35d1   e14d01:	31 f6                	xor    %esi,%esi
35d3   e14d03:	44 89 f9             	mov    %r15d,%ecx
35d6   e14d06:	45 89 e0             	mov    %r12d,%r8d
35d9   e14d09:	4c 8d 8c 24 b6 01 00 00 	lea    0x1b6(%rsp),%r9
35e1   e14d11:	50                   	push   %rax
35e2   e14d12:	53                   	push   %rbx
35e3   e14d13:	e8 88 9d 00 00       	call   e1eaa0 <set_parameters>
35e8   e14d18:	48 83 c4 10          	add    $0x10,%rsp
35ec   e14d1c:	e9 09 f2 ff ff       	jmp    e13f2a <fix_nodes+0x27fa>
35f1   e14d21:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
35f7   e14d27:	4c 8b ac 24 08 01 00 00 	mov    0x108(%rsp),%r13
35ff   e14d2f:	0f 84 2e 11 00 00    	je     e15e63 <fix_nodes+0x4733>
3605   e14d35:	85 db                	test   %ebx,%ebx
3607   e14d37:	0f 85 36 11 00 00    	jne    e15e73 <fix_nodes+0x4743>
360d   e14d3d:	e8 00 00 00 00       	call   e14d42 <fix_nodes+0x3612>	e14d3e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3612   e14d42:	45 31 ff             	xor    %r15d,%r15d
3615   e14d45:	e9 ba e4 ff ff       	jmp    e13204 <fix_nodes+0x1ad4>
361a   e14d4a:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
3624   e14d54:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
3629   e14d59:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
362e   e14d5e:	84 c0                	test   %al,%al
3630   e14d60:	0f 85 85 31 00 00    	jne    e17eeb <fix_nodes+0x67bb>
3636   e14d66:	48 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%rax
363e   e14d6e:	44 03 38             	add    (%rax),%r15d
3641   e14d71:	44 89 ff             	mov    %r15d,%edi
3644   e14d74:	89 de                	mov    %ebx,%esi
3646   e14d76:	e8 00 00 00 00       	call   e14d7b <fix_nodes+0x364b>	e14d77: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
364b   e14d7b:	41 39 df             	cmp    %ebx,%r15d
364e   e14d7e:	0f 8e 71 10 00 00    	jle    e15df5 <fix_nodes+0x46c5>
3654   e14d84:	4d 89 ef             	mov    %r13,%r15
3657   e14d87:	e8 00 00 00 00       	call   e14d8c <fix_nodes+0x365c>	e14d88: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
365c   e14d8c:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
3661   e14d91:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
3666   e14d96:	84 c0                	test   %al,%al
3668   e14d98:	0f 85 03 37 00 00    	jne    e184a1 <fix_nodes+0x6d71>
366e   e14d9e:	48 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%rax
3676   e14da6:	48 63 18             	movslq (%rax),%rbx
3679   e14da9:	48 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%rax
3681   e14db1:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
3686   e14db6:	84 c0                	test   %al,%al
3688   e14db8:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
368d   e14dbd:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
3692   e14dc2:	48 8b 94 24 98 00 00 00 	mov    0x98(%rsp),%rdx
369a   e14dca:	0f 85 f9 36 00 00    	jne    e184c9 <fix_nodes+0x6d99>
36a0   e14dd0:	4c 63 32             	movslq (%rdx),%r14
36a3   e14dd3:	43 0f b6 04 27       	movzbl (%r15,%r12,1),%eax
36a8   e14dd8:	84 c0                	test   %al,%al
36aa   e14dda:	0f 85 18 37 00 00    	jne    e184f8 <fix_nodes+0x6dc8>
36b0   e14de0:	0f b7 17             	movzwl (%rdi),%edx
36b3   e14de3:	4c 01 f3             	add    %r14,%rbx
36b6   e14de6:	48 89 d0             	mov    %rdx,%rax
36b9   e14de9:	48 29 d8             	sub    %rbx,%rax
36bc   e14dec:	48 83 c0 03          	add    $0x3,%rax
36c0   e14df0:	48 d1 e8             	shr    %rax
36c3   e14df3:	42 8d 0c 30          	lea    (%rax,%r14,1),%ecx
36c7   e14df7:	83 c1 ff             	add    $0xffffffff,%ecx
36ca   e14dfa:	e9 81 f4 ff ff       	jmp    e14280 <fix_nodes+0x2b50>
36cf   e14dff:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
36d9   e14e09:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
36de   e14e0e:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
36e2   e14e12:	74 08                	je     e14e1c <fix_nodes+0x36ec>
36e4   e14e14:	4c 89 f7             	mov    %r14,%rdi
36e7   e14e17:	e8 00 00 00 00       	call   e14e1c <fix_nodes+0x36ec>	e14e18: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
36ec   e14e1c:	4d 8b 36             	mov    (%r14),%r14
36ef   e14e1f:	4c 89 f0             	mov    %r14,%rax
36f2   e14e22:	48 c1 e8 03          	shr    $0x3,%rax
36f6   e14e26:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3700   e14e30:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
3704   e14e34:	84 c0                	test   %al,%al
3706   e14e36:	0f 85 f1 30 00 00    	jne    e17f2d <fix_nodes+0x67fd>
370c   e14e3c:	41 8b 06             	mov    (%r14),%eax
370f   e14e3f:	83 c0 ff             	add    $0xffffffff,%eax
3712   e14e42:	4c 63 f8             	movslq %eax,%r15
3715   e14e45:	bf 08 00 00 00       	mov    $0x8,%edi
371a   e14e4a:	44 89 fe             	mov    %r15d,%esi
371d   e14e4d:	e8 00 00 00 00       	call   e14e52 <fix_nodes+0x3722>	e14e4e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
3722   e14e52:	41 83 ff 07          	cmp    $0x7,%r15d
3726   e14e56:	0f 87 0b 3a 00 00    	ja     e18867 <fix_nodes+0x7137>
372c   e14e5c:	e8 00 00 00 00       	call   e14e61 <fix_nodes+0x3731>	e14e5d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3731   e14e61:	49 c1 e7 04          	shl    $0x4,%r15
3735   e14e65:	4d 01 fe             	add    %r15,%r14
3738   e14e68:	49 83 c6 10          	add    $0x10,%r14
373c   e14e6c:	4c 89 f0             	mov    %r14,%rax
373f   e14e6f:	48 c1 e8 03          	shr    $0x3,%rax
3743   e14e73:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
374d   e14e7d:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
3751   e14e81:	84 c0                	test   %al,%al
3753   e14e83:	0f 85 c2 30 00 00    	jne    e17f4b <fix_nodes+0x681b>
3759   e14e89:	41 8b 06             	mov    (%r14),%eax
375c   e14e8c:	83 c0 01             	add    $0x1,%eax
375f   e14e8f:	4c 63 f0             	movslq %eax,%r14
3762   e14e92:	49 c1 e6 03          	shl    $0x3,%r14
3766   e14e96:	49 8d 7d 20          	lea    0x20(%r13),%rdi
376a   e14e9a:	48 89 f8             	mov    %rdi,%rax
376d   e14e9d:	48 c1 e8 03          	shr    $0x3,%rax
3771   e14ea1:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
377b   e14eab:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
377f   e14eaf:	74 05                	je     e14eb6 <fix_nodes+0x3786>
3781   e14eb1:	e8 00 00 00 00       	call   e14eb6 <fix_nodes+0x3786>	e14eb2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3786   e14eb6:	41 8b 55 20          	mov    0x20(%r13),%edx
378a   e14eba:	49 83 c5 28          	add    $0x28,%r13
378e   e14ebe:	4c 89 e8             	mov    %r13,%rax
3791   e14ec1:	48 c1 e8 03          	shr    $0x3,%rax
3795   e14ec5:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
379f   e14ecf:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
37a3   e14ed3:	74 0e                	je     e14ee3 <fix_nodes+0x37b3>
37a5   e14ed5:	4c 89 ef             	mov    %r13,%rdi
37a8   e14ed8:	48 89 d3             	mov    %rdx,%rbx
37ab   e14edb:	e8 00 00 00 00       	call   e14ee0 <fix_nodes+0x37b0>	e14edc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
37b0   e14ee0:	48 89 da             	mov    %rbx,%rdx
37b3   e14ee3:	49 8b 5d 00          	mov    0x0(%r13),%rbx
37b7   e14ee7:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
37bb   e14eeb:	48 89 f8             	mov    %rdi,%rax
37be   e14eee:	48 c1 e8 03          	shr    $0x3,%rax
37c2   e14ef2:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
37cc   e14efc:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
37d1   e14f01:	84 c0                	test   %al,%al
37d3   e14f03:	0f 85 7b 2a 00 00    	jne    e17984 <fix_nodes+0x6254>
37d9   e14f09:	83 c2 e8             	add    $0xffffffe8,%edx
37dc   e14f0c:	0f b7 43 02          	movzwl 0x2(%rbx),%eax
37e0   e14f10:	48 c1 e0 04          	shl    $0x4,%rax
37e4   e14f14:	48 01 d8             	add    %rbx,%rax
37e7   e14f17:	49 8d 1c 06          	lea    (%r14,%rax,1),%rbx
37eb   e14f1b:	48 83 c3 1c          	add    $0x1c,%rbx
37ef   e14f1f:	48 89 d8             	mov    %rbx,%rax
37f2   e14f22:	48 c1 e8 03          	shr    $0x3,%rax
37f6   e14f26:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
37fb   e14f2b:	84 c0                	test   %al,%al
37fd   e14f2d:	0f 85 71 2a 00 00    	jne    e179a4 <fix_nodes+0x6274>
3803   e14f33:	0f b7 03             	movzwl (%rbx),%eax
3806   e14f36:	29 c2                	sub    %eax,%edx
3808   e14f38:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
380d   e14f3d:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
3812   e14f42:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
381c   e14f4c:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
3821   e14f51:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
3825   e14f55:	74 08                	je     e14f5f <fix_nodes+0x382f>
3827   e14f57:	4c 89 f7             	mov    %r14,%rdi
382a   e14f5a:	e8 00 00 00 00       	call   e14f5f <fix_nodes+0x382f>	e14f5b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
382f   e14f5f:	4d 8b 36             	mov    (%r14),%r14
3832   e14f62:	4c 89 f0             	mov    %r14,%rax
3835   e14f65:	48 c1 e8 03          	shr    $0x3,%rax
3839   e14f69:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3843   e14f73:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
3847   e14f77:	84 c0                	test   %al,%al
3849   e14f79:	0f 85 57 24 00 00    	jne    e173d6 <fix_nodes+0x5ca6>
384f   e14f7f:	41 8b 06             	mov    (%r14),%eax
3852   e14f82:	83 c0 ff             	add    $0xffffffff,%eax
3855   e14f85:	48 63 d8             	movslq %eax,%rbx
3858   e14f88:	bf 08 00 00 00       	mov    $0x8,%edi
385d   e14f8d:	89 de                	mov    %ebx,%esi
385f   e14f8f:	e8 00 00 00 00       	call   e14f94 <fix_nodes+0x3864>	e14f90: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
3864   e14f94:	83 fb 07             	cmp    $0x7,%ebx
3867   e14f97:	0f 87 76 34 00 00    	ja     e18413 <fix_nodes+0x6ce3>
386d   e14f9d:	e8 00 00 00 00       	call   e14fa2 <fix_nodes+0x3872>	e14f9e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3872   e14fa2:	48 c1 e3 04          	shl    $0x4,%rbx
3876   e14fa6:	4c 01 f3             	add    %r14,%rbx
3879   e14fa9:	48 83 c3 08          	add    $0x8,%rbx
387d   e14fad:	48 89 d8             	mov    %rbx,%rax
3880   e14fb0:	48 c1 e8 03          	shr    $0x3,%rax
3884   e14fb4:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
388e   e14fbe:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3892   e14fc2:	74 08                	je     e14fcc <fix_nodes+0x389c>
3894   e14fc4:	48 89 df             	mov    %rbx,%rdi
3897   e14fc7:	e8 00 00 00 00       	call   e14fcc <fix_nodes+0x389c>	e14fc8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
389c   e14fcc:	48 8b 1b             	mov    (%rbx),%rbx
389f   e14fcf:	48 85 db             	test   %rbx,%rbx
38a2   e14fd2:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
38a7   e14fd7:	0f 84 99 00 00 00    	je     e15076 <fix_nodes+0x3946>
38ad   e14fdd:	48 8b 94 24 00 01 00 00 	mov    0x100(%rsp),%rdx
38b5   e14fe5:	48 89 d0             	mov    %rdx,%rax
38b8   e14fe8:	48 c1 e8 03          	shr    $0x3,%rax
38bc   e14fec:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
38c6   e14ff6:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
38ca   e14ffa:	74 15                	je     e15011 <fix_nodes+0x38e1>
38cc   e14ffc:	48 8b bc 24 00 01 00 00 	mov    0x100(%rsp),%rdi
38d4   e15004:	e8 00 00 00 00       	call   e15009 <fix_nodes+0x38d9>	e15005: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
38d9   e15009:	48 8b 94 24 00 01 00 00 	mov    0x100(%rsp),%rdx
38e1   e15011:	4c 8b 3a             	mov    (%rdx),%r15
38e4   e15014:	4d 85 ff             	test   %r15,%r15
38e7   e15017:	74 6a                	je     e15083 <fix_nodes+0x3953>
38e9   e15019:	4c 39 fb             	cmp    %r15,%rbx
38ec   e1501c:	74 72                	je     e15090 <fix_nodes+0x3960>
38ee   e1501e:	e8 00 00 00 00       	call   e15023 <fix_nodes+0x38f3>	e1501f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
38f3   e15023:	49 8d 5f 28          	lea    0x28(%r15),%rbx
38f7   e15027:	48 89 d8             	mov    %rbx,%rax
38fa   e1502a:	48 c1 e8 03          	shr    $0x3,%rax
38fe   e1502e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3908   e15038:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
390c   e1503c:	74 08                	je     e15046 <fix_nodes+0x3916>
390e   e1503e:	48 89 df             	mov    %rbx,%rdi
3911   e15041:	e8 00 00 00 00       	call   e15046 <fix_nodes+0x3916>	e15042: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3916   e15046:	48 8b 1b             	mov    (%rbx),%rbx
3919   e15049:	48 83 c3 02          	add    $0x2,%rbx
391d   e1504d:	48 89 d8             	mov    %rbx,%rax
3920   e15050:	48 c1 e8 03          	shr    $0x3,%rax
3924   e15054:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
392e   e1505e:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
3932   e15062:	84 c0                	test   %al,%al
3934   e15064:	0f 85 ce 2b 00 00    	jne    e17c38 <fix_nodes+0x6508>
393a   e1506a:	44 0f b7 33          	movzwl (%rbx),%r14d
393e   e1506e:	4c 89 fb             	mov    %r15,%rbx
3941   e15071:	e9 ab 00 00 00       	jmp    e15121 <fix_nodes+0x39f1>
3946   e15076:	e8 00 00 00 00       	call   e1507b <fix_nodes+0x394b>	e15077: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
394b   e1507b:	45 31 ed             	xor    %r13d,%r13d
394e   e1507e:	e9 43 01 00 00       	jmp    e151c6 <fix_nodes+0x3a96>
3953   e15083:	e8 00 00 00 00       	call   e15088 <fix_nodes+0x3958>	e15084: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3958   e15088:	45 31 ed             	xor    %r13d,%r13d
395b   e1508b:	e9 36 01 00 00       	jmp    e151c6 <fix_nodes+0x3a96>
3960   e15090:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
396a   e1509a:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
396f   e1509f:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
3973   e150a3:	74 08                	je     e150ad <fix_nodes+0x397d>
3975   e150a5:	4c 89 f7             	mov    %r14,%rdi
3978   e150a8:	e8 00 00 00 00       	call   e150ad <fix_nodes+0x397d>	e150a9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
397d   e150ad:	4d 8b 36             	mov    (%r14),%r14
3980   e150b0:	4c 89 f0             	mov    %r14,%rax
3983   e150b3:	48 c1 e8 03          	shr    $0x3,%rax
3987   e150b7:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3991   e150c1:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
3995   e150c5:	84 c0                	test   %al,%al
3997   e150c7:	0f 85 9c 2e 00 00    	jne    e17f69 <fix_nodes+0x6839>
399d   e150cd:	41 8b 06             	mov    (%r14),%eax
39a0   e150d0:	83 c0 ff             	add    $0xffffffff,%eax
39a3   e150d3:	4c 63 f8             	movslq %eax,%r15
39a6   e150d6:	bf 08 00 00 00       	mov    $0x8,%edi
39ab   e150db:	44 89 fe             	mov    %r15d,%esi
39ae   e150de:	e8 00 00 00 00       	call   e150e3 <fix_nodes+0x39b3>	e150df: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
39b3   e150e3:	41 83 ff 07          	cmp    $0x7,%r15d
39b7   e150e7:	0f 87 93 37 00 00    	ja     e18880 <fix_nodes+0x7150>
39bd   e150ed:	e8 00 00 00 00       	call   e150f2 <fix_nodes+0x39c2>	e150ee: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
39c2   e150f2:	49 c1 e7 04          	shl    $0x4,%r15
39c6   e150f6:	4d 01 fe             	add    %r15,%r14
39c9   e150f9:	49 83 c6 10          	add    $0x10,%r14
39cd   e150fd:	4c 89 f0             	mov    %r14,%rax
39d0   e15100:	48 c1 e8 03          	shr    $0x3,%rax
39d4   e15104:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
39de   e1510e:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
39e2   e15112:	84 c0                	test   %al,%al
39e4   e15114:	0f 85 6d 2e 00 00    	jne    e17f87 <fix_nodes+0x6857>
39ea   e1511a:	45 8b 36             	mov    (%r14),%r14d
39ed   e1511d:	41 83 c6 ff          	add    $0xffffffff,%r14d
39f1   e15121:	48 8d 7b 20          	lea    0x20(%rbx),%rdi
39f5   e15125:	48 89 f8             	mov    %rdi,%rax
39f8   e15128:	48 c1 e8 03          	shr    $0x3,%rax
39fc   e1512c:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3a06   e15136:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3a0a   e1513a:	74 05                	je     e15141 <fix_nodes+0x3a11>
3a0c   e1513c:	e8 00 00 00 00       	call   e15141 <fix_nodes+0x3a11>	e1513d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3a11   e15141:	44 8b 6b 20          	mov    0x20(%rbx),%r13d
3a15   e15145:	48 83 c3 28          	add    $0x28,%rbx
3a19   e15149:	48 89 d8             	mov    %rbx,%rax
3a1c   e1514c:	48 c1 e8 03          	shr    $0x3,%rax
3a20   e15150:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3a2a   e1515a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3a2e   e1515e:	74 08                	je     e15168 <fix_nodes+0x3a38>
3a30   e15160:	48 89 df             	mov    %rbx,%rdi
3a33   e15163:	e8 00 00 00 00       	call   e15168 <fix_nodes+0x3a38>	e15164: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3a38   e15168:	48 8b 1b             	mov    (%rbx),%rbx
3a3b   e1516b:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
3a3f   e1516f:	48 89 f8             	mov    %rdi,%rax
3a42   e15172:	48 c1 e8 03          	shr    $0x3,%rax
3a46   e15176:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
3a50   e15180:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
3a55   e15185:	84 c0                	test   %al,%al
3a57   e15187:	0f 85 3a 28 00 00    	jne    e179c7 <fix_nodes+0x6297>
3a5d   e1518d:	41 83 c5 e8          	add    $0xffffffe8,%r13d
3a61   e15191:	0f b7 43 02          	movzwl 0x2(%rbx),%eax
3a65   e15195:	48 c1 e0 04          	shl    $0x4,%rax
3a69   e15199:	48 01 d8             	add    %rbx,%rax
3a6c   e1519c:	49 63 ce             	movslq %r14d,%rcx
3a6f   e1519f:	48 8d 1c c8          	lea    (%rax,%rcx,8),%rbx
3a73   e151a3:	48 83 c3 1c          	add    $0x1c,%rbx
3a77   e151a7:	48 89 d8             	mov    %rbx,%rax
3a7a   e151aa:	48 c1 e8 03          	shr    $0x3,%rax
3a7e   e151ae:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
3a83   e151b3:	84 c0                	test   %al,%al
3a85   e151b5:	0f 85 26 28 00 00    	jne    e179e1 <fix_nodes+0x62b1>
3a8b   e151bb:	0f b7 03             	movzwl (%rbx),%eax
3a8e   e151be:	41 29 c5             	sub    %eax,%r13d
3a91   e151c1:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
3a96   e151c6:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
3a9b   e151cb:	31 f6                	xor    %esi,%esi
3a9d   e151cd:	e8 8e b7 00 00       	call   e20960 <create_virtual_node>
3aa2   e151d2:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3aac   e151dc:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
3ab1   e151e1:	49 89 c4             	mov    %rax,%r12
3ab4   e151e4:	48 8b 9c 24 f0 00 00 00 	mov    0xf0(%rsp),%rbx
3abc   e151ec:	74 08                	je     e151f6 <fix_nodes+0x3ac6>
3abe   e151ee:	48 89 df             	mov    %rbx,%rdi
3ac1   e151f1:	e8 00 00 00 00       	call   e151f6 <fix_nodes+0x3ac6>	e151f2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3ac6   e151f6:	48 8b 03             	mov    (%rbx),%rax
3ac9   e151f9:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
3ace   e151fe:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
3ad3   e15203:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
3ad8   e15208:	74 08                	je     e15212 <fix_nodes+0x3ae2>
3ada   e1520a:	4c 89 f7             	mov    %r14,%rdi
3add   e1520d:	e8 00 00 00 00       	call   e15212 <fix_nodes+0x3ae2>	e1520e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3ae2   e15212:	4d 8b 3e             	mov    (%r14),%r15
3ae5   e15215:	4c 89 f8             	mov    %r15,%rax
3ae8   e15218:	48 c1 e8 03          	shr    $0x3,%rax
3aec   e1521c:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
3af1   e15221:	84 c0                	test   %al,%al
3af3   e15223:	0f 85 cb 21 00 00    	jne    e173f4 <fix_nodes+0x5cc4>
3af9   e15229:	49 63 1f             	movslq (%r15),%rbx
3afc   e1522c:	bf 08 00 00 00       	mov    $0x8,%edi
3b01   e15231:	89 de                	mov    %ebx,%esi
3b03   e15233:	e8 00 00 00 00       	call   e15238 <fix_nodes+0x3b08>	e15234: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
3b08   e15238:	48 83 fb 07          	cmp    $0x7,%rbx
3b0c   e1523c:	0f 87 ea 31 00 00    	ja     e1842c <fix_nodes+0x6cfc>
3b12   e15242:	e8 00 00 00 00       	call   e15247 <fix_nodes+0x3b17>	e15243: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3b17   e15247:	4c 89 6c 24 38       	mov    %r13,0x38(%rsp)
3b1c   e1524c:	48 c1 e3 04          	shl    $0x4,%rbx
3b20   e15250:	4c 01 fb             	add    %r15,%rbx
3b23   e15253:	48 83 c3 08          	add    $0x8,%rbx
3b27   e15257:	48 89 d8             	mov    %rbx,%rax
3b2a   e1525a:	48 c1 e8 03          	shr    $0x3,%rax
3b2e   e1525e:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
3b33   e15263:	74 08                	je     e1526d <fix_nodes+0x3b3d>
3b35   e15265:	48 89 df             	mov    %rbx,%rdi
3b38   e15268:	e8 00 00 00 00       	call   e1526d <fix_nodes+0x3b3d>	e15269: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3b3d   e1526d:	4c 8b 2b             	mov    (%rbx),%r13
3b40   e15270:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
3b45   e15275:	48 8d 58 08          	lea    0x8(%rax),%rbx
3b49   e15279:	48 89 d8             	mov    %rbx,%rax
3b4c   e1527c:	48 c1 e8 03          	shr    $0x3,%rax
3b50   e15280:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
3b55   e15285:	84 c0                	test   %al,%al
3b57   e15287:	0f 85 85 21 00 00    	jne    e17412 <fix_nodes+0x5ce2>
3b5d   e1528d:	44 0f b7 3b          	movzwl (%rbx),%r15d
3b61   e15291:	31 ff                	xor    %edi,%edi
3b63   e15293:	44 89 fe             	mov    %r15d,%esi
3b66   e15296:	e8 00 00 00 00       	call   e1529b <fix_nodes+0x3b6b>	e15297: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
3b6b   e1529b:	45 85 ff             	test   %r15d,%r15d
3b6e   e1529e:	0f 84 c4 03 00 00    	je     e15668 <fix_nodes+0x3f38>
3b74   e152a4:	e8 00 00 00 00       	call   e152a9 <fix_nodes+0x3b79>	e152a5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3b79   e152a9:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
3b7e   e152ae:	48 8d 58 28          	lea    0x28(%rax),%rbx
3b82   e152b2:	48 89 d8             	mov    %rbx,%rax
3b85   e152b5:	48 c1 e8 03          	shr    $0x3,%rax
3b89   e152b9:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
3b8e   e152be:	74 08                	je     e152c8 <fix_nodes+0x3b98>
3b90   e152c0:	48 89 df             	mov    %rbx,%rdi
3b93   e152c3:	e8 00 00 00 00       	call   e152c8 <fix_nodes+0x3b98>	e152c4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3b98   e152c8:	4c 8b 23             	mov    (%rbx),%r12
3b9b   e152cb:	49 8d 7c 24 04       	lea    0x4(%r12),%rdi
3ba0   e152d0:	48 89 f8             	mov    %rdi,%rax
3ba3   e152d3:	48 c1 e8 03          	shr    $0x3,%rax
3ba7   e152d7:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
3bb1   e152e1:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
3bb6   e152e6:	84 c0                	test   %al,%al
3bb8   e152e8:	0f 85 e4 22 00 00    	jne    e175d2 <fix_nodes+0x5ea2>
3bbe   e152ee:	41 0f b7 5c 24 04    	movzwl 0x4(%r12),%ebx
3bc4   e152f4:	83 e3 01             	and    $0x1,%ebx
3bc7   e152f7:	31 ff                	xor    %edi,%edi
3bc9   e152f9:	89 de                	mov    %ebx,%esi
3bcb   e152fb:	e8 00 00 00 00       	call   e15300 <fix_nodes+0x3bd0>	e152fc: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
3bd0   e15300:	f7 db                	neg    %ebx
3bd2   e15302:	83 e3 18             	and    $0x18,%ebx
3bd5   e15305:	4b 8d 04 bf          	lea    (%r15,%r15,4),%rax
3bd9   e15309:	4d 8d 3c c4          	lea    (%r12,%rax,8),%r15
3bdd   e1530d:	49 83 c7 dc          	add    $0xffffffffffffffdc,%r15
3be1   e15311:	4c 89 f8             	mov    %r15,%rax
3be4   e15314:	48 c1 e8 03          	shr    $0x3,%rax
3be8   e15318:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
3bed   e1531d:	84 c0                	test   %al,%al
3bef   e1531f:	4d 89 f4             	mov    %r14,%r12
3bf2   e15322:	0f 85 c4 22 00 00    	jne    e175ec <fix_nodes+0x5ebc>
3bf8   e15328:	41 0f b7 37          	movzwl (%r15),%esi
3bfc   e1532c:	44 8d 7b 18          	lea    0x18(%rbx),%r15d
3c00   e15330:	83 e6 02             	and    $0x2,%esi
3c03   e15333:	44 0f 44 fb          	cmove  %ebx,%r15d
3c07   e15337:	31 ff                	xor    %edi,%edi
3c09   e15339:	e8 00 00 00 00       	call   e1533e <fix_nodes+0x3c0e>	e1533a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
3c0e   e1533e:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
3c13   e15343:	49 83 c5 20          	add    $0x20,%r13
3c17   e15347:	4c 89 e8             	mov    %r13,%rax
3c1a   e1534a:	48 c1 e8 03          	shr    $0x3,%rax
3c1e   e1534e:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
3c23   e15353:	74 08                	je     e1535d <fix_nodes+0x3c2d>
3c25   e15355:	4c 89 ef             	mov    %r13,%rdi
3c28   e15358:	e8 00 00 00 00       	call   e1535d <fix_nodes+0x3c2d>	e15359: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3c2d   e1535d:	41 8b 5d 00          	mov    0x0(%r13),%ebx
3c31   e15361:	83 c3 e8             	add    $0xffffffe8,%ebx
3c34   e15364:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
3c39   e15369:	49 83 c5 0a          	add    $0xa,%r13
3c3d   e1536d:	4c 89 e8             	mov    %r13,%rax
3c40   e15370:	48 c1 e8 03          	shr    $0x3,%rax
3c44   e15374:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
3c49   e15379:	84 c0                	test   %al,%al
3c4b   e1537b:	0f 85 ae 20 00 00    	jne    e1742f <fix_nodes+0x5cff>
3c51   e15381:	41 0f bf 45 00       	movswl 0x0(%r13),%eax
3c56   e15386:	01 c3                	add    %eax,%ebx
3c58   e15388:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
3c5d   e1538d:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
3c62   e15392:	44 01 e8             	add    %r13d,%eax
3c65   e15395:	41 01 c7             	add    %eax,%r15d
3c68   e15398:	89 df                	mov    %ebx,%edi
3c6a   e1539a:	44 89 fe             	mov    %r15d,%esi
3c6d   e1539d:	e8 00 00 00 00       	call   e153a2 <fix_nodes+0x3c72>	e1539e: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
3c72   e153a2:	44 39 fb             	cmp    %r15d,%ebx
3c75   e153a5:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
3c7a   e153aa:	0f 8e 90 00 00 00    	jle    e15440 <fix_nodes+0x3d10>
3c80   e153b0:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
3c85   e153b5:	48 89 df             	mov    %rbx,%rdi
3c88   e153b8:	31 f6                	xor    %esi,%esi
3c8a   e153ba:	44 89 ea             	mov    %r13d,%edx
3c8d   e153bd:	e8 ee da 00 00       	call   e22eb0 <check_left>
3c92   e153c2:	48 89 df             	mov    %rbx,%rdi
3c95   e153c5:	31 f6                	xor    %esi,%esi
3c97   e153c7:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
3c9c   e153cc:	e8 2f e4 00 00       	call   e23800 <check_right>
3ca1   e153d1:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
3ca9   e153d9:	48 89 f8             	mov    %rdi,%rax
3cac   e153dc:	48 c1 e8 03          	shr    $0x3,%rax
3cb0   e153e0:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
3cb5   e153e5:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
3cba   e153ea:	84 c0                	test   %al,%al
3cbc   e153ec:	4c 89 e3             	mov    %r12,%rbx
3cbf   e153ef:	0f 85 48 23 00 00    	jne    e1773d <fix_nodes+0x600d>
3cc5   e153f5:	44 8b 37             	mov    (%rdi),%r14d
3cc8   e153f8:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
3ccd   e153fd:	48 83 c7 08          	add    $0x8,%rdi
3cd1   e15401:	49 89 fc             	mov    %rdi,%r12
3cd4   e15404:	49 c1 ec 03          	shr    $0x3,%r12
3cd8   e15408:	41 0f b6 04 1c       	movzbl (%r12,%rbx,1),%eax
3cdd   e1540d:	84 c0                	test   %al,%al
3cdf   e1540f:	48 89 f9             	mov    %rdi,%rcx
3ce2   e15412:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
3ce7   e15417:	4d 89 fd             	mov    %r15,%r13
3cea   e1541a:	0f 85 3f 23 00 00    	jne    e1775f <fix_nodes+0x602f>
3cf0   e15420:	0f b7 1f             	movzwl (%rdi),%ebx
3cf3   e15423:	44 89 f7             	mov    %r14d,%edi
3cf6   e15426:	89 de                	mov    %ebx,%esi
3cf8   e15428:	e8 00 00 00 00       	call   e1542d <fix_nodes+0x3cfd>	e15429: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
3cfd   e1542d:	41 39 de             	cmp    %ebx,%r14d
3d00   e15430:	0f 8d 67 03 00 00    	jge    e1579d <fix_nodes+0x406d>
3d06   e15436:	e8 00 00 00 00       	call   e1543b <fix_nodes+0x3d0b>	e15437: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3d0b   e1543b:	e9 a0 03 00 00       	jmp    e157e0 <fix_nodes+0x40b0>
3d10   e15440:	e8 00 00 00 00       	call   e15445 <fix_nodes+0x3d15>	e15441: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3d15   e15445:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
3d1d   e1544d:	48 89 f8             	mov    %rdi,%rax
3d20   e15450:	48 c1 e8 03          	shr    $0x3,%rax
3d24   e15454:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
3d29   e15459:	84 c0                	test   %al,%al
3d2b   e1545b:	0f 85 25 23 00 00    	jne    e17786 <fix_nodes+0x6056>
3d31   e15461:	c7 07 ff ff ff ff    	movl   $0xffffffff,(%rdi)
3d37   e15467:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
3d3f   e1546f:	48 89 f8             	mov    %rdi,%rax
3d42   e15472:	48 c1 e8 03          	shr    $0x3,%rax
3d46   e15476:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
3d4b   e1547b:	84 c0                	test   %al,%al
3d4d   e1547d:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
3d52   e15482:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
3d57   e15487:	48 8b b4 24 b8 00 00 00 	mov    0xb8(%rsp),%rsi
3d5f   e1548f:	4d 89 fd             	mov    %r15,%r13
3d62   e15492:	0f 85 10 23 00 00    	jne    e177a8 <fix_nodes+0x6078>
3d68   e15498:	c7 07 ff ff ff ff    	movl   $0xffffffff,(%rdi)
3d6e   e1549e:	48 89 f0             	mov    %rsi,%rax
3d71   e154a1:	48 c1 e8 03          	shr    $0x3,%rax
3d75   e154a5:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
3d7a   e154aa:	84 c0                	test   %al,%al
3d7c   e154ac:	0f 85 2d 23 00 00    	jne    e177df <fix_nodes+0x60af>
3d82   e154b2:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%rsi)
3d88   e154b8:	48 89 d8             	mov    %rbx,%rax
3d8b   e154bb:	48 c1 e8 03          	shr    $0x3,%rax
3d8f   e154bf:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
3d94   e154c4:	84 c0                	test   %al,%al
3d96   e154c6:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
3d9b   e154cb:	0f 85 3d 23 00 00    	jne    e1780e <fix_nodes+0x60de>
3da1   e154d1:	c7 03 ff ff ff ff    	movl   $0xffffffff,(%rbx)
3da7   e154d7:	48 89 d0             	mov    %rdx,%rax
3daa   e154da:	48 c1 e8 03          	shr    $0x3,%rax
3dae   e154de:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
3db3   e154e3:	84 c0                	test   %al,%al
3db5   e154e5:	0f 85 45 23 00 00    	jne    e17830 <fix_nodes+0x6100>
3dbb   e154eb:	c7 02 ff ff ff ff    	movl   $0xffffffff,(%rdx)
3dc1   e154f1:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
3dc6   e154f6:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
3dcb   e154fb:	74 08                	je     e15505 <fix_nodes+0x3dd5>
3dcd   e154fd:	4c 89 ff             	mov    %r15,%rdi
3dd0   e15500:	e8 00 00 00 00       	call   e15505 <fix_nodes+0x3dd5>	e15501: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3dd5   e15505:	49 8b 1f             	mov    (%r15),%rbx
3dd8   e15508:	b8 d8 06 00 00       	mov    $0x6d8,%eax
3ddd   e1550d:	48 01 c3             	add    %rax,%rbx
3de0   e15510:	48 89 d8             	mov    %rbx,%rax
3de3   e15513:	48 c1 e8 03          	shr    $0x3,%rax
3de7   e15517:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
3dec   e1551c:	74 08                	je     e15526 <fix_nodes+0x3df6>
3dee   e1551e:	48 89 df             	mov    %rbx,%rdi
3df1   e15521:	e8 00 00 00 00       	call   e15526 <fix_nodes+0x3df6>	e15522: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3df6   e15526:	48 8b 1b             	mov    (%rbx),%rbx
3df9   e15529:	b8 78 03 00 00       	mov    $0x378,%eax
3dfe   e1552e:	48 01 c3             	add    %rax,%rbx
3e01   e15531:	48 89 d8             	mov    %rbx,%rax
3e04   e15534:	48 c1 e8 03          	shr    $0x3,%rax
3e08   e15538:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
3e0d   e1553d:	74 08                	je     e15547 <fix_nodes+0x3e17>
3e0f   e1553f:	48 89 df             	mov    %rbx,%rdi
3e12   e15542:	e8 00 00 00 00       	call   e15547 <fix_nodes+0x3e17>	e15543: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3e17   e15547:	48 83 03 ff          	addq   $0xffffffffffffffff,(%rbx)
3e1b   e1554b:	49 8b 1f             	mov    (%r15),%rbx
3e1e   e1554e:	b8 d8 06 00 00       	mov    $0x6d8,%eax
3e23   e15553:	48 01 c3             	add    %rax,%rbx
3e26   e15556:	48 89 d8             	mov    %rbx,%rax
3e29   e15559:	48 c1 e8 03          	shr    $0x3,%rax
3e2d   e1555d:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
3e32   e15562:	74 08                	je     e1556c <fix_nodes+0x3e3c>
3e34   e15564:	48 89 df             	mov    %rbx,%rdi
3e37   e15567:	e8 00 00 00 00       	call   e1556c <fix_nodes+0x3e3c>	e15568: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3e3c   e1556c:	48 8b 1b             	mov    (%rbx),%rbx
3e3f   e1556f:	b8 a0 03 00 00       	mov    $0x3a0,%eax
3e44   e15574:	48 01 c3             	add    %rax,%rbx
3e47   e15577:	48 89 d8             	mov    %rbx,%rax
3e4a   e1557a:	48 c1 e8 03          	shr    $0x3,%rax
3e4e   e1557e:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
3e53   e15583:	74 08                	je     e1558d <fix_nodes+0x3e5d>
3e55   e15585:	48 89 df             	mov    %rbx,%rdi
3e58   e15588:	e8 00 00 00 00       	call   e1558d <fix_nodes+0x3e5d>	e15589: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3e5d   e1558d:	48 83 03 ff          	addq   $0xffffffffffffffff,(%rbx)
3e61   e15591:	49 8b 1f             	mov    (%r15),%rbx
3e64   e15594:	b8 d8 06 00 00       	mov    $0x6d8,%eax
3e69   e15599:	48 01 c3             	add    %rax,%rbx
3e6c   e1559c:	48 89 d8             	mov    %rbx,%rax
3e6f   e1559f:	48 c1 e8 03          	shr    $0x3,%rax
3e73   e155a3:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
3e78   e155a8:	74 08                	je     e155b2 <fix_nodes+0x3e82>
3e7a   e155aa:	48 89 df             	mov    %rbx,%rdi
3e7d   e155ad:	e8 00 00 00 00       	call   e155b2 <fix_nodes+0x3e82>	e155ae: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3e82   e155b2:	48 8b 1b             	mov    (%rbx),%rbx
3e85   e155b5:	b8 c8 03 00 00       	mov    $0x3c8,%eax
3e8a   e155ba:	48 01 c3             	add    %rax,%rbx
3e8d   e155bd:	48 89 d8             	mov    %rbx,%rax
3e90   e155c0:	48 c1 e8 03          	shr    $0x3,%rax
3e94   e155c4:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
3e99   e155c9:	74 08                	je     e155d3 <fix_nodes+0x3ea3>
3e9b   e155cb:	48 89 df             	mov    %rbx,%rdi
3e9e   e155ce:	e8 00 00 00 00       	call   e155d3 <fix_nodes+0x3ea3>	e155cf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3ea3   e155d3:	48 83 03 ff          	addq   $0xffffffffffffffff,(%rbx)
3ea7   e155d7:	49 8b 1f             	mov    (%r15),%rbx
3eaa   e155da:	b8 d8 06 00 00       	mov    $0x6d8,%eax
3eaf   e155df:	48 01 c3             	add    %rax,%rbx
3eb2   e155e2:	48 89 d8             	mov    %rbx,%rax
3eb5   e155e5:	48 c1 e8 03          	shr    $0x3,%rax
3eb9   e155e9:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
3ebe   e155ee:	74 08                	je     e155f8 <fix_nodes+0x3ec8>
3ec0   e155f0:	48 89 df             	mov    %rbx,%rdi
3ec3   e155f3:	e8 00 00 00 00       	call   e155f8 <fix_nodes+0x3ec8>	e155f4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3ec8   e155f8:	48 8b 1b             	mov    (%rbx),%rbx
3ecb   e155fb:	b8 f0 03 00 00       	mov    $0x3f0,%eax
3ed0   e15600:	48 01 c3             	add    %rax,%rbx
3ed3   e15603:	48 89 d8             	mov    %rbx,%rax
3ed6   e15606:	48 c1 e8 03          	shr    $0x3,%rax
3eda   e1560a:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
3edf   e1560f:	74 08                	je     e15619 <fix_nodes+0x3ee9>
3ee1   e15611:	48 89 df             	mov    %rbx,%rdi
3ee4   e15614:	e8 00 00 00 00       	call   e15619 <fix_nodes+0x3ee9>	e15615: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3ee9   e15619:	48 83 03 ff          	addq   $0xffffffffffffffff,(%rbx)
3eed   e1561d:	49 8b 1f             	mov    (%r15),%rbx
3ef0   e15620:	b8 d8 06 00 00       	mov    $0x6d8,%eax
3ef5   e15625:	48 01 c3             	add    %rax,%rbx
3ef8   e15628:	48 89 d8             	mov    %rbx,%rax
3efb   e1562b:	48 c1 e8 03          	shr    $0x3,%rax
3eff   e1562f:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
3f04   e15634:	74 08                	je     e1563e <fix_nodes+0x3f0e>
3f06   e15636:	48 89 df             	mov    %rbx,%rdi
3f09   e15639:	e8 00 00 00 00       	call   e1563e <fix_nodes+0x3f0e>	e1563a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3f0e   e1563e:	48 8b 1b             	mov    (%rbx),%rbx
3f11   e15641:	b8 58 02 00 00       	mov    $0x258,%eax
3f16   e15646:	48 01 c3             	add    %rax,%rbx
3f19   e15649:	48 89 d8             	mov    %rbx,%rax
3f1c   e1564c:	48 c1 e8 03          	shr    $0x3,%rax
3f20   e15650:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
3f25   e15655:	74 08                	je     e1565f <fix_nodes+0x3f2f>
3f27   e15657:	48 89 df             	mov    %rbx,%rdi
3f2a   e1565a:	e8 00 00 00 00       	call   e1565f <fix_nodes+0x3f2f>	e1565b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3f2f   e1565f:	48 83 03 01          	addq   $0x1,(%rbx)
3f33   e15663:	e9 17 ed ff ff       	jmp    e1437f <fix_nodes+0x2c4f>
3f38   e15668:	4d 8d 7d 28          	lea    0x28(%r13),%r15
3f3c   e1566c:	4c 89 e0             	mov    %r12,%rax
3f3f   e1566f:	4d 89 fc             	mov    %r15,%r12
3f42   e15672:	49 c1 ec 03          	shr    $0x3,%r12
3f46   e15676:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
3f4b   e1567b:	74 08                	je     e15685 <fix_nodes+0x3f55>
3f4d   e1567d:	4c 89 ff             	mov    %r15,%rdi
3f50   e15680:	e8 00 00 00 00       	call   e15685 <fix_nodes+0x3f55>	e15681: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3f55   e15685:	49 8b 1f             	mov    (%r15),%rbx
3f58   e15688:	48 83 c3 02          	add    $0x2,%rbx
3f5c   e1568c:	48 89 d8             	mov    %rbx,%rax
3f5f   e1568f:	48 c1 e8 03          	shr    $0x3,%rax
3f63   e15693:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3f6d   e1569d:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
3f71   e156a1:	84 c0                	test   %al,%al
3f73   e156a3:	0f 85 55 23 00 00    	jne    e179fe <fix_nodes+0x62ce>
3f79   e156a9:	0f b7 1b             	movzwl (%rbx),%ebx
3f7c   e156ac:	bf 01 00 00 00       	mov    $0x1,%edi
3f81   e156b1:	89 de                	mov    %ebx,%esi
3f83   e156b3:	e8 00 00 00 00       	call   e156b8 <fix_nodes+0x3f88>	e156b4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
3f88   e156b8:	83 fb 01             	cmp    $0x1,%ebx
3f8b   e156bb:	0f 85 3a 0e 00 00    	jne    e164fb <fix_nodes+0x4dcb>
3f91   e156c1:	e8 00 00 00 00       	call   e156c6 <fix_nodes+0x3f96>	e156c2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3f96   e156c6:	48 8b 9c 24 50 01 00 00 	mov    0x150(%rsp),%rbx
3f9e   e156ce:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3fa8   e156d8:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
3fad   e156dd:	49 89 c4             	mov    %rax,%r12
3fb0   e156e0:	74 08                	je     e156ea <fix_nodes+0x3fba>
3fb2   e156e2:	4c 89 ff             	mov    %r15,%rdi
3fb5   e156e5:	e8 00 00 00 00       	call   e156ea <fix_nodes+0x3fba>	e156e6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3fba   e156ea:	4d 8b 3f             	mov    (%r15),%r15
3fbd   e156ed:	48 89 d8             	mov    %rbx,%rax
3fc0   e156f0:	48 c1 e8 03          	shr    $0x3,%rax
3fc4   e156f4:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
3fc9   e156f9:	74 08                	je     e15703 <fix_nodes+0x3fd3>
3fcb   e156fb:	48 89 df             	mov    %rbx,%rdi
3fce   e156fe:	e8 00 00 00 00       	call   e15703 <fix_nodes+0x3fd3>	e156ff: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3fd3   e15703:	48 8b 1b             	mov    (%rbx),%rbx
3fd6   e15706:	48 85 db             	test   %rbx,%rbx
3fd9   e15709:	0f 84 ae 01 00 00    	je     e158bd <fix_nodes+0x418d>
3fdf   e1570f:	48 8b 94 24 38 01 00 00 	mov    0x138(%rsp),%rdx
3fe7   e15717:	48 89 d0             	mov    %rdx,%rax
3fea   e1571a:	48 c1 e8 03          	shr    $0x3,%rax
3fee   e1571e:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
3ff3   e15723:	84 c0                	test   %al,%al
3ff5   e15725:	4d 89 e6             	mov    %r12,%r14
3ff8   e15728:	0f 85 99 25 00 00    	jne    e17cc7 <fix_nodes+0x6597>
3ffe   e1572e:	4c 89 bc 24 d0 00 00 00 	mov    %r15,0xd0(%rsp)
4006   e15736:	49 83 c7 18          	add    $0x18,%r15
400a   e1573a:	4c 63 22             	movslq (%rdx),%r12
400d   e1573d:	48 83 c3 28          	add    $0x28,%rbx
4011   e15741:	48 89 d8             	mov    %rbx,%rax
4014   e15744:	48 c1 e8 03          	shr    $0x3,%rax
4018   e15748:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
401d   e1574d:	74 08                	je     e15757 <fix_nodes+0x4027>
401f   e1574f:	48 89 df             	mov    %rbx,%rdi
4022   e15752:	e8 00 00 00 00       	call   e15757 <fix_nodes+0x4027>	e15753: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4027   e15757:	48 8b 03             	mov    (%rbx),%rax
402a   e1575a:	49 c1 e4 04          	shl    $0x4,%r12
402e   e1575e:	4a 8d 34 20          	lea    (%rax,%r12,1),%rsi
4032   e15762:	48 83 c6 18          	add    $0x18,%rsi
4036   e15766:	4c 89 ff             	mov    %r15,%rdi
4039   e15769:	e8 00 00 00 00       	call   e1576e <fix_nodes+0x403e>	e1576a: R_X86_64_PLT32	comp_short_le_keys-0x4
403e   e1576e:	89 c3                	mov    %eax,%ebx
4040   e15770:	31 ff                	xor    %edi,%edi
4042   e15772:	89 c6                	mov    %eax,%esi
4044   e15774:	e8 00 00 00 00       	call   e15779 <fix_nodes+0x4049>	e15775: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4049   e15779:	85 db                	test   %ebx,%ebx
404b   e1577b:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
4050   e15780:	0f 84 b5 04 00 00    	je     e15c3b <fix_nodes+0x450b>
4056   e15786:	e8 00 00 00 00       	call   e1578b <fix_nodes+0x405b>	e15787: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
405b   e1578b:	45 31 ff             	xor    %r15d,%r15d
405e   e1578e:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
4068   e15798:	e9 a6 fb ff ff       	jmp    e15343 <fix_nodes+0x3c13>
406d   e1579d:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
4072   e157a2:	48 89 d8             	mov    %rbx,%rax
4075   e157a5:	48 c1 e8 03          	shr    $0x3,%rax
4079   e157a9:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
4083   e157b3:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
4087   e157b7:	84 c0                	test   %al,%al
4089   e157b9:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
408e   e157be:	0f 85 57 24 00 00    	jne    e17c1b <fix_nodes+0x64eb>
4094   e157c4:	8b 1b                	mov    (%rbx),%ebx
4096   e157c6:	bf ff ff ff ff       	mov    $0xffffffff,%edi
409b   e157cb:	89 de                	mov    %ebx,%esi
409d   e157cd:	e8 00 00 00 00       	call   e157d2 <fix_nodes+0x40a2>	e157ce: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
40a2   e157d2:	83 fb ff             	cmp    $0xffffffff,%ebx
40a5   e157d5:	0f 84 ef 03 00 00    	je     e15bca <fix_nodes+0x449a>
40ab   e157db:	e8 00 00 00 00       	call   e157e0 <fix_nodes+0x40b0>	e157dc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
40b0   e157e0:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
40b8   e157e8:	49 89 d5             	mov    %rdx,%r13
40bb   e157eb:	49 c1 ed 03          	shr    $0x3,%r13
40bf   e157ef:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
40c9   e157f9:	41 0f b6 44 1d 00    	movzbl 0x0(%r13,%rbx,1),%eax
40cf   e157ff:	84 c0                	test   %al,%al
40d1   e15801:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
40d6   e15806:	0f 85 1d 21 00 00    	jne    e17929 <fix_nodes+0x61f9>
40dc   e1580c:	44 8b 32             	mov    (%rdx),%r14d
40df   e1580f:	41 0f b6 04 1c       	movzbl (%r12,%rbx,1),%eax
40e4   e15814:	84 c0                	test   %al,%al
40e6   e15816:	0f 85 41 21 00 00    	jne    e1795d <fix_nodes+0x622d>
40ec   e1581c:	0f b7 1f             	movzwl (%rdi),%ebx
40ef   e1581f:	44 89 f7             	mov    %r14d,%edi
40f2   e15822:	89 de                	mov    %ebx,%esi
40f4   e15824:	e8 00 00 00 00       	call   e15829 <fix_nodes+0x40f9>	e15825: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
40f9   e15829:	41 39 de             	cmp    %ebx,%r14d
40fc   e1582c:	7d 11                	jge    e1583f <fix_nodes+0x410f>
40fe   e1582e:	e8 00 00 00 00       	call   e15833 <fix_nodes+0x4103>	e1582f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4103   e15833:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
4108   e15838:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
410d   e1583d:	eb 48                	jmp    e15887 <fix_nodes+0x4157>
410f   e1583f:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
4114   e15844:	48 89 d0             	mov    %rdx,%rax
4117   e15847:	48 c1 e8 03          	shr    $0x3,%rax
411b   e1584b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
4125   e15855:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
4129   e15859:	84 c0                	test   %al,%al
412b   e1585b:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
4130   e15860:	0f 85 ff 25 00 00    	jne    e17e65 <fix_nodes+0x6735>
4136   e15866:	8b 1a                	mov    (%rdx),%ebx
4138   e15868:	bf ff ff ff ff       	mov    $0xffffffff,%edi
413d   e1586d:	89 de                	mov    %ebx,%esi
413f   e1586f:	e8 00 00 00 00       	call   e15874 <fix_nodes+0x4144>	e15870: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4144   e15874:	83 fb ff             	cmp    $0xffffffff,%ebx
4147   e15877:	0f 84 9b 04 00 00    	je     e15d18 <fix_nodes+0x45e8>
414d   e1587d:	e8 00 00 00 00       	call   e15882 <fix_nodes+0x4152>	e1587e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4152   e15882:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
4157   e15887:	e8 44 e9 00 00       	call   e241d0 <is_leaf_removable>
415c   e1588c:	89 c3                	mov    %eax,%ebx
415e   e1588e:	31 ff                	xor    %edi,%edi
4160   e15890:	89 c6                	mov    %eax,%esi
4162   e15892:	e8 00 00 00 00       	call   e15897 <fix_nodes+0x4167>	e15893: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4167   e15897:	85 db                	test   %ebx,%ebx
4169   e15899:	0f 84 53 55 00 00    	je     e1adf2 <fix_nodes+0x96c2>
416f   e1589f:	e8 00 00 00 00       	call   e158a4 <fix_nodes+0x4174>	e158a0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4174   e158a4:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
417e   e158ae:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
4183   e158b3:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
4188   e158b8:	e9 c7 ea ff ff       	jmp    e14384 <fix_nodes+0x2c54>
418d   e158bd:	e8 00 00 00 00       	call   e158c2 <fix_nodes+0x4192>	e158be: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4192   e158c2:	45 31 ff             	xor    %r15d,%r15d
4195   e158c5:	e9 79 fa ff ff       	jmp    e15343 <fix_nodes+0x3c13>
419a   e158ca:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
419f   e158cf:	4a 8d 1c a8          	lea    (%rax,%r13,4),%rbx
41a3   e158d3:	48 81 c3 b4 01 00 00 	add    $0x1b4,%rbx
41aa   e158da:	48 89 d8             	mov    %rbx,%rax
41ad   e158dd:	48 c1 e8 03          	shr    $0x3,%rax
41b1   e158e1:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
41bb   e158eb:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
41c0   e158f0:	84 c0                	test   %al,%al
41c2   e158f2:	0f 85 69 27 00 00    	jne    e18061 <fix_nodes+0x6931>
41c8   e158f8:	44 8b 33             	mov    (%rbx),%r14d
41cb   e158fb:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
41d0   e15900:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
41d5   e15905:	84 c0                	test   %al,%al
41d7   e15907:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
41dc   e1590c:	0f 85 6c 27 00 00    	jne    e1807e <fix_nodes+0x694e>
41e2   e15912:	0f b7 1f             	movzwl (%rdi),%ebx
41e5   e15915:	44 89 f7             	mov    %r14d,%edi
41e8   e15918:	89 de                	mov    %ebx,%esi
41ea   e1591a:	e8 00 00 00 00       	call   e1591f <fix_nodes+0x41ef>	e1591b: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
41ef   e1591f:	41 39 de             	cmp    %ebx,%r14d
41f2   e15922:	0f 8e 5b 05 00 00    	jle    e15e83 <fix_nodes+0x4753>
41f8   e15928:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
4202   e15932:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
4207   e15937:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
420b   e1593b:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
4210   e15940:	74 08                	je     e1594a <fix_nodes+0x421a>
4212   e15942:	48 89 df             	mov    %rbx,%rdi
4215   e15945:	e8 00 00 00 00       	call   e1594a <fix_nodes+0x421a>	e15946: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
421a   e1594a:	4c 8b 33             	mov    (%rbx),%r14
421d   e1594d:	4c 89 f0             	mov    %r14,%rax
4220   e15950:	48 c1 e8 03          	shr    $0x3,%rax
4224   e15954:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
422e   e1595e:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
4232   e15962:	84 c0                	test   %al,%al
4234   e15964:	0f 85 b5 2b 00 00    	jne    e1851f <fix_nodes+0x6def>
423a   e1596a:	41 8b 06             	mov    (%r14),%eax
423d   e1596d:	44 29 e0             	sub    %r12d,%eax
4240   e15970:	48 63 d8             	movslq %eax,%rbx
4243   e15973:	bf 08 00 00 00       	mov    $0x8,%edi
4248   e15978:	89 de                	mov    %ebx,%esi
424a   e1597a:	e8 00 00 00 00       	call   e1597f <fix_nodes+0x424f>	e1597b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
424f   e1597f:	83 fb 07             	cmp    $0x7,%ebx
4252   e15982:	0f 87 75 2f 00 00    	ja     e188fd <fix_nodes+0x71cd>
4258   e15988:	e8 00 00 00 00       	call   e1598d <fix_nodes+0x425d>	e15989: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
425d   e1598d:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
4267   e15997:	48 c1 e3 04          	shl    $0x4,%rbx
426b   e1599b:	4c 01 f3             	add    %r14,%rbx
426e   e1599e:	48 83 c3 10          	add    $0x10,%rbx
4272   e159a2:	48 89 d8             	mov    %rbx,%rax
4275   e159a5:	48 c1 e8 03          	shr    $0x3,%rax
4279   e159a9:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
427e   e159ae:	84 c0                	test   %al,%al
4280   e159b0:	0f 85 87 2b 00 00    	jne    e1853d <fix_nodes+0x6e0d>
4286   e159b6:	44 8b 33             	mov    (%rbx),%r14d
4289   e159b9:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
428e   e159be:	48 83 c3 28          	add    $0x28,%rbx
4292   e159c2:	48 89 d8             	mov    %rbx,%rax
4295   e159c5:	48 c1 e8 03          	shr    $0x3,%rax
4299   e159c9:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
429e   e159ce:	74 08                	je     e159d8 <fix_nodes+0x42a8>
42a0   e159d0:	48 89 df             	mov    %rbx,%rdi
42a3   e159d3:	e8 00 00 00 00       	call   e159d8 <fix_nodes+0x42a8>	e159d4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
42a8   e159d8:	48 8b 1b             	mov    (%rbx),%rbx
42ab   e159db:	48 83 c3 02          	add    $0x2,%rbx
42af   e159df:	48 89 d8             	mov    %rbx,%rax
42b2   e159e2:	48 c1 e8 03          	shr    $0x3,%rax
42b6   e159e6:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
42bb   e159eb:	84 c0                	test   %al,%al
42bd   e159ed:	0f 85 67 2b 00 00    	jne    e1855a <fix_nodes+0x6e2a>
42c3   e159f3:	0f b7 1b             	movzwl (%rbx),%ebx
42c6   e159f6:	44 89 f7             	mov    %r14d,%edi
42c9   e159f9:	89 de                	mov    %ebx,%esi
42cb   e159fb:	e8 00 00 00 00       	call   e15a00 <fix_nodes+0x42d0>	e159fc: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
42d0   e15a00:	41 39 de             	cmp    %ebx,%r14d
42d3   e15a03:	0f 84 c0 08 00 00    	je     e162c9 <fix_nodes+0x4b99>
42d9   e15a09:	41 83 c6 01          	add    $0x1,%r14d
42dd   e15a0d:	4d 63 f6             	movslq %r14d,%r14
42e0   e15a10:	49 c1 e6 03          	shl    $0x3,%r14
42e4   e15a14:	e9 b3 08 00 00       	jmp    e162cc <fix_nodes+0x4b9c>
42e9   e15a19:	e8 00 00 00 00       	call   e15a1e <fix_nodes+0x42ee>	e15a1a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
42ee   e15a1e:	31 ff                	xor    %edi,%edi
42f0   e15a20:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e15a23: R_X86_64_32S	.rodata+0x1b9240
42f7   e15a27:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e15a2a: R_X86_64_32S	.rodata+0x1b8fa0
42fe   e15a2e:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e15a31: R_X86_64_32S	.rodata+0x1b9300
4305   e15a35:	41 b8 7f 0a 00 00    	mov    $0xa7f,%r8d
430b   e15a3b:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	e15a3e: R_X86_64_32S	.rodata+0x1b8fa0
4312   e15a42:	e8 00 00 00 00       	call   e15a47 <fix_nodes+0x4317>	e15a43: R_X86_64_PLT32	__reiserfs_panic-0x4
4317   e15a47:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
4321   e15a51:	41 0f b6 04 0c       	movzbl (%r12,%rcx,1),%eax
4326   e15a56:	49 89 cc             	mov    %rcx,%r12
4329   e15a59:	84 c0                	test   %al,%al
432b   e15a5b:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
4330   e15a60:	0f 85 59 26 00 00    	jne    e180bf <fix_nodes+0x698f>
4336   e15a66:	41 8b 07             	mov    (%r15),%eax
4339   e15a69:	8d 04 40             	lea    (%rax,%rax,2),%eax
433c   e15a6c:	44 8d 3c c5 f0 ff ff ff 	lea    -0x10(,%rax,8),%r15d
4344   e15a74:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e15a77: R_X86_64_32S	.data+0x66dcb0
434b   e15a7b:	4c 89 f6             	mov    %r14,%rsi
434e   e15a7e:	e8 00 00 00 00       	call   e15a83 <fix_nodes+0x4353>	e15a7f: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
4353   e15a83:	e9 b9 eb ff ff       	jmp    e14641 <fix_nodes+0x2f11>
4358   e15a88:	e8 00 00 00 00       	call   e15a8d <fix_nodes+0x435d>	e15a89: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
435d   e15a8d:	c7 44 24 60 14 00 00 00 	movl   $0x14,0x60(%rsp)
4365   e15a95:	c7 44 24 50 0a 00 00 00 	movl   $0xa,0x50(%rsp)
436d   e15a9d:	31 db                	xor    %ebx,%ebx
436f   e15a9f:	e9 34 04 00 00       	jmp    e15ed8 <fix_nodes+0x47a8>
4374   e15aa4:	e8 00 00 00 00       	call   e15aa9 <fix_nodes+0x4379>	e15aa5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4379   e15aa9:	41 bf 01 00 00 00    	mov    $0x1,%r15d
437f   e15aaf:	e9 fd d5 ff ff       	jmp    e130b1 <fix_nodes+0x1981>
4384   e15ab4:	e8 00 00 00 00       	call   e15ab9 <fix_nodes+0x4389>	e15ab5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4389   e15ab9:	41 bf 03 00 00 00    	mov    $0x3,%r15d
438f   e15abf:	e9 ed d5 ff ff       	jmp    e130b1 <fix_nodes+0x1981>
4394   e15ac4:	e8 00 00 00 00       	call   e15ac9 <fix_nodes+0x4399>	e15ac5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4399   e15ac9:	41 bf 0f 00 00 00    	mov    $0xf,%r15d
439f   e15acf:	e9 dd d5 ff ff       	jmp    e130b1 <fix_nodes+0x1981>
43a4   e15ad4:	e8 00 00 00 00       	call   e15ad9 <fix_nodes+0x43a9>	e15ad5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
43a9   e15ad9:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
43b3   e15ae3:	41 0f b6 04 0c       	movzbl (%r12,%rcx,1),%eax
43b8   e15ae8:	49 89 cc             	mov    %rcx,%r12
43bb   e15aeb:	84 c0                	test   %al,%al
43bd   e15aed:	4d 89 f5             	mov    %r14,%r13
43c0   e15af0:	0f 85 81 28 00 00    	jne    e18377 <fix_nodes+0x6c47>
43c6   e15af6:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
43cb   e15afb:	44 0f b7 30          	movzwl (%rax),%r14d
43cf   e15aff:	48 8b 9c 24 40 01 00 00 	mov    0x140(%rsp),%rbx
43d7   e15b07:	48 89 d8             	mov    %rbx,%rax
43da   e15b0a:	48 c1 e8 03          	shr    $0x3,%rax
43de   e15b0e:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
43e3   e15b13:	84 c0                	test   %al,%al
43e5   e15b15:	0f 85 7e 28 00 00    	jne    e18399 <fix_nodes+0x6c69>
43eb   e15b1b:	44 89 33             	mov    %r14d,(%rbx)
43ee   e15b1e:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
43f3   e15b23:	e9 26 dd ff ff       	jmp    e1384e <fix_nodes+0x211e>
43f8   e15b28:	4b 8d 1c af          	lea    (%r15,%r13,4),%rbx
43fc   e15b2c:	48 81 c3 b4 01 00 00 	add    $0x1b4,%rbx
4403   e15b33:	48 89 d8             	mov    %rbx,%rax
4406   e15b36:	48 c1 e8 03          	shr    $0x3,%rax
440a   e15b3a:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
4414   e15b44:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
4419   e15b49:	84 c0                	test   %al,%al
441b   e15b4b:	0f 85 65 28 00 00    	jne    e183b6 <fix_nodes+0x6c86>
4421   e15b51:	44 8b 3b             	mov    (%rbx),%r15d
4424   e15b54:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
4429   e15b59:	43 0f b6 44 35 00    	movzbl 0x0(%r13,%r14,1),%eax
442f   e15b5f:	84 c0                	test   %al,%al
4431   e15b61:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
4436   e15b66:	0f 85 67 28 00 00    	jne    e183d3 <fix_nodes+0x6ca3>
443c   e15b6c:	0f b7 1f             	movzwl (%rdi),%ebx
443f   e15b6f:	44 89 ff             	mov    %r15d,%edi
4442   e15b72:	89 de                	mov    %ebx,%esi
4444   e15b74:	e8 00 00 00 00       	call   e15b79 <fix_nodes+0x4449>	e15b75: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
4449   e15b79:	41 39 df             	cmp    %ebx,%r15d
444c   e15b7c:	0f 8e 7d 05 00 00    	jle    e160ff <fix_nodes+0x49cf>
4452   e15b82:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
4457   e15b87:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
445c   e15b8c:	48 8d 1c c8          	lea    (%rax,%rcx,8),%rbx
4460   e15b90:	48 81 c3 98 00 00 00 	add    $0x98,%rbx
4467   e15b97:	48 89 d8             	mov    %rbx,%rax
446a   e15b9a:	48 c1 e8 03          	shr    $0x3,%rax
446e   e15b9e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
4478   e15ba8:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
447c   e15bac:	74 08                	je     e15bb6 <fix_nodes+0x4486>
447e   e15bae:	48 89 df             	mov    %rbx,%rdi
4481   e15bb1:	e8 00 00 00 00       	call   e15bb6 <fix_nodes+0x4486>	e15bb2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4486   e15bb6:	48 83 3b 00          	cmpq   $0x0,(%rbx)
448a   e15bba:	0f 84 49 0a 00 00    	je     e16609 <fix_nodes+0x4ed9>
4490   e15bc0:	e8 00 00 00 00       	call   e15bc5 <fix_nodes+0x4495>	e15bc1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4495   e15bc5:	e9 66 e4 ff ff       	jmp    e14030 <fix_nodes+0x2900>
449a   e15bca:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
449f   e15bcf:	31 f6                	xor    %esi,%esi
44a1   e15bd1:	e8 1a 03 01 00       	call   e25ef0 <is_left_neighbor_in_cache>
44a6   e15bd6:	89 c3                	mov    %eax,%ebx
44a8   e15bd8:	31 ff                	xor    %edi,%edi
44aa   e15bda:	89 c6                	mov    %eax,%esi
44ac   e15bdc:	e8 00 00 00 00       	call   e15be1 <fix_nodes+0x44b1>	e15bdd: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
44b1   e15be1:	85 db                	test   %ebx,%ebx
44b3   e15be3:	0f 84 f6 05 00 00    	je     e161df <fix_nodes+0x4aaf>
44b9   e15be9:	e8 00 00 00 00       	call   e15bee <fix_nodes+0x44be>	e15bea: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
44be   e15bee:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
44c3   e15bf3:	e9 7e 06 00 00       	jmp    e16276 <fix_nodes+0x4b46>
44c8   e15bf8:	e8 00 00 00 00       	call   e15bfd <fix_nodes+0x44cd>	e15bf9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
44cd   e15bfd:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
44d2   e15c02:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
44d7   e15c07:	74 08                	je     e15c11 <fix_nodes+0x44e1>
44d9   e15c09:	4c 89 ff             	mov    %r15,%rdi
44dc   e15c0c:	e8 00 00 00 00       	call   e15c11 <fix_nodes+0x44e1>	e15c0d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
44e1   e15c11:	49 8b 3f             	mov    (%r15),%rdi
44e4   e15c14:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e15c17: R_X86_64_32S	.rodata+0x1b9560
44eb   e15c1b:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e15c1e: R_X86_64_32S	.rodata.str1.1+0x13e7
44f2   e15c22:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e15c25: R_X86_64_32S	.rodata+0x1b9580
44f9   e15c29:	e8 00 00 00 00       	call   e15c2e <fix_nodes+0x44fe>	e15c2a: R_X86_64_PLT32	__reiserfs_panic-0x4
44fe   e15c2e:	49 89 dd             	mov    %rbx,%r13
4501   e15c31:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
4506   e15c36:	e9 1f cc ff ff       	jmp    e1285a <fix_nodes+0x112a>
450b   e15c3b:	48 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%rax
4513   e15c43:	48 8d 58 2e          	lea    0x2e(%rax),%rbx
4517   e15c47:	4c 8d 78 2f          	lea    0x2f(%rax),%r15
451b   e15c4b:	48 89 d8             	mov    %rbx,%rax
451e   e15c4e:	48 c1 e8 03          	shr    $0x3,%rax
4522   e15c52:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
452c   e15c5c:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
4531   e15c61:	84 c0                	test   %al,%al
4533   e15c63:	0f 85 f9 27 00 00    	jne    e18462 <fix_nodes+0x6d32>
4539   e15c69:	4c 89 f8             	mov    %r15,%rax
453c   e15c6c:	48 c1 e8 03          	shr    $0x3,%rax
4540   e15c70:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
4545   e15c75:	84 c0                	test   %al,%al
4547   e15c77:	0f 85 04 28 00 00    	jne    e18481 <fix_nodes+0x6d51>
454d   e15c7d:	0f b7 1b             	movzwl (%rbx),%ebx
4550   e15c80:	31 ff                	xor    %edi,%edi
4552   e15c82:	89 de                	mov    %ebx,%esi
4554   e15c84:	e8 00 00 00 00       	call   e15c89 <fix_nodes+0x4559>	e15c85: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
4559   e15c89:	85 db                	test   %ebx,%ebx
455b   e15c8b:	0f 84 e0 06 00 00    	je     e16371 <fix_nodes+0x4c41>
4561   e15c91:	48 8b 9c 24 d0 00 00 00 	mov    0xd0(%rsp),%rbx
4569   e15c99:	4c 8d 7b 20          	lea    0x20(%rbx),%r15
456d   e15c9d:	48 83 c3 27          	add    $0x27,%rbx
4571   e15ca1:	4c 89 f8             	mov    %r15,%rax
4574   e15ca4:	48 c1 e8 03          	shr    $0x3,%rax
4578   e15ca8:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
457d   e15cad:	84 c0                	test   %al,%al
457f   e15caf:	0f 85 48 29 00 00    	jne    e185fd <fix_nodes+0x6ecd>
4585   e15cb5:	48 89 d8             	mov    %rbx,%rax
4588   e15cb8:	48 c1 e8 03          	shr    $0x3,%rax
458c   e15cbc:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
4591   e15cc1:	84 c0                	test   %al,%al
4593   e15cc3:	0f 85 54 29 00 00    	jne    e1861d <fix_nodes+0x6eed>
4599   e15cc9:	4d 8b 3f             	mov    (%r15),%r15
459c   e15ccc:	4c 89 fb             	mov    %r15,%rbx
459f   e15ccf:	48 b8 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rax
45a9   e15cd9:	48 21 c3             	and    %rax,%rbx
45ac   e15cdc:	48 bf 00 00 00 00 00 00 00 30 	movabs $0x3000000000000000,%rdi
45b6   e15ce6:	48 89 de             	mov    %rbx,%rsi
45b9   e15ce9:	e8 00 00 00 00       	call   e15cee <fix_nodes+0x45be>	e15cea: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
45be   e15cee:	48 b8 00 00 00 00 00 00 00 30 	movabs $0x3000000000000000,%rax
45c8   e15cf8:	48 39 c3             	cmp    %rax,%rbx
45cb   e15cfb:	0f 85 8f 07 00 00    	jne    e16490 <fix_nodes+0x4d60>
45d1   e15d01:	e8 00 00 00 00       	call   e15d06 <fix_nodes+0x45d6>	e15d02: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
45d6   e15d06:	48 b8 ff ff ff ff ff ff ff 0f 	movabs $0xfffffffffffffff,%rax
45e0   e15d10:	49 21 c7             	and    %rax,%r15
45e3   e15d13:	e9 eb 06 00 00       	jmp    e16403 <fix_nodes+0x4cd3>
45e8   e15d18:	e8 00 00 00 00       	call   e15d1d <fix_nodes+0x45ed>	e15d19: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
45ed   e15d1d:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
45f2   e15d22:	48 89 df             	mov    %rbx,%rdi
45f5   e15d25:	31 f6                	xor    %esi,%esi
45f7   e15d27:	31 d2                	xor    %edx,%edx
45f9   e15d29:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
45fe   e15d2e:	45 31 c0             	xor    %r8d,%r8d
4601   e15d31:	45 31 c9             	xor    %r9d,%r9d
4604   e15d34:	6a ff                	push   $0xffffffffffffffff
4606   e15d36:	6a ff                	push   $0xffffffffffffffff
4608   e15d38:	e8 63 8d 00 00       	call   e1eaa0 <set_parameters>
460d   e15d3d:	48 83 c4 10          	add    $0x10,%rsp
4611   e15d41:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
461b   e15d4b:	e9 63 fb ff ff       	jmp    e158b3 <fix_nodes+0x4183>
4620   e15d50:	45 31 f6             	xor    %r14d,%r14d
4623   e15d53:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
4628   e15d58:	4a 8d 1c e8          	lea    (%rax,%r13,8),%rbx
462c   e15d5c:	48 81 c3 98 00 00 00 	add    $0x98,%rbx
4633   e15d63:	48 89 d8             	mov    %rbx,%rax
4636   e15d66:	48 c1 e8 03          	shr    $0x3,%rax
463a   e15d6a:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
463f   e15d6f:	74 08                	je     e15d79 <fix_nodes+0x4649>
4641   e15d71:	48 89 df             	mov    %rbx,%rdi
4644   e15d74:	e8 00 00 00 00       	call   e15d79 <fix_nodes+0x4649>	e15d75: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4649   e15d79:	48 8b 1b             	mov    (%rbx),%rbx
464c   e15d7c:	48 83 c3 28          	add    $0x28,%rbx
4650   e15d80:	48 89 d8             	mov    %rbx,%rax
4653   e15d83:	48 c1 e8 03          	shr    $0x3,%rax
4657   e15d87:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
465c   e15d8c:	74 08                	je     e15d96 <fix_nodes+0x4666>
465e   e15d8e:	48 89 df             	mov    %rbx,%rdi
4661   e15d91:	e8 00 00 00 00       	call   e15d96 <fix_nodes+0x4666>	e15d92: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4666   e15d96:	48 8b 1b             	mov    (%rbx),%rbx
4669   e15d99:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
466d   e15d9d:	48 89 f8             	mov    %rdi,%rax
4670   e15da0:	48 c1 e8 03          	shr    $0x3,%rax
4674   e15da4:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
4679   e15da9:	84 c0                	test   %al,%al
467b   e15dab:	0f 85 62 21 00 00    	jne    e17f13 <fix_nodes+0x67e3>
4681   e15db1:	0f b7 43 02          	movzwl 0x2(%rbx),%eax
4685   e15db5:	48 c1 e0 04          	shl    $0x4,%rax
4689   e15db9:	48 01 d8             	add    %rbx,%rax
468c   e15dbc:	49 8d 1c 06          	lea    (%r14,%rax,1),%rbx
4690   e15dc0:	48 83 c3 1c          	add    $0x1c,%rbx
4694   e15dc4:	48 89 d8             	mov    %rbx,%rax
4697   e15dc7:	48 c1 e8 03          	shr    $0x3,%rax
469b   e15dcb:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
46a0   e15dd0:	84 c0                	test   %al,%al
46a2   e15dd2:	0f 84 79 05 00 00    	je     e16351 <fix_nodes+0x4c21>
46a8   e15dd8:	89 d9                	mov    %ebx,%ecx
46aa   e15dda:	80 e1 07             	and    $0x7,%cl
46ad   e15ddd:	80 c1 01             	add    $0x1,%cl
46b0   e15de0:	38 c1                	cmp    %al,%cl
46b2   e15de2:	0f 8c 69 05 00 00    	jl     e16351 <fix_nodes+0x4c21>
46b8   e15de8:	48 89 df             	mov    %rbx,%rdi
46bb   e15deb:	e8 00 00 00 00       	call   e15df0 <fix_nodes+0x46c0>	e15dec: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
46c0   e15df0:	e9 5c 05 00 00       	jmp    e16351 <fix_nodes+0x4c21>
46c5   e15df5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
46ca   e15dfa:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
46cf   e15dff:	48 8d 1c c8          	lea    (%rax,%rcx,8),%rbx
46d3   e15e03:	48 83 c3 70          	add    $0x70,%rbx
46d7   e15e07:	48 89 d8             	mov    %rbx,%rax
46da   e15e0a:	48 c1 e8 03          	shr    $0x3,%rax
46de   e15e0e:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
46e3   e15e13:	74 08                	je     e15e1d <fix_nodes+0x46ed>
46e5   e15e15:	48 89 df             	mov    %rbx,%rdi
46e8   e15e18:	e8 00 00 00 00       	call   e15e1d <fix_nodes+0x46ed>	e15e19: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
46ed   e15e1d:	48 83 3b 00          	cmpq   $0x0,(%rbx)
46f1   e15e21:	0f 84 03 06 00 00    	je     e1642a <fix_nodes+0x4cfa>
46f7   e15e27:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
46fc   e15e2c:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
4701   e15e31:	e8 ba 00 01 00       	call   e25ef0 <is_left_neighbor_in_cache>
4706   e15e36:	89 c3                	mov    %eax,%ebx
4708   e15e38:	31 ff                	xor    %edi,%edi
470a   e15e3a:	89 c6                	mov    %eax,%esi
470c   e15e3c:	e8 00 00 00 00       	call   e15e41 <fix_nodes+0x4711>	e15e3d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4711   e15e41:	85 db                	test   %ebx,%ebx
4713   e15e43:	0f 84 96 09 00 00    	je     e167df <fix_nodes+0x50af>
4719   e15e49:	e8 00 00 00 00       	call   e15e4e <fix_nodes+0x471e>	e15e4a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
471e   e15e4e:	e9 77 0b 00 00       	jmp    e169ca <fix_nodes+0x529a>
4723   e15e53:	e8 00 00 00 00       	call   e15e58 <fix_nodes+0x4728>	e15e54: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4728   e15e58:	41 bf 01 00 00 00    	mov    $0x1,%r15d
472e   e15e5e:	e9 a1 d3 ff ff       	jmp    e13204 <fix_nodes+0x1ad4>
4733   e15e63:	e8 00 00 00 00       	call   e15e68 <fix_nodes+0x4738>	e15e64: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4738   e15e68:	41 bf 03 00 00 00    	mov    $0x3,%r15d
473e   e15e6e:	e9 91 d3 ff ff       	jmp    e13204 <fix_nodes+0x1ad4>
4743   e15e73:	e8 00 00 00 00       	call   e15e78 <fix_nodes+0x4748>	e15e74: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4748   e15e78:	41 bf 0f 00 00 00    	mov    $0xf,%r15d
474e   e15e7e:	e9 81 d3 ff ff       	jmp    e13204 <fix_nodes+0x1ad4>
4753   e15e83:	e8 00 00 00 00       	call   e15e88 <fix_nodes+0x4758>	e15e84: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4758   e15e88:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
475d   e15e8d:	e9 11 e3 ff ff       	jmp    e141a3 <fix_nodes+0x2a73>
4762   e15e92:	31 c0                	xor    %eax,%eax
4764   e15e94:	0f b6 8c 24 08 01 00 00 	movzbl 0x108(%rsp),%ecx
476c   e15e9c:	88 c8                	mov    %cl,%al
476e   e15e9e:	48 8d 1c 80          	lea    (%rax,%rax,4),%rbx
4772   e15ea2:	31 c0                	xor    %eax,%eax
4774   e15ea4:	0f b6 8c 24 30 01 00 00 	movzbl 0x130(%rsp),%ecx
477c   e15eac:	88 c8                	mov    %cl,%al
477e   e15eae:	8d 04 80             	lea    (%rax,%rax,4),%eax
4781   e15eb1:	83 c0 0a             	add    $0xa,%eax
4784   e15eb4:	89 44 24 50          	mov    %eax,0x50(%rsp)
4788   e15eb8:	31 c0                	xor    %eax,%eax
478a   e15eba:	0f b6 8c 24 cc 00 00 00 	movzbl 0xcc(%rsp),%ecx
4792   e15ec2:	88 c8                	mov    %cl,%al
4794   e15ec4:	8d 04 80             	lea    (%rax,%rax,4),%eax
4797   e15ec7:	83 c0 14             	add    $0x14,%eax
479a   e15eca:	89 44 24 60          	mov    %eax,0x60(%rsp)
479e   e15ece:	e8 00 00 00 00       	call   e15ed3 <fix_nodes+0x47a3>	e15ecf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
47a3   e15ed3:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
47a8   e15ed8:	44 8b 7c 24 38       	mov    0x38(%rsp),%r15d
47ad   e15edd:	44 89 ff             	mov    %r15d,%edi
47b0   e15ee0:	44 89 e6             	mov    %r12d,%esi
47b3   e15ee3:	e8 00 00 00 00       	call   e15ee8 <fix_nodes+0x47b8>	e15ee4: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
47b8   e15ee8:	45 39 e7             	cmp    %r12d,%r15d
47bb   e15eeb:	75 3d                	jne    e15f2a <fix_nodes+0x47fa>
47bd   e15eed:	e8 00 00 00 00       	call   e15ef2 <fix_nodes+0x47c2>	e15eee: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
47c2   e15ef2:	4c 8d 0c 5c          	lea    (%rsp,%rbx,2),%r9
47c6   e15ef6:	49 81 c1 70 01 00 00 	add    $0x170,%r9
47cd   e15efd:	31 c0                	xor    %eax,%eax
47cf   e15eff:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
47d4   e15f04:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
47d9   e15f09:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
47de   e15f0e:	44 89 ee             	mov    %r13d,%esi
47e1   e15f11:	31 d2                	xor    %edx,%edx
47e3   e15f13:	31 c9                	xor    %ecx,%ecx
47e5   e15f15:	45 89 e0             	mov    %r12d,%r8d
47e8   e15f18:	6a ff                	push   $0xffffffffffffffff
47ea   e15f1a:	6a ff                	push   $0xffffffffffffffff
47ec   e15f1c:	e8 7f 8b 00 00       	call   e1eaa0 <set_parameters>
47f1   e15f21:	48 83 c4 10          	add    $0x10,%rsp
47f5   e15f25:	e9 1a cf ff ff       	jmp    e12e44 <fix_nodes+0x1714>
47fa   e15f2a:	8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%ebx
4801   e15f31:	89 df                	mov    %ebx,%edi
4803   e15f33:	44 89 ee             	mov    %r13d,%esi
4806   e15f36:	e8 00 00 00 00       	call   e15f3b <fix_nodes+0x480b>	e15f37: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
480b   e15f3b:	44 39 eb             	cmp    %r13d,%ebx
480e   e15f3e:	0f 8d c5 01 00 00    	jge    e16109 <fix_nodes+0x49d9>
4814   e15f44:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
4819   e15f49:	4d 85 ed             	test   %r13,%r13
481c   e15f4c:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
4826   e15f56:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
482b   e15f5b:	0f 84 1e 09 00 00    	je     e1687f <fix_nodes+0x514f>
4831   e15f61:	e8 00 00 00 00       	call   e15f66 <fix_nodes+0x4836>	e15f62: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4836   e15f66:	48 8b 9c 24 d0 00 00 00 	mov    0xd0(%rsp),%rbx
483e   e15f6e:	48 83 c3 20          	add    $0x20,%rbx
4842   e15f72:	48 89 d8             	mov    %rbx,%rax
4845   e15f75:	48 c1 e8 03          	shr    $0x3,%rax
4849   e15f79:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
484e   e15f7e:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
4853   e15f83:	74 08                	je     e15f8d <fix_nodes+0x485d>
4855   e15f85:	48 89 df             	mov    %rbx,%rdi
4858   e15f88:	e8 00 00 00 00       	call   e15f8d <fix_nodes+0x485d>	e15f89: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
485d   e15f8d:	8b 03                	mov    (%rbx),%eax
485f   e15f8f:	83 c0 e8             	add    $0xffffffe8,%eax
4862   e15f92:	48 98                	cltq
4864   e15f94:	48 83 c0 f8          	add    $0xfffffffffffffff8,%rax
4868   e15f98:	48 b9 ab aa aa aa aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rcx
4872   e15fa2:	48 f7 e1             	mul    %rcx
4875   e15fa5:	48 89 d3             	mov    %rdx,%rbx
4878   e15fa8:	48 c1 eb 04          	shr    $0x4,%rbx
487c   e15fac:	48 63 44 24 30       	movslq 0x30(%rsp),%rax
4881   e15fb1:	48 29 c3             	sub    %rax,%rbx
4884   e15fb4:	48 83 c3 01          	add    $0x1,%rbx
4888   e15fb8:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
488d   e15fbd:	48 83 c2 08          	add    $0x8,%rdx
4891   e15fc1:	48 89 d0             	mov    %rdx,%rax
4894   e15fc4:	48 c1 e8 03          	shr    $0x3,%rax
4898   e15fc8:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
489d   e15fcd:	84 c0                	test   %al,%al
489f   e15fcf:	0f 84 06 06 00 00    	je     e165db <fix_nodes+0x4eab>
48a5   e15fd5:	89 d1                	mov    %edx,%ecx
48a7   e15fd7:	80 e1 07             	and    $0x7,%cl
48aa   e15fda:	80 c1 01             	add    $0x1,%cl
48ad   e15fdd:	38 c1                	cmp    %al,%cl
48af   e15fdf:	0f 8c f6 05 00 00    	jl     e165db <fix_nodes+0x4eab>
48b5   e15fe5:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
48ba   e15fea:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
48bf   e15fef:	e8 00 00 00 00       	call   e15ff4 <fix_nodes+0x48c4>	e15ff0: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
48c4   e15ff4:	e9 d8 28 00 00       	jmp    e188d1 <fix_nodes+0x71a1>
48c9   e15ff9:	e8 00 00 00 00       	call   e15ffe <fix_nodes+0x48ce>	e15ffa: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
48ce   e15ffe:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
48d3   e16003:	4a 8d 1c e8          	lea    (%rax,%r13,8),%rbx
48d7   e16007:	48 83 c3 70          	add    $0x70,%rbx
48db   e1600b:	48 89 d8             	mov    %rbx,%rax
48de   e1600e:	48 c1 e8 03          	shr    $0x3,%rax
48e2   e16012:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
48e7   e16017:	74 08                	je     e16021 <fix_nodes+0x48f1>
48e9   e16019:	48 89 df             	mov    %rbx,%rdi
48ec   e1601c:	e8 00 00 00 00       	call   e16021 <fix_nodes+0x48f1>	e1601d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
48f1   e16021:	48 8b 1b             	mov    (%rbx),%rbx
48f4   e16024:	48 83 c3 28          	add    $0x28,%rbx
48f8   e16028:	48 89 d8             	mov    %rbx,%rax
48fb   e1602b:	48 c1 e8 03          	shr    $0x3,%rax
48ff   e1602f:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
4904   e16034:	74 08                	je     e1603e <fix_nodes+0x490e>
4906   e16036:	48 89 df             	mov    %rbx,%rdi
4909   e16039:	e8 00 00 00 00       	call   e1603e <fix_nodes+0x490e>	e1603a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
490e   e1603e:	48 8b 1b             	mov    (%rbx),%rbx
4911   e16041:	48 83 c3 02          	add    $0x2,%rbx
4915   e16045:	48 89 d8             	mov    %rbx,%rax
4918   e16048:	48 c1 e8 03          	shr    $0x3,%rax
491c   e1604c:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
4921   e16051:	84 c0                	test   %al,%al
4923   e16053:	0f 85 e3 25 00 00    	jne    e1863c <fix_nodes+0x6f0c>
4929   e16059:	44 0f b7 33          	movzwl (%rbx),%r14d
492d   e1605d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
4932   e16062:	4a 8d 1c e8          	lea    (%rax,%r13,8),%rbx
4936   e16066:	48 83 c3 70          	add    $0x70,%rbx
493a   e1606a:	48 89 d8             	mov    %rbx,%rax
493d   e1606d:	48 c1 e8 03          	shr    $0x3,%rax
4941   e16071:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
4946   e16076:	74 08                	je     e16080 <fix_nodes+0x4950>
4948   e16078:	48 89 df             	mov    %rbx,%rdi
494b   e1607b:	e8 00 00 00 00       	call   e16080 <fix_nodes+0x4950>	e1607c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4950   e16080:	48 8b 1b             	mov    (%rbx),%rbx
4953   e16083:	48 83 c3 28          	add    $0x28,%rbx
4957   e16087:	48 89 d8             	mov    %rbx,%rax
495a   e1608a:	48 c1 e8 03          	shr    $0x3,%rax
495e   e1608e:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
4963   e16093:	74 08                	je     e1609d <fix_nodes+0x496d>
4965   e16095:	48 89 df             	mov    %rbx,%rdi
4968   e16098:	e8 00 00 00 00       	call   e1609d <fix_nodes+0x496d>	e16099: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
496d   e1609d:	48 8b 1b             	mov    (%rbx),%rbx
4970   e160a0:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4974   e160a4:	48 89 f8             	mov    %rdi,%rax
4977   e160a7:	48 c1 e8 03          	shr    $0x3,%rax
497b   e160ab:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
4980   e160b0:	84 c0                	test   %al,%al
4982   e160b2:	0f 85 ed 1f 00 00    	jne    e180a5 <fix_nodes+0x6975>
4988   e160b8:	0f b7 43 02          	movzwl 0x2(%rbx),%eax
498c   e160bc:	48 c1 e0 04          	shl    $0x4,%rax
4990   e160c0:	48 01 d8             	add    %rbx,%rax
4993   e160c3:	49 63 ce             	movslq %r14d,%rcx
4996   e160c6:	48 8d 1c c8          	lea    (%rax,%rcx,8),%rbx
499a   e160ca:	48 83 c3 1c          	add    $0x1c,%rbx
499e   e160ce:	48 89 d8             	mov    %rbx,%rax
49a1   e160d1:	48 c1 e8 03          	shr    $0x3,%rax
49a5   e160d5:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
49aa   e160da:	84 c0                	test   %al,%al
49ac   e160dc:	0f 84 c5 06 00 00    	je     e167a7 <fix_nodes+0x5077>
49b2   e160e2:	89 d9                	mov    %ebx,%ecx
49b4   e160e4:	80 e1 07             	and    $0x7,%cl
49b7   e160e7:	80 c1 01             	add    $0x1,%cl
49ba   e160ea:	38 c1                	cmp    %al,%cl
49bc   e160ec:	0f 8c b5 06 00 00    	jl     e167a7 <fix_nodes+0x5077>
49c2   e160f2:	48 89 df             	mov    %rbx,%rdi
49c5   e160f5:	e8 00 00 00 00       	call   e160fa <fix_nodes+0x49ca>	e160f6: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
49ca   e160fa:	e9 a8 06 00 00       	jmp    e167a7 <fix_nodes+0x5077>
49cf   e160ff:	e8 00 00 00 00       	call   e16104 <fix_nodes+0x49d4>	e16100: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
49d4   e16104:	e9 05 05 00 00       	jmp    e1660e <fix_nodes+0x4ede>
49d9   e16109:	89 df                	mov    %ebx,%edi
49db   e1610b:	44 89 ee             	mov    %r13d,%esi
49de   e1610e:	e8 00 00 00 00       	call   e16113 <fix_nodes+0x49e3>	e1610f: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
49e3   e16113:	44 39 eb             	cmp    %r13d,%ebx
49e6   e16116:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
49f0   e16120:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
49f5   e16125:	0f 8e 08 04 00 00    	jle    e16533 <fix_nodes+0x4e03>
49fb   e1612b:	48 83 7c 24 28 00    	cmpq   $0x0,0x28(%rsp)
4a01   e16131:	0f 84 44 09 00 00    	je     e16a7b <fix_nodes+0x534b>
4a07   e16137:	44 89 ac 24 90 00 00 00 	mov    %r13d,0x90(%rsp)
4a0f   e1613f:	e8 00 00 00 00       	call   e16144 <fix_nodes+0x4a14>	e16140: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4a14   e16144:	48 8b 9c 24 d0 00 00 00 	mov    0xd0(%rsp),%rbx
4a1c   e1614c:	48 83 c3 20          	add    $0x20,%rbx
4a20   e16150:	48 89 d8             	mov    %rbx,%rax
4a23   e16153:	48 c1 e8 03          	shr    $0x3,%rax
4a27   e16157:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
4a2c   e1615c:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
4a31   e16161:	74 08                	je     e1616b <fix_nodes+0x4a3b>
4a33   e16163:	48 89 df             	mov    %rbx,%rdi
4a36   e16166:	e8 00 00 00 00       	call   e1616b <fix_nodes+0x4a3b>	e16167: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4a3b   e1616b:	8b 03                	mov    (%rbx),%eax
4a3d   e1616d:	83 c0 e8             	add    $0xffffffe8,%eax
4a40   e16170:	48 98                	cltq
4a42   e16172:	48 83 c0 f8          	add    $0xfffffffffffffff8,%rax
4a46   e16176:	48 b9 ab aa aa aa aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rcx
4a50   e16180:	48 f7 e1             	mul    %rcx
4a53   e16183:	48 89 d3             	mov    %rdx,%rbx
4a56   e16186:	48 c1 eb 04          	shr    $0x4,%rbx
4a5a   e1618a:	48 63 84 24 80 00 00 00 	movslq 0x80(%rsp),%rax
4a62   e16192:	48 29 c3             	sub    %rax,%rbx
4a65   e16195:	48 83 c3 01          	add    $0x1,%rbx
4a69   e16199:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
4a6e   e1619e:	48 83 c2 08          	add    $0x8,%rdx
4a72   e161a2:	48 89 d0             	mov    %rdx,%rax
4a75   e161a5:	48 c1 e8 03          	shr    $0x3,%rax
4a79   e161a9:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
4a7e   e161ae:	84 c0                	test   %al,%al
4a80   e161b0:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
4a85   e161b5:	0f 84 bd 09 00 00    	je     e16b78 <fix_nodes+0x5448>
4a8b   e161bb:	89 d1                	mov    %edx,%ecx
4a8d   e161bd:	80 e1 07             	and    $0x7,%cl
4a90   e161c0:	80 c1 01             	add    $0x1,%cl
4a93   e161c3:	38 c1                	cmp    %al,%cl
4a95   e161c5:	0f 8c ad 09 00 00    	jl     e16b78 <fix_nodes+0x5448>
4a9b   e161cb:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
4aa0   e161d0:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
4aa5   e161d5:	e8 00 00 00 00       	call   e161da <fix_nodes+0x4aaa>	e161d6: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
4aaa   e161da:	e9 56 27 00 00       	jmp    e18935 <fix_nodes+0x7205>
4aaf   e161df:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
4ab7   e161e7:	48 89 d0             	mov    %rdx,%rax
4aba   e161ea:	48 c1 e8 03          	shr    $0x3,%rax
4abe   e161ee:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
4ac8   e161f8:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4acd   e161fd:	84 c0                	test   %al,%al
4acf   e161ff:	0f 85 54 24 00 00    	jne    e18659 <fix_nodes+0x6f29>
4ad5   e16205:	44 8b 32             	mov    (%rdx),%r14d
4ad8   e16208:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
4add   e1620d:	48 89 d0             	mov    %rdx,%rax
4ae0   e16210:	48 c1 e8 03          	shr    $0x3,%rax
4ae4   e16214:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4ae9   e16219:	84 c0                	test   %al,%al
4aeb   e1621b:	0f 85 62 24 00 00    	jne    e18683 <fix_nodes+0x6f53>
4af1   e16221:	8b 1a                	mov    (%rdx),%ebx
4af3   e16223:	bf ff ff ff ff       	mov    $0xffffffff,%edi
4af8   e16228:	89 de                	mov    %ebx,%esi
4afa   e1622a:	e8 00 00 00 00       	call   e1622f <fix_nodes+0x4aff>	e1622b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4aff   e1622f:	31 c0                	xor    %eax,%eax
4b01   e16231:	83 fb ff             	cmp    $0xffffffff,%ebx
4b04   e16234:	0f 95 c0             	setne  %al
4b07   e16237:	41 29 c6             	sub    %eax,%r14d
4b0a   e1623a:	43 0f b6 04 2c       	movzbl (%r12,%r13,1),%eax
4b0f   e1623f:	84 c0                	test   %al,%al
4b11   e16241:	0f 85 60 24 00 00    	jne    e186a7 <fix_nodes+0x6f77>
4b17   e16247:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
4b1c   e1624c:	0f b7 18             	movzwl (%rax),%ebx
4b1f   e1624f:	44 89 f7             	mov    %r14d,%edi
4b22   e16252:	89 de                	mov    %ebx,%esi
4b24   e16254:	e8 00 00 00 00       	call   e16259 <fix_nodes+0x4b29>	e16255: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
4b29   e16259:	41 39 de             	cmp    %ebx,%r14d
4b2c   e1625c:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
4b31   e16261:	0f 8d 82 05 00 00    	jge    e167e9 <fix_nodes+0x50b9>
4b37   e16267:	e8 00 00 00 00       	call   e1626c <fix_nodes+0x4b3c>	e16268: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4b3c   e1626c:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
4b41   e16271:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
4b46   e16276:	48 8b 8c 24 00 01 00 00 	mov    0x100(%rsp),%rcx
4b4e   e1627e:	48 89 c8             	mov    %rcx,%rax
4b51   e16281:	48 c1 e8 03          	shr    $0x3,%rax
4b55   e16285:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
4b5f   e1628f:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
4b64   e16294:	74 15                	je     e162ab <fix_nodes+0x4b7b>
4b66   e16296:	48 8b bc 24 00 01 00 00 	mov    0x100(%rsp),%rdi
4b6e   e1629e:	e8 00 00 00 00       	call   e162a3 <fix_nodes+0x4b73>	e1629f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4b73   e162a3:	48 8b 8c 24 00 01 00 00 	mov    0x100(%rsp),%rcx
4b7b   e162ab:	48 83 39 00          	cmpq   $0x0,(%rcx)
4b7f   e162af:	0f 84 82 09 00 00    	je     e16c37 <fix_nodes+0x5507>
4b85   e162b5:	e8 00 00 00 00       	call   e162ba <fix_nodes+0x4b8a>	e162b6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4b8a   e162ba:	48 89 df             	mov    %rbx,%rdi
4b8d   e162bd:	31 f6                	xor    %esi,%esi
4b8f   e162bf:	ba ff ff ff ff       	mov    $0xffffffff,%edx
4b94   e162c4:	e9 e6 cb ff ff       	jmp    e12eaf <fix_nodes+0x177f>
4b99   e162c9:	45 31 f6             	xor    %r14d,%r14d
4b9c   e162cc:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
4ba1   e162d1:	4a 8d 1c e8          	lea    (%rax,%r13,8),%rbx
4ba5   e162d5:	48 81 c3 98 00 00 00 	add    $0x98,%rbx
4bac   e162dc:	48 89 d8             	mov    %rbx,%rax
4baf   e162df:	48 c1 e8 03          	shr    $0x3,%rax
4bb3   e162e3:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
4bb8   e162e8:	74 08                	je     e162f2 <fix_nodes+0x4bc2>
4bba   e162ea:	48 89 df             	mov    %rbx,%rdi
4bbd   e162ed:	e8 00 00 00 00       	call   e162f2 <fix_nodes+0x4bc2>	e162ee: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4bc2   e162f2:	48 8b 1b             	mov    (%rbx),%rbx
4bc5   e162f5:	48 83 c3 28          	add    $0x28,%rbx
4bc9   e162f9:	48 89 d8             	mov    %rbx,%rax
4bcc   e162fc:	48 c1 e8 03          	shr    $0x3,%rax
4bd0   e16300:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
4bd5   e16305:	74 08                	je     e1630f <fix_nodes+0x4bdf>
4bd7   e16307:	48 89 df             	mov    %rbx,%rdi
4bda   e1630a:	e8 00 00 00 00       	call   e1630f <fix_nodes+0x4bdf>	e1630b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4bdf   e1630f:	48 8b 1b             	mov    (%rbx),%rbx
4be2   e16312:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4be6   e16316:	48 89 f8             	mov    %rdi,%rax
4be9   e16319:	48 c1 e8 03          	shr    $0x3,%rax
4bed   e1631d:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
4bf2   e16322:	84 c0                	test   %al,%al
4bf4   e16324:	0f 85 4d 22 00 00    	jne    e18577 <fix_nodes+0x6e47>
4bfa   e1632a:	0f b7 43 02          	movzwl 0x2(%rbx),%eax
4bfe   e1632e:	48 c1 e0 04          	shl    $0x4,%rax
4c02   e16332:	48 01 d8             	add    %rbx,%rax
4c05   e16335:	49 8d 1c 06          	lea    (%r14,%rax,1),%rbx
4c09   e16339:	48 83 c3 1c          	add    $0x1c,%rbx
4c0d   e1633d:	48 89 d8             	mov    %rbx,%rax
4c10   e16340:	48 c1 e8 03          	shr    $0x3,%rax
4c14   e16344:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
4c19   e16349:	84 c0                	test   %al,%al
4c1b   e1634b:	0f 85 40 22 00 00    	jne    e18591 <fix_nodes+0x6e61>
4c21   e16351:	0f b7 03             	movzwl (%rbx),%eax
4c24   e16354:	69 c8 ab aa 00 00    	imul   $0xaaab,%eax,%ecx
4c2a   e1635a:	c1 e9 14             	shr    $0x14,%ecx
4c2d   e1635d:	f7 d1                	not    %ecx
4c2f   e1635f:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
4c34   e16364:	48 89 df             	mov    %rbx,%rdi
4c37   e16367:	44 89 ee             	mov    %r13d,%esi
4c3a   e1636a:	31 d2                	xor    %edx,%edx
4c3c   e1636c:	e9 51 04 00 00       	jmp    e167c2 <fix_nodes+0x5092>
4c41   e16371:	48 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%rax
4c49   e16379:	48 8d 58 24          	lea    0x24(%rax),%rbx
4c4d   e1637d:	4c 8d 78 27          	lea    0x27(%rax),%r15
4c51   e16381:	48 89 d8             	mov    %rbx,%rax
4c54   e16384:	48 c1 e8 03          	shr    $0x3,%rax
4c58   e16388:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
4c5d   e1638d:	84 c0                	test   %al,%al
4c5f   e1638f:	0f 85 34 23 00 00    	jne    e186c9 <fix_nodes+0x6f99>
4c65   e16395:	4c 89 f8             	mov    %r15,%rax
4c68   e16398:	48 c1 e8 03          	shr    $0x3,%rax
4c6c   e1639c:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
4c71   e163a1:	84 c0                	test   %al,%al
4c73   e163a3:	0f 85 3f 23 00 00    	jne    e186e8 <fix_nodes+0x6fb8>
4c79   e163a9:	8b 1b                	mov    (%rbx),%ebx
4c7b   e163ab:	bf f4 01 00 00       	mov    $0x1f4,%edi
4c80   e163b0:	89 de                	mov    %ebx,%esi
4c82   e163b2:	e8 00 00 00 00       	call   e163b7 <fix_nodes+0x4c87>	e163b3: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4c87   e163b7:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
4c8d   e163bd:	0f 85 66 04 00 00    	jne    e16829 <fix_nodes+0x50f9>
4c93   e163c3:	e8 00 00 00 00       	call   e163c8 <fix_nodes+0x4c98>	e163c4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4c98   e163c8:	48 8b 9c 24 d0 00 00 00 	mov    0xd0(%rsp),%rbx
4ca0   e163d0:	4c 8d 7b 20          	lea    0x20(%rbx),%r15
4ca4   e163d4:	48 83 c3 23          	add    $0x23,%rbx
4ca8   e163d8:	4c 89 f8             	mov    %r15,%rax
4cab   e163db:	48 c1 e8 03          	shr    $0x3,%rax
4caf   e163df:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
4cb4   e163e4:	84 c0                	test   %al,%al
4cb6   e163e6:	0f 85 23 24 00 00    	jne    e1880f <fix_nodes+0x70df>
4cbc   e163ec:	48 89 d8             	mov    %rbx,%rax
4cbf   e163ef:	48 c1 e8 03          	shr    $0x3,%rax
4cc3   e163f3:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
4cc8   e163f8:	84 c0                	test   %al,%al
4cca   e163fa:	0f 85 2f 24 00 00    	jne    e1882f <fix_nodes+0x70ff>
4cd0   e16400:	45 8b 3f             	mov    (%r15),%r15d
4cd3   e16403:	bf 01 00 00 00       	mov    $0x1,%edi
4cd8   e16408:	4c 89 fe             	mov    %r15,%rsi
4cdb   e1640b:	e8 00 00 00 00       	call   e16410 <fix_nodes+0x4ce0>	e1640c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4ce0   e16410:	49 83 ff 01          	cmp    $0x1,%r15
4ce4   e16414:	0f 84 bb 09 00 00    	je     e16dd5 <fix_nodes+0x56a5>
4cea   e1641a:	e8 00 00 00 00       	call   e1641f <fix_nodes+0x4cef>	e1641b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4cef   e1641f:	41 bf 18 00 00 00    	mov    $0x18,%r15d
4cf5   e16425:	e9 19 ef ff ff       	jmp    e15343 <fix_nodes+0x3c13>
4cfa   e1642a:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
4cff   e1642f:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
4d04   e16434:	48 8d 1c c8          	lea    (%rax,%rcx,8),%rbx
4d08   e16438:	48 81 c3 98 00 00 00 	add    $0x98,%rbx
4d0f   e1643f:	48 89 d8             	mov    %rbx,%rax
4d12   e16442:	48 c1 e8 03          	shr    $0x3,%rax
4d16   e16446:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
4d1b   e1644b:	74 08                	je     e16455 <fix_nodes+0x4d25>
4d1d   e1644d:	48 89 df             	mov    %rbx,%rdi
4d20   e16450:	e8 00 00 00 00       	call   e16455 <fix_nodes+0x4d25>	e16451: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4d25   e16455:	48 83 3b 00          	cmpq   $0x0,(%rbx)
4d29   e16459:	0f 84 16 0a 00 00    	je     e16e75 <fix_nodes+0x5745>
4d2f   e1645f:	e8 00 00 00 00       	call   e16464 <fix_nodes+0x4d34>	e16460: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4d34   e16464:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
4d39   e16469:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
4d3e   e1646e:	e8 7d fa 00 00       	call   e25ef0 <is_left_neighbor_in_cache>
4d43   e16473:	89 c3                	mov    %eax,%ebx
4d45   e16475:	31 ff                	xor    %edi,%edi
4d47   e16477:	89 c6                	mov    %eax,%esi
4d49   e16479:	e8 00 00 00 00       	call   e1647e <fix_nodes+0x4d4e>	e1647a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4d4e   e1647e:	85 db                	test   %ebx,%ebx
4d50   e16480:	0f 84 43 04 00 00    	je     e168c9 <fix_nodes+0x5199>
4d56   e16486:	e8 00 00 00 00       	call   e1648b <fix_nodes+0x4d5b>	e16487: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4d5b   e1648b:	e9 3a 05 00 00       	jmp    e169ca <fix_nodes+0x529a>
4d60   e16490:	e8 00 00 00 00       	call   e16495 <fix_nodes+0x4d65>	e16491: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4d65   e16495:	45 31 ff             	xor    %r15d,%r15d
4d68   e16498:	e9 a6 ee ff ff       	jmp    e15343 <fix_nodes+0x3c13>
4d6d   e1649d:	e8 00 00 00 00       	call   e164a2 <fix_nodes+0x4d72>	e1649e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4d72   e164a2:	eb 1f                	jmp    e164c3 <fix_nodes+0x4d93>
4d74   e164a4:	e8 00 00 00 00       	call   e164a9 <fix_nodes+0x4d79>	e164a5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4d79   e164a9:	45 89 f4             	mov    %r14d,%r12d
4d7c   e164ac:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
4d81   e164b1:	4c 8b b4 24 b0 00 00 00 	mov    0xb0(%rsp),%r14
4d89   e164b9:	e9 95 d9 ff ff       	jmp    e13e53 <fix_nodes+0x2723>
4d8e   e164be:	e8 00 00 00 00       	call   e164c3 <fix_nodes+0x4d93>	e164bf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4d93   e164c3:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
4d98   e164c8:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
4d9d   e164cd:	31 ff                	xor    %edi,%edi
4d9f   e164cf:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e164d2: R_X86_64_32S	.rodata+0x1b9240
4da6   e164d6:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e164d9: R_X86_64_32S	.rodata.str1.1+0x13e7
4dad   e164dd:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e164e0: R_X86_64_32S	.rodata+0x1b95e0
4db4   e164e4:	41 b8 b5 05 00 00    	mov    $0x5b5,%r8d
4dba   e164ea:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	e164ed: R_X86_64_32S	.rodata.str1.1+0x13e7
4dc1   e164f1:	e8 00 00 00 00       	call   e164f6 <fix_nodes+0x4dc6>	e164f2: R_X86_64_PLT32	__reiserfs_panic-0x4
4dc6   e164f6:	e9 26 d6 ff ff       	jmp    e13b21 <fix_nodes+0x23f1>
4dcb   e164fb:	e8 00 00 00 00       	call   e16500 <fix_nodes+0x4dd0>	e164fc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4dd0   e16500:	31 ff                	xor    %edi,%edi
4dd2   e16502:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e16505: R_X86_64_32S	.rodata+0x1b9240
4dd9   e16509:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e1650c: R_X86_64_32S	.rodata.str1.1+0xe159
4de0   e16510:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e16513: R_X86_64_32S	.rodata+0x1bac00
4de7   e16517:	41 b8 ce 02 00 00    	mov    $0x2ce,%r8d
4ded   e1651d:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	e16520: R_X86_64_32S	.rodata.str1.1+0xe159
4df4   e16524:	53                   	push   %rbx
4df5   e16525:	e8 00 00 00 00       	call   e1652a <fix_nodes+0x4dfa>	e16526: R_X86_64_PLT32	__reiserfs_panic-0x4
4dfa   e1652a:	48 83 c4 08          	add    $0x8,%rsp
4dfe   e1652e:	e9 93 f1 ff ff       	jmp    e156c6 <fix_nodes+0x3f96>
4e03   e16533:	44 89 ac 24 90 00 00 00 	mov    %r13d,0x90(%rsp)
4e0b   e1653b:	48 89 df             	mov    %rbx,%rdi
4e0e   e1653e:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
4e13   e16543:	44 89 ee             	mov    %r13d,%esi
4e16   e16546:	e8 a5 f9 00 00       	call   e25ef0 <is_left_neighbor_in_cache>
4e1b   e1654b:	89 c3                	mov    %eax,%ebx
4e1d   e1654d:	31 ff                	xor    %edi,%edi
4e1f   e1654f:	89 c6                	mov    %eax,%esi
4e21   e16551:	e8 00 00 00 00       	call   e16556 <fix_nodes+0x4e26>	e16552: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4e26   e16556:	85 db                	test   %ebx,%ebx
4e28   e16558:	0f 84 95 05 00 00    	je     e16af3 <fix_nodes+0x53c3>
4e2e   e1655e:	4d 85 ed             	test   %r13,%r13
4e31   e16561:	48 8b 9c 24 d0 00 00 00 	mov    0xd0(%rsp),%rbx
4e39   e16569:	0f 84 fb 06 00 00    	je     e16c6a <fix_nodes+0x553a>
4e3f   e1656f:	e8 00 00 00 00       	call   e16574 <fix_nodes+0x4e44>	e16570: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4e44   e16574:	48 83 c3 20          	add    $0x20,%rbx
4e48   e16578:	48 89 d8             	mov    %rbx,%rax
4e4b   e1657b:	48 c1 e8 03          	shr    $0x3,%rax
4e4f   e1657f:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
4e54   e16584:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
4e59   e16589:	74 08                	je     e16593 <fix_nodes+0x4e63>
4e5b   e1658b:	48 89 df             	mov    %rbx,%rdi
4e5e   e1658e:	e8 00 00 00 00       	call   e16593 <fix_nodes+0x4e63>	e1658f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4e63   e16593:	8b 03                	mov    (%rbx),%eax
4e65   e16595:	83 c0 e8             	add    $0xffffffe8,%eax
4e68   e16598:	48 98                	cltq
4e6a   e1659a:	48 83 c0 f8          	add    $0xfffffffffffffff8,%rax
4e6e   e1659e:	48 b9 ab aa aa aa aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rcx
4e78   e165a8:	48 f7 e1             	mul    %rcx
4e7b   e165ab:	48 89 d3             	mov    %rdx,%rbx
4e7e   e165ae:	48 c1 eb 04          	shr    $0x4,%rbx
4e82   e165b2:	48 63 44 24 30       	movslq 0x30(%rsp),%rax
4e87   e165b7:	48 29 c3             	sub    %rax,%rbx
4e8a   e165ba:	48 83 c3 01          	add    $0x1,%rbx
4e8e   e165be:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
4e93   e165c3:	48 83 c2 08          	add    $0x8,%rdx
4e97   e165c7:	48 89 d0             	mov    %rdx,%rax
4e9a   e165ca:	48 c1 e8 03          	shr    $0x3,%rax
4e9e   e165ce:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
4ea3   e165d3:	84 c0                	test   %al,%al
4ea5   e165d5:	0f 85 d7 22 00 00    	jne    e188b2 <fix_nodes+0x7182>
4eab   e165db:	0f b7 02             	movzwl (%rdx),%eax
4eae   e165de:	48 8d 14 18          	lea    (%rax,%rbx,1),%rdx
4eb2   e165e2:	48 83 c2 01          	add    $0x1,%rdx
4eb6   e165e6:	48 d1 ea             	shr    %rdx
4eb9   e165e9:	29 da                	sub    %ebx,%edx
4ebb   e165eb:	31 c0                	xor    %eax,%eax
4ebd   e165ed:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
4ec2   e165f2:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
4ec7   e165f7:	44 89 ee             	mov    %r13d,%esi
4eca   e165fa:	31 c9                	xor    %ecx,%ecx
4ecc   e165fc:	44 8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%r8d
4ed4   e16604:	e9 98 05 00 00       	jmp    e16ba1 <fix_nodes+0x5471>
4ed9   e16609:	e8 00 00 00 00       	call   e1660e <fix_nodes+0x4ede>	e1660a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4ede   e1660e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
4ee8   e16618:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
4eed   e1661d:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
4ef1   e16621:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
4ef6   e16626:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
4efb   e1662b:	74 08                	je     e16635 <fix_nodes+0x4f05>
4efd   e1662d:	48 89 df             	mov    %rbx,%rdi
4f00   e16630:	e8 00 00 00 00       	call   e16635 <fix_nodes+0x4f05>	e16631: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4f05   e16635:	4c 8b 33             	mov    (%rbx),%r14
4f08   e16638:	4c 89 f0             	mov    %r14,%rax
4f0b   e1663b:	48 c1 e8 03          	shr    $0x3,%rax
4f0f   e1663f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
4f19   e16649:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
4f1d   e1664d:	84 c0                	test   %al,%al
4f1f   e1664f:	0f 85 00 16 00 00    	jne    e17c55 <fix_nodes+0x6525>
4f25   e16655:	41 8b 06             	mov    (%r14),%eax
4f28   e16658:	44 29 e0             	sub    %r12d,%eax
4f2b   e1665b:	48 63 d8             	movslq %eax,%rbx
4f2e   e1665e:	bf 08 00 00 00       	mov    $0x8,%edi
4f33   e16663:	89 de                	mov    %ebx,%esi
4f35   e16665:	e8 00 00 00 00       	call   e1666a <fix_nodes+0x4f3a>	e16666: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4f3a   e1666a:	83 fb 07             	cmp    $0x7,%ebx
4f3d   e1666d:	0f 87 34 21 00 00    	ja     e187a7 <fix_nodes+0x7077>
4f43   e16673:	e8 00 00 00 00       	call   e16678 <fix_nodes+0x4f48>	e16674: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4f48   e16678:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
4f52   e16682:	48 c1 e3 04          	shl    $0x4,%rbx
4f56   e16686:	4c 01 f3             	add    %r14,%rbx
4f59   e16689:	48 83 c3 10          	add    $0x10,%rbx
4f5d   e1668d:	48 89 d8             	mov    %rbx,%rax
4f60   e16690:	48 c1 e8 03          	shr    $0x3,%rax
4f64   e16694:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
4f69   e16699:	84 c0                	test   %al,%al
4f6b   e1669b:	0f 85 d2 15 00 00    	jne    e17c73 <fix_nodes+0x6543>
4f71   e166a1:	44 8b 33             	mov    (%rbx),%r14d
4f74   e166a4:	31 ff                	xor    %edi,%edi
4f76   e166a6:	44 89 f6             	mov    %r14d,%esi
4f79   e166a9:	e8 00 00 00 00       	call   e166ae <fix_nodes+0x4f7e>	e166aa: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4f7e   e166ae:	45 85 f6             	test   %r14d,%r14d
4f81   e166b1:	74 0b                	je     e166be <fix_nodes+0x4f8e>
4f83   e166b3:	e8 00 00 00 00       	call   e166b8 <fix_nodes+0x4f88>	e166b4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4f88   e166b8:	41 83 c6 ff          	add    $0xffffffff,%r14d
4f8c   e166bc:	eb 64                	jmp    e16722 <fix_nodes+0x4ff2>
4f8e   e166be:	e8 00 00 00 00       	call   e166c3 <fix_nodes+0x4f93>	e166bf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4f93   e166c3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
4f98   e166c8:	4a 8d 1c e8          	lea    (%rax,%r13,8),%rbx
4f9c   e166cc:	48 83 c3 70          	add    $0x70,%rbx
4fa0   e166d0:	48 89 d8             	mov    %rbx,%rax
4fa3   e166d3:	48 c1 e8 03          	shr    $0x3,%rax
4fa7   e166d7:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
4fac   e166dc:	74 08                	je     e166e6 <fix_nodes+0x4fb6>
4fae   e166de:	48 89 df             	mov    %rbx,%rdi
4fb1   e166e1:	e8 00 00 00 00       	call   e166e6 <fix_nodes+0x4fb6>	e166e2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4fb6   e166e6:	48 8b 1b             	mov    (%rbx),%rbx
4fb9   e166e9:	48 83 c3 28          	add    $0x28,%rbx
4fbd   e166ed:	48 89 d8             	mov    %rbx,%rax
4fc0   e166f0:	48 c1 e8 03          	shr    $0x3,%rax
4fc4   e166f4:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
4fc9   e166f9:	74 08                	je     e16703 <fix_nodes+0x4fd3>
4fcb   e166fb:	48 89 df             	mov    %rbx,%rdi
4fce   e166fe:	e8 00 00 00 00       	call   e16703 <fix_nodes+0x4fd3>	e166ff: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4fd3   e16703:	48 8b 1b             	mov    (%rbx),%rbx
4fd6   e16706:	48 83 c3 02          	add    $0x2,%rbx
4fda   e1670a:	48 89 d8             	mov    %rbx,%rax
4fdd   e1670d:	48 c1 e8 03          	shr    $0x3,%rax
4fe1   e16711:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
4fe6   e16716:	84 c0                	test   %al,%al
4fe8   e16718:	0f 85 27 1d 00 00    	jne    e18445 <fix_nodes+0x6d15>
4fee   e1671e:	44 0f b7 33          	movzwl (%rbx),%r14d
4ff2   e16722:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
4ff7   e16727:	4a 8d 1c e8          	lea    (%rax,%r13,8),%rbx
4ffb   e1672b:	48 83 c3 70          	add    $0x70,%rbx
4fff   e1672f:	48 89 d8             	mov    %rbx,%rax
5002   e16732:	48 c1 e8 03          	shr    $0x3,%rax
5006   e16736:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
500b   e1673b:	74 08                	je     e16745 <fix_nodes+0x5015>
500d   e1673d:	48 89 df             	mov    %rbx,%rdi
5010   e16740:	e8 00 00 00 00       	call   e16745 <fix_nodes+0x5015>	e16741: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5015   e16745:	48 8b 1b             	mov    (%rbx),%rbx
5018   e16748:	48 83 c3 28          	add    $0x28,%rbx
501c   e1674c:	48 89 d8             	mov    %rbx,%rax
501f   e1674f:	48 c1 e8 03          	shr    $0x3,%rax
5023   e16753:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
5028   e16758:	74 08                	je     e16762 <fix_nodes+0x5032>
502a   e1675a:	48 89 df             	mov    %rbx,%rdi
502d   e1675d:	e8 00 00 00 00       	call   e16762 <fix_nodes+0x5032>	e1675e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5032   e16762:	48 8b 1b             	mov    (%rbx),%rbx
5035   e16765:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
5039   e16769:	48 89 f8             	mov    %rdi,%rax
503c   e1676c:	48 c1 e8 03          	shr    $0x3,%rax
5040   e16770:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
5045   e16775:	84 c0                	test   %al,%al
5047   e16777:	0f 85 13 15 00 00    	jne    e17c90 <fix_nodes+0x6560>
504d   e1677d:	0f b7 43 02          	movzwl 0x2(%rbx),%eax
5051   e16781:	48 c1 e0 04          	shl    $0x4,%rax
5055   e16785:	48 01 d8             	add    %rbx,%rax
5058   e16788:	49 63 ce             	movslq %r14d,%rcx
505b   e1678b:	48 8d 1c c8          	lea    (%rax,%rcx,8),%rbx
505f   e1678f:	48 83 c3 1c          	add    $0x1c,%rbx
5063   e16793:	48 89 d8             	mov    %rbx,%rax
5066   e16796:	48 c1 e8 03          	shr    $0x3,%rax
506a   e1679a:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
506f   e1679f:	84 c0                	test   %al,%al
5071   e167a1:	0f 85 03 15 00 00    	jne    e17caa <fix_nodes+0x657a>
5077   e167a7:	0f b7 03             	movzwl (%rbx),%eax
507a   e167aa:	69 d0 ab aa 00 00    	imul   $0xaaab,%eax,%edx
5080   e167b0:	c1 ea 14             	shr    $0x14,%edx
5083   e167b3:	f7 d2                	not    %edx
5085   e167b5:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
508a   e167ba:	48 89 df             	mov    %rbx,%rdi
508d   e167bd:	44 89 ee             	mov    %r13d,%esi
5090   e167c0:	31 c9                	xor    %ecx,%ecx
5092   e167c2:	45 31 c0             	xor    %r8d,%r8d
5095   e167c5:	45 31 c9             	xor    %r9d,%r9d
5098   e167c8:	6a ff                	push   $0xffffffffffffffff
509a   e167ca:	6a ff                	push   $0xffffffffffffffff
509c   e167cc:	e8 cf 82 00 00       	call   e1eaa0 <set_parameters>
50a1   e167d1:	48 83 c4 10          	add    $0x10,%rsp
50a5   e167d5:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
50aa   e167da:	e9 a5 db ff ff       	jmp    e14384 <fix_nodes+0x2c54>
50af   e167df:	e8 00 00 00 00       	call   e167e4 <fix_nodes+0x50b4>	e167e0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
50b4   e167e4:	e9 e5 00 00 00       	jmp    e168ce <fix_nodes+0x519e>
50b9   e167e9:	48 8b 9c 24 58 01 00 00 	mov    0x158(%rsp),%rbx
50c1   e167f1:	48 89 d8             	mov    %rbx,%rax
50c4   e167f4:	48 c1 e8 03          	shr    $0x3,%rax
50c8   e167f8:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
50d2   e16802:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
50d6   e16806:	74 08                	je     e16810 <fix_nodes+0x50e0>
50d8   e16808:	48 89 df             	mov    %rbx,%rdi
50db   e1680b:	e8 00 00 00 00       	call   e16810 <fix_nodes+0x50e0>	e1680c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
50e0   e16810:	48 83 3b 00          	cmpq   $0x0,(%rbx)
50e4   e16814:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
50e9   e16819:	0f 84 db 03 00 00    	je     e16bfa <fix_nodes+0x54ca>
50ef   e1681f:	e8 00 00 00 00       	call   e16824 <fix_nodes+0x50f4>	e16820: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
50f4   e16824:	e9 b7 ef ff ff       	jmp    e157e0 <fix_nodes+0x40b0>
50f9   e16829:	e8 00 00 00 00       	call   e1682e <fix_nodes+0x50fe>	e1682a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
50fe   e1682e:	45 31 ff             	xor    %r15d,%r15d
5101   e16831:	e9 0d eb ff ff       	jmp    e15343 <fix_nodes+0x3c13>
5106   e16836:	e8 00 00 00 00       	call   e1683b <fix_nodes+0x510b>	e16837: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
510b   e1683b:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
5110   e16840:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
5115   e16845:	eb 0a                	jmp    e16851 <fix_nodes+0x5121>
5117   e16847:	e8 00 00 00 00       	call   e1684c <fix_nodes+0x511c>	e16848: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
511c   e1684c:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
5121   e16851:	31 ff                	xor    %edi,%edi
5123   e16853:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e16856: R_X86_64_32S	.rodata+0x1b9240
512a   e1685a:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e1685d: R_X86_64_32S	.rodata.str1.1+0x13e7
5131   e16861:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e16864: R_X86_64_32S	.rodata+0x1b96c0
5138   e16868:	41 b8 b8 05 00 00    	mov    $0x5b8,%r8d
513e   e1686e:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	e16871: R_X86_64_32S	.rodata.str1.1+0x13e7
5145   e16875:	e8 00 00 00 00       	call   e1687a <fix_nodes+0x514a>	e16876: R_X86_64_PLT32	__reiserfs_panic-0x4
514a   e1687a:	e9 5e da ff ff       	jmp    e142dd <fix_nodes+0x2bad>
514f   e1687f:	bf 0f 00 00 00       	mov    $0xf,%edi
5154   e16884:	8b 5c 24 50          	mov    0x50(%rsp),%ebx
5158   e16888:	89 de                	mov    %ebx,%esi
515a   e1688a:	e8 00 00 00 00       	call   e1688f <fix_nodes+0x515f>	e1688b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
515f   e1688f:	83 fb 0f             	cmp    $0xf,%ebx
5162   e16892:	0f 85 1e 03 00 00    	jne    e16bb6 <fix_nodes+0x5486>
5168   e16898:	e8 00 00 00 00       	call   e1689d <fix_nodes+0x516d>	e16899: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
516d   e1689d:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
5172   e168a2:	48 c1 e8 03          	shr    $0x3,%rax
5176   e168a6:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
517b   e168ab:	84 c0                	test   %al,%al
517d   e168ad:	0f 85 28 20 00 00    	jne    e188db <fix_nodes+0x71ab>
5183   e168b3:	41 8b 87 20 02 00 00 	mov    0x220(%r15),%eax
518a   e168ba:	31 c9                	xor    %ecx,%ecx
518c   e168bc:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
5191   e168c1:	4c 89 ff             	mov    %r15,%rdi
5194   e168c4:	e9 ea 03 00 00       	jmp    e16cb3 <fix_nodes+0x5583>
5199   e168c9:	e8 00 00 00 00       	call   e168ce <fix_nodes+0x519e>	e168ca: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
519e   e168ce:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
51a3   e168d3:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
51a8   e168d8:	48 8d 1c c8          	lea    (%rax,%rcx,8),%rbx
51ac   e168dc:	48 81 c3 98 00 00 00 	add    $0x98,%rbx
51b3   e168e3:	48 89 d8             	mov    %rbx,%rax
51b6   e168e6:	48 c1 e8 03          	shr    $0x3,%rax
51ba   e168ea:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
51bf   e168ef:	74 08                	je     e168f9 <fix_nodes+0x51c9>
51c1   e168f1:	48 89 df             	mov    %rbx,%rdi
51c4   e168f4:	e8 00 00 00 00       	call   e168f9 <fix_nodes+0x51c9>	e168f5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
51c9   e168f9:	48 83 3b 00          	cmpq   $0x0,(%rbx)
51cd   e168fd:	0f 84 c2 00 00 00    	je     e169c5 <fix_nodes+0x5295>
51d3   e16903:	4c 89 6c 24 38       	mov    %r13,0x38(%rsp)
51d8   e16908:	e8 00 00 00 00       	call   e1690d <fix_nodes+0x51dd>	e16909: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
51dd   e1690d:	48 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%rax
51e5   e16915:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
51ea   e1691a:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
51ef   e1691f:	74 08                	je     e16929 <fix_nodes+0x51f9>
51f1   e16921:	48 89 df             	mov    %rbx,%rdi
51f4   e16924:	e8 00 00 00 00       	call   e16929 <fix_nodes+0x51f9>	e16925: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
51f9   e16929:	48 8b 03             	mov    (%rbx),%rax
51fc   e1692c:	48 c1 e0 20          	shl    $0x20,%rax
5200   e16930:	48 b9 00 00 00 00 e8 ff ff ff 	movabs $0xffffffe800000000,%rcx
520a   e1693a:	48 01 c8             	add    %rcx,%rax
520d   e1693d:	48 c1 f8 20          	sar    $0x20,%rax
5211   e16941:	48 83 c0 f8          	add    $0xfffffffffffffff8,%rax
5215   e16945:	48 b9 ab aa aa aa aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rcx
521f   e1694f:	48 f7 e1             	mul    %rcx
5222   e16952:	48 89 d3             	mov    %rdx,%rbx
5225   e16955:	48 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%rax
522d   e1695d:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
5232   e16962:	84 c0                	test   %al,%al
5234   e16964:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
5239   e16969:	0f 85 51 1e 00 00    	jne    e187c0 <fix_nodes+0x7090>
523f   e1696f:	48 c1 eb 04          	shr    $0x4,%rbx
5243   e16973:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
524b   e1697b:	4c 63 30             	movslq (%rax),%r14
524e   e1697e:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
5253   e16983:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
5258   e16988:	84 c0                	test   %al,%al
525a   e1698a:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
525f   e1698f:	0f 85 53 1e 00 00    	jne    e187e8 <fix_nodes+0x70b8>
5265   e16995:	0f b7 0f             	movzwl (%rdi),%ecx
5268   e16998:	48 89 c8             	mov    %rcx,%rax
526b   e1699b:	4c 29 f0             	sub    %r14,%rax
526e   e1699e:	48 01 d8             	add    %rbx,%rax
5271   e169a1:	48 83 c0 02          	add    $0x2,%rax
5275   e169a5:	48 d1 e8             	shr    %rax
5278   e169a8:	29 c1                	sub    %eax,%ecx
527a   e169aa:	83 c1 01             	add    $0x1,%ecx
527d   e169ad:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
5282   e169b2:	48 89 df             	mov    %rbx,%rdi
5285   e169b5:	44 89 ee             	mov    %r13d,%esi
5288   e169b8:	31 d2                	xor    %edx,%edx
528a   e169ba:	41 b8 01 00 00 00    	mov    $0x1,%r8d
5290   e169c0:	e9 00 fe ff ff       	jmp    e167c5 <fix_nodes+0x5095>
5295   e169c5:	e8 00 00 00 00       	call   e169ca <fix_nodes+0x529a>	e169c6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
529a   e169ca:	4d 89 ef             	mov    %r13,%r15
529d   e169cd:	48 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%rax
52a5   e169d5:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
52aa   e169da:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
52af   e169df:	74 08                	je     e169e9 <fix_nodes+0x52b9>
52b1   e169e1:	48 89 df             	mov    %rbx,%rdi
52b4   e169e4:	e8 00 00 00 00       	call   e169e9 <fix_nodes+0x52b9>	e169e5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
52b9   e169e9:	48 8b 03             	mov    (%rbx),%rax
52bc   e169ec:	48 c1 e0 20          	shl    $0x20,%rax
52c0   e169f0:	48 b9 00 00 00 00 e8 ff ff ff 	movabs $0xffffffe800000000,%rcx
52ca   e169fa:	48 01 c8             	add    %rcx,%rax
52cd   e169fd:	48 c1 f8 20          	sar    $0x20,%rax
52d1   e16a01:	48 83 c0 f8          	add    $0xfffffffffffffff8,%rax
52d5   e16a05:	48 b9 ab aa aa aa aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rcx
52df   e16a0f:	48 f7 e1             	mul    %rcx
52e2   e16a12:	48 89 d3             	mov    %rdx,%rbx
52e5   e16a15:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
52ea   e16a1a:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
52ef   e16a1f:	84 c0                	test   %al,%al
52f1   e16a21:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
52f6   e16a26:	0f 85 82 1b 00 00    	jne    e185ae <fix_nodes+0x6e7e>
52fc   e16a2c:	48 c1 eb 04          	shr    $0x4,%rbx
5300   e16a30:	48 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%rax
5308   e16a38:	4c 63 30             	movslq (%rax),%r14
530b   e16a3b:	43 0f b6 04 27       	movzbl (%r15,%r12,1),%eax
5310   e16a40:	84 c0                	test   %al,%al
5312   e16a42:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
5317   e16a47:	0f 85 89 1b 00 00    	jne    e185d6 <fix_nodes+0x6ea6>
531d   e16a4d:	0f b7 17             	movzwl (%rdi),%edx
5320   e16a50:	4c 29 f3             	sub    %r14,%rbx
5323   e16a53:	48 8d 04 13          	lea    (%rbx,%rdx,1),%rax
5327   e16a57:	48 83 c0 02          	add    $0x2,%rax
532b   e16a5b:	48 d1 e8             	shr    %rax
532e   e16a5e:	29 c2                	sub    %eax,%edx
5330   e16a60:	83 c2 01             	add    $0x1,%edx
5333   e16a63:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
5338   e16a68:	48 89 df             	mov    %rbx,%rdi
533b   e16a6b:	44 89 ee             	mov    %r13d,%esi
533e   e16a6e:	31 c9                	xor    %ecx,%ecx
5340   e16a70:	41 b8 01 00 00 00    	mov    $0x1,%r8d
5346   e16a76:	e9 4a fd ff ff       	jmp    e167c5 <fix_nodes+0x5095>
534b   e16a7b:	bf 19 00 00 00       	mov    $0x19,%edi
5350   e16a80:	44 8b 7c 24 60       	mov    0x60(%rsp),%r15d
5355   e16a85:	44 89 fe             	mov    %r15d,%esi
5358   e16a88:	e8 00 00 00 00       	call   e16a8d <fix_nodes+0x535d>	e16a89: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
535d   e16a8d:	41 83 ff 19          	cmp    $0x19,%r15d
5361   e16a91:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
5366   e16a96:	0f 85 45 02 00 00    	jne    e16ce1 <fix_nodes+0x55b1>
536c   e16a9c:	e8 00 00 00 00       	call   e16aa1 <fix_nodes+0x5371>	e16a9d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5371   e16aa1:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
5376   e16aa6:	48 c1 e8 03          	shr    $0x3,%rax
537a   e16aaa:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
537f   e16aaf:	84 c0                	test   %al,%al
5381   e16ab1:	0f 85 88 1e 00 00    	jne    e1893f <fix_nodes+0x720f>
5387   e16ab7:	8b 83 24 02 00 00    	mov    0x224(%rbx),%eax
538d   e16abd:	31 c9                	xor    %ecx,%ecx
538f   e16abf:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
5394   e16ac4:	48 89 df             	mov    %rbx,%rdi
5397   e16ac7:	31 f6                	xor    %esi,%esi
5399   e16ac9:	31 d2                	xor    %edx,%edx
539b   e16acb:	8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%ecx
53a2   e16ad2:	45 89 e8             	mov    %r13d,%r8d
53a5   e16ad5:	4c 8d 8c 24 a2 01 00 00 	lea    0x1a2(%rsp),%r9
53ad   e16add:	50                   	push   %rax
53ae   e16ade:	6a ff                	push   $0xffffffffffffffff
53b0   e16ae0:	e8 bb 7f 00 00       	call   e1eaa0 <set_parameters>
53b5   e16ae5:	48 83 c4 10          	add    $0x10,%rsp
53b9   e16ae9:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
53be   e16aee:	e9 6c d8 ff ff       	jmp    e1435f <fix_nodes+0x2c2f>
53c3   e16af3:	4d 85 ed             	test   %r13,%r13
53c6   e16af6:	48 8b 9c 24 d0 00 00 00 	mov    0xd0(%rsp),%rbx
53ce   e16afe:	0f 84 55 02 00 00    	je     e16d59 <fix_nodes+0x5629>
53d4   e16b04:	e8 00 00 00 00       	call   e16b09 <fix_nodes+0x53d9>	e16b05: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
53d9   e16b09:	48 83 c3 20          	add    $0x20,%rbx
53dd   e16b0d:	48 89 d8             	mov    %rbx,%rax
53e0   e16b10:	48 c1 e8 03          	shr    $0x3,%rax
53e4   e16b14:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
53e9   e16b19:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
53ee   e16b1e:	74 08                	je     e16b28 <fix_nodes+0x53f8>
53f0   e16b20:	48 89 df             	mov    %rbx,%rdi
53f3   e16b23:	e8 00 00 00 00       	call   e16b28 <fix_nodes+0x53f8>	e16b24: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
53f8   e16b28:	8b 03                	mov    (%rbx),%eax
53fa   e16b2a:	83 c0 e8             	add    $0xffffffe8,%eax
53fd   e16b2d:	48 98                	cltq
53ff   e16b2f:	48 83 c0 f8          	add    $0xfffffffffffffff8,%rax
5403   e16b33:	48 b9 ab aa aa aa aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rcx
540d   e16b3d:	48 f7 e1             	mul    %rcx
5410   e16b40:	48 89 d3             	mov    %rdx,%rbx
5413   e16b43:	48 c1 eb 04          	shr    $0x4,%rbx
5417   e16b47:	48 63 84 24 80 00 00 00 	movslq 0x80(%rsp),%rax
541f   e16b4f:	48 29 c3             	sub    %rax,%rbx
5422   e16b52:	48 83 c3 01          	add    $0x1,%rbx
5426   e16b56:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
542b   e16b5b:	48 83 c2 08          	add    $0x8,%rdx
542f   e16b5f:	48 89 d0             	mov    %rdx,%rax
5432   e16b62:	48 c1 e8 03          	shr    $0x3,%rax
5436   e16b66:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
543b   e16b6b:	84 c0                	test   %al,%al
543d   e16b6d:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
5442   e16b72:	0f 85 9e 1d 00 00    	jne    e18916 <fix_nodes+0x71e6>
5448   e16b78:	0f b7 02             	movzwl (%rdx),%eax
544b   e16b7b:	48 8d 0c 18          	lea    (%rax,%rbx,1),%rcx
544f   e16b7f:	48 83 c1 01          	add    $0x1,%rcx
5453   e16b83:	48 d1 e9             	shr    %rcx
5456   e16b86:	29 d9                	sub    %ebx,%ecx
5458   e16b88:	31 c0                	xor    %eax,%eax
545a   e16b8a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
545f   e16b8f:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
5464   e16b94:	44 89 ee             	mov    %r13d,%esi
5467   e16b97:	31 d2                	xor    %edx,%edx
5469   e16b99:	44 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%r8d
5471   e16ba1:	45 31 c9             	xor    %r9d,%r9d
5474   e16ba4:	6a ff                	push   $0xffffffffffffffff
5476   e16ba6:	6a ff                	push   $0xffffffffffffffff
5478   e16ba8:	e8 f3 7e 00 00       	call   e1eaa0 <set_parameters>
547d   e16bad:	48 83 c4 10          	add    $0x10,%rsp
5481   e16bb1:	e9 a9 d7 ff ff       	jmp    e1435f <fix_nodes+0x2c2f>
5486   e16bb6:	e8 00 00 00 00       	call   e16bbb <fix_nodes+0x548b>	e16bb7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
548b   e16bbb:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
5490   e16bc0:	48 c1 e8 03          	shr    $0x3,%rax
5494   e16bc4:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
5499   e16bc9:	84 c0                	test   %al,%al
549b   e16bcb:	0f 84 52 02 00 00    	je     e16e23 <fix_nodes+0x56f3>
54a1   e16bd1:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
54a6   e16bd6:	80 e1 07             	and    $0x7,%cl
54a9   e16bd9:	80 c1 03             	add    $0x3,%cl
54ac   e16bdc:	38 c1                	cmp    %al,%cl
54ae   e16bde:	0f 8c 3f 02 00 00    	jl     e16e23 <fix_nodes+0x56f3>
54b4   e16be4:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
54b9   e16be9:	e8 00 00 00 00       	call   e16bee <fix_nodes+0x54be>	e16bea: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
54be   e16bee:	e9 30 02 00 00       	jmp    e16e23 <fix_nodes+0x56f3>
54c3   e16bf3:	e8 00 00 00 00       	call   e16bf8 <fix_nodes+0x54c8>	e16bf4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
54c8   e16bf8:	eb 0f                	jmp    e16c09 <fix_nodes+0x54d9>
54ca   e16bfa:	e8 00 00 00 00       	call   e16bff <fix_nodes+0x54cf>	e16bfb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
54cf   e16bff:	e9 ea ef ff ff       	jmp    e15bee <fix_nodes+0x44be>
54d4   e16c04:	e8 00 00 00 00       	call   e16c09 <fix_nodes+0x54d9>	e16c05: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
54d9   e16c09:	31 ff                	xor    %edi,%edi
54db   e16c0b:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e16c0e: R_X86_64_32S	.rodata+0x1b9240
54e2   e16c12:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e16c15: R_X86_64_32S	.rodata.str1.1+0x13e7
54e9   e16c19:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e16c1c: R_X86_64_32S	.rodata+0x1b97c0
54f0   e16c20:	41 b8 6a 06 00 00    	mov    $0x66a,%r8d
54f6   e16c26:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	e16c29: R_X86_64_32S	.rodata.str1.1+0x13e7
54fd   e16c2d:	e8 00 00 00 00       	call   e16c32 <fix_nodes+0x5502>	e16c2e: R_X86_64_PLT32	__reiserfs_panic-0x4
5502   e16c32:	e9 17 d2 ff ff       	jmp    e13e4e <fix_nodes+0x271e>
5507   e16c37:	e8 00 00 00 00       	call   e16c3c <fix_nodes+0x550c>	e16c38: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
550c   e16c3c:	31 ff                	xor    %edi,%edi
550e   e16c3e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e16c41: R_X86_64_32S	.rodata+0x1b9240
5515   e16c45:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e16c48: R_X86_64_32S	.rodata.str1.1+0x47937
551c   e16c4c:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e16c4f: R_X86_64_32S	.rodata+0x1bab60
5523   e16c53:	41 b8 c7 07 00 00    	mov    $0x7c7,%r8d
5529   e16c59:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	e16c5c: R_X86_64_32S	.rodata.str1.1+0x47937
5530   e16c60:	e8 00 00 00 00       	call   e16c65 <fix_nodes+0x5535>	e16c61: R_X86_64_PLT32	__reiserfs_panic-0x4
5535   e16c65:	e9 50 f6 ff ff       	jmp    e162ba <fix_nodes+0x4b8a>
553a   e16c6a:	bf 0f 00 00 00       	mov    $0xf,%edi
553f   e16c6f:	8b 5c 24 50          	mov    0x50(%rsp),%ebx
5543   e16c73:	89 de                	mov    %ebx,%esi
5545   e16c75:	e8 00 00 00 00       	call   e16c7a <fix_nodes+0x554a>	e16c76: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
554a   e16c7a:	83 fb 0f             	cmp    $0xf,%ebx
554d   e16c7d:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
5552   e16c82:	0f 85 80 01 00 00    	jne    e16e08 <fix_nodes+0x56d8>
5558   e16c88:	e8 00 00 00 00       	call   e16c8d <fix_nodes+0x555d>	e16c89: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
555d   e16c8d:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
5562   e16c92:	48 c1 e8 03          	shr    $0x3,%rax
5566   e16c96:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
556b   e16c9b:	84 c0                	test   %al,%al
556d   e16c9d:	0f 85 e0 1c 00 00    	jne    e18983 <fix_nodes+0x7253>
5573   e16ca3:	8b 83 20 02 00 00    	mov    0x220(%rbx),%eax
5579   e16ca9:	31 c9                	xor    %ecx,%ecx
557b   e16cab:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
5580   e16cb0:	48 89 df             	mov    %rbx,%rdi
5583   e16cb3:	31 f6                	xor    %esi,%esi
5585   e16cb5:	8b 54 24 30          	mov    0x30(%rsp),%edx
5589   e16cb9:	31 c9                	xor    %ecx,%ecx
558b   e16cbb:	44 8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%r8d
5593   e16cc3:	4c 8d 8c 24 8e 01 00 00 	lea    0x18e(%rsp),%r9
559b   e16ccb:	6a ff                	push   $0xffffffffffffffff
559d   e16ccd:	50                   	push   %rax
559e   e16cce:	e8 cd 7d 00 00       	call   e1eaa0 <set_parameters>
55a3   e16cd3:	48 83 c4 10          	add    $0x10,%rsp
55a7   e16cd7:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
55ac   e16cdc:	e9 7e d6 ff ff       	jmp    e1435f <fix_nodes+0x2c2f>
55b1   e16ce1:	e8 00 00 00 00       	call   e16ce6 <fix_nodes+0x55b6>	e16ce2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
55b6   e16ce6:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
55bb   e16ceb:	48 c1 e8 03          	shr    $0x3,%rax
55bf   e16cef:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
55c4   e16cf4:	84 c0                	test   %al,%al
55c6   e16cf6:	0f 85 65 1c 00 00    	jne    e18961 <fix_nodes+0x7231>
55cc   e16cfc:	44 8b 74 24 60       	mov    0x60(%rsp),%r14d
55d1   e16d01:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
55d6   e16d06:	8b 98 24 02 00 00    	mov    0x224(%rax),%ebx
55dc   e16d0c:	bf ff ff ff ff       	mov    $0xffffffff,%edi
55e1   e16d11:	89 de                	mov    %ebx,%esi
55e3   e16d13:	e8 00 00 00 00       	call   e16d18 <fix_nodes+0x55e8>	e16d14: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
55e8   e16d18:	31 c0                	xor    %eax,%eax
55ea   e16d1a:	83 fb ff             	cmp    $0xffffffff,%ebx
55ed   e16d1d:	0f 95 c0             	setne  %al
55f0   e16d20:	8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%ecx
55f7   e16d27:	29 c1                	sub    %eax,%ecx
55f9   e16d29:	4e 8d 0c 74          	lea    (%rsp,%r14,2),%r9
55fd   e16d2d:	49 81 c1 70 01 00 00 	add    $0x170,%r9
5604   e16d34:	31 c0                	xor    %eax,%eax
5606   e16d36:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
560b   e16d3b:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
5610   e16d40:	31 f6                	xor    %esi,%esi
5612   e16d42:	31 d2                	xor    %edx,%edx
5614   e16d44:	45 89 e8             	mov    %r13d,%r8d
5617   e16d47:	6a ff                	push   $0xffffffffffffffff
5619   e16d49:	6a ff                	push   $0xffffffffffffffff
561b   e16d4b:	e8 50 7d 00 00       	call   e1eaa0 <set_parameters>
5620   e16d50:	48 83 c4 10          	add    $0x10,%rsp
5624   e16d54:	e9 6e bd ff ff       	jmp    e12ac7 <fix_nodes+0x1397>
5629   e16d59:	bf 19 00 00 00       	mov    $0x19,%edi
562e   e16d5e:	8b 5c 24 60          	mov    0x60(%rsp),%ebx
5632   e16d62:	89 de                	mov    %ebx,%esi
5634   e16d64:	e8 00 00 00 00       	call   e16d69 <fix_nodes+0x5639>	e16d65: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
5639   e16d69:	83 fb 19             	cmp    $0x19,%ebx
563c   e16d6c:	0f 85 36 01 00 00    	jne    e16ea8 <fix_nodes+0x5778>
5642   e16d72:	e8 00 00 00 00       	call   e16d77 <fix_nodes+0x5647>	e16d73: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5647   e16d77:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
564c   e16d7c:	48 c1 e8 03          	shr    $0x3,%rax
5650   e16d80:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
5655   e16d85:	84 c0                	test   %al,%al
5657   e16d87:	0f 85 3a 1c 00 00    	jne    e189c7 <fix_nodes+0x7297>
565d   e16d8d:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
5662   e16d92:	8b 87 24 02 00 00    	mov    0x224(%rdi),%eax
5668   e16d98:	31 c9                	xor    %ecx,%ecx
566a   e16d9a:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
566f   e16d9f:	31 f6                	xor    %esi,%esi
5671   e16da1:	31 d2                	xor    %edx,%edx
5673   e16da3:	8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%ecx
567a   e16daa:	44 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%r8d
5682   e16db2:	4c 8d 8c 24 a2 01 00 00 	lea    0x1a2(%rsp),%r9
568a   e16dba:	50                   	push   %rax
568b   e16dbb:	6a ff                	push   $0xffffffffffffffff
568d   e16dbd:	e8 de 7c 00 00       	call   e1eaa0 <set_parameters>
5692   e16dc2:	48 83 c4 10          	add    $0x10,%rsp
5696   e16dc6:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
569b   e16dcb:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
56a0   e16dd0:	e9 8a d5 ff ff       	jmp    e1435f <fix_nodes+0x2c2f>
56a5   e16dd5:	e8 00 00 00 00       	call   e16dda <fix_nodes+0x56aa>	e16dd6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
56aa   e16dda:	31 ff                	xor    %edi,%edi
56ac   e16ddc:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e16ddf: R_X86_64_32S	.rodata+0x1b9240
56b3   e16de3:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e16de6: R_X86_64_32S	.rodata.str1.1+0xe159
56ba   e16dea:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e16ded: R_X86_64_32S	.rodata+0x1bace0
56c1   e16df1:	41 b8 e7 02 00 00    	mov    $0x2e7,%r8d
56c7   e16df7:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	e16dfa: R_X86_64_32S	.rodata.str1.1+0xe159
56ce   e16dfe:	e8 00 00 00 00       	call   e16e03 <fix_nodes+0x56d3>	e16dff: R_X86_64_PLT32	__reiserfs_panic-0x4
56d3   e16e03:	e9 17 f6 ff ff       	jmp    e1641f <fix_nodes+0x4cef>
56d8   e16e08:	e8 00 00 00 00       	call   e16e0d <fix_nodes+0x56dd>	e16e09: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
56dd   e16e0d:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
56e2   e16e12:	48 c1 e8 03          	shr    $0x3,%rax
56e6   e16e16:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
56eb   e16e1b:	84 c0                	test   %al,%al
56ed   e16e1d:	0f 85 82 1b 00 00    	jne    e189a5 <fix_nodes+0x7275>
56f3   e16e23:	44 8b 74 24 50       	mov    0x50(%rsp),%r14d
56f8   e16e28:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
56fd   e16e2d:	8b 98 20 02 00 00    	mov    0x220(%rax),%ebx
5703   e16e33:	bf ff ff ff ff       	mov    $0xffffffff,%edi
5708   e16e38:	89 de                	mov    %ebx,%esi
570a   e16e3a:	e8 00 00 00 00       	call   e16e3f <fix_nodes+0x570f>	e16e3b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
570f   e16e3f:	31 c0                	xor    %eax,%eax
5711   e16e41:	83 fb ff             	cmp    $0xffffffff,%ebx
5714   e16e44:	0f 95 c0             	setne  %al
5717   e16e47:	8b 54 24 30          	mov    0x30(%rsp),%edx
571b   e16e4b:	29 c2                	sub    %eax,%edx
571d   e16e4d:	4e 8d 0c 74          	lea    (%rsp,%r14,2),%r9
5721   e16e51:	49 81 c1 70 01 00 00 	add    $0x170,%r9
5728   e16e58:	31 c0                	xor    %eax,%eax
572a   e16e5a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
572f   e16e5f:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
5734   e16e64:	31 f6                	xor    %esi,%esi
5736   e16e66:	31 c9                	xor    %ecx,%ecx
5738   e16e68:	44 8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%r8d
5740   e16e70:	e9 bd cb ff ff       	jmp    e13a32 <fix_nodes+0x2302>
5745   e16e75:	e8 00 00 00 00       	call   e16e7a <fix_nodes+0x574a>	e16e76: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
574a   e16e7a:	31 ff                	xor    %edi,%edi
574c   e16e7c:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e16e7f: R_X86_64_32S	.rodata+0x1b9240
5753   e16e83:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e16e86: R_X86_64_32S	.rodata.str1.1+0xc94ba
575a   e16e8a:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e16e8d: R_X86_64_32S	.rodata+0x1ba9e0
5761   e16e91:	41 b8 64 07 00 00    	mov    $0x764,%r8d
5767   e16e97:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	e16e9a: R_X86_64_32S	.rodata.str1.1+0xc94ba
576e   e16e9e:	e8 00 00 00 00       	call   e16ea3 <fix_nodes+0x5773>	e16e9f: R_X86_64_PLT32	__reiserfs_panic-0x4
5773   e16ea3:	e9 bc f5 ff ff       	jmp    e16464 <fix_nodes+0x4d34>
5778   e16ea8:	e8 00 00 00 00       	call   e16ead <fix_nodes+0x577d>	e16ea9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
577d   e16ead:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
5782   e16eb2:	48 c1 e8 03          	shr    $0x3,%rax
5786   e16eb6:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
578b   e16ebb:	84 c0                	test   %al,%al
578d   e16ebd:	0f 85 26 1b 00 00    	jne    e189e9 <fix_nodes+0x72b9>
5793   e16ec3:	44 8b 74 24 60       	mov    0x60(%rsp),%r14d
5798   e16ec8:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
579d   e16ecd:	41 8b 9f 24 02 00 00 	mov    0x224(%r15),%ebx
57a4   e16ed4:	bf ff ff ff ff       	mov    $0xffffffff,%edi
57a9   e16ed9:	89 de                	mov    %ebx,%esi
57ab   e16edb:	e8 00 00 00 00       	call   e16ee0 <fix_nodes+0x57b0>	e16edc: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
57b0   e16ee0:	31 c0                	xor    %eax,%eax
57b2   e16ee2:	83 fb ff             	cmp    $0xffffffff,%ebx
57b5   e16ee5:	4c 89 ff             	mov    %r15,%rdi
57b8   e16ee8:	0f 95 c0             	setne  %al
57bb   e16eeb:	8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%ecx
57c2   e16ef2:	29 c1                	sub    %eax,%ecx
57c4   e16ef4:	4e 8d 0c 74          	lea    (%rsp,%r14,2),%r9
57c8   e16ef8:	49 81 c1 70 01 00 00 	add    $0x170,%r9
57cf   e16eff:	31 c0                	xor    %eax,%eax
57d1   e16f01:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
57d6   e16f06:	31 f6                	xor    %esi,%esi
57d8   e16f08:	31 d2                	xor    %edx,%edx
57da   e16f0a:	44 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%r8d
57e2   e16f12:	6a ff                	push   $0xffffffffffffffff
57e4   e16f14:	6a ff                	push   $0xffffffffffffffff
57e6   e16f16:	e8 85 7b 00 00       	call   e1eaa0 <set_parameters>
57eb   e16f1b:	48 83 c4 10          	add    $0x10,%rsp
57ef   e16f1f:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
57f4   e16f24:	e9 9e bb ff ff       	jmp    e12ac7 <fix_nodes+0x1397>
57f9   e16f29:	89 d9                	mov    %ebx,%ecx
57fb   e16f2b:	80 e1 07             	and    $0x7,%cl
57fe   e16f2e:	80 c1 03             	add    $0x3,%cl
5801   e16f31:	38 c1                	cmp    %al,%cl
5803   e16f33:	0f 8c 8d b1 ff ff    	jl     e120c6 <fix_nodes+0x996>
5809   e16f39:	48 89 df             	mov    %rbx,%rdi
580c   e16f3c:	e8 00 00 00 00       	call   e16f41 <fix_nodes+0x5811>	e16f3d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5811   e16f41:	e9 80 b1 ff ff       	jmp    e120c6 <fix_nodes+0x996>
5816   e16f46:	89 d9                	mov    %ebx,%ecx
5818   e16f48:	80 e1 07             	and    $0x7,%cl
581b   e16f4b:	80 c1 03             	add    $0x3,%cl
581e   e16f4e:	38 c1                	cmp    %al,%cl
5820   e16f50:	0f 8c b3 b1 ff ff    	jl     e12109 <fix_nodes+0x9d9>
5826   e16f56:	48 89 df             	mov    %rbx,%rdi
5829   e16f59:	e8 00 00 00 00       	call   e16f5e <fix_nodes+0x582e>	e16f5a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
582e   e16f5e:	e9 a6 b1 ff ff       	jmp    e12109 <fix_nodes+0x9d9>
5833   e16f63:	89 f9                	mov    %edi,%ecx
5835   e16f65:	80 e1 07             	and    $0x7,%cl
5838   e16f68:	80 c1 01             	add    $0x1,%cl
583b   e16f6b:	38 c1                	cmp    %al,%cl
583d   e16f6d:	0f 8c 07 b7 ff ff    	jl     e1267a <fix_nodes+0xf4a>
5843   e16f73:	e8 00 00 00 00       	call   e16f78 <fix_nodes+0x5848>	e16f74: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
5848   e16f78:	e9 fd b6 ff ff       	jmp    e1267a <fix_nodes+0xf4a>
584d   e16f7d:	89 f9                	mov    %edi,%ecx
584f   e16f7f:	80 e1 07             	and    $0x7,%cl
5852   e16f82:	80 c1 01             	add    $0x1,%cl
5855   e16f85:	38 c1                	cmp    %al,%cl
5857   e16f87:	0f 8c 11 b7 ff ff    	jl     e1269e <fix_nodes+0xf6e>
585d   e16f8d:	e8 00 00 00 00       	call   e16f92 <fix_nodes+0x5862>	e16f8e: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
5862   e16f92:	e9 07 b7 ff ff       	jmp    e1269e <fix_nodes+0xf6e>
5867   e16f97:	89 f9                	mov    %edi,%ecx
5869   e16f99:	80 e1 07             	and    $0x7,%cl
586c   e16f9c:	80 c1 01             	add    $0x1,%cl
586f   e16f9f:	38 c1                	cmp    %al,%cl
5871   e16fa1:	0f 8c 1a b7 ff ff    	jl     e126c1 <fix_nodes+0xf91>
5877   e16fa7:	e8 00 00 00 00       	call   e16fac <fix_nodes+0x587c>	e16fa8: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
587c   e16fac:	e9 10 b7 ff ff       	jmp    e126c1 <fix_nodes+0xf91>
5881   e16fb1:	89 d9                	mov    %ebx,%ecx
5883   e16fb3:	80 e1 07             	and    $0x7,%cl
5886   e16fb6:	80 c1 03             	add    $0x3,%cl
5889   e16fb9:	38 c1                	cmp    %al,%cl
588b   e16fbb:	0f 8c 94 b7 ff ff    	jl     e12755 <fix_nodes+0x1025>
5891   e16fc1:	48 89 df             	mov    %rbx,%rdi
5894   e16fc4:	e8 00 00 00 00       	call   e16fc9 <fix_nodes+0x5899>	e16fc5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5899   e16fc9:	e9 87 b7 ff ff       	jmp    e12755 <fix_nodes+0x1025>
589e   e16fce:	44 89 f1             	mov    %r14d,%ecx
58a1   e16fd1:	80 e1 07             	and    $0x7,%cl
58a4   e16fd4:	80 c1 03             	add    $0x3,%cl
58a7   e16fd7:	38 c1                	cmp    %al,%cl
58a9   e16fd9:	0f 8c 2c d4 ff ff    	jl     e1440b <fix_nodes+0x2cdb>
58af   e16fdf:	4c 89 f7             	mov    %r14,%rdi
58b2   e16fe2:	e8 00 00 00 00       	call   e16fe7 <fix_nodes+0x58b7>	e16fe3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
58b7   e16fe7:	e9 1f d4 ff ff       	jmp    e1440b <fix_nodes+0x2cdb>
58bc   e16fec:	89 d9                	mov    %ebx,%ecx
58be   e16fee:	80 e1 07             	and    $0x7,%cl
58c1   e16ff1:	80 c1 03             	add    $0x3,%cl
58c4   e16ff4:	38 c1                	cmp    %al,%cl
58c6   e16ff6:	0f 8c 64 d6 ff ff    	jl     e14660 <fix_nodes+0x2f30>
58cc   e16ffc:	48 89 df             	mov    %rbx,%rdi
58cf   e16fff:	e8 00 00 00 00       	call   e17004 <fix_nodes+0x58d4>	e17000: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
58d4   e17004:	e9 57 d6 ff ff       	jmp    e14660 <fix_nodes+0x2f30>
58d9   e17009:	44 89 f1             	mov    %r14d,%ecx
58dc   e1700c:	80 e1 07             	and    $0x7,%cl
58df   e1700f:	80 c1 03             	add    $0x3,%cl
58e2   e17012:	38 c1                	cmp    %al,%cl
58e4   e17014:	0f 8c b9 b7 ff ff    	jl     e127d3 <fix_nodes+0x10a3>
58ea   e1701a:	4c 89 f7             	mov    %r14,%rdi
58ed   e1701d:	e8 00 00 00 00       	call   e17022 <fix_nodes+0x58f2>	e1701e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
58f2   e17022:	e9 ac b7 ff ff       	jmp    e127d3 <fix_nodes+0x10a3>
58f7   e17027:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
58fc   e1702c:	80 e1 07             	and    $0x7,%cl
58ff   e1702f:	80 c1 03             	add    $0x3,%cl
5902   e17032:	38 c1                	cmp    %al,%cl
5904   e17034:	0f 8c f7 b7 ff ff    	jl     e12831 <fix_nodes+0x1101>
590a   e1703a:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
590f   e1703f:	e8 00 00 00 00       	call   e17044 <fix_nodes+0x5914>	e17040: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5914   e17044:	e9 e8 b7 ff ff       	jmp    e12831 <fix_nodes+0x1101>
5919   e17049:	44 89 f9             	mov    %r15d,%ecx
591c   e1704c:	80 e1 07             	and    $0x7,%cl
591f   e1704f:	80 c1 03             	add    $0x3,%cl
5922   e17052:	38 c1                	cmp    %al,%cl
5924   e17054:	0f 8c 39 d4 ff ff    	jl     e14493 <fix_nodes+0x2d63>
592a   e1705a:	4c 89 ff             	mov    %r15,%rdi
592d   e1705d:	e8 00 00 00 00       	call   e17062 <fix_nodes+0x5932>	e1705e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5932   e17062:	e9 2c d4 ff ff       	jmp    e14493 <fix_nodes+0x2d63>
5937   e17067:	44 89 f9             	mov    %r15d,%ecx
593a   e1706a:	80 e1 07             	and    $0x7,%cl
593d   e1706d:	80 c1 03             	add    $0x3,%cl
5940   e17070:	38 c1                	cmp    %al,%cl
5942   e17072:	0f 8c 99 d4 ff ff    	jl     e14511 <fix_nodes+0x2de1>
5948   e17078:	4c 89 ff             	mov    %r15,%rdi
594b   e1707b:	e8 00 00 00 00       	call   e17080 <fix_nodes+0x5950>	e1707c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5950   e17080:	e9 8c d4 ff ff       	jmp    e14511 <fix_nodes+0x2de1>
5955   e17085:	44 89 f9             	mov    %r15d,%ecx
5958   e17088:	80 e1 07             	and    $0x7,%cl
595b   e1708b:	38 c1                	cmp    %al,%cl
595d   e1708d:	0f 8c 9a b1 ff ff    	jl     e1222d <fix_nodes+0xafd>
5963   e17093:	be 04 00 00 00       	mov    $0x4,%esi
5968   e17098:	4c 89 ff             	mov    %r15,%rdi
596b   e1709b:	e8 00 00 00 00       	call   e170a0 <fix_nodes+0x5970>	e1709c: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
5970   e170a0:	e9 88 b1 ff ff       	jmp    e1222d <fix_nodes+0xafd>
5975   e170a5:	89 d9                	mov    %ebx,%ecx
5977   e170a7:	80 e1 07             	and    $0x7,%cl
597a   e170aa:	38 c1                	cmp    %al,%cl
597c   e170ac:	0f 8c 8f b1 ff ff    	jl     e12241 <fix_nodes+0xb11>
5982   e170b2:	be 04 00 00 00       	mov    $0x4,%esi
5987   e170b7:	48 89 df             	mov    %rbx,%rdi
598a   e170ba:	e8 00 00 00 00       	call   e170bf <fix_nodes+0x598f>	e170bb: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
598f   e170bf:	e9 7d b1 ff ff       	jmp    e12241 <fix_nodes+0xb11>
5994   e170c4:	89 d9                	mov    %ebx,%ecx
5996   e170c6:	80 e1 07             	and    $0x7,%cl
5999   e170c9:	80 c1 03             	add    $0x3,%cl
599c   e170cc:	38 c1                	cmp    %al,%cl
599e   e170ce:	0f 8c 14 b2 ff ff    	jl     e122e8 <fix_nodes+0xbb8>
59a4   e170d4:	48 89 df             	mov    %rbx,%rdi
59a7   e170d7:	e8 00 00 00 00       	call   e170dc <fix_nodes+0x59ac>	e170d8: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
59ac   e170dc:	e9 07 b2 ff ff       	jmp    e122e8 <fix_nodes+0xbb8>
59b1   e170e1:	89 d9                	mov    %ebx,%ecx
59b3   e170e3:	80 e1 07             	and    $0x7,%cl
59b6   e170e6:	80 c1 03             	add    $0x3,%cl
59b9   e170e9:	38 c1                	cmp    %al,%cl
59bb   e170eb:	0f 8c ad b2 ff ff    	jl     e1239e <fix_nodes+0xc6e>
59c1   e170f1:	48 89 df             	mov    %rbx,%rdi
59c4   e170f4:	e8 00 00 00 00       	call   e170f9 <fix_nodes+0x59c9>	e170f5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
59c9   e170f9:	e9 a0 b2 ff ff       	jmp    e1239e <fix_nodes+0xc6e>
59ce   e170fe:	89 d9                	mov    %ebx,%ecx
59d0   e17100:	80 e1 07             	and    $0x7,%cl
59d3   e17103:	80 c1 01             	add    $0x1,%cl
59d6   e17106:	38 c1                	cmp    %al,%cl
59d8   e17108:	0f 8c d1 b2 ff ff    	jl     e123df <fix_nodes+0xcaf>
59de   e1710e:	48 89 df             	mov    %rbx,%rdi
59e1   e17111:	e8 00 00 00 00       	call   e17116 <fix_nodes+0x59e6>	e17112: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
59e6   e17116:	e9 c4 b2 ff ff       	jmp    e123df <fix_nodes+0xcaf>
59eb   e1711b:	89 d9                	mov    %ebx,%ecx
59ed   e1711d:	80 e1 07             	and    $0x7,%cl
59f0   e17120:	80 c1 03             	add    $0x3,%cl
59f3   e17123:	38 c1                	cmp    %al,%cl
59f5   e17125:	0f 8c f9 b2 ff ff    	jl     e12424 <fix_nodes+0xcf4>
59fb   e1712b:	48 89 df             	mov    %rbx,%rdi
59fe   e1712e:	e8 00 00 00 00       	call   e17133 <fix_nodes+0x5a03>	e1712f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5a03   e17133:	e9 ec b2 ff ff       	jmp    e12424 <fix_nodes+0xcf4>
5a08   e17138:	44 89 f1             	mov    %r14d,%ecx
5a0b   e1713b:	80 e1 07             	and    $0x7,%cl
5a0e   e1713e:	80 c1 03             	add    $0x3,%cl
5a11   e17141:	38 c1                	cmp    %al,%cl
5a13   e17143:	0f 8c 71 b7 ff ff    	jl     e128ba <fix_nodes+0x118a>
5a19   e17149:	4c 89 f7             	mov    %r14,%rdi
5a1c   e1714c:	e8 00 00 00 00       	call   e17151 <fix_nodes+0x5a21>	e1714d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5a21   e17151:	e9 64 b7 ff ff       	jmp    e128ba <fix_nodes+0x118a>
5a26   e17156:	44 89 f1             	mov    %r14d,%ecx
5a29   e17159:	80 e1 07             	and    $0x7,%cl
5a2c   e1715c:	80 c1 03             	add    $0x3,%cl
5a2f   e1715f:	38 c1                	cmp    %al,%cl
5a31   e17161:	0f 8c 24 b8 ff ff    	jl     e1298b <fix_nodes+0x125b>
5a37   e17167:	4c 89 f7             	mov    %r14,%rdi
5a3a   e1716a:	e8 00 00 00 00       	call   e1716f <fix_nodes+0x5a3f>	e1716b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5a3f   e1716f:	e9 17 b8 ff ff       	jmp    e1298b <fix_nodes+0x125b>
5a44   e17174:	89 d9                	mov    %ebx,%ecx
5a46   e17176:	80 e1 07             	and    $0x7,%cl
5a49   e17179:	80 c1 03             	add    $0x3,%cl
5a4c   e1717c:	38 c1                	cmp    %al,%cl
5a4e   e1717e:	0f 8c fd d3 ff ff    	jl     e14581 <fix_nodes+0x2e51>
5a54   e17184:	48 89 df             	mov    %rbx,%rdi
5a57   e17187:	e8 00 00 00 00       	call   e1718c <fix_nodes+0x5a5c>	e17188: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5a5c   e1718c:	e9 f0 d3 ff ff       	jmp    e14581 <fix_nodes+0x2e51>
5a61   e17191:	89 d9                	mov    %ebx,%ecx
5a63   e17193:	80 e1 07             	and    $0x7,%cl
5a66   e17196:	80 c1 03             	add    $0x3,%cl
5a69   e17199:	38 c1                	cmp    %al,%cl
5a6b   e1719b:	0f 8c 0e b4 ff ff    	jl     e125af <fix_nodes+0xe7f>
5a71   e171a1:	48 89 df             	mov    %rbx,%rdi
5a74   e171a4:	e8 00 00 00 00       	call   e171a9 <fix_nodes+0x5a79>	e171a5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5a79   e171a9:	e9 01 b4 ff ff       	jmp    e125af <fix_nodes+0xe7f>
5a7e   e171ae:	89 d1                	mov    %edx,%ecx
5a80   e171b0:	80 e1 07             	and    $0x7,%cl
5a83   e171b3:	80 c1 03             	add    $0x3,%cl
5a86   e171b6:	38 c1                	cmp    %al,%cl
5a88   e171b8:	0f 8c 0e b4 ff ff    	jl     e125cc <fix_nodes+0xe9c>
5a8e   e171be:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
5a93   e171c3:	e8 00 00 00 00       	call   e171c8 <fix_nodes+0x5a98>	e171c4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5a98   e171c8:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
5a9d   e171cd:	e9 fa b3 ff ff       	jmp    e125cc <fix_nodes+0xe9c>
5aa2   e171d2:	44 89 f9             	mov    %r15d,%ecx
5aa5   e171d5:	80 e1 07             	and    $0x7,%cl
5aa8   e171d8:	80 c1 03             	add    $0x3,%cl
5aab   e171db:	38 c1                	cmp    %al,%cl
5aad   e171dd:	0f 8c 37 b8 ff ff    	jl     e12a1a <fix_nodes+0x12ea>
5ab3   e171e3:	4c 89 ff             	mov    %r15,%rdi
5ab6   e171e6:	e8 00 00 00 00       	call   e171eb <fix_nodes+0x5abb>	e171e7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5abb   e171eb:	e9 2a b8 ff ff       	jmp    e12a1a <fix_nodes+0x12ea>
5ac0   e171f0:	89 d9                	mov    %ebx,%ecx
5ac2   e171f2:	80 e1 07             	and    $0x7,%cl
5ac5   e171f5:	80 c1 01             	add    $0x1,%cl
5ac8   e171f8:	38 c1                	cmp    %al,%cl
5aca   e171fa:	0f 8c 76 b9 ff ff    	jl     e12b76 <fix_nodes+0x1446>
5ad0   e17200:	48 89 df             	mov    %rbx,%rdi
5ad3   e17203:	e8 00 00 00 00       	call   e17208 <fix_nodes+0x5ad8>	e17204: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5ad8   e17208:	e9 69 b9 ff ff       	jmp    e12b76 <fix_nodes+0x1446>
5add   e1720d:	89 d9                	mov    %ebx,%ecx
5adf   e1720f:	80 e1 07             	and    $0x7,%cl
5ae2   e17212:	80 c1 01             	add    $0x1,%cl
5ae5   e17215:	38 c1                	cmp    %al,%cl
5ae7   e17217:	0f 8c ad b9 ff ff    	jl     e12bca <fix_nodes+0x149a>
5aed   e1721d:	48 89 df             	mov    %rbx,%rdi
5af0   e17220:	e8 00 00 00 00       	call   e17225 <fix_nodes+0x5af5>	e17221: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5af5   e17225:	e9 a0 b9 ff ff       	jmp    e12bca <fix_nodes+0x149a>
5afa   e1722a:	44 89 f1             	mov    %r14d,%ecx
5afd   e1722d:	80 e1 07             	and    $0x7,%cl
5b00   e17230:	80 c1 03             	add    $0x3,%cl
5b03   e17233:	38 c1                	cmp    %al,%cl
5b05   e17235:	0f 8c ca b9 ff ff    	jl     e12c05 <fix_nodes+0x14d5>
5b0b   e1723b:	4c 89 f7             	mov    %r14,%rdi
5b0e   e1723e:	e8 00 00 00 00       	call   e17243 <fix_nodes+0x5b13>	e1723f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b13   e17243:	e9 bd b9 ff ff       	jmp    e12c05 <fix_nodes+0x14d5>
5b18   e17248:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
5b1d   e1724d:	80 e1 07             	and    $0x7,%cl
5b20   e17250:	80 c1 03             	add    $0x3,%cl
5b23   e17253:	38 c1                	cmp    %al,%cl
5b25   e17255:	0f 8c 03 ba ff ff    	jl     e12c5e <fix_nodes+0x152e>
5b2b   e1725b:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
5b30   e17260:	e8 00 00 00 00       	call   e17265 <fix_nodes+0x5b35>	e17261: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b35   e17265:	e9 f4 b9 ff ff       	jmp    e12c5e <fix_nodes+0x152e>
5b3a   e1726a:	44 89 f1             	mov    %r14d,%ecx
5b3d   e1726d:	80 e1 07             	and    $0x7,%cl
5b40   e17270:	80 c1 03             	add    $0x3,%cl
5b43   e17273:	38 c1                	cmp    %al,%cl
5b45   e17275:	0f 8c 42 bb ff ff    	jl     e12dbd <fix_nodes+0x168d>
5b4b   e1727b:	4c 89 f7             	mov    %r14,%rdi
5b4e   e1727e:	e8 00 00 00 00       	call   e17283 <fix_nodes+0x5b53>	e1727f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b53   e17283:	e9 35 bb ff ff       	jmp    e12dbd <fix_nodes+0x168d>
5b58   e17288:	44 89 f9             	mov    %r15d,%ecx
5b5b   e1728b:	80 e1 07             	and    $0x7,%cl
5b5e   e1728e:	80 c1 03             	add    $0x3,%cl
5b61   e17291:	38 c1                	cmp    %al,%cl
5b63   e17293:	0f 8c 7e d3 ff ff    	jl     e14617 <fix_nodes+0x2ee7>
5b69   e17299:	4c 89 ff             	mov    %r15,%rdi
5b6c   e1729c:	e8 00 00 00 00       	call   e172a1 <fix_nodes+0x5b71>	e1729d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b71   e172a1:	e9 71 d3 ff ff       	jmp    e14617 <fix_nodes+0x2ee7>
5b76   e172a6:	44 89 f1             	mov    %r14d,%ecx
5b79   e172a9:	80 e1 07             	and    $0x7,%cl
5b7c   e172ac:	80 c1 03             	add    $0x3,%cl
5b7f   e172af:	38 c1                	cmp    %al,%cl
5b81   e172b1:	0f 8c 4d ba ff ff    	jl     e12d04 <fix_nodes+0x15d4>
5b87   e172b7:	4c 89 f7             	mov    %r14,%rdi
5b8a   e172ba:	e8 00 00 00 00       	call   e172bf <fix_nodes+0x5b8f>	e172bb: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b8f   e172bf:	e9 40 ba ff ff       	jmp    e12d04 <fix_nodes+0x15d4>
5b94   e172c4:	48 89 fb             	mov    %rdi,%rbx
5b97   e172c7:	89 d9                	mov    %ebx,%ecx
5b99   e172c9:	80 e1 07             	and    $0x7,%cl
5b9c   e172cc:	80 c1 01             	add    $0x1,%cl
5b9f   e172cf:	38 c1                	cmp    %al,%cl
5ba1   e172d1:	0f 8c a8 bb ff ff    	jl     e12e7f <fix_nodes+0x174f>
5ba7   e172d7:	e8 00 00 00 00       	call   e172dc <fix_nodes+0x5bac>	e172d8: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5bac   e172dc:	48 89 df             	mov    %rbx,%rdi
5baf   e172df:	e9 9b bb ff ff       	jmp    e12e7f <fix_nodes+0x174f>
5bb4   e172e4:	e8 00 00 00 00       	call   e172e9 <fix_nodes+0x5bb9>	e172e5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5bb9   e172e9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e172ec: R_X86_64_32S	.data+0x66dc70
5bc0   e172f0:	48 89 de             	mov    %rbx,%rsi
5bc3   e172f3:	e8 00 00 00 00       	call   e172f8 <fix_nodes+0x5bc8>	e172f4: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
5bc8   e172f8:	e9 31 d1 ff ff       	jmp    e1442e <fix_nodes+0x2cfe>
5bcd   e172fd:	e8 00 00 00 00       	call   e17302 <fix_nodes+0x5bd2>	e172fe: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5bd2   e17302:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e17305: R_X86_64_32S	.data+0x66ddb0
5bd9   e17309:	48 89 de             	mov    %rbx,%rsi
5bdc   e1730c:	e8 00 00 00 00       	call   e17311 <fix_nodes+0x5be1>	e1730d: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
5be1   e17311:	e9 e0 b4 ff ff       	jmp    e127f6 <fix_nodes+0x10c6>
5be6   e17316:	89 d9                	mov    %ebx,%ecx
5be8   e17318:	80 e1 07             	and    $0x7,%cl
5beb   e1731b:	38 c1                	cmp    %al,%cl
5bed   e1731d:	0f 8c 00 bd ff ff    	jl     e13023 <fix_nodes+0x18f3>
5bf3   e17323:	be 08 00 00 00       	mov    $0x8,%esi
5bf8   e17328:	48 89 df             	mov    %rbx,%rdi
5bfb   e1732b:	e8 00 00 00 00       	call   e17330 <fix_nodes+0x5c00>	e1732c: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
5c00   e17330:	e9 ee bc ff ff       	jmp    e13023 <fix_nodes+0x18f3>
5c05   e17335:	48 8b 8c 24 10 01 00 00 	mov    0x110(%rsp),%rcx
5c0d   e1733d:	80 e1 07             	and    $0x7,%cl
5c10   e17340:	38 c1                	cmp    %al,%cl
5c12   e17342:	0f 8c f7 bc ff ff    	jl     e1303f <fix_nodes+0x190f>
5c18   e17348:	be 08 00 00 00       	mov    $0x8,%esi
5c1d   e1734d:	48 8b bc 24 10 01 00 00 	mov    0x110(%rsp),%rdi
5c25   e17355:	e8 00 00 00 00       	call   e1735a <fix_nodes+0x5c2a>	e17356: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
5c2a   e1735a:	e9 e0 bc ff ff       	jmp    e1303f <fix_nodes+0x190f>
5c2f   e1735f:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
5c34   e17364:	80 e1 07             	and    $0x7,%cl
5c37   e17367:	80 c1 01             	add    $0x1,%cl
5c3a   e1736a:	38 c1                	cmp    %al,%cl
5c3c   e1736c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
5c41   e17371:	0f 8c 7e bf ff ff    	jl     e132f5 <fix_nodes+0x1bc5>
5c47   e17377:	e8 00 00 00 00       	call   e1737c <fix_nodes+0x5c4c>	e17378: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5c4c   e1737c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
5c51   e17381:	e9 6f bf ff ff       	jmp    e132f5 <fix_nodes+0x1bc5>
5c56   e17386:	e8 00 00 00 00       	call   e1738b <fix_nodes+0x5c5b>	e17387: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5c5b   e1738b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e1738e: R_X86_64_32S	.data+0x66dc90
5c62   e17392:	48 89 de             	mov    %rbx,%rsi
5c65   e17395:	e8 00 00 00 00       	call   e1739a <fix_nodes+0x5c6a>	e17396: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
5c6a   e1739a:	e9 1b d1 ff ff       	jmp    e144ba <fix_nodes+0x2d8a>
5c6f   e1739f:	e8 00 00 00 00       	call   e173a4 <fix_nodes+0x5c74>	e173a0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5c74   e173a4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e173a7: R_X86_64_32S	.data+0x66dd50
5c7b   e173ab:	4c 89 ee             	mov    %r13,%rsi
5c7e   e173ae:	e8 00 00 00 00       	call   e173b3 <fix_nodes+0x5c83>	e173af: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
5c83   e173b3:	e9 61 af ff ff       	jmp    e12319 <fix_nodes+0xbe9>
5c88   e173b8:	44 89 f1             	mov    %r14d,%ecx
5c8b   e173bb:	80 e1 07             	and    $0x7,%cl
5c8e   e173be:	80 c1 03             	add    $0x3,%cl
5c91   e173c1:	38 c1                	cmp    %al,%cl
5c93   e173c3:	0f 8c 71 c0 ff ff    	jl     e1343a <fix_nodes+0x1d0a>
5c99   e173c9:	4c 89 f7             	mov    %r14,%rdi
5c9c   e173cc:	e8 00 00 00 00       	call   e173d1 <fix_nodes+0x5ca1>	e173cd: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5ca1   e173d1:	e9 64 c0 ff ff       	jmp    e1343a <fix_nodes+0x1d0a>
5ca6   e173d6:	44 89 f1             	mov    %r14d,%ecx
5ca9   e173d9:	80 e1 07             	and    $0x7,%cl
5cac   e173dc:	80 c1 03             	add    $0x3,%cl
5caf   e173df:	38 c1                	cmp    %al,%cl
5cb1   e173e1:	0f 8c 98 db ff ff    	jl     e14f7f <fix_nodes+0x384f>
5cb7   e173e7:	4c 89 f7             	mov    %r14,%rdi
5cba   e173ea:	e8 00 00 00 00       	call   e173ef <fix_nodes+0x5cbf>	e173eb: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5cbf   e173ef:	e9 8b db ff ff       	jmp    e14f7f <fix_nodes+0x384f>
5cc4   e173f4:	44 89 f9             	mov    %r15d,%ecx
5cc7   e173f7:	80 e1 07             	and    $0x7,%cl
5cca   e173fa:	80 c1 03             	add    $0x3,%cl
5ccd   e173fd:	38 c1                	cmp    %al,%cl
5ccf   e173ff:	0f 8c 24 de ff ff    	jl     e15229 <fix_nodes+0x3af9>
5cd5   e17405:	4c 89 ff             	mov    %r15,%rdi
5cd8   e17408:	e8 00 00 00 00       	call   e1740d <fix_nodes+0x5cdd>	e17409: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5cdd   e1740d:	e9 17 de ff ff       	jmp    e15229 <fix_nodes+0x3af9>
5ce2   e17412:	89 d9                	mov    %ebx,%ecx
5ce4   e17414:	80 e1 07             	and    $0x7,%cl
5ce7   e17417:	80 c1 01             	add    $0x1,%cl
5cea   e1741a:	38 c1                	cmp    %al,%cl
5cec   e1741c:	0f 8c 6b de ff ff    	jl     e1528d <fix_nodes+0x3b5d>
5cf2   e17422:	48 89 df             	mov    %rbx,%rdi
5cf5   e17425:	e8 00 00 00 00       	call   e1742a <fix_nodes+0x5cfa>	e17426: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5cfa   e1742a:	e9 5e de ff ff       	jmp    e1528d <fix_nodes+0x3b5d>
5cff   e1742f:	44 89 e9             	mov    %r13d,%ecx
5d02   e17432:	80 e1 07             	and    $0x7,%cl
5d05   e17435:	80 c1 01             	add    $0x1,%cl
5d08   e17438:	38 c1                	cmp    %al,%cl
5d0a   e1743a:	0f 8c 41 df ff ff    	jl     e15381 <fix_nodes+0x3c51>
5d10   e17440:	4c 89 ef             	mov    %r13,%rdi
5d13   e17443:	e8 00 00 00 00       	call   e17448 <fix_nodes+0x5d18>	e17444: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5d18   e17448:	e9 34 df ff ff       	jmp    e15381 <fix_nodes+0x3c51>
5d1d   e1744d:	e8 00 00 00 00       	call   e17452 <fix_nodes+0x5d22>	e1744e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5d22   e17452:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e17455: R_X86_64_32S	.data+0x66dd10
5d29   e17459:	4c 89 fe             	mov    %r15,%rsi
5d2c   e1745c:	e8 00 00 00 00       	call   e17461 <fix_nodes+0x5d31>	e1745d: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
5d31   e17461:	4c 89 f8             	mov    %r15,%rax
5d34   e17464:	48 c1 e0 04          	shl    $0x4,%rax
5d38   e17468:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
5d3d   e1746d:	4c 8d 34 01          	lea    (%rcx,%rax,1),%r14
5d41   e17471:	49 83 c6 08          	add    $0x8,%r14
5d45   e17475:	4c 89 f0             	mov    %r14,%rax
5d48   e17478:	48 c1 e8 03          	shr    $0x3,%rax
5d4c   e1747c:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5d56   e17486:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
5d5a   e1748a:	74 08                	je     e17494 <fix_nodes+0x5d64>
5d5c   e1748c:	4c 89 f7             	mov    %r14,%rdi
5d5f   e1748f:	e8 00 00 00 00       	call   e17494 <fix_nodes+0x5d64>	e17490: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
5d64   e17494:	49 c7 06 00 00 00 00 	movq   $0x0,(%r14)
5d6b   e1749b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e1749e: R_X86_64_32S	.data+0x66dd30
5d72   e174a2:	4c 89 fe             	mov    %r15,%rsi
5d75   e174a5:	e8 00 00 00 00       	call   e174aa <fix_nodes+0x5d7a>	e174a6: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
5d7a   e174aa:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
5d84   e174b4:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
5d89   e174b9:	4c 8b b4 24 f0 00 00 00 	mov    0xf0(%rsp),%r14
5d91   e174c1:	e9 fd ad ff ff       	jmp    e122c3 <fix_nodes+0xb93>
5d96   e174c6:	e8 00 00 00 00       	call   e174cb <fix_nodes+0x5d9b>	e174c7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5d9b   e174cb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e174ce: R_X86_64_32S	.data+0x66dd70
5da2   e174d2:	4c 89 ee             	mov    %r13,%rsi
5da5   e174d5:	e8 00 00 00 00       	call   e174da <fix_nodes+0x5daa>	e174d6: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
5daa   e174da:	e9 94 ae ff ff       	jmp    e12373 <fix_nodes+0xc43>
5daf   e174df:	e8 00 00 00 00       	call   e174e4 <fix_nodes+0x5db4>	e174e0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5db4   e174e4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e174e7: R_X86_64_32S	.data+0x66dd90
5dbb   e174eb:	48 89 de             	mov    %rbx,%rsi
5dbe   e174ee:	e8 00 00 00 00       	call   e174f3 <fix_nodes+0x5dc3>	e174ef: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
5dc3   e174f3:	e9 53 af ff ff       	jmp    e1244b <fix_nodes+0xd1b>
5dc8   e174f8:	80 e1 07             	and    $0x7,%cl
5dcb   e174fb:	80 c1 03             	add    $0x3,%cl
5dce   e174fe:	38 c1                	cmp    %al,%cl
5dd0   e17500:	0f 8c 26 c4 ff ff    	jl     e1392c <fix_nodes+0x21fc>
5dd6   e17506:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
5ddb   e1750b:	e8 00 00 00 00       	call   e17510 <fix_nodes+0x5de0>	e1750c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5de0   e17510:	e9 17 c4 ff ff       	jmp    e1392c <fix_nodes+0x21fc>
5de5   e17515:	44 89 f1             	mov    %r14d,%ecx
5de8   e17518:	80 e1 07             	and    $0x7,%cl
5deb   e1751b:	80 c1 03             	add    $0x3,%cl
5dee   e1751e:	38 c1                	cmp    %al,%cl
5df0   e17520:	0f 8c 35 c4 ff ff    	jl     e1395b <fix_nodes+0x222b>
5df6   e17526:	4c 89 f7             	mov    %r14,%rdi
5df9   e17529:	e8 00 00 00 00       	call   e1752e <fix_nodes+0x5dfe>	e1752a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5dfe   e1752e:	e9 28 c4 ff ff       	jmp    e1395b <fix_nodes+0x222b>
5e03   e17533:	89 d9                	mov    %ebx,%ecx
5e05   e17535:	80 e1 07             	and    $0x7,%cl
5e08   e17538:	80 c1 01             	add    $0x1,%cl
5e0b   e1753b:	38 c1                	cmp    %al,%cl
5e0d   e1753d:	0f 8c 40 c4 ff ff    	jl     e13983 <fix_nodes+0x2253>
5e13   e17543:	48 89 df             	mov    %rbx,%rdi
5e16   e17546:	e8 00 00 00 00       	call   e1754b <fix_nodes+0x5e1b>	e17547: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5e1b   e1754b:	e9 33 c4 ff ff       	jmp    e13983 <fix_nodes+0x2253>
5e20   e17550:	e8 00 00 00 00       	call   e17555 <fix_nodes+0x5e25>	e17551: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5e25   e17555:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e17558: R_X86_64_32S	.data+0x66e6f0
5e2c   e1755c:	48 89 de             	mov    %rbx,%rsi
5e2f   e1755f:	e8 00 00 00 00       	call   e17564 <fix_nodes+0x5e34>	e17560: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
5e34   e17564:	e9 74 b3 ff ff       	jmp    e128dd <fix_nodes+0x11ad>
5e39   e17569:	89 d9                	mov    %ebx,%ecx
5e3b   e1756b:	80 e1 07             	and    $0x7,%cl
5e3e   e1756e:	38 c1                	cmp    %al,%cl
5e40   e17570:	0f 8c f9 bb ff ff    	jl     e1316f <fix_nodes+0x1a3f>
5e46   e17576:	be 08 00 00 00       	mov    $0x8,%esi
5e4b   e1757b:	48 89 df             	mov    %rbx,%rdi
5e4e   e1757e:	e8 00 00 00 00       	call   e17583 <fix_nodes+0x5e53>	e1757f: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
5e53   e17583:	e9 e7 bb ff ff       	jmp    e1316f <fix_nodes+0x1a3f>
5e58   e17588:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
5e60   e17590:	80 e1 07             	and    $0x7,%cl
5e63   e17593:	38 c1                	cmp    %al,%cl
5e65   e17595:	0f 8c f0 bb ff ff    	jl     e1318b <fix_nodes+0x1a5b>
5e6b   e1759b:	be 08 00 00 00       	mov    $0x8,%esi
5e70   e175a0:	48 8b bc 24 a0 00 00 00 	mov    0xa0(%rsp),%rdi
5e78   e175a8:	e8 00 00 00 00       	call   e175ad <fix_nodes+0x5e7d>	e175a9: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
5e7d   e175ad:	e9 d9 bb ff ff       	jmp    e1318b <fix_nodes+0x1a5b>
5e82   e175b2:	e8 00 00 00 00       	call   e175b7 <fix_nodes+0x5e87>	e175b3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5e87   e175b7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e175ba: R_X86_64_32S	.data+0x66dcd0
5e8e   e175be:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
5e98   e175c8:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
5e9d   e175cd:	e9 a9 e4 ff ff       	jmp    e15a7b <fix_nodes+0x434b>
5ea2   e175d2:	89 f9                	mov    %edi,%ecx
5ea4   e175d4:	80 e1 07             	and    $0x7,%cl
5ea7   e175d7:	80 c1 01             	add    $0x1,%cl
5eaa   e175da:	38 c1                	cmp    %al,%cl
5eac   e175dc:	0f 8c 0c dd ff ff    	jl     e152ee <fix_nodes+0x3bbe>
5eb2   e175e2:	e8 00 00 00 00       	call   e175e7 <fix_nodes+0x5eb7>	e175e3: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5eb7   e175e7:	e9 02 dd ff ff       	jmp    e152ee <fix_nodes+0x3bbe>
5ebc   e175ec:	44 89 f9             	mov    %r15d,%ecx
5ebf   e175ef:	80 e1 07             	and    $0x7,%cl
5ec2   e175f2:	80 c1 01             	add    $0x1,%cl
5ec5   e175f5:	38 c1                	cmp    %al,%cl
5ec7   e175f7:	0f 8c 2b dd ff ff    	jl     e15328 <fix_nodes+0x3bf8>
5ecd   e175fd:	4c 89 ff             	mov    %r15,%rdi
5ed0   e17600:	e8 00 00 00 00       	call   e17605 <fix_nodes+0x5ed5>	e17601: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5ed5   e17605:	e9 1e dd ff ff       	jmp    e15328 <fix_nodes+0x3bf8>
5eda   e1760a:	89 d9                	mov    %ebx,%ecx
5edc   e1760c:	80 e1 07             	and    $0x7,%cl
5edf   e1760f:	38 c1                	cmp    %al,%cl
5ee1   e17611:	0f 8c 34 bf ff ff    	jl     e1354b <fix_nodes+0x1e1b>
5ee7   e17617:	be 04 00 00 00       	mov    $0x4,%esi
5eec   e1761c:	48 89 df             	mov    %rbx,%rdi
5eef   e1761f:	e8 00 00 00 00       	call   e17624 <fix_nodes+0x5ef4>	e17620: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
5ef4   e17624:	e9 22 bf ff ff       	jmp    e1354b <fix_nodes+0x1e1b>
5ef9   e17629:	48 8b 8c 24 10 01 00 00 	mov    0x110(%rsp),%rcx
5f01   e17631:	80 e1 07             	and    $0x7,%cl
5f04   e17634:	38 c1                	cmp    %al,%cl
5f06   e17636:	0f 8c 1c bf ff ff    	jl     e13558 <fix_nodes+0x1e28>
5f0c   e1763c:	be 04 00 00 00       	mov    $0x4,%esi
5f11   e17641:	48 8b bc 24 10 01 00 00 	mov    0x110(%rsp),%rdi
5f19   e17649:	e8 00 00 00 00       	call   e1764e <fix_nodes+0x5f1e>	e1764a: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
5f1e   e1764e:	e9 05 bf ff ff       	jmp    e13558 <fix_nodes+0x1e28>
5f23   e17653:	89 d9                	mov    %ebx,%ecx
5f25   e17655:	80 e1 07             	and    $0x7,%cl
5f28   e17658:	80 c1 01             	add    $0x1,%cl
5f2b   e1765b:	38 c1                	cmp    %al,%cl
5f2d   e1765d:	0f 8c 9b c1 ff ff    	jl     e137fe <fix_nodes+0x20ce>
5f33   e17663:	48 89 df             	mov    %rbx,%rdi
5f36   e17666:	e8 00 00 00 00       	call   e1766b <fix_nodes+0x5f3b>	e17667: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5f3b   e1766b:	e9 8e c1 ff ff       	jmp    e137fe <fix_nodes+0x20ce>
5f40   e17670:	44 89 f1             	mov    %r14d,%ecx
5f43   e17673:	80 e1 07             	and    $0x7,%cl
5f46   e17676:	80 c1 03             	add    $0x3,%cl
5f49   e17679:	38 c1                	cmp    %al,%cl
5f4b   e1767b:	0f 8c c0 c1 ff ff    	jl     e13841 <fix_nodes+0x2111>
5f51   e17681:	4c 89 f7             	mov    %r14,%rdi
5f54   e17684:	e8 00 00 00 00       	call   e17689 <fix_nodes+0x5f59>	e17685: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
5f59   e17689:	e9 b3 c1 ff ff       	jmp    e13841 <fix_nodes+0x2111>
5f5e   e1768e:	89 f9                	mov    %edi,%ecx
5f60   e17690:	80 e1 07             	and    $0x7,%cl
5f63   e17693:	80 c1 03             	add    $0x3,%cl
5f66   e17696:	38 c1                	cmp    %al,%cl
5f68   e17698:	0f 8c c5 c3 ff ff    	jl     e13a63 <fix_nodes+0x2333>
5f6e   e1769e:	e8 00 00 00 00       	call   e176a3 <fix_nodes+0x5f73>	e1769f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5f73   e176a3:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
5f7b   e176ab:	e9 b3 c3 ff ff       	jmp    e13a63 <fix_nodes+0x2333>
5f80   e176b0:	44 89 f1             	mov    %r14d,%ecx
5f83   e176b3:	80 e1 07             	and    $0x7,%cl
5f86   e176b6:	80 c1 01             	add    $0x1,%cl
5f89   e176b9:	38 c1                	cmp    %al,%cl
5f8b   e176bb:	0f 8c c1 c3 ff ff    	jl     e13a82 <fix_nodes+0x2352>
5f91   e176c1:	4c 89 f7             	mov    %r14,%rdi
5f94   e176c4:	e8 00 00 00 00       	call   e176c9 <fix_nodes+0x5f99>	e176c5: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5f99   e176c9:	e9 b4 c3 ff ff       	jmp    e13a82 <fix_nodes+0x2352>
5f9e   e176ce:	44 89 f9             	mov    %r15d,%ecx
5fa1   e176d1:	80 e1 07             	and    $0x7,%cl
5fa4   e176d4:	80 c1 03             	add    $0x3,%cl
5fa7   e176d7:	38 c1                	cmp    %al,%cl
5fa9   e176d9:	0f 8c b3 bc ff ff    	jl     e13392 <fix_nodes+0x1c62>
5faf   e176df:	4c 89 ff             	mov    %r15,%rdi
5fb2   e176e2:	e8 00 00 00 00       	call   e176e7 <fix_nodes+0x5fb7>	e176e3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5fb7   e176e7:	e9 a6 bc ff ff       	jmp    e13392 <fix_nodes+0x1c62>
5fbc   e176ec:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
5fc1   e176f1:	80 e1 07             	and    $0x7,%cl
5fc4   e176f4:	80 c1 01             	add    $0x1,%cl
5fc7   e176f7:	38 c1                	cmp    %al,%cl
5fc9   e176f9:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
5fce   e176fe:	0f 8c ac bc ff ff    	jl     e133b0 <fix_nodes+0x1c80>
5fd4   e17704:	e8 00 00 00 00       	call   e17709 <fix_nodes+0x5fd9>	e17705: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5fd9   e17709:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
5fde   e1770e:	e9 9d bc ff ff       	jmp    e133b0 <fix_nodes+0x1c80>
5fe3   e17713:	89 d1                	mov    %edx,%ecx
5fe5   e17715:	80 e1 07             	and    $0x7,%cl
5fe8   e17718:	80 c1 03             	add    $0x3,%cl
5feb   e1771b:	38 c1                	cmp    %al,%cl
5fed   e1771d:	0f 8c a4 c8 ff ff    	jl     e13fc7 <fix_nodes+0x2897>
5ff3   e17723:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
5ffb   e1772b:	e8 00 00 00 00       	call   e17730 <fix_nodes+0x6000>	e1772c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6000   e17730:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
6008   e17738:	e9 8a c8 ff ff       	jmp    e13fc7 <fix_nodes+0x2897>
600d   e1773d:	89 f9                	mov    %edi,%ecx
600f   e1773f:	80 e1 07             	and    $0x7,%cl
6012   e17742:	80 c1 03             	add    $0x3,%cl
6015   e17745:	38 c1                	cmp    %al,%cl
6017   e17747:	0f 8c a8 dc ff ff    	jl     e153f5 <fix_nodes+0x3cc5>
601d   e1774d:	e8 00 00 00 00       	call   e17752 <fix_nodes+0x6022>	e1774e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6022   e17752:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
602a   e1775a:	e9 96 dc ff ff       	jmp    e153f5 <fix_nodes+0x3cc5>
602f   e1775f:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
6034   e17764:	80 e1 07             	and    $0x7,%cl
6037   e17767:	80 c1 01             	add    $0x1,%cl
603a   e1776a:	38 c1                	cmp    %al,%cl
603c   e1776c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
6041   e17771:	0f 8c a9 dc ff ff    	jl     e15420 <fix_nodes+0x3cf0>
6047   e17777:	e8 00 00 00 00       	call   e1777c <fix_nodes+0x604c>	e17778: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
604c   e1777c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
6051   e17781:	e9 9a dc ff ff       	jmp    e15420 <fix_nodes+0x3cf0>
6056   e17786:	89 f9                	mov    %edi,%ecx
6058   e17788:	80 e1 07             	and    $0x7,%cl
605b   e1778b:	80 c1 03             	add    $0x3,%cl
605e   e1778e:	38 c1                	cmp    %al,%cl
6060   e17790:	0f 8c cb dc ff ff    	jl     e15461 <fix_nodes+0x3d31>
6066   e17796:	e8 00 00 00 00       	call   e1779b <fix_nodes+0x606b>	e17797: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
606b   e1779b:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
6073   e177a3:	e9 b9 dc ff ff       	jmp    e15461 <fix_nodes+0x3d31>
6078   e177a8:	89 f9                	mov    %edi,%ecx
607a   e177aa:	80 e1 07             	and    $0x7,%cl
607d   e177ad:	80 c1 03             	add    $0x3,%cl
6080   e177b0:	38 c1                	cmp    %al,%cl
6082   e177b2:	0f 8c e0 dc ff ff    	jl     e15498 <fix_nodes+0x3d68>
6088   e177b8:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
6090   e177c0:	e8 00 00 00 00       	call   e177c5 <fix_nodes+0x6095>	e177c1: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
6095   e177c5:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
609d   e177cd:	48 8b b4 24 b8 00 00 00 	mov    0xb8(%rsp),%rsi
60a5   e177d5:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
60aa   e177da:	e9 b9 dc ff ff       	jmp    e15498 <fix_nodes+0x3d68>
60af   e177df:	89 f1                	mov    %esi,%ecx
60b1   e177e1:	80 e1 07             	and    $0x7,%cl
60b4   e177e4:	80 c1 03             	add    $0x3,%cl
60b7   e177e7:	38 c1                	cmp    %al,%cl
60b9   e177e9:	0f 8c c3 dc ff ff    	jl     e154b2 <fix_nodes+0x3d82>
60bf   e177ef:	48 8b bc 24 b8 00 00 00 	mov    0xb8(%rsp),%rdi
60c7   e177f7:	e8 00 00 00 00       	call   e177fc <fix_nodes+0x60cc>	e177f8: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
60cc   e177fc:	48 8b b4 24 b8 00 00 00 	mov    0xb8(%rsp),%rsi
60d4   e17804:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
60d9   e17809:	e9 a4 dc ff ff       	jmp    e154b2 <fix_nodes+0x3d82>
60de   e1780e:	89 d9                	mov    %ebx,%ecx
60e0   e17810:	80 e1 07             	and    $0x7,%cl
60e3   e17813:	80 c1 03             	add    $0x3,%cl
60e6   e17816:	38 c1                	cmp    %al,%cl
60e8   e17818:	0f 8c b3 dc ff ff    	jl     e154d1 <fix_nodes+0x3da1>
60ee   e1781e:	48 89 df             	mov    %rbx,%rdi
60f1   e17821:	e8 00 00 00 00       	call   e17826 <fix_nodes+0x60f6>	e17822: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
60f6   e17826:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
60fb   e1782b:	e9 a1 dc ff ff       	jmp    e154d1 <fix_nodes+0x3da1>
6100   e17830:	89 d1                	mov    %edx,%ecx
6102   e17832:	80 e1 07             	and    $0x7,%cl
6105   e17835:	80 c1 03             	add    $0x3,%cl
6108   e17838:	38 c1                	cmp    %al,%cl
610a   e1783a:	0f 8c ab dc ff ff    	jl     e154eb <fix_nodes+0x3dbb>
6110   e17840:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
6115   e17845:	e8 00 00 00 00       	call   e1784a <fix_nodes+0x611a>	e17846: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
611a   e1784a:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
611f   e1784f:	e9 97 dc ff ff       	jmp    e154eb <fix_nodes+0x3dbb>
6124   e17854:	44 89 f1             	mov    %r14d,%ecx
6127   e17857:	80 e1 07             	and    $0x7,%cl
612a   e1785a:	80 c1 03             	add    $0x3,%cl
612d   e1785d:	38 c1                	cmp    %al,%cl
612f   e1785f:	0f 8c 62 c1 ff ff    	jl     e139c7 <fix_nodes+0x2297>
6135   e17865:	4c 89 f7             	mov    %r14,%rdi
6138   e17868:	e8 00 00 00 00       	call   e1786d <fix_nodes+0x613d>	e17869: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
613d   e1786d:	e9 55 c1 ff ff       	jmp    e139c7 <fix_nodes+0x2297>
6142   e17872:	89 d1                	mov    %edx,%ecx
6144   e17874:	80 e1 07             	and    $0x7,%cl
6147   e17877:	80 c1 03             	add    $0x3,%cl
614a   e1787a:	38 c1                	cmp    %al,%cl
614c   e1787c:	0f 8c 62 c1 ff ff    	jl     e139e4 <fix_nodes+0x22b4>
6152   e17882:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
6157   e17887:	e8 00 00 00 00       	call   e1788c <fix_nodes+0x615c>	e17888: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
615c   e1788c:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
6161   e17891:	e9 4e c1 ff ff       	jmp    e139e4 <fix_nodes+0x22b4>
6166   e17896:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
616b   e1789b:	80 e1 07             	and    $0x7,%cl
616e   e1789e:	80 c1 01             	add    $0x1,%cl
6171   e178a1:	38 c1                	cmp    %al,%cl
6173   e178a3:	0f 8c 50 c1 ff ff    	jl     e139f9 <fix_nodes+0x22c9>
6179   e178a9:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
617e   e178ae:	e8 00 00 00 00       	call   e178b3 <fix_nodes+0x6183>	e178af: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6183   e178b3:	e9 41 c1 ff ff       	jmp    e139f9 <fix_nodes+0x22c9>
6188   e178b8:	e8 00 00 00 00       	call   e178bd <fix_nodes+0x618d>	e178b9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
618d   e178bd:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e178c0: R_X86_64_32S	.data+0x66e710
6194   e178c4:	48 89 de             	mov    %rbx,%rsi
6197   e178c7:	e8 00 00 00 00       	call   e178cc <fix_nodes+0x619c>	e178c8: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
619c   e178cc:	e9 e6 b0 ff ff       	jmp    e129b7 <fix_nodes+0x1287>
61a1   e178d1:	e8 00 00 00 00       	call   e178d6 <fix_nodes+0x61a6>	e178d2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
61a6   e178d6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e178d9: R_X86_64_32S	.data+0x66e730
61ad   e178dd:	48 89 de             	mov    %rbx,%rsi
61b0   e178e0:	e8 00 00 00 00       	call   e178e5 <fix_nodes+0x61b5>	e178e1: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
61b5   e178e5:	e9 57 b1 ff ff       	jmp    e12a41 <fix_nodes+0x1311>
61ba   e178ea:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
61bf   e178ef:	80 e1 07             	and    $0x7,%cl
61c2   e178f2:	80 c1 03             	add    $0x3,%cl
61c5   e178f5:	38 c1                	cmp    %al,%cl
61c7   e178f7:	0f 8c e0 c1 ff ff    	jl     e13add <fix_nodes+0x23ad>
61cd   e178fd:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
61d2   e17902:	e8 00 00 00 00       	call   e17907 <fix_nodes+0x61d7>	e17903: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
61d7   e17907:	e9 d1 c1 ff ff       	jmp    e13add <fix_nodes+0x23ad>
61dc   e1790c:	89 d9                	mov    %ebx,%ecx
61de   e1790e:	80 e1 07             	and    $0x7,%cl
61e1   e17911:	80 c1 01             	add    $0x1,%cl
61e4   e17914:	38 c1                	cmp    %al,%cl
61e6   e17916:	0f 8c e0 c1 ff ff    	jl     e13afc <fix_nodes+0x23cc>
61ec   e1791c:	48 89 df             	mov    %rbx,%rdi
61ef   e1791f:	e8 00 00 00 00       	call   e17924 <fix_nodes+0x61f4>	e17920: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
61f4   e17924:	e9 d3 c1 ff ff       	jmp    e13afc <fix_nodes+0x23cc>
61f9   e17929:	89 d1                	mov    %edx,%ecx
61fb   e1792b:	80 e1 07             	and    $0x7,%cl
61fe   e1792e:	80 c1 03             	add    $0x3,%cl
6201   e17931:	38 c1                	cmp    %al,%cl
6203   e17933:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
6208   e17938:	0f 8c ce de ff ff    	jl     e1580c <fix_nodes+0x40dc>
620e   e1793e:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
6216   e17946:	e8 00 00 00 00       	call   e1794b <fix_nodes+0x621b>	e17947: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
621b   e1794b:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
6220   e17950:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
6228   e17958:	e9 af de ff ff       	jmp    e1580c <fix_nodes+0x40dc>
622d   e1795d:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
6232   e17962:	80 e1 07             	and    $0x7,%cl
6235   e17965:	80 c1 01             	add    $0x1,%cl
6238   e17968:	38 c1                	cmp    %al,%cl
623a   e1796a:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
623f   e1796f:	0f 8c a7 de ff ff    	jl     e1581c <fix_nodes+0x40ec>
6245   e17975:	e8 00 00 00 00       	call   e1797a <fix_nodes+0x624a>	e17976: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
624a   e1797a:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
624f   e1797f:	e9 98 de ff ff       	jmp    e1581c <fix_nodes+0x40ec>
6254   e17984:	89 f9                	mov    %edi,%ecx
6256   e17986:	80 e1 07             	and    $0x7,%cl
6259   e17989:	80 c1 01             	add    $0x1,%cl
625c   e1798c:	38 c1                	cmp    %al,%cl
625e   e1798e:	0f 8c 75 d5 ff ff    	jl     e14f09 <fix_nodes+0x37d9>
6264   e17994:	49 89 d5             	mov    %rdx,%r13
6267   e17997:	e8 00 00 00 00       	call   e1799c <fix_nodes+0x626c>	e17998: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
626c   e1799c:	4c 89 ea             	mov    %r13,%rdx
626f   e1799f:	e9 65 d5 ff ff       	jmp    e14f09 <fix_nodes+0x37d9>
6274   e179a4:	89 d9                	mov    %ebx,%ecx
6276   e179a6:	80 e1 07             	and    $0x7,%cl
6279   e179a9:	80 c1 01             	add    $0x1,%cl
627c   e179ac:	38 c1                	cmp    %al,%cl
627e   e179ae:	0f 8c 7f d5 ff ff    	jl     e14f33 <fix_nodes+0x3803>
6284   e179b4:	48 89 df             	mov    %rbx,%rdi
6287   e179b7:	49 89 d6             	mov    %rdx,%r14
628a   e179ba:	e8 00 00 00 00       	call   e179bf <fix_nodes+0x628f>	e179bb: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
628f   e179bf:	4c 89 f2             	mov    %r14,%rdx
6292   e179c2:	e9 6c d5 ff ff       	jmp    e14f33 <fix_nodes+0x3803>
6297   e179c7:	89 f9                	mov    %edi,%ecx
6299   e179c9:	80 e1 07             	and    $0x7,%cl
629c   e179cc:	80 c1 01             	add    $0x1,%cl
629f   e179cf:	38 c1                	cmp    %al,%cl
62a1   e179d1:	0f 8c b6 d7 ff ff    	jl     e1518d <fix_nodes+0x3a5d>
62a7   e179d7:	e8 00 00 00 00       	call   e179dc <fix_nodes+0x62ac>	e179d8: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
62ac   e179dc:	e9 ac d7 ff ff       	jmp    e1518d <fix_nodes+0x3a5d>
62b1   e179e1:	89 d9                	mov    %ebx,%ecx
62b3   e179e3:	80 e1 07             	and    $0x7,%cl
62b6   e179e6:	80 c1 01             	add    $0x1,%cl
62b9   e179e9:	38 c1                	cmp    %al,%cl
62bb   e179eb:	0f 8c ca d7 ff ff    	jl     e151bb <fix_nodes+0x3a8b>
62c1   e179f1:	48 89 df             	mov    %rbx,%rdi
62c4   e179f4:	e8 00 00 00 00       	call   e179f9 <fix_nodes+0x62c9>	e179f5: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
62c9   e179f9:	e9 bd d7 ff ff       	jmp    e151bb <fix_nodes+0x3a8b>
62ce   e179fe:	89 d9                	mov    %ebx,%ecx
62d0   e17a00:	80 e1 07             	and    $0x7,%cl
62d3   e17a03:	80 c1 01             	add    $0x1,%cl
62d6   e17a06:	38 c1                	cmp    %al,%cl
62d8   e17a08:	0f 8c 9b dc ff ff    	jl     e156a9 <fix_nodes+0x3f79>
62de   e17a0e:	48 89 df             	mov    %rbx,%rdi
62e1   e17a11:	e8 00 00 00 00       	call   e17a16 <fix_nodes+0x62e6>	e17a12: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
62e6   e17a16:	e9 8e dc ff ff       	jmp    e156a9 <fix_nodes+0x3f79>
62eb   e17a1b:	89 d9                	mov    %ebx,%ecx
62ed   e17a1d:	80 e1 07             	and    $0x7,%cl
62f0   e17a20:	38 c1                	cmp    %al,%cl
62f2   e17a22:	0f 8c f9 bc ff ff    	jl     e13721 <fix_nodes+0x1ff1>
62f8   e17a28:	be 04 00 00 00       	mov    $0x4,%esi
62fd   e17a2d:	48 89 df             	mov    %rbx,%rdi
6300   e17a30:	e8 00 00 00 00       	call   e17a35 <fix_nodes+0x6305>	e17a31: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
6305   e17a35:	e9 e7 bc ff ff       	jmp    e13721 <fix_nodes+0x1ff1>
630a   e17a3a:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
6312   e17a42:	80 e1 07             	and    $0x7,%cl
6315   e17a45:	38 c1                	cmp    %al,%cl
6317   e17a47:	0f 8c e1 bc ff ff    	jl     e1372e <fix_nodes+0x1ffe>
631d   e17a4d:	be 04 00 00 00       	mov    $0x4,%esi
6322   e17a52:	48 8b bc 24 a0 00 00 00 	mov    0xa0(%rsp),%rdi
632a   e17a5a:	e8 00 00 00 00       	call   e17a5f <fix_nodes+0x632f>	e17a5b: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
632f   e17a5f:	e9 ca bc ff ff       	jmp    e1372e <fix_nodes+0x1ffe>
6334   e17a64:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
6339   e17a69:	80 e1 07             	and    $0x7,%cl
633c   e17a6c:	80 c1 03             	add    $0x3,%cl
633f   e17a6f:	38 c1                	cmp    %al,%cl
6341   e17a71:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
6346   e17a76:	0f 8c 5a c7 ff ff    	jl     e141d6 <fix_nodes+0x2aa6>
634c   e17a7c:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
6351   e17a81:	e8 00 00 00 00       	call   e17a86 <fix_nodes+0x6356>	e17a82: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6356   e17a86:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
635b   e17a8b:	e9 46 c7 ff ff       	jmp    e141d6 <fix_nodes+0x2aa6>
6360   e17a90:	44 89 f9             	mov    %r15d,%ecx
6363   e17a93:	80 e1 07             	and    $0x7,%cl
6366   e17a96:	80 c1 03             	add    $0x3,%cl
6369   e17a99:	38 c1                	cmp    %al,%cl
636b   e17a9b:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
6370   e17aa0:	0f 8c 56 c7 ff ff    	jl     e141fc <fix_nodes+0x2acc>
6376   e17aa6:	4c 89 ff             	mov    %r15,%rdi
6379   e17aa9:	e8 00 00 00 00       	call   e17aae <fix_nodes+0x637e>	e17aaa: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
637e   e17aae:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
6383   e17ab3:	e9 44 c7 ff ff       	jmp    e141fc <fix_nodes+0x2acc>
6388   e17ab8:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
638d   e17abd:	80 e1 07             	and    $0x7,%cl
6390   e17ac0:	80 c1 01             	add    $0x1,%cl
6393   e17ac3:	38 c1                	cmp    %al,%cl
6395   e17ac5:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
639a   e17aca:	0f 8c 45 c7 ff ff    	jl     e14215 <fix_nodes+0x2ae5>
63a0   e17ad0:	e8 00 00 00 00       	call   e17ad5 <fix_nodes+0x63a5>	e17ad1: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
63a5   e17ad5:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
63aa   e17ada:	e9 36 c7 ff ff       	jmp    e14215 <fix_nodes+0x2ae5>
63af   e17adf:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
63b4   e17ae4:	80 e1 07             	and    $0x7,%cl
63b7   e17ae7:	80 c1 03             	add    $0x3,%cl
63ba   e17aea:	38 c1                	cmp    %al,%cl
63bc   e17aec:	0f 8c 55 c7 ff ff    	jl     e14247 <fix_nodes+0x2b17>
63c2   e17af2:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
63c7   e17af7:	e8 00 00 00 00       	call   e17afc <fix_nodes+0x63cc>	e17af8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
63cc   e17afc:	e9 46 c7 ff ff       	jmp    e14247 <fix_nodes+0x2b17>
63d1   e17b01:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
63d6   e17b06:	80 e1 07             	and    $0x7,%cl
63d9   e17b09:	80 c1 01             	add    $0x1,%cl
63dc   e17b0c:	38 c1                	cmp    %al,%cl
63de   e17b0e:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
63e3   e17b13:	0f 8c 4e c7 ff ff    	jl     e14267 <fix_nodes+0x2b37>
63e9   e17b19:	e8 00 00 00 00       	call   e17b1e <fix_nodes+0x63ee>	e17b1a: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
63ee   e17b1e:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
63f3   e17b23:	e9 3f c7 ff ff       	jmp    e14267 <fix_nodes+0x2b37>
63f8   e17b28:	89 f9                	mov    %edi,%ecx
63fa   e17b2a:	80 e1 07             	and    $0x7,%cl
63fd   e17b2d:	80 c1 03             	add    $0x3,%cl
6400   e17b30:	38 c1                	cmp    %al,%cl
6402   e17b32:	0f 8c 3a c5 ff ff    	jl     e14072 <fix_nodes+0x2942>
6408   e17b38:	e8 00 00 00 00       	call   e17b3d <fix_nodes+0x640d>	e17b39: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
640d   e17b3d:	48 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%rdi
6415   e17b45:	e9 28 c5 ff ff       	jmp    e14072 <fix_nodes+0x2942>
641a   e17b4a:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
641f   e17b4f:	80 e1 07             	and    $0x7,%cl
6422   e17b52:	80 c1 01             	add    $0x1,%cl
6425   e17b55:	38 c1                	cmp    %al,%cl
6427   e17b57:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
642c   e17b5c:	0f 8c 26 c5 ff ff    	jl     e14088 <fix_nodes+0x2958>
6432   e17b62:	e8 00 00 00 00       	call   e17b67 <fix_nodes+0x6437>	e17b63: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6437   e17b67:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
643c   e17b6c:	e9 17 c5 ff ff       	jmp    e14088 <fix_nodes+0x2958>
6441   e17b71:	e8 00 00 00 00       	call   e17b76 <fix_nodes+0x6446>	e17b72: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6446   e17b76:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e17b79: R_X86_64_32S	.data+0x66e350
644d   e17b7d:	48 89 de             	mov    %rbx,%rsi
6450   e17b80:	e8 00 00 00 00       	call   e17b85 <fix_nodes+0x6455>	e17b81: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
6455   e17b85:	e9 9e b0 ff ff       	jmp    e12c28 <fix_nodes+0x14f8>
645a   e17b8a:	89 d9                	mov    %ebx,%ecx
645c   e17b8c:	80 e1 07             	and    $0x7,%cl
645f   e17b8f:	80 c1 03             	add    $0x3,%cl
6462   e17b92:	38 c1                	cmp    %al,%cl
6464   e17b94:	0f 8c ec c3 ff ff    	jl     e13f86 <fix_nodes+0x2856>
646a   e17b9a:	48 89 df             	mov    %rbx,%rdi
646d   e17b9d:	e8 00 00 00 00       	call   e17ba2 <fix_nodes+0x6472>	e17b9e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6472   e17ba2:	e9 df c3 ff ff       	jmp    e13f86 <fix_nodes+0x2856>
6477   e17ba7:	44 89 f1             	mov    %r14d,%ecx
647a   e17baa:	80 e1 07             	and    $0x7,%cl
647d   e17bad:	80 c1 03             	add    $0x3,%cl
6480   e17bb0:	38 c1                	cmp    %al,%cl
6482   e17bb2:	0f 8c 2e ba ff ff    	jl     e135e6 <fix_nodes+0x1eb6>
6488   e17bb8:	4c 89 f7             	mov    %r14,%rdi
648b   e17bbb:	e8 00 00 00 00       	call   e17bc0 <fix_nodes+0x6490>	e17bbc: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6490   e17bc0:	e9 21 ba ff ff       	jmp    e135e6 <fix_nodes+0x1eb6>
6495   e17bc5:	89 d1                	mov    %edx,%ecx
6497   e17bc7:	80 e1 07             	and    $0x7,%cl
649a   e17bca:	80 c1 03             	add    $0x3,%cl
649d   e17bcd:	38 c1                	cmp    %al,%cl
649f   e17bcf:	0f 8c e2 c6 ff ff    	jl     e142b7 <fix_nodes+0x2b87>
64a5   e17bd5:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
64aa   e17bda:	e8 00 00 00 00       	call   e17bdf <fix_nodes+0x64af>	e17bdb: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
64af   e17bdf:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
64b4   e17be4:	e9 ce c6 ff ff       	jmp    e142b7 <fix_nodes+0x2b87>
64b9   e17be9:	e8 00 00 00 00       	call   e17bee <fix_nodes+0x64be>	e17bea: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
64be   e17bee:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e17bf1: R_X86_64_32S	.data+0x66e7d0
64c5   e17bf5:	48 89 de             	mov    %rbx,%rsi
64c8   e17bf8:	e8 00 00 00 00       	call   e17bfd <fix_nodes+0x64cd>	e17bf9: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
64cd   e17bfd:	e9 4c b1 ff ff       	jmp    e12d4e <fix_nodes+0x161e>
64d2   e17c02:	e8 00 00 00 00       	call   e17c07 <fix_nodes+0x64d7>	e17c03: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
64d7   e17c07:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e17c0a: R_X86_64_32S	.data+0x66e7f0
64de   e17c0e:	48 89 de             	mov    %rbx,%rsi
64e1   e17c11:	e8 00 00 00 00       	call   e17c16 <fix_nodes+0x64e6>	e17c12: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
64e6   e17c16:	e9 c5 b1 ff ff       	jmp    e12de0 <fix_nodes+0x16b0>
64eb   e17c1b:	89 d9                	mov    %ebx,%ecx
64ed   e17c1d:	80 e1 07             	and    $0x7,%cl
64f0   e17c20:	80 c1 03             	add    $0x3,%cl
64f3   e17c23:	38 c1                	cmp    %al,%cl
64f5   e17c25:	0f 8c 99 db ff ff    	jl     e157c4 <fix_nodes+0x4094>
64fb   e17c2b:	48 89 df             	mov    %rbx,%rdi
64fe   e17c2e:	e8 00 00 00 00       	call   e17c33 <fix_nodes+0x6503>	e17c2f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6503   e17c33:	e9 8c db ff ff       	jmp    e157c4 <fix_nodes+0x4094>
6508   e17c38:	89 d9                	mov    %ebx,%ecx
650a   e17c3a:	80 e1 07             	and    $0x7,%cl
650d   e17c3d:	80 c1 01             	add    $0x1,%cl
6510   e17c40:	38 c1                	cmp    %al,%cl
6512   e17c42:	0f 8c 22 d4 ff ff    	jl     e1506a <fix_nodes+0x393a>
6518   e17c48:	48 89 df             	mov    %rbx,%rdi
651b   e17c4b:	e8 00 00 00 00       	call   e17c50 <fix_nodes+0x6520>	e17c4c: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6520   e17c50:	e9 15 d4 ff ff       	jmp    e1506a <fix_nodes+0x393a>
6525   e17c55:	44 89 f1             	mov    %r14d,%ecx
6528   e17c58:	80 e1 07             	and    $0x7,%cl
652b   e17c5b:	80 c1 03             	add    $0x3,%cl
652e   e17c5e:	38 c1                	cmp    %al,%cl
6530   e17c60:	0f 8c ef e9 ff ff    	jl     e16655 <fix_nodes+0x4f25>
6536   e17c66:	4c 89 f7             	mov    %r14,%rdi
6539   e17c69:	e8 00 00 00 00       	call   e17c6e <fix_nodes+0x653e>	e17c6a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
653e   e17c6e:	e9 e2 e9 ff ff       	jmp    e16655 <fix_nodes+0x4f25>
6543   e17c73:	89 d9                	mov    %ebx,%ecx
6545   e17c75:	80 e1 07             	and    $0x7,%cl
6548   e17c78:	80 c1 03             	add    $0x3,%cl
654b   e17c7b:	38 c1                	cmp    %al,%cl
654d   e17c7d:	0f 8c 1e ea ff ff    	jl     e166a1 <fix_nodes+0x4f71>
6553   e17c83:	48 89 df             	mov    %rbx,%rdi
6556   e17c86:	e8 00 00 00 00       	call   e17c8b <fix_nodes+0x655b>	e17c87: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
655b   e17c8b:	e9 11 ea ff ff       	jmp    e166a1 <fix_nodes+0x4f71>
6560   e17c90:	89 f9                	mov    %edi,%ecx
6562   e17c92:	80 e1 07             	and    $0x7,%cl
6565   e17c95:	80 c1 01             	add    $0x1,%cl
6568   e17c98:	38 c1                	cmp    %al,%cl
656a   e17c9a:	0f 8c dd ea ff ff    	jl     e1677d <fix_nodes+0x504d>
6570   e17ca0:	e8 00 00 00 00       	call   e17ca5 <fix_nodes+0x6575>	e17ca1: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6575   e17ca5:	e9 d3 ea ff ff       	jmp    e1677d <fix_nodes+0x504d>
657a   e17caa:	89 d9                	mov    %ebx,%ecx
657c   e17cac:	80 e1 07             	and    $0x7,%cl
657f   e17caf:	80 c1 01             	add    $0x1,%cl
6582   e17cb2:	38 c1                	cmp    %al,%cl
6584   e17cb4:	0f 8c ed ea ff ff    	jl     e167a7 <fix_nodes+0x5077>
658a   e17cba:	48 89 df             	mov    %rbx,%rdi
658d   e17cbd:	e8 00 00 00 00       	call   e17cc2 <fix_nodes+0x6592>	e17cbe: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6592   e17cc2:	e9 e0 ea ff ff       	jmp    e167a7 <fix_nodes+0x5077>
6597   e17cc7:	89 d1                	mov    %edx,%ecx
6599   e17cc9:	80 e1 07             	and    $0x7,%cl
659c   e17ccc:	80 c1 03             	add    $0x3,%cl
659f   e17ccf:	38 c1                	cmp    %al,%cl
65a1   e17cd1:	0f 8c 57 da ff ff    	jl     e1572e <fix_nodes+0x3ffe>
65a7   e17cd7:	48 8b bc 24 38 01 00 00 	mov    0x138(%rsp),%rdi
65af   e17cdf:	e8 00 00 00 00       	call   e17ce4 <fix_nodes+0x65b4>	e17ce0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
65b4   e17ce4:	48 8b 94 24 38 01 00 00 	mov    0x138(%rsp),%rdx
65bc   e17cec:	e9 3d da ff ff       	jmp    e1572e <fix_nodes+0x3ffe>
65c1   e17cf1:	48 8b 8c 24 b0 00 00 00 	mov    0xb0(%rsp),%rcx
65c9   e17cf9:	80 e1 07             	and    $0x7,%cl
65cc   e17cfc:	80 c1 03             	add    $0x3,%cl
65cf   e17cff:	38 c1                	cmp    %al,%cl
65d1   e17d01:	0f 8c 55 be ff ff    	jl     e13b5c <fix_nodes+0x242c>
65d7   e17d07:	48 8b bc 24 b0 00 00 00 	mov    0xb0(%rsp),%rdi
65df   e17d0f:	49 89 d6             	mov    %rdx,%r14
65e2   e17d12:	e8 00 00 00 00       	call   e17d17 <fix_nodes+0x65e7>	e17d13: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
65e7   e17d17:	4c 89 f2             	mov    %r14,%rdx
65ea   e17d1a:	e9 3d be ff ff       	jmp    e13b5c <fix_nodes+0x242c>
65ef   e17d1f:	89 f1                	mov    %esi,%ecx
65f1   e17d21:	80 e1 07             	and    $0x7,%cl
65f4   e17d24:	80 c1 03             	add    $0x3,%cl
65f7   e17d27:	38 c1                	cmp    %al,%cl
65f9   e17d29:	0f 8c 5c be ff ff    	jl     e13b8b <fix_nodes+0x245b>
65ff   e17d2f:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
6604   e17d34:	49 89 d5             	mov    %rdx,%r13
6607   e17d37:	e8 00 00 00 00       	call   e17d3c <fix_nodes+0x660c>	e17d38: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
660c   e17d3c:	4c 89 ea             	mov    %r13,%rdx
660f   e17d3f:	48 8b 74 24 60       	mov    0x60(%rsp),%rsi
6614   e17d44:	e9 42 be ff ff       	jmp    e13b8b <fix_nodes+0x245b>
6619   e17d49:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
661e   e17d4e:	80 e1 07             	and    $0x7,%cl
6621   e17d51:	80 c1 01             	add    $0x1,%cl
6624   e17d54:	38 c1                	cmp    %al,%cl
6626   e17d56:	0f 8c 45 be ff ff    	jl     e13ba1 <fix_nodes+0x2471>
662c   e17d5c:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
6631   e17d61:	49 89 d5             	mov    %rdx,%r13
6634   e17d64:	e8 00 00 00 00       	call   e17d69 <fix_nodes+0x6639>	e17d65: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6639   e17d69:	4c 89 ea             	mov    %r13,%rdx
663c   e17d6c:	e9 30 be ff ff       	jmp    e13ba1 <fix_nodes+0x2471>
6641   e17d71:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
6646   e17d76:	80 e1 07             	and    $0x7,%cl
6649   e17d79:	80 c1 01             	add    $0x1,%cl
664c   e17d7c:	38 c1                	cmp    %al,%cl
664e   e17d7e:	0f 8c 33 be ff ff    	jl     e13bb7 <fix_nodes+0x2487>
6654   e17d84:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
6659   e17d89:	49 89 d5             	mov    %rdx,%r13
665c   e17d8c:	e8 00 00 00 00       	call   e17d91 <fix_nodes+0x6661>	e17d8d: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6661   e17d91:	4c 89 ea             	mov    %r13,%rdx
6664   e17d94:	e9 1e be ff ff       	jmp    e13bb7 <fix_nodes+0x2487>
6669   e17d99:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
666e   e17d9e:	80 e1 07             	and    $0x7,%cl
6671   e17da1:	80 c1 01             	add    $0x1,%cl
6674   e17da4:	38 c1                	cmp    %al,%cl
6676   e17da6:	0f 8c 49 be ff ff    	jl     e13bf5 <fix_nodes+0x24c5>
667c   e17dac:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
6681   e17db1:	e8 00 00 00 00       	call   e17db6 <fix_nodes+0x6686>	e17db2: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6686   e17db6:	e9 3a be ff ff       	jmp    e13bf5 <fix_nodes+0x24c5>
668b   e17dbb:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
6690   e17dc0:	80 e1 07             	and    $0x7,%cl
6693   e17dc3:	80 c1 01             	add    $0x1,%cl
6696   e17dc6:	38 c1                	cmp    %al,%cl
6698   e17dc8:	0f 8c 41 be ff ff    	jl     e13c0f <fix_nodes+0x24df>
669e   e17dce:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
66a3   e17dd3:	e8 00 00 00 00       	call   e17dd8 <fix_nodes+0x66a8>	e17dd4: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
66a8   e17dd8:	e9 32 be ff ff       	jmp    e13c0f <fix_nodes+0x24df>
66ad   e17ddd:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
66b2   e17de2:	80 e1 07             	and    $0x7,%cl
66b5   e17de5:	80 c1 01             	add    $0x1,%cl
66b8   e17de8:	38 c1                	cmp    %al,%cl
66ba   e17dea:	0f 8c 67 be ff ff    	jl     e13c57 <fix_nodes+0x2527>
66c0   e17df0:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
66c5   e17df5:	e8 00 00 00 00       	call   e17dfa <fix_nodes+0x66ca>	e17df6: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
66ca   e17dfa:	e9 58 be ff ff       	jmp    e13c57 <fix_nodes+0x2527>
66cf   e17dff:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
66d4   e17e04:	80 e1 07             	and    $0x7,%cl
66d7   e17e07:	80 c1 01             	add    $0x1,%cl
66da   e17e0a:	38 c1                	cmp    %al,%cl
66dc   e17e0c:	0f 8c 5f be ff ff    	jl     e13c71 <fix_nodes+0x2541>
66e2   e17e12:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
66e7   e17e17:	e8 00 00 00 00       	call   e17e1c <fix_nodes+0x66ec>	e17e18: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
66ec   e17e1c:	e9 50 be ff ff       	jmp    e13c71 <fix_nodes+0x2541>
66f1   e17e21:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
66f6   e17e26:	80 e1 07             	and    $0x7,%cl
66f9   e17e29:	80 c1 01             	add    $0x1,%cl
66fc   e17e2c:	38 c1                	cmp    %al,%cl
66fe   e17e2e:	0f 8c 8c be ff ff    	jl     e13cc0 <fix_nodes+0x2590>
6704   e17e34:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
6709   e17e39:	e8 00 00 00 00       	call   e17e3e <fix_nodes+0x670e>	e17e3a: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
670e   e17e3e:	e9 7d be ff ff       	jmp    e13cc0 <fix_nodes+0x2590>
6713   e17e43:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
6718   e17e48:	80 e1 07             	and    $0x7,%cl
671b   e17e4b:	80 c1 01             	add    $0x1,%cl
671e   e17e4e:	38 c1                	cmp    %al,%cl
6720   e17e50:	0f 8c 91 be ff ff    	jl     e13ce7 <fix_nodes+0x25b7>
6726   e17e56:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
672b   e17e5b:	e8 00 00 00 00       	call   e17e60 <fix_nodes+0x6730>	e17e5c: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6730   e17e60:	e9 82 be ff ff       	jmp    e13ce7 <fix_nodes+0x25b7>
6735   e17e65:	89 d1                	mov    %edx,%ecx
6737   e17e67:	80 e1 07             	and    $0x7,%cl
673a   e17e6a:	80 c1 03             	add    $0x3,%cl
673d   e17e6d:	38 c1                	cmp    %al,%cl
673f   e17e6f:	0f 8c f1 d9 ff ff    	jl     e15866 <fix_nodes+0x4136>
6745   e17e75:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
674a   e17e7a:	e8 00 00 00 00       	call   e17e7f <fix_nodes+0x674f>	e17e7b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
674f   e17e7f:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
6754   e17e84:	e9 dd d9 ff ff       	jmp    e15866 <fix_nodes+0x4136>
6759   e17e89:	e8 00 00 00 00       	call   e17e8e <fix_nodes+0x675e>	e17e8a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
675e   e17e8e:	e9 e1 db ff ff       	jmp    e15a74 <fix_nodes+0x4344>
6763   e17e93:	44 89 f1             	mov    %r14d,%ecx
6766   e17e96:	80 e1 07             	and    $0x7,%cl
6769   e17e99:	80 c1 03             	add    $0x3,%cl
676c   e17e9c:	38 c1                	cmp    %al,%cl
676e   e17e9e:	0f 8c 41 c2 ff ff    	jl     e140e5 <fix_nodes+0x29b5>
6774   e17ea4:	4c 89 f7             	mov    %r14,%rdi
6777   e17ea7:	e8 00 00 00 00       	call   e17eac <fix_nodes+0x677c>	e17ea8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
677c   e17eac:	e9 34 c2 ff ff       	jmp    e140e5 <fix_nodes+0x29b5>
6781   e17eb1:	89 d9                	mov    %ebx,%ecx
6783   e17eb3:	80 e1 07             	and    $0x7,%cl
6786   e17eb6:	80 c1 03             	add    $0x3,%cl
6789   e17eb9:	38 c1                	cmp    %al,%cl
678b   e17ebb:	0f 8c 70 c2 ff ff    	jl     e14131 <fix_nodes+0x2a01>
6791   e17ec1:	48 89 df             	mov    %rbx,%rdi
6794   e17ec4:	e8 00 00 00 00       	call   e17ec9 <fix_nodes+0x6799>	e17ec5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6799   e17ec9:	e9 63 c2 ff ff       	jmp    e14131 <fix_nodes+0x2a01>
679e   e17ece:	89 d9                	mov    %ebx,%ecx
67a0   e17ed0:	80 e1 07             	and    $0x7,%cl
67a3   e17ed3:	80 c1 01             	add    $0x1,%cl
67a6   e17ed6:	38 c1                	cmp    %al,%cl
67a8   e17ed8:	0f 8c 90 c2 ff ff    	jl     e1416e <fix_nodes+0x2a3e>
67ae   e17ede:	48 89 df             	mov    %rbx,%rdi
67b1   e17ee1:	e8 00 00 00 00       	call   e17ee6 <fix_nodes+0x67b6>	e17ee2: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
67b6   e17ee6:	e9 83 c2 ff ff       	jmp    e1416e <fix_nodes+0x2a3e>
67bb   e17eeb:	48 8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%rcx
67c3   e17ef3:	80 e1 07             	and    $0x7,%cl
67c6   e17ef6:	80 c1 03             	add    $0x3,%cl
67c9   e17ef9:	38 c1                	cmp    %al,%cl
67cb   e17efb:	0f 8c 65 ce ff ff    	jl     e14d66 <fix_nodes+0x3636>
67d1   e17f01:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
67d9   e17f09:	e8 00 00 00 00       	call   e17f0e <fix_nodes+0x67de>	e17f0a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
67de   e17f0e:	e9 53 ce ff ff       	jmp    e14d66 <fix_nodes+0x3636>
67e3   e17f13:	89 f9                	mov    %edi,%ecx
67e5   e17f15:	80 e1 07             	and    $0x7,%cl
67e8   e17f18:	80 c1 01             	add    $0x1,%cl
67eb   e17f1b:	38 c1                	cmp    %al,%cl
67ed   e17f1d:	0f 8c 8e de ff ff    	jl     e15db1 <fix_nodes+0x4681>
67f3   e17f23:	e8 00 00 00 00       	call   e17f28 <fix_nodes+0x67f8>	e17f24: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
67f8   e17f28:	e9 84 de ff ff       	jmp    e15db1 <fix_nodes+0x4681>
67fd   e17f2d:	44 89 f1             	mov    %r14d,%ecx
6800   e17f30:	80 e1 07             	and    $0x7,%cl
6803   e17f33:	80 c1 03             	add    $0x3,%cl
6806   e17f36:	38 c1                	cmp    %al,%cl
6808   e17f38:	0f 8c fe ce ff ff    	jl     e14e3c <fix_nodes+0x370c>
680e   e17f3e:	4c 89 f7             	mov    %r14,%rdi
6811   e17f41:	e8 00 00 00 00       	call   e17f46 <fix_nodes+0x6816>	e17f42: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6816   e17f46:	e9 f1 ce ff ff       	jmp    e14e3c <fix_nodes+0x370c>
681b   e17f4b:	44 89 f1             	mov    %r14d,%ecx
681e   e17f4e:	80 e1 07             	and    $0x7,%cl
6821   e17f51:	80 c1 03             	add    $0x3,%cl
6824   e17f54:	38 c1                	cmp    %al,%cl
6826   e17f56:	0f 8c 2d cf ff ff    	jl     e14e89 <fix_nodes+0x3759>
682c   e17f5c:	4c 89 f7             	mov    %r14,%rdi
682f   e17f5f:	e8 00 00 00 00       	call   e17f64 <fix_nodes+0x6834>	e17f60: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6834   e17f64:	e9 20 cf ff ff       	jmp    e14e89 <fix_nodes+0x3759>
6839   e17f69:	44 89 f1             	mov    %r14d,%ecx
683c   e17f6c:	80 e1 07             	and    $0x7,%cl
683f   e17f6f:	80 c1 03             	add    $0x3,%cl
6842   e17f72:	38 c1                	cmp    %al,%cl
6844   e17f74:	0f 8c 53 d1 ff ff    	jl     e150cd <fix_nodes+0x399d>
684a   e17f7a:	4c 89 f7             	mov    %r14,%rdi
684d   e17f7d:	e8 00 00 00 00       	call   e17f82 <fix_nodes+0x6852>	e17f7e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6852   e17f82:	e9 46 d1 ff ff       	jmp    e150cd <fix_nodes+0x399d>
6857   e17f87:	44 89 f1             	mov    %r14d,%ecx
685a   e17f8a:	80 e1 07             	and    $0x7,%cl
685d   e17f8d:	80 c1 03             	add    $0x3,%cl
6860   e17f90:	38 c1                	cmp    %al,%cl
6862   e17f92:	0f 8c 82 d1 ff ff    	jl     e1511a <fix_nodes+0x39ea>
6868   e17f98:	4c 89 f7             	mov    %r14,%rdi
686b   e17f9b:	e8 00 00 00 00       	call   e17fa0 <fix_nodes+0x6870>	e17f9c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6870   e17fa0:	e9 75 d1 ff ff       	jmp    e1511a <fix_nodes+0x39ea>
6875   e17fa5:	44 89 f1             	mov    %r14d,%ecx
6878   e17fa8:	80 e1 07             	and    $0x7,%cl
687b   e17fab:	80 c1 03             	add    $0x3,%cl
687e   e17fae:	38 c1                	cmp    %al,%cl
6880   e17fb0:	0f 8c bb be ff ff    	jl     e13e71 <fix_nodes+0x2741>
6886   e17fb6:	4c 89 f7             	mov    %r14,%rdi
6889   e17fb9:	e8 00 00 00 00       	call   e17fbe <fix_nodes+0x688e>	e17fba: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
688e   e17fbe:	e9 ae be ff ff       	jmp    e13e71 <fix_nodes+0x2741>
6893   e17fc3:	89 d9                	mov    %ebx,%ecx
6895   e17fc5:	80 e1 07             	and    $0x7,%cl
6898   e17fc8:	80 c1 03             	add    $0x3,%cl
689b   e17fcb:	38 c1                	cmp    %al,%cl
689d   e17fcd:	0f 8c b5 be ff ff    	jl     e13e88 <fix_nodes+0x2758>
68a3   e17fd3:	48 89 df             	mov    %rbx,%rdi
68a6   e17fd6:	e8 00 00 00 00       	call   e17fdb <fix_nodes+0x68ab>	e17fd7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
68ab   e17fdb:	e9 a8 be ff ff       	jmp    e13e88 <fix_nodes+0x2758>
68b0   e17fe0:	89 d1                	mov    %edx,%ecx
68b2   e17fe2:	80 e1 07             	and    $0x7,%cl
68b5   e17fe5:	80 c1 03             	add    $0x3,%cl
68b8   e17fe8:	38 c1                	cmp    %al,%cl
68ba   e17fea:	0f 8c c8 be ff ff    	jl     e13eb8 <fix_nodes+0x2788>
68c0   e17ff0:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
68c5   e17ff5:	e8 00 00 00 00       	call   e17ffa <fix_nodes+0x68ca>	e17ff6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
68ca   e17ffa:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
68cf   e17fff:	e9 b4 be ff ff       	jmp    e13eb8 <fix_nodes+0x2788>
68d4   e18004:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
68d9   e18009:	80 e1 07             	and    $0x7,%cl
68dc   e1800c:	80 c1 03             	add    $0x3,%cl
68df   e1800f:	38 c1                	cmp    %al,%cl
68e1   e18011:	0f 8c c0 be ff ff    	jl     e13ed7 <fix_nodes+0x27a7>
68e7   e18017:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
68ec   e1801c:	e8 00 00 00 00       	call   e18021 <fix_nodes+0x68f1>	e1801d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
68f1   e18021:	e9 b1 be ff ff       	jmp    e13ed7 <fix_nodes+0x27a7>
68f6   e18026:	44 89 f1             	mov    %r14d,%ecx
68f9   e18029:	80 e1 07             	and    $0x7,%cl
68fc   e1802c:	80 c1 03             	add    $0x3,%cl
68ff   e1802f:	38 c1                	cmp    %al,%cl
6901   e18031:	0f 8c 07 b6 ff ff    	jl     e1363e <fix_nodes+0x1f0e>
6907   e18037:	4c 89 f7             	mov    %r14,%rdi
690a   e1803a:	e8 00 00 00 00       	call   e1803f <fix_nodes+0x690f>	e1803b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
690f   e1803f:	e9 fa b5 ff ff       	jmp    e1363e <fix_nodes+0x1f0e>
6914   e18044:	89 d9                	mov    %ebx,%ecx
6916   e18046:	80 e1 07             	and    $0x7,%cl
6919   e18049:	80 c1 03             	add    $0x3,%cl
691c   e1804c:	38 c1                	cmp    %al,%cl
691e   e1804e:	0f 8c 36 b6 ff ff    	jl     e1368a <fix_nodes+0x1f5a>
6924   e18054:	48 89 df             	mov    %rbx,%rdi
6927   e18057:	e8 00 00 00 00       	call   e1805c <fix_nodes+0x692c>	e18058: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
692c   e1805c:	e9 29 b6 ff ff       	jmp    e1368a <fix_nodes+0x1f5a>
6931   e18061:	89 d9                	mov    %ebx,%ecx
6933   e18063:	80 e1 07             	and    $0x7,%cl
6936   e18066:	80 c1 03             	add    $0x3,%cl
6939   e18069:	38 c1                	cmp    %al,%cl
693b   e1806b:	0f 8c 87 d8 ff ff    	jl     e158f8 <fix_nodes+0x41c8>
6941   e18071:	48 89 df             	mov    %rbx,%rdi
6944   e18074:	e8 00 00 00 00       	call   e18079 <fix_nodes+0x6949>	e18075: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6949   e18079:	e9 7a d8 ff ff       	jmp    e158f8 <fix_nodes+0x41c8>
694e   e1807e:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
6953   e18083:	80 e1 07             	and    $0x7,%cl
6956   e18086:	80 c1 01             	add    $0x1,%cl
6959   e18089:	38 c1                	cmp    %al,%cl
695b   e1808b:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
6960   e18090:	0f 8c 7c d8 ff ff    	jl     e15912 <fix_nodes+0x41e2>
6966   e18096:	e8 00 00 00 00       	call   e1809b <fix_nodes+0x696b>	e18097: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
696b   e1809b:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
6970   e180a0:	e9 6d d8 ff ff       	jmp    e15912 <fix_nodes+0x41e2>
6975   e180a5:	89 f9                	mov    %edi,%ecx
6977   e180a7:	80 e1 07             	and    $0x7,%cl
697a   e180aa:	80 c1 01             	add    $0x1,%cl
697d   e180ad:	38 c1                	cmp    %al,%cl
697f   e180af:	0f 8c 03 e0 ff ff    	jl     e160b8 <fix_nodes+0x4988>
6985   e180b5:	e8 00 00 00 00       	call   e180ba <fix_nodes+0x698a>	e180b6: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
698a   e180ba:	e9 f9 df ff ff       	jmp    e160b8 <fix_nodes+0x4988>
698f   e180bf:	44 89 f9             	mov    %r15d,%ecx
6992   e180c2:	80 e1 07             	and    $0x7,%cl
6995   e180c5:	80 c1 03             	add    $0x3,%cl
6998   e180c8:	38 c1                	cmp    %al,%cl
699a   e180ca:	0f 8c 96 d9 ff ff    	jl     e15a66 <fix_nodes+0x4336>
69a0   e180d0:	4c 89 ff             	mov    %r15,%rdi
69a3   e180d3:	e8 00 00 00 00       	call   e180d8 <fix_nodes+0x69a8>	e180d4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
69a8   e180d8:	e9 89 d9 ff ff       	jmp    e15a66 <fix_nodes+0x4336>
69ad   e180dd:	48 8b 8c 24 b0 00 00 00 	mov    0xb0(%rsp),%rcx
69b5   e180e5:	80 e1 07             	and    $0x7,%cl
69b8   e180e8:	80 c1 03             	add    $0x3,%cl
69bb   e180eb:	38 c1                	cmp    %al,%cl
69bd   e180ed:	0f 8c 8a bc ff ff    	jl     e13d7d <fix_nodes+0x264d>
69c3   e180f3:	48 8b bc 24 b0 00 00 00 	mov    0xb0(%rsp),%rdi
69cb   e180fb:	e8 00 00 00 00       	call   e18100 <fix_nodes+0x69d0>	e180fc: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
69d0   e18100:	e9 78 bc ff ff       	jmp    e13d7d <fix_nodes+0x264d>
69d5   e18105:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
69da   e1810a:	80 e1 07             	and    $0x7,%cl
69dd   e1810d:	80 c1 03             	add    $0x3,%cl
69e0   e18110:	38 c1                	cmp    %al,%cl
69e2   e18112:	0f 8c a3 bc ff ff    	jl     e13dbb <fix_nodes+0x268b>
69e8   e18118:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
69ed   e1811d:	e8 00 00 00 00       	call   e18122 <fix_nodes+0x69f2>	e1811e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
69f2   e18122:	e9 94 bc ff ff       	jmp    e13dbb <fix_nodes+0x268b>
69f7   e18127:	44 89 f1             	mov    %r14d,%ecx
69fa   e1812a:	80 e1 07             	and    $0x7,%cl
69fd   e1812d:	80 c1 03             	add    $0x3,%cl
6a00   e18130:	38 c1                	cmp    %al,%cl
6a02   e18132:	0f 8c 1e c6 ff ff    	jl     e14756 <fix_nodes+0x3026>
6a08   e18138:	4c 89 f7             	mov    %r14,%rdi
6a0b   e1813b:	e8 00 00 00 00       	call   e18140 <fix_nodes+0x6a10>	e1813c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6a10   e18140:	e9 11 c6 ff ff       	jmp    e14756 <fix_nodes+0x3026>
6a15   e18145:	89 d1                	mov    %edx,%ecx
6a17   e18147:	80 e1 07             	and    $0x7,%cl
6a1a   e1814a:	80 c1 03             	add    $0x3,%cl
6a1d   e1814d:	38 c1                	cmp    %al,%cl
6a1f   e1814f:	0f 8c 41 c6 ff ff    	jl     e14796 <fix_nodes+0x3066>
6a25   e18155:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
6a2a   e1815a:	e8 00 00 00 00       	call   e1815f <fix_nodes+0x6a2f>	e1815b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6a2f   e1815f:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
6a34   e18164:	e9 2d c6 ff ff       	jmp    e14796 <fix_nodes+0x3066>
6a39   e18169:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
6a3e   e1816e:	80 e1 07             	and    $0x7,%cl
6a41   e18171:	80 c1 01             	add    $0x1,%cl
6a44   e18174:	38 c1                	cmp    %al,%cl
6a46   e18176:	0f 8c 3b c6 ff ff    	jl     e147b7 <fix_nodes+0x3087>
6a4c   e1817c:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
6a51   e18181:	e8 00 00 00 00       	call   e18186 <fix_nodes+0x6a56>	e18182: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6a56   e18186:	e9 2c c6 ff ff       	jmp    e147b7 <fix_nodes+0x3087>
6a5b   e1818b:	44 89 f1             	mov    %r14d,%ecx
6a5e   e1818e:	80 e1 07             	and    $0x7,%cl
6a61   e18191:	80 c1 01             	add    $0x1,%cl
6a64   e18194:	38 c1                	cmp    %al,%cl
6a66   e18196:	0f 8c 5a c6 ff ff    	jl     e147f6 <fix_nodes+0x30c6>
6a6c   e1819c:	4c 89 f7             	mov    %r14,%rdi
6a6f   e1819f:	e8 00 00 00 00       	call   e181a4 <fix_nodes+0x6a74>	e181a0: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6a74   e181a4:	e9 4d c6 ff ff       	jmp    e147f6 <fix_nodes+0x30c6>
6a79   e181a9:	44 89 f1             	mov    %r14d,%ecx
6a7c   e181ac:	80 e1 07             	and    $0x7,%cl
6a7f   e181af:	80 c1 01             	add    $0x1,%cl
6a82   e181b2:	38 c1                	cmp    %al,%cl
6a84   e181b4:	0f 8c 96 c6 ff ff    	jl     e14850 <fix_nodes+0x3120>
6a8a   e181ba:	4c 89 f7             	mov    %r14,%rdi
6a8d   e181bd:	e8 00 00 00 00       	call   e181c2 <fix_nodes+0x6a92>	e181be: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6a92   e181c2:	e9 89 c6 ff ff       	jmp    e14850 <fix_nodes+0x3120>
6a97   e181c7:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
6a9c   e181cc:	80 e1 07             	and    $0x7,%cl
6a9f   e181cf:	80 c1 03             	add    $0x3,%cl
6aa2   e181d2:	38 c1                	cmp    %al,%cl
6aa4   e181d4:	0f 8c 98 c6 ff ff    	jl     e14872 <fix_nodes+0x3142>
6aaa   e181da:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
6aaf   e181df:	e8 00 00 00 00       	call   e181e4 <fix_nodes+0x6ab4>	e181e0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6ab4   e181e4:	e9 89 c6 ff ff       	jmp    e14872 <fix_nodes+0x3142>
6ab9   e181e9:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
6abe   e181ee:	80 e1 07             	and    $0x7,%cl
6ac1   e181f1:	80 c1 01             	add    $0x1,%cl
6ac4   e181f4:	38 c1                	cmp    %al,%cl
6ac6   e181f6:	0f 8c e2 c6 ff ff    	jl     e148de <fix_nodes+0x31ae>
6acc   e181fc:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
6ad1   e18201:	e8 00 00 00 00       	call   e18206 <fix_nodes+0x6ad6>	e18202: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6ad6   e18206:	e9 d3 c6 ff ff       	jmp    e148de <fix_nodes+0x31ae>
6adb   e1820b:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
6ae0   e18210:	80 e1 07             	and    $0x7,%cl
6ae3   e18213:	80 c1 03             	add    $0x3,%cl
6ae6   e18216:	38 c1                	cmp    %al,%cl
6ae8   e18218:	0f 8c de c6 ff ff    	jl     e148fc <fix_nodes+0x31cc>
6aee   e1821e:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
6af3   e18223:	e8 00 00 00 00       	call   e18228 <fix_nodes+0x6af8>	e18224: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6af8   e18228:	e9 cf c6 ff ff       	jmp    e148fc <fix_nodes+0x31cc>
6afd   e1822d:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
6b02   e18232:	80 e1 07             	and    $0x7,%cl
6b05   e18235:	80 c1 01             	add    $0x1,%cl
6b08   e18238:	38 c1                	cmp    %al,%cl
6b0a   e1823a:	0f 8c 34 c7 ff ff    	jl     e14974 <fix_nodes+0x3244>
6b10   e18240:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
6b15   e18245:	e8 00 00 00 00       	call   e1824a <fix_nodes+0x6b1a>	e18246: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6b1a   e1824a:	e9 25 c7 ff ff       	jmp    e14974 <fix_nodes+0x3244>
6b1f   e1824f:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
6b24   e18254:	80 e1 07             	and    $0x7,%cl
6b27   e18257:	80 c1 03             	add    $0x3,%cl
6b2a   e1825a:	38 c1                	cmp    %al,%cl
6b2c   e1825c:	0f 8c 41 c7 ff ff    	jl     e149a3 <fix_nodes+0x3273>
6b32   e18262:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
6b37   e18267:	e8 00 00 00 00       	call   e1826c <fix_nodes+0x6b3c>	e18268: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6b3c   e1826c:	e9 32 c7 ff ff       	jmp    e149a3 <fix_nodes+0x3273>
6b41   e18271:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
6b46   e18276:	80 e1 07             	and    $0x7,%cl
6b49   e18279:	80 c1 01             	add    $0x1,%cl
6b4c   e1827c:	38 c1                	cmp    %al,%cl
6b4e   e1827e:	0f 8c 88 c7 ff ff    	jl     e14a0c <fix_nodes+0x32dc>
6b54   e18284:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
6b59   e18289:	e8 00 00 00 00       	call   e1828e <fix_nodes+0x6b5e>	e1828a: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6b5e   e1828e:	e9 79 c7 ff ff       	jmp    e14a0c <fix_nodes+0x32dc>
6b63   e18293:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
6b68   e18298:	80 e1 07             	and    $0x7,%cl
6b6b   e1829b:	80 c1 03             	add    $0x3,%cl
6b6e   e1829e:	38 c1                	cmp    %al,%cl
6b70   e182a0:	0f 8c 84 c7 ff ff    	jl     e14a2a <fix_nodes+0x32fa>
6b76   e182a6:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
6b7b   e182ab:	e8 00 00 00 00       	call   e182b0 <fix_nodes+0x6b80>	e182ac: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6b80   e182b0:	e9 75 c7 ff ff       	jmp    e14a2a <fix_nodes+0x32fa>
6b85   e182b5:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
6b8a   e182ba:	80 e1 07             	and    $0x7,%cl
6b8d   e182bd:	80 c1 01             	add    $0x1,%cl
6b90   e182c0:	38 c1                	cmp    %al,%cl
6b92   e182c2:	0f 8c dd c7 ff ff    	jl     e14aa5 <fix_nodes+0x3375>
6b98   e182c8:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
6b9d   e182cd:	e8 00 00 00 00       	call   e182d2 <fix_nodes+0x6ba2>	e182ce: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6ba2   e182d2:	e9 ce c7 ff ff       	jmp    e14aa5 <fix_nodes+0x3375>
6ba7   e182d7:	89 d9                	mov    %ebx,%ecx
6ba9   e182d9:	80 e1 07             	and    $0x7,%cl
6bac   e182dc:	80 c1 03             	add    $0x3,%cl
6baf   e182df:	38 c1                	cmp    %al,%cl
6bb1   e182e1:	0f 8c de c7 ff ff    	jl     e14ac5 <fix_nodes+0x3395>
6bb7   e182e7:	48 89 df             	mov    %rbx,%rdi
6bba   e182ea:	e8 00 00 00 00       	call   e182ef <fix_nodes+0x6bbf>	e182eb: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6bbf   e182ef:	e9 d1 c7 ff ff       	jmp    e14ac5 <fix_nodes+0x3395>
6bc4   e182f4:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
6bc9   e182f9:	80 e1 07             	and    $0x7,%cl
6bcc   e182fc:	80 c1 03             	add    $0x3,%cl
6bcf   e182ff:	38 c1                	cmp    %al,%cl
6bd1   e18301:	0f 8c f9 c7 ff ff    	jl     e14b00 <fix_nodes+0x33d0>
6bd7   e18307:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
6bdc   e1830c:	e8 00 00 00 00       	call   e18311 <fix_nodes+0x6be1>	e1830d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6be1   e18311:	e9 ea c7 ff ff       	jmp    e14b00 <fix_nodes+0x33d0>
6be6   e18316:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
6beb   e1831b:	80 e1 07             	and    $0x7,%cl
6bee   e1831e:	80 c1 01             	add    $0x1,%cl
6bf1   e18321:	38 c1                	cmp    %al,%cl
6bf3   e18323:	0f 8c 44 c8 ff ff    	jl     e14b6d <fix_nodes+0x343d>
6bf9   e18329:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
6bfe   e1832e:	e8 00 00 00 00       	call   e18333 <fix_nodes+0x6c03>	e1832f: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6c03   e18333:	e9 35 c8 ff ff       	jmp    e14b6d <fix_nodes+0x343d>
6c08   e18338:	89 d9                	mov    %ebx,%ecx
6c0a   e1833a:	80 e1 07             	and    $0x7,%cl
6c0d   e1833d:	80 c1 03             	add    $0x3,%cl
6c10   e18340:	38 c1                	cmp    %al,%cl
6c12   e18342:	0f 8c 4b c8 ff ff    	jl     e14b93 <fix_nodes+0x3463>
6c18   e18348:	48 89 df             	mov    %rbx,%rdi
6c1b   e1834b:	e8 00 00 00 00       	call   e18350 <fix_nodes+0x6c20>	e1834c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6c20   e18350:	e9 3e c8 ff ff       	jmp    e14b93 <fix_nodes+0x3463>
6c25   e18355:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
6c2a   e1835a:	80 e1 07             	and    $0x7,%cl
6c2d   e1835d:	80 c1 03             	add    $0x3,%cl
6c30   e18360:	38 c1                	cmp    %al,%cl
6c32   e18362:	0f 8c 5f c8 ff ff    	jl     e14bc7 <fix_nodes+0x3497>
6c38   e18368:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
6c3d   e1836d:	e8 00 00 00 00       	call   e18372 <fix_nodes+0x6c42>	e1836e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6c42   e18372:	e9 50 c8 ff ff       	jmp    e14bc7 <fix_nodes+0x3497>
6c47   e18377:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
6c4c   e1837c:	80 e1 07             	and    $0x7,%cl
6c4f   e1837f:	80 c1 01             	add    $0x1,%cl
6c52   e18382:	38 c1                	cmp    %al,%cl
6c54   e18384:	0f 8c 6c d7 ff ff    	jl     e15af6 <fix_nodes+0x43c6>
6c5a   e1838a:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
6c5f   e1838f:	e8 00 00 00 00       	call   e18394 <fix_nodes+0x6c64>	e18390: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6c64   e18394:	e9 5d d7 ff ff       	jmp    e15af6 <fix_nodes+0x43c6>
6c69   e18399:	89 d9                	mov    %ebx,%ecx
6c6b   e1839b:	80 e1 07             	and    $0x7,%cl
6c6e   e1839e:	80 c1 03             	add    $0x3,%cl
6c71   e183a1:	38 c1                	cmp    %al,%cl
6c73   e183a3:	0f 8c 72 d7 ff ff    	jl     e15b1b <fix_nodes+0x43eb>
6c79   e183a9:	48 89 df             	mov    %rbx,%rdi
6c7c   e183ac:	e8 00 00 00 00       	call   e183b1 <fix_nodes+0x6c81>	e183ad: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
6c81   e183b1:	e9 65 d7 ff ff       	jmp    e15b1b <fix_nodes+0x43eb>
6c86   e183b6:	89 d9                	mov    %ebx,%ecx
6c88   e183b8:	80 e1 07             	and    $0x7,%cl
6c8b   e183bb:	80 c1 03             	add    $0x3,%cl
6c8e   e183be:	38 c1                	cmp    %al,%cl
6c90   e183c0:	0f 8c 8b d7 ff ff    	jl     e15b51 <fix_nodes+0x4421>
6c96   e183c6:	48 89 df             	mov    %rbx,%rdi
6c99   e183c9:	e8 00 00 00 00       	call   e183ce <fix_nodes+0x6c9e>	e183ca: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6c9e   e183ce:	e9 7e d7 ff ff       	jmp    e15b51 <fix_nodes+0x4421>
6ca3   e183d3:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
6ca8   e183d8:	80 e1 07             	and    $0x7,%cl
6cab   e183db:	80 c1 01             	add    $0x1,%cl
6cae   e183de:	38 c1                	cmp    %al,%cl
6cb0   e183e0:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
6cb5   e183e5:	0f 8c 81 d7 ff ff    	jl     e15b6c <fix_nodes+0x443c>
6cbb   e183eb:	e8 00 00 00 00       	call   e183f0 <fix_nodes+0x6cc0>	e183ec: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6cc0   e183f0:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
6cc5   e183f5:	e9 72 d7 ff ff       	jmp    e15b6c <fix_nodes+0x443c>
6cca   e183fa:	e8 00 00 00 00       	call   e183ff <fix_nodes+0x6ccf>	e183fb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6ccf   e183ff:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e18402: R_X86_64_32S	.data+0x66e290
6cd6   e18406:	48 89 de             	mov    %rbx,%rsi
6cd9   e18409:	e8 00 00 00 00       	call   e1840e <fix_nodes+0x6cde>	e1840a: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
6cde   e1840e:	e9 4a b0 ff ff       	jmp    e1345d <fix_nodes+0x1d2d>
6ce3   e18413:	e8 00 00 00 00       	call   e18418 <fix_nodes+0x6ce8>	e18414: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6ce8   e18418:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e1841b: R_X86_64_32S	.data+0x66e2f0
6cef   e1841f:	48 89 de             	mov    %rbx,%rsi
6cf2   e18422:	e8 00 00 00 00       	call   e18427 <fix_nodes+0x6cf7>	e18423: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
6cf7   e18427:	e9 76 cb ff ff       	jmp    e14fa2 <fix_nodes+0x3872>
6cfc   e1842c:	e8 00 00 00 00       	call   e18431 <fix_nodes+0x6d01>	e1842d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6d01   e18431:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e18434: R_X86_64_32S	.data+0x66e810
6d08   e18438:	48 89 de             	mov    %rbx,%rsi
6d0b   e1843b:	e8 00 00 00 00       	call   e18440 <fix_nodes+0x6d10>	e1843c: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
6d10   e18440:	e9 02 ce ff ff       	jmp    e15247 <fix_nodes+0x3b17>
6d15   e18445:	89 d9                	mov    %ebx,%ecx
6d17   e18447:	80 e1 07             	and    $0x7,%cl
6d1a   e1844a:	80 c1 01             	add    $0x1,%cl
6d1d   e1844d:	38 c1                	cmp    %al,%cl
6d1f   e1844f:	0f 8c c9 e2 ff ff    	jl     e1671e <fix_nodes+0x4fee>
6d25   e18455:	48 89 df             	mov    %rbx,%rdi
6d28   e18458:	e8 00 00 00 00       	call   e1845d <fix_nodes+0x6d2d>	e18459: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6d2d   e1845d:	e9 bc e2 ff ff       	jmp    e1671e <fix_nodes+0x4fee>
6d32   e18462:	89 d9                	mov    %ebx,%ecx
6d34   e18464:	80 e1 07             	and    $0x7,%cl
6d37   e18467:	38 c1                	cmp    %al,%cl
6d39   e18469:	0f 8c fa d7 ff ff    	jl     e15c69 <fix_nodes+0x4539>
6d3f   e1846f:	be 02 00 00 00       	mov    $0x2,%esi
6d44   e18474:	48 89 df             	mov    %rbx,%rdi
6d47   e18477:	e8 00 00 00 00       	call   e1847c <fix_nodes+0x6d4c>	e18478: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
6d4c   e1847c:	e9 e8 d7 ff ff       	jmp    e15c69 <fix_nodes+0x4539>
6d51   e18481:	44 89 f9             	mov    %r15d,%ecx
6d54   e18484:	80 e1 07             	and    $0x7,%cl
6d57   e18487:	38 c1                	cmp    %al,%cl
6d59   e18489:	0f 8c ee d7 ff ff    	jl     e15c7d <fix_nodes+0x454d>
6d5f   e1848f:	be 02 00 00 00       	mov    $0x2,%esi
6d64   e18494:	4c 89 ff             	mov    %r15,%rdi
6d67   e18497:	e8 00 00 00 00       	call   e1849c <fix_nodes+0x6d6c>	e18498: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
6d6c   e1849c:	e9 dc d7 ff ff       	jmp    e15c7d <fix_nodes+0x454d>
6d71   e184a1:	48 8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%rcx
6d79   e184a9:	80 e1 07             	and    $0x7,%cl
6d7c   e184ac:	80 c1 03             	add    $0x3,%cl
6d7f   e184af:	38 c1                	cmp    %al,%cl
6d81   e184b1:	0f 8c e7 c8 ff ff    	jl     e14d9e <fix_nodes+0x366e>
6d87   e184b7:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
6d8f   e184bf:	e8 00 00 00 00       	call   e184c4 <fix_nodes+0x6d94>	e184c0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6d94   e184c4:	e9 d5 c8 ff ff       	jmp    e14d9e <fix_nodes+0x366e>
6d99   e184c9:	89 d1                	mov    %edx,%ecx
6d9b   e184cb:	80 e1 07             	and    $0x7,%cl
6d9e   e184ce:	80 c1 03             	add    $0x3,%cl
6da1   e184d1:	38 c1                	cmp    %al,%cl
6da3   e184d3:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
6da8   e184d8:	0f 8c f2 c8 ff ff    	jl     e14dd0 <fix_nodes+0x36a0>
6dae   e184de:	48 89 d7             	mov    %rdx,%rdi
6db1   e184e1:	e8 00 00 00 00       	call   e184e6 <fix_nodes+0x6db6>	e184e2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6db6   e184e6:	48 8b 94 24 98 00 00 00 	mov    0x98(%rsp),%rdx
6dbe   e184ee:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
6dc3   e184f3:	e9 d8 c8 ff ff       	jmp    e14dd0 <fix_nodes+0x36a0>
6dc8   e184f8:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
6dcd   e184fd:	80 e1 07             	and    $0x7,%cl
6dd0   e18500:	80 c1 01             	add    $0x1,%cl
6dd3   e18503:	38 c1                	cmp    %al,%cl
6dd5   e18505:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
6dda   e1850a:	0f 8c d0 c8 ff ff    	jl     e14de0 <fix_nodes+0x36b0>
6de0   e18510:	e8 00 00 00 00       	call   e18515 <fix_nodes+0x6de5>	e18511: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6de5   e18515:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
6dea   e1851a:	e9 c1 c8 ff ff       	jmp    e14de0 <fix_nodes+0x36b0>
6def   e1851f:	44 89 f1             	mov    %r14d,%ecx
6df2   e18522:	80 e1 07             	and    $0x7,%cl
6df5   e18525:	80 c1 03             	add    $0x3,%cl
6df8   e18528:	38 c1                	cmp    %al,%cl
6dfa   e1852a:	0f 8c 3a d4 ff ff    	jl     e1596a <fix_nodes+0x423a>
6e00   e18530:	4c 89 f7             	mov    %r14,%rdi
6e03   e18533:	e8 00 00 00 00       	call   e18538 <fix_nodes+0x6e08>	e18534: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6e08   e18538:	e9 2d d4 ff ff       	jmp    e1596a <fix_nodes+0x423a>
6e0d   e1853d:	89 d9                	mov    %ebx,%ecx
6e0f   e1853f:	80 e1 07             	and    $0x7,%cl
6e12   e18542:	80 c1 03             	add    $0x3,%cl
6e15   e18545:	38 c1                	cmp    %al,%cl
6e17   e18547:	0f 8c 69 d4 ff ff    	jl     e159b6 <fix_nodes+0x4286>
6e1d   e1854d:	48 89 df             	mov    %rbx,%rdi
6e20   e18550:	e8 00 00 00 00       	call   e18555 <fix_nodes+0x6e25>	e18551: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6e25   e18555:	e9 5c d4 ff ff       	jmp    e159b6 <fix_nodes+0x4286>
6e2a   e1855a:	89 d9                	mov    %ebx,%ecx
6e2c   e1855c:	80 e1 07             	and    $0x7,%cl
6e2f   e1855f:	80 c1 01             	add    $0x1,%cl
6e32   e18562:	38 c1                	cmp    %al,%cl
6e34   e18564:	0f 8c 89 d4 ff ff    	jl     e159f3 <fix_nodes+0x42c3>
6e3a   e1856a:	48 89 df             	mov    %rbx,%rdi
6e3d   e1856d:	e8 00 00 00 00       	call   e18572 <fix_nodes+0x6e42>	e1856e: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6e42   e18572:	e9 7c d4 ff ff       	jmp    e159f3 <fix_nodes+0x42c3>
6e47   e18577:	89 f9                	mov    %edi,%ecx
6e49   e18579:	80 e1 07             	and    $0x7,%cl
6e4c   e1857c:	80 c1 01             	add    $0x1,%cl
6e4f   e1857f:	38 c1                	cmp    %al,%cl
6e51   e18581:	0f 8c a3 dd ff ff    	jl     e1632a <fix_nodes+0x4bfa>
6e57   e18587:	e8 00 00 00 00       	call   e1858c <fix_nodes+0x6e5c>	e18588: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6e5c   e1858c:	e9 99 dd ff ff       	jmp    e1632a <fix_nodes+0x4bfa>
6e61   e18591:	89 d9                	mov    %ebx,%ecx
6e63   e18593:	80 e1 07             	and    $0x7,%cl
6e66   e18596:	80 c1 01             	add    $0x1,%cl
6e69   e18599:	38 c1                	cmp    %al,%cl
6e6b   e1859b:	0f 8c b0 dd ff ff    	jl     e16351 <fix_nodes+0x4c21>
6e71   e185a1:	48 89 df             	mov    %rbx,%rdi
6e74   e185a4:	e8 00 00 00 00       	call   e185a9 <fix_nodes+0x6e79>	e185a5: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6e79   e185a9:	e9 a3 dd ff ff       	jmp    e16351 <fix_nodes+0x4c21>
6e7e   e185ae:	48 8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%rcx
6e86   e185b6:	80 e1 07             	and    $0x7,%cl
6e89   e185b9:	80 c1 03             	add    $0x3,%cl
6e8c   e185bc:	38 c1                	cmp    %al,%cl
6e8e   e185be:	0f 8c 68 e4 ff ff    	jl     e16a2c <fix_nodes+0x52fc>
6e94   e185c4:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
6e9c   e185cc:	e8 00 00 00 00       	call   e185d1 <fix_nodes+0x6ea1>	e185cd: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6ea1   e185d1:	e9 56 e4 ff ff       	jmp    e16a2c <fix_nodes+0x52fc>
6ea6   e185d6:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
6eab   e185db:	80 e1 07             	and    $0x7,%cl
6eae   e185de:	80 c1 01             	add    $0x1,%cl
6eb1   e185e1:	38 c1                	cmp    %al,%cl
6eb3   e185e3:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
6eb8   e185e8:	0f 8c 5f e4 ff ff    	jl     e16a4d <fix_nodes+0x531d>
6ebe   e185ee:	e8 00 00 00 00       	call   e185f3 <fix_nodes+0x6ec3>	e185ef: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6ec3   e185f3:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
6ec8   e185f8:	e9 50 e4 ff ff       	jmp    e16a4d <fix_nodes+0x531d>
6ecd   e185fd:	44 89 f9             	mov    %r15d,%ecx
6ed0   e18600:	80 e1 07             	and    $0x7,%cl
6ed3   e18603:	38 c1                	cmp    %al,%cl
6ed5   e18605:	0f 8c aa d6 ff ff    	jl     e15cb5 <fix_nodes+0x4585>
6edb   e1860b:	be 08 00 00 00       	mov    $0x8,%esi
6ee0   e18610:	4c 89 ff             	mov    %r15,%rdi
6ee3   e18613:	e8 00 00 00 00       	call   e18618 <fix_nodes+0x6ee8>	e18614: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
6ee8   e18618:	e9 98 d6 ff ff       	jmp    e15cb5 <fix_nodes+0x4585>
6eed   e1861d:	89 d9                	mov    %ebx,%ecx
6eef   e1861f:	80 e1 07             	and    $0x7,%cl
6ef2   e18622:	38 c1                	cmp    %al,%cl
6ef4   e18624:	0f 8c 9f d6 ff ff    	jl     e15cc9 <fix_nodes+0x4599>
6efa   e1862a:	be 08 00 00 00       	mov    $0x8,%esi
6eff   e1862f:	48 89 df             	mov    %rbx,%rdi
6f02   e18632:	e8 00 00 00 00       	call   e18637 <fix_nodes+0x6f07>	e18633: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
6f07   e18637:	e9 8d d6 ff ff       	jmp    e15cc9 <fix_nodes+0x4599>
6f0c   e1863c:	89 d9                	mov    %ebx,%ecx
6f0e   e1863e:	80 e1 07             	and    $0x7,%cl
6f11   e18641:	80 c1 01             	add    $0x1,%cl
6f14   e18644:	38 c1                	cmp    %al,%cl
6f16   e18646:	0f 8c 0d da ff ff    	jl     e16059 <fix_nodes+0x4929>
6f1c   e1864c:	48 89 df             	mov    %rbx,%rdi
6f1f   e1864f:	e8 00 00 00 00       	call   e18654 <fix_nodes+0x6f24>	e18650: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6f24   e18654:	e9 00 da ff ff       	jmp    e16059 <fix_nodes+0x4929>
6f29   e18659:	89 d1                	mov    %edx,%ecx
6f2b   e1865b:	80 e1 07             	and    $0x7,%cl
6f2e   e1865e:	80 c1 03             	add    $0x3,%cl
6f31   e18661:	38 c1                	cmp    %al,%cl
6f33   e18663:	0f 8c 9c db ff ff    	jl     e16205 <fix_nodes+0x4ad5>
6f39   e18669:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
6f41   e18671:	e8 00 00 00 00       	call   e18676 <fix_nodes+0x6f46>	e18672: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6f46   e18676:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
6f4e   e1867e:	e9 82 db ff ff       	jmp    e16205 <fix_nodes+0x4ad5>
6f53   e18683:	89 d1                	mov    %edx,%ecx
6f55   e18685:	80 e1 07             	and    $0x7,%cl
6f58   e18688:	80 c1 03             	add    $0x3,%cl
6f5b   e1868b:	38 c1                	cmp    %al,%cl
6f5d   e1868d:	0f 8c 8e db ff ff    	jl     e16221 <fix_nodes+0x4af1>
6f63   e18693:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
6f68   e18698:	e8 00 00 00 00       	call   e1869d <fix_nodes+0x6f6d>	e18699: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6f6d   e1869d:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
6f72   e186a2:	e9 7a db ff ff       	jmp    e16221 <fix_nodes+0x4af1>
6f77   e186a7:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
6f7c   e186ac:	80 e1 07             	and    $0x7,%cl
6f7f   e186af:	80 c1 01             	add    $0x1,%cl
6f82   e186b2:	38 c1                	cmp    %al,%cl
6f84   e186b4:	0f 8c 8d db ff ff    	jl     e16247 <fix_nodes+0x4b17>
6f8a   e186ba:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
6f8f   e186bf:	e8 00 00 00 00       	call   e186c4 <fix_nodes+0x6f94>	e186c0: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6f94   e186c4:	e9 7e db ff ff       	jmp    e16247 <fix_nodes+0x4b17>
6f99   e186c9:	89 d9                	mov    %ebx,%ecx
6f9b   e186cb:	80 e1 07             	and    $0x7,%cl
6f9e   e186ce:	38 c1                	cmp    %al,%cl
6fa0   e186d0:	0f 8c bf dc ff ff    	jl     e16395 <fix_nodes+0x4c65>
6fa6   e186d6:	be 04 00 00 00       	mov    $0x4,%esi
6fab   e186db:	48 89 df             	mov    %rbx,%rdi
6fae   e186de:	e8 00 00 00 00       	call   e186e3 <fix_nodes+0x6fb3>	e186df: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
6fb3   e186e3:	e9 ad dc ff ff       	jmp    e16395 <fix_nodes+0x4c65>
6fb8   e186e8:	44 89 f9             	mov    %r15d,%ecx
6fbb   e186eb:	80 e1 07             	and    $0x7,%cl
6fbe   e186ee:	38 c1                	cmp    %al,%cl
6fc0   e186f0:	0f 8c b3 dc ff ff    	jl     e163a9 <fix_nodes+0x4c79>
6fc6   e186f6:	be 04 00 00 00       	mov    $0x4,%esi
6fcb   e186fb:	4c 89 ff             	mov    %r15,%rdi
6fce   e186fe:	e8 00 00 00 00       	call   e18703 <fix_nodes+0x6fd3>	e186ff: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
6fd3   e18703:	e9 a1 dc ff ff       	jmp    e163a9 <fix_nodes+0x4c79>
6fd8   e18708:	48 8b 8c 24 b0 00 00 00 	mov    0xb0(%rsp),%rcx
6fe0   e18710:	80 e1 07             	and    $0x7,%cl
6fe3   e18713:	80 c1 03             	add    $0x3,%cl
6fe6   e18716:	38 c1                	cmp    %al,%cl
6fe8   e18718:	0f 8c 7c c5 ff ff    	jl     e14c9a <fix_nodes+0x356a>
6fee   e1871e:	48 8b bc 24 b0 00 00 00 	mov    0xb0(%rsp),%rdi
6ff6   e18726:	e8 00 00 00 00       	call   e1872b <fix_nodes+0x6ffb>	e18727: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6ffb   e1872b:	e9 6a c5 ff ff       	jmp    e14c9a <fix_nodes+0x356a>
7000   e18730:	89 f1                	mov    %esi,%ecx
7002   e18732:	80 e1 07             	and    $0x7,%cl
7005   e18735:	80 c1 03             	add    $0x3,%cl
7008   e18738:	38 c1                	cmp    %al,%cl
700a   e1873a:	0f 8c 83 c5 ff ff    	jl     e14cc3 <fix_nodes+0x3593>
7010   e18740:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
7015   e18745:	41 89 d7             	mov    %edx,%r15d
7018   e18748:	e8 00 00 00 00       	call   e1874d <fix_nodes+0x701d>	e18749: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
701d   e1874d:	44 89 fa             	mov    %r15d,%edx
7020   e18750:	48 8b 74 24 60       	mov    0x60(%rsp),%rsi
7025   e18755:	e9 69 c5 ff ff       	jmp    e14cc3 <fix_nodes+0x3593>
702a   e1875a:	89 d9                	mov    %ebx,%ecx
702c   e1875c:	80 e1 07             	and    $0x7,%cl
702f   e1875f:	80 c1 03             	add    $0x3,%cl
7032   e18762:	38 c1                	cmp    %al,%cl
7034   e18764:	0f 8c 6e c5 ff ff    	jl     e14cd8 <fix_nodes+0x35a8>
703a   e1876a:	48 89 df             	mov    %rbx,%rdi
703d   e1876d:	89 54 24 10          	mov    %edx,0x10(%rsp)
7041   e18771:	e8 00 00 00 00       	call   e18776 <fix_nodes+0x7046>	e18772: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7046   e18776:	8b 54 24 10          	mov    0x10(%rsp),%edx
704a   e1877a:	e9 59 c5 ff ff       	jmp    e14cd8 <fix_nodes+0x35a8>
704f   e1877f:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
7054   e18784:	80 e1 07             	and    $0x7,%cl
7057   e18787:	80 c1 03             	add    $0x3,%cl
705a   e1878a:	38 c1                	cmp    %al,%cl
705c   e1878c:	0f 8c 5d c5 ff ff    	jl     e14cef <fix_nodes+0x35bf>
7062   e18792:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
7067   e18797:	41 89 d6             	mov    %edx,%r14d
706a   e1879a:	e8 00 00 00 00       	call   e1879f <fix_nodes+0x706f>	e1879b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
706f   e1879f:	44 89 f2             	mov    %r14d,%edx
7072   e187a2:	e9 48 c5 ff ff       	jmp    e14cef <fix_nodes+0x35bf>
7077   e187a7:	e8 00 00 00 00       	call   e187ac <fix_nodes+0x707c>	e187a8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
707c   e187ac:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e187af: R_X86_64_32S	.data+0x66e790
7083   e187b3:	48 89 de             	mov    %rbx,%rsi
7086   e187b6:	e8 00 00 00 00       	call   e187bb <fix_nodes+0x708b>	e187b7: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
708b   e187bb:	e9 b8 de ff ff       	jmp    e16678 <fix_nodes+0x4f48>
7090   e187c0:	48 8b 8c 24 98 00 00 00 	mov    0x98(%rsp),%rcx
7098   e187c8:	80 e1 07             	and    $0x7,%cl
709b   e187cb:	80 c1 03             	add    $0x3,%cl
709e   e187ce:	38 c1                	cmp    %al,%cl
70a0   e187d0:	0f 8c 99 e1 ff ff    	jl     e1696f <fix_nodes+0x523f>
70a6   e187d6:	48 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%rdi
70ae   e187de:	e8 00 00 00 00       	call   e187e3 <fix_nodes+0x70b3>	e187df: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
70b3   e187e3:	e9 87 e1 ff ff       	jmp    e1696f <fix_nodes+0x523f>
70b8   e187e8:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
70bd   e187ed:	80 e1 07             	and    $0x7,%cl
70c0   e187f0:	80 c1 01             	add    $0x1,%cl
70c3   e187f3:	38 c1                	cmp    %al,%cl
70c5   e187f5:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
70ca   e187fa:	0f 8c 95 e1 ff ff    	jl     e16995 <fix_nodes+0x5265>
70d0   e18800:	e8 00 00 00 00       	call   e18805 <fix_nodes+0x70d5>	e18801: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
70d5   e18805:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
70da   e1880a:	e9 86 e1 ff ff       	jmp    e16995 <fix_nodes+0x5265>
70df   e1880f:	44 89 f9             	mov    %r15d,%ecx
70e2   e18812:	80 e1 07             	and    $0x7,%cl
70e5   e18815:	38 c1                	cmp    %al,%cl
70e7   e18817:	0f 8c cf db ff ff    	jl     e163ec <fix_nodes+0x4cbc>
70ed   e1881d:	be 04 00 00 00       	mov    $0x4,%esi
70f2   e18822:	4c 89 ff             	mov    %r15,%rdi
70f5   e18825:	e8 00 00 00 00       	call   e1882a <fix_nodes+0x70fa>	e18826: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
70fa   e1882a:	e9 bd db ff ff       	jmp    e163ec <fix_nodes+0x4cbc>
70ff   e1882f:	89 d9                	mov    %ebx,%ecx
7101   e18831:	80 e1 07             	and    $0x7,%cl
7104   e18834:	38 c1                	cmp    %al,%cl
7106   e18836:	0f 8c c4 db ff ff    	jl     e16400 <fix_nodes+0x4cd0>
710c   e1883c:	be 04 00 00 00       	mov    $0x4,%esi
7111   e18841:	48 89 df             	mov    %rbx,%rdi
7114   e18844:	e8 00 00 00 00       	call   e18849 <fix_nodes+0x7119>	e18845: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
7119   e18849:	e9 b2 db ff ff       	jmp    e16400 <fix_nodes+0x4cd0>
711e   e1884e:	e8 00 00 00 00       	call   e18853 <fix_nodes+0x7123>	e1884f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7123   e18853:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e18856: R_X86_64_32S	.data+0x66e7b0
712a   e1885a:	48 89 de             	mov    %rbx,%rsi
712d   e1885d:	e8 00 00 00 00       	call   e18862 <fix_nodes+0x7132>	e1885e: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
7132   e18862:	e9 a1 b8 ff ff       	jmp    e14108 <fix_nodes+0x29d8>
7137   e18867:	e8 00 00 00 00       	call   e1886c <fix_nodes+0x713c>	e18868: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
713c   e1886c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e1886f: R_X86_64_32S	.data+0x66e2d0
7143   e18873:	4c 89 fe             	mov    %r15,%rsi
7146   e18876:	e8 00 00 00 00       	call   e1887b <fix_nodes+0x714b>	e18877: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
714b   e1887b:	e9 e1 c5 ff ff       	jmp    e14e61 <fix_nodes+0x3731>
7150   e18880:	e8 00 00 00 00       	call   e18885 <fix_nodes+0x7155>	e18881: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7155   e18885:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e18888: R_X86_64_32S	.data+0x66e330
715c   e1888c:	4c 89 fe             	mov    %r15,%rsi
715f   e1888f:	e8 00 00 00 00       	call   e18894 <fix_nodes+0x7164>	e18890: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
7164   e18894:	e9 59 c8 ff ff       	jmp    e150f2 <fix_nodes+0x39c2>
7169   e18899:	e8 00 00 00 00       	call   e1889e <fix_nodes+0x716e>	e1889a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
716e   e1889e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e188a1: R_X86_64_32S	.data+0x66e750
7175   e188a5:	48 89 de             	mov    %rbx,%rsi
7178   e188a8:	e8 00 00 00 00       	call   e188ad <fix_nodes+0x717d>	e188a9: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
717d   e188ad:	e9 af ad ff ff       	jmp    e13661 <fix_nodes+0x1f31>
7182   e188b2:	89 d1                	mov    %edx,%ecx
7184   e188b4:	80 e1 07             	and    $0x7,%cl
7187   e188b7:	80 c1 01             	add    $0x1,%cl
718a   e188ba:	38 c1                	cmp    %al,%cl
718c   e188bc:	0f 8c 19 dd ff ff    	jl     e165db <fix_nodes+0x4eab>
7192   e188c2:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
7197   e188c7:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
719c   e188cc:	e8 00 00 00 00       	call   e188d1 <fix_nodes+0x71a1>	e188cd: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
71a1   e188d1:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
71a6   e188d6:	e9 00 dd ff ff       	jmp    e165db <fix_nodes+0x4eab>
71ab   e188db:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
71b0   e188e0:	80 e1 07             	and    $0x7,%cl
71b3   e188e3:	80 c1 03             	add    $0x3,%cl
71b6   e188e6:	38 c1                	cmp    %al,%cl
71b8   e188e8:	0f 8c c5 df ff ff    	jl     e168b3 <fix_nodes+0x5183>
71be   e188ee:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
71c3   e188f3:	e8 00 00 00 00       	call   e188f8 <fix_nodes+0x71c8>	e188f4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
71c8   e188f8:	e9 b6 df ff ff       	jmp    e168b3 <fix_nodes+0x5183>
71cd   e188fd:	e8 00 00 00 00       	call   e18902 <fix_nodes+0x71d2>	e188fe: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
71d2   e18902:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e18905: R_X86_64_32S	.data+0x66e770
71d9   e18909:	48 89 de             	mov    %rbx,%rsi
71dc   e1890c:	e8 00 00 00 00       	call   e18911 <fix_nodes+0x71e1>	e1890d: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
71e1   e18911:	e9 77 d0 ff ff       	jmp    e1598d <fix_nodes+0x425d>
71e6   e18916:	89 d1                	mov    %edx,%ecx
71e8   e18918:	80 e1 07             	and    $0x7,%cl
71eb   e1891b:	80 c1 01             	add    $0x1,%cl
71ee   e1891e:	38 c1                	cmp    %al,%cl
71f0   e18920:	0f 8c 52 e2 ff ff    	jl     e16b78 <fix_nodes+0x5448>
71f6   e18926:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
71fb   e1892b:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
7200   e18930:	e8 00 00 00 00       	call   e18935 <fix_nodes+0x7205>	e18931: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
7205   e18935:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
720a   e1893a:	e9 39 e2 ff ff       	jmp    e16b78 <fix_nodes+0x5448>
720f   e1893f:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
7214   e18944:	80 e1 07             	and    $0x7,%cl
7217   e18947:	80 c1 03             	add    $0x3,%cl
721a   e1894a:	38 c1                	cmp    %al,%cl
721c   e1894c:	0f 8c 65 e1 ff ff    	jl     e16ab7 <fix_nodes+0x5387>
7222   e18952:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
7227   e18957:	e8 00 00 00 00       	call   e1895c <fix_nodes+0x722c>	e18958: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
722c   e1895c:	e9 56 e1 ff ff       	jmp    e16ab7 <fix_nodes+0x5387>
7231   e18961:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
7236   e18966:	80 e1 07             	and    $0x7,%cl
7239   e18969:	80 c1 03             	add    $0x3,%cl
723c   e1896c:	38 c1                	cmp    %al,%cl
723e   e1896e:	0f 8c 88 e3 ff ff    	jl     e16cfc <fix_nodes+0x55cc>
7244   e18974:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
7249   e18979:	e8 00 00 00 00       	call   e1897e <fix_nodes+0x724e>	e1897a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
724e   e1897e:	e9 79 e3 ff ff       	jmp    e16cfc <fix_nodes+0x55cc>
7253   e18983:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
7258   e18988:	80 e1 07             	and    $0x7,%cl
725b   e1898b:	80 c1 03             	add    $0x3,%cl
725e   e1898e:	38 c1                	cmp    %al,%cl
7260   e18990:	0f 8c 0d e3 ff ff    	jl     e16ca3 <fix_nodes+0x5573>
7266   e18996:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
726b   e1899b:	e8 00 00 00 00       	call   e189a0 <fix_nodes+0x7270>	e1899c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7270   e189a0:	e9 fe e2 ff ff       	jmp    e16ca3 <fix_nodes+0x5573>
7275   e189a5:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
727a   e189aa:	80 e1 07             	and    $0x7,%cl
727d   e189ad:	80 c1 03             	add    $0x3,%cl
7280   e189b0:	38 c1                	cmp    %al,%cl
7282   e189b2:	0f 8c 6b e4 ff ff    	jl     e16e23 <fix_nodes+0x56f3>
7288   e189b8:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
728d   e189bd:	e8 00 00 00 00       	call   e189c2 <fix_nodes+0x7292>	e189be: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7292   e189c2:	e9 5c e4 ff ff       	jmp    e16e23 <fix_nodes+0x56f3>
7297   e189c7:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
729c   e189cc:	80 e1 07             	and    $0x7,%cl
729f   e189cf:	80 c1 03             	add    $0x3,%cl
72a2   e189d2:	38 c1                	cmp    %al,%cl
72a4   e189d4:	0f 8c b3 e3 ff ff    	jl     e16d8d <fix_nodes+0x565d>
72aa   e189da:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
72af   e189df:	e8 00 00 00 00       	call   e189e4 <fix_nodes+0x72b4>	e189e0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
72b4   e189e4:	e9 a4 e3 ff ff       	jmp    e16d8d <fix_nodes+0x565d>
72b9   e189e9:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
72be   e189ee:	80 e1 07             	and    $0x7,%cl
72c1   e189f1:	80 c1 03             	add    $0x3,%cl
72c4   e189f4:	38 c1                	cmp    %al,%cl
72c6   e189f6:	0f 8c c7 e4 ff ff    	jl     e16ec3 <fix_nodes+0x5793>
72cc   e189fc:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
72d1   e18a01:	e8 00 00 00 00       	call   e18a06 <fix_nodes+0x72d6>	e18a02: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
72d6   e18a06:	e9 b8 e4 ff ff       	jmp    e16ec3 <fix_nodes+0x5793>
72db   e18a0b:	e8 00 00 00 00       	call   e18a10 <fix_nodes+0x72e0>	e18a0c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
72e0   e18a10:	48 8b 84 24 f0 00 00 00 	mov    0xf0(%rsp),%rax
72e8   e18a18:	42 8a 04 20          	mov    (%rax,%r12,1),%al
72ec   e18a1c:	84 c0                	test   %al,%al
72ee   e18a1e:	0f 85 79 27 00 00    	jne    e1b19d <fix_nodes+0x9a6d>
72f4   e18a24:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
72f9   e18a29:	89 18                	mov    %ebx,(%rax)
72fb   e18a2b:	4c 63 fb             	movslq %ebx,%r15
72fe   e18a2e:	4c 89 ff             	mov    %r15,%rdi
7301   e18a31:	be 20 2a 00 00       	mov    $0x2a20,%esi
7306   e18a36:	e8 00 00 00 00       	call   e18a3b <fix_nodes+0x730b>	e18a37: R_X86_64_PLT32	__kmalloc-0x4
730b   e18a3b:	48 85 c0             	test   %rax,%rax
730e   e18a3e:	0f 84 c2 00 00 00    	je     e18b06 <fix_nodes+0x73d6>
7314   e18a44:	48 89 c3             	mov    %rax,%rbx
7317   e18a47:	48 8b 84 24 18 01 00 00 	mov    0x118(%rsp),%rax
731f   e18a4f:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
7324   e18a54:	74 08                	je     e18a5e <fix_nodes+0x732e>
7326   e18a56:	4c 89 ef             	mov    %r13,%rdi
7329   e18a59:	e8 00 00 00 00       	call   e18a5e <fix_nodes+0x732e>	e18a5a: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
732e   e18a5e:	49 89 5d 00          	mov    %rbx,0x0(%r13)
7332   e18a62:	4d 85 f6             	test   %r14,%r14
7335   e18a65:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
733a   e18a6a:	0f 84 18 04 00 00    	je     e18e88 <fix_nodes+0x7758>
7340   e18a70:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
7345   e18a75:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
734a   e18a7a:	74 08                	je     e18a84 <fix_nodes+0x7354>
734c   e18a7c:	4c 89 ff             	mov    %r15,%rdi
734f   e18a7f:	e8 00 00 00 00       	call   e18a84 <fix_nodes+0x7354>	e18a80: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7354   e18a84:	bb d8 06 00 00       	mov    $0x6d8,%ebx
7359   e18a89:	49 03 1f             	add    (%r15),%rbx
735c   e18a8c:	48 89 d8             	mov    %rbx,%rax
735f   e18a8f:	48 c1 e8 03          	shr    $0x3,%rax
7363   e18a93:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
7368   e18a98:	74 08                	je     e18aa2 <fix_nodes+0x7372>
736a   e18a9a:	48 89 df             	mov    %rbx,%rdi
736d   e18a9d:	e8 00 00 00 00       	call   e18aa2 <fix_nodes+0x7372>	e18a9e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7372   e18aa2:	41 be 70 01 00 00    	mov    $0x170,%r14d
7378   e18aa8:	4c 03 33             	add    (%rbx),%r14
737b   e18aab:	4c 89 f7             	mov    %r14,%rdi
737e   e18aae:	be 04 00 00 00       	mov    $0x4,%esi
7383   e18ab3:	e8 00 00 00 00       	call   e18ab8 <fix_nodes+0x7388>	e18ab4: R_X86_64_PLT32	__kasan_check_read-0x4
7388   e18ab8:	4c 89 f0             	mov    %r14,%rax
738b   e18abb:	48 c1 e8 03          	shr    $0x3,%rax
738f   e18abf:	42 8a 04 20          	mov    (%rax,%r12,1),%al
7393   e18ac3:	84 c0                	test   %al,%al
7395   e18ac5:	0f 85 43 27 00 00    	jne    e1b20e <fix_nodes+0x9ade>
739b   e18acb:	45 8b 36             	mov    (%r14),%r14d
739e   e18ace:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
73a6   e18ad6:	42 8a 04 20          	mov    (%rax,%r12,1),%al
73aa   e18ada:	84 c0                	test   %al,%al
73ac   e18adc:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
73b1   e18ae1:	0f 85 45 27 00 00    	jne    e1b22c <fix_nodes+0x9afc>
73b7   e18ae7:	8b 1a                	mov    (%rdx),%ebx
73b9   e18ae9:	44 89 f7             	mov    %r14d,%edi
73bc   e18aec:	89 de                	mov    %ebx,%esi
73be   e18aee:	e8 00 00 00 00       	call   e18af3 <fix_nodes+0x73c3>	e18aef: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
73c3   e18af3:	41 39 de             	cmp    %ebx,%r14d
73c6   e18af6:	0f 85 a2 03 00 00    	jne    e18e9e <fix_nodes+0x776e>
73cc   e18afc:	e8 00 00 00 00       	call   e18b01 <fix_nodes+0x73d1>	e18afd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
73d1   e18b01:	e9 b3 94 ff ff       	jmp    e11fb9 <fix_nodes+0x889>
73d6   e18b06:	4c 89 bc 24 e8 00 00 00 	mov    %r15,0xe8(%rsp)
73de   e18b0e:	4c 89 ac 24 c0 00 00 00 	mov    %r13,0xc0(%rsp)
73e6   e18b16:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
73eb   e18b1b:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
73f0   e18b20:	74 0a                	je     e18b2c <fix_nodes+0x73fc>
73f2   e18b22:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
73f7   e18b27:	e8 00 00 00 00       	call   e18b2c <fix_nodes+0x73fc>	e18b28: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
73fc   e18b2c:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
7401   e18b31:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
7405   e18b35:	e8 00 00 00 00       	call   e18b3a <fix_nodes+0x740a>	e18b36: R_X86_64_PLT32	pathrelse-0x4
740a   e18b3a:	45 31 ed             	xor    %r13d,%r13d
740d   e18b3d:	4e 8d 34 2b          	lea    (%rbx,%r13,1),%r14
7411   e18b41:	49 83 c6 20          	add    $0x20,%r14
7415   e18b45:	4d 89 f7             	mov    %r14,%r15
7418   e18b48:	49 c1 ef 03          	shr    $0x3,%r15
741c   e18b4c:	43 80 3c 27 00       	cmpb   $0x0,(%r15,%r12,1)
7421   e18b51:	74 08                	je     e18b5b <fix_nodes+0x742b>
7423   e18b53:	4c 89 f7             	mov    %r14,%rdi
7426   e18b56:	e8 00 00 00 00       	call   e18b5b <fix_nodes+0x742b>	e18b57: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
742b   e18b5b:	4a 8b 5c 2b 20       	mov    0x20(%rbx,%r13,1),%rbx
7430   e18b60:	48 85 db             	test   %rbx,%rbx
7433   e18b63:	74 0f                	je     e18b74 <fix_nodes+0x7444>
7435   e18b65:	e8 00 00 00 00       	call   e18b6a <fix_nodes+0x743a>	e18b66: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
743a   e18b6a:	48 89 df             	mov    %rbx,%rdi
743d   e18b6d:	e8 00 00 00 00       	call   e18b72 <fix_nodes+0x7442>	e18b6e: R_X86_64_PLT32	__brelse-0x4
7442   e18b72:	eb 05                	jmp    e18b79 <fix_nodes+0x7449>
7444   e18b74:	e8 00 00 00 00       	call   e18b79 <fix_nodes+0x7449>	e18b75: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7449   e18b79:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
744e   e18b7e:	4a 8d 04 2b          	lea    (%rbx,%r13,1),%rax
7452   e18b82:	48 83 c0 48          	add    $0x48,%rax
7456   e18b86:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
745b   e18b8b:	48 c1 e8 03          	shr    $0x3,%rax
745f   e18b8f:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
7464   e18b94:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
7469   e18b99:	74 0a                	je     e18ba5 <fix_nodes+0x7475>
746b   e18b9b:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
7470   e18ba0:	e8 00 00 00 00       	call   e18ba5 <fix_nodes+0x7475>	e18ba1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7475   e18ba5:	4a 8b 5c 2b 48       	mov    0x48(%rbx,%r13,1),%rbx
747a   e18baa:	48 85 db             	test   %rbx,%rbx
747d   e18bad:	74 0f                	je     e18bbe <fix_nodes+0x748e>
747f   e18baf:	e8 00 00 00 00       	call   e18bb4 <fix_nodes+0x7484>	e18bb0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7484   e18bb4:	48 89 df             	mov    %rbx,%rdi
7487   e18bb7:	e8 00 00 00 00       	call   e18bbc <fix_nodes+0x748c>	e18bb8: R_X86_64_PLT32	__brelse-0x4
748c   e18bbc:	eb 05                	jmp    e18bc3 <fix_nodes+0x7493>
748e   e18bbe:	e8 00 00 00 00       	call   e18bc3 <fix_nodes+0x7493>	e18bbf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7493   e18bc3:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
7498   e18bc8:	4a 8d 04 2b          	lea    (%rbx,%r13,1),%rax
749c   e18bcc:	48 83 c0 70          	add    $0x70,%rax
74a0   e18bd0:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
74a5   e18bd5:	48 c1 e8 03          	shr    $0x3,%rax
74a9   e18bd9:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
74ae   e18bde:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
74b3   e18be3:	74 0a                	je     e18bef <fix_nodes+0x74bf>
74b5   e18be5:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
74ba   e18bea:	e8 00 00 00 00       	call   e18bef <fix_nodes+0x74bf>	e18beb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
74bf   e18bef:	4a 8b 5c 2b 70       	mov    0x70(%rbx,%r13,1),%rbx
74c4   e18bf4:	48 85 db             	test   %rbx,%rbx
74c7   e18bf7:	4c 89 7c 24 10       	mov    %r15,0x10(%rsp)
74cc   e18bfc:	74 0f                	je     e18c0d <fix_nodes+0x74dd>
74ce   e18bfe:	e8 00 00 00 00       	call   e18c03 <fix_nodes+0x74d3>	e18bff: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
74d3   e18c03:	48 89 df             	mov    %rbx,%rdi
74d6   e18c06:	e8 00 00 00 00       	call   e18c0b <fix_nodes+0x74db>	e18c07: R_X86_64_PLT32	__brelse-0x4
74db   e18c0b:	eb 05                	jmp    e18c12 <fix_nodes+0x74e2>
74dd   e18c0d:	e8 00 00 00 00       	call   e18c12 <fix_nodes+0x74e2>	e18c0e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
74e2   e18c12:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
74e7   e18c17:	4e 8d 3c 2b          	lea    (%rbx,%r13,1),%r15
74eb   e18c1b:	49 81 c7 98 00 00 00 	add    $0x98,%r15
74f2   e18c22:	4c 89 7c 24 58       	mov    %r15,0x58(%rsp)
74f7   e18c27:	49 c1 ef 03          	shr    $0x3,%r15
74fb   e18c2b:	43 80 3c 27 00       	cmpb   $0x0,(%r15,%r12,1)
7500   e18c30:	74 0a                	je     e18c3c <fix_nodes+0x750c>
7502   e18c32:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
7507   e18c37:	e8 00 00 00 00       	call   e18c3c <fix_nodes+0x750c>	e18c38: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
750c   e18c3c:	4a 8b 9c 2b 98 00 00 00 	mov    0x98(%rbx,%r13,1),%rbx
7514   e18c44:	48 85 db             	test   %rbx,%rbx
7517   e18c47:	4c 89 74 24 78       	mov    %r14,0x78(%rsp)
751c   e18c4c:	74 0f                	je     e18c5d <fix_nodes+0x752d>
751e   e18c4e:	e8 00 00 00 00       	call   e18c53 <fix_nodes+0x7523>	e18c4f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7523   e18c53:	48 89 df             	mov    %rbx,%rdi
7526   e18c56:	e8 00 00 00 00       	call   e18c5b <fix_nodes+0x752b>	e18c57: R_X86_64_PLT32	__brelse-0x4
752b   e18c5b:	eb 05                	jmp    e18c62 <fix_nodes+0x7532>
752d   e18c5d:	e8 00 00 00 00       	call   e18c62 <fix_nodes+0x7532>	e18c5e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7532   e18c62:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
7537   e18c67:	4e 8d 34 2b          	lea    (%rbx,%r13,1),%r14
753b   e18c6b:	49 81 c6 c0 00 00 00 	add    $0xc0,%r14
7542   e18c72:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
7547   e18c77:	49 c1 ee 03          	shr    $0x3,%r14
754b   e18c7b:	43 80 3c 26 00       	cmpb   $0x0,(%r14,%r12,1)
7550   e18c80:	74 0a                	je     e18c8c <fix_nodes+0x755c>
7552   e18c82:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
7557   e18c87:	e8 00 00 00 00       	call   e18c8c <fix_nodes+0x755c>	e18c88: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
755c   e18c8c:	4a 8b 9c 2b c0 00 00 00 	mov    0xc0(%rbx,%r13,1),%rbx
7564   e18c94:	48 85 db             	test   %rbx,%rbx
7567   e18c97:	74 0f                	je     e18ca8 <fix_nodes+0x7578>
7569   e18c99:	e8 00 00 00 00       	call   e18c9e <fix_nodes+0x756e>	e18c9a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
756e   e18c9e:	48 89 df             	mov    %rbx,%rdi
7571   e18ca1:	e8 00 00 00 00       	call   e18ca6 <fix_nodes+0x7576>	e18ca2: R_X86_64_PLT32	__brelse-0x4
7576   e18ca6:	eb 05                	jmp    e18cad <fix_nodes+0x757d>
7578   e18ca8:	e8 00 00 00 00       	call   e18cad <fix_nodes+0x757d>	e18ca9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
757d   e18cad:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
7582   e18cb2:	4e 8d 24 2b          	lea    (%rbx,%r13,1),%r12
7586   e18cb6:	49 81 c4 e8 00 00 00 	add    $0xe8,%r12
758d   e18cbd:	4c 89 64 24 18       	mov    %r12,0x18(%rsp)
7592   e18cc2:	49 c1 ec 03          	shr    $0x3,%r12
7596   e18cc6:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
75a0   e18cd0:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
75a5   e18cd5:	74 0a                	je     e18ce1 <fix_nodes+0x75b1>
75a7   e18cd7:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
75ac   e18cdc:	e8 00 00 00 00       	call   e18ce1 <fix_nodes+0x75b1>	e18cdd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
75b1   e18ce1:	4a 8b 9c 2b e8 00 00 00 	mov    0xe8(%rbx,%r13,1),%rbx
75b9   e18ce9:	48 85 db             	test   %rbx,%rbx
75bc   e18cec:	74 0f                	je     e18cfd <fix_nodes+0x75cd>
75be   e18cee:	e8 00 00 00 00       	call   e18cf3 <fix_nodes+0x75c3>	e18cef: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
75c3   e18cf3:	48 89 df             	mov    %rbx,%rdi
75c6   e18cf6:	e8 00 00 00 00       	call   e18cfb <fix_nodes+0x75cb>	e18cf7: R_X86_64_PLT32	__brelse-0x4
75cb   e18cfb:	eb 05                	jmp    e18d02 <fix_nodes+0x75d2>
75cd   e18cfd:	e8 00 00 00 00       	call   e18d02 <fix_nodes+0x75d2>	e18cfe: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
75d2   e18d02:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
75dc   e18d0c:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
75e1   e18d11:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
75e5   e18d15:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
75ea   e18d1a:	74 0a                	je     e18d26 <fix_nodes+0x75f6>
75ec   e18d1c:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
75f1   e18d21:	e8 00 00 00 00       	call   e18d26 <fix_nodes+0x75f6>	e18d22: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
75f6   e18d26:	4a c7 44 2b 20 00 00 00 00 	movq   $0x0,0x20(%rbx,%r13,1)
75ff   e18d2f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7609   e18d39:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
760e   e18d3e:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
7612   e18d42:	74 0a                	je     e18d4e <fix_nodes+0x761e>
7614   e18d44:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
7619   e18d49:	e8 00 00 00 00       	call   e18d4e <fix_nodes+0x761e>	e18d4a: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
761e   e18d4e:	4a c7 44 2b 48 00 00 00 00 	movq   $0x0,0x48(%rbx,%r13,1)
7627   e18d57:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7631   e18d61:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
7636   e18d66:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
763a   e18d6a:	74 0a                	je     e18d76 <fix_nodes+0x7646>
763c   e18d6c:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
7641   e18d71:	e8 00 00 00 00       	call   e18d76 <fix_nodes+0x7646>	e18d72: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
7646   e18d76:	4a c7 44 2b 70 00 00 00 00 	movq   $0x0,0x70(%rbx,%r13,1)
764f   e18d7f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7659   e18d89:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
765e   e18d8e:	74 0a                	je     e18d9a <fix_nodes+0x766a>
7660   e18d90:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
7665   e18d95:	e8 00 00 00 00       	call   e18d9a <fix_nodes+0x766a>	e18d96: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
766a   e18d9a:	4a c7 84 2b 98 00 00 00 00 00 00 00 	movq   $0x0,0x98(%rbx,%r13,1)
7676   e18da6:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7680   e18db0:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
7685   e18db5:	74 0a                	je     e18dc1 <fix_nodes+0x7691>
7687   e18db7:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
768c   e18dbc:	e8 00 00 00 00       	call   e18dc1 <fix_nodes+0x7691>	e18dbd: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
7691   e18dc1:	4a c7 84 2b c0 00 00 00 00 00 00 00 	movq   $0x0,0xc0(%rbx,%r13,1)
769d   e18dcd:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
76a7   e18dd7:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
76ac   e18ddc:	49 89 c4             	mov    %rax,%r12
76af   e18ddf:	4c 8b b4 24 e8 00 00 00 	mov    0xe8(%rsp),%r14
76b7   e18de7:	74 0a                	je     e18df3 <fix_nodes+0x76c3>
76b9   e18de9:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
76be   e18dee:	e8 00 00 00 00       	call   e18df3 <fix_nodes+0x76c3>	e18def: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
76c3   e18df3:	4a c7 84 2b e8 00 00 00 00 00 00 00 	movq   $0x0,0xe8(%rbx,%r13,1)
76cf   e18dff:	49 83 fd 20          	cmp    $0x20,%r13
76d3   e18e03:	74 0e                	je     e18e13 <fix_nodes+0x76e3>
76d5   e18e05:	e8 00 00 00 00       	call   e18e0a <fix_nodes+0x76da>	e18e06: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
76da   e18e0a:	49 83 c5 08          	add    $0x8,%r13
76de   e18e0e:	e9 2a fd ff ff       	jmp    e18b3d <fix_nodes+0x740d>
76e3   e18e13:	4c 89 f7             	mov    %r14,%rdi
76e6   e18e16:	be 40 0c 00 00       	mov    $0xc40,%esi
76eb   e18e1b:	e8 00 00 00 00       	call   e18e20 <fix_nodes+0x76f0>	e18e1c: R_X86_64_PLT32	__kmalloc-0x4
76f0   e18e20:	48 85 c0             	test   %rax,%rax
76f3   e18e23:	0f 84 83 11 00 00    	je     e19fac <fix_nodes+0x887c>
76f9   e18e29:	48 89 c3             	mov    %rax,%rbx
76fc   e18e2c:	e8 00 00 00 00       	call   e18e31 <fix_nodes+0x7701>	e18e2d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7701   e18e31:	4c 8b b4 24 c0 00 00 00 	mov    0xc0(%rsp),%r14
7709   e18e39:	e9 9c 11 00 00       	jmp    e19fda <fix_nodes+0x88aa>
770e   e18e3e:	83 fb fc             	cmp    $0xfffffffc,%ebx
7711   e18e41:	0f 85 bc 11 00 00    	jne    e1a003 <fix_nodes+0x88d3>
7717   e18e47:	e8 00 00 00 00       	call   e18e4c <fix_nodes+0x771c>	e18e48: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
771c   e18e4c:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
7721   e18e51:	48 89 df             	mov    %rbx,%rdi
7724   e18e54:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
7729   e18e59:	44 89 ee             	mov    %r13d,%esi
772c   e18e5c:	e8 8f 27 00 00       	call   e1b5f0 <get_neighbors>
7731   e18e61:	89 c3                	mov    %eax,%ebx
7733   e18e63:	31 ff                	xor    %edi,%edi
7735   e18e65:	89 c6                	mov    %eax,%esi
7737   e18e67:	e8 00 00 00 00       	call   e18e6c <fix_nodes+0x773c>	e18e68: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
773c   e18e6c:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
7741   e18e71:	85 db                	test   %ebx,%ebx
7743   e18e73:	0f 84 53 13 00 00    	je     e1a1cc <fix_nodes+0x8a9c>
7749   e18e79:	e8 00 00 00 00       	call   e18e7e <fix_nodes+0x774e>	e18e7a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
774e   e18e7e:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
7753   e18e83:	e9 85 12 00 00       	jmp    e1a10d <fix_nodes+0x89dd>
7758   e18e88:	e8 00 00 00 00       	call   e18e8d <fix_nodes+0x775d>	e18e89: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
775d   e18e8d:	e9 27 91 ff ff       	jmp    e11fb9 <fix_nodes+0x889>
7762   e18e92:	e8 00 00 00 00       	call   e18e97 <fix_nodes+0x7767>	e18e93: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7767   e18e97:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
776c   e18e9c:	eb 51                	jmp    e18eef <fix_nodes+0x77bf>
776e   e18e9e:	e8 00 00 00 00       	call   e18ea3 <fix_nodes+0x7773>	e18e9f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7773   e18ea3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
7778   e18ea8:	e9 b9 1b 00 00       	jmp    e1aa66 <fix_nodes+0x9336>
777d   e18ead:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
7782   e18eb2:	e8 00 00 00 00       	call   e18eb7 <fix_nodes+0x7787>	e18eb3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7787   e18eb7:	4c 89 fb             	mov    %r15,%rbx
778a   e18eba:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
778f   e18ebf:	e9 49 12 00 00       	jmp    e1a10d <fix_nodes+0x89dd>
7794   e18ec4:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
7799   e18ec9:	e8 00 00 00 00       	call   e18ece <fix_nodes+0x779e>	e18eca: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
779e   e18ece:	4c 89 fb             	mov    %r15,%rbx
77a1   e18ed1:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
77ab   e18edb:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
77b0   e18ee0:	e9 28 12 00 00       	jmp    e1a10d <fix_nodes+0x89dd>
77b5   e18ee5:	e8 00 00 00 00       	call   e18eea <fix_nodes+0x77ba>	e18ee6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
77ba   e18eea:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
77bf   e18eef:	48 8d 83 10 01 00 00 	lea    0x110(%rbx),%rax
77c6   e18ef6:	48 89 84 24 d8 00 00 00 	mov    %rax,0xd8(%rsp)
77ce   e18efe:	31 c0                	xor    %eax,%eax
77d0   e18f00:	48 89 84 24 c0 00 00 00 	mov    %rax,0xc0(%rsp)
77d8   e18f08:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
77dd   e18f0d:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
77e2   e18f12:	74 08                	je     e18f1c <fix_nodes+0x77ec>
77e4   e18f14:	4c 89 f7             	mov    %r14,%rdi
77e7   e18f17:	e8 00 00 00 00       	call   e18f1c <fix_nodes+0x77ec>	e18f18: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
77ec   e18f1c:	49 8b 1e             	mov    (%r14),%rbx
77ef   e18f1f:	48 89 d8             	mov    %rbx,%rax
77f2   e18f22:	48 c1 e8 03          	shr    $0x3,%rax
77f6   e18f26:	42 8a 04 20          	mov    (%rax,%r12,1),%al
77fa   e18f2a:	84 c0                	test   %al,%al
77fc   e18f2c:	0f 85 55 0f 00 00    	jne    e19e87 <fix_nodes+0x8757>
7802   e18f32:	44 8b 2b             	mov    (%rbx),%r13d
7805   e18f35:	bf 01 00 00 00       	mov    $0x1,%edi
780a   e18f3a:	44 89 ee             	mov    %r13d,%esi
780d   e18f3d:	e8 00 00 00 00       	call   e18f42 <fix_nodes+0x7812>	e18f3e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
7812   e18f42:	41 83 fd 01          	cmp    $0x1,%r13d
7816   e18f46:	0f 8e 38 04 00 00    	jle    e19384 <fix_nodes+0x7c54>
781c   e18f4c:	44 89 e8             	mov    %r13d,%eax
781f   e18f4f:	f7 d8                	neg    %eax
7821   e18f51:	89 44 24 30          	mov    %eax,0x30(%rsp)
7825   e18f55:	4d 89 ef             	mov    %r13,%r15
7828   e18f58:	49 c1 e7 04          	shl    $0x4,%r15
782c   e18f5c:	49 83 cf 08          	or     $0x8,%r15
7830   e18f60:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
7835   e18f65:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
783a   e18f6a:	74 08                	je     e18f74 <fix_nodes+0x7844>
783c   e18f6c:	4c 89 f7             	mov    %r14,%rdi
783f   e18f6f:	e8 00 00 00 00       	call   e18f74 <fix_nodes+0x7844>	e18f70: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7844   e18f74:	49 8b 1e             	mov    (%r14),%rbx
7847   e18f77:	bf 08 00 00 00       	mov    $0x8,%edi
784c   e18f7c:	44 89 ee             	mov    %r13d,%esi
784f   e18f7f:	e8 00 00 00 00       	call   e18f84 <fix_nodes+0x7854>	e18f80: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
7854   e18f84:	41 83 fd 07          	cmp    $0x7,%r13d
7858   e18f88:	0f 87 ee 02 00 00    	ja     e1927c <fix_nodes+0x7b4c>
785e   e18f8e:	e8 00 00 00 00       	call   e18f93 <fix_nodes+0x7863>	e18f8f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7863   e18f93:	49 8d 3c 1f          	lea    (%r15,%rbx,1),%rdi
7867   e18f97:	48 89 f8             	mov    %rdi,%rax
786a   e18f9a:	48 c1 e8 03          	shr    $0x3,%rax
786e   e18f9e:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
7873   e18fa3:	74 05                	je     e18faa <fix_nodes+0x787a>
7875   e18fa5:	e8 00 00 00 00       	call   e18faa <fix_nodes+0x787a>	e18fa6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
787a   e18faa:	4a 83 3c 3b 00       	cmpq   $0x0,(%rbx,%r15,1)
787f   e18faf:	0f 84 fd 00 00 00    	je     e190b2 <fix_nodes+0x7982>
7885   e18fb5:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
788a   e18fba:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
788f   e18fbf:	74 08                	je     e18fc9 <fix_nodes+0x7899>
7891   e18fc1:	4c 89 f7             	mov    %r14,%rdi
7894   e18fc4:	e8 00 00 00 00       	call   e18fc9 <fix_nodes+0x7899>	e18fc5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7899   e18fc9:	4d 8b 36             	mov    (%r14),%r14
789c   e18fcc:	4c 89 f0             	mov    %r14,%rax
789f   e18fcf:	48 c1 e8 03          	shr    $0x3,%rax
78a3   e18fd3:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
78a8   e18fd8:	84 c0                	test   %al,%al
78aa   e18fda:	0f 85 61 02 00 00    	jne    e19241 <fix_nodes+0x7b11>
78b0   e18fe0:	49 63 1e             	movslq (%r14),%rbx
78b3   e18fe3:	bf 08 00 00 00       	mov    $0x8,%edi
78b8   e18fe8:	89 de                	mov    %ebx,%esi
78ba   e18fea:	e8 00 00 00 00       	call   e18fef <fix_nodes+0x78bf>	e18feb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
78bf   e18fef:	48 83 fb 07          	cmp    $0x7,%rbx
78c3   e18ff3:	0f 87 9c 02 00 00    	ja     e19295 <fix_nodes+0x7b65>
78c9   e18ff9:	e8 00 00 00 00       	call   e18ffe <fix_nodes+0x78ce>	e18ffa: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
78ce   e18ffe:	48 c1 e3 04          	shl    $0x4,%rbx
78d2   e19002:	4c 01 f3             	add    %r14,%rbx
78d5   e19005:	48 83 c3 08          	add    $0x8,%rbx
78d9   e19009:	48 89 d8             	mov    %rbx,%rax
78dc   e1900c:	48 c1 e8 03          	shr    $0x3,%rax
78e0   e19010:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
78e5   e19015:	74 08                	je     e1901f <fix_nodes+0x78ef>
78e7   e19017:	48 89 df             	mov    %rbx,%rdi
78ea   e1901a:	e8 00 00 00 00       	call   e1901f <fix_nodes+0x78ef>	e1901b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
78ef   e1901f:	48 8b 03             	mov    (%rbx),%rax
78f2   e19022:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
78f7   e19027:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
78fc   e1902c:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
7901   e19031:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
7906   e19036:	74 08                	je     e19040 <fix_nodes+0x7910>
7908   e19038:	48 89 df             	mov    %rbx,%rdi
790b   e1903b:	e8 00 00 00 00       	call   e19040 <fix_nodes+0x7910>	e1903c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7910   e19040:	48 8b 1b             	mov    (%rbx),%rbx
7913   e19043:	41 83 fd 07          	cmp    $0x7,%r13d
7917   e19047:	0f 87 61 02 00 00    	ja     e192ae <fix_nodes+0x7b7e>
791d   e1904d:	49 8d 3c 1f          	lea    (%r15,%rbx,1),%rdi
7921   e19051:	48 89 f8             	mov    %rdi,%rax
7924   e19054:	48 c1 e8 03          	shr    $0x3,%rax
7928   e19058:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
792d   e1905d:	74 05                	je     e19064 <fix_nodes+0x7934>
792f   e1905f:	e8 00 00 00 00       	call   e19064 <fix_nodes+0x7934>	e19060: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7934   e19064:	4e 8b 24 3b          	mov    (%rbx,%r15,1),%r12
7938   e19068:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7942   e19072:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
7947   e19077:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
794b   e1907b:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
7950   e19080:	74 08                	je     e1908a <fix_nodes+0x795a>
7952   e19082:	4c 89 f7             	mov    %r14,%rdi
7955   e19085:	e8 00 00 00 00       	call   e1908a <fix_nodes+0x795a>	e19086: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
795a   e1908a:	49 8b 06             	mov    (%r14),%rax
795d   e1908d:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
7962   e19092:	4c 39 64 24 10       	cmp    %r12,0x10(%rsp)
7967   e19097:	74 26                	je     e190bf <fix_nodes+0x798f>
7969   e19099:	e8 00 00 00 00       	call   e1909e <fix_nodes+0x796e>	e1909a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
796e   e1909e:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
7978   e190a8:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
797d   e190ad:	e9 cd 00 00 00       	jmp    e1917f <fix_nodes+0x7a4f>
7982   e190b2:	e8 00 00 00 00       	call   e190b7 <fix_nodes+0x7987>	e190b3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7987   e190b7:	45 31 e4             	xor    %r12d,%r12d
798a   e190ba:	e9 41 01 00 00       	jmp    e19200 <fix_nodes+0x7ad0>
798f   e190bf:	e8 00 00 00 00       	call   e190c4 <fix_nodes+0x7994>	e190c0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7994   e190c4:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
799e   e190ce:	49 8d 3c 1f          	lea    (%r15,%rbx,1),%rdi
79a2   e190d2:	48 89 f8             	mov    %rdi,%rax
79a5   e190d5:	48 c1 e8 03          	shr    $0x3,%rax
79a9   e190d9:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
79ae   e190de:	74 05                	je     e190e5 <fix_nodes+0x79b5>
79b0   e190e0:	e8 00 00 00 00       	call   e190e5 <fix_nodes+0x79b5>	e190e1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
79b5   e190e5:	4e 8b 34 3b          	mov    (%rbx,%r15,1),%r14
79b9   e190e9:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
79be   e190ee:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
79c3   e190f3:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
79c8   e190f8:	74 08                	je     e19102 <fix_nodes+0x79d2>
79ca   e190fa:	48 89 df             	mov    %rbx,%rdi
79cd   e190fd:	e8 00 00 00 00       	call   e19102 <fix_nodes+0x79d2>	e190fe: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
79d2   e19102:	48 8b 1b             	mov    (%rbx),%rbx
79d5   e19105:	48 89 d8             	mov    %rbx,%rax
79d8   e19108:	48 c1 e8 03          	shr    $0x3,%rax
79dc   e1910c:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
79e1   e19111:	84 c0                	test   %al,%al
79e3   e19113:	0f 85 46 01 00 00    	jne    e1925f <fix_nodes+0x7b2f>
79e9   e19119:	8b 0b                	mov    (%rbx),%ecx
79eb   e1911b:	03 4c 24 30          	add    0x30(%rsp),%ecx
79ef   e1911f:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
79f4   e19124:	4c 89 f6             	mov    %r14,%rsi
79f7   e19127:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e1912a: R_X86_64_32S	.rodata+0x1bb9a0
79fe   e1912e:	e8 8d e4 00 00       	call   e275c0 <tb_buffer_sanity_check>
7a03   e19133:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
7a08   e19138:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
7a0d   e1913d:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
7a12   e19142:	74 08                	je     e1914c <fix_nodes+0x7a1c>
7a14   e19144:	48 89 df             	mov    %rbx,%rdi
7a17   e19147:	e8 00 00 00 00       	call   e1914c <fix_nodes+0x7a1c>	e19148: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7a1c   e1914c:	48 8b 03             	mov    (%rbx),%rax
7a1f   e1914f:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
7a24   e19154:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
7a29   e19159:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
7a2e   e1915e:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
7a33   e19163:	74 08                	je     e1916d <fix_nodes+0x7a3d>
7a35   e19165:	4c 89 f7             	mov    %r14,%rdi
7a38   e19168:	e8 00 00 00 00       	call   e1916d <fix_nodes+0x7a3d>	e19169: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7a3d   e1916d:	49 8b 1e             	mov    (%r14),%rbx
7a40   e19170:	41 83 fd 08          	cmp    $0x8,%r13d
7a44   e19174:	0f 83 bf 01 00 00    	jae    e19339 <fix_nodes+0x7c09>
7a4a   e1917a:	e8 00 00 00 00       	call   e1917f <fix_nodes+0x7a4f>	e1917b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7a4f   e1917f:	49 8d 3c 1f          	lea    (%r15,%rbx,1),%rdi
7a53   e19183:	48 89 f8             	mov    %rdi,%rax
7a56   e19186:	48 c1 e8 03          	shr    $0x3,%rax
7a5a   e1918a:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
7a5f   e1918f:	74 05                	je     e19196 <fix_nodes+0x7a66>
7a61   e19191:	e8 00 00 00 00       	call   e19196 <fix_nodes+0x7a66>	e19192: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7a66   e19196:	4a 8b 34 3b          	mov    (%rbx,%r15,1),%rsi
7a6a   e1919a:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
7a6f   e1919f:	31 d2                	xor    %edx,%edx
7a71   e191a1:	e8 00 00 00 00       	call   e191a6 <fix_nodes+0x7a76>	e191a2: R_X86_64_PLT32	reiserfs_prepare_for_journal-0x4
7a76   e191a6:	89 c3                	mov    %eax,%ebx
7a78   e191a8:	31 ff                	xor    %edi,%edi
7a7a   e191aa:	89 c6                	mov    %eax,%esi
7a7c   e191ac:	e8 00 00 00 00       	call   e191b1 <fix_nodes+0x7a81>	e191ad: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
7a81   e191b1:	85 db                	test   %ebx,%ebx
7a83   e191b3:	74 0a                	je     e191bf <fix_nodes+0x7a8f>
7a85   e191b5:	e8 00 00 00 00       	call   e191ba <fix_nodes+0x7a8a>	e191b6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7a8a   e191ba:	45 31 e4             	xor    %r12d,%r12d
7a8d   e191bd:	eb 41                	jmp    e19200 <fix_nodes+0x7ad0>
7a8f   e191bf:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
7a94   e191c4:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
7a99   e191c9:	74 08                	je     e191d3 <fix_nodes+0x7aa3>
7a9b   e191cb:	4c 89 f7             	mov    %r14,%rdi
7a9e   e191ce:	e8 00 00 00 00       	call   e191d3 <fix_nodes+0x7aa3>	e191cf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7aa3   e191d3:	49 8b 1e             	mov    (%r14),%rbx
7aa6   e191d6:	41 83 fd 07          	cmp    $0x7,%r13d
7aaa   e191da:	0f 87 72 01 00 00    	ja     e19352 <fix_nodes+0x7c22>
7ab0   e191e0:	e8 00 00 00 00       	call   e191e5 <fix_nodes+0x7ab5>	e191e1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7ab5   e191e5:	49 8d 3c 1f          	lea    (%r15,%rbx,1),%rdi
7ab9   e191e9:	48 89 f8             	mov    %rdi,%rax
7abc   e191ec:	48 c1 e8 03          	shr    $0x3,%rax
7ac0   e191f0:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
7ac5   e191f5:	74 05                	je     e191fc <fix_nodes+0x7acc>
7ac7   e191f7:	e8 00 00 00 00       	call   e191fc <fix_nodes+0x7acc>	e191f8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7acc   e191fc:	4e 8b 24 3b          	mov    (%rbx,%r15,1),%r12
7ad0   e19200:	bf 02 00 00 00       	mov    $0x2,%edi
7ad5   e19205:	44 89 ee             	mov    %r13d,%esi
7ad8   e19208:	e8 00 00 00 00       	call   e1920d <fix_nodes+0x7add>	e19209: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
7add   e1920d:	4d 85 e4             	test   %r12,%r12
7ae0   e19210:	0f 85 75 01 00 00    	jne    e1938b <fix_nodes+0x7c5b>
7ae6   e19216:	41 83 fd 03          	cmp    $0x3,%r13d
7aea   e1921a:	0f 82 6b 01 00 00    	jb     e1938b <fix_nodes+0x7c5b>
7af0   e19220:	e8 00 00 00 00       	call   e19225 <fix_nodes+0x7af5>	e19221: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7af5   e19225:	83 44 24 30 01       	addl   $0x1,0x30(%rsp)
7afa   e1922a:	49 83 c7 f0          	add    $0xfffffffffffffff0,%r15
7afe   e1922e:	49 83 c5 ff          	add    $0xffffffffffffffff,%r13
7b02   e19232:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
7b0c   e1923c:	e9 1f fd ff ff       	jmp    e18f60 <fix_nodes+0x7830>
7b11   e19241:	44 89 f1             	mov    %r14d,%ecx
7b14   e19244:	80 e1 07             	and    $0x7,%cl
7b17   e19247:	80 c1 03             	add    $0x3,%cl
7b1a   e1924a:	38 c1                	cmp    %al,%cl
7b1c   e1924c:	0f 8c 8e fd ff ff    	jl     e18fe0 <fix_nodes+0x78b0>
7b22   e19252:	4c 89 f7             	mov    %r14,%rdi
7b25   e19255:	e8 00 00 00 00       	call   e1925a <fix_nodes+0x7b2a>	e19256: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7b2a   e1925a:	e9 81 fd ff ff       	jmp    e18fe0 <fix_nodes+0x78b0>
7b2f   e1925f:	89 d9                	mov    %ebx,%ecx
7b31   e19261:	80 e1 07             	and    $0x7,%cl
7b34   e19264:	80 c1 03             	add    $0x3,%cl
7b37   e19267:	38 c1                	cmp    %al,%cl
7b39   e19269:	0f 8c aa fe ff ff    	jl     e19119 <fix_nodes+0x79e9>
7b3f   e1926f:	48 89 df             	mov    %rbx,%rdi
7b42   e19272:	e8 00 00 00 00       	call   e19277 <fix_nodes+0x7b47>	e19273: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7b47   e19277:	e9 9d fe ff ff       	jmp    e19119 <fix_nodes+0x79e9>
7b4c   e1927c:	e8 00 00 00 00       	call   e19281 <fix_nodes+0x7b51>	e1927d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7b51   e19281:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e19284: R_X86_64_32S	.data+0x66ecb0
7b58   e19288:	4c 89 ee             	mov    %r13,%rsi
7b5b   e1928b:	e8 00 00 00 00       	call   e19290 <fix_nodes+0x7b60>	e1928c: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
7b60   e19290:	e9 fe fc ff ff       	jmp    e18f93 <fix_nodes+0x7863>
7b65   e19295:	e8 00 00 00 00       	call   e1929a <fix_nodes+0x7b6a>	e19296: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7b6a   e1929a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e1929d: R_X86_64_32S	.data+0x66ecd0
7b71   e192a1:	48 89 de             	mov    %rbx,%rsi
7b74   e192a4:	e8 00 00 00 00       	call   e192a9 <fix_nodes+0x7b79>	e192a5: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
7b79   e192a9:	e9 50 fd ff ff       	jmp    e18ffe <fix_nodes+0x78ce>
7b7e   e192ae:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e192b1: R_X86_64_32S	.data+0x66ecf0
7b85   e192b5:	4c 89 ee             	mov    %r13,%rsi
7b88   e192b8:	e8 00 00 00 00       	call   e192bd <fix_nodes+0x7b8d>	e192b9: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
7b8d   e192bd:	49 8d 3c 1f          	lea    (%r15,%rbx,1),%rdi
7b91   e192c1:	48 89 f8             	mov    %rdi,%rax
7b94   e192c4:	48 c1 e8 03          	shr    $0x3,%rax
7b98   e192c8:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
7b9d   e192cd:	74 05                	je     e192d4 <fix_nodes+0x7ba4>
7b9f   e192cf:	e8 00 00 00 00       	call   e192d4 <fix_nodes+0x7ba4>	e192d0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7ba4   e192d4:	4e 8b 34 3b          	mov    (%rbx,%r15,1),%r14
7ba8   e192d8:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7bb2   e192e2:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
7bb7   e192e7:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
7bbb   e192eb:	74 0a                	je     e192f7 <fix_nodes+0x7bc7>
7bbd   e192ed:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
7bc2   e192f2:	e8 00 00 00 00       	call   e192f7 <fix_nodes+0x7bc7>	e192f3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7bc7   e192f7:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
7bcc   e192fc:	48 8b 00             	mov    (%rax),%rax
7bcf   e192ff:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
7bd4   e19304:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7bde   e1930e:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
7be3   e19313:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
7be7   e19317:	74 0a                	je     e19323 <fix_nodes+0x7bf3>
7be9   e19319:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
7bee   e1931e:	e8 00 00 00 00       	call   e19323 <fix_nodes+0x7bf3>	e1931f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7bf3   e19323:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
7bf8   e19328:	48 8b 18             	mov    (%rax),%rbx
7bfb   e1932b:	4c 39 74 24 10       	cmp    %r14,0x10(%rsp)
7c00   e19330:	74 39                	je     e1936b <fix_nodes+0x7c3b>
7c02   e19332:	e8 00 00 00 00       	call   e19337 <fix_nodes+0x7c07>	e19333: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7c07   e19337:	eb 05                	jmp    e1933e <fix_nodes+0x7c0e>
7c09   e19339:	e8 00 00 00 00       	call   e1933e <fix_nodes+0x7c0e>	e1933a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7c0e   e1933e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e19341: R_X86_64_32S	.data+0x66ed30
7c15   e19345:	4c 89 ee             	mov    %r13,%rsi
7c18   e19348:	e8 00 00 00 00       	call   e1934d <fix_nodes+0x7c1d>	e19349: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
7c1d   e1934d:	e9 4c fd ff ff       	jmp    e1909e <fix_nodes+0x796e>
7c22   e19352:	e8 00 00 00 00       	call   e19357 <fix_nodes+0x7c27>	e19353: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7c27   e19357:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e1935a: R_X86_64_32S	.data+0x66ed50
7c2e   e1935e:	4c 89 ee             	mov    %r13,%rsi
7c31   e19361:	e8 00 00 00 00       	call   e19366 <fix_nodes+0x7c36>	e19362: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
7c36   e19366:	e9 7a fe ff ff       	jmp    e191e5 <fix_nodes+0x7ab5>
7c3b   e1936b:	e8 00 00 00 00       	call   e19370 <fix_nodes+0x7c40>	e1936c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7c40   e19370:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e19373: R_X86_64_32S	.data+0x66ed10
7c47   e19377:	4c 89 ee             	mov    %r13,%rsi
7c4a   e1937a:	e8 00 00 00 00       	call   e1937f <fix_nodes+0x7c4f>	e1937b: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
7c4f   e1937f:	e9 40 fd ff ff       	jmp    e190c4 <fix_nodes+0x7994>
7c54   e19384:	e8 00 00 00 00       	call   e19389 <fix_nodes+0x7c59>	e19385: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7c59   e19389:	eb 23                	jmp    e193ae <fix_nodes+0x7c7e>
7c5b   e1938b:	4d 85 e4             	test   %r12,%r12
7c5e   e1938e:	74 0f                	je     e1939f <fix_nodes+0x7c6f>
7c60   e19390:	e8 00 00 00 00       	call   e19395 <fix_nodes+0x7c65>	e19391: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7c65   e19395:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
7c6a   e1939a:	e9 97 09 00 00       	jmp    e19d36 <fix_nodes+0x8606>
7c6f   e1939f:	e8 00 00 00 00       	call   e193a4 <fix_nodes+0x7c74>	e193a0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7c74   e193a4:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
7c7e   e193ae:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
7c83   e193b3:	b8 68 00 00 00       	mov    $0x68,%eax
7c88   e193b8:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
7c8d   e193bd:	b8 b4 01 00 00       	mov    $0x1b4,%eax
7c92   e193c2:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
7c97   e193c7:	41 bf a0 01 00 00    	mov    $0x1a0,%r15d
7c9d   e193cd:	b8 f0 01 00 00       	mov    $0x1f0,%eax
7ca2   e193d2:	45 31 ed             	xor    %r13d,%r13d
7ca5   e193d5:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
7caa   e193da:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
7cae   e193de:	48 89 f8             	mov    %rdi,%rax
7cb1   e193e1:	48 c1 e8 03          	shr    $0x3,%rax
7cb5   e193e5:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
7cba   e193ea:	84 c0                	test   %al,%al
7cbc   e193ec:	0f 85 dc 07 00 00    	jne    e19bce <fix_nodes+0x849e>
7cc2   e193f2:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
7cc7   e193f7:	44 8b 74 83 50       	mov    0x50(%rbx,%rax,4),%r14d
7ccc   e193fc:	31 ff                	xor    %edi,%edi
7cce   e193fe:	44 89 f6             	mov    %r14d,%esi
7cd1   e19401:	e8 00 00 00 00       	call   e19406 <fix_nodes+0x7cd6>	e19402: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
7cd6   e19406:	45 85 f6             	test   %r14d,%r14d
7cd9   e19409:	0f 84 0d 08 00 00    	je     e19c1c <fix_nodes+0x84ec>
7cdf   e1940f:	4c 89 7c 24 50       	mov    %r15,0x50(%rsp)
7ce4   e19414:	4a 8d 3c 3b          	lea    (%rbx,%r15,1),%rdi
7ce8   e19418:	48 89 f8             	mov    %rdi,%rax
7ceb   e1941b:	48 c1 e8 03          	shr    $0x3,%rax
7cef   e1941f:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
7cf4   e19424:	84 c0                	test   %al,%al
7cf6   e19426:	49 89 df             	mov    %rbx,%r15
7cf9   e19429:	0f 85 b9 07 00 00    	jne    e19be8 <fix_nodes+0x84b8>
7cff   e1942f:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
7d04   e19434:	41 8b 1c 87          	mov    (%r15,%rax,4),%ebx
7d08   e19438:	31 ff                	xor    %edi,%edi
7d0a   e1943a:	89 de                	mov    %ebx,%esi
7d0c   e1943c:	e8 00 00 00 00       	call   e19441 <fix_nodes+0x7d11>	e1943d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
7d11   e19441:	85 db                	test   %ebx,%ebx
7d13   e19443:	0f 84 d9 00 00 00    	je     e19522 <fix_nodes+0x7df2>
7d19   e19449:	4f 8d 34 2f          	lea    (%r15,%r13,1),%r14
7d1d   e1944d:	49 83 c6 20          	add    $0x20,%r14
7d21   e19451:	4c 89 e0             	mov    %r12,%rax
7d24   e19454:	4d 89 f4             	mov    %r14,%r12
7d27   e19457:	49 c1 ec 03          	shr    $0x3,%r12
7d2b   e1945b:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
7d30   e19460:	74 08                	je     e1946a <fix_nodes+0x7d3a>
7d32   e19462:	4c 89 f7             	mov    %r14,%rdi
7d35   e19465:	e8 00 00 00 00       	call   e1946a <fix_nodes+0x7d3a>	e19466: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7d3a   e1946a:	4b 8b 5c 2f 20       	mov    0x20(%r15,%r13,1),%rbx
7d3f   e1946f:	48 85 db             	test   %rbx,%rbx
7d42   e19472:	0f 84 b7 00 00 00    	je     e1952f <fix_nodes+0x7dff>
7d48   e19478:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7d52   e19482:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
7d57   e19487:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
7d5b   e1948b:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
7d60   e19490:	74 08                	je     e1949a <fix_nodes+0x7d6a>
7d62   e19492:	4c 89 ff             	mov    %r15,%rdi
7d65   e19495:	e8 00 00 00 00       	call   e1949a <fix_nodes+0x7d6a>	e19496: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7d6a   e1949a:	49 8b 3f             	mov    (%r15),%rdi
7d6d   e1949d:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
7d72   e194a2:	8d 48 98             	lea    -0x68(%rax),%ecx
7d75   e194a5:	48 89 de             	mov    %rbx,%rsi
7d78   e194a8:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e194ab: R_X86_64_32S	.rodata+0x1bb9c0
7d7f   e194af:	e8 0c e1 00 00       	call   e275c0 <tb_buffer_sanity_check>
7d84   e194b4:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7d8e   e194be:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
7d93   e194c3:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
7d97   e194c7:	74 08                	je     e194d1 <fix_nodes+0x7da1>
7d99   e194c9:	4c 89 ff             	mov    %r15,%rdi
7d9c   e194cc:	e8 00 00 00 00       	call   e194d1 <fix_nodes+0x7da1>	e194cd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7da1   e194d1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
7da6   e194d6:	48 8b 58 08          	mov    0x8(%rax),%rbx
7daa   e194da:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7db4   e194e4:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
7db9   e194e9:	74 08                	je     e194f3 <fix_nodes+0x7dc3>
7dbb   e194eb:	4c 89 f7             	mov    %r14,%rdi
7dbe   e194ee:	e8 00 00 00 00       	call   e194f3 <fix_nodes+0x7dc3>	e194ef: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7dc3   e194f3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
7dc8   e194f8:	4a 8b 74 28 20       	mov    0x20(%rax,%r13,1),%rsi
7dcd   e194fd:	48 89 df             	mov    %rbx,%rdi
7dd0   e19500:	31 d2                	xor    %edx,%edx
7dd2   e19502:	e8 00 00 00 00       	call   e19507 <fix_nodes+0x7dd7>	e19503: R_X86_64_PLT32	reiserfs_prepare_for_journal-0x4
7dd7   e19507:	89 c3                	mov    %eax,%ebx
7dd9   e19509:	31 ff                	xor    %edi,%edi
7ddb   e1950b:	89 c6                	mov    %eax,%esi
7ddd   e1950d:	e8 00 00 00 00       	call   e19512 <fix_nodes+0x7de2>	e1950e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
7de2   e19512:	85 db                	test   %ebx,%ebx
7de4   e19514:	74 2a                	je     e19540 <fix_nodes+0x7e10>
7de6   e19516:	e8 00 00 00 00       	call   e1951b <fix_nodes+0x7deb>	e19517: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7deb   e1951b:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
7df0   e19520:	eb 4f                	jmp    e19571 <fix_nodes+0x7e41>
7df2   e19522:	e8 00 00 00 00       	call   e19527 <fix_nodes+0x7df7>	e19523: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7df7   e19527:	4c 89 fb             	mov    %r15,%rbx
7dfa   e1952a:	e9 8d 02 00 00       	jmp    e197bc <fix_nodes+0x808c>
7dff   e1952f:	e8 00 00 00 00       	call   e19534 <fix_nodes+0x7e04>	e19530: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7e04   e19534:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
7e09   e19539:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
7e0e   e1953e:	eb 31                	jmp    e19571 <fix_nodes+0x7e41>
7e10   e19540:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7e1a   e1954a:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
7e1f   e1954f:	74 08                	je     e19559 <fix_nodes+0x7e29>
7e21   e19551:	4c 89 f7             	mov    %r14,%rdi
7e24   e19554:	e8 00 00 00 00       	call   e19559 <fix_nodes+0x7e29>	e19555: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7e29   e19559:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
7e2e   e1955e:	4e 8b 64 2b 20       	mov    0x20(%rbx,%r13,1),%r12
7e33   e19563:	4d 85 e4             	test   %r12,%r12
7e36   e19566:	0f 85 e9 08 00 00    	jne    e19e55 <fix_nodes+0x8725>
7e3c   e1956c:	e8 00 00 00 00       	call   e19571 <fix_nodes+0x7e41>	e1956d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7e41   e19571:	4e 8d 34 2b          	lea    (%rbx,%r13,1),%r14
7e45   e19575:	49 83 c6 70          	add    $0x70,%r14
7e49   e19579:	4d 89 f4             	mov    %r14,%r12
7e4c   e1957c:	49 c1 ec 03          	shr    $0x3,%r12
7e50   e19580:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7e5a   e1958a:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
7e5f   e1958f:	74 08                	je     e19599 <fix_nodes+0x7e69>
7e61   e19591:	4c 89 f7             	mov    %r14,%rdi
7e64   e19594:	e8 00 00 00 00       	call   e19599 <fix_nodes+0x7e69>	e19595: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7e69   e19599:	4a 8b 5c 2b 70       	mov    0x70(%rbx,%r13,1),%rbx
7e6e   e1959e:	48 85 db             	test   %rbx,%rbx
7e71   e195a1:	0f 84 a5 00 00 00    	je     e1964c <fix_nodes+0x7f1c>
7e77   e195a7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7e81   e195b1:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
7e86   e195b6:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
7e8a   e195ba:	74 08                	je     e195c4 <fix_nodes+0x7e94>
7e8c   e195bc:	4c 89 ff             	mov    %r15,%rdi
7e8f   e195bf:	e8 00 00 00 00       	call   e195c4 <fix_nodes+0x7e94>	e195c0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7e94   e195c4:	49 8b 3f             	mov    (%r15),%rdi
7e97   e195c7:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
7e9c   e195cc:	8d 48 98             	lea    -0x68(%rax),%ecx
7e9f   e195cf:	48 89 de             	mov    %rbx,%rsi
7ea2   e195d2:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e195d5: R_X86_64_32S	.rodata+0x1bb9e0
7ea9   e195d9:	e8 e2 df 00 00       	call   e275c0 <tb_buffer_sanity_check>
7eae   e195de:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7eb8   e195e8:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
7ebd   e195ed:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
7ec1   e195f1:	74 08                	je     e195fb <fix_nodes+0x7ecb>
7ec3   e195f3:	4c 89 ff             	mov    %r15,%rdi
7ec6   e195f6:	e8 00 00 00 00       	call   e195fb <fix_nodes+0x7ecb>	e195f7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7ecb   e195fb:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
7ed0   e19600:	48 8b 58 08          	mov    0x8(%rax),%rbx
7ed4   e19604:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7ede   e1960e:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
7ee3   e19613:	74 08                	je     e1961d <fix_nodes+0x7eed>
7ee5   e19615:	4c 89 f7             	mov    %r14,%rdi
7ee8   e19618:	e8 00 00 00 00       	call   e1961d <fix_nodes+0x7eed>	e19619: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7eed   e1961d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
7ef2   e19622:	4a 8b 74 28 70       	mov    0x70(%rax,%r13,1),%rsi
7ef7   e19627:	48 89 df             	mov    %rbx,%rdi
7efa   e1962a:	31 d2                	xor    %edx,%edx
7efc   e1962c:	e8 00 00 00 00       	call   e19631 <fix_nodes+0x7f01>	e1962d: R_X86_64_PLT32	reiserfs_prepare_for_journal-0x4
7f01   e19631:	89 c3                	mov    %eax,%ebx
7f03   e19633:	31 ff                	xor    %edi,%edi
7f05   e19635:	89 c6                	mov    %eax,%esi
7f07   e19637:	e8 00 00 00 00       	call   e1963c <fix_nodes+0x7f0c>	e19638: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
7f0c   e1963c:	85 db                	test   %ebx,%ebx
7f0e   e1963e:	74 18                	je     e19658 <fix_nodes+0x7f28>
7f10   e19640:	e8 00 00 00 00       	call   e19645 <fix_nodes+0x7f15>	e19641: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7f15   e19645:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
7f1a   e1964a:	eb 3d                	jmp    e19689 <fix_nodes+0x7f59>
7f1c   e1964c:	e8 00 00 00 00       	call   e19651 <fix_nodes+0x7f21>	e1964d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7f21   e19651:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
7f26   e19656:	eb 31                	jmp    e19689 <fix_nodes+0x7f59>
7f28   e19658:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7f32   e19662:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
7f37   e19667:	74 08                	je     e19671 <fix_nodes+0x7f41>
7f39   e19669:	4c 89 f7             	mov    %r14,%rdi
7f3c   e1966c:	e8 00 00 00 00       	call   e19671 <fix_nodes+0x7f41>	e1966d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7f41   e19671:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
7f46   e19676:	4e 8b 64 2b 70       	mov    0x70(%rbx,%r13,1),%r12
7f4b   e1967b:	4d 85 e4             	test   %r12,%r12
7f4e   e1967e:	0f 85 db 07 00 00    	jne    e19e5f <fix_nodes+0x872f>
7f54   e19684:	e8 00 00 00 00       	call   e19689 <fix_nodes+0x7f59>	e19685: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7f59   e19689:	4e 8d 34 2b          	lea    (%rbx,%r13,1),%r14
7f5d   e1968d:	49 81 c6 c0 00 00 00 	add    $0xc0,%r14
7f64   e19694:	4d 89 f4             	mov    %r14,%r12
7f67   e19697:	49 c1 ec 03          	shr    $0x3,%r12
7f6b   e1969b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7f75   e196a5:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
7f7a   e196aa:	74 08                	je     e196b4 <fix_nodes+0x7f84>
7f7c   e196ac:	4c 89 f7             	mov    %r14,%rdi
7f7f   e196af:	e8 00 00 00 00       	call   e196b4 <fix_nodes+0x7f84>	e196b0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7f84   e196b4:	4a 8b 9c 2b c0 00 00 00 	mov    0xc0(%rbx,%r13,1),%rbx
7f8c   e196bc:	48 85 db             	test   %rbx,%rbx
7f8f   e196bf:	0f 84 a3 00 00 00    	je     e19768 <fix_nodes+0x8038>
7f95   e196c5:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7f9f   e196cf:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
7fa4   e196d4:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
7fa8   e196d8:	74 08                	je     e196e2 <fix_nodes+0x7fb2>
7faa   e196da:	4c 89 ff             	mov    %r15,%rdi
7fad   e196dd:	e8 00 00 00 00       	call   e196e2 <fix_nodes+0x7fb2>	e196de: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7fb2   e196e2:	49 8b 3f             	mov    (%r15),%rdi
7fb5   e196e5:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
7fba   e196ea:	8d 48 98             	lea    -0x68(%rax),%ecx
7fbd   e196ed:	48 89 de             	mov    %rbx,%rsi
7fc0   e196f0:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e196f3: R_X86_64_32S	.rodata+0x1bba00
7fc7   e196f7:	e8 c4 de 00 00       	call   e275c0 <tb_buffer_sanity_check>
7fcc   e196fc:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7fd6   e19706:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
7fdb   e1970b:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
7fdf   e1970f:	74 08                	je     e19719 <fix_nodes+0x7fe9>
7fe1   e19711:	4c 89 ff             	mov    %r15,%rdi
7fe4   e19714:	e8 00 00 00 00       	call   e19719 <fix_nodes+0x7fe9>	e19715: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7fe9   e19719:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
7fee   e1971e:	48 8b 58 08          	mov    0x8(%rax),%rbx
7ff2   e19722:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7ffc   e1972c:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
8001   e19731:	74 08                	je     e1973b <fix_nodes+0x800b>
8003   e19733:	4c 89 f7             	mov    %r14,%rdi
8006   e19736:	e8 00 00 00 00       	call   e1973b <fix_nodes+0x800b>	e19737: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
800b   e1973b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
8010   e19740:	4a 8b b4 28 c0 00 00 00 	mov    0xc0(%rax,%r13,1),%rsi
8018   e19748:	48 89 df             	mov    %rbx,%rdi
801b   e1974b:	31 d2                	xor    %edx,%edx
801d   e1974d:	e8 00 00 00 00       	call   e19752 <fix_nodes+0x8022>	e1974e: R_X86_64_PLT32	reiserfs_prepare_for_journal-0x4
8022   e19752:	89 c3                	mov    %eax,%ebx
8024   e19754:	31 ff                	xor    %edi,%edi
8026   e19756:	89 c6                	mov    %eax,%esi
8028   e19758:	e8 00 00 00 00       	call   e1975d <fix_nodes+0x802d>	e19759: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
802d   e1975d:	85 db                	test   %ebx,%ebx
802f   e1975f:	74 1d                	je     e1977e <fix_nodes+0x804e>
8031   e19761:	e8 00 00 00 00       	call   e19766 <fix_nodes+0x8036>	e19762: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8036   e19766:	eb 05                	jmp    e1976d <fix_nodes+0x803d>
8038   e19768:	e8 00 00 00 00       	call   e1976d <fix_nodes+0x803d>	e19769: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
803d   e1976d:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
8047   e19777:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
804c   e1977c:	eb 3e                	jmp    e197bc <fix_nodes+0x808c>
804e   e1977e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
8058   e19788:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
805d   e1978d:	74 08                	je     e19797 <fix_nodes+0x8067>
805f   e1978f:	4c 89 f7             	mov    %r14,%rdi
8062   e19792:	e8 00 00 00 00       	call   e19797 <fix_nodes+0x8067>	e19793: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8067   e19797:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
806c   e1979c:	4e 8b a4 2b c0 00 00 00 	mov    0xc0(%rbx,%r13,1),%r12
8074   e197a4:	4d 85 e4             	test   %r12,%r12
8077   e197a7:	0f 85 c6 06 00 00    	jne    e19e73 <fix_nodes+0x8743>
807d   e197ad:	e8 00 00 00 00       	call   e197b2 <fix_nodes+0x8082>	e197ae: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8082   e197b2:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
808c   e197bc:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
8091   e197c1:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
8095   e197c5:	48 89 f8             	mov    %rdi,%rax
8098   e197c8:	48 c1 e8 03          	shr    $0x3,%rax
809c   e197cc:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
80a1   e197d1:	84 c0                	test   %al,%al
80a3   e197d3:	0f 85 29 04 00 00    	jne    e19c02 <fix_nodes+0x84d2>
80a9   e197d9:	49 89 df             	mov    %rbx,%r15
80ac   e197dc:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
80b1   e197e1:	8b 5c 83 14          	mov    0x14(%rbx,%rax,4),%ebx
80b5   e197e5:	31 ff                	xor    %edi,%edi
80b7   e197e7:	89 de                	mov    %ebx,%esi
80b9   e197e9:	e8 00 00 00 00       	call   e197ee <fix_nodes+0x80be>	e197ea: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
80be   e197ee:	85 db                	test   %ebx,%ebx
80c0   e197f0:	0f 84 e0 00 00 00    	je     e198d6 <fix_nodes+0x81a6>
80c6   e197f6:	4f 8d 34 2f          	lea    (%r15,%r13,1),%r14
80ca   e197fa:	49 83 c6 48          	add    $0x48,%r14
80ce   e197fe:	4d 89 f4             	mov    %r14,%r12
80d1   e19801:	49 c1 ec 03          	shr    $0x3,%r12
80d5   e19805:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
80df   e1980f:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
80e4   e19814:	74 08                	je     e1981e <fix_nodes+0x80ee>
80e6   e19816:	4c 89 f7             	mov    %r14,%rdi
80e9   e19819:	e8 00 00 00 00       	call   e1981e <fix_nodes+0x80ee>	e1981a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
80ee   e1981e:	4b 8b 5c 2f 48       	mov    0x48(%r15,%r13,1),%rbx
80f3   e19823:	48 85 db             	test   %rbx,%rbx
80f6   e19826:	0f 84 bc 00 00 00    	je     e198e8 <fix_nodes+0x81b8>
80fc   e1982c:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
8106   e19836:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
810b   e1983b:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
810f   e1983f:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
8114   e19844:	74 08                	je     e1984e <fix_nodes+0x811e>
8116   e19846:	4c 89 ff             	mov    %r15,%rdi
8119   e19849:	e8 00 00 00 00       	call   e1984e <fix_nodes+0x811e>	e1984a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
811e   e1984e:	49 8b 3f             	mov    (%r15),%rdi
8121   e19851:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
8126   e19856:	8d 48 98             	lea    -0x68(%rax),%ecx
8129   e19859:	48 89 de             	mov    %rbx,%rsi
812c   e1985c:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e1985f: R_X86_64_32S	.rodata+0x1bba20
8133   e19863:	e8 58 dd 00 00       	call   e275c0 <tb_buffer_sanity_check>
8138   e19868:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
8142   e19872:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
8147   e19877:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
814b   e1987b:	74 08                	je     e19885 <fix_nodes+0x8155>
814d   e1987d:	4c 89 ff             	mov    %r15,%rdi
8150   e19880:	e8 00 00 00 00       	call   e19885 <fix_nodes+0x8155>	e19881: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8155   e19885:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
815a   e1988a:	48 8b 58 08          	mov    0x8(%rax),%rbx
815e   e1988e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
8168   e19898:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
816d   e1989d:	74 08                	je     e198a7 <fix_nodes+0x8177>
816f   e1989f:	4c 89 f7             	mov    %r14,%rdi
8172   e198a2:	e8 00 00 00 00       	call   e198a7 <fix_nodes+0x8177>	e198a3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8177   e198a7:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
817c   e198ac:	4a 8b 74 28 48       	mov    0x48(%rax,%r13,1),%rsi
8181   e198b1:	48 89 df             	mov    %rbx,%rdi
8184   e198b4:	31 d2                	xor    %edx,%edx
8186   e198b6:	e8 00 00 00 00       	call   e198bb <fix_nodes+0x818b>	e198b7: R_X86_64_PLT32	reiserfs_prepare_for_journal-0x4
818b   e198bb:	89 c3                	mov    %eax,%ebx
818d   e198bd:	31 ff                	xor    %edi,%edi
818f   e198bf:	89 c6                	mov    %eax,%esi
8191   e198c1:	e8 00 00 00 00       	call   e198c6 <fix_nodes+0x8196>	e198c2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
8196   e198c6:	85 db                	test   %ebx,%ebx
8198   e198c8:	74 2f                	je     e198f9 <fix_nodes+0x81c9>
819a   e198ca:	e8 00 00 00 00       	call   e198cf <fix_nodes+0x819f>	e198cb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
819f   e198cf:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
81a4   e198d4:	eb 54                	jmp    e1992a <fix_nodes+0x81fa>
81a6   e198d6:	e8 00 00 00 00       	call   e198db <fix_nodes+0x81ab>	e198d7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
81ab   e198db:	45 31 e4             	xor    %r12d,%r12d
81ae   e198de:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
81b3   e198e3:	e9 7d 02 00 00       	jmp    e19b65 <fix_nodes+0x8435>
81b8   e198e8:	e8 00 00 00 00       	call   e198ed <fix_nodes+0x81bd>	e198e9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
81bd   e198ed:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
81c2   e198f2:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
81c7   e198f7:	eb 31                	jmp    e1992a <fix_nodes+0x81fa>
81c9   e198f9:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
81d3   e19903:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
81d8   e19908:	74 08                	je     e19912 <fix_nodes+0x81e2>
81da   e1990a:	4c 89 f7             	mov    %r14,%rdi
81dd   e1990d:	e8 00 00 00 00       	call   e19912 <fix_nodes+0x81e2>	e1990e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
81e2   e19912:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
81e7   e19917:	4e 8b 64 2b 48       	mov    0x48(%rbx,%r13,1),%r12
81ec   e1991c:	4d 85 e4             	test   %r12,%r12
81ef   e1991f:	0f 85 44 05 00 00    	jne    e19e69 <fix_nodes+0x8739>
81f5   e19925:	e8 00 00 00 00       	call   e1992a <fix_nodes+0x81fa>	e19926: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
81fa   e1992a:	4e 8d 34 2b          	lea    (%rbx,%r13,1),%r14
81fe   e1992e:	49 81 c6 98 00 00 00 	add    $0x98,%r14
8205   e19935:	4d 89 f4             	mov    %r14,%r12
8208   e19938:	49 c1 ec 03          	shr    $0x3,%r12
820c   e1993c:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
8216   e19946:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
821b   e1994b:	74 08                	je     e19955 <fix_nodes+0x8225>
821d   e1994d:	4c 89 f7             	mov    %r14,%rdi
8220   e19950:	e8 00 00 00 00       	call   e19955 <fix_nodes+0x8225>	e19951: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8225   e19955:	4a 8b 9c 2b 98 00 00 00 	mov    0x98(%rbx,%r13,1),%rbx
822d   e1995d:	48 85 db             	test   %rbx,%rbx
8230   e19960:	0f 84 a8 00 00 00    	je     e19a0e <fix_nodes+0x82de>
8236   e19966:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
8240   e19970:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
8245   e19975:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
8249   e19979:	74 08                	je     e19983 <fix_nodes+0x8253>
824b   e1997b:	4c 89 ff             	mov    %r15,%rdi
824e   e1997e:	e8 00 00 00 00       	call   e19983 <fix_nodes+0x8253>	e1997f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8253   e19983:	49 8b 3f             	mov    (%r15),%rdi
8256   e19986:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
825b   e1998b:	8d 48 98             	lea    -0x68(%rax),%ecx
825e   e1998e:	48 89 de             	mov    %rbx,%rsi
8261   e19991:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e19994: R_X86_64_32S	.rodata+0x1bba40
8268   e19998:	e8 23 dc 00 00       	call   e275c0 <tb_buffer_sanity_check>
826d   e1999d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
8277   e199a7:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
827c   e199ac:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
8280   e199b0:	74 08                	je     e199ba <fix_nodes+0x828a>
8282   e199b2:	4c 89 ff             	mov    %r15,%rdi
8285   e199b5:	e8 00 00 00 00       	call   e199ba <fix_nodes+0x828a>	e199b6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
828a   e199ba:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
828f   e199bf:	48 8b 58 08          	mov    0x8(%rax),%rbx
8293   e199c3:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
829d   e199cd:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
82a2   e199d2:	74 08                	je     e199dc <fix_nodes+0x82ac>
82a4   e199d4:	4c 89 f7             	mov    %r14,%rdi
82a7   e199d7:	e8 00 00 00 00       	call   e199dc <fix_nodes+0x82ac>	e199d8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
82ac   e199dc:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
82b1   e199e1:	4a 8b b4 28 98 00 00 00 	mov    0x98(%rax,%r13,1),%rsi
82b9   e199e9:	48 89 df             	mov    %rbx,%rdi
82bc   e199ec:	31 d2                	xor    %edx,%edx
82be   e199ee:	e8 00 00 00 00       	call   e199f3 <fix_nodes+0x82c3>	e199ef: R_X86_64_PLT32	reiserfs_prepare_for_journal-0x4
82c3   e199f3:	89 c3                	mov    %eax,%ebx
82c5   e199f5:	31 ff                	xor    %edi,%edi
82c7   e199f7:	89 c6                	mov    %eax,%esi
82c9   e199f9:	e8 00 00 00 00       	call   e199fe <fix_nodes+0x82ce>	e199fa: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
82ce   e199fe:	85 db                	test   %ebx,%ebx
82d0   e19a00:	74 18                	je     e19a1a <fix_nodes+0x82ea>
82d2   e19a02:	e8 00 00 00 00       	call   e19a07 <fix_nodes+0x82d7>	e19a03: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
82d7   e19a07:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
82dc   e19a0c:	eb 40                	jmp    e19a4e <fix_nodes+0x831e>
82de   e19a0e:	e8 00 00 00 00       	call   e19a13 <fix_nodes+0x82e3>	e19a0f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
82e3   e19a13:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
82e8   e19a18:	eb 34                	jmp    e19a4e <fix_nodes+0x831e>
82ea   e19a1a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
82f4   e19a24:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
82f9   e19a29:	74 08                	je     e19a33 <fix_nodes+0x8303>
82fb   e19a2b:	4c 89 f7             	mov    %r14,%rdi
82fe   e19a2e:	e8 00 00 00 00       	call   e19a33 <fix_nodes+0x8303>	e19a2f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8303   e19a33:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
8308   e19a38:	4e 8b a4 2b 98 00 00 00 	mov    0x98(%rbx,%r13,1),%r12
8310   e19a40:	4d 85 e4             	test   %r12,%r12
8313   e19a43:	0f 85 34 04 00 00    	jne    e19e7d <fix_nodes+0x874d>
8319   e19a49:	e8 00 00 00 00       	call   e19a4e <fix_nodes+0x831e>	e19a4a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
831e   e19a4e:	4e 8d 34 2b          	lea    (%rbx,%r13,1),%r14
8322   e19a52:	49 81 c6 e8 00 00 00 	add    $0xe8,%r14
8329   e19a59:	4d 89 f4             	mov    %r14,%r12
832c   e19a5c:	49 c1 ec 03          	shr    $0x3,%r12
8330   e19a60:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
833a   e19a6a:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
833f   e19a6f:	74 08                	je     e19a79 <fix_nodes+0x8349>
8341   e19a71:	4c 89 f7             	mov    %r14,%rdi
8344   e19a74:	e8 00 00 00 00       	call   e19a79 <fix_nodes+0x8349>	e19a75: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8349   e19a79:	4a 8b 9c 2b e8 00 00 00 	mov    0xe8(%rbx,%r13,1),%rbx
8351   e19a81:	48 85 db             	test   %rbx,%rbx
8354   e19a84:	0f 84 a6 00 00 00    	je     e19b30 <fix_nodes+0x8400>
835a   e19a8a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
8364   e19a94:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
8369   e19a99:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
836d   e19a9d:	74 08                	je     e19aa7 <fix_nodes+0x8377>
836f   e19a9f:	4c 89 ff             	mov    %r15,%rdi
8372   e19aa2:	e8 00 00 00 00       	call   e19aa7 <fix_nodes+0x8377>	e19aa3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8377   e19aa7:	49 8b 3f             	mov    (%r15),%rdi
837a   e19aaa:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
837f   e19aaf:	8d 48 98             	lea    -0x68(%rax),%ecx
8382   e19ab2:	48 89 de             	mov    %rbx,%rsi
8385   e19ab5:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e19ab8: R_X86_64_32S	.rodata+0x1bba60
838c   e19abc:	e8 ff da 00 00       	call   e275c0 <tb_buffer_sanity_check>
8391   e19ac1:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
839b   e19acb:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
83a0   e19ad0:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
83a4   e19ad4:	74 08                	je     e19ade <fix_nodes+0x83ae>
83a6   e19ad6:	4c 89 ff             	mov    %r15,%rdi
83a9   e19ad9:	e8 00 00 00 00       	call   e19ade <fix_nodes+0x83ae>	e19ada: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
83ae   e19ade:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
83b3   e19ae3:	48 8b 58 08          	mov    0x8(%rax),%rbx
83b7   e19ae7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
83c1   e19af1:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
83c6   e19af6:	74 08                	je     e19b00 <fix_nodes+0x83d0>
83c8   e19af8:	4c 89 f7             	mov    %r14,%rdi
83cb   e19afb:	e8 00 00 00 00       	call   e19b00 <fix_nodes+0x83d0>	e19afc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
83d0   e19b00:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
83d5   e19b05:	4a 8b b4 28 e8 00 00 00 	mov    0xe8(%rax,%r13,1),%rsi
83dd   e19b0d:	48 89 df             	mov    %rbx,%rdi
83e0   e19b10:	31 d2                	xor    %edx,%edx
83e2   e19b12:	e8 00 00 00 00       	call   e19b17 <fix_nodes+0x83e7>	e19b13: R_X86_64_PLT32	reiserfs_prepare_for_journal-0x4
83e7   e19b17:	89 c3                	mov    %eax,%ebx
83e9   e19b19:	31 ff                	xor    %edi,%edi
83eb   e19b1b:	89 c6                	mov    %eax,%esi
83ed   e19b1d:	e8 00 00 00 00       	call   e19b22 <fix_nodes+0x83f2>	e19b1e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
83f2   e19b22:	85 db                	test   %ebx,%ebx
83f4   e19b24:	74 14                	je     e19b3a <fix_nodes+0x840a>
83f6   e19b26:	e8 00 00 00 00       	call   e19b2b <fix_nodes+0x83fb>	e19b27: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
83fb   e19b2b:	45 31 e4             	xor    %r12d,%r12d
83fe   e19b2e:	eb 35                	jmp    e19b65 <fix_nodes+0x8435>
8400   e19b30:	e8 00 00 00 00       	call   e19b35 <fix_nodes+0x8405>	e19b31: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8405   e19b35:	45 31 e4             	xor    %r12d,%r12d
8408   e19b38:	eb 2b                	jmp    e19b65 <fix_nodes+0x8435>
840a   e19b3a:	e8 00 00 00 00       	call   e19b3f <fix_nodes+0x840f>	e19b3b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
840f   e19b3f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
8419   e19b49:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
841e   e19b4e:	74 08                	je     e19b58 <fix_nodes+0x8428>
8420   e19b50:	4c 89 f7             	mov    %r14,%rdi
8423   e19b53:	e8 00 00 00 00       	call   e19b58 <fix_nodes+0x8428>	e19b54: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8428   e19b58:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
842d   e19b5d:	4e 8b a4 28 e8 00 00 00 	mov    0xe8(%rax,%r13,1),%r12
8435   e19b65:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
843a   e19b6a:	48 8d 58 98          	lea    -0x68(%rax),%rbx
843e   e19b6e:	bf 04 00 00 00       	mov    $0x4,%edi
8443   e19b73:	48 89 de             	mov    %rbx,%rsi
8446   e19b76:	e8 00 00 00 00       	call   e19b7b <fix_nodes+0x844b>	e19b77: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
844b   e19b7b:	4d 85 e4             	test   %r12,%r12
844e   e19b7e:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
8453   e19b83:	0f 85 9a 00 00 00    	jne    e19c23 <fix_nodes+0x84f3>
8459   e19b89:	48 83 fb 03          	cmp    $0x3,%rbx
845d   e19b8d:	0f 87 90 00 00 00    	ja     e19c23 <fix_nodes+0x84f3>
8463   e19b93:	e8 00 00 00 00       	call   e19b98 <fix_nodes+0x8468>	e19b94: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8468   e19b98:	48 83 44 24 28 01    	addq   $0x1,0x28(%rsp)
846e   e19b9e:	49 83 c5 08          	add    $0x8,%r13
8472   e19ba2:	48 83 44 24 10 04    	addq   $0x4,0x10(%rsp)
8478   e19ba8:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
847d   e19bad:	49 83 c7 04          	add    $0x4,%r15
8481   e19bb1:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
8486   e19bb6:	48 83 c0 04          	add    $0x4,%rax
848a   e19bba:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
8494   e19bc4:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
8499   e19bc9:	e9 07 f8 ff ff       	jmp    e193d5 <fix_nodes+0x7ca5>
849e   e19bce:	89 f9                	mov    %edi,%ecx
84a0   e19bd0:	80 e1 07             	and    $0x7,%cl
84a3   e19bd3:	80 c1 03             	add    $0x3,%cl
84a6   e19bd6:	38 c1                	cmp    %al,%cl
84a8   e19bd8:	0f 8c 14 f8 ff ff    	jl     e193f2 <fix_nodes+0x7cc2>
84ae   e19bde:	e8 00 00 00 00       	call   e19be3 <fix_nodes+0x84b3>	e19bdf: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
84b3   e19be3:	e9 0a f8 ff ff       	jmp    e193f2 <fix_nodes+0x7cc2>
84b8   e19be8:	89 f9                	mov    %edi,%ecx
84ba   e19bea:	80 e1 07             	and    $0x7,%cl
84bd   e19bed:	80 c1 03             	add    $0x3,%cl
84c0   e19bf0:	38 c1                	cmp    %al,%cl
84c2   e19bf2:	0f 8c 37 f8 ff ff    	jl     e1942f <fix_nodes+0x7cff>
84c8   e19bf8:	e8 00 00 00 00       	call   e19bfd <fix_nodes+0x84cd>	e19bf9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
84cd   e19bfd:	e9 2d f8 ff ff       	jmp    e1942f <fix_nodes+0x7cff>
84d2   e19c02:	89 f9                	mov    %edi,%ecx
84d4   e19c04:	80 e1 07             	and    $0x7,%cl
84d7   e19c07:	80 c1 03             	add    $0x3,%cl
84da   e19c0a:	38 c1                	cmp    %al,%cl
84dc   e19c0c:	0f 8c c7 fb ff ff    	jl     e197d9 <fix_nodes+0x80a9>
84e2   e19c12:	e8 00 00 00 00       	call   e19c17 <fix_nodes+0x84e7>	e19c13: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
84e7   e19c17:	e9 bd fb ff ff       	jmp    e197d9 <fix_nodes+0x80a9>
84ec   e19c1c:	e8 00 00 00 00       	call   e19c21 <fix_nodes+0x84f1>	e19c1d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
84f1   e19c21:	eb 19                	jmp    e19c3c <fix_nodes+0x850c>
84f3   e19c23:	4d 85 e4             	test   %r12,%r12
84f6   e19c26:	74 0a                	je     e19c32 <fix_nodes+0x8502>
84f8   e19c28:	e8 00 00 00 00       	call   e19c2d <fix_nodes+0x84fd>	e19c29: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
84fd   e19c2d:	e9 04 01 00 00       	jmp    e19d36 <fix_nodes+0x8606>
8502   e19c32:	e8 00 00 00 00       	call   e19c37 <fix_nodes+0x8507>	e19c33: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8507   e19c37:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
850c   e19c3c:	4c 8b b4 24 d8 00 00 00 	mov    0xd8(%rsp),%r14
8514   e19c44:	45 31 ff             	xor    %r15d,%r15d
8517   e19c47:	4d 89 f4             	mov    %r14,%r12
851a   e19c4a:	49 c1 ec 03          	shr    $0x3,%r12
851e   e19c4e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
8528   e19c58:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
852d   e19c5d:	74 08                	je     e19c67 <fix_nodes+0x8537>
852f   e19c5f:	4c 89 f7             	mov    %r14,%rdi
8532   e19c62:	e8 00 00 00 00       	call   e19c67 <fix_nodes+0x8537>	e19c63: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8537   e19c67:	4a 8b 9c fb 10 01 00 00 	mov    0x110(%rbx,%r15,8),%rbx
853f   e19c6f:	48 85 db             	test   %rbx,%rbx
8542   e19c72:	74 46                	je     e19cba <fix_nodes+0x858a>
8544   e19c74:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
854e   e19c7e:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
8553   e19c83:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
8557   e19c87:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
855c   e19c8c:	74 08                	je     e19c96 <fix_nodes+0x8566>
855e   e19c8e:	4c 89 ef             	mov    %r13,%rdi
8561   e19c91:	e8 00 00 00 00       	call   e19c96 <fix_nodes+0x8566>	e19c92: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8566   e19c96:	49 8b 7d 00          	mov    0x0(%r13),%rdi
856a   e19c9a:	48 89 de             	mov    %rbx,%rsi
856d   e19c9d:	31 d2                	xor    %edx,%edx
856f   e19c9f:	e8 00 00 00 00       	call   e19ca4 <fix_nodes+0x8574>	e19ca0: R_X86_64_PLT32	reiserfs_prepare_for_journal-0x4
8574   e19ca4:	89 c3                	mov    %eax,%ebx
8576   e19ca6:	31 ff                	xor    %edi,%edi
8578   e19ca8:	89 c6                	mov    %eax,%esi
857a   e19caa:	e8 00 00 00 00       	call   e19caf <fix_nodes+0x857f>	e19cab: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
857f   e19caf:	85 db                	test   %ebx,%ebx
8581   e19cb1:	74 16                	je     e19cc9 <fix_nodes+0x8599>
8583   e19cb3:	e8 00 00 00 00       	call   e19cb8 <fix_nodes+0x8588>	e19cb4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8588   e19cb8:	eb 05                	jmp    e19cbf <fix_nodes+0x858f>
858a   e19cba:	e8 00 00 00 00       	call   e19cbf <fix_nodes+0x858f>	e19cbb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
858f   e19cbf:	45 31 e4             	xor    %r12d,%r12d
8592   e19cc2:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
8597   e19cc7:	eb 2b                	jmp    e19cf4 <fix_nodes+0x85c4>
8599   e19cc9:	e8 00 00 00 00       	call   e19cce <fix_nodes+0x859e>	e19cca: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
859e   e19cce:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
85a8   e19cd8:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
85ad   e19cdd:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
85b2   e19ce2:	74 08                	je     e19cec <fix_nodes+0x85bc>
85b4   e19ce4:	4c 89 f7             	mov    %r14,%rdi
85b7   e19ce7:	e8 00 00 00 00       	call   e19cec <fix_nodes+0x85bc>	e19ce8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
85bc   e19cec:	4e 8b a4 fb 10 01 00 00 	mov    0x110(%rbx,%r15,8),%r12
85c4   e19cf4:	bf 05 00 00 00       	mov    $0x5,%edi
85c9   e19cf9:	4c 89 fe             	mov    %r15,%rsi
85cc   e19cfc:	e8 00 00 00 00       	call   e19d01 <fix_nodes+0x85d1>	e19cfd: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
85d1   e19d01:	4d 85 e4             	test   %r12,%r12
85d4   e19d04:	75 18                	jne    e19d1e <fix_nodes+0x85ee>
85d6   e19d06:	49 83 ff 04          	cmp    $0x4,%r15
85da   e19d0a:	77 12                	ja     e19d1e <fix_nodes+0x85ee>
85dc   e19d0c:	e8 00 00 00 00       	call   e19d11 <fix_nodes+0x85e1>	e19d0d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
85e1   e19d11:	49 83 c6 08          	add    $0x8,%r14
85e5   e19d15:	49 83 c7 01          	add    $0x1,%r15
85e9   e19d19:	e9 29 ff ff ff       	jmp    e19c47 <fix_nodes+0x8517>
85ee   e19d1e:	4d 85 e4             	test   %r12,%r12
85f1   e19d21:	0f 84 cb 04 00 00    	je     e1a1f2 <fix_nodes+0x8ac2>
85f7   e19d27:	e8 00 00 00 00       	call   e19d2c <fix_nodes+0x85fc>	e19d28: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
85fc   e19d2c:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
8601   e19d31:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
8606   e19d36:	48 8b 84 24 c0 00 00 00 	mov    0xc0(%rsp),%rax
860e   e19d3e:	83 c0 01             	add    $0x1,%eax
8611   e19d41:	48 89 84 24 c0 00 00 00 	mov    %rax,0xc0(%rsp)
8619   e19d49:	48 63 d8             	movslq %eax,%rbx
861c   e19d4c:	48 69 c3 ad 8b db 68 	imul   $0x68db8bad,%rbx,%rax
8623   e19d53:	48 89 c1             	mov    %rax,%rcx
8626   e19d56:	48 c1 e9 3f          	shr    $0x3f,%rcx
862a   e19d5a:	48 c1 f8 2c          	sar    $0x2c,%rax
862e   e19d5e:	01 c8                	add    %ecx,%eax
8630   e19d60:	69 c0 10 27 00 00    	imul   $0x2710,%eax,%eax
8636   e19d66:	29 c3                	sub    %eax,%ebx
8638   e19d68:	31 ff                	xor    %edi,%edi
863a   e19d6a:	89 de                	mov    %ebx,%esi
863c   e19d6c:	e8 00 00 00 00       	call   e19d71 <fix_nodes+0x8641>	e19d6d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
8641   e19d71:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
864b   e19d7b:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
8650   e19d80:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
8654   e19d84:	74 08                	je     e19d8e <fix_nodes+0x865e>
8656   e19d86:	4c 89 ff             	mov    %r15,%rdi
8659   e19d89:	e8 00 00 00 00       	call   e19d8e <fix_nodes+0x865e>	e19d8a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
865e   e19d8e:	49 8b 3f             	mov    (%r15),%rdi
8661   e19d91:	85 db                	test   %ebx,%ebx
8663   e19d93:	0f 84 4c 01 00 00    	je     e19ee5 <fix_nodes+0x87b5>
8669   e19d99:	e8 00 00 00 00       	call   e19d9e <fix_nodes+0x866e>	e19d9a: R_X86_64_PLT32	reiserfs_write_unlock_nested-0x4
866e   e19d9e:	89 c3                	mov    %eax,%ebx
8670   e19da0:	4c 89 e7             	mov    %r12,%rdi
8673   e19da3:	e8 00 00 00 00       	call   e19da8 <fix_nodes+0x8678>	e19da4: R_X86_64_PLT32	__wait_on_buffer-0x4
8678   e19da8:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
8682   e19db2:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
8687   e19db7:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
868c   e19dbc:	74 08                	je     e19dc6 <fix_nodes+0x8696>
868e   e19dbe:	4c 89 ff             	mov    %r15,%rdi
8691   e19dc1:	e8 00 00 00 00       	call   e19dc6 <fix_nodes+0x8696>	e19dc2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8696   e19dc6:	49 8b 3f             	mov    (%r15),%rdi
8699   e19dc9:	89 de                	mov    %ebx,%esi
869b   e19dcb:	e8 00 00 00 00       	call   e19dd0 <fix_nodes+0x86a0>	e19dcc: R_X86_64_PLT32	reiserfs_write_lock_nested-0x4
86a0   e19dd0:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
86a5   e19dd5:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
86aa   e19dda:	74 08                	je     e19de4 <fix_nodes+0x86b4>
86ac   e19ddc:	4c 89 ff             	mov    %r15,%rdi
86af   e19ddf:	e8 00 00 00 00       	call   e19de4 <fix_nodes+0x86b4>	e19de0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
86b4   e19de4:	49 8b 1f             	mov    (%r15),%rbx
86b7   e19de7:	b8 d8 06 00 00       	mov    $0x6d8,%eax
86bc   e19dec:	48 01 c3             	add    %rax,%rbx
86bf   e19def:	48 89 d8             	mov    %rbx,%rax
86c2   e19df2:	48 c1 e8 03          	shr    $0x3,%rax
86c6   e19df6:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
86cb   e19dfb:	74 08                	je     e19e05 <fix_nodes+0x86d5>
86cd   e19dfd:	48 89 df             	mov    %rbx,%rdi
86d0   e19e00:	e8 00 00 00 00       	call   e19e05 <fix_nodes+0x86d5>	e19e01: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
86d5   e19e05:	48 8b 1b             	mov    (%rbx),%rbx
86d8   e19e08:	b8 70 01 00 00       	mov    $0x170,%eax
86dd   e19e0d:	48 01 c3             	add    %rax,%rbx
86e0   e19e10:	48 89 df             	mov    %rbx,%rdi
86e3   e19e13:	be 04 00 00 00       	mov    $0x4,%esi
86e8   e19e18:	e8 00 00 00 00       	call   e19e1d <fix_nodes+0x86ed>	e19e19: R_X86_64_PLT32	__kasan_check_read-0x4
86ed   e19e1d:	48 89 d8             	mov    %rbx,%rax
86f0   e19e20:	48 c1 e8 03          	shr    $0x3,%rax
86f4   e19e24:	42 8a 04 20          	mov    (%rax,%r12,1),%al
86f8   e19e28:	84 c0                	test   %al,%al
86fa   e19e2a:	75 78                	jne    e19ea4 <fix_nodes+0x8774>
86fc   e19e2c:	8b 1b                	mov    (%rbx),%ebx
86fe   e19e2e:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
8706   e19e36:	42 8a 04 20          	mov    (%rax,%r12,1),%al
870a   e19e3a:	84 c0                	test   %al,%al
870c   e19e3c:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
8711   e19e41:	75 7e                	jne    e19ec1 <fix_nodes+0x8791>
8713   e19e43:	3b 1a                	cmp    (%rdx),%ebx
8715   e19e45:	0f 85 57 01 00 00    	jne    e19fa2 <fix_nodes+0x8872>
871b   e19e4b:	e8 00 00 00 00       	call   e19e50 <fix_nodes+0x8720>	e19e4c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8720   e19e50:	e9 b3 f0 ff ff       	jmp    e18f08 <fix_nodes+0x77d8>
8725   e19e55:	e8 00 00 00 00       	call   e19e5a <fix_nodes+0x872a>	e19e56: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
872a   e19e5a:	e9 d2 fe ff ff       	jmp    e19d31 <fix_nodes+0x8601>
872f   e19e5f:	e8 00 00 00 00       	call   e19e64 <fix_nodes+0x8734>	e19e60: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8734   e19e64:	e9 c8 fe ff ff       	jmp    e19d31 <fix_nodes+0x8601>
8739   e19e69:	e8 00 00 00 00       	call   e19e6e <fix_nodes+0x873e>	e19e6a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
873e   e19e6e:	e9 be fe ff ff       	jmp    e19d31 <fix_nodes+0x8601>
8743   e19e73:	e8 00 00 00 00       	call   e19e78 <fix_nodes+0x8748>	e19e74: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8748   e19e78:	e9 b4 fe ff ff       	jmp    e19d31 <fix_nodes+0x8601>
874d   e19e7d:	e8 00 00 00 00       	call   e19e82 <fix_nodes+0x8752>	e19e7e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8752   e19e82:	e9 aa fe ff ff       	jmp    e19d31 <fix_nodes+0x8601>
8757   e19e87:	89 d9                	mov    %ebx,%ecx
8759   e19e89:	80 e1 07             	and    $0x7,%cl
875c   e19e8c:	80 c1 03             	add    $0x3,%cl
875f   e19e8f:	38 c1                	cmp    %al,%cl
8761   e19e91:	0f 8c 9b f0 ff ff    	jl     e18f32 <fix_nodes+0x7802>
8767   e19e97:	48 89 df             	mov    %rbx,%rdi
876a   e19e9a:	e8 00 00 00 00       	call   e19e9f <fix_nodes+0x876f>	e19e9b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
876f   e19e9f:	e9 8e f0 ff ff       	jmp    e18f32 <fix_nodes+0x7802>
8774   e19ea4:	89 d9                	mov    %ebx,%ecx
8776   e19ea6:	80 e1 07             	and    $0x7,%cl
8779   e19ea9:	80 c1 03             	add    $0x3,%cl
877c   e19eac:	38 c1                	cmp    %al,%cl
877e   e19eae:	0f 8c 78 ff ff ff    	jl     e19e2c <fix_nodes+0x86fc>
8784   e19eb4:	48 89 df             	mov    %rbx,%rdi
8787   e19eb7:	e8 00 00 00 00       	call   e19ebc <fix_nodes+0x878c>	e19eb8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
878c   e19ebc:	e9 6b ff ff ff       	jmp    e19e2c <fix_nodes+0x86fc>
8791   e19ec1:	89 d1                	mov    %edx,%ecx
8793   e19ec3:	80 e1 07             	and    $0x7,%cl
8796   e19ec6:	80 c1 03             	add    $0x3,%cl
8799   e19ec9:	38 c1                	cmp    %al,%cl
879b   e19ecb:	0f 8c 72 ff ff ff    	jl     e19e43 <fix_nodes+0x8713>
87a1   e19ed1:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
87a6   e19ed6:	e8 00 00 00 00       	call   e19edb <fix_nodes+0x87ab>	e19ed7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
87ab   e19edb:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
87b0   e19ee0:	e9 5e ff ff ff       	jmp    e19e43 <fix_nodes+0x8713>
87b5   e19ee5:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e19ee8: R_X86_64_32S	.rodata+0x1bba80
87bc   e19eec:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e19eef: R_X86_64_32S	.rodata.str1.1+0x5a7af
87c3   e19ef3:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e19ef6: R_X86_64_32S	.rodata+0x1bbaa0
87ca   e19efa:	4d 89 e0             	mov    %r12,%r8
87cd   e19efd:	e8 00 00 00 00       	call   e19f02 <fix_nodes+0x87d2>	e19efe: R_X86_64_PLT32	__reiserfs_warning-0x4
87d2   e19f02:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
87dc   e19f0c:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
87e1   e19f11:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
87e6   e19f16:	74 08                	je     e19f20 <fix_nodes+0x87f0>
87e8   e19f18:	4c 89 ff             	mov    %r15,%rdi
87eb   e19f1b:	e8 00 00 00 00       	call   e19f20 <fix_nodes+0x87f0>	e19f1c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
87f0   e19f20:	bb d8 06 00 00       	mov    $0x6d8,%ebx
87f5   e19f25:	49 03 1f             	add    (%r15),%rbx
87f8   e19f28:	48 89 d8             	mov    %rbx,%rax
87fb   e19f2b:	48 c1 e8 03          	shr    $0x3,%rax
87ff   e19f2f:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8804   e19f34:	74 08                	je     e19f3e <fix_nodes+0x880e>
8806   e19f36:	48 89 df             	mov    %rbx,%rdi
8809   e19f39:	e8 00 00 00 00       	call   e19f3e <fix_nodes+0x880e>	e19f3a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
880e   e19f3e:	41 be 70 01 00 00    	mov    $0x170,%r14d
8814   e19f44:	4c 03 33             	add    (%rbx),%r14
8817   e19f47:	4c 89 f7             	mov    %r14,%rdi
881a   e19f4a:	be 04 00 00 00       	mov    $0x4,%esi
881f   e19f4f:	e8 00 00 00 00       	call   e19f54 <fix_nodes+0x8824>	e19f50: R_X86_64_PLT32	__kasan_check_read-0x4
8824   e19f54:	4c 89 f0             	mov    %r14,%rax
8827   e19f57:	48 c1 e8 03          	shr    $0x3,%rax
882b   e19f5b:	42 8a 04 20          	mov    (%rax,%r12,1),%al
882f   e19f5f:	84 c0                	test   %al,%al
8831   e19f61:	0f 85 02 13 00 00    	jne    e1b269 <fix_nodes+0x9b39>
8837   e19f67:	45 8b 36             	mov    (%r14),%r14d
883a   e19f6a:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
8842   e19f72:	42 8a 04 20          	mov    (%rax,%r12,1),%al
8846   e19f76:	84 c0                	test   %al,%al
8848   e19f78:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
884d   e19f7d:	0f 85 04 13 00 00    	jne    e1b287 <fix_nodes+0x9b57>
8853   e19f83:	8b 1a                	mov    (%rdx),%ebx
8855   e19f85:	44 89 f7             	mov    %r14d,%edi
8858   e19f88:	89 de                	mov    %ebx,%esi
885a   e19f8a:	e8 00 00 00 00       	call   e19f8f <fix_nodes+0x885f>	e19f8b: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
885f   e19f8f:	41 39 de             	cmp    %ebx,%r14d
8862   e19f92:	0f 85 4d 01 00 00    	jne    e1a0e5 <fix_nodes+0x89b5>
8868   e19f98:	e8 00 00 00 00       	call   e19f9d <fix_nodes+0x886d>	e19f99: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
886d   e19f9d:	e9 64 02 00 00       	jmp    e1a206 <fix_nodes+0x8ad6>
8872   e19fa2:	e8 00 00 00 00       	call   e19fa7 <fix_nodes+0x8877>	e19fa3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8877   e19fa7:	e9 f8 02 00 00       	jmp    e1a2a4 <fix_nodes+0x8b74>
887c   e19fac:	e8 00 00 00 00       	call   e19fb1 <fix_nodes+0x8881>	e19fad: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8881   e19fb1:	48 8b 84 24 f0 00 00 00 	mov    0xf0(%rsp),%rax
8889   e19fb9:	42 8a 04 20          	mov    (%rax,%r12,1),%al
888d   e19fbd:	84 c0                	test   %al,%al
888f   e19fbf:	4c 8b b4 24 c0 00 00 00 	mov    0xc0(%rsp),%r14
8897   e19fc7:	0f 85 3d 13 00 00    	jne    e1b30a <fix_nodes+0x9bda>
889d   e19fcd:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
88a2   e19fd2:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
88a8   e19fd8:	31 db                	xor    %ebx,%ebx
88aa   e19fda:	48 8b 84 24 18 01 00 00 	mov    0x118(%rsp),%rax
88b2   e19fe2:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
88b7   e19fe7:	74 08                	je     e19ff1 <fix_nodes+0x88c1>
88b9   e19fe9:	4c 89 f7             	mov    %r14,%rdi
88bc   e19fec:	e8 00 00 00 00       	call   e19ff1 <fix_nodes+0x88c1>	e19fed: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
88c1   e19ff1:	49 89 1e             	mov    %rbx,(%r14)
88c4   e19ff4:	e8 00 00 00 00       	call   e19ff9 <fix_nodes+0x88c9>	e19ff5: R_X86_64_PLT32	schedule-0x4
88c9   e19ff9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
88ce   e19ffe:	e9 63 0a 00 00       	jmp    e1aa66 <fix_nodes+0x9336>
88d3   e1a003:	e8 00 00 00 00       	call   e1a008 <fix_nodes+0x88d8>	e1a004: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
88d8   e1a008:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
88dd   e1a00d:	e9 fb 00 00 00       	jmp    e1a10d <fix_nodes+0x89dd>
88e2   e1a012:	e8 00 00 00 00       	call   e1a017 <fix_nodes+0x88e7>	e1a013: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
88e7   e1a017:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e1a01a: R_X86_64_32S	.rodata+0x1b8fa0
88ee   e1a01e:	e8 00 00 00 00       	call   e1a023 <fix_nodes+0x88f3>	e1a01f: R_X86_64_PLT32	print_cur_tb-0x4
88f3   e1a023:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
88f8   e1a028:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
88fd   e1a02d:	74 0a                	je     e1a039 <fix_nodes+0x8909>
88ff   e1a02f:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
8904   e1a034:	e8 00 00 00 00       	call   e1a039 <fix_nodes+0x8909>	e1a035: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8909   e1a039:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
890e   e1a03e:	48 8b 38             	mov    (%rax),%rdi
8911   e1a041:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e1a044: R_X86_64_32S	.rodata+0x1b8fc0
8918   e1a048:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e1a04b: R_X86_64_32S	.rodata+0x1b8fa0
891f   e1a04f:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e1a052: R_X86_64_32S	.rodata+0x1b8fe0
8926   e1a056:	e8 00 00 00 00       	call   e1a05b <fix_nodes+0x892b>	e1a057: R_X86_64_PLT32	__reiserfs_panic-0x4
892b   e1a05b:	e9 4b 7c ff ff       	jmp    e11cab <fix_nodes+0x57b>
8930   e1a060:	e8 00 00 00 00       	call   e1a065 <fix_nodes+0x8935>	e1a061: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8935   e1a065:	eb 05                	jmp    e1a06c <fix_nodes+0x893c>
8937   e1a067:	e8 00 00 00 00       	call   e1a06c <fix_nodes+0x893c>	e1a068: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
893c   e1a06c:	48 8b 9c 24 d8 00 00 00 	mov    0xd8(%rsp),%rbx
8944   e1a074:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
8949   e1a079:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
894e   e1a07e:	74 0a                	je     e1a08a <fix_nodes+0x895a>
8950   e1a080:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
8955   e1a085:	e8 00 00 00 00       	call   e1a08a <fix_nodes+0x895a>	e1a086: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
895a   e1a08a:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
895f   e1a08f:	48 8b 38             	mov    (%rax),%rdi
8962   e1a092:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e1a095: R_X86_64_32S	.rodata+0x1b9020
8969   e1a099:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e1a09c: R_X86_64_32S	.rodata+0x1b8fa0
8970   e1a0a0:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e1a0a3: R_X86_64_32S	.rodata+0x1b9040
8977   e1a0a7:	4d 89 f8             	mov    %r15,%r8
897a   e1a0aa:	4d 89 f9             	mov    %r15,%r9
897d   e1a0ad:	53                   	push   %rbx
897e   e1a0ae:	e8 00 00 00 00       	call   e1a0b3 <fix_nodes+0x8983>	e1a0af: R_X86_64_PLT32	__reiserfs_panic-0x4
8983   e1a0b3:	48 83 c4 08          	add    $0x8,%rsp
8987   e1a0b7:	e9 40 7c ff ff       	jmp    e11cfc <fix_nodes+0x5cc>
898c   e1a0bc:	e8 00 00 00 00       	call   e1a0c1 <fix_nodes+0x8991>	e1a0bd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8991   e1a0c1:	eb 0c                	jmp    e1a0cf <fix_nodes+0x899f>
8993   e1a0c3:	e8 00 00 00 00       	call   e1a0c8 <fix_nodes+0x8998>	e1a0c4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8998   e1a0c8:	eb 05                	jmp    e1a0cf <fix_nodes+0x899f>
899a   e1a0ca:	e8 00 00 00 00       	call   e1a0cf <fix_nodes+0x899f>	e1a0cb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
899f   e1a0cf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
89a4   e1a0d4:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
89a9   e1a0d9:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
89b3   e1a0e3:	eb 19                	jmp    e1a0fe <fix_nodes+0x89ce>
89b5   e1a0e5:	e8 00 00 00 00       	call   e1a0ea <fix_nodes+0x89ba>	e1a0e6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
89ba   e1a0ea:	e9 b0 01 00 00       	jmp    e1a29f <fix_nodes+0x8b6f>
89bf   e1a0ef:	e8 00 00 00 00       	call   e1a0f4 <fix_nodes+0x89c4>	e1a0f0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
89c4   e1a0f4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
89c9   e1a0f9:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
89ce   e1a0fe:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
89d3   e1a103:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
89d8   e1a108:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
89dd   e1a10d:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
89e2   e1a112:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
89e7   e1a117:	74 08                	je     e1a121 <fix_nodes+0x89f1>
89e9   e1a119:	4c 89 f7             	mov    %r14,%rdi
89ec   e1a11c:	e8 00 00 00 00       	call   e1a121 <fix_nodes+0x89f1>	e1a11d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
89f1   e1a121:	49 8b 3e             	mov    (%r14),%rdi
89f4   e1a124:	e8 00 00 00 00       	call   e1a129 <fix_nodes+0x89f9>	e1a125: R_X86_64_PLT32	pathrelse-0x4
89f9   e1a129:	b0 01                	mov    $0x1,%al
89fb   e1a12b:	89 84 24 d8 00 00 00 	mov    %eax,0xd8(%rsp)
8a02   e1a132:	e9 bd 01 00 00       	jmp    e1a2f4 <fix_nodes+0x8bc4>
8a07   e1a137:	e8 00 00 00 00       	call   e1a13c <fix_nodes+0x8a0c>	e1a138: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8a0c   e1a13c:	eb 05                	jmp    e1a143 <fix_nodes+0x8a13>
8a0e   e1a13e:	e8 00 00 00 00       	call   e1a143 <fix_nodes+0x8a13>	e1a13f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8a13   e1a143:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
8a18   e1a148:	4c 89 ff             	mov    %r15,%rdi
8a1b   e1a14b:	31 f6                	xor    %esi,%esi
8a1d   e1a14d:	ba ff ff ff ff       	mov    $0xffffffff,%edx
8a22   e1a152:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
8a27   e1a157:	e8 00 00 00 00       	call   e1a15c <fix_nodes+0x8a2c>	e1a158: R_X86_64_PLT32	print_block-0x4
8a2c   e1a15c:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
8a31   e1a161:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8a36   e1a166:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
8a3b   e1a16b:	74 08                	je     e1a175 <fix_nodes+0x8a45>
8a3d   e1a16d:	4c 89 ff             	mov    %r15,%rdi
8a40   e1a170:	e8 00 00 00 00       	call   e1a175 <fix_nodes+0x8a45>	e1a171: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8a45   e1a175:	4c 8b 73 08          	mov    0x8(%rbx),%r14
8a49   e1a179:	48 81 c3 f0 01 00 00 	add    $0x1f0,%rbx
8a50   e1a180:	48 89 d8             	mov    %rbx,%rax
8a53   e1a183:	48 c1 e8 03          	shr    $0x3,%rax
8a57   e1a187:	42 8a 04 20          	mov    (%rax,%r12,1),%al
8a5b   e1a18b:	84 c0                	test   %al,%al
8a5d   e1a18d:	0f 85 18 11 00 00    	jne    e1b2ab <fix_nodes+0x9b7b>
8a63   e1a193:	8b 03                	mov    (%rbx),%eax
8a65   e1a195:	4c 89 f7             	mov    %r14,%rdi
8a68   e1a198:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e1a19b: R_X86_64_32S	.rodata+0x1b9140
8a6f   e1a19f:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e1a1a2: R_X86_64_32S	.rodata+0x1b8fa0
8a76   e1a1a6:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e1a1a9: R_X86_64_32S	.rodata+0x1b9160
8a7d   e1a1ad:	44 8b 84 24 c0 00 00 00 	mov    0xc0(%rsp),%r8d
8a85   e1a1b5:	4c 8b 8c 24 d8 00 00 00 	mov    0xd8(%rsp),%r9
8a8d   e1a1bd:	50                   	push   %rax
8a8e   e1a1be:	e8 00 00 00 00       	call   e1a1c3 <fix_nodes+0x8a93>	e1a1bf: R_X86_64_PLT32	__reiserfs_panic-0x4
8a93   e1a1c3:	48 83 c4 08          	add    $0x8,%rsp
8a97   e1a1c7:	e9 6d 7c ff ff       	jmp    e11e39 <fix_nodes+0x709>
8a9c   e1a1cc:	bf 04 00 00 00       	mov    $0x4,%edi
8aa1   e1a1d1:	44 89 ee             	mov    %r13d,%esi
8aa4   e1a1d4:	e8 00 00 00 00       	call   e1a1d9 <fix_nodes+0x8aa9>	e1a1d5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
8aa9   e1a1d9:	41 83 fd 04          	cmp    $0x4,%r13d
8aad   e1a1dd:	0f 85 c2 08 00 00    	jne    e1aaa5 <fix_nodes+0x9375>
8ab3   e1a1e3:	e8 00 00 00 00       	call   e1a1e8 <fix_nodes+0x8ab8>	e1a1e4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8ab8   e1a1e8:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
8abd   e1a1ed:	e9 fd ec ff ff       	jmp    e18eef <fix_nodes+0x77bf>
8ac2   e1a1f2:	e8 00 00 00 00       	call   e1a1f7 <fix_nodes+0x8ac7>	e1a1f3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8ac7   e1a1f7:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
8ad1   e1a201:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
8ad6   e1a206:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
8adb   e1a20b:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8ae0   e1a210:	74 08                	je     e1a21a <fix_nodes+0x8aea>
8ae2   e1a212:	4c 89 ff             	mov    %r15,%rdi
8ae5   e1a215:	e8 00 00 00 00       	call   e1a21a <fix_nodes+0x8aea>	e1a216: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8aea   e1a21a:	bb d8 06 00 00       	mov    $0x6d8,%ebx
8aef   e1a21f:	49 03 1f             	add    (%r15),%rbx
8af2   e1a222:	48 89 d8             	mov    %rbx,%rax
8af5   e1a225:	48 c1 e8 03          	shr    $0x3,%rax
8af9   e1a229:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8afe   e1a22e:	74 08                	je     e1a238 <fix_nodes+0x8b08>
8b00   e1a230:	48 89 df             	mov    %rbx,%rdi
8b03   e1a233:	e8 00 00 00 00       	call   e1a238 <fix_nodes+0x8b08>	e1a234: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8b08   e1a238:	41 be 70 01 00 00    	mov    $0x170,%r14d
8b0e   e1a23e:	4c 03 33             	add    (%rbx),%r14
8b11   e1a241:	4c 89 f7             	mov    %r14,%rdi
8b14   e1a244:	be 04 00 00 00       	mov    $0x4,%esi
8b19   e1a249:	e8 00 00 00 00       	call   e1a24e <fix_nodes+0x8b1e>	e1a24a: R_X86_64_PLT32	__kasan_check_read-0x4
8b1e   e1a24e:	4c 89 f0             	mov    %r14,%rax
8b21   e1a251:	48 c1 e8 03          	shr    $0x3,%rax
8b25   e1a255:	42 8a 04 20          	mov    (%rax,%r12,1),%al
8b29   e1a259:	84 c0                	test   %al,%al
8b2b   e1a25b:	0f 85 67 10 00 00    	jne    e1b2c8 <fix_nodes+0x9b98>
8b31   e1a261:	45 8b 36             	mov    (%r14),%r14d
8b34   e1a264:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
8b3c   e1a26c:	42 8a 04 20          	mov    (%rax,%r12,1),%al
8b40   e1a270:	84 c0                	test   %al,%al
8b42   e1a272:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
8b47   e1a277:	0f 85 69 10 00 00    	jne    e1b2e6 <fix_nodes+0x9bb6>
8b4d   e1a27d:	8b 1a                	mov    (%rdx),%ebx
8b4f   e1a27f:	44 89 f7             	mov    %r14d,%edi
8b52   e1a282:	89 de                	mov    %ebx,%esi
8b54   e1a284:	e8 00 00 00 00       	call   e1a289 <fix_nodes+0x8b59>	e1a285: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
8b59   e1a289:	41 39 de             	cmp    %ebx,%r14d
8b5c   e1a28c:	75 0c                	jne    e1a29a <fix_nodes+0x8b6a>
8b5e   e1a28e:	e8 00 00 00 00       	call   e1a293 <fix_nodes+0x8b63>	e1a28f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8b63   e1a293:	31 c0                	xor    %eax,%eax
8b65   e1a295:	e9 cc 07 00 00       	jmp    e1aa66 <fix_nodes+0x9336>
8b6a   e1a29a:	e8 00 00 00 00       	call   e1a29f <fix_nodes+0x8b6f>	e1a29b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8b6f   e1a29f:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
8b74   e1a2a4:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
8b79   e1a2a9:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8b7e   e1a2ae:	74 08                	je     e1a2b8 <fix_nodes+0x8b88>
8b80   e1a2b0:	4c 89 ff             	mov    %r15,%rdi
8b83   e1a2b3:	e8 00 00 00 00       	call   e1a2b8 <fix_nodes+0x8b88>	e1a2b4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8b88   e1a2b8:	49 8b 1f             	mov    (%r15),%rbx
8b8b   e1a2bb:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
8b90   e1a2c0:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8b95   e1a2c5:	74 08                	je     e1a2cf <fix_nodes+0x8b9f>
8b97   e1a2c7:	4c 89 f7             	mov    %r14,%rdi
8b9a   e1a2ca:	e8 00 00 00 00       	call   e1a2cf <fix_nodes+0x8b9f>	e1a2cb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8b9f   e1a2cf:	49 8b 36             	mov    (%r14),%rsi
8ba2   e1a2d2:	48 89 df             	mov    %rbx,%rdi
8ba5   e1a2d5:	e8 00 00 00 00       	call   e1a2da <fix_nodes+0x8baa>	e1a2d6: R_X86_64_PLT32	pathrelse_and_restore-0x4
8baa   e1a2da:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8baf   e1a2df:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
8bb4   e1a2e4:	c7 84 24 d8 00 00 00 00 00 00 00 	movl   $0x0,0xd8(%rsp)
8bbf   e1a2ef:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
8bc4   e1a2f4:	45 31 f6             	xor    %r14d,%r14d
8bc7   e1a2f7:	80 bc 24 d8 00 00 00 00 	cmpb   $0x0,0xd8(%rsp)
8bcf   e1a2ff:	74 1c                	je     e1a31d <fix_nodes+0x8bed>
8bd1   e1a301:	e9 ed 01 00 00       	jmp    e1a4f3 <fix_nodes+0x8dc3>
8bd6   e1a306:	e8 00 00 00 00       	call   e1a30b <fix_nodes+0x8bdb>	e1a307: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8bdb   e1a30b:	49 83 c6 08          	add    $0x8,%r14
8bdf   e1a30f:	80 bc 24 d8 00 00 00 00 	cmpb   $0x0,0xd8(%rsp)
8be7   e1a317:	0f 85 d6 01 00 00    	jne    e1a4f3 <fix_nodes+0x8dc3>
8bed   e1a31d:	e8 00 00 00 00       	call   e1a322 <fix_nodes+0x8bf2>	e1a31e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8bf2   e1a322:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
8bf7   e1a327:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8bfc   e1a32c:	74 08                	je     e1a336 <fix_nodes+0x8c06>
8bfe   e1a32e:	4c 89 ff             	mov    %r15,%rdi
8c01   e1a331:	e8 00 00 00 00       	call   e1a336 <fix_nodes+0x8c06>	e1a332: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8c06   e1a336:	48 89 d8             	mov    %rbx,%rax
8c09   e1a339:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
8c0d   e1a33d:	4a 8d 3c 30          	lea    (%rax,%r14,1),%rdi
8c11   e1a341:	48 83 c7 20          	add    $0x20,%rdi
8c15   e1a345:	48 89 f8             	mov    %rdi,%rax
8c18   e1a348:	48 c1 e8 03          	shr    $0x3,%rax
8c1c   e1a34c:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8c21   e1a351:	74 05                	je     e1a358 <fix_nodes+0x8c28>
8c23   e1a353:	e8 00 00 00 00       	call   e1a358 <fix_nodes+0x8c28>	e1a354: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8c28   e1a358:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
8c2d   e1a35d:	4a 8b 74 30 20       	mov    0x20(%rax,%r14,1),%rsi
8c32   e1a362:	48 89 df             	mov    %rbx,%rdi
8c35   e1a365:	e8 00 00 00 00       	call   e1a36a <fix_nodes+0x8c3a>	e1a366: R_X86_64_PLT32	reiserfs_restore_prepared_buffer-0x4
8c3a   e1a36a:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
8c3f   e1a36f:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8c44   e1a374:	74 08                	je     e1a37e <fix_nodes+0x8c4e>
8c46   e1a376:	4c 89 ff             	mov    %r15,%rdi
8c49   e1a379:	e8 00 00 00 00       	call   e1a37e <fix_nodes+0x8c4e>	e1a37a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8c4e   e1a37e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
8c53   e1a383:	48 8b 58 08          	mov    0x8(%rax),%rbx
8c57   e1a387:	4a 8d 3c 30          	lea    (%rax,%r14,1),%rdi
8c5b   e1a38b:	48 83 c7 48          	add    $0x48,%rdi
8c5f   e1a38f:	48 89 f8             	mov    %rdi,%rax
8c62   e1a392:	48 c1 e8 03          	shr    $0x3,%rax
8c66   e1a396:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8c6b   e1a39b:	74 05                	je     e1a3a2 <fix_nodes+0x8c72>
8c6d   e1a39d:	e8 00 00 00 00       	call   e1a3a2 <fix_nodes+0x8c72>	e1a39e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8c72   e1a3a2:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
8c77   e1a3a7:	4a 8b 74 30 48       	mov    0x48(%rax,%r14,1),%rsi
8c7c   e1a3ac:	48 89 df             	mov    %rbx,%rdi
8c7f   e1a3af:	e8 00 00 00 00       	call   e1a3b4 <fix_nodes+0x8c84>	e1a3b0: R_X86_64_PLT32	reiserfs_restore_prepared_buffer-0x4
8c84   e1a3b4:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
8c89   e1a3b9:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8c8e   e1a3be:	74 08                	je     e1a3c8 <fix_nodes+0x8c98>
8c90   e1a3c0:	4c 89 ff             	mov    %r15,%rdi
8c93   e1a3c3:	e8 00 00 00 00       	call   e1a3c8 <fix_nodes+0x8c98>	e1a3c4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8c98   e1a3c8:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
8c9d   e1a3cd:	48 8b 58 08          	mov    0x8(%rax),%rbx
8ca1   e1a3d1:	4a 8d 3c 30          	lea    (%rax,%r14,1),%rdi
8ca5   e1a3d5:	48 83 c7 70          	add    $0x70,%rdi
8ca9   e1a3d9:	48 89 f8             	mov    %rdi,%rax
8cac   e1a3dc:	48 c1 e8 03          	shr    $0x3,%rax
8cb0   e1a3e0:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8cb5   e1a3e5:	74 05                	je     e1a3ec <fix_nodes+0x8cbc>
8cb7   e1a3e7:	e8 00 00 00 00       	call   e1a3ec <fix_nodes+0x8cbc>	e1a3e8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8cbc   e1a3ec:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
8cc1   e1a3f1:	4a 8b 74 30 70       	mov    0x70(%rax,%r14,1),%rsi
8cc6   e1a3f6:	48 89 df             	mov    %rbx,%rdi
8cc9   e1a3f9:	e8 00 00 00 00       	call   e1a3fe <fix_nodes+0x8cce>	e1a3fa: R_X86_64_PLT32	reiserfs_restore_prepared_buffer-0x4
8cce   e1a3fe:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
8cd3   e1a403:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8cd8   e1a408:	74 08                	je     e1a412 <fix_nodes+0x8ce2>
8cda   e1a40a:	4c 89 ff             	mov    %r15,%rdi
8cdd   e1a40d:	e8 00 00 00 00       	call   e1a412 <fix_nodes+0x8ce2>	e1a40e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8ce2   e1a412:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
8ce7   e1a417:	48 8b 58 08          	mov    0x8(%rax),%rbx
8ceb   e1a41b:	4a 8d 3c 30          	lea    (%rax,%r14,1),%rdi
8cef   e1a41f:	48 81 c7 98 00 00 00 	add    $0x98,%rdi
8cf6   e1a426:	48 89 f8             	mov    %rdi,%rax
8cf9   e1a429:	48 c1 e8 03          	shr    $0x3,%rax
8cfd   e1a42d:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8d02   e1a432:	74 05                	je     e1a439 <fix_nodes+0x8d09>
8d04   e1a434:	e8 00 00 00 00       	call   e1a439 <fix_nodes+0x8d09>	e1a435: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8d09   e1a439:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
8d0e   e1a43e:	4a 8b b4 30 98 00 00 00 	mov    0x98(%rax,%r14,1),%rsi
8d16   e1a446:	48 89 df             	mov    %rbx,%rdi
8d19   e1a449:	e8 00 00 00 00       	call   e1a44e <fix_nodes+0x8d1e>	e1a44a: R_X86_64_PLT32	reiserfs_restore_prepared_buffer-0x4
8d1e   e1a44e:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
8d23   e1a453:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8d28   e1a458:	74 08                	je     e1a462 <fix_nodes+0x8d32>
8d2a   e1a45a:	4c 89 ff             	mov    %r15,%rdi
8d2d   e1a45d:	e8 00 00 00 00       	call   e1a462 <fix_nodes+0x8d32>	e1a45e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8d32   e1a462:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
8d37   e1a467:	48 8b 58 08          	mov    0x8(%rax),%rbx
8d3b   e1a46b:	4a 8d 3c 30          	lea    (%rax,%r14,1),%rdi
8d3f   e1a46f:	48 81 c7 c0 00 00 00 	add    $0xc0,%rdi
8d46   e1a476:	48 89 f8             	mov    %rdi,%rax
8d49   e1a479:	48 c1 e8 03          	shr    $0x3,%rax
8d4d   e1a47d:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8d52   e1a482:	74 05                	je     e1a489 <fix_nodes+0x8d59>
8d54   e1a484:	e8 00 00 00 00       	call   e1a489 <fix_nodes+0x8d59>	e1a485: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8d59   e1a489:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
8d5e   e1a48e:	4a 8b b4 30 c0 00 00 00 	mov    0xc0(%rax,%r14,1),%rsi
8d66   e1a496:	48 89 df             	mov    %rbx,%rdi
8d69   e1a499:	e8 00 00 00 00       	call   e1a49e <fix_nodes+0x8d6e>	e1a49a: R_X86_64_PLT32	reiserfs_restore_prepared_buffer-0x4
8d6e   e1a49e:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
8d73   e1a4a3:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8d78   e1a4a8:	74 08                	je     e1a4b2 <fix_nodes+0x8d82>
8d7a   e1a4aa:	4c 89 ff             	mov    %r15,%rdi
8d7d   e1a4ad:	e8 00 00 00 00       	call   e1a4b2 <fix_nodes+0x8d82>	e1a4ae: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8d82   e1a4b2:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
8d87   e1a4b7:	48 8b 58 08          	mov    0x8(%rax),%rbx
8d8b   e1a4bb:	4a 8d 3c 30          	lea    (%rax,%r14,1),%rdi
8d8f   e1a4bf:	48 81 c7 e8 00 00 00 	add    $0xe8,%rdi
8d96   e1a4c6:	48 89 f8             	mov    %rdi,%rax
8d99   e1a4c9:	48 c1 e8 03          	shr    $0x3,%rax
8d9d   e1a4cd:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8da2   e1a4d2:	74 05                	je     e1a4d9 <fix_nodes+0x8da9>
8da4   e1a4d4:	e8 00 00 00 00       	call   e1a4d9 <fix_nodes+0x8da9>	e1a4d5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8da9   e1a4d9:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
8dae   e1a4de:	4a 8b b4 30 e8 00 00 00 	mov    0xe8(%rax,%r14,1),%rsi
8db6   e1a4e6:	48 89 df             	mov    %rbx,%rdi
8db9   e1a4e9:	48 89 c3             	mov    %rax,%rbx
8dbc   e1a4ec:	e8 00 00 00 00       	call   e1a4f1 <fix_nodes+0x8dc1>	e1a4ed: R_X86_64_PLT32	reiserfs_restore_prepared_buffer-0x4
8dc1   e1a4f1:	eb 05                	jmp    e1a4f8 <fix_nodes+0x8dc8>
8dc3   e1a4f3:	e8 00 00 00 00       	call   e1a4f8 <fix_nodes+0x8dc8>	e1a4f4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8dc8   e1a4f8:	4e 8d 3c 33          	lea    (%rbx,%r14,1),%r15
8dcc   e1a4fc:	49 83 c7 20          	add    $0x20,%r15
8dd0   e1a500:	4c 89 f8             	mov    %r15,%rax
8dd3   e1a503:	48 c1 e8 03          	shr    $0x3,%rax
8dd7   e1a507:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
8ddc   e1a50c:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8de1   e1a511:	74 08                	je     e1a51b <fix_nodes+0x8deb>
8de3   e1a513:	4c 89 ff             	mov    %r15,%rdi
8de6   e1a516:	e8 00 00 00 00       	call   e1a51b <fix_nodes+0x8deb>	e1a517: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8deb   e1a51b:	4a 8b 5c 33 20       	mov    0x20(%rbx,%r14,1),%rbx
8df0   e1a520:	48 85 db             	test   %rbx,%rbx
8df3   e1a523:	74 0f                	je     e1a534 <fix_nodes+0x8e04>
8df5   e1a525:	e8 00 00 00 00       	call   e1a52a <fix_nodes+0x8dfa>	e1a526: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8dfa   e1a52a:	48 89 df             	mov    %rbx,%rdi
8dfd   e1a52d:	e8 00 00 00 00       	call   e1a532 <fix_nodes+0x8e02>	e1a52e: R_X86_64_PLT32	__brelse-0x4
8e02   e1a532:	eb 05                	jmp    e1a539 <fix_nodes+0x8e09>
8e04   e1a534:	e8 00 00 00 00       	call   e1a539 <fix_nodes+0x8e09>	e1a535: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8e09   e1a539:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
8e0e   e1a53e:	4e 8d 2c 33          	lea    (%rbx,%r14,1),%r13
8e12   e1a542:	49 83 c5 48          	add    $0x48,%r13
8e16   e1a546:	4c 89 e8             	mov    %r13,%rax
8e19   e1a549:	48 c1 e8 03          	shr    $0x3,%rax
8e1d   e1a54d:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
8e22   e1a552:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8e27   e1a557:	74 08                	je     e1a561 <fix_nodes+0x8e31>
8e29   e1a559:	4c 89 ef             	mov    %r13,%rdi
8e2c   e1a55c:	e8 00 00 00 00       	call   e1a561 <fix_nodes+0x8e31>	e1a55d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8e31   e1a561:	4a 8b 5c 33 48       	mov    0x48(%rbx,%r14,1),%rbx
8e36   e1a566:	48 85 db             	test   %rbx,%rbx
8e39   e1a569:	74 0f                	je     e1a57a <fix_nodes+0x8e4a>
8e3b   e1a56b:	e8 00 00 00 00       	call   e1a570 <fix_nodes+0x8e40>	e1a56c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8e40   e1a570:	48 89 df             	mov    %rbx,%rdi
8e43   e1a573:	e8 00 00 00 00       	call   e1a578 <fix_nodes+0x8e48>	e1a574: R_X86_64_PLT32	__brelse-0x4
8e48   e1a578:	eb 05                	jmp    e1a57f <fix_nodes+0x8e4f>
8e4a   e1a57a:	e8 00 00 00 00       	call   e1a57f <fix_nodes+0x8e4f>	e1a57b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8e4f   e1a57f:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
8e54   e1a584:	4a 8d 04 33          	lea    (%rbx,%r14,1),%rax
8e58   e1a588:	48 83 c0 70          	add    $0x70,%rax
8e5c   e1a58c:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
8e61   e1a591:	48 c1 e8 03          	shr    $0x3,%rax
8e65   e1a595:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
8e6a   e1a59a:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
8e6f   e1a59f:	74 0a                	je     e1a5ab <fix_nodes+0x8e7b>
8e71   e1a5a1:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
8e76   e1a5a6:	e8 00 00 00 00       	call   e1a5ab <fix_nodes+0x8e7b>	e1a5a7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8e7b   e1a5ab:	4a 8b 5c 33 70       	mov    0x70(%rbx,%r14,1),%rbx
8e80   e1a5b0:	48 85 db             	test   %rbx,%rbx
8e83   e1a5b3:	4c 89 ac 24 c0 00 00 00 	mov    %r13,0xc0(%rsp)
8e8b   e1a5bb:	74 0f                	je     e1a5cc <fix_nodes+0x8e9c>
8e8d   e1a5bd:	e8 00 00 00 00       	call   e1a5c2 <fix_nodes+0x8e92>	e1a5be: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8e92   e1a5c2:	48 89 df             	mov    %rbx,%rdi
8e95   e1a5c5:	e8 00 00 00 00       	call   e1a5ca <fix_nodes+0x8e9a>	e1a5c6: R_X86_64_PLT32	__brelse-0x4
8e9a   e1a5ca:	eb 05                	jmp    e1a5d1 <fix_nodes+0x8ea1>
8e9c   e1a5cc:	e8 00 00 00 00       	call   e1a5d1 <fix_nodes+0x8ea1>	e1a5cd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8ea1   e1a5d1:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
8ea6   e1a5d6:	4e 8d 2c 33          	lea    (%rbx,%r14,1),%r13
8eaa   e1a5da:	49 81 c5 98 00 00 00 	add    $0x98,%r13
8eb1   e1a5e1:	4c 89 6c 24 58       	mov    %r13,0x58(%rsp)
8eb6   e1a5e6:	49 c1 ed 03          	shr    $0x3,%r13
8eba   e1a5ea:	43 80 7c 25 00 00    	cmpb   $0x0,0x0(%r13,%r12,1)
8ec0   e1a5f0:	74 0a                	je     e1a5fc <fix_nodes+0x8ecc>
8ec2   e1a5f2:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
8ec7   e1a5f7:	e8 00 00 00 00       	call   e1a5fc <fix_nodes+0x8ecc>	e1a5f8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8ecc   e1a5fc:	4a 8b 9c 33 98 00 00 00 	mov    0x98(%rbx,%r14,1),%rbx
8ed4   e1a604:	48 85 db             	test   %rbx,%rbx
8ed7   e1a607:	4c 89 bc 24 e8 00 00 00 	mov    %r15,0xe8(%rsp)
8edf   e1a60f:	74 0f                	je     e1a620 <fix_nodes+0x8ef0>
8ee1   e1a611:	e8 00 00 00 00       	call   e1a616 <fix_nodes+0x8ee6>	e1a612: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8ee6   e1a616:	48 89 df             	mov    %rbx,%rdi
8ee9   e1a619:	e8 00 00 00 00       	call   e1a61e <fix_nodes+0x8eee>	e1a61a: R_X86_64_PLT32	__brelse-0x4
8eee   e1a61e:	eb 05                	jmp    e1a625 <fix_nodes+0x8ef5>
8ef0   e1a620:	e8 00 00 00 00       	call   e1a625 <fix_nodes+0x8ef5>	e1a621: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8ef5   e1a625:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
8efa   e1a62a:	4e 8d 3c 33          	lea    (%rbx,%r14,1),%r15
8efe   e1a62e:	49 81 c7 c0 00 00 00 	add    $0xc0,%r15
8f05   e1a635:	4c 89 7c 24 18       	mov    %r15,0x18(%rsp)
8f0a   e1a63a:	49 c1 ef 03          	shr    $0x3,%r15
8f0e   e1a63e:	43 80 3c 27 00       	cmpb   $0x0,(%r15,%r12,1)
8f13   e1a643:	74 0a                	je     e1a64f <fix_nodes+0x8f1f>
8f15   e1a645:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
8f1a   e1a64a:	e8 00 00 00 00       	call   e1a64f <fix_nodes+0x8f1f>	e1a64b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8f1f   e1a64f:	4a 8b 9c 33 c0 00 00 00 	mov    0xc0(%rbx,%r14,1),%rbx
8f27   e1a657:	48 85 db             	test   %rbx,%rbx
8f2a   e1a65a:	74 0f                	je     e1a66b <fix_nodes+0x8f3b>
8f2c   e1a65c:	e8 00 00 00 00       	call   e1a661 <fix_nodes+0x8f31>	e1a65d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8f31   e1a661:	48 89 df             	mov    %rbx,%rdi
8f34   e1a664:	e8 00 00 00 00       	call   e1a669 <fix_nodes+0x8f39>	e1a665: R_X86_64_PLT32	__brelse-0x4
8f39   e1a669:	eb 05                	jmp    e1a670 <fix_nodes+0x8f40>
8f3b   e1a66b:	e8 00 00 00 00       	call   e1a670 <fix_nodes+0x8f40>	e1a66c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8f40   e1a670:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
8f45   e1a675:	4e 8d 24 33          	lea    (%rbx,%r14,1),%r12
8f49   e1a679:	49 81 c4 e8 00 00 00 	add    $0xe8,%r12
8f50   e1a680:	4c 89 64 24 10       	mov    %r12,0x10(%rsp)
8f55   e1a685:	49 c1 ec 03          	shr    $0x3,%r12
8f59   e1a689:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
8f63   e1a693:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
8f68   e1a698:	74 0a                	je     e1a6a4 <fix_nodes+0x8f74>
8f6a   e1a69a:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
8f6f   e1a69f:	e8 00 00 00 00       	call   e1a6a4 <fix_nodes+0x8f74>	e1a6a0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8f74   e1a6a4:	4a 8b 9c 33 e8 00 00 00 	mov    0xe8(%rbx,%r14,1),%rbx
8f7c   e1a6ac:	48 85 db             	test   %rbx,%rbx
8f7f   e1a6af:	74 0f                	je     e1a6c0 <fix_nodes+0x8f90>
8f81   e1a6b1:	e8 00 00 00 00       	call   e1a6b6 <fix_nodes+0x8f86>	e1a6b2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8f86   e1a6b6:	48 89 df             	mov    %rbx,%rdi
8f89   e1a6b9:	e8 00 00 00 00       	call   e1a6be <fix_nodes+0x8f8e>	e1a6ba: R_X86_64_PLT32	__brelse-0x4
8f8e   e1a6be:	eb 05                	jmp    e1a6c5 <fix_nodes+0x8f95>
8f90   e1a6c0:	e8 00 00 00 00       	call   e1a6c5 <fix_nodes+0x8f95>	e1a6c1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8f95   e1a6c5:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
8f9f   e1a6cf:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
8fa4   e1a6d4:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
8fa8   e1a6d8:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
8fad   e1a6dd:	74 0d                	je     e1a6ec <fix_nodes+0x8fbc>
8faf   e1a6df:	48 8b bc 24 e8 00 00 00 	mov    0xe8(%rsp),%rdi
8fb7   e1a6e7:	e8 00 00 00 00       	call   e1a6ec <fix_nodes+0x8fbc>	e1a6e8: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
8fbc   e1a6ec:	4a c7 44 33 20 00 00 00 00 	movq   $0x0,0x20(%rbx,%r14,1)
8fc5   e1a6f5:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
8fcf   e1a6ff:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
8fd4   e1a704:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
8fd8   e1a708:	74 0d                	je     e1a717 <fix_nodes+0x8fe7>
8fda   e1a70a:	48 8b bc 24 c0 00 00 00 	mov    0xc0(%rsp),%rdi
8fe2   e1a712:	e8 00 00 00 00       	call   e1a717 <fix_nodes+0x8fe7>	e1a713: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
8fe7   e1a717:	4a c7 44 33 48 00 00 00 00 	movq   $0x0,0x48(%rbx,%r14,1)
8ff0   e1a720:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
8ffa   e1a72a:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
8fff   e1a72f:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
9003   e1a733:	74 0a                	je     e1a73f <fix_nodes+0x900f>
9005   e1a735:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
900a   e1a73a:	e8 00 00 00 00       	call   e1a73f <fix_nodes+0x900f>	e1a73b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
900f   e1a73f:	4a c7 44 33 70 00 00 00 00 	movq   $0x0,0x70(%rbx,%r14,1)
9018   e1a748:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
9022   e1a752:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
9028   e1a758:	74 0a                	je     e1a764 <fix_nodes+0x9034>
902a   e1a75a:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
902f   e1a75f:	e8 00 00 00 00       	call   e1a764 <fix_nodes+0x9034>	e1a760: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
9034   e1a764:	4a c7 84 33 98 00 00 00 00 00 00 00 	movq   $0x0,0x98(%rbx,%r14,1)
9040   e1a770:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
904a   e1a77a:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
904f   e1a77f:	74 0a                	je     e1a78b <fix_nodes+0x905b>
9051   e1a781:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
9056   e1a786:	e8 00 00 00 00       	call   e1a78b <fix_nodes+0x905b>	e1a787: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
905b   e1a78b:	4a c7 84 33 c0 00 00 00 00 00 00 00 	movq   $0x0,0xc0(%rbx,%r14,1)
9067   e1a797:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
9071   e1a7a1:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
9076   e1a7a6:	49 89 c4             	mov    %rax,%r12
9079   e1a7a9:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
907e   e1a7ae:	74 0a                	je     e1a7ba <fix_nodes+0x908a>
9080   e1a7b0:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
9085   e1a7b5:	e8 00 00 00 00       	call   e1a7ba <fix_nodes+0x908a>	e1a7b6: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
908a   e1a7ba:	4a c7 84 33 e8 00 00 00 00 00 00 00 	movq   $0x0,0xe8(%rbx,%r14,1)
9096   e1a7c6:	49 83 fe 20          	cmp    $0x20,%r14
909a   e1a7ca:	0f 85 36 fb ff ff    	jne    e1a306 <fix_nodes+0x8bd6>
90a0   e1a7d0:	80 bc 24 d8 00 00 00 00 	cmpb   $0x0,0xd8(%rsp)
90a8   e1a7d8:	74 0a                	je     e1a7e4 <fix_nodes+0x90b4>
90aa   e1a7da:	e8 00 00 00 00       	call   e1a7df <fix_nodes+0x90af>	e1a7db: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
90af   e1a7df:	e9 7d 02 00 00       	jmp    e1aa61 <fix_nodes+0x9331>
90b4   e1a7e4:	4c 8d bb 10 01 00 00 	lea    0x110(%rbx),%r15
90bb   e1a7eb:	4c 89 fb             	mov    %r15,%rbx
90be   e1a7ee:	48 c1 eb 03          	shr    $0x3,%rbx
90c2   e1a7f2:	42 80 3c 23 00       	cmpb   $0x0,(%rbx,%r12,1)
90c7   e1a7f7:	74 08                	je     e1a801 <fix_nodes+0x90d1>
90c9   e1a7f9:	4c 89 ff             	mov    %r15,%rdi
90cc   e1a7fc:	e8 00 00 00 00       	call   e1a801 <fix_nodes+0x90d1>	e1a7fd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
90d1   e1a801:	49 83 3f 00          	cmpq   $0x0,(%r15)
90d5   e1a805:	74 3d                	je     e1a844 <fix_nodes+0x9114>
90d7   e1a807:	e8 00 00 00 00       	call   e1a80c <fix_nodes+0x90dc>	e1a808: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
90dc   e1a80c:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
90e1   e1a811:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
90e6   e1a816:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
90eb   e1a81b:	74 08                	je     e1a825 <fix_nodes+0x90f5>
90ed   e1a81d:	4c 89 f7             	mov    %r14,%rdi
90f0   e1a820:	e8 00 00 00 00       	call   e1a825 <fix_nodes+0x90f5>	e1a821: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
90f5   e1a825:	4d 8b 36             	mov    (%r14),%r14
90f8   e1a828:	42 80 3c 23 00       	cmpb   $0x0,(%rbx,%r12,1)
90fd   e1a82d:	74 08                	je     e1a837 <fix_nodes+0x9107>
90ff   e1a82f:	4c 89 ff             	mov    %r15,%rdi
9102   e1a832:	e8 00 00 00 00       	call   e1a837 <fix_nodes+0x9107>	e1a833: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
9107   e1a837:	49 8b 37             	mov    (%r15),%rsi
910a   e1a83a:	4c 89 f7             	mov    %r14,%rdi
910d   e1a83d:	e8 00 00 00 00       	call   e1a842 <fix_nodes+0x9112>	e1a83e: R_X86_64_PLT32	reiserfs_restore_prepared_buffer-0x4
9112   e1a842:	eb 05                	jmp    e1a849 <fix_nodes+0x9119>
9114   e1a844:	e8 00 00 00 00       	call   e1a849 <fix_nodes+0x9119>	e1a845: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9119   e1a849:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
911e   e1a84e:	4c 8d b8 18 01 00 00 	lea    0x118(%rax),%r15
9125   e1a855:	4c 89 fb             	mov    %r15,%rbx
9128   e1a858:	48 c1 eb 03          	shr    $0x3,%rbx
912c   e1a85c:	42 80 3c 23 00       	cmpb   $0x0,(%rbx,%r12,1)
9131   e1a861:	74 08                	je     e1a86b <fix_nodes+0x913b>
9133   e1a863:	4c 89 ff             	mov    %r15,%rdi
9136   e1a866:	e8 00 00 00 00       	call   e1a86b <fix_nodes+0x913b>	e1a867: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
913b   e1a86b:	49 83 3f 00          	cmpq   $0x0,(%r15)
913f   e1a86f:	74 3d                	je     e1a8ae <fix_nodes+0x917e>
9141   e1a871:	e8 00 00 00 00       	call   e1a876 <fix_nodes+0x9146>	e1a872: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9146   e1a876:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
914b   e1a87b:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
9150   e1a880:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
9155   e1a885:	74 08                	je     e1a88f <fix_nodes+0x915f>
9157   e1a887:	4c 89 f7             	mov    %r14,%rdi
915a   e1a88a:	e8 00 00 00 00       	call   e1a88f <fix_nodes+0x915f>	e1a88b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
915f   e1a88f:	4d 8b 36             	mov    (%r14),%r14
9162   e1a892:	42 80 3c 23 00       	cmpb   $0x0,(%rbx,%r12,1)
9167   e1a897:	74 08                	je     e1a8a1 <fix_nodes+0x9171>
9169   e1a899:	4c 89 ff             	mov    %r15,%rdi
916c   e1a89c:	e8 00 00 00 00       	call   e1a8a1 <fix_nodes+0x9171>	e1a89d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
9171   e1a8a1:	49 8b 37             	mov    (%r15),%rsi
9174   e1a8a4:	4c 89 f7             	mov    %r14,%rdi
9177   e1a8a7:	e8 00 00 00 00       	call   e1a8ac <fix_nodes+0x917c>	e1a8a8: R_X86_64_PLT32	reiserfs_restore_prepared_buffer-0x4
917c   e1a8ac:	eb 05                	jmp    e1a8b3 <fix_nodes+0x9183>
917e   e1a8ae:	e8 00 00 00 00       	call   e1a8b3 <fix_nodes+0x9183>	e1a8af: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9183   e1a8b3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
9188   e1a8b8:	4c 8d b8 20 01 00 00 	lea    0x120(%rax),%r15
918f   e1a8bf:	4c 89 fb             	mov    %r15,%rbx
9192   e1a8c2:	48 c1 eb 03          	shr    $0x3,%rbx
9196   e1a8c6:	42 80 3c 23 00       	cmpb   $0x0,(%rbx,%r12,1)
919b   e1a8cb:	74 08                	je     e1a8d5 <fix_nodes+0x91a5>
919d   e1a8cd:	4c 89 ff             	mov    %r15,%rdi
91a0   e1a8d0:	e8 00 00 00 00       	call   e1a8d5 <fix_nodes+0x91a5>	e1a8d1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
91a5   e1a8d5:	49 83 3f 00          	cmpq   $0x0,(%r15)
91a9   e1a8d9:	74 3d                	je     e1a918 <fix_nodes+0x91e8>
91ab   e1a8db:	e8 00 00 00 00       	call   e1a8e0 <fix_nodes+0x91b0>	e1a8dc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
91b0   e1a8e0:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
91b5   e1a8e5:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
91ba   e1a8ea:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
91bf   e1a8ef:	74 08                	je     e1a8f9 <fix_nodes+0x91c9>
91c1   e1a8f1:	4c 89 f7             	mov    %r14,%rdi
91c4   e1a8f4:	e8 00 00 00 00       	call   e1a8f9 <fix_nodes+0x91c9>	e1a8f5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
91c9   e1a8f9:	4d 8b 36             	mov    (%r14),%r14
91cc   e1a8fc:	42 80 3c 23 00       	cmpb   $0x0,(%rbx,%r12,1)
91d1   e1a901:	74 08                	je     e1a90b <fix_nodes+0x91db>
91d3   e1a903:	4c 89 ff             	mov    %r15,%rdi
91d6   e1a906:	e8 00 00 00 00       	call   e1a90b <fix_nodes+0x91db>	e1a907: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
91db   e1a90b:	49 8b 37             	mov    (%r15),%rsi
91de   e1a90e:	4c 89 f7             	mov    %r14,%rdi
91e1   e1a911:	e8 00 00 00 00       	call   e1a916 <fix_nodes+0x91e6>	e1a912: R_X86_64_PLT32	reiserfs_restore_prepared_buffer-0x4
91e6   e1a916:	eb 05                	jmp    e1a91d <fix_nodes+0x91ed>
91e8   e1a918:	e8 00 00 00 00       	call   e1a91d <fix_nodes+0x91ed>	e1a919: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
91ed   e1a91d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
91f2   e1a922:	4c 8d b8 28 01 00 00 	lea    0x128(%rax),%r15
91f9   e1a929:	4c 89 fb             	mov    %r15,%rbx
91fc   e1a92c:	48 c1 eb 03          	shr    $0x3,%rbx
9200   e1a930:	42 80 3c 23 00       	cmpb   $0x0,(%rbx,%r12,1)
9205   e1a935:	74 08                	je     e1a93f <fix_nodes+0x920f>
9207   e1a937:	4c 89 ff             	mov    %r15,%rdi
920a   e1a93a:	e8 00 00 00 00       	call   e1a93f <fix_nodes+0x920f>	e1a93b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
920f   e1a93f:	49 83 3f 00          	cmpq   $0x0,(%r15)
9213   e1a943:	74 3d                	je     e1a982 <fix_nodes+0x9252>
9215   e1a945:	e8 00 00 00 00       	call   e1a94a <fix_nodes+0x921a>	e1a946: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
921a   e1a94a:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
921f   e1a94f:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
9224   e1a954:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
9229   e1a959:	74 08                	je     e1a963 <fix_nodes+0x9233>
922b   e1a95b:	4c 89 f7             	mov    %r14,%rdi
922e   e1a95e:	e8 00 00 00 00       	call   e1a963 <fix_nodes+0x9233>	e1a95f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
9233   e1a963:	4d 8b 36             	mov    (%r14),%r14
9236   e1a966:	42 80 3c 23 00       	cmpb   $0x0,(%rbx,%r12,1)
923b   e1a96b:	74 08                	je     e1a975 <fix_nodes+0x9245>
923d   e1a96d:	4c 89 ff             	mov    %r15,%rdi
9240   e1a970:	e8 00 00 00 00       	call   e1a975 <fix_nodes+0x9245>	e1a971: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
9245   e1a975:	49 8b 37             	mov    (%r15),%rsi
9248   e1a978:	4c 89 f7             	mov    %r14,%rdi
924b   e1a97b:	e8 00 00 00 00       	call   e1a980 <fix_nodes+0x9250>	e1a97c: R_X86_64_PLT32	reiserfs_restore_prepared_buffer-0x4
9250   e1a980:	eb 05                	jmp    e1a987 <fix_nodes+0x9257>
9252   e1a982:	e8 00 00 00 00       	call   e1a987 <fix_nodes+0x9257>	e1a983: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9257   e1a987:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
925c   e1a98c:	4c 8d b8 30 01 00 00 	lea    0x130(%rax),%r15
9263   e1a993:	4c 89 fb             	mov    %r15,%rbx
9266   e1a996:	48 c1 eb 03          	shr    $0x3,%rbx
926a   e1a99a:	42 80 3c 23 00       	cmpb   $0x0,(%rbx,%r12,1)
926f   e1a99f:	74 08                	je     e1a9a9 <fix_nodes+0x9279>
9271   e1a9a1:	4c 89 ff             	mov    %r15,%rdi
9274   e1a9a4:	e8 00 00 00 00       	call   e1a9a9 <fix_nodes+0x9279>	e1a9a5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
9279   e1a9a9:	49 83 3f 00          	cmpq   $0x0,(%r15)
927d   e1a9ad:	74 3d                	je     e1a9ec <fix_nodes+0x92bc>
927f   e1a9af:	e8 00 00 00 00       	call   e1a9b4 <fix_nodes+0x9284>	e1a9b0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9284   e1a9b4:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
9289   e1a9b9:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
928e   e1a9be:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
9293   e1a9c3:	74 08                	je     e1a9cd <fix_nodes+0x929d>
9295   e1a9c5:	4c 89 f7             	mov    %r14,%rdi
9298   e1a9c8:	e8 00 00 00 00       	call   e1a9cd <fix_nodes+0x929d>	e1a9c9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
929d   e1a9cd:	4d 8b 36             	mov    (%r14),%r14
92a0   e1a9d0:	42 80 3c 23 00       	cmpb   $0x0,(%rbx,%r12,1)
92a5   e1a9d5:	74 08                	je     e1a9df <fix_nodes+0x92af>
92a7   e1a9d7:	4c 89 ff             	mov    %r15,%rdi
92aa   e1a9da:	e8 00 00 00 00       	call   e1a9df <fix_nodes+0x92af>	e1a9db: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
92af   e1a9df:	49 8b 37             	mov    (%r15),%rsi
92b2   e1a9e2:	4c 89 f7             	mov    %r14,%rdi
92b5   e1a9e5:	e8 00 00 00 00       	call   e1a9ea <fix_nodes+0x92ba>	e1a9e6: R_X86_64_PLT32	reiserfs_restore_prepared_buffer-0x4
92ba   e1a9ea:	eb 05                	jmp    e1a9f1 <fix_nodes+0x92c1>
92bc   e1a9ec:	e8 00 00 00 00       	call   e1a9f1 <fix_nodes+0x92c1>	e1a9ed: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
92c1   e1a9f1:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
92c6   e1a9f6:	48 81 c3 38 01 00 00 	add    $0x138,%rbx
92cd   e1a9fd:	49 89 df             	mov    %rbx,%r15
92d0   e1aa00:	49 c1 ef 03          	shr    $0x3,%r15
92d4   e1aa04:	43 80 3c 27 00       	cmpb   $0x0,(%r15,%r12,1)
92d9   e1aa09:	74 08                	je     e1aa13 <fix_nodes+0x92e3>
92db   e1aa0b:	48 89 df             	mov    %rbx,%rdi
92de   e1aa0e:	e8 00 00 00 00       	call   e1aa13 <fix_nodes+0x92e3>	e1aa0f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
92e3   e1aa13:	48 83 3b 00          	cmpq   $0x0,(%rbx)
92e7   e1aa17:	74 43                	je     e1aa5c <fix_nodes+0x932c>
92e9   e1aa19:	49 89 dd             	mov    %rbx,%r13
92ec   e1aa1c:	e8 00 00 00 00       	call   e1aa21 <fix_nodes+0x92f1>	e1aa1d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
92f1   e1aa21:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
92f6   e1aa26:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
92fb   e1aa2b:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
9300   e1aa30:	74 08                	je     e1aa3a <fix_nodes+0x930a>
9302   e1aa32:	48 89 df             	mov    %rbx,%rdi
9305   e1aa35:	e8 00 00 00 00       	call   e1aa3a <fix_nodes+0x930a>	e1aa36: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
930a   e1aa3a:	4c 8b 33             	mov    (%rbx),%r14
930d   e1aa3d:	43 80 3c 27 00       	cmpb   $0x0,(%r15,%r12,1)
9312   e1aa42:	4c 89 eb             	mov    %r13,%rbx
9315   e1aa45:	74 08                	je     e1aa4f <fix_nodes+0x931f>
9317   e1aa47:	48 89 df             	mov    %rbx,%rdi
931a   e1aa4a:	e8 00 00 00 00       	call   e1aa4f <fix_nodes+0x931f>	e1aa4b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
931f   e1aa4f:	48 8b 33             	mov    (%rbx),%rsi
9322   e1aa52:	4c 89 f7             	mov    %r14,%rdi
9325   e1aa55:	e8 00 00 00 00       	call   e1aa5a <fix_nodes+0x932a>	e1aa56: R_X86_64_PLT32	reiserfs_restore_prepared_buffer-0x4
932a   e1aa5a:	eb 05                	jmp    e1aa61 <fix_nodes+0x9331>
932c   e1aa5c:	e8 00 00 00 00       	call   e1aa61 <fix_nodes+0x9331>	e1aa5d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9331   e1aa61:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
9336   e1aa66:	65 48 8b 0c 25 28 00 00 00 	mov    %gs:0x28,%rcx
933f   e1aa6f:	48 3b 8c 24 c0 01 00 00 	cmp    0x1c0(%rsp),%rcx
9347   e1aa77:	0f 85 61 0b 00 00    	jne    e1b5de <fix_nodes+0x9eae>
934d   e1aa7d:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
9351   e1aa81:	5b                   	pop    %rbx
9352   e1aa82:	41 5c                	pop    %r12
9354   e1aa84:	41 5d                	pop    %r13
9356   e1aa86:	41 5e                	pop    %r14
9358   e1aa88:	41 5f                	pop    %r15
935a   e1aa8a:	5d                   	pop    %rbp
935b   e1aa8b:	c3                   	ret
935c   e1aa8c:	e8 00 00 00 00       	call   e1aa91 <fix_nodes+0x9361>	e1aa8d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9361   e1aa91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
9366   e1aa96:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
936b   e1aa9b:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
9370   e1aaa0:	e9 63 f6 ff ff       	jmp    e1a108 <fix_nodes+0x89d8>
9375   e1aaa5:	41 8d 5d 01          	lea    0x1(%r13),%ebx
9379   e1aaa9:	bf 04 00 00 00       	mov    $0x4,%edi
937e   e1aaae:	44 89 ee             	mov    %r13d,%esi
9381   e1aab1:	e8 00 00 00 00       	call   e1aab6 <fix_nodes+0x9386>	e1aab2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
9386   e1aab6:	41 83 fd 03          	cmp    $0x3,%r13d
938a   e1aaba:	0f 87 c5 09 00 00    	ja     e1b485 <fix_nodes+0x9d55>
9390   e1aac0:	e8 00 00 00 00       	call   e1aac5 <fix_nodes+0x9395>	e1aac1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9395   e1aac5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
939a   e1aaca:	48 8d 1c 98          	lea    (%rax,%rbx,4),%rbx
939e   e1aace:	48 81 c3 f0 01 00 00 	add    $0x1f0,%rbx
93a5   e1aad5:	48 89 d8             	mov    %rbx,%rax
93a8   e1aad8:	48 c1 e8 03          	shr    $0x3,%rax
93ac   e1aadc:	42 8a 04 20          	mov    (%rax,%r12,1),%al
93b0   e1aae0:	84 c0                	test   %al,%al
93b2   e1aae2:	0f 85 61 08 00 00    	jne    e1b349 <fix_nodes+0x9c19>
93b8   e1aae8:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
93be   e1aaee:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
93c3   e1aaf3:	e9 f7 e3 ff ff       	jmp    e18eef <fix_nodes+0x77bf>
93c8   e1aaf8:	e8 00 00 00 00       	call   e1aafd <fix_nodes+0x93cd>	e1aaf9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
93cd   e1aafd:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
93d2   e1ab02:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
93d7   e1ab07:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
93dc   e1ab0c:	74 08                	je     e1ab16 <fix_nodes+0x93e6>
93de   e1ab0e:	4c 89 ff             	mov    %r15,%rdi
93e1   e1ab11:	e8 00 00 00 00       	call   e1ab16 <fix_nodes+0x93e6>	e1ab12: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
93e6   e1ab16:	49 8b 3f             	mov    (%r15),%rdi
93e9   e1ab19:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e1ab1c: R_X86_64_32S	.rodata+0x1b91e0
93f0   e1ab20:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e1ab23: R_X86_64_32S	.rodata+0x1b8fa0
93f7   e1ab27:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e1ab2a: R_X86_64_32S	.rodata+0x1b9200
93fe   e1ab2e:	e8 00 00 00 00       	call   e1ab33 <fix_nodes+0x9403>	e1ab2f: R_X86_64_PLT32	__reiserfs_panic-0x4
9403   e1ab33:	e9 01 73 ff ff       	jmp    e11e39 <fix_nodes+0x709>
9408   e1ab38:	e8 00 00 00 00       	call   e1ab3d <fix_nodes+0x940d>	e1ab39: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
940d   e1ab3d:	eb 05                	jmp    e1ab44 <fix_nodes+0x9414>
940f   e1ab3f:	e8 00 00 00 00       	call   e1ab44 <fix_nodes+0x9414>	e1ab40: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9414   e1ab44:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
9419   e1ab49:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
941e   e1ab4e:	74 0a                	je     e1ab5a <fix_nodes+0x942a>
9420   e1ab50:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
9425   e1ab55:	e8 00 00 00 00       	call   e1ab5a <fix_nodes+0x942a>	e1ab56: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
942a   e1ab5a:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
942f   e1ab5f:	4c 8b 30             	mov    (%rax),%r14
9432   e1ab62:	49 83 c7 28          	add    $0x28,%r15
9436   e1ab66:	4c 89 f8             	mov    %r15,%rax
9439   e1ab69:	48 c1 e8 03          	shr    $0x3,%rax
943d   e1ab6d:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
9442   e1ab72:	74 08                	je     e1ab7c <fix_nodes+0x944c>
9444   e1ab74:	4c 89 ff             	mov    %r15,%rdi
9447   e1ab77:	e8 00 00 00 00       	call   e1ab7c <fix_nodes+0x944c>	e1ab78: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
944c   e1ab7c:	49 8b 1f             	mov    (%r15),%rbx
944f   e1ab7f:	48 83 c3 02          	add    $0x2,%rbx
9453   e1ab83:	48 89 d8             	mov    %rbx,%rax
9456   e1ab86:	48 c1 e8 03          	shr    $0x3,%rax
945a   e1ab8a:	42 8a 04 20          	mov    (%rax,%r12,1),%al
945e   e1ab8e:	84 c0                	test   %al,%al
9460   e1ab90:	0f 85 96 07 00 00    	jne    e1b32c <fix_nodes+0x9bfc>
9466   e1ab96:	44 0f b7 0b          	movzwl (%rbx),%r9d
946a   e1ab9a:	4c 89 f7             	mov    %r14,%rdi
946d   e1ab9d:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e1aba0: R_X86_64_32S	.rodata+0x1b90c0
9474   e1aba4:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e1aba7: R_X86_64_32S	.rodata+0x1b8fa0
947b   e1abab:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e1abae: R_X86_64_32S	.rodata+0x1b90e0
9482   e1abb2:	44 8b 84 24 c0 00 00 00 	mov    0xc0(%rsp),%r8d
948a   e1abba:	e8 00 00 00 00       	call   e1abbf <fix_nodes+0x948f>	e1abbb: R_X86_64_PLT32	__reiserfs_panic-0x4
948f   e1abbf:	e9 70 72 ff ff       	jmp    e11e34 <fix_nodes+0x704>
9494   e1abc4:	49 8d 5f 20          	lea    0x20(%r15),%rbx
9498   e1abc8:	48 89 d8             	mov    %rbx,%rax
949b   e1abcb:	48 c1 e8 03          	shr    $0x3,%rax
949f   e1abcf:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
94a9   e1abd9:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
94ad   e1abdd:	74 08                	je     e1abe7 <fix_nodes+0x94b7>
94af   e1abdf:	48 89 df             	mov    %rbx,%rdi
94b2   e1abe2:	e8 00 00 00 00       	call   e1abe7 <fix_nodes+0x94b7>	e1abe3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
94b7   e1abe7:	44 8b 33             	mov    (%rbx),%r14d
94ba   e1abea:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
94bf   e1abef:	4c 8d a0 f0 01 00 00 	lea    0x1f0(%rax),%r12
94c6   e1abf6:	4c 89 e0             	mov    %r12,%rax
94c9   e1abf9:	48 c1 e8 03          	shr    $0x3,%rax
94cd   e1abfd:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
94d7   e1ac07:	8a 04 18             	mov    (%rax,%rbx,1),%al
94da   e1ac0a:	84 c0                	test   %al,%al
94dc   e1ac0c:	0f 85 54 07 00 00    	jne    e1b366 <fix_nodes+0x9c36>
94e2   e1ac12:	45 31 ed             	xor    %r13d,%r13d
94e5   e1ac15:	49 83 c7 28          	add    $0x28,%r15
94e9   e1ac19:	4c 89 f8             	mov    %r15,%rax
94ec   e1ac1c:	48 c1 e8 03          	shr    $0x3,%rax
94f0   e1ac20:	45 2b 2c 24          	sub    (%r12),%r13d
94f4   e1ac24:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
94f8   e1ac28:	49 89 dc             	mov    %rbx,%r12
94fb   e1ac2b:	74 08                	je     e1ac35 <fix_nodes+0x9505>
94fd   e1ac2d:	4c 89 ff             	mov    %r15,%rdi
9500   e1ac30:	e8 00 00 00 00       	call   e1ac35 <fix_nodes+0x9505>	e1ac31: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
9505   e1ac35:	41 83 c6 e8          	add    $0xffffffe8,%r14d
9509   e1ac39:	49 8b 1f             	mov    (%r15),%rbx
950c   e1ac3c:	48 83 c3 04          	add    $0x4,%rbx
9510   e1ac40:	48 89 d8             	mov    %rbx,%rax
9513   e1ac43:	48 c1 e8 03          	shr    $0x3,%rax
9517   e1ac47:	42 8a 04 20          	mov    (%rax,%r12,1),%al
951b   e1ac4b:	84 c0                	test   %al,%al
951d   e1ac4d:	0f 85 31 07 00 00    	jne    e1b384 <fix_nodes+0x9c54>
9523   e1ac53:	0f b7 03             	movzwl (%rbx),%eax
9526   e1ac56:	41 29 c6             	sub    %eax,%r14d
9529   e1ac59:	44 89 f7             	mov    %r14d,%edi
952c   e1ac5c:	44 89 ee             	mov    %r13d,%esi
952f   e1ac5f:	e8 00 00 00 00       	call   e1ac64 <fix_nodes+0x9534>	e1ac60: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
9534   e1ac64:	45 39 ee             	cmp    %r13d,%r14d
9537   e1ac67:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
953c   e1ac6c:	0f 8e 46 03 00 00    	jle    e1afb8 <fix_nodes+0x9888>
9542   e1ac72:	e8 00 00 00 00       	call   e1ac77 <fix_nodes+0x9547>	e1ac73: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9547   e1ac77:	4c 8b 74 24 70       	mov    0x70(%rsp),%r14
954c   e1ac7c:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
9554   e1ac84:	48 89 f8             	mov    %rdi,%rax
9557   e1ac87:	48 c1 e8 03          	shr    $0x3,%rax
955b   e1ac8b:	42 8a 04 20          	mov    (%rax,%r12,1),%al
955f   e1ac8f:	84 c0                	test   %al,%al
9561   e1ac91:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
9566   e1ac96:	48 8b b4 24 b8 00 00 00 	mov    0xb8(%rsp),%rsi
956e   e1ac9e:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
9576   e1aca6:	0f 85 f5 06 00 00    	jne    e1b3a1 <fix_nodes+0x9c71>
957c   e1acac:	c7 07 00 00 00 00    	movl   $0x0,(%rdi)
9582   e1acb2:	48 89 d8             	mov    %rbx,%rax
9585   e1acb5:	48 c1 e8 03          	shr    $0x3,%rax
9589   e1acb9:	42 8a 04 20          	mov    (%rax,%r12,1),%al
958d   e1acbd:	84 c0                	test   %al,%al
958f   e1acbf:	0f 85 13 07 00 00    	jne    e1b3d8 <fix_nodes+0x9ca8>
9595   e1acc5:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
959b   e1accb:	48 89 f0             	mov    %rsi,%rax
959e   e1acce:	48 c1 e8 03          	shr    $0x3,%rax
95a2   e1acd2:	42 8a 04 20          	mov    (%rax,%r12,1),%al
95a6   e1acd6:	84 c0                	test   %al,%al
95a8   e1acd8:	0f 85 31 07 00 00    	jne    e1b40f <fix_nodes+0x9cdf>
95ae   e1acde:	c7 06 01 00 00 00    	movl   $0x1,(%rsi)
95b4   e1ace4:	4c 89 f0             	mov    %r14,%rax
95b7   e1ace7:	48 c1 e8 03          	shr    $0x3,%rax
95bb   e1aceb:	42 8a 04 20          	mov    (%rax,%r12,1),%al
95bf   e1acef:	84 c0                	test   %al,%al
95c1   e1acf1:	0f 85 47 07 00 00    	jne    e1b43e <fix_nodes+0x9d0e>
95c7   e1acf7:	41 c7 06 ff ff ff ff 	movl   $0xffffffff,(%r14)
95ce   e1acfe:	48 89 d0             	mov    %rdx,%rax
95d1   e1ad01:	48 c1 e8 03          	shr    $0x3,%rax
95d5   e1ad05:	42 8a 04 20          	mov    (%rax,%r12,1),%al
95d9   e1ad09:	84 c0                	test   %al,%al
95db   e1ad0b:	0f 85 50 07 00 00    	jne    e1b461 <fix_nodes+0x9d31>
95e1   e1ad11:	c7 02 ff ff ff ff    	movl   $0xffffffff,(%rdx)
95e7   e1ad17:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
95ec   e1ad1c:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
95f1   e1ad21:	4c 89 eb             	mov    %r13,%rbx
95f4   e1ad24:	74 08                	je     e1ad2e <fix_nodes+0x95fe>
95f6   e1ad26:	48 89 df             	mov    %rbx,%rdi
95f9   e1ad29:	e8 00 00 00 00       	call   e1ad2e <fix_nodes+0x95fe>	e1ad2a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
95fe   e1ad2e:	41 be d8 06 00 00    	mov    $0x6d8,%r14d
9604   e1ad34:	4c 03 33             	add    (%rbx),%r14
9607   e1ad37:	4c 89 f0             	mov    %r14,%rax
960a   e1ad3a:	48 c1 e8 03          	shr    $0x3,%rax
960e   e1ad3e:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
9613   e1ad43:	74 08                	je     e1ad4d <fix_nodes+0x961d>
9615   e1ad45:	4c 89 f7             	mov    %r14,%rdi
9618   e1ad48:	e8 00 00 00 00       	call   e1ad4d <fix_nodes+0x961d>	e1ad49: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
961d   e1ad4d:	bb c8 03 00 00       	mov    $0x3c8,%ebx
9622   e1ad52:	49 03 1e             	add    (%r14),%rbx
9625   e1ad55:	48 89 d8             	mov    %rbx,%rax
9628   e1ad58:	48 c1 e8 03          	shr    $0x3,%rax
962c   e1ad5c:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
9631   e1ad61:	74 08                	je     e1ad6b <fix_nodes+0x963b>
9633   e1ad63:	48 89 df             	mov    %rbx,%rdi
9636   e1ad66:	e8 00 00 00 00       	call   e1ad6b <fix_nodes+0x963b>	e1ad67: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
963b   e1ad6b:	48 83 03 ff          	addq   $0xffffffffffffffff,(%rbx)
963f   e1ad6f:	41 be d8 06 00 00    	mov    $0x6d8,%r14d
9645   e1ad75:	4d 03 75 00          	add    0x0(%r13),%r14
9649   e1ad79:	4c 89 f0             	mov    %r14,%rax
964c   e1ad7c:	48 c1 e8 03          	shr    $0x3,%rax
9650   e1ad80:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
9655   e1ad85:	74 08                	je     e1ad8f <fix_nodes+0x965f>
9657   e1ad87:	4c 89 f7             	mov    %r14,%rdi
965a   e1ad8a:	e8 00 00 00 00       	call   e1ad8f <fix_nodes+0x965f>	e1ad8b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
965f   e1ad8f:	bb f0 03 00 00       	mov    $0x3f0,%ebx
9664   e1ad94:	49 03 1e             	add    (%r14),%rbx
9667   e1ad97:	48 89 d8             	mov    %rbx,%rax
966a   e1ad9a:	48 c1 e8 03          	shr    $0x3,%rax
966e   e1ad9e:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
9673   e1ada3:	74 08                	je     e1adad <fix_nodes+0x967d>
9675   e1ada5:	48 89 df             	mov    %rbx,%rdi
9678   e1ada8:	e8 00 00 00 00       	call   e1adad <fix_nodes+0x967d>	e1ada9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
967d   e1adad:	48 83 03 ff          	addq   $0xffffffffffffffff,(%rbx)
9681   e1adb1:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
9686   e1adb6:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
968b   e1adbb:	4d 89 ef             	mov    %r13,%r15
968e   e1adbe:	e9 8e e0 ff ff       	jmp    e18e51 <fix_nodes+0x7721>
9693   e1adc3:	e8 00 00 00 00       	call   e1adc8 <fix_nodes+0x9698>	e1adc4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9698   e1adc8:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
969d   e1adcd:	48 89 df             	mov    %rbx,%rdi
96a0   e1add0:	44 89 ee             	mov    %r13d,%esi
96a3   e1add3:	31 d2                	xor    %edx,%edx
96a5   e1add5:	31 c9                	xor    %ecx,%ecx
96a7   e1add7:	41 b8 01 00 00 00    	mov    $0x1,%r8d
96ad   e1addd:	45 31 c9             	xor    %r9d,%r9d
96b0   e1ade0:	6a ff                	push   $0xffffffffffffffff
96b2   e1ade2:	6a ff                	push   $0xffffffffffffffff
96b4   e1ade4:	e8 b7 3c 00 00       	call   e1eaa0 <set_parameters>
96b9   e1ade9:	48 83 c4 10          	add    $0x10,%rsp
96bd   e1aded:	e9 5f e0 ff ff       	jmp    e18e51 <fix_nodes+0x7721>
96c2   e1adf2:	e8 00 00 00 00       	call   e1adf7 <fix_nodes+0x96c7>	e1adf3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
96c7   e1adf7:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
96d1   e1ae01:	41 8a 04 0c          	mov    (%r12,%rcx,1),%al
96d5   e1ae05:	49 89 cc             	mov    %rcx,%r12
96d8   e1ae08:	84 c0                	test   %al,%al
96da   e1ae0a:	0f 85 8e 06 00 00    	jne    e1b49e <fix_nodes+0x9d6e>
96e0   e1ae10:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
96e5   e1ae15:	44 0f b7 30          	movzwl (%rax),%r14d
96e9   e1ae19:	48 8b 9c 24 40 01 00 00 	mov    0x140(%rsp),%rbx
96f1   e1ae21:	48 89 d8             	mov    %rbx,%rax
96f4   e1ae24:	48 c1 e8 03          	shr    $0x3,%rax
96f8   e1ae28:	42 8a 04 20          	mov    (%rax,%r12,1),%al
96fc   e1ae2c:	84 c0                	test   %al,%al
96fe   e1ae2e:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
9703   e1ae33:	48 8b b4 24 b8 00 00 00 	mov    0xb8(%rsp),%rsi
970b   e1ae3b:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
9713   e1ae43:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
971b   e1ae4b:	0f 85 6f 06 00 00    	jne    e1b4c0 <fix_nodes+0x9d90>
9721   e1ae51:	44 89 33             	mov    %r14d,(%rbx)
9724   e1ae54:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
9729   e1ae59:	42 8a 04 20          	mov    (%rax,%r12,1),%al
972d   e1ae5d:	84 c0                	test   %al,%al
972f   e1ae5f:	0f 85 95 06 00 00    	jne    e1b4fa <fix_nodes+0x9dca>
9735   e1ae65:	c7 07 00 00 00 00    	movl   $0x0,(%rdi)
973b   e1ae6b:	43 8a 44 25 00       	mov    0x0(%r13,%r12,1),%al
9740   e1ae70:	84 c0                	test   %al,%al
9742   e1ae72:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
9747   e1ae77:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
974c   e1ae7c:	0f 85 af 06 00 00    	jne    e1b531 <fix_nodes+0x9e01>
9752   e1ae82:	c7 02 00 00 00 00    	movl   $0x0,(%rdx)
9758   e1ae88:	48 89 f0             	mov    %rsi,%rax
975b   e1ae8b:	48 c1 e8 03          	shr    $0x3,%rax
975f   e1ae8f:	42 8a 04 20          	mov    (%rax,%r12,1),%al
9763   e1ae93:	84 c0                	test   %al,%al
9765   e1ae95:	0f 85 cd 06 00 00    	jne    e1b568 <fix_nodes+0x9e38>
976b   e1ae9b:	c7 06 01 00 00 00    	movl   $0x1,(%rsi)
9771   e1aea1:	48 89 d8             	mov    %rbx,%rax
9774   e1aea4:	48 c1 e8 03          	shr    $0x3,%rax
9778   e1aea8:	42 8a 04 20          	mov    (%rax,%r12,1),%al
977c   e1aeac:	84 c0                	test   %al,%al
977e   e1aeae:	0f 85 e3 06 00 00    	jne    e1b597 <fix_nodes+0x9e67>
9784   e1aeb4:	c7 03 ff ff ff ff    	movl   $0xffffffff,(%rbx)
978a   e1aeba:	4c 89 c0             	mov    %r8,%rax
978d   e1aebd:	48 c1 e8 03          	shr    $0x3,%rax
9791   e1aec1:	42 8a 04 20          	mov    (%rax,%r12,1),%al
9795   e1aec5:	84 c0                	test   %al,%al
9797   e1aec7:	0f 85 ec 06 00 00    	jne    e1b5b9 <fix_nodes+0x9e89>
979d   e1aecd:	41 c7 00 ff ff ff ff 	movl   $0xffffffff,(%r8)
97a4   e1aed4:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
97a9   e1aed9:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
97ae   e1aede:	4c 89 eb             	mov    %r13,%rbx
97b1   e1aee1:	74 08                	je     e1aeeb <fix_nodes+0x97bb>
97b3   e1aee3:	48 89 df             	mov    %rbx,%rdi
97b6   e1aee6:	e8 00 00 00 00       	call   e1aeeb <fix_nodes+0x97bb>	e1aee7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
97bb   e1aeeb:	41 be d8 06 00 00    	mov    $0x6d8,%r14d
97c1   e1aef1:	4c 03 33             	add    (%rbx),%r14
97c4   e1aef4:	4c 89 f0             	mov    %r14,%rax
97c7   e1aef7:	48 c1 e8 03          	shr    $0x3,%rax
97cb   e1aefb:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
97d0   e1af00:	74 08                	je     e1af0a <fix_nodes+0x97da>
97d2   e1af02:	4c 89 f7             	mov    %r14,%rdi
97d5   e1af05:	e8 00 00 00 00       	call   e1af0a <fix_nodes+0x97da>	e1af06: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
97da   e1af0a:	bb c8 03 00 00       	mov    $0x3c8,%ebx
97df   e1af0f:	49 03 1e             	add    (%r14),%rbx
97e2   e1af12:	48 89 d8             	mov    %rbx,%rax
97e5   e1af15:	48 c1 e8 03          	shr    $0x3,%rax
97e9   e1af19:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
97ee   e1af1e:	74 08                	je     e1af28 <fix_nodes+0x97f8>
97f0   e1af20:	48 89 df             	mov    %rbx,%rdi
97f3   e1af23:	e8 00 00 00 00       	call   e1af28 <fix_nodes+0x97f8>	e1af24: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
97f8   e1af28:	48 83 03 ff          	addq   $0xffffffffffffffff,(%rbx)
97fc   e1af2c:	41 be d8 06 00 00    	mov    $0x6d8,%r14d
9802   e1af32:	4d 03 75 00          	add    0x0(%r13),%r14
9806   e1af36:	4c 89 f0             	mov    %r14,%rax
9809   e1af39:	48 c1 e8 03          	shr    $0x3,%rax
980d   e1af3d:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
9812   e1af42:	74 08                	je     e1af4c <fix_nodes+0x981c>
9814   e1af44:	4c 89 f7             	mov    %r14,%rdi
9817   e1af47:	e8 00 00 00 00       	call   e1af4c <fix_nodes+0x981c>	e1af48: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
981c   e1af4c:	bb f0 03 00 00       	mov    $0x3f0,%ebx
9821   e1af51:	49 03 1e             	add    (%r14),%rbx
9824   e1af54:	48 89 d8             	mov    %rbx,%rax
9827   e1af57:	48 c1 e8 03          	shr    $0x3,%rax
982b   e1af5b:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
9830   e1af60:	0f 84 47 fe ff ff    	je     e1adad <fix_nodes+0x967d>
9836   e1af66:	48 89 df             	mov    %rbx,%rdi
9839   e1af69:	e8 00 00 00 00       	call   e1af6e <fix_nodes+0x983e>	e1af6a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
983e   e1af6e:	e9 3a fe ff ff       	jmp    e1adad <fix_nodes+0x967d>
9843   e1af73:	e8 00 00 00 00       	call   e1af78 <fix_nodes+0x9848>	e1af74: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9848   e1af78:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
984d   e1af7d:	48 89 df             	mov    %rbx,%rdi
9850   e1af80:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
9855   e1af85:	31 d2                	xor    %edx,%edx
9857   e1af87:	31 c9                	xor    %ecx,%ecx
9859   e1af89:	41 b8 01 00 00 00    	mov    $0x1,%r8d
985f   e1af8f:	45 31 c9             	xor    %r9d,%r9d
9862   e1af92:	6a ff                	push   $0xffffffffffffffff
9864   e1af94:	6a ff                	push   $0xffffffffffffffff
9866   e1af96:	e8 05 3b 00 00       	call   e1eaa0 <set_parameters>
986b   e1af9b:	48 83 c4 10          	add    $0x10,%rsp
986f   e1af9f:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
9879   e1afa9:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
987e   e1afae:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
9883   e1afb3:	e9 99 de ff ff       	jmp    e18e51 <fix_nodes+0x7721>
9888   e1afb8:	e8 00 00 00 00       	call   e1afbd <fix_nodes+0x988d>	e1afb9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
988d   e1afbd:	31 ff                	xor    %edi,%edi
988f   e1afbf:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e1afc2: R_X86_64_32S	.rodata+0x1b9240
9896   e1afc6:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	e1afc9: R_X86_64_32S	.rodata.str1.1+0x47937
989d   e1afcd:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	e1afd0: R_X86_64_32S	.rodata+0x1baa80
98a4   e1afd4:	41 b8 a5 07 00 00    	mov    $0x7a5,%r8d
98aa   e1afda:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	e1afdd: R_X86_64_32S	.rodata.str1.1+0x47937
98b1   e1afe1:	e8 00 00 00 00       	call   e1afe6 <fix_nodes+0x98b6>	e1afe2: R_X86_64_PLT32	__reiserfs_panic-0x4
98b6   e1afe6:	e9 8c fc ff ff       	jmp    e1ac77 <fix_nodes+0x9547>
98bb   e1afeb:	44 89 f1             	mov    %r14d,%ecx
98be   e1afee:	80 e1 07             	and    $0x7,%cl
98c1   e1aff1:	80 c1 03             	add    $0x3,%cl
98c4   e1aff4:	38 c1                	cmp    %al,%cl
98c6   e1aff6:	0f 8c c6 67 ff ff    	jl     e117c2 <fix_nodes+0x92>
98cc   e1affc:	4c 89 f7             	mov    %r14,%rdi
98cf   e1afff:	e8 00 00 00 00       	call   e1b004 <fix_nodes+0x98d4>	e1b000: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
98d4   e1b004:	e9 b9 67 ff ff       	jmp    e117c2 <fix_nodes+0x92>
98d9   e1b009:	89 d9                	mov    %ebx,%ecx
98db   e1b00b:	80 e1 07             	and    $0x7,%cl
98de   e1b00e:	80 c1 03             	add    $0x3,%cl
98e1   e1b011:	38 c1                	cmp    %al,%cl
98e3   e1b013:	0f 8c e5 67 ff ff    	jl     e117fe <fix_nodes+0xce>
98e9   e1b019:	48 89 df             	mov    %rbx,%rdi
98ec   e1b01c:	e8 00 00 00 00       	call   e1b021 <fix_nodes+0x98f1>	e1b01d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
98f1   e1b021:	e9 d8 67 ff ff       	jmp    e117fe <fix_nodes+0xce>
98f6   e1b026:	44 89 f1             	mov    %r14d,%ecx
98f9   e1b029:	80 e1 07             	and    $0x7,%cl
98fc   e1b02c:	80 c1 03             	add    $0x3,%cl
98ff   e1b02f:	38 c1                	cmp    %al,%cl
9901   e1b031:	0f 8c ff 67 ff ff    	jl     e11836 <fix_nodes+0x106>
9907   e1b037:	4c 89 f7             	mov    %r14,%rdi
990a   e1b03a:	e8 00 00 00 00       	call   e1b03f <fix_nodes+0x990f>	e1b03b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
990f   e1b03f:	e9 f2 67 ff ff       	jmp    e11836 <fix_nodes+0x106>
9914   e1b044:	44 89 f1             	mov    %r14d,%ecx
9917   e1b047:	80 e1 07             	and    $0x7,%cl
991a   e1b04a:	80 c1 03             	add    $0x3,%cl
991d   e1b04d:	38 c1                	cmp    %al,%cl
991f   e1b04f:	0f 8c 86 68 ff ff    	jl     e118db <fix_nodes+0x1ab>
9925   e1b055:	4c 89 f7             	mov    %r14,%rdi
9928   e1b058:	e8 00 00 00 00       	call   e1b05d <fix_nodes+0x992d>	e1b059: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
992d   e1b05d:	e9 79 68 ff ff       	jmp    e118db <fix_nodes+0x1ab>
9932   e1b062:	89 d9                	mov    %ebx,%ecx
9934   e1b064:	80 e1 07             	and    $0x7,%cl
9937   e1b067:	80 c1 03             	add    $0x3,%cl
993a   e1b06a:	38 c1                	cmp    %al,%cl
993c   e1b06c:	0f 8c a0 68 ff ff    	jl     e11912 <fix_nodes+0x1e2>
9942   e1b072:	48 89 df             	mov    %rbx,%rdi
9945   e1b075:	e8 00 00 00 00       	call   e1b07a <fix_nodes+0x994a>	e1b076: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
994a   e1b07a:	e9 93 68 ff ff       	jmp    e11912 <fix_nodes+0x1e2>
994f   e1b07f:	44 89 f1             	mov    %r14d,%ecx
9952   e1b082:	80 e1 07             	and    $0x7,%cl
9955   e1b085:	80 c1 03             	add    $0x3,%cl
9958   e1b088:	38 c1                	cmp    %al,%cl
995a   e1b08a:	0f 8c eb 68 ff ff    	jl     e1197b <fix_nodes+0x24b>
9960   e1b090:	4c 89 f7             	mov    %r14,%rdi
9963   e1b093:	e8 00 00 00 00       	call   e1b098 <fix_nodes+0x9968>	e1b094: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
9968   e1b098:	e9 de 68 ff ff       	jmp    e1197b <fix_nodes+0x24b>
996d   e1b09d:	89 d1                	mov    %edx,%ecx
996f   e1b09f:	80 e1 07             	and    $0x7,%cl
9972   e1b0a2:	80 c1 03             	add    $0x3,%cl
9975   e1b0a5:	38 c1                	cmp    %al,%cl
9977   e1b0a7:	0f 8c fd 68 ff ff    	jl     e119aa <fix_nodes+0x27a>
997d   e1b0ad:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
9982   e1b0b2:	e8 00 00 00 00       	call   e1b0b7 <fix_nodes+0x9987>	e1b0b3: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
9987   e1b0b7:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
998c   e1b0bc:	e9 e9 68 ff ff       	jmp    e119aa <fix_nodes+0x27a>
9991   e1b0c1:	44 89 f1             	mov    %r14d,%ecx
9994   e1b0c4:	80 e1 07             	and    $0x7,%cl
9997   e1b0c7:	80 c1 03             	add    $0x3,%cl
999a   e1b0ca:	38 c1                	cmp    %al,%cl
999c   e1b0cc:	0f 8c 1a 6a ff ff    	jl     e11aec <fix_nodes+0x3bc>
99a2   e1b0d2:	4c 89 f7             	mov    %r14,%rdi
99a5   e1b0d5:	e8 00 00 00 00       	call   e1b0da <fix_nodes+0x99aa>	e1b0d6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
99aa   e1b0da:	e9 0d 6a ff ff       	jmp    e11aec <fix_nodes+0x3bc>
99af   e1b0df:	89 d1                	mov    %edx,%ecx
99b1   e1b0e1:	80 e1 07             	and    $0x7,%cl
99b4   e1b0e4:	80 c1 03             	add    $0x3,%cl
99b7   e1b0e7:	38 c1                	cmp    %al,%cl
99b9   e1b0e9:	0f 8c 19 6a ff ff    	jl     e11b08 <fix_nodes+0x3d8>
99bf   e1b0ef:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
99c4   e1b0f4:	e8 00 00 00 00       	call   e1b0f9 <fix_nodes+0x99c9>	e1b0f5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
99c9   e1b0f9:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
99ce   e1b0fe:	e9 05 6a ff ff       	jmp    e11b08 <fix_nodes+0x3d8>
99d3   e1b103:	89 d9                	mov    %ebx,%ecx
99d5   e1b105:	80 e1 07             	and    $0x7,%cl
99d8   e1b108:	80 c1 03             	add    $0x3,%cl
99db   e1b10b:	38 c1                	cmp    %al,%cl
99dd   e1b10d:	0f 8c 6c 6d ff ff    	jl     e11e7f <fix_nodes+0x74f>
99e3   e1b113:	48 89 df             	mov    %rbx,%rdi
99e6   e1b116:	e8 00 00 00 00       	call   e1b11b <fix_nodes+0x99eb>	e1b117: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
99eb   e1b11b:	e9 5f 6d ff ff       	jmp    e11e7f <fix_nodes+0x74f>
99f0   e1b120:	44 89 e9             	mov    %r13d,%ecx
99f3   e1b123:	80 e1 07             	and    $0x7,%cl
99f6   e1b126:	80 c1 03             	add    $0x3,%cl
99f9   e1b129:	38 c1                	cmp    %al,%cl
99fb   e1b12b:	0f 8c 22 6e ff ff    	jl     e11f53 <fix_nodes+0x823>
9a01   e1b131:	4c 89 ef             	mov    %r13,%rdi
9a04   e1b134:	e8 00 00 00 00       	call   e1b139 <fix_nodes+0x9a09>	e1b135: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
9a09   e1b139:	e9 15 6e ff ff       	jmp    e11f53 <fix_nodes+0x823>
9a0e   e1b13e:	89 d9                	mov    %ebx,%ecx
9a10   e1b140:	80 e1 07             	and    $0x7,%cl
9a13   e1b143:	80 c1 01             	add    $0x1,%cl
9a16   e1b146:	38 c1                	cmp    %al,%cl
9a18   e1b148:	0f 8c 4f 6c ff ff    	jl     e11d9d <fix_nodes+0x66d>
9a1e   e1b14e:	48 89 df             	mov    %rbx,%rdi
9a21   e1b151:	e8 00 00 00 00       	call   e1b156 <fix_nodes+0x9a26>	e1b152: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
9a26   e1b156:	e9 42 6c ff ff       	jmp    e11d9d <fix_nodes+0x66d>
9a2b   e1b15b:	44 89 f1             	mov    %r14d,%ecx
9a2e   e1b15e:	80 e1 07             	and    $0x7,%cl
9a31   e1b161:	80 c1 03             	add    $0x3,%cl
9a34   e1b164:	38 c1                	cmp    %al,%cl
9a36   e1b166:	0f 8c a4 6a ff ff    	jl     e11c10 <fix_nodes+0x4e0>
9a3c   e1b16c:	4c 89 f7             	mov    %r14,%rdi
9a3f   e1b16f:	e8 00 00 00 00       	call   e1b174 <fix_nodes+0x9a44>	e1b170: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
9a44   e1b174:	e9 97 6a ff ff       	jmp    e11c10 <fix_nodes+0x4e0>
9a49   e1b179:	89 d1                	mov    %edx,%ecx
9a4b   e1b17b:	80 e1 07             	and    $0x7,%cl
9a4e   e1b17e:	80 c1 03             	add    $0x3,%cl
9a51   e1b181:	38 c1                	cmp    %al,%cl
9a53   e1b183:	0f 8c a3 6a ff ff    	jl     e11c2c <fix_nodes+0x4fc>
9a59   e1b189:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
9a5e   e1b18e:	e8 00 00 00 00       	call   e1b193 <fix_nodes+0x9a63>	e1b18f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
9a63   e1b193:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
9a68   e1b198:	e9 8f 6a ff ff       	jmp    e11c2c <fix_nodes+0x4fc>
9a6d   e1b19d:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
9a72   e1b1a2:	80 e1 07             	and    $0x7,%cl
9a75   e1b1a5:	80 c1 03             	add    $0x3,%cl
9a78   e1b1a8:	38 c1                	cmp    %al,%cl
9a7a   e1b1aa:	0f 8c 74 d8 ff ff    	jl     e18a24 <fix_nodes+0x72f4>
9a80   e1b1b0:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
9a85   e1b1b5:	e8 00 00 00 00       	call   e1b1ba <fix_nodes+0x9a8a>	e1b1b6: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
9a8a   e1b1ba:	e9 65 d8 ff ff       	jmp    e18a24 <fix_nodes+0x72f4>
9a8f   e1b1bf:	e8 00 00 00 00       	call   e1b1c4 <fix_nodes+0x9a94>	e1b1c0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9a94   e1b1c4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e1b1c7: R_X86_64_32S	.data+0x66dc10
9a9b   e1b1cb:	48 89 de             	mov    %rbx,%rsi
9a9e   e1b1ce:	e8 00 00 00 00       	call   e1b1d3 <fix_nodes+0x9aa3>	e1b1cf: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
9aa3   e1b1d3:	e9 08 66 ff ff       	jmp    e117e0 <fix_nodes+0xb0>
9aa8   e1b1d8:	e8 00 00 00 00       	call   e1b1dd <fix_nodes+0x9aad>	e1b1d9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9aad   e1b1dd:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e1b1e0: R_X86_64_32S	.data+0x66dc30
9ab4   e1b1e4:	48 89 de             	mov    %rbx,%rsi
9ab7   e1b1e7:	e8 00 00 00 00       	call   e1b1ec <fix_nodes+0x9abc>	e1b1e8: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
9abc   e1b1ec:	e9 63 66 ff ff       	jmp    e11854 <fix_nodes+0x124>
9ac1   e1b1f1:	89 d9                	mov    %ebx,%ecx
9ac3   e1b1f3:	80 e1 07             	and    $0x7,%cl
9ac6   e1b1f6:	80 c1 01             	add    $0x1,%cl
9ac9   e1b1f9:	38 c1                	cmp    %al,%cl
9acb   e1b1fb:	0f 8c 10 6c ff ff    	jl     e11e11 <fix_nodes+0x6e1>
9ad1   e1b201:	48 89 df             	mov    %rbx,%rdi
9ad4   e1b204:	e8 00 00 00 00       	call   e1b209 <fix_nodes+0x9ad9>	e1b205: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
9ad9   e1b209:	e9 03 6c ff ff       	jmp    e11e11 <fix_nodes+0x6e1>
9ade   e1b20e:	44 89 f1             	mov    %r14d,%ecx
9ae1   e1b211:	80 e1 07             	and    $0x7,%cl
9ae4   e1b214:	80 c1 03             	add    $0x3,%cl
9ae7   e1b217:	38 c1                	cmp    %al,%cl
9ae9   e1b219:	0f 8c ac d8 ff ff    	jl     e18acb <fix_nodes+0x739b>
9aef   e1b21f:	4c 89 f7             	mov    %r14,%rdi
9af2   e1b222:	e8 00 00 00 00       	call   e1b227 <fix_nodes+0x9af7>	e1b223: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
9af7   e1b227:	e9 9f d8 ff ff       	jmp    e18acb <fix_nodes+0x739b>
9afc   e1b22c:	89 d1                	mov    %edx,%ecx
9afe   e1b22e:	80 e1 07             	and    $0x7,%cl
9b01   e1b231:	80 c1 03             	add    $0x3,%cl
9b04   e1b234:	38 c1                	cmp    %al,%cl
9b06   e1b236:	0f 8c ab d8 ff ff    	jl     e18ae7 <fix_nodes+0x73b7>
9b0c   e1b23c:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
9b11   e1b241:	e8 00 00 00 00       	call   e1b246 <fix_nodes+0x9b16>	e1b242: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
9b16   e1b246:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
9b1b   e1b24b:	e9 97 d8 ff ff       	jmp    e18ae7 <fix_nodes+0x73b7>
9b20   e1b250:	e8 00 00 00 00       	call   e1b255 <fix_nodes+0x9b25>	e1b251: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9b25   e1b255:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e1b258: R_X86_64_32S	.data+0x66dcf0
9b2c   e1b25c:	48 89 de             	mov    %rbx,%rsi
9b2f   e1b25f:	e8 00 00 00 00       	call   e1b264 <fix_nodes+0x9b34>	e1b260: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
9b34   e1b264:	e9 34 6c ff ff       	jmp    e11e9d <fix_nodes+0x76d>
9b39   e1b269:	44 89 f1             	mov    %r14d,%ecx
9b3c   e1b26c:	80 e1 07             	and    $0x7,%cl
9b3f   e1b26f:	80 c1 03             	add    $0x3,%cl
9b42   e1b272:	38 c1                	cmp    %al,%cl
9b44   e1b274:	0f 8c ed ec ff ff    	jl     e19f67 <fix_nodes+0x8837>
9b4a   e1b27a:	4c 89 f7             	mov    %r14,%rdi
9b4d   e1b27d:	e8 00 00 00 00       	call   e1b282 <fix_nodes+0x9b52>	e1b27e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
9b52   e1b282:	e9 e0 ec ff ff       	jmp    e19f67 <fix_nodes+0x8837>
9b57   e1b287:	89 d1                	mov    %edx,%ecx
9b59   e1b289:	80 e1 07             	and    $0x7,%cl
9b5c   e1b28c:	80 c1 03             	add    $0x3,%cl
9b5f   e1b28f:	38 c1                	cmp    %al,%cl
9b61   e1b291:	0f 8c ec ec ff ff    	jl     e19f83 <fix_nodes+0x8853>
9b67   e1b297:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
9b6c   e1b29c:	e8 00 00 00 00       	call   e1b2a1 <fix_nodes+0x9b71>	e1b29d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
9b71   e1b2a1:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
9b76   e1b2a6:	e9 d8 ec ff ff       	jmp    e19f83 <fix_nodes+0x8853>
9b7b   e1b2ab:	89 d9                	mov    %ebx,%ecx
9b7d   e1b2ad:	80 e1 07             	and    $0x7,%cl
9b80   e1b2b0:	80 c1 03             	add    $0x3,%cl
9b83   e1b2b3:	38 c1                	cmp    %al,%cl
9b85   e1b2b5:	0f 8c d8 ee ff ff    	jl     e1a193 <fix_nodes+0x8a63>
9b8b   e1b2bb:	48 89 df             	mov    %rbx,%rdi
9b8e   e1b2be:	e8 00 00 00 00       	call   e1b2c3 <fix_nodes+0x9b93>	e1b2bf: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
9b93   e1b2c3:	e9 cb ee ff ff       	jmp    e1a193 <fix_nodes+0x8a63>
9b98   e1b2c8:	44 89 f1             	mov    %r14d,%ecx
9b9b   e1b2cb:	80 e1 07             	and    $0x7,%cl
9b9e   e1b2ce:	80 c1 03             	add    $0x3,%cl
9ba1   e1b2d1:	38 c1                	cmp    %al,%cl
9ba3   e1b2d3:	0f 8c 88 ef ff ff    	jl     e1a261 <fix_nodes+0x8b31>
9ba9   e1b2d9:	4c 89 f7             	mov    %r14,%rdi
9bac   e1b2dc:	e8 00 00 00 00       	call   e1b2e1 <fix_nodes+0x9bb1>	e1b2dd: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
9bb1   e1b2e1:	e9 7b ef ff ff       	jmp    e1a261 <fix_nodes+0x8b31>
9bb6   e1b2e6:	89 d1                	mov    %edx,%ecx
9bb8   e1b2e8:	80 e1 07             	and    $0x7,%cl
9bbb   e1b2eb:	80 c1 03             	add    $0x3,%cl
9bbe   e1b2ee:	38 c1                	cmp    %al,%cl
9bc0   e1b2f0:	0f 8c 87 ef ff ff    	jl     e1a27d <fix_nodes+0x8b4d>
9bc6   e1b2f6:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
9bcb   e1b2fb:	e8 00 00 00 00       	call   e1b300 <fix_nodes+0x9bd0>	e1b2fc: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
9bd0   e1b300:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
9bd5   e1b305:	e9 73 ef ff ff       	jmp    e1a27d <fix_nodes+0x8b4d>
9bda   e1b30a:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
9bdf   e1b30f:	80 e1 07             	and    $0x7,%cl
9be2   e1b312:	80 c1 03             	add    $0x3,%cl
9be5   e1b315:	38 c1                	cmp    %al,%cl
9be7   e1b317:	0f 8c b0 ec ff ff    	jl     e19fcd <fix_nodes+0x889d>
9bed   e1b31d:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
9bf2   e1b322:	e8 00 00 00 00       	call   e1b327 <fix_nodes+0x9bf7>	e1b323: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
9bf7   e1b327:	e9 a1 ec ff ff       	jmp    e19fcd <fix_nodes+0x889d>
9bfc   e1b32c:	89 d9                	mov    %ebx,%ecx
9bfe   e1b32e:	80 e1 07             	and    $0x7,%cl
9c01   e1b331:	80 c1 01             	add    $0x1,%cl
9c04   e1b334:	38 c1                	cmp    %al,%cl
9c06   e1b336:	0f 8c 5a f8 ff ff    	jl     e1ab96 <fix_nodes+0x9466>
9c0c   e1b33c:	48 89 df             	mov    %rbx,%rdi
9c0f   e1b33f:	e8 00 00 00 00       	call   e1b344 <fix_nodes+0x9c14>	e1b340: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
9c14   e1b344:	e9 4d f8 ff ff       	jmp    e1ab96 <fix_nodes+0x9466>
9c19   e1b349:	89 d9                	mov    %ebx,%ecx
9c1b   e1b34b:	80 e1 07             	and    $0x7,%cl
9c1e   e1b34e:	80 c1 03             	add    $0x3,%cl
9c21   e1b351:	38 c1                	cmp    %al,%cl
9c23   e1b353:	0f 8c 8f f7 ff ff    	jl     e1aae8 <fix_nodes+0x93b8>
9c29   e1b359:	48 89 df             	mov    %rbx,%rdi
9c2c   e1b35c:	e8 00 00 00 00       	call   e1b361 <fix_nodes+0x9c31>	e1b35d: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
9c31   e1b361:	e9 82 f7 ff ff       	jmp    e1aae8 <fix_nodes+0x93b8>
9c36   e1b366:	44 89 e1             	mov    %r12d,%ecx
9c39   e1b369:	80 e1 07             	and    $0x7,%cl
9c3c   e1b36c:	80 c1 03             	add    $0x3,%cl
9c3f   e1b36f:	38 c1                	cmp    %al,%cl
9c41   e1b371:	0f 8c 9b f8 ff ff    	jl     e1ac12 <fix_nodes+0x94e2>
9c47   e1b377:	4c 89 e7             	mov    %r12,%rdi
9c4a   e1b37a:	e8 00 00 00 00       	call   e1b37f <fix_nodes+0x9c4f>	e1b37b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
9c4f   e1b37f:	e9 8e f8 ff ff       	jmp    e1ac12 <fix_nodes+0x94e2>
9c54   e1b384:	89 d9                	mov    %ebx,%ecx
9c56   e1b386:	80 e1 07             	and    $0x7,%cl
9c59   e1b389:	80 c1 01             	add    $0x1,%cl
9c5c   e1b38c:	38 c1                	cmp    %al,%cl
9c5e   e1b38e:	0f 8c bf f8 ff ff    	jl     e1ac53 <fix_nodes+0x9523>
9c64   e1b394:	48 89 df             	mov    %rbx,%rdi
9c67   e1b397:	e8 00 00 00 00       	call   e1b39c <fix_nodes+0x9c6c>	e1b398: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
9c6c   e1b39c:	e9 b2 f8 ff ff       	jmp    e1ac53 <fix_nodes+0x9523>
9c71   e1b3a1:	89 f9                	mov    %edi,%ecx
9c73   e1b3a3:	80 e1 07             	and    $0x7,%cl
9c76   e1b3a6:	80 c1 03             	add    $0x3,%cl
9c79   e1b3a9:	38 c1                	cmp    %al,%cl
9c7b   e1b3ab:	0f 8c fb f8 ff ff    	jl     e1acac <fix_nodes+0x957c>
9c81   e1b3b1:	e8 00 00 00 00       	call   e1b3b6 <fix_nodes+0x9c86>	e1b3b2: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
9c86   e1b3b6:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
9c8e   e1b3be:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
9c96   e1b3c6:	48 8b b4 24 b8 00 00 00 	mov    0xb8(%rsp),%rsi
9c9e   e1b3ce:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
9ca3   e1b3d3:	e9 d4 f8 ff ff       	jmp    e1acac <fix_nodes+0x957c>
9ca8   e1b3d8:	89 d9                	mov    %ebx,%ecx
9caa   e1b3da:	80 e1 07             	and    $0x7,%cl
9cad   e1b3dd:	80 c1 03             	add    $0x3,%cl
9cb0   e1b3e0:	38 c1                	cmp    %al,%cl
9cb2   e1b3e2:	0f 8c dd f8 ff ff    	jl     e1acc5 <fix_nodes+0x9595>
9cb8   e1b3e8:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
9cc0   e1b3f0:	e8 00 00 00 00       	call   e1b3f5 <fix_nodes+0x9cc5>	e1b3f1: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
9cc5   e1b3f5:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
9ccd   e1b3fd:	48 8b b4 24 b8 00 00 00 	mov    0xb8(%rsp),%rsi
9cd5   e1b405:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
9cda   e1b40a:	e9 b6 f8 ff ff       	jmp    e1acc5 <fix_nodes+0x9595>
9cdf   e1b40f:	89 f1                	mov    %esi,%ecx
9ce1   e1b411:	80 e1 07             	and    $0x7,%cl
9ce4   e1b414:	80 c1 03             	add    $0x3,%cl
9ce7   e1b417:	38 c1                	cmp    %al,%cl
9ce9   e1b419:	0f 8c bf f8 ff ff    	jl     e1acde <fix_nodes+0x95ae>
9cef   e1b41f:	48 8b bc 24 b8 00 00 00 	mov    0xb8(%rsp),%rdi
9cf7   e1b427:	e8 00 00 00 00       	call   e1b42c <fix_nodes+0x9cfc>	e1b428: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
9cfc   e1b42c:	48 8b b4 24 b8 00 00 00 	mov    0xb8(%rsp),%rsi
9d04   e1b434:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
9d09   e1b439:	e9 a0 f8 ff ff       	jmp    e1acde <fix_nodes+0x95ae>
9d0e   e1b43e:	44 89 f1             	mov    %r14d,%ecx
9d11   e1b441:	80 e1 07             	and    $0x7,%cl
9d14   e1b444:	80 c1 03             	add    $0x3,%cl
9d17   e1b447:	38 c1                	cmp    %al,%cl
9d19   e1b449:	0f 8c a8 f8 ff ff    	jl     e1acf7 <fix_nodes+0x95c7>
9d1f   e1b44f:	4c 89 f7             	mov    %r14,%rdi
9d22   e1b452:	e8 00 00 00 00       	call   e1b457 <fix_nodes+0x9d27>	e1b453: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
9d27   e1b457:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
9d2c   e1b45c:	e9 96 f8 ff ff       	jmp    e1acf7 <fix_nodes+0x95c7>
9d31   e1b461:	89 d1                	mov    %edx,%ecx
9d33   e1b463:	80 e1 07             	and    $0x7,%cl
9d36   e1b466:	80 c1 03             	add    $0x3,%cl
9d39   e1b469:	38 c1                	cmp    %al,%cl
9d3b   e1b46b:	0f 8c a0 f8 ff ff    	jl     e1ad11 <fix_nodes+0x95e1>
9d41   e1b471:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
9d46   e1b476:	e8 00 00 00 00       	call   e1b47b <fix_nodes+0x9d4b>	e1b477: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
9d4b   e1b47b:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
9d50   e1b480:	e9 8c f8 ff ff       	jmp    e1ad11 <fix_nodes+0x95e1>
9d55   e1b485:	e8 00 00 00 00       	call   e1b48a <fix_nodes+0x9d5a>	e1b486: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9d5a   e1b48a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e1b48d: R_X86_64_32S	.data+0x66dc50
9d61   e1b491:	48 89 de             	mov    %rbx,%rsi
9d64   e1b494:	e8 00 00 00 00       	call   e1b499 <fix_nodes+0x9d69>	e1b495: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
9d69   e1b499:	e9 27 f6 ff ff       	jmp    e1aac5 <fix_nodes+0x9395>
9d6e   e1b49e:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
9d73   e1b4a3:	80 e1 07             	and    $0x7,%cl
9d76   e1b4a6:	80 c1 01             	add    $0x1,%cl
9d79   e1b4a9:	38 c1                	cmp    %al,%cl
9d7b   e1b4ab:	0f 8c 5f f9 ff ff    	jl     e1ae10 <fix_nodes+0x96e0>
9d81   e1b4b1:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
9d86   e1b4b6:	e8 00 00 00 00       	call   e1b4bb <fix_nodes+0x9d8b>	e1b4b7: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
9d8b   e1b4bb:	e9 50 f9 ff ff       	jmp    e1ae10 <fix_nodes+0x96e0>
9d90   e1b4c0:	89 d9                	mov    %ebx,%ecx
9d92   e1b4c2:	80 e1 07             	and    $0x7,%cl
9d95   e1b4c5:	80 c1 03             	add    $0x3,%cl
9d98   e1b4c8:	38 c1                	cmp    %al,%cl
9d9a   e1b4ca:	0f 8c 81 f9 ff ff    	jl     e1ae51 <fix_nodes+0x9721>
9da0   e1b4d0:	48 89 df             	mov    %rbx,%rdi
9da3   e1b4d3:	e8 00 00 00 00       	call   e1b4d8 <fix_nodes+0x9da8>	e1b4d4: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
9da8   e1b4d8:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
9db0   e1b4e0:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
9db8   e1b4e8:	48 8b b4 24 b8 00 00 00 	mov    0xb8(%rsp),%rsi
9dc0   e1b4f0:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
9dc5   e1b4f5:	e9 57 f9 ff ff       	jmp    e1ae51 <fix_nodes+0x9721>
9dca   e1b4fa:	89 f9                	mov    %edi,%ecx
9dcc   e1b4fc:	80 e1 07             	and    $0x7,%cl
9dcf   e1b4ff:	80 c1 03             	add    $0x3,%cl
9dd2   e1b502:	38 c1                	cmp    %al,%cl
9dd4   e1b504:	0f 8c 5b f9 ff ff    	jl     e1ae65 <fix_nodes+0x9735>
9dda   e1b50a:	e8 00 00 00 00       	call   e1b50f <fix_nodes+0x9ddf>	e1b50b: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
9ddf   e1b50f:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
9de7   e1b517:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
9def   e1b51f:	48 8b b4 24 b8 00 00 00 	mov    0xb8(%rsp),%rsi
9df7   e1b527:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
9dfc   e1b52c:	e9 34 f9 ff ff       	jmp    e1ae65 <fix_nodes+0x9735>
9e01   e1b531:	89 d1                	mov    %edx,%ecx
9e03   e1b533:	80 e1 07             	and    $0x7,%cl
9e06   e1b536:	80 c1 03             	add    $0x3,%cl
9e09   e1b539:	38 c1                	cmp    %al,%cl
9e0b   e1b53b:	0f 8c 41 f9 ff ff    	jl     e1ae82 <fix_nodes+0x9752>
9e11   e1b541:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
9e19   e1b549:	e8 00 00 00 00       	call   e1b54e <fix_nodes+0x9e1e>	e1b54a: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
9e1e   e1b54e:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
9e26   e1b556:	48 8b b4 24 b8 00 00 00 	mov    0xb8(%rsp),%rsi
9e2e   e1b55e:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
9e33   e1b563:	e9 1a f9 ff ff       	jmp    e1ae82 <fix_nodes+0x9752>
9e38   e1b568:	89 f1                	mov    %esi,%ecx
9e3a   e1b56a:	80 e1 07             	and    $0x7,%cl
9e3d   e1b56d:	80 c1 03             	add    $0x3,%cl
9e40   e1b570:	38 c1                	cmp    %al,%cl
9e42   e1b572:	0f 8c 23 f9 ff ff    	jl     e1ae9b <fix_nodes+0x976b>
9e48   e1b578:	48 8b bc 24 b8 00 00 00 	mov    0xb8(%rsp),%rdi
9e50   e1b580:	e8 00 00 00 00       	call   e1b585 <fix_nodes+0x9e55>	e1b581: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
9e55   e1b585:	48 8b b4 24 b8 00 00 00 	mov    0xb8(%rsp),%rsi
9e5d   e1b58d:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
9e62   e1b592:	e9 04 f9 ff ff       	jmp    e1ae9b <fix_nodes+0x976b>
9e67   e1b597:	89 d9                	mov    %ebx,%ecx
9e69   e1b599:	80 e1 07             	and    $0x7,%cl
9e6c   e1b59c:	80 c1 03             	add    $0x3,%cl
9e6f   e1b59f:	38 c1                	cmp    %al,%cl
9e71   e1b5a1:	0f 8c 0d f9 ff ff    	jl     e1aeb4 <fix_nodes+0x9784>
9e77   e1b5a7:	48 89 df             	mov    %rbx,%rdi
9e7a   e1b5aa:	e8 00 00 00 00       	call   e1b5af <fix_nodes+0x9e7f>	e1b5ab: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
9e7f   e1b5af:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
9e84   e1b5b4:	e9 fb f8 ff ff       	jmp    e1aeb4 <fix_nodes+0x9784>
9e89   e1b5b9:	44 89 c1             	mov    %r8d,%ecx
9e8c   e1b5bc:	80 e1 07             	and    $0x7,%cl
9e8f   e1b5bf:	80 c1 03             	add    $0x3,%cl
9e92   e1b5c2:	38 c1                	cmp    %al,%cl
9e94   e1b5c4:	0f 8c 03 f9 ff ff    	jl     e1aecd <fix_nodes+0x979d>
9e9a   e1b5ca:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
9e9f   e1b5cf:	e8 00 00 00 00       	call   e1b5d4 <fix_nodes+0x9ea4>	e1b5d0: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
9ea4   e1b5d4:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
9ea9   e1b5d9:	e9 ef f8 ff ff       	jmp    e1aecd <fix_nodes+0x979d>
9eae   e1b5de:	e8 00 00 00 00       	call   e1b5e3 <fix_nodes+0x9eb3>	e1b5df: R_X86_64_PLT32	__stack_chk_fail-0x4
9eb3   e1b5e3:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
9ebd   e1b5ed:	0f 1f 00             	nopl   (%rax)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--Q2pkyq/Ly02OquLo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.1.0-rc7 Kernel Configuration
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
CONFIG_RUST_IS_AVAILABLE=y
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
# CONFIG_KERNEL_GZIP is not set
CONFIG_KERNEL_BZIP2=y
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
# CONFIG_POSIX_MQUEUE is not set
CONFIG_WATCH_QUEUE=y
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
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
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=y
CONFIG_CONTEXT_TRACKING_USER=y
# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
# CONFIG_NO_HZ is not set
CONFIG_HIGH_RES_TIMERS=y
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=100
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_JIT is not set
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
# CONFIG_BPF_PRELOAD is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_PREEMPT_DYNAMIC is not set
CONFIG_SCHED_CORE=y

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=64
CONFIG_RCU_FANOUT_LEAF=16
CONFIG_RCU_NOCB_CPU=y
# CONFIG_RCU_NOCB_CPU_DEFAULT_ALL is not set
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_NUMA_BALANCING=y
# CONFIG_NUMA_BALANCING_DEFAULT_ENABLED is not set
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
# CONFIG_BLK_CGROUP is not set
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
# CONFIG_RT_GROUP_SCHED is not set
# CONFIG_CGROUP_PIDS is not set
# CONFIG_CGROUP_RDMA is not set
CONFIG_CGROUP_FREEZER=y
CONFIG_CPUSETS=y
# CONFIG_PROC_PID_CPUSET is not set
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CGROUP_CPUACCT is not set
CONFIG_CGROUP_PERF=y
# CONFIG_CGROUP_BPF is not set
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_TIME_NS=y
CONFIG_IPC_NS=y
# CONFIG_USER_NS is not set
CONFIG_PID_NS=y
CONFIG_NET_NS=y
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
# CONFIG_RD_LZ4 is not set
# CONFIG_RD_ZSTD is not set
# CONFIG_BOOT_CONFIG is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
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
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_GUEST_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
CONFIG_DEBUG_PERF_USE_VMALLOC=y
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
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
CONFIG_GENERIC_CSUM=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_NR_GPIO=1024
CONFIG_ARCH_SUSPEND_POSSIBLE=y
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
CONFIG_X86_CPU_RESCTRL=y
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_NUMACHIP is not set
# CONFIG_X86_VSMP is not set
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
# CONFIG_PARAVIRT_SPINLOCKS is not set
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
CONFIG_PVH=y
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
CONFIG_ACRN_GUEST=y
CONFIG_INTEL_TDX_GUEST=y
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
# CONFIG_GART_IOMMU is not set
CONFIG_BOOT_VESA_SUPPORT=y
# CONFIG_MAXSMP is not set
CONFIG_NR_CPUS_RANGE_BEGIN=2
CONFIG_NR_CPUS_RANGE_END=512
CONFIG_NR_CPUS_DEFAULT=64
CONFIG_NR_CPUS=64
# CONFIG_SCHED_CLUSTER is not set
CONFIG_SCHED_SMT=y
# CONFIG_SCHED_MC is not set
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
# CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
CONFIG_X86_MCE_INTEL=y
# CONFIG_X86_MCE_AMD is not set
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=y

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_PERF_EVENTS_INTEL_RAPL=y
CONFIG_PERF_EVENTS_INTEL_CSTATE=y
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# CONFIG_PERF_EVENTS_AMD_UNCORE is not set
# CONFIG_PERF_EVENTS_AMD_BRS is not set
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
# CONFIG_MICROCODE_AMD is not set
# CONFIG_MICROCODE_LATE_LOADING is not set
CONFIG_X86_MSR=y
# CONFIG_X86_CPUID is not set
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_X86_MEM_ENCRYPT=y
# CONFIG_AMD_MEM_ENCRYPT is not set
CONFIG_NUMA=y
# CONFIG_AMD_NUMA is not set
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NUMA_EMU=y
CONFIG_NODES_SHIFT=6
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_PMEM_LEGACY_DEVICE=y
CONFIG_X86_PMEM_LEGACY=y
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_MTRR=y
# CONFIG_MTRR_SANITIZER is not set
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
# CONFIG_X86_KERNEL_IBT is not set
# CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_X86_SGX is not set
# CONFIG_EFI is not set
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
CONFIG_SCHED_HRTICK=y
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
CONFIG_DEBUG_HOTPLUG_CPU0=y
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
CONFIG_HAVE_LIVEPATCH=y
# end of Processor type and features

CONFIG_SPECULATION_MITIGATIONS=y
# CONFIG_PAGE_TABLE_ISOLATION is not set
CONFIG_RETPOLINE=y
CONFIG_CPU_IBPB_ENTRY=y
CONFIG_CPU_IBRS_ENTRY=y
CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
# CONFIG_HIBERNATION is not set
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
CONFIG_PM_AUTOSLEEP=y
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
CONFIG_PM_WAKELOCKS=y
CONFIG_PM_WAKELOCKS_LIMIT=100
CONFIG_PM_WAKELOCKS_GC=y
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_CLK=y
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
CONFIG_ACPI_TABLE_LIB=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
# CONFIG_ACPI_EC_DEBUGFS is not set
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_FAN=y
# CONFIG_ACPI_TAD is not set
# CONFIG_ACPI_DOCK is not set
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_HOTPLUG_CPU=y
# CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
CONFIG_ACPI_THERMAL=y
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
# CONFIG_ACPI_PCI_SLOT is not set
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
# CONFIG_ACPI_SBS is not set
# CONFIG_ACPI_HED is not set
# CONFIG_ACPI_CUSTOM_METHOD is not set
# CONFIG_ACPI_NFIT is not set
CONFIG_ACPI_NUMA=y
# CONFIG_ACPI_HMAT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
# CONFIG_ACPI_DPTF is not set
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_PFRUT is not set
# CONFIG_PMIC_OPREGION is not set
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
# CONFIG_CPU_FREQ_STAT is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
# CONFIG_X86_INTEL_PSTATE is not set
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_AMD_PSTATE is not set
# CONFIG_X86_AMD_PSTATE_UT is not set
# CONFIG_X86_ACPI_CPUFREQ is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_P4_CLOCKMOD=y

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=y
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
# CONFIG_CPU_IDLE_GOV_MENU is not set
# CONFIG_CPU_IDLE_GOV_TEO is not set
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

# CONFIG_INTEL_IDLE is not set
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_MMCONF_FAM10H=y
CONFIG_ISA_DMA_API=y
CONFIG_AMD_NB=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
# CONFIG_IA32_EMULATION is not set
# end of Binary Emulations

CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_PFNCACHE=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_DIRTY_RING=y
CONFIG_HAVE_KVM_DIRTY_RING_TSO=y
CONFIG_HAVE_KVM_DIRTY_RING_ACQ_REL=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_KVM_XFER_TO_GUEST_WORK=y
CONFIG_HAVE_KVM_PM_NOTIFIER=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=y
CONFIG_KVM_INTEL=y
# CONFIG_KVM_AMD is not set
CONFIG_KVM_XEN=y
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
# CONFIG_JUMP_LABEL is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
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
CONFIG_HAVE_RUST=y
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
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_ARCH_SUPPORTS_CFI_CLANG=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_CONTEXT_TRACKING_USER_OFFSTACK=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_OBJTOOL=y
CONFIG_HAVE_JUMP_LABEL_HACK=y
CONFIG_HAVE_NOINSTR_HACK=y
CONFIG_HAVE_NOINSTR_VALIDATION=y
CONFIG_HAVE_UACCESS_VALIDATION=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
# CONFIG_VMAP_STACK is not set
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_ARCH_HAS_CC_PLATFORM=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y
CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y

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
CONFIG_MODULES=y
# CONFIG_MODULE_FORCE_LOAD is not set
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=y
CONFIG_BLK_DEV_ZONED=y
# CONFIG_BLK_WBT is not set
# CONFIG_BLK_DEBUG_FS is not set
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
CONFIG_ACORN_PARTITION=y
CONFIG_ACORN_PARTITION_CUMANA=y
CONFIG_ACORN_PARTITION_EESOX=y
CONFIG_ACORN_PARTITION_ICS=y
CONFIG_ACORN_PARTITION_ADFS=y
# CONFIG_ACORN_PARTITION_POWERTEC is not set
CONFIG_ACORN_PARTITION_RISCIX=y
CONFIG_AIX_PARTITION=y
# CONFIG_OSF_PARTITION is not set
CONFIG_AMIGA_PARTITION=y
CONFIG_ATARI_PARTITION=y
# CONFIG_MAC_PARTITION is not set
# CONFIG_MSDOS_PARTITION is not set
CONFIG_LDM_PARTITION=y
CONFIG_LDM_DEBUG=y
# CONFIG_SGI_PARTITION is not set
# CONFIG_ULTRIX_PARTITION is not set
CONFIG_SUN_PARTITION=y
# CONFIG_KARMA_PARTITION is not set
CONFIG_EFI_PARTITION=y
CONFIG_SYSV68_PARTITION=y
CONFIG_CMDLINE_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
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
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_ZPOOL=y
CONFIG_SWAP=y
CONFIG_ZSWAP=y
CONFIG_ZSWAP_DEFAULT_ON=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD=y
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="zstd"
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC=y
CONFIG_ZSWAP_ZPOOL_DEFAULT="zsmalloc"
CONFIG_ZBUD=y
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=y
CONFIG_ZSMALLOC_STAT=y

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_STATS is not set
CONFIG_SLUB_CPU_PARTIAL=y
# end of SLAB allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
# CONFIG_COMPAT_BRK is not set
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
# CONFIG_HWPOISON_INJECT is not set
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_FRONTSWAP=y
# CONFIG_CMA is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
# CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
CONFIG_PAGE_IDLE_FLAG=y
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_GET_FREE_REGION=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_SECRETMEM=y
# CONFIG_ANON_VMA_NAME is not set
CONFIG_USERFAULTFD=y
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
CONFIG_PTE_MARKER=y
CONFIG_PTE_MARKER_UFFD_WP=y
# CONFIG_LRU_GEN is not set

#
# Data Access Monitoring
#
CONFIG_DAMON=y
CONFIG_DAMON_VADDR=y
# CONFIG_DAMON_PADDR is not set
# CONFIG_DAMON_SYSFS is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_TLS is not set
# CONFIG_XFRM_USER is not set
# CONFIG_NET_KEY is not set
# CONFIG_XDP_SOCKETS is not set
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE_DEMUX is not set
CONFIG_NET_IP_TUNNEL=y
# CONFIG_SYN_COOKIES is not set
# CONFIG_NET_IPVTI is not set
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_TUNNEL=y
CONFIG_INET_DIAG=y
CONFIG_INET_TCP_DIAG=y
# CONFIG_INET_UDP_DIAG is not set
# CONFIG_INET_RAW_DIAG is not set
# CONFIG_INET_DIAG_DESTROY is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=y
# CONFIG_IPV6_ROUTER_PREF is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
# CONFIG_INET6_AH is not set
# CONFIG_INET6_ESP is not set
# CONFIG_INET6_IPCOMP is not set
# CONFIG_IPV6_MIP6 is not set
# CONFIG_IPV6_VTI is not set
CONFIG_IPV6_SIT=y
# CONFIG_IPV6_SIT_6RD is not set
CONFIG_IPV6_NDISC_NODETYPE=y
# CONFIG_IPV6_TUNNEL is not set
# CONFIG_IPV6_MULTIPLE_TABLES is not set
# CONFIG_IPV6_MROUTE is not set
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
# CONFIG_NETLABEL is not set
# CONFIG_MPTCP is not set
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
# CONFIG_BRIDGE is not set
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_6LOWPAN is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
# CONFIG_MPLS is not set
# CONFIG_NET_NSH is not set
# CONFIG_HSR is not set
# CONFIG_NET_SWITCHDEV is not set
# CONFIG_NET_L3_MASTER_DEV is not set
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_NET_DROP_MONITOR is not set
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
# CONFIG_MCTP is not set
CONFIG_WIRELESS=y
# CONFIG_CFG80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_RFKILL is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set
# CONFIG_PSAMPLE is not set
# CONFIG_NET_IFE is not set
# CONFIG_LWTUNNEL is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=m
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
# CONFIG_PCIEAER is not set
CONFIG_PCIEASPM=y
# CONFIG_PCIEASPM_DEFAULT is not set
# CONFIG_PCIEASPM_POWERSAVE is not set
CONFIG_PCIEASPM_POWER_SUPERSAVE=y
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
# CONFIG_PCIE_PTM is not set
# CONFIG_PCI_MSI is not set
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
# CONFIG_PCI_STUB is not set
# CONFIG_PCI_PF_STUB is not set
CONFIG_PCI_ATS=y
CONFIG_PCI_DOE=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_PCI_LABEL=y
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
CONFIG_HOTPLUG_PCI=y
# CONFIG_HOTPLUG_PCI_ACPI is not set
# CONFIG_HOTPLUG_PCI_CPCI is not set
# CONFIG_HOTPLUG_PCI_SHPC is not set

#
# PCI controller drivers
#

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
CONFIG_PCI_ENDPOINT=y
# CONFIG_PCI_ENDPOINT_CONFIGFS is not set
# CONFIG_PCI_EPF_TEST is not set
CONFIG_PCI_EPF_NTB=y
# CONFIG_PCI_EPF_VNTB is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=y
# end of PCI switch controller drivers

CONFIG_CXL_BUS=y
CONFIG_CXL_PCI=y
# CONFIG_CXL_MEM_RAW_COMMANDS is not set
CONFIG_CXL_ACPI=y
# CONFIG_CXL_PMEM is not set
CONFIG_CXL_MEM=y
CONFIG_CXL_PORT=y
CONFIG_CXL_SUSPEND=y
CONFIG_CXL_REGION=y
CONFIG_PCCARD=y
CONFIG_PCMCIA=y
CONFIG_PCMCIA_LOAD_CIS=y
CONFIG_CARDBUS=y

#
# PC-card bridges
#
CONFIG_YENTA=y
CONFIG_YENTA_O2=y
CONFIG_YENTA_RICOH=y
CONFIG_YENTA_TI=y
CONFIG_YENTA_ENE_TUNE=y
CONFIG_YENTA_TOSHIBA=y
CONFIG_PD6729=y
CONFIG_I82092=y
CONFIG_PCCARD_NONSTATIC=y
CONFIG_RAPIDIO=y
CONFIG_RAPIDIO_TSI721=y
CONFIG_RAPIDIO_DISC_TIMEOUT=30
# CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
# CONFIG_RAPIDIO_DEBUG is not set
CONFIG_RAPIDIO_ENUM_BASIC=y
# CONFIG_RAPIDIO_CHMAN is not set
CONFIG_RAPIDIO_MPORT_CDEV=y

#
# RapidIO Switch drivers
#
CONFIG_RAPIDIO_CPS_XX=y
# CONFIG_RAPIDIO_CPS_GEN2 is not set
CONFIG_RAPIDIO_RXS_GEN3=y
# end of RapidIO Switch drivers

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
# CONFIG_DEVTMPFS_SAFE is not set
CONFIG_STANDALONE=y
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=y
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SCCB=y
CONFIG_REGMAP_I3C=y
CONFIG_REGMAP_SPI_AVMM=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_MHI_BUS=y
CONFIG_MHI_BUS_DEBUG=y
CONFIG_MHI_BUS_PCI_GENERIC=y
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

# CONFIG_CONNECTOR is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=y
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
# CONFIG_DMI_SYSFS is not set
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT is not set
CONFIG_FW_CFG_SYSFS=y
CONFIG_FW_CFG_SYSFS_CMDLINE=y
CONFIG_SYSFB=y
CONFIG_SYSFB_SIMPLEFB=y
CONFIG_CS_DSP=y
# CONFIG_GOOGLE_FIRMWARE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
# CONFIG_GNSS_USB is not set
CONFIG_MTD=y
# CONFIG_MTD_TESTS is not set

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
CONFIG_MTD_CMDLINE_PARTS=y
# CONFIG_MTD_REDBOOT_PARTS is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=y

#
# Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
#
CONFIG_FTL=y
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set
CONFIG_RFD_FTL=y
# CONFIG_SSFDC is not set
# CONFIG_SM_FTL is not set
CONFIG_MTD_OOPS=y
CONFIG_MTD_SWAP=y
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
# CONFIG_MTD_CFI_NOSWAP is not set
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
CONFIG_MTD_CFI_LE_BYTE_SWAP=y
# CONFIG_MTD_CFI_GEOMETRY is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_OTP is not set
CONFIG_MTD_CFI_INTELEXT=y
# CONFIG_MTD_CFI_AMDSTD is not set
CONFIG_MTD_CFI_STAA=y
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
CONFIG_MTD_ROM=y
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
# CONFIG_MTD_PHYSMAP is not set
# CONFIG_MTD_AMD76XROM is not set
# CONFIG_MTD_ICHXROM is not set
# CONFIG_MTD_ESB2ROM is not set
CONFIG_MTD_CK804XROM=y
# CONFIG_MTD_SCB2_FLASH is not set
# CONFIG_MTD_NETtel is not set
# CONFIG_MTD_L440GX is not set
# CONFIG_MTD_INTEL_VR_NOR is not set
CONFIG_MTD_PLATRAM=y
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
CONFIG_MTD_PMC551=y
CONFIG_MTD_PMC551_BUGFIX=y
# CONFIG_MTD_PMC551_DEBUG is not set
# CONFIG_MTD_DATAFLASH is not set
CONFIG_MTD_MCHP23K256=y
CONFIG_MTD_MCHP48L640=y
CONFIG_MTD_SST25L=y
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
CONFIG_MTD_MTDRAM=y
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128
# CONFIG_MTD_BLOCK2MTD is not set

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
CONFIG_MTD_ONENAND=y
CONFIG_MTD_ONENAND_VERIFY_WRITE=y
# CONFIG_MTD_ONENAND_GENERIC is not set
CONFIG_MTD_ONENAND_OTP=y
# CONFIG_MTD_ONENAND_2X_PROGRAM is not set
# CONFIG_MTD_RAW_NAND is not set
CONFIG_MTD_SPI_NAND=y

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
# CONFIG_MTD_NAND_ECC_SW_HAMMING is not set
CONFIG_MTD_NAND_ECC_SW_BCH=y
CONFIG_MTD_NAND_ECC_MXIC=y
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=y
CONFIG_MTD_QINFO_PROBE=y
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_SPI_NOR=y
CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=y
# CONFIG_MTD_SPI_NOR_SWP_DISABLE is not set
# CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE is not set
CONFIG_MTD_SPI_NOR_SWP_KEEP=y
CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
# CONFIG_MTD_UBI_FASTMAP is not set
CONFIG_MTD_UBI_GLUEBI=y
# CONFIG_MTD_UBI_BLOCK is not set
# CONFIG_MTD_HYPERBUS is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
# CONFIG_PARPORT_PC is not set
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=y
CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION=y
CONFIG_BLK_DEV_FD=y
# CONFIG_BLK_DEV_FD_RAWCMD is not set
CONFIG_CDROM=y
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
CONFIG_ZRAM=y
CONFIG_ZRAM_DEF_COMP_LZORLE=y
# CONFIG_ZRAM_DEF_COMP_ZSTD is not set
# CONFIG_ZRAM_DEF_COMP_LZO is not set
# CONFIG_ZRAM_DEF_COMP_842 is not set
CONFIG_ZRAM_DEF_COMP="lzo-rle"
# CONFIG_ZRAM_WRITEBACK is not set
# CONFIG_ZRAM_MEMORY_TRACKING is not set
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
# CONFIG_BLK_DEV_NBD is not set
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=4096
CONFIG_CDROM_PKTCDVD=y
CONFIG_CDROM_PKTCDVD_BUFFERS=8
CONFIG_CDROM_PKTCDVD_WCACHE=y
# CONFIG_ATA_OVER_ETH is not set
# CONFIG_VIRTIO_BLK is not set
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
CONFIG_NVME_CORE=y
CONFIG_BLK_DEV_NVME=y
# CONFIG_NVME_MULTIPATH is not set
# CONFIG_NVME_VERBOSE_ERRORS is not set
# CONFIG_NVME_HWMON is not set
CONFIG_NVME_FABRICS=y
# CONFIG_NVME_FC is not set
# CONFIG_NVME_TCP is not set
# CONFIG_NVME_AUTH is not set
CONFIG_NVME_TARGET=y
CONFIG_NVME_TARGET_PASSTHRU=y
CONFIG_NVME_TARGET_LOOP=y
CONFIG_NVME_TARGET_FC=y
# CONFIG_NVME_TARGET_TCP is not set
# CONFIG_NVME_TARGET_AUTH is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=y
# CONFIG_AD525X_DPOT_SPI is not set
CONFIG_DUMMY_IRQ=y
CONFIG_IBM_ASM=y
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=y
CONFIG_TIFM_7XX1=y
CONFIG_ICS932S401=y
CONFIG_ENCLOSURE_SERVICES=y
CONFIG_HP_ILO=y
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=y
# CONFIG_ISL29020 is not set
CONFIG_SENSORS_TSL2550=y
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=y
CONFIG_HMC6352=y
# CONFIG_DS1682 is not set
CONFIG_VMWARE_BALLOON=y
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
CONFIG_XILINX_SDFEC=y
CONFIG_MISC_RTSX=y
CONFIG_C2PORT=y
# CONFIG_C2PORT_DURAMAR_2150 is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=y
CONFIG_EEPROM_MAX6875=y
# CONFIG_EEPROM_93CX6 is not set
CONFIG_EEPROM_93XX46=y
CONFIG_EEPROM_IDT_89HPESX=y
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=y
CONFIG_CB710_DEBUG=y
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
CONFIG_ALTERA_STAPL=y
CONFIG_INTEL_MEI=y
CONFIG_INTEL_MEI_ME=y
CONFIG_INTEL_MEI_TXE=y
CONFIG_VMWARE_VMCI=y
CONFIG_GENWQE=y
CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=0
# CONFIG_ECHO is not set
CONFIG_MISC_ALCOR_PCI=y
CONFIG_MISC_RTSX_PCI=y
CONFIG_MISC_RTSX_USB=y
CONFIG_HABANA_AI=y
# CONFIG_UACCE is not set
CONFIG_PVPANIC=y
# CONFIG_PVPANIC_MMIO is not set
CONFIG_PVPANIC_PCI=y
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=y
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
# CONFIG_SCSI_PROC_FS is not set

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=y
# CONFIG_CHR_DEV_ST is not set
CONFIG_BLK_DEV_SR=y
# CONFIG_CHR_DEV_SG is not set
CONFIG_BLK_DEV_BSG=y
CONFIG_CHR_DEV_SCH=y
CONFIG_SCSI_ENCLOSURE=y
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=y
# CONFIG_SCSI_FC_ATTRS is not set
# CONFIG_SCSI_ISCSI_ATTRS is not set
CONFIG_SCSI_SAS_ATTRS=y
CONFIG_SCSI_SAS_LIBSAS=y
CONFIG_SCSI_SAS_ATA=y
CONFIG_SCSI_SAS_HOST_SMP=y
# CONFIG_SCSI_SRP_ATTRS is not set
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
CONFIG_ISCSI_BOOT_SYSFS=y
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_BE2ISCSI is not set
CONFIG_BLK_DEV_3W_XXXX_RAID=y
# CONFIG_SCSI_HPSA is not set
CONFIG_SCSI_3W_9XXX=y
CONFIG_SCSI_3W_SAS=y
# CONFIG_SCSI_ACARD is not set
CONFIG_SCSI_AACRAID=y
CONFIG_SCSI_AIC7XXX=y
CONFIG_AIC7XXX_CMDS_PER_DEVICE=32
CONFIG_AIC7XXX_RESET_DELAY_MS=5000
# CONFIG_AIC7XXX_BUILD_FIRMWARE is not set
CONFIG_AIC7XXX_DEBUG_ENABLE=y
CONFIG_AIC7XXX_DEBUG_MASK=0
# CONFIG_AIC7XXX_REG_PRETTY_PRINT is not set
CONFIG_SCSI_AIC79XX=y
CONFIG_AIC79XX_CMDS_PER_DEVICE=32
CONFIG_AIC79XX_RESET_DELAY_MS=5000
# CONFIG_AIC79XX_BUILD_FIRMWARE is not set
# CONFIG_AIC79XX_DEBUG_ENABLE is not set
CONFIG_AIC79XX_DEBUG_MASK=0
CONFIG_AIC79XX_REG_PRETTY_PRINT=y
# CONFIG_SCSI_AIC94XX is not set
CONFIG_SCSI_MVSAS=y
CONFIG_SCSI_MVSAS_DEBUG=y
CONFIG_SCSI_MVSAS_TASKLET=y
CONFIG_SCSI_MVUMI=y
# CONFIG_SCSI_ADVANSYS is not set
CONFIG_SCSI_ARCMSR=y
CONFIG_SCSI_ESAS2R=y
# CONFIG_MEGARAID_NEWGEN is not set
CONFIG_MEGARAID_LEGACY=y
CONFIG_MEGARAID_SAS=y
CONFIG_SCSI_MPT3SAS=y
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
CONFIG_SCSI_MPT2SAS=y
# CONFIG_SCSI_MPI3MR is not set
CONFIG_SCSI_SMARTPQI=y
CONFIG_SCSI_HPTIOP=y
# CONFIG_SCSI_BUSLOGIC is not set
CONFIG_SCSI_MYRB=y
# CONFIG_SCSI_MYRS is not set
CONFIG_VMWARE_PVSCSI=y
# CONFIG_SCSI_SNIC is not set
CONFIG_SCSI_DMX3191D=y
CONFIG_SCSI_FDOMAIN=y
CONFIG_SCSI_FDOMAIN_PCI=y
CONFIG_SCSI_ISCI=y
CONFIG_SCSI_IPS=y
CONFIG_SCSI_INITIO=y
CONFIG_SCSI_INIA100=y
CONFIG_SCSI_STEX=y
CONFIG_SCSI_SYM53C8XX_2=y
CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=1
CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=16
CONFIG_SCSI_SYM53C8XX_MAX_TAGS=64
# CONFIG_SCSI_SYM53C8XX_MMIO is not set
CONFIG_SCSI_IPR=y
CONFIG_SCSI_IPR_TRACE=y
# CONFIG_SCSI_IPR_DUMP is not set
CONFIG_SCSI_QLOGIC_1280=y
# CONFIG_SCSI_QLA_ISCSI is not set
CONFIG_SCSI_DC395x=y
CONFIG_SCSI_AM53C974=y
# CONFIG_SCSI_WD719X is not set
CONFIG_SCSI_DEBUG=y
# CONFIG_SCSI_PMCRAID is not set
CONFIG_SCSI_PM8001=y
# CONFIG_SCSI_VIRTIO is not set
CONFIG_SCSI_LOWLEVEL_PCMCIA=y
# CONFIG_PCMCIA_AHA152X is not set
# CONFIG_PCMCIA_FDOMAIN is not set
# CONFIG_PCMCIA_QLOGIC is not set
# CONFIG_PCMCIA_SYM53C500 is not set
# CONFIG_SCSI_DH is not set
# end of SCSI device support

CONFIG_ATA=y
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=y
CONFIG_SATA_MOBILE_LPM_POLICY=0
CONFIG_SATA_AHCI_PLATFORM=y
# CONFIG_AHCI_DWC is not set
CONFIG_SATA_INIC162X=y
CONFIG_SATA_ACARD_AHCI=y
# CONFIG_SATA_SIL24 is not set
# CONFIG_ATA_SFF is not set
# CONFIG_MD is not set
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y
CONFIG_FIREWIRE_OHCI=y
CONFIG_FIREWIRE_SBP2=y
# CONFIG_FIREWIRE_NET is not set
CONFIG_FIREWIRE_NOSY=y
# end of IEEE 1394 (FireWire) support

# CONFIG_MACINTOSH_DRIVERS is not set
CONFIG_NETDEVICES=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_MACSEC is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_RIONET is not set
# CONFIG_TUN is not set
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_MHI_NET is not set
# CONFIG_ARCNET is not set
CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_PCMCIA_3C574 is not set
# CONFIG_PCMCIA_3C589 is not set
# CONFIG_VORTEX is not set
# CONFIG_TYPHOON is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
# CONFIG_SPI_AX88796C is not set
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
# CONFIG_CAVIUM_PTP is not set
# CONFIG_LIQUIDIO is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DM9051 is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_FUJITSU=y
# CONFIG_PCMCIA_FMVJ18X is not set
CONFIG_NET_VENDOR_FUNGIBLE=y
CONFIG_NET_VENDOR_GOOGLE=y
CONFIG_NET_VENDOR_HUAWEI=y
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
# CONFIG_E1000E is not set
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
# CONFIG_IXGBE is not set
# CONFIG_I40E is not set
# CONFIG_IGC is not set
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_ADI=y
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_OCTEON_EP is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8851 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_ENC28J60 is not set
# CONFIG_ENCX24J600 is not set
# CONFIG_LAN743X is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_NET_VENDOR_8390=y
# CONFIG_PCMCIA_AXNET is not set
# CONFIG_NE2K_PCI is not set
# CONFIG_PCMCIA_PCNET is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_R8169 is not set
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
# CONFIG_SFC_SIENA is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_PCMCIA_SMC91C92 is not set
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
# CONFIG_MSE102X is not set
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
CONFIG_NET_VENDOR_XIRCOM=y
# CONFIG_PCMCIA_XIRC2PS is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
# CONFIG_PHYLIB is not set
# CONFIG_MICREL_KS8995MA is not set
# CONFIG_PSE_CONTROLLER is not set
# CONFIG_MDIO_DEVICE is not set

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
CONFIG_USB_NET_DRIVERS=y
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
# CONFIG_USB_RTL8152 is not set
# CONFIG_USB_LAN78XX is not set
# CONFIG_USB_USBNET is not set
# CONFIG_USB_IPHETH is not set
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K_PCI is not set
CONFIG_WLAN_VENDOR_ATMEL=y
CONFIG_WLAN_VENDOR_BROADCOM=y
CONFIG_WLAN_VENDOR_CISCO=y
CONFIG_WLAN_VENDOR_INTEL=y
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
CONFIG_WLAN_VENDOR_MARVELL=y
CONFIG_WLAN_VENDOR_MEDIATEK=y
CONFIG_WLAN_VENDOR_MICROCHIP=y
CONFIG_WLAN_VENDOR_PURELIFI=y
CONFIG_WLAN_VENDOR_RALINK=y
CONFIG_WLAN_VENDOR_REALTEK=y
CONFIG_WLAN_VENDOR_RSI=y
CONFIG_WLAN_VENDOR_SILABS=y
CONFIG_WLAN_VENDOR_ST=y
CONFIG_WLAN_VENDOR_TI=y
CONFIG_WLAN_VENDOR_ZYDAS=y
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_PCMCIA_RAYCS is not set
# CONFIG_WAN is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=y
# CONFIG_INPUT_SPARSEKMAP is not set
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_EVDEV is not set
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADC is not set
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_PINEPHONE is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_TWL4030 is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_MTK_PMIC is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
# CONFIG_INPUT_MOUSE is not set
CONFIG_INPUT_JOYSTICK=y
# CONFIG_JOYSTICK_ANALOG is not set
# CONFIG_JOYSTICK_A3D is not set
# CONFIG_JOYSTICK_ADC is not set
# CONFIG_JOYSTICK_ADI is not set
# CONFIG_JOYSTICK_COBRA is not set
CONFIG_JOYSTICK_GF2K=y
# CONFIG_JOYSTICK_GRIP is not set
CONFIG_JOYSTICK_GRIP_MP=y
CONFIG_JOYSTICK_GUILLEMOT=y
# CONFIG_JOYSTICK_INTERACT is not set
CONFIG_JOYSTICK_SIDEWINDER=y
CONFIG_JOYSTICK_TMDC=y
CONFIG_JOYSTICK_IFORCE=y
# CONFIG_JOYSTICK_IFORCE_USB is not set
CONFIG_JOYSTICK_IFORCE_232=y
# CONFIG_JOYSTICK_WARRIOR is not set
# CONFIG_JOYSTICK_MAGELLAN is not set
# CONFIG_JOYSTICK_SPACEORB is not set
CONFIG_JOYSTICK_SPACEBALL=y
CONFIG_JOYSTICK_STINGER=y
CONFIG_JOYSTICK_TWIDJOY=y
# CONFIG_JOYSTICK_ZHENHUA is not set
CONFIG_JOYSTICK_DB9=y
CONFIG_JOYSTICK_GAMECON=y
# CONFIG_JOYSTICK_TURBOGRAFX is not set
CONFIG_JOYSTICK_AS5011=y
CONFIG_JOYSTICK_JOYDUMP=y
CONFIG_JOYSTICK_XPAD=y
CONFIG_JOYSTICK_XPAD_FF=y
CONFIG_JOYSTICK_XPAD_LEDS=y
CONFIG_JOYSTICK_WALKERA0701=y
# CONFIG_JOYSTICK_PSXPAD_SPI is not set
CONFIG_JOYSTICK_PXRC=y
CONFIG_JOYSTICK_QWIIC=y
# CONFIG_JOYSTICK_FSIA6B is not set
# CONFIG_JOYSTICK_SENSEHAT is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
CONFIG_INPUT_MISC=y
# CONFIG_INPUT_88PM860X_ONKEY is not set
CONFIG_INPUT_88PM80X_ONKEY=y
CONFIG_INPUT_AD714X=y
# CONFIG_INPUT_AD714X_I2C is not set
# CONFIG_INPUT_AD714X_SPI is not set
CONFIG_INPUT_ARIZONA_HAPTICS=y
CONFIG_INPUT_ATC260X_ONKEY=y
CONFIG_INPUT_BMA150=y
CONFIG_INPUT_E3X0_BUTTON=y
# CONFIG_INPUT_PCSPKR is not set
# CONFIG_INPUT_MMA8450 is not set
CONFIG_INPUT_APANEL=y
# CONFIG_INPUT_GPIO_BEEPER is not set
# CONFIG_INPUT_GPIO_DECODER is not set
CONFIG_INPUT_GPIO_VIBRA=y
# CONFIG_INPUT_ATLAS_BTNS is not set
CONFIG_INPUT_ATI_REMOTE2=y
CONFIG_INPUT_KEYSPAN_REMOTE=y
CONFIG_INPUT_KXTJ9=y
# CONFIG_INPUT_POWERMATE is not set
CONFIG_INPUT_YEALINK=y
# CONFIG_INPUT_CM109 is not set
CONFIG_INPUT_REGULATOR_HAPTIC=y
# CONFIG_INPUT_RETU_PWRBUTTON is not set
# CONFIG_INPUT_AXP20X_PEK is not set
CONFIG_INPUT_TWL4030_PWRBUTTON=y
CONFIG_INPUT_TWL4030_VIBRA=y
CONFIG_INPUT_UINPUT=y
CONFIG_INPUT_PALMAS_PWRBUTTON=y
# CONFIG_INPUT_PCF8574 is not set
CONFIG_INPUT_GPIO_ROTARY_ENCODER=y
# CONFIG_INPUT_DA7280_HAPTICS is not set
# CONFIG_INPUT_DA9055_ONKEY is not set
CONFIG_INPUT_DA9063_ONKEY=y
CONFIG_INPUT_WM831X_ON=y
CONFIG_INPUT_PCAP=y
# CONFIG_INPUT_ADXL34X is not set
# CONFIG_INPUT_IBM_PANEL is not set
CONFIG_INPUT_IMS_PCU=y
CONFIG_INPUT_IQS269A=y
CONFIG_INPUT_IQS626A=y
# CONFIG_INPUT_IQS7222 is not set
CONFIG_INPUT_CMA3000=y
CONFIG_INPUT_CMA3000_I2C=y
# CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
# CONFIG_INPUT_DRV260X_HAPTICS is not set
# CONFIG_INPUT_DRV2665_HAPTICS is not set
CONFIG_INPUT_DRV2667_HAPTICS=y
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
CONFIG_RMI4_SPI=y
CONFIG_RMI4_SMB=y
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
CONFIG_RMI4_F3A=y
# CONFIG_RMI4_F54 is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_CT82C710=y
CONFIG_SERIO_PARKBD=y
CONFIG_SERIO_PCIPS2=y
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
# CONFIG_SERIO_ALTERA_PS2 is not set
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
CONFIG_SERIO_GPIO_PS2=y
CONFIG_USERIO=y
CONFIG_GAMEPORT=y
# CONFIG_GAMEPORT_NS558 is not set
CONFIG_GAMEPORT_L4=y
CONFIG_GAMEPORT_EMU10K1=y
# CONFIG_GAMEPORT_FM801 is not set
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
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
CONFIG_SERIAL_8250_FINTEK=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCI=y
# CONFIG_SERIAL_8250_EXAR is not set
CONFIG_SERIAL_8250_CS=y
CONFIG_SERIAL_8250_MEN_MCB=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
CONFIG_SERIAL_UARTLITE=y
CONFIG_SERIAL_UARTLITE_CONSOLE=y
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_JSM=y
CONFIG_SERIAL_LANTIQ=y
CONFIG_SERIAL_LANTIQ_CONSOLE=y
CONFIG_SERIAL_SCCNXP=y
# CONFIG_SERIAL_SCCNXP_CONSOLE is not set
CONFIG_SERIAL_SC16IS7XX_CORE=y
CONFIG_SERIAL_SC16IS7XX=y
CONFIG_SERIAL_SC16IS7XX_I2C=y
# CONFIG_SERIAL_SC16IS7XX_SPI is not set
CONFIG_SERIAL_ALTERA_JTAGUART=y
# CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
# CONFIG_SERIAL_ALTERA_UART is not set
CONFIG_SERIAL_ARC=y
# CONFIG_SERIAL_ARC_CONSOLE is not set
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
CONFIG_SERIAL_FSL_LPUART=y
CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
CONFIG_SERIAL_FSL_LINFLEXUART=y
# CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE is not set
# CONFIG_SERIAL_MEN_Z135 is not set
CONFIG_SERIAL_SPRD=y
CONFIG_SERIAL_SPRD_CONSOLE=y
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
CONFIG_MOXA_INTELLIO=y
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK_GT=y
# CONFIG_N_HDLC is not set
CONFIG_GOLDFISH_TTY=y
CONFIG_GOLDFISH_TTY_EARLY_CONSOLE=y
# CONFIG_N_GSM is not set
# CONFIG_NOZOMI is not set
CONFIG_NULL_TTY=y
CONFIG_HVC_DRIVER=y
CONFIG_RPMSG_TTY=y
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_PRINTER is not set
# CONFIG_PPDEV is not set
CONFIG_VIRTIO_CONSOLE=y
# CONFIG_IPMI_HANDLER is not set
CONFIG_IPMB_DEVICE_INTERFACE=y
CONFIG_HW_RANDOM=y
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
CONFIG_HW_RANDOM_INTEL=y
# CONFIG_HW_RANDOM_AMD is not set
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_VIA=y
CONFIG_HW_RANDOM_VIRTIO=y
CONFIG_HW_RANDOM_XIPHERA=y
# CONFIG_APPLICOM is not set

#
# PCMCIA character devices
#
# CONFIG_SYNCLINK_CS is not set
# CONFIG_CARDMAN_4000 is not set
# CONFIG_CARDMAN_4040 is not set
CONFIG_SCR24X=y
# CONFIG_IPWIRELESS is not set
# end of PCMCIA character devices

CONFIG_MWAVE=y
# CONFIG_DEVMEM is not set
# CONFIG_NVRAM is not set
CONFIG_DEVPORT=y
# CONFIG_HPET is not set
CONFIG_HANGCHECK_TIMER=y
CONFIG_TCG_TPM=y
# CONFIG_HW_RANDOM_TPM is not set
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
CONFIG_TCG_TIS_SPI=y
CONFIG_TCG_TIS_SPI_CR50=y
# CONFIG_TCG_TIS_I2C is not set
CONFIG_TCG_TIS_I2C_CR50=y
CONFIG_TCG_TIS_I2C_ATMEL=y
CONFIG_TCG_TIS_I2C_INFINEON=y
CONFIG_TCG_TIS_I2C_NUVOTON=y
CONFIG_TCG_NSC=y
# CONFIG_TCG_ATMEL is not set
# CONFIG_TCG_INFINEON is not set
# CONFIG_TCG_CRB is not set
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=y
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
CONFIG_TCG_TIS_ST33ZP24_SPI=y
CONFIG_TELCLOCK=y
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYBUS=y
CONFIG_XILLYUSB=y
# CONFIG_RANDOM_TRUST_CPU is not set
CONFIG_RANDOM_TRUST_BOOTLOADER=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
CONFIG_I2C_MUX_LTC4306=y
CONFIG_I2C_MUX_PCA9541=y
CONFIG_I2C_MUX_PCA954x=y
CONFIG_I2C_MUX_REG=y
CONFIG_I2C_MUX_MLXCPLD=y
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=y

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_CCGX_UCSI=y
# CONFIG_I2C_ALI1535 is not set
CONFIG_I2C_ALI1563=y
CONFIG_I2C_ALI15X3=y
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=y
CONFIG_I2C_ISCH=y
CONFIG_I2C_ISMT=y
# CONFIG_I2C_PIIX4 is not set
CONFIG_I2C_NFORCE2=y
CONFIG_I2C_NFORCE2_S4985=y
# CONFIG_I2C_NVIDIA_GPU is not set
CONFIG_I2C_SIS5595=y
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
CONFIG_I2C_VIA=y
CONFIG_I2C_VIAPRO=y

#
# ACPI drivers
#
# CONFIG_I2C_SCMI is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_CBUS_GPIO=y
CONFIG_I2C_DESIGNWARE_CORE=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DESIGNWARE_AMDPSP is not set
# CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
CONFIG_I2C_DESIGNWARE_PCI=y
CONFIG_I2C_EMEV2=y
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=y
CONFIG_I2C_SIMTEC=y
CONFIG_I2C_XILINX=y

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
CONFIG_I2C_DLN2=y
CONFIG_I2C_CP2615=y
CONFIG_I2C_PARPORT=y
# CONFIG_I2C_PCI1XXXX is not set
CONFIG_I2C_ROBOTFUZZ_OSIF=y
CONFIG_I2C_TAOS_EVM=y
CONFIG_I2C_TINY_USB=y
# CONFIG_I2C_VIPERBOARD is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=y
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

# CONFIG_I2C_STUB is not set
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
CONFIG_I2C_SLAVE_TESTUNIT=y
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=y
# CONFIG_CDNS_I3C_MASTER is not set
# CONFIG_DW_I3C_MASTER is not set
CONFIG_SVC_I3C_MASTER=y
# CONFIG_MIPI_I3C_HCI is not set
CONFIG_SPI=y
CONFIG_SPI_DEBUG=y
CONFIG_SPI_MASTER=y
CONFIG_SPI_MEM=y

#
# SPI Master Controller Drivers
#
CONFIG_SPI_ALTERA=y
CONFIG_SPI_ALTERA_CORE=y
CONFIG_SPI_AXI_SPI_ENGINE=y
CONFIG_SPI_BITBANG=y
CONFIG_SPI_BUTTERFLY=y
# CONFIG_SPI_CADENCE is not set
CONFIG_SPI_DESIGNWARE=y
# CONFIG_SPI_DW_DMA is not set
CONFIG_SPI_DW_PCI=y
# CONFIG_SPI_DW_MMIO is not set
CONFIG_SPI_DLN2=y
CONFIG_SPI_NXP_FLEXSPI=y
CONFIG_SPI_GPIO=y
# CONFIG_SPI_INTEL_PCI is not set
# CONFIG_SPI_INTEL_PLATFORM is not set
CONFIG_SPI_LM70_LLP=y
# CONFIG_SPI_MICROCHIP_CORE is not set
# CONFIG_SPI_MICROCHIP_CORE_QSPI is not set
# CONFIG_SPI_LANTIQ_SSC is not set
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PXA2XX is not set
CONFIG_SPI_ROCKCHIP=y
# CONFIG_SPI_SC18IS602 is not set
CONFIG_SPI_SIFIVE=y
CONFIG_SPI_MXIC=y
CONFIG_SPI_XCOMM=y
CONFIG_SPI_XILINX=y
# CONFIG_SPI_ZYNQMP_GQSPI is not set
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
CONFIG_SPI_MUX=y

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_LOOPBACK_TEST is not set
CONFIG_SPI_TLE62X0=y
# CONFIG_SPI_SLAVE is not set
CONFIG_SPI_DYNAMIC=y
CONFIG_SPMI=y
# CONFIG_SPMI_HISI3670 is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=y
CONFIG_PPS_CLIENT_LDISC=y
# CONFIG_PPS_CLIENT_PARPORT is not set
CONFIG_PPS_CLIENT_GPIO=y

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
CONFIG_PTP_1588_CLOCK_KVM=y
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# CONFIG_PTP_1588_CLOCK_OCP is not set
# end of PTP clock support

# CONFIG_PINCTRL is not set
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_CDEV=y
# CONFIG_GPIO_CDEV_V1 is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
CONFIG_GPIO_DWAPB=y
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_ICH=y
CONFIG_GPIO_MB86S7X=y
CONFIG_GPIO_MENZ127=y
CONFIG_GPIO_VX855=y
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_F7188X is not set
CONFIG_GPIO_IT87=y
# CONFIG_GPIO_SCH is not set
# CONFIG_GPIO_SCH311X is not set
# CONFIG_GPIO_WINBOND is not set
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_MAX7300=y
# CONFIG_GPIO_MAX732X is not set
CONFIG_GPIO_PCA953X=y
CONFIG_GPIO_PCA953X_IRQ=y
CONFIG_GPIO_PCA9570=y
# CONFIG_GPIO_PCF857X is not set
CONFIG_GPIO_TPIC2810=y
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# CONFIG_GPIO_ARIZONA is not set
# CONFIG_GPIO_DA9055 is not set
CONFIG_GPIO_DLN2=y
CONFIG_GPIO_LP873X=y
CONFIG_GPIO_PALMAS=y
CONFIG_GPIO_RC5T583=y
CONFIG_GPIO_TPS65086=y
# CONFIG_GPIO_TPS65910 is not set
CONFIG_GPIO_TQMX86=y
CONFIG_GPIO_TWL4030=y
CONFIG_GPIO_UCB1400=y
CONFIG_GPIO_WM831X=y
CONFIG_GPIO_WM8350=y
CONFIG_GPIO_WM8994=y
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
CONFIG_GPIO_BT8XX=y
CONFIG_GPIO_ML_IOH=y
CONFIG_GPIO_PCI_IDIO_16=y
# CONFIG_GPIO_PCIE_IDIO_24 is not set
CONFIG_GPIO_RDC321X=y
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
CONFIG_GPIO_MAX3191X=y
CONFIG_GPIO_MAX7301=y
# CONFIG_GPIO_MC33880 is not set
CONFIG_GPIO_PISOSR=y
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
# CONFIG_GPIO_VIPERBOARD is not set
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
CONFIG_GPIO_MOCKUP=y
# CONFIG_GPIO_VIRTIO is not set
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

CONFIG_W1=y

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
# CONFIG_W1_MASTER_DS2490 is not set
# CONFIG_W1_MASTER_DS2482 is not set
# CONFIG_W1_MASTER_DS1WM is not set
CONFIG_W1_MASTER_GPIO=y
# CONFIG_W1_MASTER_SGI is not set
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
CONFIG_W1_SLAVE_SMEM=y
CONFIG_W1_SLAVE_DS2405=y
# CONFIG_W1_SLAVE_DS2408 is not set
# CONFIG_W1_SLAVE_DS2413 is not set
CONFIG_W1_SLAVE_DS2406=y
# CONFIG_W1_SLAVE_DS2423 is not set
CONFIG_W1_SLAVE_DS2805=y
CONFIG_W1_SLAVE_DS2430=y
CONFIG_W1_SLAVE_DS2431=y
CONFIG_W1_SLAVE_DS2433=y
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2438=y
CONFIG_W1_SLAVE_DS250X=y
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
CONFIG_W1_SLAVE_DS28E17=y
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
CONFIG_PDA_POWER=y
CONFIG_GENERIC_ADC_BATTERY=y
# CONFIG_IP5XXX_POWER is not set
CONFIG_WM831X_BACKUP=y
CONFIG_WM831X_POWER=y
CONFIG_WM8350_POWER=y
# CONFIG_TEST_POWER is not set
CONFIG_BATTERY_88PM860X=y
CONFIG_CHARGER_ADP5061=y
CONFIG_BATTERY_CW2015=y
# CONFIG_BATTERY_DS2760 is not set
CONFIG_BATTERY_DS2780=y
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
CONFIG_BATTERY_SBS=y
CONFIG_CHARGER_SBS=y
CONFIG_MANAGER_SBS=y
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=y
CONFIG_BATTERY_BQ27XXX_HDQ=y
# CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM is not set
CONFIG_BATTERY_DA9030=y
CONFIG_BATTERY_DA9150=y
# CONFIG_CHARGER_AXP20X is not set
# CONFIG_BATTERY_AXP20X is not set
# CONFIG_AXP20X_POWER is not set
# CONFIG_AXP288_FUEL_GAUGE is not set
CONFIG_BATTERY_MAX17040=y
CONFIG_BATTERY_MAX17042=y
CONFIG_BATTERY_MAX1721X=y
CONFIG_BATTERY_TWL4030_MADC=y
CONFIG_CHARGER_88PM860X=y
CONFIG_BATTERY_RX51=y
# CONFIG_CHARGER_ISP1704 is not set
CONFIG_CHARGER_MAX8903=y
# CONFIG_CHARGER_TWL4030 is not set
# CONFIG_CHARGER_LP8727 is not set
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=y
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_LTC4162L is not set
CONFIG_CHARGER_MAX14577=y
# CONFIG_CHARGER_MAX77693 is not set
# CONFIG_CHARGER_MAX77976 is not set
CONFIG_CHARGER_BQ2415X=y
# CONFIG_CHARGER_BQ24190 is not set
# CONFIG_CHARGER_BQ24257 is not set
CONFIG_CHARGER_BQ24735=y
CONFIG_CHARGER_BQ2515X=y
CONFIG_CHARGER_BQ25890=y
# CONFIG_CHARGER_BQ25980 is not set
# CONFIG_CHARGER_BQ256XX is not set
CONFIG_CHARGER_SMB347=y
# CONFIG_CHARGER_TPS65090 is not set
CONFIG_BATTERY_GAUGE_LTC2941=y
# CONFIG_BATTERY_GOLDFISH is not set
CONFIG_BATTERY_RT5033=y
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
# CONFIG_SENSORS_ABITUGURU is not set
CONFIG_SENSORS_ABITUGURU3=y
CONFIG_SENSORS_AD7314=y
CONFIG_SENSORS_AD7414=y
CONFIG_SENSORS_AD7418=y
CONFIG_SENSORS_ADM1021=y
CONFIG_SENSORS_ADM1025=y
CONFIG_SENSORS_ADM1026=y
CONFIG_SENSORS_ADM1029=y
CONFIG_SENSORS_ADM1031=y
CONFIG_SENSORS_ADM1177=y
# CONFIG_SENSORS_ADM9240 is not set
CONFIG_SENSORS_ADT7X10=y
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=y
CONFIG_SENSORS_ADT7411=y
CONFIG_SENSORS_ADT7462=y
CONFIG_SENSORS_ADT7470=y
# CONFIG_SENSORS_ADT7475 is not set
CONFIG_SENSORS_AHT10=y
CONFIG_SENSORS_AQUACOMPUTER_D5NEXT=y
CONFIG_SENSORS_AS370=y
CONFIG_SENSORS_ASC7621=y
CONFIG_SENSORS_AXI_FAN_CONTROL=y
CONFIG_SENSORS_K8TEMP=y
CONFIG_SENSORS_K10TEMP=y
CONFIG_SENSORS_FAM15H_POWER=y
# CONFIG_SENSORS_APPLESMC is not set
# CONFIG_SENSORS_ASB100 is not set
# CONFIG_SENSORS_ATXP1 is not set
CONFIG_SENSORS_CORSAIR_CPRO=y
CONFIG_SENSORS_CORSAIR_PSU=y
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DS620=y
# CONFIG_SENSORS_DS1621 is not set
CONFIG_SENSORS_DELL_SMM=y
CONFIG_I8K=y
CONFIG_SENSORS_DA9055=y
CONFIG_SENSORS_I5K_AMB=y
# CONFIG_SENSORS_F71805F is not set
CONFIG_SENSORS_F71882FG=y
# CONFIG_SENSORS_F75375S is not set
CONFIG_SENSORS_FSCHMD=y
CONFIG_SENSORS_GL518SM=y
# CONFIG_SENSORS_GL520SM is not set
CONFIG_SENSORS_G760A=y
CONFIG_SENSORS_G762=y
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IIO_HWMON=y
CONFIG_SENSORS_I5500=y
# CONFIG_SENSORS_CORETEMP is not set
CONFIG_SENSORS_IT87=y
CONFIG_SENSORS_JC42=y
CONFIG_SENSORS_POWR1220=y
# CONFIG_SENSORS_LINEAGE is not set
# CONFIG_SENSORS_LTC2945 is not set
CONFIG_SENSORS_LTC2947=y
# CONFIG_SENSORS_LTC2947_I2C is not set
CONFIG_SENSORS_LTC2947_SPI=y
CONFIG_SENSORS_LTC2990=y
# CONFIG_SENSORS_LTC2992 is not set
# CONFIG_SENSORS_LTC4151 is not set
# CONFIG_SENSORS_LTC4215 is not set
CONFIG_SENSORS_LTC4222=y
CONFIG_SENSORS_LTC4245=y
CONFIG_SENSORS_LTC4260=y
CONFIG_SENSORS_LTC4261=y
# CONFIG_SENSORS_MAX1111 is not set
CONFIG_SENSORS_MAX127=y
CONFIG_SENSORS_MAX16065=y
CONFIG_SENSORS_MAX1619=y
CONFIG_SENSORS_MAX1668=y
CONFIG_SENSORS_MAX197=y
CONFIG_SENSORS_MAX31722=y
CONFIG_SENSORS_MAX31730=y
# CONFIG_SENSORS_MAX31760 is not set
CONFIG_SENSORS_MAX6620=y
CONFIG_SENSORS_MAX6621=y
# CONFIG_SENSORS_MAX6639 is not set
CONFIG_SENSORS_MAX6642=y
# CONFIG_SENSORS_MAX6650 is not set
CONFIG_SENSORS_MAX6697=y
CONFIG_SENSORS_MAX31790=y
CONFIG_SENSORS_MCP3021=y
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_TPS23861 is not set
CONFIG_SENSORS_MENF21BMC_HWMON=y
CONFIG_SENSORS_MR75203=y
CONFIG_SENSORS_ADCXX=y
# CONFIG_SENSORS_LM63 is not set
CONFIG_SENSORS_LM70=y
CONFIG_SENSORS_LM73=y
CONFIG_SENSORS_LM75=y
# CONFIG_SENSORS_LM77 is not set
# CONFIG_SENSORS_LM78 is not set
# CONFIG_SENSORS_LM80 is not set
CONFIG_SENSORS_LM83=y
CONFIG_SENSORS_LM85=y
# CONFIG_SENSORS_LM87 is not set
# CONFIG_SENSORS_LM90 is not set
# CONFIG_SENSORS_LM92 is not set
CONFIG_SENSORS_LM93=y
CONFIG_SENSORS_LM95234=y
CONFIG_SENSORS_LM95241=y
CONFIG_SENSORS_LM95245=y
CONFIG_SENSORS_PC87360=y
CONFIG_SENSORS_PC87427=y
# CONFIG_SENSORS_NTC_THERMISTOR is not set
CONFIG_SENSORS_NCT6683=y
CONFIG_SENSORS_NCT6775_CORE=y
CONFIG_SENSORS_NCT6775=y
# CONFIG_SENSORS_NCT6775_I2C is not set
CONFIG_SENSORS_NCT7802=y
# CONFIG_SENSORS_NPCM7XX is not set
CONFIG_SENSORS_NZXT_KRAKEN2=y
# CONFIG_SENSORS_NZXT_SMART2 is not set
CONFIG_SENSORS_PCF8591=y
# CONFIG_PMBUS is not set
# CONFIG_SENSORS_SBTSI is not set
CONFIG_SENSORS_SBRMI=y
CONFIG_SENSORS_SHT15=y
CONFIG_SENSORS_SHT21=y
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHT4x is not set
CONFIG_SENSORS_SHTC1=y
CONFIG_SENSORS_SIS5595=y
# CONFIG_SENSORS_DME1737 is not set
# CONFIG_SENSORS_EMC1403 is not set
# CONFIG_SENSORS_EMC2103 is not set
# CONFIG_SENSORS_EMC2305 is not set
CONFIG_SENSORS_EMC6W201=y
CONFIG_SENSORS_SMSC47M1=y
CONFIG_SENSORS_SMSC47M192=y
CONFIG_SENSORS_SMSC47B397=y
CONFIG_SENSORS_STTS751=y
CONFIG_SENSORS_SMM665=y
CONFIG_SENSORS_ADC128D818=y
CONFIG_SENSORS_ADS7828=y
CONFIG_SENSORS_ADS7871=y
CONFIG_SENSORS_AMC6821=y
CONFIG_SENSORS_INA209=y
CONFIG_SENSORS_INA2XX=y
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
CONFIG_SENSORS_TC74=y
CONFIG_SENSORS_THMC50=y
CONFIG_SENSORS_TMP102=y
CONFIG_SENSORS_TMP103=y
CONFIG_SENSORS_TMP108=y
CONFIG_SENSORS_TMP401=y
CONFIG_SENSORS_TMP421=y
# CONFIG_SENSORS_TMP464 is not set
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=y
# CONFIG_SENSORS_VIA686A is not set
CONFIG_SENSORS_VT1211=y
CONFIG_SENSORS_VT8231=y
CONFIG_SENSORS_W83773G=y
# CONFIG_SENSORS_W83781D is not set
CONFIG_SENSORS_W83791D=y
# CONFIG_SENSORS_W83792D is not set
CONFIG_SENSORS_W83793=y
CONFIG_SENSORS_W83795=y
# CONFIG_SENSORS_W83795_FANCTRL is not set
# CONFIG_SENSORS_W83L785TS is not set
CONFIG_SENSORS_W83L786NG=y
# CONFIG_SENSORS_W83627HF is not set
CONFIG_SENSORS_W83627EHF=y
CONFIG_SENSORS_WM831X=y
CONFIG_SENSORS_WM8350=y
CONFIG_SENSORS_INTEL_M10_BMC_HWMON=y

#
# ACPI drivers
#
# CONFIG_SENSORS_ACPI_POWER is not set
# CONFIG_SENSORS_ATK0110 is not set
# CONFIG_SENSORS_ASUS_EC is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_DEVFREQ_THERMAL=y
CONFIG_THERMAL_EMULATION=y

#
# Intel thermal drivers
#
# CONFIG_INTEL_POWERCLAMP is not set
CONFIG_X86_THERMAL_VECTOR=y
# CONFIG_X86_PKG_TEMP_THERMAL is not set
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

# CONFIG_INTEL_PCH_THERMAL is not set
CONFIG_INTEL_TCC_COOLING=y
# CONFIG_INTEL_MENLOW is not set
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

CONFIG_GENERIC_ADC_THERMAL=y
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
# CONFIG_BCMA_HOST_PCI is not set
CONFIG_BCMA_HOST_SOC=y
CONFIG_BCMA_DRIVER_PCI=y
# CONFIG_BCMA_SFLASH is not set
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
# CONFIG_BCMA_DRIVER_GPIO is not set
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_AS3711=y
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
CONFIG_MFD_BCM590XX=y
# CONFIG_MFD_BD9571MWV is not set
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
# CONFIG_MFD_MADERA is not set
CONFIG_PMIC_DA903X=y
# CONFIG_MFD_DA9052_SPI is not set
# CONFIG_MFD_DA9052_I2C is not set
CONFIG_MFD_DA9055=y
CONFIG_MFD_DA9062=y
CONFIG_MFD_DA9063=y
CONFIG_MFD_DA9150=y
CONFIG_MFD_DLN2=y
# CONFIG_MFD_MC13XXX_SPI is not set
# CONFIG_MFD_MC13XXX_I2C is not set
CONFIG_MFD_MP2629=y
CONFIG_HTC_PASIC3=y
# CONFIG_HTC_I2CPLD is not set
CONFIG_MFD_INTEL_QUARK_I2C_GPIO=y
CONFIG_LPC_ICH=y
CONFIG_LPC_SCH=y
# CONFIG_INTEL_SOC_PMIC is not set
# CONFIG_INTEL_SOC_PMIC_CHTWC is not set
# CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
CONFIG_MFD_INTEL_LPSS=y
# CONFIG_MFD_INTEL_LPSS_ACPI is not set
CONFIG_MFD_INTEL_LPSS_PCI=y
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
CONFIG_MFD_88PM800=y
# CONFIG_MFD_88PM805 is not set
CONFIG_MFD_88PM860X=y
CONFIG_MFD_MAX14577=y
CONFIG_MFD_MAX77693=y
CONFIG_MFD_MAX77843=y
CONFIG_MFD_MAX8907=y
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
CONFIG_MFD_MAX8998=y
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6370 is not set
CONFIG_MFD_MT6397=y
CONFIG_MFD_MENF21BMC=y
# CONFIG_MFD_OCELOT is not set
CONFIG_EZX_PCAP=y
CONFIG_MFD_VIPERBOARD=y
CONFIG_MFD_RETU=y
# CONFIG_MFD_PCF50633 is not set
CONFIG_UCB1400_CORE=y
# CONFIG_MFD_SY7636A is not set
CONFIG_MFD_RDC321X=y
# CONFIG_MFD_RT4831 is not set
CONFIG_MFD_RT5033=y
# CONFIG_MFD_RT5120 is not set
CONFIG_MFD_RC5T583=y
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SKY81452 is not set
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
CONFIG_MFD_LP8788=y
CONFIG_MFD_TI_LMU=y
CONFIG_MFD_PALMAS=y
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=y
CONFIG_MFD_TPS65086=y
CONFIG_MFD_TPS65090=y
CONFIG_MFD_TI_LP873X=y
# CONFIG_MFD_TPS6586X is not set
CONFIG_MFD_TPS65910=y
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
CONFIG_TWL4030_CORE=y
CONFIG_MFD_TWL4030_AUDIO=y
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=y
# CONFIG_MFD_LM3533 is not set
CONFIG_MFD_TQMX86=y
CONFIG_MFD_VX855=y
CONFIG_MFD_ARIZONA=y
# CONFIG_MFD_ARIZONA_I2C is not set
CONFIG_MFD_ARIZONA_SPI=y
CONFIG_MFD_CS47L24=y
CONFIG_MFD_WM5102=y
CONFIG_MFD_WM5110=y
CONFIG_MFD_WM8997=y
# CONFIG_MFD_WM8998 is not set
CONFIG_MFD_WM8400=y
CONFIG_MFD_WM831X=y
# CONFIG_MFD_WM831X_I2C is not set
CONFIG_MFD_WM831X_SPI=y
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
CONFIG_MFD_WM8994=y
CONFIG_MFD_ATC260X=y
CONFIG_MFD_ATC260X_I2C=y
CONFIG_MFD_INTEL_M10_BMC=y
# end of Multifunction device drivers

CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=y
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
CONFIG_REGULATOR_88PG86X=y
CONFIG_REGULATOR_88PM800=y
CONFIG_REGULATOR_88PM8607=y
CONFIG_REGULATOR_ACT8865=y
CONFIG_REGULATOR_AD5398=y
CONFIG_REGULATOR_ARIZONA_LDO1=y
CONFIG_REGULATOR_ARIZONA_MICSUPP=y
CONFIG_REGULATOR_AS3711=y
CONFIG_REGULATOR_ATC260X=y
# CONFIG_REGULATOR_AXP20X is not set
# CONFIG_REGULATOR_BCM590XX is not set
# CONFIG_REGULATOR_DA9055 is not set
# CONFIG_REGULATOR_DA9062 is not set
CONFIG_REGULATOR_DA9210=y
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=y
CONFIG_REGULATOR_GPIO=y
# CONFIG_REGULATOR_ISL9305 is not set
CONFIG_REGULATOR_ISL6271A=y
CONFIG_REGULATOR_LM363X=y
# CONFIG_REGULATOR_LP3971 is not set
# CONFIG_REGULATOR_LP3972 is not set
CONFIG_REGULATOR_LP872X=y
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LP8788=y
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX14577=y
CONFIG_REGULATOR_MAX1586=y
CONFIG_REGULATOR_MAX8649=y
# CONFIG_REGULATOR_MAX8660 is not set
# CONFIG_REGULATOR_MAX8893 is not set
CONFIG_REGULATOR_MAX8907=y
# CONFIG_REGULATOR_MAX8952 is not set
# CONFIG_REGULATOR_MAX8998 is not set
# CONFIG_REGULATOR_MAX20086 is not set
# CONFIG_REGULATOR_MAX77693 is not set
# CONFIG_REGULATOR_MAX77826 is not set
CONFIG_REGULATOR_MP8859=y
# CONFIG_REGULATOR_MT6311 is not set
CONFIG_REGULATOR_MT6315=y
CONFIG_REGULATOR_MT6323=y
# CONFIG_REGULATOR_MT6331 is not set
# CONFIG_REGULATOR_MT6332 is not set
CONFIG_REGULATOR_MT6358=y
CONFIG_REGULATOR_MT6359=y
CONFIG_REGULATOR_MT6397=y
CONFIG_REGULATOR_PALMAS=y
CONFIG_REGULATOR_PCA9450=y
CONFIG_REGULATOR_PCAP=y
# CONFIG_REGULATOR_PV88060 is not set
# CONFIG_REGULATOR_PV88080 is not set
CONFIG_REGULATOR_PV88090=y
CONFIG_REGULATOR_QCOM_SPMI=y
# CONFIG_REGULATOR_QCOM_USB_VBUS is not set
CONFIG_REGULATOR_RC5T583=y
# CONFIG_REGULATOR_RT4801 is not set
CONFIG_REGULATOR_RT5033=y
# CONFIG_REGULATOR_RT5190A is not set
# CONFIG_REGULATOR_RT5759 is not set
# CONFIG_REGULATOR_RT6160 is not set
CONFIG_REGULATOR_RT6245=y
# CONFIG_REGULATOR_RTQ2134 is not set
# CONFIG_REGULATOR_RTMV20 is not set
CONFIG_REGULATOR_RTQ6752=y
CONFIG_REGULATOR_SLG51000=y
CONFIG_REGULATOR_TPS51632=y
CONFIG_REGULATOR_TPS62360=y
# CONFIG_REGULATOR_TPS65023 is not set
CONFIG_REGULATOR_TPS6507X=y
# CONFIG_REGULATOR_TPS65086 is not set
CONFIG_REGULATOR_TPS65090=y
CONFIG_REGULATOR_TPS65132=y
CONFIG_REGULATOR_TPS6524X=y
# CONFIG_REGULATOR_TPS65910 is not set
# CONFIG_REGULATOR_TWL4030 is not set
CONFIG_REGULATOR_WM831X=y
CONFIG_REGULATOR_WM8350=y
CONFIG_REGULATOR_WM8400=y
CONFIG_REGULATOR_WM8994=y
# CONFIG_REGULATOR_QCOM_LABIBB is not set
CONFIG_RC_CORE=y
# CONFIG_BPF_LIRC_MODE2 is not set
CONFIG_LIRC=y
# CONFIG_RC_MAP is not set
# CONFIG_RC_DECODERS is not set
# CONFIG_RC_DEVICES is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y

#
# CEC support
#
# CONFIG_MEDIA_CEC_RC is not set
CONFIG_MEDIA_CEC_SUPPORT=y
CONFIG_CEC_CH7322=y
CONFIG_CEC_SECO=y
# CONFIG_CEC_SECO_RC is not set
CONFIG_USB_PULSE8_CEC=y
# CONFIG_USB_RAINSHADOW_CEC is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=y
CONFIG_MEDIA_SUPPORT_FILTER=y
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
# CONFIG_MEDIA_SDR_SUPPORT is not set
CONFIG_MEDIA_PLATFORM_SUPPORT=y
# CONFIG_MEDIA_TEST_SUPPORT is not set
# end of Media device types

CONFIG_VIDEO_DEV=y
CONFIG_MEDIA_CONTROLLER=y
CONFIG_DVB_CORE=y

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
CONFIG_VIDEO_ADV_DEBUG=y
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
# CONFIG_V4L2_FLASH_LED_CLASS is not set
CONFIG_V4L2_FWNODE=y
CONFIG_V4L2_ASYNC=y
# end of Video4Linux options

#
# Media controller options
#
# CONFIG_MEDIA_CONTROLLER_DVB is not set
# end of Media controller options

#
# Digital TV options
#
CONFIG_DVB_MMAP=y
CONFIG_DVB_NET=y
CONFIG_DVB_MAX_ADAPTERS=16
CONFIG_DVB_DYNAMIC_MINORS=y
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
# CONFIG_DVB_ULE_DEBUG is not set
# end of Digital TV options

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
# CONFIG_MEDIA_PCI_SUPPORT is not set
CONFIG_RADIO_ADAPTERS=y
# CONFIG_RADIO_MAXIRADIO is not set
CONFIG_RADIO_SAA7706H=y
CONFIG_RADIO_SHARK=y
CONFIG_RADIO_SHARK2=y
CONFIG_RADIO_SI4713=y
CONFIG_RADIO_TEA575X=y
CONFIG_RADIO_TEA5764=y
CONFIG_RADIO_TEA5764_XTAL=y
CONFIG_RADIO_TEF6862=y
# CONFIG_RADIO_WL1273 is not set
CONFIG_USB_DSBR=y
# CONFIG_USB_KEENE is not set
# CONFIG_USB_MA901 is not set
# CONFIG_USB_MR800 is not set
CONFIG_USB_RAREMONO=y
# CONFIG_RADIO_SI470X is not set
CONFIG_USB_SI4713=y
CONFIG_PLATFORM_SI4713=y
CONFIG_I2C_SI4713=y
CONFIG_MEDIA_PLATFORM_DRIVERS=y
CONFIG_V4L_PLATFORM_DRIVERS=y
CONFIG_DVB_PLATFORM_DRIVERS=y
CONFIG_V4L_MEM2MEM_DRIVERS=y
# CONFIG_VIDEO_MEM2MEM_DEINTERLACE is not set

#
# Allegro DVT media platform drivers
#

#
# Amlogic media platform drivers
#

#
# Amphion drivers
#

#
# Aspeed media platform drivers
#
# CONFIG_VIDEO_ASPEED is not set

#
# Atmel media platform drivers
#

#
# Cadence media platform drivers
#
# CONFIG_VIDEO_CADENCE_CSI2RX is not set
# CONFIG_VIDEO_CADENCE_CSI2TX is not set

#
# Chips&Media media platform drivers
#

#
# Intel media platform drivers
#

#
# Marvell media platform drivers
#
CONFIG_VIDEO_CAFE_CCIC=y

#
# Mediatek media platform drivers
#

#
# NVidia media platform drivers
#

#
# NXP media platform drivers
#

#
# Qualcomm media platform drivers
#

#
# Renesas media platform drivers
#

#
# Rockchip media platform drivers
#

#
# Samsung media platform drivers
#

#
# STMicroelectronics media platform drivers
#

#
# Sunxi media platform drivers
#

#
# Texas Instruments drivers
#

#
# Verisilicon media platform drivers
#

#
# VIA media platform drivers
#

#
# Xilinx media platform drivers
#

#
# MMC/SDIO DVB adapters
#
CONFIG_SMS_SDIO_DRV=y

#
# FireWire (IEEE 1394) Adapters
#
# CONFIG_DVB_FIREDTV is not set
CONFIG_MEDIA_COMMON_OPTIONS=y

#
# common driver options
#
CONFIG_SMS_SIANO_MDTV=y
# CONFIG_SMS_SIANO_RC is not set
CONFIG_VIDEOBUF2_CORE=y
CONFIG_VIDEOBUF2_V4L2=y
CONFIG_VIDEOBUF2_MEMOPS=y
CONFIG_VIDEOBUF2_DMA_CONTIG=y
CONFIG_VIDEOBUF2_VMALLOC=y
CONFIG_VIDEOBUF2_DMA_SG=y
# end of Media drivers

CONFIG_MEDIA_HIDE_ANCILLARY_SUBDRV=y

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y

#
# IR I2C driver auto-selected by 'Autoselect ancillary drivers'
#
CONFIG_VIDEO_IR_I2C=y

#
# Camera sensor devices
#
CONFIG_VIDEO_APTINA_PLL=y
CONFIG_VIDEO_CCS_PLL=y
# CONFIG_VIDEO_AR0521 is not set
CONFIG_VIDEO_HI556=y
CONFIG_VIDEO_HI846=y
# CONFIG_VIDEO_HI847 is not set
# CONFIG_VIDEO_IMX208 is not set
CONFIG_VIDEO_IMX214=y
CONFIG_VIDEO_IMX219=y
CONFIG_VIDEO_IMX258=y
# CONFIG_VIDEO_IMX274 is not set
CONFIG_VIDEO_IMX290=y
# CONFIG_VIDEO_IMX319 is not set
# CONFIG_VIDEO_IMX355 is not set
CONFIG_VIDEO_MAX9271_LIB=y
CONFIG_VIDEO_MT9M001=y
CONFIG_VIDEO_MT9M032=y
CONFIG_VIDEO_MT9M111=y
# CONFIG_VIDEO_MT9P031 is not set
# CONFIG_VIDEO_MT9T001 is not set
CONFIG_VIDEO_MT9T112=y
CONFIG_VIDEO_MT9V011=y
CONFIG_VIDEO_MT9V032=y
CONFIG_VIDEO_MT9V111=y
# CONFIG_VIDEO_NOON010PC30 is not set
# CONFIG_VIDEO_OG01A1B is not set
CONFIG_VIDEO_OV02A10=y
# CONFIG_VIDEO_OV08D10 is not set
CONFIG_VIDEO_OV13858=y
CONFIG_VIDEO_OV13B10=y
CONFIG_VIDEO_OV2640=y
CONFIG_VIDEO_OV2659=y
# CONFIG_VIDEO_OV2680 is not set
CONFIG_VIDEO_OV2685=y
# CONFIG_VIDEO_OV2740 is not set
CONFIG_VIDEO_OV5647=y
CONFIG_VIDEO_OV5648=y
# CONFIG_VIDEO_OV5670 is not set
CONFIG_VIDEO_OV5675=y
# CONFIG_VIDEO_OV5693 is not set
# CONFIG_VIDEO_OV5695 is not set
CONFIG_VIDEO_OV6650=y
CONFIG_VIDEO_OV7251=y
# CONFIG_VIDEO_OV7640 is not set
CONFIG_VIDEO_OV7670=y
# CONFIG_VIDEO_OV772X is not set
CONFIG_VIDEO_OV7740=y
CONFIG_VIDEO_OV8856=y
CONFIG_VIDEO_OV8865=y
CONFIG_VIDEO_OV9640=y
CONFIG_VIDEO_OV9650=y
# CONFIG_VIDEO_OV9734 is not set
CONFIG_VIDEO_RDACM20=y
CONFIG_VIDEO_RDACM21=y
# CONFIG_VIDEO_RJ54N1 is not set
CONFIG_VIDEO_S5C73M3=y
CONFIG_VIDEO_S5K4ECGX=y
# CONFIG_VIDEO_S5K5BAF is not set
CONFIG_VIDEO_S5K6A3=y
CONFIG_VIDEO_S5K6AA=y
CONFIG_VIDEO_SR030PC30=y
# CONFIG_VIDEO_VS6624 is not set
CONFIG_VIDEO_CCS=y
CONFIG_VIDEO_ET8EK8=y
CONFIG_VIDEO_M5MOLS=y
# end of Camera sensor devices

#
# Lens drivers
#
CONFIG_VIDEO_AD5820=y
CONFIG_VIDEO_AK7375=y
CONFIG_VIDEO_DW9714=y
CONFIG_VIDEO_DW9768=y
CONFIG_VIDEO_DW9807_VCM=y
# end of Lens drivers

#
# Flash devices
#
# CONFIG_VIDEO_ADP1653 is not set
CONFIG_VIDEO_LM3560=y
# CONFIG_VIDEO_LM3646 is not set
# end of Flash devices

#
# audio, video and radio I2C drivers auto-selected by 'Autoselect ancillary drivers'
#

#
# Video and audio decoders
#

#
# SPI I2C drivers auto-selected by 'Autoselect ancillary drivers'
#

#
# Media SPI Adapters
#
CONFIG_CXD2880_SPI_DRV=y
# CONFIG_VIDEO_GS1662 is not set
# end of Media SPI Adapters

CONFIG_MEDIA_TUNER=y

#
# Tuner drivers auto-selected by 'Autoselect ancillary drivers'
#
CONFIG_MEDIA_TUNER_MC44S803=y
CONFIG_MEDIA_TUNER_MT20XX=y
CONFIG_MEDIA_TUNER_SIMPLE=y
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
CONFIG_MEDIA_TUNER_XC2028=y
CONFIG_MEDIA_TUNER_XC4000=y
CONFIG_MEDIA_TUNER_XC5000=y

#
# DVB Frontend drivers auto-selected by 'Autoselect ancillary drivers'
#

#
# Multistandard (satellite) frontends
#

#
# Multistandard (cable + terrestrial) frontends
#

#
# DVB-S (satellite) frontends
#

#
# DVB-T (terrestrial) frontends
#

#
# DVB-C (cable) frontends
#

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#

#
# ISDB-T (terrestrial) frontends
#

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#

#
# Digital terrestrial only tuners/PLL
#

#
# SEC control devices for DVB-S
#

#
# Common Interface (EN50221) controller drivers
#
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_AGP=y
# CONFIG_AGP_AMD64 is not set
# CONFIG_AGP_INTEL is not set
# CONFIG_AGP_SIS is not set
# CONFIG_AGP_VIA is not set
# CONFIG_VGA_SWITCHEROO is not set
# CONFIG_DRM is not set

#
# ARM devices
#
# end of ARM devices

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_DDC=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_HECUBA=y
CONFIG_FB_SVGALIB=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
CONFIG_FB_CIRRUS=y
# CONFIG_FB_PM2 is not set
CONFIG_FB_CYBER2000=y
# CONFIG_FB_CYBER2000_DDC is not set
CONFIG_FB_ARC=y
# CONFIG_FB_ASILIANT is not set
CONFIG_FB_IMSTT=y
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_VESA is not set
CONFIG_FB_N411=y
# CONFIG_FB_HGA is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
CONFIG_FB_RIVA=y
CONFIG_FB_RIVA_I2C=y
# CONFIG_FB_RIVA_DEBUG is not set
# CONFIG_FB_RIVA_BACKLIGHT is not set
CONFIG_FB_I740=y
CONFIG_FB_LE80578=y
# CONFIG_FB_CARILLO_RANCH is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
CONFIG_FB_ATY128=y
# CONFIG_FB_ATY128_BACKLIGHT is not set
# CONFIG_FB_ATY is not set
CONFIG_FB_S3=y
# CONFIG_FB_S3_DDC is not set
CONFIG_FB_SAVAGE=y
# CONFIG_FB_SAVAGE_I2C is not set
# CONFIG_FB_SAVAGE_ACCEL is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
CONFIG_FB_KYRO=y
# CONFIG_FB_3DFX is not set
CONFIG_FB_VOODOO1=y
CONFIG_FB_VT8623=y
CONFIG_FB_TRIDENT=y
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
CONFIG_FB_SMSCUFX=y
# CONFIG_FB_UDL is not set
CONFIG_FB_IBM_GXT4500=y
# CONFIG_FB_GOLDFISH is not set
CONFIG_FB_VIRTUAL=y
# CONFIG_FB_METRONOME is not set
CONFIG_FB_MB862XX=y
CONFIG_FB_MB862XX_PCI_GDC=y
CONFIG_FB_MB862XX_I2C=y
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SSD1307 is not set
CONFIG_FB_SM712=y
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
# CONFIG_LCD_LTV350QV is not set
CONFIG_LCD_ILI922X=y
CONFIG_LCD_ILI9320=y
# CONFIG_LCD_TDO24M is not set
CONFIG_LCD_VGG2432A4=y
CONFIG_LCD_PLATFORM=y
CONFIG_LCD_AMS369FG06=y
CONFIG_LCD_LMS501KF03=y
CONFIG_LCD_HX8357=y
CONFIG_LCD_OTM3225A=y
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_KTD253=y
# CONFIG_BACKLIGHT_CARILLO_RANCH is not set
CONFIG_BACKLIGHT_DA903X=y
# CONFIG_BACKLIGHT_APPLE is not set
# CONFIG_BACKLIGHT_QCOM_WLED is not set
# CONFIG_BACKLIGHT_SAHARA is not set
CONFIG_BACKLIGHT_WM831X=y
# CONFIG_BACKLIGHT_ADP8860 is not set
CONFIG_BACKLIGHT_ADP8870=y
CONFIG_BACKLIGHT_88PM860X=y
# CONFIG_BACKLIGHT_LM3639 is not set
# CONFIG_BACKLIGHT_PANDORA is not set
CONFIG_BACKLIGHT_AS3711=y
CONFIG_BACKLIGHT_GPIO=y
CONFIG_BACKLIGHT_LV5207LP=y
CONFIG_BACKLIGHT_BD6107=y
CONFIG_BACKLIGHT_ARCXCNN=y
# end of Backlight & LCD device support

CONFIG_VGASTATE=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
# CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

# CONFIG_LOGO is not set
# end of Graphics support

CONFIG_SOUND=y
CONFIG_SND=y
CONFIG_SND_TIMER=y
CONFIG_SND_PCM=y
CONFIG_SND_DMAENGINE_PCM=y
CONFIG_SND_HWDEP=y
CONFIG_SND_SEQ_DEVICE=y
CONFIG_SND_RAWMIDI=y
CONFIG_SND_COMPRESS_OFFLOAD=y
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
# CONFIG_SND_OSSEMUL is not set
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_HRTIMER=y
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
# CONFIG_SND_SUPPORT_OLD_API is not set
CONFIG_SND_PROC_FS=y
# CONFIG_SND_VERBOSE_PROCFS is not set
CONFIG_SND_VERBOSE_PRINTK=y
CONFIG_SND_CTL_FAST_LOOKUP=y
# CONFIG_SND_DEBUG is not set
# CONFIG_SND_CTL_INPUT_VALIDATION is not set
CONFIG_SND_VMASTER=y
CONFIG_SND_DMA_SGBUF=y
CONFIG_SND_SEQUENCER=y
CONFIG_SND_SEQ_DUMMY=y
CONFIG_SND_SEQ_HRTIMER_DEFAULT=y
CONFIG_SND_SEQ_MIDI_EVENT=y
CONFIG_SND_SEQ_MIDI=y
CONFIG_SND_AC97_CODEC=y
# CONFIG_SND_DRIVERS is not set
# CONFIG_SND_PCI is not set

#
# HD-Audio
#
# end of HD-Audio

CONFIG_SND_HDA_PREALLOC_SIZE=0
CONFIG_SND_INTEL_NHLT=y
CONFIG_SND_INTEL_DSP_CONFIG=y
CONFIG_SND_INTEL_SOUNDWIRE_ACPI=y
# CONFIG_SND_SPI is not set
CONFIG_SND_USB=y
CONFIG_SND_USB_AUDIO=y
CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER=y
CONFIG_SND_USB_UA101=y
CONFIG_SND_USB_USX2Y=y
CONFIG_SND_USB_CAIAQ=y
# CONFIG_SND_USB_CAIAQ_INPUT is not set
CONFIG_SND_USB_US122L=y
# CONFIG_SND_USB_6FIRE is not set
CONFIG_SND_USB_HIFACE=y
CONFIG_SND_BCD2000=y
CONFIG_SND_USB_LINE6=y
CONFIG_SND_USB_POD=y
CONFIG_SND_USB_PODHD=y
CONFIG_SND_USB_TONEPORT=y
CONFIG_SND_USB_VARIAX=y
CONFIG_SND_FIREWIRE=y
CONFIG_SND_FIREWIRE_LIB=y
CONFIG_SND_DICE=y
# CONFIG_SND_OXFW is not set
CONFIG_SND_ISIGHT=y
# CONFIG_SND_FIREWORKS is not set
# CONFIG_SND_BEBOB is not set
CONFIG_SND_FIREWIRE_DIGI00X=y
CONFIG_SND_FIREWIRE_TASCAM=y
# CONFIG_SND_FIREWIRE_MOTU is not set
CONFIG_SND_FIREFACE=y
# CONFIG_SND_PCMCIA is not set
CONFIG_SND_SOC=y
CONFIG_SND_SOC_AC97_BUS=y
CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
CONFIG_SND_SOC_COMPRESS=y
CONFIG_SND_SOC_ACPI=y
CONFIG_SND_SOC_ADI=y
CONFIG_SND_SOC_ADI_AXI_I2S=y
CONFIG_SND_SOC_ADI_AXI_SPDIF=y
# CONFIG_SND_SOC_AMD_ACP is not set
# CONFIG_SND_SOC_AMD_ACP3x is not set
# CONFIG_SND_SOC_AMD_RENOIR is not set
# CONFIG_SND_SOC_AMD_ACP5x is not set
# CONFIG_SND_SOC_AMD_ACP6x is not set
# CONFIG_SND_AMD_ACP_CONFIG is not set
# CONFIG_SND_SOC_AMD_ACP_COMMON is not set
# CONFIG_SND_SOC_AMD_RPL_ACP6x is not set
# CONFIG_SND_SOC_AMD_PS is not set
CONFIG_SND_ATMEL_SOC=y
CONFIG_SND_BCM63XX_I2S_WHISTLER=y
CONFIG_SND_DESIGNWARE_I2S=y
CONFIG_SND_DESIGNWARE_PCM=y

#
# SoC Audio for Freescale CPUs
#

#
# Common SoC Audio options for Freescale CPUs:
#
CONFIG_SND_SOC_FSL_ASRC=y
CONFIG_SND_SOC_FSL_SAI=y
CONFIG_SND_SOC_FSL_MQS=y
CONFIG_SND_SOC_FSL_AUDMIX=y
CONFIG_SND_SOC_FSL_SSI=y
CONFIG_SND_SOC_FSL_SPDIF=y
# CONFIG_SND_SOC_FSL_ESAI is not set
# CONFIG_SND_SOC_FSL_MICFIL is not set
# CONFIG_SND_SOC_FSL_EASRC is not set
# CONFIG_SND_SOC_FSL_XCVR is not set
CONFIG_SND_SOC_FSL_UTILS=y
CONFIG_SND_SOC_FSL_RPMSG=y
# CONFIG_SND_SOC_IMX_AUDMUX is not set
# end of SoC Audio for Freescale CPUs

CONFIG_SND_I2S_HI6210_I2S=y
# CONFIG_SND_SOC_IMG is not set
CONFIG_SND_SOC_INTEL_SST_TOPLEVEL=y
CONFIG_SND_SST_ATOM_HIFI2_PLATFORM=y
# CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_PCI is not set
CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI=y
# CONFIG_SND_SOC_INTEL_SKYLAKE is not set
# CONFIG_SND_SOC_INTEL_SKL is not set
# CONFIG_SND_SOC_INTEL_APL is not set
# CONFIG_SND_SOC_INTEL_KBL is not set
# CONFIG_SND_SOC_INTEL_GLK is not set
# CONFIG_SND_SOC_INTEL_CNL is not set
# CONFIG_SND_SOC_INTEL_CFL is not set
# CONFIG_SND_SOC_INTEL_CML_H is not set
# CONFIG_SND_SOC_INTEL_CML_LP is not set
CONFIG_SND_SOC_ACPI_INTEL_MATCH=y
# CONFIG_SND_SOC_INTEL_AVS is not set
CONFIG_SND_SOC_INTEL_MACH=y
# CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES is not set
CONFIG_SND_SOC_MTK_BTCVSD=y
# CONFIG_SND_SOC_SOF_TOPLEVEL is not set

#
# STMicroelectronics STM32 SOC audio support
#
# end of STMicroelectronics STM32 SOC audio support

CONFIG_SND_SOC_XILINX_I2S=y
CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=y
# CONFIG_SND_SOC_XILINX_SPDIF is not set
CONFIG_SND_SOC_XTFPGA_I2S=y
CONFIG_SND_SOC_I2C_AND_SPI=y

#
# CODEC drivers
#
CONFIG_SND_SOC_WM_ADSP=y
CONFIG_SND_SOC_AC97_CODEC=y
CONFIG_SND_SOC_ADAU_UTILS=y
CONFIG_SND_SOC_ADAU1372=y
# CONFIG_SND_SOC_ADAU1372_I2C is not set
CONFIG_SND_SOC_ADAU1372_SPI=y
CONFIG_SND_SOC_ADAU1701=y
CONFIG_SND_SOC_ADAU17X1=y
CONFIG_SND_SOC_ADAU1761=y
CONFIG_SND_SOC_ADAU1761_I2C=y
# CONFIG_SND_SOC_ADAU1761_SPI is not set
CONFIG_SND_SOC_ADAU7002=y
CONFIG_SND_SOC_ADAU7118=y
CONFIG_SND_SOC_ADAU7118_HW=y
# CONFIG_SND_SOC_ADAU7118_I2C is not set
# CONFIG_SND_SOC_AK4104 is not set
# CONFIG_SND_SOC_AK4118 is not set
# CONFIG_SND_SOC_AK4375 is not set
# CONFIG_SND_SOC_AK4458 is not set
# CONFIG_SND_SOC_AK4554 is not set
CONFIG_SND_SOC_AK4613=y
CONFIG_SND_SOC_AK4642=y
CONFIG_SND_SOC_AK5386=y
CONFIG_SND_SOC_AK5558=y
CONFIG_SND_SOC_ALC5623=y
# CONFIG_SND_SOC_AW8738 is not set
# CONFIG_SND_SOC_BD28623 is not set
# CONFIG_SND_SOC_BT_SCO is not set
CONFIG_SND_SOC_CS35L32=y
CONFIG_SND_SOC_CS35L33=y
CONFIG_SND_SOC_CS35L34=y
CONFIG_SND_SOC_CS35L35=y
CONFIG_SND_SOC_CS35L36=y
CONFIG_SND_SOC_CS35L41_LIB=y
CONFIG_SND_SOC_CS35L41=y
CONFIG_SND_SOC_CS35L41_SPI=y
CONFIG_SND_SOC_CS35L41_I2C=y
# CONFIG_SND_SOC_CS35L45_SPI is not set
# CONFIG_SND_SOC_CS35L45_I2C is not set
# CONFIG_SND_SOC_CS42L42 is not set
CONFIG_SND_SOC_CS42L51=y
CONFIG_SND_SOC_CS42L51_I2C=y
# CONFIG_SND_SOC_CS42L52 is not set
# CONFIG_SND_SOC_CS42L56 is not set
CONFIG_SND_SOC_CS42L73=y
# CONFIG_SND_SOC_CS42L83 is not set
# CONFIG_SND_SOC_CS4234 is not set
# CONFIG_SND_SOC_CS4265 is not set
CONFIG_SND_SOC_CS4270=y
CONFIG_SND_SOC_CS4271=y
# CONFIG_SND_SOC_CS4271_I2C is not set
CONFIG_SND_SOC_CS4271_SPI=y
CONFIG_SND_SOC_CS42XX8=y
CONFIG_SND_SOC_CS42XX8_I2C=y
CONFIG_SND_SOC_CS43130=y
CONFIG_SND_SOC_CS4341=y
CONFIG_SND_SOC_CS4349=y
CONFIG_SND_SOC_CS53L30=y
# CONFIG_SND_SOC_CX2072X is not set
CONFIG_SND_SOC_DA7213=y
CONFIG_SND_SOC_DMIC=y
CONFIG_SND_SOC_ES7134=y
# CONFIG_SND_SOC_ES7241 is not set
CONFIG_SND_SOC_ES8316=y
# CONFIG_SND_SOC_ES8326 is not set
CONFIG_SND_SOC_ES8328=y
CONFIG_SND_SOC_ES8328_I2C=y
# CONFIG_SND_SOC_ES8328_SPI is not set
CONFIG_SND_SOC_GTM601=y
# CONFIG_SND_SOC_HDA is not set
CONFIG_SND_SOC_ICS43432=y
# CONFIG_SND_SOC_INNO_RK3036 is not set
# CONFIG_SND_SOC_MAX98088 is not set
CONFIG_SND_SOC_MAX98357A=y
# CONFIG_SND_SOC_MAX98504 is not set
# CONFIG_SND_SOC_MAX9867 is not set
# CONFIG_SND_SOC_MAX98927 is not set
CONFIG_SND_SOC_MAX98520=y
CONFIG_SND_SOC_MAX98373=y
CONFIG_SND_SOC_MAX98373_I2C=y
# CONFIG_SND_SOC_MAX98390 is not set
# CONFIG_SND_SOC_MAX98396 is not set
# CONFIG_SND_SOC_MAX9860 is not set
CONFIG_SND_SOC_MSM8916_WCD_ANALOG=y
CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=y
CONFIG_SND_SOC_PCM1681=y
CONFIG_SND_SOC_PCM1789=y
CONFIG_SND_SOC_PCM1789_I2C=y
CONFIG_SND_SOC_PCM179X=y
# CONFIG_SND_SOC_PCM179X_I2C is not set
CONFIG_SND_SOC_PCM179X_SPI=y
CONFIG_SND_SOC_PCM186X=y
CONFIG_SND_SOC_PCM186X_I2C=y
# CONFIG_SND_SOC_PCM186X_SPI is not set
CONFIG_SND_SOC_PCM3060=y
CONFIG_SND_SOC_PCM3060_I2C=y
# CONFIG_SND_SOC_PCM3060_SPI is not set
CONFIG_SND_SOC_PCM3168A=y
CONFIG_SND_SOC_PCM3168A_I2C=y
# CONFIG_SND_SOC_PCM3168A_SPI is not set
CONFIG_SND_SOC_PCM5102A=y
# CONFIG_SND_SOC_PCM512x_I2C is not set
# CONFIG_SND_SOC_PCM512x_SPI is not set
CONFIG_SND_SOC_RK3328=y
CONFIG_SND_SOC_RL6231=y
CONFIG_SND_SOC_RT5616=y
CONFIG_SND_SOC_RT5631=y
# CONFIG_SND_SOC_RT5640 is not set
# CONFIG_SND_SOC_RT5659 is not set
# CONFIG_SND_SOC_RT9120 is not set
# CONFIG_SND_SOC_SGTL5000 is not set
CONFIG_SND_SOC_SIGMADSP=y
CONFIG_SND_SOC_SIGMADSP_I2C=y
CONFIG_SND_SOC_SIGMADSP_REGMAP=y
CONFIG_SND_SOC_SIMPLE_AMPLIFIER=y
# CONFIG_SND_SOC_SIMPLE_MUX is not set
CONFIG_SND_SOC_SPDIF=y
# CONFIG_SND_SOC_SRC4XXX_I2C is not set
# CONFIG_SND_SOC_SSM2305 is not set
# CONFIG_SND_SOC_SSM2518 is not set
CONFIG_SND_SOC_SSM2602=y
CONFIG_SND_SOC_SSM2602_SPI=y
CONFIG_SND_SOC_SSM2602_I2C=y
# CONFIG_SND_SOC_SSM4567 is not set
CONFIG_SND_SOC_STA32X=y
CONFIG_SND_SOC_STA350=y
CONFIG_SND_SOC_STI_SAS=y
CONFIG_SND_SOC_TAS2552=y
CONFIG_SND_SOC_TAS2562=y
CONFIG_SND_SOC_TAS2764=y
CONFIG_SND_SOC_TAS2770=y
# CONFIG_SND_SOC_TAS2780 is not set
# CONFIG_SND_SOC_TAS5086 is not set
CONFIG_SND_SOC_TAS571X=y
CONFIG_SND_SOC_TAS5720=y
# CONFIG_SND_SOC_TAS5805M is not set
# CONFIG_SND_SOC_TAS6424 is not set
CONFIG_SND_SOC_TDA7419=y
CONFIG_SND_SOC_TFA9879=y
CONFIG_SND_SOC_TFA989X=y
CONFIG_SND_SOC_TLV320ADC3XXX=y
CONFIG_SND_SOC_TLV320AIC23=y
CONFIG_SND_SOC_TLV320AIC23_I2C=y
CONFIG_SND_SOC_TLV320AIC23_SPI=y
# CONFIG_SND_SOC_TLV320AIC31XX is not set
CONFIG_SND_SOC_TLV320AIC32X4=y
CONFIG_SND_SOC_TLV320AIC32X4_I2C=y
CONFIG_SND_SOC_TLV320AIC32X4_SPI=y
CONFIG_SND_SOC_TLV320AIC3X=y
CONFIG_SND_SOC_TLV320AIC3X_I2C=y
# CONFIG_SND_SOC_TLV320AIC3X_SPI is not set
CONFIG_SND_SOC_TLV320ADCX140=y
# CONFIG_SND_SOC_TS3A227E is not set
CONFIG_SND_SOC_TSCS42XX=y
CONFIG_SND_SOC_TSCS454=y
# CONFIG_SND_SOC_UDA1334 is not set
CONFIG_SND_SOC_WM8510=y
CONFIG_SND_SOC_WM8523=y
CONFIG_SND_SOC_WM8524=y
CONFIG_SND_SOC_WM8580=y
# CONFIG_SND_SOC_WM8711 is not set
# CONFIG_SND_SOC_WM8728 is not set
# CONFIG_SND_SOC_WM8731_I2C is not set
# CONFIG_SND_SOC_WM8731_SPI is not set
CONFIG_SND_SOC_WM8737=y
# CONFIG_SND_SOC_WM8741 is not set
# CONFIG_SND_SOC_WM8750 is not set
CONFIG_SND_SOC_WM8753=y
CONFIG_SND_SOC_WM8770=y
# CONFIG_SND_SOC_WM8776 is not set
# CONFIG_SND_SOC_WM8782 is not set
CONFIG_SND_SOC_WM8804=y
CONFIG_SND_SOC_WM8804_I2C=y
CONFIG_SND_SOC_WM8804_SPI=y
# CONFIG_SND_SOC_WM8903 is not set
CONFIG_SND_SOC_WM8904=y
# CONFIG_SND_SOC_WM8940 is not set
CONFIG_SND_SOC_WM8960=y
# CONFIG_SND_SOC_WM8962 is not set
CONFIG_SND_SOC_WM8974=y
CONFIG_SND_SOC_WM8978=y
CONFIG_SND_SOC_WM8985=y
CONFIG_SND_SOC_ZL38060=y
CONFIG_SND_SOC_MAX9759=y
CONFIG_SND_SOC_MT6351=y
# CONFIG_SND_SOC_MT6358 is not set
CONFIG_SND_SOC_MT6660=y
CONFIG_SND_SOC_NAU8315=y
CONFIG_SND_SOC_NAU8540=y
# CONFIG_SND_SOC_NAU8810 is not set
CONFIG_SND_SOC_NAU8821=y
CONFIG_SND_SOC_NAU8822=y
CONFIG_SND_SOC_NAU8824=y
CONFIG_SND_SOC_TPA6130A2=y
CONFIG_SND_SOC_LPASS_MACRO_COMMON=y
# CONFIG_SND_SOC_LPASS_WSA_MACRO is not set
# CONFIG_SND_SOC_LPASS_VA_MACRO is not set
# CONFIG_SND_SOC_LPASS_RX_MACRO is not set
CONFIG_SND_SOC_LPASS_TX_MACRO=y
# end of CODEC drivers

CONFIG_SND_SIMPLE_CARD_UTILS=y
CONFIG_SND_SIMPLE_CARD=y
# CONFIG_SND_X86 is not set
CONFIG_SND_VIRTIO=y
CONFIG_AC97_BUS=y

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
# CONFIG_HIDRAW is not set
CONFIG_UHID=y
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
# CONFIG_HID_ACCUTOUCH is not set
CONFIG_HID_ACRUX=y
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=y
CONFIG_HID_APPLEIR=y
# CONFIG_HID_ASUS is not set
# CONFIG_HID_AUREAL is not set
# CONFIG_HID_BELKIN is not set
CONFIG_HID_BETOP_FF=y
# CONFIG_HID_BIGBEN_FF is not set
CONFIG_HID_CHERRY=y
CONFIG_HID_CHICONY=y
CONFIG_HID_CORSAIR=y
CONFIG_HID_COUGAR=y
# CONFIG_HID_MACALLY is not set
# CONFIG_HID_PRODIKEYS is not set
CONFIG_HID_CMEDIA=y
CONFIG_HID_CREATIVE_SB0540=y
CONFIG_HID_CYPRESS=y
# CONFIG_HID_DRAGONRISE is not set
# CONFIG_HID_EMS_FF is not set
CONFIG_HID_ELAN=y
CONFIG_HID_ELECOM=y
# CONFIG_HID_ELO is not set
CONFIG_HID_EZKEY=y
CONFIG_HID_GEMBIRD=y
CONFIG_HID_GFRM=y
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=y
# CONFIG_HID_KYE is not set
CONFIG_HID_UCLOGIC=y
CONFIG_HID_WALTOP=y
CONFIG_HID_VIEWSONIC=y
# CONFIG_HID_VRC2 is not set
CONFIG_HID_XIAOMI=y
CONFIG_HID_GYRATION=y
# CONFIG_HID_ICADE is not set
CONFIG_HID_ITE=y
CONFIG_HID_JABRA=y
# CONFIG_HID_TWINHAN is not set
CONFIG_HID_KENSINGTON=y
CONFIG_HID_LCPOWER=y
CONFIG_HID_LED=y
CONFIG_HID_LENOVO=y
# CONFIG_HID_LETSKETCH is not set
# CONFIG_HID_LOGITECH is not set
CONFIG_HID_MAGICMOUSE=y
CONFIG_HID_MALTRON=y
CONFIG_HID_MAYFLASH=y
# CONFIG_HID_MEGAWORLD_FF is not set
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=y
# CONFIG_HID_MONTEREY is not set
# CONFIG_HID_MULTITOUCH is not set
CONFIG_HID_NINTENDO=y
CONFIG_NINTENDO_FF=y
CONFIG_HID_NTI=y
CONFIG_HID_NTRIG=y
CONFIG_HID_ORTEK=y
CONFIG_HID_PANTHERLORD=y
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
# CONFIG_HID_PETALYNX is not set
CONFIG_HID_PICOLCD=y
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
# CONFIG_HID_PLANTRONICS is not set
CONFIG_HID_PLAYSTATION=y
CONFIG_PLAYSTATION_FF=y
# CONFIG_HID_PXRC is not set
# CONFIG_HID_RAZER is not set
# CONFIG_HID_PRIMAX is not set
# CONFIG_HID_RETRODE is not set
CONFIG_HID_ROCCAT=y
# CONFIG_HID_SAITEK is not set
CONFIG_HID_SAMSUNG=y
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SIGMAMICRO is not set
CONFIG_HID_SONY=y
# CONFIG_SONY_FF is not set
CONFIG_HID_SPEEDLINK=y
CONFIG_HID_STEAM=y
# CONFIG_HID_STEELSERIES is not set
CONFIG_HID_SUNPLUS=y
CONFIG_HID_RMI=y
CONFIG_HID_GREENASIA=y
CONFIG_GREENASIA_FF=y
CONFIG_HID_SMARTJOYPLUS=y
CONFIG_SMARTJOYPLUS_FF=y
# CONFIG_HID_TIVO is not set
CONFIG_HID_TOPSEED=y
# CONFIG_HID_TOPRE is not set
CONFIG_HID_THINGM=y
CONFIG_HID_THRUSTMASTER=y
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
CONFIG_HID_U2FZERO=y
CONFIG_HID_WACOM=y
CONFIG_HID_WIIMOTE=y
CONFIG_HID_XINMO=y
CONFIG_HID_ZEROPLUS=y
CONFIG_ZEROPLUS_FF=y
CONFIG_HID_ZYDACRON=y
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=y
# CONFIG_HID_ALPS is not set
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

#
# I2C HID support
#
# CONFIG_I2C_HID_ACPI is not set
# end of I2C HID support

#
# Intel ISH HID support
#
# CONFIG_INTEL_ISH_HID is not set
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_LED_TRIG=y
CONFIG_USB_ULPI_BUS=y
CONFIG_USB_CONN_GPIO=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
CONFIG_USB_DYNAMIC_MINORS=y
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_PRODUCTLIST is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=y
# CONFIG_USB_XHCI_HCD is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
CONFIG_USB_EHCI_FSL=y
CONFIG_USB_EHCI_HCD_PLATFORM=y
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_FOTG210_HCD is not set
# CONFIG_USB_MAX3421_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
CONFIG_USB_OHCI_HCD_PLATFORM=y
CONFIG_USB_UHCI_HCD=y
# CONFIG_USB_U132_HCD is not set
CONFIG_USB_SL811_HCD=y
CONFIG_USB_SL811_HCD_ISO=y
CONFIG_USB_SL811_CS=y
# CONFIG_USB_R8A66597_HCD is not set
CONFIG_USB_HCD_BCMA=y
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
CONFIG_USB_PRINTER=y
CONFIG_USB_WDM=y
CONFIG_USB_TMC=y

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=y
CONFIG_USB_STORAGE_DEBUG=y
CONFIG_USB_STORAGE_REALTEK=y
# CONFIG_REALTEK_AUTOPM is not set
CONFIG_USB_STORAGE_DATAFAB=y
# CONFIG_USB_STORAGE_FREECOM is not set
CONFIG_USB_STORAGE_ISD200=y
CONFIG_USB_STORAGE_USBAT=y
# CONFIG_USB_STORAGE_SDDR09 is not set
CONFIG_USB_STORAGE_SDDR55=y
# CONFIG_USB_STORAGE_JUMPSHOT is not set
CONFIG_USB_STORAGE_ALAUDA=y
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
# CONFIG_USB_STORAGE_ENE_UB6250 is not set
CONFIG_USB_UAS=y

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
# CONFIG_USB_MICROTEK is not set
# CONFIG_USBIP_CORE is not set
CONFIG_USB_CDNS_SUPPORT=y
CONFIG_USB_CDNS_HOST=y
CONFIG_USB_CDNS3=y
CONFIG_USB_CDNS3_HOST=y
CONFIG_USB_CDNS3_PCI_WRAP=y
# CONFIG_USB_CDNSP_PCI is not set
CONFIG_USB_MUSB_HDRC=y
CONFIG_USB_MUSB_HOST=y

#
# Platform Glue Layer
#

#
# MUSB DMA mode
#
# CONFIG_MUSB_PIO_ONLY is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
CONFIG_USB_CHIPIDEA=y
# CONFIG_USB_CHIPIDEA_HOST is not set
CONFIG_USB_CHIPIDEA_PCI=y
CONFIG_USB_CHIPIDEA_MSM=y
CONFIG_USB_CHIPIDEA_GENERIC=y
CONFIG_USB_ISP1760=y
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1760_HOST_ROLE=y

#
# USB port drivers
#
CONFIG_USB_USS720=y
CONFIG_USB_SERIAL=y
CONFIG_USB_SERIAL_CONSOLE=y
CONFIG_USB_SERIAL_GENERIC=y
# CONFIG_USB_SERIAL_SIMPLE is not set
# CONFIG_USB_SERIAL_AIRCABLE is not set
# CONFIG_USB_SERIAL_ARK3116 is not set
# CONFIG_USB_SERIAL_BELKIN is not set
CONFIG_USB_SERIAL_CH341=y
# CONFIG_USB_SERIAL_WHITEHEAT is not set
CONFIG_USB_SERIAL_DIGI_ACCELEPORT=y
# CONFIG_USB_SERIAL_CP210X is not set
# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
CONFIG_USB_SERIAL_EMPEG=y
# CONFIG_USB_SERIAL_FTDI_SIO is not set
CONFIG_USB_SERIAL_VISOR=y
CONFIG_USB_SERIAL_IPAQ=y
# CONFIG_USB_SERIAL_IR is not set
# CONFIG_USB_SERIAL_EDGEPORT is not set
CONFIG_USB_SERIAL_EDGEPORT_TI=y
# CONFIG_USB_SERIAL_F81232 is not set
# CONFIG_USB_SERIAL_F8153X is not set
CONFIG_USB_SERIAL_GARMIN=y
CONFIG_USB_SERIAL_IPW=y
CONFIG_USB_SERIAL_IUU=y
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
CONFIG_USB_SERIAL_KEYSPAN=y
CONFIG_USB_SERIAL_KLSI=y
CONFIG_USB_SERIAL_KOBIL_SCT=y
# CONFIG_USB_SERIAL_MCT_U232 is not set
CONFIG_USB_SERIAL_METRO=y
CONFIG_USB_SERIAL_MOS7720=y
CONFIG_USB_SERIAL_MOS7715_PARPORT=y
CONFIG_USB_SERIAL_MOS7840=y
CONFIG_USB_SERIAL_MXUPORT=y
CONFIG_USB_SERIAL_NAVMAN=y
CONFIG_USB_SERIAL_PL2303=y
CONFIG_USB_SERIAL_OTI6858=y
CONFIG_USB_SERIAL_QCAUX=y
CONFIG_USB_SERIAL_QUALCOMM=y
CONFIG_USB_SERIAL_SPCP8X5=y
CONFIG_USB_SERIAL_SAFE=y
CONFIG_USB_SERIAL_SAFE_PADDED=y
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
# CONFIG_USB_SERIAL_SYMBOL is not set
# CONFIG_USB_SERIAL_TI is not set
CONFIG_USB_SERIAL_CYBERJACK=y
CONFIG_USB_SERIAL_WWAN=y
# CONFIG_USB_SERIAL_OPTION is not set
CONFIG_USB_SERIAL_OMNINET=y
CONFIG_USB_SERIAL_OPTICON=y
# CONFIG_USB_SERIAL_XSENS_MT is not set
CONFIG_USB_SERIAL_WISHBONE=y
CONFIG_USB_SERIAL_SSU100=y
# CONFIG_USB_SERIAL_QT2 is not set
# CONFIG_USB_SERIAL_UPD78F0730 is not set
CONFIG_USB_SERIAL_XR=y
# CONFIG_USB_SERIAL_DEBUG is not set

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=y
CONFIG_USB_EMI26=y
# CONFIG_USB_ADUTUX is not set
CONFIG_USB_SEVSEG=y
CONFIG_USB_LEGOTOWER=y
CONFIG_USB_LCD=y
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
CONFIG_USB_IDMOUSE=y
CONFIG_USB_FTDI_ELAN=y
CONFIG_USB_APPLEDISPLAY=y
CONFIG_APPLE_MFI_FASTCHARGE=y
CONFIG_USB_SISUSBVGA=y
# CONFIG_USB_LD is not set
CONFIG_USB_TRANCEVIBRATOR=y
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=y
# CONFIG_USB_YUREX is not set
CONFIG_USB_EZUSB_FX2=y
CONFIG_USB_HUB_USB251XB=y
CONFIG_USB_HSIC_USB3503=y
CONFIG_USB_HSIC_USB4604=y
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
CONFIG_NOP_USB_XCEIV=y
CONFIG_USB_GPIO_VBUS=y
CONFIG_TAHVO_USB=y
CONFIG_TAHVO_USB_HOST_BY_DEFAULT=y
CONFIG_USB_ISP1301=y
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
CONFIG_TYPEC_TCPM=y
CONFIG_TYPEC_TCPCI=y
CONFIG_TYPEC_RT1711H=y
CONFIG_TYPEC_TCPCI_MAXIM=y
CONFIG_TYPEC_FUSB302=y
CONFIG_TYPEC_UCSI=y
CONFIG_UCSI_CCG=y
# CONFIG_UCSI_ACPI is not set
# CONFIG_UCSI_STM32G0 is not set
# CONFIG_TYPEC_TPS6598X is not set
# CONFIG_TYPEC_ANX7411 is not set
# CONFIG_TYPEC_RT1719 is not set
CONFIG_TYPEC_HD3SS3220=y
CONFIG_TYPEC_STUSB160X=y
# CONFIG_TYPEC_WUSB3801 is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_FSA4480 is not set
CONFIG_TYPEC_MUX_PI3USB30532=y
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# end of USB Type-C Alternate Mode drivers

CONFIG_USB_ROLE_SWITCH=y
# CONFIG_USB_ROLES_INTEL_XHCI is not set
CONFIG_MMC=y
CONFIG_MMC_BLOCK=y
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=y
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
CONFIG_MMC_DEBUG=y
CONFIG_MMC_SDHCI=y
# CONFIG_MMC_SDHCI_PCI is not set
# CONFIG_MMC_SDHCI_ACPI is not set
CONFIG_MMC_SDHCI_PLTFM=y
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_WBSD is not set
CONFIG_MMC_ALCOR=y
CONFIG_MMC_TIFM_SD=y
CONFIG_MMC_SPI=y
# CONFIG_MMC_SDRICOH_CS is not set
# CONFIG_MMC_CB710 is not set
CONFIG_MMC_VIA_SDMMC=y
CONFIG_MMC_VUB300=y
CONFIG_MMC_USHC=y
CONFIG_MMC_USDHI6ROL0=y
CONFIG_MMC_REALTEK_PCI=y
CONFIG_MMC_REALTEK_USB=y
CONFIG_MMC_CQHCI=y
CONFIG_MMC_HSQ=y
CONFIG_MMC_TOSHIBA_PCI=y
CONFIG_MMC_MTK=y
# CONFIG_MMC_SDHCI_XENON is not set
CONFIG_SCSI_UFSHCD=y
CONFIG_SCSI_UFS_BSG=y
# CONFIG_SCSI_UFS_HPB is not set
# CONFIG_SCSI_UFS_FAULT_INJECTION is not set
# CONFIG_SCSI_UFS_HWMON is not set
# CONFIG_SCSI_UFSHCD_PCI is not set
# CONFIG_SCSI_UFSHCD_PLATFORM is not set
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y
CONFIG_MSPRO_BLOCK=y
CONFIG_MS_BLOCK=y

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_TIFM_MS=y
CONFIG_MEMSTICK_JMICRON_38X=y
# CONFIG_MEMSTICK_R592 is not set
# CONFIG_MEMSTICK_REALTEK_PCI is not set
CONFIG_MEMSTICK_REALTEK_USB=y
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
CONFIG_LEDS_CLASS_MULTICOLOR=y
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
CONFIG_LEDS_88PM860X=y
# CONFIG_LEDS_APU is not set
# CONFIG_LEDS_LM3530 is not set
CONFIG_LEDS_LM3532=y
CONFIG_LEDS_LM3642=y
# CONFIG_LEDS_MT6323 is not set
CONFIG_LEDS_PCA9532=y
CONFIG_LEDS_PCA9532_GPIO=y
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=y
CONFIG_LEDS_LP3952=y
CONFIG_LEDS_LP50XX=y
# CONFIG_LEDS_LP8788 is not set
CONFIG_LEDS_PCA955X=y
# CONFIG_LEDS_PCA955X_GPIO is not set
# CONFIG_LEDS_PCA963X is not set
CONFIG_LEDS_WM831X_STATUS=y
CONFIG_LEDS_WM8350=y
CONFIG_LEDS_DA903X=y
CONFIG_LEDS_DAC124S085=y
CONFIG_LEDS_REGULATOR=y
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=y
CONFIG_LEDS_LT3593=y
CONFIG_LEDS_TCA6507=y
CONFIG_LEDS_TLC591XX=y
CONFIG_LEDS_LM355x=y
CONFIG_LEDS_MENF21BMC=y
# CONFIG_LEDS_IS31FL319X is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
# CONFIG_LEDS_MLXCPLD is not set
CONFIG_LEDS_MLXREG=y
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set
CONFIG_LEDS_TI_LMU_COMMON=y
# CONFIG_LEDS_LM36274 is not set

#
# Flash and Torch LED drivers
#
CONFIG_LEDS_AS3645A=y
CONFIG_LEDS_LM3601X=y
# CONFIG_LEDS_RT8515 is not set
CONFIG_LEDS_SGM3140=y

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
# CONFIG_LEDS_TRIGGER_TIMER is not set
CONFIG_LEDS_TRIGGER_ONESHOT=y
# CONFIG_LEDS_TRIGGER_DISK is not set
CONFIG_LEDS_TRIGGER_MTD=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
CONFIG_LEDS_TRIGGER_CPU=y
CONFIG_LEDS_TRIGGER_ACTIVITY=y
CONFIG_LEDS_TRIGGER_GPIO=y
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
CONFIG_LEDS_TRIGGER_CAMERA=y
CONFIG_LEDS_TRIGGER_PANIC=y
# CONFIG_LEDS_TRIGGER_NETDEV is not set
CONFIG_LEDS_TRIGGER_PATTERN=y
CONFIG_LEDS_TRIGGER_AUDIO=y
# CONFIG_LEDS_TRIGGER_TTY is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
# CONFIG_EDAC is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
CONFIG_RTC_DEBUG=y
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
# CONFIG_RTC_INTF_PROC is not set
# CONFIG_RTC_INTF_DEV is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
CONFIG_RTC_DRV_88PM860X=y
CONFIG_RTC_DRV_88PM80X=y
# CONFIG_RTC_DRV_ABB5ZES3 is not set
CONFIG_RTC_DRV_ABEOZ9=y
CONFIG_RTC_DRV_ABX80X=y
# CONFIG_RTC_DRV_DS1307 is not set
# CONFIG_RTC_DRV_DS1374 is not set
# CONFIG_RTC_DRV_DS1672 is not set
CONFIG_RTC_DRV_LP8788=y
# CONFIG_RTC_DRV_MAX6900 is not set
CONFIG_RTC_DRV_MAX8907=y
# CONFIG_RTC_DRV_MAX8998 is not set
# CONFIG_RTC_DRV_RS5C372 is not set
CONFIG_RTC_DRV_ISL1208=y
# CONFIG_RTC_DRV_ISL12022 is not set
# CONFIG_RTC_DRV_X1205 is not set
CONFIG_RTC_DRV_PCF8523=y
CONFIG_RTC_DRV_PCF85063=y
CONFIG_RTC_DRV_PCF85363=y
CONFIG_RTC_DRV_PCF8563=y
# CONFIG_RTC_DRV_PCF8583 is not set
# CONFIG_RTC_DRV_M41T80 is not set
CONFIG_RTC_DRV_BQ32K=y
# CONFIG_RTC_DRV_PALMAS is not set
# CONFIG_RTC_DRV_TPS65910 is not set
CONFIG_RTC_DRV_RC5T583=y
CONFIG_RTC_DRV_S35390A=y
# CONFIG_RTC_DRV_FM3130 is not set
CONFIG_RTC_DRV_RX8010=y
CONFIG_RTC_DRV_RX8581=y
CONFIG_RTC_DRV_RX8025=y
CONFIG_RTC_DRV_EM3027=y
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
CONFIG_RTC_DRV_SD3078=y

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
CONFIG_RTC_DRV_M41T94=y
CONFIG_RTC_DRV_DS1302=y
CONFIG_RTC_DRV_DS1305=y
# CONFIG_RTC_DRV_DS1343 is not set
CONFIG_RTC_DRV_DS1347=y
# CONFIG_RTC_DRV_DS1390 is not set
CONFIG_RTC_DRV_MAX6916=y
CONFIG_RTC_DRV_R9701=y
CONFIG_RTC_DRV_RX4581=y
CONFIG_RTC_DRV_RS5C348=y
CONFIG_RTC_DRV_MAX6902=y
CONFIG_RTC_DRV_PCF2123=y
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
# CONFIG_RTC_DRV_DS3232 is not set
CONFIG_RTC_DRV_PCF2127=y
CONFIG_RTC_DRV_RV3029C2=y
# CONFIG_RTC_DRV_RV3029_HWMON is not set
CONFIG_RTC_DRV_RX6110=y

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=y
# CONFIG_RTC_DRV_DS1511 is not set
# CONFIG_RTC_DRV_DS1553 is not set
CONFIG_RTC_DRV_DS1685_FAMILY=y
CONFIG_RTC_DRV_DS1685=y
# CONFIG_RTC_DRV_DS1689 is not set
# CONFIG_RTC_DRV_DS17285 is not set
# CONFIG_RTC_DRV_DS17485 is not set
# CONFIG_RTC_DRV_DS17885 is not set
# CONFIG_RTC_DRV_DS1742 is not set
CONFIG_RTC_DRV_DS2404=y
CONFIG_RTC_DRV_DA9055=y
# CONFIG_RTC_DRV_DA9063 is not set
# CONFIG_RTC_DRV_STK17TA8 is not set
CONFIG_RTC_DRV_M48T86=y
# CONFIG_RTC_DRV_M48T35 is not set
CONFIG_RTC_DRV_M48T59=y
CONFIG_RTC_DRV_MSM6242=y
CONFIG_RTC_DRV_BQ4802=y
CONFIG_RTC_DRV_RP5C01=y
CONFIG_RTC_DRV_V3020=y
CONFIG_RTC_DRV_WM831X=y
CONFIG_RTC_DRV_WM8350=y

#
# on-CPU RTC drivers
#
CONFIG_RTC_DRV_FTRTC010=y
CONFIG_RTC_DRV_PCAP=y
# CONFIG_RTC_DRV_MT6397 is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_HID_SENSOR_TIME is not set
CONFIG_RTC_DRV_GOLDFISH=y
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
# CONFIG_SYNC_FILE is not set
# CONFIG_UDMABUF is not set
CONFIG_DMABUF_MOVE_NOTIFY=y
CONFIG_DMABUF_DEBUG=y
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
CONFIG_DMABUF_SYSFS_STATS=y
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_LINEDISP=y
CONFIG_HD44780_COMMON=y
CONFIG_HD44780=y
# CONFIG_IMG_ASCII_LCD is not set
CONFIG_HT16K33=y
# CONFIG_LCD2S is not set
CONFIG_PARPORT_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
# CONFIG_PANEL_CHANGE_MESSAGE is not set
CONFIG_CHARLCD_BL_OFF=y
# CONFIG_CHARLCD_BL_ON is not set
# CONFIG_CHARLCD_BL_FLASH is not set
CONFIG_PANEL=y
CONFIG_UIO=y
CONFIG_UIO_CIF=y
CONFIG_UIO_PDRV_GENIRQ=y
CONFIG_UIO_DMEM_GENIRQ=y
# CONFIG_UIO_AEC is not set
# CONFIG_UIO_SERCOS3 is not set
CONFIG_UIO_PCI_GENERIC=y
# CONFIG_UIO_NETX is not set
CONFIG_UIO_PRUSS=y
CONFIG_UIO_MF624=y
# CONFIG_VFIO is not set
CONFIG_IRQ_BYPASS_MANAGER=y
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_PCI_LIB=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
# CONFIG_VIRTIO_PCI_LEGACY is not set
# CONFIG_VIRTIO_PMEM is not set
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=y
CONFIG_VIRTIO_MMIO=y
CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
# CONFIG_VDPA is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=y
CONFIG_GREYBUS_ES2=y
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
CONFIG_GOLDFISH_PIPE=y
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_SURFACE_PLATFORMS=y
# CONFIG_SURFACE_3_POWER_OPREGION is not set
# CONFIG_SURFACE_GPE is not set
# CONFIG_SURFACE_HOTPLUG is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
# CONFIG_X86_PLATFORM_DEVICES is not set
CONFIG_P2SB=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_WM831X=y
CONFIG_LMK04832=y
# CONFIG_COMMON_CLK_MAX9485 is not set
CONFIG_COMMON_CLK_SI5341=y
CONFIG_COMMON_CLK_SI5351=y
CONFIG_COMMON_CLK_SI544=y
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_PALMAS is not set
# CONFIG_XILINX_VCU is not set
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
# CONFIG_PCC is not set
CONFIG_ALTERA_MBOX=y
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
CONFIG_IOMMU_DEFAULT_DMA_LAZY=y
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
# CONFIG_AMD_IOMMU is not set
# CONFIG_VIRTIO_IOMMU is not set

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
# CONFIG_RPMSG_CTRL is not set
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_QCOM_GLINK=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

CONFIG_SOC_TI=y

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
CONFIG_DEVFREQ_GOV_POWERSAVE=y
# CONFIG_DEVFREQ_GOV_USERSPACE is not set
# CONFIG_DEVFREQ_GOV_PASSIVE is not set

#
# DEVFREQ Drivers
#
# CONFIG_PM_DEVFREQ_EVENT is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=y
# CONFIG_EXTCON_AXP288 is not set
# CONFIG_EXTCON_FSA9480 is not set
CONFIG_EXTCON_GPIO=y
# CONFIG_EXTCON_INTEL_INT3496 is not set
CONFIG_EXTCON_MAX14577=y
CONFIG_EXTCON_MAX3355=y
# CONFIG_EXTCON_MAX77693 is not set
# CONFIG_EXTCON_MAX77843 is not set
# CONFIG_EXTCON_PALMAS is not set
CONFIG_EXTCON_PTN5150=y
CONFIG_EXTCON_RT8973A=y
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
# CONFIG_EXTCON_USBC_TUSB320 is not set
CONFIG_MEMORY=y
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_BUFFER_DMA=y
CONFIG_IIO_BUFFER_DMAENGINE=y
CONFIG_IIO_BUFFER_HW_CONSUMER=y
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=y
CONFIG_IIO_SW_TRIGGER=y
CONFIG_IIO_TRIGGERED_EVENT=y

#
# Accelerometers
#
# CONFIG_ADIS16201 is not set
CONFIG_ADIS16209=y
CONFIG_ADXL313=y
CONFIG_ADXL313_I2C=y
CONFIG_ADXL313_SPI=y
CONFIG_ADXL345=y
CONFIG_ADXL345_I2C=y
CONFIG_ADXL345_SPI=y
# CONFIG_ADXL355_I2C is not set
# CONFIG_ADXL355_SPI is not set
# CONFIG_ADXL367_SPI is not set
# CONFIG_ADXL367_I2C is not set
CONFIG_ADXL372=y
CONFIG_ADXL372_SPI=y
CONFIG_ADXL372_I2C=y
CONFIG_BMA220=y
CONFIG_BMA400=y
CONFIG_BMA400_I2C=y
CONFIG_BMA400_SPI=y
# CONFIG_BMC150_ACCEL is not set
# CONFIG_BMI088_ACCEL is not set
CONFIG_DA280=y
CONFIG_DA311=y
# CONFIG_DMARD06 is not set
# CONFIG_DMARD09 is not set
CONFIG_DMARD10=y
CONFIG_FXLS8962AF=y
CONFIG_FXLS8962AF_I2C=y
# CONFIG_FXLS8962AF_SPI is not set
# CONFIG_HID_SENSOR_ACCEL_3D is not set
CONFIG_IIO_ST_ACCEL_3AXIS=y
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=y
CONFIG_IIO_ST_ACCEL_SPI_3AXIS=y
# CONFIG_KXSD9 is not set
CONFIG_KXCJK1013=y
CONFIG_MC3230=y
CONFIG_MMA7455=y
CONFIG_MMA7455_I2C=y
CONFIG_MMA7455_SPI=y
CONFIG_MMA7660=y
CONFIG_MMA8452=y
CONFIG_MMA9551_CORE=y
CONFIG_MMA9551=y
CONFIG_MMA9553=y
# CONFIG_MSA311 is not set
CONFIG_MXC4005=y
CONFIG_MXC6255=y
# CONFIG_SCA3000 is not set
# CONFIG_SCA3300 is not set
CONFIG_STK8312=y
# CONFIG_STK8BA50 is not set
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD_SIGMA_DELTA=y
# CONFIG_AD7091R5 is not set
# CONFIG_AD7124 is not set
CONFIG_AD7192=y
CONFIG_AD7266=y
# CONFIG_AD7280 is not set
# CONFIG_AD7291 is not set
# CONFIG_AD7292 is not set
CONFIG_AD7298=y
# CONFIG_AD7476 is not set
CONFIG_AD7606=y
# CONFIG_AD7606_IFACE_PARALLEL is not set
CONFIG_AD7606_IFACE_SPI=y
CONFIG_AD7766=y
# CONFIG_AD7768_1 is not set
CONFIG_AD7780=y
CONFIG_AD7791=y
CONFIG_AD7793=y
CONFIG_AD7887=y
# CONFIG_AD7923 is not set
CONFIG_AD7949=y
CONFIG_AD799X=y
CONFIG_AXP20X_ADC=y
# CONFIG_AXP288_ADC is not set
CONFIG_CC10001_ADC=y
# CONFIG_DA9150_GPADC is not set
CONFIG_DLN2_ADC=y
# CONFIG_ENVELOPE_DETECTOR is not set
# CONFIG_HI8435 is not set
CONFIG_HX711=y
# CONFIG_LP8788_ADC is not set
CONFIG_LTC2471=y
# CONFIG_LTC2485 is not set
CONFIG_LTC2496=y
# CONFIG_LTC2497 is not set
CONFIG_MAX1027=y
# CONFIG_MAX11100 is not set
CONFIG_MAX1118=y
# CONFIG_MAX11205 is not set
# CONFIG_MAX1241 is not set
# CONFIG_MAX1363 is not set
# CONFIG_MAX9611 is not set
# CONFIG_MCP320X is not set
CONFIG_MCP3422=y
CONFIG_MCP3911=y
CONFIG_MEN_Z188_ADC=y
# CONFIG_MP2629_ADC is not set
CONFIG_NAU7802=y
# CONFIG_PALMAS_GPADC is not set
CONFIG_QCOM_VADC_COMMON=y
CONFIG_QCOM_SPMI_IADC=y
CONFIG_QCOM_SPMI_VADC=y
# CONFIG_QCOM_SPMI_ADC5 is not set
# CONFIG_RICHTEK_RTQ6056 is not set
# CONFIG_SD_ADC_MODULATOR is not set
CONFIG_TI_ADC081C=y
# CONFIG_TI_ADC0832 is not set
CONFIG_TI_ADC084S021=y
CONFIG_TI_ADC12138=y
CONFIG_TI_ADC108S102=y
# CONFIG_TI_ADC128S052 is not set
CONFIG_TI_ADC161S626=y
CONFIG_TI_ADS1015=y
CONFIG_TI_ADS7950=y
# CONFIG_TI_ADS8344 is not set
CONFIG_TI_ADS8688=y
CONFIG_TI_ADS124S08=y
CONFIG_TI_ADS131E08=y
# CONFIG_TI_TLC4541 is not set
CONFIG_TI_TSC2046=y
CONFIG_TWL4030_MADC=y
CONFIG_TWL6030_GPADC=y
# CONFIG_VF610_ADC is not set
CONFIG_VIPERBOARD_ADC=y
CONFIG_XILINX_XADC=y
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
CONFIG_AD74413R=y
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
# CONFIG_IIO_RESCALE is not set
# end of Analog Front Ends

#
# Amplifiers
#
# CONFIG_AD8366 is not set
# CONFIG_ADA4250 is not set
# CONFIG_HMC425 is not set
# end of Amplifiers

#
# Capacitance to digital converters
#
CONFIG_AD7150=y
# CONFIG_AD7746 is not set
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=y
CONFIG_ATLAS_EZO_SENSOR=y
# CONFIG_BME680 is not set
CONFIG_CCS811=y
CONFIG_IAQCORE=y
CONFIG_SCD30_CORE=y
# CONFIG_SCD30_I2C is not set
CONFIG_SCD4X=y
CONFIG_SENSIRION_SGP30=y
CONFIG_SENSIRION_SGP40=y
# CONFIG_SPS30_I2C is not set
CONFIG_SENSEAIR_SUNRISE_CO2=y
CONFIG_VZ89X=y
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=y
CONFIG_HID_SENSOR_IIO_TRIGGER=y
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=y

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# CONFIG_IIO_SSP_SENSORS_COMMONS is not set
CONFIG_IIO_SSP_SENSORHUB=y
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=y
CONFIG_IIO_ST_SENSORS_SPI=y
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
CONFIG_AD3552R=y
# CONFIG_AD5064 is not set
CONFIG_AD5360=y
# CONFIG_AD5380 is not set
# CONFIG_AD5421 is not set
# CONFIG_AD5446 is not set
CONFIG_AD5449=y
CONFIG_AD5592R_BASE=y
CONFIG_AD5592R=y
CONFIG_AD5593R=y
# CONFIG_AD5504 is not set
CONFIG_AD5624R_SPI=y
# CONFIG_LTC2688 is not set
CONFIG_AD5686=y
CONFIG_AD5686_SPI=y
CONFIG_AD5696_I2C=y
CONFIG_AD5755=y
CONFIG_AD5758=y
CONFIG_AD5761=y
CONFIG_AD5764=y
CONFIG_AD5766=y
# CONFIG_AD5770R is not set
# CONFIG_AD5791 is not set
CONFIG_AD7293=y
CONFIG_AD7303=y
CONFIG_AD8801=y
# CONFIG_DPOT_DAC is not set
CONFIG_DS4424=y
CONFIG_LTC1660=y
CONFIG_LTC2632=y
CONFIG_M62332=y
# CONFIG_MAX517 is not set
CONFIG_MAX5821=y
# CONFIG_MCP4725 is not set
# CONFIG_MCP4922 is not set
# CONFIG_TI_DAC082S085 is not set
CONFIG_TI_DAC5571=y
CONFIG_TI_DAC7311=y
CONFIG_TI_DAC7612=y
# CONFIG_VF610_DAC is not set
# end of Digital to analog converters

#
# IIO dummy driver
#
CONFIG_IIO_DUMMY_EVGEN=y
CONFIG_IIO_SIMPLE_DUMMY=y
CONFIG_IIO_SIMPLE_DUMMY_EVENTS=y
# CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
# end of IIO dummy driver

#
# Filters
#
CONFIG_ADMV8818=y
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# CONFIG_AD9523 is not set
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# CONFIG_ADF4350 is not set
CONFIG_ADF4371=y
CONFIG_ADMV1013=y
# CONFIG_ADMV1014 is not set
# CONFIG_ADMV4420 is not set
# CONFIG_ADRF6780 is not set
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# CONFIG_ADIS16080 is not set
# CONFIG_ADIS16130 is not set
CONFIG_ADIS16136=y
# CONFIG_ADIS16260 is not set
# CONFIG_ADXRS290 is not set
# CONFIG_ADXRS450 is not set
CONFIG_BMG160=y
CONFIG_BMG160_I2C=y
CONFIG_BMG160_SPI=y
CONFIG_FXAS21002C=y
CONFIG_FXAS21002C_I2C=y
CONFIG_FXAS21002C_SPI=y
# CONFIG_HID_SENSOR_GYRO_3D is not set
CONFIG_MPU3050=y
CONFIG_MPU3050_I2C=y
CONFIG_IIO_ST_GYRO_3AXIS=y
CONFIG_IIO_ST_GYRO_I2C_3AXIS=y
CONFIG_IIO_ST_GYRO_SPI_3AXIS=y
# CONFIG_ITG3200 is not set
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4403=y
# CONFIG_AFE4404 is not set
CONFIG_MAX30100=y
CONFIG_MAX30102=y
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_AM2315=y
CONFIG_DHT11=y
# CONFIG_HDC100X is not set
CONFIG_HDC2010=y
CONFIG_HID_SENSOR_HUMIDITY=y
CONFIG_HTS221=y
CONFIG_HTS221_I2C=y
CONFIG_HTS221_SPI=y
CONFIG_HTU21=y
CONFIG_SI7005=y
CONFIG_SI7020=y
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_ADIS16400=y
CONFIG_ADIS16460=y
# CONFIG_ADIS16475 is not set
# CONFIG_ADIS16480 is not set
CONFIG_BMI160=y
CONFIG_BMI160_I2C=y
# CONFIG_BMI160_SPI is not set
# CONFIG_BOSCH_BNO055_I2C is not set
# CONFIG_FXOS8700_I2C is not set
# CONFIG_FXOS8700_SPI is not set
CONFIG_KMX61=y
CONFIG_INV_ICM42600=y
CONFIG_INV_ICM42600_I2C=y
CONFIG_INV_ICM42600_SPI=y
CONFIG_INV_MPU6050_IIO=y
# CONFIG_INV_MPU6050_I2C is not set
CONFIG_INV_MPU6050_SPI=y
CONFIG_IIO_ST_LSM6DSX=y
CONFIG_IIO_ST_LSM6DSX_I2C=y
CONFIG_IIO_ST_LSM6DSX_SPI=y
CONFIG_IIO_ST_LSM6DSX_I3C=y
CONFIG_IIO_ST_LSM9DS0=y
CONFIG_IIO_ST_LSM9DS0_I2C=y
CONFIG_IIO_ST_LSM9DS0_SPI=y
# end of Inertial measurement units

CONFIG_IIO_ADIS_LIB=y
CONFIG_IIO_ADIS_LIB_BUFFER=y

#
# Light sensors
#
# CONFIG_ACPI_ALS is not set
# CONFIG_ADJD_S311 is not set
CONFIG_ADUX1020=y
CONFIG_AL3010=y
CONFIG_AL3320A=y
# CONFIG_APDS9300 is not set
CONFIG_APDS9960=y
CONFIG_AS73211=y
# CONFIG_BH1750 is not set
CONFIG_BH1780=y
# CONFIG_CM32181 is not set
# CONFIG_CM3232 is not set
# CONFIG_CM3323 is not set
# CONFIG_CM3605 is not set
# CONFIG_CM36651 is not set
CONFIG_GP2AP002=y
# CONFIG_GP2AP020A00F is not set
# CONFIG_SENSORS_ISL29018 is not set
CONFIG_SENSORS_ISL29028=y
CONFIG_ISL29125=y
# CONFIG_HID_SENSOR_ALS is not set
CONFIG_HID_SENSOR_PROX=y
# CONFIG_JSA1212 is not set
# CONFIG_RPR0521 is not set
# CONFIG_LTR501 is not set
# CONFIG_LTRF216A is not set
CONFIG_LV0104CS=y
CONFIG_MAX44000=y
# CONFIG_MAX44009 is not set
CONFIG_NOA1305=y
CONFIG_OPT3001=y
CONFIG_PA12203001=y
# CONFIG_SI1133 is not set
CONFIG_SI1145=y
CONFIG_STK3310=y
CONFIG_ST_UVIS25=y
CONFIG_ST_UVIS25_I2C=y
CONFIG_ST_UVIS25_SPI=y
# CONFIG_TCS3414 is not set
CONFIG_TCS3472=y
CONFIG_SENSORS_TSL2563=y
# CONFIG_TSL2583 is not set
CONFIG_TSL2591=y
# CONFIG_TSL2772 is not set
CONFIG_TSL4531=y
# CONFIG_US5182D is not set
CONFIG_VCNL4000=y
CONFIG_VCNL4035=y
# CONFIG_VEML6030 is not set
# CONFIG_VEML6070 is not set
CONFIG_VL6180=y
CONFIG_ZOPT2201=y
# end of Light sensors

#
# Magnetometer sensors
#
# CONFIG_AK8974 is not set
CONFIG_AK8975=y
# CONFIG_AK09911 is not set
CONFIG_BMC150_MAGN=y
CONFIG_BMC150_MAGN_I2C=y
CONFIG_BMC150_MAGN_SPI=y
# CONFIG_MAG3110 is not set
CONFIG_HID_SENSOR_MAGNETOMETER_3D=y
# CONFIG_MMC35240 is not set
CONFIG_IIO_ST_MAGN_3AXIS=y
CONFIG_IIO_ST_MAGN_I2C_3AXIS=y
CONFIG_IIO_ST_MAGN_SPI_3AXIS=y
CONFIG_SENSORS_HMC5843=y
CONFIG_SENSORS_HMC5843_I2C=y
CONFIG_SENSORS_HMC5843_SPI=y
# CONFIG_SENSORS_RM3100_I2C is not set
# CONFIG_SENSORS_RM3100_SPI is not set
CONFIG_YAMAHA_YAS530=y
# end of Magnetometer sensors

#
# Multiplexers
#
# CONFIG_IIO_MUX is not set
# end of Multiplexers

#
# Inclinometer sensors
#
CONFIG_HID_SENSOR_INCLINOMETER_3D=y
CONFIG_HID_SENSOR_DEVICE_ROTATION=y
# end of Inclinometer sensors

#
# Triggers - standalone
#
CONFIG_IIO_HRTIMER_TRIGGER=y
CONFIG_IIO_INTERRUPT_TRIGGER=y
CONFIG_IIO_TIGHTLOOP_TRIGGER=y
CONFIG_IIO_SYSFS_TRIGGER=y
# end of Triggers - standalone

#
# Linear and angular position sensors
#
CONFIG_HID_SENSOR_CUSTOM_INTEL_HINGE=y
# end of Linear and angular position sensors

#
# Digital potentiometers
#
CONFIG_AD5110=y
# CONFIG_AD5272 is not set
CONFIG_DS1803=y
# CONFIG_MAX5432 is not set
# CONFIG_MAX5481 is not set
# CONFIG_MAX5487 is not set
# CONFIG_MCP4018 is not set
CONFIG_MCP4131=y
# CONFIG_MCP4531 is not set
CONFIG_MCP41010=y
CONFIG_TPL0102=y
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=y
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_ABP060MG=y
# CONFIG_BMP280 is not set
# CONFIG_DLHL60D is not set
CONFIG_DPS310=y
# CONFIG_HID_SENSOR_PRESS is not set
CONFIG_HP03=y
# CONFIG_ICP10100 is not set
CONFIG_MPL115=y
# CONFIG_MPL115_I2C is not set
CONFIG_MPL115_SPI=y
CONFIG_MPL3115=y
CONFIG_MS5611=y
# CONFIG_MS5611_I2C is not set
CONFIG_MS5611_SPI=y
CONFIG_MS5637=y
CONFIG_IIO_ST_PRESS=y
CONFIG_IIO_ST_PRESS_I2C=y
CONFIG_IIO_ST_PRESS_SPI=y
CONFIG_T5403=y
CONFIG_HP206C=y
CONFIG_ZPA2326=y
CONFIG_ZPA2326_I2C=y
CONFIG_ZPA2326_SPI=y
# end of Pressure sensors

#
# Lightning sensors
#
CONFIG_AS3935=y
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_ISL29501=y
CONFIG_LIDAR_LITE_V2=y
CONFIG_MB1232=y
CONFIG_PING=y
# CONFIG_RFD77402 is not set
# CONFIG_SRF04 is not set
CONFIG_SX_COMMON=y
CONFIG_SX9310=y
# CONFIG_SX9324 is not set
# CONFIG_SX9360 is not set
CONFIG_SX9500=y
# CONFIG_SRF08 is not set
CONFIG_VCNL3020=y
CONFIG_VL53L0X_I2C=y
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# CONFIG_AD2S90 is not set
CONFIG_AD2S1200=y
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_LTC2983=y
CONFIG_MAXIM_THERMOCOUPLE=y
# CONFIG_HID_SENSOR_TEMP is not set
# CONFIG_MLX90614 is not set
# CONFIG_MLX90632 is not set
CONFIG_TMP006=y
CONFIG_TMP007=y
CONFIG_TMP117=y
CONFIG_TSYS01=y
CONFIG_TSYS02D=y
CONFIG_MAX31856=y
# CONFIG_MAX31865 is not set
# end of Temperature sensors

CONFIG_NTB=y
# CONFIG_NTB_AMD is not set
CONFIG_NTB_IDT=y
# CONFIG_NTB_INTEL is not set
# CONFIG_NTB_EPF is not set
CONFIG_NTB_SWITCHTEC=y
CONFIG_NTB_PINGPONG=y
# CONFIG_NTB_TOOL is not set
CONFIG_NTB_PERF=y
# CONFIG_NTB_TRANSPORT is not set
# CONFIG_PWM is not set

#
# IRQ chip support
#
# end of IRQ chip support

CONFIG_IPACK_BUS=y
CONFIG_BOARD_TPCI200=y
CONFIG_SERIAL_IPOCTAL=y
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_TI_SYSCON=y
# CONFIG_RESET_TI_TPS380X is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_USB_LGM_PHY=y
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
CONFIG_BCM_KONA_USB2_PHY=y
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
CONFIG_PHY_CPCAP_USB=y
CONFIG_PHY_QCOM_USB_HS=y
# CONFIG_PHY_QCOM_USB_HSIC is not set
CONFIG_PHY_TUSB1210=y
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
# CONFIG_INTEL_RAPL is not set
# CONFIG_IDLE_INJECT is not set
CONFIG_MCB=y
CONFIG_MCB_PCI=y
# CONFIG_MCB_LPC is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_RAS_CEC is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_LIBNVDIMM=y
CONFIG_BLK_DEV_PMEM=y
CONFIG_ND_CLAIM=y
CONFIG_ND_BTT=y
CONFIG_BTT=y
CONFIG_NVDIMM_KEYS=y
CONFIG_DAX=y
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_RMEM=y
CONFIG_NVMEM_SPMI_SDAM=y

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

CONFIG_FPGA=y
# CONFIG_ALTERA_PR_IP_CORE is not set
CONFIG_FPGA_MGR_ALTERA_PS_SPI=y
# CONFIG_FPGA_MGR_ALTERA_CVP is not set
CONFIG_FPGA_MGR_XILINX_SPI=y
# CONFIG_FPGA_MGR_MACHXO2_SPI is not set
CONFIG_FPGA_BRIDGE=y
CONFIG_ALTERA_FREEZE_BRIDGE=y
CONFIG_XILINX_PR_DECOUPLER=y
CONFIG_FPGA_REGION=y
# CONFIG_FPGA_DFL is not set
# CONFIG_FPGA_M10_BMC_SEC_UPDATE is not set
# CONFIG_FPGA_MGR_MICROCHIP_SPI is not set
CONFIG_TEE=y
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=y
CONFIG_MUX_ADGS1408=y
CONFIG_MUX_GPIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
CONFIG_COUNTER=y
# CONFIG_INTERRUPT_CNT is not set
CONFIG_INTEL_QEP=y
# CONFIG_MOST is not set
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=y
CONFIG_EXT2_FS_XATTR=y
CONFIG_EXT2_FS_POSIX_ACL=y
# CONFIG_EXT2_FS_SECURITY is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=y
# CONFIG_EXT4_FS_POSIX_ACL is not set
CONFIG_EXT4_FS_SECURITY=y
CONFIG_EXT4_DEBUG=y
CONFIG_JBD2=y
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=y
CONFIG_REISERFS_CHECK=y
CONFIG_REISERFS_PROC_INFO=y
# CONFIG_REISERFS_FS_XATTR is not set
CONFIG_JFS_FS=y
CONFIG_JFS_POSIX_ACL=y
# CONFIG_JFS_SECURITY is not set
CONFIG_JFS_DEBUG=y
CONFIG_JFS_STATISTICS=y
CONFIG_XFS_FS=y
CONFIG_XFS_SUPPORT_V4=y
# CONFIG_XFS_QUOTA is not set
CONFIG_XFS_POSIX_ACL=y
# CONFIG_XFS_RT is not set
CONFIG_XFS_ONLINE_SCRUB=y
# CONFIG_XFS_ONLINE_REPAIR is not set
CONFIG_XFS_DEBUG=y
# CONFIG_XFS_ASSERT_FATAL is not set
# CONFIG_GFS2_FS is not set
# CONFIG_OCFS2_FS is not set
# CONFIG_BTRFS_FS is not set
CONFIG_NILFS2_FS=y
# CONFIG_F2FS_FS is not set
# CONFIG_ZONEFS_FS is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
CONFIG_FS_VERITY=y
CONFIG_FS_VERITY_DEBUG=y
# CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS4_FS is not set
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=y
CONFIG_CUSE=y
CONFIG_VIRTIO_FS=y
CONFIG_OVERLAY_FS=y
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
# CONFIG_OVERLAY_FS_INDEX is not set
CONFIG_OVERLAY_FS_XINO_AUTO=y
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
# CONFIG_FSCACHE is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
CONFIG_UDF_FS=y
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=y
CONFIG_MSDOS_FS=y
CONFIG_VFAT_FS=y
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
# CONFIG_FAT_DEFAULT_UTF8 is not set
CONFIG_EXFAT_FS=y
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
# CONFIG_NTFS_FS is not set
CONFIG_NTFS3_FS=y
# CONFIG_NTFS3_64BIT_CLUSTER is not set
CONFIG_NTFS3_LZX_XPRESS=y
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
# CONFIG_PROC_CHILDREN is not set
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_PROC_CPU_RESCTRL=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
# CONFIG_TMPFS_XATTR is not set
# CONFIG_TMPFS_INODE64 is not set
# CONFIG_HUGETLBFS is not set
CONFIG_ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=y
CONFIG_ADFS_FS=y
CONFIG_ADFS_FS_RW=y
CONFIG_AFFS_FS=y
# CONFIG_ECRYPT_FS is not set
# CONFIG_HFS_FS is not set
CONFIG_HFSPLUS_FS=y
# CONFIG_BEFS_FS is not set
CONFIG_BFS_FS=y
# CONFIG_EFS_FS is not set
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
# CONFIG_JFFS2_FS_WRITEBUFFER is not set
# CONFIG_JFFS2_SUMMARY is not set
# CONFIG_JFFS2_FS_XATTR is not set
CONFIG_JFFS2_COMPRESSION_OPTIONS=y
# CONFIG_JFFS2_ZLIB is not set
# CONFIG_JFFS2_LZO is not set
CONFIG_JFFS2_RTIME=y
# CONFIG_JFFS2_RUBIN is not set
CONFIG_JFFS2_CMODE_NONE=y
# CONFIG_JFFS2_CMODE_PRIORITY is not set
# CONFIG_JFFS2_CMODE_SIZE is not set
# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
CONFIG_UBIFS_FS=y
CONFIG_UBIFS_FS_ADVANCED_COMPR=y
CONFIG_UBIFS_FS_LZO=y
CONFIG_UBIFS_FS_ZLIB=y
# CONFIG_UBIFS_FS_ZSTD is not set
CONFIG_UBIFS_ATIME_SUPPORT=y
CONFIG_UBIFS_FS_XATTR=y
CONFIG_UBIFS_FS_SECURITY=y
CONFIG_UBIFS_FS_AUTHENTICATION=y
CONFIG_CRAMFS=y
CONFIG_CRAMFS_BLOCKDEV=y
# CONFIG_CRAMFS_MTD is not set
CONFIG_SQUASHFS=y
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
# CONFIG_SQUASHFS_DECOMP_SINGLE is not set
CONFIG_SQUASHFS_DECOMP_MULTI=y
# CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU is not set
# CONFIG_SQUASHFS_XATTR is not set
# CONFIG_SQUASHFS_ZLIB is not set
CONFIG_SQUASHFS_LZ4=y
# CONFIG_SQUASHFS_LZO is not set
# CONFIG_SQUASHFS_XZ is not set
CONFIG_SQUASHFS_ZSTD=y
CONFIG_SQUASHFS_4K_DEVBLK_SIZE=y
CONFIG_SQUASHFS_EMBEDDED=y
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
CONFIG_VXFS_FS=y
CONFIG_MINIX_FS=y
# CONFIG_OMFS_FS is not set
CONFIG_HPFS_FS=y
# CONFIG_QNX4FS_FS is not set
CONFIG_QNX6FS_FS=y
CONFIG_QNX6FS_DEBUG=y
# CONFIG_ROMFS_FS is not set
# CONFIG_PSTORE is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
CONFIG_EROFS_FS=y
CONFIG_EROFS_FS_DEBUG=y
# CONFIG_EROFS_FS_XATTR is not set
# CONFIG_EROFS_FS_ZIP is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V2=y
CONFIG_NFS_V3=y
# CONFIG_NFS_V3_ACL is not set
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
# CONFIG_NFS_V4_1 is not set
# CONFIG_ROOT_NFS is not set
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFSD is not set
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
# CONFIG_SUNRPC_DEBUG is not set
# CONFIG_CEPH_FS is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
# CONFIG_CIFS_UPCALL is not set
# CONFIG_CIFS_XATTR is not set
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
# CONFIG_CIFS_DFS_UPCALL is not set
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=y
# CONFIG_NLS_CODEPAGE_852 is not set
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=y
CONFIG_NLS_CODEPAGE_860=y
CONFIG_NLS_CODEPAGE_861=y
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=y
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=y
CONFIG_NLS_CODEPAGE_936=y
CONFIG_NLS_CODEPAGE_950=y
CONFIG_NLS_CODEPAGE_932=y
# CONFIG_NLS_CODEPAGE_949 is not set
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=y
# CONFIG_NLS_CODEPAGE_1251 is not set
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=y
# CONFIG_NLS_ISO8859_3 is not set
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
CONFIG_NLS_ISO8859_6=y
CONFIG_NLS_ISO8859_7=y
# CONFIG_NLS_ISO8859_9 is not set
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=y
# CONFIG_NLS_ISO8859_15 is not set
# CONFIG_NLS_KOI8_R is not set
CONFIG_NLS_KOI8_U=y
# CONFIG_NLS_MAC_ROMAN is not set
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
CONFIG_NLS_MAC_CROATIAN=y
CONFIG_NLS_MAC_CYRILLIC=y
# CONFIG_NLS_MAC_GAELIC is not set
# CONFIG_NLS_MAC_GREEK is not set
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
# CONFIG_NLS_MAC_ROMANIAN is not set
# CONFIG_NLS_MAC_TURKISH is not set
CONFIG_NLS_UTF8=y
# CONFIG_DLM is not set
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
# CONFIG_PERSISTENT_KEYRINGS is not set
# CONFIG_BIG_KEYS is not set
CONFIG_TRUSTED_KEYS=y
CONFIG_TRUSTED_KEYS_TPM=y
CONFIG_TRUSTED_KEYS_TEE=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_KEY_NOTIFICATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
# CONFIG_SECURITYFS is not set
# CONFIG_SECURITY_NETWORK is not set
# CONFIG_SECURITY_PATH is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
CONFIG_FORTIFY_SOURCE=y
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_LOADPIN is not set
# CONFIG_SECURITY_YAMA is not set
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
# CONFIG_INTEGRITY_SIGNATURE is not set
# CONFIG_IMA is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_ENABLER=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
# CONFIG_INIT_STACK_ALL_PATTERN is not set
CONFIG_INIT_STACK_ALL_ZERO=y
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# end of Kernel hardening options
# end of Security options

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
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
CONFIG_CRYPTO_ENGINE=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_ECDSA=y
# CONFIG_CRYPTO_ECRDSA is not set
CONFIG_CRYPTO_SM2=y
CONFIG_CRYPTO_CURVE25519=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
# CONFIG_CRYPTO_ARIA is not set
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=y
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SM4=y
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
# CONFIG_CRYPTO_CFB is not set
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
CONFIG_CRYPTO_KEYWRAP=y
CONFIG_CRYPTO_LRW=y
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_NHPOLY1305=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
CONFIG_CRYPTO_AEGIS128=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y
CONFIG_CRYPTO_ESSIV=y
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
CONFIG_CRYPTO_POLY1305=y
# CONFIG_CRYPTO_RMD160 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3=y
# CONFIG_CRYPTO_SM3_GENERIC is not set
CONFIG_CRYPTO_STREEBOG=y
# CONFIG_CRYPTO_VMAC is not set
CONFIG_CRYPTO_WP512=y
# CONFIG_CRYPTO_XCBC is not set
# CONFIG_CRYPTO_XXHASH is not set
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=y
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
CONFIG_CRYPTO_ZSTD=y
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# end of Random number generation

#
# Userspace interface
#
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
# CONFIG_CRYPTO_USER_API_AEAD is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
# CONFIG_CRYPTO_CURVE25519_X86 is not set
CONFIG_CRYPTO_AES_NI_INTEL=y
# CONFIG_CRYPTO_BLOWFISH_X86_64 is not set
CONFIG_CRYPTO_CAMELLIA_X86_64=y
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=y
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=y
CONFIG_CRYPTO_CAST5_AVX_X86_64=y
CONFIG_CRYPTO_CAST6_AVX_X86_64=y
CONFIG_CRYPTO_DES3_EDE_X86_64=y
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=y
CONFIG_CRYPTO_SERPENT_AVX_X86_64=y
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=y
CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64=y
CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64=y
CONFIG_CRYPTO_TWOFISH_X86_64=y
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=y
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=y
# CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64 is not set
CONFIG_CRYPTO_CHACHA20_X86_64=y
CONFIG_CRYPTO_AEGIS128_AESNI_SSE2=y
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
CONFIG_CRYPTO_NHPOLY1305_AVX2=y
CONFIG_CRYPTO_BLAKE2S_X86=y
# CONFIG_CRYPTO_POLYVAL_CLMUL_NI is not set
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=y
# CONFIG_CRYPTO_SM3_AVX_X86_64 is not set
# CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
# CONFIG_CRYPTO_CRC32C_INTEL is not set
# CONFIG_CRYPTO_CRC32_PCLMUL is not set
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=y
# end of Accelerated Cryptographic Algorithms for CPU (x86)

CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=y
# CONFIG_CRYPTO_DEV_PADLOCK_AES is not set
CONFIG_CRYPTO_DEV_PADLOCK_SHA=y
CONFIG_CRYPTO_DEV_ATMEL_I2C=y
CONFIG_CRYPTO_DEV_ATMEL_ECC=y
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
CONFIG_CRYPTO_DEV_CCP=y
# CONFIG_CRYPTO_DEV_CCP_DD is not set
CONFIG_CRYPTO_DEV_QAT=y
CONFIG_CRYPTO_DEV_QAT_DH895xCC=y
CONFIG_CRYPTO_DEV_QAT_C3XXX=y
CONFIG_CRYPTO_DEV_QAT_C62X=y
# CONFIG_CRYPTO_DEV_QAT_4XXX is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=y
CONFIG_CRYPTO_DEV_QAT_C62XVF=y
# CONFIG_CRYPTO_DEV_VIRTIO is not set
CONFIG_CRYPTO_DEV_SAFEXCEL=y
CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=y
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
CONFIG_SYSTEM_EXTRA_CERTIFICATE=y
CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=4096
CONFIG_SECONDARY_TRUSTED_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
CONFIG_SYSTEM_REVOCATION_LIST=y
CONFIG_SYSTEM_REVOCATION_KEYS=""
# CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=y
# CONFIG_PRIME_NUMBERS is not set
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

# CONFIG_CRC_CCITT is not set
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
CONFIG_CRC32_SLICEBY4=y
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_BCH=y
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
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
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
# CONFIG_FORCE_NR_CPUS is not set
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
CONFIG_FONTS=y
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
# CONFIG_FONT_6x11 is not set
CONFIG_FONT_7x14=y
# CONFIG_FONT_PEARL_8x8 is not set
# CONFIG_FONT_ACORN_8x8 is not set
# CONFIG_FONT_MINI_4x6 is not set
# CONFIG_FONT_6x10 is not set
CONFIG_FONT_10x18=y
# CONFIG_FONT_SUN8x16 is not set
CONFIG_FONT_SUN12x22=y
# CONFIG_FONT_TER16x32 is not set
CONFIG_FONT_6x8=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_REF_TRACKER=y
CONFIG_SBITMAP=y
# end of Library routines

CONFIG_ASN1_ENCODER=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
# CONFIG_DEBUG_MISC is not set

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
# CONFIG_DEBUG_INFO_REDUCED is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_DEBUG_INFO_BTF=y
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_BTF_TAG=y
CONFIG_DEBUG_INFO_BTF_MODULES=y
# CONFIG_MODULE_ALLOW_BTF_MISMATCH is not set
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_OBJTOOL=y
CONFIG_NOINSTR_VALIDATION=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
# CONFIG_MAGIC_SYSRQ_SERIAL is not set
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
CONFIG_DEBUG_FS_DISALLOW_MOUNT=y
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
CONFIG_NET_DEV_REFCNT_TRACKER=y
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
CONFIG_PAGE_OWNER=y
# CONFIG_PAGE_TABLE_CHECK is not set
CONFIG_PAGE_POISONING=y
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_VM_IRQSOFF=y
CONFIG_DEBUG_VM=y
# CONFIG_DEBUG_VM_MAPLE_TREE is not set
CONFIG_DEBUG_VM_RB=y
# CONFIG_DEBUG_VM_PGFLAGS is not set
CONFIG_DEBUG_VM_PGTABLE=y
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
# CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_KASAN_SW_TAGS=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
# CONFIG_KASAN_OUTLINE is not set
CONFIG_KASAN_INLINE=y
# CONFIG_KASAN_STACK is not set
CONFIG_KASAN_VMALLOC=y
# CONFIG_KASAN_MODULE_TEST is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
CONFIG_HAVE_ARCH_KMSAN=y
CONFIG_HAVE_KMSAN_COMPILER=y
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
CONFIG_CSD_LOCK_WAIT_DEBUG=y
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACE_IRQFLAGS_NMI=y
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
CONFIG_DEBUG_NOTIFIERS=y
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_PROVE_RCU_LIST is not set
CONFIG_TORTURE_TEST=m
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_REF_SCALE_TEST=m
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
CONFIG_CPU_HOTPLUG_STATE_CONTROL=y
CONFIG_LATENCYTOP=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
# CONFIG_FUNCTION_TRACER is not set
# CONFIG_STACK_TRACER is not set
# CONFIG_IRQSOFF_TRACER is not set
# CONFIG_SCHED_TRACER is not set
# CONFIG_HWLAT_TRACER is not set
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
# CONFIG_ENABLE_DEFAULT_TRACERS is not set
# CONFIG_FTRACE_SYSCALLS is not set
# CONFIG_TRACER_SNAPSHOT is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_KPROBE_EVENTS=y
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
# CONFIG_SYNTH_EVENTS is not set
# CONFIG_HIST_TRIGGERS is not set
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
# CONFIG_RING_BUFFER_BENCHMARK is not set
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_RV is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
CONFIG_SAMPLES=y
CONFIG_SAMPLE_AUXDISPLAY=y
# CONFIG_SAMPLE_TRACE_EVENTS is not set
# CONFIG_SAMPLE_TRACE_CUSTOM_EVENTS is not set
# CONFIG_SAMPLE_TRACE_PRINTK is not set
# CONFIG_SAMPLE_TRACE_ARRAY is not set
CONFIG_SAMPLE_KOBJECT=y
# CONFIG_SAMPLE_KPROBES is not set
# CONFIG_SAMPLE_HW_BREAKPOINT is not set
# CONFIG_SAMPLE_KFIFO is not set
# CONFIG_SAMPLE_RPMSG_CLIENT is not set
# CONFIG_SAMPLE_CONFIGFS is not set
# CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB is not set
CONFIG_SAMPLE_WATCHDOG=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
CONFIG_DEBUG_TLBFLUSH=y
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
# CONFIG_IO_DELAY_0X80 is not set
# CONFIG_IO_DELAY_0XED is not set
CONFIG_IO_DELAY_UDELAY=y
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
CONFIG_DEBUG_ENTRY=y
# CONFIG_DEBUG_NMI_SELFTEST is not set
# CONFIG_X86_DEBUG_FPU is not set
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
# CONFIG_FAIL_PAGE_ALLOC is not set
# CONFIG_FAULT_INJECTION_USERCOPY is not set
CONFIG_FAIL_MAKE_REQUEST=y
# CONFIG_FAIL_IO_TIMEOUT is not set
# CONFIG_FAIL_FUTEX is not set
CONFIG_FAULT_INJECTION_DEBUG_FS=y
# CONFIG_FAIL_FUNCTION is not set
CONFIG_FAIL_MMC_REQUEST=y
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_KCOV=y
CONFIG_KCOV_ENABLE_COMPARISONS=y
CONFIG_KCOV_INSTRUMENT_ALL=y
CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
# CONFIG_RUNTIME_TESTING_MENU is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--Q2pkyq/Ly02OquLo--
