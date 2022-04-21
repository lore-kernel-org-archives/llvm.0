Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5557A
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 13:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650546177; x=1682082177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=motXs5KVTHeBonIQQERqYU8O1E/gky/yojvQugo6wqo=;
  b=l9ICraCXB1owjf5eOBoEM9Ay/G8brDKSc/BOurm4RhEUxtDWML9DXx7S
   Z3loB8ILfmhWDqWjweQUlB3vQ5jCrQs2n7B/t1frv8uMf2WnELSBn3GpX
   aixnDXEN2Dth7YNxaEW68CLUK3A/knKWNus77EiffCuX+44QyeYoab5Rv
   5UfK1IgqiOYV++Azb1UP2lHbiuzUeNaSos1DGnaFkW0Of4h4BFhqGIBFP
   KDp4mcX6E7B1OAudme5Ok2IDzTCIdgA7GqK+VreSYdQVdE27A4mEeHdyi
   6NcRCeLahc3A3nK6YeMqSBar2UookZsEEjhHlHACu0X7hxUiBABiwFNui
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="324786329"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="324786329"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 06:02:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="648122772"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2022 06:02:15 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhWRq-0008Q1-O0;
	Thu, 21 Apr 2022 13:02:14 +0000
Date: Thu, 21 Apr 2022 21:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1933/2579] lib/memcat_p.c:10:8: warning: no
 previous prototype for function '__memcat_p'
Message-ID: <202204212135.0nRWoKwW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   49e1ec6c70a6eb4b7de9250a455b8b63eb42afbe
commit: b17c57b9f326f544a10178f2be4c886c4b02b4f3 [1933/2579] headers/deps: smp: Optimize <linux/smp.h> dependencies, remove <linux/smp_api.h> inclusion
config: mips-randconfig-r026-20220419 (https://download.01.org/0day-ci/archive/20220421/202204212135.0nRWoKwW-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c1c49a356162b22554088d269f7689bdb044a9f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=b17c57b9f326f544a10178f2be4c886c4b02b4f3
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout b17c57b9f326f544a10178f2be4c886c4b02b4f3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/memcat_p.c:10:8: warning: no previous prototype for function '__memcat_p' [-Wmissing-prototypes]
   void **__memcat_p(void **a, void **b)
          ^
   lib/memcat_p.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void **__memcat_p(void **a, void **b)
   ^
   static 
   1 warning generated.


vim +/__memcat_p +10 lib/memcat_p.c

93048c0944150b Alexander Shishkin 2018-10-16   4  
93048c0944150b Alexander Shishkin 2018-10-16   5  /*
93048c0944150b Alexander Shishkin 2018-10-16   6   * Merge two NULL-terminated pointer arrays into a newly allocated
93048c0944150b Alexander Shishkin 2018-10-16   7   * array, which is also NULL-terminated. Nomenclature is inspired by
93048c0944150b Alexander Shishkin 2018-10-16   8   * memset_p() and memcat() found elsewhere in the kernel source tree.
93048c0944150b Alexander Shishkin 2018-10-16   9   */
93048c0944150b Alexander Shishkin 2018-10-16 @10  void **__memcat_p(void **a, void **b)

:::::: The code at line 10 was first introduced by commit
:::::: 93048c0944150b316a15f92c41a4d626c8df37fd lib: Fix ia64 bootloader linkage

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
