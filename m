Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49A823D0;
	Mon, 10 Apr 2023 23:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681170360; x=1712706360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2gL9AIsy+pMSDwwh5kMQmzlYzHqgWRNk+FUARdbuWJM=;
  b=lmJUvXMejXH8HsMUcc7Hvb5lDjY4/b7TOQEAaR6ZKdI8AZmIxa45/NfR
   5nAM8bXv7q2ciI29Ju8zS06ykRvIuq4NTNCi8SDKQPOYys+wGLncKz2fU
   efYFalxEvnBYUFhh9DNHm3xf+N/VrG4yl3AqmwOyEQRVJbiNULexC7VI+
   /UpoqBuF2XooprvR/0Ha1YrRinLgl7S1Mzj9TWmyvmmxqdASUp6fuTU/E
   ZIXRYZTWXRhOU58pZVyMkgHrQk4iTYEBpwI7PxAScWgJ253LmgiayT1zT
   1Nl62W7s6+0kYd0DMEMr4cPwweGG4CEi5lnvcRJA2snzXLzCmgk1s13bA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="406310841"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="406310841"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 16:45:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="934512815"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="934512815"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Apr 2023 16:45:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm1Ch-000VjV-0D;
	Mon, 10 Apr 2023 23:45:43 +0000
Date: Tue, 11 Apr 2023 07:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jic23-iio:testing 65/65]
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2641:7: error: call to
 undeclared function 'acpi_has_method'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202304110756.69aPebZE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   4c3b188facb2011e9edcdaaf71f2f553e9c230df
commit: 4c3b188facb2011e9edcdaaf71f2f553e9c230df [65/65] iio: imu: lsm6dsx: Add ACPI mount matrix retrieval
config: hexagon-randconfig-r045-20230410 (https://download.01.org/0day-ci/archive/20230411/202304110756.69aPebZE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=4c3b188facb2011e9edcdaaf71f2f553e9c230df
        git remote add jic23-iio https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
        git fetch --no-tags jic23-iio testing
        git checkout 4c3b188facb2011e9edcdaaf71f2f553e9c230df
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/iio/imu/st_lsm6dsx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304110756.69aPebZE-lkp@intel.com/

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
>> drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2641:7: error: call to undeclared function 'acpi_has_method'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (!acpi_has_method(adev->handle, "ROTM"))
                ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2641:7: note: did you mean 'acpi_has_watchdog'?
   include/linux/acpi.h:1442:20: note: 'acpi_has_watchdog' declared here
   static inline bool acpi_has_watchdog(void) { return false; }
                      ^
>> drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2641:27: error: incomplete definition of type 'struct acpi_device'
           if (!acpi_has_method(adev->handle, "ROTM"))
                                ~~~~^
   include/linux/acpi.h:798:8: note: forward declaration of 'struct acpi_device'
   struct acpi_device;
          ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2644:36: error: incomplete definition of type 'struct acpi_device'
           status = acpi_evaluate_object(adev->handle, "ROTM", NULL, &buffer);
                                         ~~~~^
   include/linux/acpi.h:798:8: note: forward declaration of 'struct acpi_device'
   struct acpi_device;
          ^
   6 warnings and 3 errors generated.


vim +/acpi_has_method +2641 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c

  2627	
  2628	static bool lsm6dsx_get_acpi_mount_matrix(struct device *dev,
  2629						  struct iio_mount_matrix *orientation)
  2630	{
  2631		struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
  2632		struct acpi_device *adev = ACPI_COMPANION(dev);
  2633		union acpi_object *obj, *elements;
  2634		acpi_status status;
  2635		int i, j, val[3];
  2636		char *str;
  2637	
  2638		if (!has_acpi_companion(dev))
  2639			return -EINVAL;
  2640	
> 2641		if (!acpi_has_method(adev->handle, "ROTM"))
  2642			return -EINVAL;
  2643	
  2644		status = acpi_evaluate_object(adev->handle, "ROTM", NULL, &buffer);
  2645		if (ACPI_FAILURE(status)) {
  2646			dev_warn(dev, "Failed to get ACPI mount matrix: %d\n", status);
  2647			return -EINVAL;
  2648		}
  2649	
  2650		obj = buffer.pointer;
  2651		if (obj->type != ACPI_TYPE_PACKAGE || obj->package.count != 3)
  2652			goto unknown_format;
  2653	
  2654		elements = obj->package.elements;
  2655		for (i = 0; i < 3; i++) {
  2656			if (elements[i].type != ACPI_TYPE_STRING)
  2657				goto unknown_format;
  2658	
  2659			str = elements[i].string.pointer;
  2660			if (sscanf(str, "%d %d %d", &val[0], &val[1], &val[2]) != 3)
  2661				goto unknown_format;
  2662	
  2663			for (j = 0; j < 3; j++) {
  2664				switch (val[j]) {
  2665				case -1: str = "-1"; break;
  2666				case 0:  str = "0";  break;
  2667				case 1:  str = "1";  break;
  2668				default: goto unknown_format;
  2669				}
  2670				orientation->rotation[i * 3 + j] = str;
  2671			}
  2672		}
  2673	
  2674		kfree(buffer.pointer);
  2675		return 0;
  2676	
  2677	unknown_format:
  2678		dev_warn(dev, "Unknown ACPI mount matrix format, ignoring\n");
  2679		kfree(buffer.pointer);
  2680		return -EINVAL;
  2681	}
  2682	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
