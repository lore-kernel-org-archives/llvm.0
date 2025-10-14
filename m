Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AD92D46D8;
	Tue, 14 Oct 2025 09:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760434212; cv=none; b=g/gXXqxnZGSS6eulXD7oCgYcJZLQ1khlFQZ6MU7x58tMcWSTx/UduACFQO5aJ10vMTvQWS9k0hLPolcvMe91SDJKWXYrbL8AbF0LpdmwGl2fYdx6Q0fLheBAS7q02JSrWFr/UXz0tWFe+ngsZ+dvmF+jorLX2/M6dyeGYYnBAFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760434212; c=relaxed/simple;
	bh=G8qIOGpZDmFjcVl+BG1v3H5em0d95hsDsI1brGLfCjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p9YMysP7sqnfp+p7+1hMGa1R2cI7JLH6q9tDn+x/Xc8V/wDgKFqDNrGf3m1jHcPoaGQ2sUI6Is1o/+fuE9CyOT96LHYaqGkE5lHpQUuGYPprRx4XpTL/Cwivnn8OLY9YUmlVkZ7XlBjvHxhNZCjJNN/Mr4EIGVdnux3u+cWIAUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aE7wQ02u; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aE7wQ02u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760434210; x=1791970210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G8qIOGpZDmFjcVl+BG1v3H5em0d95hsDsI1brGLfCjw=;
  b=aE7wQ02uBaLT8p5ahyj6/tp/AvUif8x6MeMvUWwq3HlijEPK2zQnKa75
   +ruppiuiT+GP3/t8Y1ANZWqHVjotvHN2sK6QV9qI6GlGouexgLHMFRof5
   oRqHGRdCyBAvgk2/qT06Ie+A8rTLK7d3n6UAgwOf62k1M5bedH4g4iOng
   HCwat2W5Hdl1y2FZ8Jy6y5GP1o3aLIKXesg6EaYCA5FrfD2hJYqwgwx/L
   15sYHmTScPZyhEPydTtXos/AZil78J8YC6/u3FLxjWnSK5Ok+qm6Ds3F4
   ktDjjJBBrTux+KzOls4Tr6IC+Vq1vWUk1AfHg2JeYeQHnu2nVJy9fXBaj
   w==;
X-CSE-ConnectionGUID: Rb8NyNgxQpemiCchZZ6iEQ==
X-CSE-MsgGUID: 9oUzi0IsTK+LY+QnHnq5xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62624391"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="62624391"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 02:30:09 -0700
X-CSE-ConnectionGUID: cLpoLbhwTKqR+aex1Nyuiw==
X-CSE-MsgGUID: Q4lWz0eOT5iw2fbMYIeYoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="186091298"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 14 Oct 2025 02:30:08 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8bM5-0002bT-0q;
	Tue, 14 Oct 2025 09:30:05 +0000
Date: Tue, 14 Oct 2025 17:29:20 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [agd5f:drm-next 8/19] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:761 function parameter 'af' not
 described in 'amdgpu_fence_driver_guilty_force_completion'
Message-ID: <202510141727.kRy8dSnL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   079ae5118e1f0dcf5b1ab68ffdb5760b06ed79a2
commit: ff780f4f80323148d43198f2052c14160c8428d3 [8/19] drm/amdgpu: set an error on all fences from a bad context
config: s390-randconfig-002-20251014 (https://download.01.org/0day-ci/archive/20251014/202510141727.kRy8dSnL-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510141727.kRy8dSnL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510141727.kRy8dSnL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:761 function parameter 'af' not described in 'amdgpu_fence_driver_guilty_force_completion'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
