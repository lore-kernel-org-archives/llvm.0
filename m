Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0057F28E2;
	Wed, 15 Mar 2023 08:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678870051; x=1710406051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NUHbSZHWcNx+d5qlRKypZ6BXXeEQSP7K/sbSw7L66kU=;
  b=Q27CXxXLT6ivnvkOw41sCUw8TDIT524mNGQKNAPdxIIRbiSSKewRJYGN
   ll0ZBA5QwYXFz6NVaUzbj6TEwXvSWtME9qnm94lMeGnXSQlWknKuoU7kt
   AMHXcwvtZ2YtoHIVscZM6tNW7QIy2Bq56XYnDuuFgjH9GjSkRPLqx/iSa
   Bl5SzeeUTT6zxi46Xew3u8uCqZnlcjFFCfcoBfT8ePET1ZX/1jNtPSm8c
   7880Qf9X4u//7wTubRXCQq2fdhYvGz00HrmMbjAhqsP9TYqPCcB0p7ROr
   jz7nRGS02DcLbiknF73Vf5U3069OVqFNSIsmeZLzeyY0R2LO4FZz3pbJF
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="340011041"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="340011041"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 01:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="803187228"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="803187228"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Mar 2023 01:47:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcMn8-0007YK-1b;
	Wed, 15 Mar 2023 08:47:26 +0000
Date: Wed, 15 Mar 2023 16:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [linux-stable-rc:queue/5.10 77/85]
 drivers/usb/host/ehci-ppc-of.c:122:13: error: use of undeclared identifier
 'NO_IRQ'; did you mean 'do_IRQ'?
