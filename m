Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959CF1871
	for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 19:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655149920; x=1686685920;
  h=date:from:cc:subject:message-id:mime-version;
  bh=9LSlglj1ZKiP3TVv/Hh4gHkl8bX8MJPGE4L7AqI+jTo=;
  b=VB7h76F/zv4TXk/aG0LPAISW8puXEUpTZDzK+O3+qBfCqr+EW2yW+J6F
   7OdJ9sSwRDA2JwDM3EOl+VKE0SPwkkf8hEuwuEUH3VGn21ONMdi0zlDzh
   wm+ZHWnOYDYoiP4gMtLpU8PwKEcbZhk5AzzMSLFQXrHx+vTEx/P0yNKvf
   h0DsDnwHnYjehb5eg6i9yHkivfKtBGPhesaU9r1vIN/UGHmcjApYW17Jw
   B7399w+vtVXcn0pqYsNlVWelOyDHB6+ni452ZF2RsMeN+4KNmpzBNiG4C
   X44Si1dF6Ets+BB9cqU7I25CvCzTyvh2Abk+dbWXXtMsb2BVcSzqK8xwe
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="258223762"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="258223762"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 12:52:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="673473022"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Jun 2022 12:51:59 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0q6Q-000L5n-Eb;
	Mon, 13 Jun 2022 19:51:58 +0000
Date: Tue, 14 Jun 2022 03:51:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [peterz-queue:sched/idle 14/36] vmlinux.o: warning: objtool:
 acpi_idle_enter+0x62: call to ftrace_likely_update() leaves .noinstr.text
 section
Message-ID: <202206140323.XSb6oFG4-lkp@intel.com>
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
head:   73f85cfb5dcfb0f8a5ef155a7bf0ab08a7930054
commit: ccff49b526b852adac9c6f9a9f5c4b53292b76f2 [14/36] cpuidle: Fix rcu_idle_*() usage
config: x86_64-randconfig-a005-20220613 (https://download.01.org/0day-ci/archive/20220614/202206140323.XSb6oFG4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d378268ead93c85803c270277f0243737b536ae7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=ccff49b526b852adac9c6f9a9f5c4b53292b76f2
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/idle
        git checkout ccff49b526b852adac9c6f9a9f5c4b53292b76f2
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
   vmlinux.o: warning: objtool: rcu_eqs_enter+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter+0x1a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_irq_exit+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_exit+0x38: call to ftrace_likely_update() leaves .noinstr.text section
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
   vmlinux.o: warning: objtool: __context_tracking_enter+0x32: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: acpi_idle_enter+0x62: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x83: call to acpi_idle_do_entry() leaves .noinstr.text section
   vmlinux.o: warning: objtool: crc_pcl+0x7c: missing int3 after indirect jump

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
