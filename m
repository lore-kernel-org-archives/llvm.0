Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42AC10E7;
	Tue, 18 Apr 2023 02:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681785857; x=1713321857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xcm7zVaBkwPNXqDZx1jkJ7kQxyMAw/Oi5hBPJEED8/A=;
  b=YNUvbhcrJybv+JSDk013NqqtjgyD19vAOzAh8rpfDd7MMzhvni7OMzL9
   XWiM2UrYRVCqyUX2FNXBxQYQBKbNzbaavXmi8f6vz1s7UV7CuTc02Jfd6
   Y26aOyLVYE2k79Gcj691lCNqgudbY3f/YqGfj8GWv8CjzHwwFjm5qCsPK
   cIP6p4SjNgrTMG1ozuw/3+Z0/WtuqfXuLB2k/Bh5M16dYdzAzCMHV7+Ex
   YBJD1n+ZrRnfhVjh6DOzzRqy/yq2PkRacHLIJMVCsX17V1LqrZz+tprGw
   rzP2YBUWUVDtvnDTn/N91KxF+7nkxmIcVRQY0VVnFq+kGPXCa1f0Ijl28
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="347807198"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="347807198"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 19:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="760187430"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="760187430"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Apr 2023 19:44:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pobKI-000csG-2s;
	Tue, 18 Apr 2023 02:44:14 +0000
Date: Tue, 18 Apr 2023 10:43:47 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter-upstream 30/39]
 arch/x86/coco/tdx/filter.c:21:13: warning: unused variable
 'filter_overridden'
Message-ID: <202304181046.lAQpzQaS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   a35cae51b23cffcab4186d4434f3a84690833d4a
commit: c9ed5b2716ab712dd62f79d5cc6f399cd2cd90b8 [30/39] x86/tdx: Add a command line option to add new ACPI tables to the filter
config: x86_64-randconfig-a011-20230417 (https://download.01.org/0day-ci/archive/20230418/202304181046.lAQpzQaS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/c9ed5b2716ab712dd62f79d5cc6f399cd2cd90b8
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout c9ed5b2716ab712dd62f79d5cc6f399cd2cd90b8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/coco/tdx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181046.lAQpzQaS-lkp@intel.com/

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
