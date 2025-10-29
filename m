Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EDF3128BA;
	Wed, 29 Oct 2025 22:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761775498; cv=none; b=L+KY5IFiOe15an3P43TlAR21dzdtK1M4V7CyiaXE3fMv1i1RgnQtW9XlaEItJIrWX7801EHz7f7F2yzXMrKWCYom4CLwjvy2f4xseGkN8GUhr3GFFLdE8T+jNt+WBay0IQSKeZPIHv8MwISpdkX0cfkp7pN1Zjp2UjQwgZvrOyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761775498; c=relaxed/simple;
	bh=Xa2nCvLmmPqcmZLV3BGsxHcwIp2YYJNnacnCRoxYSnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DkOi6WAKTMtfqknpL2fMixb8LYMIIGWPmS5UGarZmHBa1wT6A0g+S8RDRAC2ln2Fuo4yDUig7pA8AxqrSW6lKQq4mxG9DikcfQXPXTlGVSoFjL3yBIqUE6G/vC4SJCct4iSgLuS0o5ret4bczmf9DVtW6A9zsAi7ElwkXVpmDdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=anZ0Kn4a; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="anZ0Kn4a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761775496; x=1793311496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xa2nCvLmmPqcmZLV3BGsxHcwIp2YYJNnacnCRoxYSnI=;
  b=anZ0Kn4aDxSLY6F7BKcHqqV7nTpKaLnDTAfl85DrJ2OuKtL0V522zAf/
   biR1ZKkcQKFg7Lzn2FDjnKyFNtNZ8E/dCBt9coRIgfMPqYntI9xRlDn7W
   3dRhPK2AJiA8x5TQZnm2UtDwBoZxqesdhNmnAnoBxemmJ0FpDGHGxG1Mn
   Pisp8tBBhnfx+bN8KG9NwZ1PWMIE/xEq3geW1ezWxROsvvIbAbrPPxWPl
   s1Gt4ciJieVdWISiVQzQ/4SEQC1LrTpmIQi/W3XntjRtDA51ChvPx7X6Q
   Rs3YjiuWFTKiCZiWrERBv0l/pt476w1d36aNQmc2j1TQifsMhUJVjth7X
   g==;
X-CSE-ConnectionGUID: Ml4tAtycT8+rfAzau2jC2A==
X-CSE-MsgGUID: IAm5NvdFS3CREQo7RdMdZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63115613"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="63115613"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 15:04:54 -0700
X-CSE-ConnectionGUID: M0wkzMSYTTqXyzbCKB344w==
X-CSE-MsgGUID: DFr0l+b7TH2rhJMhMGeg4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="186525001"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2025 15:04:52 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEEHi-000LDe-0N;
	Wed, 29 Oct 2025 22:04:50 +0000
Date: Thu, 30 Oct 2025 06:04:25 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>
Subject: drivers/gpu/drm/xe/xe_svm.h:217:44: error: too many arguments to
 function call, expected 10, have 11
Message-ID: <202510300519.RG1ckAUY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: 10aa5c80603088d10c2cd5e7e27d561a8fb59c7e drm/gpusvm, drm/xe: Fix userptr to not allow device private pages
date:   4 weeks ago
config: x86_64-randconfig-076-20251030 (https://download.01.org/0day-ci/archive/20251030/202510300519.RG1ckAUY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510300519.RG1ckAUY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300519.RG1ckAUY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_gt_pagefault.c:22:
>> drivers/gpu/drm/xe/xe_svm.h:217:44: error: too many arguments to function call, expected 10, have 11
     216 |         return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
         |                ~~~~~~~~~~~~~~~
     217 |                                NULL, NULL, 0, 0, 0, NULL, NULL, 0);
         |                                                                 ^
   include/drm/drm_gpusvm.h:251:5: note: 'drm_gpusvm_init' declared here
     251 | int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
         |     ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~
     252 |                     const char *name, struct drm_device *drm,
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     253 |                     struct mm_struct *mm,
         |                     ~~~~~~~~~~~~~~~~~~~~~
     254 |                     unsigned long mm_start, unsigned long mm_range,
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     255 |                     unsigned long notifier_size,
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     256 |                     const struct drm_gpusvm_ops *ops,
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     257 |                     const unsigned long *chunk_sizes, int num_chunks);
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +217 drivers/gpu/drm/xe/xe_svm.h

0c30c65473ff37 Matthew Brost 2025-03-05  211  
6fd979c2f33150 Matthew Brost 2025-03-05  212  static inline
6fd979c2f33150 Matthew Brost 2025-03-05  213  int xe_svm_init(struct xe_vm *vm)
6fd979c2f33150 Matthew Brost 2025-03-05  214  {
9e978741488261 Matthew Auld  2025-08-28  215  #if IS_ENABLED(CONFIG_DRM_GPUSVM)
9e978741488261 Matthew Auld  2025-08-28  216  	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
9e978741488261 Matthew Auld  2025-08-28 @217  			       NULL, NULL, 0, 0, 0, NULL, NULL, 0);
9e978741488261 Matthew Auld  2025-08-28  218  #else
6fd979c2f33150 Matthew Brost 2025-03-05  219  	return 0;
9e978741488261 Matthew Auld  2025-08-28  220  #endif
6fd979c2f33150 Matthew Brost 2025-03-05  221  }
6fd979c2f33150 Matthew Brost 2025-03-05  222  

:::::: The code at line 217 was first introduced by commit
:::::: 9e978741488261e117bb50e5dfcf8e4080990958 drm/xe/userptr: replace xe_hmm with gpusvm

:::::: TO: Matthew Auld <matthew.auld@intel.com>
:::::: CC: Matthew Auld <matthew.auld@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
