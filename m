Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8247125AA;
	Sat, 13 Jun 2026 01:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781315031; cv=none; b=Ye3Py9Xd91tUXXXBEVVrrQ05lJ3ky6FLH9hAv1dMuU1QaaI5iEf6ZYA0HBj2VwoQcF7eoLjOJoSfh2FnzsU2P9knxqeCGAB5onhcL/ocnoyVIUzDyox8i3q+WolINFbKUBTe51BqQ8s54XwuaK4UID6ycRBOYehtVs1oVdBn5Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781315031; c=relaxed/simple;
	bh=kqhGYkMP6T7iWk5BrJVsdGh9UNAyGJB17RoSu0nqHUE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hj5xFU/vSu2DnujtZovSictLxTWf1Gr23c4mMqBGpJ66pq6UMaqtHFEk5gIb3zVoO02jDnhQtXLbQWcoibfPfYZxj5HdzZqpNWdJ+wcEJEdEwiycD8fSI0FmMsGQLAQQXdZl0zWLxMUzIXJpqrWfM2bGOOlpTUxvWFoyb0sQW5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPWKu3O3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPWKu3O3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781315030; x=1812851030;
  h=date:from:to:cc:subject:message-id;
  bh=kqhGYkMP6T7iWk5BrJVsdGh9UNAyGJB17RoSu0nqHUE=;
  b=HPWKu3O3i3MPikTXt8iX1/NJlBXFfFFnT30Eh+t2pRJxdEgfsoQs+xpc
   8h8A4xjPEoQjSVbK73YsMopYSFEhXsuKHosUP9/h9oppDFNV9vkK8fTSQ
   zAdAxj9sXmfr6qdjeVzWAa43ao5vOzHpn+mYDulmjR2q/w6snBWEaLAzH
   /FkUlS/XKQoBPSfVx3hbBgvZHxrJQtl3Ct9iOtn1nbyDITIALxYYLpLSr
   BbxhkwlY3K6rPlEB5Iza7tkplMlD6NPPnN9eH8n5yYgjVaGCqCW78UyIb
   ZnuNx3TeHgtAgeEmS6R1PQ9UfHXQIlYSJRh/pHyCfMzMCnaMpSu7Qj7R3
   Q==;
X-CSE-ConnectionGUID: m+R6U/CvRK2lfuWk+VLd/g==
X-CSE-MsgGUID: S1e+e+lgTnymYRdFc4Ntcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="93542437"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="93542437"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 18:43:49 -0700
X-CSE-ConnectionGUID: ZkJsP3gnRY+/KRuch6Hsmg==
X-CSE-MsgGUID: rZZI9X6NT2utuC21hYfBfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="240612178"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Jun 2026 18:43:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYDPV-00000000Pa2-1doB;
	Sat, 13 Jun 2026 01:43:45 +0000
Date: Sat, 13 Jun 2026 09:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/no_unsync_for_nested_tdp 28/28] ld.lld: error:
 undefined symbol: tdp_enabled
Message-ID: <202606130942.dI4M8aga-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/no_unsync_for_nested_tdp
head:   9f53f21ed659784cf113f5c1690230a7b1549cb5
commit: 9f53f21ed659784cf113f5c1690230a7b1549cb5 [28/28] KVM: x86/mmu: Add Kconfig option to disable legacy (non-TDP) shadow paging
config: x86_64-buildonly-randconfig-004-20260613 (https://download.01.org/0day-ci/archive/20260613/202606130942.dI4M8aga-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130942.dI4M8aga-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606130942.dI4M8aga-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: tdp_enabled
   >>> referenced by mmu.h:81 (arch/x86/kvm/mmu.h:81)
   >>>               arch/x86/kvm/mmu/tdp_mmu.o:(tdp_mmu_zap_leafs) in archive vmlinux.a
   >>> referenced by mmu.h:81 (arch/x86/kvm/mmu.h:81)
   >>>               arch/x86/kvm/mmu/tdp_mmu.o:(tdp_mmu_zap_leafs) in archive vmlinux.a
   >>> referenced by page_track.c:39 (arch/x86/kvm/mmu/page_track.c:39)
   >>>               arch/x86/kvm/mmu/page_track.o:(kvm_page_track_write_tracking_enabled) in archive vmlinux.a
   >>> referenced 43 more times
--
>> ld.lld: error: undefined symbol: kvm_mmu_sync_roots
   >>> referenced by mmu.c:6180 (arch/x86/kvm/mmu/mmu.c:6180)
   >>>               arch/x86/kvm/mmu/mmu.o:(kvm_mmu_load) in archive vmlinux.a
   >>> referenced by x86.c:11156 (arch/x86/kvm/x86.c:11156)
   >>>               arch/x86/kvm/x86.o:(vcpu_run) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
