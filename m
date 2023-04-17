Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11DD8460;
	Mon, 17 Apr 2023 15:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681744735; x=1713280735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ny/0OZOOh9P8XtNvVLJ20jvrKNtHeiIzPvU98FJV3YM=;
  b=WX4NmWoWnjHbERb1J6WJU+I6JHT40tZYIHdnLCKKLGZv2xgelXtbU/o0
   P58c+rsEKDZhs/1yJLnKF+u1hzKVmB9C73dt0tCbjEQTvFXEIKz8jzu+C
   Xx6H0Ov3arSEFKBpOj+3ncNeJpNnwBHWluNmyF3ag/C6w5jjOkPm52c0/
   a5bvC4vVaKpwsWi0BlZo63PufWjY/UDgOYzHrqJkecpid3EzRbXfosIXF
   F2+6Jd/6qnThHqBzDA/FbCHc4VF+jRnuTyHdtAfm9jC9VzNNphnKsA1bc
   reMuPoPFgDsLw9C1zlXdsoYPiRAk+Ue4URIF21E6hiLmVMDdRDJgWZ73A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="333716951"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="333716951"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 08:18:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="640977973"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="640977973"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Apr 2023 08:18:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poQd1-000cWh-2o;
	Mon, 17 Apr 2023 15:18:51 +0000
Date: Mon, 17 Apr 2023 23:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jic23-iio:testings 65/65]
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2690:14: error: expected ';'
 after return statement
Message-ID: <202304172312.pFvZ0sxn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testings
head:   4c7e876ff00d0fc0501fd5811bd1328cfc5d8408
commit: 4c7e876ff00d0fc0501fd5811bd1328cfc5d8408 [65/65] iio: imu: lsm6dsx: Add ACPI mount matrix retrieval
config: hexagon-randconfig-r045-20230417 (https://download.01.org/0day-ci/archive/20230417/202304172312.pFvZ0sxn-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=4c7e876ff00d0fc0501fd5811bd1328cfc5d8408
        git remote add jic23-iio https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
        git fetch --no-tags jic23-iio testings
        git checkout 4c7e876ff00d0fc0501fd5811bd1328cfc5d8408
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/iio/imu/st_lsm6dsx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304172312.pFvZ0sxn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:64:
   In file included from include/linux/iio/triggered_buffer.h:6:
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
   In file included from drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:64:
   In file included from include/linux/iio/triggered_buffer.h:6:
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
   In file included from drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:64:
   In file included from include/linux/iio/triggered_buffer.h:6:
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
>> drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2690:14: error: expected ';' after return statement
           return false
                       ^
                       ;
   6 warnings and 1 error generated.


vim +2690 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c

  2686	
  2687	static int lsm6dsx_get_acpi_mount_matrix(struct device *dev,
  2688						  struct iio_mount_matrix *orientation)
  2689	{
> 2690		return false
  2691	}
  2692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
