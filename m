Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D36B7A
	for <llvm@lists.linux.dev>; Wed, 15 Jun 2022 10:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655289971; x=1686825971;
  h=date:from:cc:subject:message-id:mime-version;
  bh=/gstC0294uRtV8cObr9EOcdTRPS7YZszPm0RzNVqZGY=;
  b=R9TUF/Sjn4OAiX4+Or1yjTDz41UKCwnDb7i3xHlq65EntG4D5Ij/W+Jf
   HYlmfk8W0h2bDn+tBj8omQJCeY6Lhnxl6p+XoyHZQNK1W3uWiqMjNZ5KB
   QMNkCfhdH4BwASXM5/K3Vmyrd456SIqfDT/GSaz6JDRq7B5XSYnISZvMZ
   3FzBK55gmuCnhA88fkqJ4Ji1UdKhwvP7Yorj2Sg/NDc9gEVU4wz2hJdVv
   /rMTNX9d68Rxlffml4CM3JowJ6RN8SnO85kJ6fRyS5Mb5t1y5zDxxcU+Z
   l3JEJlpbaSZ/rx+uvig7uyd8YMHKLJG1hunMltQWD71awQuofmLZJjNO4
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="277707571"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="277707571"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 03:46:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="911580023"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jun 2022 03:46:09 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1QXI-000Mlb-TO;
	Wed, 15 Jun 2022 10:46:08 +0000
Date: Wed, 15 Jun 2022 18:45:13 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 3500/3718] vmlinux.o: warning: objtool:
 __ct_user_enter+0x32: call to ftrace_likely_update() leaves .noinstr.text
 section
Message-ID: <202206151803.AN0dJvGe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Frederic Weisbecker <frederic@kernel.org>
CC: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6012273897fefb12566580efedee10bb06e5e6ed
commit: 500043d2408cad736b58477bfcaf9da5a2f47322 [3500/3718] context_tracking: Rename __context_tracking_enter/exit() to __ct_user_enter/exit()
config: x86_64-randconfig-a005-20220613 (https://download.01.org/0day-ci/archive/20220615/202206151803.AN0dJvGe-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b0b00432093be9680ed833af642bcafc3ca11586)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=500043d2408cad736b58477bfcaf9da5a2f47322
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 500043d2408cad736b58477bfcaf9da5a2f47322
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x25: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x44: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x53: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_idle_enter+0x14: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_enter+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter+0x1a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_irq_exit+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_idle_exit+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_exit+0x14: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_nmi_enter+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit+0x1a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_irq_enter+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x5c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x62: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x5c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x5c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x42: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x46: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x60: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __ct_user_enter+0x32: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: crc_pcl+0x7c: missing int3 after indirect jump

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
