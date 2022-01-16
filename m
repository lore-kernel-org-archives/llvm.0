Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4D62CA0
	for <llvm@lists.linux.dev>; Sun, 16 Jan 2022 23:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642374979; x=1673910979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7nuGFaA+TDZxoxKOzdPqVEtDKkMdy2FHfC6SCyKF+Zs=;
  b=SjxbDP4W7qE7/4RANXY4yd2giBs6yS8E9VmtMkrl7YiIBVOhItwQ1idl
   VQKPesrWL5mGfIMuUIC7KA0fDxMQYbhEnoj/95WALmChMub/GTO9Xl7go
   kZc+qY3Wylzid0FpqSYmL0lu2THUHpnlFKdfqcM6jtF6ck329/mWnccn/
   To17Mcc9eIM64j3q6HigPBST2ziLEZ0MW7x6bDbId2rZYlSGTqXaRCwRz
   PjwGv6hACSS6XkSfQwnIkc281zvWLkFfbjeY2iNjyAI3YGY8mLuhKeAGF
   X54And1VUDPkbGbJHeWW77DkmAm0pTX16ujB2MdxcAkdrszXo3G7Wk5Ld
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="243345288"
X-IronPort-AV: E=Sophos;i="5.88,293,1635231600"; 
   d="scan'208";a="243345288"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2022 15:16:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,293,1635231600"; 
   d="scan'208";a="531108795"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 Jan 2022 15:16:16 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n9Eky-000B2m-8E; Sun, 16 Jan 2022 23:16:16 +0000
Date: Mon, 17 Jan 2022 07:15:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1617/2384]
 arch/mips/alchemy/common/clock.c:143:2: error: use of undeclared identifier
 'preset_lpj'
Message-ID: <202201170727.IDnTpMbA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   4c707c1c0de83967079b4e385012fa5b00e2cd11
commit: 4a1f9d16bf267958eefcbac668167e6135f75621 [1617/2384] headers/deps: ktime: Remove the <linux/ktime_api.h> header from <linux/ktime.h>
config: mips-randconfig-c004-20220116 (https://download.01.org/0day-ci/archive/20220117/202201170727.IDnTpMbA-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c63a3175c2947e8c1a2d3bbe16a8586600705c54)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=4a1f9d16bf267958eefcbac668167e6135f75621
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 4a1f9d16bf267958eefcbac668167e6135f75621
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/mips/alchemy/common/clock.c:143:2: error: use of undeclared identifier 'preset_lpj'
           preset_lpj = alchemy_clk_cpu_recalc(NULL, ALCHEMY_ROOTCLK_RATE);
           ^
   arch/mips/alchemy/common/clock.c:144:2: error: use of undeclared identifier 'preset_lpj'
           preset_lpj /= 2 * HZ;
           ^
   arch/mips/alchemy/common/clock.c:141:13: warning: no previous prototype for function 'alchemy_set_lpj' [-Wmissing-prototypes]
   void __init alchemy_set_lpj(void)
               ^
   arch/mips/alchemy/common/clock.c:141:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init alchemy_set_lpj(void)
   ^
   static 
   arch/mips/alchemy/common/clock.c:554:31: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           unsigned long div, v, flags, ret;
                                        ^
   arch/mips/alchemy/common/clock.c:676:31: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           unsigned long div, v, flags, ret;
                                        ^
   3 warnings and 2 errors generated.


vim +/preset_lpj +143 arch/mips/alchemy/common/clock.c

474402291a0ad4 Manuel Lauss 2014-07-23  140  
45a848f7fa067a Manuel Lauss 2015-01-29  141  void __init alchemy_set_lpj(void)
45a848f7fa067a Manuel Lauss 2015-01-29  142  {
45a848f7fa067a Manuel Lauss 2015-01-29 @143  	preset_lpj = alchemy_clk_cpu_recalc(NULL, ALCHEMY_ROOTCLK_RATE);
45a848f7fa067a Manuel Lauss 2015-01-29  144  	preset_lpj /= 2 * HZ;
45a848f7fa067a Manuel Lauss 2015-01-29  145  }
45a848f7fa067a Manuel Lauss 2015-01-29  146  

:::::: The code at line 143 was first introduced by commit
:::::: 45a848f7fa067a81ae606bb06b2edcdf53772eac MIPS: Alchemy: preset loops_per_jiffy based on CPU clock

:::::: TO: Manuel Lauss <manuel.lauss@gmail.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
