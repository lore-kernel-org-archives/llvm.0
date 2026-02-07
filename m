Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA3D23D2A3;
	Sat,  7 Feb 2026 05:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770442052; cv=none; b=a7QCrwRvWqAOTdI+ooR61dNbPXApWO3XLuuoEgiJEch57PTmaBfh1E85s//k1D7ANMdF32pd1F3qD0oDgL5zIzjBjnhmngD+0DtD2EbpKDf7S2CVWLb+WthJPCCPqhvcYjM0Kz4BOdgzftSpBwDBaFXDGBRdmxhYtmFdQ6+S8ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770442052; c=relaxed/simple;
	bh=0Wqb+KoVSetpiBp6Ee2lHO6edGyyDEqw9rwVyxp7lyY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M8JJ1nltrLrT+tGK3dpDO7WfQnuqtdOsvjnU8qSOwOxz00e3leh+KchHWRMFDD7HZWMXdu+XPXEqhYTnNiScADjp69a1jKMQA81OfaHeQF7F9bCPwRZuDKlBf3Hc0jTYUZyT5wMd7a9Qx3K1hpcmLq7dmrk5vblNZb8UvSOrVjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0pv5SsQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0pv5SsQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770442052; x=1801978052;
  h=date:from:to:cc:subject:message-id;
  bh=0Wqb+KoVSetpiBp6Ee2lHO6edGyyDEqw9rwVyxp7lyY=;
  b=h0pv5SsQYHGkjDcm/zjkvg6FIi4IFZwrE2HhvVB6sCOfy8wbjaUzoED7
   aOQHtLrP/jq4oUsfDgpWVvZ4MeBEMBaaxk4igwXT5RxPItPQFNaXkpj74
   omDjti0Oi3tlVFYm0FPqn3h3tYLSK4FxkmH6ftivLWPtDUApJSGXLMe6B
   hmfJIcB2rVbPaa/e/FzLBR+OgulP7yXyqD4tYVhI51ckwX5/B0yIGGM9S
   W5Gt+8rtunkFloKzLkiKzhj6qlhqRmP1x2WhPjLxgG8DNq8vmYPDib941
   QfyZ2rWqnlNdxrl1QR9NJj/7893Awl7LlJqGnN8Rfj264v92gDLezbR20
   A==;
X-CSE-ConnectionGUID: 6zYxXHl0S4CFOOZ0o/v9yg==
X-CSE-MsgGUID: uyZqQ7aKQQqCvAitaJsCeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="94293411"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="94293411"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 21:27:32 -0800
X-CSE-ConnectionGUID: PJ0Z3W+vTpGM3kNzHviTSw==
X-CSE-MsgGUID: 1g+i/zkySSuf8pwvhPNkzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="216038184"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2026 21:27:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voaqu-00000000lPe-04BO;
	Sat, 07 Feb 2026 05:27:28 +0000
Date: Sat, 07 Feb 2026 13:26:29 +0800
From: kernel test robot <lkp@intel.com>
To: Bob Zhou <bob.zhou@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [agd5f:baseline0 3225/3826] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:92 struct member 'rcu' not described
 in 'amdgpu_mn'
Message-ID: <202602071321.AteIU5pK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git baseline0
head:   b6a8211a7821bf70201912b493ab705f423700c7
commit: c3ae2851e95176316859bc6300f80759e2bc3db7 [3225/3826] Bump AMDGPU version to 6.18.0
config: arm64-randconfig-002-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071321.AteIU5pK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071321.AteIU5pK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071321.AteIU5pK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:92 struct member 'rcu' not described in 'amdgpu_mn'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:228 function parameter 'blockable' not described in 'amdgpu_mn_read_lock'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:341 function parameter 'range' not described in 'amdgpu_mn_invalidate_range_start_hsa'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:399 function parameter 'blockable' not described in 'amdgpu_mn_invalidate_range_start_gfx'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:453 function parameter 'blockable' not described in 'amdgpu_mn_invalidate_range_start_hsa'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
