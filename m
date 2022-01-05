Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346D92C9C
	for <llvm@lists.linux.dev>; Wed,  5 Jan 2022 22:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641421693; x=1672957693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FQf/zKa8rC0Lu6XcT0yR8MM5aSgSEEOw1Ma/2F1r0lM=;
  b=dWNY2d4+ddQuwlAr49fA9l3YuWLOCdlNd0QHFzNotLRthav4lRx+8lvX
   KVEYHTyCU0vNqZbtRSI+Rl09JvnocbILrWYrtFlt5YG6HQ1i5AW1DbaO8
   mYjc5yJcfGTs2Z40byCmgL2njOSqt0o7xwsbSLwZkGegARSZob4ykMr4K
   7o7FYUmbspuEfimRNVwU1uo7xrUv7FG0NWSl0vmNtRgIs1RCuerHRw1hl
   OzPHAH7wG6jp7MPdQRdDOtT8L50SI3crJMFUkgmP56EoQsh2dvlwuQ85c
   B40szjM/FBN/2sQVKAsNfclxNnaEmF3lS/kWLjImhvSq+Rd/MR0+Pm5ts
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="266830540"
X-IronPort-AV: E=Sophos;i="5.88,265,1635231600"; 
   d="scan'208";a="266830540"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 14:28:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,265,1635231600"; 
   d="scan'208";a="488740134"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Jan 2022 14:28:00 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5El9-000H5c-02; Wed, 05 Jan 2022 22:27:55 +0000
Date: Thu, 6 Jan 2022 06:27:18 +0800
From: kernel test robot <lkp@intel.com>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] media: bdisp: Fix PM disable depth imbalance in
 bdisp_probe
