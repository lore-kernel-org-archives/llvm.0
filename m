Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1E847AF4D;
	Thu, 24 Sep 2026 11:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790250699; cv=none; b=KgLcVO6qH4xOrWn9MFBoMQYvsCUIPZLl2C/z6iUi05NmyaN12byLdQI6ICLE94vxqRRyZJX5kU6wGnjWUf7EZ3kbr5svqGKYnLVu/VxeOlUHsvgLo6zF8qJei0soQyBYw3dKHlDboQp4PTgFeZ9qjQlvn/sLxV+jzjpJ0XHZfqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790250699; c=relaxed/simple;
	bh=UQLNe0khEYS7GTSfsYRX6JTUGPmWC8SsJLfiDChU0gU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sqbjG2uDTE30XnhPpNm/SpPq+iLgjh0aLkTESaAw/5276Fd2EHMCH4M+p7+on737zyQ0aWPpx0tdNzYBkx7oRwfNdGO2OiRNgXBC8zljJloobAhQoqHhaaiSUBih1f9kKklIf5MIzg6A+5/FgQD6l5cEJOf5y0Cz2ng2vbXSvQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dyJ/E3rk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dyJ/E3rk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790250697; x=1821786697;
  h=date:from:to:cc:subject:message-id;
  bh=UQLNe0khEYS7GTSfsYRX6JTUGPmWC8SsJLfiDChU0gU=;
  b=dyJ/E3rk3LBKUmzqMfF2AYbCiPwraxz9zKPE3nvl6bRqTur8k6vMQV78
   HsW8XOsvw+rR68JYUP/aaVqiST2GtcPlojfBH7v4hhJbJPnT2kgdCqj0L
   bJ92rEeVSR+AubQXcIjCvhlBSDxV7fNtaSjH0ogq4YDaT1SLqSPmHxwXr
   54TJUnUkyG2ORuFPt9Aj+ude1nM/vFjUyE4g4mGhsuWlT4M64BQD+s93D
   SXcUgS/4dTq6vTsSaDw/NnHrf8vw+QBjQ6W6v7LITGqxmpvKcsKDFoYKg
   D5DiQYAh+tOCJ00w3fFQtWY3JekdDvmZonDMwkR2TvgzZHJ6MgGoXqeFU
   A==;
X-CSE-ConnectionGUID: MhqhmoGqS5moqFnFxDmFow==
X-CSE-MsgGUID: uAhFETCzTi24F/MJEoSbnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90140122"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="90140122"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 04:51:36 -0700
X-CSE-ConnectionGUID: gzxn/HBzT+K143zvL86FBg==
X-CSE-MsgGUID: tPR5q8ftQeqnobkmHIYnLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="272591412"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Sep 2026 04:51:35 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9hzA-00000000ImO-3dnd;
	Thu, 24 Sep 2026 11:51:32 +0000
Date: Thu, 24 Sep 2026 19:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: Philip Yang <Philip.Yang@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>
Subject: [linux-next:master 2193/8910] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1553 expecting prototype for
 amdgpu_npa_vm_unmap_range(). Prototype was for
 amdgpu_ualink_npa_vm_unmap_range() instead
Message-ID: <202609241952.zFr1FYRB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: ee9323733acb9a660f2f9065f8c31fdb015c4acb [2193/8910] drm/amdgpu: Add UALink NPA VM mapping for ring buffers
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260924/202609241952.zFr1FYRB-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6e714c8d91116794cb699cdf80c26afe9cda3ef3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241952.zFr1FYRB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241952.zFr1FYRB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1553 expecting prototype for amdgpu_npa_vm_unmap_range(). Prototype was for amdgpu_ualink_npa_vm_unmap_range() instead
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1643 bad line: 
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1650 expecting prototype for amdgpu_ualink_gart_npa_addr(). Prototype was for AMDGPU_UALINK_GART_NPA_ADDR_GPUID_SHIFT() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
