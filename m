Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E4517E3;
	Tue, 11 Apr 2023 04:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681185774; x=1712721774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=azo5hPuIK5j7fiqbVqGtB2Aj+M6VJUqReAhjK5xv6Lo=;
  b=BuRAFzSpP1/X6dxCczCe1VCpTaOL/mVTi/EFWlrbtNuH+E0Jh4gIsTS8
   5vWiOeh44MOFb4Q3xJWnu4LoiyT2jzppYG0h3WCYrFXSmbqWkBJlVvjyE
   YiO3qA6Gp2HMQQ79PrGjkRr2f+U5Emz8/IVL8v8txPHL2V/LkAcxR+2Gv
   F0iuzfvm+2pTM4nz/vOuLByKNj8Wrb5GJHKapq7LAKLoMf3RiVI5pYQhf
   vAYpy93PmnevhbLcXcyueGwFoeLboG/6prbOMN7TW1+/uGnvm7mjD6fln
   gWWE5jDlTkEDbuIWOSVFekZFpwBPN/Anhg6Fv8EwNsanWwCoMZ6xwYNuY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="345304655"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="345304655"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 21:02:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="934575849"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="934575849"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Apr 2023 21:02:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm5DX-000Vu1-0y;
	Tue, 11 Apr 2023 04:02:51 +0000
Date: Tue, 11 Apr 2023 12:02:04 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter-upstream 30/39]
 arch/x86/coco/tdx/filter.c:21:13: warning: unused variable
 'filter_overridden'
Message-ID: <202304111109.WsJr7mpF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   359e363de7b2f8863a0cbfb771cceaefb7a80873
commit: a4a44ebfde8563bd89c8f7824cc62e17b992f267 [30/39] x86/tdx: Add a command line option to add new ACPI tables to the filter
config: x86_64-randconfig-r036-20230410 (https://download.01.org/0day-ci/archive/20230411/202304111109.WsJr7mpF-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/a4a44ebfde8563bd89c8f7824cc62e17b992f267
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout a4a44ebfde8563bd89c8f7824cc62e17b992f267
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/coco/tdx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304111109.WsJr7mpF-lkp@intel.com/

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
