Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB372D77E6;
	Sat, 15 Aug 2026 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786822934; cv=none; b=FmYD0W7uwQ4lmA1hOlnpm2VshswFtX2Onc4M6KvqzwB5nI/mvgL43Ja6VEgm6mzSvOheOnHjlElvizKWBWjZ0kOsH4PfhmZbdbwZ7VJAHoxi0PWRFihGZU22t/3xulvdG80R0PP1rdr4O4k7/nZncIe8lrJfUL0fIpBx7lxuBWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786822934; c=relaxed/simple;
	bh=FwYVoP/09leCO0hIOwAJYeqyf0gOUUkfhS0A8HX2bnc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H8JnIUhGVPTupzKhaAAzldHWCs7+N/QSqs/An5Seg7v4665edW8tTflUjgIXszOw4+FB4nP1lnbcHFbfFv9NtpqyBReFBiUvGE8QFvbihWoRBJqfpnTRla2SX6eWNhax4EbOLnuRQrvQkHNuHKU0s9FGeMxtCqqadyeQS1DG8GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGRTtDDm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGRTtDDm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786822932; x=1818358932;
  h=date:from:to:cc:subject:message-id;
  bh=FwYVoP/09leCO0hIOwAJYeqyf0gOUUkfhS0A8HX2bnc=;
  b=WGRTtDDmc1AKo/c8PARWnd2MgEBN/WU+iFpTswfVM47bA1j1UFo8DRZ3
   A5sqchydn7sexuKqNgEHDr046cMraEvpOAU2EucxO8IwHzIl5JKNnVlj5
   sJrGbSTSdaxT9y0GumWpL2ZSz46I8ZezaFjHnDgUgsKJpOpyiTGFmrtms
   Yk/d69kuOhtGBsLzVGaIZ9H55iCTH9JT/PKZCB2OeYeHIxPo/w9YE7tpH
   hqy0aSmt+XnyLS8X1hc43sseP7RjiSl4wSgVlDtzgzHPTg4lxqpIGXJeh
   e6N0FTFo2UdHhD+vEupkonwZfL79zsjEd3ke0+QJNgzfWmyFUpFa7nK7J
   g==;
X-CSE-ConnectionGUID: Dy5XtymSSfG9IwmJJiUXtw==
X-CSE-MsgGUID: +Gq6DdWrTq6zc58Vj8rCMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="104742896"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="104742896"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 12:42:11 -0700
X-CSE-ConnectionGUID: 5YJPer3NT0qHsMqithKPXg==
X-CSE-MsgGUID: ln7oeZNyTpmaQn7rjHz+bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="288002194"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Aug 2026 12:42:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvKGc-00000000cS6-2ajv;
	Sat, 15 Aug 2026 19:42:06 +0000
Date: Sun, 16 Aug 2026 03:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:board-remove 40/217] arch/arm/kernel/process.c:379:5:
 warning: no previous prototype for function 'arch_setup_additional_pages'
Message-ID: <202608160341.2pHIQyJL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 99feea9e164dc7bec620cd48078d1c6ec0bdadc4 [40/217] ARM: remove remaining nommu support
config: arm-orion5x_defconfig (https://download.01.org/0day-ci/archive/20260816/202608160341.2pHIQyJL-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160341.2pHIQyJL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160341.2pHIQyJL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/kernel/process.c:379:5: warning: no previous prototype for function 'arch_setup_additional_pages' [-Wmissing-prototypes]
     379 | int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
         |     ^
   arch/arm/kernel/process.c:379:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     379 | int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
         | ^
         | static 
   1 warning generated.


vim +/arch_setup_additional_pages +379 arch/arm/kernel/process.c

02e0409a65560d Nathan Lynch 2014-09-22  378  
48be69a026b2c1 Russell King 2013-07-24 @379  int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)

:::::: The code at line 379 was first introduced by commit
:::::: 48be69a026b2c17350a5ef18a1959a919f60be7d ARM: move signal handlers into a vdso-like page

:::::: TO: Russell King <rmk+kernel@arm.linux.org.uk>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
