Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F19B26ACC;
	Wed, 25 Mar 2026 03:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774407648; cv=none; b=Z5aUkHGvKWKUJkICw4hBlig4xc1zHCP3+oC/bmEcepZwhLrh7pDoPwKTvTqGGjKCWZ9m/28VN96Fpi2jAQoAiuj1zhpC1jXZd3kTNL6iFKqhAR84wcScZhXJ8V3AN/qNpnGwNKC9pWyGa0FrUKj+Ux4A5Gr5jEp8hi02d+PsYIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774407648; c=relaxed/simple;
	bh=9+Or/O2QRNSuXfOKnlqTobmm6AJcAP1aCebqTGA81ps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SnmQGJOaQZQAX+/0JoFfjoD00ClLOth0zOBRv079FX/LcEe+/UU01dEsztCfJH+eSSSSlL4cIW8fy11AOM1JIcojDbUn1aIuNKhPZlyz7hs3q/1iOFV3rSE9HSrXbCOvIcfZkJTLTf5RnPXRlslSgPuYQRkThi21W0eOMQqlDg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Co4d3Ha4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Co4d3Ha4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774407647; x=1805943647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9+Or/O2QRNSuXfOKnlqTobmm6AJcAP1aCebqTGA81ps=;
  b=Co4d3Ha4tuxynsTg2S1mIVbp068ME4oOIlGH9TNVzx7GnVwNadv5BRlm
   Vcmb75fThx+Qw8shkrKMoPGExvjfDD65dHXchvhhG+/Q5k9WkN6KmvjyK
   OpQrF1BF+KZ/MlHuOcyMs1a/4GQu0XCgRIs09IoyXRXgz7tdh0FluRkGO
   ABQHTz5QbfYbOb73ysnzFm1NTNYt729u/+uMvp0PoY+tMs/9QgA0MZaaQ
   ZxSuPgDzIb/a9IPFdhFn1MziMS0HnYlGZL9OYYrD4xnQsdbewtbUXcu6y
   yGfOnbse3QjgcktCMrtVCdQ2aRnHOfV8bGbsNgnRSHjOnc5wmkY/BAnzO
   w==;
X-CSE-ConnectionGUID: LaWqqFfxS9m7LdYBz+qJqw==
X-CSE-MsgGUID: 4c26ZkJIS2iSjaL0675FGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="62988146"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="62988146"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 20:00:46 -0700
X-CSE-ConnectionGUID: aMcm8Gz2TueBkRKbaX3zxw==
X-CSE-MsgGUID: yE+pH8MYRq2lfpwPK18/5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="229013959"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Mar 2026 20:00:44 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5EU5-000000005ob-1RnS;
	Wed, 25 Mar 2026 03:00:41 +0000
Date: Wed, 25 Mar 2026 11:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-ifdeffery 4/6]
 arch/s390/kernel/vdso/../../../../lib/vdso/gettimeofday.c:446:21: error:
 conflicting types for 'clock_getres_fallback'
Message-ID: <202603251030.3ui5hvv6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-ifdeffery
head:   45c96fcd1b5efdc20a7638f8aafec16f4572a94b
commit: 541db7c42182bf886177c34f5bef756f958e99e2 [4/6] getres fallbacks
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260325/202603251030.3ui5hvv6-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251030.3ui5hvv6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251030.3ui5hvv6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/vdso/vdso_generic.c:2:
>> arch/s390/kernel/vdso/../../../../lib/vdso/gettimeofday.c:446:21: error: conflicting types for 'clock_getres_fallback'
     446 | __always_inline int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts);
         |                     ^
   arch/s390/include/asm/vdso/gettimeofday.h:34:6: note: previous definition is here
      34 | long clock_getres_fallback(clockid_t clkid, struct __kernel_timespec *ts)
         |      ^
   1 error generated.
   make[3]: *** [arch/s390/kernel/vdso/Makefile:62: arch/s390/kernel/vdso/vdso_generic.o] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/s390/Makefile:154: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/clock_getres_fallback +446 arch/s390/kernel/vdso/../../../../lib/vdso/gettimeofday.c

   445	
 > 446	__always_inline int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts);
   447	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