Message-ID: <202303151642.5GmrwAmy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.10
head:   bb0818a7908bae8863a2ea628dd3fc43a9cdd702
commit: 4a3c7e913d4c3cdde0c38f5a51bf1bffa7aa2778 [77/85] powerpc: Check !irq instead of irq == NO_IRQ and remove NO_IRQ
config: powerpc-randconfig-r015-20230313 (https://download.01.org/0day-ci/archive/20230315/202303151642.5GmrwAmy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=4a3c7e913d4c3cdde0c38f5a51bf1bffa7aa2778
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.10
        git checkout 4a3c7e913d4c3cdde0c38f5a51bf1bffa7aa2778
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/usb/host/ drivers/video/fbdev/mb862xx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303151642.5GmrwAmy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/usb/host/ehci-hcd.c:1302:
>> drivers/usb/host/ehci-ppc-of.c:122:13: error: use of undeclared identifier 'NO_IRQ'; did you mean 'do_IRQ'?
           if (irq == NO_IRQ) {
                      ^~~~~~
                      do_IRQ
   arch/powerpc/include/asm/irq.h:57:13: note: 'do_IRQ' declared here
   extern void do_IRQ(struct pt_regs *regs);
               ^
   1 error generated.
--
>> drivers/usb/host/fhci-hcd.c:697:17: error: use of undeclared identifier 'NO_IRQ'; did you mean 'do_IRQ'?
           if (usb_irq == NO_IRQ) {
                          ^~~~~~
                          do_IRQ
   arch/powerpc/include/asm/irq.h:57:13: note: 'do_IRQ' declared here
   extern void do_IRQ(struct pt_regs *regs);
               ^
   1 error generated.
--
>> drivers/video/fbdev/mb862xx/mb862xxfbdrv.c:693:18: error: use of undeclared identifier 'NO_IRQ'; did you mean 'do_IRQ'?
           if (par->irq == NO_IRQ) {
                           ^~~~~~
                           do_IRQ
   arch/powerpc/include/asm/irq.h:57:13: note: 'do_IRQ' declared here
   extern void do_IRQ(struct pt_regs *regs);
               ^
   1 error generated.


vim +122 drivers/usb/host/ehci-ppc-of.c

da0e8fb00b862a Valentine Barshak 2007-12-30   92  
da0e8fb00b862a Valentine Barshak 2007-12-30   93  
41ac7b3ab7fe1d Bill Pemberton    2012-11-19   94  static int ehci_hcd_ppc_of_probe(struct platform_device *op)
da0e8fb00b862a Valentine Barshak 2007-12-30   95  {
61c7a080a5a061 Grant Likely      2010-04-13   96  	struct device_node *dn = op->dev.of_node;
da0e8fb00b862a Valentine Barshak 2007-12-30   97  	struct usb_hcd *hcd;
796bcae7361c28 Vitaly Bordug     2008-11-09   98  	struct ehci_hcd	*ehci = NULL;
da0e8fb00b862a Valentine Barshak 2007-12-30   99  	struct resource res;
da0e8fb00b862a Valentine Barshak 2007-12-30  100  	int irq;
da0e8fb00b862a Valentine Barshak 2007-12-30  101  	int rv;
da0e8fb00b862a Valentine Barshak 2007-12-30  102  
796bcae7361c28 Vitaly Bordug     2008-11-09  103  	struct device_node *np;
796bcae7361c28 Vitaly Bordug     2008-11-09  104  
da0e8fb00b862a Valentine Barshak 2007-12-30  105  	if (usb_disabled())
da0e8fb00b862a Valentine Barshak 2007-12-30  106  		return -ENODEV;
da0e8fb00b862a Valentine Barshak 2007-12-30  107  
da0e8fb00b862a Valentine Barshak 2007-12-30  108  	dev_dbg(&op->dev, "initializing PPC-OF USB Controller\n");
da0e8fb00b862a Valentine Barshak 2007-12-30  109  
da0e8fb00b862a Valentine Barshak 2007-12-30  110  	rv = of_address_to_resource(dn, 0, &res);
da0e8fb00b862a Valentine Barshak 2007-12-30  111  	if (rv)
da0e8fb00b862a Valentine Barshak 2007-12-30  112  		return rv;
da0e8fb00b862a Valentine Barshak 2007-12-30  113  
da0e8fb00b862a Valentine Barshak 2007-12-30  114  	hcd = usb_create_hcd(&ehci_ppc_of_hc_driver, &op->dev, "PPC-OF USB");
da0e8fb00b862a Valentine Barshak 2007-12-30  115  	if (!hcd)
da0e8fb00b862a Valentine Barshak 2007-12-30  116  		return -ENOMEM;
da0e8fb00b862a Valentine Barshak 2007-12-30  117  
da0e8fb00b862a Valentine Barshak 2007-12-30  118  	hcd->rsrc_start = res.start;
28f65c11f2ffb3 Joe Perches       2011-06-09  119  	hcd->rsrc_len = resource_size(&res);
da0e8fb00b862a Valentine Barshak 2007-12-30  120  
da0e8fb00b862a Valentine Barshak 2007-12-30  121  	irq = irq_of_parse_and_map(dn, 0);
da0e8fb00b862a Valentine Barshak 2007-12-30 @122  	if (irq == NO_IRQ) {
346c8b241cb1b9 Jingoo Han        2013-12-10  123  		dev_err(&op->dev, "%s: irq_of_parse_and_map failed\n",
346c8b241cb1b9 Jingoo Han        2013-12-10  124  			__FILE__);
da0e8fb00b862a Valentine Barshak 2007-12-30  125  		rv = -EBUSY;
da0e8fb00b862a Valentine Barshak 2007-12-30  126  		goto err_irq;
da0e8fb00b862a Valentine Barshak 2007-12-30  127  	}
da0e8fb00b862a Valentine Barshak 2007-12-30  128  
148e11349b0c9c Thierry Reding    2013-01-21  129  	hcd->regs = devm_ioremap_resource(&op->dev, &res);
148e11349b0c9c Thierry Reding    2013-01-21  130  	if (IS_ERR(hcd->regs)) {
148e11349b0c9c Thierry Reding    2013-01-21  131  		rv = PTR_ERR(hcd->regs);
da0e8fb00b862a Valentine Barshak 2007-12-30  132  		goto err_ioremap;
da0e8fb00b862a Valentine Barshak 2007-12-30  133  	}
da0e8fb00b862a Valentine Barshak 2007-12-30  134  
da0e8fb00b862a Valentine Barshak 2007-12-30  135  	ehci = hcd_to_ehci(hcd);
796bcae7361c28 Vitaly Bordug     2008-11-09  136  	np = of_find_compatible_node(NULL, NULL, "ibm,usb-ohci-440epx");
796bcae7361c28 Vitaly Bordug     2008-11-09  137  	if (np != NULL) {
796bcae7361c28 Vitaly Bordug     2008-11-09  138  		/* claim we really affected by usb23 erratum */
796bcae7361c28 Vitaly Bordug     2008-11-09  139  		if (!of_address_to_resource(np, 0, &res))
1c5404f7abd250 Julia Lawall      2012-07-30  140  			ehci->ohci_hcctrl_reg =
1c5404f7abd250 Julia Lawall      2012-07-30  141  				devm_ioremap(&op->dev,
1c5404f7abd250 Julia Lawall      2012-07-30  142  					     res.start + OHCI_HCCTRL_OFFSET,
1c5404f7abd250 Julia Lawall      2012-07-30  143  					     OHCI_HCCTRL_LEN);
796bcae7361c28 Vitaly Bordug     2008-11-09  144  		else
f45ba776da4fe6 Joe Perches       2010-02-05  145  			pr_debug("%s: no ohci offset in fdt\n", __FILE__);
796bcae7361c28 Vitaly Bordug     2008-11-09  146  		if (!ehci->ohci_hcctrl_reg) {
f45ba776da4fe6 Joe Perches       2010-02-05  147  			pr_debug("%s: ioremap for ohci hcctrl failed\n", __FILE__);
796bcae7361c28 Vitaly Bordug     2008-11-09  148  		} else {
796bcae7361c28 Vitaly Bordug     2008-11-09  149  			ehci->has_amcc_usb23 = 1;
796bcae7361c28 Vitaly Bordug     2008-11-09  150  		}
585d22a5624ef2 Miaoqian Lin      2022-06-02  151  		of_node_put(np);
796bcae7361c28 Vitaly Bordug     2008-11-09  152  	}
da0e8fb00b862a Valentine Barshak 2007-12-30  153  
da0e8fb00b862a Valentine Barshak 2007-12-30  154  	if (of_get_property(dn, "big-endian", NULL)) {
da0e8fb00b862a Valentine Barshak 2007-12-30  155  		ehci->big_endian_mmio = 1;
da0e8fb00b862a Valentine Barshak 2007-12-30  156  		ehci->big_endian_desc = 1;
da0e8fb00b862a Valentine Barshak 2007-12-30  157  	}
da0e8fb00b862a Valentine Barshak 2007-12-30  158  	if (of_get_property(dn, "big-endian-regs", NULL))
da0e8fb00b862a Valentine Barshak 2007-12-30  159  		ehci->big_endian_mmio = 1;
da0e8fb00b862a Valentine Barshak 2007-12-30  160  	if (of_get_property(dn, "big-endian-desc", NULL))
da0e8fb00b862a Valentine Barshak 2007-12-30  161  		ehci->big_endian_desc = 1;
da0e8fb00b862a Valentine Barshak 2007-12-30  162  
da0e8fb00b862a Valentine Barshak 2007-12-30  163  	ehci->caps = hcd->regs;
da0e8fb00b862a Valentine Barshak 2007-12-30  164  
da0e8fb00b862a Valentine Barshak 2007-12-30  165  	if (of_device_is_compatible(dn, "ibm,usb-ehci-440epx")) {
da0e8fb00b862a Valentine Barshak 2007-12-30  166  		rv = ppc44x_enable_bmt(dn);
da0e8fb00b862a Valentine Barshak 2007-12-30  167  		ehci_dbg(ehci, "Break Memory Transfer (BMT) is %senabled!\n",
da0e8fb00b862a Valentine Barshak 2007-12-30  168  				rv ? "NOT ": "");
da0e8fb00b862a Valentine Barshak 2007-12-30  169  	}
da0e8fb00b862a Valentine Barshak 2007-12-30  170  
da0e8fb00b862a Valentine Barshak 2007-12-30  171  	rv = usb_add_hcd(hcd, irq, 0);
08a3b3b1c2e622 Dan Carpenter     2010-08-14  172  	if (rv)
1c5404f7abd250 Julia Lawall      2012-07-30  173  		goto err_ioremap;
08a3b3b1c2e622 Dan Carpenter     2010-08-14  174  
3c9740a117d40a Peter Chen        2013-11-05  175  	device_wakeup_enable(hcd->self.controller);
da0e8fb00b862a Valentine Barshak 2007-12-30  176  	return 0;
da0e8fb00b862a Valentine Barshak 2007-12-30  177  
da0e8fb00b862a Valentine Barshak 2007-12-30  178  err_ioremap:
da0e8fb00b862a Valentine Barshak 2007-12-30  179  	irq_dispose_mapping(irq);
da0e8fb00b862a Valentine Barshak 2007-12-30  180  err_irq:
da0e8fb00b862a Valentine Barshak 2007-12-30  181  	usb_put_hcd(hcd);
da0e8fb00b862a Valentine Barshak 2007-12-30  182  
da0e8fb00b862a Valentine Barshak 2007-12-30  183  	return rv;
da0e8fb00b862a Valentine Barshak 2007-12-30  184  }
da0e8fb00b862a Valentine Barshak 2007-12-30  185  

:::::: The code at line 122 was first introduced by commit
:::::: da0e8fb00b862aa10265f0c64930b432cd44420b USB: add ehci-ppc-of bus glue (device-tree aware)

:::::: TO: Valentine Barshak <vbarshak@ru.mvista.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
