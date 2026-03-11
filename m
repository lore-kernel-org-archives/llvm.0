Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71974264A86;
	Wed, 11 Mar 2026 03:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773200349; cv=none; b=HR/wT9fW/yEc2h0CFxiTsk9a62La2iTYVhhFA6Rh0SLs8uNHw0IsLH/YFZ0aao44QBn7t9uqRcsCB/hUTXEMEKw8vCG1lIfUfeRA0g9t58YCpscof3aAEWvDtsOFCUjqvoer7nEPof9B8gQqor5glJMsJsh+RiPcSJHGMEFI4es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773200349; c=relaxed/simple;
	bh=QSv4pcXGR/rr/hEcC3MiqD1pOLUWYqk64Bbd0TS1rps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yw2JvxSlogh7AIW7rPuKQnbjQd8haQVh0LeN9YEPHohqTZmKU82ROdBWstfJ6GEcJmrUfMQUal0BW4xrLFensUkgkPlCCO4EhnXAVbmHq5ylDKvsu7jQys55sBQjN+Z6o4rVA/h2XeVNqvsFb/2F616Mw+y4F2N2Am5hTQkpmIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KIBCUxws; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KIBCUxws"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773200346; x=1804736346;
  h=date:from:to:cc:subject:message-id;
  bh=QSv4pcXGR/rr/hEcC3MiqD1pOLUWYqk64Bbd0TS1rps=;
  b=KIBCUxwsnhvBPaK5UMnRcdyIWhxYEAzKpeLBNY4e59jzxluBS97yo1DI
   STEOWiqtJx4dAbosJkdn+Arfbz19ALuOWIT5no/7hkg1a0R3SJJRTOoPK
   tgrYfU9qZXIxIqmjGTL6zikkN4+8EVL90KWxhQu9bbVO+QTCyx4MnT6+I
   7/JnxxuqtoJKw4i8z6uJct8p4KogCPNZjG75i1BOSm4u5IyL+dsLlytan
   RcrI7rg/otR0xP3svGwx9zXcXlyWxK0SEsdSuJsYJ9R5sD1yb15/3ToXm
   Ltg9jmejPWoEK77ElkPSM9HzS5XHFIlMdGca46e5RzFRkydUaCim2S3/l
   A==;
X-CSE-ConnectionGUID: /b/55b+XRSSqPoNZqLw46Q==
X-CSE-MsgGUID: XJzUeZb0RrCZ8H/3oqp0FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74233961"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74233961"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 20:39:02 -0700
X-CSE-ConnectionGUID: c9Q25wffTwmRGdax7+VUzw==
X-CSE-MsgGUID: 7Ndiq8SsQjm88aRuEt5fRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="245972639"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Mar 2026 20:38:58 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0APQ-000000000fN-2WYP;
	Wed, 11 Mar 2026 03:38:56 +0000
Date: Wed, 11 Mar 2026 11:38:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 14/26]
 drivers/tty/serial/serial_core.c:3082:2: error: call to undeclared function
 'tty_port_link_device'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202603111155.rxI2vQGq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   d0c553f4ec711930517e32888ecfee8aa7631f72
commit: cf5cd694411179763d34670aa1ed94b5e2bbbbc0 [14/26] hide tty_port_link_device
config: arm64-randconfig-002-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111155.rxI2vQGq-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 122f0b13a237b5024747b4ee99002590cc9a220a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111155.rxI2vQGq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111155.rxI2vQGq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/serial_core.c:3082:2: error: call to undeclared function 'tty_port_link_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3082 |         tty_port_link_device(port, drv->tty_driver, uport->line);
         |         ^
   1 error generated.


vim +/tty_port_link_device +3082 drivers/tty/serial/serial_core.c

