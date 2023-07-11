Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF089A5C;
	Tue, 11 Jul 2023 16:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689092169; x=1720628169;
  h=date:from:cc:subject:message-id:mime-version;
  bh=DFwyf/65YSxNPN093KGVF5kaAwuTDus5wu+XUZ5k00Y=;
  b=WwG+6Sjiudjg2yKzJv63FsKnl5KHDwhIqkfLF/Nqxi7hisIhEFjhWjP+
   cN7xdzZc/4WvwmNFItxDCxzTodZ6HerMr744qxtBSlQN0wx63hXOUVpTD
   QMKJuGYLPbuHqZEysmMhbBLFuP+t+vIu/vKsiY/hq8fmwyyHCwhW97sEO
   4ubyU8AFHAhlsRerS5tA85EO1/7WXlSQRjF9r3xpH5rGgcaXEEfrHmDaW
   iE5wCf0r7zwzYPLaRFl+Vx9alWSflXynRm9jaNSmB9oaVsGyd2a9dUjrx
   EoTQhqPsYJMx+/ki7Uk0yYMFqljSrhD+AtiWlN0ftvQ9ihF6Wlts5GX7d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="354528091"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="354528091"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 09:16:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="811257101"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="811257101"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Jul 2023 09:16:07 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJG23-0004vh-0E;
	Tue, 11 Jul 2023 16:16:07 +0000
Date: Wed, 12 Jul 2023 00:15:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-4.19.y 6031/6356] drivers/base/regmap/regcache.o:
 warning: objtool: regcache_sync()+0x154: unreachable instruction
