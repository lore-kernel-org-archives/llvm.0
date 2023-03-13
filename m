Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17DF1FAE;
	Mon, 13 Mar 2023 07:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678690863; x=1710226863;
  h=date:from:cc:subject:message-id:mime-version;
  bh=KmZQPokZXrWO8rjVeffx3SPiLztSe/VMZLOt6yYr8h4=;
  b=GrktV+kjMMXtn/79eD/GPCDtMgWEbmG8my2gTHaLci2MUoShZIMkdh/J
   3AvsHri/oHgGEcabKPqvb3E5U2NYiJjKTMX8A7GTLPPAMT5VL7PaiTXsA
   J3Im22kPh6fWiQxL8xVV654DzsdkDPJd+rZeFYFccIx4ca+7fk6PCYJur
   2eTXL+LE+L14Og8uvyKGIJ7IR7M9fZGHlT3udpLJgBThui6lPLFWKkYEJ
   JvPfU84G8eLRhdIffTuaEdyWI+3jMQgjKl0RM6rWO7UQ5JJt+xTAwqCJj
   5IEFp4cuHYDzcb42Ai5xOuDjthYbYz+bf/F7CyvCj2Hgb9e5l55H34iV2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="320930234"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="320930234"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 00:01:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="821832584"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="821832584"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2023 00:01:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbcB3-0005QW-0p;
	Mon, 13 Mar 2023 07:01:01 +0000
