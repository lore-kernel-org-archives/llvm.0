Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485432C82
	for <llvm@lists.linux.dev>; Tue, 18 Jan 2022 18:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642531927; x=1674067927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oSZsUFFIujGc552YO7ezn9Sye+1tfnsrhBhk15yLsCQ=;
  b=A6EHYo/Zm0xHSh+JFdmD8aAE0+IzhZhsnsEbqjhzXtzZEGAtpHkwystB
   ZtvuO2/IDYsqsRs4h9WeJd6cKPdSZn+Dvso/YGnuVobFxRwh6stMjrdsH
   6CDfqFveeQTCl+BgC4e2wK6HeW/HtKke+w5tf8ONkPHyoahDJYgcghdY1
   BqrmpRrgw8cBgMGCMtpwpzT8iuvBb3kFc5eVB3DlnULOh86w0HdMZpa1t
   KJvtqME9k4UJuWebFwtdTEsreoEktrmicVS0q9hSva9sUD5gEG1jCmeeg
   RpQhp8cjGN8Vq+L+yEuBfmNCY35FpXRYzFlGWo6/DSdb7w0nj5PvRgq07
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="244683800"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; 
   d="scan'208";a="244683800"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2022 10:52:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; 
   d="scan'208";a="622239395"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2022 10:52:05 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n9taO-000CrJ-KS; Tue, 18 Jan 2022 18:52:04 +0000
Date: Wed, 19 Jan 2022 02:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [drm-tip:drm-tip 8/10] drivers/gpu/drm/i915/i915_gem_evict.h:15:15:
 error: declaration of 'struct i915_gem_ww_ctx' will not be visible outside
 of this function
Message-ID: <202201190210.q12RphMz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   ceefc39c8abf37ff93eb36001f82e725756863c8
commit: e38294cfc29f789b541ecc08be2e578da746663c [8/10] Merge remote-tracking branch 'drm-intel/drm-intel-gt-next' into drm-tip
config: x86_64-randconfig-a002-20220117 (https://download.01.org/0day-ci/archive/20220119/202201190210.q12RphMz-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c10cbb243cafc0cf42c3e922cb29183279444432)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
        git fetch --no-tags drm-tip drm-tip
        git checkout e38294cfc29f789b541ecc08be2e578da746663c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

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
