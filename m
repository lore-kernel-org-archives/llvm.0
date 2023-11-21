Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8114207A;
	Tue, 21 Nov 2023 20:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/z61s5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700597117; x=1732133117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5gAvxm4/7KiptJjPowgP3EKHmQ+fF11sSqgWEbTteY8=;
  b=J/z61s5kf03S5tePy+8YV0GA3FWlnNtCdf0dpBJ0Fyihb/e0s7pu3mkp
   l1tV9Cq6FV5WyVDI5QsT9imrDZSdnLK7rij8ccFLOJJcnlKOzwtkyYPyd
   S8AbTLsbR1n29saka7VNgxb3GrU+I/P0UO0pqi4cyLzv9I/J3ZWs9N1Ka
   x5TPDkTP4uOEcuDWJgR47moR/MLEy9dMnqYD5t7UbzRFPHo9dej2Me25h
   vpY3iruklfsjcOUwUzdqiRCOR5YPyTIJJwBRANgNBdmeOW9EX2AWqbAcv
   xHv26M2MKixVZiWOxk3ygZOZFSHy2KaUivdeOmdnW0RMWQTxTXxcIE+Yw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="391691349"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="391691349"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 12:05:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="760214720"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="760214720"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Nov 2023 12:05:12 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5Wzd-0008Cs-2k;
	Tue, 21 Nov 2023 20:05:09 +0000
Date: Wed, 22 Nov 2023 04:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH v5 4/4] drm/i915/display: Split i915 specific
 code away from intel_fb.c
Message-ID: <202311220315.YZAdz5tr-lkp@intel.com>
References: <20231121112729.4191245-5-jouni.hogander@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121112729.4191245-5-jouni.hogander@intel.com>

Hi Jouni,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jouni-H-gander/drm-i915-display-use-intel_bo_to_drm_bo-in-intel_fb-c/20231121-193155
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20231121112729.4191245-5-jouni.hogander%40intel.com
patch subject: [Intel-gfx] [PATCH v5 4/4] drm/i915/display: Split i915 specific code away from intel_fb.c
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231122/202311220315.YZAdz5tr-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220315.YZAdz5tr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311220315.YZAdz5tr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[7]: *** No rule to make target 'drivers/gpu/drm/i915/display/intel_fb_bo.o', needed by 'drivers/gpu/drm/i915/built-in.a'.
   make[7]: *** [scripts/Makefile.build:243: drivers/gpu/drm/i915/display/intel_fb.o] Error 1
   make[7]: Target 'drivers/gpu/drm/i915/' not remade because of errors.
--
>> drivers/gpu/drm/i915/display/intel_fb.c:17:10: fatal error: 'intel_fb_bo.h' file not found
   #include "intel_fb_bo.h"
            ^~~~~~~~~~~~~~~
   1 error generated.


vim +17 drivers/gpu/drm/i915/display/intel_fb.c

    11	
    12	#include "i915_drv.h"
    13	#include "intel_display.h"
    14	#include "intel_display_types.h"
    15	#include "intel_dpt.h"
    16	#include "intel_fb.h"
  > 17	#include "intel_fb_bo.h"
    18	#include "intel_frontbuffer.h"
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
