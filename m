Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77D110EE;
	Sat, 11 Feb 2023 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676107206; x=1707643206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MsMuX/p+A5Yhi/Ww1SLqrOHV1ef+4EP3W8rRUnOaXGM=;
  b=MhX/huUmBtAtASub+ByJ/FgI2LfvKGuvvAv87nIFS3HVLbw8HqYu1Q3l
   J5Lax+Se4plmR9ny3PADtfAM3UnnA4XUls8aiA3mB+FqqemH9+tzo3Yk5
   ebZNI5R6Bqeofh7QMkGRKQMxS4v8Ry0ZVtKpp7LXBx4WOLOyvSzAIzckN
   ckumoW/m/H//+jixl3E/RyLscDaoCA2+xTdqb/UbDQxYZzgWm6fgnQEPT
   cmD8tzLPsubLPXu3vZyfUKQ5zJRsvvMM4M8JSlvK8RAIDHVSSdSTGtORT
   WjAHohQIgKtEm/yDJosTS2sx3VAuZKMdkffY7OECaz4IWLdieDP9EP0Nx
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="393000123"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="393000123"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 01:20:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="668305740"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="668305740"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Feb 2023 01:20:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQm39-0006Nw-0G;
	Sat, 11 Feb 2023 09:20:03 +0000
Date: Sat, 11 Feb 2023 17:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/090-spi-hid 3/28] drivers/spi/spi.c:2243:6:
 warning: unused variable 'cs_setup'
Message-ID: <202302111754.2cwD1FFI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   2800e57a0204b3345ae4df468bb6a4cc74de4f27
commit: 5fd378e592b936b7d7cffad09715ac4eeec47e46 [3/28] spi: Use a 32-bit DT property for spi-cs-setup-delay-ns
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230211/202302111754.2cwD1FFI-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/5fd378e592b936b7d7cffad09715ac4eeec47e46
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/090-spi-hid
        git checkout 5fd378e592b936b7d7cffad09715ac4eeec47e46
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111754.2cwD1FFI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi.c:2243:6: warning: unused variable 'cs_setup' [-Wunused-variable]
           u16 cs_setup;
               ^
   1 warning generated.


vim +/cs_setup +2243 drivers/spi/spi.c

