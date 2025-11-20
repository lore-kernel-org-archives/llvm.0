Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5E91D27B6;
	Thu, 20 Nov 2025 22:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763678913; cv=none; b=BPenOL8/0Br0C+z9BPdVYxA7D7aa3x4XagLJnaxcQTlHJ7f6Wq6QpS8RC2lhSBlMFNOhPeZOczYh+U534DHGYEi1ZqBaCt2jd51hlAe0QkLKenaqHempdca9dst/Qt52uiM97cVDt9jWW+OV/Shms5ZGg06XEapZUbw3eAqbnOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763678913; c=relaxed/simple;
	bh=DfuXYEf6NafM5XHJ3d2b0+YjhqAHDqcv1lXBBjn6+TI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uWyKN0JMVIAT5NrsIx91I6zIasb0k4zILqw5K1x8WO2XtwgKV9yz2RM6a2SeEbgUbAXeuWI3gi10s8beCv4ynB8q3Gry5tShnY3Qq+ROh2BXsrdgvBPT77kIEmEIQZIoQDw5TlYaPIlzWbPmBAc54W7KHeHE9xd4GUCH87kmtkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apnVCnT8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apnVCnT8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763678911; x=1795214911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DfuXYEf6NafM5XHJ3d2b0+YjhqAHDqcv1lXBBjn6+TI=;
  b=apnVCnT89FC3n01XsaBrWnorq1TaMVQje6K6k4+uDbp/gCZH506fQNLi
   ajyXnZuNO9gWQYLNSfIiTgfDLD3+gm6ulHHVoMniEeyBc1xa98MBSVv+S
   77RY6/tCVo3v1kfTazjlLbrey+VlLdGJKG3+bQcAlmdrBjLwBU3X7wv7R
   9niaHFyECjj6NMgsr58tZBEkMOirfcO+Mn7WOLLkuv3FthN2sqU5lo4Qi
   oajAsni1ZD/Ti6yShPwO3CINjHjwWqCVUU0RtdH1FLnsJldjIY68+KaxI
   g+vTlDwKCNi2t0RrmG2Q0X8onmvld2H+EstJ3OWULcwkcM+UcW4Xr3ek6
   Q==;
X-CSE-ConnectionGUID: PxZP8MjTSgq1SBiCF6qEFA==
X-CSE-MsgGUID: d35gpJ8IQX6st9JJYqBxsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69622574"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="69622574"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 14:48:30 -0800
X-CSE-ConnectionGUID: efEzfgBVTBqMkDaah00JeA==
X-CSE-MsgGUID: 6D/dhglzSeGqr4t5ev64DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="191316693"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Nov 2025 14:48:29 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMDRz-0004fL-08;
	Thu, 20 Nov 2025 22:48:27 +0000
Date: Fri, 21 Nov 2025 06:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alice Ryhl <aliceryhl@google.com>
Subject: [linux-next:master 2964/10599] error[E0609]: no field `dev` on type
 `drm_gem_object`
Message-ID: <202511210649.lhQnt194-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
commit: d3917368ebc5cd89d7d08eab4673e5c4c73ff42f [2964/10599] rust: drm/gem: Remove Object.dev
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511210649.lhQnt194-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210649.lhQnt194-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210649.lhQnt194-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `dev` on type `drm_gem_object`
   --> rust/kernel/drm/gem/mod.rs:231:57
   |
   231 |         unsafe { drm::Device::from_raw((*self.as_raw()).dev) }
   |                                                         ^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