Message-ID: <202201060603.USzesOiZ-lkp@intel.com>
References: <20220105114108.10380-1-linmq006@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105114108.10380-1-linmq006@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Miaoqian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v5.16-rc8]
[also build test WARNING on next-20220105]
[cannot apply to media-tree/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miaoqian-Lin/media-bdisp-Fix-PM-disable-depth-imbalance-in-bdisp_probe/20220105-194236
base:    c9e6606c7fe92b50a02ce51dda82586ebdf99b48
config: riscv-randconfig-r022-20220105 (https://download.01.org/0day-ci/archive/20220106/202201060603.USzesOiZ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d5b6e30ed3acad794dd0aec400e617daffc6cc3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/1dafbde5425a5766336413fbcab0bb191145da2e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miaoqian-Lin/media-bdisp-Fix-PM-disable-depth-imbalance-in-bdisp_probe/20220105-194236
        git checkout 1dafbde5425a5766336413fbcab0bb191145da2e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/media/platform/sti/bdisp/ drivers/media/platform/sti/hva/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/sti/bdisp/bdisp-v4l2.c:1399:1: warning: unused label 'disable_pm_runtime' [-Wunused-label]
   disable_pm_runtime:
   ^~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/disable_pm_runtime +1399 drivers/media/platform/sti/bdisp/bdisp-v4l2.c

  1283	
  1284	static int bdisp_probe(struct platform_device *pdev)
  1285	{
  1286		struct bdisp_dev *bdisp;
  1287		struct resource *res;
  1288		struct device *dev = &pdev->dev;
  1289		int ret;
  1290	
  1291		dev_dbg(dev, "%s\n", __func__);
  1292	
  1293		bdisp = devm_kzalloc(dev, sizeof(struct bdisp_dev), GFP_KERNEL);
  1294		if (!bdisp)
  1295			return -ENOMEM;
  1296	
  1297		ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
  1298		if (ret)
  1299			return ret;
  1300	
  1301		bdisp->pdev = pdev;
  1302		bdisp->dev = dev;
  1303		platform_set_drvdata(pdev, bdisp);
  1304	
  1305		if (dev->of_node)
  1306			bdisp->id = of_alias_get_id(pdev->dev.of_node, BDISP_NAME);
  1307		else
  1308			bdisp->id = pdev->id;
  1309	
  1310		init_waitqueue_head(&bdisp->irq_queue);
  1311		INIT_DELAYED_WORK(&bdisp->timeout_work, bdisp_irq_timeout);
  1312		bdisp->work_queue = create_workqueue(BDISP_NAME);
  1313	
  1314		spin_lock_init(&bdisp->slock);
  1315		mutex_init(&bdisp->lock);
  1316	
  1317		/* get resources */
  1318		bdisp->regs = devm_platform_ioremap_resource(pdev, 0);
  1319		if (IS_ERR(bdisp->regs)) {
  1320			ret = PTR_ERR(bdisp->regs);
  1321			goto err_wq;
  1322		}
  1323	
  1324		bdisp->clock = devm_clk_get(dev, BDISP_NAME);
  1325		if (IS_ERR(bdisp->clock)) {
  1326			dev_err(dev, "failed to get clock\n");
  1327			ret = PTR_ERR(bdisp->clock);
  1328			goto err_wq;
  1329		}
  1330	
  1331		ret = clk_prepare(bdisp->clock);
  1332		if (ret < 0) {
  1333			dev_err(dev, "clock prepare failed\n");
  1334			bdisp->clock = ERR_PTR(-EINVAL);
  1335			goto err_wq;
  1336		}
  1337	
  1338		res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
  1339		if (!res) {
  1340			dev_err(dev, "failed to get IRQ resource\n");
  1341			ret = -EINVAL;
  1342			goto err_clk;
  1343		}
  1344	
  1345		ret = devm_request_threaded_irq(dev, res->start, bdisp_irq_handler,
  1346						bdisp_irq_thread, IRQF_ONESHOT,
  1347						pdev->name, bdisp);
  1348		if (ret) {
  1349			dev_err(dev, "failed to install irq\n");
  1350			goto err_clk;
  1351		}
  1352	
  1353		/* v4l2 register */
  1354		ret = v4l2_device_register(dev, &bdisp->v4l2_dev);
  1355		if (ret) {
  1356			dev_err(dev, "failed to register\n");
  1357			goto err_clk;
  1358		}
  1359	
  1360		/* Debug */
  1361		bdisp_debugfs_create(bdisp);
  1362	
  1363		/* Power management */
  1364		pm_runtime_enable(dev);
  1365		ret = pm_runtime_resume_and_get(dev);
  1366		if (ret < 0) {
  1367			dev_err(dev, "failed to set PM\n");
  1368			goto err_remove;
  1369		}
  1370	
  1371		/* Filters */
  1372		if (bdisp_hw_alloc_filters(bdisp->dev)) {
  1373			dev_err(bdisp->dev, "no memory for filters\n");
  1374			ret = -ENOMEM;
  1375			goto err_pm;
  1376		}
  1377	
  1378		/* Register */
  1379		ret = bdisp_register_device(bdisp);
  1380		if (ret) {
  1381			dev_err(dev, "failed to register\n");
  1382			goto err_filter;
  1383		}
  1384	
  1385		dev_info(dev, "%s%d registered as /dev/video%d\n", BDISP_NAME,
  1386			 bdisp->id, bdisp->vdev.num);
  1387	
  1388		pm_runtime_put(dev);
  1389	
  1390		return 0;
  1391	
  1392	err_filter:
  1393		bdisp_hw_free_filters(bdisp->dev);
  1394	err_pm:
  1395		pm_runtime_put(dev);
  1396	err_remove:
  1397		bdisp_debugfs_remove(bdisp);
  1398		v4l2_device_unregister(&bdisp->v4l2_dev);
> 1399	disable_pm_runtime:
  1400		pm_runtime_disable(dev);
  1401	err_clk:
  1402		if (!IS_ERR(bdisp->clock))
  1403			clk_unprepare(bdisp->clock);
  1404	err_wq:
  1405		destroy_workqueue(bdisp->work_queue);
  1406		return ret;
  1407	}
  1408	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
