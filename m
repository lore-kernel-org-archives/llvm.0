Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0469729CA
	for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 17:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639590614; x=1671126614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UXVAi9BXaydSML6j5ZDaOSyhxIpn0/1a6PgbOjLKiYU=;
  b=W1YsBP1zIVXWagfZT7KoEMNhpxKKPeaBwfEvlxS0gt62kPTvwOOTZ1E9
   P3FuknhzvB1GQVqNruWhhASjjkpXUEmqIhJrEL49g5Q2e6/3EwoRUveTT
   4WAFO2u7MI8IMBZEtjzgSucDoRU+DauwOcdVQlOK555XT5ZLDl3iHCDS/
   xeU8WZx7TuczVXSjosSwQ/OSOvR6dKvcJXl+tvWhgBlM1Vfp9QaFjOMs1
   L2Tp+XW1HRPBmUvYY69W5gtsNAYygQw+pDzFnJt9mpngKGoHxa4ByX7bP
   s86xM5CkJJePXgOGp0cNEYH8abMWK0fFoNJzalBAaSKBABLDOfc4ByofC
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="238033531"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="238033531"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 09:50:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="614801880"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Dec 2021 09:50:10 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxYPq-000291-90; Wed, 15 Dec 2021 17:50:10 +0000
Date: Thu, 16 Dec 2021 01:49:27 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	matthew.auld@intel.com
Subject: Re: [PATCH 1/7] drm/i915: Avoid using the i915_fence_array when
 collecting dependencies
Message-ID: <202112160101.AqbkqxoO-lkp@intel.com>
References: <20211215103611.777665-2-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215103611.777665-2-thomas.hellstrom@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "Thomas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on drm-exynos/exynos-drm-next drm/drm-next next-20211214]
[cannot apply to drm-intel/for-linux-next tegra-drm/drm/tegra/for-next airlied/drm-next v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Thomas-Hellstr-m/drm-i915-Asynchronous-vma-unbinding/20211215-183859
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-a013-20211214 (https://download.01.org/0day-ci/archive/20211216/202112160101.AqbkqxoO-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0f61eb08a6b9d7fa9f19eaa071ad5591de123633
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-i915-Asynchronous-vma-unbinding/20211215-183859
        git checkout 0f61eb08a6b9d7fa9f19eaa071ad5591de123633
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c:634:5: warning: no previous prototype for function 'prev_deps' [-Wmissing-prototypes]
   int prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
       ^
   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c:634:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
   ^
   static 
   1 warning generated.


vim +/prev_deps +634 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c

   633	
 > 634	int prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
   635		      struct i915_deps *deps)
   636	{
   637		int ret;
   638	
   639		ret = i915_deps_add_dependency(deps, bo->moving, ctx);
   640		if (!ret)
   641			/*
   642			 * TODO: Only await excl fence here, and shared fences before
   643			 * signaling the migration fence.
   644			 */
   645			ret = i915_deps_add_resv(deps, bo->base.resv, true, false, ctx);
   646	
   647		return ret;
   648	}
   649	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
