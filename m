Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0EC642
	for <llvm@lists.linux.dev>; Sun, 13 Feb 2022 23:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644795921; x=1676331921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QkeBktSYu7Zbm4nVXAP95se/pEHPyFg+wEqC9VvLHs0=;
  b=BGhUotVVZSThT5jQJiyiw/Xy3ofCh/Sf6c2zChCVjB4AtUKwUYzdnA9G
   kASb8dNvPBZfDFwr4wsxwOwVBKdCqK2SDSDE490tnzqROmgkuN1hjNEiF
   yKylXcimCtL6dgnBFs2bdZyAYpGaraFh+Uzt4FQ5YNhWvFfSIRU6jUeek
   LfakMvfks/mincbmD2PvEmi/tuWctM/L3hY/DRRS8ygDXWulcH9dqoph3
   k4dGl2xXRo9kwfEfUChqSZLSoBPsyTd1UDPhfM171h3NxwHmjw9DQJxw4
   T4N06TxAZQGUQo4wiH+t4m7Egu3naIsfU6Mp/Of9S8NI6pVKdOuqYdbAa
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="336408983"
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; 
   d="scan'208";a="336408983"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2022 15:45:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; 
   d="scan'208";a="501442416"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Feb 2022 15:45:19 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJOYQ-00080T-FY; Sun, 13 Feb 2022 23:45:18 +0000
Date: Mon, 14 Feb 2022 07:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: zhanglianjie <zhanglianjie@uniontech.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 5127/5417] mm/page-writeback.c:93:28: error:
 unused variable 'dirty_bytes_min'
Message-ID: <202202140744.t6UIHhn5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6d9bd4ad4ca08b1114e814c2c42383b8b13be631
commit: 3eb7a613cb25789b954064cf6e310f6b5ca92c03 [5127/5417] mm: move page-writeback sysctls to their own file
config: hexagon-randconfig-r041-20220213 (https://download.01.org/0day-ci/archive/20220214/202202140744.t6UIHhn5-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3eb7a613cb25789b954064cf6e310f6b5ca92c03
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3eb7a613cb25789b954064cf6e310f6b5ca92c03
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/page-writeback.c:93:28: error: unused variable 'dirty_bytes_min' [-Werror,-Wunused-const-variable]
   static const unsigned long dirty_bytes_min = 2 * PAGE_SIZE;
                              ^
   mm/page-writeback.c:509:12: error: unused function 'dirty_background_ratio_handler' [-Werror,-Wunused-function]
   static int dirty_background_ratio_handler(struct ctl_table *table, int write,
              ^
   mm/page-writeback.c:520:12: error: unused function 'dirty_background_bytes_handler' [-Werror,-Wunused-function]
   static int dirty_background_bytes_handler(struct ctl_table *table, int write,
              ^
   mm/page-writeback.c:531:12: error: unused function 'dirty_ratio_handler' [-Werror,-Wunused-function]
   static int dirty_ratio_handler(struct ctl_table *table, int write, void *buffer,
              ^
   mm/page-writeback.c:545:12: error: unused function 'dirty_bytes_handler' [-Werror,-Wunused-function]
   static int dirty_bytes_handler(struct ctl_table *table, int write,
              ^
   mm/page-writeback.c:2002:12: error: unused function 'dirty_writeback_centisecs_handler' [-Werror,-Wunused-function]
   static int dirty_writeback_centisecs_handler(struct ctl_table *table, int write,
              ^
   6 errors generated.


vim +/dirty_bytes_min +93 mm/page-writeback.c

    91	
    92	/* this is needed for the proc_doulongvec_minmax of vm_dirty_bytes */
  > 93	static const unsigned long dirty_bytes_min = 2 * PAGE_SIZE;
    94	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
