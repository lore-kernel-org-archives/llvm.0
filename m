Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71FB2580DE;
	Wed, 24 Dec 2025 20:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766608934; cv=none; b=piLKnxe1Qjf/RDQQHwoGytoZiqq6vg6e5IyYiEFnBAp/XJQHRdAbav6svM5DIhCBTWeN9xD55bnkORt7XqQ08BD5NS+/C2b7wGnH3LJKWhhmhoB9zGBjf38WdccBTOpe2uewZZRO6u//aWsgxrHRGdDrWV2YqrnSZDnZOoqzaLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766608934; c=relaxed/simple;
	bh=XrVB5bzV6PlxMhUCLbZ8BG4J7YUU7NXZcC+QkTxn+dk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZJzRB+jvVOMB/vKV4memhVa/pBt/FKrk0dNdl1xRrYS3qN6xVpYJxBBUKuaDLVdxnLI+aLPObYIcrQdMulqCP7wqhpq/5kY7fAXwaOEMFEe+UGYGF6PctcBKPgNcgl8huP0flElafiswTOPa/WGR1EVvGMiY6pBrsEybYACQVQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2i14Kuu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2i14Kuu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766608932; x=1798144932;
  h=date:from:to:cc:subject:message-id;
  bh=XrVB5bzV6PlxMhUCLbZ8BG4J7YUU7NXZcC+QkTxn+dk=;
  b=g2i14Kuusr4uOZ0lKDDeiZycZbSSJ/ge9IRH/QEV5wjVt2W0FYaKJVv1
   HmyKkhbPCw4uUibmXHmO5ZQXYd2F3TUOVdQKirqXv2tPbmi6/VNj7YxY6
   eFdew+ZtqEMAutGadzeLCnlw06msVGWPkO0MTqekMlZhXZ71XFtoZYIz9
   ZFG4Q/Y53Bp+PXBiPjiY56be3BrFsD2hwAn5tNqXojjEPjZEcj3wQlULx
   6tr6yt9KmGjn7Wfxh6gAMawIdn9AniQsfPXFWsVmZUdMt1b7kIMyWeOVd
   f4HiojqgvziCJWQsOV06dg2x9Q8veKYzWMcP5CC3ITQORKPqYEAP7U6zX
   g==;
X-CSE-ConnectionGUID: HWEFSgC8S1uTwrcSESYtIw==
X-CSE-MsgGUID: csKnn/fYQq+gcD9PrUbVDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68513772"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="68513772"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 12:42:11 -0800
X-CSE-ConnectionGUID: JVJPIdZ7Q/a6k/jbZamnsw==
X-CSE-MsgGUID: m9cG7qDETK2E4hFS+R5poA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="204220918"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Dec 2025 12:42:09 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYVgM-000000003RG-22QE;
	Wed, 24 Dec 2025 20:42:06 +0000
Date: Thu, 25 Dec 2025 04:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Nuno Sa <nuno.sa@analog.com>
Subject: drivers/gpu/drm/panel/panel-samsung-ld9040.c:240:12:
 warning: stack frame size (8344) exceeds limit (8192) in 'ld9040_prepare'
Message-ID: <202512250407.8W7HmLYR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: 700a281905f2a4ccf6f3b2d3cd6985e034b4b021 spi: add offload TX/RX streaming APIs
date:   11 months ago
config: x86_64-randconfig-013-20251225 (https://download.01.org/0day-ci/archive/20251225/202512250407.8W7HmLYR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512250407.8W7HmLYR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512250407.8W7HmLYR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-samsung-ld9040.c:240:12: warning: stack frame size (8344) exceeds limit (8192) in 'ld9040_prepare' [-Wframe-larger-than]
     240 | static int ld9040_prepare(struct drm_panel *panel)
         |            ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]


vim +/ld9040_prepare +240 drivers/gpu/drm/panel/panel-samsung-ld9040.c

ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  239  
099b3e8699322e drivers/gpu/drm/panel/panel-ld9040.c Ajay Kumar    2014-07-31 @240  static int ld9040_prepare(struct drm_panel *panel)
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  241  {
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  242  	struct ld9040 *ctx = panel_to_ld9040(panel);
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  243  	int ret;
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  244  
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  245  	ret = ld9040_power_on(ctx);
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  246  	if (ret < 0)
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  247  		return ret;
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  248  
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  249  	ld9040_init(ctx);
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  250  
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  251  	ret = ld9040_clear_error(ctx);
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  252  
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  253  	if (ret < 0)
8141028278c2ea drivers/gpu/drm/panel/panel-ld9040.c Ajay Kumar    2014-07-31  254  		ld9040_unprepare(panel);
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  255  
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  256  	return ret;
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  257  }
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  258  

:::::: The code at line 240 was first introduced by commit
:::::: 099b3e8699322efb7229913d2c1651588205f182 drm/panel: ld9040: Add dummy prepare and unprepare routines

:::::: TO: Ajay Kumar <ajaykumar.rs@samsung.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
