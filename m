Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045217E
	for <llvm@lists.linux.dev>; Sat, 23 Jul 2022 00:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658536310; x=1690072310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8MoBaFko1dNTluMyqF2THMwaj1AE/EuZd7vAcQwYr/8=;
  b=TOwHw1iz5VlEqc/i22g3HCSaxCmPxag8E9bPtU20YKcUPpPa3BuQS6uO
   Bq5mHK2nis6wY/5dfg3vki5vTvKmMDfl40Lx9FQU16NFSslw+G/jXqDfh
   lOPOOeE38+4miYl+XM7oINESNYnONBnIYQMYWPMmAcFm4JRoZEBDz4KjQ
   bwF4MW20EEZ+23jGOgh0U+AbepJYev5XJAmU0psuUoEanjTou1wC7YcAA
   05Z1KxOaHMGFnRc9Tefdk3ReIxODnDQkp0Khx84T0w0d+upiXuCPI5Mob
   kj5bYd/gwBbqv7YilmtImCpbmGeLHutgDQzCYhloT4WUuMSYC0LdDkHav
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10416"; a="286191174"
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; 
   d="scan'208";a="286191174"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2022 17:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; 
   d="scan'208";a="741226422"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Jul 2022 17:31:47 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oF33a-0001xp-2e;
	Sat, 23 Jul 2022 00:31:46 +0000
Date: Sat, 23 Jul 2022 08:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [linux-next:master 9476/12552] drivers/pcmcia/omap_cf.c:240:11:
 error: call to undeclared function 'pci_remap_iospace'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202207230818.0BGT9Pmc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   18c107a1f120d095404d141dfad8f594bdc44020
