Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4282F2C
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 17:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644342903; x=1675878903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ISAFhUDFjzj9/t8WCUMLpMCCQ+CZM15k1cc8OKpYoe4=;
  b=k+qxMbIZezLJYTBZJrXb+UFDoAIq1Llx3ioL0nQd6XcW44eC08xw8FRh
   ZF3JK9Yw94CmzNE7yPeM3hQvfvBux188rJNbLEzRbOWn26H4WL9qXdLL8
   XH0+ly0T19awtxrfMyhfQbag5qWig/+kr2FSXULx32I52R1uIbPE72SFH
   /39K29XZDA0E+PTAKshnysOlKy0hYd6lKBsMUVX9WpdLTkKwAe1yQTp/e
   Luh9m+r/x+KCq3KDzM4HIYaiLYcbKMJQsQR9d6h5y/Oam1HDggAIBSOqD
   t14eMmByXE5yiSDb1Ox6QA0waha9XdQpxt9/rGV/NDYM5aPhSjJZ3ATgV
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="228980728"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; 
   d="scan'208";a="228980728"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 09:55:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; 
   d="scan'208";a="700929075"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Feb 2022 09:55:01 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHUhg-0000Y7-GZ; Tue, 08 Feb 2022 17:55:00 +0000
Date: Wed, 9 Feb 2022 01:54:06 +0800
From: kernel test robot <lkp@intel.com>
To: Vimal Agrawal <avimalin@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, 0day robot <lkp@intel.com>
Subject: kernel/module.c:4213:6: warning: no previous prototype for function
 'match_address_layout'
Message-ID: <202202090113.JTGTQqUD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/0day-ci/linux/commits/UPDATE-20220208-194118/Vimal-Agrawal/kernel-module-c-heuristic-enhancement-when-INSTALL_MOD_STRIP-strip-unneeded-is-used/20211222-212507
head:   8e6e1487d86e7fe625a0c64a5c3f4c6fc6a58a48
commit: 8e6e1487d86e7fe625a0c64a5c3f4c6fc6a58a48 modules: add heuristic when stripping unneeded symbols
date:   6 hours ago
config: s390-randconfig-r044-20220208 (https://download.01.org/0day-ci/archive/20220209/202202090113.JTGTQqUD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/8e6e1487d86e7fe625a0c64a5c3f4c6fc6a58a48
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review UPDATE-20220208-194118/Vimal-Agrawal/kernel-module-c-heuristic-enhancement-when-INSTALL_MOD_STRIP-strip-unneeded-is-used/20211222-212507
        git checkout 8e6e1487d86e7fe625a0c64a5c3f4c6fc6a58a48
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/module.c:4213:6: warning: no previous prototype for function 'match_address_layout' [-Wmissing-prototypes]
   bool match_address_layout(struct module *mod, unsigned long addr, bool init)
        ^
   kernel/module.c:4213:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool match_address_layout(struct module *mod, unsigned long addr, bool init)
   ^
   static 
   1 warning generated.


vim +/match_address_layout +4213 kernel/module.c

  4207	
  4208	/*
  4209	 * Check if module address (addr) passed is as per init passed
  4210	 * if init is true then check in init layout
  4211	 * else check in core layout
  4212	 */
> 4213	bool match_address_layout(struct module *mod, unsigned long addr, bool init)
  4214	{
  4215		if (init)
  4216			return within_module_init(addr, mod);
  4217		else
  4218			return within_module_core(addr, mod);
  4219	}
  4220	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
