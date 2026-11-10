Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342099;
	b=nl/vbz16ScKFmQ3Il3Mv8aYhaRX+DFlpIw3VBUjT1JA6GXV7v6i2YyQdEcYDY7kgCsQX
	 ve7V38Mps5STeqKZAeBeflNw9mV7fgY+eX07yfVkRkIpV2Z8mQessJ4CNQzEF43M5TCsU
	 bCOkm54gsAJXLotwvbOvIpOXgb7TgrlgYLlaD95rnRDpeCAYUxM3BQHUpt1xrLzgbIY8P
	 T7XI1cFK60RuWDqayS5Z/+VOxPUPHMlFsxxuO6tfoW2X9iEm0qUTXh+O0FTW31dIpBLLc
	 UVd6n+qRwLIRS4k83xfrYBrKotVhgUAxosYfLVHRf2s9rVZIhuA1JcF6q3AwIHWaiyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342099;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=3iEvidvX7sr5Dd2S/chtWU3GYq0+RGTHzIElDe8E1o0=;
	b=u3MHQQ4zE34RHXu0mr5icifMosVdbOE7pnY8xYqrhyni8xlxEYN8B66R+XmclSYZDj2D
	 2Xs2JHtdgd3SZj/0VQkyYZEWgVQfYmSaCDChgAKAM0JPaYv033VqkgLIWKeJsan4o+ln+
	 26cqwrXEsrwp6ySjZm92Pwk3lg/Udt2Fyswc0iLWsxcpskyHuiNe4g99uOGEBm1qVmUZn
	 N8waVU/AHLN9U0GzVYEC5zGRImlAULVUwH4+2X4H5nL5lQbBgF/iW/lUxT8LfVJQHacWR
	 ND8QzFq44dphQ4AK14dHys7NWJzEnuGlfA2DSxkzN6hzYqS1dLwdUMCpjF/5136y+TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="QpM/r2qF";
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F92660A5BDD;
	Tue, 10 Nov 2026 20:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F92660A5BDD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QpM/r2qF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794342098; x=1825878098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RI/PVi2awObhTaxl1U2D9fFkYXdk2MgcQCCQSaqIakQ=;
  b=QpM/r2qFN1ZNIrr0NtRt8WRdeQdWGhzaTj0avqlopX6fNZlV1nCWtCug
   cRxCfursm981pgt6Cpyk5ms4VeTzb/F+A27DBisiqMvc2lPuzsowbhHP+
   LZ+2+6bPpOJYZ3ZTWza3tya/U/PVgci0RzxiXg+SdmBBqpS4lgs93xRF3
   H8rV8PCW+gLlNNRcAzPMNEeCZ6c+JXiJXqvHKzHXQRql6/LTxcC562Sst
   jdCpfqbT87i/Amf3telUA75xy3j9ek1NhONqJqFRv5JSbj9Lk9U5PPRjb
   D9pXP4FmoD20C8MyW2SQZaNtyOWKjBwkGCnStj4atp0DVrGRSsZhW8QxZ
   A==;
X-CSE-ConnectionGUID: zCH7nIfUSq+vzkhhXrBucg==
X-CSE-MsgGUID: /Zr6n0DbT/W6pcLeVCQLVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3130495"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3130495"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 12:21:37 -0800
X-CSE-ConnectionGUID: 2NqrS4TGToq7JF9TU95Www==
X-CSE-MsgGUID: tshxfAeHQ/KyURwFJ5h1mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8678107"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 10 Nov 2026 12:21:36 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQsLV-000000000Lf-1dWv;
	Tue, 10 Nov 2026 20:21:33 +0000
Date: Tue, 10 Nov 2026 21:21:06 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-no-fallback 10/11]
 lib/vdso/gettimeofday.c:451:11: error: use of undeclared identifier 'EINVAL'
Message-ID: <202611102127.IrGJFIGK-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-no-fallback
head:   3b966bf4e9676dd99abe071691e72e14fd05fe73
commit: 090f60ded7da81c15e516570a3d5b89de9d00587 [10/11] getres: fallback
config: powerpc-randconfig-2001-20261110 (https://download.01.org/0day-ci/archive/20261110/202611102127.IrGJFIGK-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 053b4a894ceaebc2eed76a7fa09f58cf7e313a69)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611102127.IrGJFIGK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611102127.IrGJFIGK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:4:
>> lib/vdso/gettimeofday.c:451:11: error: use of undeclared identifier 'EINVAL'
     451 |                 return -EINVAL;
         |                         ^~~~~~
   lib/vdso/gettimeofday.c:476:11: error: use of undeclared identifier 'EINVAL'
     476 |                 return -EINVAL;
         |                         ^~~~~~
   2 errors generated.
   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:96: arch/powerpc/kernel/vdso/vgettimeofday-32.o] Error 1 shuffle=3186034347
   make[3]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[2]: *** [arch/powerpc/Makefile:395: vdso_prepare] Error 2 shuffle=3186034347
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3186034347
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3186034347
   make: Target 'prepare' not remade because of errors.


vim +/EINVAL +451 lib/vdso/gettimeofday.c

   442	
   443	static __always_inline
   444	int __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t clock,
   445					struct __kernel_timespec *res)
   446	{
   447		u32 msk;
   448		u64 ns;
   449	
   450		if (!vdso_clockid_valid(clock))
 > 451			return -EINVAL;
   452	
   453		if (vdso_is_timens_clock(&vd->hres_coarse))
   454			vd = vdso_timens_data(vd);
   455	
   456		/*
   457		 * Convert the clockid to a bitmask and use it to check which
   458		 * clocks are handled in the VDSO directly.
   459		 */
   460		msk = 1U << clock;
   461		if (msk & (VDSO_HRES | VDSO_RAW)) {
   462			/*
   463			 * Preserves the behaviour of posix_get_hrtimer_res().
   464			 */
   465			ns = READ_ONCE(vd->hrtimer_res);
   466		} else if (msk & VDSO_COARSE) {
   467			/*
   468			 * Preserves the behaviour of posix_get_coarse_res().
   469			 */
   470			ns = LOW_RES_NSEC;
   471		} else if (msk & VDSO_AUX) {
   472			ns = aux_clock_resolution_ns();
   473		} else if (msk & vdso_alarmclock_mask(vd)) {
   474			ns = READ_ONCE(vd->hrtimer_res);
   475		} else {
   476			return -EINVAL;
   477		}
   478	
   479		if (likely(res)) {
   480			res->tv_sec = 0;
   481			res->tv_nsec = ns;
   482		}
   483		return 0;
   484	}
   485	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
