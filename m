Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4917928A419;
	Wed,  7 May 2025 16:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634570; cv=none; b=B/DorF8VmP9E1x41fCwBt3V8My2KqcYoFUdy/GysD7671rczOSs8h3Hb1ynIedCedM9RO8x5NDmdWQpkHk1cB87Ke//onhQrxajJmCGrOqVdhj0SS+ZAEJ5Lg52x2IjoFwNsQWzinUlO4/n/YouBMEPEVx2HT0/pvXvk4UlHxVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634570; c=relaxed/simple;
	bh=L/PfCHHhowyo06deqL98+vVFZhODOlHAP598a74SqtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mmpdTMP8zW+5s2hvJ/ciyVpi4sNt54FgkPTR1O0vm1YIxKQenwlXsuIzedjghfPL7njRwezd6TvW4YC5lOCBPjexar1zccZfcBHlileUlhrBXSoClkrg6Basp8oZlVwtwTfw0A5iDs1K7Kb8L9PxCRQEax3ZWVeKWE7WymEhyLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BcKKrAVN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BcKKrAVN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746634566; x=1778170566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L/PfCHHhowyo06deqL98+vVFZhODOlHAP598a74SqtU=;
  b=BcKKrAVN2LlOEF9S3AB5LWJm5O2+bq/zJALtqtFerBBaBK1PCGRpPAz8
   dOYQOmXCE0n+SdZ+l2fHW5ffQf6QTAhHC7q15/TZUQUr/UTNVjyOrgSY3
   Ug4hT+cYTKHk2MtChwJmXIeNMqvEBmVz1JdXdvBdNO+yU1W9hmYz+35mH
   /3tLNP29/I8CT3QXvzvAzJIROw9PHm5RldLUlHb1E/fW+QtrVit6vqFNR
   nZCarsW8Gw1TqqJ8VQAii4+7NAJmGwk3ovTnyGJN1Yuc5VfOqM+FFPDGK
   3ssadCB/HxKaR0XAwQ0TEwAd+6klgR2snu7e4+2EL0xNEM4CTtjZl80bH
   g==;
X-CSE-ConnectionGUID: SGviohUxT+Wrx/oW5irreg==
X-CSE-MsgGUID: dovIQ8wUTSu4rljC70BPRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59366096"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="59366096"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 09:16:05 -0700
X-CSE-ConnectionGUID: QFIUhRLmRda22t/dy6fc5Q==
X-CSE-MsgGUID: oaJQHB7+STWBSDuBLdfc/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135872527"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by orviesa010.jf.intel.com with ESMTP; 07 May 2025 09:16:05 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uChRC-0000Co-1V;
	Wed, 07 May 2025 16:16:02 +0000
Date: Thu, 8 May 2025 00:15:13 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [linux-next:master 5475/9308] ld.lld: error: undefined symbol:
 __aeabi_ldivmod
Message-ID: <202505080023.qgv67sw2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: c4a2e5f865b7230a9565c57c54b375b1d2ce82f5 [5475/9308] drm/xe: Add devcoredump chunking
config: arm-randconfig-2001-20250506 (https://download.01.org/0day-ci/archive/20250508/202505080023.qgv67sw2-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505080023.qgv67sw2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505080023.qgv67sw2-lkp@intel.com/

Note: the linux-next/master HEAD 08710e696081d58163c8078e0e096be6d35c5fad builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __aeabi_ldivmod
   >>> referenced by xe_devcoredump.c:216 (drivers/gpu/drm/xe/xe_devcoredump.c:216)
   >>>               drivers/gpu/drm/xe/xe_devcoredump.o:(xe_devcoredump_read) in archive vmlinux.a
   >>> did you mean: __aeabi_idivmod
   >>> defined in: arch/arm/lib/lib.a(lib1funcs.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
