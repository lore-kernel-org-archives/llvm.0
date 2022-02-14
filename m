Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4946CA30
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 17:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644859216; x=1676395216;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+gIHxLyESJuSqt89W6rAV6RPwwYH90ILpNalN85AC+U=;
  b=d6MN9WhACxxoRWnSQtOvjuwFCP2qdbVUmJkkH6IHmGkDM/Z/DSIAUZU0
   fMWfRlZdr09bisMnO/XGKhRnkykPGnu4TTEcVUvBcTmO+W6fIRveyZPvT
   RtJEqXa1+n1EcKrHlCfHqoQl37xGpKTPoilrHGnpfds708HXVDqbTlDXV
   o9kzWLtsJAxJfwcql0bVHNy5OBD6ch1CrDxhVNkGJ2bjEp3ZMbJ27bZAG
   enV4Pw8DpGlSz1Nw1KHDjdwGlF1Uep2KGkoQ6akxwm8CotPV8+RZ7ZfKO
   eBrtfoTXvIfl/IdVTitsuYsQ1KVjAHLGH4ewX13ZjbS87Ihw4vd4EZtNr
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="310876141"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="310876141"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 09:20:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="632247087"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 14 Feb 2022 09:20:14 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJf1K-0008n4-3F; Mon, 14 Feb 2022 17:20:14 +0000
Date: Tue, 15 Feb 2022 01:19:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x39: call to
 ghcb_set_sw_exit_code() leaves .noinstr.text section
Message-ID: <202202142331.ZR5kseK5-lkp@intel.com>
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

Hi Nick,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   754e0b0e35608ed5206d6a67a791563c631cec07
commit: 380d53c45ff21f66870ee965b62613137f9d010d compiler_attributes.h: define __no_profile, add to noinstr
date:   8 months ago
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220214/202202142331.ZR5kseK5-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
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

   vmlinux.o: warning: objtool: do_syscall_64()+0x18: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_syscall_32()+0x25: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x29: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vc_switch_off_ist()+0x27: call to ip_within_syscall_gap() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x21: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack()+0xc: call to task_stack_page() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack()+0x9: call to cpu_entry_stack() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x39: call to ghcb_set_sw_exit_code() leaves .noinstr.text section
   vmlinux.o: warning: objtool: safe_stack_exc_vmm_communication()+0x2b: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: debug_locks_off()+0x20: call to console_verbose() leaves .noinstr.text section
   kallsyms failure: relative symbol value 0xffffffff045a1000 out of range in relative mode

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
