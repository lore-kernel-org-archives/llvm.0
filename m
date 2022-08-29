Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D371E2F31
	for <llvm@lists.linux.dev>; Mon, 29 Aug 2022 10:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661768352; x=1693304352;
  h=date:from:cc:subject:message-id:mime-version;
  bh=zDZgGu9G8ypxLq07LKAkCu2gTmoXT0lGHoZ4WA3VW0U=;
  b=GTxrUUVBfEqrlnD4f/EYnsy2Kk3MgxO2nvYDr2quFZD8amrxiF4fjEYV
   GFDTg2WHK0MLKXQRkotvjKyvJ7pgp1iOpG3a3nxRO8NbKvDjCFvTUlWlW
   kXrWxgsSmZxF/NQpEJD9dt3bz7bGArL4w1LCu7n/jd87SyU/IQl5BBS/t
   e41lLhlqRADn4ape2Kkf5cCndxUx70aY6jsnoNm4NP40AmPwTkfwih5ar
   wCBNi3oHwk3PZdBJ9DtQRiSozr4AmQBS6KnJzITzGRJZufMdXBxyY+eVJ
   z6p9K/fS/90fFtCcUQbpXtIKilM12XgO71NvMiqjW2Nn/Wxp83id5xXm/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="356575741"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; 
   d="scan'208";a="356575741"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2022 03:19:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; 
   d="scan'208";a="640887244"
Received: from lkp-server02.sh.intel.com (HELO a13edbbf6006) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 29 Aug 2022 03:19:11 -0700
Received: from kbuild by a13edbbf6006 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oSbrK-00001H-1o;
	Mon, 29 Aug 2022 10:19:10 +0000
Date: Mon, 29 Aug 2022 18:18:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: irqentry_nmi_exit+0x30: call to
 ct_nmi_exit() leaves .noinstr.text section
Message-ID: <202208291810.i2RQogz0-lkp@intel.com>
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

