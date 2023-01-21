Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F3B7E;
	Sat, 21 Jan 2023 15:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674314310; x=1705850310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DsMqa/zXlzR0Aaym96D10eCxFkhYfJ9jH8HBI64p46Y=;
  b=W/WbK8YhmDj3+8cCty1LG/NsmLHUdnFRVbeiqURkSph1eIv0ijwGkM83
   dDy0aktaLrV+qguaMTUI3C0DxH4/AAv8Y6otSohZrHGquW6wwl9WNr/G3
   J3oROhwhHKIf31wNIx3Zw+ZYIXH2VzkuJAh4GNyNGEFgF8Sq2dTnAn/1w
   Rv5lKCwr53obcS2xUadhJ4UxMccP9UhnyBVd6hmscHZMjLLr2B+Y1Wcxt
   BUqCM2vl4q0dbicLGSoRzcK7k6RQDV0EKTm0CEIUSC8ghjuRvnkQ/4OO6
   UnkQu//wOklTtfn7vFwPJJkOISed+mQ0qORf35NR/yQdGC3JZi2Jsh8A7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="353047369"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="353047369"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 07:18:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="784888002"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="784888002"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Jan 2023 07:18:27 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJFdT-0004CS-07;
	Sat, 21 Jan 2023 15:18:27 +0000
Date: Sat, 21 Jan 2023 23:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-wip 31/408]
 drivers/soc/apple/rtkit-crashlog.c:130:21: error: use of undeclared
 identifier 'PSR_MODE_MASK'
Message-ID: <202301212316.LGptTQLA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/rust-wip
head:   795db7e16a5eb642fbb1649baf22bdee9f1594c8
commit: decc95a7a22f8fa3676163d5ddaf54909ff02640 [31/408] soc: apple: rtkit: Add register dump decoding to crashlog
config: riscv-randconfig-r021-20230121 (https://download.01.org/0day-ci/archive/20230121/202301212316.LGptTQLA-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/decc95a7a22f8fa3676163d5ddaf54909ff02640
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/rust-wip
        git checkout decc95a7a22f8fa3676163d5ddaf54909ff02640
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/soc/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/soc/apple/rtkit-crashlog.c:130:21: error: use of undeclared identifier 'PSR_MODE_MASK'
           switch (regs.psr & PSR_MODE_MASK) {
                              ^
>> drivers/soc/apple/rtkit-crashlog.c:131:8: error: use of undeclared identifier 'PSR_MODE_EL0t'
                   case PSR_MODE_EL0t:
                        ^
>> drivers/soc/apple/rtkit-crashlog.c:134:8: error: use of undeclared identifier 'PSR_MODE_EL1t'
                   case PSR_MODE_EL1t:
                        ^
>> drivers/soc/apple/rtkit-crashlog.c:137:8: error: use of undeclared identifier 'PSR_MODE_EL1h'
                   case PSR_MODE_EL1h:
                        ^
>> drivers/soc/apple/rtkit-crashlog.c:140:8: error: use of undeclared identifier 'PSR_MODE_EL2t'
                   case PSR_MODE_EL2t:
                        ^
>> drivers/soc/apple/rtkit-crashlog.c:143:8: error: use of undeclared identifier 'PSR_MODE_EL2h'
                   case PSR_MODE_EL2h:
                        ^
   6 errors generated.


vim +/PSR_MODE_MASK +130 drivers/soc/apple/rtkit-crashlog.c

   115	
   116	static void apple_rtkit_crashlog_dump_regs(struct apple_rtkit *rtk, u8 *bfr,
   117						   size_t size)
   118	{
   119		struct apple_rtkit_crashlog_regs regs;
   120		const char *el;
   121		int i;
   122	
   123		if (size < sizeof(regs)) {
   124			dev_warn(rtk->dev, "RTKit: Regs section too small: 0x%lx", size);
   125			return;
   126		}
   127	
   128		memcpy(&regs, bfr, sizeof(regs));
   129	
 > 130		switch (regs.psr & PSR_MODE_MASK) {
 > 131			case PSR_MODE_EL0t:
   132				el = "EL0t";
   133				break;
 > 134			case PSR_MODE_EL1t:
   135				el = "EL1t";
   136				break;
 > 137			case PSR_MODE_EL1h:
   138				el = "EL1h";
   139				break;
 > 140			case PSR_MODE_EL2t:
   141				el = "EL2t";
   142				break;
 > 143			case PSR_MODE_EL2h:
   144				el = "EL2h";
   145				break;
   146			default:
   147				el = "unknown";
   148				break;
   149		}
   150	
   151		dev_warn(rtk->dev, "RTKit: Exception dump:");
   152		dev_warn(rtk->dev, "  == Exception taken from %s ==", el);
   153		dev_warn(rtk->dev, "  PSR    = 0x%llx", regs.psr);
   154		dev_warn(rtk->dev, "  PC     = 0x%llx\n", regs.pc);
   155		dev_warn(rtk->dev, "  ESR    = 0x%llx\n", regs.esr);
   156		dev_warn(rtk->dev, "  FAR    = 0x%llx\n", regs.far);
   157		dev_warn(rtk->dev, "  SP     = 0x%llx\n", regs.sp);
   158		dev_warn(rtk->dev, "\n");
   159	
   160		for (i = 0; i < 31; i += 4) {
   161			if (i < 28)
   162				dev_warn(rtk->dev,
   163						 "  x%02d-x%02d = %016llx %016llx %016llx %016llx\n",
   164						 i, i + 3,
   165						 regs.regs[i], regs.regs[i + 1],
   166						 regs.regs[i + 2], regs.regs[i + 3]);
   167			else
   168				dev_warn(rtk->dev,
   169						 "  x%02d-x%02d = %016llx %016llx %016llx\n", i, i + 3,
   170						 regs.regs[i], regs.regs[i + 1], regs.regs[i + 2]);
   171		}
   172	
   173		dev_warn(rtk->dev, "\n");
   174	}
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
