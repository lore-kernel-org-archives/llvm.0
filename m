Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB8C21D00D;
	Fri,  8 Aug 2025 06:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754634127; cv=none; b=g0ggGu6BMo+MiCtS6OP2zryh8OFhtlDflsICFUcCOBILVVSCMv4NOtYODwvMQwfuvUrE4TH4YMTB/XyX3IVS5B3DthtvPudQv++RcBSUQoRjCs7ps60Mn0g/z9UltDZXP1j+GCUMJQAWzoFkr5dDKNjcFvtYsxNXWtYzhnbQFdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754634127; c=relaxed/simple;
	bh=wyCinmD6gBK2b3vCbcjV/7csg0R5EgDjr5P8FZB/7jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uv+6o9dKpTIHUDliSPJF3zqJoFHF5GUAyqQavicONrZ5DPG0SouOKoabVEKPLcbQFIQv3cizBFNWivLmVNVK5KEvhzsXPW6lXeMl+XkfI/mt9CllPNZ59sil92mSlxfZ0SEwUoZty6DTKqrbhVZIdeCp1ldRqdTb/VQMaF3s0x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EpfVd62F; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpfVd62F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754634123; x=1786170123;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wyCinmD6gBK2b3vCbcjV/7csg0R5EgDjr5P8FZB/7jU=;
  b=EpfVd62FtOrvghPqBPZ+J297YF7hhBMy8Gq//fo8HgtlLRdcLud6aG0H
   5JfFfTzj7a34vTn9OCx6z9+fd5CV/YfH88DWtPhrtmqyJZlB6idpT+ET+
   wlVs/M+0J4wWKBPYOl3o0KfeLoiqIyrSYxNyiuWWC1e72JBIEeOnW0JdX
   bLRPFZaV1jQK4QbOeLFfry5F+f8X9hGaDQG7TW3TdrJbYfZo1FLn+qtv0
   JPol/bqm0YTgZU36TgVZ94ElmVofyO7gMqSSXecYrvtF5Mt5EyEyV31ZU
   b8toRIeIYjWQdHqipkBJRJnybl4/IBnTExPKgMxjJo11nX2RoP874iY1L
   w==;
X-CSE-ConnectionGUID: ZsPe1zCtSs6VrffXcNKhFw==
X-CSE-MsgGUID: SZE2m4b/RVGx/xuPdG8A8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="79535377"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="79535377"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 23:22:02 -0700
X-CSE-ConnectionGUID: ghM0aSbeS52TOVHv6a2FcA==
X-CSE-MsgGUID: aK21ZVGVTbui++mwbwwAjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="169380430"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 07 Aug 2025 23:21:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukGTn-0003b0-1b;
	Fri, 08 Aug 2025 06:21:36 +0000
Date: Fri, 8 Aug 2025 14:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dimitri Sivanich <sivanich@hpe.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jiri Wiesner <jwiesner@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jonathan Corbet <corbet@lwn.net>, Steve Wahl <steve.wahl@hpe.com>,
	Justin Ernst <justin.ernst@hpe.com>,
	Kyle Meyer <kyle.meyer@hpe.com>,
	Russ Anderson <russ.anderson@hpe.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2] x86/tsc: Disable clocksource watchdog for TSC on
 recent UV
Message-ID: <202508081446.3ZnRCG1T-lkp@intel.com>
References: <aJH9ke0k0HnL8g6h@hpe.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJH9ke0k0HnL8g6h@hpe.com>

Hi Dimitri,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/master linus/master v6.16 next-20250807]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dimitri-Sivanich/x86-tsc-Disable-clocksource-watchdog-for-TSC-on-recent-UV/20250806-120227
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/aJH9ke0k0HnL8g6h%40hpe.com
patch subject: [PATCH v2] x86/tsc: Disable clocksource watchdog for TSC on recent UV
config: i386-randconfig-011-20250808 (https://download.01.org/0day-ci/archive/20250808/202508081446.3ZnRCG1T-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508081446.3ZnRCG1T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508081446.3ZnRCG1T-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/tsc.c:1264:39: error: call to undeclared function 'is_uvy_hub'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1264 |             (topology_max_packages() <= 4 || is_uvy_hub()))
         |                                              ^
   arch/x86/kernel/tsc.c:1517:6: error: call to undeclared function 'is_early_uv_system'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1517 |         if (is_early_uv_system())
         |             ^
   2 errors generated.


vim +/is_uvy_hub +1264 arch/x86/kernel/tsc.c

  1235	
  1236	static void __init check_system_tsc_reliable(void)
  1237	{
  1238	#if defined(CONFIG_MGEODEGX1) || defined(CONFIG_MGEODE_LX) || defined(CONFIG_X86_GENERIC)
  1239		if (is_geode_lx()) {
  1240			/* RTSC counts during suspend */
  1241	#define RTSC_SUSP 0x100
  1242			unsigned long res_low, res_high;
  1243	
  1244			rdmsr_safe(MSR_GEODE_BUSCONT_CONF0, &res_low, &res_high);
  1245			/* Geode_LX - the OLPC CPU has a very reliable TSC */
  1246			if (res_low & RTSC_SUSP)
  1247				tsc_clocksource_reliable = 1;
  1248		}
  1249	#endif
  1250		if (boot_cpu_has(X86_FEATURE_TSC_RELIABLE))
  1251			tsc_clocksource_reliable = 1;
  1252	
  1253		/*
  1254		 * Disable the clocksource watchdog when the system has:
  1255		 *  - TSC running at constant frequency
  1256		 *  - TSC which does not stop in C-States
  1257		 *  - the TSC_ADJUST register which allows to detect even minimal
  1258		 *    modifications
  1259		 *  - not more than four packages
  1260		 */
  1261		if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
  1262		    boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
  1263		    boot_cpu_has(X86_FEATURE_TSC_ADJUST) &&
> 1264		    (topology_max_packages() <= 4 || is_uvy_hub()))
  1265			tsc_disable_clocksource_watchdog();
  1266	}
  1267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
