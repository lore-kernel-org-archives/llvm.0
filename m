Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C0115DBAD;
	Mon, 27 May 2024 11:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716811068; cv=none; b=gCd/cArctImZwAHpU54bDE7fitzT+TvcLYw4F5LXa6iTk6v22fzCl0u9RCq0SCMFxyLpWBmGQZ6GrHTIPsfe0o/uDmr2YNEYVhCVdqDA5Eu+rX1YCRrV2GBPq7GWdLmPc04sfRfU3NvQzSbHnpdVGlJ6oktvc3wf0mf5W8NP8is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716811068; c=relaxed/simple;
	bh=YmGz4VjYHliavDkdQJT2mUXPeCSagyfy4ByqHxwoKHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I3Y+8nD1CgYiFW/HK67L4JsJ7ek+mOF/VNo/GFYmab0dtA1gY3KgtuwVagujAoDTcK+xbFJyK51pO7CAqmWLOuv+6OELeeBmZCzwtbFAB25p1c5liIiPPGBbpldYY83+vQTylU7z1DwQnsLe2XzZ0/cr+P2RIknOMyKfPD4p81I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVF2awxO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVF2awxO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716811067; x=1748347067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YmGz4VjYHliavDkdQJT2mUXPeCSagyfy4ByqHxwoKHk=;
  b=EVF2awxOtKVlN5ppYb1eU72dlZkniD96y3Mzu74ewJAJTqrHfOG08CnJ
   z90ETunBXQmhy/byrtJ7Thqs4WWos1bTUW/rXZxyttN/stEg4GRiK2zMx
   M1ROdxdD3b/S2PhS/hvItPLuVWeu8d/rGWMrKdZrE/xnY1ngNqo+UhXjx
   weULQfVspJj4Y5pR3Rila/1jkrYYl33MJwK/dPLP2d58ffx/Sus9UhPYK
   4RnUZJrraCahvwp0mhstMbyrG+eUAqcPfyd4LADPYgsHTYqhJEJf2Xoll
   gmSxWTCNV6g3T3VrTCCPd2UT2JeMmOvcpjIErQT+2cP68igD+xGq523mj
   Q==;
X-CSE-ConnectionGUID: b7w4ygYfTZukZJGj9m+QQA==
X-CSE-MsgGUID: b5F5zhe2RNm9A+J9fj9Pkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="12949131"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="12949131"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 04:57:47 -0700
X-CSE-ConnectionGUID: d/tkxycYQy+tnKGub+y8GA==
X-CSE-MsgGUID: OPvwQnk8Qe24M6gLszX/tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="34826609"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 May 2024 04:57:44 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBYz0-000AA6-1W;
	Mon, 27 May 2024 11:57:42 +0000
Date: Mon, 27 May 2024 19:57:23 +0800
From: kernel test robot <lkp@intel.com>
To: Vasileios Amoiridis <vassilisamir@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:testing 23/46]
 drivers/iio/pressure/bmp280-core.c:2577:42: warning: unused variable
 'bmp280_buffer_setup_ops'
Message-ID: <202405271943.jQVKL9Vl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   409b6d632f5078f3ae1018b6e43c32f2e12f6736
commit: f611fad414ded443a566fb4e0bb1b201a3f57ee3 [23/46] iio: pressure: bmp280: Add triggered buffer support
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240527/202405271943.jQVKL9Vl-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240527/202405271943.jQVKL9Vl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405271943.jQVKL9Vl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iio/pressure/bmp280-core.c:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
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
   In file included from drivers/iio/pressure/bmp280-core.c:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/iio/pressure/bmp280-core.c:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
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
   In file included from drivers/iio/pressure/bmp280-core.c:42:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/iio/pressure/bmp280-core.c:2577:42: warning: unused variable 'bmp280_buffer_setup_ops' [-Wunused-const-variable]
    2577 | static const struct iio_buffer_setup_ops bmp280_buffer_setup_ops = {
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~
   8 warnings generated.


vim +/bmp280_buffer_setup_ops +2577 drivers/iio/pressure/bmp280-core.c

  2576	
> 2577	static const struct iio_buffer_setup_ops bmp280_buffer_setup_ops = {
  2578		.preenable = bmp280_buffer_preenable,
  2579		.postdisable = bmp280_buffer_postdisable,
  2580	};
  2581	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
