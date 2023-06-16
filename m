Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852D97C;
	Fri, 16 Jun 2023 05:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686892453; x=1718428453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=60Y/MOa0g44t0xXrYYRIs1cTjW37vMSmEyo23JHUw0c=;
  b=UhYr16bXaFoeKlLRPS+VrV7l+7Ib4iDLOJiLY6P45QOWJOb5rgKr1O6Z
   6IfMTkBmfoftDjflwMQKgTZtao0oFtX8C/avGkGkLN56UI2juCvuTBGiY
   A1kbh0ohkIeCvsY9TA/bHYmDLmkbfi54rV3Kw2kfGBDwPqPPcCS7haZMT
   cMBRwpMPMoBaaq/XeNQ5fxdM9HRUZ7SNS8fyJNXUfZWViDwd93cxX+UTM
   ADsTkNo/Jc2MlAL9HbrWVLA9r1DaxwSHJ+rZ0f+rZq5iCtIbjmoxpUC3V
   T55o+xlTZvxYnqWv9sL6Nh70Mv/DCrgcsBLorG4QnmAd5owlGAKoSdY+e
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="445500531"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="445500531"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 22:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="825587165"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="825587165"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2023 22:14:09 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qA1mi-0000po-1k;
	Fri, 16 Jun 2023 05:14:08 +0000
Date: Fri, 16 Jun 2023 13:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Zhang <zhangpeng362@huawei.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, hannes@cmpxchg.org,
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com,
	muchun.song@linux.dev, akpm@linux-foundation.org,
	wangkefeng.wang@huawei.com, sunnanyong@huawei.com,
	ZhangPeng <zhangpeng362@huawei.com>
Subject: Re: [PATCH] mm/memcg: remove return value of mem_cgroup_scan_tasks()
Message-ID: <202306161306.9YKbncNT-lkp@intel.com>
References: <20230616021955.872413-1-zhangpeng362@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616021955.872413-1-zhangpeng362@huawei.com>

Hi Peng,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Zhang/mm-memcg-remove-return-value-of-mem_cgroup_scan_tasks/20230616-102145
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230616021955.872413-1-zhangpeng362%40huawei.com
patch subject: [PATCH] mm/memcg: remove return value of mem_cgroup_scan_tasks()
config: x86_64-randconfig-r005-20230616 (https://download.01.org/0day-ci/archive/20230616/202306161306.9YKbncNT-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch akpm-mm mm-everything
        git checkout akpm-mm/mm-everything
        b4 shazam https://lore.kernel.org/r/20230616021955.872413-1-zhangpeng362@huawei.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306161306.9YKbncNT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
>> include/linux/memcontrol.h:1370:2: error: void function 'mem_cgroup_scan_tasks' should not return a value [-Wreturn-type]
           return 0;
           ^      ~
   1 error generated.
   make[2]: *** [scripts/Makefile.build:114: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=3878817758
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1287: prepare0] Error 2 shuffle=3878817758
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2 shuffle=3878817758
   make: Target 'prepare' not remade because of errors.


vim +/mem_cgroup_scan_tasks +1370 include/linux/memcontrol.h

5660048ccac873 Johannes Weiner  2012-01-12  1366  
5044a2e0ddbf82 ZhangPeng        2023-06-16  1367  static inline void mem_cgroup_scan_tasks(struct mem_cgroup *memcg,
7c5f64f84483bd Vladimir Davydov 2016-10-07  1368  		int (*fn)(struct task_struct *, void *), void *arg)
7c5f64f84483bd Vladimir Davydov 2016-10-07  1369  {
7c5f64f84483bd Vladimir Davydov 2016-10-07 @1370  	return 0;
7c5f64f84483bd Vladimir Davydov 2016-10-07  1371  }
7c5f64f84483bd Vladimir Davydov 2016-10-07  1372  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
