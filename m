Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D8D14884C;
	Wed,  7 May 2025 05:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596690; cv=none; b=d9FTOAI2hC15qa/o8ydZ7yDSynZnjjaNcfh8IHkgZP4kHPTXA/7af5QQLSYSWqVV3w+iYpRVCCcQ4nA2KWdNpS9Nfvr4XK/7OJu0imJ0IjkWxCljyEfTrzOmeUW5WO6Hd+dt5xtMtkcpW2QIxC0vOsbz1E8JNdiAWUVJJF4Semw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596690; c=relaxed/simple;
	bh=EKOEfRzFFD9yPjUWheo4yiF+8HhuFyRZLbYdHWVv3L4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dXvRPMQHS/dsSFheyPreUztRQ+SpC8HRXtJESYh29EGEq2CJutw7wzJCvK1181i4GZFrf/SXTi2UTrkdjXKvoVClR/et77CNhs9mccbMdyKa0p6uRWUZnpDytdl0y1VWfPd9CIpZP8Rr4i6zW1p2eDW37G6Xp1TOXTMrLXeGBR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1O9zx53; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1O9zx53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746596688; x=1778132688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EKOEfRzFFD9yPjUWheo4yiF+8HhuFyRZLbYdHWVv3L4=;
  b=b1O9zx53VpOumeJunOuFCuFAgAdnJeelrtKAzr1bSbiJ7SH0LRz6srzL
   1ExnXvmDGtuJaL0nRbaDHHTL/WIJSoiqjxHVJz6rsvTpUhKMEdR1ax355
   d6YNGPXTHyNarkVi+g5wS89Rm7rJHHS15lAQUZjNeu+O0CwvayQ9rqY23
   8WFe3mG552hDJ8jh9cPsc4FYmDKVWZmtDttWLLJMn69A3y/YahTPq//0Y
   IyugcqOyuO5WAs8HIH2PwZSFZYjUjm2VB82tmWxWi001xoJ8FUw4IRXC9
   W0nEjlX+XtWiqyv//QZIlEdg69w43btuGzi9Ygab5+fjqv6qHNh+HXvv/
   w==;
X-CSE-ConnectionGUID: XqCgmbdtRJ6syKWOJO3iag==
X-CSE-MsgGUID: 5iTn0TIqRx2DpV7emAA3uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48202520"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48202520"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:44:47 -0700
X-CSE-ConnectionGUID: HfLISBbESUCvOmMLJOCM/g==
X-CSE-MsgGUID: lsfY1u5TREGdjzG+WMaq4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135844092"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 May 2025 22:44:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXaF-00076L-2j;
	Wed, 07 May 2025 05:44:43 +0000
Date: Wed, 7 May 2025 13:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 61/87] drivers/tty/serial/8250/8250_port.c:2271:2:
 error: call to undeclared function 'rsa_enable'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202505071306.N7wijpKF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiri,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   6c308d0b04c8c17ab39fcf6d4ed9a9033efc363f
