Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF3336605A;
	Tue, 30 Jun 2026 02:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782786524; cv=none; b=U90yOY//lIa90telGw2gHtO2ILgy7pj3EOOKL9NdZvXSqk3/rs4HZYF/dYvhjvCIKGFiqw3uLGLx+wCDoRoVN7IONktYXdvq1FBZg7Nei78iS/KEHWWsPT2AJvym0MoFC8plg0qb3nRzvjZTpN9IRWP0LZUPPw5mu3SZEw/qONQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782786524; c=relaxed/simple;
	bh=p2wfhvF9n5ORU4CzoNH41NUaOH25R+SCg4T8Y1exkgU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dM1U8/ThuWIsVu4zLmhAEGYTqOo74TjjOSw3x/S6+bcmGldFphk0Wih327KWTR9RwIDZLZlxFv26TYzK0Lu6oVdPbK+3IaxqfuiUakXw+MKxI9qUnBUQG8awKAinOgzQdYpZKe0GbNA++83F/e+FJwmKi8m29LfHyYEqOGZ60XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epq0T56j; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epq0T56j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782786523; x=1814322523;
  h=date:from:to:cc:subject:message-id;
  bh=p2wfhvF9n5ORU4CzoNH41NUaOH25R+SCg4T8Y1exkgU=;
  b=epq0T56jEFUdkgNmGB1Ug8S3BmJKA517cAJLCwakczBF+4/CM1q5yPTU
   DXNHYcZrCXvq4Jj1IOVMiYGLjranga0t6yIlMf2JMDPmjDqVTlfY2sE2D
   S8HQLOxUA21IOpp12ORrdoAps/EnTu9v73dMBoE6GvA64eX1jvYJs9D5m
   C0TjiyC2gYefNPBXZCyO3NWkoulVV/naDxKKxbVHqr/07bkFbWPwlE83z
   SzSDEBIrSVLc41tBYII7C7SOKA/kFgHYyqeEb4lprXAdMiG3fBmkMy8uD
   59qpBxvThhANU5L45yVvGPFTsJY+C8va7N9znMUI89OYCg9uFcDVxU9fg
   A==;
X-CSE-ConnectionGUID: KyV+ZP6iTJOb6Lu3PB0sgQ==
X-CSE-MsgGUID: cqjSNgvaSrCKigCtd0NRqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="109042366"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="109042366"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 19:28:41 -0700
X-CSE-ConnectionGUID: t23JQi/sRgqUxt1h4iGwkA==
X-CSE-MsgGUID: 4dxskIZ4Sni0eGEfFnDbbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="247674478"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jun 2026 19:28:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weODE-000000007xZ-1hix;
	Tue, 30 Jun 2026 02:28:36 +0000
Date: Tue, 30 Jun 2026 10:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett (Oracle)" <liam@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [liam:maple_marks_v7.2_fixes 13/33] lib/maple_tree.c:744:29:
 error: conflicting types for 'mt_locked'
Message-ID: <202606301011.csHUFTZa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git maple_marks_v7.2_fixes
head:   1536d2bf9195cbde5a1dd7fa78fd6995a29b004f
commit: 6f34957a13773332ff09b7cd43aa9486f0adb285 [13/33] maple_tree: Fix dereference of rcu type
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260630/202606301011.csHUFTZa-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301011.csHUFTZa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301011.csHUFTZa-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/maple_tree.c:531:14: error: call to undeclared function 'mt_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     531 |                                                        mt_locked(mas->tree)));
         |                                                        ^
>> lib/maple_tree.c:744:29: error: conflicting types for 'mt_locked'
     744 | static __always_inline bool mt_locked(const struct maple_tree *mt)
         |                             ^
   lib/maple_tree.c:531:14: note: previous implicit declaration is here
     531 |                                                        mt_locked(mas->tree)));
         |                                                        ^
   2 errors generated.


vim +/mt_locked +744 lib/maple_tree.c

19a462f06eb5a7 Liam R. Howlett 2023-07-14  743  
271f61a8b41dcd Liam R. Howlett 2023-11-01 @744  static __always_inline bool mt_locked(const struct maple_tree *mt)
54a611b605901c Liam R. Howlett 2022-09-06  745  {
54a611b605901c Liam R. Howlett 2022-09-06  746  	return mt_external_lock(mt) ? mt_lock_is_held(mt) :
54a611b605901c Liam R. Howlett 2022-09-06  747  		lockdep_is_held(&mt->ma_lock);
54a611b605901c Liam R. Howlett 2022-09-06  748  }
54a611b605901c Liam R. Howlett 2022-09-06  749  

:::::: The code at line 744 was first introduced by commit
:::::: 271f61a8b41dcd86e1ecc2e0455bcc071bc7dde4 maple_tree: clean up inlines for some functions

:::::: TO: Liam R. Howlett <Liam.Howlett@oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
