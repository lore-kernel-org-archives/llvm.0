Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62340EEDE;
	Tue, 22 Jul 2025 03:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753155182; cv=none; b=XHxaPIomW1AnojEIiX2SttIxZdiABzVdOMgOYd6jJL9LtB75+PB+L4R8Ufpw4twh7qtu5X3pISbilZhnYlqFe2JxLu+M3XEBjo+p1js8534y4OagHvhXGOckhxTS/P9WrPyBLXOg2Z+AX6FppG6vJy3G9Dr+9Oj9Zyev7ooHNd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753155182; c=relaxed/simple;
	bh=O+ii7kVyc307LUKZ0QVkEtNuXbxVGlKN4h9Vz4lya1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HsYgfKLtxe6M3coSrZc8qibvdxy8w0gyD0uyrJwcimogggTNJIL7gYN0zk7YYeVsF2MBFFxlMdBpg1PqYwUAPtxn9I5TDNqrjE86zAw+feZxp7DEY37C8lj7xrR7YB8BwTaaoL8+pC1QatbeaW6EzwRW4pY50TAhHS+KkkJDHNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfRuDDs4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfRuDDs4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753155181; x=1784691181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O+ii7kVyc307LUKZ0QVkEtNuXbxVGlKN4h9Vz4lya1A=;
  b=EfRuDDs44dOzaR4v9B0Gjbp39/FGYtyDNYYI8cRSS88R617XYxmJ6zM4
   OOVKhLqmsbJ6usQ1yaC27gE86OaOgHCrGAs7W9eLmvt253YityYKRF0j6
   RnDOejzI82A3UXdykfQSIWlZmM/7K/7rq9zEziEW1CsY74UgxiIZ8QILu
   V8LRsJFgYgm6UeWO0ic8ELApmjcsfrvRLl4VyZu06KyvN9reTMkWjV9f7
   fK412V22YlTxXO0qHQ12zW1SJNFQmRnm6o15fX6oQXNmlgGfu5W+piq4V
   UtzrZjcSzc9yxHGSS0zoiiengFHGCDZ6MbwO21mYsbktZF2s34fPbxikS
   g==;
X-CSE-ConnectionGUID: upYCLoyuSN2Cvcr3HPAfgg==
X-CSE-MsgGUID: abF9wZyYT/q+XaYx41zcpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55501761"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="55501761"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 20:33:00 -0700
X-CSE-ConnectionGUID: IacLddW1SryxXIaIJkRO0w==
X-CSE-MsgGUID: ivkqOrVmQe+sBSGwsJ2Aww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="190003965"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Jul 2025 20:32:59 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue3kN-000HOf-2I;
	Tue, 22 Jul 2025 03:32:55 +0000
Date: Tue, 22 Jul 2025 11:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: George Abraham P <george.abraham.p@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Suman Kumar Chakraborty <suman.kumar.chakraborty@intel.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Subject: [linux-next:master 10722/11398] include/linux/sprintf.h:11:54:
 error: type specifier missing, defaults to 'int'; ISO C99 and later do not
 support implicit int
Message-ID: <202507221115.Oel7jhRg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   97987520025658f30bb787a99ffbd9bbff9ffc9d
commit: 7c68005a46108ffaa598e91f1571e5f7f9acb6dc [10722/11398] crypto: qat - relocate power management debugfs helper APIs
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250722/202507221115.Oel7jhRg-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507221115.Oel7jhRg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221115.Oel7jhRg-lkp@intel.com/

Note: the linux-next/master HEAD 97987520025658f30bb787a99ffbd9bbff9ffc9d builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from drivers/crypto/intel/qat/qat_common/adf_pm_dbgfs_utils.c:4:
>> include/linux/sprintf.h:11:54: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      11 | __printf(2, 0) int vsprintf(char *buf, const char *, va_list);
         |                                                      ^
         |                                                      int
   include/linux/sprintf.h:11:20: warning: incompatible redeclaration of library function 'vsprintf' [-Wincompatible-library-redeclaration]
      11 | __printf(2, 0) int vsprintf(char *buf, const char *, va_list);
         |                    ^
   include/linux/sprintf.h:11:20: note: 'vsprintf' is a builtin with type 'int (char *restrict, const char *restrict, __builtin_va_list)'
>> include/linux/sprintf.h:13:71: error: unknown type name 'va_list'
      13 | __printf(3, 0) int vsnprintf(char *buf, size_t size, const char *fmt, va_list args);
         |                                                                       ^
   include/linux/sprintf.h:15:72: error: unknown type name 'va_list'
      15 | __printf(3, 0) int vscnprintf(char *buf, size_t size, const char *fmt, va_list args);
         |                                                                        ^
   include/linux/sprintf.h:17:70: error: unknown type name 'va_list'
      17 | __printf(2, 0) __malloc char *kvasprintf(gfp_t gfp, const char *fmt, va_list args);
         |                                                                      ^
   include/linux/sprintf.h:18:73: error: unknown type name 'va_list'
      18 | __printf(2, 0) const char *kvasprintf_const(gfp_t gfp, const char *fmt, va_list args);
         |                                                                         ^
   include/linux/sprintf.h:21:55: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      21 | __scanf(2, 0) int vsscanf(const char *, const char *, va_list);
         |                                                       ^
         |                                                       int
   include/linux/sprintf.h:21:19: warning: incompatible redeclaration of library function 'vsscanf' [-Wincompatible-library-redeclaration]
      21 | __scanf(2, 0) int vsscanf(const char *, const char *, va_list);
         |                   ^
   include/linux/sprintf.h:21:19: note: 'vsscanf' is a builtin with type 'int (const char *restrict, const char *restrict, __builtin_va_list)'
   2 warnings and 6 errors generated.


vim +/int +11 include/linux/sprintf.h

39ced19b9e60f6f Andy Shevchenko 2023-08-14   9  
39ced19b9e60f6f Andy Shevchenko 2023-08-14  10  __printf(2, 3) int sprintf(char *buf, const char * fmt, ...);
39ced19b9e60f6f Andy Shevchenko 2023-08-14 @11  __printf(2, 0) int vsprintf(char *buf, const char *, va_list);
39ced19b9e60f6f Andy Shevchenko 2023-08-14  12  __printf(3, 4) int snprintf(char *buf, size_t size, const char *fmt, ...);
39ced19b9e60f6f Andy Shevchenko 2023-08-14 @13  __printf(3, 0) int vsnprintf(char *buf, size_t size, const char *fmt, va_list args);
39ced19b9e60f6f Andy Shevchenko 2023-08-14  14  __printf(3, 4) int scnprintf(char *buf, size_t size, const char *fmt, ...);
39ced19b9e60f6f Andy Shevchenko 2023-08-14  15  __printf(3, 0) int vscnprintf(char *buf, size_t size, const char *fmt, va_list args);
39ced19b9e60f6f Andy Shevchenko 2023-08-14  16  __printf(2, 3) __malloc char *kasprintf(gfp_t gfp, const char *fmt, ...);
39ced19b9e60f6f Andy Shevchenko 2023-08-14  17  __printf(2, 0) __malloc char *kvasprintf(gfp_t gfp, const char *fmt, va_list args);
39ced19b9e60f6f Andy Shevchenko 2023-08-14  18  __printf(2, 0) const char *kvasprintf_const(gfp_t gfp, const char *fmt, va_list args);
39ced19b9e60f6f Andy Shevchenko 2023-08-14  19  

:::::: The code at line 11 was first introduced by commit
:::::: 39ced19b9e60f6f5b80db6b72965a8cf1982439d lib/vsprintf: split out sprintf() and friends

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
