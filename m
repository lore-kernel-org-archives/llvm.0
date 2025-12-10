Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DBA32470A;
	Wed, 10 Dec 2025 13:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765372279; cv=none; b=L7XSTVpmTAI5dXFu9qcH9o0vufx0o2xYluN1R5jfCQmP+cn2hA3kbDlnAxLbYecLfzBkVeRZXhWcrkwNCyqccbErGq5Ap2gq/2EmgVtXb9QK4eZwyPLnbUqWodFdFeSsCEEqnkya9yJ9O/H/pIcmBZRaF3mDQRwQ/r88MFXLHtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765372279; c=relaxed/simple;
	bh=Vj5yH8CGWuVnIpRJvqMnXm6tf2+ZTEDSbdcuerMHdyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PHkGtvSXhfJ3XFoOO/gdWcWcxVL4mSWcyC8eNHCoQzYx4A77TfFJud/0HEKBHTUIIjfpzuC15Tx7n497DtxiSs4rE9fatWpxHI6s8sASEi2hpcLEIaY467cpgmLY7zB+maABMYTZSCH3qc/lgO8gVtaehU3Tn6qCXtI6q9IWIVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBPpCD7R; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBPpCD7R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765372277; x=1796908277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vj5yH8CGWuVnIpRJvqMnXm6tf2+ZTEDSbdcuerMHdyE=;
  b=BBPpCD7R+ME9bjEvoyzXTwPaYkPZDVWIvCOBG9FmC3GiEXt4tGECEguN
   E5I4MELhWtcKbcR//s6Umzats5FBRR4cOPOpAnZf7r2YqCxSHXfqPUJ5y
   fyV5oF9X036HB0Ijf0kwL2zZ8iY8JSirxeZ21BdCaGYXez/uvPO8RjZWW
   DmEWpsAicSgmydEjPcy8Ey0qIS2wgzMbid2TgAS5tIsXvcnKLeZV2W5h5
   nk96eGfDbruKxBJj+k4ceDb+/WopN7pvorl4N44D5uvU7aCwHaZ0+irQb
   zcp1lnCFQLndeUHs+D+bKalK97lnVxjFyk7GJOOoQ+CkBWNd+8FfYl7zs
   Q==;
X-CSE-ConnectionGUID: BAaKD5GuSaixbJ0f+rtVtw==
X-CSE-MsgGUID: 0hAdwq9+QcmBpWbAK+Hdig==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="70964535"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="70964535"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 05:11:17 -0800
X-CSE-ConnectionGUID: djDK5mEVTvaKxWBIO9aKcw==
X-CSE-MsgGUID: 70Bl8MyMTlybm0oW4YyEgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="196109408"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Dec 2025 05:11:15 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTJyL-000000003D3-0HZC;
	Wed, 10 Dec 2025 13:11:13 +0000
Date: Wed, 10 Dec 2025 21:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 9/31]
 drivers/tty/serial/8250/8250_loongson.c:164:6: error: incompatible pointer
 to integer conversion assigning to 'int' from 'struct uart_8250_port *'
Message-ID: <202512102104.IujMeZkR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   aaa90151bf411e640973aee67d80cf7c4c5e41ff
commit: 9013ba9b551281e9ea894b2e1af15af0c3db6f77 [9/31] serial8250 port operations work on struct uart_8250_port
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20251210/202512102104.IujMeZkR-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512102104.IujMeZkR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512102104.IujMeZkR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/tty/serial/8250/8250_loongson.c:13:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/tty/serial/8250/8250_loongson.c:164:6: error: incompatible pointer to integer conversion assigning to 'int' from 'struct uart_8250_port *' [-Wint-conversion]
     164 |         ret = serial8250_register_8250_port(&uart);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_loongson.c:180:29: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct uart_8250_port *' [-Wint-conversion]
     180 |         serial8250_unregister_port(priv->line);
         |                                    ^~~~~~~~~~
   include/linux/serial_8250.h:178:56: note: passing argument to parameter here
     178 | void serial8250_unregister_port(struct uart_8250_port *);
         |                                                        ^
   drivers/tty/serial/8250/8250_loongson.c:189:26: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct uart_8250_port *' [-Wint-conversion]
     189 |         serial8250_suspend_port(priv->line);
         |                                 ^~~~~~~~~~
   include/linux/serial_8250.h:179:53: note: passing argument to parameter here
     179 | void serial8250_suspend_port(struct uart_8250_port *);
         |                                                     ^
   drivers/tty/serial/8250/8250_loongson.c:209:25: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct uart_8250_port *' [-Wint-conversion]
     209 |         serial8250_resume_port(priv->line);
         |                                ^~~~~~~~~~
   include/linux/serial_8250.h:180:52: note: passing argument to parameter here
     180 | void serial8250_resume_port(struct uart_8250_port *);
         |                                                    ^
   1 warning and 4 errors generated.


