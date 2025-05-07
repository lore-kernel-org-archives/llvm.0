Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD6320F076;
	Wed,  7 May 2025 12:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622471; cv=none; b=kMvQvXVk4v8dMA5wDFcwtBJyx3CImznfOFx+KFFCNi0RbKgi0ccjh1SYB8cxcCg/TLrZy0CLRS6rdYScTLwzDbqiUEwsYWS8VWWiDkkb5B8s+q40SNYPt+2FrT4T62SpAIZDLmtMzAMAclMrhlBqdqkm5VAsD0VMFnWNlskd0Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622471; c=relaxed/simple;
	bh=MM81SCD9KdbEbPVVOmO6rH+5YV65BNfrcCPtgc/mc9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C5vjQ1WhhsRLiJ25K9dOM5ptkMHtOeVE4A/s6wZkRky/zuyFN75MvwPfSj4FqQ+Co6LVe+XodJGZVHY8INRiwVjaEmmTnoA/cHA7x2W7w0ZjXRXFH8+qJof+/fTqfZdEgssemoEjJ5fyFjSPGoxL62x2utAHXZtztPYahaEBzII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCAN2n/c; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCAN2n/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746622470; x=1778158470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MM81SCD9KdbEbPVVOmO6rH+5YV65BNfrcCPtgc/mc9E=;
  b=aCAN2n/cW9kJJE6/Mx6K3chvMnn7c5FHdTUCwm2m0YLWHhiERCg0c1Nv
   l8cgy6fmYpw6vdcy3xAIxEC5aL5Vlk4U3ROjFmQG/LJ6Tsgu1yWghOxdW
   hPEkqNm2XbTbXMbOxszbjt2Suvib9JmRzQ9qKg1zPp/XBCYmxuWixPUKZ
   p3BlK1n6nNqpDYUgXmtcHWIufROK3Ls5sqZ5Y2pu2C0NTy+tKinKWcYeG
   VZzYmvB0UGSFc5NfjW57d7KgWpDG6e9jqMFzbsfURlkW5+RydsPg0uMXc
   15vDMgil0f8dQE23zlyDeUV83BU0APPAxdxfdKwlMCaiDrgDvgxcG9M3s
   g==;
X-CSE-ConnectionGUID: jbzggrpQRK2cPSGyl4PywA==
X-CSE-MsgGUID: oXmBNsNwSUaHLt/v1aFO4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59702941"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="59702941"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:54:26 -0700
X-CSE-ConnectionGUID: eqYiyKpwQfOWFBRXUMWJvQ==
X-CSE-MsgGUID: xN7YKGi5Q3Gv6I8/NtwScA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="141141764"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 May 2025 05:54:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCeI3-0007oc-0D;
	Wed, 07 May 2025 12:54:23 +0000
Date: Wed, 7 May 2025 20:53:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 73/82] drivers/tty/serial/8250/8250_ioc3.c:68:10:
 error: no member named 'serial_in' in 'struct uart_port'
Message-ID: <202505072011.ijO79OoC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   6c308d0b04c8c17ab39fcf6d4ed9a9033efc363f
commit: 760f26e5c91c93a18718bdb8a19b2104bfff6f9e [73/82] ops2
config: i386-buildonly-randconfig-002-20250422 (https://download.01.org/0day-ci/archive/20250507/202505072011.ijO79OoC-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072011.ijO79OoC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072011.ijO79OoC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_ioc3.c:68:10: error: no member named 'serial_in' in 'struct uart_port'
      68 |         up.port.serial_in = ioc3_serial_in;
         |         ~~~~~~~ ^
>> drivers/tty/serial/8250/8250_ioc3.c:69:10: error: no member named 'serial_out' in 'struct uart_port'
      69 |         up.port.serial_out = ioc3_serial_out;
         |         ~~~~~~~ ^
   2 errors generated.


vim +68 drivers/tty/serial/8250/8250_ioc3.c

0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  33  
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  34  static int serial8250_ioc3_probe(struct platform_device *pdev)
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  35  {
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  36  	struct ioc3_8250_data *data;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  37  	struct uart_8250_port up;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  38  	struct resource *r;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  39  	void __iomem *membase;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  40  	int irq, line;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  41  
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  42  	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  43  	if (!r)
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  44  		return -ENODEV;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  45  
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  46  	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  47  	if (!data)
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  48  		return -ENOMEM;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  49  
b0ef7cda8d9be4 Linus Torvalds      2020-02-08  50  	membase = devm_ioremap(&pdev->dev, r->start, resource_size(r));
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  51  	if (!membase)
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  52  		return -ENOMEM;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  53  
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  54  	irq = platform_get_irq(pdev, 0);
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  55  	if (irq < 0)
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  56  		irq = 0; /* no interrupt -> use polling */
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  57  
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  58  	/* Register serial ports with 8250.c */
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  59  	memset(&up, 0, sizeof(struct uart_8250_port));
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  60  	up.port.iotype = UPIO_MEM;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  61  	up.port.uartclk = IOC3_UARTCLK;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  62  	up.port.type = PORT_16550A;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  63  	up.port.irq = irq;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  64  	up.port.flags = (UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ);
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  65  	up.port.dev = &pdev->dev;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  66  	up.port.membase = membase;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  67  	up.port.mapbase = r->start;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09 @68  	up.port.serial_in = ioc3_serial_in;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09 @69  	up.port.serial_out = ioc3_serial_out;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  70  	line = serial8250_register_8250_port(&up);
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  71  	if (line < 0)
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  72  		return line;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  73  
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  74  	platform_set_drvdata(pdev, data);
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  75  	return 0;
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  76  }
0ce5ebd24d25f0 Thomas Bogendoerfer 2020-01-09  77  

:::::: The code at line 68 was first introduced by commit
:::::: 0ce5ebd24d25f02c73940f047b12733d84b125e8 mfd: ioc3: Add driver for SGI IOC3 chip

:::::: TO: Thomas Bogendoerfer <tbogendoerfer@suse.de>
:::::: CC: Paul Burton <paulburton@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
