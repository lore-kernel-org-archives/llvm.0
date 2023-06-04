Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A065CB9;
	Sun,  4 Jun 2023 16:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685894939; x=1717430939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wUWTk6zRjgY3dY35Db6TK/S5kI1m01GuZLAw3jtnZ78=;
  b=Xt6/7u8OXaA48gockp8w6H9t6AdDCKhWziY5laH9Qsw8vXpOW1mJ7aSh
   N9fsYeVTPoKQ5IkaiKVylPv3XN8R5H+zRPU5TzZOjgCAaUs0g01dHzZNh
   cbTPiOrs6QbHJUijDKJ3BnNh2nUMXqToTCwWpNJTb1LjjvAEEYLTJKvGk
   nBKiOx292QQW+wyXV2CJgnVQTigBkM8N1LLsG2V31HSoAzla5Jf++wh3L
   Vn5USo50KXOo2QvtIKqXIG/sjauyXXr9TRIAVWSUJUZW+dWzUVpE6fApt
   ocsjAjEqed2C1vzfmDB/ukY6jHUnI8FwE36Z6OjX3zfJHL3/1zhyIqsHz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="340836897"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="340836897"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 09:08:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="685866421"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="685866421"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Jun 2023 09:08:57 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5qHp-00035N-0R;
	Sun, 04 Jun 2023 16:08:57 +0000
Date: Mon, 5 Jun 2023 00:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [wtarreau-nolibc:20230604-nolibc-rv32+stkp6 78/118]
 kernel/rcu/tasks.h:1932:9: error: use of undeclared identifier 'rcu_tasks'
Message-ID: <202306050029.1dxeRWhd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git 20230604-nolibc-rv32+stkp6
head:   a76324560e0f8f916d89452dd6aec1104e97a3c6
commit: 9486af7280fda4a0b8347a1abcdcaba70a67d89b [78/118] rcuscale: Measure RCU Tasks grace-period kthread CPU time
config: s390-buildonly-randconfig-r006-20230604 (https://download.01.org/0day-ci/archive/20230605/202306050029.1dxeRWhd-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git/commit/?id=9486af7280fda4a0b8347a1abcdcaba70a67d89b
        git remote add wtarreau-nolibc https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git
        git fetch --no-tags wtarreau-nolibc 20230604-nolibc-rv32+stkp6
        git checkout 9486af7280fda4a0b8347a1abcdcaba70a67d89b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306050029.1dxeRWhd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/rcu/update.c:39:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from kernel/rcu/update.c:39:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from kernel/rcu/update.c:39:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from kernel/rcu/update.c:649:
>> kernel/rcu/tasks.h:1932:9: error: use of undeclared identifier 'rcu_tasks'
           return rcu_tasks.kthread_ptr;
                  ^
>> kernel/rcu/tasks.h:1930:21: warning: no previous prototype for function 'get_rcu_tasks_gp_kthread' [-Wmissing-prototypes]
   struct task_struct *get_rcu_tasks_gp_kthread(void)
                       ^
   kernel/rcu/tasks.h:1930:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct task_struct *get_rcu_tasks_gp_kthread(void)
   ^
   static 
   13 warnings and 1 error generated.


vim +/rcu_tasks +1932 kernel/rcu/tasks.h

  1929	
> 1930	struct task_struct *get_rcu_tasks_gp_kthread(void)
  1931	{
> 1932		return rcu_tasks.kthread_ptr;
  1933	}
  1934	EXPORT_SYMBOL_GPL(get_rcu_tasks_gp_kthread);
  1935	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
