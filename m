Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05465258;
	Sat,  1 Mar 2025 06:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740810894; cv=none; b=E9w8WjYwMxCFO09ZU/IlAf8bVij1YNDR0UnuH+0ZebT7l71wc0Or0F2HpEVYYwL430hUOrbhRiGlJLnpYUxinnXaxuWr+45EWln5XiW8Tkgb0hdCkh1OUUDTSKEOYYe+x7P4szvcTvJ7FdLDCZM/rcRMAyLNkajuOxKQRoSwp+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740810894; c=relaxed/simple;
	bh=ggWQFAlWvAlywHK3byks9yXsIPatQkEqfbJ2nBJvt+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jyOaGcnDpFN+/AoXcrgqI/FON0SSfldF+YJ2y3K+/FNLGAuy6eIo9ysV7Czf8Vc7sLBToB/ZzsAb8z2dfFBZVuGAf2E91UNs0Cr7lmEGfs28DEsTUc8z4/9nYUtnYTEVsO0Ws4G3nO0cIea0sFVd+pvUW5cqLUoyLiy5B030NAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K356x7PA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K356x7PA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740810892; x=1772346892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ggWQFAlWvAlywHK3byks9yXsIPatQkEqfbJ2nBJvt+U=;
  b=K356x7PAMs83MLdxEp+zOOUvw8WiMG2jlsCMHDh0of9wl+LB59iv7w92
   h41v7JE7da23iZRef6IxZONJC5/HCCuGP1O2b9+upcDPdCnNV0DRdcAf9
   489Qh9ToPOAXI2TxtT4a6+n3jPdqGtvZCGS5HPAV0wBJ6100NyxXEiCIa
   pyPvwdhKWoC53Hu37fpXJxLIH9sngT/AXf6IcfnTBlGzWGganMx7SyHdZ
   +DGO7ZZumwnOlZzdYtMjlO0Z5QaX79qUokyVYuKHUyCbYJyHLLtTcIWFj
   cJfRaer/f0yL9E+OwMXAXmhjK7FED0NZ2VhdPtph1QzPSZBZDe8b6kuTl
   A==;
X-CSE-ConnectionGUID: IY/lPbrBRTCwpVx/woPuxg==
X-CSE-MsgGUID: z1cMtdzoSQ26eueFZgUFJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52389730"
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="52389730"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 22:34:52 -0800
X-CSE-ConnectionGUID: xtMWUbVhRuSRtr3BSiG2wQ==
X-CSE-MsgGUID: VhzhOyfPQ1ucp5OitlNuAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148440732"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 Feb 2025 22:34:50 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toGQr-000Fxg-1r;
	Sat, 01 Mar 2025 06:34:44 +0000
Date: Sat, 1 Mar 2025 14:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:futex/scope 18/18] kernel/futex/core.c:1585:35: error:
 too many arguments to function call, expected single argument 'hash_slots',
 have 2 arguments
Message-ID: <202503011437.VVwweskj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git futex/scope
head:   50063817f6e71b787d3ba96cca9d2fff7b3ea7ff
commit: 50063817f6e71b787d3ba96cca9d2fff7b3ea7ff [18/18] futex: Rework SET_SLOTS
config: s390-randconfig-001-20250301 (https://download.01.org/0day-ci/archive/20250301/202503011437.VVwweskj-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503011437.VVwweskj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503011437.VVwweskj-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/futex/core.c:307:9: error: call to undeclared function '__futex_hash'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           return __futex_hash(key, NULL);
                  ^
   kernel/futex/core.c:307:9: note: did you mean 'futex_hash'?
   kernel/futex/core.c:305:27: note: 'futex_hash' declared here
   struct futex_hash_bucket *futex_hash(union futex_key *key)
                             ^
   kernel/futex/core.c:307:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct futex_hash_bucket *' [-Wint-conversion]
           return __futex_hash(key, NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/futex/core.c:321:1: error: static declaration of '__futex_hash' follows non-static declaration
   __futex_hash(union futex_key *key, struct futex_private_hash *fph)
   ^
   kernel/futex/core.c:307:9: note: previous implicit declaration is here
           return __futex_hash(key, NULL);
                  ^
>> kernel/futex/core.c:1585:35: error: too many arguments to function call, expected single argument 'hash_slots', have 2 arguments
                   ret = futex_hash_allocate(arg3, true);
                         ~~~~~~~~~~~~~~~~~~~       ^~~~
   kernel/futex/core.c:1568:12: note: 'futex_hash_allocate' declared here
   static int futex_hash_allocate(unsigned int hash_slots)
              ^
   4 errors generated.


vim +/hash_slots +1585 kernel/futex/core.c

  1578	
  1579	int futex_hash_prctl(unsigned long arg2, unsigned long arg3)
  1580	{
  1581		int ret;
  1582	
  1583		switch (arg2) {
  1584		case PR_FUTEX_HASH_SET_SLOTS:
> 1585			ret = futex_hash_allocate(arg3, true);
  1586			break;
  1587	
  1588		case PR_FUTEX_HASH_GET_SLOTS:
  1589			ret = futex_hash_get_slots();
  1590			break;
  1591	
  1592		default:
  1593			ret = -EINVAL;
  1594			break;
  1595		}
  1596		return ret;
  1597	}
  1598	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
