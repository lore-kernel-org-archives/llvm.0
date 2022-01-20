Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5573B173
	for <llvm@lists.linux.dev>; Thu, 20 Jan 2022 17:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642698374; x=1674234374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s4miFMWNrJEYE14jyEf6HP4pBbWwtCr246O3bV40/Dk=;
  b=VrPkLFDbnumUPQ+63kjmhdvViaqwtT+Re6ol8VpQiWbcYR1pN9ep7gqY
   WNw9FaQbeeuTSCvAvOOYOYcgNsBzIF+13pbNt708Kmntj3EYpb2H9cYyF
   CRNUZvwRL7fI4h1hDDDuIa7Z2kwcMwIvS8vcSjIs/lxxQwLRPWrmZXTr9
   K5sMCgdfE/Iq9exQ4Ad54KP/USv/SJx6ok8JxFnbDAgMgvQxqkFoakiOZ
   1yr2LVu21rXpiMtFo1bJk4yYG7VzG7He3LlvP8VN9bnND8Mduase0D8AX
   s5gwfr62OS+PfWvCQ3YJTF5f+cjzBEa+7iE0LQoHS+ztpPEbdSTrtIvuB
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="244222438"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; 
   d="scan'208";a="244222438"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 09:06:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; 
   d="scan'208";a="579266452"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Jan 2022 09:06:12 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nAat1-000EV5-G7; Thu, 20 Jan 2022 17:06:11 +0000
Date: Fri, 21 Jan 2022 01:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v4 2/9] spi: Create helper API to lookup ACPI info for
 spi device