commit: c86c8360959ec706576baf17237dec3004154d4b [9476/12552] arm: ioremap: Fix pci_remap_iospace() when CONFIG_MMU unset
config: arm-randconfig-r036-20220721 (https://download.01.org/0day-ci/archive/20220723/202207230818.0BGT9Pmc-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 72686d68c137551cce816416190a18d45b4d4e2a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c86c8360959ec706576baf17237dec3004154d4b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c86c8360959ec706576baf17237dec3004154d4b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/pcmcia/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/pcmcia/omap_cf.c:127:7: warning: variable 'control' set but not used [-Wunused-but-set-variable]
           u16             control;
                           ^
>> drivers/pcmcia/omap_cf.c:240:11: error: call to undeclared function 'pci_remap_iospace'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           status = pci_remap_iospace(&iospace, cf->phys_cf + SZ_4K);
                    ^
   drivers/pcmcia/omap_cf.c:240:11: note: did you mean 'pci_remap_cfgspace'?
   arch/arm/include/asm/io.h:199:15: note: 'pci_remap_cfgspace' declared here
   void __iomem *pci_remap_cfgspace(resource_size_t res_cookie, size_t size);
                 ^
   arch/arm/include/asm/io.h:198:28: note: expanded from macro 'pci_remap_cfgspace'
   #define pci_remap_cfgspace pci_remap_cfgspace
                              ^
   1 warning and 1 error generated.


vim +/pci_remap_iospace +240 drivers/pcmcia/omap_cf.c

f74e48a51c38f5 David Brownell   2005-09-09  195  
f74e48a51c38f5 David Brownell   2005-09-09  196  /*
f74e48a51c38f5 David Brownell   2005-09-09  197   * NOTE:  right now the only board-specific platform_data is
f74e48a51c38f5 David Brownell   2005-09-09  198   * "what chipselect is used".  Boards could want more.
f74e48a51c38f5 David Brownell   2005-09-09  199   */
f74e48a51c38f5 David Brownell   2005-09-09  200  
b6d2cccb55b518 David Brownell   2007-04-08  201  static int __init omap_cf_probe(struct platform_device *pdev)
f74e48a51c38f5 David Brownell   2005-09-09  202  {
f74e48a51c38f5 David Brownell   2005-09-09  203  	unsigned		seg;
f74e48a51c38f5 David Brownell   2005-09-09  204  	struct omap_cf_socket	*cf;
f74e48a51c38f5 David Brownell   2005-09-09  205  	int			irq;
f74e48a51c38f5 David Brownell   2005-09-09  206  	int			status;
d87d44f7ab353d Arnd Bergmann    2019-08-05  207  	struct resource		*res;
df99e7bbbec318 Arnd Bergmann    2019-08-06  208  	struct resource		iospace = DEFINE_RES_IO(SZ_64, SZ_4K);
f74e48a51c38f5 David Brownell   2005-09-09  209  
b6d2cccb55b518 David Brownell   2007-04-08  210  	seg = (int) pdev->dev.platform_data;
f74e48a51c38f5 David Brownell   2005-09-09  211  	if (seg == 0 || seg > 3)
f74e48a51c38f5 David Brownell   2005-09-09  212  		return -ENODEV;
f74e48a51c38f5 David Brownell   2005-09-09  213  
f74e48a51c38f5 David Brownell   2005-09-09  214  	/* either CFLASH.IREQ (INT_1610_CF) or some GPIO */
f74e48a51c38f5 David Brownell   2005-09-09  215  	irq = platform_get_irq(pdev, 0);
489447380a2921 David Vrabel     2006-01-19  216  	if (irq < 0)
f74e48a51c38f5 David Brownell   2005-09-09  217  		return -EINVAL;
f74e48a51c38f5 David Brownell   2005-09-09  218  
d87d44f7ab353d Arnd Bergmann    2019-08-05  219  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
d87d44f7ab353d Arnd Bergmann    2019-08-05  220  
cd86128088554d Robert P. J. Day 2006-12-13  221  	cf = kzalloc(sizeof *cf, GFP_KERNEL);
f74e48a51c38f5 David Brownell   2005-09-09  222  	if (!cf)
f74e48a51c38f5 David Brownell   2005-09-09  223  		return -ENOMEM;
41760d0e0f1a01 Kees Cook        2017-10-21  224  	timer_setup(&cf->timer, omap_cf_timer, 0);
f74e48a51c38f5 David Brownell   2005-09-09  225  
f74e48a51c38f5 David Brownell   2005-09-09  226  	cf->pdev = pdev;
b6d2cccb55b518 David Brownell   2007-04-08  227  	platform_set_drvdata(pdev, cf);
f74e48a51c38f5 David Brownell   2005-09-09  228  
f74e48a51c38f5 David Brownell   2005-09-09  229  	/* this primarily just shuts up irq handling noise */
dace145374b8e3 Thomas Gleixner  2006-07-01  230  	status = request_irq(irq, omap_cf_irq, IRQF_SHARED,
f74e48a51c38f5 David Brownell   2005-09-09  231  			driver_name, cf);
f74e48a51c38f5 David Brownell   2005-09-09  232  	if (status < 0)
f74e48a51c38f5 David Brownell   2005-09-09  233  		goto fail0;
f74e48a51c38f5 David Brownell   2005-09-09  234  	cf->irq = irq;
f74e48a51c38f5 David Brownell   2005-09-09  235  	cf->socket.pci_irq = irq;
d87d44f7ab353d Arnd Bergmann    2019-08-05  236  	cf->phys_cf = res->start;
f74e48a51c38f5 David Brownell   2005-09-09  237  
f74e48a51c38f5 David Brownell   2005-09-09  238  	/* pcmcia layer only remaps "real" memory */
df99e7bbbec318 Arnd Bergmann    2019-08-06  239  	cf->socket.io_offset = iospace.start;
df99e7bbbec318 Arnd Bergmann    2019-08-06 @240  	status = pci_remap_iospace(&iospace, cf->phys_cf + SZ_4K);
df99e7bbbec318 Arnd Bergmann    2019-08-06  241  	if (status) {
70d3a462fc244b Wang ShaoBo      2020-11-25  242  		status = -ENOMEM;
f74e48a51c38f5 David Brownell   2005-09-09  243  		goto fail1;
70d3a462fc244b Wang ShaoBo      2020-11-25  244  	}
f74e48a51c38f5 David Brownell   2005-09-09  245  
70d3a462fc244b Wang ShaoBo      2020-11-25  246  	if (!request_mem_region(cf->phys_cf, SZ_8K, driver_name)) {
70d3a462fc244b Wang ShaoBo      2020-11-25  247  		status = -ENXIO;
f74e48a51c38f5 David Brownell   2005-09-09  248  		goto fail1;
70d3a462fc244b Wang ShaoBo      2020-11-25  249  	}
f74e48a51c38f5 David Brownell   2005-09-09  250  
f74e48a51c38f5 David Brownell   2005-09-09  251  	/* NOTE:  CF conflicts with MMC1 */
f74e48a51c38f5 David Brownell   2005-09-09  252  	omap_cfg_reg(W11_1610_CF_CD1);
f74e48a51c38f5 David Brownell   2005-09-09  253  	omap_cfg_reg(P11_1610_CF_CD2);
f74e48a51c38f5 David Brownell   2005-09-09  254  	omap_cfg_reg(R11_1610_CF_IOIS16);
f74e48a51c38f5 David Brownell   2005-09-09  255  	omap_cfg_reg(V10_1610_CF_IREQ);
f74e48a51c38f5 David Brownell   2005-09-09  256  	omap_cfg_reg(W10_1610_CF_RESET);
f74e48a51c38f5 David Brownell   2005-09-09  257  
030b15457d8069 Tony Lindgren    2008-07-03  258  	omap_writew(~(1 << seg), CF_CFG);
f74e48a51c38f5 David Brownell   2005-09-09  259  
f74e48a51c38f5 David Brownell   2005-09-09  260  	pr_info("%s: cs%d on irq %d\n", driver_name, seg, irq);
f74e48a51c38f5 David Brownell   2005-09-09  261  
f74e48a51c38f5 David Brownell   2005-09-09  262  	/* CF uses armxor_ck, which is "always" available */
f74e48a51c38f5 David Brownell   2005-09-09  263  
f74e48a51c38f5 David Brownell   2005-09-09  264  	pr_debug("%s: sts %04x cfg %04x control %04x %s\n", driver_name,
030b15457d8069 Tony Lindgren    2008-07-03  265  		omap_readw(CF_STATUS), omap_readw(CF_CFG),
030b15457d8069 Tony Lindgren    2008-07-03  266  		omap_readw(CF_CONTROL),
f74e48a51c38f5 David Brownell   2005-09-09  267  		omap_cf_present() ? "present" : "(not present)");
f74e48a51c38f5 David Brownell   2005-09-09  268  
f74e48a51c38f5 David Brownell   2005-09-09  269  	cf->socket.owner = THIS_MODULE;
b6d2cccb55b518 David Brownell   2007-04-08  270  	cf->socket.dev.parent = &pdev->dev;
f74e48a51c38f5 David Brownell   2005-09-09  271  	cf->socket.ops = &omap_cf_ops;
f74e48a51c38f5 David Brownell   2005-09-09  272  	cf->socket.resource_ops = &pccard_static_ops;
f74e48a51c38f5 David Brownell   2005-09-09  273  	cf->socket.features = SS_CAP_PCCARD | SS_CAP_STATIC_MAP
f74e48a51c38f5 David Brownell   2005-09-09  274  				| SS_CAP_MEM_ALIGN;
f74e48a51c38f5 David Brownell   2005-09-09  275  	cf->socket.map_size = SZ_2K;
dcb9c39236a27c David Brownell   2006-09-30  276  	cf->socket.io[0].res = &cf->iomem;
f74e48a51c38f5 David Brownell   2005-09-09  277  
f74e48a51c38f5 David Brownell   2005-09-09  278  	status = pcmcia_register_socket(&cf->socket);
f74e48a51c38f5 David Brownell   2005-09-09  279  	if (status < 0)
f74e48a51c38f5 David Brownell   2005-09-09  280  		goto fail2;
f74e48a51c38f5 David Brownell   2005-09-09  281  
f74e48a51c38f5 David Brownell   2005-09-09  282  	cf->active = 1;
f74e48a51c38f5 David Brownell   2005-09-09  283  	mod_timer(&cf->timer, jiffies + POLL_INTERVAL);
f74e48a51c38f5 David Brownell   2005-09-09  284  	return 0;
f74e48a51c38f5 David Brownell   2005-09-09  285  
f74e48a51c38f5 David Brownell   2005-09-09  286  fail2:
f74e48a51c38f5 David Brownell   2005-09-09  287  	release_mem_region(cf->phys_cf, SZ_8K);
f74e48a51c38f5 David Brownell   2005-09-09  288  fail1:
f74e48a51c38f5 David Brownell   2005-09-09  289  	free_irq(irq, cf);
f74e48a51c38f5 David Brownell   2005-09-09  290  fail0:
f74e48a51c38f5 David Brownell   2005-09-09  291  	kfree(cf);
f74e48a51c38f5 David Brownell   2005-09-09  292  	return status;
f74e48a51c38f5 David Brownell   2005-09-09  293  }
f74e48a51c38f5 David Brownell   2005-09-09  294  

:::::: The code at line 240 was first introduced by commit
:::::: df99e7bbbec3180693b3d932a9cbc88346e2a30e ARM: omap1: use pci_remap_iospace() for omap_cf

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
