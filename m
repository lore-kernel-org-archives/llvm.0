Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E43207DFE;
	Thu, 13 Feb 2025 06:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739429692; cv=none; b=AaQeiOWzxrFTtWSnhX3OYIGOQsPEy4tiOppYaRag0VCzrzeFlucQJ/z3GRxtsiLyksYgJHMXl7Hm/AxBH3Ga25r3nLaGnELQOcefJl+fvJkcBbgDulyk1Q6uJNPtyhmKLu4z1aozgYUnP12HjDfmqIcTNDb9+TGgqmyu9QccFig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739429692; c=relaxed/simple;
	bh=OJTRaNgj7r9Nss/7kY215kokk6bEklt1IM9Y6Gc2HUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ESOLmmn/cxUs7o9DXdVOz+Xt/lorh9kFf9PMoWYYPmUpVMmS36qpRWdFDIOmMEMHk4PPGVyzZljKLyq3jSMYZbQvTC1jDayERaQCMagvOxBJ5xxq3+zNePrIj/dXGwGXxx0NPNPb5yQrgsLZy9rwghnxuhIHsXdx28givIIB2u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0qk/8ro; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0qk/8ro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739429690; x=1770965690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OJTRaNgj7r9Nss/7kY215kokk6bEklt1IM9Y6Gc2HUY=;
  b=P0qk/8roAtiOZ0U+ZSPuqB4BM8uQ6B4EakYFt6ZzpngikZ5a/E7hWm+s
   vvMGaeLX3VfTbQfUleg0uDUsE9BZXQdhJs2MNnSqGiytLaXjcBbsCMTeo
   nefyacOGlPb0/cgG1E0YoAoniDTekNhZ4oRj1AYyFCmeo3PcruoyWnG0/
   U883ptsw+3UTwO0bGluXaU5lXwjsGuEsW2U5Xy3eF6aLXtP+wjh3prIuS
   6RWEuiYLSTJ0MK9QZWkATgiV8mg2VRbfWTC4s8PBlHNlR7IKioTsjROxF
   83A+r93HawBqt3xyGPog8WjV8eMSY1krp4gt/FBk0GlZGJmoqlDDPe0n8
   A==;
X-CSE-ConnectionGUID: 1Cls3ztYSi+0StMOsAb9dQ==
X-CSE-MsgGUID: PrvI9iDnQAW6MvP9wcUotw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65471432"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="65471432"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 22:54:49 -0800
X-CSE-ConnectionGUID: W6MoEgFsSgmy7o1sYUsFCQ==
X-CSE-MsgGUID: /t6Nj6WHREmamEfw3sJNdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117164058"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Feb 2025 22:54:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiT7W-0016gP-1V;
	Thu, 13 Feb 2025 06:54:46 +0000
Date: Thu, 13 Feb 2025 14:54:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 62/69] drivers/tty/serial/amba-pl011.c:2492:35:
 error: incompatible pointer types passing 'unsigned char *' to parameter of
 type 'enum uart_iotype *'
