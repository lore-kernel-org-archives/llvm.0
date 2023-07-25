Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D0E26B25;
	Tue, 25 Jul 2023 21:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690319420; x=1721855420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HmJEGGYKynu+AbShhAPkkDsvlcIJ0aZEZRmSwYLOpA8=;
  b=M2Utny7BHG1EKJelkagJl8Zo+YuOEXZbWjKmHGs3/3+2WPlDCJO8i7L1
   pgCOLaNhIbQ8IfFetdNsi23e2+pb4AhgVeTezw30SF5BR6sBvMztEoMXQ
   /kjLxF6vEL0A4tHqcBy5rjfaoyMEWfd4TUTkgq2Mr5sSRbcQ48RS8RzyX
   oi2KJt9PcM+dXim/MrTFSNPcZ0xO6kEQguF2me2V7gWzTC90ENXBcoF0/
   U3H3hr+N1SPIGZlb3rURnDl2/xlvvBTS54V5AGbXnWJ4T/odeSAkd277y
   tcha8h1mFyYgEBDG7VQhiHHUwOpQTSbMNSyDzg7hMaQZWMnR7WJFvBOuX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="347455382"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="347455382"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 14:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="972836130"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="972836130"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2023 14:10:17 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOPIO-0000Ld-2D;
	Tue, 25 Jul 2023 21:10:16 +0000
Date: Wed, 26 Jul 2023 05:09:56 +0800
From: kernel test robot <lkp@intel.com>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 25/42] drivers/usb/dwc3/dwc3-octeon.c:403:10:
 warning: shift count >= width of type
Message-ID: <202307260537.MROrhVNM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ladislav,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   ac47051f0bb8ccf1eaedb296a19fcb541474db53
commit: b3061c5a15fe460502e9574b4663dd7c6ed80b48 [25/42] usb: dwc3: dwc3-octeon: Convert to glue driver
config: arm-randconfig-r046-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260537.MROrhVNM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260537.MROrhVNM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260537.MROrhVNM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc3/dwc3-octeon.c:403:10: warning: shift count >= width of type [-Wshift-count-overflow]
     403 |         val &= ~USBDRD_UCTL_CTL_REF_CLK_DIV2;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/dwc3-octeon.c:71:40: note: expanded from macro 'USBDRD_UCTL_CTL_REF_CLK_DIV2'
      71 | # define USBDRD_UCTL_CTL_REF_CLK_DIV2           BIT(38)
         |                                                 ^~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   drivers/usb/dwc3/dwc3-octeon.c:404:10: warning: shift count >= width of type [-Wshift-count-overflow]
     404 |         val &= ~USBDRD_UCTL_CTL_REF_CLK_SEL;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/dwc3-octeon.c:38:39: note: expanded from macro 'USBDRD_UCTL_CTL_REF_CLK_SEL'
      38 | # define USBDRD_UCTL_CTL_REF_CLK_SEL            GENMASK(61, 60)
         |                                                 ^~~~~~~~~~~~~~~
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/linux/bits.h:34:22: note: expanded from macro '__GENMASK'
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^  ~~~
>> drivers/usb/dwc3/dwc3-octeon.c:404:10: warning: shift count is negative [-Wshift-count-negative]
     404 |         val &= ~USBDRD_UCTL_CTL_REF_CLK_SEL;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/dwc3-octeon.c:38:39: note: expanded from macro 'USBDRD_UCTL_CTL_REF_CLK_SEL'
      38 | # define USBDRD_UCTL_CTL_REF_CLK_SEL            GENMASK(61, 60)
         |                                                 ^~~~~~~~~~~~~~~
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/dwc3-octeon.c:405:20: warning: shift count >= width of type [-Wshift-count-overflow]
     405 |         val |= FIELD_PREP(USBDRD_UCTL_CTL_REF_CLK_SEL, ref_clk_sel);
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/dwc3-octeon.c:38:39: note: expanded from macro 'USBDRD_UCTL_CTL_REF_CLK_SEL'
      38 | # define USBDRD_UCTL_CTL_REF_CLK_SEL            GENMASK(61, 60)
         |                                                 ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/linux/bits.h:34:22: note: expanded from macro '__GENMASK'
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/usb/dwc3/dwc3-octeon.c:405:20: warning: shift count is negative [-Wshift-count-negative]
     405 |         val |= FIELD_PREP(USBDRD_UCTL_CTL_REF_CLK_SEL, ref_clk_sel);
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/dwc3-octeon.c:38:39: note: expanded from macro 'USBDRD_UCTL_CTL_REF_CLK_SEL'
      38 | # define USBDRD_UCTL_CTL_REF_CLK_SEL            GENMASK(61, 60)
         |                                                 ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/usb/dwc3/dwc3-octeon.c:405:20: warning: shift count >= width of type [-Wshift-count-overflow]
     405 |         val |= FIELD_PREP(USBDRD_UCTL_CTL_REF_CLK_SEL, ref_clk_sel);
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/dwc3-octeon.c:38:39: note: expanded from macro 'USBDRD_UCTL_CTL_REF_CLK_SEL'
      38 | # define USBDRD_UCTL_CTL_REF_CLK_SEL            GENMASK(61, 60)
         |                                                 ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/linux/bits.h:34:22: note: expanded from macro '__GENMASK'
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/usb/dwc3/dwc3-octeon.c:405:20: warning: shift count is negative [-Wshift-count-negative]
     405 |         val |= FIELD_PREP(USBDRD_UCTL_CTL_REF_CLK_SEL, ref_clk_sel);
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/dwc3-octeon.c:38:39: note: expanded from macro 'USBDRD_UCTL_CTL_REF_CLK_SEL'
      38 | # define USBDRD_UCTL_CTL_REF_CLK_SEL            GENMASK(61, 60)
         |                                                 ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/usb/dwc3/dwc3-octeon.c:405:20: warning: shift count >= width of type [-Wshift-count-overflow]


