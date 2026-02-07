Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC4B823DD;
	Sat,  7 Feb 2026 06:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770444575; cv=none; b=RyWpPJc7nLW46vnsuA6/D2SlS7FcLw6gcdpO09jX+wNrglyrXXbAMTLdqgNLpViXxFYcfcdrIwBCvf8UAnKljglIsE2fudOWkf/k3C6U6aTLa6nesJRfoFVtH1tetmvxgPNbGDAdi+QJs9GobBQ9dF4f+W8yu5/nYSPen9JuBjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770444575; c=relaxed/simple;
	bh=ORl31NuADS2ErYODvEXFrA/xsSam/4QKu4heCkmiBmw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z/L3vobxnBIiXUIZz95GGoKxcQ/HOiNzqyKDfGESPOfYxn1QNzzzFN2jj3dbHK4tFLB4wBbNbieYDP/IqYIz6TOkY6fLKrHA7MX/RaMHjcUzZ23V+H7QvoDbFBzCsoysAp4+wkwuCnc58u0kRUa6/LF1R4AncbELGjP/e525BPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCrqQvd2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCrqQvd2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770444574; x=1801980574;
  h=date:from:to:cc:subject:message-id;
  bh=ORl31NuADS2ErYODvEXFrA/xsSam/4QKu4heCkmiBmw=;
  b=NCrqQvd2s9PFzN6LfCXwKI4zDbq8sZTSTVYE59tZrrAHJTyLep8lWLus
   MfhOUdxTbT5G9qJAapztW9VU1HJiGyFhJwwCLmdsTmqPmiUovKY2mvOpU
   VwG/C8gm61vtvBw3mKzWIRDp7TLFhyOLzmnxCc5HQH5c9z1D8X76zKB8W
   6EYgHkfHTx3BBl9XcziAcgpYQYKjFmTQzSHX7s+hh8uk/uj96j2/pnp//
   mGaLta0UKsLoy/Yy/08i9Gzi0hDEg2z4yJyXRNuX+Bq4lA6HvEICQt0a0
   48jfNGadEg74Og6x9ss5ZZKVqUAuLgjHNCEEKrHU5HnW/uE3GlBK/9zZx
   A==;
X-CSE-ConnectionGUID: xVIO1d1vQ3aIxvt1eDAIRA==
X-CSE-MsgGUID: PnI0HfnXRCOCKfh6P0FrrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="94294450"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="94294450"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 22:09:33 -0800
X-CSE-ConnectionGUID: kiCnhMpHQeWvhRdOb6FliQ==
X-CSE-MsgGUID: Kb9Jm+SLSUq0NgzjbkF+SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210899272"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Feb 2026 22:09:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vobVZ-00000000lRs-2jzL;
	Sat, 07 Feb 2026 06:09:29 +0000
Date: Sat, 07 Feb 2026 14:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bob Zhou <bob.zhou@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [agd5f:baseline0 3225/3826] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:916 function parameter 'fpriv' not
 described in 'amdgpu_gem_va_update_vm'
Message-ID: <202602071447.w9TnkOob-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git baseline0
head:   b6a8211a7821bf70201912b493ab705f423700c7
commit: c3ae2851e95176316859bc6300f80759e2bc3db7 [3225/3826] Bump AMDGPU version to 6.18.0
config: sparc64-randconfig-002-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071447.w9TnkOob-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071447.w9TnkOob-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071447.w9TnkOob-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:916 function parameter 'fpriv' not described in 'amdgpu_gem_va_update_vm'
--
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:926 function parameter 'ttm' not described in 'amdgpu_ttm_tt_set_user_pages'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:926 function parameter 'pages' not described in 'amdgpu_ttm_tt_set_user_pages'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1646 function parameter 'ttm' not described in 'amdgpu_ttm_tt_userptr_invalidated'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1646 function parameter 'last_invalidated' not described in 'amdgpu_ttm_tt_userptr_invalidated'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1659 function parameter 'ttm' not described in 'amdgpu_ttm_tt_userptr_needs_pages'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
