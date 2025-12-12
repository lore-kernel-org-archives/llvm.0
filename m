Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF262F9980;
	Fri, 12 Dec 2025 03:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765509689; cv=none; b=C1FXeLJ53TCwZv2RKP9G41LyqHurdqW4Pf6buQMFJOQBAW8uuUm2Up32vVt3W3H5f7+L2jri5UHSmdtq2ZFksiDFGt+xV4YmB+Jyc/77TGXt5NxMCcJtCenY4bPv//pPgQ8jWWJ4q770nmnTTRJKHS6EnaBBMjHj65IeFkcLvUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765509689; c=relaxed/simple;
	bh=PqlVh+ZayMU4wfFZbNuRPvqxdXGhuTlgmzjlS7QrQY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J8lRl9qzNj4SaZwqYuzUdlViIAZk6mOOPOJRO861sSSynDwk8+fzw3e4wSn1/A1oioONJAbkjO8pwgSkNAjN9TwwVzCtofk4ySsEbPTAEDgSHhjSFh2QaxGQDeB+pDGVxuyVXTIOz6UoOHVL4LYy//sTgZFGldMs7Q5Pdyx9eTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/MXh2qv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/MXh2qv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765509685; x=1797045685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PqlVh+ZayMU4wfFZbNuRPvqxdXGhuTlgmzjlS7QrQY4=;
  b=C/MXh2qvOZoCmCDb9osRP/N3nCaDJ7pfxUyBrNGYaNVUNB2tItVEC8bI
   odBGrm9xePQ9mdilLnpwGCkhbimyVIDH59lu5Zm5pLjIENjDSub852LNf
   duxbdrl/XfRLhWlyVu13tsPeop1FDfbhmtGcuuWH+BsipLsyPBe5Tt+TE
   /0gVmG1s01ikPDDrPYHgEJQ0qKGDECpDDGnH+rfvN8rmn+/9DZc5Z7UE9
   1jpOTF/WlWuzUsfolRFAau8+PRHaCnu2xHxuq8KMU/tYP+uqfVqf5L4/u
   9nZMIg5Z7T8urGPM1UGxePyVtkZVvcdnrTgyvi5IDBCAHor1lzeQftIFV
   A==;
X-CSE-ConnectionGUID: zTMW19C8QiqCD7CSO3/6GA==
X-CSE-MsgGUID: z74+WqoXTPO2laf+aot1iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67385642"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67385642"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 19:21:17 -0800
X-CSE-ConnectionGUID: pDJgJY7uRMmYDg9L2fN0rw==
X-CSE-MsgGUID: ejTBORQRTkitpiNZHFJk2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="228033345"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Dec 2025 19:21:15 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTtiT-000000005Qv-0lSx;
	Fri, 12 Dec 2025 03:21:13 +0000
Date: Fri, 12 Dec 2025 11:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:41 function
 parameter 'mode_clk_rate' not described in 'dpu_core_perf_adjusted_mode_clk'
Message-ID: <202512121139.PDW6fY22-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 62b7d68352881609e237b303fa391410ebc583a5 drm/msm/dpu: Filter modes based on adjusted mode clock
date:   4 months ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251212/202512121139.PDW6fY22-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121139.PDW6fY22-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121139.PDW6fY22-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:41 function parameter 'mode_clk_rate' not described in 'dpu_core_perf_adjusted_mode_clk'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
