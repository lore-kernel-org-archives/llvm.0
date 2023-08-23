Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72316187E;
	Wed, 23 Aug 2023 04:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692765684; x=1724301684;
  h=date:from:cc:subject:message-id:mime-version;
  bh=bUbe6Hsw/84h5OwrnJ0gpPSk4aQuXwiwR4q8pOX7Exk=;
  b=YDLm6969ejepUXgEzeZabkCXarQ2GT2U8Iq8mbmvpWmz447XNDBqjZSq
   xCTViQl9H95hI60VzLdZznombxFp9Z0UNXaT7jVUOF0VPW/L4jx9D0IU+
   yJUTvRch8XUZMLk3WMk4e3fkRJzPJba347dbCxJ9eB68JBpdQabB+QbjD
   OLFHgruXxBVWnDMB31LrSUEJ624U20j3I/L8O/Yjv/AOmojFCtxr9WRmo
   Q3eLAEANkdSoQpka/f3y10+NA+xq1bbFka2QR7XHtvX2SjoKW1Mlzr4LY
   T+Wjx+bPbdKJEqVTW1g5lasnsTSeIMmWVD4ebGRZJCkK8xFQP8850L9Wf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="460429472"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="460429472"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 21:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="739603782"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="739603782"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 22 Aug 2023 21:41:20 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYfgF-0000qs-13;
	Wed, 23 Aug 2023 04:41:19 +0000
Date: Wed, 23 Aug 2023 12:40:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-6.1.y 4237/8698] vmlinux.o: warning: objtool:
 do_pre_smp_initcalls+0xab: unreachable instruction
Message-ID: <202308231204.11IHcprF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: "Steven Rostedt (Google)" <rostedt@goodmis.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
head:   6c44e13dc284f7f4db17706ca48fd016d6b3d49a
commit: c8f31c1a0b7cf1024832980e4629b97c2aac1b42 [4237/8698] tracing: Make tracepoint lockdep check actually test something
config: x86_64-randconfig-015-20230821 (https://download.01.org/0day-ci/archive/20230823/202308231204.11IHcprF-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231204.11IHcprF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231204.11IHcprF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_pre_smp_initcalls+0xab: unreachable instruction


objdump-func vmlinux.o do_pre_smp_initcalls:
0000 00000000000025e6 <do_pre_smp_initcalls>:
0000     25e6:	41 57                	push   %r15
0002     25e8:	41 56                	push   %r14
0004     25ea:	53                   	push   %rbx
0005     25eb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	25ee: R_X86_64_32S	__tracepoint_initcall_level+0x8
000c     25f2:	e8 00 00 00 00       	call   25f7 <do_pre_smp_initcalls+0x11>	25f3: R_X86_64_PLT32	__tsan_volatile_read4-0x4
0011     25f7:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 25fe <do_pre_smp_initcalls+0x18>	25f9: R_X86_64_PC32	__tracepoint_initcall_level+0x3
0018     25fe:	7e 3f                	jle    263f <do_pre_smp_initcalls+0x59>
001a     2600:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 2606 <do_pre_smp_initcalls+0x20>	2602: R_X86_64_PC32	__preempt_count-0x4
0020     2606:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2609: R_X86_64_32S	__tracepoint_initcall_level+0x38
0027     260d:	e8 00 00 00 00       	call   2612 <do_pre_smp_initcalls+0x2c>	260e: R_X86_64_PLT32	__tsan_volatile_read8-0x4
002c     2612:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 2619 <do_pre_smp_initcalls+0x33>	2615: R_X86_64_PC32	__tracepoint_initcall_level+0x34
0033     2619:	48 85 db             	test   %rbx,%rbx
0036     261c:	74 19                	je     2637 <do_pre_smp_initcalls+0x51>
0038     261e:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
003c     2622:	e8 00 00 00 00       	call   2627 <do_pre_smp_initcalls+0x41>	2623: R_X86_64_PLT32	__tsan_read8-0x4
0041     2627:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
0045     262b:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	262e: R_X86_64_32S	.rodata.str1.1+0x3a812
004c     2632:	e8 00 00 00 00       	call   2637 <do_pre_smp_initcalls+0x51>	2633: R_X86_64_PLT32	__SCT__tp_func_initcall_level-0x4
0051     2637:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 263d <do_pre_smp_initcalls+0x57>	2639: R_X86_64_PC32	__preempt_count-0x4
0057     263d:	74 4d                	je     268c <do_pre_smp_initcalls+0xa6>
0059     263f:	e8 00 00 00 00       	call   2644 <do_pre_smp_initcalls+0x5e>	2640: R_X86_64_PLT32	rcu_is_watching-0x4
005e     2644:	84 c0                	test   %al,%al
0060     2646:	74 40                	je     2688 <do_pre_smp_initcalls+0xa2>
0062     2648:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	264b: R_X86_64_32S	__initcall0_start
0069     264f:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	2652: R_X86_64_32S	__initcall_start
0070     2656:	4d 39 f7             	cmp    %r14,%r15
0073     2659:	73 27                	jae    2682 <do_pre_smp_initcalls+0x9c>
0075     265b:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	265e: R_X86_64_32S	__initcall_start
007c     2662:	48 89 df             	mov    %rbx,%rdi
007f     2665:	e8 00 00 00 00       	call   266a <do_pre_smp_initcalls+0x84>	2666: R_X86_64_PLT32	__tsan_read4-0x4
0084     266a:	48 63 3b             	movslq (%rbx),%rdi
0087     266d:	4c 01 ff             	add    %r15,%rdi
008a     2670:	e8 00 00 00 00       	call   2675 <do_pre_smp_initcalls+0x8f>	2671: R_X86_64_PLT32	do_one_initcall-0x4
008f     2675:	48 83 c3 04          	add    $0x4,%rbx
0093     2679:	49 83 c7 04          	add    $0x4,%r15
0097     267d:	4c 39 f3             	cmp    %r14,%rbx
009a     2680:	72 e0                	jb     2662 <do_pre_smp_initcalls+0x7c>
009c     2682:	5b                   	pop    %rbx
009d     2683:	41 5e                	pop    %r14
009f     2685:	41 5f                	pop    %r15
00a1     2687:	c3                   	ret
00a2     2688:	0f 0b                	ud2
00a4     268a:	eb bc                	jmp    2648 <do_pre_smp_initcalls+0x62>
00a6     268c:	e8 00 00 00 00       	call   2691 <do_pre_smp_initcalls+0xab>	268d: R_X86_64_PLT32	preempt_schedule_notrace_thunk-0x4
00ab     2691:	eb ac                	jmp    263f <do_pre_smp_initcalls+0x59>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
