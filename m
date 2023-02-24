Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21738BA32;
	Fri, 24 Feb 2023 21:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677275772; x=1708811772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lGbvnPNyDBc/qCrDYdPMescgbOt7Sw9ZZSBRu1eaDvI=;
  b=RpIrw1OH7MgIAd19XhgYWBoxPFjONfbwmT5bRJ78wNsrjsmO2bwTaYo6
   i+GZ0NOZIxF5TJBfm7U/T9h2zNPEjYFoKm8orvgPhpTPXwSYCNEB8AE84
   +Ycc1REwAgE15La9xum1DXbqltHKRly5FGSXNkG+y3qlRIj2gfEsombw/
   GNJ13pHhB35bcGdRzSJcSSY2vgo/YmqhfO4hSpTtgCbxchBjXH6lERr2o
   6aXyrcFBSVRtul6n4TaRYauXs0pr9MPnyQowDE4d7UjfjQ7PYXgxgoNh1
   kRK9obndqwDolJfrLz94ROtczTRLcp6sXOldK7t0DQi1Z/IHkfCAM6hTc
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="313978544"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="313978544"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 13:56:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="673037605"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="673037605"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Feb 2023 13:56:09 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVg2y-0002kZ-1V;
	Fri, 24 Feb 2023 21:56:08 +0000
Date: Sat, 25 Feb 2023 05:55:30 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split 30/30]
 ipc/sem.c:1651:13: warning: stack frame size (1176) exceeds limit (1024) in
 'ksys_semctl'
