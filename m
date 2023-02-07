Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8582CBD14;
	Tue,  7 Feb 2023 04:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675743455; x=1707279455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l/hW9W9VG9B5eYsz9SDZNPiyr2Q0yhO2RZk0wdJgkSw=;
  b=PNzVUdr45PzAeSD6rhpw19p1ntjYCfQK3b2/6RO/FMor7OZRrRRVzb1F
   RciW8GKp40z56Q6o3MquvtWO2thkz05jNo9INPeqHAMy3XYNX+EQRDPF2
   oe2FqlNivM6LeHlsjmVDSvNBXojXCIQv9jF1E0Mcfdb7rQzCskJOo37bL
   I+KGCe5YAT1we3zfrpK3C9t+SDGcIvvCArTvPQpLr6MeN7BgZ0xnuJ9M7
   ojtZ7QlbHUnx4lMa6lONuiAstTMimKF7ePoP5hjLqs7ocpCqjQ7V6136W
   zyiUzQ48jYwg43NNHYkvPQTEdhA7sd6K5saWNg1UIUiVkOYftCxYvhvnJ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="330690189"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="330690189"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 20:17:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="668645444"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="668645444"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Feb 2023 20:17:33 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPFQC-00033q-3A;
	Tue, 07 Feb 2023 04:17:32 +0000
Date: Tue, 7 Feb 2023 12:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter-upstream 23/31]
 arch/x86/coco/tdx/filter.c:21:13: warning: unused variable
 'filter_overridden'
Message-ID: <202302071239.MJSQ1SNL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   fd61f2d2a82f5c0c284fa3f074bae5016c39e7bc
commit: 4f14697c74172d5614c9ee8f1d5a6c55dd9fdbbf [23/31] x86/tdx: Add a command line option to add new ACPI tables to the filter
config: x86_64-randconfig-a001-20230206 (https://download.01.org/0day-ci/archive/20230207/202302071239.MJSQ1SNL-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/4f14697c74172d5614c9ee8f1d5a6c55dd9fdbbf
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout 4f14697c74172d5614c9ee8f1d5a6c55dd9fdbbf
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
