Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FDF204C35;
	Mon,  3 Feb 2025 17:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738604883; cv=none; b=FWkrArzq5U7FntdCt+pk1XgvpciJjNa5Gmno1hH+5h2cngRskMlg9jygPWUawmJeCRy75/AJSZk78BKK1yRaEvc7i4XLuTgecopWhlTGl6fabOpC60mUbLxiDtRbkR9SBx21Pbu1md8HnPMyLk+oXop9bo16sdfEdHcgkz615Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738604883; c=relaxed/simple;
	bh=r7ywG3oPe47bFimzyLsTkzCCa+tjRwEUAzZXIfZh4rE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PnLFSQ2wp6ihfDss8IIWwTjzk4WkvI67kOVZhPONWEtnWxjRAQE79MXl5bv8JIWvlIIfvvAbm4rj49Hx25xQIXzfQ8jW2vnPC9eDSFLlBqkUYgpw/XcHitRLG8oqNjaIl6amUBlq8hfNSSBuwPiXY48eLF44V08znArvXhD799Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rwuk69Gj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rwuk69Gj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738604882; x=1770140882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r7ywG3oPe47bFimzyLsTkzCCa+tjRwEUAzZXIfZh4rE=;
  b=Rwuk69GjR7qjy+LS3UkKla56t0dlZ7s7J99wDSVbM8j6ZDsC/bBpMZmD
   3yj6C4S8j9juUcrNotpq0VM/8Ti5mrzHEdsw3AGEFi5jYTKRO/7EKnbTG
   BT82MHbShIylaD0vArZG8Skr8g3sss96EQdYgmWbmQrbcoXFZPOR7MjWC
   64DkuQgLG4YxUtRcjMLFQT7L6JWv0wSwJv8oMKcVltTR8yyUuodDGVlyu
   6LRT3+k9LBbUDF85CdNeoMxFxeFK+icCJQofKw/z48tCjpjkWBhLu56XJ
   lo+ZIm7MgQ0R81aggLVUr2sH6FFaW+msXvTMjP60nrw7b0yP2/0UCYm6C
   Q==;
X-CSE-ConnectionGUID: Z2F0KHpWTxWElLILDqV9aQ==
X-CSE-MsgGUID: TZD0eEm+TDu+gYDnt+Gwog==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42858234"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="42858234"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 09:48:02 -0800
X-CSE-ConnectionGUID: JpYecrKMR8u+IzSlahRVuQ==
X-CSE-MsgGUID: q2mE1B9CSR2QlNWRv6bZUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110156375"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Feb 2025 09:48:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf0Y9-000rHS-3B;
	Mon, 03 Feb 2025 17:47:57 +0000
Date: Tue, 4 Feb 2025 01:47:50 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.13-esp32 20/53]
 drivers/misc/esp32-ipc.c:152:13: warning: cast to 'void *' from smaller
 integer type 'u32' (aka 'unsigned int')
Message-ID: <202502040118.QjCwAnwW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.13-esp32
head:   f4a6cef2509c4e81637b6d5d6f0c27966895985a
commit: ff5d67ac76ee59b6351fd6f70df8d0178ef4f72a [20/53] misc/esp32-ipc: introduce generic IPC for ESP32
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20250204/202502040118.QjCwAnwW-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040118.QjCwAnwW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040118.QjCwAnwW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/esp32-ipc.c:152:13: warning: cast to 'void *' from smaller integer type 'u32' (aka 'unsigned int') [-Wint-to-void-pointer-cast]
     152 |         hw->hw_q = (void *)readl(p);
         |                    ^~~~~~~~~~~~~~~~
   1 warning generated.


vim +152 drivers/misc/esp32-ipc.c

   144	
   145	static int init_hw(struct platform_device *pdev, struct esp32_ipc *hw)
   146	{
   147		void __iomem *p;
   148	
   149		p = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
   150		if (IS_ERR(p))
   151			return PTR_ERR(p);
 > 152		hw->hw_q = (void *)readl(p);
   153		devm_iounmap(&pdev->dev, p);
   154	
   155		hw->regs = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 1, NULL);
   156		if (IS_ERR(hw->regs))
   157			return PTR_ERR(hw->regs);
   158	
   159		dev_dbg(&pdev->dev, "%s: regs = %p, queues = %p\n",
   160			__func__, hw->regs, hw->hw_q);
   161		if (hw->hw_q) {
   162			u32 i;
   163	
   164			for (i = 0; i < 2; ++i) {
   165				dev_dbg(&pdev->dev, "%s: queue %d: offset = %d, mask = %x\n",
   166					__func__, i,
   167					hw->hw_q[i].offset,
   168					hw->hw_q[i].mask);
   169			}
   170		} else {
   171			return -ENODEV;
   172		}
   173	
   174		hw->irq = platform_get_irq(pdev, 0);
   175		if (hw->irq >= 0) {
   176			int ret;
   177	
   178			ret = devm_request_threaded_irq(&pdev->dev, hw->irq,
   179							esp32_ipc_irq_handler,
   180							esp32_ipc_thread_handler,
   181							IRQF_SHARED, pdev->name, hw);
   182			if (ret < 0) {
   183				dev_err(&pdev->dev, "request_irq %d failed\n", hw->irq);
   184				return ret;
   185			}
   186		} else {
   187			dev_err(&pdev->dev, "missing IRQ property\n");
   188			return -ENODEV;
   189		}
   190	
   191		return 0;
   192	}
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
