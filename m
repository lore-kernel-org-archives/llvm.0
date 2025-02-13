Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C111C84D4;
	Thu, 13 Feb 2025 11:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739446767; cv=none; b=bS3sIfqbZ/Jc4lhh2R7YjaYPjDmSdffuTr+HhKCkZBLhbI9hP3gwEaGfocZxLTQ16bBa9qaI4mB9YX0bsQljT1JPeJ+uzOt+mwkWMgKYy5hYijVhzYrnvu/yhb7CuXscE/nPxBzL8kyH9thKjxCvv5rBpWwX0Ex+rXrK95qiNnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739446767; c=relaxed/simple;
	bh=9kiFxEHvsjkuDr/sgnEM2astjy91bVr0mJChjjQ6NfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QeYxt9HP4p0mndjjbgf17Kn3XvvHkIgd30j5vR39wo/cVbBfeqGLtF1KfkwYfBzWSEdgjaEQJGlgkUHxHb3g9t/J2rrZidp73oSVfdCaFYFPc40LY/eRpdWpNWnDM/w022dBmiyTn1B2XUpgWDVRJKsqkwvaclC36Ps4j6AWrpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SxTyhNUe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SxTyhNUe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739446764; x=1770982764;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9kiFxEHvsjkuDr/sgnEM2astjy91bVr0mJChjjQ6NfU=;
  b=SxTyhNUeAWFjAr8jiIeheSAGj02nze6SMo2VA5l1y/ug9DZLCSe9qLGB
   xWAAF3/+isB9iXSwohtdqZ1oa+GT9gkiqNHOVc3p91DkmnXfopO+CYxZ5
   +DJYG8A7ruHX3zfR4nke93+T5Qm0PPwwC2I4mk0Sn2XzE+at7meHj1ig9
   HUhShFd6RfgEUsnJ2cga0BEHJSZgHt0apKfZeWBeCugVMgciAgg21mD9v
   wOTfbMIIKqw1l/50Apeagr5WjKrGLLarjusEURtETWRHpzzlAUb7EA6u/
   Qv1NaiNERKLi+Sk11f10bmifSpku+LrtffggOEBzkTby/OjLzh9XIhKa5
   A==;
X-CSE-ConnectionGUID: BY9MdFPXRSy9YyUSTb5jvw==
X-CSE-MsgGUID: cKZF4RjwQs+ALyCkJ/1UTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39374103"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="39374103"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 03:39:23 -0800
X-CSE-ConnectionGUID: PD3bawPcSNus3/dIkF79tA==
X-CSE-MsgGUID: Abe1wDprThula4v/GDOR5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="112986275"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Feb 2025 03:39:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiXYu-0016z1-1o;
	Thu, 13 Feb 2025 11:39:20 +0000
Date: Thu, 13 Feb 2025 19:39:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 68/69]
 drivers/tty/serial/8250/8250_bcm2835aux.c:102:10: error: no member named
 'rs485_config' in 'struct uart_port'
