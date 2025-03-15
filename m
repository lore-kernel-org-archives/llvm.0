Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5CED531;
	Sat, 15 Mar 2025 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742029813; cv=none; b=i4RFhkRm3Bi2tVgZo/sSwxafPuAnyHqmpC4DYXlCqVt3PeSkUG4cUQp7YO70C7spWPDsPL7L+6uoBLcJpkGjlkv46z3mwTAhaKyRNOiIfZcxfeUmYfwtDUy+vD2R3+NXlTaT0E5Kudb8awGyzWvzv8fkChKRF32j7pXTFv82Gw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742029813; c=relaxed/simple;
	bh=sykcBFCfTrScqo1uV+BY7U/iY5Ywnba/BNBPGphPvJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pPvVXbKZcDGngxNfVfEUu8+hD4+b352/dwtOtLUiab3HfPa6JI8VAZzjsEv5rWjL/2tYsXLEGGZfQW+woanKU7nNASVasdBBFOKrpl9VtHATW4z46rcPjlLydkfkrcsW0RlcCqA1W6RxUlz2mRSYLG5d6bsfsii8O63MPaM17II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZNPQdeE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZNPQdeE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742029812; x=1773565812;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sykcBFCfTrScqo1uV+BY7U/iY5Ywnba/BNBPGphPvJs=;
  b=cZNPQdeEtGtbmxxQYQumNrPYH3Xlvdmw9li8kpwS3Pwk7Q8TQ8rfQn/B
   EPAED+NA+lfRyYNK3qBXe9STkZqSabAuQPSN674tPPWLhEWRUpAa6HkYl
   ++gTZZVdr+nOhze7bs+QTVuALqcNZ8v+0/F2vDox7Cip0QU08c/pq7awj
   xrsnb9Q+F3RLZOLBRn8HwC55Phcrqj4qOoIuHEJzOsik5YcoE0jC5waqq
   76qR4CMjZP4AcvK2vQRCnRfvHQhNf1mo2lgWvFkKEGleTZnCEL5SbRh3s
   sv1vG/SbGR32j8Pa1SS9eXs4oR0D/3SpuGgocpRW9VnqkZlL+sPHksprp
   g==;
X-CSE-ConnectionGUID: LfvU5vFYS+6YpMDN5f7qXQ==
X-CSE-MsgGUID: Ctbl8HM9SIyZL2291oF89Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="46830873"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="46830873"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 02:10:11 -0700
X-CSE-ConnectionGUID: z+zJKdhGSv6iAcp6v2iSaA==
X-CSE-MsgGUID: r4vbHY9qS92jB53VpdRY5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="121697823"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 15 Mar 2025 02:10:09 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttNWw-000BC3-3C;
	Sat, 15 Mar 2025 09:10:06 +0000
Date: Sat, 15 Mar 2025 17:09:15 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to_build 8/15] include/asm-generic/io.h:977:9:
 error: passing 'const volatile void *' to parameter of type 'volatile void
 *' discards qualifiers
Message-ID: <202503151758.IYVjltC3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to_build
head:   02710864b974d663d56bc99493fb1976caab42a2
commit: 58774c1d8c8834d8be1dbea1e8ca339792d73935 [8/15] mips: drop GENERIC_IOMAP wrapper
config: mips-bcm63xx_defconfig (https://download.01.org/0day-ci/archive/20250315/202503151758.IYVjltC3-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151758.IYVjltC3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151758.IYVjltC3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
   In file included from include/linux/mm_types.h:5:
   In file included from include/linux/mm_types_task.h:14:
   In file included from arch/mips/include/asm/page.h:181:
   In file included from arch/mips/include/asm/io.h:547:
>> include/asm-generic/io.h:977:9: error: passing 'const volatile void *' to parameter of type 'volatile void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     977 |         readsb(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:429:1: note: passing argument to parameter 'mem' here
     429 | BUILDSTRING(b, u8)
         | ^
   arch/mips/include/asm/io.h:425:10: note: expanded from macro 'BUILDSTRING'
     425 |                                                                         \
         |                                                                         ^
   arch/mips/include/asm/io.h:389:55: note: expanded from macro '\
   __BUILD_MEMORY_STRING'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                                       ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
   In file included from include/linux/mm_types.h:5:
   In file included from include/linux/mm_types_task.h:14:
   In file included from arch/mips/include/asm/page.h:181:
   In file included from arch/mips/include/asm/io.h:547:
   include/asm-generic/io.h:986:9: error: passing 'const volatile void *' to parameter of type 'volatile void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     986 |         readsw(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:430:1: note: passing argument to parameter 'mem' here
     430 | BUILDSTRING(w, u16)
         | ^
   arch/mips/include/asm/io.h:425:10: note: expanded from macro 'BUILDSTRING'
     425 |                                                                         \
         |                                                                         ^
   arch/mips/include/asm/io.h:389:55: note: expanded from macro '\
   __BUILD_MEMORY_STRING'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                                       ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
   In file included from include/linux/mm_types.h:5:
   In file included from include/linux/mm_types_task.h:14:
   In file included from arch/mips/include/asm/page.h:181:
   In file included from arch/mips/include/asm/io.h:547:
   include/asm-generic/io.h:995:9: error: passing 'const volatile void *' to parameter of type 'volatile void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     995 |         readsl(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:431:1: note: passing argument to parameter 'mem' here
     431 | BUILDSTRING(l, u32)
         | ^
   arch/mips/include/asm/io.h:425:10: note: expanded from macro 'BUILDSTRING'
     425 |                                                                         \
         |                                                                         ^
   arch/mips/include/asm/io.h:389:55: note: expanded from macro '\
   __BUILD_MEMORY_STRING'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                                       ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
   In file included from include/linux/mm_types.h:5:
   In file included from include/linux/mm_types_task.h:14:
   In file included from arch/mips/include/asm/page.h:181:
   In file included from arch/mips/include/asm/io.h:547:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   1 warning and 3 errors generated.
   make[3]: *** [scripts/Makefile.build:102: arch/mips/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +977 include/asm-generic/io.h

9e44fb1816dba8f Horia Geantă   2016-05-19  971  
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  972  #ifndef ioread8_rep
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  973  #define ioread8_rep ioread8_rep
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  974  static inline void ioread8_rep(const volatile void __iomem *addr, void *buffer,
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  975  			       unsigned int count)
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  976  {
9ab3a7a0d2b4177 Thierry Reding 2014-07-04 @977  	readsb(addr, buffer, count);
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  978  }
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  979  #endif
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  980  

:::::: The code at line 977 was first introduced by commit
:::::: 9ab3a7a0d2b417773e8e8a880fc3a69f7fc1f57a asm-generic/io.h: Implement generic {read,write}s*()

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
