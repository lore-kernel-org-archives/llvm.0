Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A3C5688;
	Thu, 20 Apr 2023 12:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681995103; x=1713531103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DNcxqjV0tgSOBl2vw77/oJ/xpDsWn0w/fRbLCUKeRzI=;
  b=j+WAQpiPMS+TOXlfIEa+KJuo2kCZsLn/M8vszN8/1cJhT2XX1CQR5hz2
   DpZkV7B2L8bsbrwG/qljai47+c7KTgQlXvkFHarludtNb7rl1UuOQBujP
   QyJOegHaLbD3F7qMAcO4PXmpbkO+Eid64kJT3Am7AGJVWMq+C0zyobv+T
   8THhdNdM3U4mFKiqlFHfjGLONQ/rG6gEnnGUvK9qRhnUmVKH73l8sXHSF
   sJn60C97aOF6b34vJYo82kiT8ETiwWCeGmIE0j8IefDytH9pGj26XrmBW
   rJjfPPZQgTYwpmvyOGdAuv0unSKVmq7yOiq6/xVQo/OxMz1nKbd3vR643
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="334557357"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="334557357"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 05:51:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="816002860"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="816002860"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Apr 2023 05:51:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppTlF-000fqE-0f;
	Thu, 20 Apr 2023 12:51:41 +0000
Date: Thu, 20 Apr 2023 20:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: Zack Rusin <zackr@vmware.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>
Subject: Inconsistent kallsyms data
Message-ID: <202304202029.z4wDrmhv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb0856346a60fe3eb837ba5e73588a41f81ac05f
commit: a2a04b515562bbb040e8ae3decae8c1e9ef05327 Merge tag 'drm-misc-fixes-2023-02-16' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
date:   9 weeks ago
config: arm-buildonly-randconfig-r006-20230418 (https://download.01.org/0day-ci/archive/20230420/202304202029.z4wDrmhv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a2a04b515562bbb040e8ae3decae8c1e9ef05327
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a2a04b515562bbb040e8ae3decae8c1e9ef05327
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304202029.z4wDrmhv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Inconsistent kallsyms data
   Try make KALLSYMS_EXTRA_PASS=1 as a workaround

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