Message-ID: <202502131940.AoPsXI7B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   18719ba870f2b5aac6c4ea327aacc3bec6bc98cc
commit: a7e1e5ceadbf1e443ad44ccfc046afa234b09f77 [68/69] ops2
config: hexagon-randconfig-002-20250213 (https://download.01.org/0day-ci/archive/20250213/202502131940.AoPsXI7B-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131940.AoPsXI7B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131940.AoPsXI7B-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_bcm2835aux.c:102:10: error: no member named 'rs485_config' in 'struct uart_port'
     102 |         up.port.rs485_config = serial8250_em485_config;
         |         ~~~~~~~ ^
   drivers/tty/serial/8250/8250_bcm2835aux.c:104:5: error: no member named 'rs485_start_tx' in 'struct uart_8250_port'
     104 |         up.rs485_start_tx = bcm2835aux_rs485_start_tx;
         |         ~~ ^
   drivers/tty/serial/8250/8250_bcm2835aux.c:105:5: error: no member named 'rs485_stop_tx' in 'struct uart_8250_port'
     105 |         up.rs485_stop_tx = bcm2835aux_rs485_stop_tx;
         |         ~~ ^
   3 errors generated.
--
>> drivers/tty/serial/8250/8250_ioc3.c:68:10: error: no member named 'serial_in' in 'struct uart_port'
      68 |         up.port.serial_in = ioc3_serial_in;
         |         ~~~~~~~ ^
>> drivers/tty/serial/8250/8250_ioc3.c:69:10: error: no member named 'serial_out' in 'struct uart_port'
      69 |         up.port.serial_out = ioc3_serial_out;
         |         ~~~~~~~ ^
   2 errors generated.


vim +102 drivers/tty/serial/8250/8250_bcm2835aux.c

f93bf758911476 Lukas Wunner        2020-02-28   82  
bdc5f300958062 Martin Sperl        2016-01-17   83  static int bcm2835aux_serial_probe(struct platform_device *pdev)
bdc5f300958062 Martin Sperl        2016-01-17   84  {
eb687309136b9f Andy Shevchenko     2024-03-04   85  	const struct software_node *bcm2835_swnode;
8c3cde5dd639af Lukas Wunner        2020-01-16   86  	struct uart_8250_port up = { };
bdc5f300958062 Martin Sperl        2016-01-17   87  	struct bcm2835aux_data *data;
bdc5f300958062 Martin Sperl        2016-01-17   88  	struct resource *res;
fcc446c8aa6303 Adrien Thierry      2022-02-07   89  	unsigned int uartclk;
bdc5f300958062 Martin Sperl        2016-01-17   90  	int ret;
bdc5f300958062 Martin Sperl        2016-01-17   91  
bdc5f300958062 Martin Sperl        2016-01-17   92  	/* allocate the custom structure */
bdc5f300958062 Martin Sperl        2016-01-17   93  	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
bdc5f300958062 Martin Sperl        2016-01-17   94  	if (!data)
bdc5f300958062 Martin Sperl        2016-01-17   95  		return -ENOMEM;
bdc5f300958062 Martin Sperl        2016-01-17   96  
bdc5f300958062 Martin Sperl        2016-01-17   97  	/* initialize data */
8c3cde5dd639af Lukas Wunner        2020-01-16   98  	up.capabilities = UART_CAP_FIFO | UART_CAP_MINI;
8c3cde5dd639af Lukas Wunner        2020-01-16   99  	up.port.dev = &pdev->dev;
8c3cde5dd639af Lukas Wunner        2020-01-16  100  	up.port.type = PORT_16550;
eb687309136b9f Andy Shevchenko     2024-03-04  101  	up.port.flags = UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_SKIP_TEST | UPF_IOREMAP;
f93bf758911476 Lukas Wunner        2020-02-28 @102  	up.port.rs485_config = serial8250_em485_config;
0139da50dc53f0 Ilpo Järvinen       2022-07-04  103  	up.port.rs485_supported = serial8250_em485_supported;
f93bf758911476 Lukas Wunner        2020-02-28  104  	up.rs485_start_tx = bcm2835aux_rs485_start_tx;
f93bf758911476 Lukas Wunner        2020-02-28  105  	up.rs485_stop_tx = bcm2835aux_rs485_stop_tx;
f93bf758911476 Lukas Wunner        2020-02-28  106  
f93bf758911476 Lukas Wunner        2020-02-28  107  	/* initialize cached copy with power-on reset value */
f93bf758911476 Lukas Wunner        2020-02-28  108  	data->cntl = BCM2835_AUX_UART_CNTL_RXEN | BCM2835_AUX_UART_CNTL_TXEN;
f93bf758911476 Lukas Wunner        2020-02-28  109  
f93bf758911476 Lukas Wunner        2020-02-28  110  	platform_set_drvdata(pdev, data);
bdc5f300958062 Martin Sperl        2016-01-17  111  
bdc5f300958062 Martin Sperl        2016-01-17  112  	/* get the clock - this also enables the HW */
fcc446c8aa6303 Adrien Thierry      2022-02-07  113  	data->clk = devm_clk_get_optional(&pdev->dev, NULL);
83e571f054cd74 Stefan Wahren       2023-12-20  114  	if (IS_ERR(data->clk))
83e571f054cd74 Stefan Wahren       2023-12-20  115  		return dev_err_probe(&pdev->dev, PTR_ERR(data->clk), "could not get clk\n");
bdc5f300958062 Martin Sperl        2016-01-17  116  
bdc5f300958062 Martin Sperl        2016-01-17  117  	/* map the main registers */
bdc5f300958062 Martin Sperl        2016-01-17  118  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
bdc5f300958062 Martin Sperl        2016-01-17  119  	if (!res) {
bdc5f300958062 Martin Sperl        2016-01-17  120  		dev_err(&pdev->dev, "memory resource not found");
bdc5f300958062 Martin Sperl        2016-01-17  121  		return -EINVAL;
bdc5f300958062 Martin Sperl        2016-01-17  122  	}
fcc446c8aa6303 Adrien Thierry      2022-02-07  123  
eb687309136b9f Andy Shevchenko     2024-03-04  124  	up.port.mapbase = res->start;
eb687309136b9f Andy Shevchenko     2024-03-04  125  	up.port.mapsize = resource_size(res);
fcc446c8aa6303 Adrien Thierry      2022-02-07  126  
eb687309136b9f Andy Shevchenko     2024-03-04  127  	bcm2835_swnode = device_get_match_data(&pdev->dev);
eb687309136b9f Andy Shevchenko     2024-03-04  128  	if (bcm2835_swnode) {
eb687309136b9f Andy Shevchenko     2024-03-04  129  		ret = device_add_software_node(&pdev->dev, bcm2835_swnode);
eb687309136b9f Andy Shevchenko     2024-03-04  130  		if (ret)
eb687309136b9f Andy Shevchenko     2024-03-04  131  			return ret;
eb687309136b9f Andy Shevchenko     2024-03-04  132  	}
fcc446c8aa6303 Adrien Thierry      2022-02-07  133  
eb687309136b9f Andy Shevchenko     2024-03-04  134  	ret = uart_read_port_properties(&up.port);
eb687309136b9f Andy Shevchenko     2024-03-04  135  	if (ret)
eb687309136b9f Andy Shevchenko     2024-03-04  136  		goto rm_swnode;
bdc5f300958062 Martin Sperl        2016-01-17  137  
eb687309136b9f Andy Shevchenko     2024-03-04  138  	up.port.regshift = 2;
eb687309136b9f Andy Shevchenko     2024-03-04  139  	up.port.fifosize = 8;
bdc5f300958062 Martin Sperl        2016-01-17  140  
bdc5f300958062 Martin Sperl        2016-01-17  141  	/* enable the clock as a last step */
bdc5f300958062 Martin Sperl        2016-01-17  142  	ret = clk_prepare_enable(data->clk);
bdc5f300958062 Martin Sperl        2016-01-17  143  	if (ret) {
eb687309136b9f Andy Shevchenko     2024-03-04  144  		dev_err_probe(&pdev->dev, ret, "unable to enable uart clock\n");
eb687309136b9f Andy Shevchenko     2024-03-04  145  		goto rm_swnode;
bdc5f300958062 Martin Sperl        2016-01-17  146  	}
bdc5f300958062 Martin Sperl        2016-01-17  147  
fcc446c8aa6303 Adrien Thierry      2022-02-07  148  	uartclk = clk_get_rate(data->clk);
eb687309136b9f Andy Shevchenko     2024-03-04  149  	if (uartclk)
eb687309136b9f Andy Shevchenko     2024-03-04  150  		up.port.uartclk = uartclk;
fcc446c8aa6303 Adrien Thierry      2022-02-07  151  
bdc5f300958062 Martin Sperl        2016-01-17  152  	/* the HW-clock divider for bcm2835aux is 8,
bdc5f300958062 Martin Sperl        2016-01-17  153  	 * but 8250 expects a divider of 16,
bdc5f300958062 Martin Sperl        2016-01-17  154  	 * so we have to multiply the actual clock by 2
bdc5f300958062 Martin Sperl        2016-01-17  155  	 * to get identical baudrates.
bdc5f300958062 Martin Sperl        2016-01-17  156  	 */
eb687309136b9f Andy Shevchenko     2024-03-04  157  	up.port.uartclk *= 2;
bdc5f300958062 Martin Sperl        2016-01-17  158  
bdc5f300958062 Martin Sperl        2016-01-17  159  	/* register the port */
8c3cde5dd639af Lukas Wunner        2020-01-16  160  	ret = serial8250_register_8250_port(&up);
bdc5f300958062 Martin Sperl        2016-01-17  161  	if (ret < 0) {
ea43a60b15486b Krzysztof Kozlowski 2020-09-01  162  		dev_err_probe(&pdev->dev, ret, "unable to register 8250 port\n");
bdc5f300958062 Martin Sperl        2016-01-17  163  		goto dis_clk;
bdc5f300958062 Martin Sperl        2016-01-17  164  	}
bdc5f300958062 Martin Sperl        2016-01-17  165  	data->line = ret;
bdc5f300958062 Martin Sperl        2016-01-17  166  
bdc5f300958062 Martin Sperl        2016-01-17  167  	return 0;
bdc5f300958062 Martin Sperl        2016-01-17  168  
bdc5f300958062 Martin Sperl        2016-01-17  169  dis_clk:
bdc5f300958062 Martin Sperl        2016-01-17  170  	clk_disable_unprepare(data->clk);
eb687309136b9f Andy Shevchenko     2024-03-04  171  rm_swnode:
eb687309136b9f Andy Shevchenko     2024-03-04  172  	device_remove_software_node(&pdev->dev);
bdc5f300958062 Martin Sperl        2016-01-17  173  	return ret;
bdc5f300958062 Martin Sperl        2016-01-17  174  }
bdc5f300958062 Martin Sperl        2016-01-17  175  

:::::: The code at line 102 was first introduced by commit
:::::: f93bf75891147602d55b90937628157cc13dbdb8 serial: 8250_bcm2835aux: Support rs485 software emulation

:::::: TO: Lukas Wunner <lukas@wunner.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
