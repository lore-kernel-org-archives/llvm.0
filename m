Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBD22C80
	for <llvm@lists.linux.dev>; Wed, 29 Dec 2021 18:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640803337; x=1672339337;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vpfcQ1/q2nm47taBlkXSehjGLleaPk+SFjsutb+tKEU=;
  b=e3T7jlRnskyRQraZxcfps2dq7vY6sYd4q33zVA5GkGDdoAAbhyKggLbr
   t1adksoSL1Z1FPi5a7M0w6X2vt2xrQaCgFAnSdUKmc5slZGXl3YOt+8z/
   BKeltND+Nk02pHb/XqVxZZ5wj8LWbAZJxZFZx25Gsed5fwt5kScPWxXyN
   RQFmLTA9oylDYQgc7ojghon6HXJcVNhc3ny2auvZTTxB83pxpjFFLDFdR
   pVujyxHtJgTojTGK5DPJGiU5J++IeIbEy0zIrpLSU6Lb8wDH6hZv+Sauy
   L+qQ/WhQA4++aHZMfE9l26qSEeA3PIa1sTdH7ptNEx8VP+vf4YbhERKNX
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10212"; a="241358741"
X-IronPort-AV: E=Sophos;i="5.88,246,1635231600"; 
   d="scan'208";a="241358741"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2021 10:42:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,246,1635231600"; 
   d="scan'208";a="470418923"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 29 Dec 2021 10:42:16 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n2dtv-0009KQ-Dc; Wed, 29 Dec 2021 18:42:15 +0000
Date: Thu, 30 Dec 2021 02:41:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: vc_switch_off_ist()+0x28: call to
 ip_within_syscall_gap() leaves .noinstr.text section
Message-ID: <202112300220.SJwn7P1r-lkp@intel.com>
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
TO: Nick Desaulniers <ndesaulniers@google.com>
CC: Kees Cook <keescook@chromium.org>
CC: Fangrui Song <maskray@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e7c124bd04631973a3cc0df19ab881b56d8a2d50
commit: 380d53c45ff21f66870ee965b62613137f9d010d compiler_attributes.h: define __no_profile, add to noinstr
date:   6 months ago
config: x86_64-buildonly-randconfig-r004-20211229 (https://download.01.org/0day-ci/archive/20211230/202112300220.SJwn7P1r-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project cd284b7ac0615afc6e0f1a30da2777e361de27a3)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=380d53c45ff21f66870ee965b62613137f9d010d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 380d53c45ff21f66870ee965b62613137f9d010d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_syscall_64()+0x46: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_syscall_32()+0x53: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x53: call to memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: vc_switch_off_ist()+0x28: call to ip_within_syscall_gap() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x29: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack()+0x10: call to task_stack_page() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack()+0xd: call to cpu_entry_stack() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x3d: call to ghcb_set_sw_exit_code() leaves .noinstr.text section
   vmlinux.o: warning: objtool: safe_stack_exc_vmm_communication()+0x32: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: debug_locks_off()+0x24: call to console_verbose() leaves .noinstr.text section
   kallsyms failure: relative symbol value 0xffffffff06b3e000 out of range in relative mode

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
