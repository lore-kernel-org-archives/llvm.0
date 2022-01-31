Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7F82CA1
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 19:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643658904; x=1675194904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y1jpjI28bV0ruO9+BHCzG3vX9xXNEkrMAP1YbT2VSww=;
  b=kkdOcnywAObIbsEKgQBmySQeeA6zGgEBz4m7uGtwIzNEzk8vWdTSQNoU
   NK3VPdKMbS0Yr7FEsFMenv7tHgG0f9cuxZ8/zOX0kfjX+o1JeOB3gnlao
   Go9gjUewls0MLJF+UnZqMYj6pRr/0QgxbJwJPT+S/I6zIPKPnFJaNG9jd
   c+lgySQD7dUW7g1QZLuFeuX0u5A6rSsnV2fD8T0fHgzKxpcoWL0HDlK/t
   2pmGdpQuA/WSUub0X+cgEigZNNkmt9VwWjrn7m+iq0kmmvjp2HpOT8Vn+
   kW8luZGZ+6wUMJMSsLDmYTjgw+lGnT04xz2vn1rXKpGzk6Uo8QgAZvuI+
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="245130274"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="245130274"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 11:54:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="626486527"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2022 11:54:45 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEclA-000SIY-QT; Mon, 31 Jan 2022 19:54:44 +0000
Date: Tue, 1 Feb 2022 03:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2907/2969]
 drivers/gpu/drm/i915/i915_gem_evict.h:15:15: error: declaration of 'struct
 i915_gem_ww_ctx' will not be visible outside of this function
Message-ID: <202202010322.5qfXPr2u-lkp@intel.com>
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
head:   887a333c44eb67973622e530e43cd5e4cf9af927
commit: 9464d02e6933ba71dd23a246634773cb003b658c [2907/2969] Merge branch 'for-linux-next-gt' of git://anongit.freedesktop.org/drm-intel
config: i386-randconfig-a011-20220131 (https://download.01.org/0day-ci/archive/20220201/202202010322.5qfXPr2u-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbaca3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=9464d02e6933ba71dd23a246634773cb003b658c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 9464d02e6933ba71dd23a246634773cb003b658c
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
