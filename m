Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED389259C
	for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 16:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661187537; x=1692723537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lw0sAPkCENe0vTSIoAyxyGpPW+YUlIRxQmC+3cqpAgY=;
  b=BQCybFLnCLm9TAFrmHL1HqzmWSjEa5MIhoBEWiZu7Tbm9NHNzHTuCktk
   DnsF2/QCfgfxN07zQ/M9C1AHwKA/MhJtO28eQLRg9oZDdQNEGjLDC7cXh
   JtoHCnAg2H3ct4n1ochy/K0AXIdxAN8cX1XucbOqrd/G74r4oD5M3wZSd
   FGhG45sTN8WVGvony9XctoEv20YBgg3Px3PqgKLF3Q58SA581kteDmL0H
   AszWTL0GGqcpfrVtjXabIs6DP7Zo2023PeuheXZq1TbNo6+uuiCZTNclz
   GWEQa1m2k/9I6FP7buQeUzlQMefWSLcCnEEUcjj10bhMKzQFpbt+VmxFq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="276497339"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="276497339"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 09:58:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="937114179"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Aug 2022 09:58:54 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oQAlJ-0000UF-20;
	Mon, 22 Aug 2022 16:58:53 +0000
Date: Tue, 23 Aug 2022 00:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Nathan Chancellor <natechancellor@gmail.com>
Subject: drivers/gpu/drm/i915/i915_sw_fence.c:90:20: error: unused function
 'debug_fence_init_onstack'
Message-ID: <202208230005.ZOG0eeUT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nick,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c23f9e627a7b412978b4e852793c5e3c3efc555
commit: 9f4069b055d1508c833115df7493b6e0001e5c9b drm/i915: re-disable -Wframe-address
date:   2 years, 4 months ago
config: x86_64-randconfig-a005-20220822 (https://download.01.org/0day-ci/archive/20220823/202208230005.ZOG0eeUT-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9f4069b055d1508c833115df7493b6e0001e5c9b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9f4069b055d1508c833115df7493b6e0001e5c9b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_sw_fence.c:90:20: error: unused function 'debug_fence_init_onstack' [-Werror,-Wunused-function]
   static inline void debug_fence_init_onstack(struct i915_sw_fence *fence)
                      ^
>> drivers/gpu/drm/i915/i915_sw_fence.c:111:20: error: unused function 'debug_fence_free' [-Werror,-Wunused-function]
   static inline void debug_fence_free(struct i915_sw_fence *fence)
                      ^
   2 errors generated.


vim +/debug_fence_init_onstack +90 drivers/gpu/drm/i915/i915_sw_fence.c

fc1584059d6c43 Chris Wilson 2016-11-25   89  
214707fc2ce08d Chris Wilson 2017-10-12  @90  static inline void debug_fence_init_onstack(struct i915_sw_fence *fence)
214707fc2ce08d Chris Wilson 2017-10-12   91  {
214707fc2ce08d Chris Wilson 2017-10-12   92  }
214707fc2ce08d Chris Wilson 2017-10-12   93  
fc1584059d6c43 Chris Wilson 2016-11-25   94  static inline void debug_fence_activate(struct i915_sw_fence *fence)
fc1584059d6c43 Chris Wilson 2016-11-25   95  {
fc1584059d6c43 Chris Wilson 2016-11-25   96  }
fc1584059d6c43 Chris Wilson 2016-11-25   97  
fc1584059d6c43 Chris Wilson 2016-11-25   98  static inline void debug_fence_set_state(struct i915_sw_fence *fence,
fc1584059d6c43 Chris Wilson 2016-11-25   99  					 int old, int new)
fc1584059d6c43 Chris Wilson 2016-11-25  100  {
fc1584059d6c43 Chris Wilson 2016-11-25  101  }
fc1584059d6c43 Chris Wilson 2016-11-25  102  
fc1584059d6c43 Chris Wilson 2016-11-25  103  static inline void debug_fence_deactivate(struct i915_sw_fence *fence)
fc1584059d6c43 Chris Wilson 2016-11-25  104  {
fc1584059d6c43 Chris Wilson 2016-11-25  105  }
fc1584059d6c43 Chris Wilson 2016-11-25  106  
fc1584059d6c43 Chris Wilson 2016-11-25  107  static inline void debug_fence_destroy(struct i915_sw_fence *fence)
fc1584059d6c43 Chris Wilson 2016-11-25  108  {
fc1584059d6c43 Chris Wilson 2016-11-25  109  }
fc1584059d6c43 Chris Wilson 2016-11-25  110  
fc1584059d6c43 Chris Wilson 2016-11-25 @111  static inline void debug_fence_free(struct i915_sw_fence *fence)
fc1584059d6c43 Chris Wilson 2016-11-25  112  {
fc1584059d6c43 Chris Wilson 2016-11-25  113  }
fc1584059d6c43 Chris Wilson 2016-11-25  114  

:::::: The code at line 90 was first introduced by commit
:::::: 214707fc2ce08d09982bc4fe4b7a1c1f010e82be drm/i915/selftests: Wrap a timer into a i915_sw_fence

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
