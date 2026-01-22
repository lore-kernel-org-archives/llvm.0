Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03862D73B1;
	Thu, 22 Jan 2026 01:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769045015; cv=none; b=NIy9QLmageUUGdtRAIRyV71rcjFVAoRQTD3HK5h9zctVZkzP/XK/ggx6GCaS/OabCdgIaQa0SDKEoFe6UAh+fTzYjDE0ul9QSmqzCZZ8DvE7RPlAE4cmOU+u96T91G3NkOhu227VoO7w1lLbYWkX/y5CKGdJNmk1Xc/V5fDkcbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769045015; c=relaxed/simple;
	bh=roQTG7BUnVXv2IGEQlqh5+zLrO9mjPF10u/iCVEG5JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OcXIBmSmjzn4ffQD2fSTuXxW0fmTMPwzpytvF4peJTiMie7tLOKJamKHFVrzuJ/FYILID4Lpz2G1sdZIjsphEJ/LBqKEwOkXaygl73bkXbmYn6E0hlkkiWyW6Cg5DsG/PfpTXi6WWTA+VlqZu4l0iHlndO0SrO4EX4qsFfl8zIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0SsDbH/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0SsDbH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769045013; x=1800581013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=roQTG7BUnVXv2IGEQlqh5+zLrO9mjPF10u/iCVEG5JM=;
  b=Z0SsDbH/h2nZ9i3Vy6g8fSwQ/JA1PDgc+4Pc9epx6fyuIkoTFWS/J5yS
   1fV4Tc4fXSDv4V53il5myynKn6snzlhpmJmv+3dGlFND/ItsFDtPsrQMx
   vXHV0F3NMZQZBb+CegYQ+/qxxClC2m3Kw6p+cXU5BmdXNe7e8HIVe4lrf
   x/B+BDtihh95vcyWRvkhzWdP9courW1z8SVhVHZsptww6OOCipAKeqDxQ
   UbHs7tV/CAybeEmXVa9Na4jjk1/MkJJqfHhvt879Ss9rJrDZ1nsbNCztw
   yrS+yi8kOQAMd1ZLS1gCRHdrUGg9R7t7esPSjdJnUXNRC24tU3PKNr1Yi
   g==;
X-CSE-ConnectionGUID: nGnuxtYDR/iKvhTu1Bon4Q==
X-CSE-MsgGUID: SMzM2rnMRICIPVU0suXxfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70448945"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70448945"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 17:23:29 -0800
X-CSE-ConnectionGUID: 509RMO9hSZeFWJL92bc8nQ==
X-CSE-MsgGUID: lnLLwhhmQUu/f10JpD2HZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="205842636"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Jan 2026 17:23:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vijPt-00000000SG5-4BMx;
	Thu, 22 Jan 2026 01:23:21 +0000
Date: Thu, 22 Jan 2026 09:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: david.laight.linux@gmail.com, Nathan Chancellor <nathan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kees Cook <keescook@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH next 12/14] bits: move the defitions of BIT() and
 BIT_ULL() back to linux/bits.h
Message-ID: <202601220951.7C4YG7hB-lkp@intel.com>
References: <20260121145731.3623-13-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121145731.3623-13-david.laight.linux@gmail.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260120]

url:    https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/overflow-Reduce-expansion-of-__type_max/20260122-013456
base:   next-20260120
patch link:    https://lore.kernel.org/r/20260121145731.3623-13-david.laight.linux%40gmail.com
patch subject: [PATCH next 12/14] bits: move the defitions of BIT() and BIT_ULL() back to linux/bits.h
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260122/202601220951.7C4YG7hB-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220951.7C4YG7hB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220951.7C4YG7hB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/bounds.c:14:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/arm64/include/asm/barrier.h:14:
>> arch/arm64/include/asm/alternative-macros.h:18:20: warning: 'unsigned' is not defined, evaluates to 0 [-Wundef]
      18 | #if ARM64_NCAPS >= ARM64_CB_BIT
         |                    ^
   arch/arm64/include/asm/alternative-macros.h:16:22: note: expanded from macro 'ARM64_CB_BIT'
      16 | #define ARM64_CB_BIT    BIT(ARM64_CB_SHIFT)
         |                         ^
   include/linux/bits.h:94:18: note: expanded from macro 'BIT'
      94 | #define BIT(nr)         BIT_TYPE(unsigned long, nr)
         |                         ^
   include/linux/bits.h:88:4: note: expanded from macro 'BIT_TYPE'
      88 |         ((unsigned int)BIT_INPUT_CHECK(+(nr), BITS_PER_TYPE(type)) + ((type)1 << (nr)))
         |           ^
   In file included from kernel/bounds.c:14:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/arm64/include/asm/barrier.h:14:
>> arch/arm64/include/asm/alternative-macros.h:18:20: error: token is not a valid binary operator in a preprocessor subexpression
      18 | #if ARM64_NCAPS >= ARM64_CB_BIT
         |                    ^~~~~~~~~~~~
   arch/arm64/include/asm/alternative-macros.h:16:22: note: expanded from macro 'ARM64_CB_BIT'
      16 | #define ARM64_CB_BIT    BIT(ARM64_CB_SHIFT)
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:94:18: note: expanded from macro 'BIT'
      94 | #define BIT(nr)         BIT_TYPE(unsigned long, nr)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:88:13: note: expanded from macro 'BIT_TYPE'
      88 |         ((unsigned int)BIT_INPUT_CHECK(+(nr), BITS_PER_TYPE(type)) + ((type)1 << (nr)))
         |           ~~~~~~~~ ^
   1 warning and 1 error generated.
   make[3]: *** [scripts/Makefile.build:182: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1330: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +18 arch/arm64/include/asm/alternative-macros.h

4c0bd995d73ed8 Mark Rutland 2022-09-12  17  
4c0bd995d73ed8 Mark Rutland 2022-09-12 @18  #if ARM64_NCAPS >= ARM64_CB_BIT
4c0bd995d73ed8 Mark Rutland 2022-09-12  19  #error "cpucaps have overflown ARM64_CB_BIT"
4c0bd995d73ed8 Mark Rutland 2022-09-12  20  #endif
7cda23da52ad79 Will Deacon  2020-06-30  21  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
