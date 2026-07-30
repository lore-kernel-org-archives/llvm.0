Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E3F3CD8B8;
	Thu, 30 Jul 2026 21:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785446306; cv=none; b=RA+JlLOsK7J91OpLsg11OYMiTBai+r5WAKZH7OY825Ij+VdHuBXkSwlRJqfLGDDSvCkgT2xunwY0xtAM4FkLRrKvYIbhYQHz3mbaw+Ft1Kei4bR7eGBMconUyPzi0XguTioT1ZsQkScE8jkSJABuipTP9sXkA6k4WRXoRLflpf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785446306; c=relaxed/simple;
	bh=j/Q+8LiALBeiAxFLx1UWmZS7VTwWQX3eKGAMLXazzK8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QYI6iXHsHR7Ly8pCtsAN/R0au9vrHxJWKs1M0ImSaBq7thk5/CZB7M9WUa2Pg8nzkUryqD8WecWzmpQ/qLqGNGxT32lO9+ELA3Fljsh1zfsdB4+mZ7CSJwtINJ+3+HYEQQcKBUH2C+7HfikKtoSXQNm8JpxC4fVhMROv+lk8lMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtN1fteJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtN1fteJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785446301; x=1816982301;
  h=date:from:to:cc:subject:message-id;
  bh=j/Q+8LiALBeiAxFLx1UWmZS7VTwWQX3eKGAMLXazzK8=;
  b=VtN1fteJv80DOmkFcWDapVZpHvX0ypNE6Gk5HTBN5hYdRpw8qlVX89on
   ZhziQJLHZ+5/AwHO9F4g1kdnZ4DXnh96J7VRDPpg1se2g2+3xbIdu2mj6
   KqokL5Spdh+34sEAMzbflGZmMcSGA3RgA9igM+LD7tzWWW7GjvI6L/xHj
   kQJxiqOLyehDIGXJDl78+B+FK14NnCNzHUN2Ciaz+xmCvE92wJvk7Uw1M
   poVi/GLz6y9nKpOkrxbQ/dRcsgVHDLov3kh2iJK4X4TbaXi+RbnW074jc
   GlpH9o1cXIeKBr+mDGze7KjdXqITSqbnjMooAPy9Qmivf0dmNPCfwwhcQ
   w==;
X-CSE-ConnectionGUID: gISAvqUxRRuJ94dRXTiWsQ==
X-CSE-MsgGUID: FquTbPiCRcmTC/l0TVSQ1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="97232504"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="97232504"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 14:18:18 -0700
X-CSE-ConnectionGUID: f4D166+MRzqfHCQuQWy6Dw==
X-CSE-MsgGUID: GxCcr6YCSmqEmVUvTv3T/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="264684403"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 30 Jul 2026 14:18:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpY8t-00000000hb7-0kaG;
	Thu, 30 Jul 2026 21:18:15 +0000
Date: Fri, 31 Jul 2026 05:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: Fred Treven <fred.treven@cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cirruslogic-drivers:v6.12-cs40l26 28/694]
 include/linux/mfd/cs40l26.h:37:10: fatal error:
 'linux/firmware/cirrus/cl_dsp.h' file not found
Message-ID: <202607310503.xsrGeQe1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/CirrusLogic/linux-drivers v6.12-cs40l26
head:   bc4ed91198ba7fae8ede7cb90ba2496dfe9a377f
commit: 10f91c81a4d7f2a41526d9e27c4c83681f0d12b1 [28/694] input: cs40l26: Change include location of CL DSP
config: hexagon-randconfig-001-20260731 (https://download.01.org/0day-ci/archive/20260731/202607310503.xsrGeQe1-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project bacfe2950f8218268fcc0a8765644ea0c15f0360)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310503.xsrGeQe1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310503.xsrGeQe1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/input/misc/cs40l26-tables.c:14:
   In file included from include/linux/mfd/cs40l26.h:15:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/input/misc/cs40l26-tables.c:14:
   In file included from include/linux/mfd/cs40l26.h:15:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/input/misc/cs40l26-tables.c:14:
   In file included from include/linux/mfd/cs40l26.h:15:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/input/misc/cs40l26-tables.c:14:
   In file included from include/linux/mfd/cs40l26.h:22:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/input/misc/cs40l26-tables.c:14:
>> include/linux/mfd/cs40l26.h:37:10: fatal error: 'linux/firmware/cirrus/cl_dsp.h' file not found
      37 | #include <linux/firmware/cirrus/cl_dsp.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 1 error generated.


vim +37 include/linux/mfd/cs40l26.h

    36	
  > 37	#include <linux/firmware/cirrus/cl_dsp.h>
    38	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
