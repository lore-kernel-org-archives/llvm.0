Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD1C20FA;
	Sat, 21 Jan 2023 12:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674303260; x=1705839260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p4tTFkj3h9+O1kNGzwrbaGuT2l//3KfqF/CSG523t/A=;
  b=nYI4daDgKHt9aw4Y0d4/iN3tRVVoXrYwl5n4TBec90L6OCa2qnBqviCa
   79J2wzWPT4SwkM7j8/IoYxPIzYGJ5arHY1pbuw+GGyBYnJmXxdFZ++Kwr
   jeNxzrw/yKkHKGInfcNVmbDcNcAWVSftJXZpX9/AsaUFabb07AWmZmKgr
   7BRb/epzqrD2a2z4TtuMphWtXTxIx9MclCO94u9O6+QVfhcskPXJRMvjp
   34LxgxAR2NSAXwvFjgT2Jp5PgsYu9YCd9CvsI307odBoozXI7+dfTYlmp
   z3ZOLrqEbKq4CwV4jOmvwIxo9nmUx/gJh0oJPvJXU5a06vY/wbJonCpux
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="309355465"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="309355465"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 04:14:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="729426035"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="729426035"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jan 2023 04:14:18 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJClF-00042H-2h;
	Sat, 21 Jan 2023 12:14:17 +0000
Date: Sat, 21 Jan 2023 20:13:36 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] soc: apple: rtkit: Add register dump decoding to crashlog
Message-ID: <202301212059.d4SZVT2X-lkp@intel.com>
References: <20230121073741.3807-1-lina@asahilina.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230121073741.3807-1-lina@asahilina.net>

Hi Asahi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.2-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Asahi-Lina/soc-apple-rtkit-Add-register-dump-decoding-to-crashlog/20230121-153927
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20230121073741.3807-1-lina%40asahilina.net
patch subject: [PATCH] soc: apple: rtkit: Add register dump decoding to crashlog
config: hexagon-randconfig-r041-20230119 (https://download.01.org/0day-ci/archive/20230121/202301212059.d4SZVT2X-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/91f957dc74ca87a8e0e90a39acac9a4fed0af526
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Asahi-Lina/soc-apple-rtkit-Add-register-dump-decoding-to-crashlog/20230121-153927
        git checkout 91f957dc74ca87a8e0e90a39acac9a4fed0af526
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/soc/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

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
   drivers/soc/apple/rtkit-crashlog.c:130:21: error: use of undeclared identifier 'PSR_MODE_MASK'
           switch (regs.psr & PSR_MODE_MASK) {
                              ^
   drivers/soc/apple/rtkit-crashlog.c:131:7: error: use of undeclared identifier 'PSR_MODE_EL0t'
           case PSR_MODE_EL0t:
                ^
   drivers/soc/apple/rtkit-crashlog.c:134:7: error: use of undeclared identifier 'PSR_MODE_EL1t'
           case PSR_MODE_EL1t:
                ^
   drivers/soc/apple/rtkit-crashlog.c:137:7: error: use of undeclared identifier 'PSR_MODE_EL1h'
           case PSR_MODE_EL1h:
                ^
   drivers/soc/apple/rtkit-crashlog.c:140:7: error: use of undeclared identifier 'PSR_MODE_EL2t'
           case PSR_MODE_EL2t:
                ^
   drivers/soc/apple/rtkit-crashlog.c:143:7: error: use of undeclared identifier 'PSR_MODE_EL2h'
           case PSR_MODE_EL2h:
                ^
   7 warnings and 6 errors generated.


vim +124 drivers/soc/apple/rtkit-crashlog.c

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
   130		switch (regs.psr & PSR_MODE_MASK) {
   131		case PSR_MODE_EL0t:
   132			el = "EL0t";
   133			break;
   134		case PSR_MODE_EL1t:
   135			el = "EL1t";
   136			break;
   137		case PSR_MODE_EL1h:
   138			el = "EL1h";
   139			break;
   140		case PSR_MODE_EL2t:
   141			el = "EL2t";
   142			break;
   143		case PSR_MODE_EL2h:
   144			el = "EL2h";
   145			break;
   146		default:
   147			el = "unknown";
   148			break;
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
