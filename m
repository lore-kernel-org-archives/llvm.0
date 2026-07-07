Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84943A0EB8;
	Tue,  7 Jul 2026 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416914; cv=none; b=F5QrkzfqD/AsEaOSebfzXhPaUxkj1wgmKQy1Lc0xKBA+lPL03b8+VMovw8GWxIUfey9Z6ou07lruDIHuqh1yw5PUESOkRaxpk/mN38+PPwPYrfcSiu6gfKqkYUirs2XtEAF57L5tDtGPD2H3hVQD6qEIG9fBTWOG/iWbWKBi9Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416914; c=relaxed/simple;
	bh=zh6bfRZDR21O0hQCv9y1kWHf08ejX5KBHXPErVczrlA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iPexK9AS+WqGzlyZptcu74QY81fNalo8+bZSJLJrRcRkDfNysW13WPumRRrlCavl4MRpW/78008xi4isWqhyfPtrqvEcCPEoFnBNItq9XpKdyV3hNYDR5E2/anHCu3ttgNQjALhblUZn3VVDORM34p9oPmDJMkuW919JUR8Xy98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WRNvHVBI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRNvHVBI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783416913; x=1814952913;
  h=date:from:to:cc:subject:message-id;
  bh=zh6bfRZDR21O0hQCv9y1kWHf08ejX5KBHXPErVczrlA=;
  b=WRNvHVBIH84/QlJwjBVIj43LZ5qEuv6D8B1+21Ds2NktoQhKiyBJfF+C
   r4PQPH/x15RL/HOjBXf/u48Qk0tXE4xJ2n2zhDHFueisfhEJ8dAzTViEb
   2OXVT/Gx/6XERwpGlsTPdldXOWEdrRONSiq9najyY1z/1nLWff8MLMBB1
   zv3PonEKRh931fz43CfL9qyEfZ5nV1AdotospIfYcJV32MCVoEn6lAGzn
   s/GWmrB1pISvc0Cy0usmJ7JT0ltIamzBJfTx0mJPfNFfMbpWFQF43Bc4Q
   NAgIxEUpp6KqecxfYnkI45R2WFwvvJ3UTjGg0iqZTAShB26AQhDw0/3GO
   g==;
X-CSE-ConnectionGUID: APrcuUEAQImY1ckJrEqwzw==
X-CSE-MsgGUID: CH7LHCVXQfS2hF+II4ITNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="71580926"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="71580926"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:35:12 -0700
X-CSE-ConnectionGUID: LaDsnf7jTqKJ+07SmPCEUA==
X-CSE-MsgGUID: IkVccCUeSOiKf12FJp4rRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="278319047"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jul 2026 02:35:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wh2Cq-00000000FCf-1kS4;
	Tue, 07 Jul 2026 09:35:08 +0000
Date: Tue, 07 Jul 2026 17:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Polensky <japo@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>
Subject: warning: unstable feature specified for `-Ctarget-feature`:
 `backchain`
Message-ID: <202607071750.4f5d6hPj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: 3f70ebe638581e73c8df6b3fa7eed9b45d90b083 s390: Enable Rust support
date:   4 weeks ago
config: s390-randconfig-001-20260707 (https://download.01.org/0day-ci/archive/20260707/202607071750.4f5d6hPj-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607071750.4f5d6hPj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3f70ebe63858 ("s390: Enable Rust support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607071750.4f5d6hPj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unstable feature specified for `-Ctarget-feature`: `backchain`
   |
   = note: this feature is not stably supported; its behavior can change in the future

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
