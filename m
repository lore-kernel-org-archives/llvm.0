Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12DA184A
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 04:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655181375; x=1686717375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vISsISBvSfRXzNaWchMWOXQwZ2FNET8hE5Vunm1WHtg=;
  b=UMlkJFoh7rN/37tow3miUvErYX4CFkidZsggXmMTkm0kOFd5+r5NV+JX
   q4AOGTYbGUfmkqGOIQsHyjQUE3GBx6+FfJt/qkXsHQMsAHrxnar5gKR+E
   GPI+KRAZQ11lhLisCeWANWLYv1Zudpu1kt24JHSfAhVLQwUYv0+BdEqBT
   KX/K02CIWJL5i0GWu5uTPOWxt0vkL8elp0F4P+eJxp9aOeU0EzFuraxur
   pq6p75wbQEN5nSbmDnaGSj5d1gwwTXB48e7edT7MPMtyzY3mdSHvQgnQG
   aTDuOLkUZg+PKhV5xaUVpywP+SkZyR235/6xjMb/LE3Vw2Hk+0T6WojBT
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="279220775"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="279220775"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 21:36:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="910759867"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Jun 2022 21:36:14 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0yHl-000LTs-EA;
	Tue, 14 Jun 2022 04:36:13 +0000
Date: Tue, 14 Jun 2022 12:35:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [ardb:arm64-scs-patching-v3 3/3] ld.lld: error: undefined symbol:
 scs_patch
Message-ID: <202206141211.OYR97qyn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-scs-patching-v3
head:   0da13e3a0d40aa97f6f59e72d5c72fdd3475dc2d
commit: 0da13e3a0d40aa97f6f59e72d5c72fdd3475dc2d [3/3] arm64: implement dynamic shadow call stack for Clang
config: arm64-randconfig-r001-20220613 (https://download.01.org/0day-ci/archive/20220614/202206141211.OYR97qyn-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c97436f8b6e2718286e8496faf53a2c800e281cf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=0da13e3a0d40aa97f6f59e72d5c72fdd3475dc2d
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb arm64-scs-patching-v3
        git checkout 0da13e3a0d40aa97f6f59e72d5c72fdd3475dc2d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: scs_patch
   >>> referenced by module.c:537 (arch/arm64/kernel/module.c:537)
   >>> kernel/module.o:(module_finalize) in archive arch/arm64/built-in.a
--
>> ld.lld: error: undefined symbol: dynamic_scs_enabled
   >>> referenced by module.c
   >>> kernel/module.o:(__jump_table+0x28) in archive arch/arm64/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
