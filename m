Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF2A6AA3;
	Wed, 14 Jun 2023 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686742147; x=1718278147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LCFEar9AtoamxOAIH560TDgXfoXndQ1KnZekFUg3LgA=;
  b=b96jhZ8CGAbdJrtKVDZUlizuWVg/AWTnT3aHkw5KVjeA24G6JgybTgMv
   yRB7OLSzljuIAPvORpHUjrDVxINhduXyxw+w07Ww8LBIC/tIk/ylkv92D
   UlaPsmfj5LdBBFOUwY565p50cYS8nAaZHY2KbAHvkmXHN/SNLV+vTODwo
   LLFByiFCxzXZaB8Q1qi8tNg6nkr+uWXR0TXMi2I00P/UpxPHhDJZ0qHdf
   JezM4IQ6jLxLnwHrMHuOkUWN55grAzTqUfdAWFekd1ZwvfV9bSm27joWC
   1+o12NAYtACvoIJIQsFS500ExqvlpmnK8cm+XGpSnRmOfWLOThsyNrJRZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="357467662"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="357467662"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 04:29:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="958765736"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="958765736"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Jun 2023 04:29:04 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9OgS-0000Yj-0V;
	Wed, 14 Jun 2023 11:29:04 +0000
Date: Wed, 14 Jun 2023 19:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-audio-on-next
 29/43] drivers/usb/typec/mux/fsa4480.c:76:65: warning: format specifies type
 'int' but the argument has type 'unsigned long'
Message-ID: <202306141915.QCzfPuJq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-audio-on-next
head:   da068c30bd9c28a81733394531fe0f0a8ac475e3
commit: 1dffa7c9c2a6400399565e972b25b077871ec7b5 [29/43] usb: type-c: fsa4480: add support for Audio Accessory mode
config: hexagon-randconfig-r041-20230612 (https://download.01.org/0day-ci/archive/20230614/202306141915.QCzfPuJq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/1dffa7c9c2a6400399565e972b25b077871ec7b5
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-audio-on-next
        git checkout 1dffa7c9c2a6400399565e972b25b077871ec7b5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/usb/typec/mux/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306141915.QCzfPuJq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/typec/mux/fsa4480.c:8:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/usb/typec/mux/fsa4480.c:8:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/usb/typec/mux/fsa4480.c:8:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/usb/typec/mux/fsa4480.c:76:65: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
      76 |         pr_info("%s: reverse %d mode %d svid %x\n", __func__, reverse, fsa->mode, fsa->svid);
         |                                      ~~                                ^~~~~~~~~
         |                                      %lu
   include/linux/printk.h:528:34: note: expanded from macro 'pr_info'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/usb/typec/mux/fsa4480.c:166:48: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
     166 |         pr_info("%s: mux mode %d alt %d\n", __func__, state->mode, !!state->alt);
         |                               ~~                      ^~~~~~~~~~~
         |                               %lu
   include/linux/printk.h:528:34: note: expanded from macro 'pr_info'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   8 warnings generated.


vim +76 drivers/usb/typec/mux/fsa4480.c

    69	
    70	static int fsa4480_set(struct fsa4480 *fsa)
    71	{
    72		bool reverse = (fsa->orientation == TYPEC_ORIENTATION_REVERSE);
    73		u8 enable = FSA4480_ENABLE_DEVICE;
    74		u8 sel = 0;
    75	
  > 76		pr_info("%s: reverse %d mode %d svid %x\n", __func__, reverse, fsa->mode, fsa->svid);
    77	
    78		/* USB Mode */
    79		if (fsa->mode < TYPEC_STATE_MODAL ||
    80		    (!fsa->svid && (fsa->mode == TYPEC_MODE_USB2 ||
    81				    fsa->mode == TYPEC_MODE_USB3))) {
    82			enable |= FSA4480_ENABLE_USB;
    83			sel = FSA4480_SEL_USB;
    84		} else if (fsa->svid) {
    85			switch (fsa->mode) {
    86			/* DP Only */
    87			case TYPEC_DP_STATE_C:
    88			case TYPEC_DP_STATE_E:
    89				enable |= FSA4480_ENABLE_SBU;
    90				if (reverse)
    91					sel = FSA4480_SEL_SBU_REVERSE;
    92				break;
    93	
    94			/* DP + USB */
    95			case TYPEC_DP_STATE_D:
    96			case TYPEC_DP_STATE_F:
    97				enable |= FSA4480_ENABLE_USB | FSA4480_ENABLE_SBU;
    98				sel = FSA4480_SEL_USB;
    99				if (reverse)
   100					sel |= FSA4480_SEL_SBU_REVERSE;
   101				break;
   102	
   103			default:
   104				return -ENOTSUPP;
   105			}
   106		} else if (fsa->mode == TYPEC_MODE_AUDIO) {
   107			/* Audio Accessory Mode */
   108			enable |= FSA4480_ENABLE_SENSE | FSA4480_ENABLE_MIC | FSA4480_ENABLE_AGND;
   109			if (reverse)
   110				sel = FSA4480_SEL_SENSE | FSA4480_SEL_MIC | FSA4480_SEL_AGND;
   111		} else
   112			return -ENOTSUPP;
   113	
   114		pr_info("%s: cur enable %x\n", __func__, fsa->cur_enable);
   115		pr_info("%s: new enable %x\n", __func__, enable);
   116		pr_info("%s: new sel %x\n", __func__, sel);
   117	
   118		if (fsa->cur_enable & FSA4480_ENABLE_SBU) {
   119			/* Disable SBU output while re-configuring the switch */
   120			regmap_write(fsa->regmap, FSA4480_SWITCH_ENABLE,
   121				     fsa->cur_enable & ~FSA4480_ENABLE_SBU);
   122	
   123			/* 35us to allow the SBU switch to turn off */
   124			usleep_range(35, 1000);
   125		}
   126	
   127		regmap_write(fsa->regmap, FSA4480_SWITCH_SELECT, sel);
   128		regmap_write(fsa->regmap, FSA4480_SWITCH_ENABLE, enable);
   129	
   130		if (enable & FSA4480_ENABLE_SBU) {
   131			/* 15us to allow the SBU switch to turn on again */
   132			usleep_range(15, 1000);
   133		}
   134	
   135		fsa->cur_enable = enable;
   136	
   137		return 0;
   138	}
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
