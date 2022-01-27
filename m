Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193BD2CA0
	for <llvm@lists.linux.dev>; Thu, 27 Jan 2022 11:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643283478; x=1674819478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C4AYGw+3Sv/c/oKlfSjY0iJF7UrPQX+eWjcWYqHGkoQ=;
  b=e2+OnCHditcxWfFtFispC0O0yhWtekq9VCIOS/ZOAPlAoWDv6TulXqoF
   YZfXWyvcrllvrdJDzHApj4sGkyTIbz9J+DEkTN+NPXPtI85yGmj+J3vZv
   5ANsrftBsdfh55WaQbnrMOCrTP0CaoV0b7rWHZNbGANIIuHo420knZLIF
   S3B1UXWqNu8jtuPezmGk7tvVUGsqyXBL7grhhiliqbHHj9NxRlKpwyk2r
   z/IwxIS521uG3mglEb2IR8enCtABo8NwmAlys1dm8rvGj24yIupfkkAPa
   CoX7pk3rduFIpNzAgA11f/z8dlI0ZpXRorSELTDzAL+uBEMqZfMOymjhG
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="244426676"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; 
   d="scan'208";a="244426676"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 03:37:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; 
   d="scan'208";a="563757005"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Jan 2022 03:37:55 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nD36A-000MYq-M3; Thu, 27 Jan 2022 11:37:54 +0000
Date: Thu, 27 Jan 2022 19:37:37 +0800
From: kernel test robot <lkp@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2367/2421]
 drivers/gpu/drm/i915/i915_gem_evict.h:15:15: error: declaration of 'struct
 i915_gem_ww_ctx' will not be visible outside of this function
Message-ID: <202201271909.PMc8rTNu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0eb96e2c58c03e79fc2ee833ba88bf9226986564
commit: 59d23ab387e87ad7663cbf7265cff163d41f34a6 [2367/2421] Merge branch 'for-linux-next-gt' of git://anongit.freedesktop.org/drm-intel
config: i386-randconfig-a016-20220124 (https://download.01.org/0day-ci/archive/20220127/202201271909.PMc8rTNu-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f400a6012c668dfaa73462caf067ceb074e66c47)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=59d23ab387e87ad7663cbf7265cff163d41f34a6
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 59d23ab387e87ad7663cbf7265cff163d41f34a6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:4:
>> drivers/gpu/drm/i915/i915_gem_evict.h:15:15: error: declaration of 'struct i915_gem_ww_ctx' will not be visible outside of this function [-Werror,-Wvisibility]
                                             struct i915_gem_ww_ctx *ww,
                                                    ^
   drivers/gpu/drm/i915/i915_gem_evict.h:21:14: error: declaration of 'struct i915_gem_ww_ctx' will not be visible outside of this function [-Werror,-Wvisibility]
                                            struct i915_gem_ww_ctx *ww,
                                                   ^
   drivers/gpu/drm/i915/i915_gem_evict.h:25:16: error: declaration of 'struct i915_gem_ww_ctx' will not be visible outside of this function [-Werror,-Wvisibility]
                         struct i915_gem_ww_ctx *ww);
                                ^
   3 errors generated.


vim +15 drivers/gpu/drm/i915/i915_gem_evict.h

    13	
    14	int __must_check i915_gem_evict_something(struct i915_address_space *vm,
  > 15						  struct i915_gem_ww_ctx *ww,
    16						  u64 min_size, u64 alignment,
    17						  unsigned long color,
    18						  u64 start, u64 end,
    19						  unsigned flags);
    20	int __must_check i915_gem_evict_for_node(struct i915_address_space *vm,
    21						 struct i915_gem_ww_ctx *ww,
    22						 struct drm_mm_node *node,
    23						 unsigned int flags);
    24	int i915_gem_evict_vm(struct i915_address_space *vm,
    25			      struct i915_gem_ww_ctx *ww);
    26	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
