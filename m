Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD66D24B42;
	Thu, 18 Jan 2024 13:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705585701; cv=none; b=iWVzVUcaVZbvgkMXEWDGrAQwdpDvt2mmDLi05dGxcFBr582gMMQwTYXgHUXqO4/mZtPpaNm5FgcrxH7D/+5JMRMVmkunCER6tKX5j4J5V7MmGZp9V8xVgtWaS/sffTSzQIpgZfBe3QD7PM8nifEZVgf6fHMpQR1C5J7Kv4gbCM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705585701; c=relaxed/simple;
	bh=O/KCkuFCdvv/C/B+O90MD08CFcb8Hpt4zZkI47dp6+o=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=clznJoZc6jIQlnitVkfCL9zxWzoUCW45qZEWD0UTu6WDrN6uhtfWnde8wWxF1lYJqQ5AEWRYlJ7Oac6bI4EkGKv6LNxynHwWQ4JkY/84QDF+j5xDFR08EDECopXhdB5DGf35UNEhsx8Qf2PPwfjtdG/NT/RVc3NVl6206o3sWb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVXK7Bkq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVXK7Bkq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705585700; x=1737121700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O/KCkuFCdvv/C/B+O90MD08CFcb8Hpt4zZkI47dp6+o=;
  b=fVXK7BkqHXfuVcdNDobR2ppFBNj+ZXhIfodMB1lNo64OHiCEEmX4+odp
   ST8Dxt99JRGNbSaCMMhS7xF/OQGD/K2lkswxH1Np6j4CtkfDYcMNEE+pS
   9aZH4f5fGYX26FAuMLTNZVgl/Qhhj6tdEqt82FMx/GU5CfGBGAPUxpDbD
   GIfM6QiDRR604RFr7Uf2Szg49987BT1aO3TGXbhS1Yy94er3jJt4vJTJH
   UdvXMl4eS0Lu8loAcmbJfu5PptarJnPCOHLI/A0ej1UchVauN074qd7Jd
   5j0a5LqsuYpO4/eSAslmkuEHBHYM7YjkqaO08L3ZcsqWqQMKljhPQ99ss
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7826220"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7826220"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 05:48:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="26769984"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jan 2024 05:48:17 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQSkh-00031I-0p;
	Thu, 18 Jan 2024 13:48:15 +0000
