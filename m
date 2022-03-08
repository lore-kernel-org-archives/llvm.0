Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235034A8F
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 15:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646752111; x=1678288111;
  h=date:from:cc:subject:message-id:mime-version;
  bh=LxaFwgUl99VC24mjlSRBQXCnl8r0tXEHzjm9ThAqaG4=;
  b=KgUDXtMIlW05O2r/W2zdY/iKMiOrJFkvmHd3XRCgN2UL8VEAvjBhjmhf
   yor43qqqHV0/o/k2DuxvWcEFbX+YT1IEZHOMro4rARS/X7T969ecWy+39
   LkwxShVf82x5OqQkDSCjQ5A9NNmOPDPxJE3xjfwIP7Kc2cc9M00dLj73j
   ifntiiruDSDpLbz0S6A4TctWFLgrNfFsoN4exjU8iTy3WT6Mu3NZ6fGPg
   pyFk4/Iwq5g3o89AeQxj1cfjUt84keX7AW24qh3n3nYZG3zrZ1LOjJp9G
   eHhG6+RghyWVAdRWCnC9mCRwWQdw/bt6NjAA0tKvVLNXcq2wBh5Hzi/It
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="315419518"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="315419518"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 07:08:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="711560406"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 08 Mar 2022 07:08:27 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRbRr-0001aH-1T; Tue, 08 Mar 2022 15:08:27 +0000
Date: Tue, 8 Mar 2022 23:08:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: exc_nmi()+0x8: call to
 sev_es_nmi_complete() leaves .noinstr.text section
Message-ID: <202203082227.UceNCtHT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea4424be16887a37735d6550cfd0611528dbe5d9
commit: db2b0c5d7b6f19b3c2cab08c531b65342eb5252b objtool: Support pv_opsindirect calls for noinstr
date:   6 months ago
config: x86_64-randconfig-r013-20220307 (https://download.01.org/0day-ci/archive/20220308/202203082227.UceNCtHT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=db2b0c5d7b6f19b3c2cab08c531b65342eb5252b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout db2b0c5d7b6f19b3c2cab08c531b65342eb5252b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_syscall_64()+0x4d: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_syscall_32()+0x68: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x68: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: xen_irq_enable()+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive()+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive()+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sync_regs()+0x1f: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x21: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug()+0x74: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack()+0x13: call to task_stack_page() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack()+0x9: call to cpu_entry_stack() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: exc_nmi()+0x8: call to sev_es_nmi_complete() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: default_do_nmi()+0x10: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler()+0x8f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_setup()+0x19: call to memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: mce_rdmsrl()+0x3: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: mce_wrmsrl()+0x3: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check()+0xa9: call to mce_gather_info() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check()+0xa7: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu()+0x17: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: kvm_read_and_reset_apf_flags()+0x1: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: lockdep_hardirqs_on()+0x90: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: lockdep_hardirqs_off()+0x91: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode()+0x8a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode()+0x8f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare()+0x8a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode()+0x8a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit()+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter()+0x4e: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_nmi_exit()+0x34: call to rcu_nmi_exit() leaves .noinstr.text section

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
