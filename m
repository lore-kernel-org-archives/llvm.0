Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E77D48BD35;
	Wed,  7 Oct 2026 12:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376543; cv=none; b=iU6i0Z7nWqMT0q09a22nDq/0jBNDzPJP6h8cMzEevSw+c9LQvc6HSuAnph7g9qfq5OICTc1nMg9vtGJunwxuIXew+Y2vrjAdorytt383S/5i6K5tRM7fe3w7tCNl1r8HBM/wNPgqK+IUvEUhz8OR9K3qo4kHW5DicgHUtrCgrXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376543; c=relaxed/simple;
	bh=gJ/5D3aq1x8fCBIAmmwL7iuSWUA90eyWylqxYNLCDj8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=thwn2FSqPI0iUtP8z+oq2S1GBwkPnSO0ypH2N0EE6jg1OjiurhvHJIfqPh/FyO9Tsu5HCuOaQYdK82jkta5LmQpVxdcGAnDLXFQ1PkJJtLKl0QZ7+zXjEU1er30et3sgW2aaUutC3gurzUeyME7YllPg6lnIGaY9VMlX4GHst4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DcOUQuUZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DcOUQuUZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791376531; x=1822912531;
  h=date:from:to:cc:subject:message-id;
  bh=gJ/5D3aq1x8fCBIAmmwL7iuSWUA90eyWylqxYNLCDj8=;
  b=DcOUQuUZnpDjITbfgm8fH1dl6lcFRb/coBw9Sj/E5qTXotxSmVf9k/Dw
   TOIzPqSq97hFtEcAWT4egO9phiLerjuv7E6N5mp1GNWpSAK1IS3yX/ZVe
   dtalAR0fAmZbV98IgxOy8HvxTzaiZnlYCPiWXHG25vUpb7mUdMPBr1VZG
   XBvSz/RfXHSsZs+eiNsPI8hurSpAFVnbaZN1PJ+8EE0TQ7GK9SVnVZiIH
   OsKaY0AshDJZElGcr1SxRumMfTfpD9HGyKjYVv6ftcU+biw/vodm0QwPU
   5K80Uv77BRgZOaXm+2V5c99BcrgDHAbYQ8yL5b/9JgxHmDjSPATjzViQW
   Q==;
X-CSE-ConnectionGUID: vAgbsrZwTB2sfp8lassyPg==
X-CSE-MsgGUID: 2OITP3loRW2+AGh7QfcHwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="129241"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="129241"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 05:35:30 -0700
X-CSE-ConnectionGUID: Gj1MLI7uTeGJrr292zW9xQ==
X-CSE-MsgGUID: vsv3N2M9RmmoCX1u0USaKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="282244211"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Oct 2026 05:35:29 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEQrm-000000002yW-33HP;
	Wed, 07 Oct 2026 12:35:26 +0000
Date: Wed, 07 Oct 2026 20:35:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 12/45]
 drivers/tty/serial/8250/8250_airoha.c:150:6: error: incompatible pointer to
 integer conversion assigning to 'int' from 'struct uart_8250_port *'
Message-ID: <202610072051.56mbj5Nv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   576b8c5d619ed8abcc9bd2106e527d2c3aba9b2d
commit: 52a3eb3685b86cd5b44146d29ab2ec06e6f813c3 [12/45] serial8250 port operations work on struct uart_8250_port
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261007/202610072051.56mbj5Nv-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 80cd965b6323b208519f8ab1d5ee86e4ea9862f4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610072051.56mbj5Nv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610072051.56mbj5Nv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_airoha.c:150:6: error: incompatible pointer to integer conversion assigning to 'int' from 'struct uart_8250_port *' [-Wint-conversion]
     150 |         ret = serial8250_register_8250_port(&uart);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_airoha.c:164:29: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct uart_8250_port *' [-Wint-conversion]
     164 |         serial8250_unregister_port(priv->line);
         |                                    ^~~~~~~~~~
   include/linux/serial_8250.h:190:56: note: passing argument to parameter here
     190 | void serial8250_unregister_port(struct uart_8250_port *);
         |                                                        ^
   2 errors generated.


vim +150 drivers/tty/serial/8250/8250_airoha.c

