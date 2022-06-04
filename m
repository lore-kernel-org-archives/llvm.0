Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525AB1FA2
	for <llvm@lists.linux.dev>; Sat,  4 Jun 2022 22:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654381256; x=1685917256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fwt2bbBsSNkIiHrIhMNlO4PtOFm2jVz2HfiSx4+G4XM=;
  b=huAMEV9r756hMjaGmEgzl6mTGWZK2aqWJ4W/jkIuVNI6l98faqPuuqP9
   yI8zjB7f4gWjvdMppd0S5NI1wZ/l8D9mxF5G0F8961n9QF3Ii46Ja+h/5
   2kpI92ljn3sQx16ai9YTsGx6mcm7olHT15AjYHLyZI4YACBA78UDgCPGC
   SWvTL7+MOlNIawzjvlxTXdzMemZNgXsTbVirs1nvf0KWeaQjBQ4ikUFbf
   V39Y5QK8BG0JZa0uVEoSD45xtPvSX590pbXrWp05K5vNWPypK0j6QiLOi
   E7Lar8clpGvAQXriWjUmPQutZ0Fq/UpwM0VFUdGRctmni9I7Wc7t0xmbX
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10368"; a="274046922"
X-IronPort-AV: E=Sophos;i="5.91,278,1647327600"; 
   d="scan'208";a="274046922"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2022 15:20:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,278,1647327600"; 
   d="scan'208";a="583068626"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Jun 2022 15:20:54 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nxc8b-000BFe-Rz;
	Sat, 04 Jun 2022 22:20:53 +0000
Date: Sun, 5 Jun 2022 06:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [frederic-dynticks:rcu/context-tracking-v4 9/20] ld.lld: error:
 undefined symbol: ct_irq_enter
Message-ID: <202206050636.tuRU0MhR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git rcu/context-tracking-v4
head:   77493b1db618c61dec140cbab830832f77203d69
commit: ede17b80373d0c3e886b3b4d9533f6c12cf1e799 [9/20] context_tracking: Take IRQ eqs entrypoints over RCU
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220605/202206050636.tuRU0MhR-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0a90b72c432d70aae035727ece4ba80ce820f381)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git/commit/?id=ede17b80373d0c3e886b3b4d9533f6c12cf1e799
        git remote add frederic-dynticks https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
        git fetch --no-tags frederic-dynticks rcu/context-tracking-v4
        git checkout ede17b80373d0c3e886b3b4d9533f6c12cf1e799
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_syscall_64()+0x1a: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_syscall_32()+0x26: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x28: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x21: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack()+0xc: call to task_stack_page() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack()+0x9: call to cpu_entry_stack() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_exit()+0x65: call to ct_irq_exit() leaves .noinstr.text section
>> ld.lld: error: undefined symbol: ct_irq_enter
   >>> referenced by softirq.c
   >>> softirq.o:(irq_enter) in archive kernel/built-in.a
--
>> ld.lld: error: undefined symbol: ct_irq_exit
   >>> referenced by softirq.c
   >>> softirq.o:(irq_exit) in archive kernel/built-in.a
   >>> referenced by common.c
   >>> entry/common.o:(irqentry_exit) in archive kernel/built-in.a
   >>> referenced by common.c
   >>> entry/common.o:(irqentry_exit) in archive kernel/built-in.a
--
>> ld.lld: error: undefined symbol: ct_irq_enter_irqson
   >>> referenced by printk.c
   >>> printk/printk.o:(console_unlock) in archive kernel/built-in.a
   >>> referenced by tick-broadcast-hrtimer.c
   >>> time/tick-broadcast-hrtimer.o:(bc_set_next) in archive kernel/built-in.a
   >>> referenced by trace_preemptirq.c
   >>> trace/trace_preemptirq.o:(trace_hardirqs_on) in archive kernel/built-in.a
   >>> referenced 19 more times
--
>> ld.lld: error: undefined symbol: ct_irq_exit_irqson
   >>> referenced by printk.c
   >>> printk/printk.o:(console_unlock) in archive kernel/built-in.a
   >>> referenced by tick-broadcast-hrtimer.c
   >>> time/tick-broadcast-hrtimer.o:(bc_set_next) in archive kernel/built-in.a
   >>> referenced by trace_preemptirq.c
   >>> trace/trace_preemptirq.o:(trace_hardirqs_on) in archive kernel/built-in.a
   >>> referenced 19 more times

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
