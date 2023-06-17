Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB2A748E;
	Sat, 17 Jun 2023 11:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687001494; x=1718537494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dhnoq8GmV/hmm4klrWY7d/s4ctPYBGaiKd5ihl8jhlc=;
  b=AufvJp8h+75RzHi9ZeuCwLZF2glClV5u03zlTiBlTXbFWE9CZc3jO/A/
   tyhyVOgQ8KN78OMlr4LjYMlYjtjzlQL2HexpsSdB9+v6gQ4v/M34bECus
   pO7itesonGnoHJ2ThcrVoStuptkWqk1StQQOVZ/NMtOIOH57ZAuCi9GNl
   50NpBkW5jejLsu4hEL/qlldfjqS6s9c65hmgFXKOtjWDBOc45LfTakdqZ
   8Rntd5M+tOy5jVD7kpjjITANzW0gyMYrUGGRTXujMIRo6viKhe6u5Ixgn
   tcW+/PCJhd/jc9zyj728WXs3LjtT8B+tfFYG+5AifU8eZBLWqDWF3JHLv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="339715409"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="339715409"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 04:31:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="857686411"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="857686411"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2023 04:31:31 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAU9S-0002i0-1k;
	Sat, 17 Jun 2023 11:31:30 +0000
Date: Sat, 17 Jun 2023 19:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [krzk-github:n/dts-sm8350-hdk-audio-and-sd 16/35]
 drivers/usb/typec/mux/nb7vpq904m.c:98:24: error: call to undeclared function
 'FIELD_PREP'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202306171917.h9V2vhNS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/dts-sm8350-hdk-audio-and-sd
head:   8aabb9b23f1ba73be01d969660a8b05245806b57
commit: 236a2a4503e2cd28b116847e9a7e6baadaa09204 [16/35] usb: typec: add support for the nb7vpq904m Type-C Linear Redriver
config: powerpc-randconfig-r025-20230617 (https://download.01.org/0day-ci/archive/20230617/202306171917.h9V2vhNS-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306171917.h9V2vhNS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306171917.h9V2vhNS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:11:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:616:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/usb/typec/mux/nb7vpq904m.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:13:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:617:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/usb/typec/mux/nb7vpq904m.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:15:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:618:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/usb/typec/mux/nb7vpq904m.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:17:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:619:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> drivers/usb/typec/mux/nb7vpq904m.c:98:24: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                              EQ_SETTING_MASK, FIELD_PREP(EQ_SETTING_MASK, eq));
                                               ^
   drivers/usb/typec/mux/nb7vpq904m.c:119:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                                FIELD_PREP(GEN_DEV_SET_OP_MODE_MASK,
                                ^
   drivers/usb/typec/mux/nb7vpq904m.c:199:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                                FIELD_PREP(GEN_DEV_SET_OP_MODE_MASK,
                                ^
   6 warnings and 3 errors generated.


vim +/FIELD_PREP +98 drivers/usb/typec/mux/nb7vpq904m.c

    80	
    81	static void nb7vpq904m_set_channel(struct nb7vpq904m *nb7, unsigned int channel, bool dp)
    82	{
    83		u8 eq, out_comp, flat_gain, loss_match;
    84	
    85		if (dp) {
    86			eq = NB7_IS_CHAN_AD(channel) ? 0x6 : 0x4;
    87			out_comp = 0x3;
    88			flat_gain = NB7_IS_CHAN_AD(channel) ? 0x2 : 0x1;
    89			loss_match = 0x3;
    90		} else {
    91			eq = 0x4;
    92			out_comp = 0x3;
    93			flat_gain = NB7_IS_CHAN_AD(channel) ? 0x3 : 0x1;
    94			loss_match = NB7_IS_CHAN_AD(channel) ? 0x1 : 0x3;
    95		}
    96	
    97		regmap_update_bits(nb7->regmap, EQ_SETTING_REG(channel),
  > 98				   EQ_SETTING_MASK, FIELD_PREP(EQ_SETTING_MASK, eq));
    99		regmap_update_bits(nb7->regmap, OUTPUT_COMPRESSION_AND_POL_REG(channel),
   100				   OUTPUT_COMPRESSION_MASK, FIELD_PREP(OUTPUT_COMPRESSION_MASK, out_comp));
   101		regmap_update_bits(nb7->regmap, FLAT_GAIN_REG(channel),
   102				   FLAT_GAIN_MASK, FIELD_PREP(FLAT_GAIN_MASK, flat_gain));
   103		regmap_update_bits(nb7->regmap, LOSS_MATCH_REG(channel),
   104				   LOSS_MATCH_MASK, FIELD_PREP(LOSS_MATCH_MASK, loss_match));
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
