Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927772D836D;
	Mon, 16 Feb 2026 17:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771261822; cv=none; b=Wn8qMWBv2sSRolpJdwFF4B/XGAh940BGk1hnXkhxAmyO1PQLpNVVQapTEQH7e2+mJ1PPlyMjvbcTeuQIY69VgLKPPi1oOKnGHlXTgBj4IGFztbs8HXZZcVpdw1Kq+ARnytKJ/Fe2fhqdbK1iY1WWVAlZHvqOgm48SSGANXX2ZzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771261822; c=relaxed/simple;
	bh=YLOO0eoxjJ/aVSlShDj81auS44DXtBHTqAA/T5ib77c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SULVbjnyVZNG2M85UHrkl1yatrCyq/onhN3l5N59yec4m6hQsN2FZTv+Zjroz7dudB6du3k9RmIB3Gu6YB/n3pkdfqahOnu0IksfvOyPRysBJ8SiNJULIOWgR4084KyZLxshx3gNCyjyQ1j4sr8pmOcyrfOh0WtBYomGDHZBcE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrNdMt31; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrNdMt31"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771261821; x=1802797821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YLOO0eoxjJ/aVSlShDj81auS44DXtBHTqAA/T5ib77c=;
  b=nrNdMt31O9ACxXz20U2VivbsL8OthAB4Q0OCHLvLWSwPDYuf5Nn0QN7O
   Hnwf4Z23TY9ZFer96xOVfuqhGvMd9MpeQFxMeD91W44twu7lvg+cfYlOf
   xUkSjnK58DW93Ji0fjaP5toohhEyWZagp7tvmVYTiMdOfJ5RGZqzaElb6
   k6bGe9pG7N7Zd2efPXVdbOstboAqV9ObBCM9neD0VODovubXRMRx+0kyC
   JFaDedZ/LipTwmTeOsgr7CEoho16yP6V/Z1Rd+2CnlRob3Dt/GeVzJgAJ
   9Ho3qWyHCg3ADn7rk/8JIVPavrAsw4/xlVOCjNpdfLXDyF1UGERYKxb8U
   g==;
X-CSE-ConnectionGUID: zDcguclMQNeloKaiNOegEQ==
X-CSE-MsgGUID: Tj9FQN1sTp+/qxGzRmrFXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="94975301"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="94975301"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 09:10:20 -0800
X-CSE-ConnectionGUID: TijO832jTcuJSsTErXPKzQ==
X-CSE-MsgGUID: VO6mbWpTSDOgFeO+W0Q/dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="212964870"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Feb 2026 09:10:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs26y-0000000107g-2UD2;
	Mon, 16 Feb 2026 17:10:16 +0000
Date: Tue, 17 Feb 2026 01:09:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-compat_32bit_time 6/9] ld.lld:
 error: version script assignment of 'LINUX_2.6' to symbol
 '__vdso_clock_gettime' failed: symbol not defined
Message-ID: <202602170117.e0UJNOYk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-compat_32bit_time
head:   b08c091b9f1d126d4ec8f7e985f468fed0359793
commit: 131cad35c03d51b3a3b00410fa1387209ba60330 [6/9] arm65
config: arm64-randconfig-004-20260216 (https://download.01.org/0day-ci/archive/20260217/202602170117.e0UJNOYk-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170117.e0UJNOYk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170117.e0UJNOYk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: version script assignment of 'LINUX_2.6' to symbol '__vdso_clock_gettime' failed: symbol not defined
>> ld.lld: error: version script assignment of 'LINUX_2.6' to symbol '__vdso_gettimeofday' failed: symbol not defined
>> ld.lld: error: version script assignment of 'LINUX_2.6' to symbol '__vdso_clock_getres' failed: symbol not defined
   make[3]: *** [arch/arm64/kernel/vdso32/Makefile:129: arch/arm64/kernel/vdso32/vdso.so.raw] Error 1 shuffle=2900592969
   make[3]: Target 'arch/arm64/kernel/vdso32/vdso.so' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:208: vdso_prepare] Error 2 shuffle=2900592969
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2900592969
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2900592969
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
