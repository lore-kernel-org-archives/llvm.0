Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DFC409635;
	Wed, 10 Jun 2026 13:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098203; cv=none; b=dAW8U3i9XsLfTUuxiK+FG/XpE6RQbTpt8idII9apm7QfQJ/4GnPM401C/DwAscK0BY820IA0lko1HdDzk7EHFzd5ORAAGBqUNMunQEkGDgu9BpBLIt+p26LhI56f6TogQ1IWDdWcHrvYGlJ5dTsKFd1n32xViVOgZyJhJmlPE74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098203; c=relaxed/simple;
	bh=aMXHdFbndSz/eYfb5PbPvtxEGkHz6Uux41Kgogc+L+E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KOL+x7auRRKYLy+a9UdXG218QP5ZiaQsHs5nqabsbKFSm9S3f+Fm8DD1wai4xnW8JqntoGCKdsXvIbo8ZtzvHCaDGFbVhV0YCb1FN5lUMqvWTmzkW6E6FuufKr6vGaZxQQi8Vz5ZdYXsDKT4E6v5LTXwnHbZsQQMsWiKeHryAto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R13VFIqD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R13VFIqD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781098201; x=1812634201;
  h=date:from:to:cc:subject:message-id;
  bh=aMXHdFbndSz/eYfb5PbPvtxEGkHz6Uux41Kgogc+L+E=;
  b=R13VFIqDKbwNqNnWRg8umkeeinyCDNoUlOc62EZbS+erZkB+g+uDI0F8
   xP+8N++P9T+wgPPFAU2BfeE8H0WO14hxqxpLBfNu+pIEWeWFhU/nnEOZg
   WAtBdiSo/tHQLFo7Vmgh9854Z8Rn9cDKbIR5xVTwX0ewT4GiZ0ZX9KMqd
   CmOjtYSaHT+w8iwPDiiE1wYixZaTDKdMi7fvBGrpHctF6nTIEAqGAw18Y
   ZeQ+FlA8ZBT4m0FDeb1VmDRyZR5jwaZrDqJVeq7eeI6YbT+M6+9zFWWND
   Dzs6kmuljlUTE0n8QHIaRHPHeKuX2takQTib0GZE4RayFVh9DpU9CIxxa
   Q==;
X-CSE-ConnectionGUID: HLHjRFw5SLuCNwD0XHWwTw==
X-CSE-MsgGUID: b8dC9cxMTqO7wpQVIi+GFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81933476"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81933476"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 06:30:01 -0700
X-CSE-ConnectionGUID: Vj/9ZGoBT1Wrtqm/qkQKRg==
X-CSE-MsgGUID: n233I64eT1uzeGanx7rbPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="241760029"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jun 2026 06:29:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXJ0H-00000000LSU-0yQ7;
	Wed, 10 Jun 2026 13:29:57 +0000
Date: Wed, 10 Jun 2026 21:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvmclock_vs_tsc 1/51]
 arch/x86/kernel/jailhouse.c:68:50: error: too few arguments to function call,
 expected 2, have 1
Message-ID: <202606102111.oiMD3eO9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/kvmclock_vs_tsc
head:   03e00f8b41e58b5dd5ceef21940a62e5d8e08766
commit: e3916a6bfe7c4342989909ff0109708bda8ed516 [1/51] x86/apic: Provide helpers to set local APIC timer period in hz and khz
config: x86_64-randconfig-005-20260610 (https://download.01.org/0day-ci/archive/20260610/202606102111.oiMD3eO9-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606102111.oiMD3eO9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606102111.oiMD3eO9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/jailhouse.c:68:50: error: too few arguments to function call, expected 2, have 1
      68 |         apic_set_timer_period_khz(setup_data.v1.apic_khz);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~                       ^
   arch/x86/include/asm/apic.h:141:13: note: 'apic_set_timer_period_khz' declared here
     141 | extern void apic_set_timer_period_khz(u64 period_khz, const char *source);
         |             ^                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +68 arch/x86/kernel/jailhouse.c

    65	
    66	static void __init jailhouse_timer_init(void)
    67	{
  > 68		apic_set_timer_period_khz(setup_data.v1.apic_khz);
    69	}
    70	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
