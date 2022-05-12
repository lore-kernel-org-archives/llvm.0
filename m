Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0961C33FB
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 19:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652384691; x=1683920691;
  h=date:from:cc:subject:message-id:mime-version;
  bh=otmMAyzQcL2fOqGoDL2m5hNAcsXvAkWzfDxmNB9yaqE=;
  b=icdl6IH2gJeG9hSd1iVLtzvEVUnfZu2Xsd35yG+pjCWmjgkN809OxH2l
   BKSl9HTC+poNvxBdt1B0dQqHrArlUPItfHEW+NbuIh9Y2/V/VR9FI9Ka3
   Mo0SdbfLC4Cv7Wsf8LF6qVGVY7ibyY7poz1IautqUV1p+C1tjVSkoGTWi
   kZkOUUuHKinAJaO/s4UyseNMQRg0Dqgu/5OMbIX5T9pAjpVOIbSQNXkOP
   3kYYl8O/sX0kGyxSRA4WBkiCPajd7kfICf1BTEOu7xHePA9e4e0YDLNjJ
   SXUlaaD4uQVNbqD1OMD7DHG7/W1Vx+7CFyef9Yg5orUOzR5E51ZrroH/a
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="257664600"
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
   d="scan'208";a="257664600"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 12:44:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
   d="scan'208";a="739843166"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 May 2022 12:44:47 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npEjv-000Kre-Av;
	Thu, 12 May 2022 19:44:47 +0000
Date: Fri, 13 May 2022 03:43:53 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [frederic-dynticks:rcu/context-tracking-v2 11/21] vmlinux.o:
 warning: objtool: irqentry_exit()+0x7f: call to ct_irq_exit() leaves
 .noinstr.text section
Message-ID: <202205130320.YdNwURYC-lkp@intel.com>
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
TO: Frederic Weisbecker <frederic@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git rcu/context-tracking-v2
head:   0364ddb8830db4d4b78f7bfd9344e12d22e9cd32
commit: 8b2cc5b380c41378648f60f114cc088d109f7de3 [11/21] context_tracking: Take IRQ eqs entrypoints over RCU
config: x86_64-randconfig-a004-20220509 (https://download.01.org/0day-ci/archive/20220513/202205130320.YdNwURYC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git/commit/?id=8b2cc5b380c41378648f60f114cc088d109f7de3
        git remote add frederic-dynticks https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
        git fetch --no-tags frederic-dynticks rcu/context-tracking-v2
        git checkout 8b2cc5b380c41378648f60f114cc088d109f7de3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_syscall_64()+0x1a: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_syscall_32()+0x34: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x32: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sync_regs()+0x1f: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x2f: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack()+0x13: call to task_stack_page() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack()+0x9: call to cpu_entry_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi()+0x6: call to sev_es_nmi_complete() leaves .noinstr.text section
   vmlinux.o: warning: objtool: default_do_nmi()+0x10: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_rdmsrl()+0x3: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_wrmsrl()+0x7: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check()+0x7dd: call to pentium_machine_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_read_and_reset_apf_flags()+0x1: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_page_fault()+0x6e: call to __kasan_check_read() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_on()+0xa0: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_off()+0x9d: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_exit()+0x7f: call to ct_irq_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter()+0x5f: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit()+0x34: call to rcu_nmi_exit() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
