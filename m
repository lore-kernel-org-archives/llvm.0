Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB271AF0BB;
	Fri, 21 Aug 2026 00:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787273484; cv=none; b=lI6lRnkDrKvSfySGF7mPDls9On7LTbknI0ek7vqQOWEwmQa3o7hPedMtbQDSruHjiKt0+C9mhGeQYBq1LXBtQCmXUvQV0LW4bjkC9BHsuFJSWE+HYOyLqEzW4+yfgvcLfyXl55xvtKzht8S2lOfAck5f/jiiYZQJrJPUyD9FKuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787273484; c=relaxed/simple;
	bh=Ij7R5BuJNUPPwXrz5ABU29yi59fK2X5IWOdUt2K1kqY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jw3RucNJuy8ce8eyjSM5RwLJi93sAMZLO/Xwp5/+/EhHgF21bcQk+WHTZ0hH7NDx2FoNLMRFa/E4qOBqvhoessFyzm27sG3a3QJPTZOMGA6ZUFiyWU0X2NvTTf6ftnmJySkc0v7zeqpZmMup3PG2yzgesphyQ5fWAspk2jmk3c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4MN4k97; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4MN4k97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787273483; x=1818809483;
  h=date:from:to:cc:subject:message-id;
  bh=Ij7R5BuJNUPPwXrz5ABU29yi59fK2X5IWOdUt2K1kqY=;
  b=R4MN4k97ra9rLvKdb9ay2B0+dTq+KlCjcQKJBdr6YbjgiQNGKSfsdSWs
   5a0p8EFqkGgVRygf+ne4ptaZESsuzBEXrex2vm+hKgwMO8GcI6SB38dzJ
   ftHAck/pvNqX0uDOdKa5B3bhfohCBeGIvr6puLUlrqrV3sQWSHWt1N+t6
   zgtx5Lvd2Vqdb+VboC/7AilRuSx2z9eF8yPL5+PwRL/nq4eiV+05YXgL+
   rU8yJWHDyr3J3TYQs83VxKlgfw8/uzeBP4FXG9AlqfuwgBE/d4Wk7FLBf
   /bDL4ce/Kn3KuRLIqqqjIM5EeohcBVCwe6W6/sHMUIMlhH3EGS9SJtQvF
   A==;
X-CSE-ConnectionGUID: 2po4fczNTquypx+AKUlqhw==
X-CSE-MsgGUID: UsLAfYjpQ7GsDFEfLQS29g==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87946853"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="87946853"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 17:51:22 -0700
X-CSE-ConnectionGUID: giyBshKXTa6X+768V0prUA==
X-CSE-MsgGUID: BBnn7Jh9QJagn0EAyW/GrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="263540228"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Aug 2026 17:51:20 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxDTa-00000000oqr-0uXP;
	Fri, 21 Aug 2026 00:51:18 +0000
Date: Fri, 21 Aug 2026 08:51:11 +0800
From: kernel test robot <lkp@intel.com>
To: Candice Li <candice.li@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [agd5f:amd-staging-drm-next 27/107] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:3968 function parameter 'desc' not
 described in 'parse_psp_v1_bin_descriptor'
Message-ID: <202608210800.S15sl61g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   232bf7d5453df6cc0d877a1003f9aa172e9750de
commit: 83ca5a42cacb7716e8b8269400553c3b2c84e855 [27/107] drm/amdgpu: factor PSP v1.0 firmware bin descriptor parsing
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260821/202608210800.S15sl61g-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608210800.S15sl61g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608210800.S15sl61g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:3968 function parameter 'desc' not described in 'parse_psp_v1_bin_descriptor'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:3968 function parameter 'hdr' not described in 'parse_psp_v1_bin_descriptor'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:3968 function parameter 'desc' not described in 'parse_psp_v1_bin_descriptor'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:3968 function parameter 'hdr' not described in 'parse_psp_v1_bin_descriptor'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
