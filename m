Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E2536A01A;
	Wed,  7 Oct 2026 23:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791415955; cv=none; b=IJS1XZ63pTwFX4cKTPjxYLpnwKqkKRVgT1xKQV9uF1Z9D3o80j//u48Jk1hwLvczSouTJgtcB8c+SO1wFtnPUjJfDscg0zKyPV/deo3qdGkRMsUSKD2FiVPXoIZyMjVumgq2EbMJZGj7dfGy02DMB7sNbLSRKNVzpiVVzBiJPvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791415955; c=relaxed/simple;
	bh=MTKVI7NMpwE6aLCUmATY8Ty5u2c42zzHGQXDazdkKS8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hmS3ZUPPracyVp7LMsloR4Tl7VpCwx1oKyg1wu12l+6DFY0wvhzVA+fkhgpVgz+CPoM2mfogXuMLL70PN5o1TsaVu2CZmVfREPtuqIg+C96pyX4UF8V9PU4FjUOiAndDy6m1fp5JFkZByaUiEpsM9eYkZsO9FB4BS3PjPT7Hs2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvQU4jZZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvQU4jZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791415951; x=1822951951;
  h=date:from:to:cc:subject:message-id;
  bh=MTKVI7NMpwE6aLCUmATY8Ty5u2c42zzHGQXDazdkKS8=;
  b=WvQU4jZZsQGPWChpGMv4tC6j9URk4iNHapU1Uy+KdIDK5ADWjDH8s44g
   pPGCu27rpsWFjNET1S1FkCo6vmHCMlSM8cjQTfRnqgbPSE/sPjuu96mjd
   tmbkA3fMk83huAA9hIL6oUault3QhRjjDH4MVZDN2hcvVneXMQe6l7lP0
   rtnVc8D4oKovMtjf+lVlLPTQVFWEbglIilV3HICvXRFI97v0VfaTx9aJ5
   KjU9S6r7gQqt7aQILJCMii3nm3wpjYGy2bOuP+LYx9Fi4b0Zt36Br8SIW
   mwYk3fQZrdRQik84QIxYefipYpt42vvRyuTtqX18OU2aj9KChjwW2puRw
   A==;
X-CSE-ConnectionGUID: Vaci5lPnTni/GT6oc3SYDQ==
X-CSE-MsgGUID: xYiodpNGTDS/MmKB4IyZBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="75290"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="75290"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 16:32:30 -0700
X-CSE-ConnectionGUID: /iKeegVYT82a+2ZFvaX1HA==
X-CSE-MsgGUID: lDWMkPOTREmCrBldCEOOLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="277083766"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Oct 2026 16:32:29 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEb7b-000000003fs-0mIM;
	Wed, 07 Oct 2026 23:32:27 +0000
Date: Thu, 08 Oct 2026 07:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 George Zhang <george.zhang@amd.com>
Subject: [agd5f:tlb_inv_rework 3282/3548] ERROR: modpost:
 drivers/gpu/drm/amd/amdgpu/amdgpu: local symbol 'amdgpu_dm_atomic_check' was
 exported
Message-ID: <202610080733.Ds7Eax7S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Albert,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitlab.freedesktop.org/agd5f/linux.git tlb_inv_rework
head:   3bf3b4ea31b252534f7038ab792f333801366586
commit: b235c73f94782c252119bc8cfc2a21ffad72d338 [3282/3548] drm/amd/display: replace EXPORT_IF_KUNIT with EXPORT_SYMBOL_IF_KUNIT
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261008/202610080733.Ds7Eax7S-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080733.Ds7Eax7S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080733.Ds7Eax7S-lkp@intel.com/

Note: the agd5f/tlb_inv_rework HEAD 3bf3b4ea31b252534f7038ab792f333801366586 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/gpu/drm/amd/amdgpu/amdgpu: local symbol 'amdgpu_dm_atomic_check' was exported

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
