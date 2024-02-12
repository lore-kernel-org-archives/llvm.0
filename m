Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFBEEAE3;
	Mon, 12 Feb 2024 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707728141; cv=none; b=myrtI0zKLuL5+A8czTyNu66LnEA7rroMvRkwE2JUUF1CDI7VTqfT1byyJkH/J6qstvsQNzILAiH8TgEVVNtNBv1LzMWK4FonrTeO3ExQNK2xsEKUFYufn2S2pAUf2/YQDVao2XCxSoB66E7okoZiOafBtAViybJNt230DGb/1R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707728141; c=relaxed/simple;
	bh=QzBInN6t0LT7Nc1BRMe1SWdKRHQFfYaEKUlqcdl8d+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qWYQe8xfyN1LkwYr4dEQLA5DDD4rgdfYtmFKiGL/kAJclAil4bH0wj+LQ1H2A7Rg+KMojqoVAC7KiC0/sfY9yebbbM8KjL91Dzls423LiZ5zJvKMf7ZH2gI5hjanDXaAULpcsKlDrWPJ+NMhKgi0uqspZ027ZQfUym8aMX+EY8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZiJrg4Qj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZiJrg4Qj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707728140; x=1739264140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QzBInN6t0LT7Nc1BRMe1SWdKRHQFfYaEKUlqcdl8d+8=;
  b=ZiJrg4Qjs5jAuASFY7mqe3rjPNbJbJ6IOFe+KKzrwtlHtETT3+FPqxTM
   /n46XiZygbSHQAZWm1FJLaepX0foFYqjCjGpswyTmJ8DJ5ybFa/y3oV1y
   pvw68FBkRrF9n+UMxmZxwPYStQjoA1xW2HanAPmvgs8LS0OoainsRmBca
   2YfMcTiE+RCxJHdxdT4Nu2tIHeU1GzlZVQQubbGWg8uMZDaLPKdmsOUzY
   +ZsHeK1S5K4cy1hY/ite646gx6Ig8Z+d4SHCavFfKYebpR5MzNPLMdiXX
   G6BJRCT8hg6FrbEWn3/qA6dFXN1BrpIG5WeV4xdtEZ/nq0EDP6a423y+v
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1829320"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="1829320"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 00:55:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="2495569"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Feb 2024 00:55:38 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZS6B-00072K-1v;
	Mon, 12 Feb 2024 08:55:35 +0000
Date: Mon, 12 Feb 2024 16:54:54 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sophgo:sg2000/stuck 3/5] drivers/clk/sophgo/clk-cv18xx-pll.c:28:2:
 error: incompatible pointer types passing 'unsigned long *' to parameter of
 type 'uint64_t *' (aka 'unsigned long long *')
Message-ID: <202402121642.7357uLlK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sophgo/linux.git sg2000/stuck
head:   1420ad016c811326d57be88f38fc355cbc1b5462
commit: 275b931b1a033fd3a1733d2eede791b589fcbe5e [3/5] clk: sophgo: Add CV1800/SG2000 series clock controller driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240212/202402121642.7357uLlK-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project c08b90c50bcac9f3f563c79491c8dbcbe7c3b574)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240212/202402121642.7357uLlK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402121642.7357uLlK-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/clk/sophgo/clk-cv18xx-pll.c:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/clk/sophgo/clk-cv18xx-pll.c:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/clk/sophgo/clk-cv18xx-pll.c:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/clk/sophgo/clk-cv18xx-pll.c:28:2: warning: comparison of distinct pointer types ('typeof ((rate)) *' (aka 'unsigned long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
      28 |         do_div(rate, pre_div_sel * post_div_sel);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> drivers/clk/sophgo/clk-cv18xx-pll.c:28:2: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
      28 |         do_div(rate, pre_div_sel * post_div_sel);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:213:38: note: passing argument to parameter 'dividend' here
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
>> drivers/clk/sophgo/clk-cv18xx-pll.c:28:2: warning: shift count >= width of type [-Wshift-count-overflow]
      28 |         do_div(rate, pre_div_sel * post_div_sel);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   8 warnings and 1 error generated.


vim +28 drivers/clk/sophgo/clk-cv18xx-pll.c

    19	
    20	static unsigned long ipll_calc_rate(unsigned long parent_rate,
    21					    unsigned long pre_div_sel,
    22					    unsigned long div_sel,
    23					    unsigned long post_div_sel)
    24	{
    25		unsigned long rate = parent_rate;
    26	
    27		rate *= div_sel;
  > 28		do_div(rate, pre_div_sel * post_div_sel);
    29	
    30		return rate;
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
