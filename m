Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CF75F1CE;
	Tue,  5 Dec 2023 15:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGgcIfBL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701790300; x=1733326300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9d+CrePk0J5cve1H8K0Z0/p2xvhNTllfEP6S+ZkrQk8=;
  b=IGgcIfBLE0dpbZhrx6vJ2dmozZwZs0pLmeSdRVLvCtXFBxDx0KGkhXWt
   kQaT7f9jTVoJZ4rvbFAa5gy1uHYTKC1IAOc+V+W37cmAss7U3E8KNI4wd
   v63SXMX2ihI5z9WyMcBHvs0qf8tILPuPQqbZmufkJK+ZwYc4MHDosuM7R
   qC6u/bt6rX/GHU6jcMf1LtIsXpHxEeNTY/vYzey8HeZpnMAn1shjKCA0N
   wDeI31ZzLFZ/OQKLjOAS4aS+EEkzoi6Qn01TusvdNSF9lcGSSGnXNyk8N
   rxcACJRmE7IwfwLZ1j9erGfLbrOe+leMTl5P/9Bbco2CeIfo5KBSZTukY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="458229238"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="458229238"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 07:31:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="861778081"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="861778081"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Dec 2023 07:31:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAXOa-0009Eo-28;
	Tue, 05 Dec 2023 15:31:36 +0000
Date: Tue, 5 Dec 2023 23:31:07 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next v3 01/13] net: phy: Introduce ethernet link
 topology representation
Message-ID: <202312052307.KuiFEyDS-lkp@intel.com>
References: <20231201163704.1306431-2-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201163704.1306431-2-maxime.chevallier@bootlin.com>

Hi Maxime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-phy-Introduce-ethernet-link-topology-representation/20231202-003935
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231201163704.1306431-2-maxime.chevallier%40bootlin.com
patch subject: [RFC PATCH net-next v3 01/13] net: phy: Introduce ethernet link topology representation
config: i386-randconfig-011-20231203 (https://download.01.org/0day-ci/archive/20231205/202312052307.KuiFEyDS-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052307.KuiFEyDS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052307.KuiFEyDS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: phy_link_topo_init
   >>> referenced by dev.c:10836 (net/core/dev.c:10836)
   >>>               net/core/dev.o:(alloc_netdev_mqs) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [m]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=n]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
