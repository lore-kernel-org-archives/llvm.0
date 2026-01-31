Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C1C361665;
	Sat, 31 Jan 2026 17:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769881646; cv=none; b=f4ZDitFKR+HwzrVRs7Fyyixc6vIgguSp0XJ8jWVAM0lbxy1mjMqXcZNpNC3IdYgk1LzmVFmU95IRI2Y5xosEQk3JYanp3Yf/eFx0ls7sGUwQm56SaY6S413iq2u/QZ1ZtMp8KXwCilGAMYpAwg+RCldNt6e8iToicuSCZE8Zvxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769881646; c=relaxed/simple;
	bh=TFi+HkgCJRB+N/D0dw21OWQ1iDm+owmKHZcDwMi/lyQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g3nzL0zMhGg0C/PYkprCWN+lOuMyJFpRKb7BM1IADlbFQKqOtogvL50nSLTQodH4/j1BllkkU9wY55Eko61+eI61IQyP/Bp/IYDQlc0vspNlLqIuCBU7kgF0wLATNxHnE+UKNn5d+HaL6o2qsggue6BYxnLwVs86QhDSTwb+qxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTB9mYJd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTB9mYJd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769881643; x=1801417643;
  h=date:from:to:cc:subject:message-id;
  bh=TFi+HkgCJRB+N/D0dw21OWQ1iDm+owmKHZcDwMi/lyQ=;
  b=BTB9mYJde72sf3UgEoY3b3eMPb4PEBOmIwF9BFMsGNJGwoYUl2oJ8L/L
   ID5fJaEOYW29t5jwdacULoMB+u/60H+aR3oXYVUJXo2bu6MMX2CR8Q13C
   cZC/M8v5pcwNoPwkelBpH2qWrI40f6Xuza5iJxqZ99LZCAXwmMVKpoB74
   nyxKem/zUFCRwnoVflvigwsikyTWljCKrmq062AlebNLQ6G7miDtUuUJE
   rJnv5B+p9oJK/IHxcyOVXTrEcoJK27iYvim35rAtkhbLAXTGcjCpeuVHc
   1NcPPFbVuLpwLTNSX68wmL2SfMu/JMypqs8J+m+MPOCUjuS5JtuNcKi0F
   g==;
X-CSE-ConnectionGUID: IoEzYYGZRwqGJT9dj7vziQ==
X-CSE-MsgGUID: UK+CgNilRweBuo6yHf1Zqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="70306536"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="70306536"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 09:47:23 -0800
X-CSE-ConnectionGUID: d8/YvLVjT3WxbI/ASDgNnQ==
X-CSE-MsgGUID: akyYNZB+Tw22u08/jkJ0LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="214016117"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Jan 2026 09:47:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmF43-00000000eFY-0n52;
	Sat, 31 Jan 2026 17:47:19 +0000
Date: Sun, 01 Feb 2026 01:46:51 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jesse Zhang <jesse.zhang@amd.com>
Subject: [agd5f:ib_improvements7 17/17] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:716 function parameter 'ring' not
 described in 'amdgpu_ring_set_fence_errors_and_reemit'
Message-ID: <202602010109.hrbvHAKE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git ib_improvements7
head:   d143c0854dc1ee192d8993b3b949dc7288d2f755
commit: d143c0854dc1ee192d8993b3b949dc7288d2f755 [17/17] drm/amdgpu: rework ring reset backup and reemit v8
config: x86_64-randconfig-006-20260131 (https://download.01.org/0day-ci/archive/20260201/202602010109.hrbvHAKE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602010109.hrbvHAKE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602010109.hrbvHAKE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:716 function parameter 'ring' not described in 'amdgpu_ring_set_fence_errors_and_reemit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
