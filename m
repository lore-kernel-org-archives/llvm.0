Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ECA15AA
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 04:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653019777; x=1684555777;
  h=date:from:cc:subject:message-id:mime-version;
  bh=7ASCMkqGN6o7uz8lVArwg1pvc5zUbAyh850Qj4e2Tao=;
  b=LksV62d8l32qsCZvJsoQG/oujjx3/Rkt/miMb1YB/FOkgu7X8k9upaXO
   IhbgbHwrtsuTP5MZpz/4IIUuN+vQsafk5nCTH2E6EXo26PreFzQ00vz5p
   vJtW1VgDac9H59SLLD2dxkrWcE/K7z2WMfFpRCADpyMp+OdcrcW0LcMVU
   PvbcUbtUAUaA0C0Hj91SI+GDQHRTXLlpSuYVWwM+hsfv89MIqsxw+C1Nm
   oqiWe7LlfuQUxOTWaAPS/Nu2HmXzQpIl1FJmG+QgifaJOk3gGXQNa3W+9
   DKKH6KxxH9HmsSLLvHP3wfEgjnH09qCEz9APAWIKdqLJ1xwY0CF8MSrzS
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="254531846"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="254531846"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2022 21:09:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="640133876"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 May 2022 21:09:36 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nrtxH-0004Gx-QZ;
	Fri, 20 May 2022 04:09:35 +0000
Date: Fri, 20 May 2022 12:09:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [peterz-queue:sched/idle 8/9] vmlinux.o: warning: objtool:
 mwait_idle+0x1: call to current_set_polling_and_test() leaves .noinstr.text
 section
Message-ID: <202205201226.CGMDlCpG-lkp@intel.com>
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
commit: 4d63ba9ea8f51cf1b33f10cae352a21e45cbe7c3 [8/9] objtool/idle: Validate __cpuidle code as noinstr
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220520/202205201226.CGMDlCpG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=4d63ba9ea8f51cf1b33f10cae352a21e45cbe7c3
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/idle
        git checkout 4d63ba9ea8f51cf1b33f10cae352a21e45cbe7c3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_syscall_64+0x1a: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_syscall_32+0x26: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __do_fast_syscall_32+0x28: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x21: call to memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: acpi_idle_enter+0x6d: call to wbinvd() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x74: call to wbinvd() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: mwait_idle+0x1: call to current_set_polling_and_test() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: acpi_safe_halt+0x7: call to test_ti_thread_flag() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: io_idle+0x3: call to __inb() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
