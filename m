Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4025B156980;
	Fri, 31 May 2024 11:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717153534; cv=none; b=FU+ME7jI8GxIY889RoeOiXOCA2/GczK3/ya2JPFbxovoEuE8dANemtIokVGDygLXVBWhoqmnlbE3kW5QbO2tz6BwHWi5hhnW90nhPbPLmiU1SFTbxa6tKhYNuiuNL1RrX5+30dhdghbcWQw1D/VwDfutL8Q1lugZryfDHFLt0fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717153534; c=relaxed/simple;
	bh=ZyecDIKoSox7mvE39JyeB5ojoCmugUiwm0pK03F+PjU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bwH7xHmZbSf4i8rnp4tZGv5gULz8A7HQCTbw9gk81BxEPZyReAPY0+j7q5JQGot5JAKMWreib2x+X60SD4Lx8ona3W9xPTiU0iMR3356vdrbdtfKKrmO5+uMzwlUDgO91qlq2MbejMwcG9QIFQ9FRQkXNN7r2+hiXGudXUZ9SlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HaAQLsfv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaAQLsfv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717153533; x=1748689533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZyecDIKoSox7mvE39JyeB5ojoCmugUiwm0pK03F+PjU=;
  b=HaAQLsfvXS+DGomsuKhQj8H0k+lByeD0zRy5YoMRDtu9SbFeVTlgbGh8
   ZEnLHdfxgAiknvyfMuLVRBRGKCajwemOGyEhMYO1OblyhpMotNmt83OrS
   8hwwWS9trOVHbH/UKnArm9oZ9UMCoCwQ6/vrebknTL61bqBAREb5Ambgp
   7LsVOkAKkgzw7a2/G0xz9yDZTseQW0Z3NUWsnbfmgRc41yVaEquui3QJS
   Z+S4isQmXtAwIE73KLXC1qQw7APZLXaILUhsrtH6N5P7eyuDtcbcsCMJz
   ZHUSiu6vsx8IO/+gnOETIC6UR9jxUGWficE9Nw4GAGaHBTTdFjS19x9Ag
   g==;
X-CSE-ConnectionGUID: 86gNaSrjTKmzBdLK4foL2Q==
X-CSE-MsgGUID: QHeDiE/PTuuiM0d3SyLOeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24253197"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="24253197"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 04:05:32 -0700
X-CSE-ConnectionGUID: fZ8PIxDiRNSvqyLkTIyhng==
X-CSE-MsgGUID: 7oPbUk4UTueP92dT6acbzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="36080962"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 31 May 2024 04:05:31 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD04Z-000Gyd-1W;
	Fri, 31 May 2024 11:05:26 +0000
Date: Fri, 31 May 2024 19:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:struct-device 4/25] ld.lld: error: undefined symbol:
 to_node
Message-ID: <202405311824.puKITVS8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux struct-device
head:   2dbb1fcf83b9b3edac443981ac46cab63e9c5c3b
commit: 8b7f4e4c8a97d8102bd7cfad3d3fbdaf432e1140 [4/25] memory-node-dbg
config: arm64-randconfig-002-20240531 (https://download.01.org/0day-ci/archive/20240531/202405311824.puKITVS8-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311824.puKITVS8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311824.puKITVS8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: to_node
   >>> referenced by memory-failure.c
   >>>               mm/memory-failure.o:(total_show) in archive vmlinux.a
   >>> referenced by memory-failure.c
   >>>               mm/memory-failure.o:(ignored_show) in archive vmlinux.a
   >>> referenced by memory-failure.c
   >>>               mm/memory-failure.o:(failed_show) in archive vmlinux.a
   >>> referenced 2 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
