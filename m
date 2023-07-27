Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3844F20F1;
	Thu, 27 Jul 2023 05:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690435946; x=1721971946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fWZkOYFjJikPd2ygu+ECME7kjUB74SmD2Q9G5r9pZVw=;
  b=mP5wIhdDXQFbI+evY2+mfN8fqI++r6AUmrRzW9dNznUtXzbv0VB/D8Oz
   EW1o/CbH5LbYhDL4g6foXeA6mxCBzdoigK/bZSor8V1Xwz+xhDknk1iKM
   /UWuDVP5PiKqCanCd/QXWMDyuSoQtL2N8HcZ9vWzbjLc0RjcLaBba9ffU
   flXh63b7UNbNCU+b9L2Yl4H3q5P+sp8EPNMBwP5/qvEIC+YVf33FJXYJe
   KYT/0YFhC+Y8EtSKJKvZS/4v9rUDz0I+OaVydhxNNdOedIO936L335O4u
   laFUbysECzbRKP0DGHqlNxUsbaPDtuQPwL8FcLUK++XN0Kw0Xh25+Um8F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="367083590"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="367083590"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:32:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="796851009"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="796851009"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jul 2023 22:32:22 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOtbI-0001yH-2a;
	Thu, 27 Jul 2023 05:32:00 +0000
Date: Thu, 27 Jul 2023 13:30:38 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 1/2] drivers/watchdog/stm32_iwdg.c:216:34:
 warning: unused variable 'stm32_iwdg_of_match'
