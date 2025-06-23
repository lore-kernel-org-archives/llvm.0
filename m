Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5258C248894;
	Mon, 23 Jun 2025 17:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750698472; cv=none; b=TcM/oNRt9iTKwDheS3yJMpI7MEv3PUNfGUSoz7fUr4nLBnONqcVA0dqfJ8ndk54hwJmOGSk0+uB6nbH5gunW0q6+f+BwgI/yGNbyYNJgH/GcvajNQnz4OMHMbQOiIHZwxQFlvnT43zXn24P5pxG/vLoJyXnVc9Fh57Q94WXncBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750698472; c=relaxed/simple;
	bh=Yd/NKEf5gVNrLUPXQ5CQD5ocnIE6SY53Rzs5fNfyDxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=suXPFGaBjPApFQ56JacqDmL0rQGZsJNvVNdKMlUftsAF2y4ztZExq/Y1Q3DSChwn/YdG+lgA24Iv+gHUBrCBIAuQcxvuujbg8Wi7waMYotLL7knnQYYdoiUvrp3UHG4V22O0EOQvNxNU1rowGqkdVB+0VHmUExdPvaUzxbutScc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpbP5EUI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpbP5EUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750698471; x=1782234471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yd/NKEf5gVNrLUPXQ5CQD5ocnIE6SY53Rzs5fNfyDxE=;
  b=VpbP5EUIV6zou0bhqiWFJbVoG/b3a2gOBIIJNZBanjTKlGIRhd8/0Ajp
   izJcWwYNzi9F/ebPCSbrnA2hAozELAu3Q3hWtm/8/4O0WeKnW3M6FvdkA
   z/JJbhFo58YGLSNw7aIb2sD8LYfawJIxQQIFwcWVKz3g0UrLjlYoLSsEL
   6BvLVzOkqkCu52T5Mi4rLdh/Yne9l8mrrPm74JpKFF+3627mfO/HeeLDc
   akbRfw2erbUJJok5teYZXO/Cf5lEew/Z0VtBj2H1u9we4KzcAUDGE00hI
   aSTE4aVRYQLvR1GrC6ZLxRA18tYwYOJ9RF5J02YTeW19t0onMEHYxTmAA
   Q==;
X-CSE-ConnectionGUID: CyqYgOygQTqS8aEW5RNz+g==
X-CSE-MsgGUID: YSrw4MzJSnO28xMKECWe3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56694224"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="56694224"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 10:07:50 -0700
X-CSE-ConnectionGUID: XozUv+XSS2epa+w1vKmkQg==
X-CSE-MsgGUID: O4r8GYeISA2KLu+sKvZHhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="151955576"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jun 2025 10:07:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTke2-000P8q-1w;
	Mon, 23 Jun 2025 17:07:46 +0000
Date: Tue, 24 Jun 2025 01:06:56 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks-v6.16-rc1 17/17]
 ld.lld: error: undefined symbol: switch_sync_to_task_stack
Message-ID: <202506240034.kwvn7kin-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks-v6.16-rc1
head:   33ef63a7c0e32a62ed9f8281ef42cca1b7dd0ff3
commit: 33ef63a7c0e32a62ed9f8281ef42cca1b7dd0ff3 [17/17] arm64: Support dynamic kernel stacks
config: arm64-randconfig-004-20250623 (https://download.01.org/0day-ci/archive/20250624/202506240034.kwvn7kin-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240034.kwvn7kin-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240034.kwvn7kin-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: switch_sync_to_task_stack
   >>> referenced by arch/arm64/kernel/entry.o:(_kprobe_blacklist+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
