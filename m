Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A7436B057;
	Tue, 17 Feb 2026 14:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771340160; cv=none; b=l6fmCheNdWmkC5CgfLIKkWzZ8V9jJAb4W3fd1v3NHjytACOn5tfbkc1vYSlstXKUZd72MZ0l8cjBKNL0D0BvZMiT6DwjJ8+cKfyIABmF9CLP6xHAq32QQ/f0Dw0H7VOqLIJM+fwYb3XKyq/PpZSCjg3IXRZybuj9KIxSpbW3KkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771340160; c=relaxed/simple;
	bh=MegRb1Id9aHD3S7oI1MXMIVmxl+V6Ysl+i6/pMTHp8s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d952KCgWSustUROWqWty6RZ47RXSnTvmEc3jleAGaS/Icilpt+nGfPgqkYVeTac67Vr5gTf1YvI3jGCCQXp9632gWhBlmkpmC3uAJdoyrwTctwywZLZ2c+FvwhLEKTfbd2s9pAEvghBYCPZL6CQ40NsvopX653uvyXVyG2zdr30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mPQT5XU+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mPQT5XU+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771340157; x=1802876157;
  h=date:from:to:cc:subject:message-id;
  bh=MegRb1Id9aHD3S7oI1MXMIVmxl+V6Ysl+i6/pMTHp8s=;
  b=mPQT5XU+bnYyZF/+PbV4XRVU00JZPzuYPSRiiyaa7hqvyYPPf4COwTNJ
   ggQ6uUAicXWP0iKDdpP6jSoLHWDJ/vVxIAlfec2GAi7maN/a9Vl7eRg6O
   muP8XYXpXVytVWoRqBafxOot9XzbcJDrcAZw9D4EwDh4rvkCKWELmX2UU
   fg0NYLPaibmlUfsXzxaCmZdZrwB4VFoeH9jwhlyVuCAbvujM72AlV0L2l
   SyZMRuu3e1wGMlIQsgXajzk8cDqkMcI0heFyocRNwRlsHyYS1o9K1FHHC
   IE8tlUOZCuMHsB3Ly4V0oUbc34JgmIYyZ8+ZpXckPMz6QBSSk3bRcZFXp
   A==;
X-CSE-ConnectionGUID: UuZCn8TnRbSM0k8K4OeIjg==
X-CSE-MsgGUID: OwmH6nk3Rc20H10mec6kVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72451729"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="72451729"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 06:55:56 -0800
X-CSE-ConnectionGUID: DB5LwseET2KIRxHY0mL14g==
X-CSE-MsgGUID: I6vkJB2jTMCpl75DKY35bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="217834104"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 17 Feb 2026 06:55:54 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsMUS-00000000325-19CH;
	Tue, 17 Feb 2026 14:55:52 +0000
Date: Tue, 17 Feb 2026 15:55:37 +0100
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 16/28]
 drivers/tty/serial/serial_core.c:3082:2: error: call to undeclared function
 'tty_port_link_device'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202602171503.3dDhaT5l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   7dfaca63ccbb107c245cabdb86641954abc5284e
commit: a21e503ffebf61207f7b9623c1398b47fc16adf5 [16/28] hide tty_port_link_device
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260217/202602171503.3dDhaT5l-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171503.3dDhaT5l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171503.3dDhaT5l-lkp@intel.com/

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
c2b703b807e3ab drivers/tty/serial/serial_core.c Yoshihiro YUNOMAE     2014-07-23  3091  	uport->tty_groups = kcalloc(num_groups, sizeof(*uport->tty_groups),
266dcff03eed00 drivers/tty/serial/serial_core.c Greg Kroah-Hartman    2014-07-16  3092  				    GFP_KERNEL);
e52ed2dd8287f7 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE      2024-12-11  3093) 	if (!uport->tty_groups)
e52ed2dd8287f7 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE      2024-12-11  3094) 		return -ENOMEM;
e52ed2dd8287f7 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE      2024-12-11  3095) 
266dcff03eed00 drivers/tty/serial/serial_core.c Greg Kroah-Hartman    2014-07-16  3096  	uport->tty_groups[0] = &tty_dev_attr_group;
266dcff03eed00 drivers/tty/serial/serial_core.c Greg Kroah-Hartman    2014-07-16  3097  	if (uport->attr_group)
266dcff03eed00 drivers/tty/serial/serial_core.c Greg Kroah-Hartman    2014-07-16  3098  		uport->tty_groups[1] = uport->attr_group;
266dcff03eed00 drivers/tty/serial/serial_core.c Greg Kroah-Hartman    2014-07-16  3099  
e21de1455a721a drivers/tty/serial/serial_core.c Hans de Goede         2024-05-09  3100  	/* Ensure serdev drivers can call serdev_device_open() right away */
e21de1455a721a drivers/tty/serial/serial_core.c Hans de Goede         2024-05-09  3101  	uport->flags &= ~UPF_DEAD;
e21de1455a721a drivers/tty/serial/serial_core.c Hans de Goede         2024-05-09  3102  
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3103  	/*
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3104  	 * Register the port whether it's detected or not.  This allows
015355b70e074a drivers/tty/serial/serial_core.c Geert Uytterhoeven    2014-03-11  3105  	 * setserial to be used to alter this port's parameters.
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3106  	 */
da4c279942b057 drivers/tty/serial/serial_core.c Johan Hovold          2017-05-18  3107  	tty_dev = tty_port_register_device_attr_serdev(port, drv->tty_driver,
b286f4e87e325b drivers/tty/serial/serial_core.c Tony Lindgren         2023-11-13  3108  			uport->line, uport->dev, &uport->port_dev->dev, port,
b286f4e87e325b drivers/tty/serial/serial_core.c Tony Lindgren         2023-11-13  3109  			uport->tty_groups);
b289c496e52a9b drivers/tty/serial/serial_core.c Chengguang Xu         2019-02-18  3110  	if (!IS_ERR(tty_dev)) {
773598357c0baf drivers/tty/serial/serial_core.c Simon Glass           2012-01-19  3111  		device_set_wakeup_capable(tty_dev, 1);
773598357c0baf drivers/tty/serial/serial_core.c Simon Glass           2012-01-19  3112  	} else {
e21de1455a721a drivers/tty/serial/serial_core.c Hans de Goede         2024-05-09  3113  		uport->flags |= UPF_DEAD;
33a2515abd45c6 drivers/tty/serial/serial_core.c Joseph Tilahun        2025-06-09  3114  		dev_err(uport->dev, "Cannot register tty device on line %u\n",
a2bceae065ed8c drivers/serial/serial_core.c     Alan Cox              2009-09-19  3115  		       uport->line);
773598357c0baf drivers/tty/serial/serial_core.c Simon Glass           2012-01-19  3116  	}
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3117  
e52ed2dd8287f7 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE      2024-12-11  3118) 	return 0;
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3119  }
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds        2005-04-16  3120  

:::::: The code at line 3082 was first introduced by commit
:::::: 32f37e57583f869140cff445feedeea8a5fea986 serial: Fix not set tty->port race condition

:::::: TO: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
