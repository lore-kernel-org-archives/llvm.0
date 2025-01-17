Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867381DA10E;
	Fri, 17 Jan 2025 21:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737149560; cv=none; b=fyGW6ITFly23pog/g9tOq6iAHWmEjOwIks+FSXTSUKY+cM9mpZEeZkHO+Nj1UnDx1KHi5iC7nesmCVty2HXZyh/ScFLpor/jX0pArtXvrHaG/zpAcMIg10SfUVg3RMjwdD8MQ8kRGQgsEQy8BJrqzGjExy9NmPGGRu7O6qHGAN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737149560; c=relaxed/simple;
	bh=BsB8Hgu6mdnQDgCeVQ0oosM/e2Thn/BRiCR9McP7qQw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=McyaNKmg0jgAtOekfuodQMPWs/HpFvvjb0hHzcwJGXBr6CULhP2vG8kIqoXajryl3nTmaHlUlrxblIt66SjCaoh4Hv7ojgt5G1tF7e5rV3DRDgYqjzgSOPRi89GUhc+T5914KFEuOR5N+eago8peoHuvLiCneBXiivz1phG+88M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=giTwH17P; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="giTwH17P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737149558; x=1768685558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BsB8Hgu6mdnQDgCeVQ0oosM/e2Thn/BRiCR9McP7qQw=;
  b=giTwH17PgNeHHnzp/emKRv9kdgiAiKOkjZ+5dM1z2hMDePuQBhTYGBa+
   +l1AMCtk9Jhh2lnXOSrwPdpG51Rh3CYkMMVD+7L1EKfjW9Ea9jQLcrI6L
   gKKumYdGs3M6/ciXbafLZ2Kg+F+71ImVZWEBwDGDQCUBjV8qGM7+5BfUx
   Z6l3czEUG1itH65uORR1cKn3mgFI8GCvhUxtb1LajFYdq7UQ3rk6CYmhz
   Oj5ff8CaKVQ+5taAFrBcmf220zRwy7Ojamz5Z8RtB0MtzhmmMiTojm5np
   P9W1Ih23QMbP4m64UC6X4gNgK8Hotc3wQnDqjNAI/xRuG2oXIRW6Gq17A
   w==;
X-CSE-ConnectionGUID: Lqs97wrkTAK0W6q8RweJKQ==
X-CSE-MsgGUID: kfypvrytQRGxUGKQMJsK3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37477332"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="37477332"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 13:32:38 -0800
X-CSE-ConnectionGUID: 52f867raR/athTVRnGKUWA==
X-CSE-MsgGUID: w59GPXAUTqaJUcqNh0kJDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="106513880"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jan 2025 13:32:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYtxC-000Tij-1N;
	Fri, 17 Jan 2025 21:32:34 +0000
Date: Sat, 18 Jan 2025 05:32:00 +0800
From: kernel test robot <lkp@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: ld.lld: error: undefined symbol: drm_bridge_connector_init
Message-ID: <202501180505.nDNWE1bk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ad26fc09dabfa6a33ad5baee80479f518370b316
commit: 61b86391fb5d7b9cad35169b1660119754a01134 Merge drm/drm-next into drm-misc-next
date:   4 months ago
config: i386-buildonly-randconfig-003-20250118 (https://download.01.org/0day-ci/archive/20250118/202501180505.nDNWE1bk-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180505.nDNWE1bk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180505.nDNWE1bk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_bridge_connector_init
   >>> referenced by imx-ldb.c:406 (drivers/gpu/drm/imx/ipuv3/imx-ldb.c:406)
   >>>               drivers/gpu/drm/imx/ipuv3/imx-ldb.o:(imx_ldb_bind) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
