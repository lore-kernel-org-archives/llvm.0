Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468AA2E403;
	Thu, 18 Jan 2024 19:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705605633; cv=none; b=FCCSa3AT9fn0uaLpohDbEYaHieIo4tc+Rx4dGZUr2Hllz7t1bdMdhbWWhbRV5KtJEhkSURH+2//V53r+zge4kc9JYNWkqh93V+ensBjsb6yjBYOkI4y6UM0UZCSeuvCKovyhWkEhKQXupKHazwSTKrQZtnCMjOVwp4cHW4rxv70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705605633; c=relaxed/simple;
	bh=u+bu6fIJe+t2MgzzScAtPgl/Hj2C0V2CPgxfr6S27Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y+E32mmDwGDM0M2ZRK3EpRYfMLQPmnuQDhlwFbJFWqEWBMAu1UZ6UZFba93aR4kHSfA6tw9gVPGFQBIY5pa4yQQtkLfReR1tsRDFzAYbzBx2R74ETkHJVxOx0FZxloHPr4snHQ4hqllnI+TGXQzbxKeWlBGfrlbtNTqNATUMbdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fh4Vsa62; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fh4Vsa62"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705605630; x=1737141630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u+bu6fIJe+t2MgzzScAtPgl/Hj2C0V2CPgxfr6S27Zc=;
  b=Fh4Vsa621lkLSPU8A/lfmCTf0H0F2TUhI2hV+qD/3MtZoaqQ75cuk1Sj
   4fHoRed5644PCYndth+SfcQsRomEed7WNzqrfW85w1u5i18IvSDTSrJXH
   uM//q8FcGRHkQ1u3TyHPDWmd7nsF44unailHOxThpORlSKgNwM7QHHxcJ
   nLYIfJErtXVqkfZQQ9r0114NabKF/u0MNwe/ixIpWVBpcZXQhXKqQZW5y
   M6TetzIMFntzoND7Z32EiJDBYnfYbg4b+5WWtH327P4g8cyfDcmxEWoiA
   BADXoz50AcUu+KtXPvn+Zf4Ql3CCqZCm1Wr+64I3Aqgw29ddcMPmdim9R
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="13904416"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="13904416"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 11:20:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="818865239"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="818865239"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Jan 2024 11:20:28 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQXwA-0003GG-14;
	Thu, 18 Jan 2024 19:20:26 +0000
Date: Fri, 19 Jan 2024 03:20:20 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
 15603/15673] arch/arm/include/asm/memory.h:15:2: error: "Do not include
 <asm/memory.h> directly"
Message-ID: <202401190310.kzCMliSq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
head:   5cac1bb64a0300d340c5e369489c731b30aa5e79
commit: e21b73fba00f3539873c978ceaa948061687684f [15603/15673] spmi: pmic-arb: Add support for multi-master
config: arm-randconfig-002-20240118 (https://download.01.org/0day-ci/archive/20240119/202401190310.kzCMliSq-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d92ce344bf641e6bb025b41b3f1a77dd25e2b3e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401190310.kzCMliSq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401190310.kzCMliSq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/spmi/spmi-pmic-arb.c:5:
>> arch/arm/include/asm/memory.h:15:2: error: "Do not include <asm/memory.h> directly"
      15 | #error "Do not include <asm/memory.h> directly"
         |  ^
>> arch/arm/include/asm/memory.h:299:36: error: use of undeclared identifier 'PAGE_SHIFT'
     299 |         return (((kaddr - PAGE_OFFSET) >> PAGE_SHIFT) +
         |                                           ^
   arch/arm/include/asm/memory.h:300:3: error: use of undeclared identifier 'PAGE_SHIFT'
     300 |                 PHYS_PFN_OFFSET);
         |                 ^
   arch/arm/include/asm/memory.h:282:57: note: expanded from macro 'PHYS_PFN_OFFSET'
     282 | #define PHYS_PFN_OFFSET ((unsigned long)(PHYS_OFFSET >> PAGE_SHIFT))
         |                                                         ^
   3 errors generated.


vim +15 arch/arm/include/asm/memory.h

^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds 2005-04-16  13  
a9ff6961601d9a arch/arm/include/asm/memory.h Linus Walleij  2022-06-02  14  #ifndef _ASMARM_PAGE_H
a9ff6961601d9a arch/arm/include/asm/memory.h Linus Walleij  2022-06-02 @15  #error "Do not include <asm/memory.h> directly"
a9ff6961601d9a arch/arm/include/asm/memory.h Linus Walleij  2022-06-02  16  #endif
a9ff6961601d9a arch/arm/include/asm/memory.h Linus Walleij  2022-06-02  17  

:::::: The code at line 15 was first introduced by commit
:::::: a9ff6961601d9aa0c42b6eb7d850371f31b1f5e6 ARM: mm: Make virt_to_pfn() a static inline

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
