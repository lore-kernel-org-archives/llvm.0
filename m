Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CC7A51;
	Fri, 12 May 2023 04:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683865180; x=1715401180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZT+0phfGiuyRf9/pUOH9S/F2FQnUXtUwcJgCX6CMR4Q=;
  b=PAOc0DBbLhdH2wWt2mR+SxDr4Pv0fRggRrkf6eMhn/ezahBShYjOeGjK
   FyN+dOvlKkl8d6WlKGD2IAg7oregFndhiAih24oPCWT591fhoMblQ213+
   fLv/GKxKUS3lEvYF7IXflIkEZ/SKsmBjm1GzrrPn4FqJuIX9qSsB7p4Al
   jEqqD0saP9fXqjvgWP7Lka72jl35RLgpLirG2k7dG9HoEwvYwW/DLMcFd
   B4cIFfJsNEFen/7bvMUR3i521nz+4PYFSK8iz8bgAJW0RoMobcZIWNCjk
   C7CARgCe2UHGW+Cnopbdpz/Mi9+h/zThenf1M2uK8Nd2Qb5AZRKHlht2M
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="340007287"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="340007287"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 21:19:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="789650902"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="789650902"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 May 2023 21:19:36 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxKFj-0004VB-1x;
	Fri, 12 May 2023 04:19:35 +0000
Date: Fri, 12 May 2023 12:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 21/29] ld.lld: error: undefined symbol:
 acpi_get_genport_coordinates
Message-ID: <202305121229.OIKpzGcr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   fd35584ec7147f575dcdc65239bc8ac7fe340ab4
commit: 18f79c4660dfce7092fd4776101511a1a5f1d983 [21/29] cxl: Store the access coordinates for the generic ports
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230512/202305121229.OIKpzGcr-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=18f79c4660dfce7092fd4776101511a1a5f1d983
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 18f79c4660dfce7092fd4776101511a1a5f1d983
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121229.OIKpzGcr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: acpi_get_genport_coordinates
   >>> referenced by acpi.c:550 (drivers/cxl/acpi.c:550)
   >>>               vmlinux.o:(add_host_bridge_dport)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
