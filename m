Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9C07A
	for <llvm@lists.linux.dev>; Thu, 16 Jun 2022 10:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655376658; x=1686912658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NRomU9oFvQ3YostIAt8+eUsjD6GMZ7kQ5fsVv1AGYwo=;
  b=jON6fyU6c1la8UpF7YKMdmEVNh6karwmc9RLD8+HhzGAB96XlVwkOy9m
   6nC4tBj4epy8XlXgdT8zZ9C4+yJAEfAapaTq7gcHVsBMpEqDmabRPvAvu
   eKgU1r189zkT2bjHLWwtG/6+KcnvmGpX0lqmcZUWyKUeuzZYCWMZtdt2x
   KnrZrQLLGvtBa400zrdnuFc2lJzWhTnXlzU+awOJ0m+A9ZzADDkUHHra4
   Lv0VBz3bdLrHDZCLgI37sytCMudUQpo2ccaUtzyqWNmtgtp89BgeuRVLC
   KbSgKXS521iBBB5+H1lAm4wPE6V1CqoenApPoozJY88+C88XJlyIpjQ3Q
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="343179067"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="343179067"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 03:50:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="574637887"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Jun 2022 03:50:56 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1n5U-000OIx-6M;
	Thu, 16 Jun 2022 10:50:56 +0000
Date: Thu, 16 Jun 2022 18:50:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jpirko-mlxsw:jiri_devel_lc_dev 2/15]
 drivers/net/ethernet/mellanox/mlxsw/core_linecard_dev.c:94:3: error: void
 function 'mlxsw_linecard_bdev_del' should not return a value
Message-ID: <202206161832.71XjiKsD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw jiri_devel_lc_dev
head:   b3fdf991f2ce5b1a4e7f527fcfc27c9d413ae566
commit: 1a2503c635b5bd91f6eb2d2520960d609df0e6ee [2/15] mlxsw: core_linecards: Introduce per line card auxiliary device
config: riscv-randconfig-r042-20220616 (https://download.01.org/0day-ci/archive/20220616/202206161832.71XjiKsD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f0e608de27b3d568000046eebf3712ab542979d6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/jpirko/linux_mlxsw/commit/1a2503c635b5bd91f6eb2d2520960d609df0e6ee
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw jiri_devel_lc_dev
        git checkout 1a2503c635b5bd91f6eb2d2520960d609df0e6ee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/ethernet/mellanox/mlxsw/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mellanox/mlxsw/core_linecard_dev.c:13:
   In file included from include/net/devlink.h:14:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:40:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/net/ethernet/mellanox/mlxsw/core_linecard_dev.c:13:
   In file included from include/net/devlink.h:14:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:40:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/net/ethernet/mellanox/mlxsw/core_linecard_dev.c:13:
   In file included from include/net/devlink.h:14:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:40:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/net/ethernet/mellanox/mlxsw/core_linecard_dev.c:94:3: error: void function 'mlxsw_linecard_bdev_del' should not return a value [-Wreturn-type]
                   return NULL;
                   ^      ~~~~
   7 warnings and 1 error generated.


vim +/mlxsw_linecard_bdev_del +94 drivers/net/ethernet/mellanox/mlxsw/core_linecard_dev.c

    88	
    89	void mlxsw_linecard_bdev_del(struct mlxsw_linecard *linecard)
    90	{
    91		struct mlxsw_linecard_bdev *linecard_bdev = linecard->bdev;
    92	
    93		if (!linecard_bdev)
  > 94			return NULL;
    95		auxiliary_device_delete(&linecard_bdev->adev);
    96		auxiliary_device_uninit(&linecard_bdev->adev);
    97		linecard->bdev = NULL;
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
