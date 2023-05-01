Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D25882F;
	Mon,  1 May 2023 20:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682973976; x=1714509976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R7diIuNR1Wn2RcLV4YzCrF5LDrySFTU6g6S7RF9Av60=;
  b=MaKZJhNH+2spKSkCGwFcegqFZpTtVTFpleQqHE7CPmZkh07Tk8IEpnxg
   EBAgIlixzIS/laZ9y4Zc874H4HefD46TTTq9FUIk+FrUDlvV5uSJaGPVg
   wwVq89qBAT+a5gn6iXant+mNjD3sIF5MtK0gQoY4XaloYZz3MWVd+Zvxs
   9EnR5n/creIMpq3uHgQH12xpzbDS73XMeBcsehNdFwsR3FGAQNgYnUm/T
   RXnGW6lcdI3qfOqCxmbk8TTGiObf+N9/xDIp80PjKOiXEvV1qK4myPknl
   +FO5CnJvDZx29I5zRnOJQGtJHnbBUK6H4Uwgd/UXftRZw8KmyD+l1UWdU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="350312041"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="350312041"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 13:46:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="870307584"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="870307584"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 May 2023 13:46:14 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptaPV-0000cv-1z;
	Mon, 01 May 2023 20:46:13 +0000
Date: Tue, 2 May 2023 04:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 57/59] drivers/mailbox/ti-msgmgr.c:833:9:
 warning: variable 'desc' is uninitialized when used here
Message-ID: <202305020443.orCQSAQx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   7637af07fc9dd17bd0f6c2df329ea6da853c0e38
commit: 86671662a0e9c3e83897935ceec70d9b7d69d16a [57/59] Use of_device_get_match_data
config: arm64-randconfig-r026-20230430 (https://download.01.org/0day-ci/archive/20230502/202305020443.orCQSAQx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=86671662a0e9c3e83897935ceec70d9b7d69d16a
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout 86671662a0e9c3e83897935ceec70d9b7d69d16a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/mailbox/ drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305020443.orCQSAQx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/ti-msgmgr.c:833:9: warning: variable 'desc' is uninitialized when used here [-Wuninitialized]
                                              desc->data_region_name);
                                              ^~~~
   drivers/mailbox/ti-msgmgr.c:809:35: note: initialize the variable 'desc' to silence this warning
           const struct ti_msgmgr_desc *desc;
                                            ^
                                             = NULL
   1 warning generated.