Hi Frederic,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b90cb1053190353cc30f0fef0ef1f378ccc063c5
commit: 493c1822825f00025d6754ec0632990a27edc6f8 context_tracking: Take NMI eqs entrypoints over RCU
date:   8 weeks ago
config: x86_64-randconfig-r024-20220829 (https://download.01.org/0day-ci/archive/20220829/202208291810.i2RQogz0-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=493c1822825f00025d6754ec0632990a27edc6f8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 493c1822825f00025d6754ec0632990a27edc6f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: sync_regs+0x23: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x15: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0xa: call to sev_es_nmi_complete() leaves .noinstr.text section
   vmlinux.o: warning: objtool: default_do_nmi+0x17: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_rdmsrl+0x7: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_wrmsrl+0xc: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x744: call to pentium_machine_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_read_and_reset_apf_flags+0x5: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_on+0x97: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_off+0x99: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x72: call to ct_irq_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x6a: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_nmi_exit+0x30: call to ct_nmi_exit() leaves .noinstr.text section


objdump-func vmlinux.o irqentry_nmi_exit:
0000 0000000000007140 <irqentry_nmi_exit>:
0000     7140:	55                   	push   %rbp
0001     7141:	48 89 e5             	mov    %rsp,%rbp
0004     7144:	53                   	push   %rbx
0005     7145:	89 f3                	mov    %esi,%ebx
0007     7147:	90                   	nop
0008     7148:	e8 00 00 00 00       	call   714d <irqentry_nmi_exit+0xd>	7149: R_X86_64_PLT32	.text+0x3e1afc
000d     714d:	f6 c3 01             	test   $0x1,%bl
0010     7150:	75 13                	jne    7165 <irqentry_nmi_exit+0x25>
0012     7152:	90                   	nop
0013     7153:	e8 00 00 00 00       	call   7158 <irqentry_nmi_exit+0x18>	7154: R_X86_64_PLT32	.text+0x3e1b3c
0018     7158:	e8 00 00 00 00       	call   715d <irqentry_nmi_exit+0x1d>	7159: R_X86_64_PLT32	.text+0x3e1a3c
001d     715d:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 7163 <irqentry_nmi_exit+0x23>	715f: R_X86_64_PC32	hardirq_context-0x4
0023     7163:	eb 24                	jmp    7189 <irqentry_nmi_exit+0x49>
0025     7165:	e8 00 00 00 00       	call   716a <irqentry_nmi_exit+0x2a>	7166: R_X86_64_PLT32	trace_hardirqs_on_prepare-0x4
002a     716a:	e8 00 00 00 00       	call   716f <irqentry_nmi_exit+0x2f>	716b: R_X86_64_PLT32	lockdep_hardirqs_on_prepare-0x4
002f     716f:	90                   	nop
0030     7170:	e8 00 00 00 00       	call   7175 <irqentry_nmi_exit+0x35>	7171: R_X86_64_PLT32	.text+0x3e1b3c
0035     7175:	e8 00 00 00 00       	call   717a <irqentry_nmi_exit+0x3a>	7176: R_X86_64_PLT32	.text+0x3e1a3c
003a     717a:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 7180 <irqentry_nmi_exit+0x40>	717c: R_X86_64_PC32	hardirq_context-0x4
0040     7180:	48 8b 7d 08          	mov    0x8(%rbp),%rdi
0044     7184:	e8 00 00 00 00       	call   7189 <irqentry_nmi_exit+0x49>	7185: R_X86_64_PLT32	lockdep_hardirqs_on-0x4
0049     7189:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 7191 <irqentry_nmi_exit+0x51>	718c: R_X86_64_PC32	.bss+0xd5b0eb
0051     7191:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 7197 <irqentry_nmi_exit+0x57>	7193: R_X86_64_PC32	__preempt_count-0x4
0057     7197:	a9 00 00 f0 00       	test   $0xf00000,%eax
005c     719c:	74 3f                	je     71dd <irqentry_nmi_exit+0x9d>
005e     719e:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 71a6 <irqentry_nmi_exit+0x66>	71a1: R_X86_64_PC32	.bss+0xd5b18b
0066     71a6:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 71ae <irqentry_nmi_exit+0x6e>	71a9: R_X86_64_PC32	.bss+0xd5b193
006e     71ae:	81 05 00 00 00 00 00 00 ef ff 	addl   $0xffef0000,0x0(%rip)        # 71b8 <irqentry_nmi_exit+0x78>	71b0: R_X86_64_PC32	__preempt_count-0x8
0078     71b8:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 71c0 <irqentry_nmi_exit+0x80>	71bb: R_X86_64_PC32	.bss+0xd5b1b3
0080     71c0:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 71c8 <irqentry_nmi_exit+0x88>	71c3: R_X86_64_PC32	.bss+0xd5b11b
0088     71c8:	48 8b 04 25 00 00 00 00 	mov    0x0,%rax	71cc: R_X86_64_32S	current_task
0090     71d0:	81 80 5c 08 00 00 00 00 ff ff 	addl   $0xffff0000,0x85c(%rax)
009a     71da:	5b                   	pop    %rbx
009b     71db:	5d                   	pop    %rbp
009c     71dc:	c3                   	ret
009d     71dd:	90                   	nop
009e     71de:	0f 0b                	ud2
00a0     71e0:	cc                   	int3
00a1     71e1:	cc                   	int3
00a2     71e2:	cc                   	int3
00a3     71e3:	cc                   	int3
00a4     71e4:	cc                   	int3
00a5     71e5:	cc                   	int3
00a6     71e6:	cc                   	int3
00a7     71e7:	cc                   	int3
00a8     71e8:	cc                   	int3
00a9     71e9:	cc                   	int3
00aa     71ea:	cc                   	int3
00ab     71eb:	cc                   	int3
00ac     71ec:	cc                   	int3
00ad     71ed:	cc                   	int3
00ae     71ee:	cc                   	int3
00af     71ef:	cc                   	int3
00b0     71f0:	cc                   	int3
00b1     71f1:	cc                   	int3
00b2     71f2:	cc                   	int3
00b3     71f3:	cc                   	int3
00b4     71f4:	cc                   	int3
00b5     71f5:	cc                   	int3
00b6     71f6:	cc                   	int3
00b7     71f7:	cc                   	int3
00b8     71f8:	cc                   	int3
00b9     71f9:	cc                   	int3
00ba     71fa:	cc                   	int3
00bb     71fb:	cc                   	int3
00bc     71fc:	cc                   	int3
00bd     71fd:	cc                   	int3
00be     71fe:	cc                   	int3
00bf     71ff:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
