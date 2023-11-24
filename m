Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F121EB4B;
	Fri, 24 Nov 2023 11:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qam3Zhm2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700826461; x=1732362461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xsCJVwDfGWRDAMf60T3JYtrjGkyqcqw5HYNRG5l1/u8=;
  b=Qam3Zhm2JZ2i+w4GGnWU/PK0ZBTLrTA7B40MYYQfKdI+7aWtTXTcwCFl
   926p14Ctcbto+zi76hb0LR+lwk1I3M1LOem59xj6zuTUjJf1cpD2DHbrb
   QUH3QqYMdjrbLYFPUtiXyPKUX9rGii7D6LtlJMKzXI4w1w+25+/KgnMh4
   /4THqE6xrl0JsulsmlpIPiYEmFnWfal+UeDoGr1w+5xmw+MFQMuOp59Ru
   CbZKAwwGjtL3S3Df2034xcJfUT1lFmPxeSn9+5Y4NKzDsagAgcmpzolZx
   kRwJYniNyKewtJOTkR7dlmtA+RQLBzusFxRby58cmGqBhrOkovtmLwR/y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395227104"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="395227104"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:47:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="771236154"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="771236154"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Nov 2023 03:47:39 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Uen-0002iC-1E;
	Fri, 24 Nov 2023 11:47:37 +0000
Date: Fri, 24 Nov 2023 19:45:49 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [tty:tty-testing 73/98] drivers/tty/serial/amba-pl011.c:128:12:
 error: implicit declaration of function 'FIELD_PREP_CONST' is invalid in C99
Message-ID: <202311241341.8QD0WOgN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
head:   53d40bb0f146410c58d791da5bd66451513e96ec
commit: ecd7ad1f7295130f30cce2e2ded2774dfdb32592 [73/98] tty: serial: amba: Use linux/bits.h macros for constant declarations
config: arm-randconfig-001-20231124 (https://download.01.org/0day-ci/archive/20231124/202311241341.8QD0WOgN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241341.8QD0WOgN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241341.8QD0WOgN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/amba-pl011.c:128:12: error: implicit declaration of function 'FIELD_PREP_CONST' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           .ifls                   = UART011_IFLS_RX4_8|UART011_IFLS_TX4_8,
                                     ^
   include/linux/amba/serial.h:158:28: note: expanded from macro 'UART011_IFLS_RX4_8'
   #define UART011_IFLS_RX4_8      FIELD_PREP_CONST(UART011_IFLS_RXIFLSEL, 2)
                                   ^
   drivers/tty/serial/amba-pl011.c:128:12: error: initializer element is not a compile-time constant
           .ifls                   = UART011_IFLS_RX4_8|UART011_IFLS_TX4_8,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/amba/serial.h:158:28: note: expanded from macro 'UART011_IFLS_RX4_8'
   #define UART011_IFLS_RX4_8      FIELD_PREP_CONST(UART011_IFLS_RXIFLSEL, 2)
                                   ^
   drivers/tty/serial/amba-pl011.c:206:12: error: initializer element is not a compile-time constant
           .ifls                   = UART011_IFLS_RX_HALF|UART011_IFLS_TX_HALF,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/amba/serial.h:168:30: note: expanded from macro 'UART011_IFLS_RX_HALF'
   #define UART011_IFLS_RX_HALF    FIELD_PREP_CONST(UART011_IFLS_RXIFLSEL, 5)
                                   ^
   3 errors generated.


vim +/FIELD_PREP_CONST +128 drivers/tty/serial/amba-pl011.c

78506f223a7bb7 drivers/tty/serial/amba-pl011.c Jongsung Kim      2013-04-15  125  
5926a295bb7827 drivers/serial/amba-pl011.c     Alessandro Rubini 2009-06-04  126  static struct vendor_data vendor_arm = {
439403bde9fc9e drivers/tty/serial/amba-pl011.c Russell King      2015-11-16  127  	.reg_offset		= pl011_std_offsets,
5926a295bb7827 drivers/serial/amba-pl011.c     Alessandro Rubini 2009-06-04 @128  	.ifls			= UART011_IFLS_RX4_8|UART011_IFLS_TX4_8,
0e125a5facf857 drivers/tty/serial/amba-pl011.c Shawn Guo         2016-07-08  129  	.fr_busy		= UART01x_FR_BUSY,
0e125a5facf857 drivers/tty/serial/amba-pl011.c Shawn Guo         2016-07-08  130  	.fr_dsr			= UART01x_FR_DSR,
0e125a5facf857 drivers/tty/serial/amba-pl011.c Shawn Guo         2016-07-08  131  	.fr_cts			= UART01x_FR_CTS,
0e125a5facf857 drivers/tty/serial/amba-pl011.c Shawn Guo         2016-07-08  132  	.fr_ri			= UART011_FR_RI,
ac3e3fb424d441 drivers/serial/amba-pl011.c     Linus Walleij     2010-06-02  133  	.oversampling		= false,
38d624361b2a82 drivers/serial/amba-pl011.c     Russell King      2010-12-22  134  	.dma_threshold		= false,
4fd0690bb0c395 drivers/tty/serial/amba-pl011.c Rajanikanth H.V   2012-03-26  135  	.cts_event_workaround	= false,
71eec4836b834b drivers/tty/serial/amba-pl011.c Andre Przywara    2015-05-21  136  	.always_enabled		= false,
cefc2d1d66f0e0 drivers/tty/serial/amba-pl011.c Andre Przywara    2015-05-21  137  	.fixed_options		= false,
78506f223a7bb7 drivers/tty/serial/amba-pl011.c Jongsung Kim      2013-04-15  138  	.get_fifosize		= get_fifosize_arm,
5926a295bb7827 drivers/serial/amba-pl011.c     Alessandro Rubini 2009-06-04  139  };
5926a295bb7827 drivers/serial/amba-pl011.c     Alessandro Rubini 2009-06-04  140  

:::::: The code at line 128 was first introduced by commit
:::::: 5926a295bb78272b3f648f62febecd19a1b6a6ca [ARM] 5541/1: serial/amba-pl011.c: add support for the modified port found in Nomadik

:::::: TO: Alessandro Rubini <rubini@gnudd.com>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
