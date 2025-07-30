Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89F1199BC;
	Wed, 30 Jul 2025 06:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753857563; cv=none; b=IiYdnjn0otq2lwqwq1Onkja+B72zNOnwaCU7OQ9Dqs2Yp9EBCTRsFQya3wyYj1Z+hakK52EqKd9abPv3FUww71DkJwU1sPX8kF3dbld+Pll8fK4YVQhzBLDaQwj89I3bGoU+LXGiJUmB/fXCNPlcLpzJahM7l/qBRcJlXVvMbWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753857563; c=relaxed/simple;
	bh=DeNfYpXay6VjnqrhIGbam1Yw5A/Qy+vtg2AJeQozh2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A8I7/Ss/ZNMGZ/n/TCgeFCwgdd+sqsls5bg9i9I/iklX00nHMDqqCr9C0ZGvZ/KW8FeFrKvcwjZWvV/8ch2WVHLSVUMhldjbHSHK+fxW7StRcGTObqKcL10/wsojVU6M6QLp408VLh6WOEn2N29xnu9a4KEzo4B72OQiDb7nIXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCyGaUzH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCyGaUzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753857561; x=1785393561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DeNfYpXay6VjnqrhIGbam1Yw5A/Qy+vtg2AJeQozh2w=;
  b=jCyGaUzHWSohmhILO5+JBrU9a3YIaGHFonpC2W10+mLvI50KJAmpjKYC
   30UY/90TAhMAZ+HA0P638uIfReFaK46Ah1hfgZ+sxpu4WQA5kBJVygSxZ
   fg4hSV5WapAYVy9lU3PV/3FYFgiRE3GiPmatpTRnWMAt0iY/5sPUvZgwm
   rOJ62rj2XfqAxg8BmKjWLComNFoQ6sicA0wGJQ0/7zstiG1gyfejB2dHY
   IzksEE8l3BE6ePIR91Pi+nmsl8sCFLXqIZ1k96Y8GwyZ/8DzSCcSeWwTx
   vTddq7jqGiXQ09Gay0L9U32mjsELT9VRnos9rOrSrwMRL9T4MIfQKGO7A
   A==;
X-CSE-ConnectionGUID: YKa+gkQ+Q2+qCNol7yYcCA==
X-CSE-MsgGUID: PoPp+iwpR9uJolxSrofBxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56295596"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56295596"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 23:39:20 -0700
X-CSE-ConnectionGUID: +FfgERvXQM6661R7xZqANQ==
X-CSE-MsgGUID: EF47TEmcQEmaoU29rYmZdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="163687338"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2025 23:39:19 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uh0T7-00027u-0d;
	Wed, 30 Jul 2025 06:39:17 +0000
Date: Wed, 30 Jul 2025 14:38:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>
Subject: [drm-exynos:exynos-drm-next 3/3]
 drivers/gpu/drm/exynos/exynos_drm_dsi.c:158:13: error: use of undeclared
 identifier 'DSIM_TYPE_EXYNOS7870'
Message-ID: <202507301448.RRNuQS1g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
head:   3b57713ed0626c2277b871f11de467fdf8d154ef
commit: 3b57713ed0626c2277b871f11de467fdf8d154ef [3/3] drm/exynos: dsi: add support for exynos7870
config: arm64-randconfig-002-20250730 (https://download.01.org/0day-ci/archive/20250730/202507301448.RRNuQS1g-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507301448.RRNuQS1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507301448.RRNuQS1g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/exynos/exynos_drm_dsi.c:158:13: error: use of undeclared identifier 'DSIM_TYPE_EXYNOS7870'
     158 |         .hw_type = DSIM_TYPE_EXYNOS7870,
         |                    ^
   1 error generated.


vim +/DSIM_TYPE_EXYNOS7870 +158 drivers/gpu/drm/exynos/exynos_drm_dsi.c

   156	
   157	static const struct samsung_dsim_plat_data exynos7870_dsi_pdata = {
 > 158		.hw_type = DSIM_TYPE_EXYNOS7870,
   159		.host_ops = &exynos_dsi_exynos_host_ops,
   160	};
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
