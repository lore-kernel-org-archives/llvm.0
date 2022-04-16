Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F1520F3
	for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 05:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650086452; x=1681622452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gZStOvvMzkElgI2o3PjnVbZy0i5HYh9skuhWwHmsK3g=;
  b=a0x3KQzMBHUDfTYB/JfqmeN7JQMN7eYT1wE+vccCeXZpIGz0sqVWJg0j
   SDcc/WKfCk456Ck4gyVx9V+H+mA+hyCtx3oWy9nJzJkPqmOiJ860td4iG
   aTlzu5w33NdRUVwELN6aG1MrvDBL9J1WVoy7YGdhNkQVzJ5Ex4BOR6O5V
   mrCHcYEiiyg3sFVS9PXAPSbvXz/xrTsYZS4aiBSsTeSftTSis4aXZk6br
   e+xQIQKi1uaRfGSnFuK7looyvoWncC92sbkRAqQeLsmQ+6u8wiI09ZRIM
   RPOJznLYYjxGgmWk+eygIzwfgGLjZHJEEuq5I6Nn8VvauXlzrJEs/y09A
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="263444630"
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; 
   d="scan'208";a="263444630"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 22:20:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; 
   d="scan'208";a="591844951"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Apr 2022 22:20:50 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nfarZ-0002oP-N0;
	Sat, 16 Apr 2022 05:20:49 +0000
Date: Sat, 16 Apr 2022 13:20:34 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:omap1-multiplatform-5.18 33/33] ld.lld: error: duplicate
 symbol: clk_disable
Message-ID: <202204161327.Y9mh0O8D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git omap1-multiplatform-5.18
head:   fab2b1f2488cb81853e5e8c7d37d58963b8462bc
commit: fab2b1f2488cb81853e5e8c7d37d58963b8462bc [33/33] [NOTYET] ARM: omap1: enable multiplatform
config: arm-omap1_defconfig (https://download.01.org/0day-ci/archive/20220416/202204161327.Y9mh0O8D-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=fab2b1f2488cb81853e5e8c7d37d58963b8462bc
        git remote add soc https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
        git fetch --no-tags soc omap1-multiplatform-5.18
        git checkout fab2b1f2488cb81853e5e8c7d37d58963b8462bc
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: clk_disable
   >>> defined at clock.c
   >>> clock.o:(clk_disable) in archive arch/arm/mach-omap1/built-in.a
   >>> defined at clk.c
   >>> clk/clk.o:(.text+0x2168) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: clk_enable
   >>> defined at clock.c
   >>> clock.o:(clk_enable) in archive arch/arm/mach-omap1/built-in.a
   >>> defined at clk.c
   >>> clk/clk.o:(.text+0x2400) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: clk_round_rate
   >>> defined at clock.c
   >>> clock.o:(clk_round_rate) in archive arch/arm/mach-omap1/built-in.a
   >>> defined at clk.c
   >>> clk/clk.o:(.text+0x2758) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: clk_get_rate
   >>> defined at clock.c
   >>> clock.o:(clk_get_rate) in archive arch/arm/mach-omap1/built-in.a
   >>> defined at clk.c
   >>> clk/clk.o:(.text+0x2A94) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: clk_set_rate
   >>> defined at clock.c
   >>> clock.o:(clk_set_rate) in archive arch/arm/mach-omap1/built-in.a
   >>> defined at clk.c
   >>> clk/clk.o:(.text+0x2CF4) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: clk_get_parent
   >>> defined at clock.c
   >>> clock.o:(clk_get_parent) in archive arch/arm/mach-omap1/built-in.a
   >>> defined at clk.c
   >>> clk/clk.o:(.text+0x3634) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: clk_set_parent
   >>> defined at clock.c
   >>> clock.o:(clk_set_parent) in archive arch/arm/mach-omap1/built-in.a
   >>> defined at clk.c
   >>> clk/clk.o:(.text+0x3A58) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: clk_register
   >>> defined at clock.c
   >>> clock.o:(clk_register) in archive arch/arm/mach-omap1/built-in.a
   >>> defined at clk.c
   >>> clk/clk.o:(.text+0x46F8) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: clk_unregister
   >>> defined at clock.c
   >>> clock.o:(clk_unregister) in archive arch/arm/mach-omap1/built-in.a
   >>> defined at clk.c
   >>> clk/clk.o:(.text+0x51FC) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
