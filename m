Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA38F10E3;
	Sat, 11 Feb 2023 10:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676110867; x=1707646867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gvlm1IWB2ngzBwTq9pI1KkvETLAa0PLcJdSg3tFet4s=;
  b=L2RBFp1bve2MiCHCF5WwcSZRQHCfiyG2S2UePfm8PtzTq2enlU4MsFG7
   EXpCBgxAzaSkbx2gw8mvQeToE2lMmY4fcpzZ0AbWYxvvyWBoN53L3grQ2
   acN3HxGMA41psBQj8XnYV3+wdmLoGyPK7ccUIWhPGXkxl3ur5ECbI6DOo
   d8VRi07ROdJnxHRsac2VVrQBQLjWg4FsiwS06wcZKUzk6dgElupj+oElg
   ZZM3lyUWLL0A5uRpS1txsJzphED/9Pc+Cakx59n86YwtLCWqBcpgOrLiT
   PACD8gzRgNKdTWlnhNdVJ30yrQoZvY2uHjgKmxmVuX4mZavKJ/fSZoULT
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="318618091"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="318618091"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 02:21:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="777224091"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="777224091"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Feb 2023 02:21:05 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQn0C-0006Q9-1o;
	Sat, 11 Feb 2023 10:21:04 +0000
Date: Sat, 11 Feb 2023 18:21:00 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/explicit-sync 31/554]
 drivers/soc/apple/rtkit-crashlog.c:130:21: error: use of undeclared
 identifier 'PSR_MODE_MASK'
Message-ID: <202302111830.Jzekmn1f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/explicit-sync
head:   4e22161bdf43a03196f70f50d0794c60fc89a9b8
commit: decc95a7a22f8fa3676163d5ddaf54909ff02640 [31/554] soc: apple: rtkit: Add register dump decoding to crashlog
config: hexagon-randconfig-r041-20230210 (https://download.01.org/0day-ci/archive/20230211/202302111830.Jzekmn1f-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/decc95a7a22f8fa3676163d5ddaf54909ff02640
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/explicit-sync
        git checkout decc95a7a22f8fa3676163d5ddaf54909ff02640
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/soc/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111830.Jzekmn1f-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/soc/apple/rtkit-crashlog.c:6:
   In file included from drivers/soc/apple/rtkit-internal.h:14:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/soc/apple/rtkit-crashlog.c:6:
   In file included from drivers/soc/apple/rtkit-internal.h:14:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/soc/apple/rtkit-crashlog.c:6:
   In file included from drivers/soc/apple/rtkit-internal.h:14:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
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
>> drivers/soc/apple/rtkit-crashlog.c:124:62: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                   dev_warn(rtk->dev, "RTKit: Regs section too small: 0x%lx", size);
                                                                        ~~~   ^~~~
                                                                        %zx
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
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
   7 warnings and 6 errors generated.


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
 > 124			dev_warn(rtk->dev, "RTKit: Regs section too small: 0x%lx", size);
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
