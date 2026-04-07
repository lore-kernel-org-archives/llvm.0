Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C27375F87;
	Tue,  7 Apr 2026 03:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534192; cv=none; b=NTTWtF5QnHjHxJyvnM+2jmCAy80OcbOQAruHrHE3IdqEGzCA9zlhYN16wVO4arYVMDLvUnBqLLnUeNEYe7wFn3+Mv9+R4o5t886iedB40pKATWflLildhiGTfn6JzcqVUy9pJLl6JGvxmI/7qC/YTaZvbReDX2KO03ndWBaNhzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534192; c=relaxed/simple;
	bh=PTXyRr9rBTwxOyuvCTnSbuulC2raqd+t3xNCPns/gHo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LIULe840GPy8nUB7KJjFeIBmRWBv8Nu4MeHbgxcL2SxzOeODbxenx4js6n5sOW4wz8iSGcVdc4846V6xe100yYap7ixJHz0Mt7ZyL3Vgu8J/U8ebcMbbjP3gUdZobZurwlj8DxOPD/Mq8OgSwEMsN78EZJJz1jgUkMc+pJexrqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7Z0Lc8T; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7Z0Lc8T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534191; x=1807070191;
  h=date:from:to:cc:subject:message-id;
  bh=PTXyRr9rBTwxOyuvCTnSbuulC2raqd+t3xNCPns/gHo=;
  b=Y7Z0Lc8TZALhpHRx0hc9InqMRFRi5uxtje4my6kTsMWTlyk4N4KY05AY
   zg31slQ5gRE1Vepl0EHQehjLefPdrQPXGcvLKhX6+ivCjtG2Qg6jprcne
   yY31qSj6ZjIjSQQFHAjnHZepdTM2jXeMl7qivCeusRob7GjJ3dxdXqYJ3
   psp2XC9PrAMnlnYB78cs0l75Ssv0K1GAWpAW4TRSrwbLkdRoXj4yy9ryo
   vpebKhMQot/kSXFYrJWXcn+57mB3/ksV2Cjl1GZHq5aLfVdaVWg5YHy+Z
   4Vq9z+afOaKTE4hZCPp/udU9MYT9BVDc4d41CxW5wiYB3QEMZg3+KU318
   w==;
X-CSE-ConnectionGUID: C4TEqWbcQkqUNaHJOZ/P5Q==
X-CSE-MsgGUID: zRE1EStcTD2k6lSplrAUgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87563830"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87563830"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:56:28 -0700
X-CSE-ConnectionGUID: KPsII7cYRaS9nSIaZ35a4g==
X-CSE-MsgGUID: KcHxPuV5SmaFCmbpohq6EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232926680"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Apr 2026 20:56:26 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xY8-0000000004h-02hq;
	Tue, 07 Apr 2026 03:56:24 +0000
Date: Tue, 07 Apr 2026 11:55:40 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 31/68] warning: unused import:
 `crate::error::to_result`
Message-ID: <202604042143.fIJjtmrN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   f7a3080ba37b989ad2fd83054a4b458af97b635d
commit: 3fbc0c3a68510319d0b8cd6e63ebe903ec41ef25 [31/68] rust: of: Add reserved_mem_region_to_resource_byname()
config: x86_64-buildonly-randconfig-001-20260404 (https://download.01.org/0day-ci/archive/20260404/202604042143.fIJjtmrN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604042143.fIJjtmrN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604042143.fIJjtmrN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   rust/core.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   rust/core.o: warning: objtool: asan.module_dtor+0xd: call without frame pointer save/setup
   rust/build_error.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   rust/build_error.o: warning: objtool: asan.module_dtor+0xd: call without frame pointer save/setup
>> warning: unused import: `crate::error::to_result`
   --> rust/kernel/of.rs:19:5
   |
   19 | use crate::error::to_result;
   |     ^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
