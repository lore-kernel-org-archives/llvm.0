Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863054428
	for <llvm@lists.linux.dev>; Tue,  9 Aug 2022 14:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660055512; x=1691591512;
  h=date:from:cc:subject:message-id:mime-version;
  bh=oJMw2NMmWrtRy0aiEbnZdQDUiBjSj4pSFF+2gSioO+M=;
  b=SyWp54pPBIanlPihbO2j3QidfaeSkfIogMbfWxLKaACx+A9dnayhb0PL
   yMfEfpj9QgDx1dJ53bJvu33zHKABDB/m4JgoLRlETRzUJxuFJm0BS7JKe
   zitTk3ePdc+DcrLjKniE66Z18hBzIkUGrgGusj35Z21EHiixBvGBczNI8
   Lgfs4/+8yL70vcxl5/VZYYagoETgxnChJ6jpwHnbX2fPiAOukVO2UWs5h
   s2EbX1QyYW1L8aiayhWYLJ7PibO+PrupjCaJgA4PyQtRn5EzU5GEl32D/
   x0Dr/ZJt/R26wI0ZSTJevz/GvpuGADkcGD0TV3IGuqE659EuWaWECduSB
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="277782047"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="277782047"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 07:31:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="932502974"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Aug 2022 07:31:49 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLQGq-000Mzb-33;
	Tue, 09 Aug 2022 14:31:48 +0000
Date: Tue, 9 Aug 2022 22:31:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: ct_kernel_exit_state+0x27: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202208092257.KAnEeoR1-lkp@intel.com>
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
head:   eb555cb5b794f4e12a9897f3d46d5a72104cd4a7
commit: 171476775d32a40bfebf83250136c19b2e842672 context_tracking: Convert state to atomic_t
date:   5 weeks ago
config: x86_64-randconfig-a014-20220808 (https://download.01.org/0day-ci/archive/20220809/202208092257.KAnEeoR1-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
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

   vmlinux.o: warning: objtool: kvm_spurious_fault+0x1c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmx_update_host_rsp+0x31: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x1c3: call to do_trace_write_msr() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sync_regs+0x24: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x36: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x56: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0xbe: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x5e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x67: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x5e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x5e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x5f: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_kernel_exit_state+0x27: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x39: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_kernel_enter_state+0x27: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x14: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_kernel_exit+0x46: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_exit+0x5d: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_kernel_enter+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_enter+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_exit+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x53: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_exit+0x3b: call to __kasan_check_read() leaves .noinstr.text section


objdump-func vmlinux.o ct_kernel_exit_state:
0000 0000000000007750 <ct_kernel_exit_state>:
0000     7750:	55                   	push   %rbp
0001     7751:	48 89 e5             	mov    %rsp,%rbp
0004     7754:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	7757: R_X86_64_32S	context_tracking+0x8
000b     775b:	65 48 03 05 00 00 00 00 	add    %gs:0x0(%rip),%rax        # 7763 <ct_kernel_exit_state+0x13>	775f: R_X86_64_PC32	this_cpu_off-0x4
0013     7763:	f0 0f c1 38          	lock xadd %edi,(%rax)
0017     7767:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	776a: R_X86_64_32S	_ftrace_annotated_branch+0x59430
001e     776e:	31 f6                	xor    %esi,%esi
0020     7770:	31 d2                	xor    %edx,%edx
0022     7772:	b9 01 00 00 00       	mov    $0x1,%ecx
0027     7777:	e8 00 00 00 00       	call   777c <ct_kernel_exit_state+0x2c>	7778: R_X86_64_PLT32	ftrace_likely_update-0x4
002c     777c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	777f: R_X86_64_32S	_ftrace_annotated_branch+0x59460
0033     7783:	31 f6                	xor    %esi,%esi
0035     7785:	31 d2                	xor    %edx,%edx
0037     7787:	b9 01 00 00 00       	mov    $0x1,%ecx
003c     778c:	e8 00 00 00 00       	call   7791 <ct_kernel_exit_state+0x41>	778d: R_X86_64_PLT32	ftrace_likely_update-0x4
0041     7791:	5d                   	pop    %rbp
0042     7792:	c3                   	ret    
0043     7793:	66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
