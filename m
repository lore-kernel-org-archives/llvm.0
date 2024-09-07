Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26C215F323;
	Sat,  7 Sep 2024 19:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725738935; cv=none; b=EXGsVsC12zsOGlXugqSaCXlvaEKQ2hEpy4sAVOn9QC6KBO72+jzGqPX5/ZUWdlja73/WrbO4PtDfVQnZdNFoxsKCLyWj8IiK7Tims/+x8Or9oz3b3o2RFLZ7xjD2vj83COFICmz06BLkUU02FNxFWoxClJ0DvOYIsaObA8/TpJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725738935; c=relaxed/simple;
	bh=7n6EWQwZgU03/KFsnhj8RTyUIJutmHnnUlLIF354YWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxEqVYTfR1YAf0izXjqL/FITV0RlysV2Ep2ecxMzxrKoHeoZUSg20NxJQjuGowcyagEcwApMp+KTLXpGE83RPbDsl8yvdgzL8ZIB+VariFF9WpqvahUZkb3Lm38RxPTKXkLO72bUrqPYBhIngE3yJaZfTg08B8Rwnb/xZLZeBbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IdFqEK9a; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IdFqEK9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725738934; x=1757274934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7n6EWQwZgU03/KFsnhj8RTyUIJutmHnnUlLIF354YWA=;
  b=IdFqEK9aP+2v+R0EbGI4/T2+kFlOj52mEKu/CCThA0ERE6RfAmWjoE8x
   1nbTEpy1GSQ7wucwgKWD/FOze+MSc8wHBSuzxiFEpPaVd2Jqq6h9EQ/8z
   7FuuAHcPiZmwRn4kRL7ToBZv3jDnrqt5KHQtI6q7lxGnMaN0krn+R75Yk
   i5pKS0ivXEMakzqLuKCRJJQHI6GHgirT+1b9mbAc7i+1doWJNu1lIvrvq
   V+z1epV1AIajhUNFT/+JY2dqr9qehFYkEnVowDxjnQS468LVvXTRv8aMu
   27ha7gq1if45QD9zWo1JUxmnm1+OYVpXO6dazjfI5hDY6EpgkawyoLYSj
   g==;
X-CSE-ConnectionGUID: DqL48IBURmO1ItBVVFKj0g==
X-CSE-MsgGUID: YevuhzzFTYa77GwtzY/Nbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="41983409"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="41983409"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 12:55:32 -0700
X-CSE-ConnectionGUID: ztCggZawT1G5/PCpl8yM8g==
X-CSE-MsgGUID: 4YitzazjR2yA9fHC0Jwyyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="66245922"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Sep 2024 12:55:31 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn1Wq-000Cvy-2P;
	Sat, 07 Sep 2024 19:55:28 +0000