Message-ID: <202502131406.jhirwJcu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   18719ba870f2b5aac6c4ea327aacc3bec6bc98cc
commit: 8daf2c28783ce8f643495c80b08b18862350552a [62/69] +enum uart_iotype
config: riscv-randconfig-001-20250213 (https://download.01.org/0day-ci/archive/20250213/202502131406.jhirwJcu-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131406.jhirwJcu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131406.jhirwJcu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/amba-pl011.c:2492:35: error: incompatible pointer types passing 'unsigned char *' to parameter of type 'enum uart_iotype *' [-Werror,-Wincompatible-pointer-types]
    2492 |         if (uart_parse_earlycon(options, &iotype, &addr, &options))
         |                                          ^~~~~~~
   include/linux/serial_core.h:1106:52: note: passing argument to parameter 'iotype' here
    1106 | int uart_parse_earlycon(char *p, enum uart_iotype *iotype,
         |                                                    ^
   1 error generated.


vim +2492 drivers/tty/serial/amba-pl011.c

^1da177e4c3f41 drivers/serial/amba-pl011.c     Linus Torvalds  2005-04-16  2457  
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2458  /**
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2459   *	pl011_console_match - non-standard console matching
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2460   *	@co:	  registering console
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2461   *	@name:	  name from console command line
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2462   *	@idx:	  index from console command line
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2463   *	@options: ptr to option string from console command line
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2464   *
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2465   *	Only attempts to match console command lines of the form:
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2466   *	    console=pl011,mmio|mmio32,<addr>[,<options>]
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2467   *	    console=pl011,0x<addr>[,<options>]
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2468   *	This form is used to register an initial earlycon boot console and
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2469   *	replace it with the amba_console at pl011 driver init.
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2470   *
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2471   *	Performs console setup for a match (as required by interface)
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2472   *	If no <options> are specified, then assume the h/w is already setup.
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2473   *
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2474   *	Returns 0 if console matches; otherwise non-zero to use default matching
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2475   */
27afac93e3bd7f drivers/tty/serial/amba-pl011.c Lukas Wunner    2020-08-13  2476  static int pl011_console_match(struct console *co, char *name, int idx,
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2477  			       char *options)
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2478  {
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2479  	unsigned char iotype;
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2480  	resource_size_t addr;
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2481  	int i;
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2482  
37ef38f3f83891 drivers/tty/serial/amba-pl011.c Timur Tabi      2017-07-27  2483  	/*
37ef38f3f83891 drivers/tty/serial/amba-pl011.c Timur Tabi      2017-07-27  2484  	 * Systems affected by the Qualcomm Technologies QDF2400 E44 erratum
37ef38f3f83891 drivers/tty/serial/amba-pl011.c Timur Tabi      2017-07-27  2485  	 * have a distinct console name, so make sure we check for that.
37ef38f3f83891 drivers/tty/serial/amba-pl011.c Timur Tabi      2017-07-27  2486  	 * The actual implementation of the erratum occurs in the probe
37ef38f3f83891 drivers/tty/serial/amba-pl011.c Timur Tabi      2017-07-27  2487  	 * function.
37ef38f3f83891 drivers/tty/serial/amba-pl011.c Timur Tabi      2017-07-27  2488  	 */
37ef38f3f83891 drivers/tty/serial/amba-pl011.c Timur Tabi      2017-07-27  2489  	if ((strcmp(name, "qdf2400_e44") != 0) && (strcmp(name, "pl011") != 0))
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2490  		return -ENODEV;
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2491  
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04 @2492  	if (uart_parse_earlycon(options, &iotype, &addr, &options))
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2493  		return -ENODEV;
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2494  
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2495  	if (iotype != UPIO_MEM && iotype != UPIO_MEM32)
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2496  		return -ENODEV;
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2497  
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2498  	/* try to match the port specified on the command line */
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2499  	for (i = 0; i < ARRAY_SIZE(amba_ports); i++) {
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2500  		struct uart_port *port;
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2501  
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2502  		if (!amba_ports[i])
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2503  			continue;
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2504  
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2505  		port = &amba_ports[i]->port;
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2506  
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2507  		if (port->mapbase != addr)
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2508  			continue;
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2509  
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2510  		co->index = i;
eabd4600dafacf drivers/tty/serial/amba-pl011.c John Ogness     2024-08-20  2511  		uart_port_set_cons(port, co);
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2512  		return pl011_console_setup(co, options);
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2513  	}
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2514  
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2515  	return -ENODEV;
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2516  }
10879ae5f12e9c drivers/tty/serial/amba-pl011.c Aleksey Makarov 2016-10-04  2517  

:::::: The code at line 2492 was first introduced by commit
:::::: 10879ae5f12e9cab3c4e8e9504c1aaa8a033bde7 serial: pl011: add console matching function

:::::: TO: Aleksey Makarov <aleksey.makarov@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