--
>> drivers/tty/serial/msm_serial.c:1778:34: warning: unused variable 'msm_uartdm_table' [-Wunused-const-variable]
   static const struct of_device_id msm_uartdm_table[] = {
                                    ^
   1 warning generated.


vim +/desc +833 drivers/mailbox/ti-msgmgr.c

aace66b170ce7f Nishanth Menon 2016-03-16  803  
aace66b170ce7f Nishanth Menon 2016-03-16  804  static int ti_msgmgr_probe(struct platform_device *pdev)
aace66b170ce7f Nishanth Menon 2016-03-16  805  {
aace66b170ce7f Nishanth Menon 2016-03-16  806  	struct device *dev = &pdev->dev;
aace66b170ce7f Nishanth Menon 2016-03-16  807  	struct device_node *np;
aace66b170ce7f Nishanth Menon 2016-03-16  808  	struct resource *res;
aace66b170ce7f Nishanth Menon 2016-03-16  809  	const struct ti_msgmgr_desc *desc;
aace66b170ce7f Nishanth Menon 2016-03-16  810  	struct ti_msgmgr_inst *inst;
aace66b170ce7f Nishanth Menon 2016-03-16  811  	struct ti_queue_inst *qinst;
aace66b170ce7f Nishanth Menon 2016-03-16  812  	struct mbox_controller *mbox;
aace66b170ce7f Nishanth Menon 2016-03-16  813  	struct mbox_chan *chans;
aace66b170ce7f Nishanth Menon 2016-03-16  814  	int queue_count;
aace66b170ce7f Nishanth Menon 2016-03-16  815  	int i;
aace66b170ce7f Nishanth Menon 2016-03-16  816  	int ret = -EINVAL;
aace66b170ce7f Nishanth Menon 2016-03-16  817  	const struct ti_msgmgr_valid_queue_desc *queue_desc;
aace66b170ce7f Nishanth Menon 2016-03-16  818  
aace66b170ce7f Nishanth Menon 2016-03-16  819  	if (!dev->of_node) {
aace66b170ce7f Nishanth Menon 2016-03-16  820  		dev_err(dev, "no OF information\n");
aace66b170ce7f Nishanth Menon 2016-03-16  821  		return -EINVAL;
aace66b170ce7f Nishanth Menon 2016-03-16  822  	}
aace66b170ce7f Nishanth Menon 2016-03-16  823  	np = dev->of_node;
aace66b170ce7f Nishanth Menon 2016-03-16  824  
aace66b170ce7f Nishanth Menon 2016-03-16  825  	inst = devm_kzalloc(dev, sizeof(*inst), GFP_KERNEL);
aace66b170ce7f Nishanth Menon 2016-03-16  826  	if (!inst)
aace66b170ce7f Nishanth Menon 2016-03-16  827  		return -ENOMEM;
aace66b170ce7f Nishanth Menon 2016-03-16  828  
aace66b170ce7f Nishanth Menon 2016-03-16  829  	inst->dev = dev;
86671662a0e9c3 Rob Herring    2021-01-19  830  	inst->desc = of_device_get_match_data(dev);
aace66b170ce7f Nishanth Menon 2016-03-16  831  
aace66b170ce7f Nishanth Menon 2016-03-16  832  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
89c976c2f3fc02 Nishanth Menon 2018-07-16 @833  					   desc->data_region_name);
aace66b170ce7f Nishanth Menon 2016-03-16  834  	inst->queue_proxy_region = devm_ioremap_resource(dev, res);
aace66b170ce7f Nishanth Menon 2016-03-16  835  	if (IS_ERR(inst->queue_proxy_region))
aace66b170ce7f Nishanth Menon 2016-03-16  836  		return PTR_ERR(inst->queue_proxy_region);
aace66b170ce7f Nishanth Menon 2016-03-16  837  
aace66b170ce7f Nishanth Menon 2016-03-16  838  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
89c976c2f3fc02 Nishanth Menon 2018-07-16  839  					   desc->status_region_name);
aace66b170ce7f Nishanth Menon 2016-03-16  840  	inst->queue_state_debug_region = devm_ioremap_resource(dev, res);
aace66b170ce7f Nishanth Menon 2016-03-16  841  	if (IS_ERR(inst->queue_state_debug_region))
aace66b170ce7f Nishanth Menon 2016-03-16  842  		return PTR_ERR(inst->queue_state_debug_region);
aace66b170ce7f Nishanth Menon 2016-03-16  843  
a2b79838b89171 Nishanth Menon 2018-07-16  844  	if (desc->is_sproxy) {
a2b79838b89171 Nishanth Menon 2018-07-16  845  		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
a2b79838b89171 Nishanth Menon 2018-07-16  846  						   desc->ctrl_region_name);
a2b79838b89171 Nishanth Menon 2018-07-16  847  		inst->queue_ctrl_region = devm_ioremap_resource(dev, res);
a2b79838b89171 Nishanth Menon 2018-07-16  848  		if (IS_ERR(inst->queue_ctrl_region))
a2b79838b89171 Nishanth Menon 2018-07-16  849  			return PTR_ERR(inst->queue_ctrl_region);
a2b79838b89171 Nishanth Menon 2018-07-16  850  	}
a2b79838b89171 Nishanth Menon 2018-07-16  851  
aace66b170ce7f Nishanth Menon 2016-03-16  852  	dev_dbg(dev, "proxy region=%p, queue_state=%p\n",
aace66b170ce7f Nishanth Menon 2016-03-16  853  		inst->queue_proxy_region, inst->queue_state_debug_region);
aace66b170ce7f Nishanth Menon 2016-03-16  854  
aace66b170ce7f Nishanth Menon 2016-03-16  855  	queue_count = desc->num_valid_queues;
aace66b170ce7f Nishanth Menon 2016-03-16  856  	if (!queue_count || queue_count > desc->queue_count) {
aace66b170ce7f Nishanth Menon 2016-03-16  857  		dev_crit(dev, "Invalid Number of queues %d. Max %d\n",
aace66b170ce7f Nishanth Menon 2016-03-16  858  			 queue_count, desc->queue_count);
aace66b170ce7f Nishanth Menon 2016-03-16  859  		return -ERANGE;
aace66b170ce7f Nishanth Menon 2016-03-16  860  	}
aace66b170ce7f Nishanth Menon 2016-03-16  861  	inst->num_valid_queues = queue_count;
aace66b170ce7f Nishanth Menon 2016-03-16  862  
a86854d0c599b3 Kees Cook      2018-06-12  863  	qinst = devm_kcalloc(dev, queue_count, sizeof(*qinst), GFP_KERNEL);
aace66b170ce7f Nishanth Menon 2016-03-16  864  	if (!qinst)
aace66b170ce7f Nishanth Menon 2016-03-16  865  		return -ENOMEM;
aace66b170ce7f Nishanth Menon 2016-03-16  866  	inst->qinsts = qinst;
aace66b170ce7f Nishanth Menon 2016-03-16  867  
a86854d0c599b3 Kees Cook      2018-06-12  868  	chans = devm_kcalloc(dev, queue_count, sizeof(*chans), GFP_KERNEL);
aace66b170ce7f Nishanth Menon 2016-03-16  869  	if (!chans)
aace66b170ce7f Nishanth Menon 2016-03-16  870  		return -ENOMEM;
aace66b170ce7f Nishanth Menon 2016-03-16  871  	inst->chans = chans;
aace66b170ce7f Nishanth Menon 2016-03-16  872  
a2b79838b89171 Nishanth Menon 2018-07-16  873  	if (desc->is_sproxy) {
a2b79838b89171 Nishanth Menon 2018-07-16  874  		struct ti_msgmgr_valid_queue_desc sproxy_desc;
a2b79838b89171 Nishanth Menon 2018-07-16  875  
a2b79838b89171 Nishanth Menon 2018-07-16  876  		/* All proxies may be valid in Secure Proxy instance */
a2b79838b89171 Nishanth Menon 2018-07-16  877  		for (i = 0; i < queue_count; i++, qinst++, chans++) {
a2b79838b89171 Nishanth Menon 2018-07-16  878  			sproxy_desc.queue_id = 0;
a2b79838b89171 Nishanth Menon 2018-07-16  879  			sproxy_desc.proxy_id = i;
a2b79838b89171 Nishanth Menon 2018-07-16  880  			ret = ti_msgmgr_queue_setup(i, dev, np, inst,
a2b79838b89171 Nishanth Menon 2018-07-16  881  						    desc, &sproxy_desc, qinst,
a2b79838b89171 Nishanth Menon 2018-07-16  882  						    chans);
a2b79838b89171 Nishanth Menon 2018-07-16  883  			if (ret)
a2b79838b89171 Nishanth Menon 2018-07-16  884  				return ret;
a2b79838b89171 Nishanth Menon 2018-07-16  885  		}
a2b79838b89171 Nishanth Menon 2018-07-16  886  	} else {
a2b79838b89171 Nishanth Menon 2018-07-16  887  		/* Only Some proxies are valid in Message Manager */
aace66b170ce7f Nishanth Menon 2016-03-16  888  		for (i = 0, queue_desc = desc->valid_queues;
aace66b170ce7f Nishanth Menon 2016-03-16  889  		     i < queue_count; i++, qinst++, chans++, queue_desc++) {
aace66b170ce7f Nishanth Menon 2016-03-16  890  			ret = ti_msgmgr_queue_setup(i, dev, np, inst,
a2b79838b89171 Nishanth Menon 2018-07-16  891  						    desc, queue_desc, qinst,
a2b79838b89171 Nishanth Menon 2018-07-16  892  						    chans);
aace66b170ce7f Nishanth Menon 2016-03-16  893  			if (ret)
aace66b170ce7f Nishanth Menon 2016-03-16  894  				return ret;
aace66b170ce7f Nishanth Menon 2016-03-16  895  		}
a2b79838b89171 Nishanth Menon 2018-07-16  896  	}
aace66b170ce7f Nishanth Menon 2016-03-16  897  
aace66b170ce7f Nishanth Menon 2016-03-16  898  	mbox = &inst->mbox;
aace66b170ce7f Nishanth Menon 2016-03-16  899  	mbox->dev = dev;
aace66b170ce7f Nishanth Menon 2016-03-16  900  	mbox->ops = &ti_msgmgr_chan_ops;
aace66b170ce7f Nishanth Menon 2016-03-16  901  	mbox->chans = inst->chans;
aace66b170ce7f Nishanth Menon 2016-03-16  902  	mbox->num_chans = inst->num_valid_queues;
aace66b170ce7f Nishanth Menon 2016-03-16  903  	mbox->txdone_irq = false;
aace66b170ce7f Nishanth Menon 2016-03-16  904  	mbox->txdone_poll = desc->tx_polled;
aace66b170ce7f Nishanth Menon 2016-03-16  905  	if (desc->tx_polled)
aace66b170ce7f Nishanth Menon 2016-03-16  906  		mbox->txpoll_period = desc->tx_poll_timeout_ms;
aace66b170ce7f Nishanth Menon 2016-03-16  907  	mbox->of_xlate = ti_msgmgr_of_xlate;
aace66b170ce7f Nishanth Menon 2016-03-16  908  
aace66b170ce7f Nishanth Menon 2016-03-16  909  	platform_set_drvdata(pdev, inst);
2298a6f09f455f Thierry Reding 2018-12-20  910  	ret = devm_mbox_controller_register(dev, mbox);
aace66b170ce7f Nishanth Menon 2016-03-16  911  	if (ret)
aace66b170ce7f Nishanth Menon 2016-03-16  912  		dev_err(dev, "Failed to register mbox_controller(%d)\n", ret);
aace66b170ce7f Nishanth Menon 2016-03-16  913  
aace66b170ce7f Nishanth Menon 2016-03-16  914  	return ret;
aace66b170ce7f Nishanth Menon 2016-03-16  915  }
aace66b170ce7f Nishanth Menon 2016-03-16  916  

:::::: The code at line 833 was first introduced by commit
:::::: 89c976c2f3fc02b95ae0a4a35dc3373ec8bfbdcb mailbox: ti-msgmgr: Move the memory region name to descriptor

:::::: TO: Nishanth Menon <nm@ti.com>
:::::: CC: Jassi Brar <jaswinder.singh@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
