Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A5D47A0C7;
	Fri, 15 May 2026 12:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847490; cv=none; b=Ccy/SKDAI/hMCrTmQvF7PwKfrCvcsovnHgKoWdqD6Vxe7vuI+9FQS/OGV6CYh8rU0dqS8UcJE8r4sFoWUQEcrKFKmWmDXdQUM2mNsoJ1gj1Kc5FEgDropKMEWZwHBIzJVOIDcNw9brEmldiGeqh1G+ktcdRIR5OhZdsckxXvlNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847490; c=relaxed/simple;
	bh=ojydjqR/RxJ0+WHPEfoiRfA734k1Xyg/KE4OAiqHlZk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rImdUuwhwpcdqBm2tbLPlsY+mEjvEXHRAvY6uvfzjyr0S1BnO6PcJgjQzRi/iRBrKoEsf8Xw26+uIpyc9KfpA/MoZ+DiCh3nseWRI3h1Ou1AZfN+tC1Qvgl/4y+tIj+HZmZNmBOYmY1TJdFceojKut3WkqEft8yT9php6XHjqBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SF8yzuLO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SF8yzuLO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778847488; x=1810383488;
  h=date:from:to:cc:subject:message-id;
  bh=ojydjqR/RxJ0+WHPEfoiRfA734k1Xyg/KE4OAiqHlZk=;
  b=SF8yzuLO7QbOK5hak2zxxwuSS75lwJaWA3k5SEhcgoMETD3XoHKAlTUz
   U7/+Laf7Mz47vV1wxj4Jsjq/Tu2DDHpOmxjrXIBNwS59k+gbH822vXjeT
   rAZaYPvn1KN7WY6yktZFEcbMItuMQlniDH/6YXGBpAIcLOvoSn81EvEl7
   xNVDDC/XCx6CDxCuvrQoZKGTDZsdm+oypjoRYYXDZX454J5HX/LvPVmBN
   bwcckY11f1GJdwgGMwsCu1ij7Rh5HJ8HU2Skiptf71hFjOci8TgyXGIKk
   V3UDwmDwymlcxCGN+x4VZEANjqWtIYRsANKLj9j1xviAJSuHfSrFFyYtu
   w==;
X-CSE-ConnectionGUID: 6tYgenlBTZ2KPj7F6rzbYg==
X-CSE-MsgGUID: 0EUnRwpsQtCYyFOsLiZL5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83672304"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="83672304"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 05:18:08 -0700
X-CSE-ConnectionGUID: 6m2UEe7pR+KFRwXbNEJTIw==
X-CSE-MsgGUID: Ph4XdqT2T7eGRJ4rEP0nRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="234428315"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 15 May 2026 05:18:06 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNrUQ-000000001W9-3HFf;
	Fri, 15 May 2026 12:18:02 +0000
Date: Fri, 15 May 2026 20:02:16 +0800
From: kernel test robot <lkp@intel.com>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>,
 Rohit Visavalia <rohit.visavalia@amd.com>,
 Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18_LTS 454/870]
 drivers/gpu/drm/xlnx/mmi_dc.h:133:1: error: call to undeclared function
 'readl'; ISO C99 and later do not support implicit function declarations
Message-ID: <202605151940.Shj72iX5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18_LTS
head:   fb979987d554f0c8fd045b114a27a6359c9265cf
commit: c78a1983b5fde50b59b27a00bde768d7a3350e44 [454/870] drm: xlnx: mmi-dc: DRM/KMS driver for AMD MMI DC
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260515/202605151940.Shj72iX5-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151940.Shj72iX5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151940.Shj72iX5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xlnx/mmi_dc.c:15:
>> drivers/gpu/drm/xlnx/mmi_dc.h:133:1: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     133 | DEFINE_REGISTER_OPS(dp);
         | ^
   drivers/gpu/drm/xlnx/mmi_dc.h:125:9: note: expanded from macro 'DEFINE_REGISTER_OPS'
     125 |         return readl(dc->iomem + reg);                                  \
         |                ^
