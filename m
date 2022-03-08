Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7926442
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 23:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646782246; x=1678318246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nq7TLCy8Yv0GpYqMYR80Z81yi6Re6AZfB/yw1zWXOKo=;
  b=nIi6MTVd1SLXp9ViK9m4OtIw9vv0q4GPhP6AGvn2FAb3fLLn4JE5Kxay
   yZpR3Hxe+uS/gEiDq9svagXSwnoMjPcfRwTiYzDCHB9Prikym+ZkFZ59b
   MaJ93aiioOZOzf/CDunMLGDLTxMCr8DPfegK0BLEQilofVCLQl1BX/cP5
   9oqeCtFGSxn0joDGDA0gDjZAeRD9DN9wWAceYPhzJ23jrw8aymw2ZU38q
   nAvYB9g3/t4q0s0PVD6KH0BFpvPGgOWV4GzAYhVWhWbsfsZlijuAzOaFC
   BaWvrDEjDLi+cvRnn8nrPnOImgncFOxySHwrY87AwhA/zjLS8h23ICiDj
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="253670299"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="253670299"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 15:30:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="711729553"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 08 Mar 2022 15:30:43 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRjHu-0002BJ-H4; Tue, 08 Mar 2022 23:30:42 +0000
Date: Wed, 9 Mar 2022 07:30:39 +0800
From: kernel test robot <lkp@intel.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org, Todd Kjos <tkjos@google.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.10
 3194/9999] kernel/module.c:4792:6: warning: no previous prototype for
 function 'android_debug_for_each_module'
Message-ID: <202203090739.89kwW2Yp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Elliot,

FYI, the error/warning still remains.

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android13-5.10
head:   8ffc7ff817fe552592daa2b0de1760e3539663f3
commit: 0bb433e0140efece0a1ce8124283cb68fda33a3f [3194/9999] ANDROID: debug_symbols: Add android_debug_for_each_module
config: i386-randconfig-a013-20220307 (https://download.01.org/0day-ci/archive/20220309/202203090739.89kwW2Yp-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/0bb433e0140efece0a1ce8124283cb68fda33a3f
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android13-5.10
        git checkout 0bb433e0140efece0a1ce8124283cb68fda33a3f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/module.c:4792:6: warning: no previous prototype for function 'android_debug_for_each_module' [-Wmissing-prototypes]
   void android_debug_for_each_module(int (*fn)(const char *mod_name, void *mod_addr, void *data),
        ^
   kernel/module.c:4792:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void android_debug_for_each_module(int (*fn)(const char *mod_name, void *mod_addr, void *data),
   ^
   static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on DMADEVICES
   Selected by
   - GKI_HIDDEN_DMA_CONFIGS


vim +/android_debug_for_each_module +4792 kernel/module.c

  4790	
  4791	#ifdef CONFIG_ANDROID_DEBUG_SYMBOLS
> 4792	void android_debug_for_each_module(int (*fn)(const char *mod_name, void *mod_addr, void *data),
  4793		void *data)
  4794	{
  4795		struct module *module;
  4796	
  4797		preempt_disable();
  4798		list_for_each_entry_rcu(module, &modules, list) {
  4799			if (fn(module->name, module->core_layout.base, data))
  4800				goto out;
  4801		}
  4802	out:
  4803		preempt_enable();
  4804	}
  4805	EXPORT_SYMBOL_GPL(android_debug_for_each_module);
  4806	#endif
  4807	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
