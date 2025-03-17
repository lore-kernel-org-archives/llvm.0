Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE38233128;
	Mon, 17 Mar 2025 10:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742208416; cv=none; b=nj1ZqoWT72CSdUtMtPwZKplJEaB+igQdMhMRsWdJtdbO3vhb7QcrWCSSmydQtJb+4NLo7u2FzzX4S6aAY6hbfQDYi9F6SW93CvPv37lfyKsepk/YyI6e43RXmdJFX8rTYYm+ZIxTLdp4BDK/RtL32X6+p6Uosffbkuxs8NXIBs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742208416; c=relaxed/simple;
	bh=8c6ITS6NpbhSx8gm6ACJJntAw1mrd8H/LF+M6b1ue70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iELMl5FEdezdTtyrkdYdrwgpXsG5dsR/7c2dd2NppI2u4edm7BKQf6cCDwseel2AATLvBs0SvTRWs8XSOeBZsNRrKFh5DwhY0Ckx/3wIhhXBPqkrx4TwTrKskPbGs+CoPu1AgtpCCMzC0lJc/mLvZq29ia8A4Yhhj99cnoXrEus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M0DrnS1A; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M0DrnS1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742208415; x=1773744415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8c6ITS6NpbhSx8gm6ACJJntAw1mrd8H/LF+M6b1ue70=;
  b=M0DrnS1Ah0hCCeFbQKcM9uZy/z60mQyb+czPWSUqDZ0e2LHAkxqRg+7G
   JGxqejYyqO/cK2iES3cHMmoatQrKDzDpUk4EVbLFf4VehC5w0IGeD1p/7
   ouzLT8+DR2cE433nyC+GSMo6REirjBwY8Da68HDjnCDqAeyj5uEFecxDO
   IPxq9QjQ0rmOWtkK6FBARB3H2uU4Fg4rou6cfJZth8/UBZC8Pw7iIQ6Pi
   rKzwbKkGUskUVjwZvsmLQBGkb+U/IWJV09Nnp1wdBVeQIFlQtkd/Otl5C
   0Xv9zsOgql461JPlUzEtxlHD2zem163SwY+Jl/dOrnTplGP705RsWyI/e
   Q==;
X-CSE-ConnectionGUID: //mJIhvmSMmzA+XenL1eoA==
X-CSE-MsgGUID: 66ZWFKtlRtyQpIuCHhqgng==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="60687096"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="60687096"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 03:46:54 -0700
X-CSE-ConnectionGUID: XIG5zVxaSEau8G4PxehmOw==
X-CSE-MsgGUID: bqBqkn7zSO2Yc5RCe+FQgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="121859349"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 Mar 2025 03:46:53 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tu7zV-000CgL-04;
	Mon, 17 Mar 2025 10:46:44 +0000
Date: Mon, 17 Mar 2025 18:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 105/111] drivers/tty/serial/serial_core.c:3105:3:
 error: cannot jump from this goto statement to its label
