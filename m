Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C2D692F
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 21:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645564100; x=1677100100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CUf0MQWpt9tm7nVh/BUEV/0yb1lNen2ySTEuE5OFQOI=;
  b=gVhlnlPmgjyO1QCpI97jS+Hmk8Tax4ySOCgEesH9K2umiUtcsH2GwZki
   iKvgCpEb4OftfK3MsIW6y7j7MHpG2ChdSKsvJaib4uIN4rooX7SYDphXH
   93BsoWj8sEGfYd5k+n+OsDqDwdaCFDj3taPzRTWWK2a5i5VaIwYY4GQFg
   12asbo4e2FX9eSplw8jIVppdSi94wF1+6pxKSOGFVtNxmDVoQ0PYTGBg+
   T5Oa94hDLt/0b9ZooN3cArNkj5JrXSmUvCHLSD3libfwpO79m87/K2SIG
   wdQY4CQONu6VPcEQ+YtMHDUuspvZx9oxbRWSuSqgIDd2KFFzYZaMxz9U3
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="315043814"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; 
   d="scan'208";a="315043814"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 13:08:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; 
   d="scan'208";a="543086777"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Feb 2022 13:08:03 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMcOA-0000cU-Ie; Tue, 22 Feb 2022 21:08:02 +0000
Date: Wed, 23 Feb 2022 05:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 2300/2324]
 drivers/hwtracing/coresight/coresight-syscfg.c:383:8: error: implicit
 declaration of function 'try_module_get'
Message-ID: <202202230454.RRWaaMcG-lkp@intel.com>
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
commit: b6ac2dbb891219be5e264504adb69b35c95647a8 [2300/2324] headers/deps: driver/core: Optimize <linux/device/driver.h> dependencies, remove <linux/module.h> inclusion
config: arm64-randconfig-r012-20220221 (https://download.01.org/0day-ci/archive/20220223/202202230454.RRWaaMcG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=b6ac2dbb891219be5e264504adb69b35c95647a8
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout b6ac2dbb891219be5e264504adb69b35c95647a8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/hwtracing/coresight/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-syscfg.c:383:8: error: implicit declaration of function 'try_module_get' [-Werror,-Wimplicit-function-declaration]
               (!try_module_get(owner_info->owner_handle)))
                 ^
>> drivers/hwtracing/coresight/coresight-syscfg.c:392:3: error: implicit declaration of function 'module_put' [-Werror,-Wimplicit-function-declaration]
                   module_put(owner_info->owner_handle);
                   ^
   2 errors generated.


vim +/try_module_get +383 drivers/hwtracing/coresight/coresight-syscfg.c

a13d5a246aca17c Mike Leach 2021-08-18  374  
eb2ec49606c2a02 Mike Leach 2021-11-24  375  /*
eb2ec49606c2a02 Mike Leach 2021-11-24  376   * Conditionally up reference count on owner to prevent unload.
eb2ec49606c2a02 Mike Leach 2021-11-24  377   *
eb2ec49606c2a02 Mike Leach 2021-11-24  378   * module loaded configs need to be locked in to prevent premature unload.
eb2ec49606c2a02 Mike Leach 2021-11-24  379   */
eb2ec49606c2a02 Mike Leach 2021-11-24  380  static int cscfg_owner_get(struct cscfg_load_owner_info *owner_info)
eb2ec49606c2a02 Mike Leach 2021-11-24  381  {
eb2ec49606c2a02 Mike Leach 2021-11-24  382  	if ((owner_info->type == CSCFG_OWNER_MODULE) &&
eb2ec49606c2a02 Mike Leach 2021-11-24 @383  	    (!try_module_get(owner_info->owner_handle)))
eb2ec49606c2a02 Mike Leach 2021-11-24  384  		return -EINVAL;
eb2ec49606c2a02 Mike Leach 2021-11-24  385  	return 0;
eb2ec49606c2a02 Mike Leach 2021-11-24  386  }
eb2ec49606c2a02 Mike Leach 2021-11-24  387  
eb2ec49606c2a02 Mike Leach 2021-11-24  388  /* conditionally lower ref count on an owner */
eb2ec49606c2a02 Mike Leach 2021-11-24  389  static void cscfg_owner_put(struct cscfg_load_owner_info *owner_info)
eb2ec49606c2a02 Mike Leach 2021-11-24  390  {
eb2ec49606c2a02 Mike Leach 2021-11-24  391  	if (owner_info->type == CSCFG_OWNER_MODULE)
eb2ec49606c2a02 Mike Leach 2021-11-24 @392  		module_put(owner_info->owner_handle);
eb2ec49606c2a02 Mike Leach 2021-11-24  393  }
eb2ec49606c2a02 Mike Leach 2021-11-24  394  

:::::: The code at line 383 was first introduced by commit
:::::: eb2ec49606c2a02d6382d56a0e19f34e515fde3f coresight: syscfg: Update load API for config loadable modules

:::::: TO: Mike Leach <mike.leach@linaro.org>
:::::: CC: Mathieu Poirier <mathieu.poirier@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
