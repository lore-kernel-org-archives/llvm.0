Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E3E2AB2E;
	Fri, 11 Aug 2023 23:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691797208; x=1723333208;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vEXi8lVvqK15v8eV4f8Xl4YWcViUfjJ0IEVqGSZo3wM=;
  b=hIdVLZ/pBP90ImO6wqukwCgfoi+CEHIOepw/9qqnrfOIg7Y22Ioi6tMG
   ZvuzGFbYai6qNLJVVohOe4aYNdGGwqOO9WqREGtVEG4R6a5kp+G8QkUiG
   qGnXo+pJKmpZt/9gdgrAV9KRKbMAZ7wmp2xA5LygU/FD4eLrcjzQJ0Qf9
   BzZ9RYhFh+7IqInT8D64/UdYXa8qwABqqdSDbrRgsqIA2E2k5cKkF9y3P
   uqj3xMEYXb5XC30ERyyGE1SCuvNbo83lFTfcO7Llvnx9wgsfEr/S+7PXm
   N+IplnM3/z5l9tk9oRznADoDWL2xjDl8fsLOnoxkz/oaKY7enPrYtnpPY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="356745673"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="356745673"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 16:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="802848797"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="802848797"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2023 16:39:54 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUbjW-00086Z-0A;
	Fri, 11 Aug 2023 23:39:54 +0000
Date: Sat, 12 Aug 2023 07:39:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [frederic-dynticks:timers/idle 3/10] vmlinux.o: warning: objtool:
 poll_idle+0x21: call to tick_nohz_tick_stopped() leaves .noinstr.text
 section
Message-ID: <202308120736.DKHxncy2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Frederic Weisbecker <frederic@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/idle
head:   b66dd12bb29cca558b9323f2b270a7dae8f56c48
commit: eda30678a7c64885469b2dc17d540f42727c38ea [3/10] cpuidle: Report illegal tick stopped while polling
config: x86_64-randconfig-x002-20230812 (https://download.01.org/0day-ci/archive/20230812/202308120736.DKHxncy2-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120736.DKHxncy2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120736.DKHxncy2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: amd_spi_master_transfer() falls through to next function __cfi_amd_spi_max_transfer_size()
   vmlinux.o: warning: objtool: bmi160_setup_irq() falls through to next function __cfi_bmi160_data_rdy_trigger_set_state()
>> vmlinux.o: warning: objtool: poll_idle+0x21: call to tick_nohz_tick_stopped() leaves .noinstr.text section


objdump-func vmlinux.o poll_idle:
0000 0000000000000735 <poll_idle>:
0000  735:	f3 0f 1e fa          	endbr64
0004  739:	41 57                	push   %r15
0006  73b:	41 56                	push   %r14
0008  73d:	41 55                	push   %r13
000a  73f:	41 54                	push   %r12
000c  741:	53                   	push   %rbx
000d  742:	89 d3                	mov    %edx,%ebx
000f  744:	49 89 f4             	mov    %rsi,%r12
0012  747:	49 89 fe             	mov    %rdi,%r14
0015  74a:	e8 00 00 00 00       	call   74f <poll_idle+0x1a>	74b: R_X86_64_PLT32	local_clock_noinstr-0x4
001a  74f:	49 89 c7             	mov    %rax,%r15
001d  752:	41 80 26 fb          	andb   $0xfb,(%r14)
0021  756:	e8 00 00 00 00       	call   75b <poll_idle+0x26>	757: R_X86_64_PLT32	tick_nohz_tick_stopped-0x4
0026  75b:	84 c0                	test   %al,%al
0028  75d:	0f 85 8c 00 00 00    	jne    7ef <poll_idle+0xba>
002e  763:	fb                   	sti
002f  764:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # 76b <poll_idle+0x36>	767: R_X86_64_PC32	pcpu_hot-0x4
0036  76b:	41 80 4d 02 20       	orb    $0x20,0x2(%r13)
003b  770:	49 f7 45 00 08 00 00 00 	testq  $0x8,0x0(%r13)
0043  778:	75 47                	jne    7c1 <poll_idle+0x8c>
0045  77a:	4c 89 e7             	mov    %r12,%rdi
0048  77d:	4c 89 f6             	mov    %r14,%rsi
004b  780:	e8 00 00 00 00       	call   785 <poll_idle+0x50>	781: R_X86_64_PLT32	cpuidle_poll_time-0x4
0050  785:	49 f7 45 00 08 00 00 00 	testq  $0x8,0x0(%r13)
0058  78d:	75 32                	jne    7c1 <poll_idle+0x8c>
005a  78f:	49 89 c4             	mov    %rax,%r12
005d  792:	31 c9                	xor    %ecx,%ecx
005f  794:	f3 90                	pause
0061  796:	81 f9 c7 00 00 00    	cmp    $0xc7,%ecx
0067  79c:	77 04                	ja     7a2 <poll_idle+0x6d>
0069  79e:	ff c1                	inc    %ecx
006b  7a0:	eb 0f                	jmp    7b1 <poll_idle+0x7c>
006d  7a2:	e8 00 00 00 00       	call   7a7 <poll_idle+0x72>	7a3: R_X86_64_PLT32	local_clock_noinstr-0x4
0072  7a7:	4c 29 f8             	sub    %r15,%rax
0075  7aa:	31 c9                	xor    %ecx,%ecx
0077  7ac:	4c 39 e0             	cmp    %r12,%rax
007a  7af:	77 0c                	ja     7bd <poll_idle+0x88>
007c  7b1:	49 f7 45 00 08 00 00 00 	testq  $0x8,0x0(%r13)
0084  7b9:	74 d9                	je     794 <poll_idle+0x5f>
0086  7bb:	eb 04                	jmp    7c1 <poll_idle+0x8c>
0088  7bd:	41 80 0e 04          	orb    $0x4,(%r14)
008c  7c1:	fa                   	cli
008d  7c2:	41 80 65 02 df       	andb   $0xdf,0x2(%r13)
0092  7c7:	49 f7 45 00 08 00 00 00 	testq  $0x8,0x0(%r13)
009a  7cf:	74 0a                	je     7db <poll_idle+0xa6>
009c  7d1:	81 25 00 00 00 00 ff ff ff 7f 	andl   $0x7fffffff,0x0(%rip)        # 7db <poll_idle+0xa6>	7d3: R_X86_64_PC32	pcpu_hot
00a6  7db:	89 d8                	mov    %ebx,%eax
00a8  7dd:	5b                   	pop    %rbx
00a9  7de:	41 5c                	pop    %r12
00ab  7e0:	41 5d                	pop    %r13
00ad  7e2:	41 5e                	pop    %r14
00af  7e4:	41 5f                	pop    %r15
00b1  7e6:	31 c9                	xor    %ecx,%ecx
00b3  7e8:	31 ff                	xor    %edi,%edi
00b5  7ea:	31 d2                	xor    %edx,%edx
00b7  7ec:	31 f6                	xor    %esi,%esi
00b9  7ee:	c3                   	ret
00ba  7ef:	90                   	nop
00bb  7f0:	0f 0b                	ud2
00bd  7f2:	90                   	nop
00be  7f3:	e9 6b ff ff ff       	jmp    763 <poll_idle+0x2e>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
