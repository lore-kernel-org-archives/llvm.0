Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78FE18DB2A;
	Sun, 24 May 2026 01:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779587292; cv=none; b=WOSoZ07Rt1yrHKPOFf4pMBCU36Rk61u5XCAnDCvif/mssvbnWuW5mSLBTz4asherH+oWAfbJxTQhL+7AYLU2hK6+lHtUXs/tY0is978DdCRDAjAb43EwPnV0IGgEMjUFQZGzeaVeB/zsBNirKcGFGjWoYiHXtdYhiVzNwaMBXYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779587292; c=relaxed/simple;
	bh=Rq/Ilv9Lz1YZKif4EvELNLDsLbbm5KUhXZOwC6SzAjE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fSDuouYvEmm3aRhKmc6ZSlZ16AHIupcPVSj+QQB7MCa00ZVS8+JMDiDKU8nVI8KfFCq6mEkOnPiMZknINOrgRxY4V6vNvUZ0bXCnAjCRRgKAMmbnonGY7Ly8+Hmuh0Iv1pufnbLf4+sPHvcCQhtz3p+h77WneApkyhMxpY6P7vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArEdCCWq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArEdCCWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779587291; x=1811123291;
  h=date:from:to:cc:subject:message-id;
  bh=Rq/Ilv9Lz1YZKif4EvELNLDsLbbm5KUhXZOwC6SzAjE=;
  b=ArEdCCWqXIcVIa2z8zA+i72EPhQwq85J88NOlV0pv3PrLYQu4f7gLVgb
   VHqtuLrKAIxNjEqOpp4Hl9+NL4tYFm46Aq7o0NE2oMIiMefF0+CMY7/ky
   3ioYZiA7isd/NrgxpLl3KuL2eRHnJ8oIk+7vKoE/9zikef7sH4kIQ+IC4
   y0dmPzcUtralEDP9709qkhozAuizCi5miD7k/OAytQShgtYWM0qUMmOdA
   g0yIWpDeDafp9j4nZkus0YrU8IBAPj2RpwKqU9yRR/qOvJqD3duZK6/jK
   NxUM4/P9xj/zMQWKxi7ZDf3lrb7L1yKg+F7JbsQ1xGHcpS4DvFpBffyn+
   w==;
X-CSE-ConnectionGUID: bTqvnhSTTNibw+0T7tN3Jw==
X-CSE-MsgGUID: eRSMuob6Q8a3w5UvhLOiRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="79492348"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="79492348"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 18:48:09 -0700
X-CSE-ConnectionGUID: Qq8Z5pWKTGC1YPvkxXPisA==
X-CSE-MsgGUID: fj39BLsfQDSZ0LxEhmMKAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="234904244"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 May 2026 18:48:07 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQxwi-000000000Z1-4C31;
	Sun, 24 May 2026 01:48:05 +0000
Date: Sun, 24 May 2026 09:47:25 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: ld.lld: error: undefined symbol: xe_configfs_get_max_vfs
Message-ID: <202605240945.1ED8m0A4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Michal,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4cbfe4502e3d4bda48eb4b83dfad8d7da3b22e90
commit: c09a9933af08cdcb295ccc65a6d9862bf8474706 drm/xe/pf: Add max_vfs configfs attribute to control PF mode
date:   8 months ago
config: x86_64-randconfig-016-20260519 (https://download.01.org/0day-ci/archive/20260524/202605240945.1ED8m0A4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240945.1ED8m0A4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c09a9933af08 ("drm/xe/pf: Add max_vfs configfs attribute to control PF mode")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240945.1ED8m0A4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xe_configfs_get_max_vfs
   >>> referenced by xe_sriov_pf.c:24 (drivers/gpu/drm/xe/xe_sriov_pf.c:24)
   >>>               vmlinux.o:(xe_sriov_pf_readiness)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
