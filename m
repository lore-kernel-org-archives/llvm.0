Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13191FC8;
	Sun,  7 Dec 2025 01:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765070235; cv=none; b=GO/ICAWPkFmlIXqidSNGNflMJAjd4jCOzEpLrXg1CiySEsUI2K5mP6xtbkUmkeofnGH+bXCgn7TDz4EK9OpE0tVmUXRXlJnpMAkJo1nTYOtleNktwWotTTsmXX2jn8AL5FH5PZPPtPzU6+5z42f+t1nBsil8+y04gr4ie9tYB80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765070235; c=relaxed/simple;
	bh=SvD+v94iQoOG/LO0ET2QDVI1LlATn7aOjsB5xVSeOBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ko0tM1GPT0IKa+LWDQFfFNSsdwIyBh0xwTjkYzvV0pIBNHVeqWg6geLelnJekYmqx7irEuK9dwmCqw0roAt5sxA1XCIOGkqT78ubicBmgffsNKB/YcUo9mSF31zNINAZtJTUeUErXZSQx3L/f7MqcaE1c+IO90VdRmruardSTvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SaIN79tF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SaIN79tF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765070233; x=1796606233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SvD+v94iQoOG/LO0ET2QDVI1LlATn7aOjsB5xVSeOBY=;
  b=SaIN79tFWA0+0sRYICle1ukbeKypALA+QnQGnRIAHn0kdjgtoZv1oHi1
   9Iadb118AHohEN637zXvCSo1MYYjsBZKjqg7NgJ68GbZxNz47nblq+eMI
   ECHK4iF/84u3xdE6zSGt3nn26uGZM/Xj5SsmAJL0vbxjAZu1VrIRUDxsI
   F7Q0i1Dal/A6+3jkfkJp9wxNf/GjjT0tiN4z6c4Ji4Z/taksJ0OkY0QxO
   VyDPQRSuAvABz+DKi4sxZxj1CU+567+/bW4j85SuQKbH6UGztlpegW4MF
   DMSSd5L8tOHsWO5OWUa1dbwlj7xWT7GahZb1rZZl5g+OhqAflejk4NH3s
   w==;
X-CSE-ConnectionGUID: dpluJ1jZTYKpA74EOBaYZQ==
X-CSE-MsgGUID: LBRVI1h5QbWA8ZxTxSdQbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="66783405"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="66783405"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 17:17:13 -0800
X-CSE-ConnectionGUID: b5j8wqoTSuyNXKNCfimUrA==
X-CSE-MsgGUID: MY7ADiU0TQ+jAhmoz/9uew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="218968732"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Dec 2025 17:17:10 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vS3Od-00000000Irl-3dPl;
	Sun, 07 Dec 2025 01:17:07 +0000
Date: Sun, 7 Dec 2025 09:16:08 +0800
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
	Tamir Duberstein <tamird@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] printf: add __printf attribute
Message-ID: <202512070856.1syRb0ZL-lkp@intel.com>
References: <20251206-printf-kunit-printf-attr-v1-1-1682808b51d0@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206-printf-kunit-printf-attr-v1-1-1682808b51d0@gmail.com>

Hi Tamir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 559e608c46553c107dbba19dae0854af7b219400]

url:    https://github.com/intel-lab-lkp/linux/commits/Tamir-Duberstein/printf-add-__printf-attribute/20251206-212115
base:   559e608c46553c107dbba19dae0854af7b219400
patch link:    https://lore.kernel.org/r/20251206-printf-kunit-printf-attr-v1-1-1682808b51d0%40gmail.com
patch subject: [PATCH] printf: add __printf attribute
config: um-randconfig-001-20251207 (https://download.01.org/0day-ci/archive/20251207/202512070856.1syRb0ZL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512070856.1syRb0ZL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512070856.1syRb0ZL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/tests/printf_kunit.c:270:1: warning: GCC requires a function with the '__format__' attribute to be variadic [-Wgcc-compat]
     270 | test_hashed(struct kunit *kunittest, const char *fmt, const void *p)
         | ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
   Selected by [m]:
   - REGULATOR_RT5133 [=m] && REGULATOR [=y] && I2C [=m] && GPIOLIB [=y] && OF [=y]


vim +/__format__ +270 lib/tests/printf_kunit.c

707cc7280f452a lib/test_printf.c        Rasmus Villemoes 2015-11-06  268  
c23bf7282349cc lib/tests/printf_kunit.c Tamir Duberstein 2025-12-06  269  static void __printf(2, 3)
81a03aa9b88c5d lib/tests/printf_kunit.c Tamir Duberstein 2025-03-07 @270  test_hashed(struct kunit *kunittest, const char *fmt, const void *p)
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  271  {
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  272  	char buf[PLAIN_BUF_SIZE];
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  273  
81a03aa9b88c5d lib/tests/printf_kunit.c Tamir Duberstein 2025-03-07  274  	plain_hash_to_buffer(kunittest, p, buf, PLAIN_BUF_SIZE);
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  275  
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  276  	test(buf, fmt, p);
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  277  }
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  278  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
