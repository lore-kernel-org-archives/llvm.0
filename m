Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5BE139D
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 08:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645692138; x=1677228138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H2NvUQuh/hIsDCpCD7jZ0OUo1ITyn8jWV4GJZX4zgj0=;
  b=MPFa2I1peVRIvScWsFRoxl/hLEEKvf6JKL8owAhPe4jhtmVpkkOdTSmY
   5+WB4Rj/9A1V+AZ8iwd0YxoFWtEemYAV+usbV+rfPAdyjNBSpywUyl68a
   P4+x9LW4b2SZqsj33RcR6tuHMRrjVXVLPS1ZkwbWMhXI9GxY4geZlNYiN
   iIJ6QmGwucGf7xqCZ2itjORtkoMiGfYFi1GDroH8IYRp6thqhF05V4f8q
   JyH5WCWDMZi63Fs60w7XQGYLyXRrNOEjt6hUXjcESAMRETzWBwXCZZ0cy
   cE1Mwum0iWvaRW2iFRwOdHgf2IBE0UGXzlrFUci4L3ctHkdn7ajJXdTkG
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="312899316"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; 
   d="scan'208";a="312899316"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2022 00:42:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; 
   d="scan'208";a="707376322"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Feb 2022 00:42:16 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nN9hY-0002us-2W; Thu, 24 Feb 2022 08:42:16 +0000
Date: Thu, 24 Feb 2022 16:41:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [linux-next:master 6791/7915] arch/mips/kernel/mips-mt.c:246:1:
 error: incompatible function pointer types initializing 'initcall_t' (aka
 'int (*)(void)') with an expression of type 'void (struct maple_tree *)'
Message-ID: <202202241635.ib4YRtz7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d4a0ae62a277377de396850ed4b709b6bd9b7326
commit: 37f4270132af31dd08a209799d420f72bfddb49c [6791/7915] mm: Start tracking VMAs with maple tree
config: mips-maltaup_defconfig (https://download.01.org/0day-ci/archive/20220224/202202241635.ib4YRtz7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=37f4270132af31dd08a209799d420f72bfddb49c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 37f4270132af31dd08a209799d420f72bfddb49c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/mips/kernel/mips-mt.c:50:6: warning: no previous prototype for function 'mips_mt_regdump' [-Wmissing-prototypes]
   void mips_mt_regdump(unsigned long mvpctl)
        ^
   arch/mips/kernel/mips-mt.c:50:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mips_mt_regdump(unsigned long mvpctl)
   ^
   static 
   arch/mips/kernel/mips-mt.c:159:6: warning: no previous prototype for function 'mips_mt_set_cpuoptions' [-Wmissing-prototypes]
   void mips_mt_set_cpuoptions(void)
        ^
   arch/mips/kernel/mips-mt.c:159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mips_mt_set_cpuoptions(void)
   ^
   static 
>> arch/mips/kernel/mips-mt.c:233:19: error: conflicting types for 'mt_init'
   static int __init mt_init(void)
                     ^
   include/linux/maple_tree.h:589:20: note: previous definition is here
   static inline void mt_init(struct maple_tree *mt)
                      ^
>> arch/mips/kernel/mips-mt.c:246:1: error: incompatible function pointer types initializing 'initcall_t' (aka 'int (*)(void)') with an expression of type 'void (struct maple_tree *)' [-Werror,-Wincompatible-function-pointer-types]
   subsys_initcall(mt_init);
   ^               ~~~~~~~
   include/linux/init.h:286:30: note: expanded from macro 'subsys_initcall'
   #define subsys_initcall(fn)             __define_initcall(fn, 4)
                                           ^                 ~~
   include/linux/init.h:262:35: note: expanded from macro '__define_initcall'
   #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
                                     ^                  ~~
   include/linux/init.h:260:2: note: expanded from macro '___define_initcall'
           __unique_initcall(fn, id, __sec, __initcall_id(fn))
           ^                 ~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:59:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:291:1: note: expanded from here
   __initcall__kmod_mips_mt__393_246_mt_init4
   ^
   include/linux/init.h:249:20: note: expanded from macro '____define_initcall'
           static initcall_t __name __used                         \
                             ^
   2 warnings and 2 errors generated.


vim +246 arch/mips/kernel/mips-mt.c

27a3bbaf4b1e23 Ralf Baechle 2007-02-07  232  
27a3bbaf4b1e23 Ralf Baechle 2007-02-07 @233  static int __init mt_init(void)
27a3bbaf4b1e23 Ralf Baechle 2007-02-07  234  {
27a3bbaf4b1e23 Ralf Baechle 2007-02-07  235  	struct class *mtc;
27a3bbaf4b1e23 Ralf Baechle 2007-02-07  236  
27a3bbaf4b1e23 Ralf Baechle 2007-02-07  237  	mtc = class_create(THIS_MODULE, "mt");
27a3bbaf4b1e23 Ralf Baechle 2007-02-07  238  	if (IS_ERR(mtc))
27a3bbaf4b1e23 Ralf Baechle 2007-02-07  239  		return PTR_ERR(mtc);
27a3bbaf4b1e23 Ralf Baechle 2007-02-07  240  
27a3bbaf4b1e23 Ralf Baechle 2007-02-07  241  	mt_class = mtc;
27a3bbaf4b1e23 Ralf Baechle 2007-02-07  242  
27a3bbaf4b1e23 Ralf Baechle 2007-02-07  243  	return 0;
27a3bbaf4b1e23 Ralf Baechle 2007-02-07  244  }
27a3bbaf4b1e23 Ralf Baechle 2007-02-07  245  
27a3bbaf4b1e23 Ralf Baechle 2007-02-07 @246  subsys_initcall(mt_init);

:::::: The code at line 246 was first introduced by commit
:::::: 27a3bbaf4b1e23a3afbae4d9f72b51a36859f74a [MIPS] VPE: Sprinkle device model code into code to make udev happier.

:::::: TO: Ralf Baechle <ralf@linux-mips.org>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
