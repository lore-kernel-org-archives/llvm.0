Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CAC270541;
	Tue, 14 Oct 2025 13:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760447713; cv=none; b=ip4mOE/MnO6xvbgd8ilzQVeEAWcM838QQfQJGYSq/cQFYZptHF5H9mccSmr4pshuyhR+ECXMGV9BJNKJfH4u4hS0qADZ5VghBvAXqSYEKqWBspKdYvPKxsCpIWWzS+oFihYyGIzuFJg1JnianYDTb98zgT/H1sX5KsMrAqD12hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760447713; c=relaxed/simple;
	bh=RVxyDLDsvQl3mNNnwSdeGLk9okv7OAXOAm+myzxHqLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bDYPZqHTBZd1qL0K/LVCA2gebbjEU/Q73bbedDm4nQ1v7h1xbljW5LMULCellLFPuVXXuW1v0DvE97jX9HvihkskWZpilnKLhEm8iZKJ2n/vVTqVySq+pa3H+3xr7FUChNSqJXAy1KzJ9rSl7PC2AUzuroMK9sXc61zxaxj5YpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjI97fCx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjI97fCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760447711; x=1791983711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RVxyDLDsvQl3mNNnwSdeGLk9okv7OAXOAm+myzxHqLs=;
  b=PjI97fCx6+DToA5PVTXxS8LkAp1W0eCBPyn30zL/+++ExHkFUFWbvMRh
   ZjDE8PQLp5YqFUAD7+G1QK9bF9UlwyrKFkdI7AmA5FatY3lSJPLm+QXQg
   Mg/mdZpGrLh5p3R+9Nzrfwi+9NXPjI0zB2bkguD50NwIlwx53Q2lAvF1h
   TXA9TzmtfT/9ARI9KJ1V3KHi6mzNLetMSsIV6GamjrqOcWeET+lRZU01K
   09jfxJDmRVtleBd5HXuZdT9velm7qd9iWCgg2TyFImUDu1L495L6MGNMG
   Piw6dEsHi02xFu23PlxKF6mQvWW4GW8RrRngVs+HTqzWSdlJrXJnEzSau
   w==;
X-CSE-ConnectionGUID: JVSEkmwbSsyGTqvsOqkoTA==
X-CSE-MsgGUID: vFLrixEAQMi6CLaDjKRvSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="65228804"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="65228804"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 06:15:11 -0700
X-CSE-ConnectionGUID: qugJx/msRcaLZufU42xqMQ==
X-CSE-MsgGUID: dSjrT5xpSUKViXgfwOiylQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="182342035"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 14 Oct 2025 06:15:09 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8err-0002p5-11;
	Tue, 14 Oct 2025 13:15:07 +0000
Date: Tue, 14 Oct 2025 21:14:47 +0800
From: kernel test robot <lkp@intel.com>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [agd5f:amd-staging-drm-next 1/12] Warning:
 drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_eeprom.c:214 function
 parameter 'ras_core' not described in '__eeprom_xfer'
Message-ID: <202510142114.VmLloJ5S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   bf23da0a89873c8144f93cc6ac9a36ad615100b6
commit: a4299d6c4879390acc1ad074b4bc0eeef51a6cc8 [1/12] drm/amdgpu: Add ras module files into amdgpu
config: s390-randconfig-002-20251014 (https://download.01.org/0day-ci/archive/20251014/202510142114.VmLloJ5S-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510142114.VmLloJ5S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510142114.VmLloJ5S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_eeprom.c:214 function parameter 'ras_core' not described in '__eeprom_xfer'
>> Warning: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_eeprom.c:214 Excess function parameter 'i2c_adap' description in '__eeprom_xfer'
>> Warning: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_eeprom.c:464 function parameter 'ras_core' not described in 'ras_eeprom_reset_table'
>> Warning: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_eeprom.c:464 Excess function parameter 'control' description in 'ras_eeprom_reset_table'
>> Warning: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_eeprom.c:943 function parameter 'ras_core' not described in 'ras_eeprom_read'
>> Warning: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_eeprom.c:943 Excess function parameter 'control' description in 'ras_eeprom_read'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
