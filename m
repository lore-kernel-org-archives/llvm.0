Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22A37A
	for <llvm@lists.linux.dev>; Sun, 26 Jun 2022 21:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656280431; x=1687816431;
  h=date:from:cc:subject:message-id:mime-version;
  bh=H07viSSgSUXi3HcaTTZSWpyMjNpjTYhzjVg/alZzlKo=;
  b=DUcODkv5mxWM+sH7l+6ah5FRcFzq18Myh6/EsoyXF1/pOuusklyZ6Bw2
   2KVpPXVOJ3EhijtmrV53VW9EKLhhozBm2P/AuKH/DbBmoI/ozJUHEjDfK
   SlX58KQhjoBF/ObNBYrjb3D3+5T8jJ+z6bDtAXKXJYMZiYDSn75Y/6jPZ
   pULpi1U6J/n63C5t0kAJaavp14Uo6ycjWC0VzytXFRzXjeit2ls67moth
   hAIKVTqaPoZ86IM/7OlbJ1TyMK26N5ol4oOAoh72dIDMV5ZrtfqrMXKmQ
   c0Rwvq2LDmiD48SVI3+CKh4JfDoC62GzUXnG7asbRwBUj8yPF/uzZhbdF
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="278859841"
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; 
   d="scan'208";a="278859841"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2022 14:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; 
   d="scan'208";a="916446878"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Jun 2022 14:53:49 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o5aCS-0007rX-RH;
	Sun, 26 Jun 2022 21:53:48 +0000
Date: Mon, 27 Jun 2022 05:53:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: dlfb_ops_write() falls through to next
 function dlfb_ops_setcolreg()
Message-ID: <202206270517.xiP2fV3B-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@redhat.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   893d1eaa56e8ed8ebf0726556454c9e53c0bf047
commit: 08feafe8d1958febf3a9733a3d1564d8fc23340e objtool: Fix function fallthrough detection for vmlinux
date:   10 weeks ago
config: x86_64-buildonly-randconfig-r002-20220627
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b0d6dd3905db145853c7c744ac92d49b00b1fa20)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=08feafe8d1958febf3a9733a3d1564d8fc23340e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 08feafe8d1958febf3a9733a3d1564d8fc23340e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: crc_pcl()+0x7c: missing int3 after indirect jump
   vmlinux.o: warning: objtool: fault_in_readable()+0xe2: call to __tsan_volatile_write1() with UACCESS enabled
>> vmlinux.o: warning: objtool: dlfb_ops_write() falls through to next function dlfb_ops_setcolreg()
>> vmlinux.o: warning: objtool: ufx_ops_write() falls through to next function ufx_ops_setcolreg()
   vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP()+0xd0: relocation to !ENDBR: native_write_cr4+0x4
   vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP()+0xdc: relocation to !ENDBR: native_write_cr4+0x4
>> vmlinux.o: warning: objtool: __startup_64() falls through to next function startup_64_setup_env()
   vmlinux.o: warning: objtool: do_syscall_64()+0x1e: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x33: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack()+0x10: call to task_stack_page() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack()+0x14: call to cpu_entry_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode()+0x2c: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode()+0x34: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare()+0x2c: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exit_to_user_mode()+0x2a: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_exit_to_user_mode()+0x88: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode()+0x2c: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit_to_user_mode()+0x31: call to __kcsan_check_access() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
