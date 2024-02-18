Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FF53527A;
	Sun, 18 Feb 2024 10:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708252322; cv=none; b=YXDLMbnEnbEp5Ng6utkOolNhp99eGZFVeeozRAxvzRHnVjj4g5g14qVvswOkWZ732ff3QopHjaLGJzg7ysv55qeNm9W05R/fBuey7DsvAOvG6xbrA7CCBzFhW+/anDxORg9+TEhom0sKN5o8Bhg5jV3zi8mpkdazs2e/FSnR+64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708252322; c=relaxed/simple;
	bh=/M/aWw3QCEpF6h3mIQFbock9t96u9wAan/ZSW8C2Mdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ph3veldYVcoxHZQZgk6s2vbe/+IAjQce3KeKoQuhG27tUmG3BDIh7l5FWkb0w3WbX2g5nTMA2iQWOjMrPpSvChhrs4aBjzxZVqdUrrA/Iy8SK/dnIifqkbRgrbl2DIRPpn2+dIa3TTi6DHHkOkCRl23Oa4RyWd87aFQHAY4xgdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aaS2d3BY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aaS2d3BY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708252319; x=1739788319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/M/aWw3QCEpF6h3mIQFbock9t96u9wAan/ZSW8C2Mdc=;
  b=aaS2d3BYXUL6+YL39ZsGRPoZrOdiimKlmRiMdpAhG3p+W2Fh4BT3wb6A
   IhSLr9lrz8jiw34Y0Z4rDcnkdRZUGI6RHtMUAc3jMgZr9QyVC8+riT3+I
   hnxtiH7N22xTCuhSQOzl26Re9/ZDd8NJAjybGSBXZND4OnGQNtRrXsC4a
   SwtlvAfWWecj2rpgEkRx0wh6A/fbIYHgzYXOP35ZYBQ1Sq/ZyDKZYafXO
   DBw28KXk54suQGL36H0HkcIjf42GfWcAvk4tG8nhrULrCLGMcYfyDK8GJ
   hhsDfubdH+Ky8JRsCOXaY2WjWOZDNK/Ch0xvLvJ5+E3mujezQ/jDpyTXI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="12888046"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="12888046"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 02:31:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="4143070"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 18 Feb 2024 02:31:57 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbeSg-0002xi-37;
	Sun, 18 Feb 2024 10:31:54 +0000
Date: Sun, 18 Feb 2024 18:31:23 +0800
From: kernel test robot <lkp@intel.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 3/4] irq: Introduce IRQ_HANDLED_MANY
Message-ID: <202402181857.LAnCXCzr-lkp@intel.com>
References: <20240216075948.131372-5-leobras@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216075948.131372-5-leobras@redhat.com>

Hi Leonardo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 63d966ad6fecb66769e56fe2285de1e3b448f2ff]