Message-ID: <202201210053.wHFMeXIN-lkp@intel.com>
References: <20220120134326.5295-3-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120134326.5295-3-sbinding@opensource.cirrus.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Stefan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220120]
[also build test WARNING on v5.16]
[cannot apply to broonie-spi/for-next rafael-pm/linux-next tiwai-sound/for-next linus/master v5.16 v5.16-rc8 v5.16-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Stefan-Binding/Support-Spi-in-i2c-multi-instantiate-driver/20220120-214608
base:    7fc5253f5a13271e9df35d6b936ff97b74540a59
config: hexagon-randconfig-r045-20220120 (https://download.01.org/0day-ci/archive/20220121/202201210053.wHFMeXIN-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b7138a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/aedf84002ec1568907471591915e28bed40e8f9a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stefan-Binding/Support-Spi-in-i2c-multi-instantiate-driver/20220120-214608
        git checkout aedf84002ec1568907471591915e28bed40e8f9a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/platform/mtk-mdp/ drivers/media/platform/s5p-jpeg/ drivers/media/platform/s5p-mfc/ drivers/media/platform/ti-vpe/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/mtk-mdp/mtk_mdp_core.c:22:
   In file included from drivers/media/platform/mtk-mdp/mtk_mdp_core.h:13:
   In file included from include/media/v4l2-device.h:13:
   In file included from include/media/v4l2-subdev.h:15:
   In file included from include/media/v4l2-common.h:270:
   include/linux/spi/spi.h:769:1: error: expected identifier or '('
   {
   ^
>> drivers/media/platform/mtk-mdp/mtk_mdp_core.c:207:52: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
           ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   1 warning and 1 error generated.
--
   In file included from drivers/media/platform/s5p-jpeg/jpeg-core.c:31:
   In file included from drivers/media/platform/s5p-jpeg/jpeg-core.h:14:
   In file included from include/media/v4l2-device.h:13:
   In file included from include/media/v4l2-subdev.h:15:
   In file included from include/media/v4l2-common.h:270:
   include/linux/spi/spi.h:769:1: error: expected identifier or '('
   {
   ^
>> drivers/media/platform/s5p-jpeg/jpeg-core.c:2913:46: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
           vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   1 warning and 1 error generated.
--
   In file included from drivers/media/platform/s5p-mfc/s5p_mfc.c:24:
   In file included from drivers/media/platform/s5p-mfc/s5p_mfc_common.h:18:
   In file included from include/media/v4l2-device.h:13:
   In file included from include/media/v4l2-subdev.h:15:
   In file included from include/media/v4l2-common.h:270:
   include/linux/spi/spi.h:769:1: error: expected identifier or '('
   {
   ^
>> drivers/media/platform/s5p-mfc/s5p_mfc.c:1169:6: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
                                           DMA_BIT_MASK(32));
                                           ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   drivers/media/platform/s5p-mfc/s5p_mfc.c:1171:6: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
                                           DMA_BIT_MASK(32));
                                           ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   drivers/media/platform/s5p-mfc/s5p_mfc.c:1227:39: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
           vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK(32));
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~      ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   3 warnings and 1 error generated.
--
   In file included from drivers/media/platform/ti-vpe/cal.c:25:
   In file included from include/media/v4l2-common.h:270:
   include/linux/spi/spi.h:769:1: error: expected identifier or '('
   {
   ^
>> drivers/media/platform/ti-vpe/cal.c:902:44: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
           vb2_dma_contig_set_max_seg_size(cal->dev, DMA_BIT_MASK(32));
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~           ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   1 warning and 1 error generated.


vim +207 drivers/media/platform/mtk-mdp/mtk_mdp_core.c

86698b9505bbc9 Eizan Miyamoto        2020-05-07  105  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  106  static int mtk_mdp_probe(struct platform_device *pdev)
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  107  {
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  108  	struct mtk_mdp_dev *mdp;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  109  	struct device *dev = &pdev->dev;
ba1f1f70c2c08f Daniel Kurtz          2017-05-23  110  	struct device_node *node, *parent;
86698b9505bbc9 Eizan Miyamoto        2020-05-07  111  	struct mtk_mdp_comp *comp, *comp_temp;
86698b9505bbc9 Eizan Miyamoto        2020-05-07  112  	int ret = 0;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  113  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  114  	mdp = devm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  115  	if (!mdp)
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  116  		return -ENOMEM;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  117  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  118  	mdp->id = pdev->id;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  119  	mdp->pdev = pdev;
86698b9505bbc9 Eizan Miyamoto        2020-05-07  120  	INIT_LIST_HEAD(&mdp->comp_list);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  121  	INIT_LIST_HEAD(&mdp->ctx_list);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  122  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  123  	mutex_init(&mdp->lock);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  124  	mutex_init(&mdp->vpulock);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  125  
ba1f1f70c2c08f Daniel Kurtz          2017-05-23  126  	/* Old dts had the components as child nodes */
864919ea0380e6 Matthias Brugger      2019-06-21  127  	node = of_get_next_child(dev->of_node, NULL);
864919ea0380e6 Matthias Brugger      2019-06-21  128  	if (node) {
864919ea0380e6 Matthias Brugger      2019-06-21  129  		of_node_put(node);
ba1f1f70c2c08f Daniel Kurtz          2017-05-23  130  		parent = dev->of_node;
ba1f1f70c2c08f Daniel Kurtz          2017-05-23  131  		dev_warn(dev, "device tree is out of date\n");
ba1f1f70c2c08f Daniel Kurtz          2017-05-23  132  	} else {
ba1f1f70c2c08f Daniel Kurtz          2017-05-23  133  		parent = dev->of_node->parent;
ba1f1f70c2c08f Daniel Kurtz          2017-05-23  134  	}
ba1f1f70c2c08f Daniel Kurtz          2017-05-23  135  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  136  	/* Iterate over sibling MDP function blocks */
ba1f1f70c2c08f Daniel Kurtz          2017-05-23  137  	for_each_child_of_node(parent, node) {
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  138  		const struct of_device_id *of_id;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  139  		enum mtk_mdp_comp_type comp_type;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  140  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  141  		of_id = of_match_node(mtk_mdp_comp_dt_ids, node);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  142  		if (!of_id)
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  143  			continue;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  144  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  145  		if (!of_device_is_available(node)) {
68d9c47b1679ec Rob Herring           2017-07-21  146  			dev_err(dev, "Skipping disabled component %pOF\n",
68d9c47b1679ec Rob Herring           2017-07-21  147  				node);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  148  			continue;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  149  		}
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  150  
440aae04f38bf5 Mauro Carvalho Chehab 2021-11-24  151  		comp_type = (uintptr_t)of_id->data;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  152  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  153  		comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  154  		if (!comp) {
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  155  			ret = -ENOMEM;
22ff7d4ca3f748 Nishka Dasgupta       2019-07-09  156  			of_node_put(node);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  157  			goto err_comp;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  158  		}
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  159  
37e278c801078d Eizan Miyamoto        2020-05-07  160  		ret = mtk_mdp_comp_init(dev, node, comp, comp_type);
22ff7d4ca3f748 Nishka Dasgupta       2019-07-09  161  		if (ret) {
22ff7d4ca3f748 Nishka Dasgupta       2019-07-09  162  			of_node_put(node);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  163  			goto err_comp;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  164  		}
86698b9505bbc9 Eizan Miyamoto        2020-05-07  165  
86698b9505bbc9 Eizan Miyamoto        2020-05-07  166  		mtk_mdp_register_component(mdp, comp);
22ff7d4ca3f748 Nishka Dasgupta       2019-07-09  167  	}
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  168  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  169  	mdp->job_wq = create_singlethread_workqueue(MTK_MDP_MODULE_NAME);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  170  	if (!mdp->job_wq) {
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  171  		dev_err(&pdev->dev, "unable to alloc job workqueue\n");
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  172  		ret = -ENOMEM;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  173  		goto err_alloc_job_wq;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  174  	}
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  175  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  176  	mdp->wdt_wq = create_singlethread_workqueue("mdp_wdt_wq");
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  177  	if (!mdp->wdt_wq) {
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  178  		dev_err(&pdev->dev, "unable to alloc wdt workqueue\n");
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  179  		ret = -ENOMEM;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  180  		goto err_alloc_wdt_wq;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  181  	}
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  182  	INIT_WORK(&mdp->wdt_work, mtk_mdp_wdt_worker);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  183  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  184  	ret = v4l2_device_register(dev, &mdp->v4l2_dev);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  185  	if (ret) {
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  186  		dev_err(&pdev->dev, "Failed to register v4l2 device\n");
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  187  		ret = -EINVAL;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  188  		goto err_dev_register;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  189  	}
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  190  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  191  	ret = mtk_mdp_register_m2m_device(mdp);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  192  	if (ret) {
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  193  		v4l2_err(&mdp->v4l2_dev, "Failed to init mem2mem device\n");
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  194  		goto err_m2m_register;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  195  	}
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  196  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  197  	mdp->vpu_dev = vpu_get_plat_device(pdev);
ee18fc7b0b9517 Eizan Miyamoto        2020-05-07  198  	ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  199  				  VPU_RST_MDP);
ee18fc7b0b9517 Eizan Miyamoto        2020-05-07  200  	if (ret) {
ee18fc7b0b9517 Eizan Miyamoto        2020-05-07  201  		dev_err(&pdev->dev, "Failed to register reset handler\n");
ee18fc7b0b9517 Eizan Miyamoto        2020-05-07  202  		goto err_m2m_register;
ee18fc7b0b9517 Eizan Miyamoto        2020-05-07  203  	}
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  204  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  205  	platform_set_drvdata(pdev, mdp);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  206  
256a12e1a343e1 Eizan Miyamoto        2020-05-07 @207  	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
256a12e1a343e1 Eizan Miyamoto        2020-05-07  208  	if (ret) {
256a12e1a343e1 Eizan Miyamoto        2020-05-07  209  		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
256a12e1a343e1 Eizan Miyamoto        2020-05-07  210  		goto err_m2m_register;
256a12e1a343e1 Eizan Miyamoto        2020-05-07  211  	}
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  212  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  213  	pm_runtime_enable(dev);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  214  	dev_dbg(dev, "mdp-%d registered successfully\n", mdp->id);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  215  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  216  	return 0;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  217  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  218  err_m2m_register:
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  219  	v4l2_device_unregister(&mdp->v4l2_dev);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  220  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  221  err_dev_register:
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  222  	destroy_workqueue(mdp->wdt_wq);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  223  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  224  err_alloc_wdt_wq:
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  225  	destroy_workqueue(mdp->job_wq);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  226  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  227  err_alloc_job_wq:
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  228  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  229  err_comp:
86698b9505bbc9 Eizan Miyamoto        2020-05-07  230  	list_for_each_entry_safe(comp, comp_temp, &mdp->comp_list, node) {
86698b9505bbc9 Eizan Miyamoto        2020-05-07  231  		mtk_mdp_unregister_component(mdp, comp);
86698b9505bbc9 Eizan Miyamoto        2020-05-07  232  		mtk_mdp_comp_deinit(dev, comp);
86698b9505bbc9 Eizan Miyamoto        2020-05-07  233  	}
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  234  
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  235  	dev_dbg(dev, "err %d\n", ret);
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  236  	return ret;
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  237  }
c8eb2d7e8202fd Minghsiu Tsai         2016-09-08  238  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