92a8133c44de33 Christian Marangi 2026-08-11  117  
92a8133c44de33 Christian Marangi 2026-08-11  118  static int airoha_8250_probe(struct platform_device *pdev)
92a8133c44de33 Christian Marangi 2026-08-11  119  {
92a8133c44de33 Christian Marangi 2026-08-11  120  	struct uart_8250_port uart = { };
92a8133c44de33 Christian Marangi 2026-08-11  121  	struct device *dev = &pdev->dev;
92a8133c44de33 Christian Marangi 2026-08-11  122  	struct airoha_8250_priv *priv;
92a8133c44de33 Christian Marangi 2026-08-11  123  	struct resource *res;
92a8133c44de33 Christian Marangi 2026-08-11  124  	int ret;
92a8133c44de33 Christian Marangi 2026-08-11  125  
92a8133c44de33 Christian Marangi 2026-08-11  126  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
92a8133c44de33 Christian Marangi 2026-08-11  127  	if (!res)
92a8133c44de33 Christian Marangi 2026-08-11  128  		return dev_err_probe(dev, -EINVAL, "invalid address\n");
92a8133c44de33 Christian Marangi 2026-08-11  129  
92a8133c44de33 Christian Marangi 2026-08-11  130  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
92a8133c44de33 Christian Marangi 2026-08-11  131  	if (!priv)
92a8133c44de33 Christian Marangi 2026-08-11  132  		return -ENOMEM;
92a8133c44de33 Christian Marangi 2026-08-11  133  
92a8133c44de33 Christian Marangi 2026-08-11  134  	uart.port.dev = dev;
92a8133c44de33 Christian Marangi 2026-08-11  135  	if (device_is_compatible(dev, "airoha,an7581-hsuart"))
92a8133c44de33 Christian Marangi 2026-08-11  136  		uart.port.type = UART_PORT_AIROHA_HS;
92a8133c44de33 Christian Marangi 2026-08-11  137  	else
92a8133c44de33 Christian Marangi 2026-08-11  138  		uart.port.type = UART_PORT_AIROHA;
92a8133c44de33 Christian Marangi 2026-08-11  139  	uart.port.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT |
92a8133c44de33 Christian Marangi 2026-08-11  140  			  UPF_FIXED_TYPE | UPF_IOREMAP;
92a8133c44de33 Christian Marangi 2026-08-11  141  	uart.port.set_divisor = airoha_set_divisor;
92a8133c44de33 Christian Marangi 2026-08-11  142  	uart.port.get_divisor = airoha_get_divisor;
92a8133c44de33 Christian Marangi 2026-08-11  143  	uart.port.mapbase = res->start;
92a8133c44de33 Christian Marangi 2026-08-11  144  	uart.port.mapsize = resource_size(res);
92a8133c44de33 Christian Marangi 2026-08-11  145  
92a8133c44de33 Christian Marangi 2026-08-11  146  	ret = uart_read_and_validate_port_properties(&uart.port);
92a8133c44de33 Christian Marangi 2026-08-11  147  	if (ret)
92a8133c44de33 Christian Marangi 2026-08-11  148  		return ret;
92a8133c44de33 Christian Marangi 2026-08-11  149  
92a8133c44de33 Christian Marangi 2026-08-11 @150  	ret = serial8250_register_8250_port(&uart);
92a8133c44de33 Christian Marangi 2026-08-11  151  	if (ret < 0)
92a8133c44de33 Christian Marangi 2026-08-11  152  		return ret;
92a8133c44de33 Christian Marangi 2026-08-11  153  
92a8133c44de33 Christian Marangi 2026-08-11  154  	priv->line = ret;
92a8133c44de33 Christian Marangi 2026-08-11  155  	platform_set_drvdata(pdev, priv);
92a8133c44de33 Christian Marangi 2026-08-11  156  
92a8133c44de33 Christian Marangi 2026-08-11  157  	return 0;
92a8133c44de33 Christian Marangi 2026-08-11  158  }
92a8133c44de33 Christian Marangi 2026-08-11  159  
92a8133c44de33 Christian Marangi 2026-08-11  160  static void airoha_8250_remove(struct platform_device *ofdev)
92a8133c44de33 Christian Marangi 2026-08-11  161  {
92a8133c44de33 Christian Marangi 2026-08-11  162  	struct airoha_8250_priv *priv = platform_get_drvdata(ofdev);
92a8133c44de33 Christian Marangi 2026-08-11  163  
92a8133c44de33 Christian Marangi 2026-08-11 @164  	serial8250_unregister_port(priv->line);
92a8133c44de33 Christian Marangi 2026-08-11  165  }
92a8133c44de33 Christian Marangi 2026-08-11  166  

:::::: The code at line 150 was first introduced by commit
:::::: 92a8133c44de3340a35d638c0458886e633ba98c serial: 8250: Add Airoha SoC UART and HSUART support

:::::: TO: Christian Marangi <ansuelsmth@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
