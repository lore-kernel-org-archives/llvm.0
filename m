Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2341FD9
	for <llvm@lists.linux.dev>; Mon,  4 Apr 2022 01:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649034652; x=1680570652;
  h=date:from:cc:subject:message-id:mime-version;
  bh=fm9mJJxF8Uf5y8u7EyOtwj0Bx/h5vIGSfXTpvoj4Q+Y=;
  b=eOvKfvYbQNxCrC9ujYR5km32XqmxevNCeGRPpeX4av709CItgNKsslx2
   NTsQw0wyB5WAhCQZjWlYvrZ54DNjTtKfYYYODIXugQlOjyNtX3ckdUJI5
   8BrAm4hsqcFJEmjsPzQOI5FnFmXdViWLlW8S9s6AS+hSTIDUJPKP8O0FZ
   fqiuVOZZsuCSSyk9GgHNKFN1n57NAnJV5Ti3UdFYyoKzEOonpI11Hn4YS
   L4c05nyqutxhDerHWiIGofh3Fa5EI4giqL149NKh9VnULgHD1n0Ll/SNx
   f4lxFNjZLFMM7BgvE53wkYDCUpWRVlUop5pPDAaMM8nfSGImzx6+h7tLh
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10306"; a="258001516"
X-IronPort-AV: E=Sophos;i="5.90,233,1643702400"; 
   d="scan'208";a="258001516"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2022 18:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,233,1643702400"; 
   d="scan'208";a="523407551"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Apr 2022 18:10:51 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nbBF4-0001Kg-A3;
	Mon, 04 Apr 2022 01:10:50 +0000
Date: Mon, 4 Apr 2022 09:09:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: irqentry_nmi_exit()+0x37: call to
 rcu_nmi_exit() leaves .noinstr.text section
Message-ID: <202204040946.0gAoEU5j-lkp@intel.com>
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

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
commit: db2b0c5d7b6f19b3c2cab08c531b65342eb5252b objtool: Support pv_opsindirect calls for noinstr
date:   7 months ago
config: x86_64-randconfig-a006-20220404 (https://download.01.org/0day-ci/archive/20220404/202204040946.0gAoEU5j-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
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

   vmlinux.o: warning: objtool: do_syscall_64()+0x18: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_syscall_32()+0x23: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_fast_syscall_32()+0x1d: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x29: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x26: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack()+0x17: call to task_stack_page() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack()+0xd: call to cpu_entry_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi()+0xc: call to sev_es_nmi_complete() leaves .noinstr.text section
   vmlinux.o: warning: objtool: default_do_nmi()+0x17: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_setup()+0x16: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_rdmsrl()+0x7: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_wrmsrl()+0x7: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check()+0x4b: call to mce_gather_info() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check()+0x1a: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_machine_check()+0x1a: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu()+0x15: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_read_and_reset_apf_flags()+0x5: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_on()+0xa5: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_off()+0xa2: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: debug_lockdep_rcu_enabled()+0x26: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode()+0x19: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode()+0x22: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare()+0x19: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exit_to_user_mode()+0x13: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_exit_to_user_mode()+0x33c: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode()+0x19: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit_to_user_mode()+0x1a: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter()+0x16: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit()+0x3c: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter()+0x1c: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_nmi_exit()+0x37: call to rcu_nmi_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __context_tracking_enter()+0x18: call to __tsan_atomic64_fetch_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter()+0x5: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __context_tracking_exit()+0x14: call to __this_cpu_preempt_check() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