6915c0e487c822 drivers/tty/serial/serial_core.c Tomas Hlavacek        2012-09-06  3023  
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3024  /**
84a9582fd20306 drivers/tty/serial/serial_core.c Tony Lindgren         2023-05-25  3025   * serial_core_add_one_port - attach a driver-defined port structure
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3026   * @drv: pointer to the uart low level driver structure for this port
1b9894f342a396 drivers/serial/serial_core.c     Randy Dunlap          2009-09-21  3027   * @uport: uart port structure to use for this port.
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3028   *
a157270fbf37f8 drivers/tty/serial/serial_core.c Ahmed S. Darwish      2021-02-08  3029   * Context: task context, might sleep
a157270fbf37f8 drivers/tty/serial/serial_core.c Ahmed S. Darwish      2021-02-08  3030   *
c4bd17a6ddf3b9 drivers/tty/serial/serial_core.c Jiri Slaby            2022-07-28  3031   * This allows the driver @drv to register its own uart_port structure with the
c4bd17a6ddf3b9 drivers/tty/serial/serial_core.c Jiri Slaby            2022-07-28  3032   * core driver. The main purpose is to allow the low level uart drivers to
c4bd17a6ddf3b9 drivers/tty/serial/serial_core.c Jiri Slaby            2022-07-28  3033   * expand uart_port, rather than having yet more levels of structures.
84a9582fd20306 drivers/tty/serial/serial_core.c Tony Lindgren         2023-05-25  3034   * Caller must hold port_mutex.
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3035   */
84a9582fd20306 drivers/tty/serial/serial_core.c Tony Lindgren         2023-05-25  3036  static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *uport)
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3037  {
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3038  	struct uart_state *state;
a2bceae065ed8c drivers/serial/serial_core.c     Alan Cox              2009-09-19  3039  	struct tty_port *port;
b3b708fa2780cd drivers/serial/serial_core.c     Guennadi Liakhovetski 2007-10-16  3040  	struct device *tty_dev;
266dcff03eed00 drivers/tty/serial/serial_core.c Greg Kroah-Hartman    2014-07-16  3041  	int num_groups;
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3042  
a2bceae065ed8c drivers/serial/serial_core.c     Alan Cox              2009-09-19  3043  	if (uport->line >= drv->nr)
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3044  		return -EINVAL;
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3045  
a2bceae065ed8c drivers/serial/serial_core.c     Alan Cox              2009-09-19  3046  	state = drv->state + uport->line;
a2bceae065ed8c drivers/serial/serial_core.c     Alan Cox              2009-09-19  3047  	port = &state->port;
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3048  
e52ed2dd8287f7 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE      2024-12-11  3049) 	guard(mutex)(&port->mutex);
e52ed2dd8287f7 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE      2024-12-11  3050) 	if (state->uart_port)
e52ed2dd8287f7 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE      2024-12-11  3051) 		return -EINVAL;
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3052  
2b702b9b680cd1 drivers/tty/serial/serial_core.c Peter Hurley          2014-10-16  3053  	/* Link the port to the driver state table and vice versa */
9ed19428a51d53 drivers/tty/serial/serial_core.c Peter Hurley          2016-04-09  3054  	atomic_set(&state->refcount, 1);
9ed19428a51d53 drivers/tty/serial/serial_core.c Peter Hurley          2016-04-09  3055  	init_waitqueue_head(&state->remove_wait);
a2bceae065ed8c drivers/serial/serial_core.c     Alan Cox              2009-09-19  3056  	state->uart_port = uport;
2b702b9b680cd1 drivers/tty/serial/serial_core.c Peter Hurley          2014-10-16  3057  	uport->state = state;
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3058  
eabd4600dafacf drivers/tty/serial/serial_core.c John Ogness           2024-08-20  3059  	/*
eabd4600dafacf drivers/tty/serial/serial_core.c John Ogness           2024-08-20  3060  	 * If this port is in use as a console then the spinlock is already
eabd4600dafacf drivers/tty/serial/serial_core.c John Ogness           2024-08-20  3061  	 * initialised.
eabd4600dafacf drivers/tty/serial/serial_core.c John Ogness           2024-08-20  3062  	 */
eabd4600dafacf drivers/tty/serial/serial_core.c John Ogness           2024-08-20  3063  	if (!uart_console_registered(uport))
eabd4600dafacf drivers/tty/serial/serial_core.c John Ogness           2024-08-20  3064  		uart_port_spin_lock_init(uport);
eabd4600dafacf drivers/tty/serial/serial_core.c John Ogness           2024-08-20  3065  
2b702b9b680cd1 drivers/tty/serial/serial_core.c Peter Hurley          2014-10-16  3066  	state->pm_state = UART_PM_STATE_UNDEFINED;
eabd4600dafacf drivers/tty/serial/serial_core.c John Ogness           2024-08-20  3067  	uart_port_set_cons(uport, drv->cons);
959801fef94b7e drivers/tty/serial/serial_core.c Peter Hurley          2015-02-24  3068  	uport->minor = drv->tty_driver->minor_start + uport->line;
33a2515abd45c6 drivers/tty/serial/serial_core.c Joseph Tilahun        2025-06-09  3069  	uport->name = kasprintf(GFP_KERNEL, "%s%u", drv->dev_name,
f7048b15900f36 drivers/tty/serial/serial_core.c Vignesh R             2017-03-24  3070  				drv->tty_driver->name_base + uport->line);
e52ed2dd8287f7 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE      2024-12-11  3071) 	if (!uport->name)
e52ed2dd8287f7 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE      2024-12-11  3072) 		return -ENOMEM;
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3073  
a208ffd251d08e drivers/tty/serial/serial_core.c Grant Likely          2014-03-27  3074  	if (uport->cons && uport->dev)
dd8b7a1db5d0da drivers/tty/serial/serial_core.c Michal Simek          2019-10-16  3075  		of_console_check(uport->dev->of_node, uport->cons->name, uport->line);
976ecd12b8144d drivers/serial/serial_core.c     Russell King          2005-07-03  3076  
32f37e57583f86 drivers/tty/serial/serial_core.c Krzysztof Kozlowski   2026-01-23  3077  	/*
32f37e57583f86 drivers/tty/serial/serial_core.c Krzysztof Kozlowski   2026-01-23  3078  	 * TTY port has to be linked with the driver before register_console()
32f37e57583f86 drivers/tty/serial/serial_core.c Krzysztof Kozlowski   2026-01-23  3079  	 * in uart_configure_port(), because user-space could open the console
32f37e57583f86 drivers/tty/serial/serial_core.c Krzysztof Kozlowski   2026-01-23  3080  	 * immediately after.
32f37e57583f86 drivers/tty/serial/serial_core.c Krzysztof Kozlowski   2026-01-23  3081  	 */
32f37e57583f86 drivers/tty/serial/serial_core.c Krzysztof Kozlowski   2026-01-23 @3082  	tty_port_link_device(port, drv->tty_driver, uport->line);
a2bceae065ed8c drivers/serial/serial_core.c     Alan Cox              2009-09-19  3083  	uart_configure_port(drv, state, uport);
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3084  
4dda864d73079a drivers/tty/serial/serial_core.c Geert Uytterhoeven    2016-10-28  3085  	port->console = uart_console(uport);
4dda864d73079a drivers/tty/serial/serial_core.c Geert Uytterhoeven    2016-10-28  3086  
266dcff03eed00 drivers/tty/serial/serial_core.c Greg Kroah-Hartman    2014-07-16  3087  	num_groups = 2;
266dcff03eed00 drivers/tty/serial/serial_core.c Greg Kroah-Hartman    2014-07-16  3088  	if (uport->attr_group)
266dcff03eed00 drivers/tty/serial/serial_core.c Greg Kroah-Hartman    2014-07-16  3089  		num_groups++;
266dcff03eed00 drivers/tty/serial/serial_core.c Greg Kroah-Hartman    2014-07-16  3090  
32a92f8c893269 drivers/tty/serial/serial_core.c Linus Torvalds        2026-02-21  3091  	uport->tty_groups = kzalloc_objs(*uport->tty_groups, num_groups);
e52ed2dd8287f7 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE      2024-12-11  3092) 	if (!uport->tty_groups)
e52ed2dd8287f7 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE      2024-12-11  3093) 		return -ENOMEM;
e52ed2dd8287f7 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE      2024-12-11  3094) 
266dcff03eed00 drivers/tty/serial/serial_core.c Greg Kroah-Hartman    2014-07-16  3095  	uport->tty_groups[0] = &tty_dev_attr_group;
266dcff03eed00 drivers/tty/serial/serial_core.c Greg Kroah-Hartman    2014-07-16  3096  	if (uport->attr_group)
266dcff03eed00 drivers/tty/serial/serial_core.c Greg Kroah-Hartman    2014-07-16  3097  		uport->tty_groups[1] = uport->attr_group;
266dcff03eed00 drivers/tty/serial/serial_core.c Greg Kroah-Hartman    2014-07-16  3098  
e21de1455a721a drivers/tty/serial/serial_core.c Hans de Goede         2024-05-09  3099  	/* Ensure serdev drivers can call serdev_device_open() right away */
e21de1455a721a drivers/tty/serial/serial_core.c Hans de Goede         2024-05-09  3100  	uport->flags &= ~UPF_DEAD;
e21de1455a721a drivers/tty/serial/serial_core.c Hans de Goede         2024-05-09  3101  
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3102  	/*
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3103  	 * Register the port whether it's detected or not.  This allows
015355b70e074a drivers/tty/serial/serial_core.c Geert Uytterhoeven    2014-03-11  3104  	 * setserial to be used to alter this port's parameters.
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3105  	 */
da4c279942b057 drivers/tty/serial/serial_core.c Johan Hovold          2017-05-18  3106  	tty_dev = tty_port_register_device_attr_serdev(port, drv->tty_driver,
b286f4e87e325b drivers/tty/serial/serial_core.c Tony Lindgren         2023-11-13  3107  			uport->line, uport->dev, &uport->port_dev->dev, port,
b286f4e87e325b drivers/tty/serial/serial_core.c Tony Lindgren         2023-11-13  3108  			uport->tty_groups);
b289c496e52a9b drivers/tty/serial/serial_core.c Chengguang Xu         2019-02-18  3109  	if (!IS_ERR(tty_dev)) {
773598357c0baf drivers/tty/serial/serial_core.c Simon Glass           2012-01-19  3110  		device_set_wakeup_capable(tty_dev, 1);
773598357c0baf drivers/tty/serial/serial_core.c Simon Glass           2012-01-19  3111  	} else {
e21de1455a721a drivers/tty/serial/serial_core.c Hans de Goede         2024-05-09  3112  		uport->flags |= UPF_DEAD;
33a2515abd45c6 drivers/tty/serial/serial_core.c Joseph Tilahun        2025-06-09  3113  		dev_err(uport->dev, "Cannot register tty device on line %u\n",
a2bceae065ed8c drivers/serial/serial_core.c     Alan Cox              2009-09-19  3114  		       uport->line);
773598357c0baf drivers/tty/serial/serial_core.c Simon Glass           2012-01-19  3115  	}
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3116  
e52ed2dd8287f7 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE      2024-12-11  3117) 	return 0;
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3118  }
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3119  

:::::: The code at line 3082 was first introduced by commit
:::::: 32f37e57583f869140cff445feedeea8a5fea986 serial: Fix not set tty->port race condition

:::::: TO: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
