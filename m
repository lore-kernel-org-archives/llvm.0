Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B482919;
	Mon,  6 Mar 2023 10:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678097880; x=1709633880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Glf+37ZQ1X8rv+wnxNcIZ6bkgl7UIoC+D+QaKjERejo=;
  b=AZNTGhwkQF14PWesATxsjP6upwFS6uvhsf4ZDrsqhXecGSWBS2H77sze
   KbiTnl3aCdGvq97IKMscDzc1+lA2F3ubRvU0DitDH5q+8rLc2dJKTsA+B
   zmcHRHWpc3jigTjxLfnPZD0BwH2xfyI6EYOe2msBEkGBgPAxSq2Q5yP3l
   KCILiVYYNxgNKZp3XegiR1p9LEr11zMGRf2YD3v7VqImhDpaVwX3ZhYAR
   0ysHOvZBH+R7cEzJ4AFfR0u7s8ea6Ir7YKLNlN5nW76d/0Mfq6EC//7YA
   DTz/a1vsDCNGbu1bMSnmpnmJh7BtVx2PkxCRhgNHR5wJSunopaaM4M6Hn
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="319346222"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="319346222"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 02:17:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="653559310"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="653559310"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Mar 2023 02:17:58 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ7un-0000El-29;
	Mon, 06 Mar 2023 10:17:57 +0000
Date: Mon, 6 Mar 2023 18:16:59 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter-upstream 23/31]
 arch/x86/coco/tdx/filter.c:21:13: warning: unused variable
 'filter_overridden'
Message-ID: <202303061825.PgYQ6iI2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   2a65ce7abb22ae45b4be1299bbd9eb72534827eb
commit: 313c0b6ca9f8a5039397575b18226ded8573e358 [23/31] x86/tdx: Add a command line option to add new ACPI tables to the filter
config: x86_64-randconfig-a011-20230306 (https://download.01.org/0day-ci/archive/20230306/202303061825.PgYQ6iI2-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/313c0b6ca9f8a5039397575b18226ded8573e358
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout 313c0b6ca9f8a5039397575b18226ded8573e358
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/coco/tdx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303061825.PgYQ6iI2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/tdx/filter.c:21:13: warning: unused variable 'filter_overridden' [-Wunused-variable]
   static bool filter_overridden;
               ^
   1 warning generated.


vim +/filter_overridden +21 arch/x86/coco/tdx/filter.c

    19	
    20	/* Set true if authorize_allow_devs is used */
  > 21	static bool filter_overridden;
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
