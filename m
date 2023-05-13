Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA84EBC;
	Sat, 13 May 2023 04:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683950825; x=1715486825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e0zPPqLgBHb5ZMW8w68McaDudxmVE4w3aVWCotH7D0I=;
  b=AgyRMvKY98LSF4IJYhq46D3o5F9kodR34zyMi+7BvHJuPZ0v/MbuLZwF
   vk3KGN1O+mYWevwt0XpQEIPGwrQXS9cYnq9iVrB3AS9kP0v3no+KiNRaB
   2mVDTAmMCIUQCdGwS8FBusXxLqfJo/OD9tC4//J4K21oz0Cxa8oRrKgPL
   llEY3cPqfybxx40c7sIFVwMz0fdsOo5atcSsN6SB1qyOGhKgwr+thvFro
   2CLyoVfhI8O9J1SeYwkEHYqdAiWkr1Wz5fdUsirbKauKVLlE3oPH6neVL
   78nwoWSEWC8c6QBBlYhgN9TwXSEFng8UVMDAfaNgmIgRtEmxgmUT2Sx0G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="349764570"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="349764570"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 21:07:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="812304486"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="812304486"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 May 2023 21:07:03 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxgX8-0005Iw-2y;
	Sat, 13 May 2023 04:07:02 +0000
Date: Sat, 13 May 2023 12:06:05 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 17/30] ld.lld: error: undefined symbol:
 acpi_table_parse_cdat
Message-ID: <202305131233.sFi8xPWt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   39202ea9232fbee1624395c38cadcc5749b2319e
commit: 958d54bf9e836fd41ef0a4564e4428a876f14771 [17/30] cxl: Add callback to parse the DSMAS subtables from CDAT
config: arm64-buildonly-randconfig-r005-20230511 (https://download.01.org/0day-ci/archive/20230513/202305131233.sFi8xPWt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=958d54bf9e836fd41ef0a4564e4428a876f14771
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 958d54bf9e836fd41ef0a4564e4428a876f14771
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305131233.sFi8xPWt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: acpi_table_parse_cdat
   >>> referenced by cdat.c:37 (drivers/cxl/core/cdat.c:37)
   >>>               drivers/cxl/core/cdat.o:(cxl_cdat_endpoint_process) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
