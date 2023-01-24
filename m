Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826A3A3C;
	Tue, 24 Jan 2023 05:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674537403; x=1706073403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k8I/8D8k/kyeL6IYp7y5d6QNFeEJkuMrF5RV7cL22fA=;
  b=DDFEHAu79ckjd7ncpkHxls5pq4DH0sAM5jNTGHHXH1oypUuawAzjV7zU
   Jo/hDdvFpIfRPQy8maMtTiPGejEGYlu+5gtLBzKzX6w3a/BbZQEIVTGV3
   W70QSYENUlFjXkY8dnIBBZeUPKWyZUdFKUcqelRS4BnNyzsD2+Ep9jSDH
   U96+VK4SLKA2K3ZV1cUWVwtJZU0b5czkkMtB+gzFPFevoTd45PnDN1EMD
   5zRt8uaymreNcGztlkmgWpUcBMvEjOVMHlDYdAiNSDj17jyNySPUCHiHP
   w3d8gER7pRWwqqfe3apnbkk64ecTvvrlUL1PSuLTCwqCAaEWH6LmZPLLC
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="327489198"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="327489198"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 21:16:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="655301023"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="655301023"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Jan 2023 21:16:41 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKBfk-0006A8-2C;
	Tue, 24 Jan 2023 05:16:40 +0000
Date: Tue, 24 Jan 2023 13:16:10 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter-upstream 22/30]
 arch/x86/coco/tdx/filter.c:21:13: warning: unused variable
 'filter_overridden'
Message-ID: <202301241333.owU3NGUA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   2eb6cd239352583e1275ed7d6e772e7bbc0343b0
commit: c28dbc3cf90d7c85d18cb4a8f79f4a18f5386e91 [22/30] x86/tdx: Add a command line option to add new ACPI tables to the filter
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230124/202301241333.owU3NGUA-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/c28dbc3cf90d7c85d18cb4a8f79f4a18f5386e91
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout c28dbc3cf90d7c85d18cb4a8f79f4a18f5386e91
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/coco/tdx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
