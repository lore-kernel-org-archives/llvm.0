Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2259B6F2FB;
	Sun,  7 Jul 2024 19:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720381284; cv=none; b=JcETCkJ6HsOk5vQtjLJCvs1Dk77P1i+OYG/xxvcoEWaZicjAYWqh3XsvOBtP8VNoMmx1A0GsjrSYK3LspDs3yHoOfaWDOjTP2ngJM5alMnx+EJvXyItxAju7hjbLoQf69PWmW/67573iLwBnQC7ht2aVetQD5oVGBhw1dGnl2xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720381284; c=relaxed/simple;
	bh=kYO/PXycSIMCVZ1dSA2pHriPbtYjljDjWcl/Y1G1BWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ba9eqI97HstSVIgRe2QqiA1Tc4o5fQUfhoXZ75fDuHbNeUcsbb2CHQJ4YCKFKrTXrqpIXhMLAkNGpNOYzw2+Q6c9PkbJw9FRJzmbQJztRGmULAnrvtnysbqMy0Z6l4wkqV0wKIt51BssAky+Yk1dGXn8QFTe8n3uWsvLJRwdAmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hD5QUBCR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hD5QUBCR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720381282; x=1751917282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kYO/PXycSIMCVZ1dSA2pHriPbtYjljDjWcl/Y1G1BWg=;
  b=hD5QUBCRLWWW9rKL57YV/n5KV4agErGFYg23RExUHdUHnwLcDhcv9zs5
   Oy9ZiKmzIRCc5tKzN2ebgi1/ZN7VoOW9PcbX/S5jdZ6TSp4mqLDgM7gXT
   Kdj3nKUqTJVWtZta0+bHaqkW2l962Si4DFkXFD/DTTH6QE1p9TmlWLd+w
   uZXdrGLOOQQU2ko1vBjyZLoAL9uva+myd4ajG/TbQfoH01TNMUopalTfu
   xKLVBiiFO8aMsX/l+0hCYOrGaTEmDXr92oFkHuDCuRY/yfsydf8567eaz
   rKN4Z9aoXhLXNhM/uCoLv4B9fBbTU29NAMcPL9NLttjqho0ZF9n6jfo7d
   Q==;
X-CSE-ConnectionGUID: 55dsizCqRO2g2yj+JNcieQ==
X-CSE-MsgGUID: 8iafSy1+RpWR3RnBZoXXsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="28979902"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="28979902"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 12:41:18 -0700
X-CSE-ConnectionGUID: 4+vQzwEASpyZbLDuxJjJAw==
X-CSE-MsgGUID: 3a7ExpBfSPeXZbUFG1sNlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="47080364"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Jul 2024 12:41:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQXl3-000VEI-1S;
	Sun, 07 Jul 2024 19:41:13 +0000
Date: Mon, 8 Jul 2024 03:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Pitre <nico@fluxnic.net>, Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nicolas Pitre <npitre@baylibre.com>, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] __arch_xprod64(): make __always_inline when
 optimizing for performance
Message-ID: <202407080326.fBdpm1Tq-lkp@intel.com>
References: <20240707171919.1951895-5-nico@fluxnic.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240707171919.1951895-5-nico@fluxnic.net>

Hi Nicolas,

kernel test robot noticed the following build errors:

[auto build test ERROR on arnd-asm-generic/master]
[also build test ERROR on arm/for-next arm/fixes soc/for-next linus/master v6.10-rc6 next-20240703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolas-Pitre/lib-math-test_div64-add-some-edge-cases-relevant-to-__div64_const32/20240708-013344
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20240707171919.1951895-5-nico%40fluxnic.net
patch subject: [PATCH v2 4/4] __arch_xprod64(): make __always_inline when optimizing for performance
config: arm-randconfig-003-20240708 (https://download.01.org/0day-ci/archive/20240708/202407080326.fBdpm1Tq-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407080326.fBdpm1Tq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407080326.fBdpm1Tq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:11:
   In file included from include/linux/sched.h:16:
   In file included from include/linux/cpumask.h:11:
   In file included from include/linux/kernel.h:27:
   In file included from include/linux/math.h:6:
>> arch/arm/include/asm/div64.h:60:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   __arch_xprod_64(uint64_t m, uint64_t n, bool bias)
   ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
   _SIG_SET_BINOP(sigorsets, _sig_or)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
                   a3 = a->sig[3]; a2 = a->sig[2];                         \
                        ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:


vim +/int +60 arch/arm/include/asm/div64.h

    54	
    55	#ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
    56	static __always_inline
    57	#else
    58	static inline
    59	#endif
  > 60	__arch_xprod_64(uint64_t m, uint64_t n, bool bias)
    61	{
    62		unsigned long long res;
    63		register unsigned int tmp asm("ip") = 0;
    64		bool no_ovf = __builtin_constant_p(m) &&
    65			      ((m >> 32) + (m & 0xffffffff) < 0x100000000);
    66	
    67		if (!bias) {
    68			asm (	"umull	%Q0, %R0, %Q1, %Q2\n\t"
    69				"mov	%Q0, #0"
    70				: "=&r" (res)
    71				: "r" (m), "r" (n)
    72				: "cc");
    73		} else if (no_ovf) {
    74			res = m;
    75			asm (	"umlal	%Q0, %R0, %Q1, %Q2\n\t"
    76				"mov	%Q0, #0"
    77				: "+&r" (res)
    78				: "r" (m), "r" (n)
    79				: "cc");
    80		} else {
    81			asm (	"umull	%Q0, %R0, %Q2, %Q3\n\t"
    82				"cmn	%Q0, %Q2\n\t"
    83				"adcs	%R0, %R0, %R2\n\t"
    84				"adc	%Q0, %1, #0"
    85				: "=&r" (res), "+&r" (tmp)
    86				: "r" (m), "r" (n)
    87				: "cc");
    88		}
    89	
    90		if (no_ovf) {
    91			asm (	"umlal	%R0, %Q0, %R1, %Q2\n\t"
    92				"umlal	%R0, %Q0, %Q1, %R2\n\t"
    93				"mov	%R0, #0\n\t"
    94				"umlal	%Q0, %R0, %R1, %R2"
    95				: "+&r" (res)
    96				: "r" (m), "r" (n)
    97				: "cc");
    98		} else {
    99			asm (	"umlal	%R0, %Q0, %R2, %Q3\n\t"
   100				"umlal	%R0, %1, %Q2, %R3\n\t"
   101				"mov	%R0, #0\n\t"
   102				"adds	%Q0, %1, %Q0\n\t"
   103				"adc	%R0, %R0, #0\n\t"
   104				"umlal	%Q0, %R0, %R2, %R3"
   105				: "+&r" (res), "+&r" (tmp)
   106				: "r" (m), "r" (n)
   107				: "cc");
   108		}
   109	
   110		return res;
   111	}
   112	#define __arch_xprod_64 __arch_xprod_64
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