vim +403 drivers/usb/dwc3/dwc3-octeon.c

93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  302  
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  303  static int dwc3_octeon_clocks_start(struct device *dev, void __iomem *base)
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  304  {
dc917ea7a2c955 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  305  	int i, div, mpll_mul, ref_clk_fsel, ref_clk_sel = 2;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  306  	u32 clock_rate;
dc917ea7a2c955 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  307  	u64 val;
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  308  	void __iomem *uctl_ctl_reg = base + USBDRD_UCTL_CTL;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  309  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  310  	if (dev->of_node) {
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  311  		const char *ss_clock_type;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  312  		const char *hs_clock_type;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  313  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  314  		i = of_property_read_u32(dev->of_node,
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  315  					 "refclk-frequency", &clock_rate);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  316  		if (i) {
4a24f6e0cc17ba arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2022-12-21  317  			dev_err(dev, "No UCTL \"refclk-frequency\"\n");
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  318  			return -EINVAL;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  319  		}
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  320  		i = of_property_read_string(dev->of_node,
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  321  					    "refclk-type-ss", &ss_clock_type);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  322  		if (i) {
4a24f6e0cc17ba arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2022-12-21  323  			dev_err(dev, "No UCTL \"refclk-type-ss\"\n");
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  324  			return -EINVAL;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  325  		}
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  326  		i = of_property_read_string(dev->of_node,
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  327  					    "refclk-type-hs", &hs_clock_type);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  328  		if (i) {
4a24f6e0cc17ba arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2022-12-21  329  			dev_err(dev, "No UCTL \"refclk-type-hs\"\n");
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  330  			return -EINVAL;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  331  		}
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  332  		if (strcmp("dlmc_ref_clk0", ss_clock_type) == 0) {
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  333  			if (strcmp(hs_clock_type, "dlmc_ref_clk0") == 0)
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  334  				ref_clk_sel = 0;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  335  			else if (strcmp(hs_clock_type, "pll_ref_clk") == 0)
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  336  				ref_clk_sel = 2;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  337  			else
4a24f6e0cc17ba arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2022-12-21  338  				dev_warn(dev, "Invalid HS clock type %s, using pll_ref_clk instead\n",
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  339  					 hs_clock_type);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  340  		} else if (strcmp(ss_clock_type, "dlmc_ref_clk1") == 0) {
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  341  			if (strcmp(hs_clock_type, "dlmc_ref_clk1") == 0)
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  342  				ref_clk_sel = 1;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  343  			else if (strcmp(hs_clock_type, "pll_ref_clk") == 0)
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  344  				ref_clk_sel = 3;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  345  			else {
4a24f6e0cc17ba arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2022-12-21  346  				dev_warn(dev, "Invalid HS clock type %s, using pll_ref_clk instead\n",
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  347  					 hs_clock_type);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  348  				ref_clk_sel = 3;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  349  			}
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  350  		} else
4a24f6e0cc17ba arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2022-12-21  351  			dev_warn(dev, "Invalid SS clock type %s, using dlmc_ref_clk0 instead\n",
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  352  				 ss_clock_type);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  353  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  354  		if ((ref_clk_sel == 0 || ref_clk_sel == 1) &&
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  355  		    (clock_rate != 100000000))
4a24f6e0cc17ba arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2022-12-21  356  			dev_warn(dev, "Invalid UCTL clock rate of %u, using 100000000 instead\n",
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  357  				 clock_rate);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  358  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  359  	} else {
4a24f6e0cc17ba arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2022-12-21  360  		dev_err(dev, "No USB UCTL device node\n");
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  361  		return -EINVAL;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  362  	}
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  363  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  364  	/*
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  365  	 * Step 1: Wait for all voltages to be stable...that surely
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  366  	 *         happened before starting the kernel. SKIP
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  367  	 */
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  368  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  369  	/* Step 2: Select GPIO for overcurrent indication, if desired. SKIP */
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  370  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  371  	/* Step 3: Assert all resets. */
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  372  	val = dwc3_octeon_readq(uctl_ctl_reg);
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  373  	val |= USBDRD_UCTL_CTL_UPHY_RST |
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  374  	       USBDRD_UCTL_CTL_UAHC_RST |
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  375  	       USBDRD_UCTL_CTL_UCTL_RST;
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  376  	dwc3_octeon_writeq(uctl_ctl_reg, val);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  377  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  378  	/* Step 4a: Reset the clock dividers. */
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  379  	val = dwc3_octeon_readq(uctl_ctl_reg);
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  380  	val |= USBDRD_UCTL_CTL_H_CLKDIV_RST;
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  381  	dwc3_octeon_writeq(uctl_ctl_reg, val);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  382  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  383  	/* Step 4b: Select controller clock frequency. */
dc917ea7a2c955 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  384  	div = dwc3_octeon_get_divider();
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  385  	val = dwc3_octeon_readq(uctl_ctl_reg);
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  386  	val &= ~USBDRD_UCTL_CTL_H_CLKDIV_SEL;
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  387  	val |= FIELD_PREP(USBDRD_UCTL_CTL_H_CLKDIV_SEL, div);
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  388  	val |= USBDRD_UCTL_CTL_H_CLK_EN;
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  389  	dwc3_octeon_writeq(uctl_ctl_reg, val);
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  390  	val = dwc3_octeon_readq(uctl_ctl_reg);
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  391  	if ((div != FIELD_GET(USBDRD_UCTL_CTL_H_CLKDIV_SEL, val)) ||
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  392  	    (!(FIELD_GET(USBDRD_UCTL_CTL_H_CLK_EN, val)))) {
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  393  		dev_err(dev, "dwc3 controller clock init failure.\n");
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  394  			return -EINVAL;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  395  	}
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  396  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  397  	/* Step 4c: Deassert the controller clock divider reset. */
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  398  	val &= ~USBDRD_UCTL_CTL_H_CLKDIV_RST;
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  399  	dwc3_octeon_writeq(uctl_ctl_reg, val);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  400  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  401  	/* Step 5a: Reference clock configuration. */
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  402  	val = dwc3_octeon_readq(uctl_ctl_reg);
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19 @403  	val &= ~USBDRD_UCTL_CTL_REF_CLK_DIV2;
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19 @404  	val &= ~USBDRD_UCTL_CTL_REF_CLK_SEL;
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  405  	val |= FIELD_PREP(USBDRD_UCTL_CTL_REF_CLK_SEL, ref_clk_sel);
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  406  
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  407  	ref_clk_fsel = 0x07;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  408  	switch (clock_rate) {
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  409  	default:
4a24f6e0cc17ba arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2022-12-21  410  		dev_warn(dev, "Invalid ref_clk %u, using 100000000 instead\n",
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  411  			 clock_rate);
c9b0299034665d arch/mips/cavium-octeon/octeon-usb.c Liangliang Huang 2020-05-04  412  		fallthrough;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  413  	case 100000000:
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  414  		mpll_mul = 0x19;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  415  		if (ref_clk_sel < 2)
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  416  			ref_clk_fsel = 0x27;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  417  		break;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  418  	case 50000000:
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  419  		mpll_mul = 0x32;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  420  		break;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  421  	case 125000000:
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  422  		mpll_mul = 0x28;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  423  		break;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  424  	}
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  425  	val &= ~USBDRD_UCTL_CTL_REF_CLK_FSEL;
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  426  	val |= FIELD_PREP(USBDRD_UCTL_CTL_REF_CLK_FSEL, ref_clk_fsel);
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  427  
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  428  	val &= ~USBDRD_UCTL_CTL_MPLL_MULTIPLIER;
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  429  	val |= FIELD_PREP(USBDRD_UCTL_CTL_MPLL_MULTIPLIER, mpll_mul);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  430  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  431  	/* Step 5b: Configure and enable spread-spectrum for SuperSpeed. */
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  432  	val |= USBDRD_UCTL_CTL_SSC_EN;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  433  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  434  	/* Step 5c: Enable SuperSpeed. */
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  435  	val |= USBDRD_UCTL_CTL_REF_SSP_EN;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  436  
94bd83e45acdd7 arch/mips/cavium-octeon/octeon-usb.c Julia Lawall     2022-04-30  437  	/* Step 5d: Configure PHYs. SKIP */
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  438  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  439  	/* Step 6a & 6b: Power up PHYs. */
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  440  	val |= USBDRD_UCTL_CTL_HS_POWER_EN;
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  441  	val |= USBDRD_UCTL_CTL_SS_POWER_EN;
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  442  	dwc3_octeon_writeq(uctl_ctl_reg, val);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  443  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  444  	/* Step 7: Wait 10 controller-clock cycles to take effect. */
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  445  	udelay(10);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  446  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  447  	/* Step 8a: Deassert UCTL reset signal. */
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  448  	val = dwc3_octeon_readq(uctl_ctl_reg);
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  449  	val &= ~USBDRD_UCTL_CTL_UCTL_RST;
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  450  	dwc3_octeon_writeq(uctl_ctl_reg, val);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  451  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  452  	/* Step 8b: Wait 10 controller-clock cycles. */
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  453  	udelay(10);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  454  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  455  	/* Steo 8c: Setup power-power control. */
4a24f6e0cc17ba arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2022-12-21  456  	if (dwc3_octeon_config_power(dev, base))
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  457  		return -EINVAL;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  458  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  459  	/* Step 8d: Deassert UAHC reset signal. */
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  460  	val = dwc3_octeon_readq(uctl_ctl_reg);
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  461  	val &= ~USBDRD_UCTL_CTL_UAHC_RST;
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  462  	dwc3_octeon_writeq(uctl_ctl_reg, val);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  463  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  464  	/* Step 8e: Wait 10 controller-clock cycles. */
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  465  	udelay(10);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  466  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  467  	/* Step 9: Enable conditional coprocessor clock of UCTL. */
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  468  	val = dwc3_octeon_readq(uctl_ctl_reg);
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  469  	val |= USBDRD_UCTL_CTL_CSCLK_EN;
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  470  	dwc3_octeon_writeq(uctl_ctl_reg, val);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  471  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  472  	/*Step 10: Set for host mode only. */
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  473  	val = dwc3_octeon_readq(uctl_ctl_reg);
ce942c0f69c2e4 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  474  	val &= ~USBDRD_UCTL_CTL_DRD_MODE;
2257c6c90e9223 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl   2023-06-19  475  	dwc3_octeon_writeq(uctl_ctl_reg, val);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  476  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  477  	return 0;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  478  }
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill   2017-01-25  479  

:::::: The code at line 403 was first introduced by commit
:::::: ce942c0f69c2e492f3d2be27b1a42cdbf59f6b1c MIPS: OCTEON: octeon-usb: use bitfields for control register

:::::: TO: Ladislav Michl <ladis@linux-mips.org>
:::::: CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
