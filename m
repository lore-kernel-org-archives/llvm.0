Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92514373;
	Tue, 31 Jan 2023 01:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675126888; x=1706662888;
  h=date:from:cc:subject:message-id:mime-version;
  bh=pysxbRjCL/t+0WjvsCdQAaLrFLOKWbqY/I69wxBG9PY=;
  b=nIHZ3bCb5VQU6IRxiU3JK4jFxnFREvBKJOb8k+Kc1qaasa1OQXCFHUbR
   pKx7oAdCOyG0yauuOkm0qEW8aoC7zP+kRQIqUg4k0mwbN73v3xI8D5ONI
   TXBkzzVhLvl2jnwM/ovgNnn16NVtAcajjtgDsVaOdaishUEegMXVUBQIN
   4ThLuk9WjOknnExtp3dn86pB9ouGl2tBzdONRvJcdkGk6BhTT3K+i3lIo
   d4YDSLKsJeKt08WWmGenPhOtZns7IxQqfXpWkkBbnpdAzEpKpWbXS/Qz5
   HfoMs1cXeLhpYld7ca+nrk8nudN98xjTYrUg0SVA8LFMCT58ym48o/nzA
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="315680718"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="315680718"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 17:01:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="806907823"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="806907823"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2023 17:01:26 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMf1Z-000418-1a;
	Tue, 31 Jan 2023 01:01:25 +0000
Date: Tue, 31 Jan 2023 09:01:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:sched/core-staging 8/10] vmlinux.o: warning: objtool:
 native_sched_clock+0x7c: call to ftrace_likely_update() leaves .noinstr.text
 section
