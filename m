Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CEB1E522;
	Sun,  8 Sep 2024 12:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725799814; cv=none; b=UoKLt+jNdrvW2TDzjE3X1/EdONyqjF5osUPrr3jsJBGaZIoNkinCgD4kY1dr9ND6R9QYBimjxAdXLjasi23Zl32zroKDjU3ZBAer5fsBo4OP6k2FWrpWfY2C48O8KozkUEvEx5FiYFnkCmZcvaZDM34gHRa63xqtlqc2rMeOm/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725799814; c=relaxed/simple;
	bh=vQYUxMY9KsZyzEw/qQOftd+ftZURJcV2ugrpzDHyro4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pi3NfPfOVCEqoJS52H2wa/qKt9SKD1JsAvk1SSJVB8IJdNt+BnBNqwUXNC/xwN36AaKCRfj8U/dEc8Hk+Y9rFRKIKdkgUzSN5CGm3iKcTQ4wxPKwaqNJF4FezM8I+7E8smcVCUEi6Gn8ur8s/p2zQBfMDUsIu1lwmWjLKa9ndTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBKZY6mD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBKZY6mD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725799813; x=1757335813;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vQYUxMY9KsZyzEw/qQOftd+ftZURJcV2ugrpzDHyro4=;
  b=jBKZY6mDrP1WTWXB9x3Cnd3jaVucdIrbZ/Py8hZgW19PbajLeRgKkCG+
   h0hzt++Pnc6xsMNGU9PkHvtGSPCXpcpR9WsdYNGNF57xGIO98nyE6oDvi
   qjU95MVQHQUKLyOXSYTM+Nh6SZbI2KgAj4+e3qoupF8zSW9NJ86E5JQ7p
   ryGYzB2jlW00QzUAJYw3Iy/vRZ4866+nXPT3VuVXusIvIO7E4aIysNlVj
   Q62fPvUzMmNnCMGNg97yT/bZfVr75csX++PVO3T2BdW6A27MfY2PZkHsl
   zKku7V6D63M1gEU9QAd7GxqA8IyIcMpLMgAg9ra06QJ7aQEiL9iXI0PZC
   A==;
X-CSE-ConnectionGUID: Yr8/0MyuQxS3CA9vF0n+rw==
X-CSE-MsgGUID: Ky5K5HjLTpCJhlroWc5zMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24658951"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="24658951"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 05:50:13 -0700
X-CSE-ConnectionGUID: Z6uFOa3rRh6SXlQysFdyKg==
X-CSE-MsgGUID: Ax1og0U3R4GXKD6rcBKAIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="71363990"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Sep 2024 05:50:11 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snHMm-000DXX-2e;
	Sun, 08 Sep 2024 12:50:08 +0000
Date: Sun, 8 Sep 2024 20:50:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Friedrich Vock <friedrich.vock@gmx.de>
Subject: [agd5f:drm-next 73/97]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c:50: warning: Function parameter
 or struct member 'sync' not described in 'amdgpu_vm_cpu_prepare'
Message-ID: <202409082022.1UsYF3Yg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   0df8ef6e1b5dc7a6edc6242a95f47a257ffecff0
commit: 4da5a95bf125fd682249f60e296455c6413b4e10 [73/97] drm/amdgpu: re-work VM syncing
config: i386-buildonly-randconfig-002-20240908 (https://download.01.org/0day-ci/archive/20240908/202409082022.1UsYF3Yg-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409082022.1UsYF3Yg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409082022.1UsYF3Yg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c:50: warning: Function parameter or struct member 'sync' not described in 'amdgpu_vm_cpu_prepare'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c:50: warning: Excess function parameter 'resv' description in 'amdgpu_vm_cpu_prepare'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c:50: warning: Excess function parameter 'sync_mode' description in 'amdgpu_vm_cpu_prepare'


vim +50 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c

ecf96b52bf98a2 Christian König 2019-03-21  37  
6dd09027a22ac7 Christian König 2019-03-18  38  /**
6dd09027a22ac7 Christian König 2019-03-18  39   * amdgpu_vm_cpu_prepare - prepare page table update with the CPU
6dd09027a22ac7 Christian König 2019-03-18  40   *
6dd09027a22ac7 Christian König 2019-03-18  41   * @p: see amdgpu_vm_update_params definition
7eff65d6c59c49 Lee Jones       2020-11-13  42   * @resv: reservation object with embedded fence
7eff65d6c59c49 Lee Jones       2020-11-13  43   * @sync_mode: synchronization mode
6dd09027a22ac7 Christian König 2019-03-18  44   *
6dd09027a22ac7 Christian König 2019-03-18  45   * Returns:
6dd09027a22ac7 Christian König 2019-03-18  46   * Negativ errno, 0 for success.
6dd09027a22ac7 Christian König 2019-03-18  47   */
9f3cc18d19b7b7 Christian König 2020-01-23  48  static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_update_params *p,
4da5a95bf125fd Christian König 2024-08-20  49  				 struct amdgpu_sync *sync)
6dd09027a22ac7 Christian König 2019-03-18 @50  {
4da5a95bf125fd Christian König 2024-08-20  51  	if (!sync)
6dd09027a22ac7 Christian König 2019-03-18  52  		return 0;
47ca7efa4c13f8 Christian König 2019-09-16  53  
4da5a95bf125fd Christian König 2024-08-20  54  	return amdgpu_sync_wait(sync, true);
6dd09027a22ac7 Christian König 2019-03-18  55  }
6dd09027a22ac7 Christian König 2019-03-18  56  

:::::: The code at line 50 was first introduced by commit
:::::: 6dd09027a22ac78f6ab1881aa7e2e21ad61c02b8 drm/amdgpu: new VM update backends

:::::: TO: Christian König <christian.koenig@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
