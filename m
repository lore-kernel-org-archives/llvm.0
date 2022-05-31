Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45E820F1
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 05:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653976259; x=1685512259;
  h=date:from:cc:subject:message-id:mime-version;
  bh=BpltAi1uzCg/16cvbDPNVw2g3wj4RgGxjd4cV1cNqlg=;
  b=MizMsKtvBB3KKY5yrnoer9aGHItX8GNrs3d+nvDujI6289nwTdOHnkRc
   7cdQPrfM2hA0eYz1CMghy1TSbP4XXfAz7kGKQFoLbFqbS884oeLz2PF8m
   zweIU0QTHP8aFRHPaw3c8y/K9Xs71zKRuFZykGNE4hE/wAUgalBJUyapm
   k008qsyHEWGuQyWuJLZ+WtTRe3gvwKCQpLrGuzHDC3yFiFsPU9PH+T8Lz
   CqYq/fLNdwGmnW6j+TP20zgXFl84btPdbqnMn0gF2EL2iGvpqsxbhDgzf
   ppDqoNbhgddBOuxBDgHqZwoKulkEL5UUu1brDKk0HJqdmOYEySJB4omcP
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="273954949"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="273954949"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 22:50:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="644868489"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 May 2022 22:50:58 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvumP-0002Ny-BG;
	Tue, 31 May 2022 05:50:57 +0000
Date: Tue, 31 May 2022 13:50:19 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [peterz-queue:sched/idle 9/10] vmlinux.o: warning: objtool:
 acpi_processor_ffh_cstate_enter+0x2c0: call to ftrace_likely_update() leaves
 .noinstr.text section
Message-ID: <202205311333.bMthbyoD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/idle
head:   e501ffcdad48900629ba842b081d182ea4a6a30a
commit: 19b4944b7061999d8c2d1e9a15b333914f6138fa [9/10] objtool/idle: Validate __cpuidle code as noinstr
config: x86_64-randconfig-a015-20220530 (https://download.01.org/0day-ci/archive/20220531/202205311333.bMthbyoD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0776c48f9b7e69fa447bee57c7c0985caa856be9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=19b4944b7061999d8c2d1e9a15b333914f6138fa
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/idle
        git checkout 19b4944b7061999d8c2d1e9a15b333914f6138fa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x11: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x5c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0xa: call to sev_es_nmi_complete() leaves .noinstr.text section
   vmlinux.o: warning: objtool: default_do_nmi+0x10: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x8f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_rdmsrl+0x3: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_wrmsrl+0x7: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x93: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x17: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_read_and_reset_apf_flags+0x1: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_on+0x9a: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_off+0x97: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0xfe: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x103: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0xfe: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0xfe: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x4d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x2c: call to rcu_nmi_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __context_tracking_enter+0x34: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x2: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __context_tracking_exit+0xc: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter+0x1f: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x28: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x1: call to current_set_polling_and_test() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x2c0: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: cpu_idle_poll+0xb4: call to test_ti_thread_flag() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: intel_idle+0x2bb: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: intel_idle_s2idle+0x28b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_do_entry+0x4: call to perf_lopwr_cb() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_safe_halt+0xe: call to test_ti_thread_flag() leaves .noinstr.text section
   vmlinux.o: warning: objtool: io_idle+0x3: call to __inb() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
