Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA71408F8;
	Sat, 10 Jun 2023 05:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686374480; x=1717910480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mL0BpjPiuiQPiZskBFJzDyE5VNwgjKlZuy1uPb2CzFU=;
  b=Kh3WUv69/cssCj3dMBCkBB3RNgsINSvZScofpPhWx0GS0yuPm8H+Fg9d
   F2L53/aM4K+FPxmFixlXfjKmNRiowmvXnxW08N+/xzl1ITUPpfwvhpt0r
   qYnin+mazZx4R8TdrL32wFikYA32Ddc8WZwiSAgSCZBiYNyGmB5JtOgD1
   4eYSjOLo51oqFctdDZgbSqGBEWzfzWAOpFakWaojGEgAhwDa3Bad/m+vF
   plDBWSTKTa2QMW6vDMmn2oyL0Cky/7Gxtc2WIfhrp5+LV+ub+zOc3DEUV
   NjHnIDma5PN2a/4VEXdveWuVAfUOYmcD0BDeugd4F6kE7DUI+/LbzgW0V
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="338094274"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="338094274"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 22:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="854960642"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="854960642"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2023 22:21:16 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7r2J-0009lw-2R;
	Sat, 10 Jun 2023 05:21:15 +0000
Date: Sat, 10 Jun 2023 13:20:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Gibson <warthog618@gmail.com>
Subject: Re: [libgpiod][PATCH] doc: add configuration to generate doxygen
 documentation on readthedocs.
Message-ID: <202306101327.8CQ451FM-lkp@intel.com>
References: <20230610020148.8973-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230610020148.8973-1-warthog618@gmail.com>

Hi Kent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.4-rc5 next-20230609]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kent-Gibson/doc-add-configuration-to-generate-doxygen-documentation-on-readthedocs/20230610-100330
base:   linus/master
patch link:    https://lore.kernel.org/r/20230610020148.8973-1-warthog618%40gmail.com
patch subject: [libgpiod][PATCH] doc: add configuration to generate doxygen documentation on readthedocs.
config: powerpc-randconfig-r035-20230610 (https://download.01.org/0day-ci/archive/20230610/202306101327.8CQ451FM-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        git checkout linus/master
        b4 shazam https://lore.kernel.org/r/20230610020148.8973-1-warthog618@gmail.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306101327.8CQ451FM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .readthedocs.yaml: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
