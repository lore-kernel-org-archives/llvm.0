Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FC43C1F;
	Fri, 17 Oct 2025 07:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760686215; cv=none; b=GGO6gP0HybeUuysStFAKKyyx/rQ7OQOWsnhe46A5aB2PhnhWM+xCt+EssFG5MWa2L0zOsVWdzwVr6JEys/eXFuL0njfC6X4xo7LHg9lPu4/ZG9hTLRFYeNNQssZGpHio0e1PPncRJ798nENzsB52/hKJXlRnZC8FfJmm8oNDTrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760686215; c=relaxed/simple;
	bh=NdnacDFE0MaD8u20DR2+szurTVV7RgeK82cTD3saUdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dD66xXWFKGSR6PQSF6SJBMWu+MhWqO4567cGSyx1ZeBTCcorUEvpI3PT8pcB3rg31wwP5WaPjZ9MaJtPfKFxo/omL9yDgMIXdW8evoIr4R90ryJjWbtdRFbQv8SJsmrHT/nZZ2GBuz4JcCYoBV6UUfQv7WfT3Np9Z7P5v4CVC2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/B89fs0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/B89fs0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760686214; x=1792222214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NdnacDFE0MaD8u20DR2+szurTVV7RgeK82cTD3saUdc=;
  b=L/B89fs0xNSOtGYwiUGdT2KBkgdDRnT/aU7J48bzX6RKDC17YY6fnJ3y
   bxhqfDWf/pWUdb91liDnA6aEp5E+jbYcHCOXGrsgKQWYeUmOzTPvEyUxa
   xZSOomg+2odLMeo/14oT/pdFP/9JsxJRc5cFGQLFqPyl9lpd2DORn4vlv
   07ZCgge2RV3nnEMJHUwI/JcOwVPh7v5HBaRF+QNhBqdVncyGUW/r+Mw2H
   qEa0TQVk0QIebJNPJKrhxLBX/WV9j7inTGbIaRLTabvxiMAs3XX1XSZRE
   YClhagDQ3trOERVsFFFUk8ZMOggfUmlVD8ZR3C9tbDy/QTZnw8qBulA5Y
   A==;
X-CSE-ConnectionGUID: 4Lb5rlgDRkmx5P7nQWMDYw==
X-CSE-MsgGUID: ZQGFXjBbRaGKYH4UDsS4Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="88362382"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="88362382"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 00:30:14 -0700
X-CSE-ConnectionGUID: SBe2WfJaQzCenzcldM3M2Q==
X-CSE-MsgGUID: 96OQbVvMQnihCWUZ9srV3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="182221968"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 17 Oct 2025 00:30:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9eug-0005h6-1G;
	Fri, 17 Oct 2025 07:30:10 +0000
Date: Fri, 17 Oct 2025 15:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] selftests: complete kselftest include centralization
Message-ID: <202510171513.6IWk005g-lkp@intel.com>
References: <20251016104409.68985-1-reddybalavignesh9979@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016104409.68985-1-reddybalavignesh9979@gmail.com>

Hi Bala-Vignesh-Reddy,

kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/next]
[also build test ERROR on linus/master v6.18-rc1 next-20251016]
[cannot apply to shuah-kselftest/fixes akpm-mm/mm-everything tip/timers/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bala-Vignesh-Reddy/selftests-complete-kselftest-include-centralization/20251016-185024
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20251016104409.68985-1-reddybalavignesh9979%40gmail.com
patch subject: [PATCH v3] selftests: complete kselftest include centralization
config: i386-buildonly-randconfig-003-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171513.6IWk005g-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171513.6IWk005g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171513.6IWk005g-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from samples/vfs/test-list-all-mounts.c:11:
>> samples/vfs/../../tools/testing/selftests/pidfd/pidfd.h:28:10: fatal error: 'kselftest.h' file not found
      28 | #include "kselftest.h"
         |          ^~~~~~~~~~~~~
   1 error generated.


vim +28 samples/vfs/../../tools/testing/selftests/pidfd/pidfd.h

    27	
  > 28	#include "kselftest.h"
    29	#include "../clone3/clone3_selftests.h"
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
