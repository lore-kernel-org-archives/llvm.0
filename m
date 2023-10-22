Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FAFA2C;
	Sun, 22 Oct 2023 03:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQWAoMDz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697945561; x=1729481561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xHNoW0w/fLwc4Fz01Px4H28GvNindrpN11v1n2W+p0I=;
  b=OQWAoMDzYPNLCd4Ao/cnt3oEMi8VbzhqNbtJSQ8VZ3GS2wSwQPAloaM3
   B2Lj/Q9+StpVEG6E8jHoXxjF4KNCCErNs0HhgqpJVI7YpqaqMZ5DjMMe5
   XxweMYB9tDEeggjqSogyEssSsBoVYMezJymCp4fhGi5QmpgkTaDDimC/q
   zm2s3ddJAwwstEipeJ/lWrLTTZEU1pHi0byj62ilOBuGaQwiBU9L7W9rS
   56IzRTt5bxPdAW6tGBt4pvQgdHg2QRkkcSgUKKXee8LbUZoEruwjtiVn0
   FrF44R3M0uzO5BuwVGfMgkzTH0HeYgyMF6DL4ApV9U9tXhLiQH3RGV8A7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="450898345"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="450898345"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 20:32:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="734327345"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="734327345"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Oct 2023 20:32:39 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quPCf-0005XS-1t;
	Sun, 22 Oct 2023 03:32:37 +0000
Date: Sun, 22 Oct 2023 11:32:21 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth 1007/1018] io_uring/zc_rx.c:49:51: warning: shift
 count >= width of type
Message-ID: <202310221124.2g79iLMk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth
head:   cff8a226d561bc0db814b65ca5d2c97894d4d1cd
commit: 568ae4bf1dd0e1796a663c6d120199e2f2f52ebb [1007/1018] io_uring: allocate a uarg for freeing zero copy skbs
config: arm-ixp4xx_defconfig (https://download.01.org/0day-ci/archive/20231022/202310221124.2g79iLMk-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310221124.2g79iLMk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221124.2g79iLMk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/zc_rx.c:49:51: warning: shift count >= width of type [-Wshift-count-overflow]
           return PagePrivate(page) && ((page_private(page) >> 48) == 0xface);
                                                            ^  ~~
   io_uring/zc_rx.c:173:5: warning: no previous prototype for function 'io_zc_rx_create_pool' [-Wmissing-prototypes]
   int io_zc_rx_create_pool(struct io_ring_ctx *ctx,
       ^
   io_uring/zc_rx.c:173:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int io_zc_rx_create_pool(struct io_ring_ctx *ctx,
   ^
   static 
   2 warnings generated.


vim +49 io_uring/zc_rx.c

    46	
    47	static bool is_zc_rx_page(struct page *page)
    48	{
  > 49		return PagePrivate(page) && ((page_private(page) >> 48) == 0xface);
    50	}
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
