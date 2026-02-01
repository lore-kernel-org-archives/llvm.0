Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014992264C7;
	Sun,  1 Feb 2026 20:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769977212; cv=none; b=DbkFXyLZXoj40DqkAhhi3ab0TofpaUAoV+KNUXl2tvWwGprEstNBgTUpNk7j8fqjzgmjHsRWysMmRYFwC4yDr2FV1piFjb+WiE1dPiI5lhsu2G9o6ffFFak16zL5H0EQd1NI0CXgu6T8xMpW5laArVavOeSyhUhsFtQcOhowP7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769977212; c=relaxed/simple;
	bh=ZXtAxBmg+uaedDZ89XeqKGFDPNbuTYLm6y9dpb0/sAY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nW556V75nRCENwN7ILrm0pSpcd/8KB/yvlbpc3fN8Ws3fL8Z7NXdQ5DaVcp1b74LU0Nw8c9Ng3iTLviv1WiIgZnfVxDVV0Km6E20k/F3fopU3iYFIBG1qoMX+lCb+bQ6Ii/xAGt6QEWhOnvV9Uv+PqmBn4QWMuAEjY/y7+BE0fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYLuyAQP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYLuyAQP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769977210; x=1801513210;
  h=date:from:to:cc:subject:message-id;
  bh=ZXtAxBmg+uaedDZ89XeqKGFDPNbuTYLm6y9dpb0/sAY=;
  b=QYLuyAQPLq9N+ud70xib8IBO6Y1Ok/tid4FHwiuGEh0axjNaEh7ysjKn
   OZ7mtdl4K0XuzTI7ep3UwnAxyBc5V4cKk0xftiL+Gd6Hor6OTp9iNmK0z
   TUlA5MaOEWDzXUE31Oc6EzE3GFTHAaRgBlSPnzv4c7AUD0DxhFX8tmms6
   0cygS5T4RKzH6kXv7sl1s0g0rhp60vtwtk8U3gXsK/HIOBYEkgr6TOHnV
   6EnEcXw5Qwmn2o+NEHoryA8tCswJHX7PRI4Jf2CVTsT8rpaRz+3kjBNrt
   M9g7aNslTludNB1HeFqdHYjkJ1RWYkTWlVsWAtm5EPqy6cO1SQ+L6HMqp
   g==;
X-CSE-ConnectionGUID: SSsAEMEaRTe38VE/UFMMvQ==
X-CSE-MsgGUID: KIbszy/5TdSii4cigYKL3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="93798796"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="93798796"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 12:20:10 -0800
X-CSE-ConnectionGUID: w3sgel7tSGW0Xgp6NG8D2Q==
X-CSE-MsgGUID: hATofwR6S7ax0MTp7APYNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="240568270"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Feb 2026 12:20:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmdvR-00000000f1g-2j4P;
	Sun, 01 Feb 2026 20:20:05 +0000
Date: Mon, 02 Feb 2026 04:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 88/101] Warning: mm/damon/core.c:3401
 function parameter 'addr_unit' not described in
 'damon_set_region_biggest_system_ram_default'
Message-ID: <202602020406.AepxCDjw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   5421a2e9d5aaa47e870c48ae39e335519e2e62b9
commit: 3b3c730bfe95de455f2ef37a25f0b46de81a83c3 [88/101] mm/damon/core: receive addr_unit on damon_set_region_biggest_system_ram_default()
config: riscv-randconfig-001-20260201 (https://download.01.org/0day-ci/archive/20260202/202602020406.AepxCDjw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602020406.AepxCDjw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602020406.AepxCDjw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/damon/core.c:3401 function parameter 'addr_unit' not described in 'damon_set_region_biggest_system_ram_default'
>> Warning: mm/damon/core.c:3401 function parameter 'addr_unit' not described in 'damon_set_region_biggest_system_ram_default'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