>> drivers/gpu/drm/xlnx/mmi_dc.h:133:1: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   drivers/gpu/drm/xlnx/mmi_dc.h:130:2: note: expanded from macro 'DEFINE_REGISTER_OPS'
     130 |         writel(val, dc->iomem + reg);                                   \
         |         ^
   drivers/gpu/drm/xlnx/mmi_dc.h:134:1: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     134 | DEFINE_REGISTER_OPS(blend);
         | ^
   drivers/gpu/drm/xlnx/mmi_dc.h:125:9: note: expanded from macro 'DEFINE_REGISTER_OPS'
     125 |         return readl(dc->iomem + reg);                                  \
         |                ^
   drivers/gpu/drm/xlnx/mmi_dc.h:134:1: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   drivers/gpu/drm/xlnx/mmi_dc.h:130:2: note: expanded from macro 'DEFINE_REGISTER_OPS'
     130 |         writel(val, dc->iomem + reg);                                   \
         |         ^
   drivers/gpu/drm/xlnx/mmi_dc.h:135:1: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     135 | DEFINE_REGISTER_OPS(avbuf);
         | ^
   drivers/gpu/drm/xlnx/mmi_dc.h:125:9: note: expanded from macro 'DEFINE_REGISTER_OPS'
     125 |         return readl(dc->iomem + reg);                                  \
         |                ^
   drivers/gpu/drm/xlnx/mmi_dc.h:135:1: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   drivers/gpu/drm/xlnx/mmi_dc.h:130:2: note: expanded from macro 'DEFINE_REGISTER_OPS'
     130 |         writel(val, dc->iomem + reg);                                   \
         |         ^
   drivers/gpu/drm/xlnx/mmi_dc.h:136:1: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     136 | DEFINE_REGISTER_OPS(misc);
         | ^
   drivers/gpu/drm/xlnx/mmi_dc.h:125:9: note: expanded from macro 'DEFINE_REGISTER_OPS'
     125 |         return readl(dc->iomem + reg);                                  \
         |                ^
   drivers/gpu/drm/xlnx/mmi_dc.h:136:1: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   drivers/gpu/drm/xlnx/mmi_dc.h:130:2: note: expanded from macro 'DEFINE_REGISTER_OPS'
     130 |         writel(val, dc->iomem + reg);                                   \
         |         ^
   drivers/gpu/drm/xlnx/mmi_dc.h:137:1: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     137 | DEFINE_REGISTER_OPS(irq);
         | ^
   drivers/gpu/drm/xlnx/mmi_dc.h:125:9: note: expanded from macro 'DEFINE_REGISTER_OPS'
     125 |         return readl(dc->iomem + reg);                                  \
         |                ^
   drivers/gpu/drm/xlnx/mmi_dc.h:137:1: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   drivers/gpu/drm/xlnx/mmi_dc.h:130:2: note: expanded from macro 'DEFINE_REGISTER_OPS'
     130 |         writel(val, dc->iomem + reg);                                   \
         |         ^
   In file included from drivers/gpu/drm/xlnx/mmi_dc.c:16:
   In file included from drivers/gpu/drm/xlnx/mmi_dc_plane.h:11:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
>> include/asm-generic/io.h:224:19: error: static declaration of 'readl' follows non-static declaration
     224 | static inline u32 readl(const volatile void __iomem *addr)
         |                   ^
   include/asm-generic/io.h:223:15: note: expanded from macro 'readl'
     223 | #define readl readl
         |               ^
   drivers/gpu/drm/xlnx/mmi_dc.h:133:1: note: previous implicit declaration is here
     133 | DEFINE_REGISTER_OPS(dp);
         | ^
   drivers/gpu/drm/xlnx/mmi_dc.h:125:9: note: expanded from macro 'DEFINE_REGISTER_OPS'
     125 |         return readl(dc->iomem + reg);                                  \
         |                ^
   In file included from drivers/gpu/drm/xlnx/mmi_dc.c:16:
   In file included from drivers/gpu/drm/xlnx/mmi_dc_plane.h:11:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
>> include/asm-generic/io.h:288:20: error: static declaration of 'writel' follows non-static declaration
     288 | static inline void writel(u32 value, volatile void __iomem *addr)
         |                    ^
   include/asm-generic/io.h:287:16: note: expanded from macro 'writel'
     287 | #define writel writel
         |                ^
   drivers/gpu/drm/xlnx/mmi_dc.h:133:1: note: previous implicit declaration is here
     133 | DEFINE_REGISTER_OPS(dp);
         | ^
   drivers/gpu/drm/xlnx/mmi_dc.h:130:2: note: expanded from macro 'DEFINE_REGISTER_OPS'
     130 |         writel(val, dc->iomem + reg);                                   \
         |         ^
   12 errors generated.
