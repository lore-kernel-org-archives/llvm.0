Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0A710ED
	for <llvm@lists.linux.dev>; Mon, 11 Apr 2022 06:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649657940; x=1681193940;
  h=date:from:cc:subject:message-id:mime-version;
  bh=cFPuLPgbq+t3FTRYzKSbVn88aQSrsEaR0tkVP3l5xLM=;
  b=NxgFfGOLlBGNMyIbgeQm3JROxEIy/q1JXmzeQIdoSOIblzZXoYbnSRgq
   6shkH7zMO7C0969Slw6EuyAWKELzpcVwlWgNoQ14HNlTwTdgmo0uLHUIT
   Kx48rHuxDdrTPzfi3KDWxlhZp09w8P5LrCAL+YUYUnKRovjXlh2chsIwv
   8zhWr644alLSQ9PLYsmpBqyhP8ljkGKWcWu+2Tt/rr+Y5JqZg/M5GJ5l2
   uqqatbTJkBDAPVQ0qwMoJeFMxl5TcNgmMqmXXlWjwcoggxZG7yFAyXY6x
   /bPfAgQ9bsH6azYbPFjmn4C7Hbep3AxzNFRQc8zMG53m5sfnlDAF/OqiB
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="324955610"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; 
   d="scan'208";a="324955610"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2022 23:19:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; 
   d="scan'208";a="723840938"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 10 Apr 2022 23:18:58 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ndnO6-0001bD-9q;
	Mon, 11 Apr 2022 06:18:58 +0000
Date: Mon, 11 Apr 2022 14:18:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: fixup_bad_iret()+0x22: call to
 __this_cpu_preempt_check() leaves .noinstr.text section
Message-ID: <202204111445.ejND1bA0-lkp@intel.com>
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
head:   ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
commit: db2b0c5d7b6f19b3c2cab08c531b65342eb5252b objtool: Support pv_opsindirect calls for noinstr
date:   7 months ago
config: x86_64-randconfig-r005-20220411 (https://download.01.org/0day-ci/archive/20220411/202204111445.ejND1bA0-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 256c6b0ba14e8a7ab6373b61b7193ea8c0a3651c)
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

   vmlinux.o: warning: objtool: do_syscall_64()+0x1a: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sync_regs()+0x20: call to memcpy() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: fixup_bad_iret()+0x22: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack()+0x13: call to task_stack_page() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: in_entry_stack()+0x9: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: exc_nmi()+0x8: call to sev_es_nmi_complete() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: default_do_nmi()+0x10: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_setup()+0x1d: call to memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: mce_rdmsrl()+0x3: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: mce_wrmsrl()+0x3: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check()+0x48: call to mce_gather_info() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: mce_check_crashing_cpu()+0x0: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: kvm_read_and_reset_apf_flags()+0x1: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_page_fault()+0x76: call to __kasan_check_read() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: lockdep_hardirqs_on()+0xb0: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: lockdep_hardirqs_off()+0xad: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: rcu_user_enter()+0x1f: call to rcu_irq_work_resched() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter()+0x0: call to rcu_dynticks_task_trace_enter() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_task_enter()+0x0: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_nmi_enter()+0x53: call to __kasan_check_read() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit()+0xe: call to rcu_dynticks_task_trace_exit() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_nmi_enter()+0x64: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_nmi_exit()+0x3a: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __context_tracking_enter()+0x27: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: context_tracking_recursion_enter()+0x1: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __context_tracking_exit()+0xc: call to __this_cpu_preempt_check() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
