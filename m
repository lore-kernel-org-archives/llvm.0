Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041BB20F3;
	Fri,  9 Jun 2023 09:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686302042; x=1717838042;
  h=date:from:cc:subject:message-id:mime-version;
  bh=TKsLDJyzlsWNz6UuLkg9CaH1w33FSKws39hAQHxh2oQ=;
  b=IWe2JDp9AizLNmPHTK6D7AZ8H8VUSh91W1CXQJLWW28dv0n3bw3fS+Wk
   jJIHraY+TO0YocpFuaHTyhlBmCZJJXSOoj6ztlhHrTGGE5+guI5PwhiVW
   4yekDkHxqwhwGTVx0pY7w3sxbWnWR7C3LjE/QGPTpFmXMj6BMFyFDG8lr
   1KcL6qzICqVo2KAr92SsgkVglY5AjBsU+yKWgQB0iNs1oRfuKiKQEB0mA
   wEe26R9ObaX5t3eoqqgyORGQuQZJLKJRw3hJYVy+mi9Y7vLhZnO+eKrPT
   Fabi38YvA+ezqxZfeiAEdCbFhmIN0BqiA8AeliOezCHJOWXmXYEkJ0vOJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="360041045"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="360041045"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 02:14:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="743414116"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="743414116"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Jun 2023 02:14:00 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7YBz-0008su-2J;
	Fri, 09 Jun 2023 09:13:59 +0000
Date: Fri, 9 Jun 2023 17:13:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [tip:sched/core 37/41] vmlinux.o: warning: objtool:
 exc_page_fault+0x125: unreachable instruction
