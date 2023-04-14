Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4627C;
	Fri, 14 Apr 2023 11:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681471111; x=1713007111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gdHq+NrxA5QnPfv/7dYFhkLl1betOdrkY6HhFy5LWRc=;
  b=H4R437JNSQWcnuK4d3Ai2ralsrtxbaocpwBpomMTZZGM7UrAWJMHn4c3
   dbo91x0m80caHm+rOsyBCnHTMHSZafcaxUj6MoyNcsA8O6J1urYv1Mk1c
   O22h8TPbQRcDyjuxH3jGHMcfYxUqWAOsOYFBgI9z5ah3AVh0oa1gbJgMM
   iwnjgKOPD5q3W4O5hoj8WD8yncFZG/CM1R9pCfyTp85WFiZSWrRE3JWPa
   kF+pMNcnSeR2ra3Nzk+dttX2jTfIWlVY8m2ZUOZWK7apaxm1eVLINTzHx
   anIruCAlVvUncxoDFzx+rsqCz3g+9UpfnRt3b3X6Oj5x5Aln1P+OVJTps
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="430733835"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="430733835"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 04:18:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="935984359"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="935984359"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2023 04:18:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnHRi-000ZTb-1d;
	Fri, 14 Apr 2023 11:18:26 +0000
Date: Fri, 14 Apr 2023 19:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lee Jones <lee.jones@linaro.org>, Lee Jones <lee@kernel.org>
Subject: [lee-mfd:for-mfd-next 15/78] drivers/mfd/qcom-pm8008.c:143:21:
 error: incompatible function pointer types initializing 'int (*)(unsigned
 int **, unsigned int, const struct regmap_irq *, int)' with an expression of
 type 'int (unsigned int **, unsigned int, const struct regmap_irq *, i...
Message-ID: <202304141907.9MEPUN9w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   9d8d0d98885abba451d7ffc4885236d14ead3c9a
commit: 540eee4708487d16d7f9d1ddadd679ce3e0b9d69 [15/78] mfd: qcom-pm8008: Convert irq chip to config regs
config: hexagon-randconfig-r024-20230410 (https://download.01.org/0day-ci/archive/20230414/202304141907.9MEPUN9w-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?id=540eee4708487d16d7f9d1ddadd679ce3e0b9d69
        git remote add lee-mfd https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
        git fetch --no-tags lee-mfd for-mfd-next
        git checkout 540eee4708487d16d7f9d1ddadd679ce3e0b9d69
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/mfd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141907.9MEPUN9w-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mfd/qcom-pm8008.c:7:
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
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/mfd/qcom-pm8008.c:7:
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
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/mfd/qcom-pm8008.c:7:
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
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/mfd/qcom-pm8008.c:143:21: error: incompatible function pointer types initializing 'int (*)(unsigned int **, unsigned int, const struct regmap_irq *, int)' with an expression of type 'int (unsigned int **, unsigned int, const struct regmap_irq *, int, void *)' [-Wincompatible-function-pointer-types]
           .set_type_config        = pm8008_set_type_config,
                                     ^~~~~~~~~~~~~~~~~~~~~~
   6 warnings and 1 error generated.


vim +143 drivers/mfd/qcom-pm8008.c

   125	
   126	static struct regmap_irq_chip pm8008_irq_chip = {
   127		.name			= "pm8008_irq",
   128		.main_status		= I2C_INTR_STATUS_BASE,
   129		.num_main_regs		= 1,
   130		.irqs			= pm8008_irqs,
   131		.num_irqs		= ARRAY_SIZE(pm8008_irqs),
   132		.num_regs		= PM8008_NUM_PERIPHS,
   133		.not_fixed_stride	= true,
   134		.sub_reg_offsets	= pm8008_sub_reg_offsets,
   135		.status_base		= PM8008_STATUS_BASE,
   136		.mask_base		= PM8008_MASK_BASE,
   137		.unmask_base		= PM8008_UNMASK_BASE,
   138		.mask_unmask_non_inverted = true,
   139		.ack_base		= PM8008_ACK_BASE,
   140		.config_base		= pm8008_config_regs,
   141		.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
   142		.num_config_regs	= PM8008_NUM_PERIPHS,
 > 143		.set_type_config	= pm8008_set_type_config,
   144	};
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
