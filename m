Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408BD2C9C
	for <llvm@lists.linux.dev>; Wed, 22 Dec 2021 23:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640215567; x=1671751567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xFL68gEi6O6xjxMH5+Z0YMtwly1O35QCKA4Ru7/0AU4=;
  b=Qwyyud6IjdPF+kTfXq9soHjfRWacOT/5Gu6AV4peiN5tveh0fMWTZZW7
   v1xEmK6YoKy1st9yjy12J9gja2XqQbs2NYYBoV59xMcG20SbXU6a/GQKF
   I5dZhvKxYHDhSEsbOYQ3G4JXdIwYuANT7B92rP26JJj/lLCj8z3ag6nGu
   GagJUhddyyBcYT1AW3fjvHYvn59LpM7Qgu4aqtVc86SdxdbDwsVQrRbzg
   kJqTku46F4teiCxv0PZ3LPfWM9hi/iAW1G/7/cb1bS4CAdabRRSKb6phK
   ycfbqnrU0YkzKLmOTXQwxq2ViifN2P52rJIeu3/PWwIPs+01PuQUyAY7K
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="238258541"
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; 
   d="scan'208";a="238258541"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 15:26:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; 
   d="scan'208";a="466821022"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Dec 2021 15:26:04 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n0Azk-00013I-1r; Wed, 22 Dec 2021 23:26:04 +0000
Date: Thu, 23 Dec 2021 07:25:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v1 1/1] serial: 8250_exar: derive nr_ports from ID for
 Acces I/O cards
Message-ID: <202112230724.7vFjZf3K-lkp@intel.com>
References: <20211222194413.75069-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211222194413.75069-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on v5.16-rc6 next-20211222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/serial-8250_exar-derive-nr_ports-from-ID-for-Acces-I-O-cards/20211223-034500
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
config: riscv-randconfig-r042-20211222 (https://download.01.org/0day-ci/archive/20211223/202112230724.7vFjZf3K-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project de4e0195ae1c39f1c3b07834b8e32c113f4f20eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/533949cbef2191c3b9dd62584b56648987bc1e5b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andy-Shevchenko/serial-8250_exar-derive-nr_ports-from-ID-for-Acces-I-O-cards/20211223-034500
        git checkout 533949cbef2191c3b9dd62584b56648987bc1e5b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/tty/serial/8250/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_exar.c:627:3: error: use of undeclared identifier 'nr'
                   nr = BIT(((pcidev->device & 0x38) >> 3) - 1);
                   ^
   1 error generated.


vim +/nr +627 drivers/tty/serial/8250/8250_exar.c

   606	
   607	static int
   608	exar_pci_probe(struct pci_dev *pcidev, const struct pci_device_id *ent)
   609	{
   610		unsigned int nr_ports, i, bar = 0, maxnr;
   611		struct exar8250_board *board;
   612		struct uart_8250_port uart;
   613		struct exar8250 *priv;
   614		int rc;
   615	
   616		board = (struct exar8250_board *)ent->driver_data;
   617		if (!board)
   618			return -EINVAL;
   619	
   620		rc = pcim_enable_device(pcidev);
   621		if (rc)
   622			return rc;
   623	
   624		maxnr = pci_resource_len(pcidev, bar) >> (board->reg_shift + 3);
   625	
   626		if (pcidev->vendor == PCI_VENDOR_ID_ACCESSIO)
 > 627			nr = BIT(((pcidev->device & 0x38) >> 3) - 1);
   628		else if (board->num_ports)
   629			nr_ports = board->num_ports;
   630		else
   631			nr_ports = pcidev->device & 0x0f;
   632	
   633		priv = devm_kzalloc(&pcidev->dev, struct_size(priv, line, nr_ports), GFP_KERNEL);
   634		if (!priv)
   635			return -ENOMEM;
   636	
   637		priv->board = board;
   638		priv->virt = pcim_iomap(pcidev, bar, 0);
   639		if (!priv->virt)
   640			return -ENOMEM;
   641	
   642		pci_set_master(pcidev);
   643	
   644		rc = pci_alloc_irq_vectors(pcidev, 1, 1, PCI_IRQ_ALL_TYPES);
   645		if (rc < 0)
   646			return rc;
   647	
   648		memset(&uart, 0, sizeof(uart));
   649		uart.port.flags = UPF_SHARE_IRQ | UPF_EXAR_EFR | UPF_FIXED_TYPE | UPF_FIXED_PORT;
   650		uart.port.irq = pci_irq_vector(pcidev, 0);
   651		uart.port.dev = &pcidev->dev;
   652	
   653		rc = devm_request_irq(&pcidev->dev, uart.port.irq, exar_misc_handler,
   654				 IRQF_SHARED, "exar_uart", priv);
   655		if (rc)
   656			return rc;
   657	
   658		/* Clear interrupts */
   659		exar_misc_clear(priv);
   660	
   661		for (i = 0; i < nr_ports && i < maxnr; i++) {
   662			rc = board->setup(priv, pcidev, &uart, i);
   663			if (rc) {
   664				dev_err(&pcidev->dev, "Failed to setup port %u\n", i);
   665				break;
   666			}
   667	
   668			dev_dbg(&pcidev->dev, "Setup PCI port: port %lx, irq %d, type %d\n",
   669				uart.port.iobase, uart.port.irq, uart.port.iotype);
   670	
   671			priv->line[i] = serial8250_register_8250_port(&uart);
   672			if (priv->line[i] < 0) {
   673				dev_err(&pcidev->dev,
   674					"Couldn't register serial port %lx, irq %d, type %d, error %d\n",
   675					uart.port.iobase, uart.port.irq,
   676					uart.port.iotype, priv->line[i]);
   677				break;
   678			}
   679		}
   680		priv->nr = i;
   681		pci_set_drvdata(pcidev, priv);
   682		return 0;
   683	}
   684	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
