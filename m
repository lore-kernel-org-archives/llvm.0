Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DDC3A0B24;
	Wed,  7 Jan 2026 21:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767823045; cv=none; b=NZBRC64NW3Ja0628vakkIYX5Tsz09eH3VnlBf7MDjWR1awJxVBf03GhGLe66gJZ0v81DOHIeErjsBdQKPM9uoTq24V5ompy+qJ7l/6MFPMGl55kC3T+rJ6PmZnw1SIaoyrhVYqQPMqGDRCXcQpPG9WY/kBf9aDaFpKEsDANHlGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767823045; c=relaxed/simple;
	bh=nD0ENe12JC/ZFZ4QhNz2eXYrR1c16qF9MZIM3WZT7pw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VUyYPYfSmfgcDIElG4G22xZCcIhTFfTcrNKM7Rrqci4FXx8ZNFuo2lXL6+IaEN4PtKfwRGYcQiUOmOlf8AdvkxN4moD6OyQ/14FeRwX4BiH82rXkMpzASzmefPfdfMkX/3HLQSMQbJcNFKdFpCcWH7GTfwhQLDg4bL/jI1wankQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RmvOH/ed; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RmvOH/ed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767823044; x=1799359044;
  h=date:from:to:cc:subject:message-id;
  bh=nD0ENe12JC/ZFZ4QhNz2eXYrR1c16qF9MZIM3WZT7pw=;
  b=RmvOH/edxyg0YwlwHHqL+XkXYDcOP6dps+94QPKcTLFXnNpqD+w4Kesw
   yEF7aQjD61eGsIiL5Vk7ZuFVtFIYN6gDZXDqFXNithrXwJXx+F2Kq93lf
   tP1Is1JnSiCsABVGv2Lix3sLpwAM3cG18vDSHtCM7sZk6ey4LjsSHgL7q
   2krHAd5mg+W3skf9WpZRQTQfcCM2KF+/19IButaZae7OAiu2EdkQ5wkf6
   4s3D6eO271rd1Je9YbQK1QqxkPkUKuz4ZxHg5LyHkc/8+Ir2mFpNqtP5O
   7BF4xQC88Xi/OfwMkMbbvuy8I/2ufZqbfkIkhfIZlyT+PzWWjGrv6+2kt
   A==;
X-CSE-ConnectionGUID: 6WOl4vrKQp+Wt2TrCq689A==
X-CSE-MsgGUID: fl+lr8+9Tgu7XE4J0+tkpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80561188"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="80561188"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 13:57:23 -0800
X-CSE-ConnectionGUID: 68QykzVOQ8+7gKaQNlUkAw==
X-CSE-MsgGUID: K9RoVVHATQSHIZLHgjfU4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="207565305"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Jan 2026 13:57:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdbWn-000000004Bl-3WI7;
	Wed, 07 Jan 2026 21:57:17 +0000
Date: Thu, 08 Jan 2026 05:56:49 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v3 1/9] Warning:
 mm/numa_memblks.c:216 expecting prototype for numa_add_memblk(). Prototype
 was for numa_add_spm_memblk() instead
Message-ID: <202601080543.kRym66fR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v3
head:   8a4f71e8f0a8aef992da7df176a352073872a47c
commit: c96cbb611777a60e4328fc821843d1bc092dcca1 [1/9] numa,memory_hotplug: create N_PRIVATE (Private Nodes)
config: x86_64-randconfig-075-20260108 (https://download.01.org/0day-ci/archive/20260108/202601080543.kRym66fR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601080543.kRym66fR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601080543.kRym66fR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/numa_memblks.c:216 expecting prototype for numa_add_memblk(). Prototype was for numa_add_spm_memblk() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
