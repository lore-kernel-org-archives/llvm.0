Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6783628E0
	for <llvm@lists.linux.dev>; Mon,  4 Apr 2022 05:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649051764; x=1680587764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eN3CNr5xvnl36ByfmkFee0LodNOVBKTlkJCwcqErt7Q=;
  b=M2jidP7QAMS7XvoDDUVUyC2EE01alizjlZixYdSoQHKMk/xGtM6anR8q
   AtEPOoL6SmPiioXASyB7yqxMBc5xiUdoqKVbe63QXyctkCNn5hBBTAiiF
   oUcVcQeeB9LJj4nyAhBmpbw4qY+PmD7TffWp7XbaB3Y9UiAjSeZmgmc+v
   qxD0GpY9EqG8KzcYRG6ZZL2yI0yyzgmeAeKFT9+3F1WhDj7p4BmG4sFNN
   YtW4+18s3rTo/i5OB5lDjQB8kEs91un8K1PycvFu/ByUrr5IKuN4F4YxK
   rOJIoUTFocSrUJThQ2HVome7Idw80V2oZd+Rtgpa/pc59DyQJfhIJjfX3
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10306"; a="259275640"
X-IronPort-AV: E=Sophos;i="5.90,233,1643702400"; 
   d="scan'208";a="259275640"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2022 22:56:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,233,1643702400"; 
   d="scan'208";a="523459904"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Apr 2022 22:56:02 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nbFh3-0001fV-GN;
	Mon, 04 Apr 2022 05:56:01 +0000
Date: Mon, 4 Apr 2022 13:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCHv2] cgroup: introduce dynamic protection for memcg
Message-ID: <202204041316.3WFGhtmO-lkp@intel.com>
References: <1649040193-10073-1-git-send-email-zhaoyang.huang@unisoc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649040193-10073-1-git-send-email-zhaoyang.huang@unisoc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "zhaoyang.huang",

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linux/master]
[also build test ERROR on v5.18-rc1 next-20220404]
[cannot apply to hnaz-mm/master tip/sched/core linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoyang-huang/cgroup-introduce-dynamic-protection-for-memcg/20220404-104601
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 2c271fe77d52a0555161926c232cd5bc07178b39
config: powerpc-mpc8272_ads_defconfig (https://download.01.org/0day-ci/archive/20220404/202204041316.3WFGhtmO-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/e90ab95157c7eeb108c9909ee758282d6981ff8b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review zhaoyang-huang/cgroup-introduce-dynamic-protection-for-memcg/20220404-104601
        git checkout e90ab95157c7eeb108c9909ee758282d6981ff8b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:21:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:26:
>> include/linux/psi.h:51:55: error: non-void function does not return a value [-Werror,-Wreturn-type]
   static unsigned long psi_mem_get(unsigned long time) {}
                                                         ^
   1 error generated.
   make[2]: *** [scripts/Makefile.build:121: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1191: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +51 include/linux/psi.h

    50	
  > 51	static unsigned long psi_mem_get(unsigned long time) {}
    52	#ifdef CONFIG_CGROUPS
    53	static inline int psi_cgroup_alloc(struct cgroup *cgrp)
    54	{
    55		return 0;
    56	}
    57	static inline void psi_cgroup_free(struct cgroup *cgrp)
    58	{
    59	}
    60	static inline void cgroup_move_task(struct task_struct *p, struct css_set *to)
    61	{
    62		rcu_assign_pointer(p->cgroups, to);
    63	}
    64	#endif
    65	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