--
   In file included from mmi_dc.c:15:
   ./mmi_dc.h:133:1: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     133 | DEFINE_REGISTER_OPS(dp);
         | ^
   ./mmi_dc.h:125:9: note: expanded from macro 'DEFINE_REGISTER_OPS'
     125 |         return readl(dc->iomem + reg);                                  \
         |                ^
   ./mmi_dc.h:133:1: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   ./mmi_dc.h:130:2: note: expanded from macro 'DEFINE_REGISTER_OPS'
     130 |         writel(val, dc->iomem + reg);                                   \
         |         ^
   ./mmi_dc.h:134:1: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     134 | DEFINE_REGISTER_OPS(blend);
         | ^
   ./mmi_dc.h:125:9: note: expanded from macro 'DEFINE_REGISTER_OPS'
     125 |         return readl(dc->iomem + reg);                                  \
         |                ^
   ./mmi_dc.h:134:1: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   ./mmi_dc.h:130:2: note: expanded from macro 'DEFINE_REGISTER_OPS'
     130 |         writel(val, dc->iomem + reg);                                   \
         |         ^
   ./mmi_dc.h:135:1: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     135 | DEFINE_REGISTER_OPS(avbuf);
         | ^
   ./mmi_dc.h:125:9: note: expanded from macro 'DEFINE_REGISTER_OPS'
     125 |         return readl(dc->iomem + reg);                                  \
         |                ^
   ./mmi_dc.h:135:1: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   ./mmi_dc.h:130:2: note: expanded from macro 'DEFINE_REGISTER_OPS'
     130 |         writel(val, dc->iomem + reg);                                   \
         |         ^
   ./mmi_dc.h:136:1: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     136 | DEFINE_REGISTER_OPS(misc);
         | ^
   ./mmi_dc.h:125:9: note: expanded from macro 'DEFINE_REGISTER_OPS'
     125 |         return readl(dc->iomem + reg);                                  \
         |                ^
   ./mmi_dc.h:136:1: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   ./mmi_dc.h:130:2: note: expanded from macro 'DEFINE_REGISTER_OPS'
     130 |         writel(val, dc->iomem + reg);                                   \
         |         ^
   ./mmi_dc.h:137:1: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     137 | DEFINE_REGISTER_OPS(irq);
         | ^
   ./mmi_dc.h:125:9: note: expanded from macro 'DEFINE_REGISTER_OPS'
     125 |         return readl(dc->iomem + reg);                                  \
         |                ^
   ./mmi_dc.h:137:1: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   ./mmi_dc.h:130:2: note: expanded from macro 'DEFINE_REGISTER_OPS'
     130 |         writel(val, dc->iomem + reg);                                   \
         |         ^
   In file included from mmi_dc.c:16:
   In file included from ./mmi_dc_plane.h:11:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
>> include/asm-generic/io.h:224:19: error: static declaration of 'readl' follows non-static declaration
     224 | static inline u32 readl(const volatile void __iomem *addr)
         |                   ^
   include/asm-generic/io.h:223:15: note: expanded from macro 'readl'
     223 | #define readl readl
         |               ^
   ./mmi_dc.h:133:1: note: previous implicit declaration is here
     133 | DEFINE_REGISTER_OPS(dp);
         | ^
   ./mmi_dc.h:125:9: note: expanded from macro 'DEFINE_REGISTER_OPS'
     125 |         return readl(dc->iomem + reg);                                  \
         |                ^
   In file included from mmi_dc.c:16:
   In file included from ./mmi_dc_plane.h:11:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
>> include/asm-generic/io.h:288:20: error: static declaration of 'writel' follows non-static declaration
     288 | static inline void writel(u32 value, volatile void __iomem *addr)
         |                    ^
   include/asm-generic/io.h:287:16: note: expanded from macro 'writel'
     287 | #define writel writel
         |                ^
   ./mmi_dc.h:133:1: note: previous implicit declaration is here
     133 | DEFINE_REGISTER_OPS(dp);
         | ^
   ./mmi_dc.h:130:2: note: expanded from macro 'DEFINE_REGISTER_OPS'
     130 |         writel(val, dc->iomem + reg);                                   \
         |         ^
   12 errors generated.


vim +/readl +133 drivers/gpu/drm/xlnx/mmi_dc.h

   132	
 > 133	DEFINE_REGISTER_OPS(dp);
   134	DEFINE_REGISTER_OPS(blend);
   135	DEFINE_REGISTER_OPS(avbuf);
   136	DEFINE_REGISTER_OPS(misc);
   137	DEFINE_REGISTER_OPS(irq);
   138	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
