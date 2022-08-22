Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDE34A3B
	for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 21:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661203990; x=1692739990;
  h=date:from:cc:subject:message-id:mime-version;
  bh=J+nlTsy447ezTHFkY+OKdtjPYFWf9E9HvchcpQLOnWc=;
  b=V9AXWQP8+eYBJpPez7U3gXOb/Img8Xu1+X+4gPjSPKW7z38QIVZOI/UK
   22L8nhXDvTDo+tjctPWGEfrlhSb748Vi7wMEalTnpiJjNwTPLx1nKtGaq
   FEXlMoIsNm4QrOhICzXTzeQ/TkR89Upm7KVdtOtbWgDhgSJtnwvmltp5K
   hi2EbLW576jBNb7MEcVdaARrYAKoVK/dqooIAwI3rS3n1bGNEe+FeQNbn
   TqRZi2Wvba4F/iw1sp4Ki8yeM44vf4XY/d////0hE9+1+ByvxTHTFxDUp
   6vq2CgSH5BI+FnRtlp5KRgOLWHel7gR65r+4RFMJgdH1ILLh9zHtQKjrU
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="355254834"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="355254834"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 14:33:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="559905242"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Aug 2022 14:33:09 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oQF2i-0000jx-2N;
	Mon, 22 Aug 2022 21:33:08 +0000
Date: Tue, 23 Aug 2022 05:32:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: __ct_user_exit+0x61: call to
 __kcsan_check_access() leaves .noinstr.text section
