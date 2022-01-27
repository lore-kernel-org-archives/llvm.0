Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918702CA2
	for <llvm@lists.linux.dev>; Thu, 27 Jan 2022 02:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643248955; x=1674784955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l330bVIfzq2/Omlczm6XHCCNktKF1RHkIS9hMGnpjjU=;
  b=DLyOfsoD5tKnoygrOHnjBKP0R9KOmh+c1fu3l/nTVMmyXlErhGjBGCVq
   bgSWFDLRyvP23VE2h39vCH4jMxoZvoWUt3FbaQULvMfqrPmYlltt+068r
   x0lR1hHmTIt0aX/XHG810BQ2ssg4fTP7VAr7wIXLUR5/e4DQ5LPFODeDa
   L46266ScEvk2ykSdCLPYwIVMf5HzmS1zsSUrKob+XS8EoEfJD2ufGHqdS
   I4ueY71ETpK2M2sR+q2tYS1+hJUPGd0rS1YKEDO1wlyo1HWa5wh6TM3LB
   PLnY24nCqNZWMA38PqOcVBcz6XN0/ZNYK7ObEbHgPj8lXIEQ5e84JcBK9
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="310031443"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; 
   d="scan'208";a="310031443"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 18:02:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; 
   d="scan'208";a="581308090"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Jan 2022 18:02:32 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCu7M-000LyE-3F; Thu, 27 Jan 2022 02:02:32 +0000
Date: Thu, 27 Jan 2022 10:02:24 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	John Harrison <John.C.Harrison@Intel.com>
Subject: Re: [PATCH 16/19] drm/i915/guc: Use a single pass to calculate regset
Message-ID: <202201270902.HcRe2frP-lkp@intel.com>
References: <20220126203702.1784589-17-lucas.demarchi@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126203702.1784589-17-lucas.demarchi@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Lucas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20220125]
[cannot apply to drm-intel/for-linux-next drm-exynos/exynos-drm-next drm/drm-next tegra-drm/drm/tegra/for-next linus/master airlied/drm-next v5.17-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Lucas-De-Marchi/drm-i915-guc-Refactor-ADS-access-to-use-dma_buf_map/20220127-043912
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220127/202201270902.HcRe2frP-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7aa016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/313757d9ed833acea4ee2bb0e3f3565d6efcf3cc
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Lucas-De-Marchi/drm-i915-guc-Refactor-ADS-access-to-use-dma_buf_map/20220127-043912
        git checkout 313757d9ed833acea4ee2bb0e3f3565d6efcf3cc
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:370:3: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
                   (temp_set.storage_max * sizeof(struct guc_mmio_reg)) >> 10);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:461:63: note: expanded from macro 'drm_dbg'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
                                                                 ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +370 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c

   348	
   349	static long guc_mmio_reg_state_create(struct intel_guc *guc)
   350	{
   351		struct intel_gt *gt = guc_to_gt(guc);
   352		struct intel_engine_cs *engine;
   353		enum intel_engine_id id;
   354		struct temp_regset temp_set = {};
   355		long total = 0;
   356	
   357		for_each_engine(engine, gt, id) {
   358			u32 used = temp_set.storage_used;
   359	
   360			if (guc_mmio_regset_init(&temp_set, engine) < 0)
   361				return -1;
   362	
   363			guc->ads_regset_count[id] = temp_set.storage_used - used;
   364			total += guc->ads_regset_count[id];
   365		}
   366	
   367		guc->ads_regset = temp_set.storage;
   368	
   369		drm_dbg(&guc_to_gt(guc)->i915->drm, "Used %lu KB for temporary ADS regset\n",
 > 370			(temp_set.storage_max * sizeof(struct guc_mmio_reg)) >> 10);
   371	
   372		return total * sizeof(struct guc_mmio_reg);
   373	}
   374	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
