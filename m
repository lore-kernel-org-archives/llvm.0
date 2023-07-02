Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CA12116;
	Sun,  2 Jul 2023 18:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688322227; x=1719858227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9eDmJgwgTgQHOhTWsQfso5wZJaBs0Z+CuKeorj8/dFA=;
  b=h5+nhDgv+xGKxUGcgji+fyp2ndKClCoIKmmf/RQdWw8dxvrAfgMiwGQD
   eKYide/Bu28RtzSJn6L+Idui3SEIn7stgSHKu1TcK46m9LkVvbCqXKm6O
   8ode4tzpbXHtuanOa0NOmskSWoUg4NBX6aGJ8TidVV5d8j54Vq/UyqggX
   PZsHbYdVrfRwOc6Y0vJX6UQjwWg1bu+og248VhgNvbAL6Jw+y22dQDwgd
   dn3MLzIrNekuGM0sqXxmSFRT3ErIv9zhUnltvR6SQKjmw5NONwlz+Hl9Y
   rcJUtxWSCRHNu7S+rnJqyZA3jyhPWxk0MeH1E+RguFs6n4S829q5D+574
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="361581256"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="361581256"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 11:23:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="1048818160"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="1048818160"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Jul 2023 11:23:45 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qG1jc-000GoF-1C;
	Sun, 02 Jul 2023 18:23:44 +0000
Date: Mon, 3 Jul 2023 02:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [jmondi:tmp/ov2680 9/29] drivers/media/i2c/ov2680.c:24:10: fatal
 error: 'media/v4l2-cci.h' file not found
Message-ID: <202307030246.SNalyiyb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git tmp/ov2680
head:   225bc92c21983173d3c13a0db0b83e466bd03753
commit: a92430c91d2bc5db479b35b6983cc71bdf5c180b [9/29] media: ov2680: Convert to new CCI register access helpers
config: hexagon-randconfig-r041-20230703 (https://download.01.org/0day-ci/archive/20230703/202307030246.SNalyiyb-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307030246.SNalyiyb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307030246.SNalyiyb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/i2c/ov2680.c:17:
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
   In file included from drivers/media/i2c/ov2680.c:17:
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
   In file included from drivers/media/i2c/ov2680.c:17:
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
>> drivers/media/i2c/ov2680.c:24:10: fatal error: 'media/v4l2-cci.h' file not found
      24 | #include <media/v4l2-cci.h>
         |          ^~~~~~~~~~~~~~~~~~
   6 warnings and 1 error generated.


vim +24 drivers/media/i2c/ov2680.c

    23	
  > 24	#include <media/v4l2-cci.h>
    25	#include <media/v4l2-common.h>
    26	#include <media/v4l2-ctrls.h>
    27	#include <media/v4l2-subdev.h>
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