Message-ID: <202208230527.XSWmHSN3-lkp@intel.com>
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
head:   072e51356cd5a4a1c12c1020bc054c99b98333df
commit: 171476775d32a40bfebf83250136c19b2e842672 context_tracking: Convert state to atomic_t
date:   7 weeks ago
config: x86_64-buildonly-randconfig-r004-20220822 (https://download.01.org/0day-ci/archive/20220823/202208230527.XSWmHSN3-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=171476775d32a40bfebf83250136c19b2e842672
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 171476775d32a40bfebf83250136c19b2e842672
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: fixup_bad_iret+0x26: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x47: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x31: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x63: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x58: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x61: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x58: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x58: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x63: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit_state+0x36: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x58: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter_state+0x36: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x14: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit+0x62: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_exit+0x4b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter+0x3d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x53: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x4f: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __ct_user_exit+0x61: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: check_preemption_disabled+0x3d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fault_in_readable+0x19c: call to __tsan_volatile_write1() with UACCESS enabled


objdump-func vmlinux.o __ct_user_exit:
0000 0000000000005310 <__ct_user_exit>:
0000     5310:	55                   	push   %rbp
0001     5311:	48 89 e5             	mov    %rsp,%rbp
0004     5314:	41 57                	push   %r15
0006     5316:	41 56                	push   %r14
0008     5318:	53                   	push   %rbx
0009     5319:	41 89 fe             	mov    %edi,%r14d
000c     531c:	e8 00 00 00 00       	call   5321 <__ct_user_exit+0x11>	531d: R_X86_64_PLT32	debug_smp_processor_id-0x4
0011     5321:	89 c3                	mov    %eax,%ebx
0013     5323:	83 f8 40             	cmp    $0x40,%eax
0016     5326:	0f 83 b9 00 00 00    	jae    53e5 <__ct_user_exit+0xd5>
001c     532c:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	532f: R_X86_64_32S	context_tracking
0023     5333:	4c 03 3c dd 00 00 00 00 	add    0x0(,%rbx,8),%r15	5337: R_X86_64_32S	__per_cpu_offset
002b     533b:	e8 e0 fe ff ff       	call   5220 <context_tracking_recursion_enter>
0030     5340:	84 c0                	test   %al,%al
0032     5342:	0f 84 96 00 00 00    	je     53de <__ct_user_exit+0xce>
0038     5348:	e8 00 00 00 00       	call   534d <__ct_user_exit+0x3d>	5349: R_X86_64_PLT32	debug_smp_processor_id-0x4
003d     534d:	89 c3                	mov    %eax,%ebx
003f     534f:	83 f8 40             	cmp    $0x40,%eax
0042     5352:	0f 83 a1 00 00 00    	jae    53f9 <__ct_user_exit+0xe9>
0048     5358:	48 8b 1c dd 00 00 00 00 	mov    0x0(,%rbx,8),%rbx	535c: R_X86_64_32S	__per_cpu_offset
0050     5360:	48 8d bb 00 00 00 00 	lea    0x0(%rbx),%rdi	5363: R_X86_64_32S	context_tracking+0x8
0057     5367:	be 04 00 00 00       	mov    $0x4,%esi
005c     536c:	ba 04 00 00 00       	mov    $0x4,%edx
0061     5371:	e8 00 00 00 00       	call   5376 <__ct_user_exit+0x66>	5372: R_X86_64_PLT32	__kcsan_check_access-0x4
0066     5376:	8b 83 00 00 00 00    	mov    0x0(%rbx),%eax	5378: R_X86_64_32S	context_tracking+0x8
006c     537c:	83 e0 03             	and    $0x3,%eax
006f     537f:	44 39 f0             	cmp    %r14d,%eax
0072     5382:	75 47                	jne    53cb <__ct_user_exit+0xbb>
0074     5384:	41 80 3f 00          	cmpb   $0x0,(%r15)
0078     5388:	74 29                	je     53b3 <__ct_user_exit+0xa3>
007a     538a:	bf 04 00 00 00       	mov    $0x4,%edi
007f     538f:	44 29 f7             	sub    %r14d,%edi
0082     5392:	e8 19 fb ff ff       	call   4eb0 <ct_kernel_enter>
0087     5397:	41 83 fe 02          	cmp    $0x2,%r14d
008b     539b:	75 2e                	jne    53cb <__ct_user_exit+0xbb>
008d     539d:	90                   	nop
008e     539e:	65 48 8b 3d 00 00 00 00 	mov    %gs:0x0(%rip),%rdi        # 53a6 <__ct_user_exit+0x96>	53a2: R_X86_64_PC32	current_task-0x4
0096     53a6:	e8 00 00 00 00       	call   53ab <__ct_user_exit+0x9b>	53a7: R_X86_64_PLT32	vtime_user_exit-0x4
009b     53ab:	e8 00 00 00 00       	call   53b0 <__ct_user_exit+0xa0>	53ac: R_X86_64_PLT32	.text.trace_user_exit-0x4
00a0     53b0:	90                   	nop
00a1     53b1:	eb 18                	jmp    53cb <__ct_user_exit+0xbb>
00a3     53b3:	49 8d 7f 08          	lea    0x8(%r15),%rdi
00a7     53b7:	be 04 00 00 00       	mov    $0x4,%esi
00ac     53bc:	ba 07 00 00 00       	mov    $0x7,%edx
00b1     53c1:	e8 00 00 00 00       	call   53c6 <__ct_user_exit+0xb6>	53c2: R_X86_64_PLT32	__kcsan_check_access-0x4
00b6     53c6:	f0 45 29 77 08       	lock sub %r14d,0x8(%r15)
00bb     53cb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	53ce: R_X86_64_32S	.rodata.str1.1+0x17d60
00c2     53d2:	e8 00 00 00 00       	call   53d7 <__ct_user_exit+0xc7>	53d3: R_X86_64_PLT32	__this_cpu_preempt_check-0x4
00c7     53d7:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 53de <__ct_user_exit+0xce>	53da: R_X86_64_PC32	context_tracking
00ce     53de:	5b                   	pop    %rbx
00cf     53df:	41 5e                	pop    %r14
00d1     53e1:	41 5f                	pop    %r15
00d3     53e3:	5d                   	pop    %rbp
00d4     53e4:	c3                   	ret
00d5     53e5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	53e8: R_X86_64_32S	.data..Lanon.43b63b4377371cb5bc9e39ed22bbae3e.6
00dc     53ec:	48 89 de             	mov    %rbx,%rsi
00df     53ef:	e8 00 00 00 00       	call   53f4 <__ct_user_exit+0xe4>	53f0: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
00e4     53f4:	e9 33 ff ff ff       	jmp    532c <__ct_user_exit+0x1c>
00e9     53f9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	53fc: R_X86_64_32S	.data..Lanon.43b63b4377371cb5bc9e39ed22bbae3e.15
00f0     5400:	48 89 de             	mov    %rbx,%rsi
00f3     5403:	e8 00 00 00 00       	call   5408 <__ct_user_exit+0xf8>	5404: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
00f8     5408:	e9 4b ff ff ff       	jmp    5358 <__ct_user_exit+0x48>
00fd     540d:	cc                   	int3
00fe     540e:	cc                   	int3
00ff     540f:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