Message-ID: <202301310832.FR4VVfFw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core-staging
head:   464fa8e861277b168333fb5de5d8a4cf609c84c7
commit: fc6d767f6e2b6efed02041f9f71a14d299aea58c [8/10] x86: Mark sched_clock() noinstr
config: x86_64-randconfig-r013-20230130 (https://download.01.org/0day-ci/archive/20230131/202301310832.FR4VVfFw-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=fc6d767f6e2b6efed02041f9f71a14d299aea58c
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/core-staging
        git checkout fc6d767f6e2b6efed02041f9f71a14d299aea58c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ftrace_likely_update+0x67b: call to __stack_chk_fail() with UACCESS enabled
   vmlinux.o: warning: objtool: __asan_memset+0x34: call to __memset() with UACCESS enabled
   vmlinux.o: warning: objtool: __asan_memmove+0x54: call to __memmove() with UACCESS enabled
   vmlinux.o: warning: objtool: __asan_memcpy+0x54: call to __memcpy() with UACCESS enabled
   vmlinux.o: warning: objtool: kvm_spurious_fault+0x1c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x8b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x53: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: native_sched_clock+0x7c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x5a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_start+0x74: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x5a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x28: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0x8c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x42: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x47: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x5a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit_state+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x40: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter_state+0x31: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit+0x3f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter+0x4c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_enter+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_exit+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x2d: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o native_sched_clock:
0000 0000000000002200 <native_sched_clock>:
0000     2200:	f3 0f 1e fa          	endbr64
0004     2204:	55                   	push   %rbp
0005     2205:	41 57                	push   %r15
0007     2207:	41 56                	push   %r14
0009     2209:	41 55                	push   %r13
000b     220b:	41 54                	push   %r12
000d     220d:	53                   	push   %rbx
000e     220e:	48 83 ec 20          	sub    $0x20,%rsp
0012     2212:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
001b     221b:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0020     2220:	e9 d4 00 00 00       	jmp    22f9 <native_sched_clock+0xf9>
0025     2225:	0f 31                	rdtsc
0027     2227:	48 89 04 24          	mov    %rax,(%rsp)
002b     222b:	49 89 d6             	mov    %rdx,%r14
002e     222e:	49 c1 e6 20          	shl    $0x20,%r14
0032     2232:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 2239 <native_sched_clock+0x39>	2235: R_X86_64_PC32	pcpu_hot+0x4
0039     2239:	65 8b 2d 00 00 00 00 	mov    %gs:0x0(%rip),%ebp        # 2240 <native_sched_clock+0x40>	223c: R_X86_64_PC32	.data..percpu..shared_aligned+0x5c
0040     2240:	89 e8                	mov    %ebp,%eax
0042     2242:	83 e0 01             	and    $0x1,%eax
0045     2245:	48 c1 e0 04          	shl    $0x4,%rax
0049     2249:	65 4c 8b a0 00 00 00 00 	mov    %gs:0x0(%rax),%r12	224d: R_X86_64_32S	.data..percpu..shared_aligned+0x48
0051     2251:	65 8b 98 00 00 00 00 	mov    %gs:0x0(%rax),%ebx	2254: R_X86_64_32S	.data..percpu..shared_aligned+0x40
0058     2258:	65 44 8b a8 00 00 00 00 	mov    %gs:0x0(%rax),%r13d	225c: R_X86_64_32S	.data..percpu..shared_aligned+0x44
0060     2260:	65 44 8b 3d 00 00 00 00 	mov    %gs:0x0(%rip),%r15d        # 2268 <native_sched_clock+0x68>	2264: R_X86_64_PC32	.data..percpu..shared_aligned+0x5c
0068     2268:	31 f6                	xor    %esi,%esi
006a     226a:	44 39 fd             	cmp    %r15d,%ebp
006d     226d:	40 0f 95 c6          	setne  %sil
0071     2271:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2274: R_X86_64_32S	_ftrace_annotated_branch+0x242d0
0078     2278:	31 d2                	xor    %edx,%edx
007a     227a:	31 c9                	xor    %ecx,%ecx
007c     227c:	e8 00 00 00 00       	call   2281 <native_sched_clock+0x81>	227d: R_X86_64_PLT32	ftrace_likely_update-0x4
0081     2281:	44 39 fd             	cmp    %r15d,%ebp
0084     2284:	75 b3                	jne    2239 <native_sched_clock+0x39>
0086     2286:	4c 0b 34 24          	or     (%rsp),%r14
008a     228a:	89 d8                	mov    %ebx,%eax
008c     228c:	49 f7 e6             	mul    %r14
008f     228f:	49 89 d6             	mov    %rdx,%r14
0092     2292:	49 89 c7             	mov    %rax,%r15
0095     2295:	41 81 fd 80 00 00 00 	cmp    $0x80,%r13d
009c     229c:	73 3e                	jae    22dc <native_sched_clock+0xdc>
009e     229e:	44 89 e9             	mov    %r13d,%ecx
00a1     22a1:	4d 0f ad f7          	shrd   %cl,%r14,%r15
00a5     22a5:	49 d3 ee             	shr    %cl,%r14
00a8     22a8:	41 f6 c5 40          	test   $0x40,%r13b
00ac     22ac:	4d 0f 44 f7          	cmove  %r15,%r14
00b0     22b0:	4d 01 f4             	add    %r14,%r12
00b3     22b3:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 22ba <native_sched_clock+0xba>	22b6: R_X86_64_PC32	pcpu_hot+0x4
00ba     22ba:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
00c3     22c3:	48 3b 44 24 18       	cmp    0x18(%rsp),%rax
00c8     22c8:	75 4d                	jne    2317 <native_sched_clock+0x117>
00ca     22ca:	4c 89 e0             	mov    %r12,%rax
00cd     22cd:	48 83 c4 20          	add    $0x20,%rsp
00d1     22d1:	5b                   	pop    %rbx
00d2     22d2:	41 5c                	pop    %r12
00d4     22d4:	41 5d                	pop    %r13
00d6     22d6:	41 5e                	pop    %r14
00d8     22d8:	41 5f                	pop    %r15
00da     22da:	5d                   	pop    %rbp
00db     22db:	c3                   	ret
00dc     22dc:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
00e1     22e1:	4c 89 3e             	mov    %r15,(%rsi)
00e4     22e4:	4c 89 76 08          	mov    %r14,0x8(%rsi)
00e8     22e8:	44 89 ea             	mov    %r13d,%edx
00eb     22eb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	22ee: R_X86_64_32S	.data+0x68740
00f2     22f2:	e8 00 00 00 00       	call   22f7 <native_sched_clock+0xf7>	22f3: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
00f7     22f7:	eb a5                	jmp    229e <native_sched_clock+0x9e>
00f9     22f9:	f3 0f 1e fa          	endbr64
00fd     22fd:	48 69 05 00 00 00 00 40 42 0f 00 	imul   $0xf4240,0x0(%rip),%rax        # 2308 <native_sched_clock+0x108>	2300: R_X86_64_PC32	jiffies_64-0x8
0108     2308:	49 bc 00 b8 64 d9 05 be f0 ff 	movabs $0xfff0be05d964b800,%r12
0112     2312:	49 01 c4             	add    %rax,%r12
0115     2315:	eb a3                	jmp    22ba <native_sched_clock+0xba>
0117     2317:	e8 00 00 00 00       	call   231c <native_sched_clock+0x11c>	2318: R_X86_64_PLT32	__stack_chk_fail-0x4
011c     231c:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0126     2326:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0130     2330:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
013a     233a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
