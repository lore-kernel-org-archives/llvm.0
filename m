Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEAEA929;
	Fri,  4 Aug 2023 09:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691142679; x=1722678679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=atB+0l+Lu+t706a438LCjBf2ULDH+DgjLgq5kcQ1cnM=;
  b=eIG9ei3SB8/y3L7PLyogfmKF/5gRkkqLVol7ZOHr2tpOfOk6l+2wlgIo
   ekozLwiVIOTsvXPV0D6R0prG9Lbs6zAPD71PfMdExJL4zaOoAlourqC+W
   5IcqGkBEYfni0WYt6JhoeAP1Y8CropTR22Ki0D1ZuusfmSjbbWKzyT/bb
   XVB5OqLy0vlFrIdjrfhjsZ1oY2ERwH4TQ7W7SVmqSenEhvcLctR67hw62
   3BrrVpy5cZZ4pBIKSZ3uRyPiJ8aZ0bxEDAMi03q9iKgLBMsaclkzuD7c+
   S0IUADSGTFCj7Hs4ABn6aW5ndo9nJP6LwdyGo5v2oWAWYxGDZDdhsnAfr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="433966822"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="433966822"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 02:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="976521357"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="976521357"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Aug 2023 02:51:17 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRrSm-0002mN-30;
	Fri, 04 Aug 2023 09:51:16 +0000
Date: Fri, 4 Aug 2023 17:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: Zhongkun He <hezhongkun.hzk@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH RESEND v2 1/2] memcg: Add support for zram object
 charge
Message-ID: <202308041718.hENRizMc-lkp@intel.com>
References: <20230804075736.207995-1-hezhongkun.hzk@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804075736.207995-1-hezhongkun.hzk@bytedance.com>

Hi Zhongkun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on akpm-mm/mm-everything linus/master v6.5-rc4 next-20230804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhongkun-He/memcg-Add-support-for-zram-object-charge/20230804-155952
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230804075736.207995-1-hezhongkun.hzk%40bytedance.com
patch subject: [RFC PATCH RESEND v2 1/2] memcg: Add support for zram object charge
config: arm-randconfig-r032-20230801 (https://download.01.org/0day-ci/archive/20230804/202308041718.hENRizMc-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041718.hENRizMc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308041718.hENRizMc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/damon/core.c:10:
   In file included from include/linux/damon.h:11:
>> include/linux/memcontrol.h:1886:5: warning: no previous prototype for function 'obj_cgroup_charge_zram' [-Wmissing-prototypes]
   int obj_cgroup_charge_zram(struct obj_cgroup *objcg, gfp_t gfp,
       ^
   include/linux/memcontrol.h:1886:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int obj_cgroup_charge_zram(struct obj_cgroup *objcg, gfp_t gfp,
   ^
   static 
>> include/linux/memcontrol.h:1892:6: warning: no previous prototype for function 'obj_cgroup_uncharge_zram' [-Wmissing-prototypes]
   void obj_cgroup_uncharge_zram(struct obj_cgroup *objcg, size_t size)
        ^
   include/linux/memcontrol.h:1892:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void obj_cgroup_uncharge_zram(struct obj_cgroup *objcg, size_t size)
   ^
   static 
   2 warnings generated.
--
   In file included from drivers/gpu/drm/tilcdc/tilcdc_panel.c:7:
   In file included from include/linux/backlight.h:13:
   In file included from include/linux/fb.h:7:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
>> include/linux/memcontrol.h:1886:5: error: no previous prototype for function 'obj_cgroup_charge_zram' [-Werror,-Wmissing-prototypes]
   int obj_cgroup_charge_zram(struct obj_cgroup *objcg, gfp_t gfp,
       ^
   include/linux/memcontrol.h:1886:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int obj_cgroup_charge_zram(struct obj_cgroup *objcg, gfp_t gfp,
   ^
   static 
>> include/linux/memcontrol.h:1892:6: error: no previous prototype for function 'obj_cgroup_uncharge_zram' [-Werror,-Wmissing-prototypes]
   void obj_cgroup_uncharge_zram(struct obj_cgroup *objcg, size_t size)
        ^
   include/linux/memcontrol.h:1892:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void obj_cgroup_uncharge_zram(struct obj_cgroup *objcg, size_t size)
   ^
   static 
   2 errors generated.


vim +/obj_cgroup_charge_zram +1886 include/linux/memcontrol.h

  1885	
> 1886	int obj_cgroup_charge_zram(struct obj_cgroup *objcg, gfp_t gfp,
  1887						size_t size)
  1888	{
  1889		return 0;
  1890	}
  1891	
> 1892	void obj_cgroup_uncharge_zram(struct obj_cgroup *objcg, size_t size)
  1893	{
  1894	}
  1895	#endif /* CONFIG_MEMCG_KMEM */
  1896	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
