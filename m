Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ACD1F956;
	Thu, 11 May 2023 14:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683814794; x=1715350794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3vKeUp1MgKXuPO2KHbni+kKpyIP8A1nYuuHf6QGEErM=;
  b=ZKr706xpbjnnxBKIo67wDt1o0bIZFcuKtxcstQ6H/tzyKkAK64DBAHV2
   U6L/zDbrV9wPUc0oCbAAFKBQoz6IEgpWjdo57DTF5bVXCGuJht6Th0L2m
   QYfpySG1yjw4nHZDvw6g+YMZ/mHqK0YWeQDwb/uyfNUxkFVSb44csenVe
   jLhtSyY1EHZZSsvN1AQYBlCzpMz8QtHRHb1svu1wF3Xu6GevEQPan4Ka7
   ub0KA1U08GgSddypw2b6U6QPtpofenFrrxaq/pNB9e17hX9UcPkKg9W8R
   o0GJ1X6dxM5kM12pi+kFWcIojlhvO5yFxhpJOd/b0jKtttxTk/jDR3gsb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="413863234"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="413863234"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 07:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="732592975"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="732592975"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 May 2023 07:15:28 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1px74p-00042e-2U;
	Thu, 11 May 2023 14:15:27 +0000
Date: Thu, 11 May 2023 22:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Roesch <shr@devkernel.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: mm/ksm.c:2439:13: warning: stack frame size (2576) exceeds limit
 (2048) in 'ksm_do_scan'
Message-ID: <202305112201.5lqIyEo4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   80e62bc8487b049696e67ad133c503bf7f6806f7
commit: 739100c88f49a67c6487bb2d826b0b5a2ddc80e2 mm: add tracepoints to ksm
date:   6 weeks ago
config: mips-randconfig-r023-20230511 (https://download.01.org/0day-ci/archive/20230511/202305112201.5lqIyEo4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=739100c88f49a67c6487bb2d826b0b5a2ddc80e2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 739100c88f49a67c6487bb2d826b0b5a2ddc80e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305112201.5lqIyEo4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/ksm.c:2439:13: warning: stack frame size (2576) exceeds limit (2048) in 'ksm_do_scan' [-Wframe-larger-than]
   static void ksm_do_scan(unsigned int scan_npages)
               ^
   2492/2576 (96.74%) spills, 84/2576 (3.26%) variables
   1 warning generated.


vim +/ksm_do_scan +2439 mm/ksm.c

31dbd01f314364 Izik Eidus       2009-09-21  2434  
31dbd01f314364 Izik Eidus       2009-09-21  2435  /**
31dbd01f314364 Izik Eidus       2009-09-21  2436   * ksm_do_scan  - the ksm scanner main worker function.
b7701a5f2ee8e6 Mike Rapoport    2018-02-06  2437   * @scan_npages:  number of pages we want to scan before we return.
31dbd01f314364 Izik Eidus       2009-09-21  2438   */
31dbd01f314364 Izik Eidus       2009-09-21 @2439  static void ksm_do_scan(unsigned int scan_npages)
31dbd01f314364 Izik Eidus       2009-09-21  2440  {
21fbd59136e077 Qi Zheng         2022-08-31  2441  	struct ksm_rmap_item *rmap_item;
3f649ab728cda8 Kees Cook        2020-06-03  2442  	struct page *page;
31dbd01f314364 Izik Eidus       2009-09-21  2443  
878aee7d6b5504 Andrea Arcangeli 2011-01-13  2444  	while (scan_npages-- && likely(!freezing(current))) {
31dbd01f314364 Izik Eidus       2009-09-21  2445  		cond_resched();
31dbd01f314364 Izik Eidus       2009-09-21  2446  		rmap_item = scan_get_next_rmap_item(&page);
31dbd01f314364 Izik Eidus       2009-09-21  2447  		if (!rmap_item)
31dbd01f314364 Izik Eidus       2009-09-21  2448  			return;
31dbd01f314364 Izik Eidus       2009-09-21  2449  		cmp_and_merge_page(page, rmap_item);
31dbd01f314364 Izik Eidus       2009-09-21  2450  		put_page(page);
31dbd01f314364 Izik Eidus       2009-09-21  2451  	}
31dbd01f314364 Izik Eidus       2009-09-21  2452  }
31dbd01f314364 Izik Eidus       2009-09-21  2453  

:::::: The code at line 2439 was first introduced by commit
:::::: 31dbd01f314364b70c2e026a5793a29a4da8a9dc ksm: Kernel SamePage Merging

:::::: TO: Izik Eidus <ieidus@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
