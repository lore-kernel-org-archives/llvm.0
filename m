Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B266D10EF;
	Sat, 17 Jun 2023 23:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687043095; x=1718579095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LeUuyl6k9g4M86jtWsdCHOA0kKOzdqkFAsSujAYn4qY=;
  b=JhoghQR3SMNDihXV6vns48VuJosP/blZW5/Y8Q7cNMyw++14/oGBR0Jb
   g1ABMJmiYPPc48vYHHckGhEIIajGZcV8j37+H+Qu6raIdUzVFLCTtjuA3
   lEATdeBH+4P0+WUx6DkoPvj+bmb0Jv0WvHAKJ5KGQ49Zt4dpv+MPO3vrD
   u+8npQfNX77aI8ao+CnHm2pm9lgtge4e7dlt8+xozxbK6a3fgD7ygtwXB
   HZgq33jCn2fEY6iyT2qlIS05zdDHNAW86pZTGY6Jk5TrQBBv75b4kL8uC
   l6F10QbFsjloUi8P3BRIx2rmmL02zC+u8Erq2cloVg3SraYPQgXVMneU8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="339764144"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="339764144"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 16:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="857788480"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="857788480"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2023 16:04:53 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAeyT-0003By-0S;
	Sat, 17 Jun 2023 23:04:53 +0000
Date: Sun, 18 Jun 2023 07:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 16/17]
 kernel/pid_namespace.c:476:9: error: too many arguments to function call,
 expected 2, have 3
Message-ID: <202306180744.JQOesG7e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   cbba378db4b97256c72560da5762aaed778957c0
commit: b1f6ed030567099a052906e9af1bdc6e6f9e5285 [16/17] sysctl: Add size to register_sysctl_init
config: x86_64-buildonly-randconfig-r003-20230618 (https://download.01.org/0day-ci/archive/20230618/202306180744.JQOesG7e-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180744.JQOesG7e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180744.JQOesG7e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/pid_namespace.c:476:9: error: too many arguments to function call, expected 2, have 3
                                ARRAY_SIZE(pid_ns_ctl_table));
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:25: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:258:20: note: 'register_sysctl_init' declared here
   static inline void register_sysctl_init(const char *path, struct ctl_table *table)
                      ^
   1 error generated.
--
>> fs/quota/dquot.c:2957:9: error: too many arguments to function call, expected 2, have 3
                                ARRAY_SIZE(fs_dqstats_table));
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:25: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:258:20: note: 'register_sysctl_init' declared here
   static inline void register_sysctl_init(const char *path, struct ctl_table *table)
                      ^
   1 error generated.


vim +476 kernel/pid_namespace.c

   469	
   470	static __init int pid_namespaces_init(void)
   471	{
   472		pid_ns_cachep = KMEM_CACHE(pid_namespace, SLAB_PANIC | SLAB_ACCOUNT);
   473	
   474	#ifdef CONFIG_CHECKPOINT_RESTORE
   475		register_sysctl_init("kernel", pid_ns_ctl_table,
 > 476				     ARRAY_SIZE(pid_ns_ctl_table));
   477	#endif
   478	
   479		register_pid_ns_sysctl_table_vm();
   480		return 0;
   481	}
   482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
