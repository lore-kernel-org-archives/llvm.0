Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62713168
	for <llvm@lists.linux.dev>; Tue,  4 Jan 2022 21:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641331216; x=1672867216;
  h=date:from:cc:subject:message-id:mime-version;
  bh=OhBpi7LyinzcLroU3DAZqwY6tBoNRdV6K6VB+xbcl+8=;
  b=fKBnKyxHARKPMTuG6desVDPABixC6XKZKApzEeVBBMupcHbwbNg9QVuo
   VxOALGFsTA+cVGBzplgfPAdKlGHxjJtzQE6Fn7siYmk7zc+lf3QJshv+3
   BbUGSUSKfm6xFkkhOuxx0djbAhZR0Sqd0+U0pRbiMrgckhq0j2ttGo5Lo
   MPLg0C/t0lFIISd0O11V35oj87xClm8bP8iCUTqW3OCfx+Zy7gTHWfwQy
   76yHiPyBireM6Me++b8G3eajD4F8X08BOlnrrF2aLTXIbOD3BhkbILGYZ
   7as/+9+iWcCifbb9cYk85Q0t61h73BfNZa/vUoIrrQO4+oQ5i5nbgEP97
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="305653298"
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; 
   d="scan'208";a="305653298"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 13:20:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; 
   d="scan'208";a="526205133"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Jan 2022 13:20:13 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n4rE5-000Fsi-7g; Tue, 04 Jan 2022 21:20:13 +0000
Date: Wed, 5 Jan 2022 05:20:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: __sev_get_ghcb()+0x2f: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202201050511.sxfEndNA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Joerg Roedel <jroedel@suse.de>
CC: Borislav Petkov <bp@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c9e6606c7fe92b50a02ce51dda82586ebdf99b48
commit: d187f217335dba2b49fc9002aab2004e04acddee x86/sev: Make sure IRQs are disabled while GHCB is active
date:   7 months ago
config: x86_64-buildonly-randconfig-r003-20220102 (https://download.01.org/0day-ci/archive/20220105/202201050511.sxfEndNA-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c054402170cd8466683a20385befc0523aba3359)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d187f217335dba2b49fc9002aab2004e04acddee
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d187f217335dba2b49fc9002aab2004e04acddee
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_syscall_64()+0x18: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive()+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive()+0x32: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x21: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug()+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi()+0xf7: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler()+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __sev_es_ist_exit()+0x2c: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __sev_get_ghcb()+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __sev_put_ghcb()+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: safe_stack_exc_vmm_communication()+0x32: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_vmm_communication()+0x5c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: match_held_lock()+0xbd: call to rcu_read_lock_any_held() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode()+0x41: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode()+0x53: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare()+0x41: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode()+0x41: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit()+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter()+0x40: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit()+0x4f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: debug_locks_off()+0x20: call to console_verbose() leaves .noinstr.text section
   kallsyms failure: relative symbol value 0xffffffff09da9000 out of range in relative mode

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
