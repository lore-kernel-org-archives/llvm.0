Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A2D6FBC;
	Wed, 26 Apr 2023 20:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682540276; x=1714076276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=068Cpu/MbcMGw1LXQI1cUsssg59KVV31cQo9bhCnP/c=;
  b=H8dGLflorG19WI4+JlSOPMZGIIcImk2JTXycbAeKxxaCwD/iy0nFoBZw
   vkNzMSfmMQ7YCcKP1ZT3jXj4EOY2LiObVy2B7PPUJUGmMrI4behKpU0dg
   amBVbxf5xSINjbsL3VnTMLHzfNIdIDTloMlKMHXgKrLWjCJkX8FfgOHNB
   veI/GOGkML6TDl5trI5rzjLwIkAopuTHGBdqts+jNmLQ2AMACA0W4Dr4w
   QRj5FnBy+ypByV6eUzkWnHoRBf1xwkTmoi7Q1KScEKBmEF2HS7iQq9KwI
   Rxm0b3y4Li+i18/O0QGNX13RI9VZEsvQu3drAJO5kGCs0TxYd1a7ur2L5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="347246778"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="347246778"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 13:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="726703251"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="726703251"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 Apr 2023 13:17:52 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prlaK-0000VM-03;
	Wed, 26 Apr 2023 20:17:52 +0000
Date: Thu, 27 Apr 2023 04:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 13283/14037]
 drivers/watchdog/starfive-wdt.c:584:34: warning: unused variable
 'starfive_wdt_match'
Message-ID: <202304270438.mwnBZp1A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b7455b10da762f2d447678c88e37cc1eb6cb45ee
commit: db728ea9c7be137b4f4361295f11e0b56b6286ac [13283/14037] drivers: watchdog: Add StarFive Watchdog driver
config: hexagon-randconfig-r035-20230426 (https://download.01.org/0day-ci/archive/20230427/202304270438.mwnBZp1A-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=db728ea9c7be137b4f4361295f11e0b56b6286ac
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout db728ea9c7be137b4f4361295f11e0b56b6286ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/watchdog/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304270438.mwnBZp1A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/watchdog/starfive-wdt.c:9:
   In file included from include/linux/iopoll.h:14:
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
   In file included from drivers/watchdog/starfive-wdt.c:9:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/watchdog/starfive-wdt.c:9:
   In file included from include/linux/iopoll.h:14:
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
>> drivers/watchdog/starfive-wdt.c:584:34: warning: unused variable 'starfive_wdt_match' [-Wunused-const-variable]
   static const struct of_device_id starfive_wdt_match[] = {
                                    ^
   7 warnings generated.


vim +/starfive_wdt_match +584 drivers/watchdog/starfive-wdt.c

   583	
 > 584	static const struct of_device_id starfive_wdt_match[] = {
   585		{ .compatible = "starfive,jh7100-wdt", .data = &starfive_wdt_jh7100_variant },
   586		{ .compatible = "starfive,jh7110-wdt", .data = &starfive_wdt_jh7110_variant },
   587		{ /* sentinel */ }
   588	};
   589	MODULE_DEVICE_TABLE(of, starfive_wdt_match);
   590	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
