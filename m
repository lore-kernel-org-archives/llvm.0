Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74DC2C80
	for <llvm@lists.linux.dev>; Thu,  2 Dec 2021 21:28:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="260844981"
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; 
   d="scan'208";a="260844981"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2021 13:28:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; 
   d="scan'208";a="513375272"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 02 Dec 2021 13:28:42 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mstdB-000Ghc-Mi; Thu, 02 Dec 2021 21:28:41 +0000
Date: Fri, 3 Dec 2021 05:27:43 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: __sev_get_ghcb()+0x6b: call to memcpy()
 leaves .noinstr.text section
Message-ID: <202112030508.pWtpHhpm-lkp@intel.com>
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
head:   58e1100fdc5990b0cc0d4beaf2562a92e621ac7d
commit: d187f217335dba2b49fc9002aab2004e04acddee x86/sev: Make sure IRQs are disabled while GHCB is active
date:   5 months ago
config: x86_64-buildonly-randconfig-r001-20211202 (https://download.01.org/0day-ci/archive/20211203/202112030508.pWtpHhpm-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b553297ef3ee4dc2119d5429adf3072e90fac38)
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

   vmlinux.o: warning: objtool: do_syscall_64()+0x91: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_syscall_32()+0x9f: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __do_fast_syscall_32()+0xfc: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sync_regs()+0x1f: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vc_switch_off_ist()+0x2d: call to ip_within_syscall_gap() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x1e: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi()+0x14: call to __kasan_check_read() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_setup()+0x95: call to cpuid_eax() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check()+0xde: call to mce_gather_info() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x33: call to __memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __sev_get_ghcb()+0x6b: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __sev_put_ghcb()+0x64: call to __memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: safe_stack_exc_vmm_communication()+0x29: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: match_held_lock()+0xcd: call to rcu_read_lock_any_held() leaves .noinstr.text section
   vmlinux.o: warning: objtool: debug_locks_off()+0x15: call to __kasan_check_write() leaves .noinstr.text section
   kallsyms failure: relative symbol value 0xffffffff0626b000 out of range in relative mode

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
