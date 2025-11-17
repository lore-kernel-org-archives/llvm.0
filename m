Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6781C5D57;
	Mon, 17 Nov 2025 13:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763387227; cv=none; b=RSTf5anGa5F9EgcCFFT+KgRfRGiRohPB0NhrPNcDo8dcGSV1Bfw3RI0pt7/9pBMltmkTS54ONpBE2b2Ok+FGjHNUHf/DOHa1BK8wlVdgAU5Tjebtut1CegH2B1ULSgZr1ImLj1tV8TvPxiIYbQKGD9BlLBw72JeCvVdR44KEMFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763387227; c=relaxed/simple;
	bh=0gJ2fvgBbS+ZBCnFsBGroDs3zPVP65LsziJeWP8xrKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rpgVQ18AAn5Zgx8ojTXwZpej/LTtgg4dn9SyrS4gFN5Nj7FaLFQPJ5/En12uD2Us0pYzQp4i4kVTFtec47ZBybS+ioggcdS0+Bf5LV4qT88GQJ1jTVV0ehBZRw+BMKQe/M1lyog0EHdVggtEfAdf930AvHjtxUYVRVVHK5Sotvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrRrHMl1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrRrHMl1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763387226; x=1794923226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0gJ2fvgBbS+ZBCnFsBGroDs3zPVP65LsziJeWP8xrKE=;
  b=BrRrHMl1rmMEp5RBooJzXaBv5yUeHdRAqmDj5NWCnd5G4zSlKbbMvM3K
   EvoNjFvKwaBUS7VZzUeO5Kshw8nocDtqXhIc3kfq13rThyYlYD2rT8UcB
   F9Pw7Uxemdaj5vOselLw1GAoqtHMB5hp8NAoVhtvyfR2Q1TYXDNLet8Oh
   lcjL8pG7iBUMoAvlL0C6XrFskVD3da+9uePpyfgqZ6B9eLe7700CYxiRT
   joMwSkNYouI4nABZTCMpav8vGzVB671kQk9nxVIIGbBNcWjTSOuXWH5Ya
   9LoJ9oxILW9wCM29GH0ViIlWzKKm6Yv1BPBoF7u0RNB1Hm3jkZQD71UtE
   w==;
X-CSE-ConnectionGUID: D5brXSkRSU6mAxkzRi1F7w==
X-CSE-MsgGUID: e2sIwnLdS4a5tcXWZ8103A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65418977"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="65418977"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:47:05 -0800
X-CSE-ConnectionGUID: C5hBMFg1R+OmBJitTWOVEg==
X-CSE-MsgGUID: Z9SdbR7ySr2QAwWRNG6axQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="194920454"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Nov 2025 05:47:04 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKzZN-0000cJ-0Z;
	Mon, 17 Nov 2025 13:47:01 +0000
Date: Mon, 17 Nov 2025 21:46:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: [agd5f:ring_reset_fixes 2077/2293] ld.lld: error: undefined symbol:
 pm_hibernation_mode_is_suspend
Message-ID: <202511172106.E4boUsgt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git ring_reset_fixes
head:   c592ac07b510abe3ec2f196e6a429df959712063
commit: 36646c96fac1f138384238f4348fecd2ed702540 [2077/2293] drm/amd: Fix hybrid sleep
config: i386-randconfig-012-20251117 (https://download.01.org/0day-ci/archive/20251117/202511172106.E4boUsgt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511172106.E4boUsgt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511172106.E4boUsgt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: pm_hibernation_mode_is_suspend
   >>> referenced by amdgpu_drv.c:2678 (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2678)
   >>>               drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(amdgpu_pmops_thaw) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
