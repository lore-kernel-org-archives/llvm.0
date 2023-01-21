Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6812D386;
	Sat, 21 Jan 2023 04:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674274311; x=1705810311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jx5V5KL2mb4/MyFWSwW04LmF5935XxWdgcYTCAArtIA=;
  b=kJhdhqejg47Fb3Bixn16eJT/+UepprNFRCwq8Bd6t3iPE22dHf0M4Btw
   2vJ5XoC7MGLp/32fIWyOAjxs+HNYRX6hWR6TajWgVEuynPoJlJ/u6bmW2
   V09iEs9r91iPQuZvLooCtdaX0bpVgm61w93Ue7lcSBRISvJ1HcII+t903
   Nfj8o9sMOaBDr11OJgInXtIRWT6jMaDiU84K+9voSr2sAKFB0l69mrB9K
   Sy3hI4jymDMlmoBkXA37X1ZRsYEDyVVWkjeB54nIlvz1hOWb1crof1Ii1
   dd6t9cYTw2dRjN9UhTp/gaUlCX02MmPvd03iHOGHnE3RYnYa0NTncjgw4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="388116200"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="388116200"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 20:11:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="724179990"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="724179990"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Jan 2023 20:11:48 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ5EJ-0003Pu-12;
	Sat, 21 Jan 2023 04:11:47 +0000
Date: Sat, 21 Jan 2023 12:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/nmitest.2023.01.20a 4/5]
 arch/x86/kernel/nmi.c:441:6: warning: no previous prototype for function
 'set_nmi_torture'
Message-ID: <202301211247.Isi7qGD5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/nmitest.2023.01.20a
head:   53e298568bde2c728ee2aac4ac634cca8550a4b4
commit: 1f061ebc3647245564abc8b5a47882645af82199 [4/5] x86/nmi: Add a set_nmi_torture() function to control NMI testing
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230121/202301211247.Isi7qGD5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/1f061ebc3647245564abc8b5a47882645af82199
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/nmitest.2023.01.20a
        git checkout 1f061ebc3647245564abc8b5a47882645af82199
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/nmi.c:441:6: warning: no previous prototype for function 'set_nmi_torture' [-Wmissing-prototypes]
   void set_nmi_torture(int nmi_delay_in, bool nmi_halt1_in, bool nmi_halt2_in, bool nmi_halt3_in)
        ^
   arch/x86/kernel/nmi.c:441:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_nmi_torture(int nmi_delay_in, bool nmi_halt1_in, bool nmi_halt2_in, bool nmi_halt3_in)
   ^
   static 
   1 warning generated.


vim +/set_nmi_torture +441 arch/x86/kernel/nmi.c

   439	
   440	/* Set the test values as desired. */
 > 441	void set_nmi_torture(int nmi_delay_in, bool nmi_halt1_in, bool nmi_halt2_in, bool nmi_halt3_in)
   442	{
   443		WRITE_ONCE(nmi_delay, nmi_delay_in);
   444		WRITE_ONCE(nmi_halt1, nmi_halt1_in);
   445		WRITE_ONCE(nmi_halt2, nmi_halt2_in);
   446		WRITE_ONCE(nmi_halt3, nmi_halt3_in);
   447		pr_info("%s: Set NMI test parameters nmi_delay=%d nmi_halt1=%d nmi_halt2=%d nmi_halt3=%d\n",
   448			__func__, nmi_delay, nmi_halt1, nmi_halt2, nmi_halt3);
   449	}
   450	EXPORT_SYMBOL_GPL(set_nmi_torture);
   451	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
