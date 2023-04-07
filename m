Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B1F847C;
	Fri,  7 Apr 2023 17:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680889861; x=1712425861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wvdh74Ze/lO9z8MlCW8OYB17q39BBQMGmPBzQpjSwF4=;
  b=IulllKJVlSXEbTLG8Qf3r/R/oLYaH/9zdZiyzR8tHDDyIEw3RmYWOZ44
   VckOTI2kJjzZSHZknskxser6PDgLp+7U2nx9xR/TQD9OwJmV5AgdwXLop
   HXlxfk3EE5QUiZ2u3q1qgi0wgN41KQ4+0drkGtBlwX2dlkkXD52Y+01Wr
   +SBbi2FT/4Yb3jHyPlTRVKqiIV3Hlel527wcLRNBeXnUtyQZiIYWgSFZ/
   JLR2LbiVfiaus4YHd7L3FinMrLW2HWdR1lldlhlsI7fDfB4AXhkSqblPs
   fBNPYHb2QUteoNwYgHUmr/onFV/YcGog2/g00b9MjUFySJ7haQXTmlzc8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="405859431"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="405859431"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 10:50:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="717911679"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="717911679"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Apr 2023 10:50:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkqEj-000Skb-08;
	Fri, 07 Apr 2023 17:50:57 +0000
Date: Sat, 8 Apr 2023 01:50:21 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/4] rtc: ab-eoz9: constify pointers to hwmon_channel_info
Message-ID: <202304080110.v5LLFwT4-lkp@intel.com>
References: <20230407150306.80141-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150306.80141-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/rtc-ds3232-constify-pointers-to-hwmon_channel_info/20230407-231346
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20230407150306.80141-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH 1/4] rtc: ab-eoz9: constify pointers to hwmon_channel_info
config: hexagon-buildonly-randconfig-r001-20230403 (https://download.01.org/0day-ci/archive/20230408/202304080110.v5LLFwT4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2b39e4ff9f9bbc04c31fa2819e09754ca5001669
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/rtc-ds3232-constify-pointers-to-hwmon_channel_info/20230407-231346
        git checkout 2b39e4ff9f9bbc04c31fa2819e09754ca5001669
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/rtc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080110.v5LLFwT4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/rtc/rtc-ab-eoz9.c:9:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
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
   In file included from drivers/rtc/rtc-ab-eoz9.c:9:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/rtc/rtc-ab-eoz9.c:9:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
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
>> drivers/rtc/rtc-ab-eoz9.c:471:10: error: initializing 'const struct hwmon_channel_info **' with an expression of type 'const struct hwmon_channel_info *const[3]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .info = abeoz9_info,
                   ^~~~~~~~~~~
   6 warnings and 1 error generated.


vim +471 drivers/rtc/rtc-ab-eoz9.c

67075b63cce26c Artem Panfilov 2019-02-17  468  
67075b63cce26c Artem Panfilov 2019-02-17  469  static const struct hwmon_chip_info abeoz9_chip_info = {
67075b63cce26c Artem Panfilov 2019-02-17  470  	.ops = &abeoz9_hwmon_ops,
67075b63cce26c Artem Panfilov 2019-02-17 @471  	.info = abeoz9_info,
67075b63cce26c Artem Panfilov 2019-02-17  472  };
67075b63cce26c Artem Panfilov 2019-02-17  473  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