Message-ID: <202307271312.1V52c3HN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   683789ff1e1c0a9373ca20daed4bbc700eccc22e
commit: 11b42f6418bd440f99d1816557a31cc529645b6a [1/2] watchdog: Enable more drivers for COMPILE_TEST
config: hexagon-randconfig-r045-20230726 (https://download.01.org/0day-ci/archive/20230727/202307271312.1V52c3HN-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271312.1V52c3HN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271312.1V52c3HN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/watchdog/stm32_iwdg.c:14:
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
   In file included from drivers/watchdog/stm32_iwdg.c:14:
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
   In file included from drivers/watchdog/stm32_iwdg.c:14:
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
   drivers/watchdog/stm32_iwdg.c:77:19: warning: unused function 'reg_read' [-Wunused-function]
      77 | static inline u32 reg_read(void __iomem *base, u32 reg)
         |                   ^
>> drivers/watchdog/stm32_iwdg.c:216:34: warning: unused variable 'stm32_iwdg_of_match' [-Wunused-const-variable]
     216 | static const struct of_device_id stm32_iwdg_of_match[] = {
         |                                  ^
   8 warnings generated.


vim +/stm32_iwdg_of_match +216 drivers/watchdog/stm32_iwdg.c

4332d113c66a6e Yannick Fertre      2017-04-06   76  
4332d113c66a6e Yannick Fertre      2017-04-06  @77  static inline u32 reg_read(void __iomem *base, u32 reg)
4332d113c66a6e Yannick Fertre      2017-04-06   78  {
4332d113c66a6e Yannick Fertre      2017-04-06   79  	return readl_relaxed(base + reg);
4332d113c66a6e Yannick Fertre      2017-04-06   80  }
4332d113c66a6e Yannick Fertre      2017-04-06   81  
4332d113c66a6e Yannick Fertre      2017-04-06   82  static inline void reg_write(void __iomem *base, u32 reg, u32 val)
4332d113c66a6e Yannick Fertre      2017-04-06   83  {
4332d113c66a6e Yannick Fertre      2017-04-06   84  	writel_relaxed(val, base + reg);
4332d113c66a6e Yannick Fertre      2017-04-06   85  }
4332d113c66a6e Yannick Fertre      2017-04-06   86  
4332d113c66a6e Yannick Fertre      2017-04-06   87  static int stm32_iwdg_start(struct watchdog_device *wdd)
4332d113c66a6e Yannick Fertre      2017-04-06   88  {
4332d113c66a6e Yannick Fertre      2017-04-06   89  	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
e9974166a53acc Ludovic Barre       2019-05-03   90  	u32 tout, presc, iwdg_rlr, iwdg_pr, iwdg_sr;
4332d113c66a6e Yannick Fertre      2017-04-06   91  	int ret;
4332d113c66a6e Yannick Fertre      2017-04-06   92  
4332d113c66a6e Yannick Fertre      2017-04-06   93  	dev_dbg(wdd->parent, "%s\n", __func__);
4332d113c66a6e Yannick Fertre      2017-04-06   94  
e9974166a53acc Ludovic Barre       2019-05-03   95  	tout = clamp_t(unsigned int, wdd->timeout,
e9974166a53acc Ludovic Barre       2019-05-03   96  		       wdd->min_timeout, wdd->max_hw_heartbeat_ms / 1000);
e9974166a53acc Ludovic Barre       2019-05-03   97  
e9974166a53acc Ludovic Barre       2019-05-03   98  	presc = DIV_ROUND_UP(tout * wdt->rate, RLR_MAX + 1);
e9974166a53acc Ludovic Barre       2019-05-03   99  
e9974166a53acc Ludovic Barre       2019-05-03  100  	/* The prescaler is align on power of 2 and start at 2 ^ PR_SHIFT. */
e9974166a53acc Ludovic Barre       2019-05-03  101  	presc = roundup_pow_of_two(presc);
e9974166a53acc Ludovic Barre       2019-05-03  102  	iwdg_pr = presc <= 1 << PR_SHIFT ? 0 : ilog2(presc) - PR_SHIFT;
e9974166a53acc Ludovic Barre       2019-05-03  103  	iwdg_rlr = ((tout * wdt->rate) / presc) - 1;
4332d113c66a6e Yannick Fertre      2017-04-06  104  
4332d113c66a6e Yannick Fertre      2017-04-06  105  	/* enable write access */
4332d113c66a6e Yannick Fertre      2017-04-06  106  	reg_write(wdt->regs, IWDG_KR, KR_KEY_EWA);
4332d113c66a6e Yannick Fertre      2017-04-06  107  
4332d113c66a6e Yannick Fertre      2017-04-06  108  	/* set prescaler & reload registers */
e9974166a53acc Ludovic Barre       2019-05-03  109  	reg_write(wdt->regs, IWDG_PR, iwdg_pr);
e9974166a53acc Ludovic Barre       2019-05-03  110  	reg_write(wdt->regs, IWDG_RLR, iwdg_rlr);
4332d113c66a6e Yannick Fertre      2017-04-06  111  	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
4332d113c66a6e Yannick Fertre      2017-04-06  112  
4332d113c66a6e Yannick Fertre      2017-04-06  113  	/* wait for the registers to be updated (max 100ms) */
e9974166a53acc Ludovic Barre       2019-05-03  114  	ret = readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, iwdg_sr,
e9974166a53acc Ludovic Barre       2019-05-03  115  					 !(iwdg_sr & (SR_PVU | SR_RVU)),
4332d113c66a6e Yannick Fertre      2017-04-06  116  					 SLEEP_US, TIMEOUT_US);
4332d113c66a6e Yannick Fertre      2017-04-06  117  	if (ret) {
e9974166a53acc Ludovic Barre       2019-05-03  118  		dev_err(wdd->parent, "Fail to set prescaler, reload regs\n");
4332d113c66a6e Yannick Fertre      2017-04-06  119  		return ret;
4332d113c66a6e Yannick Fertre      2017-04-06  120  	}
4332d113c66a6e Yannick Fertre      2017-04-06  121  
4332d113c66a6e Yannick Fertre      2017-04-06  122  	/* reload watchdog */
4332d113c66a6e Yannick Fertre      2017-04-06  123  	reg_write(wdt->regs, IWDG_KR, KR_KEY_RELOAD);
4332d113c66a6e Yannick Fertre      2017-04-06  124  
4332d113c66a6e Yannick Fertre      2017-04-06  125  	return 0;
4332d113c66a6e Yannick Fertre      2017-04-06  126  }
4332d113c66a6e Yannick Fertre      2017-04-06  127  
4332d113c66a6e Yannick Fertre      2017-04-06  128  static int stm32_iwdg_ping(struct watchdog_device *wdd)
4332d113c66a6e Yannick Fertre      2017-04-06  129  {
4332d113c66a6e Yannick Fertre      2017-04-06  130  	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
4332d113c66a6e Yannick Fertre      2017-04-06  131  
4332d113c66a6e Yannick Fertre      2017-04-06  132  	dev_dbg(wdd->parent, "%s\n", __func__);
4332d113c66a6e Yannick Fertre      2017-04-06  133  
4332d113c66a6e Yannick Fertre      2017-04-06  134  	/* reload watchdog */
4332d113c66a6e Yannick Fertre      2017-04-06  135  	reg_write(wdt->regs, IWDG_KR, KR_KEY_RELOAD);
4332d113c66a6e Yannick Fertre      2017-04-06  136  
4332d113c66a6e Yannick Fertre      2017-04-06  137  	return 0;
4332d113c66a6e Yannick Fertre      2017-04-06  138  }
4332d113c66a6e Yannick Fertre      2017-04-06  139  
4332d113c66a6e Yannick Fertre      2017-04-06  140  static int stm32_iwdg_set_timeout(struct watchdog_device *wdd,
4332d113c66a6e Yannick Fertre      2017-04-06  141  				  unsigned int timeout)
4332d113c66a6e Yannick Fertre      2017-04-06  142  {
4332d113c66a6e Yannick Fertre      2017-04-06  143  	dev_dbg(wdd->parent, "%s timeout: %d sec\n", __func__, timeout);
4332d113c66a6e Yannick Fertre      2017-04-06  144  
4332d113c66a6e Yannick Fertre      2017-04-06  145  	wdd->timeout = timeout;
4332d113c66a6e Yannick Fertre      2017-04-06  146  
4332d113c66a6e Yannick Fertre      2017-04-06  147  	if (watchdog_active(wdd))
4332d113c66a6e Yannick Fertre      2017-04-06  148  		return stm32_iwdg_start(wdd);
4332d113c66a6e Yannick Fertre      2017-04-06  149  
4332d113c66a6e Yannick Fertre      2017-04-06  150  	return 0;
4332d113c66a6e Yannick Fertre      2017-04-06  151  }
4332d113c66a6e Yannick Fertre      2017-04-06  152  
1f53305877fae6 Guenter Roeck       2019-04-10  153  static void stm32_clk_disable_unprepare(void *data)
1f53305877fae6 Guenter Roeck       2019-04-10  154  {
1f53305877fae6 Guenter Roeck       2019-04-10  155  	clk_disable_unprepare(data);
1f53305877fae6 Guenter Roeck       2019-04-10  156  }
1f53305877fae6 Guenter Roeck       2019-04-10  157  
c2cf466cca87e2 Ludovic Barre       2018-06-25  158  static int stm32_iwdg_clk_init(struct platform_device *pdev,
c2cf466cca87e2 Ludovic Barre       2018-06-25  159  			       struct stm32_iwdg *wdt)
c2cf466cca87e2 Ludovic Barre       2018-06-25  160  {
1f53305877fae6 Guenter Roeck       2019-04-10  161  	struct device *dev = &pdev->dev;
c2cf466cca87e2 Ludovic Barre       2018-06-25  162  	u32 ret;
c2cf466cca87e2 Ludovic Barre       2018-06-25  163  
1f53305877fae6 Guenter Roeck       2019-04-10  164  	wdt->clk_lsi = devm_clk_get(dev, "lsi");
7c7164f935c819 Etienne Carriere    2020-11-06  165  	if (IS_ERR(wdt->clk_lsi))
7c7164f935c819 Etienne Carriere    2020-11-06  166  		return dev_err_probe(dev, PTR_ERR(wdt->clk_lsi), "Unable to get lsi clock\n");
c2cf466cca87e2 Ludovic Barre       2018-06-25  167  
c2cf466cca87e2 Ludovic Barre       2018-06-25  168  	/* optional peripheral clock */
e9974166a53acc Ludovic Barre       2019-05-03  169  	if (wdt->data->has_pclk) {
1f53305877fae6 Guenter Roeck       2019-04-10  170  		wdt->clk_pclk = devm_clk_get(dev, "pclk");
7c7164f935c819 Etienne Carriere    2020-11-06  171  		if (IS_ERR(wdt->clk_pclk))
7c7164f935c819 Etienne Carriere    2020-11-06  172  			return dev_err_probe(dev, PTR_ERR(wdt->clk_pclk),
7c7164f935c819 Etienne Carriere    2020-11-06  173  					     "Unable to get pclk clock\n");
c2cf466cca87e2 Ludovic Barre       2018-06-25  174  
c2cf466cca87e2 Ludovic Barre       2018-06-25  175  		ret = clk_prepare_enable(wdt->clk_pclk);
c2cf466cca87e2 Ludovic Barre       2018-06-25  176  		if (ret) {
1f53305877fae6 Guenter Roeck       2019-04-10  177  			dev_err(dev, "Unable to prepare pclk clock\n");
c2cf466cca87e2 Ludovic Barre       2018-06-25  178  			return ret;
c2cf466cca87e2 Ludovic Barre       2018-06-25  179  		}
1f53305877fae6 Guenter Roeck       2019-04-10  180  		ret = devm_add_action_or_reset(dev,
1f53305877fae6 Guenter Roeck       2019-04-10  181  					       stm32_clk_disable_unprepare,
1f53305877fae6 Guenter Roeck       2019-04-10  182  					       wdt->clk_pclk);
1f53305877fae6 Guenter Roeck       2019-04-10  183  		if (ret)
1f53305877fae6 Guenter Roeck       2019-04-10  184  			return ret;
c2cf466cca87e2 Ludovic Barre       2018-06-25  185  	}
c2cf466cca87e2 Ludovic Barre       2018-06-25  186  
c2cf466cca87e2 Ludovic Barre       2018-06-25  187  	ret = clk_prepare_enable(wdt->clk_lsi);
c2cf466cca87e2 Ludovic Barre       2018-06-25  188  	if (ret) {
1f53305877fae6 Guenter Roeck       2019-04-10  189  		dev_err(dev, "Unable to prepare lsi clock\n");
c2cf466cca87e2 Ludovic Barre       2018-06-25  190  		return ret;
c2cf466cca87e2 Ludovic Barre       2018-06-25  191  	}
1f53305877fae6 Guenter Roeck       2019-04-10  192  	ret = devm_add_action_or_reset(dev, stm32_clk_disable_unprepare,
1f53305877fae6 Guenter Roeck       2019-04-10  193  				       wdt->clk_lsi);
1f53305877fae6 Guenter Roeck       2019-04-10  194  	if (ret)
1f53305877fae6 Guenter Roeck       2019-04-10  195  		return ret;
c2cf466cca87e2 Ludovic Barre       2018-06-25  196  
c2cf466cca87e2 Ludovic Barre       2018-06-25  197  	wdt->rate = clk_get_rate(wdt->clk_lsi);
c2cf466cca87e2 Ludovic Barre       2018-06-25  198  
c2cf466cca87e2 Ludovic Barre       2018-06-25  199  	return 0;
c2cf466cca87e2 Ludovic Barre       2018-06-25  200  }
c2cf466cca87e2 Ludovic Barre       2018-06-25  201  
4332d113c66a6e Yannick Fertre      2017-04-06  202  static const struct watchdog_info stm32_iwdg_info = {
4332d113c66a6e Yannick Fertre      2017-04-06  203  	.options	= WDIOF_SETTIMEOUT |
4332d113c66a6e Yannick Fertre      2017-04-06  204  			  WDIOF_MAGICCLOSE |
4332d113c66a6e Yannick Fertre      2017-04-06  205  			  WDIOF_KEEPALIVEPING,
4332d113c66a6e Yannick Fertre      2017-04-06  206  	.identity	= "STM32 Independent Watchdog",
4332d113c66a6e Yannick Fertre      2017-04-06  207  };
4332d113c66a6e Yannick Fertre      2017-04-06  208  
d7b16e75d40e57 Gustavo A. R. Silva 2017-07-07  209  static const struct watchdog_ops stm32_iwdg_ops = {
4332d113c66a6e Yannick Fertre      2017-04-06  210  	.owner		= THIS_MODULE,
4332d113c66a6e Yannick Fertre      2017-04-06  211  	.start		= stm32_iwdg_start,
4332d113c66a6e Yannick Fertre      2017-04-06  212  	.ping		= stm32_iwdg_ping,
4332d113c66a6e Yannick Fertre      2017-04-06  213  	.set_timeout	= stm32_iwdg_set_timeout,
4332d113c66a6e Yannick Fertre      2017-04-06  214  };
4332d113c66a6e Yannick Fertre      2017-04-06  215  
c2cf466cca87e2 Ludovic Barre       2018-06-25 @216  static const struct of_device_id stm32_iwdg_of_match[] = {
e9974166a53acc Ludovic Barre       2019-05-03  217  	{ .compatible = "st,stm32-iwdg", .data = &stm32_iwdg_data },
e9974166a53acc Ludovic Barre       2019-05-03  218  	{ .compatible = "st,stm32mp1-iwdg", .data = &stm32mp1_iwdg_data },
c2cf466cca87e2 Ludovic Barre       2018-06-25  219  	{ /* end node */ }
c2cf466cca87e2 Ludovic Barre       2018-06-25  220  };
c2cf466cca87e2 Ludovic Barre       2018-06-25  221  MODULE_DEVICE_TABLE(of, stm32_iwdg_of_match);
c2cf466cca87e2 Ludovic Barre       2018-06-25  222  

:::::: The code at line 216 was first introduced by commit
:::::: c2cf466cca87e2072bd6616f751f4c385c2ab71e watchdog: stm32: add pclk feature for stm32mp1

:::::: TO: Ludovic Barre <ludovic.barre@st.com>
:::::: CC: Wim Van Sebroeck <wim@linux-watchdog.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
