Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C80800
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 05:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645593018; x=1677129018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VkIlCTKu/Ajt9hsKrHvbW/AW/3dptdRZcGy7KrznaWs=;
  b=KAoh0HNuY8GuhPc0NeMHiFFshF5LtZK7qvV4m6FpJQFm7rS8LGB/8a2c
   RGlBOii1qt+QlAZtTSMyQHkrkiK7hHZsFU+9SiH/enuZc6xA/uJbbfQ7S
   u4dYdmbZS1KXyladALdbP1j+EICvwB9+c+VpjgXjIP1P9uRWVO3GbngpP
   GcOyjuwgX3+o7BAkq2rKH7aEcizlzl6QBC8s5g+oVLZvwjuhM/zWUAN8R
   HVqhofEhkkF1Mm2o8LYtxPilq+bgFn0uQ1G062CKxtHpqkhqgFXalRWQV
   sVJMnP3qanxIDHj2ZPWfft0TXrSPe5+dC/EQ993Kj2EnmT/BFGHCQnWXq
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="251805791"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="251805791"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 21:10:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="532531609"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 22 Feb 2022 21:10:16 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMjup-00010C-It; Wed, 23 Feb 2022 05:10:15 +0000
Date: Wed, 23 Feb 2022 13:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 2000/2324]
 arch/mips/kernel/irq-msc01.c:29:40: warning: declaration of 'struct
 irq_data' will not be visible outside of this function