vim +164 drivers/tty/serial/8250/8250_loongson.c

25e95d76317685 Binbin Zhou 2025-10-11  106  
25e95d76317685 Binbin Zhou 2025-10-11  107  static int loongson_uart_probe(struct platform_device *pdev)
25e95d76317685 Binbin Zhou 2025-10-11  108  {
25e95d76317685 Binbin Zhou 2025-10-11  109  	struct device *dev = &pdev->dev;
25e95d76317685 Binbin Zhou 2025-10-11  110  	struct uart_8250_port uart = {};
25e95d76317685 Binbin Zhou 2025-10-11  111  	struct loongson_uart_priv *priv;
25e95d76317685 Binbin Zhou 2025-10-11  112  	struct uart_port *port;
25e95d76317685 Binbin Zhou 2025-10-11  113  	int ret;
25e95d76317685 Binbin Zhou 2025-10-11  114  
25e95d76317685 Binbin Zhou 2025-10-11  115  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
25e95d76317685 Binbin Zhou 2025-10-11  116  	if (!priv)
25e95d76317685 Binbin Zhou 2025-10-11  117  		return -ENOMEM;
25e95d76317685 Binbin Zhou 2025-10-11  118  
25e95d76317685 Binbin Zhou 2025-10-11  119  	priv->ddata = device_get_match_data(dev);
25e95d76317685 Binbin Zhou 2025-10-11  120  
25e95d76317685 Binbin Zhou 2025-10-11  121  	port = &uart.port;
25e95d76317685 Binbin Zhou 2025-10-11  122  	spin_lock_init(&port->lock);
25e95d76317685 Binbin Zhou 2025-10-11  123  	port->flags = UPF_SHARE_IRQ | UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_IOREMAP;
25e95d76317685 Binbin Zhou 2025-10-11  124  	port->iotype = UPIO_MEM;
25e95d76317685 Binbin Zhou 2025-10-11  125  	port->regshift = 0;
25e95d76317685 Binbin Zhou 2025-10-11  126  	port->dev = dev;
25e95d76317685 Binbin Zhou 2025-10-11  127  	port->type = PORT_16550A;
25e95d76317685 Binbin Zhou 2025-10-11  128  	port->private_data = priv;
25e95d76317685 Binbin Zhou 2025-10-11  129  
25e95d76317685 Binbin Zhou 2025-10-11  130  	port->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &priv->res);
25e95d76317685 Binbin Zhou 2025-10-11  131  	if (!port->membase)
25e95d76317685 Binbin Zhou 2025-10-11  132  		return -ENOMEM;
25e95d76317685 Binbin Zhou 2025-10-11  133  
25e95d76317685 Binbin Zhou 2025-10-11  134  	port->mapbase = priv->res->start;
25e95d76317685 Binbin Zhou 2025-10-11  135  	port->mapsize = resource_size(priv->res);
25e95d76317685 Binbin Zhou 2025-10-11  136  	port->serial_in = loongson_serial_in;
25e95d76317685 Binbin Zhou 2025-10-11  137  	port->serial_out = loongson_serial_out;
25e95d76317685 Binbin Zhou 2025-10-11  138  
25e95d76317685 Binbin Zhou 2025-10-11  139  	if (priv->ddata->has_frac) {
25e95d76317685 Binbin Zhou 2025-10-11  140  		port->get_divisor = loongson_frac_get_divisor;
25e95d76317685 Binbin Zhou 2025-10-11  141  		port->set_divisor = loongson_frac_set_divisor;
25e95d76317685 Binbin Zhou 2025-10-11  142  	}
25e95d76317685 Binbin Zhou 2025-10-11  143  
25e95d76317685 Binbin Zhou 2025-10-11  144  	ret = uart_read_port_properties(port);
25e95d76317685 Binbin Zhou 2025-10-11  145  	if (ret)
25e95d76317685 Binbin Zhou 2025-10-11  146  		return ret;
25e95d76317685 Binbin Zhou 2025-10-11  147  
25e95d76317685 Binbin Zhou 2025-10-11  148  	if (!port->uartclk) {
25e95d76317685 Binbin Zhou 2025-10-11  149  		priv->clk = devm_clk_get_enabled(dev, NULL);
25e95d76317685 Binbin Zhou 2025-10-11  150  		if (IS_ERR(priv->clk))
25e95d76317685 Binbin Zhou 2025-10-11  151  			return dev_err_probe(dev, PTR_ERR(priv->clk),
25e95d76317685 Binbin Zhou 2025-10-11  152  					     "Unable to determine clock frequency!\n");
25e95d76317685 Binbin Zhou 2025-10-11  153  		port->uartclk = clk_get_rate(priv->clk);
25e95d76317685 Binbin Zhou 2025-10-11  154  	}
25e95d76317685 Binbin Zhou 2025-10-11  155  
25e95d76317685 Binbin Zhou 2025-10-11  156  	priv->rst = devm_reset_control_get_optional_shared(dev, NULL);
25e95d76317685 Binbin Zhou 2025-10-11  157  	if (IS_ERR(priv->rst))
25e95d76317685 Binbin Zhou 2025-10-11  158  		return PTR_ERR(priv->rst);
25e95d76317685 Binbin Zhou 2025-10-11  159  
25e95d76317685 Binbin Zhou 2025-10-11  160  	ret = reset_control_deassert(priv->rst);
25e95d76317685 Binbin Zhou 2025-10-11  161  	if (ret)
25e95d76317685 Binbin Zhou 2025-10-11  162  		return ret;
25e95d76317685 Binbin Zhou 2025-10-11  163  
25e95d76317685 Binbin Zhou 2025-10-11 @164  	ret = serial8250_register_8250_port(&uart);
25e95d76317685 Binbin Zhou 2025-10-11  165  	if (ret < 0) {
25e95d76317685 Binbin Zhou 2025-10-11  166  		reset_control_assert(priv->rst);
25e95d76317685 Binbin Zhou 2025-10-11  167  		return ret;
25e95d76317685 Binbin Zhou 2025-10-11  168  	}
25e95d76317685 Binbin Zhou 2025-10-11  169  
25e95d76317685 Binbin Zhou 2025-10-11  170  	priv->line = ret;
25e95d76317685 Binbin Zhou 2025-10-11  171  	platform_set_drvdata(pdev, priv);
25e95d76317685 Binbin Zhou 2025-10-11  172  
25e95d76317685 Binbin Zhou 2025-10-11  173  	return 0;
25e95d76317685 Binbin Zhou 2025-10-11  174  }
25e95d76317685 Binbin Zhou 2025-10-11  175  
25e95d76317685 Binbin Zhou 2025-10-11  176  static void loongson_uart_remove(struct platform_device *pdev)
25e95d76317685 Binbin Zhou 2025-10-11  177  {
25e95d76317685 Binbin Zhou 2025-10-11  178  	struct loongson_uart_priv *priv = platform_get_drvdata(pdev);
25e95d76317685 Binbin Zhou 2025-10-11  179  
25e95d76317685 Binbin Zhou 2025-10-11 @180  	serial8250_unregister_port(priv->line);
25e95d76317685 Binbin Zhou 2025-10-11  181  	reset_control_assert(priv->rst);
25e95d76317685 Binbin Zhou 2025-10-11  182  }
25e95d76317685 Binbin Zhou 2025-10-11  183  

:::::: The code at line 164 was first introduced by commit
:::::: 25e95d763176854e961aaf0f8a76f435f2dab974 serial: 8250: Add Loongson uart driver support

:::::: TO: Binbin Zhou <zhoubinbin@loongson.cn>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