Message-ID: <202302250541.pCuwTOpA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
head:   35ac5a9a53d2554bda395cdfa3236d278715caac
commit: 35ac5a9a53d2554bda395cdfa3236d278715caac [30/30] hack passing kernel_init()
config: arm-randconfig-r035-20230222 (https://download.01.org/0day-ci/archive/20230225/202302250541.pCuwTOpA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=35ac5a9a53d2554bda395cdfa3236d278715caac
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
        git checkout 35ac5a9a53d2554bda395cdfa3236d278715caac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250541.pCuwTOpA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ipc/sem.c:1651:13: warning: stack frame size (1176) exceeds limit (1024) in 'ksys_semctl' [-Wframe-larger-than]
   static long ksys_semctl(int semid, int semnum, int cmd, unsigned long arg, int version)
               ^
   60/1176 (5.10%) spills, 1116/1176 (94.90%) variables
   1 warning generated.


vim +/ksys_semctl +1651 ipc/sem.c

^1da177e4c3f415 Linus Torvalds      2005-04-16  1650  
275f22148e8720e Arnd Bergmann       2018-12-31 @1651  static long ksys_semctl(int semid, int semnum, int cmd, unsigned long arg, int version)
^1da177e4c3f415 Linus Torvalds      2005-04-16  1652  {
e38935341a31054 Kirill Korotaev     2006-10-02  1653  	struct ipc_namespace *ns;
e1fd1f490fa4213 Al Viro             2013-03-05  1654  	void __user *p = (void __user *)arg;
45a4a64ab485d5c Al Viro             2017-07-09  1655  	struct semid64_ds semid64;
45a4a64ab485d5c Al Viro             2017-07-09  1656  	int err;
^1da177e4c3f415 Linus Torvalds      2005-04-16  1657  
^1da177e4c3f415 Linus Torvalds      2005-04-16  1658  	if (semid < 0)
^1da177e4c3f415 Linus Torvalds      2005-04-16  1659  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds      2005-04-16  1660  
e38935341a31054 Kirill Korotaev     2006-10-02  1661  	ns = current->nsproxy->ipc_ns;
^1da177e4c3f415 Linus Torvalds      2005-04-16  1662  
^1da177e4c3f415 Linus Torvalds      2005-04-16  1663  	switch (cmd) {
^1da177e4c3f415 Linus Torvalds      2005-04-16  1664  	case IPC_INFO:
^1da177e4c3f415 Linus Torvalds      2005-04-16  1665  	case SEM_INFO:
45a4a64ab485d5c Al Viro             2017-07-09  1666  		return semctl_info(ns, semid, cmd, p);
4b9fcb0ec60584d Pierre Peiffer      2008-02-08  1667  	case IPC_STAT:
^1da177e4c3f415 Linus Torvalds      2005-04-16  1668  	case SEM_STAT:
a280d6dc77eb600 Davidlohr Bueso     2018-04-10  1669  	case SEM_STAT_ANY:
45a4a64ab485d5c Al Viro             2017-07-09  1670  		err = semctl_stat(ns, semid, cmd, &semid64);
45a4a64ab485d5c Al Viro             2017-07-09  1671  		if (err < 0)
45a4a64ab485d5c Al Viro             2017-07-09  1672  			return err;
45a4a64ab485d5c Al Viro             2017-07-09  1673  		if (copy_semid_to_user(p, &semid64, version))
45a4a64ab485d5c Al Viro             2017-07-09  1674  			err = -EFAULT;
45a4a64ab485d5c Al Viro             2017-07-09  1675  		return err;
^1da177e4c3f415 Linus Torvalds      2005-04-16  1676  	case GETALL:
^1da177e4c3f415 Linus Torvalds      2005-04-16  1677  	case GETVAL:
^1da177e4c3f415 Linus Torvalds      2005-04-16  1678  	case GETPID:
^1da177e4c3f415 Linus Torvalds      2005-04-16  1679  	case GETNCNT:
^1da177e4c3f415 Linus Torvalds      2005-04-16  1680  	case GETZCNT:
^1da177e4c3f415 Linus Torvalds      2005-04-16  1681  	case SETALL:
e1fd1f490fa4213 Al Viro             2013-03-05  1682  		return semctl_main(ns, semid, semnum, cmd, p);
45a4a64ab485d5c Al Viro             2017-07-09  1683  	case SETVAL: {
45a4a64ab485d5c Al Viro             2017-07-09  1684  		int val;
45a4a64ab485d5c Al Viro             2017-07-09  1685  #if defined(CONFIG_64BIT) && defined(__BIG_ENDIAN)
45a4a64ab485d5c Al Viro             2017-07-09  1686  		/* big-endian 64bit */
45a4a64ab485d5c Al Viro             2017-07-09  1687  		val = arg >> 32;
45a4a64ab485d5c Al Viro             2017-07-09  1688  #else
45a4a64ab485d5c Al Viro             2017-07-09  1689  		/* 32bit or little-endian 64bit */
45a4a64ab485d5c Al Viro             2017-07-09  1690  		val = arg;
45a4a64ab485d5c Al Viro             2017-07-09  1691  #endif
45a4a64ab485d5c Al Viro             2017-07-09  1692  		return semctl_setval(ns, semid, semnum, val);
45a4a64ab485d5c Al Viro             2017-07-09  1693  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  1694  	case IPC_SET:
45a4a64ab485d5c Al Viro             2017-07-09  1695  		if (copy_semid_from_user(&semid64, p, version))
45a4a64ab485d5c Al Viro             2017-07-09  1696  			return -EFAULT;
df561f6688fef77 Gustavo A. R. Silva 2020-08-23  1697  		fallthrough;
45a4a64ab485d5c Al Viro             2017-07-09  1698  	case IPC_RMID:
45a4a64ab485d5c Al Viro             2017-07-09  1699  		return semctl_down(ns, semid, cmd, &semid64);
^1da177e4c3f415 Linus Torvalds      2005-04-16  1700  	default:
^1da177e4c3f415 Linus Torvalds      2005-04-16  1701  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds      2005-04-16  1702  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  1703  }
^1da177e4c3f415 Linus Torvalds      2005-04-16  1704  

:::::: The code at line 1651 was first introduced by commit
:::::: 275f22148e8720e84b180d9e0cdf8abfd69bac5b ipc: rename old-style shmctl/semctl/msgctl syscalls

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
