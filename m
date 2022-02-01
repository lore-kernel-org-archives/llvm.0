Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEEF2CA5
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 13:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643721343; x=1675257343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YIrB/RjwUQuB/lErIj+v5pUNuBA3zxVy4nUv15hlRCw=;
  b=cxuiAQNNqH5bD1jSDP7jt4vSL+LNbf/DY5i1sy0sqGm/v3wQ30szEUnZ
   fL+ZE5ajDRwWoJ4+UdIKgIVUSDES73aRfRYm8lk7U6YhmjTYecIeQ0OGM
   9lmw9A+4FlxONwpJZlUV60ymjTcbC3ezp7sF0P8zFtFFf0gh8hARMtjPG
   Dt9hi+DUzC2DjIvZI9/ImlYgtJQCPAr5M/cn397/qz6E661XIj44kfYPe
   MUKBtc8GMdZ/TBoUYcHOxOMZgkEMDBdTUDTDCaoU5ETFBIN9S5IqxHOZC
   HQbRXGquSF58aSBT5fwZZdESARrpb7FMg6jpVg+RgLq/yVg/CZCEbNXJZ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247456773"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; 
   d="scan'208";a="247456773"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 05:15:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; 
   d="scan'208";a="630392461"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Feb 2022 05:15:41 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEt0W-000TIk-EP; Tue, 01 Feb 2022 13:15:40 +0000
Date: Tue, 1 Feb 2022 21:15:15 +0800
From: kernel test robot <lkp@intel.com>
To: Quentin Perret <qperret@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@gnuweeb.org>,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@google.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android-4.19-stable
 201/9999] kernel/sched/stubs.c:8:5: warning: no previous prototype for
 function 'sched_isolate_cpu'
Message-ID: <202202012133.0supCHiV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-4.19-stable
head:   b45c5eeda8dea785e3d411380b486a209768f6b2
commit: eead51495c8760858c32d9ad0332ffc94397aa82 [201/9999] ANDROID: GKI: sched: stub sched_isolate symbols
config: x86_64-randconfig-r026-20220131 (https://download.01.org/0day-ci/archive/20220201/202202012133.0supCHiV-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/eead51495c8760858c32d9ad0332ffc94397aa82
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-4.19-stable
        git checkout eead51495c8760858c32d9ad0332ffc94397aa82
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/nvmem/ kernel/sched/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/sched/stubs.c:8:5: warning: no previous prototype for function 'sched_isolate_cpu' [-Wmissing-prototypes]
   int sched_isolate_cpu(int cpu)
       ^
   kernel/sched/stubs.c:8:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_isolate_cpu(int cpu)
   ^
   static 
>> kernel/sched/stubs.c:14:5: warning: no previous prototype for function 'sched_unisolate_cpu_unlocked' [-Wmissing-prototypes]
   int sched_unisolate_cpu_unlocked(int cpu)
       ^
   kernel/sched/stubs.c:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_unisolate_cpu_unlocked(int cpu)
   ^
   static 
>> kernel/sched/stubs.c:20:5: warning: no previous prototype for function 'sched_unisolate_cpu' [-Wmissing-prototypes]
   int sched_unisolate_cpu(int cpu)
       ^
   kernel/sched/stubs.c:20:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_unisolate_cpu(int cpu)
   ^
   static 
>> kernel/sched/stubs.c:26:5: warning: no previous prototype for function 'set_task_boost' [-Wmissing-prototypes]
   int set_task_boost(int boost, u64 period)
       ^
   kernel/sched/stubs.c:26:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int set_task_boost(int boost, u64 period)
   ^
   static 
   4 warnings generated.


vim +/sched_isolate_cpu +8 kernel/sched/stubs.c

     7	
   > 8	int sched_isolate_cpu(int cpu)
     9	{
    10		return -EINVAL;
    11	}
    12	EXPORT_SYMBOL_GPL(sched_isolate_cpu);
    13	
  > 14	int sched_unisolate_cpu_unlocked(int cpu)
    15	{
    16		return -EINVAL;
    17	}
    18	EXPORT_SYMBOL_GPL(sched_unisolate_cpu_unlocked);
    19	
  > 20	int sched_unisolate_cpu(int cpu)
    21	{
    22		return -EINVAL;
    23	}
    24	EXPORT_SYMBOL_GPL(sched_unisolate_cpu);
    25	
  > 26	int set_task_boost(int boost, u64 period)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
