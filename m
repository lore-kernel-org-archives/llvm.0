Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE75B7A
	for <llvm@lists.linux.dev>; Sat, 12 Feb 2022 06:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644647370; x=1676183370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lx8D/4t99L/QOb2KmlGM1cN1sBIDegNqwSPqNsEol0M=;
  b=S+XPPSPk/38sRelvF0EHCKSwzTl68wsHS8MOuzUEV8gGLoqiNWUrKhi3
   4xjpmZEfpiobuR/olwt21PheuC6e+gRAQMkKVu8Eqw/rUMWi68EVbSD/6
   qdS8ScBe9fDFSuga0xoG57ibXsXf0MFL1SuJ8T1pUjTt0YDiQGsHwi5AW
   cRy0NctZrb41spu6RBjTkxUH9Ul4pcRR+oVws3w8IySw2VhGPagnzRT8a
   +IimJI5YEdsetfQphoch3bi9S4e01G4VmtW2ShbxbzwGwBNsbSRuwKeUt
   4yiOx5+EmMZ6d7VshXtvG1ivD0e2LK+TYlLH38sMQu3gKdHkLLKiozLqM
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="247453381"
X-IronPort-AV: E=Sophos;i="5.88,363,1635231600"; 
   d="scan'208";a="247453381"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 22:29:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,363,1635231600"; 
   d="scan'208";a="702346862"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Feb 2022 22:29:28 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nIluR-0005k3-Bp; Sat, 12 Feb 2022 06:29:27 +0000
Date: Sat, 12 Feb 2022 14:28:33 +0800
From: kernel test robot <lkp@intel.com>
To: Waiman Long <longman@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:locking/core 6/7] kernel/locking/lockdep.c:6017:57:
 error: use of undeclared identifier 'offset'
Message-ID: <202202121417.yBYvheMJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   2300c94a775d0f2a733ef11285cc0abe8126edf6
commit: 065af96d73df2653a2d7da572cf8ba57218479ef [6/7] locking/lockdep: Cleanup reinit_class()
config: hexagon-buildonly-randconfig-r006-20220211 (https://download.01.org/0day-ci/archive/20220212/202202121417.yBYvheMJ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c7eb84634519e6497be42f5fe323f9a04ed67127)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=065af96d73df2653a2d7da572cf8ba57218479ef
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue locking/core
        git checkout 065af96d73df2653a2d7da572cf8ba57218479ef
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/locking/lockdep.c:6017:57: error: use of undeclared identifier 'offset'
           BUILD_BUG_ON(offsetof(struct lock_class, lock_entry) > offset);
                                                                  ^
   kernel/locking/lockdep.c:6018:58: error: use of undeclared identifier 'offset'
           BUILD_BUG_ON(offsetof(struct lock_class, locks_after) > offset);
                                                                   ^
   kernel/locking/lockdep.c:6019:59: error: use of undeclared identifier 'offset'
           BUILD_BUG_ON(offsetof(struct lock_class, locks_before) > offset);
                                                                    ^
   3 errors generated.


vim +/offset +6017 kernel/locking/lockdep.c

  6011	
  6012	static void reinit_class(struct lock_class *class)
  6013	{
  6014		WARN_ON_ONCE(!class->lock_entry.next);
  6015		WARN_ON_ONCE(!list_empty(&class->locks_after));
  6016		WARN_ON_ONCE(!list_empty(&class->locks_before));
> 6017		BUILD_BUG_ON(offsetof(struct lock_class, lock_entry) > offset);
  6018		BUILD_BUG_ON(offsetof(struct lock_class, locks_after) > offset);
  6019		BUILD_BUG_ON(offsetof(struct lock_class, locks_before) > offset);
  6020		memset_startat(class, 0, key);
  6021	}
  6022	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
