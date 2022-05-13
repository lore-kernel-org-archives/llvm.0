Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2892520F3
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 05:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652420583; x=1683956583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=48qQMmW/d/3n6e0jAiJU8MiAXGd5b5S9ooHU4iat4Q0=;
  b=knAiMOQ8O0tAR8UOV2Y9pUYRJ4ksymlIV0polz8xhOG5uGrfUqvHWb4Q
   opOjhtH0tGeVe/L53u7VxLb/BOZAgc9n2Q8PK2I3sHdN6KckApD6aLJY/
   0kZeakYGanw+KmH5jvOlpDPu9pz3P3WdoJbg+5ozvsjOKIpmaPuduEgj1
   t+nA147JzVyEoM/o4RfBMKXMt80mXGcIATsMS19oItqznS0kaJEPCItnB
   ZQPYj5pFJeaqLzjgHiy3u5OxvS39E+1deX2aApFHzAZnr83QWW+K43UfF
   z8Fx2pwokxWk7UpPQAyNWlVqN4qrtqNLor3sf8iY8mGNFk5wTVQc6ntJ1
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="333258066"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="333258066"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 22:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="567040962"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 May 2022 22:43:01 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npO4q-000LNe-Tb;
	Fri, 13 May 2022 05:43:00 +0000
Date: Fri, 13 May 2022 13:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2105/11360] arch/arm/mach-omap1/serial.c:236:12:
 warning: no previous prototype for function 'omap_serial_wakeup_init'
Message-ID: <202205131303.oqcXJ1Rl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   187b9ac8c348383f7f36c8413d73ad89e9b1e90a
commit: 8c1fb11b8a77dc489a8ef6d96c38c1297b629d06 [2105/11360] ARM: s3c: enable s3c24xx multiplatform support
config: arm-buildonly-randconfig-r004-20220512 (https://download.01.org/0day-ci/archive/20220513/202205131303.oqcXJ1Rl-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=8c1fb11b8a77dc489a8ef6d96c38c1297b629d06
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 8c1fb11b8a77dc489a8ef6d96c38c1297b629d06
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-omap1/serial.c:236:12: warning: no previous prototype for function 'omap_serial_wakeup_init' [-Wmissing-prototypes]
   int __init omap_serial_wakeup_init(void)
              ^
   arch/arm/mach-omap1/serial.c:236:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init omap_serial_wakeup_init(void)
   ^
   static 
   1 warning generated.


vim +/omap_serial_wakeup_init +236 arch/arm/mach-omap1/serial.c

7c38cf021b42a4 Tony Lindgren 2005-09-08  235  
82c3bd03535f15 Shawn Guo     2012-04-26 @236  int __init omap_serial_wakeup_init(void)
7c38cf021b42a4 Tony Lindgren 2005-09-08  237  {
7c38cf021b42a4 Tony Lindgren 2005-09-08  238  	if (!cpu_is_omap16xx())
7c38cf021b42a4 Tony Lindgren 2005-09-08  239  		return 0;
7c38cf021b42a4 Tony Lindgren 2005-09-08  240  
7c38cf021b42a4 Tony Lindgren 2005-09-08  241  	if (uart1_ck != NULL)
7c38cf021b42a4 Tony Lindgren 2005-09-08  242  		omap_serial_set_port_wakeup(37);
7c38cf021b42a4 Tony Lindgren 2005-09-08  243  	if (uart2_ck != NULL)
7c38cf021b42a4 Tony Lindgren 2005-09-08  244  		omap_serial_set_port_wakeup(18);
7c38cf021b42a4 Tony Lindgren 2005-09-08  245  	if (uart3_ck != NULL)
7c38cf021b42a4 Tony Lindgren 2005-09-08  246  		omap_serial_set_port_wakeup(49);
7c38cf021b42a4 Tony Lindgren 2005-09-08  247  
7c38cf021b42a4 Tony Lindgren 2005-09-08  248  	return 0;
7c38cf021b42a4 Tony Lindgren 2005-09-08  249  }
7c38cf021b42a4 Tony Lindgren 2005-09-08  250  

:::::: The code at line 236 was first introduced by commit
:::::: 82c3bd03535f1571426fdd19b7d832f76b7ac85e ARM: omap1: use machine specific hook for late init

:::::: TO: Shawn Guo <shawn.guo@linaro.org>
:::::: CC: Shawn Guo <shawn.guo@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
