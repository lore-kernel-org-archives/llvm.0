Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2618A7B
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 17:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650042387; x=1681578387;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vHdjfjihTMrro5i6AL+GwcKduxd+fymaxrJirFyowEk=;
  b=d9ErOl1KxVIfpUtLr56+2+Og1cvJiSufZNvlYMJ0phRG4XskrrGPySTn
   957xyOxCTG3AxWqwFc2w1Op0L6BXkzpZh/v9pF5RYIXjjs+Rs7YSZigyH
   iAXtBceO8L1AaX2g6ofhIBbJAjLaW94bOis9skD5P2XvWrr5lFF064sRE
   /rYeDzbXuYEo1CJpBX4S5t/K2QpnPpQXsB+NkLvfDI3br6e4M9tnu9+Ds
   6nQjhS5Xw+tYHdX8r7aQ5frh1zAYAkYkuopT4BQ7yHpIxXTe4/OCOR48M
   LNriEcweeCSVrlTU/kmLF/xadT+JXFJXJxp26dqvymCO+cAgEl4iRnZLd
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="288257429"
X-IronPort-AV: E=Sophos;i="5.90,263,1643702400"; 
   d="scan'208";a="288257429"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 10:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,263,1643702400"; 
   d="scan'208";a="553227632"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 Apr 2022 10:06:25 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nfPOq-0002Cr-IL;
	Fri, 15 Apr 2022 17:06:24 +0000
Date: Sat, 16 Apr 2022 01:06:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [jpoimboe:objtool-run 19/35] vmlinux.o: warning: objtool:
 do_syscall_64+0x1a: call to static_key_count() leaves .noinstr.text section
Message-ID: <202204160029.IDcoJXVO-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-run
head:   b8646d8664875281b48db7752d3dc7880b7561e1
commit: f2bec70312f62ef4f1ea21c134d9def627182ad3 [19/35] objtool: Don't print parentheses in function addresses
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220416/202204160029.IDcoJXVO-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=f2bec70312f62ef4f1ea21c134d9def627182ad3
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-run
        git checkout f2bec70312f62ef4f1ea21c134d9def627182ad3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_syscall_64+0x1a: call to static_key_count() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: do_int80_syscall_32+0x27: call to static_key_count() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x29: call to static_key_count() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: fixup_bad_iret+0x21: call to memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: in_task_stack+0xc: call to task_stack_page() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: in_entry_stack+0x9: call to cpu_entry_stack() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: enter_from_user_mode+0x2e: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x36: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x2e: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: exit_to_user_mode+0x26: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: syscall_exit_to_user_mode+0xde: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x2e: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_exit_to_user_mode+0x2d: call to __kcsan_check_access() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
