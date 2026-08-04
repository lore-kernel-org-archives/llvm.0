Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B6B413247;
	Tue,  4 Aug 2026 18:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785868527; cv=none; b=pvLuS/QpHKGHSXGThtAnNjQ9mWVcf1ePXE+j1tNv1zVGrza1eZQGRC50fVimGYzPYpktJcyuDwfOH9mx38blAURDU/99ReYjvVsRCE+XHmy1sX97l/lvMktYxWGdhHjnw4NBsZoMWKX7p/TYQmzqkN6d6c2w5YctUBOwT5/AwqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785868527; c=relaxed/simple;
	bh=M7VQoLkgeYT6dgwsKdw94T9Jqytp+5XBgqqoOa3bDjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NQDW6P3dh6pJpLe/IomTHbSHxHpvQAP8mxySCxZNQ8kb/ICIIXLRqS8398OR8JPBYDfRdA4o7Yex7nBk0qo1oTtOekBSa9GfRY+FM0JbAV00h0gF4FA1ch+VIvjkaHeiM/JKSwXDcL1lCRK4p3lze+jbeRHYOMgdv7kd7W4DEkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gS8rzBgS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gS8rzBgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785868525; x=1817404525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M7VQoLkgeYT6dgwsKdw94T9Jqytp+5XBgqqoOa3bDjE=;
  b=gS8rzBgSB6S8SiX2j6owf2GLo1hnjaRCkCphmJBd102X7qNyv2SMr7jW
   Z22Ic0EHWWG9ZCE8/VtsVMc9+zvW3TZLuVzT9mqNLzQHsscytZPUsh84w
   hnrHEG5f6Qz3mR6bD158mwFCVifEBlMOVOGcsv97zEf87A8Quuv0Z08sF
   SiNB/F30WOkJKBBNJCI/KHN1cstJku7gckeUOzhsaCTyraChyyo/AhJ6s
   Mcr+peRVweg6WKZyLJGK4qVcpc3Nch1LSVDc3TJ56s68/7eWCnW2j57pz
   RvQB9oUWC7kIgYCGBs+tseldsxPbYF9cHxPBiKDyS7U5AQbr56OjQb82x
   Q==;
X-CSE-ConnectionGUID: a5tyzL3sSye2i/oDpQ7VUA==
X-CSE-MsgGUID: MwTpG4Z0Q0WKClBd+14NuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86436526"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86436526"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 11:35:25 -0700
X-CSE-ConnectionGUID: iIji7KOCTzm7lq2FkxLzeg==
X-CSE-MsgGUID: p2E2TD1OQpSJEslFAlB8Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="258241258"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Aug 2026 11:35:23 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrJyy-00000000ARV-4680;
	Tue, 04 Aug 2026 18:35:20 +0000
Date: Wed, 05 Aug 2026 02:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 16/39]
 kernel/time/timekeeping.c:156:1: error: use of undeclared identifier 'symbol'
Message-ID: <202608050219.FPUJpehf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   67005bd34e048d0f0fb4f5762d159093fac52cb7
commit: dcfa56542ac7fa99290449e0a2409b2d9e875e1c [16/39] timekeeping: time_test: Add a test for auxiliary to monotonic clock conversions
config: x86_64-randconfig-076-20260804 (https://download.01.org/0day-ci/archive/20260805/202608050219.FPUJpehf-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050219.FPUJpehf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050219.FPUJpehf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/timekeeping.c:156:1: error: use of undeclared identifier 'symbol'
     156 | EXPORT_SYMBOL_FOR_TIME_TEST(tk_aux_capture_mono_conv);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/timekeeping.h:44:72: note: expanded from macro 'EXPORT_SYMBOL_FOR_TIME_TEST'
      44 | #define EXPORT_SYMBOL_FOR_TIME_TEST(_symbol) EXPORT_SYMBOL_FOR_MODULES(symbol, "time_test");
         |                                                                        ^~~~~~
   1 error generated.


vim +/symbol +156 kernel/time/timekeeping.c

    80	
    81	/*
    82	 * Conversion between auxiliary and monotonic clock timestamps.
    83	 *
    84	 * ktime_mono_to_aux() and ktime_aux_to_mono() utilize conversion factors
    85	 * for converting from one clock to another. These conversion factors are
    86	 * updated periodically and are based on a common base time stamp derived
    87	 * from a clocksource readout:
    88	 *
    89	 *     cs_base	   = read_clock()
    90	 *     mono_base_ns  = tk_cs_to_ns(MONO, cs_base)
    91	 *     aux_base_ns   = tk_cs_to_ns(AUX, cs_base)
    92	 *
    93	 * The progression of the clocks relative to the base time is determined
    94	 * by their conversion factors, which are constant for a given conversion
    95	 * period:
    96	 *
    97	 *     cs_delta = read_clock() - cs_base
    98	 *     delta_mono_ns = cs_delta * fMONO
    99	 *     delta_aux_ns  = cs_delta * fAUX
   100	 *
   101	 * Ergo:
   102	 *
   103	 *     delta_mono_ns - delta_aux_ns = cs_delta * (fMONO - fAUX)
   104	 *
   105	 * Substituting cs_delta yields:
   106	 *                                                    fMONO - fAUX
   107	 *     delta_mono_ns - delta_aux_ns = delta_mono_ns * ------------
   108	 *                                                       fMONO
   109	 * Resolving to delta_aux_ns:
   110	 *                                                    fMONO - fAUX
   111	 *     delta_aux_ns = delta_mono_ns - delta_mono_ns * ------------
   112	 *                                                       fMONO
   113	 * Which simplifies to:
   114	 *                                    fAUX
   115	 *     delta_aux_ns = delta_mono_ns * -----
   116	 *                                    fMONO
   117	 *
   118	 * So a MONOTONIC time value can be converted to an AUX time value by:
   119	 *
   120	 *                                                 fAUX
   121	 *     aux_ts = aux_base + (mono_ts - mono_base) * -----
   122	 *                                                 fMONO
   123	 * The opposite conversion is:
   124	 *                                                 fMONO
   125	 *     mono_ts = mono_base + (aux_ts - aux_base) * -----
   126	 *                                                 fAUX
   127	 *
   128	 * To avoid a division the ratios are converted to scaled math. As both
   129	 * factors are guaranteed to have the same scaled math shift value the
   130	 * ratio is the ratio of the scaled math multipliers:
   131	 *
   132	 *     conv_mult_aux = (AUX_mult << conv_shift) / MONO_mult
   133	 *     conv_mult_mono = (MONO_mult << conv_shift) / AUX_mult
   134	 *
   135	 * The actual conversions become:
   136	 *
   137	 *     aux_ts = aux_base + (((mono_ts - mono_base) * conv_mult_aux) >> conv_shift)
   138	 *     mono_ts = mono_base + (((aux_ts - aux_base) * conv_mult_mono) >> conv_shift)
   139	 */
   140	
   141	#if !IS_ENABLED(CONFIG_TIME_KUNIT_TEST)
   142	static inline
   143	#endif
   144	struct tk_aux_mono_conv tk_aux_capture_mono_conv(ktime_t mono_now, u32 mono_mult,
   145							 ktime_t aux_now, u32 aux_mult,
   146							 u32 shift)
   147	{
   148		return (struct tk_aux_mono_conv) {
   149			.mono_base	= mono_now,
   150			.aux_base	= aux_now,
   151			.mono_mult	= mono_mult,
   152			.aux_mult	= aux_mult,
   153			.shift		= shift,
   154		};
   155	}
 > 156	EXPORT_SYMBOL_FOR_TIME_TEST(tk_aux_capture_mono_conv);
   157	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
