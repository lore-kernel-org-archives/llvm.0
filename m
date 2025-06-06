Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF95D289E0B;
	Fri,  6 Jun 2025 16:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749228670; cv=none; b=C+wuEXnMT4dB/HVMunsfUi2hZTgiPQ6KuBMl878R4Tkuqxk4stOZ8zDC1pMd4+rR1+abppdlLvBkJUJHwDjtO/018kJrNIVnchiBqq2Syyh+803faY5u20tCDNnQHFHRFQN0WoeqAV61/t8cQMK2ESu/KQigA2iNfs2XmQRdExs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749228670; c=relaxed/simple;
	bh=vMQx72GWiNzRZcb7lT7+rVj9WLlU0EeqNjjFA3PyZbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bXelKZAJv/74sY5LFMLcmYEniUm6oZXYeYMnRCz7WPQ1juV2G0z0hFj6rB4bWZLYjWsxV74Ok9V8RM4A/cZNuDbSysw2W1TTeTEfWwVhvGgD7z2jx+N5zMQatm43E8/jhAZZGIWUJmWKAUS+8bAiKrfr5XI9IFXhI9o79cA/9eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9vrqdCA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9vrqdCA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749228669; x=1780764669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vMQx72GWiNzRZcb7lT7+rVj9WLlU0EeqNjjFA3PyZbo=;
  b=E9vrqdCAtDoh3bTgQFoygxM/mnUM6uwITouYG9ckCwlE8mTsEJYUMZKs
   GQrS5vyzxwZXBUuW9/w+s/+mp7p5G0oaQxeNRTaXTm6yuJboHUxrCEbTE
   i3dVmNkCrVvzGvi+v4xhn6gdaA/+h7niuPItA7tVjpuWvotRy4ZX2Qa/j
   aAmFXLpo+lM06uJztwBfAsryHMr01XxHkrsm37IF6+U5X2Y9O7kKiAqVs
   LmJZRcJLHPxVDMg1VmMWEAEqxJxb6F/TOsLero3n17q2rN5gbz31MkrFD
   nlavq/PgYb1FYRZe9ZR9BI8BbLS4vqFJakaR3+5ZyWyMqh12a8hEUGlJu
   Q==;
X-CSE-ConnectionGUID: jykFOtqFT/yTGhyIE1zcZA==
X-CSE-MsgGUID: Jkjte5CERc2w/0Nga88gRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51482844"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="51482844"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 09:51:08 -0700
X-CSE-ConnectionGUID: el1dN5XHQbKN96nmCRHo3w==
X-CSE-MsgGUID: A4AJwxjPTC2AA0STt5FkXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="145806862"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jun 2025 09:51:07 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNaHZ-00058r-0q;
	Fri, 06 Jun 2025 16:51:05 +0000
Date: Sat, 7 Jun 2025 00:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2025.06.04b 18/36] lib/tests/test_ratelimit.c:98:18:
 error: call to undeclared function 'ratelimit_state_reset_miss'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202506070040.aFxmm3vX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2025.06.04b
head:   12a2f572c0040895409bbf5773f80fa08586c01a
commit: f1d79747fb507820229adfd6f042b9b094a0c75b [18/36] lib: Add stress test for ratelimit
config: arm-randconfig-001-20250606 (https://download.01.org/0day-ci/archive/20250607/202506070040.aFxmm3vX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506070040.aFxmm3vX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506070040.aFxmm3vX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/tests/test_ratelimit.c:98:18: error: call to undeclared function 'ratelimit_state_reset_miss'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      98 |         sktp->nmissed = ratelimit_state_reset_miss(&stressrl);
         |                         ^
   lib/tests/test_ratelimit.c:98:18: note: did you mean 'ratelimit_state_exit'?
   include/linux/ratelimit.h:25:20: note: 'ratelimit_state_exit' declared here
      25 | static inline void ratelimit_state_exit(struct ratelimit_state *rs)
         |                    ^
   1 error generated.


vim +/ratelimit_state_reset_miss +98 lib/tests/test_ratelimit.c

    81	
    82	static int test_ratelimit_stress_child(void *arg)
    83	{
    84		struct stress_kthread *sktp = arg;
    85	
    86		set_user_nice(current, MAX_NICE);
    87		WARN_ON_ONCE(!sktp->tp);
    88	
    89		while (!READ_ONCE(doneflag)) {
    90			sktp->nattempts++;
    91			if (___ratelimit(&stressrl, __func__))
    92				sktp->nunlimited++;
    93			else
    94				sktp->nlimited++;
    95			cond_resched();
    96		}
    97	
  > 98		sktp->nmissed = ratelimit_state_reset_miss(&stressrl);
    99		return 0;
   100	}
   101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
