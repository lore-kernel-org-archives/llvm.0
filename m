Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF54533ADAF;
	Sat,  5 Sep 2026 18:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788634561; cv=none; b=QR/on3LLDzCWLxYdntT/QtwO5rcKyLceZJYQLRfO5XmO61Zv9TVyYRQPnvttF6fGogRf/gdc0WNnL2lHEYlbV2ScEmwZ44siWtyozEiJa2TYTelKfiyrWL3qujFG7ghx77R6pNvK5AuhThCHRBnFt32fkY7UM7MGuxH/dYNg6sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788634561; c=relaxed/simple;
	bh=Bg0GDYRC8gosaIgPFG7QOwtAyEgvc/oRU/CSL9I9B7g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Eoc0X94rO4K2/iAReg390TQJTFESB7OyTvc5j04O8KYYaN027WPCj2i+0T3xoBKGZRk+xB5ng7g0lItZBHYllp0czhj9F26kn70acWxTT1L2Y7/pJqjmx9XnoXTF3XNIMZfsZw8nlLdNRrQpucuUt0MG80Ma37Ry27GkHf8nOhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oECu+sMx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oECu+sMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788634558; x=1820170558;
  h=date:from:to:cc:subject:message-id;
  bh=Bg0GDYRC8gosaIgPFG7QOwtAyEgvc/oRU/CSL9I9B7g=;
  b=oECu+sMxeku1Bo+RVnN6hkPK6gPCbOntVgdFMHK9uk0Xf8CtLaL7Pc4V
   jybVmrg5Xw2wIp59wCslM1G2OYVIhs8hlR81iEzIPCg8du+C+xAUa5kkl
   /sEjKagSZANgCVDUD9yIcZzWFsnRuHUlWFQJ6aqm7RHjGDKXm6wQSawXY
   0UVYwLXIvunFBfpLTpVf3b/UFdc2lF2Kej23Jwm/Z5C+cep4gBd645Mky
   RKedZ9//TDjATiqtOaEn8fxsGFrxOIyYoiTJH7ZKOLWKdj1P1hVk7/DOj
   +YbPdyAIawoLQhm7MvltgNO3VIX41l/7/Ve+KQEK9GIA+AYrUD14KEOcw
   w==;
X-CSE-ConnectionGUID: k+snkjagRTee9Q/6k1AopA==
X-CSE-MsgGUID: VmCQCrA8Qruk+y07voVb3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="106470071"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="106470071"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 11:55:58 -0700
X-CSE-ConnectionGUID: VX9CB+itR3y9ukffT2pvkA==
X-CSE-MsgGUID: jnUFOyi6TfKl1FbG06ocLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="269819251"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Sep 2026 11:55:56 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2vYP-000000000zb-4Bxt;
	Sat, 05 Sep 2026 18:55:54 +0000
Date: Sun, 06 Sep 2026 02:55:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-libstub-guid-conversion 4/4]
 drivers/firmware/efi/libstub/printk.c:104:12: error: 'const u8 *' (aka 'const
 unsigned char *') and 'const char *' are not pointers to compatible types
Message-ID: <202609060200.riINTkvQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-libstub-guid-conversion
head:   5701341f80f05258b56124f47fdde4e10ca3e2aa
commit: 5701341f80f05258b56124f47fdde4e10ca3e2aa [4/4] efi/libstub: Factor out utf8-to-utf16 conversion from efi_puts()
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260906/202609060200.riINTkvQ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260906/202609060200.riINTkvQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609060200.riINTkvQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/efi/libstub/printk.c:81:43: error: unknown type name 'efi_char_16_t'; did you mean 'efi_char16_t'?
      81 | size_t efi_utf8_to_utf16(const char *str, efi_char_16_t *buf, size_t lim)
         |                                           ^~~~~~~~~~~~~
         |                                           efi_char16_t
   include/linux/efi.h:50:13: note: 'efi_char16_t' declared here
      50 | typedef u16 efi_char16_t;               /* UNICODE character */
         |             ^
>> drivers/firmware/efi/libstub/printk.c:104:12: error: 'const u8 *' (aka 'const unsigned char *') and 'const char *' are not pointers to compatible types
     104 |         return s8 - str;
         |                ~~ ^ ~~~
   drivers/firmware/efi/libstub/printk.c:81:8: warning: no previous prototype for function 'efi_utf8_to_utf16' [-Wmissing-prototypes]
      81 | size_t efi_utf8_to_utf16(const char *str, efi_char_16_t *buf, size_t lim)
         |        ^
   drivers/firmware/efi/libstub/printk.c:81:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      81 | size_t efi_utf8_to_utf16(const char *str, efi_char_16_t *buf, size_t lim)
         | ^
         | static 
   1 warning and 2 errors generated.


vim +104 drivers/firmware/efi/libstub/printk.c

    70	
    71	/**
    72	 * efi_str_to_utf16 - Convert a UTF-8 string to UTF-16
    73	 * @str:	UTF-8 encoded string
    74	 * @buf:	The buffer to store the converted UTF-16
    75	 * @lim:	The size of the buffer in UTF-16 characters
    76	 *
    77	 * Converts as many UTF-8 characters as will fit into the buffer,
    78	 * and terminates it with a NULL wchar. Returns the number of bytes
    79	 * consumed from the input string.
    80	 */
    81	size_t efi_utf8_to_utf16(const char *str, efi_char_16_t *buf, size_t lim)
    82	{
    83		const u8 *s8 = (const u8 *)str;
    84		size_t pos = 0;
    85		u32 c32;
    86	
    87		while (*s8 && pos + 2 < lim) {
    88			if (*s8 == '\n')
    89				buf[pos++] = L'\r';
    90			c32 = utf8_to_utf32(&s8);
    91			if (c32 < 0x10000) {
    92				/* Characters in plane 0 use a single word. */
    93				buf[pos++] = c32;
    94			} else {
    95				/*
    96				 * Characters in other planes encode into a surrogate
    97				 * pair.
    98				 */
    99				buf[pos++] = (0xd800 - (0x10000 >> 10)) + (c32 >> 10);
   100				buf[pos++] = 0xdc00 + (c32 & 0x3ff);
   101			}
   102		}
   103		buf[pos] = L'\0';
 > 104		return s8 - str;
   105	}
   106	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
