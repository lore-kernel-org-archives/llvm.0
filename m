Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501D03BBF0;
	Sat, 22 Jun 2024 21:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719091208; cv=none; b=K6wG+lVhubf3UwMXnfR/YkE9nopnhzQc8C+HS+zh8Js3IWByh7g6+XmSICPqaWO0ligWCf7yGwxXcUYuQHEIqe2bLkiBdQRwvo6WkVWFPerfIYPRCry7G6NZGGxBwB6OjxLNg+kB7a2Xh6TZdplBRRjbWFsmhgmLZ+v+4tpIOJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719091208; c=relaxed/simple;
	bh=gI2cvJQaaiF29bgI9WjU7D4nkMAJodDwyDxztjSxUbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kle7aqjJichA2M0k2xlpIP7Zrcbjfp1xvoja98cTGwFeh+orG9biNbCi6yMe3G7WiMO4ZT/+zSo7onepgzH9bB9Iv5/aDihCGc40P/Yaa8vNsdh9Rf7c3tgY3sOFhMAITwtHKTeAki37FJoaX+LT5uZPp+U8v/e/3yyD1hao6os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoePzprX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoePzprX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719091207; x=1750627207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gI2cvJQaaiF29bgI9WjU7D4nkMAJodDwyDxztjSxUbg=;
  b=HoePzprXgXDYNqW8GBqwN2lsZz/2dNHW+blDbWwikoM/UpVhRp1AHKhH
   Cq13e4/rW7cNrjHUSgLK+dZtvxbWxhuxPVpfvWVDVeqTtFoC+6jt9hk3J
   Y3YkjyP+3aQVP1WY+F3RKstW3pD8eqIebZXo4JDPlsMd9g6Am1Z9Zp6oO
   E3fSb+PNjAre0f148Xx8iJQrqJ7k8v3ogOFymT/NVqbkT6n0g2j2z3h3w
   bX5/FdHVfE85/xlUAYdbQUzVNw03t7ClvloF3cdCMoDcGqdz2KwxwRlrx
   pw0UpxY+PV/w0Q6ghE3Rup+Pe9PP8F5Jcz9JIeYsmWNGW+8uTloPIPso6
   w==;
X-CSE-ConnectionGUID: Akf4ap4JT1GykrwjPn5EAQ==
X-CSE-MsgGUID: Osijfd5eQROcM7m6izdNfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="16072714"
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="16072714"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 14:20:06 -0700
X-CSE-ConnectionGUID: FnD0jIkRRvas6C3n+Lz3IQ==
X-CSE-MsgGUID: VWONRyHqTLWbgZXi9EZo4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="47435596"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jun 2024 14:20:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sL89S-000A0S-18;
	Sat, 22 Jun 2024 21:20:02 +0000
Date: Sun, 23 Jun 2024 05:19:48 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 5/5] ld.lld: error:
 arch/arm64/kernel/vdso/vdso.lds:173: unknown directive: //
Message-ID: <202406230550.2XQjeMiI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   03896a2cffb7e9210068032867433c5393d497ea
commit: 03896a2cffb7e9210068032867433c5393d497ea [5/5] todo
config: arm64-randconfig-001-20240623 (https://download.01.org/0day-ci/archive/20240623/202406230550.2XQjeMiI-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240623/202406230550.2XQjeMiI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406230550.2XQjeMiI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/arm64/kernel/vdso/vdso.lds:173: unknown directive: //
   >>> // TODO CONFIG_USE_FFUNCTION_SECTIONS, etc - or just make it the default everywhere for consistency ...
   >>> ^
   make[3]: *** [arch/arm64/kernel/vdso/Makefile:63: arch/arm64/kernel/vdso/vdso.so.dbg] Error 1 shuffle=1817778435
   make[3]: Target 'arch/arm64/kernel/vdso/vdso.so' not remade because of errors.
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:198: vdso_prepare] Error 2 shuffle=1817778435
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2 shuffle=1817778435
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2 shuffle=1817778435
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