Message-ID: <202307120014.FImtQt56-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Mark Brown <broonie@kernel.org>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   94bffc1044d871e2ec89b2621e9a384355832988
commit: 6d32884ddae973af0262022b17d2a7c329ae952b [6031/6356] regmap: cache: Return error in cache sync operations for REGCACHE_NONE
config: x86_64-buildonly-randconfig-r003-20230711 (https://download.01.org/0day-ci/archive/20230712/202307120014.FImtQt56-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120014.FImtQt56-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120014.FImtQt56-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/regmap/regcache.o: warning: objtool: regcache_sync()+0x154: unreachable instruction


objdump-func vmlinux.o regcache_sync:
0000 0000000000a0b740 <regcache_sync>:
0000   a0b740:	55                   	push   %rbp
0001   a0b741:	41 57                	push   %r15
0003   a0b743:	41 56                	push   %r14
0005   a0b745:	41 54                	push   %r12
0007   a0b747:	53                   	push   %rbx
0008   a0b748:	83 bf 10 03 00 00 00 	cmpl   $0x0,0x310(%rdi)
000f   a0b74f:	0f 84 31 01 00 00    	je     a0b886 <regcache_sync+0x146>
0015   a0b755:	49 89 ff             	mov    %rdi,%r15
0018   a0b758:	48 83 bf 08 03 00 00 00 	cmpq   $0x0,0x308(%rdi)
0020   a0b760:	0f 84 36 01 00 00    	je     a0b89c <regcache_sync+0x15c>
0026   a0b766:	49 8b 87 80 00 00 00 	mov    0x80(%r15),%rax
002d   a0b76d:	49 8b bf 90 00 00 00 	mov    0x90(%r15),%rdi
0034   a0b774:	ff d0                	call   *%rax
0036   a0b776:	45 8a b7 25 03 00 00 	mov    0x325(%r15),%r14b
003d   a0b77d:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0042   a0b782:	45 31 e4             	xor    %r12d,%r12d
0045   a0b785:	41 80 bf 40 03 00 00 00 	cmpb   $0x0,0x340(%r15)
004d   a0b78d:	0f 84 b8 00 00 00    	je     a0b84b <regcache_sync+0x10b>
0053   a0b793:	b0 01                	mov    $0x1,%al
0055   a0b795:	41 88 87 10 01 00 00 	mov    %al,0x110(%r15)
005c   a0b79c:	41 88 87 25 03 00 00 	mov    %al,0x325(%r15)
0063   a0b7a3:	41 83 bf 50 03 00 00 00 	cmpl   $0x0,0x350(%r15)
006b   a0b7ab:	74 34                	je     a0b7e1 <regcache_sync+0xa1>
006d   a0b7ad:	bb 04 00 00 00       	mov    $0x4,%ebx
0072   a0b7b2:	31 ed                	xor    %ebp,%ebp
0074   a0b7b4:	49 8b 87 48 03 00 00 	mov    0x348(%r15),%rax
007b   a0b7bb:	4c 89 ff             	mov    %r15,%rdi
007e   a0b7be:	8b 74 18 fc          	mov    -0x4(%rax,%rbx,1),%esi
0082   a0b7c2:	8b 14 18             	mov    (%rax,%rbx,1),%edx
0085   a0b7c5:	e8 00 00 00 00       	call   a0b7ca <regcache_sync+0x8a>	a0b7c6: R_X86_64_PLT32	_regmap_write-0x4
008a   a0b7ca:	85 c0                	test   %eax,%eax
008c   a0b7cc:	75 3b                	jne    a0b809 <regcache_sync+0xc9>
008e   a0b7ce:	48 ff c5             	inc    %rbp
0091   a0b7d1:	41 8b 87 50 03 00 00 	mov    0x350(%r15),%eax
0098   a0b7d8:	48 83 c3 0c          	add    $0xc,%rbx
009c   a0b7dc:	48 39 c5             	cmp    %rax,%rbp
009f   a0b7df:	72 d3                	jb     a0b7b4 <regcache_sync+0x74>
00a1   a0b7e1:	41 c6 87 25 03 00 00 00 	movb   $0x0,0x325(%r15)
00a9   a0b7e9:	4c 89 ff             	mov    %r15,%rdi
00ac   a0b7ec:	49 8b 87 08 03 00 00 	mov    0x308(%r15),%rax
00b3   a0b7f3:	41 8b 97 70 02 00 00 	mov    0x270(%r15),%edx
00ba   a0b7fa:	48 8b 40 38          	mov    0x38(%rax),%rax
00be   a0b7fe:	48 85 c0             	test   %rax,%rax
00c1   a0b801:	74 2f                	je     a0b832 <regcache_sync+0xf2>
00c3   a0b803:	31 f6                	xor    %esi,%esi
00c5   a0b805:	ff d0                	call   *%rax
00c7   a0b807:	eb 30                	jmp    a0b839 <regcache_sync+0xf9>
00c9   a0b809:	49 8b b7 48 03 00 00 	mov    0x348(%r15),%rsi
00d0   a0b810:	41 89 c4             	mov    %eax,%r12d
00d3   a0b813:	49 8b bf a0 00 00 00 	mov    0xa0(%r15),%rdi
00da   a0b81a:	8b 54 1e fc          	mov    -0x4(%rsi,%rbx,1),%edx
00de   a0b81e:	8b 0c 1e             	mov    (%rsi,%rbx,1),%ecx
00e1   a0b821:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	a0b824: R_X86_64_32S	.rodata.str1.1+0x17e72d
00e8   a0b828:	45 89 e0             	mov    %r12d,%r8d
00eb   a0b82b:	e8 00 00 00 00       	call   a0b830 <regcache_sync+0xf0>	a0b82c: R_X86_64_PLT32	_dev_err-0x4
00f0   a0b830:	eb 19                	jmp    a0b84b <regcache_sync+0x10b>
00f2   a0b832:	31 f6                	xor    %esi,%esi
00f4   a0b834:	e8 8e 00 00 00       	call   a0b8c7 <regcache_default_sync>
00f9   a0b839:	41 89 c4             	mov    %eax,%r12d
00fc   a0b83c:	85 c0                	test   %eax,%eax
00fe   a0b83e:	75 0b                	jne    a0b84b <regcache_sync+0x10b>
0100   a0b840:	45 31 e4             	xor    %r12d,%r12d
0103   a0b843:	41 c6 87 40 03 00 00 00 	movb   $0x0,0x340(%r15)
010b   a0b84b:	31 c0                	xor    %eax,%eax
010d   a0b84d:	41 88 87 10 01 00 00 	mov    %al,0x110(%r15)
0114   a0b854:	45 88 b7 25 03 00 00 	mov    %r14b,0x325(%r15)
011b   a0b85b:	41 88 87 41 03 00 00 	mov    %al,0x341(%r15)
0122   a0b862:	49 8b 87 88 00 00 00 	mov    0x88(%r15),%rax
0129   a0b869:	49 8b bf 90 00 00 00 	mov    0x90(%r15),%rdi
0130   a0b870:	ff d0                	call   *%rax
0132   a0b872:	4c 89 ff             	mov    %r15,%rdi
0135   a0b875:	e8 00 00 00 00       	call   a0b87a <regcache_sync+0x13a>	a0b876: R_X86_64_PLT32	regmap_async_complete-0x4
013a   a0b87a:	44 89 e0             	mov    %r12d,%eax
013d   a0b87d:	5b                   	pop    %rbx
013e   a0b87e:	41 5c                	pop    %r12
0140   a0b880:	41 5e                	pop    %r14
0142   a0b882:	41 5f                	pop    %r15
0144   a0b884:	5d                   	pop    %rbp
0145   a0b885:	c3                   	ret
0146   a0b886:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	a0b889: R_X86_64_32S	.rodata.str1.1+0x1048bb
014d   a0b88d:	e8 00 00 00 00       	call   a0b892 <regcache_sync+0x152>	a0b88e: R_X86_64_PLT32	printk-0x4
0152   a0b892:	0f 0b                	ud2
0154   a0b894:	41 bc ea ff ff ff    	mov    $0xffffffea,%r12d
015a   a0b89a:	eb de                	jmp    a0b87a <regcache_sync+0x13a>
015c   a0b89c:	0f 0b                	ud2
015e   a0b89e:	49 8b 87 08 03 00 00 	mov    0x308(%r15),%rax
0165   a0b8a5:	49 8b b7 a0 00 00 00 	mov    0xa0(%r15),%rsi
016c   a0b8ac:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	a0b8af: R_X86_64_32S	__verbose+0x1f1a8
0173   a0b8b3:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	a0b8b6: R_X86_64_32S	.rodata.str1.1+0x1331e2
017a   a0b8ba:	48 8b 08             	mov    (%rax),%rcx
017d   a0b8bd:	e8 00 00 00 00       	call   a0b8c2 <regcache_sync+0x182>	a0b8be: R_X86_64_PLT32	__dynamic_dev_dbg-0x4
0182   a0b8c2:	e9 bb fe ff ff       	jmp    a0b782 <regcache_sync+0x42>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
