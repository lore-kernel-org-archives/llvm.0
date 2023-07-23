Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E541215C8;
	Sun, 23 Jul 2023 14:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690121040; x=1721657040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LILP9B29e5gIWL9SuRTcjKLyAMzIPIsnDnJZvC4GOEo=;
  b=OW1BsPr65SQKAIWePbVvSiYrV4etXI5WGYKcByt9iyabnYAOir5thYV4
   yq+kHkzFfeUs5d5rwl4YPN7m4G3xmL7yg6FZNrg0wV9jhFdSBHQ8eC1sc
   MgyGcAvmTLHH1cpCUetXG8z0jzBJV9J/jDSF1zVNcLtP9DxMpcFZ20qgM
   eh7WKen6wMzRo7dd1gnDoPZZQENVvVwghOMI8UtTZaQwQ6vUxL17jsSEq
   CBRqHy+q2urgeEoF5jjJ4BmuVwng5/bf1/IlW43hAKZQDz2Ppa6UAj9c/
   9KBoyJkltpjBzl1bOl9ac6PWPORxUDf7BcmDGtqVPTpZeqTzRhE+MEg7r
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="346879830"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="346879830"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 07:03:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="971968609"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="971968609"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jul 2023 07:03:58 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNZgj-00092b-2g;
	Sun, 23 Jul 2023 14:03:57 +0000
Date: Sun, 23 Jul 2023 22:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data() callback
Message-ID: <202307232145.kmTzXn7a-lkp@intel.com>
References: <20230723083721.35384-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230723083721.35384-3-biju.das.jz@bp.renesas.com>

Hi Biju,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus wsa/i2c/for-next linus/master v6.5-rc2 next-20230721]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/drivers-fwnode-Extend-device_get_match_data-to-struct-bus_type/20230723-163825
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20230723083721.35384-3-biju.das.jz%40bp.renesas.com
patch subject: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data() callback
config: hexagon-randconfig-r041-20230723 (https://download.01.org/0day-ci/archive/20230723/202307232145.kmTzXn7a-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307232145.kmTzXn7a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307232145.kmTzXn7a-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i2c/i2c-core-base.c:23:
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
   In file included from drivers/i2c/i2c-core-base.c:23:
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
   In file included from drivers/i2c/i2c-core-base.c:23:
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
>> drivers/i2c/i2c-core-base.c:126:9: error: returning 'const void *' from a function with result type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     126 |         return (const void *)match->driver_data;
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/i2c/i2c-core-base.c:141:35: error: passing 'const struct i2c_driver *' to parameter of type 'struct i2c_driver *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     141 |         return i2c_get_match_data_helper(driver, client);
         |                                          ^~~~~~
   drivers/i2c/i2c-core-base.c:117:59: note: passing argument to parameter 'driver' here
     117 | static void *i2c_get_match_data_helper(struct i2c_driver *driver,
         |                                                           ^
   6 warnings and 2 errors generated.


vim +126 drivers/i2c/i2c-core-base.c

   116	
   117	static void *i2c_get_match_data_helper(struct i2c_driver *driver,
   118					       const struct i2c_client *client)
   119	{
   120		const struct i2c_device_id *match;
   121	
   122		match = i2c_match_id(driver->id_table, client);
   123		if (!match)
   124			return NULL;
   125	
 > 126		return (const void *)match->driver_data;
   127	}
   128	
   129	static const void *i2c_device_get_match_data(const struct device *dev)
   130	{
   131		const struct i2c_client *client = to_i2c_client(dev);
   132		const struct i2c_driver *driver;
   133	
   134		if (!dev->driver)
   135			return NULL;
   136	
   137		driver = to_i2c_driver(dev->driver);
   138		if (!driver)
   139			return NULL;
   140	
 > 141		return i2c_get_match_data_helper(driver, client);
   142	}
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