Date: Thu, 18 Jan 2024 21:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
 15602/15673] drivers/spmi/hisi-spmi-controller.c:308:17: error: incompatible
 function pointer types assigning to 'int (*)(struct spmi_controller *, u8,
 u8, u8, u16, u8 *, size_t)' (aka 'int (*)(struct spmi_controller *, unsigned
 char, unsigned char, unsigned char, uns...
Message-ID: <202401182149.0tH7wj1O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
head:   5cac1bb64a0300d340c5e369489c731b30aa5e79
commit: ad3c44509074f9f896bcdec6d6b1f051b169dcf6 [15602/15673] spmi: Add support for multi-master
config: i386-buildonly-randconfig-002-20240118 (https://download.01.org/0day-ci/archive/20240118/202401182149.0tH7wj1O-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401182149.0tH7wj1O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401182149.0tH7wj1O-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spmi/hisi-spmi-controller.c:308:17: error: incompatible function pointer types assigning to 'int (*)(struct spmi_controller *, u8, u8, u8, u16, u8 *, size_t)' (aka 'int (*)(struct spmi_controller *, unsigned char, unsigned char, unsigned char, unsigned short, unsigned char *, unsigned int)') from 'int (struct spmi_controller *, u8, u8, u16, u8 *, size_t)' (aka 'int (struct spmi_controller *, unsigned char, unsigned char, unsigned short, unsigned char *, unsigned int)') [-Wincompatible-function-pointer-types]
     308 |         ctrl->read_cmd = spmi_read_cmd;
         |                        ^ ~~~~~~~~~~~~~
>> drivers/spmi/hisi-spmi-controller.c:309:18: error: incompatible function pointer types assigning to 'int (*)(struct spmi_controller *, u8, u8, u8, u16, const u8 *, size_t)' (aka 'int (*)(struct spmi_controller *, unsigned char, unsigned char, unsigned char, unsigned short, const unsigned char *, unsigned int)') from 'int (struct spmi_controller *, u8, u8, u16, const u8 *, size_t)' (aka 'int (struct spmi_controller *, unsigned char, unsigned char, unsigned short, const unsigned char *, unsigned int)') [-Wincompatible-function-pointer-types]
     309 |         ctrl->write_cmd = spmi_write_cmd;
         |                         ^ ~~~~~~~~~~~~~~
   2 errors generated.


vim +308 drivers/spmi/hisi-spmi-controller.c

2ea3f6a03b155f drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  262  
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  263  static int spmi_controller_probe(struct platform_device *pdev)
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  264  {
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  265  	struct spmi_controller_dev *spmi_controller;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  266  	struct spmi_controller *ctrl;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  267  	struct resource *iores;
7f3ac6c502fd7f drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  268  	int ret;
6af364501949d9 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  269  
ffdfbafdc4f46a drivers/spmi/hisi-spmi-controller.c             Fei Shao              2023-12-06  270  	ctrl = devm_spmi_controller_alloc(&pdev->dev, sizeof(*spmi_controller));
ffdfbafdc4f46a drivers/spmi/hisi-spmi-controller.c             Fei Shao              2023-12-06  271  	if (IS_ERR(ctrl)) {
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  272  		dev_err(&pdev->dev, "can not allocate spmi_controller data\n");
ffdfbafdc4f46a drivers/spmi/hisi-spmi-controller.c             Fei Shao              2023-12-06  273  		return PTR_ERR(ctrl);
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  274  	}
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  275  	spmi_controller = spmi_controller_get_drvdata(ctrl);
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  276  	spmi_controller->controller = ctrl;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  277  
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  278  	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  279  	if (!iores) {
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  280  		dev_err(&pdev->dev, "can not get resource!\n");
ffdfbafdc4f46a drivers/spmi/hisi-spmi-controller.c             Fei Shao              2023-12-06  281  		return -EINVAL;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  282  	}
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  283  
dbbc8fdf2ad576 drivers/staging/hikey9xx/hisi-spmi-controller.c Dan Carpenter         2020-09-18  284  	spmi_controller->base = devm_ioremap(&pdev->dev, iores->start,
dbbc8fdf2ad576 drivers/staging/hikey9xx/hisi-spmi-controller.c Dan Carpenter         2020-09-18  285  					     resource_size(iores));
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  286  	if (!spmi_controller->base) {
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  287  		dev_err(&pdev->dev, "can not remap base addr!\n");
ffdfbafdc4f46a drivers/spmi/hisi-spmi-controller.c             Fei Shao              2023-12-06  288  		return -EADDRNOTAVAIL;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  289  	}
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  290  
fcc84fe12fd827 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2021-06-24  291  	ret = of_property_read_u32(pdev->dev.of_node, "hisilicon,spmi-channel",
2ea3f6a03b155f drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  292  				   &spmi_controller->channel);
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  293  	if (ret) {
6196331e79f361 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  294  		dev_err(&pdev->dev, "can not get channel\n");
ffdfbafdc4f46a drivers/spmi/hisi-spmi-controller.c             Fei Shao              2023-12-06  295  		return -ENODEV;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  296  	}
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  297  
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  298  	platform_set_drvdata(pdev, spmi_controller);
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  299  	dev_set_drvdata(&ctrl->dev, spmi_controller);
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  300  
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  301  	spin_lock_init(&spmi_controller->lock);
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  302  
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  303  	ctrl->nr = spmi_controller->channel;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  304  	ctrl->dev.parent = pdev->dev.parent;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  305  	ctrl->dev.of_node = of_node_get(pdev->dev.of_node);
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  306  
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  307  	/* Callbacks */
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17 @308  	ctrl->read_cmd = spmi_read_cmd;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17 @309  	ctrl->write_cmd = spmi_write_cmd;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  310  
490d88ef548d46 drivers/spmi/hisi-spmi-controller.c             Fei Shao              2023-12-06  311  	ret = devm_spmi_controller_add(&pdev->dev, ctrl);
12b38ea040b3bb drivers/staging/hikey9xx/hisi-spmi-controller.c Christophe JAILLET    2020-12-13  312  	if (ret) {
12b38ea040b3bb drivers/staging/hikey9xx/hisi-spmi-controller.c Christophe JAILLET    2020-12-13  313  		dev_err(&pdev->dev, "spmi_controller_add failed with error %d!\n", ret);
ffdfbafdc4f46a drivers/spmi/hisi-spmi-controller.c             Fei Shao              2023-12-06  314  		return ret;
12b38ea040b3bb drivers/staging/hikey9xx/hisi-spmi-controller.c Christophe JAILLET    2020-12-13  315  	}
12b38ea040b3bb drivers/staging/hikey9xx/hisi-spmi-controller.c Christophe JAILLET    2020-12-13  316  
12b38ea040b3bb drivers/staging/hikey9xx/hisi-spmi-controller.c Christophe JAILLET    2020-12-13  317  	return 0;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  318  }
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  319  

:::::: The code at line 308 was first introduced by commit
:::::: 70f59c90c8199e888b306edb16e20f651a1fce55 staging: spmi: add Hikey 970 SPMI controller driver

:::::: TO: Mayulong <mayulong1@huawei.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
