Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665D02232A;
	Sun, 23 Jun 2024 20:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719176089; cv=none; b=WLXt0cdEM8PSU6UkNSCIXgcrmSF3jOx3AN+HclgoXTQWpfPIrduDgBSwaREfO4aVRpIHnIJQVP8rywr54rs8iNQPdOOZumgcncK0M21NyPxAvaGZ7CYVGYo7OrTPICDdjdfod4HxpTNnBYqr8hCGuGXa0XLbJ7IQu9Q5gVh0gyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719176089; c=relaxed/simple;
	bh=tCxCTrRC45tmA5IFi7TMZwDuyKeaBWpe+wBwXTO/8Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KZ30996RokO8Fo0lwFYpN5NbRqVc6P0SEnIF0AXkZkdeQ4wIoewMEPjPDbako/LCkLF9+FELtu3mrALikdxQst+weZSHDUnK8GRZ+TdeuovRoxb5pW3fpZ9xTdQmQPRiIC6AMsWnVTeCwe0cU0j2A82F4AxWieYyGQ2gPQRHPrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVapdSVg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVapdSVg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719176088; x=1750712088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tCxCTrRC45tmA5IFi7TMZwDuyKeaBWpe+wBwXTO/8Mc=;
  b=QVapdSVgrWwIJKgoZOCo1IhmmU2xgIlptg8gaEfbqcYd3Scxdy3nodeW
   aHt5qgYp7EaExHw9OOyNix4mu6qWmnnMAgBBJXxZ5VWOSgoIMBq5YCJun
   B5LsRwAqB4Jswh/uYgyHauxPrW7PIaAFfidQuseQJTCS2Id9aWmKdRuAD
   3X6690yM2jS289c8akH/+3u9GbIi7LSaJ7ZjjshCJEGp1/V6Xrez298EN
   7haXCJAqh2FpBud4HorcO5UHDj0CLgHUGGqgjWt7apnuAgZVFMCgxCLCw
   0YbgzilPyS1dX87FvS1xg0Ye31UXJAamyCdKAfGe25/+8XRMrODfGVqHQ
   Q==;
X-CSE-ConnectionGUID: 0s3ucC5nQ0ay67txlcS3PQ==
X-CSE-MsgGUID: /cZl8U92R++Lxnh8xOEEpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16277404"
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="16277404"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 13:54:47 -0700
X-CSE-ConnectionGUID: pyZU67P6Q8qYCsWCFleIBQ==
X-CSE-MsgGUID: m6tV+mPWQYaPci4IG7T/Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="66339310"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jun 2024 13:54:45 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLUEV-000BQ6-12;
	Sun, 23 Jun 2024 20:54:43 +0000
Date: Mon, 24 Jun 2024 04:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:vmclock 22/23] ./usr/include/linux/vmclock.h:43:8: error:
 redefinition of 'vmclock_abi'
Message-ID: <202406240430.BsnyDimG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux vmclock
head:   82fa887512d4454c5688220793d2696a8ad00710
commit: c7b4ad8c548d23293f55a82d7147a4a6440f7c69 [22/23] ptp: Add vDSO-style vmclock support
config: x86_64-buildonly-randconfig-004-20240623 (https://download.01.org/0day-ci/archive/20240624/202406240430.BsnyDimG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240624/202406240430.BsnyDimG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406240430.BsnyDimG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:2:
>> ./usr/include/linux/vmclock.h:43:8: error: redefinition of 'vmclock_abi'
      43 | struct vmclock_abi {
         |        ^
   <built-in>:1:10: note: './usr/include/linux/vmclock.h' included multiple times, additional include site here
       1 | #include "usr/include/linux/vmclock.h"
         |          ^
   <built-in>:2:10: note: './usr/include/linux/vmclock.h' included multiple times, additional include site here
       2 | #include "usr/include/linux/vmclock.h"
         |          ^
   ./usr/include/linux/vmclock.h:43:8: note: unguarded header; consider using #ifdef guards or #pragma once
      43 | struct vmclock_abi {
         |        ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
