Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A0510E4
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 16:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651163811; x=1682699811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oADM2sPMi97oINjVYN1UzlAX2twO41CE9Nvqn8Gkv0s=;
  b=i2jnWPlgwuH8DwmbmO4UzP+J1gc+Y+dZjX5Id2S8OAMk31ZS2qaPL8iK
   UvJ5i+i6YlJMJg9Bl/b/HcGAJv12ZVqW4WTHdpohC/52X02jI5CXjhnDd
   XpqtldpedEZkZMOy3bknSglXDVGURe85tJM3b/iu3GaVJrnzFsuKdjT8M
   IhbIr03s83tWzJZUXqx4mqcArXGuPrOsJmEWH/EP+EnLwdteskyWTwV6M
   QpwAjGsceXNIwq9CanOk3pA2mSfAq5uXcdWFXT6NQ0orL7JMkMZibuSXl
   v1JMU0XzYiMfSrQfWDBXYEGSl3LGDMLJOzQgUZLXfLbEbcy+heU4k0Q2u
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="266504804"
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; 
   d="scan'208";a="266504804"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 09:36:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; 
   d="scan'208";a="683035108"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Apr 2022 09:36:49 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nk78K-0005XH-Ia;
	Thu, 28 Apr 2022 16:36:48 +0000
Date: Fri, 29 Apr 2022 00:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mark:stackleak/rework 9/13] drivers/misc/lkdtm/stackleak.c:42:16:
 error: call to undeclared function 'stackleak_find_top_of_poison'; ISO C99
 and later do not support implicit function declarations
Message-ID: <202204290047.KTxQ2B9w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stackleak/rework
head:   eceae38b5363e034fea5ad4cf977734a864a2bb0
commit: 4aac8d85c42a73f2d4dcb11acf3e4ec669919e08 [9/13] lkdtm/stackleak: rework boundary management
config: s390-buildonly-randconfig-r006-20220428 (https://download.01.org/0day-ci/archive/20220429/202204290047.KTxQ2B9w-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473aacce38cd7dd77eebceaf3c98c5707ab3b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=4aac8d85c42a73f2d4dcb11acf3e4ec669919e08
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark stackleak/rework
        git checkout 4aac8d85c42a73f2d4dcb11acf3e4ec669919e08
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/misc/lkdtm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/misc/lkdtm/stackleak.c:17:39: error: call to undeclared function 'stackleak_task_low_bound'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           const unsigned long task_stack_low = stackleak_task_low_bound(current);
                                                ^
   drivers/misc/lkdtm/stackleak.c:18:40: error: call to undeclared function 'stackleak_task_high_bound'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           const unsigned long task_stack_high = stackleak_task_high_bound(current);
                                                 ^
   drivers/misc/lkdtm/stackleak.c:19:22: warning: incompatible pointer to integer conversion initializing 'const unsigned long' with an expression of type 'unsigned long (void)' [-Wint-conversion]
           const unsigned long current_sp = current_stack_pointer;
                               ^            ~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lkdtm/stackleak.c:20:43: error: no member named 'lowest_stack' in 'struct task_struct'
           const unsigned long lowest_sp = current->lowest_stack;
                                           ~~~~~~~  ^
>> drivers/misc/lkdtm/stackleak.c:42:16: error: call to undeclared function 'stackleak_find_top_of_poison'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           poison_high = stackleak_find_top_of_poison(task_stack_low, untracked_high);
                         ^
   1 warning and 4 errors generated.


vim +/stackleak_find_top_of_poison +42 drivers/misc/lkdtm/stackleak.c

    13	
    14	void lkdtm_STACKLEAK_ERASING(void)
    15	{
    16		const unsigned long task_stack_base = (unsigned long)task_stack_page(current);
    17		const unsigned long task_stack_low = stackleak_task_low_bound(current);
    18		const unsigned long task_stack_high = stackleak_task_high_bound(current);
    19		const unsigned long current_sp = current_stack_pointer;
    20		const unsigned long lowest_sp = current->lowest_stack;
    21		unsigned long untracked_high;
    22		unsigned long poison_high, poison_low;
    23		bool test_failed = false;
    24	
    25		/*
    26		 * Depending on what has run prior to this test, the lowest recorded
    27		 * stack pointer could be above or below the current stack pointer.
    28		 * Start from the lowest of the two.
    29		 *
    30		 * Poison values are naturally-aligned unsigned longs. As the current
    31		 * stack pointer might not be sufficiently aligned, we must align
    32		 * downwards to find the lowest known stack pointer value. This is the
    33		 * high boundary for a portion of the stack which may have been used
    34		 * without being tracked, and has to be scanned for poison.
    35		 */
    36		untracked_high = min(current_sp, lowest_sp);
    37		untracked_high = ALIGN_DOWN(untracked_high, sizeof(unsigned long));
    38	
    39		/*
    40		 * Find the top of the poison in the same way as the erasing code.
    41		 */
  > 42		poison_high = stackleak_find_top_of_poison(task_stack_low, untracked_high);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
