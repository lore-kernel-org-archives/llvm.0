Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F321A137B;
	Sat, 10 Jun 2023 01:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686359883; x=1717895883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LtJv4X5m3nSY4ArEGWMnLplRXfDQDm3boV5b/xSNBDk=;
  b=mZ+wO6b6a4gvk6JztNRrJPbY8wkmwIQmT/aVacnqYXbXZBFt5+D9cX2H
   zITYRbyJTXtukSpACS4xuedBSS8q2QDU1V9IHCFMj3swmB0ZViDWA7NpX
   U4IzKvbmyJ+pFNAMH0W8KvAaOD59btpMPJP6wTBVGEGpCMDoFAo9sgmBO
   TwjB7Q3UmwSeo34g07t2F23myD3xY/lwXl74e1I7L1DeNzoRHQ1xJRQMV
   QPDeqd2ZKayU4v9rniGkCp8EeKSYjv1Pa91+PvQ4RIeh6xf1Tz+UuVqoC
   TaMWce9m6kcdMwFq0d6dzhVXA0ZlJRsfFs8VsIqaxyj5lGNqQd635Ani9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="423596152"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="423596152"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 18:18:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="854917654"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="854917654"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2023 18:18:00 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7nEu-0009ZY-1D;
	Sat, 10 Jun 2023 01:18:00 +0000
Date: Sat, 10 Jun 2023 09:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:core/guards 8/58] kernel/sched/sched.h:2777:1: error:
 type specifier missing, defaults to 'int'; ISO C99 and later do not support
 implicit int
Message-ID: <202306100901.l9s051vz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards
head:   dd132e83d180b932488bcf612576529e6163a1ea
commit: 1dfde3291f560cbd428c38a34068e812b3b1e1db [8/58] sched: Simplify: migrate_swap_stop()
config: i386-buildonly-randconfig-r006-20230610 (https://download.01.org/0day-ci/archive/20230610/202306100901.l9s051vz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=1dfde3291f560cbd428c38a34068e812b3b1e1db
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue core/guards
        git checkout 1dfde3291f560cbd428c38a34068e812b3b1e1db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100901.l9s051vz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:34:
   kernel/sched/sched.h:2777:37: error: expected identifier
   DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
                                       ^
>> kernel/sched/sched.h:2777:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Werror,-Wimplicit-int]
   DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
   ^
   int
   kernel/sched/sched.h:2777:20: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
   DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
                      ^
   kernel/sched/sched.h:2779:45: error: expected ';' after top level declarator
                       double_rq_unlock(_T->lock, _T->lock2))
                                                             ^
                                                             ;
   4 errors generated.


vim +/int +2777 kernel/sched/sched.h

  2776	
> 2777	DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
  2778			    double_rq_lock(_T->lock, _T->lock2),
  2779			    double_rq_unlock(_T->lock, _T->lock2))
  2780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