Date: Sun, 8 Sep 2024 03:55:01 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH next v1 1/2] serial: 8250: Switch to nbcon console
Message-ID: <202409080329.h0HqFuzd-lkp@intel.com>
References: <20240905134719.142554-2-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905134719.142554-2-john.ogness@linutronix.de>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on f1ec92a066b2608e7c971dfce28ebe2d2cdb056e]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Ogness/serial-8250-Switch-to-nbcon-console/20240905-214915
base:   f1ec92a066b2608e7c971dfce28ebe2d2cdb056e
patch link:    https://lore.kernel.org/r/20240905134719.142554-2-john.ogness%40linutronix.de
patch subject: [PATCH next v1 1/2] serial: 8250: Switch to nbcon console
config: x86_64-randconfig-015-20240907 (https://download.01.org/0day-ci/archive/20240908/202409080329.h0HqFuzd-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080329.h0HqFuzd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080329.h0HqFuzd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_core.c:420:2: error: call to undeclared function '__uart_port_lock_irqsave'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     420 |         __uart_port_lock_irqsave(up, flags);
         |         ^
   drivers/tty/serial/8250/8250_core.c:420:2: note: did you mean 'uart_port_lock_irqsave'?
   include/linux/serial_core.h:616:20: note: 'uart_port_lock_irqsave' declared here
     616 | static inline void uart_port_lock_irqsave(struct uart_port *up, unsigned long *flags)
         |                    ^
>> drivers/tty/serial/8250/8250_core.c:427:2: error: call to undeclared function '__uart_port_unlock_irqrestore'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     427 |         __uart_port_unlock_irqrestore(up, flags);
         |         ^
   drivers/tty/serial/8250/8250_core.c:427:2: note: did you mean 'uart_port_unlock_irqrestore'?
   include/linux/serial_core.h:667:20: note: 'uart_port_unlock_irqrestore' declared here
     667 | static inline void uart_port_unlock_irqrestore(struct uart_port *up, unsigned long flags)
         |                    ^
>> drivers/tty/serial/8250/8250_core.c:533:18: error: incompatible function pointer types initializing 'bool (*)(struct console *, struct nbcon_write_context *)' (aka '_Bool (*)(struct console *, struct nbcon_write_context *)') with an expression of type 'void (struct console *, struct nbcon_write_context *)' [-Wincompatible-function-pointer-types]
     533 |         .write_atomic   = univ8250_console_write_atomic,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_core.c:534:3: error: field designator 'write_thread' does not refer to any field in type 'struct console'
     534 |         .write_thread   = univ8250_console_write_thread,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_core.c:535:3: error: field designator 'device_lock' does not refer to any field in type 'struct console'
     535 |         .device_lock    = univ8250_console_device_lock,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_core.c:536:3: error: field designator 'device_unlock' does not refer to any field in type 'struct console'
     536 |         .device_unlock  = univ8250_console_device_unlock,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 errors generated.
--
>> drivers/tty/serial/8250/8250_port.c:3502:3: error: call to undeclared function 'nbcon_reacquire_nobuf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3502 |                 nbcon_reacquire_nobuf(wctxt);
         |                 ^
   1 error generated.


vim +/__uart_port_lock_irqsave +420 drivers/tty/serial/8250/8250_core.c

   415	
   416	static void univ8250_console_device_lock(struct console *con, unsigned long *flags)
   417	{
   418		struct uart_port *up = &serial8250_ports[con->index].port;
   419	
 > 420		__uart_port_lock_irqsave(up, flags);
   421	}
   422	
   423	static void univ8250_console_device_unlock(struct console *con, unsigned long flags)
   424	{
   425		struct uart_port *up = &serial8250_ports[con->index].port;
   426	
 > 427		__uart_port_unlock_irqrestore(up, flags);
   428	}
   429	#endif /* USE_SERIAL_8250_LEGACY_CONSOLE */
   430	
   431	static int univ8250_console_setup(struct console *co, char *options)
   432	{
   433		struct uart_8250_port *up;
   434		struct uart_port *port;
   435		int retval, i;
   436	
   437		/*
   438		 * Check whether an invalid uart number has been specified, and
   439		 * if so, search for the first available port that does have
   440		 * console support.
   441		 */
   442		if (co->index < 0 || co->index >= UART_NR)
   443			co->index = 0;
   444	
   445		/*
   446		 * If the console is past the initial isa ports, init more ports up to
   447		 * co->index as needed and increment nr_uarts accordingly.
   448		 */
   449		for (i = nr_uarts; i <= co->index; i++) {
   450			up = serial8250_setup_port(i);
   451			if (!up)
   452				return -ENODEV;
   453			nr_uarts++;
   454		}
   455	
   456		port = &serial8250_ports[co->index].port;
   457		/* link port to console */
   458		port->cons = co;
   459	
   460		retval = serial8250_console_setup(port, options, false);
   461		if (retval != 0)
   462			port->cons = NULL;
   463		return retval;
   464	}
   465	
   466	static int univ8250_console_exit(struct console *co)
   467	{
   468		struct uart_port *port;
   469	
   470		port = &serial8250_ports[co->index].port;
   471		return serial8250_console_exit(port);
   472	}
   473	
   474	/**
   475	 *	univ8250_console_match - non-standard console matching
   476	 *	@co:	  registering console
   477	 *	@name:	  name from console command line
   478	 *	@idx:	  index from console command line
   479	 *	@options: ptr to option string from console command line
   480	 *
   481	 *	Only attempts to match console command lines of the form:
   482	 *	    console=uart[8250],io|mmio|mmio16|mmio32,<addr>[,<options>]
   483	 *	    console=uart[8250],0x<addr>[,<options>]
   484	 *	This form is used to register an initial earlycon boot console and
   485	 *	replace it with the serial8250_console at 8250 driver init.
   486	 *
   487	 *	Performs console setup for a match (as required by interface)
   488	 *	If no <options> are specified, then assume the h/w is already setup.
   489	 *
   490	 *	Returns 0 if console matches; otherwise non-zero to use default matching
   491	 */
   492	static int univ8250_console_match(struct console *co, char *name, int idx,
   493					  char *options)
   494	{
   495		char match[] = "uart";	/* 8250-specific earlycon name */
   496		unsigned char iotype;
   497		resource_size_t addr;
   498		int i;
   499	
   500		if (strncmp(name, match, 4) != 0)
   501			return -ENODEV;
   502	
   503		if (uart_parse_earlycon(options, &iotype, &addr, &options))
   504			return -ENODEV;
   505	
   506		/* try to match the port specified on the command line */
   507		for (i = 0; i < nr_uarts; i++) {
   508			struct uart_port *port = &serial8250_ports[i].port;
   509	
   510			if (port->iotype != iotype)
   511				continue;
   512			if ((iotype == UPIO_MEM || iotype == UPIO_MEM16 ||
   513			     iotype == UPIO_MEM32 || iotype == UPIO_MEM32BE)
   514			    && (port->mapbase != addr))
   515				continue;
   516			if (iotype == UPIO_PORT && port->iobase != addr)
   517				continue;
   518	
   519			co->index = i;
   520			port->cons = co;
   521			return serial8250_console_setup(port, options, true);
   522		}
   523	
   524		return -ENODEV;
   525	}
   526	
   527	static struct console univ8250_console = {
   528		.name		= "ttyS",
   529	#ifdef USE_SERIAL_8250_LEGACY_CONSOLE
   530		.write		= univ8250_console_write,
   531		.flags		= CON_PRINTBUFFER | CON_ANYTIME,
   532	#else
 > 533		.write_atomic	= univ8250_console_write_atomic,
 > 534		.write_thread	= univ8250_console_write_thread,
 > 535		.device_lock	= univ8250_console_device_lock,
 > 536		.device_unlock	= univ8250_console_device_unlock,
   537		.flags		= CON_PRINTBUFFER | CON_ANYTIME | CON_NBCON,
   538	#endif
   539		.device		= uart_console_device,
   540		.setup		= univ8250_console_setup,
   541		.exit		= univ8250_console_exit,
   542		.match		= univ8250_console_match,
   543		.index		= -1,
   544		.data		= &serial8250_reg,
   545	};
   546	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
