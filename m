Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0B633D1;
	Fri, 21 Apr 2023 20:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682109324; x=1713645324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QHBCxNdkiOlldwYWZtZc/0FtyYj4Kdw11KkxEsdRVP8=;
  b=TexXxoZrm+O5TA7mU3d+2IyL8XqwVtBQHWBnpNnIhMl52NopZQqX7qYU
   oys1ZHLOOv9qRI3UZKoQ6Y0H+87JcEf4O0aUQp1MOvxDchMT7vcNnSjPV
   3n/9RHpMh05VZ1gpWDaw72rAJL/D3wA2Ap1ZGZN1mQFPOnUf8dcyuv7+c
   Pq7HgZY8X+abMerMFa4uJa3GpkBvnjVzMEh1MBdUKBTFFEUVZ/ysaRgx9
   YEEAFgrMVq59xpK89XLspxyuDLyqEw2OfmricZc3vWM69i4eIQURhO03E
   JF8BSR6vN9w70hLfCcjWlZEB70fr5XmkafSEBSyOU9YgUAwMYK9W6XwqK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="374012575"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="374012575"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 13:35:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="692397623"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="692397623"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Apr 2023 13:35:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppxTV-000gma-2H;
	Fri, 21 Apr 2023 20:35:21 +0000
Date: Sat, 22 Apr 2023 04:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop-debugobj 2/4] kernel/rcu/tiny.c:131:30: error: too
 few arguments to function call, expected 2, have 1
Message-ID: <202304220426.O8pV8xlf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/rcutop-debugobj
head:   6b836c3cf663fc9a4fbbe3c14bd8038f84fcd8ed
commit: 6a0f43fcea9122f89ea9994453bf0b8f3203e0a7 [2/4] rcu/debug: Add support for recording stats of RCU CBs
config: hexagon-randconfig-r041-20230421 (https://download.01.org/0day-ci/archive/20230422/202304220426.O8pV8xlf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=6a0f43fcea9122f89ea9994453bf0b8f3203e0a7
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/rcutop-debugobj
        git checkout 6a0f43fcea9122f89ea9994453bf0b8f3203e0a7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220426.O8pV8xlf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/tiny.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from kernel/rcu/tiny.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/rcu/tiny.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> kernel/rcu/tiny.c:131:30: error: too few arguments to function call, expected 2, have 1
                   debug_rcu_head_unqueue(list);
                   ~~~~~~~~~~~~~~~~~~~~~~     ^
   kernel/rcu/rcu.h:205:20: note: 'debug_rcu_head_unqueue' declared here
   static inline void debug_rcu_head_unqueue(struct rcu_head *head, struct rcu_head_debug_data **datap)
                      ^
   6 warnings and 1 error generated.


vim +131 kernel/rcu/tiny.c

77a40f97030b27 kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30  105) 
65cfe3583b612a kernel/rcu/tiny.c Paul E. McKenney        2018-07-01  106  /* Invoke the RCU callbacks whose grace period has elapsed.  */
65cfe3583b612a kernel/rcu/tiny.c Paul E. McKenney        2018-07-01  107  static __latent_entropy void rcu_process_callbacks(struct softirq_action *unused)
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  108  {
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  109  	struct rcu_head *next, *list;
4ce5b90340879c kernel/rcutiny.c  Ingo Molnar             2009-10-26  110  	unsigned long flags;
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  111  
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  112  	/* Move the ready-to-invoke callbacks to a local list. */
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  113  	local_irq_save(flags);
709fdce7545c97 kernel/rcu/tiny.c Paul E. McKenney        2018-07-03  114  	if (rcu_ctrlblk.donetail == &rcu_ctrlblk.rcucblist) {
6e91f8cb138625 kernel/rcu/tiny.c Paul E. McKenney        2015-05-11  115  		/* No callbacks ready, so just leave. */
6e91f8cb138625 kernel/rcu/tiny.c Paul E. McKenney        2015-05-11  116  		local_irq_restore(flags);
6e91f8cb138625 kernel/rcu/tiny.c Paul E. McKenney        2015-05-11  117  		return;
6e91f8cb138625 kernel/rcu/tiny.c Paul E. McKenney        2015-05-11  118  	}
709fdce7545c97 kernel/rcu/tiny.c Paul E. McKenney        2018-07-03  119  	list = rcu_ctrlblk.rcucblist;
709fdce7545c97 kernel/rcu/tiny.c Paul E. McKenney        2018-07-03  120  	rcu_ctrlblk.rcucblist = *rcu_ctrlblk.donetail;
709fdce7545c97 kernel/rcu/tiny.c Paul E. McKenney        2018-07-03  121  	*rcu_ctrlblk.donetail = NULL;
709fdce7545c97 kernel/rcu/tiny.c Paul E. McKenney        2018-07-03  122  	if (rcu_ctrlblk.curtail == rcu_ctrlblk.donetail)
709fdce7545c97 kernel/rcu/tiny.c Paul E. McKenney        2018-07-03  123  		rcu_ctrlblk.curtail = &rcu_ctrlblk.rcucblist;
709fdce7545c97 kernel/rcu/tiny.c Paul E. McKenney        2018-07-03  124  	rcu_ctrlblk.donetail = &rcu_ctrlblk.rcucblist;
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  125  	local_irq_restore(flags);
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  126  
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  127  	/* Invoke the callbacks on the local list. */
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  128  	while (list) {
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  129  		next = list->next;
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  130  		prefetch(next);
551d55a944b143 kernel/rcutiny.c  Mathieu Desnoyers       2010-04-17 @131  		debug_rcu_head_unqueue(list);
b2c0710c464ede kernel/rcutiny.c  Paul E. McKenney        2010-09-09  132  		local_bh_disable();
77a40f97030b27 kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30  133) 		rcu_reclaim_tiny(list);
b2c0710c464ede kernel/rcutiny.c  Paul E. McKenney        2010-09-09  134  		local_bh_enable();
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  135  		list = next;
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  136  	}
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  137  }
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  138  

:::::: The code at line 131 was first introduced by commit
:::::: 551d55a944b143ef26fbd482d1c463199d6f65cf tree/tiny rcu: Add debug RCU head objects

:::::: TO: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
