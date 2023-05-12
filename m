Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEFC819;
	Fri, 12 May 2023 04:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683864577; x=1715400577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r9ZFjeKq2ZOmrV1kC3sKxzdwFCqg7XWU1RN9CIr3QzA=;
  b=Fh2DmjY1F+hnKL36cyn5z+MTUQwLqNp9MH5zNDmIiaL0pDb2Zxa0HPKq
   9gxCkBgzpddQ8rLwWPmMtnq9wVX6b8knPd3hnhqPfC83Ym0MMoCxP4iVv
   FIYuiaf780GlEIR7ORb2q52csIN2eg9jF9a78YfMxmSUrS9uZjXxuc+wd
   xaE9rwtACWFNjZgbXYCuZbRyf0aoQwoF7uSfAZVDhGAWSfNrGIQYY75U/
   2MAh1B2WWujSSiW6Bp7gEdKoLm//wjTGpnteWvdhcKXFWhOtFMkQtmaeS
   6759sGNLRrFsjBwdQReR/oGqxZzffxVDfrPx8TjJ7DYusNgEWO8a/DjjG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="414062336"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="414062336"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 21:09:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="694077274"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="694077274"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 May 2023 21:09:36 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxK63-0004UG-0P;
	Fri, 12 May 2023 04:09:35 +0000
Date: Fri, 12 May 2023 12:09:10 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 22/30] ld.lld: error: undefined symbol:
 acpi_get_genport_coordinates
Message-ID: <202305121111.YOyD23yp-lkp@intel.com>
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
commit: d37b575b54f54d44a5fef781206685ed0c739998 [22/30] cxl: Store the access coordinates for the generic ports
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230512/202305121111.YOyD23yp-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=d37b575b54f54d44a5fef781206685ed0c739998
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout d37b575b54f54d44a5fef781206685ed0c739998
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121111.YOyD23yp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: acpi_get_genport_coordinates
   >>> referenced by acpi.c:550 (drivers/cxl/acpi.c:550)
   >>>               vmlinux.o:(add_host_bridge_dport)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
