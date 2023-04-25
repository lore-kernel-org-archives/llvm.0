Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAB97B;
	Tue, 25 Apr 2023 01:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682385851; x=1713921851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GCarHqMncruY6x6qBRrbIsDZRyVGEKQD+NixnUeSoTs=;
  b=DNUPtIuhq90KkJihHZEIpcyi0KiSQb88Iler/Iwo7zXHuRlN93Tqz2aY
   WFJQ9iEjfQLT295c+A0J7PzuJAfkONdKQ46OEofPT+sg9IZcr8y6jTFj9
   WJ4evNAZGx/mosJcvxdWgPo5VPyBpZd/c/aQI0DzuIi6Qtk0KGg2OxBfa
   QYo4pKtNAiGJrXCSkeHHlrqlNXjiXz274iWMLjDMYALm3XEnNqs16d8TW
   gyzKu6FtwfkgmlDk6QKlq6mhBYhA/CQfBgGM5hYK7TsX52/gkFoZSz2uo
   XcCydKKwmdHkA6gPUQw+JcVxLbDRFEX0dR0njcyUDNsvnBvC177H6SrYJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="346630131"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="346630131"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 18:24:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="867694989"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="867694989"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Apr 2023 18:24:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pr7Pc-000ioC-1b;
	Tue, 25 Apr 2023 01:24:08 +0000
Date: Tue, 25 Apr 2023 09:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop-debugobj 3/4] kernel/rcu/debug.h:130:26: error:
 use of undeclared identifier 'rcu_head_debug_data'; did you mean
 'rcuhead_debug_descr'?
Message-ID: <202304250917.i4zlsyhJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/rcutop-debugobj
head:   bb4ed72d010d114a825cba50a2f910b8a6bdadf7
commit: 2df956d971601d26c6568dd888fa0398f20e29d1 [3/4] rcu/debug: Add debugfs nodes to read data
config: riscv-randconfig-r021-20230425 (https://download.01.org/0day-ci/archive/20230425/202304250917.i4zlsyhJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=2df956d971601d26c6568dd888fa0398f20e29d1
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/rcutop-debugobj
        git checkout 2df956d971601d26c6568dd888fa0398f20e29d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/hwmon/pmbus/ drivers/rtc/ kernel/rcu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304250917.i4zlsyhJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:70:
   kernel/rcu/debug.h:52:5: warning: no previous prototype for function 'rcu_debug_cb_done' [-Wmissing-prototypes]
   int rcu_debug_cb_done(struct rcu_data *rdp, void* ip_ptr, struct rcu_head_debug_data *data)
       ^
   kernel/rcu/debug.h:52:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int rcu_debug_cb_done(struct rcu_data *rdp, void* ip_ptr, struct rcu_head_debug_data *data)
   ^
   static 
>> kernel/rcu/debug.h:130:26: error: use of undeclared identifier 'rcu_head_debug_data'; did you mean 'rcuhead_debug_descr'?
           if (WARN_ON_ONCE(sizeof(rcu_head_debug_data) > CONFIG_DEBUG_OBJECTS_RCU_HEAD_SIZE))
                                   ^~~~~~~~~~~~~~~~~~~
                                   rcuhead_debug_descr
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON_ONCE'
           int __ret_warn_on = !!(condition);                      \
                                  ^
   kernel/rcu/rcu.h:187:37: note: 'rcuhead_debug_descr' declared here
   extern const struct debug_obj_descr rcuhead_debug_descr;
                                       ^
   In file included from kernel/rcu/tree.c:70:
>> kernel/rcu/debug.h:130:49: error: use of undeclared identifier 'CONFIG_DEBUG_OBJECTS_RCU_HEAD_SIZE'
           if (WARN_ON_ONCE(sizeof(rcu_head_debug_data) > CONFIG_DEBUG_OBJECTS_RCU_HEAD_SIZE))
                                                          ^
   kernel/rcu/debug.h:126:13: warning: no previous prototype for function 'rcu_debug_init' [-Wmissing-prototypes]
   void __init rcu_debug_init(void)
               ^
   kernel/rcu/debug.h:126:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init rcu_debug_init(void)
   ^
   static 
   kernel/rcu/tree.c:2051:5: warning: no previous prototype for function 'rcu_debug_cb_done_lock' [-Wmissing-prototypes]
   int rcu_debug_cb_done_lock(struct rcu_data *rdp, void *ip, struct rcu_head_debug_data *data)
       ^
   kernel/rcu/tree.c:2051:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int rcu_debug_cb_done_lock(struct rcu_data *rdp, void *ip, struct rcu_head_debug_data *data)
   ^
   static 
   3 warnings and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_OBJECTS
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [y]:
   - RCU_DEBUGFS [=y] && DEBUG_FS [=y]


vim +130 kernel/rcu/debug.h

   125	
   126	void __init rcu_debug_init(void)
   127	{
   128		struct dentry *rcu_dir, *rcu_file;
   129	
 > 130		if (WARN_ON_ONCE(sizeof(rcu_head_debug_data) > CONFIG_DEBUG_OBJECTS_RCU_HEAD_SIZE))
   131			return;
   132	
   133		rcu_dir = debugfs_create_dir("rcu", NULL);
   134		if (!rcu_dir || IS_ERR(rcu_dir))
   135			return;
   136	
   137		rcu_file = debugfs_create_file("callbacks", 0444, rcu_dir, NULL,
   138				&rcu_debug_fops);
   139		if (!rcu_file)
   140			debugfs_remove(rcu_dir);
   141	}
   142	#else
   143	int rcu_debug_cb_done(struct rcu_data *rdp, void* ip_ptr, struct rcu_head_debug_data *data)
   144	{
   145		return -1;
   146	}
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
