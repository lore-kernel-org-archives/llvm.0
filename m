Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503191FA2
	for <llvm@lists.linux.dev>; Sat,  2 Apr 2022 20:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648932427; x=1680468427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g37OhN95hQDsEq5tM7Z8xgfEwHCJ4ewxpSG/HutWnaE=;
  b=UKL0620Y1mjQN15FZXwzZLJIR836Vj8wHmbqKLXwFuNjVov862jJmA6O
   8BUKqHSeEo9jCnCsNgW6vIFlee21VmRPQpLZELhaOuQ1Zgd9l0V5NCSIS
   FaOQmMswsXde8i2M3Jzt63dIzcsGTtKXBSOadBVQttDMeyzxjDZ+gbuQa
   OOhnHgLDeiS1E5FbgB/WSZcIZO5PyFB/W+RuwslH9d5dOzP6TWMUTqDDr
   syk3eYAtXVrMJZhkJ2Am6SzawNh/jQs1b2ksBqIjt14ETQ/8ekpOjayi0
   5YcBorPlW+8SCeKrNUjjbHHW1c1nxKZUARZjw5xlzzr4wrryD8fGIoVh5
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10305"; a="260515735"
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="260515735"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2022 13:47:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="548206722"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 02 Apr 2022 13:47:04 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nakeF-0000PD-NW;
	Sat, 02 Apr 2022 20:47:03 +0000
Date: Sun, 3 Apr 2022 04:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: drivers/media/platform/renesas/rcar_jpu.c:77:9: warning: 'RST' macro
 redefined
Message-ID: <202204030453.ISJ7wI3L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6f34f8c3d6178527d4c02aa3a53c370cc70cb91e
commit: ee4a77a32b39064fdab0aa2b36bbd35ebf57e077 media: platform: place Renesas drivers on a separate dir
date:   3 weeks ago
config: mips-randconfig-r001-20220403 (https://download.01.org/0day-ci/archive/20220403/202204030453.ISJ7wI3L-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/media/platform/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/renesas/rcar_jpu.c:77:9: warning: 'RST' macro redefined [-Wmacro-redefined]
   #define RST     0xd0
           ^
   arch/mips/include/asm/mach-rc32434/rb.h:13:9: note: previous definition is here
   #define RST             (1 << 15)
           ^
   1 warning generated.


vim +/RST +77 drivers/media/platform/renesas/rcar_jpu.c

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22  73  
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22  74  /* JPEG markers */
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22  75  #define TEM	0x01
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22  76  #define SOF0	0xc0
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22 @77  #define RST	0xd0
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22  78  #define SOI	0xd8
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22  79  #define EOI	0xd9
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22  80  #define DHP	0xde
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22  81  #define DHT	0xc4
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22  82  #define COM	0xfe
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22  83  #define DQT	0xdb
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22  84  #define DRI	0xdd
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22  85  #define APP0	0xe0
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22  86  

:::::: The code at line 77 was first introduced by commit
:::::: 2c42cdbaec56a9565a2717b450506150c9c55103 [media] V4L2: platform: Add Renesas R-Car JPEG codec driver

:::::: TO: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
