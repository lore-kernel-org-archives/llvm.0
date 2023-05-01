Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630418C05;
	Mon,  1 May 2023 21:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682977166; x=1714513166;
  h=date:from:cc:subject:message-id:mime-version;
  bh=LzAmLSrCES/WUz/ZJTnFg7SytKP5sGxjmFjvU+3g7As=;
  b=XTJOUu2vbkz6hgkpAeshjzSXgMTdogAFJCynJDGu6x71/kbeIPHluJcl
   VnVNpoBJ9cm1EH2VV8ak5lf28uAlGwl0wFLAgALvoZE5MuU80u6RJ9N37
   43AuT7KCi8cca2BU2ddBtLcmuTkFbQBySRfe8I3ZUJmrdhah/AdPwGTOg
   q9fAZrPnyqmnHE0++5/NqptBttks86T86sLD1nndXiimEok/zsjkDa/Pb
   YLbhDX+yJZJCf+sM3vp6/UgNVB+nb4l7jARrP7vJTW8HQudn9KZlImXos
   B+G7XG7Vx40sMXmfKW5Yk8Efg4vgPvXfnC76o8gRFnjpRL20BEdYbZmDf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="332593833"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="332593833"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 14:39:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="807586132"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="807586132"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 May 2023 14:39:15 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptbEp-0000fJ-06;
	Mon, 01 May 2023 21:39:15 +0000
Date: Tue, 2 May 2023 05:38:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: bmi160_setup_irq() falls through to
 next function bmi160_data_rdy_trigger_set_state()
Message-ID: <202305020511.5BjMPdOi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@redhat.com>
CC: Peter Zijlstra <peterz@infradead.org>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c8c655c34e33544aec9d64b660872ab33c29b5f1
commit: 08feafe8d1958febf3a9733a3d1564d8fc23340e objtool: Fix function fallthrough detection for vmlinux
date:   1 year ago
config: x86_64-randconfig-r014-20230501 (https://download.01.org/0day-ci/archive/20230502/202305020511.5BjMPdOi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=08feafe8d1958febf3a9733a3d1564d8fc23340e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 08feafe8d1958febf3a9733a3d1564d8fc23340e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305020511.5BjMPdOi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: bmi160_setup_irq() falls through to next function bmi160_data_rdy_trigger_set_state()
   vmlinux.o: warning: objtool: do_syscall_64()+0x1e: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_syscall_32()+0x2b: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x29: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sync_regs()+0x23: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x36: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack()+0x10: call to task_stack_page() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack()+0xd: call to cpu_entry_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi()+0xf1: call to __kasan_check_read() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_page_fault()+0x47: call to __kasan_check_read() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
