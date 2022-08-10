Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E2D5C81
	for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 03:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660102569; x=1691638569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YxmthxJXTQhxtQJ/Htfnm3RrXdQD2c318ixmJ7mgyUs=;
  b=KVPZZaAk3cfHmmqT+4mYPtAp2sksYtwY6cak3Tlw3Ume3QD9iA9/Fvlv
   Y1VbRQBmFw2RAo1VPkz0/P9mx07RZVbrE7Rl3ojAOomp3gOFK4qGqDtZh
   ZfNAOuWIEqmFtxS1M7RQ+t/1OmTkpWcObNVG9fOMQC1kDgTh7rlQc9Siw
   vipI1APDHN6dFJE6qnx9c+eGFPIDk3uPl//fDJPaxuxx7MRyJTBBCAMJ6
   BVQhjf02QzdLfKlsS5t/cUDbCId9Wj8VoNHxECI9yeva81N9nN2KgL3Ye
   t/SPj0VPJsXQbtT976qO6fGc7zucxWjxKKsn/wWGoKU19LhxJEx3L3+du
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="352719069"
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; 
   d="scan'208";a="352719069"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 20:36:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; 
   d="scan'208";a="581064163"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Aug 2022 20:36:07 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLcVq-000NTZ-2m;
	Wed, 10 Aug 2022 03:36:06 +0000
Date: Wed, 10 Aug 2022 11:35:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [intel-amx:init_fpstate 2/3] arch/x86/kernel/fpu/xstate.c:365:24:
 warning: format specifies type 'unsigned long' but the argument has type
 'unsigned int'
Message-ID: <202208101137.JDQ1Crdy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/amx-linux.git init_fpstate
head:   0dd11dae13f2a012cd33971c5917f946d09e895c
commit: e1dead9e3ed891a5024f59708e5059cdd094e3f5 [2/3] x86/fpu: Validate the init_fpstate size
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220810/202208101137.JDQ1Crdy-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/amx-linux/commit/e1dead9e3ed891a5024f59708e5059cdd094e3f5
        git remote add intel-amx https://github.com/intel/amx-linux.git
        git fetch --no-tags intel-amx init_fpstate
        git checkout e1dead9e3ed891a5024f59708e5059cdd094e3f5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/fpu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/fpu/xstate.c:365:24: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
                          "%u bytes\n", sizeof(union fpregs_state), init_fpstate.size);
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:507:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +365 arch/x86/kernel/fpu/xstate.c

   328	
   329	/*
   330	 * All supported features have either init state all zeros or are
   331	 * handled in setup_init_fpu() individually. This is an explicit
   332	 * feature list and does not use XFEATURE_MASK*SUPPORTED to catch
   333	 * newly added supported features at build time and make people
   334	 * actually look at the init state for the new feature.
   335	 */
   336	#define XFEATURES_INIT_FPSTATE_HANDLED		\
   337		(XFEATURE_MASK_FP |			\
   338		 XFEATURE_MASK_SSE |			\
   339		 XFEATURE_MASK_YMM |			\
   340		 XFEATURE_MASK_OPMASK |			\
   341		 XFEATURE_MASK_ZMM_Hi256 |		\
   342		 XFEATURE_MASK_Hi16_ZMM	 |		\
   343		 XFEATURE_MASK_PKRU |			\
   344		 XFEATURE_MASK_BNDREGS |		\
   345		 XFEATURE_MASK_BNDCSR |			\
   346		 XFEATURE_MASK_PASID |			\
   347		 XFEATURE_MASK_XTILE)
   348	
   349	/*
   350	 * setup the xstate image representing the init state
   351	 */
   352	static int __init setup_init_fpu_buf(void)
   353	{
   354		BUILD_BUG_ON((XFEATURE_MASK_USER_SUPPORTED |
   355			      XFEATURE_MASK_SUPERVISOR_SUPPORTED) !=
   356			     XFEATURES_INIT_FPSTATE_HANDLED);
   357	
   358		if (!boot_cpu_has(X86_FEATURE_XSAVE))
   359			return -ENODEV;
   360	
   361		print_xstate_features();
   362	
   363		if (init_fpstate.size > sizeof(union fpregs_state)) {
   364			pr_err("x86/fpu: init_fpstate (%lu bytes) is not enough for the configured size:"
 > 365			       "%u bytes\n", sizeof(union fpregs_state), init_fpstate.size);
   366			return -EINVAL;
   367		}
   368	
   369		xstate_init_xcomp_bv(&init_fpstate.regs.xsave, init_fpstate.xfeatures);
   370	
   371		/*
   372		 * Init all the features state with header.xfeatures being 0x0
   373		 */
   374		os_xrstor_booting(&init_fpstate.regs.xsave);
   375	
   376		/*
   377		 * All components are now in init state. Read the state back so
   378		 * that init_fpstate contains all non-zero init state. This only
   379		 * works with XSAVE, but not with XSAVEOPT and XSAVEC/S because
   380		 * those use the init optimization which skips writing data for
   381		 * components in init state.
   382		 *
   383		 * XSAVE could be used, but that would require to reshuffle the
   384		 * data when XSAVEC/S is available because XSAVEC/S uses xstate
   385		 * compaction. But doing so is a pointless exercise because most
   386		 * components have an all zeros init state except for the legacy
   387		 * ones (FP and SSE). Those can be saved with FXSAVE into the
   388		 * legacy area. Adding new features requires to ensure that init
   389		 * state is all zeroes or if not to add the necessary handling
   390		 * here.
   391		 */
   392		fxsave(&init_fpstate.regs.fxsave);
   393		return 0;
   394	}
   395	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
