Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C75A1392;
	Fri, 19 Jan 2024 06:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705645010; cv=none; b=NuEiCjYdb/sH3bJKqoVUijsaRx1SELbSkNtgOB8rRXvs/RHSExSarTBxTMZmzYb8tUhtPHHgq1ZCE9lve+s+ybqKWmiqnTvy/NvvwjoWGwFskabCDapym+t39luPWrjWWCGtp7lsYuvHl1M4ADAxNe9lkerJ6WN5rMm/BwkgDdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705645010; c=relaxed/simple;
	bh=AeZc1G1QZrYUhhw+2d1R1QuzWzh80Ewbyy8YHsaoZsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDXkTXumAzO1l+IYLlgU25fwZtkJKaFCP1MBikoIUxphLtBBMB5DwV1jGrn240FKwOvKV6zmFQHUwrh8OttEO8llkAq90zsPgAR9FLMcSgez+7C07qeJkV+tR/O8cLtO/5UXqDPFYHbODWIA3hr0zIIo68zkMwXPoH7ts0QpptI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZzXallnG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzXallnG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705645008; x=1737181008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AeZc1G1QZrYUhhw+2d1R1QuzWzh80Ewbyy8YHsaoZsk=;
  b=ZzXallnGA+THLs9h50B9QxVtdUJiA/HPsJPPfIP3qbfkqwT4EKUAuPCD
   8vyeW4O75th5s4vkB08VaO/PItupmiq9sNJJEv7ogwv+CV19Ee6mPCwtR
   IRaO0vHSbOz46nvKg6jhrapsXkbIF/zlppovkOWXJX4ErgHvl12XONHoc
   7pzENPoKDJ/MwXtihmSYK4HC3NTpdFmLHktZ3PobVIPD8u6jcsFoT2VYo
   UF6AsNWZ0qsE0ah3d0oX0tro2iGPeyd+mGnsbEtEQKh9azVCktG9IYhkz
   NJeDYa1qqRNBzSSFnL+fRMe64y1Foye8HdZ5gcjQDw9HvgfPSKnTDs19V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="14195111"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="14195111"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 22:16:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="497527"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jan 2024 22:16:46 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQiBH-0003hI-2l;
	Fri, 19 Jan 2024 06:16:43 +0000
Date: Fri, 19 Jan 2024 14:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RESEND RFC PATCH v1 2/2] serial/8250: Avoid getting lock in RT
 atomic context
Message-ID: <202401191330.lRpnBCKD-lkp@intel.com>
References: <20240116073701.2356171-3-leobras@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240116073701.2356171-3-leobras@redhat.com>

Hi Leonardo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 052d534373b7ed33712a63d5e17b2b6cdbce84fd]

