Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F7636F
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 04:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647835482; x=1679371482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cKKD5mfiN313nSsyNSAKt0L4R4g9P01bK1PLPndNlsw=;
  b=SkTTLZzDqE8028yXmYqOTUGLshbv7+pES7Rum5MZMwJWVShzgus8J6Fx
   ShbW6MifBkBKkW3HeXCjeBb7FbG5jzzk1Zf17PHJhwq/VOpSiUsiomfLA
   BurVWtoj8M/5IYbNpyXQsGkFCO/ojDQh7xwBLtcoh6XSOHy/kW28RqDgs
   fKuNt+2lTcUehywKRz1ctq53oHZ+MpwPbcqA6TVFCbSUXk/LFhiIJjqYq
   SOrbKYGDzeioCSt/TphrNwRtLiGPqeb44x4zNB+Lk7xzi4j/gICohi9Jm
   l9aMdvY9LGAGmMqKZrIazfVZ0XFPUjPgvTEIezRdf8XtUgFCIzGBc+edA
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="320667392"
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; 
   d="scan'208";a="320667392"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2022 21:04:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; 
   d="scan'208";a="716343383"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Mar 2022 21:04:40 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nW9Hb-000HSw-J1; Mon, 21 Mar 2022 04:04:39 +0000
Date: Mon, 21 Mar 2022 12:03:51 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:master 1112/2335] mm/list_lru.c:571:5: error: conflicting
 types for '__list_lru_init'
Message-ID: <202203211142.WtwmLLlS-lkp@intel.com>
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
commit: 593cd827c40bc5cb693ee02dbfa8ddb5b14af2f3 [1112/2335] headers/deps: Add header dependencies to .c files: <linux/list_lru_api.h>
config: i386-randconfig-a016-20220314 (https://download.01.org/0day-ci/archive/20220321/202203211142.WtwmLLlS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=593cd827c40bc5cb693ee02dbfa8ddb5b14af2f3
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip master
        git checkout 593cd827c40bc5cb693ee02dbfa8ddb5b14af2f3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the mingo-tip/master HEAD 85293bf3fca6d85608cff1447ce3097583f15fab builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from mm/list_lru.c:8:
   In file included from include/linux/list_lru_api.h:1:
   include/linux/list_lru.h:42:2: error: unknown type name 'spinlock_t'
           spinlock_t              lock;
           ^
   include/linux/list_lru.h:63:14: warning: declaration of 'struct lock_class_key' will not be visible outside of this function [-Wvisibility]
                       struct lock_class_key *key, struct shrinker *shrinker);
                              ^
   include/linux/list_lru.h:142:30: error: unknown type name 'spinlock_t'
                   struct list_lru_one *list, spinlock_t *lock, void *cb_arg);
                                              ^
>> mm/list_lru.c:571:5: error: conflicting types for '__list_lru_init'
   int __list_lru_init(struct list_lru *lru, bool memcg_aware,
       ^
   include/linux/list_lru.h:62:5: note: previous declaration is here
   int __list_lru_init(struct list_lru *lru, bool memcg_aware,
       ^
   1 warning and 3 errors generated.


vim +/__list_lru_init +571 mm/list_lru.c

60d3fd32a7a9da Vladimir Davydov 2015-02-12  570  
60d3fd32a7a9da Vladimir Davydov 2015-02-12 @571  int __list_lru_init(struct list_lru *lru, bool memcg_aware,
c92e8e10cafeaa Kirill Tkhai     2018-08-17  572  		    struct lock_class_key *key, struct shrinker *shrinker)
a38e40824844a5 Dave Chinner     2013-08-28  573  {
3b1d58a4c96799 Dave Chinner     2013-08-28  574  	int i;
60d3fd32a7a9da Vladimir Davydov 2015-02-12  575  	int err = -ENOMEM;
60d3fd32a7a9da Vladimir Davydov 2015-02-12  576  

:::::: The code at line 571 was first introduced by commit
:::::: 60d3fd32a7a9da4c8c93a9f89cfda22a0b4c65ce list_lru: introduce per-memcg lists

:::::: TO: Vladimir Davydov <vdavydov@parallels.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
