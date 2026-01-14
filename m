Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C4A286416;
	Wed, 14 Jan 2026 14:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768400813; cv=none; b=Xz3lMZgeoNjxthtWwJZLhcbsE5H0a6UKtKlXhHgLvsLsLhpo10RCmjvWy0kSEaPPgwA8RBy7K3BFyfzjNpjoAiAH3m4h0SkvijeKcYeq+g1MajqPPf5Mg4HyyU/eKbp8o2reCS2OilztdDINhuYkL+schHfHOq+VZ86NT4yprdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768400813; c=relaxed/simple;
	bh=0VA7moBfsYx+r+wHQENGPp6B0eCiS96KTHJVjJUCIt8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DkqDkHegcFDKB2Sndocr1EUnulyk4HsPWN8SRRLoUpO8Z+JTEp7I1amtrWzA+A0+DKHhmDFLPzj45fzKS29uGl67a2racL5vCF5K/Wy+2FSw07vV7Ffj47305URdIMdd5fU7ErDz5slWEEKEK33pxvP0APYLzjKd3wHuvMuLCjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lneGOkEZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lneGOkEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768400811; x=1799936811;
  h=date:from:to:cc:subject:message-id;
  bh=0VA7moBfsYx+r+wHQENGPp6B0eCiS96KTHJVjJUCIt8=;
  b=lneGOkEZv/8Gh6N5fLNdBZo4vBF72Y0HpVtrBPfNDuxpoa98/NLsdM9D
   nXQ1rlRue4trRVwuEB6V9plLrT5I/xK2x/kAwKXaXZhek59K5fDOPmIBn
   ViAeSStFfgqEbbW4QEMc2SS7WyCYFgrNlLLDjAhKC8HsxZKMixF0KKkqF
   iNobdhHAMvPmxqs3RZGD94UjEakiP6xiK2FPl1Cq+ND7uz7StJKdB0229
   6E2n5mnVl6bR2XVVgcjfPWaVwmUokA0EikxgmrUQ1dm5xk768YSZ+Prcs
   5jMktyYPD9nvAWwURAtBnuyjC2obAlthM48CUYx4N6UfVrehJOO0Nqz4R
   A==;
X-CSE-ConnectionGUID: ez4L4ItfQw2S7ZZbqI7vCw==
X-CSE-MsgGUID: HfS2o5LXTwucuk2wX6xxyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73539548"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="73539548"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 06:26:51 -0800
X-CSE-ConnectionGUID: OUbIOMqTTQutt9b9G/O6LQ==
X-CSE-MsgGUID: by1R4SdySGq8PtCbl8JzjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="209736227"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Jan 2026 06:26:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg1pf-00000000GUk-10RF;
	Wed, 14 Jan 2026 14:26:47 +0000
Date: Wed, 14 Jan 2026 22:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/irqfd_deassign_msi 6/7] ld.lld: error:
 undefined symbol: amd_iommu_fake_irte
Message-ID: <202601142212.FyN4yfxu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/irqfd_deassign_msi
head:   471e1556f51286e93d0bbdbdf8b6fbe9b3b16a25
commit: 299da0a52260c756ac5de0f5cb6b85164b544965 [6/7] *** DO NOT MERGE *** iommu/amd: Hack to fake IRQ posting support
config: x86_64-randconfig-003-20260114 (https://download.01.org/0day-ci/archive/20260114/202601142212.FyN4yfxu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601142212.FyN4yfxu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601142212.FyN4yfxu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: amd_iommu_fake_irte
   >>> referenced by avic.c:1237 (arch/x86/kvm/svm/avic.c:1237)
   >>>               arch/x86/kvm/svm/avic.o:(avic_pi_handler) in archive vmlinux.a
   >>> referenced by spinlock.h:0 (include/linux/spinlock.h:0)
   >>>               arch/x86/kvm/svm/avic.o:(avic_pi_handler) in archive vmlinux.a
   >>> referenced by avic.c:1259 (arch/x86/kvm/svm/avic.c:1259)
   >>>               arch/x86/kvm/svm/avic.o:(avic_pi_handler) in archive vmlinux.a
   >>> referenced 7 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
