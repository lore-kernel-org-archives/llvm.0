Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A897F
	for <llvm@lists.linux.dev>; Mon,  1 Aug 2022 22:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659392514; x=1690928514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q5X8l4dioprMK4qGEnFeqa81fe/C/lrjNZ06tNnnru0=;
  b=niGtKOnkTjCyojPmXKKc91OqWxh0y6rVtDUMrtxsKw44JA4oXgtGfGpw
   chTdDKzSb6rdO84ODWoCvz3PEDR2fqzoF7y6jGAlrKY0hCBwz65xwz1+s
   NQiWzCBjgEeF6gvxFCsnaPBbn9F8ZzVRrdj26UqRgJvbnLlzgz1SFJ3Lh
   ANM1LguByW0m+qymnjYY8lWgBk8hD+KGyeEUIR9MCktHHmx0B2pTtQ8VT
   s9v+bG21wKQafDftswIQo2X4WA0P4pZdvLmuaqLi+PUA1G+RKUOmo7XNO
   JKUarnTdQycsn76lkudQmltyNU/rx2q/6IwQE3tXBwbMzALjk4ULakHgI
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="290476092"
X-IronPort-AV: E=Sophos;i="5.93,209,1654585200"; 
   d="scan'208";a="290476092"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 15:21:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,209,1654585200"; 
   d="scan'208";a="635066191"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Aug 2022 15:21:52 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oIdnL-000FQl-2E;
	Mon, 01 Aug 2022 22:21:51 +0000
Date: Tue, 2 Aug 2022 06:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Nathan Chancellor <natechancellor@gmail.com>
Subject: drivers/gpu/drm/i915/i915_sw_fence.c:47:20: error: unused function
 'debug_fence_init_onstack'
Message-ID: <202208020632.SW3GUtGm-lkp@intel.com>
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
head:   9de1f9c8ca5100a02a2e271bdbde36202e251b4b
commit: 9f4069b055d1508c833115df7493b6e0001e5c9b drm/i915: re-disable -Wframe-address
date:   2 years, 3 months ago
config: x86_64-randconfig-a001-20220801 (https://download.01.org/0day-ci/archive/20220802/202208020632.SW3GUtGm-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
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

>> drivers/gpu/drm/i915/i915_sw_fence.c:47:20: error: unused function 'debug_fence_init_onstack' [-Werror,-Wunused-function]
   static inline void debug_fence_init_onstack(struct i915_sw_fence *fence)
                      ^
   1 error generated.


vim +/debug_fence_init_onstack +47 drivers/gpu/drm/i915/i915_sw_fence.c

fc1584059d6c43 Chris Wilson 2016-11-25  46  
214707fc2ce08d Chris Wilson 2017-10-12 @47  static inline void debug_fence_init_onstack(struct i915_sw_fence *fence)
214707fc2ce08d Chris Wilson 2017-10-12  48  {
214707fc2ce08d Chris Wilson 2017-10-12  49  	debug_object_init_on_stack(fence, &i915_sw_fence_debug_descr);
214707fc2ce08d Chris Wilson 2017-10-12  50  }
214707fc2ce08d Chris Wilson 2017-10-12  51  

:::::: The code at line 47 was first introduced by commit
:::::: 214707fc2ce08d09982bc4fe4b7a1c1f010e82be drm/i915/selftests: Wrap a timer into a i915_sw_fence

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
