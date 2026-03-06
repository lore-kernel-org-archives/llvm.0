Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C722317141;
	Fri,  6 Mar 2026 01:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772761193; cv=none; b=Y8bVQC3ShdZ5pR6P6q8TKmcvIg4lv6Jw8l7U84Qg6r8dzB/Khlwre5y2GZx+Mm/ON68kTS6jW0+dXNz9h4gQ1dV4mFXto+S74gMPAW/YFuIHKhyh9jxIBm+9qfYY2OwgQSwFeQ2UOfDJEuEdUMj0BpNm7LIHIxDGeQBzHy9IddQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772761193; c=relaxed/simple;
	bh=R78vpn263q+1xf8ppd+Qcrp2QmiTcXl+0pvZHnmLf7g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SGv0JmvZewh3peZ0DJcG7Srqr4+kj8BKSMFxPZu2830FSOa99Y8JViRjGOUbNDovNJBvT9H9ej7tD61ZHEUklV64skX2crnKypIgPAB4CURZ4rCMmCPuMl6OCk1qELp1c4kfUUZPI3kN4CMI9AVOjk4dGz/VRlcBae5dDZdMG5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3YFaeB0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3YFaeB0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772761193; x=1804297193;
  h=date:from:to:cc:subject:message-id;
  bh=R78vpn263q+1xf8ppd+Qcrp2QmiTcXl+0pvZHnmLf7g=;
  b=J3YFaeB0yR40eMHXs5T2CPUsJJhuJkLXeWVEruWg1HlBmGHVDpaf5Ytx
   v9QvFI38+53sAy6ZzpXyIOrjMqkC/5TzdtRvdpS5zXhMWrO7FI8S/XKii
   NUXwcbU3GEcPk1lPNKVnVEiIbvlxbhqMar5aMeUAZFBjpaDLfH60n805u
   ubdyBmRMnzGlNHpxok0z8i9+Qh4Udbwcg3VHwDP4kjLgAlweQ6SdXCNmS
   uhkPsrlgt05mRL3Pmctn7T3yi3hKhaajoMhRXjHaTlSj1TZhH5IgqAb+j
   S2q5D5UnB8WNpoSYc+sYmmuABcAassdVCiwJjjVhvZCO9YUL3fIGS0gu9
   g==;
X-CSE-ConnectionGUID: 2oSoIMSsT/y5m+Yiq73WTw==
X-CSE-MsgGUID: rYKvyPDaTGS20Z8/Khq9bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77467089"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="77467089"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 17:39:52 -0800
X-CSE-ConnectionGUID: /a22Zii3TQGk122R6i0tsA==
X-CSE-MsgGUID: dHPwm/5RTh6FN47C4lov0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223821272"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Mar 2026 17:39:50 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyKAO-0000000027l-0NVK;
	Fri, 06 Mar 2026 01:39:48 +0000
Date: Fri, 06 Mar 2026 02:39:07 +0100
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rppt:free-late/v0.1 7/7] WARNING: modpost: vmlinux: section
 mismatch in reference: memblock_phys_free+0x99 (section: .text) ->
 memblock_free_late (section: .init.text)
Message-ID: <202603060233.txFFLX2N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git free-late/v0.1
head:   57b25b03a9652c639d3c8e9004a542ef17db0cd3
commit: 57b25b03a9652c639d3c8e9004a542ef17db0cd3 [7/7] dev: memblock, treewide: don't call memblock_free_late()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260306/202603060233.txFFLX2N-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060233.txFFLX2N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060233.txFFLX2N-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: memblock_phys_free+0x99 (section: .text) -> memblock_free_late (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
