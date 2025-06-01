Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C5817583;
	Sun,  1 Jun 2025 19:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748804919; cv=none; b=m0dai3Y8BWG0iOQI8MRdO3CGJvdF3pU0pwrhZmdhVyPR43F5Rv2kelHnvxI7Ne5BzrqaTi8cEy37UzqrPDBAfDP68rcQ4Twbc/xHc+p2zltgzBs0GuA//oA1aDUPKOVBqsQu3cAcE+kBr9qg6ab7c272qa0uhrw5v50rAWS0CJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748804919; c=relaxed/simple;
	bh=UiqFkRJHcT8DPeZkuAiWHo+vqYhuEHnbhl+/D9aoIXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aTUaNieMgoaC7xgdDCnyy3RxpG1vEdwiiXn18f/ZyXhnKhBQBVcftbzbJjFpK2nCyoYA1dTrvcq+zcySFDgMcPNz+az63Hadt7ojqi4vlKyH9Aj3m9lD+A39fNctScDez1a3uY0BAEr4ZKn2TvPyYLcKRptG6mfk1HftWXVXgLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqhTT7wy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqhTT7wy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748804918; x=1780340918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UiqFkRJHcT8DPeZkuAiWHo+vqYhuEHnbhl+/D9aoIXE=;
  b=fqhTT7wyqQKomRi8+sI7fqY0GzVZ1pS4TR53IR1T1ilircY+XW4N+yAq
   3LTEkiVT5TsiaY0DzV0AQC1yMgDeFDtvRF4wDsGdctClwy+Q7njOh/heJ
   uX8oUvi86rtiU5b0Da7K0o6yLBdWs+H8DPeRRvloq0pkpStPNJnlpm7bY
   4Kr2iqVMMKvKXbBHp5cTmJpIFZq+wKqYH+W7i+U94QHDJ05ZHPvW5jHId
   PdgPD6oJ2oI4TC6bSsRR1asdK3SI8Xda2aJ3viUyKsuRHjaUjDuwv7RG8
   r/JpPFS6QZZrDL8FaOOTFR5HzAC0CJr2cSL4P4QG+JgzrvbbDeOJqM1Av
   A==;
X-CSE-ConnectionGUID: aZrjgm6hSDmX7ILqyNS/zQ==
X-CSE-MsgGUID: PJczBD9wQZS0DO+KuqLPKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="54623484"
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="54623484"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 12:08:37 -0700
X-CSE-ConnectionGUID: UbQAz712Sjar7uVspjiSqg==
X-CSE-MsgGUID: 0XUCBc3NQ0Sg7oFeDvZtmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="144332817"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Jun 2025 12:08:36 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLo2r-0001BW-3B;
	Sun, 01 Jun 2025 19:08:33 +0000
Date: Mon, 2 Jun 2025 03:08:21 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [agd5f:kq_resets 7/28]
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:774: warning: Function parameter
 or struct member 'seq' not described in
 'amdgpu_fence_driver_seq_force_completion'
Message-ID: <202506020336.FFIzr004-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git kq_resets
head:   0cb5804810f5e8aef9503d3d50c98a02a26f9216
commit: 5a61fa3e46a6b799d013c560d2b90d4e8b78cbbb [7/28] drm/amdgpu: track ring state associated with a job
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250602/202506020336.FFIzr004-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250602/202506020336.FFIzr004-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506020336.FFIzr004-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:774: warning: Function parameter or struct member 'seq' not described in 'amdgpu_fence_driver_seq_force_completion'


vim +774 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c

   766	
   767	/**
   768	 * amdgpu_fence_driver_seq_force_completion - force signal of specified sequence
   769	 *
   770	 * @ring: fence of the ring to signal
   771	 *
   772	 */
   773	void amdgpu_fence_driver_seq_force_completion(struct amdgpu_ring *ring, u32 seq)
 > 774	{
   775		amdgpu_fence_write(ring, seq);
   776		amdgpu_fence_process(ring);
   777	}
   778	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
