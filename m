Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFD982C60;
	Sat, 19 Apr 2025 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745057722; cv=none; b=otJJs8EZSpKP5LfItS1PyiaBbLDNRsKaGdFyDGJ2piAGwF1GKiTsUfMG94eVEgWaSGI81o0//9FTMmLQRUGaca+fYGD7371j3/w8doC8StyxGw41UsrdFxquQnM7zNHG/67fRhuqla+lZa9QcB2+7OzTx1oc7zbVfp96ZK8Kca0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745057722; c=relaxed/simple;
	bh=g6+kFeQoubcZYULFGICuNx5srhbeObkeMgeGHTjSLN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KmXZE67WSaQBF5TA1WKrnlfgFM41LEenqwVUN+ZUEfehnUWV9AUs/IdXQBzPQfk8qv2n9KX6ag4Df1kHGbZ2CiGow6rsl0dQwmR7fjqaNN9ffiqMTQsthH8vEe0MJTG0NrqAMknlrUNzSE20zdb3H+X4ClQZF4gUagLIdMb0PIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jw6oX+fb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jw6oX+fb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745057720; x=1776593720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g6+kFeQoubcZYULFGICuNx5srhbeObkeMgeGHTjSLN0=;
  b=jw6oX+fbbB9Xr9kRHJtvsw2rrYuv+q7Rr41/snpqbdAS0lekAP37lqx/
   fPmeZKCX9OU5m7urGHk+gzU9HhsFL1Xj3njsfBUxcp9GuLpZwFHV4zTCh
   R/gf6E080AuUJQ9Afm51fro2YKmVGle11DzGAbJemdcswqSYKI0R3U1tN
   POJNKflfNsf39LhmQI/M8H/Mw38bhu8s7MGxy/c8MbJlD+vqOX7Q7Ry/f
   ITBAzG4mt9m2pIBBTov/Kxgi51kNZJNCFrvdNTA4hRV+q2LUS4DEtcTig
   sFVc0qjLWrbmb07ruuiLnvf814t0bhhYPs8CJ9YQyQqmZOHAZ1j6/Iphr
   Q==;
X-CSE-ConnectionGUID: lLIeeYl1QT+dO+8mn2Gs9Q==
X-CSE-MsgGUID: 1nSH+UU2TqWDM+mXIvUtnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46589030"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="46589030"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 03:15:19 -0700
X-CSE-ConnectionGUID: 6zt2Bim7SLGrhYOSypg1Vg==
X-CSE-MsgGUID: PV9Sw1/cSzeHMmUEisKCNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="136287812"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Apr 2025 03:15:17 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u65EA-0003mr-2N;
	Sat, 19 Apr 2025 10:15:14 +0000
Date: Sat, 19 Apr 2025 18:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [akpm-mm:mm-unstable 25/176] arch/x86/kernel/vmlinux.lds.S:476:1:
 warning: '/*' within block comment
Message-ID: <202504191813.4r9H6Glt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   dc683247117ee018e5da6b04f1c499acdc2a1418
commit: 05d94eeb2ac3d97760162ceaa779c03a479a8fb9 [25/176] x86-disable-image-size-check-for-test-builds-fix
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250419/202504191813.4r9H6Glt-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504191813.4r9H6Glt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504191813.4r9H6Glt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/vmlinux.lds.S:476:1: warning: '/*' within block comment [-Wcomment]
     476 | /*
         | ^
   1 warning generated.


vim +476 arch/x86/kernel/vmlinux.lds.S

   467	
   468	/*
   469	 * COMPILE_TEST kernels can be large - CONFIG_KASAN, for example, can cause
   470	 * this.  Let's assume that nobody will be running a COMPILE_TEST kernel and
   471	 * let's assert that fuller build coverage is more valuable than being able to
   472	 * run a COMPILE_TEST kernel.
   473	 */
   474	#ifndef CONFIG_COMPILE_TEST
   475	/*
 > 476	/*
   477	 * The ASSERT() sync to . is intentional, for binutils 2.14 compatibility:
   478	 */
   479	. = ASSERT((_end - LOAD_OFFSET <= KERNEL_IMAGE_SIZE),
   480		   "kernel image bigger than KERNEL_IMAGE_SIZE");
   481	#endif
   482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
