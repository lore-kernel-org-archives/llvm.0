Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD1C35FF50;
	Tue, 24 Mar 2026 00:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774312891; cv=none; b=CgX09BVgmyj88LLhG/QC6d8Y+53aiVec7XE/P3JBQCLlgG5NQLCMvutLbyBnEHivWmCugFR4btFg1wAlwLPLsAbKyfbtvsJnd3ioRXAB0gwotaeoxlYeRu+I0HDtyfJmjP0LW1e36TZggEE17q3TvG1/vEZqS/x3/8eiZlRDgGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774312891; c=relaxed/simple;
	bh=TPjXi71zULSBjNLyhUEDsi1UEdvuYuaWW/OCcZ/RGZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VtuCIiHDu7iF33vKcvuOtaiWfccfhExwEuA/jKaehzyKTx1T4lLPs9jcPT3rhZJTTwKFRQ+MkT3eCg7DIxIKgxUBH3Y0e1Dukr2Zc7b4vpDrRUEovFPi+DSDCI8c/h8L5g7xFUWEXDEoKyXPyOt6Yfo8UZcCVpcxe+n5avomKeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=doIlARDZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="doIlARDZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774312889; x=1805848889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TPjXi71zULSBjNLyhUEDsi1UEdvuYuaWW/OCcZ/RGZ4=;
  b=doIlARDZT31NDqkTR4faIlp4gEiZ3zqGVX2+LFVN1HU4/janu7MvCU2g
   rDNLR6hA2kAfsWEHeH2LwVOZ286uYypd1Fhuo32oFzlUGE9cq9oOz+bhl
   yX1KOgJPhFn0IhbdkDIYIGzIElQyewJqi12ggfYGu749iMQUMErSK7+mf
   Ah0LPaArvwUwrK2wXmE3tp2VnYUEOzJeHP/JLcIuLttmC+4HTRuKfLrIb
   cqHRuMDmQhiEx9NHhJRBDHr0Bp01VaSn2ymzDHpUrw38u2p44OwjS9xud
   hTcqAdDhGP+/5N360TVaVoagEOPqB/avUppKqXtKqlKwelrUEvDu6N3Zc
   Q==;
X-CSE-ConnectionGUID: AEM4bVRpRgq6SIXmpajRNw==
X-CSE-MsgGUID: i7MasoY7SY+cFPLNXu+cBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="78921093"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="78921093"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 17:41:28 -0700
X-CSE-ConnectionGUID: Xq+tKX0CRM2gqg4lVN2d7Q==
X-CSE-MsgGUID: vTscNUfOQJiSVw6lbnObeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247244495"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Mar 2026 17:41:27 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4ppl-000000003Sd-0ysh;
	Tue, 24 Mar 2026 00:41:25 +0000
Date: Tue, 24 Mar 2026 08:40:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 18/44]
 kernel/time/benchmarks-user.c:3:10: fatal error: 'err.h' file not found
Message-ID: <202603240857.agD2WmPk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   b5f216d75bdbbafb19ea7d79a607512cecaea2c0
commit: a876a196200710a8666ee1bd58be19f1e08fa5fb [18/44] benchmarks
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260324/202603240857.agD2WmPk-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240857.agD2WmPk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240857.agD2WmPk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/benchmarks-user.c:3:10: fatal error: 'err.h' file not found
       3 | #include <err.h>
         |          ^~~~~~~
   1 error generated.


vim +3 kernel/time/benchmarks-user.c

     2	
   > 3	#include <err.h>
     4	#include <unistd.h>
     5	#include <stdio.h>
     6	#include <sys/types.h>
     7	#include <errno.h>
     8	#include <stdlib.h>
     9	#include <signal.h>
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
