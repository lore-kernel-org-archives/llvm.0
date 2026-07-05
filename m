Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994D519E7F7;
	Sun,  5 Jul 2026 02:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783219398; cv=none; b=e5IkvK2OZQQi2SJ0TjTIU94dBJV0n5zvwUXSqZo0xiRrZL585co8VbiThL2wDRlyUYmwcNEgLNIkF/lGWvzEArk8a1uZm/X/M0L1JvHfmZjHzgcy02eXF1kM17hXJFH1WpVZ4wlw9vMBwsf8xrG+t3A/CFbZGmkiIzbx8ocDzYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783219398; c=relaxed/simple;
	bh=915WFBE5/kAAPYsEC8F1F7HT2PkHW55yxnG5lbyzIEI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KNylod0huhjQpryQ3ZX9kskoT3yEN2vHMCBjPGtUaQs1akdAaq4o7FsaSsXRlnH4gKFv1Y+53qCgRhUIaKaS6lq/lCiflfq3AYP+f70WxVgGJNi709Lvyr70SZNvQAm30Y8NL4GqQelU1UPiUXRqmiHRsvuT3pLU+x64fZQQyCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqkHtlfk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqkHtlfk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783219396; x=1814755396;
  h=date:from:to:cc:subject:message-id;
  bh=915WFBE5/kAAPYsEC8F1F7HT2PkHW55yxnG5lbyzIEI=;
  b=FqkHtlfkw/TptXREdlYTqMplqsPTofGaN2tb/kCpyJwyxCVTVKmWwplA
   Ho0pCLfwMUbo7qdPmfY6d0/X9egidVmBLn64zM9F96MKemPQKv9Dzu1bb
   AQIsGpjLPfHOKyWfmU3Yp1AGFMhdPzV9a0o167RysQkmJuwbV8mA8E2s2
   UWsz8uOcLEaJ3ulXhxcnKnKKmM09JYKsL+GKigQYShEr5ovRafLqEvcpU
   gJcIXUL1EFUwc2WTmognu8L6bAh886pU9TLyPz0S6aaKITSOcMcfWwvFg
   Tu32gXKNRrIz0f9gGX1skHcNSbNWHnWSb1hDasyC0UTYp2CLDQqZOHpO+
   A==;
X-CSE-ConnectionGUID: htA10nC7SY20vKf7Wz6H1A==
X-CSE-MsgGUID: zRCkc6NRTgCXlW4uop8ZGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="106691945"
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="106691945"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 19:43:15 -0700
X-CSE-ConnectionGUID: y91FAuh9S1mvGmbWkevJMg==
X-CSE-MsgGUID: Tf4HzzRwRtWiS3rObZtfJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="257285371"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 04 Jul 2026 19:43:14 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgCp5-000000001rR-12QR;
	Sun, 05 Jul 2026 02:43:11 +0000
Date: Sun, 05 Jul 2026 04:42:21 +0200
From: kernel test robot <lkp@intel.com>
To: Cong Wang <cwang@multikernel.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: kernel/seccomp.c:242 struct member
 'redirect_capable' not described in 'seccomp_filter'
Message-ID: <202607050425.NbTTy35g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Cong-Wang/mm-add-__do_mmap-and-vm_mmap_remote-vm_munmap_remote/20260705-072005
head:   6fe40c9ec33b138a8d0a62b0750144d8384a7215
commit: 22f1b06a8634266714f0c7e19a44736305c27d92 seccomp: add kernel-installed pinned-memfd redirect
date:   3 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260705/202607050425.NbTTy35g-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260705/202607050425.NbTTy35g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607050425.NbTTy35g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/seccomp.c:242 struct member 'redirect_capable' not described in 'seccomp_filter'
>> Warning: kernel/seccomp.c:242 struct member 'redirect_capable' not described in 'seccomp_filter'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
