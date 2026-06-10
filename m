Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D960E53E0B;
	Wed, 10 Jun 2026 22:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781128926; cv=none; b=bIj1/Q+vjLYYcZlVrtkNJIYMILSAStu4D9z8tnvTzkNrpQUfO1l9+9/+4cpHeGErwfPpREiaQQZnzrTJlHVljOg7uIGnc+zq3RPer/8f6FcXh14z2DlrH3946Ud9pXXxz5Gq0B2ZEpcnnzfqgw5K66hfr83IrZ+GXgHW/sK6MF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781128926; c=relaxed/simple;
	bh=Zh1h9ZY8dozzaTgCNIksGo4kXi/3jgeHgiTd250BhX0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IAzxs7X9JuV9miy3BMTTc8CSYFSSKSJdC65r0l73fJkMa7WHDKevjdhwqVpb3aYNJpHePlSSTave4c2GFwFw40RJIheiO3kbiH+j+ceOtml12bR8oxS2Rvzb4KkKLS0sdmr4Pw1qpY4zTGoeo2DXFQ9tX2bRqFKb3nf5PREmC7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5nuWBaS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5nuWBaS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781128925; x=1812664925;
  h=date:from:to:cc:subject:message-id;
  bh=Zh1h9ZY8dozzaTgCNIksGo4kXi/3jgeHgiTd250BhX0=;
  b=g5nuWBaSG76+BcLP7lyHXofbxNT7Bu6No0+AfTPClGRxUsDiZo0Xbf4Q
   FfFdRCZvaWSb08b+Oc9Q7J/4FYvVIJpMD9tY13n3Q7asfJixRdkHqBCgN
   lGAex1ImN3lZ/eRZSRp2wS7ar0S/WAVohyOOxI9+eRwAxMVSc35/qMhMJ
   WKrPDDr8Kzt/HcUmvOGf3b/4EkLqU5brcQmwipoDv3d1QWsNVGFJgNzmp
   sksBD7aGD4SecMZveW8UIDxo31afDOGt3H8ybKD6d7FU9XfwOYj5tLFky
   K8CrQETlvjJvZb/FVAnBBYsSN1JQ4VRtvQI/+AQi616mcNNigLRg/xzy4
   g==;
X-CSE-ConnectionGUID: 8nYG9gMQRSaZgBbuHcWyZA==
X-CSE-MsgGUID: g4TEsQYjTzinTWm3l6Odyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99358132"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="99358132"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 15:02:03 -0700
X-CSE-ConnectionGUID: neIJR62tRyuzb8o5XFUK4Q==
X-CSE-MsgGUID: ldWgh4vuQbq/6aehWTuPXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="243339914"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jun 2026 15:01:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXQzj-00000000Lwo-0KUr;
	Wed, 10 Jun 2026 22:01:55 +0000
Date: Thu, 11 Jun 2026 06:01:48 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jon Hunter <jonathanh@nvidia.com>,
 Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [jonhunter:tegra/next-fixes 25/27] ERROR: modpost:
 "tegra_is_silicon" [drivers/pci/controller/pcie-tegra264.ko] undefined!
Message-ID: <202606110526.pvvoCt1y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/jonhunter/linux tegra/next-fixes
head:   7e34e632a4fcdc8d53c9ae5c0dbf541827b64de5
commit: 35f9239ce985897b6f1fb9f8e2c329a809c02c24 [25/27] PCI: tegra: Add Tegra264 support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260611/202606110526.pvvoCt1y-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606110526.pvvoCt1y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606110526.pvvoCt1y-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "tegra_is_silicon" [drivers/pci/controller/pcie-tegra264.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
