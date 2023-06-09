Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BD218C34;
	Fri,  9 Jun 2023 20:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686341387; x=1717877387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uxfrul5tjkZFnTPfH9Hqt2+LtaPUUZwxG8+TTjZ3+Sc=;
  b=EXbDKrLkee9acFK9GAnREI6ba81GtukTR/1oN0Qi+CvZsrJdpnPsObke
   bJ/Tu2S258rOaJY21gP8QAU/s8FFLqibYSKwF/lQ2FjYh+9TVAKiM3VIb
   ju053b7KHKTIwKQwCmGMafGo3SvP9FynShemLWdoCX1T5f6bDMb5mM6HR
   lxNiKXrP2sla7+R6X9Pxuo63mEe0j3YAsu9XhnEr4O8fCxkMzsO2qoY2Q
   5BdLcKXEJkY6fWvfb90dUDhiQbUmqa8GfLnpZdgcFS/lErEQ0rFHoLK0M
   qDf67G053zV+E8y+BL4NUXeJLLdElp9kj/wjXovMC2j5nA/KYWP9lTHRY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="355169048"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="355169048"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 13:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="704667798"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="704667798"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Jun 2023 13:09:44 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7iQZ-0009Lx-0s;
	Fri, 09 Jun 2023 20:09:43 +0000
Date: Sat, 10 Jun 2023 04:09:18 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [soc:soc/arm 14/16] drivers/input/touchscreen/ads7846.c:1126:17:
 warning: cast to smaller integer type 'u32' (aka 'unsigned int') from 'const
 void *'
Message-ID: <202306100442.jStknDT1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/arm
head:   9a0e0c5957ff37147253796fbf5dfd68b307af58
commit: 8f7913c04f6a7b90bcf998ece17395d7090f6d44 [14/16] Input: ads7846 - Fix usage of match data
config: s390-buildonly-randconfig-r002-20230608 (https://download.01.org/0day-ci/archive/20230610/202306100442.jStknDT1-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=8f7913c04f6a7b90bcf998ece17395d7090f6d44
        git remote add soc https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
        git fetch --no-tags soc soc/arm
        git checkout 8f7913c04f6a7b90bcf998ece17395d7090f6d44
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/input/touchscreen/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100442.jStknDT1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/input/touchscreen/ads7846.c:29:
   In file included from include/linux/spi/spi.h:15:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/input/touchscreen/ads7846.c:29:
   In file included from include/linux/spi/spi.h:15:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/input/touchscreen/ads7846.c:29:
   In file included from include/linux/spi/spi.h:15:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/input/touchscreen/ads7846.c:1126:17: warning: cast to smaller integer type 'u32' (aka 'unsigned int') from 'const void *' [-Wvoid-pointer-to-int-cast]
    1126 |         pdata->model = (u32)device_get_match_data(dev);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings generated.


vim +1126 drivers/input/touchscreen/ads7846.c

  1116	
  1117	static const struct ads7846_platform_data *ads7846_get_props(struct device *dev)
  1118	{
  1119		struct ads7846_platform_data *pdata;
  1120		u32 value;
  1121	
  1122		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
  1123		if (!pdata)
  1124			return ERR_PTR(-ENOMEM);
  1125	
> 1126		pdata->model = (u32)device_get_match_data(dev);
  1127	
  1128		device_property_read_u16(dev, "ti,vref-delay-usecs",
  1129					 &pdata->vref_delay_usecs);
  1130		device_property_read_u16(dev, "ti,vref-mv", &pdata->vref_mv);
  1131		pdata->keep_vref_on = device_property_read_bool(dev, "ti,keep-vref-on");
  1132	
  1133		pdata->swap_xy = device_property_read_bool(dev, "ti,swap-xy");
  1134	
  1135		device_property_read_u16(dev, "ti,settle-delay-usec",
  1136					 &pdata->settle_delay_usecs);
  1137		device_property_read_u16(dev, "ti,penirq-recheck-delay-usecs",
  1138					 &pdata->penirq_recheck_delay_usecs);
  1139	
  1140		device_property_read_u16(dev, "ti,x-plate-ohms", &pdata->x_plate_ohms);
  1141		device_property_read_u16(dev, "ti,y-plate-ohms", &pdata->y_plate_ohms);
  1142	
  1143		device_property_read_u16(dev, "ti,x-min", &pdata->x_min);
  1144		device_property_read_u16(dev, "ti,y-min", &pdata->y_min);
  1145		device_property_read_u16(dev, "ti,x-max", &pdata->x_max);
  1146		device_property_read_u16(dev, "ti,y-max", &pdata->y_max);
  1147	
  1148		/*
  1149		 * touchscreen-max-pressure gets parsed during
  1150		 * touchscreen_parse_properties()
  1151		 */
  1152		device_property_read_u16(dev, "ti,pressure-min", &pdata->pressure_min);
  1153		if (!device_property_read_u32(dev, "touchscreen-min-pressure", &value))
  1154			pdata->pressure_min = (u16) value;
  1155		device_property_read_u16(dev, "ti,pressure-max", &pdata->pressure_max);
  1156	
  1157		device_property_read_u16(dev, "ti,debounce-max", &pdata->debounce_max);
  1158		if (!device_property_read_u32(dev, "touchscreen-average-samples", &value))
  1159			pdata->debounce_max = (u16) value;
  1160		device_property_read_u16(dev, "ti,debounce-tol", &pdata->debounce_tol);
  1161		device_property_read_u16(dev, "ti,debounce-rep", &pdata->debounce_rep);
  1162	
  1163		device_property_read_u32(dev, "ti,pendown-gpio-debounce",
  1164				     &pdata->gpio_pendown_debounce);
  1165	
  1166		pdata->wakeup = device_property_read_bool(dev, "wakeup-source") ||
  1167				device_property_read_bool(dev, "linux,wakeup");
  1168	
  1169		return pdata;
  1170	}
  1171	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
