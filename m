Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DAB10E3;
	Sat, 11 Feb 2023 10:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676109667; x=1707645667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dJq2KsjF5eRvnJ7BX51ugHWNneqFcNyIvSL2lT4NwxM=;
  b=RXizio2ebbKxDjNiMhfyrlntpVzYZc6IDLhoQdDl8VjLCTTTSMfXMRcm
   4GRYwi+itFhXc11OaE/7hEfI39DT8ZJFD0l5sxrm2OUs052MHZMEtALwY
   f/TQho7sdkPJm8cqYQ7c4K+8Ku+7+/rfbRe5NBOy4FEtNDm6aIKkOig4q
   /U9WUGYczPVRqnmbOXLF4PL0aznH16YcUiajKE/ADgmvT1JHfNCWFtN+f
   OHya7ZytXO94MSamtzZjFz2KmmyHTHMBPL1kpkUyEBIZBKLHACC4T1sdq
   hpnPkCF08NQqyy5M7tcTy9gycgOxcVp0i1iUgW+OfAbmCEm1FmkYGquxM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="395207477"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="395207477"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 02:01:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="731971043"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="731971043"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Feb 2023 02:01:04 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQmgq-0006PZ-0e;
	Sat, 11 Feb 2023 10:01:04 +0000
Date: Sat, 11 Feb 2023 18:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 2/2] lib/unwind_kunit.c:22:6: warning: no
 previous prototype for function 'std_stacktrace_save'
Message-ID: <202302111722.ojTgaHZP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   c40c372bae5073513f06c33fae36c546bec57ffe
commit: c40c372bae5073513f06c33fae36c546bec57ffe [2/2] WIP: unwind test
config: s390-buildonly-randconfig-r004-20230210 (https://download.01.org/0day-ci/archive/20230211/202302111722.ojTgaHZP-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=c40c372bae5073513f06c33fae36c546bec57ffe
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark stacktrace/tests
        git checkout c40c372bae5073513f06c33fae36c546bec57ffe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111722.ojTgaHZP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/unwind_kunit.c:22:6: warning: no previous prototype for function 'std_stacktrace_save' [-Wmissing-prototypes]
   void std_stacktrace_save(struct std *std)
        ^
   lib/unwind_kunit.c:22:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void std_stacktrace_save(struct std *std)
   ^
   static 
>> lib/unwind_kunit.c:29:6: warning: no previous prototype for function 'std_stacktrace_save_reliable' [-Wmissing-prototypes]
   void std_stacktrace_save_reliable(struct std *std)
        ^
   lib/unwind_kunit.c:29:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void std_stacktrace_save_reliable(struct std *std)
   ^
   static 
>> lib/unwind_kunit.c:36:6: warning: no previous prototype for function 'std_stacktrace_save_regs' [-Wmissing-prototypes]
   void std_stacktrace_save_regs(struct std *std, struct pt_regs *regs)
        ^
   lib/unwind_kunit.c:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void std_stacktrace_save_regs(struct std *std, struct pt_regs *regs)
   ^
   static 
   3 warnings generated.


vim +/std_stacktrace_save +22 lib/unwind_kunit.c

    21	
  > 22	void std_stacktrace_save(struct std *std)
    23	{
    24		std->len = stack_trace_save(std->stack_trace,
    25					    NR_STD_ELEMS,
    26					    0);
    27	}
    28	
  > 29	void std_stacktrace_save_reliable(struct std *std)
    30	{
    31		std->len = stack_trace_save_tsk_reliable(current,
    32							 std->stack_trace,
    33							 NR_STD_ELEMS);
    34	}
    35	
  > 36	void std_stacktrace_save_regs(struct std *std, struct pt_regs *regs)
    37	{
    38		std->len = stack_trace_save_regs(regs,
    39						 std->stack_trace,
    40						 NR_STD_ELEMS,
    41						 0);
    42	}
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
