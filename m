Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F79EBB;
	Fri,  7 Apr 2023 18:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680893712; x=1712429712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YRDW/3c39Y4Apz2YwfbrTAOT8+ASxIluO8tBINPJSg4=;
  b=UKYihnZcsLJL7YjMz43SirvlppxjYdTZ127waqBvjtBBYfee/O5lmitP
   jjzBvzLACePIQXn3LQHq69ikUPewrItEY0vFJrBjnYviF+ORDGJBqKBIm
   Tx8QaF63SsqTzeLuNvy1h3Q//Q+Av1uT0dnnt2zMVN6LBRCi6za8cFtYc
   s+/ZQTa91Hpp0cJ6sLzpC5ah4JX0okHm9hQyxxAKb+jaDSaIPcLj0whOl
   a92B5Xx6I7HUSkwmBJ3m+N/hZ9O9x3CQ5AarB277bq/F1Yg4fONfUpDpB
   pA2/ixvL4hd8ECeTZOFbPjNnE0FpYprgkTJs4Mh5oa2p7REpFsk5pGhkj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="341798880"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="341798880"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 11:55:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="690143083"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="690143083"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Apr 2023 11:55:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkrEj-000Snm-20;
	Fri, 07 Apr 2023 18:55:01 +0000
Date: Sat, 8 Apr 2023 02:54:15 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/4] rtc: ds3232: constify pointers to hwmon_channel_info
Message-ID: <202304080221.QFDtWIL3-lkp@intel.com>
References: <20230407150306.80141-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150306.80141-2-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/rtc-ds3232-constify-pointers-to-hwmon_channel_info/20230407-231346
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20230407150306.80141-2-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH 2/4] rtc: ds3232: constify pointers to hwmon_channel_info
config: hexagon-buildonly-randconfig-r001-20230403 (https://download.01.org/0day-ci/archive/20230408/202304080221.QFDtWIL3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7c7bc663edb897df5d42a8e592d15312959d2fae
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/rtc-ds3232-constify-pointers-to-hwmon_channel_info/20230407-231346
        git checkout 7c7bc663edb897df5d42a8e592d15312959d2fae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/rtc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080221.QFDtWIL3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/rtc/rtc-ds3232.c:14:
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
   In file included from drivers/rtc/rtc-ds3232.c:14:
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
   In file included from drivers/rtc/rtc-ds3232.c:14:
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
>> drivers/rtc/rtc-ds3232.c:375:10: error: initializing 'const struct hwmon_channel_info **' with an expression of type 'const struct hwmon_channel_info *const[3]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .info = ds3232_hwmon_info,
                   ^~~~~~~~~~~~~~~~~
   6 warnings and 1 error generated.


vim +375 drivers/rtc/rtc-ds3232.c

c35c4195f919a0 Kirill Esipov 2017-06-28  372  
c35c4195f919a0 Kirill Esipov 2017-06-28  373  static const struct hwmon_chip_info ds3232_hwmon_chip_info = {
c35c4195f919a0 Kirill Esipov 2017-06-28  374  	.ops = &ds3232_hwmon_hwmon_ops,
c35c4195f919a0 Kirill Esipov 2017-06-28 @375  	.info = ds3232_hwmon_info,
c35c4195f919a0 Kirill Esipov 2017-06-28  376  };
c35c4195f919a0 Kirill Esipov 2017-06-28  377  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
