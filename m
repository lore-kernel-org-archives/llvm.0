Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551011A3166;
	Mon, 22 Dec 2025 14:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766412696; cv=none; b=Ewpd9kJbzfkVs6hTn/sHNFblPOSCQpdmzciOUnriwms5sBpViGCXwbV5pd7SYUyAo54/lrKL8HqmMXRRAhwTOAzQBxCr1G2Qcicoyt8Rwm098pebo68jnM7lPlZy1AvYlmCwSVNdZ0RlfjQKk76DBprePsO3KO7wvHnpUrTk9/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766412696; c=relaxed/simple;
	bh=xr3xUIT2dYTC1L9Xmoxk2nBdbzJKvfB5hf+CA8iHuRg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nh1cgExUVCHiAHd+1dOEST9UXC/ghEQTsyURz2eTfNjlNJ7iDi6Vp99VFqEYgIt1nXNUfBEKcptfeb9ROLoAOStTkxNmlqhyDWNcsH5Eq2vssLWWehJFQljJQeFkgmJn7Ssl9k+s6puqb3mazJV1TmW0hBVOsO8kMbgPMo4jK1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPLNYdvM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPLNYdvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766412694; x=1797948694;
  h=date:from:to:cc:subject:message-id;
  bh=xr3xUIT2dYTC1L9Xmoxk2nBdbzJKvfB5hf+CA8iHuRg=;
  b=kPLNYdvMKgGOHnK/VRfjw6DMa6oEBVyBoiStTyStAWH5OiLKfI4XL3BS
   0A/2tHYgEUfCr7hrpy7PVR+3CQ1FZL9XS4Z2MlUwEeMAnW/AUDy9vLk7c
   vWj1AnZftnXIXv7PiYMzX7XYz7BpJ4aTNsR8WmMRB3rxmdvXrpbq6utv7
   WU12unj743gfE5rsqqw85kXm/v0Rtvf8ThVuEwOb5ry5xqCIHvPnC9iPM
   9hSjjnFOkYBP1FxFk9mpIbxS3nX1bCXW+0IsQeYKnjuZk2yEPnaW6uQWJ
   ot7j8+Po51npTdVLv6HTstWP61AAHAQUj5y333RARc0RwS46yuPYeq62j
   w==;
X-CSE-ConnectionGUID: ymUqzznlSRK8BRPJoNYsjA==
X-CSE-MsgGUID: 1cxsyfy6QcS/yYd0iSp3RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="67258312"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="67258312"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:11:32 -0800
X-CSE-ConnectionGUID: tPOF6+A2QC638luo7Op73g==
X-CSE-MsgGUID: 6sDwEglPS0mXWHQreV6S+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="236955462"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Dec 2025 06:11:31 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXgdD-000000000fF-21mR;
	Mon, 22 Dec 2025 14:11:27 +0000
Date: Mon, 22 Dec 2025 22:11:10 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:locking/core 34/39] WARNING: modpost: EXPORT
 symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol
 will not be versioned.
Message-ID: <202512222219.F6EkVNmQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   77b4ebc9e43b02f3c50dab48963d969964ea83ef
commit: ee771bab5add646af678f7a40b6272c21a0964d7 [34/39] stackdepot: Enable context analysis
config: s390-defconfig (https://download.01.org/0day-ci/archive/20251222/202512222219.F6EkVNmQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 185f5fd5ce4c65116ca8cf6df467a682ef090499)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222219.F6EkVNmQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222219.F6EkVNmQ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: EXPORT symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol will not be versioned.
Is "stack_depot_save_flags" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "stack_depot_save" [vmlinux] version generation failed, symbol will not be versioned.
Is "stack_depot_save" prototyped in <asm/asm-prototypes.h>?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
