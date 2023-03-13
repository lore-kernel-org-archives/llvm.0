Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A4F2569;
	Mon, 13 Mar 2023 12:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678711219; x=1710247219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tM3YVbbEqKrhbdS3NUYB6qscn/rL6qWPC6ORbMS5pCk=;
  b=AuUY/fdYlYvIxIa0jv3ZLutAyjGp7aMbAvI9vlbmjxzsK/wEJw1gcwWl
   ndFXnUc+5l2rgC5H1MhC6VcsHWYXSMk3aS+d/3D4tYldEyqCX6nMiKec9
   gEzyFMjxgxNbiVdPjNzRlWQPrWkrgxkoF8xk50Zu6QHDsoObwzMWhj1q8
   UN77jliT5oGEkRVar60rwSTBaXdJGRmEGfpxXffrMyeXlV9ukhdQq/z+I
   hdysSu+1ggWhAnNH5/mMwXb+oBGU4C5ENtb8bfVqmIwzofVQN5dVnoVS9
   0DwC+pI6axhXw3ZR4nnWC3zCghCH2fb8BYdtzm/1otXJPj6D09lf09Oyf
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="338684272"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="338684272"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 05:40:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="924487636"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="924487636"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Mar 2023 05:40:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbhTL-0005f8-0R;
	Mon, 13 Mar 2023 12:40:15 +0000
Date: Mon, 13 Mar 2023 20:39:22 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.3.y-rt-rebase 15/47]
 kernel/printk/printk.c:3341:6: warning: variable 'index' set but not used
Message-ID: <202303132042.5MHtZ5kf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.3.y-rt-rebase
head:   5062011b37fdb8fe4bbef31168bbd956bb32ee7a
commit: 8bc429d558376b052de3bb766a424033d39e443b [15/47] serial: 8250: implement write_atomic
config: x86_64-randconfig-a014-20230313 (https://download.01.org/0day-ci/archive/20230313/202303132042.5MHtZ5kf-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=8bc429d558376b052de3bb766a424033d39e443b
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-6.3.y-rt-rebase
        git checkout 8bc429d558376b052de3bb766a424033d39e443b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/printk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303132042.5MHtZ5kf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/printk/printk.c:3341:6: warning: variable 'index' set but not used [-Wunused-but-set-variable]
           int index = 0;
               ^
   1 warning generated.


vim +/index +3341 kernel/printk/printk.c

f7ffa0536cb17d John Ogness 2022-02-04  3335  
f7ffa0536cb17d John Ogness 2022-02-04  3336  static void atomic_console_flush_all(void)
f7ffa0536cb17d John Ogness 2022-02-04  3337  {
f7ffa0536cb17d John Ogness 2022-02-04  3338  	unsigned long flags;
f7ffa0536cb17d John Ogness 2022-02-04  3339  	struct console *con;
f7ffa0536cb17d John Ogness 2022-02-04  3340  	bool any_progress;
f7ffa0536cb17d John Ogness 2022-02-04 @3341  	int index = 0;
f7ffa0536cb17d John Ogness 2022-02-04  3342  
f7ffa0536cb17d John Ogness 2022-02-04  3343  	if (console_suspended)
f7ffa0536cb17d John Ogness 2022-02-04  3344  		return;
f7ffa0536cb17d John Ogness 2022-02-04  3345  

:::::: The code at line 3341 was first introduced by commit
:::::: f7ffa0536cb17da9589ecda6513bfa0bd1fd1745 printk: add infrastucture for atomic consoles

:::::: TO: John Ogness <john.ogness@linutronix.de>
:::::: CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
