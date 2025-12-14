Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A8C15C158;
	Sun, 14 Dec 2025 00:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765671636; cv=none; b=t2w0J6Tvi6HvEjC6o3aDWG7qef4jiFU12dd/HAaQZ107kTeKYdPvO2Po86ZAY9ZXnF+hE2LFXue7/M9ABD6b1H2y9CgK75Yp3yN5YhnKopZcoa04/BNCvxcDZg48fDpRqrCmI95EKBGHaDWTsGcFsENmzCxRPMROuyXaeqiYwU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765671636; c=relaxed/simple;
	bh=vp7w+jD4MyftsCeqXlPRva9XCmdDbshIjlLXnRGOP3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=etFnFQn8rzFesbEu0BQPyaUtD55ZAVYyk/+/5TOOnxzunpxIAI3LDktpQ4oX7hTGrA9+oseuri+zhEifSvKU8HV0IicFdYk+nBEy93XTfzfRVyO0sp5XlUBqnmuXYDGvnS6O4NknKr5n86nXcdTXlZvLrTDOnZ1m2ZiCXWrbHag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VxFLBBOm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VxFLBBOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765671635; x=1797207635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vp7w+jD4MyftsCeqXlPRva9XCmdDbshIjlLXnRGOP3M=;
  b=VxFLBBOmgKObO+LXgEX206N73bnO1F33M80xObxOIXOO9Wj0OenYBwZF
   17HZ3heWFZFFmSeX+y7c+zoeIFT0/LQr3r1vy7hfCKURJJv0jgqD/RR8n
   oP0KseeZ96u4XdPrCV9M0qyUSDrYO34WLIZ1dikoHYdb6b34faS2nBl79
   v/3hft+IukzM6xv4mFc37KDrJtu4PGoaUcz3v0901Jgc/APt0UYttcKlP
   PiW8kWiyCDgw8wpS76dltlQfT8pdqUxqeULRVM+wienUN6pmMCPIhoLgJ
   s4DJszSDLrXX9O7hfcSs2g1Yvj1SKU/ogU/lQjAUerjVfyGSUF+17Xo1f
   A==;
X-CSE-ConnectionGUID: wzkRjwIiRcmzjgZuRgiDaw==
X-CSE-MsgGUID: xnDattd3TAmmGygkERmABQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="90279207"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="90279207"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 16:20:34 -0800
X-CSE-ConnectionGUID: Uj68rTtiRrO4m/JPzNuLeA==
X-CSE-MsgGUID: qZ1ujXLdSJOKjK7iBHLsKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="198233142"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2025 16:20:32 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUZqg-000000008Mb-13pt;
	Sun, 14 Dec 2025 00:20:30 +0000
Date: Sun, 14 Dec 2025 08:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:ima-staging-v2-devel-v9 1/1]
 security/integrity/ima/ima_queue.c:43:22: error: array initializer must be
 an initializer list
Message-ID: <202512140857.bUlOioHX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux ima-staging-v2-devel-v9
head:   0387b5fab703d305adb5d6fcba119dda4cf2eb05
commit: 0387b5fab703d305adb5d6fcba119dda4cf2eb05 [1/1] ima: Add support for staging measurements for deletion and trimming
config: arm-randconfig-001-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140857.bUlOioHX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140857.bUlOioHX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140857.bUlOioHX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/integrity/ima/ima_queue.c:43:22: error: array initializer must be an initializer list
      43 | static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
         |                      ^
>> security/integrity/ima/ima_queue.c:44:22: error: redefinition of 'binary_runtime_size' with a different type: 'unsigned long[2]' vs 'unsigned long[0]'
      44 | static unsigned long binary_runtime_size[BINARY_SIZE_FULL] = ULONG_MAX;
         |                      ^
   security/integrity/ima/ima_queue.c:43:22: note: previous definition is here
      43 | static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
         |                      ^
   security/integrity/ima/ima_queue.c:45:22: error: redefinition of 'binary_runtime_size' with a different type: 'unsigned long[1]' vs 'unsigned long[0]'
      45 | static unsigned long binary_runtime_size[BINARY_SIZE_STAGED] = ULONG_MAX;
         |                      ^
   security/integrity/ima/ima_queue.c:43:22: note: previous definition is here
      43 | static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
         |                      ^
   security/integrity/ima/ima_queue.c:137:6: warning: array index 2 is past the end of the array (that has type 'unsigned long[0]') [-Warray-bounds]
     137 |         if (binary_runtime_size[BINARY_SIZE_FULL] != ULONG_MAX) {
         |             ^                   ~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_queue.c:43:1: note: array 'binary_runtime_size' declared here
      43 | static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
         | ^
   security/integrity/ima/ima_queue.c:270:4: warning: array index 0 is past the end of the array (that has type 'unsigned long[0]') [-Warray-bounds]
     270 |                         binary_runtime_size[BINARY_SIZE] = 0;
         |                         ^                   ~~~~~~~~~~~
   security/integrity/ima/ima_queue.c:43:1: note: array 'binary_runtime_size' declared here
      43 | static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
         | ^
   security/integrity/ima/ima_queue.c:275:5: warning: array index 1 is past the end of the array (that has type 'unsigned long[0]') [-Warray-bounds]
     275 |                                 binary_runtime_size[BINARY_SIZE_STAGED] = 0;
         |                                 ^                   ~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_queue.c:43:1: note: array 'binary_runtime_size' declared here
      43 | static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
         | ^
   security/integrity/ima/ima_queue.c:293:5: warning: array index 1 is past the end of the array (that has type 'unsigned long[0]') [-Warray-bounds]
     293 |                                 binary_runtime_size[BINARY_SIZE_STAGED] -=
         |                                 ^                   ~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_queue.c:43:1: note: array 'binary_runtime_size' declared here
      43 | static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
         | ^
   security/integrity/ima/ima_queue.c:300:4: warning: array index 0 is past the end of the array (that has type 'unsigned long[0]') [-Warray-bounds]
     300 |                         binary_runtime_size[BINARY_SIZE] -= to_remove;
         |                         ^                   ~~~~~~~~~~~
   security/integrity/ima/ima_queue.c:43:1: note: array 'binary_runtime_size' declared here
      43 | static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
         | ^
   security/integrity/ima/ima_queue.c:335:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[0]') [-Warray-bounds]
     335 |                         binary_runtime_size[BINARY_SIZE_STAGED] = 0;
         |                         ^                   ~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_queue.c:43:1: note: array 'binary_runtime_size' declared here
      43 | static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
         | ^
   6 warnings and 3 errors generated.


vim +43 security/integrity/ima/ima_queue.c

    35	
    36	LIST_HEAD(ima_measurements);	/* list of all measurements */
    37	LIST_HEAD(ima_measurements_staged); /* list of staged measurements */
    38	static LIST_HEAD(ima_measurements_trim); /* list of measurements to trim */
    39	bool ima_measurements_staged_exist; /* If there are staged measurements */
    40	#ifdef CONFIG_IMA_KEXEC
    41	static unsigned long binary_runtime_size[BINARY__LAST];
    42	#else
  > 43	static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
  > 44	static unsigned long binary_runtime_size[BINARY_SIZE_FULL] = ULONG_MAX;
    45	static unsigned long binary_runtime_size[BINARY_SIZE_STAGED] = ULONG_MAX;
    46	#endif
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
