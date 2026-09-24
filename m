Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792133546ED;
	Thu, 24 Sep 2026 06:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232340; cv=none; b=MMctCpS4V+aVIt1I4Zbl1F63x7VzzBeGqJAYTFfaDXwJvKNjxaehw+MZJW9sg+0rthye4bPMxfjqu949rtZGNZhyn4qZnblIutNEGqo9sDgMAe40sdA94gpHnt5P4exTqyIOJII4C95EP869+SD8/jzqAhn0Gph1vbF6hRYoVJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232340; c=relaxed/simple;
	bh=16KcMGnIzgpByFAvBupucf4khLXuAp1zGp+9EhJvYsw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pj7jW2J5lRpvJ66ITnefIRViZ5XEkur13OAKmTlBrvMRF1Ce9TWL0AbowGpkyuMp0M/IJJBguVSwjIPirYS1ToXq61yBilvMin4sfN04Ffoi00BSSy+bVq00/NXHMiDXUnDDgDh4bWaavskXo7Ta+Ejyh5tzFsvnjsDP+gfYe1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/3Tco82; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/3Tco82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790232339; x=1821768339;
  h=date:from:to:cc:subject:message-id;
  bh=16KcMGnIzgpByFAvBupucf4khLXuAp1zGp+9EhJvYsw=;
  b=c/3Tco82GMoPOaajha6+t22QmhyRX2ltELwKK2kIzOeOMvpw5KAkyll8
   U467QhL+V+9YZayaa28ZABhBdyha3U2SLUIrqXdn1ReXkvV/hq+KTtdd6
   06w3e5zvS6QD9WmPmab/bz5NwEcrD9oDQm7Ti/Q+8bwgVX71z5tZ9RNpm
   4sBmpWmrxtlaWYl2SPzZdg/B58aI72KC8mSGk+XIPCW3ve75+GR/QkhnR
   x8to/q5Hr9xruBXczMDkDoqckhXtcrRyvobt91R1Nu9SxRco1S6DrHSH7
   Mawm7CKhbtGf3H8643FcsA7jpAfcQHuIhyUP8SEFTY/OeO7gQa75ztT2h
   g==;
X-CSE-ConnectionGUID: 0rhum2GHRee169nixAy0xQ==
X-CSE-MsgGUID: CBvujf7UTiiab6HGwD524Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90114530"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="90114530"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 23:45:38 -0700
X-CSE-ConnectionGUID: vLZDnkQcQTeiZ+xEdsprSA==
X-CSE-MsgGUID: 6fy64fmGRwi6Thmdnc3HMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="277100100"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Sep 2026 23:45:35 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9dD3-00000000IKS-0FY9;
	Thu, 24 Sep 2026 06:45:33 +0000
Date: Thu, 24 Sep 2026 14:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: Philip Yang <Philip.Yang@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>
Subject: [linux-next:master 2192/8910] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1557 bad line:
Message-ID: <202609241408.IMa4iXtW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: 5d7094267d4dbfff4e19de2395ed004751041741 [2192/8910] drm/amdgpu: Add UALink NPA address computation for ring buffers
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260924/202609241408.IMa4iXtW-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6e714c8d91116794cb699cdf80c26afe9cda3ef3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241408.IMa4iXtW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241408.IMa4iXtW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1557 bad line: 
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1564 expecting prototype for amdgpu_ualink_gart_npa_addr(). Prototype was for AMDGPU_UALINK_GART_NPA_ADDR_GPUID_SHIFT() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
