Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583FD6FC5;
	Tue,  7 Mar 2023 14:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678199170; x=1709735170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C+vN8CZndHt/aOxLG8xht1r+RuQlIpvpTJzrOJfMD/E=;
  b=B2sivvhLSjqA8rEItNOUA/sK0ybcHaBxNTajwb0WDlRfLyO02CCZHOcg
   ARIhhVGv3bq/g5hhWRtzGxPn6u2PfbXrOgkSWUWSht4Kq1qYoDAIK3l1Q
   cDwuZY+ePwe8qnpUGd0KnjhHrT2XYAF6qqzRgwPfPRGfImkaj6vNzeqFs
   6ePucfG7uU/PBSY8f0LTEEE5xedgNP7D/LUgFgOKQ9ZEycvYlBjpwZ3ex
   aI8rvCOQaN4HyEB+Bae/jwa0URY7bPCx7yuUYpLFGC3SIrGKr1WXE9p4+
   eGXQ0rGrYny/s8wSI2eNTK3hs3Pot7AG/SW3rHBKfWjfnIyJo8dNhGBl2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="422133560"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="422133560"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 06:26:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="740738383"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="740738383"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Mar 2023 06:26:08 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZYGW-0001Nv-0j;
	Tue, 07 Mar 2023 14:26:08 +0000
Date: Tue, 7 Mar 2023 22:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:unmapped-alloc/rfc-v1 3/5] mm/unmapped-alloc.c:209:68:
 warning: omitting the parameter name in a function definition is a C2x
 extension
Message-ID: <202303072239.6LYSTvNT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git unmapped-alloc/rfc-v1
head:   c10ae02315f6ea2dd0b6c74a8ba82ea7ca33cda2
commit: 019ccefbdd822ecc1be1cfcc7682f2f6813bc4a6 [3/5] mm/unmapped_alloc: add shrinker
config: x86_64-randconfig-a014-20230306 (https://download.01.org/0day-ci/archive/20230307/202303072239.6LYSTvNT-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=019ccefbdd822ecc1be1cfcc7682f2f6813bc4a6
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt unmapped-alloc/rfc-v1
        git checkout 019ccefbdd822ecc1be1cfcc7682f2f6813bc4a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303072239.6LYSTvNT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/unmapped-alloc.c:209:68: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static unsigned long unmapped_alloc_count_objects(struct shrinker *,
                                                                      ^
   1 warning generated.


vim +209 mm/unmapped-alloc.c

   208	
 > 209	static unsigned long unmapped_alloc_count_objects(struct shrinker *,
   210							  struct shrink_control *sc)
   211	{
   212		unsigned long pages_to_free = 0;
   213	
   214		for (int order = 0; order < MAX_ORDER; order++)
   215			pages_to_free += (free_area[order].nr_free << order);
   216	
   217		return pages_to_free;
   218	}
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
