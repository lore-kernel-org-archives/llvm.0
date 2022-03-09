Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF64645A
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 01:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646788380; x=1678324380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xtRs6oi+J5auIPKJEANNMf/Y0ox4XmKqILRhR300NLg=;
  b=fTG84JLl4MoryJk8xgaJqrwYt1WL8wT3scRbWN8FDq+Ln8Di7PPOOGBw
   lkInLPsd9nqO+z0s+vbXi0Nux4W2sVAYGAC3jRD3OnzJ7FfxhCSXOnvRK
   bTQqbZiaGwIuehKVXwzKIy80059WCV+PY6ieQJEEsQ+4RSD4tMgPieExv
   NUMBYNPfP4MXsncfpVSm4r6xop8SZy1XKsicO16X53dRDF3CLbP1EerwQ
   9481OzgZL2LLxMW/NGYKqbUtFHpdIxNXu3WL+dNZ35ftQ32D7iKFA6pb1
   VgnlLPJAmXuMe8zjJ/aAk1rsf081yQG+kr+chF+cGLLXrnV29MRCFOd1u
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="254587464"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="254587464"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 17:12:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="495664617"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 08 Mar 2022 17:12:45 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRksf-0002Ic-1d; Wed, 09 Mar 2022 01:12:45 +0000
Date: Wed, 9 Mar 2022 09:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [ebiederm-user-namespace:coredump-vma-snapshot-fix 1/5]
 fs/binfmt_flat.c:121:36: error: incomplete definition of type 'struct
 coredump_params'
Message-ID: <202203090943.0a2uUHMd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git coredump-vma-snapshot-fix
head:   390031c942116d4733310f0684beb8db19885fe6
commit: a99a3e2efaf1f4454eb5c9176f47e66de075b134 [1/5] coredump: Move definition of struct coredump_params into coredump.h
config: riscv-nommu_virt_defconfig (https://download.01.org/0day-ci/archive/20220309/202203090943.0a2uUHMd-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a2e9c68fcd4425fbce7380746e916966f00a39a0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git/commit/?id=a99a3e2efaf1f4454eb5c9176f47e66de075b134
        git remote add ebiederm-user-namespace https://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git
        git fetch --no-tags ebiederm-user-namespace coredump-vma-snapshot-fix
        git checkout a99a3e2efaf1f4454eb5c9176f47e66de075b134
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/binfmt_flat.c:121:36: error: incomplete definition of type 'struct coredump_params'
                   current->comm, current->pid, cprm->siginfo->si_signo);
                                                ~~~~^
   include/linux/printk.h:499:37: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                              ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   include/linux/binfmts.h:11:8: note: forward declaration of 'struct coredump_params'
   struct coredump_params;
          ^
   1 error generated.


vim +121 fs/binfmt_flat.c

^1da177e4c3f415 Linus Torvalds   2005-04-16  111  
^1da177e4c3f415 Linus Torvalds   2005-04-16  112  /****************************************************************************/
^1da177e4c3f415 Linus Torvalds   2005-04-16  113  /*
^1da177e4c3f415 Linus Torvalds   2005-04-16  114   * Routine writes a core dump image in the current directory.
^1da177e4c3f415 Linus Torvalds   2005-04-16  115   * Currently only a stub-function.
^1da177e4c3f415 Linus Torvalds   2005-04-16  116   */
^1da177e4c3f415 Linus Torvalds   2005-04-16  117  
f6151dfea21496d Masami Hiramatsu 2009-12-17  118  static int flat_core_dump(struct coredump_params *cprm)
^1da177e4c3f415 Linus Torvalds   2005-04-16  119  {
4adbb6ac4b807e2 Nicolas Pitre    2016-07-24  120  	pr_warn("Process %s:%d received signr %d and should have core dumped\n",
13c3f50c914e6a5 Nicolas Pitre    2016-07-24 @121  		current->comm, current->pid, cprm->siginfo->si_signo);
13c3f50c914e6a5 Nicolas Pitre    2016-07-24  122  	return 1;
^1da177e4c3f415 Linus Torvalds   2005-04-16  123  }
^1da177e4c3f415 Linus Torvalds   2005-04-16  124  

:::::: The code at line 121 was first introduced by commit
:::::: 13c3f50c914e6a51d11e1aba4a85c2223e197e13 binfmt_flat: assorted cleanups

:::::: TO: Nicolas Pitre <nicolas.pitre@linaro.org>
:::::: CC: Greg Ungerer <gerg@linux-m68k.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