commit: dae6489d5a6413d77f80741075bad4055594cb59 [61/87] 8250: put RSA functions to their namespace
config: x86_64-buildonly-randconfig-005-20250429 (https://download.01.org/0day-ci/archive/20250507/202505071306.N7wijpKF-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071306.N7wijpKF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071306.N7wijpKF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_port.c:809:54: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     809 | static inline void enable_rsa(struct uart_8250_port *) {}
         |                                                      ^
   drivers/tty/serial/8250/8250_port.c:810:55: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     810 | static inline void disable_rsa(struct uart_8250_port *) {}
         |                                                       ^
   drivers/tty/serial/8250/8250_port.c:811:58: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     811 | static inline void rsa_autoconfig(struct uart_8250_port *) {}
         |                                                          ^
   drivers/tty/serial/8250/8250_port.c:812:53: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     812 | static inline void rsa_reset(struct uart_8250_port *) {}
         |                                                     ^
>> drivers/tty/serial/8250/8250_port.c:2271:2: error: call to undeclared function 'rsa_enable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2271 |         rsa_enable(up);
         |         ^
   drivers/tty/serial/8250/8250_port.c:2271:2: note: did you mean 'sme_enable'?
   arch/x86/include/asm/mem_encrypt.h:51:6: note: 'sme_enable' declared here
      51 | void sme_enable(struct boot_params *bp);
         |      ^
>> drivers/tty/serial/8250/8250_port.c:2538:2: error: call to undeclared function 'rsa_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2538 |         rsa_disable(up);
         |         ^
   4 warnings and 2 errors generated.


vim +/rsa_enable +2271 drivers/tty/serial/8250/8250_port.c

  2212	
  2213	int serial8250_do_startup(struct uart_port *port)
  2214	{
  2215		struct uart_8250_port *up = up_to_u8250p(port);
  2216		unsigned long flags;
  2217		unsigned char iir;
  2218		int retval;
  2219		u16 lsr;
  2220	
  2221		if (!port->fifosize)
  2222			port->fifosize = uart_config[port->type].fifo_size;
  2223		if (!up->tx_loadsz)
  2224			up->tx_loadsz = uart_config[port->type].tx_loadsz;
  2225		if (!up->capabilities)
  2226			up->capabilities = uart_config[port->type].flags;
  2227		up->mcr = 0;
  2228	
  2229		if (port->iotype != up->cur_iotype)
  2230			set_io_from_upio(port);
  2231	
  2232		serial8250_rpm_get(up);
  2233		if (port->type == PORT_16C950) {
  2234			/*
  2235			 * Wake up and initialize UART
  2236			 *
  2237			 * Synchronize UART_IER access against the console.
  2238			 */
  2239			uart_port_lock_irqsave(port, &flags);
  2240			up->acr = 0;
  2241			serial_port_out(port, UART_LCR, UART_LCR_CONF_MODE_B);
  2242			serial_port_out(port, UART_EFR, UART_EFR_ECB);
  2243			serial_port_out(port, UART_IER, 0);
  2244			serial_port_out(port, UART_LCR, 0);
  2245			serial_icr_write(up, UART_CSR, 0); /* Reset the UART */
  2246			serial_port_out(port, UART_LCR, UART_LCR_CONF_MODE_B);
  2247			serial_port_out(port, UART_EFR, UART_EFR_ECB);
  2248			serial_port_out(port, UART_LCR, 0);
  2249			uart_port_unlock_irqrestore(port, flags);
  2250		}
  2251	
  2252		if (port->type == PORT_DA830) {
  2253			/*
  2254			 * Reset the port
  2255			 *
  2256			 * Synchronize UART_IER access against the console.
  2257			 */
  2258			uart_port_lock_irqsave(port, &flags);
  2259			serial_port_out(port, UART_IER, 0);
  2260			serial_port_out(port, UART_DA830_PWREMU_MGMT, 0);
  2261			uart_port_unlock_irqrestore(port, flags);
  2262			mdelay(10);
  2263	
  2264			/* Enable Tx, Rx and free run mode */
  2265			serial_port_out(port, UART_DA830_PWREMU_MGMT,
  2266					UART_DA830_PWREMU_MGMT_UTRST |
  2267					UART_DA830_PWREMU_MGMT_URRST |
  2268					UART_DA830_PWREMU_MGMT_FREE);
  2269		}
  2270	
> 2271		rsa_enable(up);
  2272	
  2273		/*
  2274		 * Clear the FIFO buffers and disable them.
  2275		 * (they will be reenabled in set_termios())
  2276		 */
  2277		serial8250_clear_fifos(up);
  2278	
  2279		/*
  2280		 * Clear the interrupt registers.
  2281		 */
  2282		serial_port_in(port, UART_LSR);
  2283		serial_port_in(port, UART_RX);
  2284		serial_port_in(port, UART_IIR);
  2285		serial_port_in(port, UART_MSR);
  2286	
  2287		/*
  2288		 * At this point, there's no way the LSR could still be 0xff;
  2289		 * if it is, then bail out, because there's likely no UART
  2290		 * here.
  2291		 */
  2292		if (!(port->flags & UPF_BUGGY_UART) &&
  2293		    (serial_port_in(port, UART_LSR) == 0xff)) {
  2294			dev_info_ratelimited(port->dev, "LSR safety check engaged!\n");
  2295			retval = -ENODEV;
  2296			goto out;
  2297		}
  2298	
  2299		/*
  2300		 * For a XR16C850, we need to set the trigger levels
  2301		 */
  2302		if (port->type == PORT_16850) {
  2303			unsigned char fctr;
  2304	
  2305			serial_out(up, UART_LCR, UART_LCR_CONF_MODE_B);
  2306	
  2307			fctr = serial_in(up, UART_FCTR) & ~(UART_FCTR_RX|UART_FCTR_TX);
  2308			serial_port_out(port, UART_FCTR,
  2309					fctr | UART_FCTR_TRGD | UART_FCTR_RX);
  2310			serial_port_out(port, UART_TRG, UART_TRG_96);
  2311			serial_port_out(port, UART_FCTR,
  2312					fctr | UART_FCTR_TRGD | UART_FCTR_TX);
  2313			serial_port_out(port, UART_TRG, UART_TRG_96);
  2314	
  2315			serial_port_out(port, UART_LCR, 0);
  2316		}
  2317	
  2318		/*
  2319		 * For the Altera 16550 variants, set TX threshold trigger level.
  2320		 */
  2321		if (((port->type == PORT_ALTR_16550_F32) ||
  2322		     (port->type == PORT_ALTR_16550_F64) ||
  2323		     (port->type == PORT_ALTR_16550_F128)) && (port->fifosize > 1)) {
  2324			/* Bounds checking of TX threshold (valid 0 to fifosize-2) */
  2325			if ((up->tx_loadsz < 2) || (up->tx_loadsz > port->fifosize)) {
  2326				dev_err(port->dev, "TX FIFO Threshold errors, skipping\n");
  2327			} else {
  2328				serial_port_out(port, UART_ALTR_AFR,
  2329						UART_ALTR_EN_TXFIFO_LW);
  2330				serial_port_out(port, UART_ALTR_TX_LOW,
  2331						port->fifosize - up->tx_loadsz);
  2332				port->handle_irq = serial8250_tx_threshold_handle_irq;
  2333			}
  2334		}
  2335	
  2336		/* Check if we need to have shared IRQs */
  2337		if (port->irq && (up->port.flags & UPF_SHARE_IRQ))
  2338			up->port.irqflags |= IRQF_SHARED;
  2339	
  2340		retval = up->ops->setup_irq(up);
  2341		if (retval)
  2342			goto out;
  2343	
  2344		if (port->irq && !(up->port.flags & UPF_NO_THRE_TEST)) {
  2345			unsigned char iir1;
  2346	
  2347			if (port->irqflags & IRQF_SHARED)
  2348				disable_irq_nosync(port->irq);
  2349	
  2350			/*
  2351			 * Test for UARTs that do not reassert THRE when the
  2352			 * transmitter is idle and the interrupt has already
  2353			 * been cleared.  Real 16550s should always reassert
  2354			 * this interrupt whenever the transmitter is idle and
  2355			 * the interrupt is enabled.  Delays are necessary to
  2356			 * allow register changes to become visible.
  2357			 *
  2358			 * Synchronize UART_IER access against the console.
  2359			 */
  2360			uart_port_lock_irqsave(port, &flags);
  2361	
  2362			wait_for_xmitr(up, UART_LSR_THRE);
  2363			serial_port_out_sync(port, UART_IER, UART_IER_THRI);
  2364			udelay(1); /* allow THRE to set */
  2365			iir1 = serial_port_in(port, UART_IIR);
  2366			serial_port_out(port, UART_IER, 0);
  2367			serial_port_out_sync(port, UART_IER, UART_IER_THRI);
  2368			udelay(1); /* allow a working UART time to re-assert THRE */
  2369			iir = serial_port_in(port, UART_IIR);
  2370			serial_port_out(port, UART_IER, 0);
  2371	
  2372			uart_port_unlock_irqrestore(port, flags);
  2373	
  2374			if (port->irqflags & IRQF_SHARED)
  2375				enable_irq(port->irq);
  2376	
  2377			/*
  2378			 * If the interrupt is not reasserted, or we otherwise
  2379			 * don't trust the iir, setup a timer to kick the UART
  2380			 * on a regular basis.
  2381			 */
  2382			if ((!(iir1 & UART_IIR_NO_INT) && (iir & UART_IIR_NO_INT)) ||
  2383			    up->port.flags & UPF_BUG_THRE) {
  2384				up->bugs |= UART_BUG_THRE;
  2385			}
  2386		}
  2387	
  2388		up->ops->setup_timer(up);
  2389	
  2390		/*
  2391		 * Now, initialize the UART
  2392		 */
  2393		serial_port_out(port, UART_LCR, UART_LCR_WLEN8);
  2394	
  2395		uart_port_lock_irqsave(port, &flags);
  2396		if (up->port.flags & UPF_FOURPORT) {
  2397			if (!up->port.irq)
  2398				up->port.mctrl |= TIOCM_OUT1;
  2399		} else
  2400			/*
  2401			 * Most PC uarts need OUT2 raised to enable interrupts.
  2402			 */
  2403			if (port->irq)
  2404				up->port.mctrl |= TIOCM_OUT2;
  2405	
  2406		serial8250_set_mctrl(port, port->mctrl);
  2407	
  2408		/*
  2409		 * Serial over Lan (SoL) hack:
  2410		 * Intel 8257x Gigabit ethernet chips have a 16550 emulation, to be
  2411		 * used for Serial Over Lan.  Those chips take a longer time than a
  2412		 * normal serial device to signalize that a transmission data was
  2413		 * queued. Due to that, the above test generally fails. One solution
  2414		 * would be to delay the reading of iir. However, this is not
  2415		 * reliable, since the timeout is variable. So, let's just don't
  2416		 * test if we receive TX irq.  This way, we'll never enable
  2417		 * UART_BUG_TXEN.
  2418		 */
  2419		if (!(up->port.quirks & UPQ_NO_TXEN_TEST)) {
  2420			/*
  2421			 * Do a quick test to see if we receive an interrupt when we
  2422			 * enable the TX irq.
  2423			 */
  2424			serial_port_out(port, UART_IER, UART_IER_THRI);
  2425			lsr = serial_port_in(port, UART_LSR);
  2426			iir = serial_port_in(port, UART_IIR);
  2427			serial_port_out(port, UART_IER, 0);
  2428	
  2429			if (lsr & UART_LSR_TEMT && iir & UART_IIR_NO_INT) {
  2430				if (!(up->bugs & UART_BUG_TXEN)) {
  2431					up->bugs |= UART_BUG_TXEN;
  2432					dev_dbg(port->dev, "enabling bad tx status workarounds\n");
  2433				}
  2434			} else {
  2435				up->bugs &= ~UART_BUG_TXEN;
  2436			}
  2437		}
  2438	
  2439		uart_port_unlock_irqrestore(port, flags);
  2440	
  2441		/*
  2442		 * Clear the interrupt registers again for luck, and clear the
  2443		 * saved flags to avoid getting false values from polling
  2444		 * routines or the previous session.
  2445		 */
  2446		serial_port_in(port, UART_LSR);
  2447		serial_port_in(port, UART_RX);
  2448		serial_port_in(port, UART_IIR);
  2449		serial_port_in(port, UART_MSR);
  2450		up->lsr_saved_flags = 0;
  2451		up->msr_saved_flags = 0;
  2452	
  2453		/*
  2454		 * Request DMA channels for both RX and TX.
  2455		 */
  2456		if (up->dma) {
  2457			const char *msg = NULL;
  2458	
  2459			if (uart_console(port))
  2460				msg = "forbid DMA for kernel console";
  2461			else if (serial8250_request_dma(up))
  2462				msg = "failed to request DMA";
  2463			if (msg) {
  2464				dev_warn_ratelimited(port->dev, "%s\n", msg);
  2465				up->dma = NULL;
  2466			}
  2467		}
  2468	
  2469		/*
  2470		 * Set the IER shadow for rx interrupts but defer actual interrupt
  2471		 * enable until after the FIFOs are enabled; otherwise, an already-
  2472		 * active sender can swamp the interrupt handler with "too much work".
  2473		 */
  2474		up->ier = UART_IER_RLSI | UART_IER_RDI;
  2475	
  2476		if (port->flags & UPF_FOURPORT) {
  2477			unsigned int icp;
  2478			/*
  2479			 * Enable interrupts on the AST Fourport board
  2480			 */
  2481			icp = (port->iobase & 0xfe0) | 0x01f;
  2482			outb_p(0x80, icp);
  2483			inb_p(icp);
  2484		}
  2485		retval = 0;
  2486	out:
  2487		serial8250_rpm_put(up);
  2488		return retval;
  2489	}
  2490	EXPORT_SYMBOL_GPL(serial8250_do_startup);
  2491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