Message-ID: <202306091733.n12PVbEE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   7d0583cf9ec7bf8e5897dc7d3a7059e8fae5464a
commit: 5c5e9a2b25b6a79d4b7a5f2a54d02ef1c36dc35a [37/41] x86/tsc: Provide sched_clock_noinstr()
config: x86_64-randconfig-x065-20230608 (https://download.01.org/0day-ci/archive/20230609/202306091733.n12PVbEE-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=5c5e9a2b25b6a79d4b7a5f2a54d02ef1c36dc35a
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip sched/core
        git checkout 5c5e9a2b25b6a79d4b7a5f2a54d02ef1c36dc35a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091733.n12PVbEE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: exc_page_fault+0x125: unreachable instruction


objdump-func vmlinux.o exc_page_fault:
0000 0000000000002800 <exc_page_fault>:
0000     2800:	55                   	push   %rbp
0001     2801:	41 57                	push   %r15
0003     2803:	41 56                	push   %r14
0005     2805:	53                   	push   %rbx
0006     2806:	50                   	push   %rax
0007     2807:	49 89 f7             	mov    %rsi,%r15
000a     280a:	49 89 fe             	mov    %rdi,%r14
000d     280d:	0f 20 d3             	mov    %cr2,%rbx
0010     2810:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 2817 <exc_page_fault+0x17>	2813: R_X86_64_PC32	pcpu_hot-0x4
0017     2817:	48 8b 80 18 04 00 00 	mov    0x418(%rax),%rax
001e     281e:	0f 18 88 e8 00 00 00 	prefetcht0 0xe8(%rax)
0025     2825:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
002a     282a:	4c 89 f7             	mov    %r14,%rdi
002d     282d:	e8 00 00 00 00       	call   2832 <exc_page_fault+0x32>	282e: R_X86_64_PLT32	irqentry_enter-0x4
0032     2832:	89 c5                	mov    %eax,%ebp
0034     2834:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0039     2839:	48 89 d8             	mov    %rbx,%rax
003c     283c:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
0042     2842:	48 3d 00 00 60 ff    	cmp    $0xffffffffff600000,%rax
0048     2848:	74 0f                	je     2859 <exc_page_fault+0x59>
004a     284a:	48 b8 00 f0 ff ff ff 7f 00 00 	movabs $0x7ffffffff000,%rax
0054     2854:	48 39 d8             	cmp    %rbx,%rax
0057     2857:	76 41                	jbe    289a <exc_page_fault+0x9a>
0059     2859:	4c 89 f7             	mov    %r14,%rdi
005c     285c:	4c 89 fe             	mov    %r15,%rsi
005f     285f:	48 89 da             	mov    %rbx,%rdx
0062     2862:	e8 00 00 00 00       	call   2867 <exc_page_fault+0x67>	2863: R_X86_64_PLT32	.text.do_user_addr_fault-0x4
0067     2867:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)
006f     286f:	9c                   	pushf
0070     2870:	8f 04 24             	pop    (%rsp)
0073     2873:	8b 04 24             	mov    (%rsp),%eax
0076     2876:	fa                   	cli
0077     2877:	0f ba e0 09          	bt     $0x9,%eax
007b     287b:	73 05                	jae    2882 <exc_page_fault+0x82>
007d     287d:	e8 00 00 00 00       	call   2882 <exc_page_fault+0x82>	287e: R_X86_64_PLT32	trace_hardirqs_off-0x4
0082     2882:	40 0f b6 f5          	movzbl %bpl,%esi
0086     2886:	4c 89 f7             	mov    %r14,%rdi
0089     2889:	e8 00 00 00 00       	call   288e <exc_page_fault+0x8e>	288a: R_X86_64_PLT32	irqentry_exit-0x4
008e     288e:	48 83 c4 08          	add    $0x8,%rsp
0092     2892:	5b                   	pop    %rbx
0093     2893:	41 5e                	pop    %r14
0095     2895:	41 5f                	pop    %r15
0097     2897:	5d                   	pop    %rbp
0098     2898:	c3                   	ret
0099     2899:	cc                   	int3
009a     289a:	4c 89 f7             	mov    %r14,%rdi
009d     289d:	4c 89 fe             	mov    %r15,%rsi
00a0     28a0:	48 89 da             	mov    %rbx,%rdx
00a3     28a3:	e8 00 00 00 00       	call   28a8 <exc_page_fault+0xa8>	28a4: R_X86_64_PLT32	.text.do_kern_addr_fault-0x4
00a8     28a8:	eb d8                	jmp    2882 <exc_page_fault+0x82>
00aa     28aa:	4c 89 f7             	mov    %r14,%rdi
00ad     28ad:	89 de                	mov    %ebx,%esi
00af     28af:	e8 00 00 00 00       	call   28b4 <exc_page_fault+0xb4>	28b0: R_X86_64_PLT32	__kvm_handle_async_pf-0x4
00b4     28b4:	84 c0                	test   %al,%al
00b6     28b6:	0f 84 6e ff ff ff    	je     282a <exc_page_fault+0x2a>
00bc     28bc:	eb d0                	jmp    288e <exc_page_fault+0x8e>
00be     28be:	41 f6 86 88 00 00 00 03 	testb  $0x3,0x88(%r14)
00c6     28c6:	74 16                	je     28de <exc_page_fault+0xde>
00c8     28c8:	66 90                	xchg   %ax,%ax
00ca     28ca:	e8 00 00 00 00       	call   28cf <exc_page_fault+0xcf>	28cb: R_X86_64_PLT32	rcu_is_watching-0x4
00cf     28cf:	84 c0                	test   %al,%al
00d1     28d1:	0f 85 62 ff ff ff    	jne    2839 <exc_page_fault+0x39>
00d7     28d7:	0f 0b                	ud2
00d9     28d9:	e9 5b ff ff ff       	jmp    2839 <exc_page_fault+0x39>
00de     28de:	66 90                	xchg   %ax,%ax
00e0     28e0:	e8 00 00 00 00       	call   28e5 <exc_page_fault+0xe5>	28e1: R_X86_64_PLT32	rcu_is_watching-0x4
00e5     28e5:	84 c0                	test   %al,%al
00e7     28e7:	0f 85 4c ff ff ff    	jne    2839 <exc_page_fault+0x39>
00ed     28ed:	0f 0b                	ud2
00ef     28ef:	e9 45 ff ff ff       	jmp    2839 <exc_page_fault+0x39>
00f4     28f4:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 28fa <exc_page_fault+0xfa>	28f6: R_X86_64_PC32	pcpu_hot+0x4
00fa     28fa:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 2901 <exc_page_fault+0x101>	28fd: R_X86_64_PC32	__tracepoint_page_fault_user+0x3c
0101     2901:	48 85 c0             	test   %rax,%rax
0104     2904:	74 12                	je     2918 <exc_page_fault+0x118>
0106     2906:	48 8b 78 08          	mov    0x8(%rax),%rdi
010a     290a:	48 89 de             	mov    %rbx,%rsi
010d     290d:	4c 89 f2             	mov    %r14,%rdx
0110     2910:	4c 89 f9             	mov    %r15,%rcx
0113     2913:	e8 00 00 00 00       	call   2918 <exc_page_fault+0x118>	2914: R_X86_64_PLT32	__SCT__tp_func_page_fault_user-0x4
0118     2918:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 291e <exc_page_fault+0x11e>	291a: R_X86_64_PC32	pcpu_hot+0x4
011e     291e:	75 aa                	jne    28ca <exc_page_fault+0xca>
0120     2920:	e8 00 00 00 00       	call   2925 <exc_page_fault+0x125>	2921: R_X86_64_PLT32	preempt_schedule_notrace_thunk-0x4
0125     2925:	eb a3                	jmp    28ca <exc_page_fault+0xca>
0127     2927:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 292d <exc_page_fault+0x12d>	2929: R_X86_64_PC32	pcpu_hot+0x4
012d     292d:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 2934 <exc_page_fault+0x134>	2930: R_X86_64_PC32	__tracepoint_page_fault_kernel+0x3c
0134     2934:	48 85 c0             	test   %rax,%rax
0137     2937:	74 12                	je     294b <exc_page_fault+0x14b>
0139     2939:	48 8b 78 08          	mov    0x8(%rax),%rdi
013d     293d:	48 89 de             	mov    %rbx,%rsi
0140     2940:	4c 89 f2             	mov    %r14,%rdx
0143     2943:	4c 89 f9             	mov    %r15,%rcx
0146     2946:	e8 00 00 00 00       	call   294b <exc_page_fault+0x14b>	2947: R_X86_64_PLT32	__SCT__tp_func_page_fault_kernel-0x4
014b     294b:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 2951 <exc_page_fault+0x151>	294d: R_X86_64_PC32	pcpu_hot+0x4
0151     2951:	75 8d                	jne    28e0 <exc_page_fault+0xe0>
0153     2953:	e8 00 00 00 00       	call   2958 <exc_page_fault+0x158>	2954: R_X86_64_PLT32	preempt_schedule_notrace_thunk-0x4
0158     2958:	eb 86                	jmp    28e0 <exc_page_fault+0xe0>
015a     295a:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
0169     2969:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
0178     2978:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
