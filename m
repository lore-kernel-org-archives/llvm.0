Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200342C80
	for <llvm@lists.linux.dev>; Wed,  5 Jan 2022 21:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641416816; x=1672952816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/kX3xlNKd7PQ94vZqA0I+UTYEuqsQjXl0Dmg4SBbNN0=;
  b=b39xmj9SQmqHo81moxreXCpcgiMrJmFRTtefiG88Cv2dn7wmNO9qi3v+
   ywpFPAxfgCCwrT/YePuvN2DDNqyf2/Jq0WhrMYuXag0okogTee7MJkRrP
   04kwlTHuD0dhU/pRSfE4VQdjSugKi9IM4NhwxwiO5hFmNTHK35JoZwCgJ
   o7/yRbYHZEaMyKnDukibxm/phTeXxCnaOyFOjVWuRraRl4qkSkCnsG/lH
   N7PRTK8yWl8XOz8mwByV2wibPVGT+6qrWv16mwyUBu0eAOta3cXCbTvDf
   krht1pfoJAQboXZ4bE01BlQ3JFTW0YkRUsDk3dBa9gBxvP6jPhvriH9th
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="223220829"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="223220829"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 13:06:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="668235511"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2022 13:06:54 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5DUj-000H2m-Sb; Wed, 05 Jan 2022 21:06:53 +0000
Date: Thu, 6 Jan 2022 05:05:52 +0800
From: kernel test robot <lkp@intel.com>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] media: st-delta: Fix PM disable depth imbalance in
 delta_probe
Message-ID: <202201060446.2MV9VJaE-lkp@intel.com>
References: <20220105115515.12196-1-linmq006@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105115515.12196-1-linmq006@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Miaoqian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.16-rc8 next-20220105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miaoqian-Lin/media-st-delta-Fix-PM-disable-depth-imbalance-in-delta_probe/20220105-195600
base:   git://linuxtv.org/media_tree.git master
config: riscv-randconfig-r022-20220105 (https://download.01.org/0day-ci/archive/20220106/202201060446.2MV9VJaE-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d5b6e30ed3acad794dd0aec400e617daffc6cc3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/df377b6adc1cca5963348f9ac16f033e5da299cb
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miaoqian-Lin/media-st-delta-Fix-PM-disable-depth-imbalance-in-delta_probe/20220105-195600
        git checkout df377b6adc1cca5963348f9ac16f033e5da299cb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/media/platform/sti/bdisp/ drivers/media/platform/sti/delta/ drivers/media/platform/sti/hva/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/sti/delta/delta-v4l2.c:1901:1: warning: unused label 'disable_pm_runtime' [-Wunused-label]
   disable_pm_runtime:
   ^~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/disable_pm_runtime +1901 drivers/media/platform/sti/delta/delta-v4l2.c

  1812	
  1813	static int delta_probe(struct platform_device *pdev)
  1814	{
  1815		struct delta_dev *delta;
  1816		struct device *dev = &pdev->dev;
  1817		int ret;
  1818	
  1819		delta = devm_kzalloc(dev, sizeof(*delta), GFP_KERNEL);
  1820		if (!delta) {
  1821			ret = -ENOMEM;
  1822			goto err;
  1823		}
  1824	
  1825		delta->dev = dev;
  1826		delta->pdev = pdev;
  1827		platform_set_drvdata(pdev, delta);
  1828	
  1829		mutex_init(&delta->lock);
  1830	
  1831		/* get clock resources */
  1832		delta->clk_delta = devm_clk_get(dev, "delta");
  1833		if (IS_ERR(delta->clk_delta)) {
  1834			dev_dbg(dev, "%s can't get delta clock\n", DELTA_PREFIX);
  1835			delta->clk_delta = NULL;
  1836		}
  1837	
  1838		delta->clk_st231 = devm_clk_get(dev, "delta-st231");
  1839		if (IS_ERR(delta->clk_st231)) {
  1840			dev_dbg(dev, "%s can't get delta-st231 clock\n", DELTA_PREFIX);
  1841			delta->clk_st231 = NULL;
  1842		}
  1843	
  1844		delta->clk_flash_promip = devm_clk_get(dev, "delta-flash-promip");
  1845		if (IS_ERR(delta->clk_flash_promip)) {
  1846			dev_dbg(dev, "%s can't get delta-flash-promip clock\n",
  1847				DELTA_PREFIX);
  1848			delta->clk_flash_promip = NULL;
  1849		}
  1850	
  1851		/* init pm_runtime used for power management */
  1852		pm_runtime_set_autosuspend_delay(dev, DELTA_HW_AUTOSUSPEND_DELAY_MS);
  1853		pm_runtime_use_autosuspend(dev);
  1854		pm_runtime_set_suspended(dev);
  1855		pm_runtime_enable(dev);
  1856	
  1857		/* init firmware ipc channel */
  1858		ret = delta_ipc_init(delta);
  1859		if (ret) {
  1860			dev_err(delta->dev, "%s failed to initialize firmware ipc channel\n",
  1861				DELTA_PREFIX);
  1862			goto err;
  1863		}
  1864	
  1865		/* register all available decoders */
  1866		register_decoders(delta);
  1867	
  1868		/* register all supported formats */
  1869		register_formats(delta);
  1870	
  1871		/* register on V4L2 */
  1872		ret = v4l2_device_register(dev, &delta->v4l2_dev);
  1873		if (ret) {
  1874			dev_err(delta->dev, "%s failed to register V4L2 device\n",
  1875				DELTA_PREFIX);
  1876			goto err;
  1877		}
  1878	
  1879		delta->work_queue = create_workqueue(DELTA_NAME);
  1880		if (!delta->work_queue) {
  1881			dev_err(delta->dev, "%s failed to allocate work queue\n",
  1882				DELTA_PREFIX);
  1883			ret = -ENOMEM;
  1884			goto err_v4l2;
  1885		}
  1886	
  1887		/* register device */
  1888		ret = delta_register_device(delta);
  1889		if (ret)
  1890			goto err_work_queue;
  1891	
  1892		dev_info(dev, "%s %s registered as /dev/video%d\n",
  1893			 DELTA_PREFIX, delta->vdev->name, delta->vdev->num);
  1894	
  1895		return 0;
  1896	
  1897	err_work_queue:
  1898		destroy_workqueue(delta->work_queue);
  1899	err_v4l2:
  1900		v4l2_device_unregister(&delta->v4l2_dev);
> 1901	disable_pm_runtime:
  1902		pm_runtime_disable(dev);
  1903	err:
  1904		return ret;
  1905	}
  1906	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
