Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6687E
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 15:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653059331; x=1684595331;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Vx2AF+DmGtya9EgbHz+ZO08rDcrdgSQU66jRPPp4aW8=;
  b=RJXGyeFTQHEoqy/OwAAVM7i1Y/9WX/bz6cZ+ANVq/s3eGhOX262UnSZD
   B9POBf2iEYVG4ApQ3ctpj6KUz3oNWvigmOqnSx3TDo3XjLDkxUiPmCHw3
   L5Wn2TCQxEwL4+ntaNRh02MASngi+PJVZckodugGfHXya262UHQr9yjAR
   h5uz4l2WCyenQ0n/QlsiZluyHBVbaTMRn/Fp0xctKXURkjw7m/KYtlxAm
   47EckQNGmwUJNIX3GXCMKUb8d6n8CKxjl386liXjee5XS4FNxJsdXuuWY
   4MgbMzV9x7dq9qQft0f0KrSMojFTBLXrbuj6A1Eiv4zwaJdKVvA7Ya7w7
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="335688092"
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; 
   d="scan'208";a="335688092"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2022 08:08:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; 
   d="scan'208";a="674650905"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 20 May 2022 08:08:49 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ns4FE-0004po-KD;
	Fri, 20 May 2022 15:08:48 +0000
Date: Fri, 20 May 2022 23:08:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [peterz-queue:sched/idle 4/9] vmlinux.o: warning: objtool:
 acpi_idle_enter+0x43: call to __this_cpu_preempt_check() leaves
 .noinstr.text section
Message-ID: <202205202307.0FnKmo42-lkp@intel.com>
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
head:   0d249da1c3122b643b87a578c821dfb35c3bb633
commit: 052cc4b07ec6563980544627712a3ea5e08527f4 [4/9] idle: Fix rcu_idle_*() usage
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220520/202205202307.0FnKmo42-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=052cc4b07ec6563980544627712a3ea5e08527f4
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/idle
        git checkout 052cc4b07ec6563980544627712a3ea5e08527f4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: fixup_bad_iret+0x1e: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack+0x9: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x8: call to sev_es_nmi_complete() leaves .noinstr.text section
   vmlinux.o: warning: objtool: default_do_nmi+0x10: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_read_and_reset_apf_flags+0x1: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_on+0xa6: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_off+0xa3: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x63: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x32: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: acpi_idle_enter+0x43: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x6b: call to acpi_idle_do_entry() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_bm+0x175: call to rcu_idle_enter() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
