Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7FC2C80
	for <llvm@lists.linux.dev>; Fri, 21 Jan 2022 13:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642773362; x=1674309362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=glBKrFmNXN2Uw4BPraItAz1gZf/We2C1C2ZEL9VbfT4=;
  b=JboM89piDd23IbM38hzYYbyqucGlHQSDQm6Jorh0uBdr93Vk2mum1CdK
   G0tZ32wBD66zWL44hnmDzYXKyf2IsKA0GpT5Uv3KkB2astzRjZTLBjNr9
   kH5wnY3KCtXEjjNnGTtv1PTNl/jWeaLVVEOPBURSYQ5z3fjY2KE1hOkwN
   /VUVDxilojUNdwQMsA+cqDZM8byhnwlUHtoM1Y4jsJix6FI85AG7uw4qz
   U/P/m0WM8oUp/Vo8kfmIRr0fQpouKviBM3p1xXvArEIddMzxyjOzMEajt
   CuO73pCQ/mjYcOj0MGyI/Pd1pt+txYjRaH3m1gnGVrwgNXeAVBZNQelhe
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245603423"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="245603423"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 05:55:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="694643733"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Jan 2022 05:55:47 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nAuOJ-000FLJ-8z; Fri, 21 Jan 2022 13:55:47 +0000
Date: Fri, 21 Jan 2022 21:55:09 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Beckett <bob.beckett@collabora.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v3 3/5] drm/i915: support 64K GTT pages for discrete cards
Message-ID: <202201212115.DdoJRHbQ-lkp@intel.com>
References: <20220120203721.632424-4-bob.beckett@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120203721.632424-4-bob.beckett@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Robert,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next drm-exynos/exynos-drm-next drm/drm-next tegra-drm/drm/tegra/for-next airlied/drm-next v5.16 next-20220121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Robert-Beckett/discrete-card-64K-page-support/20220121-044244
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220121/202201212115.DdoJRHbQ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/7547f27d09bac4e34155aca7ed017c04b7531e52
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Robert-Beckett/discrete-card-64K-page-support/20220121-044244
        git checkout 7547f27d09bac4e34155aca7ed017c04b7531e52
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gem/i915_gem_object.c:807:
>> drivers/gpu/drm/i915/gem/selftests/huge_pages.c:1508:10: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
                   return err;
                          ^~~
   drivers/gpu/drm/i915/gem/selftests/huge_pages.c:1485:9: note: initialize the variable 'err' to silence this warning
           int err;
                  ^
                   = 0
   1 warning generated.


vim +/err +1508 drivers/gpu/drm/i915/gem/selftests/huge_pages.c

  1480	
  1481	static int igt_ppgtt_compact(void *arg)
  1482	{
  1483		struct drm_i915_private *i915 = arg;
  1484		struct drm_i915_gem_object *obj;
  1485		int err;
  1486	
  1487		/*
  1488		 * Simple test to catch issues with compact 64K pages -- since the pt is
  1489		 * compacted to 256B that gives us 32 entries per pt, however since the
  1490		 * backing page for the pt is 4K, any extra entries we might incorrectly
  1491		 * write out should be ignored by the HW. If ever hit such a case this
  1492		 * test should catch it since some of our writes would land in scratch.
  1493		 */
  1494	
  1495		if (!HAS_64K_PAGES(i915)) {
  1496			pr_info("device lacks compact 64K page support, skipping\n");
  1497			return 0;
  1498		}
  1499	
  1500		if (!HAS_LMEM(i915)) {
  1501			pr_info("device lacks LMEM support, skipping\n");
  1502			return 0;
  1503		}
  1504	
  1505		/* We want the range to cover multiple page-table boundaries. */
  1506		obj = i915_gem_object_create_lmem(i915, SZ_4M, 0);
  1507		if (IS_ERR(obj))
> 1508			return err;
  1509	
  1510		err = i915_gem_object_pin_pages_unlocked(obj);
  1511		if (err)
  1512			goto out_put;
  1513	
  1514		if (obj->mm.page_sizes.phys < I915_GTT_PAGE_SIZE_64K) {
  1515			pr_info("LMEM compact unable to allocate huge-page(s)\n");
  1516			goto out_unpin;
  1517		}
  1518	
  1519		/*
  1520		 * Disable 2M GTT pages by forcing the page-size to 64K for the GTT
  1521		 * insertion.
  1522		 */
  1523		obj->mm.page_sizes.sg = I915_GTT_PAGE_SIZE_64K;
  1524	
  1525		err = igt_write_huge(i915, obj);
  1526		if (err)
  1527			pr_err("LMEM compact write-huge failed\n");
  1528	
  1529	out_unpin:
  1530		i915_gem_object_unpin_pages(obj);
  1531	out_put:
  1532		i915_gem_object_put(obj);
  1533	
  1534		if (err == -ENOMEM)
  1535			err = 0;
  1536	
  1537		return err;
  1538	}
  1539	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
