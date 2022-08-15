Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3141C04
	for <llvm@lists.linux.dev>; Mon, 15 Aug 2022 14:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660572338; x=1692108338;
  h=date:from:cc:subject:message-id:mime-version;
  bh=XGU5J5T6JBdxhuUJdxM54e1+4MiHnTj89J3aSkbo5tg=;
  b=N+gZwFKeGZdattligmXbjJz5a4mg1jJC/zuRLqC7Nxl6FxhSQKLgNcja
   H9FkCGTmf56K8WVzV3UYuQA18/f7j4+ziDJZS3wbrKdGzg6mMAaUNbnqO
   OZB0KqIwpUNewkmLTDngqInfwe9d4JjKKLyFmLZlZek6pKPwdOuRcxMrn
   ZJ80md52xfzY3u1f7UzhnZBb7WK6HtvK+CAC3wqEFR/rP9O8d1fyOoI5U
   IbULkXq19ghKqM41NPJyL9iH/vpynP5JJiOCayGuSFs1loLc7xeu1vLHj
   PCTS0jt0q9vQoEkg+fnYrIDQ1VMwybGIjfwzSxeSz9qqs8pADl5TOT3ny
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="290717980"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; 
   d="scan'208";a="290717980"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2022 07:05:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; 
   d="scan'208";a="934486752"
Received: from lkp-server02.sh.intel.com (HELO 3d2a4d02a2a9) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2022 07:05:35 -0700
Received: from kbuild by 3d2a4d02a2a9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oNaik-000133-1a;
	Mon, 15 Aug 2022 14:05:34 +0000
Date: Mon, 15 Aug 2022 22:05:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: irqentry_exit+0x6e: call to
 ct_irq_exit() leaves .noinstr.text section
Message-ID: <202208152251.7LE6tNcd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Frederic Weisbecker <frederic@kernel.org>
CC: "Paul E. McKenney" <paulmck@kernel.org>
CC: Nicolas Saenz Julienne <nsaenzju@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   568035b01cfb107af8d2e4bd2fb9aea22cf5b868
commit: 6f0e6c1598b1a3d19fc30db86b6e26d6f881b43d context_tracking: Take IRQ eqs entrypoints over RCU
date:   6 weeks ago
config: x86_64-randconfig-a012-20220815 (https://download.01.org/0day-ci/archive/20220815/202208152251.7LE6tNcd-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 6afcc4a459ead8809a0d6d9b4bf7b64bcc13582b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6f0e6c1598b1a3d19fc30db86b6e26d6f881b43d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6f0e6c1598b1a3d19fc30db86b6e26d6f881b43d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: sync_regs+0x23: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x22: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0xc: call to sev_es_nmi_complete() leaves .noinstr.text section
   vmlinux.o: warning: objtool: default_do_nmi+0x10: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_rdmsrl+0x7: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_wrmsrl+0x7: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x7c5: call to pentium_machine_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_read_and_reset_apf_flags+0x5: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_on+0xa6: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_off+0xa3: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_exit+0x6e: call to ct_irq_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x63: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x30: call to rcu_nmi_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x29: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x1: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_exit+0x10: call to __this_cpu_preempt_check() leaves .noinstr.text section


objdump-func vmlinux.o irqentry_exit:
0000 0000000000006200 <irqentry_exit>:
0000     6200:	f3 0f 1e fa          	endbr64 
0004     6204:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 620b <irqentry_exit+0xb>	6206: R_X86_64_PC32	debug_locks-0x5
000b     620b:	74 14                	je     6221 <irqentry_exit+0x21>
000d     620d:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 6213 <irqentry_exit+0x13>	620f: R_X86_64_PC32	lockdep_recursion-0x4
0013     6213:	85 c0                	test   %eax,%eax
0015     6215:	75 0a                	jne    6221 <irqentry_exit+0x21>
0017     6217:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 621d <irqentry_exit+0x1d>	6219: R_X86_64_PC32	hardirqs_enabled-0x4
001d     621d:	85 c0                	test   %eax,%eax
001f     621f:	75 5b                	jne    627c <irqentry_exit+0x7c>
0021     6221:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 6228 <irqentry_exit+0x28>	6224: R_X86_64_PC32	.bss+0xd5310c
0028     6228:	f6 87 88 00 00 00 03 	testb  $0x3,0x88(%rdi)
002f     622f:	74 05                	je     6236 <irqentry_exit+0x36>
0031     6231:	e9 00 00 00 00       	jmp    6236 <irqentry_exit+0x36>	6232: R_X86_64_PLT32	irqentry_exit_to_user_mode-0x4
0036     6236:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 623d <irqentry_exit+0x3d>	6239: R_X86_64_PC32	.bss+0xd5316c
003d     623d:	f6 87 91 00 00 00 02 	testb  $0x2,0x91(%rdi)
0044     6244:	75 08                	jne    624e <irqentry_exit+0x4e>
0046     6246:	40 f6 c6 01          	test   $0x1,%sil
004a     624a:	75 11                	jne    625d <irqentry_exit+0x5d>
004c     624c:	c3                   	ret    
004d     624d:	cc                   	int3   
004e     624e:	40 f6 c6 01          	test   $0x1,%sil
0052     6252:	75 0e                	jne    6262 <irqentry_exit+0x62>
0054     6254:	90                   	nop
0055     6255:	e8 00 00 00 00       	call   625a <irqentry_exit+0x5a>	6256: R_X86_64_PLT32	trace_hardirqs_on-0x4
005a     625a:	90                   	nop
005b     625b:	c3                   	ret    
005c     625c:	cc                   	int3   
005d     625d:	e9 00 00 00 00       	jmp    6262 <irqentry_exit+0x62>	625e: R_X86_64_PLT32	.text+0x359bfc
0062     6262:	90                   	nop
0063     6263:	e8 00 00 00 00       	call   6268 <irqentry_exit+0x68>	6264: R_X86_64_PLT32	trace_hardirqs_on_prepare-0x4
0068     6268:	e8 00 00 00 00       	call   626d <irqentry_exit+0x6d>	6269: R_X86_64_PLT32	lockdep_hardirqs_on_prepare-0x4
006d     626d:	90                   	nop
006e     626e:	e8 00 00 00 00       	call   6273 <irqentry_exit+0x73>	626f: R_X86_64_PLT32	.text+0x359bfc
0073     6273:	48 8b 3c 24          	mov    (%rsp),%rdi
0077     6277:	e9 00 00 00 00       	jmp    627c <irqentry_exit+0x7c>	6278: R_X86_64_PLT32	lockdep_hardirqs_on-0x4
007c     627c:	90                   	nop
007d     627d:	0f 0b                	ud2    
007f     627f:	90                   	nop
0080     6280:	eb 9f                	jmp    6221 <irqentry_exit+0x21>
0082     6282:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
0091     6291:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
00a0     62a0:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
00af     62af:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
00be     62be:	66 90                	xchg   %ax,%ax

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
