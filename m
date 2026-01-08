Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101652FDC4D;
	Thu,  8 Jan 2026 14:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767884335; cv=none; b=cVVPJFU24fuhlx0aDxc0S5r6FDqVo3adDwlU3As2ySis8V8sCq+W6w+t3Gc0lcmPcp63nvJo6GzSVmY/pffZA7CZKP7aZ4LHl3hEU4s7HwagBAFWw+9t2UmDIPyN77hLT+oi7tW/RNfLKogmP3rH3qQtpzWYZfPZqfPI2qxjBmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767884335; c=relaxed/simple;
	bh=sNGYmN/B5LAUwAMWMVyguBwnZcjALtRWtVK8R7NuSgA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PCAPDjDVX+ySyu+Bey8Gx6ul64rLT9P26EEoPUz/WXo11EQectZP/oUGGbcaiZzlt1WyxPXCQ8tlyxIhcxKlxGqJ3vEGMaVpQF6LJM/MTQtovSgfBd7CzNuIJWKgF7bdZJdvGCF0/8/kRfcw8QcMYn6M8LG55h19aPdWrxkC92Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PrnU7EEz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PrnU7EEz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767884333; x=1799420333;
  h=date:from:to:cc:subject:message-id;
  bh=sNGYmN/B5LAUwAMWMVyguBwnZcjALtRWtVK8R7NuSgA=;
  b=PrnU7EEzkTytw4urI+QyWfN4yhKy2TMahKe9VRrKCq1Be/mg8xPCj8FP
   8w9eSSfioO+UAoF6IEg1ahycAv71T1Gm65b6/9dADNxJqo4+Ur4Vd5N+J
   HlNXI9onm+SEmwej5/I9J+H3OGKQc7UK0QAKcEAd9O1U/6DwsKrZd30wT
   j5sS0G7Fr/+YwEfk6WXildb1gwsNKTL9CLbTejYTLaPxyLKrWotEuKKG8
   a1PEa1KQXUdROnooro8YSKRAoFaG+R8LxnLipQpyghFnD4iZN41PJYZEA
   ccGu9iS9YQruF6WZ3m4KytI70i3EAghDJZpiNxShr8zLbVQ6JtoPZkV9G
   w==;
X-CSE-ConnectionGUID: oCgH7pHRQL+dRq/CmxCwKg==
X-CSE-MsgGUID: nJom/bhkRUiIwsA2PjNLgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="91924667"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="91924667"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 06:58:52 -0800
X-CSE-ConnectionGUID: ls7HH49WS2uyYBqp4kLlZg==
X-CSE-MsgGUID: V8nKA+ekQumKlIOsriG48Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203241235"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Jan 2026 06:58:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdrTM-000000004rE-2QDV;
	Thu, 08 Jan 2026 14:58:48 +0000
Date: Thu, 08 Jan 2026 22:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v6 7/9] ERROR:
 modpost: "cxl_unregister_private_region" [drivers/cxl/core/cxl_core.ko]
 undefined!
Message-ID: <202601082241.W5LxaaAG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v6
head:   75ba13ddb1f86035a0a20a211670b7a2dceb852c
commit: d88349108091308b791e4af323b4cb02400f0703 [7/9] drivers/cxl/core/region: add private_region
config: loongarch-randconfig-001-20260108 (https://download.01.org/0day-ci/archive/20260108/202601082241.W5LxaaAG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601082241.W5LxaaAG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601082241.W5LxaaAG-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "cxl_unregister_private_region" [drivers/cxl/core/cxl_core.ko] undefined!
>> ERROR: modpost: "dev_attr_private_type" [drivers/cxl/core/cxl_core.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
