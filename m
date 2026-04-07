Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7592A376464;
	Tue,  7 Apr 2026 03:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534194; cv=none; b=mUCMkubpduEcQWBfeAjDr35apjqmJVWodRDtTjuMvCJoq6Uw5j3LOvlTQ95v9WD3teBNxSvpmxdpwQcO8k6AilWAKV+uXmbHNYLzDJER28rPHB5HpjUUhBOb3dEMU6fVgWpn4iG11WouC7RxTk+MvUzCfUjZQcXYr4edWywBndk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534194; c=relaxed/simple;
	bh=RBauETFmh3BJTkOK3gqsKGLxNeehv5jmxb/GEdTVGAo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gWG8QPcpzGj1cbXFBzNLWV3zzQbHjCI+i0/Jcb4aSsWYvjGBKp24wohcLqQYCIx6xgzNzk3L9svsoH/BiIlxsPTQkYkA+UewJmCRD0XkSbB+9RXN/BrxYALzWF0HMmWEmHqADzo1tX1mI+g7bB8ERlrb9AYHRuq7QysCfzlpPQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7TQALf0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7TQALf0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534193; x=1807070193;
  h=date:from:to:cc:subject:message-id;
  bh=RBauETFmh3BJTkOK3gqsKGLxNeehv5jmxb/GEdTVGAo=;
  b=X7TQALf0rWXLo0wcFZnTzYGlLlskHsYgoS5oOvnT4teiEdHk77INB93N
   4YE8kZ+o0LVvGi1MfncixlvZWzaRG7fG05l2v3aFwOPQ8H4essVC2s4lp
   sUefWiqsAtY6dBn1b3wrmOqxE5MdwQF/4CHde3PRyC+ssF8eBEhp8VtVh
   V6JhjwEI5NhZ2B/EDhlaKeV3DGXvpAAp6IHfJnBtR2uEjACxHj+6tclTF
   ca9xSmmYXV7eQ3l1F8A3WY36/1xuCwdTT0e/KK3/SRBhCDNYkeaJKafv0
   h2Xn674MOA8zgjFru0oZe0XiiO0+zvSX3PfTYnyg83P580uWizdaMVbl5
   w==;
X-CSE-ConnectionGUID: QxqT+kzKRECcAj+yYo0rAQ==
X-CSE-MsgGUID: qKyttvt1Tny2ZA8zjmbvxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87563835"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87563835"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:56:31 -0700
X-CSE-ConnectionGUID: gzjhLw1JRjC2s5TBAzFM8g==
X-CSE-MsgGUID: aPAbjzsvQK2YbvDb5pKFsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232926704"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Apr 2026 20:56:29 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xY8-0000000004l-0DC7;
	Tue, 07 Apr 2026 03:56:24 +0000
Date: Tue, 07 Apr 2026 11:55:28 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 96/98] ld.lld: error: unknown
 --orphan-handling mode:
Message-ID: <202604041721.H4cI9tla-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety
head:   dbf3e2d8d5ab9b4a26ad41d244565a4970faec68
commit: 3de0f89760cd13c036f3d39a32763f2b5088823a [96/98] treewide: Suppress randconfig failures
config: arm64-randconfig-003-20260404 (https://download.01.org/0day-ci/archive/20260404/202604041721.H4cI9tla-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604041721.H4cI9tla-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041721.H4cI9tla-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/dtc/dtc-lexer.lex.c:641:12: warning: variable 'dts_version' set but not used [-Wunused-but-set-global]
     641 | static int dts_version = 1;
         |            ^
   1 warning generated.
   scripts/mod/modpost.c:59:13: warning: variable 'extra_warn' set but not used [-Wunused-but-set-global]
      59 | static bool extra_warn;
         |             ^
   1 warning generated.
>> ld.lld: error: unknown --orphan-handling mode: 
   make[3]: *** [arch/arm64/kernel/vdso32/Makefile:129: arch/arm64/kernel/vdso32/vdso.so.raw] Error 1 shuffle=3591483259
   make[3]: Target 'arch/arm64/kernel/vdso32/vdso.so' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:208: vdso_prepare] Error 2 shuffle=3591483259
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3591483259
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3591483259
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
