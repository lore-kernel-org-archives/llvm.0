Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129821FB35;
	Wed, 23 Aug 2023 23:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692831847; x=1724367847;
  h=date:from:cc:subject:message-id:mime-version;
  bh=KTt68IUYHvwEzQZfWcC0BI5uq2Qo8ip4yWRCPM0k1bc=;
  b=ASEuFrDUzabnbnJ0kXeLMZfgpbcULXfUdk0dXoYFhGqjDupGRZCevdhj
   8ZwAxwM2/IZKOR/OwBhY5C+iCWOI3BrSHtGI3oMDQUjQgOBmnk20Pk/Io
   jYxcKM0zqQ9Dkuph6/YBfBrWWs2FHrzOryfQFthoacynd9D36leUpksq+
   mz0uwP7yuv6FS87VDKNqvuzvPTS8n516J9VLmt00kI13st5N9VObTL+/q
   gmQTxcuRfDVmXQ6vAFlmtyKy/HfCDHnHZJoHF1xmQ59vavMvpChofcsEh
   bOW1zmn7jMfdKXBJaDGXPlMSDkqCn0jggwu39PrkYsD8TwWyNluoR6lD+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="359279254"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="359279254"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 16:04:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="739946354"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="739946354"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 23 Aug 2023 16:04:04 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYwtP-0001ZM-25;
	Wed, 23 Aug 2023 23:04:03 +0000
Date: Thu, 24 Aug 2023 07:03:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.15.y 6360/9999] arch/x86/kernel/smp.o: warning:
 objtool: sysvec_reboot()+0x4a: unreachable instruction
Message-ID: <202308240730.0z1y2c4w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   f6f7927ac664ba23447f8dd3c3dfe2f4ee39272f
commit: 54aa76ad5f0148ad54fc7ad42ad5a079bc12efee [6360/9999] x86: Mark stop_this_cpu() __noreturn
config: x86_64-randconfig-002-20230824 (https://download.01.org/0day-ci/archive/20230824/202308240730.0z1y2c4w-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240730.0z1y2c4w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240730.0z1y2c4w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/smp.o: warning: objtool: sysvec_reboot()+0x4a: unreachable instruction


objdump-func vmlinux.o sysvec_reboot:
0000 00000000000024c0 <sysvec_reboot>:
0000     24c0:	55                   	push   %rbp
0001     24c1:	48 89 e5             	mov    %rsp,%rbp
0004     24c4:	41 56                	push   %r14
0006     24c6:	53                   	push   %rbx
0007     24c7:	48 89 fb             	mov    %rdi,%rbx
000a     24ca:	e8 00 00 00 00       	call   24cf <sysvec_reboot+0xf>	24cb: R_X86_64_PLT32	irqentry_enter-0x4
000f     24cf:	90                   	nop
0010     24d0:	f6 83 88 00 00 00 03 	testb  $0x3,0x88(%rbx)
0017     24d7:	75 5a                	jne    2533 <sysvec_reboot+0x73>
0019     24d9:	41 89 c6             	mov    %eax,%r14d
001c     24dc:	65 8a 05 00 00 00 00 	mov    %gs:0x0(%rip),%al        # 24e3 <sysvec_reboot+0x23>	24df: R_X86_64_PC32	hardirq_stack_inuse-0x4
0023     24e3:	84 c0                	test   %al,%al
0025     24e5:	75 4c                	jne    2533 <sysvec_reboot+0x73>
0027     24e7:	65 c6 05 00 00 00 00 01 	movb   $0x1,%gs:0x0(%rip)        # 24ef <sysvec_reboot+0x2f>	24ea: R_X86_64_PC32	hardirq_stack_inuse-0x5
002f     24ef:	65 4c 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%r11        # 24f7 <sysvec_reboot+0x37>	24f3: R_X86_64_PC32	hardirq_stack_ptr-0x4
0037     24f7:	49 89 23             	mov    %rsp,(%r11)
003a     24fa:	4c 89 dc             	mov    %r11,%rsp
003d     24fd:	e8 00 00 00 00       	call   2502 <sysvec_reboot+0x42>	24fe: R_X86_64_PLT32	irq_enter_rcu-0x4
0042     2502:	48 89 df             	mov    %rbx,%rdi
0045     2505:	e8 00 00 00 00       	call   250a <sysvec_reboot+0x4a>	2506: R_X86_64_PLT32	.text+0x88d3c
004a     250a:	e8 00 00 00 00       	call   250f <sysvec_reboot+0x4f>	250b: R_X86_64_PLT32	irq_exit_rcu-0x4
004f     250f:	5c                   	pop    %rsp
0050     2510:	65 c6 05 00 00 00 00 00 	movb   $0x0,%gs:0x0(%rip)        # 2518 <sysvec_reboot+0x58>	2513: R_X86_64_PC32	hardirq_stack_inuse-0x5
0058     2518:	90                   	nop
0059     2519:	41 0f b6 f6          	movzbl %r14b,%esi
005d     251d:	48 89 df             	mov    %rbx,%rdi
0060     2520:	e8 00 00 00 00       	call   2525 <sysvec_reboot+0x65>	2521: R_X86_64_PLT32	irqentry_exit-0x4
0065     2525:	5b                   	pop    %rbx
0066     2526:	41 5e                	pop    %r14
0068     2528:	5d                   	pop    %rbp
0069     2529:	31 c0                	xor    %eax,%eax
006b     252b:	31 ff                	xor    %edi,%edi
006d     252d:	31 f6                	xor    %esi,%esi
006f     252f:	45 31 db             	xor    %r11d,%r11d
0072     2532:	c3                   	ret
0073     2533:	e8 00 00 00 00       	call   2538 <sysvec_reboot+0x78>	2534: R_X86_64_PLT32	irq_enter_rcu-0x4
0078     2538:	e8 00 00 00 00       	call   253d <sysvec_reboot+0x7d>	2539: R_X86_64_PLT32	.text+0x88d3c
007d     253d:	0f 1f 00             	nopl   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