Message-ID: <202503171815.hLKSZvJJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   a51ffe221e2da2df430888699365394c646aed12
commit: 3d93b0ef6e12a7eea9ca53e38b755617089374b4 [105/111] serial: drv->state -> xarray
config: x86_64-buildonly-randconfig-002-20250317 (https://download.01.org/0day-ci/archive/20250317/202503171815.hLKSZvJJ-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503171815.hLKSZvJJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503171815.hLKSZvJJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/tty/serial/serial_core.c:30:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2302:
   include/linux/vmstat.h:507:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     507 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/tty/serial/serial_core.c:3105:3: error: cannot jump from this goto statement to its label
    3105 |                 goto err_free_state;
         |                 ^
   drivers/tty/serial/serial_core.c:3111:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    3111 |         guard(mutex)(&port->mutex);
         |         ^
   include/linux/cleanup.h:309:15: note: expanded from macro 'guard'
     309 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:41:1: note: expanded from here
      41 | __UNIQUE_ID_guard589
         | ^
   1 warning and 1 error generated.


vim +3105 drivers/tty/serial/serial_core.c

  3079	
  3080	/**
  3081	 * serial_core_add_one_port - attach a driver-defined port structure
  3082	 * @drv: pointer to the uart low level driver structure for this port
  3083	 * @uport: uart port structure to use for this port.
  3084	 *
  3085	 * Context: task context, might sleep
  3086	 *
  3087	 * This allows the driver @drv to register its own uart_port structure with the
  3088	 * core driver. The main purpose is to allow the low level uart drivers to
  3089	 * expand uart_port, rather than having yet more levels of structures.
  3090	 * Caller must hold port_mutex.
  3091	 */
  3092	static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *uport)
  3093	{
  3094		struct uart_state *state;
  3095		struct tty_port *port;
  3096		struct device *tty_dev;
  3097		int num_groups, ret;
  3098	
  3099		state = kzalloc(sizeof(*state), GFP_KERNEL);
  3100		if (!state)
  3101			return -ENOMEM;
  3102	
  3103		ret = xa_err(xa_store(&drv->state, uport->line, state, GFP_KERNEL));
  3104		if (ret)
> 3105			goto err_free_state;
  3106	
  3107		port = &state->port;
  3108		tty_port_init(port);
  3109		port->ops = &uart_port_ops;
  3110	
  3111		guard(mutex)(&port->mutex);
  3112		/* Link the port to the driver state table and vice versa */
  3113		atomic_set(&state->refcount, 1);
  3114		init_waitqueue_head(&state->remove_wait);
  3115		state->uart_port = uport;
  3116		uport->state = state;
  3117	
  3118		/*
  3119		 * If this port is in use as a console then the spinlock is already
  3120		 * initialised.
  3121		 */
  3122		if (!uart_console_registered(uport))
  3123			uart_port_spin_lock_init(uport);
  3124	
  3125		state->pm_state = UART_PM_STATE_UNDEFINED;
  3126		uart_port_set_cons(uport, drv->cons);
  3127		uport->minor = drv->tty_driver->minor_start + uport->line;
  3128		uport->name = kasprintf(GFP_KERNEL, "%s%d", drv->dev_name,
  3129					drv->tty_driver->name_base + uport->line);
  3130		if (!uport->name)
  3131			return -ENOMEM;
  3132	
  3133		if (uport->cons && uport->dev)
  3134			of_console_check(uport->dev->of_node, uport->cons->name, uport->line);
  3135	
  3136		uart_configure_port(drv, state, uport);
  3137	
  3138		port->console = uart_console(uport);
  3139	
  3140		num_groups = 2;
  3141		if (uport->attr_group)
  3142			num_groups++;
  3143	
  3144		uport->tty_groups = kcalloc(num_groups, sizeof(*uport->tty_groups),
  3145					    GFP_KERNEL);
  3146		if (!uport->tty_groups)
  3147			return -ENOMEM;
  3148	
  3149		uport->tty_groups[0] = &tty_dev_attr_group;
  3150		if (uport->attr_group)
  3151			uport->tty_groups[1] = uport->attr_group;
  3152	
  3153		/* Ensure serdev drivers can call serdev_device_open() right away */
  3154		uport->flags &= ~UPF_DEAD;
  3155	
  3156		/*
  3157		 * Register the port whether it's detected or not.  This allows
  3158		 * setserial to be used to alter this port's parameters.
  3159		 */
  3160		tty_dev = tty_port_register_device_attr_serdev(port, drv->tty_driver,
  3161				uport->line, uport->dev, &uport->port_dev->dev, port,
  3162				uport->tty_groups);
  3163		if (!IS_ERR(tty_dev)) {
  3164			device_set_wakeup_capable(tty_dev, 1);
  3165		} else {
  3166			uport->flags |= UPF_DEAD;
  3167			dev_err(uport->dev, "Cannot register tty device on line %d\n",
  3168			       uport->line);
  3169		}
  3170	
  3171		return 0;
  3172	err_free_state:
  3173		kfree(state);
  3174		return ret;
  3175	}
  3176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
