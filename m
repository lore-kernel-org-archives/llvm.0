Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872BB8C1F;
	Sun, 17 Nov 2024 00:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731803069; cv=none; b=JJNCaIn1nCZd8z0VRvfW7aNUorGcuEgyWnurJ3R2ox551Aw2yzxdVt5GtrG8JHq3EAQtxCoJNn142xSddrH4fd+GC+cSCnManOTHHS12KshtXHI/rD9glNbLeXR4djkPiTPN/odLh5voHkSE7dkI2ZTknCEhTxzQK97zvKrkRcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731803069; c=relaxed/simple;
	bh=/S3xgJdTglNG4YO0xGpdr1vtUOJcSeyEmaIcEa1JT2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sVVvVdZO0+P75Czi00eRasMpIXbjIu95ubmh/u9KC41xFTYkwNTPwo135FrqRVZxblPYBlYxHrY2zME5vcgJkcrCjISgN3bMKn2jFUAEidqilwVUAtYNPr1r1G4QSI9M8WeH+p82opKFBbdvb0utu0qFYQEp62/sdYtPmziIzd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSTrFcCj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSTrFcCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731803068; x=1763339068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/S3xgJdTglNG4YO0xGpdr1vtUOJcSeyEmaIcEa1JT2M=;
  b=OSTrFcCjykOow3Wi67zkQaL1R5vzTT26Gqs+vqIZrLjXQWGeqDh8b8hr
   Fq4CwKo4QitoT9eoR/PZLto588y6e8rdeOazD4KmvwtS+IPMf7ZAe8S52
   erlJjHccTXkAsgnsVrS2l0m73Ks/uY9thnlJunDzjeRFRN5rwuuVOFsA0
   vSjbSPO6rDU3lrlvzo1IEnmTkLX9dDOJzK85xmOjswMKl1x0/egtjVQE/
   DgR+4Qak3m+C3sOhPtr2qOFasxTXaLYhmfvdR4AfnKzbQvO+eY8mgTeEY
   kCgJdejhaHkCADw4nCiLtbIqegH+oVK80DWgxbitOkLFDidlgufZrWpDN
   w==;
X-CSE-ConnectionGUID: ZRm9wjGTShS5S687o3Tw3g==
X-CSE-MsgGUID: 50RPJToSQ7qXnB4y+0vkkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="49215971"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="49215971"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 16:24:25 -0800
X-CSE-ConnectionGUID: AHJOrsXER+KBVfWeNUvEIA==
X-CSE-MsgGUID: qE3evDH/SD2VkC4hPIDQEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88883653"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Nov 2024 16:24:23 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCT5Q-0001BX-36;
	Sun, 17 Nov 2024 00:24:20 +0000
Date: Sun, 17 Nov 2024 08:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hwmon-thermal 2/3]
 include/linux/thermal.h:292:75: error: omitting the parameter name in a
 function definition is a C23 extension
Message-ID: <202411170820.rVJmW6pO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/hwmon-thermal
head:   cabfa33b49cc42e6b5648560d9813c16fa1e94d1
commit: a020a527900a03dc4215f48ba0f37329a04a1cc0 [2/3] thermal: core: Add stub for thermal_zone_device_update()
config: hexagon-randconfig-001-20241117 (https://download.01.org/0day-ci/archive/20241117/202411170820.rVJmW6pO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170820.rVJmW6pO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170820.rVJmW6pO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tiny/repaper.c:21:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/drm/tiny/repaper.c:21:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/tiny/repaper.c:21:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/tiny/repaper.c:21:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/tiny/repaper.c:22:
>> include/linux/thermal.h:292:75: error: omitting the parameter name in a function definition is a C23 extension [-Werror,-Wc23-extensions]
     292 | static inline void thermal_zone_device_update(struct thermal_zone_device *,
         |                                                                           ^
   include/linux/thermal.h:293:37: error: omitting the parameter name in a function definition is a C23 extension [-Werror,-Wc23-extensions]
     293 |                                               enum thermal_notify_event)
         |                                                                        ^
   9 errors generated.


vim +292 include/linux/thermal.h

   291	
 > 292	static inline void thermal_zone_device_update(struct thermal_zone_device *,
   293						      enum thermal_notify_event)
   294	{ }
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
