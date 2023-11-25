Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D8328383;
	Sat, 25 Nov 2023 16:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jpvm1fSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700930948; x=1732466948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i7bUTPc3qc71O1a9EnGI3M8RsQX18i7Jb4RY4ZFnui8=;
  b=Jpvm1fSaGmswi750cp6c+XBWnxe4cYJrArkY1eWDhIle/tXPB8HXHia2
   W4tUXV2O4eooYsnWiUw9DW2MbCKQnyTdfk7GTdl2DQyrBnpr/m4+JZvJX
   o6+cGKEuespvnGC3XZ19D9tNEschyviz/fkEJTtxNpRTKK2nB6rziZumb
   2YzWMiAwHKTbR72FrEfUifbpkzyLmtibMpfhiZsxrUTWMy6zAQws04ogx
   iml3Skz4+LxNThXz7CH1xbcPPZyig54jIC6yY6CYaV4r11GzB1gqSQLfJ
   17JldNckGY+9jRnftZJeSX6EQREd7GnPEnENWzB0eEbE9jbCzE4qPfoD5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="456855096"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="456855096"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 08:49:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="796841732"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="796841732"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 25 Nov 2023 08:49:06 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6vq4-0004DN-1R;
	Sat, 25 Nov 2023 16:49:04 +0000
Date: Sun, 26 Nov 2023 00:48:27 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.7-rc1-esp32 11/44]
 drivers/misc/esp32-ipc.c:151:13: warning: cast to 'void *' from smaller
 integer type 'unsigned int'
Message-ID: <202311252357.HFUjhapv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.7-rc1-esp32
head:   29146ecac0ff1d907be16ff18d485a34985f6bf3
commit: ddc8ee92ef8113ef5f3baf89492755b82c9f7121 [11/44] misc/esp32-ipc: introduce generic IPC for ESP32
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231125/202311252357.HFUjhapv-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311252357.HFUjhapv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311252357.HFUjhapv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/esp32-ipc.c:151:13: warning: cast to 'void *' from smaller integer type 'unsigned int' [-Wint-to-void-pointer-cast]
           hw->hw_q = (void *)readl(p);
                      ^~~~~~~~~~~~~~~~
   1 warning generated.


vim +151 drivers/misc/esp32-ipc.c

   143	
   144	static int init_hw(struct platform_device *pdev, struct esp32_ipc *hw)
   145	{
   146		void __iomem *p;
   147	
   148		p = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
   149		if (IS_ERR(p))
   150			return PTR_ERR(p);
 > 151		hw->hw_q = (void *)readl(p);
   152		devm_iounmap(&pdev->dev, p);
   153	
   154		hw->regs = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 1, NULL);
   155		if (IS_ERR(hw->regs))
   156			return PTR_ERR(hw->regs);
   157	
   158		dev_dbg(&pdev->dev, "%s: regs = %p, queues = %p\n",
   159			__func__, hw->regs, hw->hw_q);
   160		if (hw->hw_q) {
   161			u32 i;
   162	
   163			for (i = 0; i < 2; ++i) {
   164				dev_dbg(&pdev->dev, "%s: queue %d: offset = %d, mask = %x\n",
   165					__func__, i,
   166					hw->hw_q[i].offset,
   167					hw->hw_q[i].mask);
   168			}
   169		} else {
   170			return -ENODEV;
   171		}
   172	
   173		hw->irq = platform_get_irq(pdev, 0);
   174		if (hw->irq >= 0) {
   175			int ret;
   176	
   177			ret = devm_request_threaded_irq(&pdev->dev, hw->irq,
   178							esp32_ipc_irq_handler,
   179							esp32_ipc_thread_handler,
   180							IRQF_SHARED, pdev->name, hw);
   181			if (ret < 0) {
   182				dev_err(&pdev->dev, "request_irq %d failed\n", hw->irq);
   183				return ret;
   184			}
   185		} else {
   186			dev_err(&pdev->dev, "missing IRQ property\n");
   187			return -ENODEV;
   188		}
   189	
   190		return 0;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
