Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67BF320A
	for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 23:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660348022; x=1691884022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o7d3mdRa3MJ55gR7n7foac5O/Pv01YutGvVyzJcFmzw=;
  b=PrMe3K+W4LVs9ik3MtGAEAoa7+ep17inay9Kpa/d5H7F+M9iiJHBkscp
   82fP9X6usW3xsPbeu6hmkfFqZdnDNp81sjxljBB64172oE5MSInB37x5j
   Uuc23rMnGeEn6VwuJEg6IYESOjLybwPTcbigV6Ek+GmJ6AbATV5eRE82k
   5PH9Y2FmJCimQkjXwH5vR2D5H9fy2UzqmF8D28jCU+z024dIBuH4uatwP
   5kmKl5+vcJq4eDS9qojMQbhw0u3hXHZBjZT0lqs+kRAqQFdkcuXlaEznu
   jwVd3CdLDxXWx3mBWgCZ2xXfpKYhsrH4nysvFEUk/t3k56RTHtsUa/HTF
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="289278048"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="289278048"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 16:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="851725881"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Aug 2022 16:47:00 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMeMl-00014d-2h;
	Fri, 12 Aug 2022 23:46:59 +0000
Date: Sat, 13 Aug 2022 07:46:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 2/4] cxl/pci: Find and register CXL PMU devices
Message-ID: <202208130713.wbeguG1G-lkp@intel.com>
References: <20220812151214.2025-3-Jonathan.Cameron@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812151214.2025-3-Jonathan.Cameron@huawei.com>

Hi Jonathan,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on next-20220812]
[cannot apply to arm-perf/for-next/perf v5.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cameron/CXL-3-0-Performance-Monitoring-Unit-support/20220812-231616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 7ebfc85e2cd7b08f518b526173e9a33b56b3913b
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220813/202208130713.wbeguG1G-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7cf02b82d964e4cb9937ee6ce8b4d36e24807544
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Cameron/CXL-3-0-Performance-Monitoring-Unit-support/20220812-231616
        git checkout 7cf02b82d964e4cb9937ee6ce8b4d36e24807544
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cxl/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/regs.c:357:16: warning: shift count >= width of type [-Wshift-count-overflow]
           if (FIELD_GET(CPMU_CAP_INT, val))
               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/cxl/cpmu.h:17:27: note: expanded from macro 'CPMU_CAP_INT'
   #define   CPMU_CAP_INT                          BIT(50)
                                                   ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^
   include/linux/bitfield.h:128:20: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/cxl/core/regs.c:357:16: warning: shift count >= width of type [-Wshift-count-overflow]
           if (FIELD_GET(CPMU_CAP_INT, val))
               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/cxl/cpmu.h:17:27: note: expanded from macro 'CPMU_CAP_INT'
   #define   CPMU_CAP_INT                          BIT(50)
                                                   ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^
   include/linux/bitfield.h:128:20: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/cxl/core/regs.c:357:16: warning: shift count >= width of type [-Wshift-count-overflow]
           if (FIELD_GET(CPMU_CAP_INT, val))
               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/cxl/cpmu.h:17:27: note: expanded from macro 'CPMU_CAP_INT'
   #define   CPMU_CAP_INT                          BIT(50)
                                                   ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^
   include/linux/bitfield.h:128:20: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/cxl/core/regs.c:357:16: warning: shift count >= width of type [-Wshift-count-overflow]
           if (FIELD_GET(CPMU_CAP_INT, val))
               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/cxl/cpmu.h:17:27: note: expanded from macro 'CPMU_CAP_INT'
   #define   CPMU_CAP_INT                          BIT(50)
                                                   ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^
   include/linux/bitfield.h:128:20: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/cxl/core/regs.c:357:16: warning: shift count >= width of type [-Wshift-count-overflow]
           if (FIELD_GET(CPMU_CAP_INT, val))
               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/cxl/cpmu.h:17:27: note: expanded from macro 'CPMU_CAP_INT'
   #define   CPMU_CAP_INT                          BIT(50)
                                                   ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^
   include/linux/bitfield.h:128:20: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/cxl/core/regs.c:357:16: warning: shift count >= width of type [-Wshift-count-overflow]
           if (FIELD_GET(CPMU_CAP_INT, val))
               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/cxl/cpmu.h:17:27: note: expanded from macro 'CPMU_CAP_INT'
   #define   CPMU_CAP_INT                          BIT(50)
                                                   ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^
   include/linux/bitfield.h:128:20: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/cxl/core/regs.c:357:16: warning: shift count >= width of type [-Wshift-count-overflow]
           if (FIELD_GET(CPMU_CAP_INT, val))
               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/cxl/cpmu.h:17:27: note: expanded from macro 'CPMU_CAP_INT'
   #define   CPMU_CAP_INT                          BIT(50)
                                                   ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^
   include/linux/bitfield.h:128:20: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/cxl/core/regs.c:357:16: warning: shift count >= width of type [-Wshift-count-overflow]
           if (FIELD_GET(CPMU_CAP_INT, val))
               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/cxl/cpmu.h:17:27: note: expanded from macro 'CPMU_CAP_INT'
   #define   CPMU_CAP_INT                          BIT(50)
                                                   ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^
   include/linux/bitfield.h:128:20: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/cxl/core/regs.c:357:16: warning: shift count >= width of type [-Wshift-count-overflow]
           if (FIELD_GET(CPMU_CAP_INT, val))
               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/cxl/cpmu.h:17:27: note: expanded from macro 'CPMU_CAP_INT'
   #define   CPMU_CAP_INT                          BIT(50)
                                                   ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^
   include/linux/bitfield.h:128:20: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/cxl/core/regs.c:357:16: warning: shift count >= width of type [-Wshift-count-overflow]
           if (FIELD_GET(CPMU_CAP_INT, val))
               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/cxl/cpmu.h:17:27: note: expanded from macro 'CPMU_CAP_INT'
   #define   CPMU_CAP_INT                          BIT(50)
                                                   ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^
   include/linux/bitfield.h:129:30: note: expanded from macro 'FIELD_GET'
                   (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
                                              ^~~~~
>> drivers/cxl/core/regs.c:357:16: warning: shift count >= width of type [-Wshift-count-overflow]
           if (FIELD_GET(CPMU_CAP_INT, val))
               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/cxl/cpmu.h:17:27: note: expanded from macro 'CPMU_CAP_INT'
   #define   CPMU_CAP_INT                          BIT(50)
                                                   ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^
   include/linux/bitfield.h:129:50: note: expanded from macro 'FIELD_GET'
                   (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
                                                         ~~~~~~~~~^~~~~~
   include/linux/bitfield.h:45:38: note: expanded from macro '__bf_shf'
   #define __bf_shf(x) (__builtin_ffsll(x) - 1)
                                        ^
   11 warnings generated.


vim +357 drivers/cxl/core/regs.c

   350	
   351	int cxl_cpmu_get_irq(struct cxl_cpmu_regs *regs)
   352	{
   353		int irq = -1;
   354		u64 val;
   355	
   356		val = readq(regs->cpmu + CPMU_CAP_REG);
 > 357		if (FIELD_GET(CPMU_CAP_INT, val))

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
