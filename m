Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D6636E;
	Tue,  7 Mar 2023 02:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678156250; x=1709692250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZeDxSqFAjnees3O73+7lBSkjg3EMyBfgZ+CTgnYwgoQ=;
  b=lGrX7/lEBDHhZGvzVKYPw9Al+oJcEoOd38P/55iRujPkoZh/qSxkciE9
   uMtX548UG3s+efvGVNhIRCnGdpdVnGveJXwbewVB7x8kV5kKiRVPvDnLi
   M1NvIih7mTO5/+GCLaR4+wXduobA/jfGwHZ3umVhsBPTuyMDGjIW/v8QA
   7G9VJ0TneaCQLSDOjT1Pvy/FcjAzWtw2ahox1zS4BSqQTxyLhKxP1FDfN
   fCnLYsSRT4R2hsn10g6Ds53u9gpKJR43ptAAUmKsGDpF8DhDgq3fXKOon
   xaVhfq+Y82etimfYYEhwo5KNTKO5QjyQUD+V05/Yvogd4yX2TyVMKDxgl
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316145352"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="316145352"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 18:30:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="678752340"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="678752340"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Mar 2023 18:30:47 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZN6E-0000sS-2F;
	Tue, 07 Mar 2023 02:30:46 +0000
Date: Tue, 7 Mar 2023 10:30:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev.2023.02.27a 107/108]
 arch/x86/kernel/nmi.c:441:6: warning: no previous prototype for function
 'set_nmi_torture'
Message-ID: <202303071057.1r9aTmDM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.2023.02.27a
head:   b171cbcbbd8e5f5f2e0638c5b5b5c77e3cc79007
commit: 80dd9f246f8a23a0fd0ed69e51dbdcb389806254 [107/108] x86/nmi: Add a set_nmi_torture() function to control NMI testing
config: x86_64-randconfig-a014-20230306 (https://download.01.org/0day-ci/archive/20230307/202303071057.1r9aTmDM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/80dd9f246f8a23a0fd0ed69e51dbdcb389806254
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev.2023.02.27a
        git checkout 80dd9f246f8a23a0fd0ed69e51dbdcb389806254
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071057.1r9aTmDM-lkp@intel.com/

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