url:    https://github.com/intel-lab-lkp/linux/commits/Leonardo-Bras/irq-spurious-Reset-irqs_unhandled-if-an-irq_thread-handles-one-IRQ-request/20240116-153933
base:   052d534373b7ed33712a63d5e17b2b6cdbce84fd
patch link:    https://lore.kernel.org/r/20240116073701.2356171-3-leobras%40redhat.com
patch subject: [RESEND RFC PATCH v1 2/2] serial/8250: Avoid getting lock in RT atomic context
config: i386-randconfig-011-20240119 (https://download.01.org/0day-ci/archive/20240119/202401191330.lRpnBCKD-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401191330.lRpnBCKD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401191330.lRpnBCKD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_port.c:3401:3: error: expected ')'
    3401 |                 locked = uart_port_trylock_irqsave(port, &flags);
         |                 ^
   drivers/tty/serial/8250/8250_port.c:3400:5: note: to match this '('
    3400 |         if (oops_in_progress || (IS_ENABLED(CONFIG_PREEMPT_RT) && in_atomic())
         |            ^
   1 error generated.


vim +3401 drivers/tty/serial/8250/8250_port.c

8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3379  
b6830f6df8914f Peter Hurley         2015-06-27  3380  /*
b6830f6df8914f Peter Hurley         2015-06-27  3381   *	Print a string to the serial port trying not to disturb
b6830f6df8914f Peter Hurley         2015-06-27  3382   *	any possible real use of the port...
b6830f6df8914f Peter Hurley         2015-06-27  3383   *
b6830f6df8914f Peter Hurley         2015-06-27  3384   *	The console_lock must be held when we get here.
bedb404e91bb29 Andy Shevchenko      2020-02-17  3385   *
bedb404e91bb29 Andy Shevchenko      2020-02-17  3386   *	Doing runtime PM is really a bad idea for the kernel console.
bedb404e91bb29 Andy Shevchenko      2020-02-17  3387   *	Thus, we assume the function is called when device is powered up.
b6830f6df8914f Peter Hurley         2015-06-27  3388   */
b6830f6df8914f Peter Hurley         2015-06-27  3389  void serial8250_console_write(struct uart_8250_port *up, const char *s,
b6830f6df8914f Peter Hurley         2015-06-27  3390  			      unsigned int count)
b6830f6df8914f Peter Hurley         2015-06-27  3391  {
7f9803072ff636 Lukas Wunner         2020-02-28  3392  	struct uart_8250_em485 *em485 = up->em485;
b6830f6df8914f Peter Hurley         2015-06-27  3393  	struct uart_port *port = &up->port;
b6830f6df8914f Peter Hurley         2015-06-27  3394  	unsigned long flags;
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3395  	unsigned int ier, use_fifo;
b6830f6df8914f Peter Hurley         2015-06-27  3396  	int locked = 1;
b6830f6df8914f Peter Hurley         2015-06-27  3397  
b6830f6df8914f Peter Hurley         2015-06-27  3398  	touch_nmi_watchdog();
b6830f6df8914f Peter Hurley         2015-06-27  3399  
5194c99b116191 Leonardo Bras        2024-01-16  3400  	if (oops_in_progress || (IS_ENABLED(CONFIG_PREEMPT_RT) && in_atomic())
e8f87d3c335702 Thomas Gleixner      2023-09-14 @3401  		locked = uart_port_trylock_irqsave(port, &flags);
b6830f6df8914f Peter Hurley         2015-06-27  3402  	else
e8f87d3c335702 Thomas Gleixner      2023-09-14  3403  		uart_port_lock_irqsave(port, &flags);
b6830f6df8914f Peter Hurley         2015-06-27  3404  
b6830f6df8914f Peter Hurley         2015-06-27  3405  	/*
b6830f6df8914f Peter Hurley         2015-06-27  3406  	 *	First save the IER then disable the interrupts
b6830f6df8914f Peter Hurley         2015-06-27  3407  	 */
b6830f6df8914f Peter Hurley         2015-06-27  3408  	ier = serial_port_in(port, UART_IER);
a3911f6ea5542d Ilpo Järvinen        2022-08-16  3409  	serial8250_clear_IER(up);
b6830f6df8914f Peter Hurley         2015-06-27  3410  
b6830f6df8914f Peter Hurley         2015-06-27  3411  	/* check scratch reg to see if port powered off during system sleep */
b6830f6df8914f Peter Hurley         2015-06-27  3412  	if (up->canary && (up->canary != serial_port_in(port, UART_SCR))) {
10791233e98fbd Peter Hurley         2015-09-25  3413  		serial8250_console_restore(up);
b6830f6df8914f Peter Hurley         2015-06-27  3414  		up->canary = 0;
b6830f6df8914f Peter Hurley         2015-06-27  3415  	}
b6830f6df8914f Peter Hurley         2015-06-27  3416  
7f9803072ff636 Lukas Wunner         2020-02-28  3417  	if (em485) {
7f9803072ff636 Lukas Wunner         2020-02-28  3418  		if (em485->tx_stopped)
7f9803072ff636 Lukas Wunner         2020-02-28  3419  			up->rs485_start_tx(up);
7f9803072ff636 Lukas Wunner         2020-02-28  3420  		mdelay(port->rs485.delay_rts_before_send);
7f9803072ff636 Lukas Wunner         2020-02-28  3421  	}
7f9803072ff636 Lukas Wunner         2020-02-28  3422  
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3423  	use_fifo = (up->capabilities & UART_CAP_FIFO) &&
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3424  		/*
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3425  		 * BCM283x requires to check the fifo
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3426  		 * after each byte.
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3427  		 */
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3428  		!(up->capabilities & UART_CAP_MINI) &&
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3429  		/*
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3430  		 * tx_loadsz contains the transmit fifo size
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3431  		 */
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3432  		up->tx_loadsz > 1 &&
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3433  		(up->fcr & UART_FCR_ENABLE_FIFO) &&
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3434  		port->state &&
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3435  		test_bit(TTY_PORT_INITIALIZED, &port->state->port.iflags) &&
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3436  		/*
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3437  		 * After we put a data in the fifo, the controller will send
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3438  		 * it regardless of the CTS state. Therefore, only use fifo
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3439  		 * if we don't use control flow.
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3440  		 */
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3441  		!(up->port.flags & UPF_CONS_FLOW);
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3442  
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3443  	if (likely(use_fifo))
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3444  		serial8250_console_fifo_write(up, s, count);
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3445  	else
b6830f6df8914f Peter Hurley         2015-06-27  3446  		uart_console_write(port, s, count, serial8250_console_putchar);
b6830f6df8914f Peter Hurley         2015-06-27  3447  
b6830f6df8914f Peter Hurley         2015-06-27  3448  	/*
b6830f6df8914f Peter Hurley         2015-06-27  3449  	 *	Finally, wait for transmitter to become empty
b6830f6df8914f Peter Hurley         2015-06-27  3450  	 *	and restore the IER
b6830f6df8914f Peter Hurley         2015-06-27  3451  	 */
34619de1b8cb52 Ilpo Järvinen        2022-06-24  3452  	wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
b6830f6df8914f Peter Hurley         2015-06-27  3453  
7f9803072ff636 Lukas Wunner         2020-02-28  3454  	if (em485) {
4e36f94e996ebe Lukas Wunner         2020-03-27  3455  		mdelay(port->rs485.delay_rts_after_send);
7f9803072ff636 Lukas Wunner         2020-02-28  3456  		if (em485->tx_stopped)
7f9803072ff636 Lukas Wunner         2020-02-28  3457  			up->rs485_stop_tx(up);
7f9803072ff636 Lukas Wunner         2020-02-28  3458  	}
7f9803072ff636 Lukas Wunner         2020-02-28  3459  
8d5b305484e8a3 Lukas Wunner         2020-03-27  3460  	serial_port_out(port, UART_IER, ier);
8d5b305484e8a3 Lukas Wunner         2020-03-27  3461  
b6830f6df8914f Peter Hurley         2015-06-27  3462  	/*
b6830f6df8914f Peter Hurley         2015-06-27  3463  	 *	The receive handling will happen properly because the
b6830f6df8914f Peter Hurley         2015-06-27  3464  	 *	receive ready bit will still be set; it is not cleared
b6830f6df8914f Peter Hurley         2015-06-27  3465  	 *	on read.  However, modem control will not, we must
b6830f6df8914f Peter Hurley         2015-06-27  3466  	 *	call it if we have saved something in the saved flags
b6830f6df8914f Peter Hurley         2015-06-27  3467  	 *	while processing with interrupts off.
b6830f6df8914f Peter Hurley         2015-06-27  3468  	 */
b6830f6df8914f Peter Hurley         2015-06-27  3469  	if (up->msr_saved_flags)
b6830f6df8914f Peter Hurley         2015-06-27  3470  		serial8250_modem_status(up);
b6830f6df8914f Peter Hurley         2015-06-27  3471  
b6830f6df8914f Peter Hurley         2015-06-27  3472  	if (locked)
e8f87d3c335702 Thomas Gleixner      2023-09-14  3473  		uart_port_unlock_irqrestore(port, flags);
b6830f6df8914f Peter Hurley         2015-06-27  3474  }
b6830f6df8914f Peter Hurley         2015-06-27  3475  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
