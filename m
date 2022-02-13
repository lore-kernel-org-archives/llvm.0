Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38082364
	for <llvm@lists.linux.dev>; Sun, 13 Feb 2022 22:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644791594; x=1676327594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=971JhnVBoFb6X05hqx76zRjjoZWkClyuYbSZUvxRits=;
  b=OkfCvpnihopGtaLC8Jimbg3iIRc3HlYKcsJyINClsEciHmdA6J+aulIq
   dju95r1n6uugaoGrg3Jod96ebBJwstKIy4Iem46eSL2dzp1/MhXRnW83u
   Ghxd2nWThdiSsQCJHgEkA8/IdRzf4hTVKNXSU3KxkWJU2zHlq1h1jOw/T
   MmRAH7zqxMekeVGII76oVEiV5C2tqpbNds8yOJ8P1cIiALEF4XwTlrV1D
   5UK+UEuZo/ubEpuCboJVRFAUCvlyopZ+IiE+LZ2KhyYW9iy6PLfVf1EIY
   AwYDYVlVcyEQ2Kwk02aFkgrZTqGWdg1dfaMWqeN+tQbD/JP3NaBPQxeap
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="274543834"
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; 
   d="scan'208";a="274543834"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2022 14:33:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; 
   d="scan'208";a="569714200"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Feb 2022 14:33:11 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJNQc-0007vG-La; Sun, 13 Feb 2022 22:33:10 +0000
Date: Mon, 14 Feb 2022 06:32:40 +0800
From: kernel test robot <lkp@intel.com>
To: Shakeel Butt <shakeelb@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Muchun Song <songmuchun@bytedance.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: mm/memcontrol.c:2774:20: error: unused function 'cancel_charge'
Message-ID: <202202140629.MxlIbXOG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   754e0b0e35608ed5206d6a67a791563c631cec07
commit: 58056f77502f3567b760c9a8fc8d2e9081515b2d memcg, kmem: further deprecate kmem.limit_in_bytes
date:   3 months ago
config: arm-randconfig-r005-20220213 (https://download.01.org/0day-ci/archive/20220214/202202140629.MxlIbXOG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=58056f77502f3567b760c9a8fc8d2e9081515b2d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 58056f77502f3567b760c9a8fc8d2e9081515b2d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/memcontrol.c:2774:20: error: unused function 'cancel_charge' [-Werror,-Wunused-function]
   static inline void cancel_charge(struct mem_cgroup *memcg, unsigned int nr_pages)
                      ^
   mm/memcontrol.c:3339:19: error: unused function 'mem_cgroup_move_swap_account' [-Werror,-Wunused-function]
   static inline int mem_cgroup_move_swap_account(swp_entry_t entry,
                     ^
   2 errors generated.


vim +/cancel_charge +2774 mm/memcontrol.c

  2773	
> 2774	static inline void cancel_charge(struct mem_cgroup *memcg, unsigned int nr_pages)
  2775	{
  2776		if (mem_cgroup_is_root(memcg))
  2777			return;
  2778	
  2779		page_counter_uncharge(&memcg->memory, nr_pages);
  2780		if (do_memsw_account())
  2781			page_counter_uncharge(&memcg->memsw, nr_pages);
  2782	}
  2783	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
