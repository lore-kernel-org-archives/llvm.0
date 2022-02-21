Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46AA33F4
	for <llvm@lists.linux.dev>; Mon, 21 Feb 2022 21:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645480184; x=1677016184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=m203v1po8edTAPlC2EslzCakcU06L9kVa+T/v4en5mQ=;
  b=ThOYCrv1ooMUhKoy39WdPnpjKKGngY3PshAcZ7wBAwA8ETvZcnh98Ftv
   4S0Fwa4vukt8iAWXQknMG2Pnk65neDagWTaWE4z1na2UavNjABl8SXZn1
   wc7QrYXxljO8InjImSg11JQptuW8ENRzGacAikxSR0kc7W94wkFdUtkt/
   XZ42/lxpSVmVLsbLLBhkqNTRRHH3tT1l13uE/RipeWKoaL1cnaBzR2yub
   SS1YO+35FoPDZ4UDxVDI9osgy55idYTZh3pNZVOd2bJlr1eQRU7qpFwmL
   Kh3CwLbzkQd4LYqCgkMgmh7jddmSlGHD5FIKvCIRqSIaE1NcUPNKnL9mo
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="251523243"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="251523243"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 13:49:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="542731323"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Feb 2022 13:49:42 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMGYw-00020Q-8u; Mon, 21 Feb 2022 21:49:42 +0000
Date: Tue, 22 Feb 2022 05:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC 10/10] net: sfp: add support for fwnode
Message-ID: <202202220543.PIagZaL4-lkp@intel.com>
References: <20220221162652.103834-11-clement.leger@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220221162652.103834-11-clement.leger@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "Clément,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on driver-core/driver-core-testing linus/master v5.17-rc5 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Cl-ment-L-ger/add-support-for-fwnode-in-i2c-mux-system-and-sfp/20220222-004129
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: arm-randconfig-r034-20220221 (https://download.01.org/0day-ci/archive/20220222/202202220543.PIagZaL4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/88ff2fe34392c6bdae43f555e0d1373fecab434f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Cl-ment-L-ger/add-support-for-fwnode-in-i2c-mux-system-and-sfp/20220222-004129
        git checkout 88ff2fe34392c6bdae43f555e0d1373fecab434f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/phy/sfp.c:2502:6: warning: variable 'i2c' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (dev_fwnode(&pdev->dev)) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/sfp.c:2523:7: note: uninitialized use occurs here
           if (!i2c)
                ^~~
   drivers/net/phy/sfp.c:2502:2: note: remove the 'if' if its condition is always true
           if (dev_fwnode(&pdev->dev)) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/sfp.c:2486:25: note: initialize the variable 'i2c' to silence this warning
           struct i2c_adapter *i2c;
                                  ^
                                   = NULL
   1 warning generated.


vim +2502 drivers/net/phy/sfp.c

  2482	
  2483	static int sfp_probe(struct platform_device *pdev)
  2484	{
  2485		const struct sff_data *sff;
  2486		struct i2c_adapter *i2c;
  2487		char *sfp_irq_name;
  2488		struct sfp *sfp;
  2489		int err, i;
  2490	
  2491		sfp = sfp_alloc(&pdev->dev);
  2492		if (IS_ERR(sfp))
  2493			return PTR_ERR(sfp);
  2494	
  2495		platform_set_drvdata(pdev, sfp);
  2496	
  2497		err = devm_add_action(sfp->dev, sfp_cleanup, sfp);
  2498		if (err < 0)
  2499			return err;
  2500	
  2501		sff = sfp->type = &sfp_data;
> 2502		if (dev_fwnode(&pdev->dev)) {
  2503			struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
  2504			struct fwnode_handle *np;
  2505	
  2506			if (!is_acpi_device_node(fwnode)) {
  2507				sff = device_get_match_data(&pdev->dev);
  2508				if (WARN_ON(!sff))
  2509					return -EINVAL;
  2510	
  2511				sfp->type = sff;
  2512			}
  2513	
  2514			np = fwnode_find_reference(fwnode, "i2c-bus", 0);
  2515			if (!np) {
  2516				dev_err(&pdev->dev, "Cannot parse i2c-bus\n");
  2517				return -ENODEV;
  2518			}
  2519			i2c = fwnode_find_i2c_adapter_by_node(np);
  2520			fwnode_handle_put(np);
  2521		}
  2522	
  2523		if (!i2c)
  2524			return -EPROBE_DEFER;
  2525	
  2526		err = sfp_i2c_configure(sfp, i2c);
  2527		if (err < 0) {
  2528			i2c_put_adapter(i2c);
  2529			return err;
  2530		}
  2531	
  2532		for (i = 0; i < GPIO_MAX; i++)
  2533			if (sff->gpios & BIT(i)) {
  2534				sfp->gpio[i] = devm_gpiod_get_optional(sfp->dev,
  2535						   gpio_of_names[i], gpio_flags[i]);
  2536				if (IS_ERR(sfp->gpio[i]))
  2537					return PTR_ERR(sfp->gpio[i]);
  2538			}
  2539	
  2540		sfp->get_state = sfp_gpio_get_state;
  2541		sfp->set_state = sfp_gpio_set_state;
  2542	
  2543		/* Modules that have no detect signal are always present */
  2544		if (!(sfp->gpio[GPIO_MODDEF0]))
  2545			sfp->get_state = sff_gpio_get_state;
  2546	
  2547		device_property_read_u32(&pdev->dev, "maximum-power-milliwatt",
  2548					 &sfp->max_power_mW);
  2549		if (!sfp->max_power_mW)
  2550			sfp->max_power_mW = 1000;
  2551	
  2552		dev_info(sfp->dev, "Host maximum power %u.%uW\n",
  2553			 sfp->max_power_mW / 1000, (sfp->max_power_mW / 100) % 10);
  2554	
  2555		/* Get the initial state, and always signal TX disable,
  2556		 * since the network interface will not be up.
  2557		 */
  2558		sfp->state = sfp_get_state(sfp) | SFP_F_TX_DISABLE;
  2559	
  2560		if (sfp->gpio[GPIO_RATE_SELECT] &&
  2561		    gpiod_get_value_cansleep(sfp->gpio[GPIO_RATE_SELECT]))
  2562			sfp->state |= SFP_F_RATE_SELECT;
  2563		sfp_set_state(sfp, sfp->state);
  2564		sfp_module_tx_disable(sfp);
  2565		if (sfp->state & SFP_F_PRESENT) {
  2566			rtnl_lock();
  2567			sfp_sm_event(sfp, SFP_E_INSERT);
  2568			rtnl_unlock();
  2569		}
  2570	
  2571		for (i = 0; i < GPIO_MAX; i++) {
  2572			if (gpio_flags[i] != GPIOD_IN || !sfp->gpio[i])
  2573				continue;
  2574	
  2575			sfp->gpio_irq[i] = gpiod_to_irq(sfp->gpio[i]);
  2576			if (sfp->gpio_irq[i] < 0) {
  2577				sfp->gpio_irq[i] = 0;
  2578				sfp->need_poll = true;
  2579				continue;
  2580			}
  2581	
  2582			sfp_irq_name = devm_kasprintf(sfp->dev, GFP_KERNEL,
  2583						      "%s-%s", dev_name(sfp->dev),
  2584						      gpio_of_names[i]);
  2585	
  2586			if (!sfp_irq_name)
  2587				return -ENOMEM;
  2588	
  2589			err = devm_request_threaded_irq(sfp->dev, sfp->gpio_irq[i],
  2590							NULL, sfp_irq,
  2591							IRQF_ONESHOT |
  2592							IRQF_TRIGGER_RISING |
  2593							IRQF_TRIGGER_FALLING,
  2594							sfp_irq_name, sfp);
  2595			if (err) {
  2596				sfp->gpio_irq[i] = 0;
  2597				sfp->need_poll = true;
  2598			}
  2599		}
  2600	
  2601		if (sfp->need_poll)
  2602			mod_delayed_work(system_wq, &sfp->poll, poll_jiffies);
  2603	
  2604		/* We could have an issue in cases no Tx disable pin is available or
  2605		 * wired as modules using a laser as their light source will continue to
  2606		 * be active when the fiber is removed. This could be a safety issue and
  2607		 * we should at least warn the user about that.
  2608		 */
  2609		if (!sfp->gpio[GPIO_TX_DISABLE])
  2610			dev_warn(sfp->dev,
  2611				 "No tx_disable pin: SFP modules will always be emitting.\n");
  2612	
  2613		sfp->sfp_bus = sfp_register_socket(sfp->dev, sfp, &sfp_module_ops);
  2614		if (!sfp->sfp_bus)
  2615			return -ENOMEM;
  2616	
  2617		sfp_debugfs_init(sfp);
  2618	
  2619		return 0;
  2620	}
  2621	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
