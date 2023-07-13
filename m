Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A577100C7;
	Thu, 13 Jul 2023 09:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689241731; x=1720777731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=22hn2XMK8XWrANLbcoZvHqF8/62Ay7ODZWbbTUKsk94=;
  b=hLXfN6285uGoXBqu5ie/osnJZOIa0ZCnAbbE4afwojDKZUE9cnQkoAXU
   MCInWyeDV+YfP+UZsAK14Ixbwuw1cycsblID0jk1nKRf1eq4mrgjUj8YX
   meqAfVheELC8tfzgLYy9VJKdVEQA9J3s+lKQYKaojVI3OXsq/hO1onUaF
   ia7gSopnoK0tAuDl67KlaIbRQswLy3IB7pnL7Hp4KsuNXLR6JebvtI4I6
   R43Jz5hqETz6c1smGE50UTbFt1E60Z5DxLFOjwuvZS2c/yUnyswJhYSCI
   2S2irbD+uMqHg79H20VK2SEnclFL0dGp1DtRzZnIIWyFfveGnAYkxF4yz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="395944310"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="395944310"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 02:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="866488258"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="866488258"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Jul 2023 02:48:48 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJswK-0006V7-0L;
	Thu, 13 Jul 2023 09:48:48 +0000
Date: Thu, 13 Jul 2023 17:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [linux-next:master 2212/2369]
 drivers/input/touchscreen/iqs7211.c:2464:12: warning: cast to smaller
 integer type 'enum iqs7211_dev_id' from 'const void *'
Message-ID: <202307131717.LtwApG0z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3262265625831348cfb3128d35907ead75d8bf7
commit: f2ba47e65f3b5642488802a60cb7dd068f425edc [2212/2369] Input: add support for Azoteq IQS7210A/7211A/E
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20230713/202307131717.LtwApG0z-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131717.LtwApG0z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131717.LtwApG0z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/iqs7211.c:2464:12: warning: cast to smaller integer type 'enum iqs7211_dev_id' from 'const void *' [-Wvoid-pointer-to-enum-cast]
    2464 |                 dev_id = (enum iqs7211_dev_id)of_device_get_match_data(&client->dev);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +2464 drivers/input/touchscreen/iqs7211.c

  2444	
  2445	static int iqs7211_probe(struct i2c_client *client)
  2446	{
  2447		struct iqs7211_private *iqs7211;
  2448		enum iqs7211_reg_grp_id reg_grp;
  2449		enum iqs7211_dev_id dev_id;
  2450		unsigned long irq_flags;
  2451		bool shared_irq;
  2452		int error, irq;
  2453	
  2454		iqs7211 = devm_kzalloc(&client->dev, sizeof(*iqs7211), GFP_KERNEL);
  2455		if (!iqs7211)
  2456			return -ENOMEM;
  2457	
  2458		i2c_set_clientdata(client, iqs7211);
  2459		iqs7211->client = client;
  2460	
  2461		INIT_LIST_HEAD(&iqs7211->reg_field_head);
  2462	
  2463		if (client->dev.of_node)
> 2464			dev_id = (enum iqs7211_dev_id)of_device_get_match_data(&client->dev);
  2465		else
  2466			dev_id = i2c_match_id(iqs7211_id, client)->driver_data;
  2467	
  2468		shared_irq = iqs7211_devs[dev_id].num_ctx == IQS7211_MAX_CTX;
  2469		iqs7211->dev_desc = &iqs7211_devs[dev_id];
  2470	
  2471		/*
  2472		 * The RDY pin behaves as an interrupt, but must also be polled ahead
  2473		 * of unsolicited I2C communication. As such, it is first opened as a
  2474		 * GPIO and then passed to gpiod_to_irq() to register the interrupt.
  2475		 *
  2476		 * If an extra CTx pin is present, the RDY and MCLR pins are combined
  2477		 * into a single bidirectional pin. In that case, the platform's GPIO
  2478		 * must be configured as an open-drain output.
  2479		 */
  2480		iqs7211->irq_gpio = devm_gpiod_get(&client->dev, "irq",
  2481						   shared_irq ? GPIOD_OUT_LOW
  2482							      : GPIOD_IN);
  2483		if (IS_ERR(iqs7211->irq_gpio)) {
  2484			error = PTR_ERR(iqs7211->irq_gpio);
  2485			dev_err(&client->dev, "Failed to request IRQ GPIO: %d\n",
  2486				error);
  2487			return error;
  2488		}
  2489	
  2490		if (shared_irq) {
  2491			iqs7211->reset_gpio = iqs7211->irq_gpio;
  2492		} else {
  2493			iqs7211->reset_gpio = devm_gpiod_get_optional(&client->dev,
  2494								      "reset",
  2495								      GPIOD_OUT_HIGH);
  2496			if (IS_ERR(iqs7211->reset_gpio)) {
  2497				error = PTR_ERR(iqs7211->reset_gpio);
  2498				dev_err(&client->dev,
  2499					"Failed to request reset GPIO: %d\n", error);
  2500				return error;
  2501			}
  2502		}
  2503	
  2504		error = iqs7211_start_comms(iqs7211);
  2505		if (error)
  2506			return error;
  2507	
  2508		for (reg_grp = 0; reg_grp < IQS7211_NUM_REG_GRPS; reg_grp++) {
  2509			const char *reg_grp_name = iqs7211_reg_grp_names[reg_grp];
  2510			struct fwnode_handle *reg_grp_node;
  2511	
  2512			if (reg_grp_name)
  2513				reg_grp_node = device_get_named_child_node(&client->dev,
  2514									   reg_grp_name);
  2515			else
  2516				reg_grp_node = fwnode_handle_get(dev_fwnode(&client->dev));
  2517	
  2518			if (!reg_grp_node)
  2519				continue;
  2520	
  2521			error = iqs7211_parse_reg_grp(iqs7211, reg_grp_node, reg_grp);
  2522			fwnode_handle_put(reg_grp_node);
  2523			if (error)
  2524				return error;
  2525		}
  2526	
  2527		error = iqs7211_register_kp(iqs7211);
  2528		if (error)
  2529			return error;
  2530	
  2531		error = iqs7211_register_tp(iqs7211);
  2532		if (error)
  2533			return error;
  2534	
  2535		error = iqs7211_init_device(iqs7211);
  2536		if (error)
  2537			return error;
  2538	
  2539		irq = gpiod_to_irq(iqs7211->irq_gpio);
  2540		if (irq < 0)
  2541			return irq;
  2542	
  2543		irq_flags = gpiod_is_active_low(iqs7211->irq_gpio) ? IRQF_TRIGGER_LOW
  2544								   : IRQF_TRIGGER_HIGH;
  2545		irq_flags |= IRQF_ONESHOT;
  2546	
  2547		error = devm_request_threaded_irq(&client->dev, irq, NULL, iqs7211_irq,
  2548						  irq_flags, client->name, iqs7211);
  2549		if (error)
  2550			dev_err(&client->dev, "Failed to request IRQ: %d\n", error);
  2551	
  2552		return error;
  2553	}
  2554	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
