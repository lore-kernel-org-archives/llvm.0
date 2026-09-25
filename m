Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3B242A154;
	Fri, 25 Sep 2026 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334717; cv=none; b=TLLArrZmNQuxb3qKSz/ERrqrew0HyaA9f8bqPe+9p1U2Ja+GLN6j/pyBTR+F5KDbutqob7MIr37UVO7M5BZuPSyUJdhgFzcwLm3LEHKnOtS3GECKdaveu3FtuG5vB2ep010XTbuU3xzeLtue3EFJ+cc72qAlSBraEqKtor14d9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334717; c=relaxed/simple;
	bh=a0mtBeQnsn5xdQ+v4nZmwL1q5eg+Si1BJLhqYC8maSY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bllAG/0tllhiog2Z0uhAWHNUvCVF0l/qzBEOvmW3LWPdeYvDTwNoGSvHvhcDhSl+lLw8ArHCcugr99aYqRI1tC2dZh6QR/Gl/ccfQ3ywnh4ls5maAPSlr4kSMVIBaXFtxp1YfMnxCIus1JcMKTaMWi7skKSA4KpASFJBtSPFUpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TuCol7qa; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TuCol7qa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790334716; x=1821870716;
  h=date:from:to:cc:subject:message-id;
  bh=a0mtBeQnsn5xdQ+v4nZmwL1q5eg+Si1BJLhqYC8maSY=;
  b=TuCol7qamtrQl3cnrzzrSaWZMQXKzZfT+aFpLTiavNR4ikWDQqoRkJZy
   /r7UMi/xm55No22m3etfbXORbtSZwsZ/lIUKqEtZwZyC3A+vOtzRzQ5Sj
   Pbtp0Y4U0DO7B+nBE9xnUADMxy5T4mdOnzQtLkCgQHu7vcHfbMxlnjkVt
   hQvWTPwiePJjYF+huoVOVDVPt8HUOZNXwrBgfO0ouwh5IB3ZDUmz9+Qe1
   WInf1TOXRinfIVJH6y2p7+60TemoOCuz9q3tTo2HpQru3l+ibnn/KHGN3
   P9I/rxfMO1DjmHJ7cEQL6+vLm+95/3q5q43+8lwBRbisdPfFqqYk9HO8V
   A==;
X-CSE-ConnectionGUID: hOG0gL/2RHqJHWGWv/XS6g==
X-CSE-MsgGUID: myvdGb8mQMyUvOTpvlSwYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90025778"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90025778"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:11:54 -0700
X-CSE-ConnectionGUID: akHjtHCiRZOUzJj5vb+V6g==
X-CSE-MsgGUID: w2VPciMPQziGqdbSVXaVBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273803663"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Sep 2026 04:11:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA3qI-00000000KVK-3SRw;
	Fri, 25 Sep 2026 11:11:50 +0000
Date: Fri, 25 Sep 2026 19:11:00 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 610/673]
 include/asm-generic/io.h:1099:9: error: call to undeclared function '__pa';
 ISO C99 and later do not support implicit function declarations
Message-ID: <202609251944.whUSNQ5N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: d217cdb672619041e213243f6f352cb6422d3a59 [610/673] Revert "simplify asm/io.h"
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260925/202609251944.whUSNQ5N-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251944.whUSNQ5N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251944.whUSNQ5N-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/iomem_copy.c:8:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
>> include/asm-generic/io.h:1099:9: error: call to undeclared function '__pa'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1099 |         return __pa((unsigned long)address);
         |                ^
>> include/asm-generic/io.h:1107:9: error: call to undeclared function '__va'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1107 |         return __va(address);
         |                ^
>> include/asm-generic/io.h:1107:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
    1107 |         return __va(address);
         |                ^~~~~~~~~~~~~
   3 errors generated.


vim +/__pa +1099 include/asm-generic/io.h

5820acdc34867d Arnd Bergmann 2026-05-08  1090  
5820acdc34867d Arnd Bergmann 2026-05-08  1091  /*
5820acdc34867d Arnd Bergmann 2026-05-08  1092   * Change virtual addresses to physical addresses and vv.
5820acdc34867d Arnd Bergmann 2026-05-08  1093   * These are pretty trivial
5820acdc34867d Arnd Bergmann 2026-05-08  1094   */
5820acdc34867d Arnd Bergmann 2026-05-08  1095  #ifndef virt_to_phys
5820acdc34867d Arnd Bergmann 2026-05-08  1096  #define virt_to_phys virt_to_phys
5820acdc34867d Arnd Bergmann 2026-05-08  1097  static inline unsigned long virt_to_phys(volatile void *address)
5820acdc34867d Arnd Bergmann 2026-05-08  1098  {
5820acdc34867d Arnd Bergmann 2026-05-08 @1099  	return __pa((unsigned long)address);
5820acdc34867d Arnd Bergmann 2026-05-08  1100  }
5820acdc34867d Arnd Bergmann 2026-05-08  1101  #endif
5820acdc34867d Arnd Bergmann 2026-05-08  1102  
5820acdc34867d Arnd Bergmann 2026-05-08  1103  #ifndef phys_to_virt
5820acdc34867d Arnd Bergmann 2026-05-08  1104  #define phys_to_virt phys_to_virt
5820acdc34867d Arnd Bergmann 2026-05-08  1105  static inline void *phys_to_virt(unsigned long address)
5820acdc34867d Arnd Bergmann 2026-05-08  1106  {
5820acdc34867d Arnd Bergmann 2026-05-08 @1107  	return __va(address);
5820acdc34867d Arnd Bergmann 2026-05-08  1108  }
5820acdc34867d Arnd Bergmann 2026-05-08  1109  #endif
5820acdc34867d Arnd Bergmann 2026-05-08  1110  

:::::: The code at line 1099 was first introduced by commit
:::::: 5820acdc34867db3abad330764e2069a3fb15216 Revert "asm/io.h: move virt_to_phys/phys_to_virt"

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