Date: Mon, 13 Mar 2023 15:00:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: mce_start+0x6b: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202303131430.1T8ofKqc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@redhat.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Miroslav Benes <mbenes@suse.cz>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eeac8ede17557680855031c6f305ece2378af326
commit: 2bc3dec7055e34c2c2e497f109da6748544c0791 objtool: Don't print parentheses in function addresses
date:   11 months ago
config: x86_64-randconfig-k001-20230313 (https://download.01.org/0day-ci/archive/20230313/202303131430.1T8ofKqc-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2bc3dec7055e34c2c2e497f109da6748544c0791
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2bc3dec7055e34c2c2e497f109da6748544c0791
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303131430.1T8ofKqc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x87: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x4e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack+0xc: call to task_stack_page() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack+0x10: call to cpu_entry_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x4e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x56: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: mce_start+0x6b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x4e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x28: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_enter+0x3d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter+0x1e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_irq_exit+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_exit+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_nmi_enter+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit+0x25: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_irq_enter+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x55: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x62: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o mce_start:
0000 0000000000002250 <mce_start>:
0000     2250:	55                   	push   %rbp
0001     2251:	41 57                	push   %r15
0003     2253:	41 56                	push   %r14
0005     2255:	53                   	push   %rbx
0006     2256:	48 83 ec 10          	sub    $0x10,%rsp
000a     225a:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0013     2263:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
0018     2268:	48 63 05 00 00 00 00 	movslq 0x0(%rip),%rax        # 226f <mce_start+0x1f>	226b: R_X86_64_PC32	mca_cfg+0x8
001f     226f:	48 69 c8 e8 03 00 00 	imul   $0x3e8,%rax,%rcx
0026     2276:	48 89 0c 24          	mov    %rcx,(%rsp)
002a     227a:	48 85 c0             	test   %rax,%rax
002d     227d:	0f 84 e1 00 00 00    	je     2364 <mce_start+0x114>
0033     2283:	49 89 fe             	mov    %rdi,%r14
0036     2286:	8b 07                	mov    (%rdi),%eax
0038     2288:	f0 01 05 00 00 00 00 	lock add %eax,0x0(%rip)        # 228f <mce_start+0x3f>	228b: R_X86_64_PC32	.bss+0x3b68
003f     228f:	41 bf 01 00 00 00    	mov    $0x1,%r15d
0045     2295:	f0 44 0f c1 3d 00 00 00 00 	lock xadd %r15d,0x0(%rip)        # 229e <mce_start+0x4e>	229a: R_X86_64_PC32	.bss+0x3b6c
004e     229e:	65 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%ebx        # 22a5 <mce_start+0x55>	22a1: R_X86_64_PC32	cpu_number-0x4
0055     22a5:	31 ed                	xor    %ebp,%ebp
0057     22a7:	83 fb 40             	cmp    $0x40,%ebx
005a     22aa:	40 0f 93 c5          	setae  %bpl
005e     22ae:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	22b1: R_X86_64_32S	_ftrace_annotated_branch+0x8a00
0065     22b5:	89 ee                	mov    %ebp,%esi
0067     22b7:	31 d2                	xor    %edx,%edx
0069     22b9:	31 c9                	xor    %ecx,%ecx
006b     22bb:	e8 00 00 00 00       	call   22c0 <mce_start+0x70>	22bc: R_X86_64_PLT32	ftrace_likely_update-0x4
0070     22c0:	83 fb 40             	cmp    $0x40,%ebx
0073     22c3:	72 04                	jb     22c9 <mce_start+0x79>
0075     22c5:	90                   	nop
0076     22c6:	0f 0b                	ud2
0078     22c8:	90                   	nop
0079     22c9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	22cc: R_X86_64_32S	_ftrace_annotated_branch+0x8a30
0080     22d0:	89 ee                	mov    %ebp,%esi
0082     22d2:	31 d2                	xor    %edx,%edx
0084     22d4:	31 c9                	xor    %ecx,%ecx
0086     22d6:	e8 00 00 00 00       	call   22db <mce_start+0x8b>	22d7: R_X86_64_PLT32	ftrace_likely_update-0x4
008b     22db:	89 d8                	mov    %ebx,%eax
008d     22dd:	f0 48 0f b3 05 00 00 00 00 	lock btr %rax,0x0(%rip)        # 22e6 <mce_start+0x96>	22e2: R_X86_64_PC32	.data+0x1dc94
0096     22e6:	90                   	nop
0097     22e7:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 22ed <mce_start+0x9d>	22e9: R_X86_64_PC32	.bss+0x3b6c
009d     22ed:	e8 00 00 00 00       	call   22f2 <mce_start+0xa2>	22ee: R_X86_64_PLT32	.text+0x45ef8
00a2     22f2:	39 c3                	cmp    %eax,%ebx
00a4     22f4:	74 2f                	je     2325 <mce_start+0xd5>
00a6     22f6:	48 89 e5             	mov    %rsp,%rbp
00a9     22f9:	48 89 ef             	mov    %rbp,%rdi
00ac     22fc:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	22ff: R_X86_64_32S	.rodata.str1.1+0x8987c
00b3     2303:	e8 a5 02 00 00       	call   25ad <mce_timed_out>
00b8     2308:	85 c0                	test   %eax,%eax
00ba     230a:	75 5f                	jne    236b <mce_start+0x11b>
00bc     230c:	bf f4 01 00 00       	mov    $0x1f4,%edi
00c1     2311:	e8 00 00 00 00       	call   2316 <mce_start+0xc6>	2312: R_X86_64_PLT32	__const_udelay-0x4
00c6     2316:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 231c <mce_start+0xcc>	2318: R_X86_64_PC32	.bss+0x3b6c
00cc     231c:	e8 00 00 00 00       	call   2321 <mce_start+0xd1>	231d: R_X86_64_PLT32	.text+0x45ef8
00d1     2321:	39 c3                	cmp    %eax,%ebx
00d3     2323:	75 d4                	jne    22f9 <mce_start+0xa9>
00d5     2325:	41 8d 6f 01          	lea    0x1(%r15),%ebp
00d9     2329:	45 85 ff             	test   %r15d,%r15d
00dc     232c:	74 4e                	je     237c <mce_start+0x12c>
00de     232e:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 2334 <mce_start+0xe4>	2330: R_X86_64_PC32	.bss+0x3b70
00e4     2334:	39 e8                	cmp    %ebp,%eax
00e6     2336:	7d 4e                	jge    2386 <mce_start+0x136>
00e8     2338:	48 89 e3             	mov    %rsp,%rbx
00eb     233b:	48 89 df             	mov    %rbx,%rdi
00ee     233e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2341: R_X86_64_32S	.rodata.str1.1+0x79b3
00f5     2345:	e8 63 02 00 00       	call   25ad <mce_timed_out>
00fa     234a:	85 c0                	test   %eax,%eax
00fc     234c:	75 1d                	jne    236b <mce_start+0x11b>
00fe     234e:	bf f4 01 00 00       	mov    $0x1f4,%edi
0103     2353:	e8 00 00 00 00       	call   2358 <mce_start+0x108>	2354: R_X86_64_PLT32	__const_udelay-0x4
0108     2358:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 235e <mce_start+0x10e>	235a: R_X86_64_PC32	.bss+0x3b70
010e     235e:	39 e8                	cmp    %ebp,%eax
0110     2360:	7c d9                	jl     233b <mce_start+0xeb>
0112     2362:	eb 22                	jmp    2386 <mce_start+0x136>
0114     2364:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
0119     2369:	eb 25                	jmp    2390 <mce_start+0x140>
011b     236b:	c7 05 00 00 00 00 00 00 00 00 	movl   $0x0,0x0(%rip)        # 2375 <mce_start+0x125>	236d: R_X86_64_PC32	.bss+0x3b64
0125     2375:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
012a     237a:	eb 13                	jmp    238f <mce_start+0x13f>
012c     237c:	c7 05 00 00 00 00 01 00 00 00 	movl   $0x1,0x0(%rip)        # 2386 <mce_start+0x136>	237e: R_X86_64_PC32	.bss+0x3b6c
0136     2386:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 238c <mce_start+0x13c>	2388: R_X86_64_PC32	.bss+0x3b68
013c     238c:	41 89 06             	mov    %eax,(%r14)
013f     238f:	90                   	nop
0140     2390:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0149     2399:	48 3b 44 24 08       	cmp    0x8(%rsp),%rax
014e     239e:	75 0d                	jne    23ad <mce_start+0x15d>
0150     23a0:	89 e8                	mov    %ebp,%eax
0152     23a2:	48 83 c4 10          	add    $0x10,%rsp
0156     23a6:	5b                   	pop    %rbx
0157     23a7:	41 5e                	pop    %r14
0159     23a9:	41 5f                	pop    %r15
015b     23ab:	5d                   	pop    %rbp
015c     23ac:	c3                   	ret
015d     23ad:	e8 00 00 00 00       	call   23b2 <mce_end>	23ae: R_X86_64_PLT32	__stack_chk_fail-0x4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
