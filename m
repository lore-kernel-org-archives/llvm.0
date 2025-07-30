Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5890E1EF38F;
	Wed, 30 Jul 2025 19:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753905573; cv=none; b=Dg5dWpcJjXTYFwActDhdKEO9Cr5mnMPrugKTFF4vLlqmzsaASmKQoKHgt0v6NM/s//F2KV/8jGDpEHXaPr6WbEhsL36z5FPmHGLTLF22Lkdr+LHN0BcprqRdAZiNwG6rqLXxU1BZwG4VGlLHw4Rr4zxiSSnfYS9ItAkL+adItp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753905573; c=relaxed/simple;
	bh=sD/hsQ2u8gcJom9CdtBwB4tQQXbxcnOU3ESvneUrVfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bvf8LOf0omC4rltWMgNZ6tpTPuhvTfq28jx9K1Ag850ysRkBR1vRTpHvN9E6OZG2kKmwBUsAM5e2T47QZDaYx+ZNmLuNgdGd9EGLFp0fg1o3GRFnQzMw1CpBAxALppZZw1UzS6YN1DZTJU5HRo6zUljklx95VHObgjERfHCVeR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0vDjaKs; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0vDjaKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753905571; x=1785441571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sD/hsQ2u8gcJom9CdtBwB4tQQXbxcnOU3ESvneUrVfU=;
  b=E0vDjaKs374fw3srJNt3cczGIyimR/rt/QF2x9tpVC/B86Kd5JXK6ia9
   /chPYcSAfgD1+uLg/3zT3eeaj04YBCR6MzSGf2appyant8KvR5i31M/T8
   ck5iBUyRcuBhN9Klcd+h/tO3Z57W+3K1qgW3oqUOJVHg2T+dfgwZRc5jy
   KE7oJxlFqOQ6gFHO4/mv2zC/W5BxO2ZwYsu2PvukJ7Z5C0lcNtBniYxtl
   ICvoTuNRfnOxePkESvG4BUrTmYKRSCuqN9OoP1hZR9qxodW1paVqDviGV
   WFinPsLmEWl8K4eKDsz8QkLzMCPFFkQmyT+wU51p8Nx+PHqKT5tGgfFYt
   w==;
X-CSE-ConnectionGUID: lLjqDsCkQnilkfPDrn8EMA==
X-CSE-MsgGUID: I7ZuM2yYR/68v1A6iEcM9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56184818"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56184818"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 12:59:31 -0700
X-CSE-ConnectionGUID: k5HuFm5fQha+G7Yfb/If+g==
X-CSE-MsgGUID: e83cW6SbRPeKU76B/sZouQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="200242442"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 30 Jul 2025 12:59:30 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhCxT-0000qh-1q;
	Wed, 30 Jul 2025 19:59:27 +0000
Date: Wed, 30 Jul 2025 21:59:03 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/umh-h 6/6] net/bridge/br_stp_if.c:135:7:
 error: call to undeclared function 'call_usermodehelper'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202507302142.GBJ0vrZI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/umh-h
head:   15d07db86bdfa4c328a18630d82990d592395d4d
commit: 15d07db86bdfa4c328a18630d82990d592395d4d [6/6] modules/kmod: remove transitive of umh.h
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250730/202507302142.GBJ0vrZI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507302142.GBJ0vrZI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507302142.GBJ0vrZI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/bridge/br_stp_if.c:135:7: error: call to undeclared function 'call_usermodehelper'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     135 |         rc = call_usermodehelper(BR_STP_PROG, argv, envp, UMH_WAIT_PROC);
         |              ^
>> net/bridge/br_stp_if.c:135:52: error: use of undeclared identifier 'UMH_WAIT_PROC'
     135 |         rc = call_usermodehelper(BR_STP_PROG, argv, envp, UMH_WAIT_PROC);
         |                                                           ^
   2 errors generated.
--
>> fs/ocfs2/stackglue.c:432:8: error: call to undeclared function 'call_usermodehelper'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     432 |         ret = call_usermodehelper(argv[0], argv, envp, UMH_WAIT_PROC);
         |               ^
>> fs/ocfs2/stackglue.c:432:49: error: use of undeclared identifier 'UMH_WAIT_PROC'
     432 |         ret = call_usermodehelper(argv[0], argv, envp, UMH_WAIT_PROC);
         |                                                        ^
   2 errors generated.


vim +/call_usermodehelper +135 net/bridge/br_stp_if.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  127  
308433155a67cb Vivien Didelot    2016-09-08  128  static int br_stp_call_user(struct net_bridge *br, char *arg)
9cde070874b822 Stephen Hemminger 2007-03-21  129  {
308433155a67cb Vivien Didelot    2016-09-08  130  	char *argv[] = { BR_STP_PROG, br->dev->name, arg, NULL };
9cde070874b822 Stephen Hemminger 2007-03-21  131  	char *envp[] = { NULL };
308433155a67cb Vivien Didelot    2016-09-08  132  	int rc;
308433155a67cb Vivien Didelot    2016-09-08  133  
308433155a67cb Vivien Didelot    2016-09-08  134  	/* call userspace STP and report program errors */
308433155a67cb Vivien Didelot    2016-09-08 @135  	rc = call_usermodehelper(BR_STP_PROG, argv, envp, UMH_WAIT_PROC);
308433155a67cb Vivien Didelot    2016-09-08  136  	if (rc > 0) {
308433155a67cb Vivien Didelot    2016-09-08  137  		if (rc & 0xff)
308433155a67cb Vivien Didelot    2016-09-08  138  			br_debug(br, BR_STP_PROG " received signal %d\n",
308433155a67cb Vivien Didelot    2016-09-08  139  				 rc & 0x7f);
308433155a67cb Vivien Didelot    2016-09-08  140  		else
308433155a67cb Vivien Didelot    2016-09-08  141  			br_debug(br, BR_STP_PROG " exited with code %d\n",
308433155a67cb Vivien Didelot    2016-09-08  142  				 (rc >> 8) & 0xff);
308433155a67cb Vivien Didelot    2016-09-08  143  	}
308433155a67cb Vivien Didelot    2016-09-08  144  
308433155a67cb Vivien Didelot    2016-09-08  145  	return rc;
308433155a67cb Vivien Didelot    2016-09-08  146  }
308433155a67cb Vivien Didelot    2016-09-08  147  

:::::: The code at line 135 was first introduced by commit
:::::: 308433155a67cb097142292c8943e0aa8d1a1c79 net: bridge: add helper to call /sbin/bridge-stp

:::::: TO: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
