Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CF41ADC97;
	Wed, 25 Feb 2026 05:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771997749; cv=none; b=Dqljx0NBYHZ5rVwdFunPy21fp83YDTT0HqLkIhtzozWmBfQ8YGWSI+CvIVIU0SQkO53AkKp23tZV71RkJR2wdFgszZHCWTj0Hd1k7TD5qQ1UF9EKhyiySbr8tyLGzT4qKkm3YBvRUoZsd6tjslzJNcTgg7F/DF5ErkDrW8odpOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771997749; c=relaxed/simple;
	bh=8K+q3hSh1SzhPU8lnuRzgPxHv5hGJjAsOlN6yorbM80=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JHcgfsHI3v3Ve+qbFRIsW8srZ3VOhgwDy2TkUNQRtJhNzDkHaOMpzr2garIX2mlve6Vi0e+1hzDmD+mHKwKdh6+r8biGG++I/L1k+hJ834mCSDzHemfpbZZEAMFFqmSuis/6Xcpz3q3JvC+JVUPdKNa6727RGn0fEnLeVVEo8tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BD7PBKW6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BD7PBKW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771997748; x=1803533748;
  h=date:from:to:cc:subject:message-id;
  bh=8K+q3hSh1SzhPU8lnuRzgPxHv5hGJjAsOlN6yorbM80=;
  b=BD7PBKW6ttH2g55UJvx6cCCHETEQ/0Jv3BZmPDf2dSe35yYI9RetVamb
   +C2K6GxybPjvGFNsDeB/2OfQBV+VaWjhQyI3M5CL/epwGlaquqiZnql6A
   2BQruy6UYEoC3cdIcYc+qlFTb+1HeUCZp1/pRFvRTCoWO0Jap1K5He6Or
   fFa/l/nM4Pvz4fBExHRds43bPieCEIljcJg7gAWEDekYUMtFfeonuJ0bx
   6tFlXeVT9LcxYRthmn0KoCB44H13sux9c7gVAQP8S9VQSo3xM5DXVVq01
   6u3ich+5ZYNAqA6LV07/EP4FY6/lIli0zAkDMKrQCZpf4C29iDr+oFoo8
   A==;
X-CSE-ConnectionGUID: VaNGjAE3SUCrh3v/vXzvYg==
X-CSE-MsgGUID: YXs7peC8QyKTXkuEPAb5WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72728676"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="72728676"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 21:35:47 -0800
X-CSE-ConnectionGUID: nX6p5AGoQMSasLGf3FEZsw==
X-CSE-MsgGUID: SL8CgFJvS5qnEah9FNQ5MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="214932169"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 24 Feb 2026 21:35:43 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vv7YC-000000003zV-1c4O;
	Wed, 25 Feb 2026 05:35:18 +0000
Date: Wed, 25 Feb 2026 13:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kees:for-next/kspp 1/3] ERROR: modpost: "__umoddi3"
 [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
Message-ID: <202602251348.IdomBPXF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
head:   c471bbfb03f639ea9ec53a4b30ae6cba509eb2d1
commit: a74a57773d43d87ab4cc8ac4fdfa0fa511e43da6 [1/3] drm/amd/ras: Fix type size of remainder argument
config: i386-buildonly-randconfig-002-20260225 (https://download.01.org/0day-ci/archive/20260225/202602251348.IdomBPXF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602251348.IdomBPXF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602251348.IdomBPXF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__udivdi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>> ERROR: modpost: "__umoddi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
