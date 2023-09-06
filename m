Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805E26AB1;
	Wed,  6 Sep 2023 18:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694025653; x=1725561653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Fn+IWxIZRqo/a0kImotkbpgDdvl3jc7ik0ZYox/Ixs=;
  b=MZYphPeOV9lyR57NRlyI7EIxWgTUqpk8zpZtfilw9ULJ2TCWCTNXVOPa
   uZxBa1GUDj00s0x1dNfGuZ4n6qD/y4JJgRsoPC1ae6bkd+Rj+kmtW4G9s
   pk6t2JQQJh6GEiGgb1J86ybnVe+SJTbB/0MpnbQImsMFD73bF3Qt7eGiL
   067fWk56tKAZTG+gG6oNjV2vu0ycwgYmUym7mujzKYC6H7o71uU4W3bFc
   /4LsRQgWRc0CSParoqz/j+Xnt7bQuHDKxLuzFku+Qt9Pk/Gbm/S1O2YXg
   EiKK8CNkpYQehO2E7P6E673wCqDSVyBlWspAlyyfN6p3MaXFmvFTGzgxZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="377065712"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="377065712"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:40:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="988383588"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="988383588"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2023 11:40:50 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdxSK-0000Ud-38;
	Wed, 06 Sep 2023 18:40:48 +0000
Date: Thu, 7 Sep 2023 02:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: Liam Beguin <liambeguin@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:testing 50/62] drivers/iio/adc/ltc2309.c:160:6: warning:
 no previous prototype for function 'ltc2309_regulator_disable'
Message-ID: <202309070238.rgcHNjNX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   184d37294d1b4f21a2a625be10133aafb270d591
commit: ca4c617015ff7803b72a2afc1bd45c9c5b570492 [50/62] iio: adc: add ltc2309 support
config: hexagon-randconfig-r031-20230907 (https://download.01.org/0day-ci/archive/20230907/202309070238.rgcHNjNX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070238.rgcHNjNX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070238.rgcHNjNX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iio/adc/ltc2309.c:11:
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
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/iio/adc/ltc2309.c:11:
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
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/iio/adc/ltc2309.c:11:
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
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/iio/adc/ltc2309.c:160:6: warning: no previous prototype for function 'ltc2309_regulator_disable' [-Wmissing-prototypes]
   void ltc2309_regulator_disable(void *regulator)
        ^
   drivers/iio/adc/ltc2309.c:160:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ltc2309_regulator_disable(void *regulator)
   ^
   static 
   7 warnings generated.


vim +/ltc2309_regulator_disable +160 drivers/iio/adc/ltc2309.c

   159	
 > 160	void ltc2309_regulator_disable(void *regulator)
   161	{
   162		regulator_disable(regulator);
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