5fd378e592b936 Janne Grunau        2021-12-11  2238  
8caab75fd2c2a9 Geert Uytterhoeven  2017-06-13  2239  static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
c2e51ac3d05424 Geert Uytterhoeven  2016-09-12  2240  			   struct device_node *nc)
d57a4282d04810 Grant Likely        2012-04-07  2241  {
89da4293a7bb29 Trent Piepho        2013-09-27  2242  	u32 value;
33a2fde5f77bd7 Tudor Ambarus       2022-11-17 @2243  	u16 cs_setup;
c2e51ac3d05424 Geert Uytterhoeven  2016-09-12  2244  	int rc;
d57a4282d04810 Grant Likely        2012-04-07  2245  
d57a4282d04810 Grant Likely        2012-04-07  2246  	/* Mode (clock phase/polarity/etc.) */
e0bcb680b152c9 Sergei Shtylyov     2017-08-06  2247  	if (of_property_read_bool(nc, "spi-cpha"))
d57a4282d04810 Grant Likely        2012-04-07  2248  		spi->mode |= SPI_CPHA;
e0bcb680b152c9 Sergei Shtylyov     2017-08-06  2249  	if (of_property_read_bool(nc, "spi-cpol"))
d57a4282d04810 Grant Likely        2012-04-07  2250  		spi->mode |= SPI_CPOL;
e0bcb680b152c9 Sergei Shtylyov     2017-08-06  2251  	if (of_property_read_bool(nc, "spi-3wire"))
c20151dff8a6d5 Lars-Peter Clausen  2012-12-06  2252  		spi->mode |= SPI_3WIRE;
e0bcb680b152c9 Sergei Shtylyov     2017-08-06  2253  	if (of_property_read_bool(nc, "spi-lsb-first"))
cd6339e6ced387 Zhao Qiang          2014-04-01  2254  		spi->mode |= SPI_LSB_FIRST;
3e5ec1db8bfee8 Gregory CLEMENT     2019-10-18  2255  	if (of_property_read_bool(nc, "spi-cs-high"))
f3186dd876697e Linus Walleij       2019-01-07  2256  		spi->mode |= SPI_CS_HIGH;
f3186dd876697e Linus Walleij       2019-01-07  2257  
f477b7fb13df2b wangyuhang          2013-08-11  2258  	/* Device DUAL/QUAD mode */
89da4293a7bb29 Trent Piepho        2013-09-27  2259  	if (!of_property_read_u32(nc, "spi-tx-bus-width", &value)) {
89da4293a7bb29 Trent Piepho        2013-09-27  2260  		switch (value) {
d962608ce2188a Dragos Bogdan       2020-12-21  2261  		case 0:
d962608ce2188a Dragos Bogdan       2020-12-21  2262  			spi->mode |= SPI_NO_TX;
d962608ce2188a Dragos Bogdan       2020-12-21  2263  			break;
89da4293a7bb29 Trent Piepho        2013-09-27  2264  		case 1:
f477b7fb13df2b wangyuhang          2013-08-11  2265  			break;
89da4293a7bb29 Trent Piepho        2013-09-27  2266  		case 2:
f477b7fb13df2b wangyuhang          2013-08-11  2267  			spi->mode |= SPI_TX_DUAL;
f477b7fb13df2b wangyuhang          2013-08-11  2268  			break;
89da4293a7bb29 Trent Piepho        2013-09-27  2269  		case 4:
f477b7fb13df2b wangyuhang          2013-08-11  2270  			spi->mode |= SPI_TX_QUAD;
f477b7fb13df2b wangyuhang          2013-08-11  2271  			break;
6b03061f882de4 Yogesh Narayan Gaur 2018-12-03  2272  		case 8:
6b03061f882de4 Yogesh Narayan Gaur 2018-12-03  2273  			spi->mode |= SPI_TX_OCTAL;
6b03061f882de4 Yogesh Narayan Gaur 2018-12-03  2274  			break;
f477b7fb13df2b wangyuhang          2013-08-11  2275  		default:
8caab75fd2c2a9 Geert Uytterhoeven  2017-06-13  2276  			dev_warn(&ctlr->dev,
a110f93d8b4672 wangyuhang          2013-09-01  2277  				"spi-tx-bus-width %d not supported\n",
89da4293a7bb29 Trent Piepho        2013-09-27  2278  				value);
80874d8c9e9cbf Geert Uytterhoeven  2014-05-26  2279  			break;
f477b7fb13df2b wangyuhang          2013-08-11  2280  		}
f477b7fb13df2b wangyuhang          2013-08-11  2281  	}
f477b7fb13df2b wangyuhang          2013-08-11  2282  
89da4293a7bb29 Trent Piepho        2013-09-27  2283  	if (!of_property_read_u32(nc, "spi-rx-bus-width", &value)) {
89da4293a7bb29 Trent Piepho        2013-09-27  2284  		switch (value) {
d962608ce2188a Dragos Bogdan       2020-12-21  2285  		case 0:
d962608ce2188a Dragos Bogdan       2020-12-21  2286  			spi->mode |= SPI_NO_RX;
d962608ce2188a Dragos Bogdan       2020-12-21  2287  			break;
89da4293a7bb29 Trent Piepho        2013-09-27  2288  		case 1:
f477b7fb13df2b wangyuhang          2013-08-11  2289  			break;
89da4293a7bb29 Trent Piepho        2013-09-27  2290  		case 2:
f477b7fb13df2b wangyuhang          2013-08-11  2291  			spi->mode |= SPI_RX_DUAL;
f477b7fb13df2b wangyuhang          2013-08-11  2292  			break;
89da4293a7bb29 Trent Piepho        2013-09-27  2293  		case 4:
f477b7fb13df2b wangyuhang          2013-08-11  2294  			spi->mode |= SPI_RX_QUAD;
f477b7fb13df2b wangyuhang          2013-08-11  2295  			break;
6b03061f882de4 Yogesh Narayan Gaur 2018-12-03  2296  		case 8:
6b03061f882de4 Yogesh Narayan Gaur 2018-12-03  2297  			spi->mode |= SPI_RX_OCTAL;
6b03061f882de4 Yogesh Narayan Gaur 2018-12-03  2298  			break;
f477b7fb13df2b wangyuhang          2013-08-11  2299  		default:
8caab75fd2c2a9 Geert Uytterhoeven  2017-06-13  2300  			dev_warn(&ctlr->dev,
a110f93d8b4672 wangyuhang          2013-09-01  2301  				"spi-rx-bus-width %d not supported\n",
89da4293a7bb29 Trent Piepho        2013-09-27  2302  				value);
80874d8c9e9cbf Geert Uytterhoeven  2014-05-26  2303  			break;
f477b7fb13df2b wangyuhang          2013-08-11  2304  		}
a822e99c70f448 Mark Brown          2013-08-30  2305  	}
f477b7fb13df2b wangyuhang          2013-08-11  2306  
8caab75fd2c2a9 Geert Uytterhoeven  2017-06-13  2307  	if (spi_controller_is_slave(ctlr)) {
194276b073a10f Rob Herring         2018-12-05  2308  		if (!of_node_name_eq(nc, "slave")) {
25c56c88a4627e Rob Herring         2017-07-18  2309  			dev_err(&ctlr->dev, "%pOF is not called 'slave'\n",
25c56c88a4627e Rob Herring         2017-07-18  2310  				nc);
6c364062bfed3c Geert Uytterhoeven  2017-05-22  2311  			return -EINVAL;
6c364062bfed3c Geert Uytterhoeven  2017-05-22  2312  		}
6c364062bfed3c Geert Uytterhoeven  2017-05-22  2313  		return 0;
6c364062bfed3c Geert Uytterhoeven  2017-05-22  2314  	}
6c364062bfed3c Geert Uytterhoeven  2017-05-22  2315  
6c364062bfed3c Geert Uytterhoeven  2017-05-22  2316  	/* Device address */
6c364062bfed3c Geert Uytterhoeven  2017-05-22  2317  	rc = of_property_read_u32(nc, "reg", &value);
6c364062bfed3c Geert Uytterhoeven  2017-05-22  2318  	if (rc) {
25c56c88a4627e Rob Herring         2017-07-18  2319  		dev_err(&ctlr->dev, "%pOF has no valid 'reg' property (%d)\n",
25c56c88a4627e Rob Herring         2017-07-18  2320  			nc, rc);
6c364062bfed3c Geert Uytterhoeven  2017-05-22  2321  		return rc;
6c364062bfed3c Geert Uytterhoeven  2017-05-22  2322  	}
6c364062bfed3c Geert Uytterhoeven  2017-05-22  2323  	spi->chip_select = value;
6c364062bfed3c Geert Uytterhoeven  2017-05-22  2324  
d57a4282d04810 Grant Likely        2012-04-07  2325  	/* Device speed */
671c3bf50ae498 Chuanhong Guo       2020-03-06  2326  	if (!of_property_read_u32(nc, "spi-max-frequency", &value))
89da4293a7bb29 Trent Piepho        2013-09-27  2327  		spi->max_speed_hz = value;
d57a4282d04810 Grant Likely        2012-04-07  2328  
5fd378e592b936 Janne Grunau        2021-12-11  2329  	/* Device CS delays */
5fd378e592b936 Janne Grunau        2021-12-11  2330  	of_spi_parse_dt_cs_delay(nc, &spi->cs_setup, "spi-cs-setup-delay-ns");
33a2fde5f77bd7 Tudor Ambarus       2022-11-17  2331  
c2e51ac3d05424 Geert Uytterhoeven  2016-09-12  2332  	return 0;
c2e51ac3d05424 Geert Uytterhoeven  2016-09-12  2333  }
c2e51ac3d05424 Geert Uytterhoeven  2016-09-12  2334  

:::::: The code at line 2243 was first introduced by commit
:::::: 33a2fde5f77bd744b8bd0c694bc173cc968e55a5 spi: Introduce spi-cs-setup-ns property

:::::: TO: Tudor Ambarus <tudor.ambarus@microchip.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
