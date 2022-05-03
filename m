Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF9B7F
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 01:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651541174; x=1683077174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/hXC35HPvlxH3T+ghZTTmqCyfsWHn/R3ik2lq6LAws8=;
  b=E1McHNSiqdlA2QdezdguXpl97RKqfh4NO6c5mts2VA1PlgXCmQJBinJy
   S5WsC1qVASHONAFFaqMrte1AQE1NVZGT4hja7SZais7296sRy/16DkxBy
   m8d2WfV0FjYAsLtMPqVUj1hTcf8Bb/v+eEwDyQqAzSfZobDEFqOGr+JFq
   iYwPvStoLykibf7Z85KT+Z+hKC+9miwBkFyYCHOsSbj6kS97FnprrLzxa
   IKEjZQCs2GqzQiCOS6pryH5YisZ8IxFJHDFeKpfu+PP9aeRgDutwjJLTH
   2rP9MKCe7r+/J/3Qx9ymCRUwuZ145zdydvnE5sGBqhd+ZKaq1a2RPJ1yz
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="254833318"
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; 
   d="scan'208";a="254833318"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 18:26:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; 
   d="scan'208";a="620150460"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 May 2022 18:26:12 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nlhIq-000A2p-1K;
	Tue, 03 May 2022 01:26:12 +0000
Date: Tue, 3 May 2022 09:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Nathan Chancellor <natechancellor@gmail.com>
Subject: drivers/gpu/drm/i915/i915_sw_fence.c:90:20: error: unused function
 'debug_fence_init_onstack'
Message-ID: <202205030929.Dk88nH74-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9050ba3a61a4b5bd84c2cde092a100404f814f31
commit: 9f4069b055d1508c833115df7493b6e0001e5c9b drm/i915: re-disable -Wframe-address
date:   2 years ago
config: x86_64-randconfig-r023-20220502 (https://download.01.org/0day-ci/archive/20220503/202205030929.Dk88nH74-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9f4069b055d1508c833115df7493b6e0001e5c9b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9f4069b055d1508c833115df7493b6e0001e5c9b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
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