Message-ID: <202202231337.vXRfwNhS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   7d9efc989eceed6a8fa475a186880ec4a1ad54a3
commit: 59438ff3251170bd7d1c9795532bd3dcc127e3f2 [2000/2324] headers/deps: genirq: Optimize <linux/interrupt.h> dependencies, remove <linux/hardirq.h>
config: mips-malta_kvm_defconfig (https://download.01.org/0day-ci/archive/20220223/202202231337.vXRfwNhS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=59438ff3251170bd7d1c9795532bd3dcc127e3f2
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 59438ff3251170bd7d1c9795532bd3dcc127e3f2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/kernel/ arch/mips/mti-malta/ arch/mips/pci/ drivers/rtc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/mips/kernel/irq-msc01.c:29:40: warning: declaration of 'struct irq_data' will not be visible outside of this function [-Wvisibility]
   static inline void mask_msc_irq(struct irq_data *d)
                                          ^
   arch/mips/kernel/irq-msc01.c:31:22: error: incomplete definition of type 'struct irq_data'
           unsigned int irq = d->irq;
                              ~^
   arch/mips/kernel/irq-msc01.c:29:40: note: forward declaration of 'struct irq_data'
   static inline void mask_msc_irq(struct irq_data *d)
                                          ^
   arch/mips/kernel/irq-msc01.c:40:42: warning: declaration of 'struct irq_data' will not be visible outside of this function [-Wvisibility]
   static inline void unmask_msc_irq(struct irq_data *d)
                                            ^
   arch/mips/kernel/irq-msc01.c:42:22: error: incomplete definition of type 'struct irq_data'
           unsigned int irq = d->irq;
                              ~^
   arch/mips/kernel/irq-msc01.c:40:42: note: forward declaration of 'struct irq_data'
   static inline void unmask_msc_irq(struct irq_data *d)
                                            ^
   arch/mips/kernel/irq-msc01.c:53:47: warning: declaration of 'struct irq_data' will not be visible outside of this function [-Wvisibility]
   static void level_mask_and_ack_msc_irq(struct irq_data *d)
                                                 ^
   arch/mips/kernel/irq-msc01.c:55:15: error: incompatible pointer types passing 'struct irq_data *' to parameter of type 'struct irq_data *' [-Werror,-Wincompatible-pointer-types]
           mask_msc_irq(d);
                        ^
   arch/mips/kernel/irq-msc01.c:29:50: note: passing argument to parameter 'd' here
   static inline void mask_msc_irq(struct irq_data *d)
                                                    ^
   arch/mips/kernel/irq-msc01.c:63:46: warning: declaration of 'struct irq_data' will not be visible outside of this function [-Wvisibility]
   static void edge_mask_and_ack_msc_irq(struct irq_data *d)
                                                ^
   arch/mips/kernel/irq-msc01.c:65:22: error: incomplete definition of type 'struct irq_data'
           unsigned int irq = d->irq;
                              ~^
   arch/mips/kernel/irq-msc01.c:63:46: note: forward declaration of 'struct irq_data'
   static void edge_mask_and_ack_msc_irq(struct irq_data *d)
                                                ^
   arch/mips/kernel/irq-msc01.c:67:15: error: incompatible pointer types passing 'struct irq_data *' to parameter of type 'struct irq_data *' [-Werror,-Wincompatible-pointer-types]
           mask_msc_irq(d);
                        ^
   arch/mips/kernel/irq-msc01.c:29:50: note: passing argument to parameter 'd' here
   static inline void mask_msc_irq(struct irq_data *d)
                                                    ^
   arch/mips/kernel/irq-msc01.c:100:24: error: variable has incomplete type 'struct irq_chip'
   static struct irq_chip msc_levelirq_type = {
                          ^
   arch/mips/kernel/irq-msc01.c:100:15: note: forward declaration of 'struct irq_chip'
   static struct irq_chip msc_levelirq_type = {
                 ^
   arch/mips/kernel/irq-msc01.c:109:24: error: variable has incomplete type 'struct irq_chip'
   static struct irq_chip msc_edgeirq_type = {
                          ^
   arch/mips/kernel/irq-msc01.c:100:15: note: forward declaration of 'struct irq_chip'
   static struct irq_chip msc_levelirq_type = {
                 ^
   arch/mips/kernel/irq-msc01.c:133:4: error: implicit declaration of function 'irq_set_chip_and_handler_name' [-Werror,-Wimplicit-function-declaration]
                           irq_set_chip_and_handler_name(irqbase + n,
                           ^
   arch/mips/kernel/irq-msc01.c:135:13: error: use of undeclared identifier 'handle_edge_irq'
                                                         handle_edge_irq,
                                                         ^
   arch/mips/kernel/irq-msc01.c:145:13: error: use of undeclared identifier 'handle_level_irq'
                                                         handle_level_irq,
                                                         ^
   4 warnings and 10 errors generated.


vim +29 arch/mips/kernel/irq-msc01.c

^1da177e4c3f415 Linus Torvalds  2005-04-16  27  
^1da177e4c3f415 Linus Torvalds  2005-04-16  28  /* mask off an interrupt */
e15883da8a8b83c Thomas Gleixner 2011-03-23 @29  static inline void mask_msc_irq(struct irq_data *d)
^1da177e4c3f415 Linus Torvalds  2005-04-16  30  {
e15883da8a8b83c Thomas Gleixner 2011-03-23  31  	unsigned int irq = d->irq;
e15883da8a8b83c Thomas Gleixner 2011-03-23  32  
^1da177e4c3f415 Linus Torvalds  2005-04-16  33  	if (irq < (irq_base + 32))
^1da177e4c3f415 Linus Torvalds  2005-04-16  34  		MSCIC_WRITE(MSC01_IC_DISL, 1<<(irq - irq_base));
^1da177e4c3f415 Linus Torvalds  2005-04-16  35  	else
^1da177e4c3f415 Linus Torvalds  2005-04-16  36  		MSCIC_WRITE(MSC01_IC_DISH, 1<<(irq - irq_base - 32));
^1da177e4c3f415 Linus Torvalds  2005-04-16  37  }
^1da177e4c3f415 Linus Torvalds  2005-04-16  38  

:::::: The code at line 29 was first introduced by commit
:::::: e15883da8a8b83c73bf1ba030cddeb2cfd92a555 MIPS: MSC01: Convert to new irq_chip functions

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
