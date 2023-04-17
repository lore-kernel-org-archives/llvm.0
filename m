Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4CA1847;
	Mon, 17 Apr 2023 04:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681707342; x=1713243342;
  h=date:from:cc:subject:message-id:mime-version;
  bh=B4w7dvl8XzNTfFc/VooXJvMQLPUQh43Ya3EmOv8Sfy4=;
  b=TPnUR9vTFCk9+nPVQOy5SOe9hlZRzLEQh+JAuRB4+kowxKigIbf0mn51
   4tPn3IZH2gMdDB5oMv+XopeRzboQqIlKTcVrPvvMMCEikeaNZLM4LAEDC
   Ld4i8G2CjrV7RYiaN7ypLSJJiEShtjcqyTC94IGiIoodIc+hL1UMbB6Io
   WWH9T/E7vz7fDZREfy59rYVR1AthM1pE3sLhHzOWKpEZPuZbO02UAe8Dk
   Vm1tpX1Qt7tU85hP1whIhSK3XW+ve5SvK1wzR8GMKblvEuJybF3VNJxlO
   mQ9c+bPeyuwCFk7WsY9LViWx1BMf4peg7SXSPxEhsTat/UnqO6Ag+yENW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="343560221"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="343560221"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 21:55:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="1020278350"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="1020278350"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 16 Apr 2023 21:55:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poGtq-000c8B-0U;
	Mon, 17 Apr 2023 04:55:34 +0000
Date: Mon, 17 Apr 2023 12:55:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: mwait_idle+0x27: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202304171248.xVEyp6SG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@kernel.org>

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6a8f57ae2eb07ab39a6f0ccad60c760743051026
commit: e4df1511e1f4bcaa0d590aa7bbffe8bbbd6dfb49 cpuidle, sched: Remove instrumentation from TIF_{POLLING_NRFLAG,NEED_RESCHED}
date:   3 months ago
config: x86_64-randconfig-a016-20230417 (https://download.01.org/0day-ci/archive/20230417/202304171248.xVEyp6SG-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e4df1511e1f4bcaa0d590aa7bbffe8bbbd6dfb49
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e4df1511e1f4bcaa0d590aa7bbffe8bbbd6dfb49
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304171248.xVEyp6SG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sync_regs+0x1f: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x86: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x4f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0xd4: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x32: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x32: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x32: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x40: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x4f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_exit+0x47: call to __kasan_check_write() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: mwait_idle+0x27: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x10f: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: intel_idle+0xf1: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: intel_idle_s2idle+0x102: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: intel_idle_irq+0xf3: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: intel_idle_ibrs+0xf7: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: intel_idle_xstate+0xf7: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter+0x36: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x3f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: io_idle+0x3: call to __inb() leaves .noinstr.text section


objdump-func vmlinux.o mwait_idle:
0000 0000000000000030 <mwait_idle>:
0000   30:	41 56                	push   %r14
0002   32:	53                   	push   %rbx
0003   33:	4c 8b 34 25 00 00 00 00 	mov    0x0,%r14	37: R_X86_64_32S	pcpu_hot
000b   3b:	41 80 4e 02 20       	orb    $0x20,0x2(%r14)
0010   40:	49 8b 1e             	mov    (%r14),%rbx
0013   43:	83 e3 08             	and    $0x8,%ebx
0016   46:	48 c1 eb 03          	shr    $0x3,%rbx
001a   4a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4d: R_X86_64_32S	_ftrace_annotated_branch+0xa680
0021   51:	89 de                	mov    %ebx,%esi
0023   53:	31 d2                	xor    %edx,%edx
0025   55:	31 c9                	xor    %ecx,%ecx
0027   57:	e8 00 00 00 00       	call   5c <mwait_idle+0x2c>	58: R_X86_64_PLT32	ftrace_likely_update-0x4
002c   5c:	48 85 db             	test   %rbx,%rbx
002f   5f:	75 48                	jne    a9 <mwait_idle+0x79>
0031   61:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 68 <mwait_idle+0x38>	64: R_X86_64_PC32	boot_cpu_data+0x74
0038   68:	a8 80                	test   $0x80,%al
003a   6a:	74 0e                	je     7a <mwait_idle+0x4a>
003c   6c:	0f ae f0             	mfence
003f   6f:	4c 89 f7             	mov    %r14,%rdi
0042   72:	e8 00 00 00 00       	call   77 <mwait_idle+0x47>	73: R_X86_64_PLT32	.text+0x9110c
0047   77:	0f ae f0             	mfence
004a   7a:	4c 89 f7             	mov    %r14,%rdi
004d   7d:	e8 00 00 00 00       	call   82 <mwait_idle+0x52>	7e: R_X86_64_PLT32	.text+0x9111c
0052   82:	49 8b 1e             	mov    (%r14),%rbx
0055   85:	83 e3 08             	and    $0x8,%ebx
0058   88:	48 c1 eb 03          	shr    $0x3,%rbx
005c   8c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8f: R_X86_64_32S	_ftrace_annotated_branch+0xa6b0
0063   93:	89 de                	mov    %ebx,%esi
0065   95:	31 d2                	xor    %edx,%edx
0067   97:	31 c9                	xor    %ecx,%ecx
0069   99:	e8 00 00 00 00       	call   9e <mwait_idle+0x6e>	9a: R_X86_64_PLT32	ftrace_likely_update-0x4
006e   9e:	48 85 db             	test   %rbx,%rbx
0071   a1:	75 06                	jne    a9 <mwait_idle+0x79>
0073   a3:	e8 00 00 00 00       	call   a8 <mwait_idle+0x78>	a4: R_X86_64_PLT32	.text+0x9112c
0078   a8:	fa                   	cli
0079   a9:	41 80 66 02 df       	andb   $0xdf,0x2(%r14)
007e   ae:	5b                   	pop    %rbx
007f   af:	41 5e                	pop    %r14
0081   b1:	c3                   	ret
0082   b2:	cc                   	int3
0083   b3:	cc                   	int3
0084   b4:	cc                   	int3
0085   b5:	cc                   	int3
0086   b6:	cc                   	int3
0087   b7:	cc                   	int3
0088   b8:	cc                   	int3
0089   b9:	cc                   	int3
008a   ba:	cc                   	int3
008b   bb:	cc                   	int3
008c   bc:	cc                   	int3
008d   bd:	cc                   	int3
008e   be:	cc                   	int3
008f   bf:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
