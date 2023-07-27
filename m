Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B388F41;
	Thu, 27 Jul 2023 18:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690481942; x=1722017942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y4byDQ/HgWXNyLa4+YHJ3J8Psh3qMV++FJiYC3YtX5I=;
  b=XfSud7XtPszY5qofRH242DjJtUzirBsoDj0+Gl9tQe2DxtPnFror914x
   IurU+OniEMSb3uMPsE6vVsAsUFK9YCYK3rg7foEO6ZgdenN6iCiQDc3yQ
   6J8vQV/UrvC87tkPcZR2iYKz4ImpqJ2if7mPrY20eeqNK8WQgQ8gK8tIW
   4PTj/H90lZ4tqL4L6DUwKNEZll9QRN2TCWvMufKi0W6Ra3WnZ8qxdbwXe
   UcBNk4RfXMohO1AVFYk7ZsVKRe/xLyeC4Z+kjsNw2M1GDsX6RbWinfwJ9
   QQYZPV8uVPtBmVAONx9n7qjDHuQBdZRVtzDZnurAB3+uq8v4jRNIeB7CG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="358415747"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="358415747"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 11:19:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="973700154"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="973700154"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 27 Jul 2023 11:18:59 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP5ZR-0002VL-32;
	Thu, 27 Jul 2023 18:18:52 +0000
Date: Fri, 28 Jul 2023 02:18:36 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [linux-next:master 3825/5027]
 arch/mips/pic32/pic32mzda/config.c:22:8: error: type specifier missing,
 defaults to 'int'; ISO C99 and later do not support implicit int
Message-ID: <202307280212.w1lY1gCG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   451cc82bd11eb6a374f4dbcfc1cf007eafea91ab
commit: 657c45b303f87d77eb4ef49e9452f1c5d1fc363c [3825/5027] MIPS: Explicitly include correct DT includes
config: mips-randconfig-r022-20230727 (https://download.01.org/0day-ci/archive/20230728/202307280212.w1lY1gCG-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280212.w1lY1gCG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307280212.w1lY1gCG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/mips/pic32/pic32mzda/config.c:22:8: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      22 | static DEFINE_SPINLOCK(config_lock);
         | ~~~~~~ ^
         | int
>> arch/mips/pic32/pic32mzda/config.c:22:24: error: a parameter list without types is only allowed in a function definition
      22 | static DEFINE_SPINLOCK(config_lock);
         |                        ^
>> arch/mips/pic32/pic32mzda/config.c:41:2: error: call to undeclared function 'spin_lock_irqsave'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      41 |         spin_lock_irqsave(&config_lock, flags);
         |         ^
>> arch/mips/pic32/pic32mzda/config.c:41:21: error: use of undeclared identifier 'config_lock'
      41 |         spin_lock_irqsave(&config_lock, flags);
         |                            ^
>> arch/mips/pic32/pic32mzda/config.c:46:2: error: call to undeclared function 'spin_unlock_irqrestore'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      46 |         spin_unlock_irqrestore(&config_lock, flags);
         |         ^
   arch/mips/pic32/pic32mzda/config.c:46:26: error: use of undeclared identifier 'config_lock'
      46 |         spin_unlock_irqrestore(&config_lock, flags);
         |                                 ^
   6 errors generated.


vim +/int +22 arch/mips/pic32/pic32mzda/config.c

2572f00db8a68bb Joshua Henderson 2016-01-13  20  
2572f00db8a68bb Joshua Henderson 2016-01-13  21  static void __iomem *pic32_conf_base;
2572f00db8a68bb Joshua Henderson 2016-01-13 @22  static DEFINE_SPINLOCK(config_lock);
2572f00db8a68bb Joshua Henderson 2016-01-13  23  static u32 pic32_reset_status;
2572f00db8a68bb Joshua Henderson 2016-01-13  24  
2572f00db8a68bb Joshua Henderson 2016-01-13  25  static u32 pic32_conf_get_reg_field(u32 offset, u32 rshift, u32 mask)
2572f00db8a68bb Joshua Henderson 2016-01-13  26  {
2572f00db8a68bb Joshua Henderson 2016-01-13  27  	u32 v;
2572f00db8a68bb Joshua Henderson 2016-01-13  28  
2572f00db8a68bb Joshua Henderson 2016-01-13  29  	v = readl(pic32_conf_base + offset);
2572f00db8a68bb Joshua Henderson 2016-01-13  30  	v >>= rshift;
2572f00db8a68bb Joshua Henderson 2016-01-13  31  	v &= mask;
2572f00db8a68bb Joshua Henderson 2016-01-13  32  
2572f00db8a68bb Joshua Henderson 2016-01-13  33  	return v;
2572f00db8a68bb Joshua Henderson 2016-01-13  34  }
2572f00db8a68bb Joshua Henderson 2016-01-13  35  
2572f00db8a68bb Joshua Henderson 2016-01-13  36  static u32 pic32_conf_modify_atomic(u32 offset, u32 mask, u32 set)
2572f00db8a68bb Joshua Henderson 2016-01-13  37  {
2572f00db8a68bb Joshua Henderson 2016-01-13  38  	u32 v;
2572f00db8a68bb Joshua Henderson 2016-01-13  39  	unsigned long flags;
2572f00db8a68bb Joshua Henderson 2016-01-13  40  
2572f00db8a68bb Joshua Henderson 2016-01-13 @41  	spin_lock_irqsave(&config_lock, flags);
2572f00db8a68bb Joshua Henderson 2016-01-13  42  	v = readl(pic32_conf_base + offset);
2572f00db8a68bb Joshua Henderson 2016-01-13  43  	v &= ~mask;
2572f00db8a68bb Joshua Henderson 2016-01-13  44  	v |= (set & mask);
2572f00db8a68bb Joshua Henderson 2016-01-13  45  	writel(v, pic32_conf_base + offset);
2572f00db8a68bb Joshua Henderson 2016-01-13 @46  	spin_unlock_irqrestore(&config_lock, flags);
2572f00db8a68bb Joshua Henderson 2016-01-13  47  
2572f00db8a68bb Joshua Henderson 2016-01-13  48  	return 0;
2572f00db8a68bb Joshua Henderson 2016-01-13  49  }
2572f00db8a68bb Joshua Henderson 2016-01-13  50  

:::::: The code at line 22 was first introduced by commit
:::::: 2572f00db8a68bb46001678c1c98ad8b70e04b31 MIPS: Add support for PIC32MZDA platform

:::::: TO: Joshua Henderson <joshua.henderson@microchip.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
