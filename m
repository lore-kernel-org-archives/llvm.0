Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEBA395AD5;
	Wed, 13 May 2026 06:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778652763; cv=none; b=ql+VyTcX/YoCnvcCt41CpefW3Odnvh8Ooo4AFPdF2If3C6/fDKu1GvuZAf9vfEx6YxFwAYmGtE5qIHcNCSlrmnr7qDlcHuDCZ+ZJ/ZBtISq+B1FhhhMx6n4pUyiuzR0POpVGQP7qM6HcGVr8MEXXhF2MuC8u8xKeTheAGU3fn6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778652763; c=relaxed/simple;
	bh=OPkMkAq3Vt4D5HP6HHu2QZmLTQ2yNtGT2h/4iX1OVCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEwZ8BUyystNDohiAcPvbUyowSw4xFY04LbhSsBvJxhhnL0fZzC6uywBXin0P3Ezn+SZuQfT+CQUouRjpD/se2GDhlVEtnmxGN0NOUD6h8k9a/Db24Gt8aBfXjuq2mZ5+Pvq2IqqBiXLnTunZC/nLgk5rieT4tFmvDvWEhLqaok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ek3yxEEQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ek3yxEEQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778652761; x=1810188761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OPkMkAq3Vt4D5HP6HHu2QZmLTQ2yNtGT2h/4iX1OVCk=;
  b=ek3yxEEQnK3We9hdYqHJA8+r4CRF7uxGMvGwoXUKudXqBK4zi9XbqR0H
   bAHa0gBXBuJDjvJ5Q6EzDUlYgr1p4+ULkhiLnmyn5usPGGdgtUVv/iyky
   YwuTFChuGo2pNzJbzcotfMgTjzYZ7FTW7u+JtcIugluJAH0uQGQ2utUkQ
   Z+IHRX7Y5CkLrspqU+iNG9crHO6wEt5MB4rHaGuQoCUW7xaeq/zRNHJAn
   L6tbg6J3J/ZKmdiMWxlQhsqyoy+kMK0HpaOPEekH3zGp8hlPNzVHRyFsC
   4SuJsOVhOFuN0G96OPidxbU9fhNTJBIGvc0JSqa/SzCbo5qepIgVeP1yH
   Q==;
X-CSE-ConnectionGUID: M45sREXjTiyQSWO6g6hHeg==
X-CSE-MsgGUID: iG1N4WT8SiuoxLd2T1v4yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="82140624"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="82140624"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 23:12:41 -0700
X-CSE-ConnectionGUID: pqJwWXPsStqD1mkHu0/tWg==
X-CSE-MsgGUID: /9iG0Hx1S6yY/5vviuDzhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="231599572"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 12 May 2026 23:12:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN2pg-000000008UD-29dc;
	Wed, 13 May 2026 06:12:36 +0000
Date: Wed, 13 May 2026 08:12:04 +0200
From: kernel test robot <lkp@intel.com>
To: Andre Jun Hirata <andrejhirata@usp.br>, kenneth.feng@amd.com,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	airlied@gmail.com, simona@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	gabriel.dimant@usp.br, guilhermesangabriel@usp.br,
	Andre Jun Hirata <andrejhirata@usp.br>
Subject: Re: [PATCH v5] drm/amd/pm: Use guard(mutex) instead of manual
 lock+unlock
Message-ID: <202605130808.IJrao3wX-lkp@intel.com>
References: <20260508230312.6108-1-andrejhirata@usp.br>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508230312.6108-1-andrejhirata@usp.br>

Hi Andre,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on next-20260508]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andre-Jun-Hirata/drm-amd-pm-Use-guard-mutex-instead-of-manual-lock-unlock/20260513-040937
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260508230312.6108-1-andrejhirata%40usp.br
patch subject: [PATCH v5] drm/amd/pm: Use guard(mutex) instead of manual lock+unlock
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260513/202605130808.IJrao3wX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130808.IJrao3wX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130808.IJrao3wX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c:247:40: error: expected ';' after return statement
     247 |         return smu_mode1_reset_is_support(smu)
         |                                               ^
         |                                               ;
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c:833:24: warning: unused variable 'vstate' [-Wunused-variable]
     833 |         struct amd_vce_state *vstate = NULL;
         |                               ^~~~~~
   1 warning and 1 error generated.


vim +247 drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c

   238	
   239	bool amdgpu_dpm_is_mode1_reset_supported(struct amdgpu_device *adev)
   240	{
   241		struct smu_context *smu = adev->powerplay.pp_handle;
   242	
   243		if (!is_support_sw_smu(adev))
   244			return false;
   245	
   246		guard(mutex)(&adev->pm.mutex);
 > 247		return smu_mode1_reset_is_support(smu)
   248	}
   249	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
