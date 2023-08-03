Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E6F6FA7;
	Thu,  3 Aug 2023 07:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691047022; x=1722583022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8t8ikLQP72WM/7iT5Nv9w9DNbYmoZ8iEdO/YzviwfTU=;
  b=n04HJT/Kf/Qu7iRo3vDkvMeHxFwmJUGg2tcu0wzH3Pmrt2yyZRHFJZcU
   MMW39X9pkIGE14KEmFgazyT13cYsA3GTaiovOf+a8WLw3mvWjyUkFOXek
   oZhiT/Nr52a5LUifSR3bvUaav4l9rGuMBOAxYCtTWnBuzE7zSokKG8QOZ
   bdtBUavr2iGPqSLUJqcXO7B6rXNGZ5FG+t7M5wNx8CaXtvk0YKSQiHSu7
   PUzAMyF5unL73nhnQoqu0V4Wubr6EVmwgkpWVRSeIfRBUQqskOCO6p8HS
   ic1GAkRybtygGMnkR7GNpw0/xfpyw2CrhNPgOu10ERdOZES47KfQ7FeDx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="368690100"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="368690100"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 00:17:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="732651728"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="732651728"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Aug 2023 00:17:00 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRSZv-0001rL-0L;
	Thu, 03 Aug 2023 07:16:59 +0000
Date: Thu, 3 Aug 2023 15:16:43 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v4 13/70]
 arch/riscv/kernel/paravirt.c:109:12: warning: no previous prototype for
 function 'pv_time_init'
Message-ID: <202308031507.4pFUWnB4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

First bad commit (maybe != root cause):

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v4
head:   ee021e57ffe3195b6a3ac5fcb2d4353375d1f261
commit: b17aefd2e031ebc9ae025a716461a94c6e08b8ee [13/70] RISC-V: paravirt: Add kconfigs
config: riscv-randconfig-r021-20230731 (https://download.01.org/0day-ci/archive/20230803/202308031507.4pFUWnB4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031507.4pFUWnB4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031507.4pFUWnB4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/paravirt.c:109:12: warning: no previous prototype for function 'pv_time_init' [-Wmissing-prototypes]
     109 | int __init pv_time_init(void)
         |            ^
   arch/riscv/kernel/paravirt.c:109:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     109 | int __init pv_time_init(void)
         | ^
         | static 
   1 warning generated.


vim +/pv_time_init +109 arch/riscv/kernel/paravirt.c

a7c5da7c6bff2d Andrew Jones 2023-04-14  108  
a7c5da7c6bff2d Andrew Jones 2023-04-14 @109  int __init pv_time_init(void)

:::::: The code at line 109 was first introduced by commit
:::::: a7c5da7c6bff2dfc2c38cd93555da1a8bae02a00 RISC-V: paravirt: Add skeleton for pv-time support

:::::: TO: Andrew Jones <ajones@ventanamicro.com>
:::::: CC: Guo Ren <guoren@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
