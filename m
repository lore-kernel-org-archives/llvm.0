Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C27363;
	Mon, 31 Jul 2023 02:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690770753; x=1722306753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cwj1dWkccQrL9SYy7anSD3GwlkOhYGdHTTkSsYxs3B8=;
  b=J79kVaZ3kIe5TxqVenoAiiynM68gJn8oIxxoX9Ex3k8lco9qiXYP/9SG
   zVS0rPRNZeyU0Ty1g1L/Genz+VKn2wLZiN0azOp8JLDOjvOADHuAEawMb
   cSnWf3ckgYcZx5pryB175mpJMjdI/ncEx6m+v8M3nawq790x/5cNei682
   zT7sUIhuAa15Kdi5VLgng2jeLsiFjh6wt3Q9OGiN0O1ykjsm2afgDGHEF
   x9C7tixHGUnYKVdprkHy9Y/dnWcCUjH+MgylSCdV2nDR3e8tIQqdKHl1K
   43BUW3MYsylzoKJPOzCIFtsrph8rSQCuQlIh1g/QSFpBDcPG2o6Kt47bN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="432712556"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="432712556"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 19:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="731421621"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="731421621"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 30 Jul 2023 19:32:30 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQIhl-0004tB-3D;
	Mon, 31 Jul 2023 02:32:28 +0000
Date: Mon, 31 Jul 2023 10:31:27 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [andi-shyti:i2c/andi-for-next 23/27]
 drivers/i2c/busses/i2c-virtio.c:270:3: error: field designator 'freeze' does
 not refer to any field in type 'struct virtio_driver'
Message-ID: <202307311024.dAcru88T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/andi-for-next
head:   1851a80ee87d2decf774ee5785c8dd25e30bd118
commit: 73d546c76235b5329c0b6d370c836777443fd208 [23/27] i2c: virtio: Remove #ifdef guards for PM related functions
config: hexagon-randconfig-r004-20230731 (https://download.01.org/0day-ci/archive/20230731/202307311024.dAcru88T-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307311024.dAcru88T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307311024.dAcru88T-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-virtio.c:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/i2c/busses/i2c-virtio.c:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/i2c/busses/i2c-virtio.c:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/i2c/busses/i2c-virtio.c:270:3: error: field designator 'freeze' does not refer to any field in type 'struct virtio_driver'
     270 |         .freeze                 = pm_sleep_ptr(virtio_i2c_freeze),
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-virtio.c:271:3: error: field designator 'restore' does not refer to any field in type 'struct virtio_driver'
     271 |         .restore                = pm_sleep_ptr(virtio_i2c_restore),
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 warnings and 2 errors generated.


vim +270 drivers/i2c/busses/i2c-virtio.c

   260	
   261	static struct virtio_driver virtio_i2c_driver = {
   262		.feature_table		= features,
   263		.feature_table_size	= ARRAY_SIZE(features),
   264		.id_table		= id_table,
   265		.probe			= virtio_i2c_probe,
   266		.remove			= virtio_i2c_remove,
   267		.driver			= {
   268			.name	= "i2c_virtio",
   269		},
 > 270		.freeze			= pm_sleep_ptr(virtio_i2c_freeze),
 > 271		.restore		= pm_sleep_ptr(virtio_i2c_restore),
   272	};
   273	module_virtio_driver(virtio_i2c_driver);
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