url:    https://github.com/intel-lab-lkp/linux/commits/Leonardo-Bras/irq-Move-spurious_deferred-bit-from-BIT-31-to-BIT-0/20240216-162150
base:   63d966ad6fecb66769e56fe2285de1e3b448f2ff
patch link:    https://lore.kernel.org/r/20240216075948.131372-5-leobras%40redhat.com
patch subject: [RFC PATCH v2 3/4] irq: Introduce IRQ_HANDLED_MANY
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240218/202402181857.LAnCXCzr-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402181857.LAnCXCzr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402181857.LAnCXCzr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mtd/nand/raw/lpc32xx_mlc.c:26:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/mtd/nand/raw/lpc32xx_mlc.c:26:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/mtd/nand/raw/lpc32xx_mlc.c:26:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/mtd/nand/raw/lpc32xx_mlc.c:783:29: warning: cast from 'irqreturn_t (*)(int, struct lpc32xx_nand_host *)' (aka 'int (*)(int, struct lpc32xx_nand_host *)') to 'irq_handler_t' (aka 'int (*)(int, void *)') converts to incompatible function type [-Wcast-function-type-strict]
     783 |         if (request_irq(host->irq, (irq_handler_t)&lpc3xxx_nand_irq,
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings generated.


vim +783 drivers/mtd/nand/raw/lpc32xx_mlc.c

c49f3bee8cb5435 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-07-25  679  
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  680  /*
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  681   * Probe for NAND controller
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  682   */
06f25510692385e drivers/mtd/nand/lpc32xx_mlc.c     Bill Pemberton     2012-11-19  683  static int lpc32xx_nand_probe(struct platform_device *pdev)
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  684  {
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  685  	struct lpc32xx_nand_host *host;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  686  	struct mtd_info *mtd;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  687  	struct nand_chip *nand_chip;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  688  	struct resource *rc;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  689  	int res;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  690  
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  691  	/* Allocate memory for the device structure (and zero it) */
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  692  	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
3479c9dcefad0c8 drivers/mtd/nand/lpc32xx_mlc.c     Jingoo Han         2013-12-26  693  	if (!host)
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  694  		return -ENOMEM;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  695  
c49f3bee8cb5435 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-07-25  696  	host->pdev = pdev;
c49f3bee8cb5435 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-07-25  697  
9cd9dda8f06c910 drivers/mtd/nand/raw/lpc32xx_mlc.c Yangtao Li         2023-07-07  698  	host->io_base = devm_platform_get_and_ioremap_resource(pdev, 0, &rc);
b0de774c6334dcc drivers/mtd/nand/lpc32xx_mlc.c     Thierry Reding     2013-01-21  699  	if (IS_ERR(host->io_base))
b0de774c6334dcc drivers/mtd/nand/lpc32xx_mlc.c     Thierry Reding     2013-01-21  700  		return PTR_ERR(host->io_base);
b0de774c6334dcc drivers/mtd/nand/lpc32xx_mlc.c     Thierry Reding     2013-01-21  701  
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  702  	host->io_base_phy = rc->start;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  703  
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  704  	nand_chip = &host->nand_chip;
0faf8c39c0580ec drivers/mtd/nand/lpc32xx_mlc.c     Boris Brezillon    2015-12-10  705  	mtd = nand_to_mtd(nand_chip);
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  706  	if (pdev->dev.of_node)
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  707  		host->ncfg = lpc32xx_parse_dt(&pdev->dev);
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  708  	if (!host->ncfg) {
62beee20b1a53ba drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-08-24  709  		dev_err(&pdev->dev,
62beee20b1a53ba drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-08-24  710  			"Missing or bad NAND config from device tree\n");
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  711  		return -ENOENT;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  712  	}
782e32a990d9d70 drivers/mtd/nand/raw/lpc32xx_mlc.c Dmitry Torokhov    2022-09-28  713  
782e32a990d9d70 drivers/mtd/nand/raw/lpc32xx_mlc.c Dmitry Torokhov    2022-09-28  714  	/* Start with WP disabled, if available */
782e32a990d9d70 drivers/mtd/nand/raw/lpc32xx_mlc.c Dmitry Torokhov    2022-09-28  715  	host->wp_gpio = gpiod_get_optional(&pdev->dev, NULL, GPIOD_OUT_LOW);
782e32a990d9d70 drivers/mtd/nand/raw/lpc32xx_mlc.c Dmitry Torokhov    2022-09-28  716  	res = PTR_ERR_OR_ZERO(host->wp_gpio);
782e32a990d9d70 drivers/mtd/nand/raw/lpc32xx_mlc.c Dmitry Torokhov    2022-09-28  717  	if (res) {
782e32a990d9d70 drivers/mtd/nand/raw/lpc32xx_mlc.c Dmitry Torokhov    2022-09-28  718  		if (res != -EPROBE_DEFER)
782e32a990d9d70 drivers/mtd/nand/raw/lpc32xx_mlc.c Dmitry Torokhov    2022-09-28  719  			dev_err(&pdev->dev, "WP GPIO is not available: %d\n",
782e32a990d9d70 drivers/mtd/nand/raw/lpc32xx_mlc.c Dmitry Torokhov    2022-09-28  720  				res);
782e32a990d9d70 drivers/mtd/nand/raw/lpc32xx_mlc.c Dmitry Torokhov    2022-09-28  721  		return res;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  722  	}
782e32a990d9d70 drivers/mtd/nand/raw/lpc32xx_mlc.c Dmitry Torokhov    2022-09-28  723  
782e32a990d9d70 drivers/mtd/nand/raw/lpc32xx_mlc.c Dmitry Torokhov    2022-09-28  724  	gpiod_set_consumer_name(host->wp_gpio, "NAND WP");
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  725  
453810b79571ff6 drivers/mtd/nand/lpc32xx_mlc.c     Jingoo Han         2013-07-30  726  	host->pdata = dev_get_platdata(&pdev->dev);
9c6f62a7ef23025 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-08-16  727  
d699ed250c07384 drivers/mtd/nand/lpc32xx_mlc.c     Boris Brezillon    2015-12-10  728  	/* link the private data structures */
d699ed250c07384 drivers/mtd/nand/lpc32xx_mlc.c     Boris Brezillon    2015-12-10  729  	nand_set_controller_data(nand_chip, host);
a61ae81a1907af1 drivers/mtd/nand/lpc32xx_mlc.c     Brian Norris       2015-10-30  730  	nand_set_flash_node(nand_chip, pdev->dev.of_node);
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  731  	mtd->dev.parent = &pdev->dev;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  732  
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  733  	/* Get NAND clock */
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  734  	host->clk = clk_get(&pdev->dev, NULL);
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  735  	if (IS_ERR(host->clk)) {
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  736  		dev_err(&pdev->dev, "Clock initialization failure\n");
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  737  		res = -ENOENT;
ed64cb1df481527 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-04-21  738  		goto free_gpio;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  739  	}
4d26f012ab591d7 drivers/mtd/nand/lpc32xx_mlc.c     Arvind Yadav       2017-08-01  740  	res = clk_prepare_enable(host->clk);
4d26f012ab591d7 drivers/mtd/nand/lpc32xx_mlc.c     Arvind Yadav       2017-08-01  741  	if (res)
ed64cb1df481527 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-04-21  742  		goto put_clk;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  743  
bf6065c6c08fa3e drivers/mtd/nand/raw/lpc32xx_mlc.c Boris Brezillon    2018-09-07  744  	nand_chip->legacy.cmd_ctrl = lpc32xx_nand_cmd_ctrl;
8395b753d7cad2b drivers/mtd/nand/raw/lpc32xx_mlc.c Boris Brezillon    2018-09-07  745  	nand_chip->legacy.dev_ready = lpc32xx_nand_device_ready;
3cece3abebda068 drivers/mtd/nand/raw/lpc32xx_mlc.c Boris Brezillon    2018-09-07  746  	nand_chip->legacy.chip_delay = 25; /* us */
82fc5099744e5f3 drivers/mtd/nand/raw/lpc32xx_mlc.c Boris Brezillon    2018-09-07  747  	nand_chip->legacy.IO_ADDR_R = MLC_DATA(host->io_base);
82fc5099744e5f3 drivers/mtd/nand/raw/lpc32xx_mlc.c Boris Brezillon    2018-09-07  748  	nand_chip->legacy.IO_ADDR_W = MLC_DATA(host->io_base);
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  749  
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  750  	/* Init NAND controller */
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  751  	lpc32xx_nand_setup(host);
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  752  
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  753  	platform_set_drvdata(pdev, host);
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  754  
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  755  	/* Initialize function pointers */
8395b753d7cad2b drivers/mtd/nand/raw/lpc32xx_mlc.c Boris Brezillon    2018-09-07  756  	nand_chip->legacy.waitfunc = lpc32xx_waitfunc;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  757  
5e41d0a7102cfd4 drivers/mtd/nand/lpc32xx_mlc.c     Brian Norris       2013-12-16  758  	nand_chip->options = NAND_NO_SUBPAGE_WRITE;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  759  	nand_chip->bbt_options = NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  760  	nand_chip->bbt_td = &lpc32xx_nand_bbt;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  761  	nand_chip->bbt_md = &lpc32xx_nand_bbt_mirror;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  762  
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  763  	if (use_dma) {
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  764  		res = lpc32xx_dma_setup(host);
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  765  		if (res) {
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  766  			res = -EIO;
ed64cb1df481527 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-04-21  767  			goto unprepare_clk;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  768  		}
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  769  	}
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  770  
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  771  	/* initially clear interrupt status */
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  772  	readb(MLC_IRQ_SR(host->io_base));
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  773  
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  774  	init_completion(&host->comp_nand);
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  775  	init_completion(&host->comp_controller);
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  776  
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  777  	host->irq = platform_get_irq(pdev, 0);
cf9e1672a66c49e drivers/mtd/nand/lpc32xx_mlc.c     Vladimir Zapolskiy 2016-12-05  778  	if (host->irq < 0) {
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  779  		res = -EINVAL;
ed64cb1df481527 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-04-21  780  		goto release_dma_chan;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  781  	}
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  782  
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30 @783  	if (request_irq(host->irq, (irq_handler_t)&lpc3xxx_nand_irq,
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  784  			IRQF_TRIGGER_HIGH, DRV_NAME, host)) {
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  785  		dev_err(&pdev->dev, "Error requesting NAND IRQ\n");
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  786  		res = -ENXIO;
ed64cb1df481527 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-04-21  787  		goto release_dma_chan;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  788  	}
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  789  
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  790  	/*
c49f3bee8cb5435 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-07-25  791  	 * Scan to find existence of the device and get the type of NAND device:
c49f3bee8cb5435 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-07-25  792  	 * SMALL block or LARGE block.
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  793  	 */
7b6a9b28ecf2fd2 drivers/mtd/nand/raw/lpc32xx_mlc.c Boris Brezillon    2018-11-20  794  	nand_chip->legacy.dummy_controller.ops = &lpc32xx_nand_controller_ops;
00ad378f304a091 drivers/mtd/nand/raw/lpc32xx_mlc.c Boris Brezillon    2018-09-06  795  	res = nand_scan(nand_chip, 1);
b04bafca67dac3c drivers/mtd/nand/lpc32xx_mlc.c     Masahiro Yamada    2016-11-04  796  	if (res)
ed64cb1df481527 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-04-21  797  		goto free_irq;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  798  
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  799  	mtd->name = DRV_NAME;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  800  
a61ae81a1907af1 drivers/mtd/nand/lpc32xx_mlc.c     Brian Norris       2015-10-30  801  	res = mtd_device_register(mtd, host->ncfg->parts,
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  802  				  host->ncfg->num_parts);
ed64cb1df481527 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-04-21  803  	if (res)
838c07b05b369b3 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-04-21  804  		goto cleanup_nand;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  805  
ed64cb1df481527 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-04-21  806  	return 0;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  807  
838c07b05b369b3 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-04-21  808  cleanup_nand:
838c07b05b369b3 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-04-21  809  	nand_cleanup(nand_chip);
ed64cb1df481527 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-04-21  810  free_irq:
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  811  	free_irq(host->irq, host);
ed64cb1df481527 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-04-21  812  release_dma_chan:
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  813  	if (use_dma)
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  814  		dma_release_channel(host->dma_chan);
ed64cb1df481527 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-04-21  815  unprepare_clk:
64862dbc98ca0f5 drivers/mtd/nand/lpc32xx_mlc.c     Vladimir Zapolskiy 2015-10-17  816  	clk_disable_unprepare(host->clk);
ed64cb1df481527 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-04-21  817  put_clk:
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  818  	clk_put(host->clk);
ed64cb1df481527 drivers/mtd/nand/raw/lpc32xx_mlc.c Miquel Raynal      2018-04-21  819  free_gpio:
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  820  	lpc32xx_wp_enable(host);
782e32a990d9d70 drivers/mtd/nand/raw/lpc32xx_mlc.c Dmitry Torokhov    2022-09-28  821  	gpiod_put(host->wp_gpio);
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  822  
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  823  	return res;
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  824  }
70f7cb78ec53430 drivers/mtd/nand/lpc32xx_mlc.c     Roland Stigge      2012-06-30  825  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
