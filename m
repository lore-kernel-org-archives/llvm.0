Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8645B4C71
	for <llvm@lists.linux.dev>; Thu, 15 Sep 2022 19:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663271325; x=1694807325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QL/cQvNufKoZPWMFB6LNKH9pSjpf98OHnLRzFNxOrCg=;
  b=SuHPZoN11RKSmk7hrglDWrFc8jodtsF/kD74jVJVVRyl/B8B3+EU09DN
   Djz4AcY7jeX/AKLj6lXv8jqSBAYHTsDwslXLJu60IIIuVo6FxBpyNhcnt
   UAN/MLDp2RKIKXkWxK57ZhDgkan3+5FJY5drFiVTGz/Pf5EdOgwfL28tz
   9TurcdlmX4uhBvIHV7oi1k0R/IZA0xYcFPMKVomnbRaoYfVaVTF1WVo8X
   tEiWEb1DhZ4TpqpHB46nIp4v/DDe6VEbsb52YpWm4ov+qmV6hSOPgf/2V
   WHqhC1X6oPnt9AVeemS5kcgvTBdRyq+Yw4zBFwt+A9tg2zhgjPAdWA8mM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="279204900"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; 
   d="scan'208";a="279204900"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 12:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; 
   d="scan'208";a="946104148"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Sep 2022 12:48:42 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oYuqo-0000vz-0g;
	Thu, 15 Sep 2022 19:48:42 +0000
Date: Fri, 16 Sep 2022 03:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	patchwork-lst@pengutronix.de, kernel@pengutronix.de,
	dri-devel@lists.freedesktop.org,
	Russell King <linux+etnaviv@armlinux.org.uk>
Subject: Re: [PATCH] drm/etnaviv: don't truncate physical page address
Message-ID: <202209160334.FfC9eCgv-lkp@intel.com>
References: <20220915141941.3408991-1-l.stach@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915141941.3408991-1-l.stach@pengutronix.de>

Hi Lucas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.0-rc5 next-20220915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Stach/drm-etnaviv-don-t-truncate-physical-page-address/20220915-222156
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
config: arm64-randconfig-r001-20220915 (https://download.01.org/0day-ci/archive/20220916/202209160334.FfC9eCgv-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/941356fb766e7f49216d44f0df7614c2e4610a11
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lucas-Stach/drm-etnaviv-don-t-truncate-physical-page-address/20220915-222156
        git checkout 941356fb766e7f49216d44f0df7614c2e4610a11
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/etnaviv/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/etnaviv/etnaviv_mmu.c:86:44: warning: format specifies type 'unsigned int' but the argument has type 'phys_addr_t' (aka 'unsigned long long') [-Wformat]
                   VERB("map[%d]: %08x %08x(%zx)", i, iova, pa, bytes);
                                       ~~~~                 ^~
                                       %08llx
   drivers/gpu/drm/etnaviv/etnaviv_drv.h:85:52: note: expanded from macro 'VERB'
   #define VERB(fmt, ...) if (0) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
                                           ~~~        ^~~~~~~~~~~
   include/drm/drm_print.h:526:32: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
                                  ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +86 drivers/gpu/drm/etnaviv/etnaviv_mmu.c

50073cf98d1635 Lucas Stach         2017-09-07   71  
27b67278e007b5 Lucas Stach         2019-07-05   72  static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
a8c21a5451d831 The etnaviv authors 2015-12-03   73  			     struct sg_table *sgt, unsigned len, int prot)
27b67278e007b5 Lucas Stach         2019-07-05   74  {	struct scatterlist *sg;
a8c21a5451d831 The etnaviv authors 2015-12-03   75  	unsigned int da = iova;
182354a526a054 Marek Szyprowski    2020-04-28   76  	unsigned int i;
a8c21a5451d831 The etnaviv authors 2015-12-03   77  	int ret;
a8c21a5451d831 The etnaviv authors 2015-12-03   78  
27b67278e007b5 Lucas Stach         2019-07-05   79  	if (!context || !sgt)
a8c21a5451d831 The etnaviv authors 2015-12-03   80  		return -EINVAL;
a8c21a5451d831 The etnaviv authors 2015-12-03   81  
182354a526a054 Marek Szyprowski    2020-04-28   82  	for_each_sgtable_dma_sg(sgt, sg, i) {
941356fb766e7f Lucas Stach         2022-09-15   83  		phys_addr_t pa = sg_dma_address(sg) - sg->offset;
a8c21a5451d831 The etnaviv authors 2015-12-03   84  		size_t bytes = sg_dma_len(sg) + sg->offset;
a8c21a5451d831 The etnaviv authors 2015-12-03   85  
a8c21a5451d831 The etnaviv authors 2015-12-03  @86  		VERB("map[%d]: %08x %08x(%zx)", i, iova, pa, bytes);
a8c21a5451d831 The etnaviv authors 2015-12-03   87  
27b67278e007b5 Lucas Stach         2019-07-05   88  		ret = etnaviv_context_map(context, da, pa, bytes, prot);
a8c21a5451d831 The etnaviv authors 2015-12-03   89  		if (ret)
a8c21a5451d831 The etnaviv authors 2015-12-03   90  			goto fail;
a8c21a5451d831 The etnaviv authors 2015-12-03   91  
a8c21a5451d831 The etnaviv authors 2015-12-03   92  		da += bytes;
a8c21a5451d831 The etnaviv authors 2015-12-03   93  	}
a8c21a5451d831 The etnaviv authors 2015-12-03   94  
9247fcca3982a2 Lucas Stach         2022-03-23   95  	context->flush_seq++;
9247fcca3982a2 Lucas Stach         2022-03-23   96  
a8c21a5451d831 The etnaviv authors 2015-12-03   97  	return 0;
a8c21a5451d831 The etnaviv authors 2015-12-03   98  
a8c21a5451d831 The etnaviv authors 2015-12-03   99  fail:
182354a526a054 Marek Szyprowski    2020-04-28  100  	etnaviv_context_unmap(context, iova, da - iova);
a8c21a5451d831 The etnaviv authors 2015-12-03  101  	return ret;
a8c21a5451d831 The etnaviv authors 2015-12-03  102  }
a8c21a5451d831 The etnaviv authors 2015-12-03  103  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
