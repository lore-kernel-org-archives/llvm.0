Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D80B7C
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 07:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662620878; x=1694156878;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g4W7H6QHrpz3Os21HlSEFI7Y9Z66W4/3/Zj9A4FqNyA=;
  b=eKRMDbGOytZ4an76WYSBCQxXKopGonRa1OhS2ZxZZc5m6dB79/MSpb58
   GaVi0E3Uc0YIZ6xnaAXXJA00TRGzD9IfAG4i0nFgkP4iQWtfOnFCDz4c/
   8s1iuaRmNSL4+wHlkIK+RtcsiGlMen/MFBktY/RZOZNVWeisYPaanzCKa
   TvQjF+kAOkxZBWOiPNVVAcYcHBFQ5RVMzfIpDkhqvOeaa8HqHlaWFl1sP
   Kt8ElKhHM6YcbE9+oOof27DUFH3ip4e2mUNi2Oke4nzGqjhmiKxyEg0lU
   GXqlNGWYxnHSvFwR0sEIuj4dYbKExOGWF6gKnDsZocOdc+DdLhrlkAup2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="284108354"
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="284108354"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 00:07:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="757085225"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 08 Sep 2022 00:07:55 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWBdi-0007TP-22;
	Thu, 08 Sep 2022 07:07:54 +0000
Date: Thu, 8 Sep 2022 15:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: Weilong Chen <chenweilong@huawei.com>, yangyicong@hisilicon.com,
	xuwei5@huawei.com, wsa@kernel.org, robh+dt@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH next v3 1/2] i2c: hisi: Add initial device tree support
Message-ID: <202209081409.fOmaxkP3-lkp@intel.com>
References: <20220908025701.330210-1-chenweilong@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908025701.330210-1-chenweilong@huawei.com>

Hi Weilong,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20220907]

url:    https://github.com/intel-lab-lkp/linux/commits/Weilong-Chen/i2c-hisi-Add-initial-device-tree-support/20220908-105559
base:    5957ac6635a1a12d4aa2661bbf04d3085a73372a
config: hexagon-randconfig-r045-20220907 (https://download.01.org/0day-ci/archive/20220908/202209081409.fOmaxkP3-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/679f6654e170ef08682e0b6f4ef3753b998e0193
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Weilong-Chen/i2c-hisi-Add-initial-device-tree-support/20220908-105559
        git checkout 679f6654e170ef08682e0b6f4ef3753b998e0193
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash M=drivers/i2c/busses

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-hisi.c:12:
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
   In file included from drivers/i2c/busses/i2c-hisi.c:12:
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
   In file included from drivers/i2c/busses/i2c-hisi.c:12:
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
>> drivers/i2c/busses/i2c-hisi.c:503:25: error: use of undeclared identifier 'hisi_i2c_dts_ids'
   MODULE_DEVICE_TABLE(of, hisi_i2c_dts_ids);
                           ^
   6 warnings and 1 error generated.


vim +/hisi_i2c_dts_ids +503 drivers/i2c/busses/i2c-hisi.c

   502	
 > 503	MODULE_DEVICE_TABLE(of, hisi_i2c_dts_ids);
   504	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
