Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92D5192D8C;
	Tue, 26 Nov 2024 10:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732615952; cv=none; b=cL7Qro9nmHYXJk4koDZzWI2wwtC71n0O4vB3bxLzptTRRds1e+j/V/dVdjkQ5fqAbLMKeubOWcj8o1gDiCCDYtWEspOgi/9tDLUD74lKJH7sFkcisjU8Jj8ya0Q5Qe34FRAi0jiVYafyeD29Tm3BX81p8cLI7LT1+V8xtz+NmmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732615952; c=relaxed/simple;
	bh=zqhKKDHSAXTBHHcOD3jaTFD/NcswzxTqdn6G5akxk3w=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oinNxdqOhOC0iswKYLPWqa5+Tu9ut7KqBKzONmsjCq/dR93qCwup0xSi6xWUR4Feyi3SPOFJwdXzxlCeYNCpKowxCrJLCpnkSIChBNW7ji3SUmdH5PQVZgrKq8Lq1fTN1jmSlts7bR6olSowL4dHbhs2VfVAYA8R0VdI+Q6jcKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QcHlK3RZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QcHlK3RZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732615951; x=1764151951;
  h=date:from:cc:subject:message-id:mime-version;
  bh=zqhKKDHSAXTBHHcOD3jaTFD/NcswzxTqdn6G5akxk3w=;
  b=QcHlK3RZp5L5m7fcAEG0VBFdT2zszL4UDEimRkaXEOmvnbrtDSQwfJKr
   b7d/yfEAqNVgkP+5Mmif6w5yTCqQ3vm2viWmP1/inFr1P9UTAwIw0yKD4
   MON33JVq2GiPNbmJ4MwMxY/iY9jjW8FOsSetNEN6L72dPryZ7QgsQGgdx
   hSn8LWVRNwFjfw7lpWZXyd0WY6I+iM/z3AyoBDdv4+5TNXRbl3I/263dJ
   sqZS2mRmurPqyQ34wZeIfisVgIw05vLNb/j1/xJW7wuigXC6tP2Da2sPF
   6gxjIsOc++mP+PA6GFX1Zxuht0kD5CDwqklWVJobGl3bJDnDtiIFC8PrJ
   w==;
X-CSE-ConnectionGUID: yTZjI+W6RRaSoqFwSLXNyA==
X-CSE-MsgGUID: jk8r/q1FRwyWn8Neq8dtag==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="33020504"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="33020504"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 02:12:17 -0800
X-CSE-ConnectionGUID: Vog0wDu9TF+UE6uY+HQRtw==
X-CSE-MsgGUID: Gk3acMXHQrGvEkGXztwJ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="91379950"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Nov 2024 02:12:16 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFsYI-0007DV-09;
	Tue, 26 Nov 2024 10:12:14 +0000
Date: Tue, 26 Nov 2024 18:11:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/gpu/drm/imx/ipuv3/imx-tve.o: warning: objtool:
 clk_tve_di_recalc_rate+0x29: can't find switch jump table
Message-ID: <202411261801.pxGG2YxY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Breno Leitao <leitao@debian.org>
CC: Ingo Molnar <mingo@kernel.org>
CC: Ariel Miculas <amiculas@cisco.com>

Hi Breno,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
commit: aefb2f2e619b6c334bcb31de830aa00ba0b11129 x86/bugs: Rename CONFIG_RETPOLINE            => CONFIG_MITIGATION_RETPOLINE
date:   11 months ago
config: x86_64-buildonly-randconfig-005-20241126 (https://download.01.org/0day-ci/archive/20241126/202411261801.pxGG2YxY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411261801.pxGG2YxY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261801.pxGG2YxY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/imx/ipuv3/imx-tve.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> drivers/gpu/drm/imx/ipuv3/imx-tve.o: warning: objtool: clk_tve_di_recalc_rate+0x29: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
