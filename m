Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229482F2D
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 10:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647598162; x=1679134162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m/eQcFrpbCOuyJXwX+M3RqbhevfZRYc4a3xFNpq3x0M=;
  b=UaJpzR363I3uG5lClFqIvmemnrVzadrOQsaWFV3+fRZyXfk8dTqpwJEI
   80yBqSQBclbtkZ3j/qU1e7lAnKx9SyPpmsK3ezgGTyXsJgDeaUp37W1nQ
   5ncgrl8jsuFJAYLrN5sYugshNNrED7RPqTMzLyXG7zeb2ix20HRXjYor6
   kO6ZmVnJg+TR5C9RXL7Jqe15TmnWedR+Nun5TJo35jxuUP0JvTDYXSXCH
   n7zjprrtsel7IzCbcpK/6rsiZVq3282qUASbbC4VbJ6TYzYOmvTJLKgfu
   1DGhjz7uGefvjr4X6JFHbaAo0X9Kww9DGOo/zlo+YjPdpRxhONRO8k99D
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254661984"
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; 
   d="scan'208";a="254661984"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 03:09:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="715409557"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 18 Mar 2022 03:09:19 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nV9Xq-000EeD-R9; Fri, 18 Mar 2022 10:09:18 +0000
Date: Fri, 18 Mar 2022 18:08:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:master 1788/2335] lib/memcat_p.c:10:8: warning: no
 previous prototype for function '__memcat_p'
Message-ID: <202203181728.i1dteMPk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git master
head:   85293bf3fca6d85608cff1447ce3097583f15fab
commit: f4a35864aeccc248d3c2122bf0a8f2ba77ea8c2f [1788/2335] headers/deps: smp: Optimize <linux/smp.h> dependencies, remove <linux/smp_api.h> inclusion
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220318/202203181728.i1dteMPk-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=f4a35864aeccc248d3c2122bf0a8f2ba77ea8c2f
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip master
        git checkout f4a35864aeccc248d3c2122bf0a8f2ba77ea8c2f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

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

93048c0944150b3 Alexander Shishkin 2018-10-16   4  
93048c0944150b3 Alexander Shishkin 2018-10-16   5  /*
93048c0944150b3 Alexander Shishkin 2018-10-16   6   * Merge two NULL-terminated pointer arrays into a newly allocated
93048c0944150b3 Alexander Shishkin 2018-10-16   7   * array, which is also NULL-terminated. Nomenclature is inspired by
93048c0944150b3 Alexander Shishkin 2018-10-16   8   * memset_p() and memcat() found elsewhere in the kernel source tree.
93048c0944150b3 Alexander Shishkin 2018-10-16   9   */
93048c0944150b3 Alexander Shishkin 2018-10-16 @10  void **__memcat_p(void **a, void **b)

:::::: The code at line 10 was first introduced by commit
:::::: 93048c0944150b316a15f92c41a4d626c8df37fd lib: Fix ia64 bootloader linkage

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
