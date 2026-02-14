Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5241DE3AD;
	Sat, 14 Feb 2026 09:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771060044; cv=none; b=KcOBjGtWUDBcS66V2A5nrnILadM4i8F7TOOn8Qnv+yh6OcsZyBrVN10u2IsanM5Qah6vD+9y9EZRL9gluh09bwFGLCBWGaaeE2PhesOcIvywlQp6vKQT+7QrO/ZGGMIjgxwtcZLRfxSqEfa6XOL4cRwnd0+dHk0nj6tKkncfIw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771060044; c=relaxed/simple;
	bh=xXNOWvfxhaPYQLE4IVNRYaK3Ajhx2kzeufpZ5U3T5Ds=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gKA/Vbo8z3kPW553aBrrL0Ys7LwqoHP8S0mXCtsp81vmO/+AACbshH9XaQPikxTDUMqbIXFnLyYsm4+Ayx56FMygbDMWNXXxo/u+mPcio32fCpFD9/tCDyUzcumozEIrZRcvmhd3PyXTf3jNqYxgxhKuLSmQeDMTsL0u6gpm4Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SgSyDLmJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SgSyDLmJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771060042; x=1802596042;
  h=date:from:to:cc:subject:message-id;
  bh=xXNOWvfxhaPYQLE4IVNRYaK3Ajhx2kzeufpZ5U3T5Ds=;
  b=SgSyDLmJcstd6Gxo8bgoZQ1mdvJDHxTHMgr7tVMCZfFcjs0oQks1OzTS
   mFfCubhiQAMqvrEZMem4UTVoCa9S27HHJ0AV8/NYNCQ8qZcaIVXP4L7ZY
   XfWhsNH/znDoghrsHNmZEF9TzhExN4zEaMG9k7IJmtNSBbop69/IYmFaA
   Eb1puNfVsfXimS7eDUEzUd24adAG8e+yluauiPgyDka/6cbiOjxEUJV5i
   w5dgT2xBM9sgyO0wMSF47UQKWmfmrObJb1qkBs8U/KvQYFNRJ1JZng77T
   yByW2pYbap7KnipHVQSBgQfn66Eo5jw+XEt8zlBvQ1BaziRHDFE37tiw9
   w==;
X-CSE-ConnectionGUID: CTs/isLFT1eOBKpAoO8o3w==
X-CSE-MsgGUID: +rlRzqSTTUG9IzDvkbijpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72327907"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="72327907"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 01:07:22 -0800
X-CSE-ConnectionGUID: zKTh15fASly88qy+jqlM/g==
X-CSE-MsgGUID: PxpwHxhIR46uSVnAS079FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="213240142"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Feb 2026 01:07:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrBcT-00000000wPc-2Hts;
	Sat, 14 Feb 2026 09:07:17 +0000
Date: Sat, 14 Feb 2026 17:06:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Hildenbrand <david@kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>
Subject: [akpm-mm:mm-nonmm-unstable 30/30]
 drivers/input/misc/pf1550-onkey.c:190:25: error: use of undeclared identifier
 'pf1550_onkey_pm_ops'; did you mean 'pf1550_onkey_probe'?
Message-ID: <202602141722.pvRjFCqC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   f88534a6e7afcfe6ad5f93b86f6e64d5d4d23709
commit: f88534a6e7afcfe6ad5f93b86f6e64d5d4d23709 [30/30] drivers/input/misc/pf1550-onkey.c: fix build with CONFIG_PM_SLEEP=n
config: i386-buildonly-randconfig-002-20260214 (https://download.01.org/0day-ci/archive/20260214/202602141722.pvRjFCqC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141722.pvRjFCqC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141722.pvRjFCqC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/input/misc/pf1550-onkey.c:179:8: warning: extra tokens at end of #endif directive [-Wextra-tokens]
     179 | #endif CONFIG_PM_SLEEP
         |        ^
         |        //
>> drivers/input/misc/pf1550-onkey.c:190:25: error: use of undeclared identifier 'pf1550_onkey_pm_ops'; did you mean 'pf1550_onkey_probe'?
     190 |                 .pm   = pm_sleep_ptr(&pf1550_onkey_pm_ops),
         |                                       ^~~~~~~~~~~~~~~~~~~
         |                                       pf1550_onkey_probe
   include/linux/pm.h:474:65: note: expanded from macro 'pm_sleep_ptr'
     474 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                                                                 ^
   include/linux/util_macros.h:136:38: note: expanded from macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^
   drivers/input/misc/pf1550-onkey.c:60:12: note: 'pf1550_onkey_probe' declared here
      60 | static int pf1550_onkey_probe(struct platform_device *pdev)
         |            ^
>> drivers/input/misc/pf1550-onkey.c:190:11: error: incompatible pointer types initializing 'const struct dev_pm_ops *' with an expression of type 'int (*)(struct platform_device *)' [-Werror,-Wincompatible-pointer-types]
     190 |                 .pm   = pm_sleep_ptr(&pf1550_onkey_pm_ops),
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:474:28: note: expanded from macro 'pm_sleep_ptr'
     474 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:27: note: expanded from macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_SELFTESTS
   Depends on [n]: NET [=y] && PHYLIB [=y] && INET [=n]
   Selected by [y]:
   - AMD_XGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_AMD [=y] && (OF_ADDRESS [=y] || ACPI [=y] || PCI [=y]) && HAS_IOMEM [=y] && (X86 [=y] || ARM64 || COMPILE_TEST [=y]) && PTP_1588_CLOCK_OPTIONAL [=y]


vim +190 drivers/input/misc/pf1550-onkey.c

9acb215cbebdce7 Samuel Kayode 2025-10-01   59  
9acb215cbebdce7 Samuel Kayode 2025-10-01  @60  static int pf1550_onkey_probe(struct platform_device *pdev)
9acb215cbebdce7 Samuel Kayode 2025-10-01   61  {
9acb215cbebdce7 Samuel Kayode 2025-10-01   62  	struct onkey_drv_data *onkey;
9acb215cbebdce7 Samuel Kayode 2025-10-01   63  	struct input_dev *input;
9acb215cbebdce7 Samuel Kayode 2025-10-01   64  	bool key_power = false;
9acb215cbebdce7 Samuel Kayode 2025-10-01   65  	int i, irq, error;
9acb215cbebdce7 Samuel Kayode 2025-10-01   66  
9acb215cbebdce7 Samuel Kayode 2025-10-01   67  	onkey = devm_kzalloc(&pdev->dev, sizeof(*onkey), GFP_KERNEL);
9acb215cbebdce7 Samuel Kayode 2025-10-01   68  	if (!onkey)
9acb215cbebdce7 Samuel Kayode 2025-10-01   69  		return -ENOMEM;
9acb215cbebdce7 Samuel Kayode 2025-10-01   70  
9acb215cbebdce7 Samuel Kayode 2025-10-01   71  	onkey->dev = &pdev->dev;
9acb215cbebdce7 Samuel Kayode 2025-10-01   72  
9acb215cbebdce7 Samuel Kayode 2025-10-01   73  	onkey->pf1550 = dev_get_drvdata(pdev->dev.parent);
9acb215cbebdce7 Samuel Kayode 2025-10-01   74  	if (!onkey->pf1550->regmap)
9acb215cbebdce7 Samuel Kayode 2025-10-01   75  		return dev_err_probe(&pdev->dev, -ENODEV,
9acb215cbebdce7 Samuel Kayode 2025-10-01   76  				     "failed to get regmap\n");
9acb215cbebdce7 Samuel Kayode 2025-10-01   77  
9acb215cbebdce7 Samuel Kayode 2025-10-01   78  	onkey->wakeup = device_property_read_bool(pdev->dev.parent,
9acb215cbebdce7 Samuel Kayode 2025-10-01   79  						  "wakeup-source");
9acb215cbebdce7 Samuel Kayode 2025-10-01   80  
9acb215cbebdce7 Samuel Kayode 2025-10-01   81  	if (device_property_read_bool(pdev->dev.parent,
9acb215cbebdce7 Samuel Kayode 2025-10-01   82  				      "nxp,disable-key-power")) {
9acb215cbebdce7 Samuel Kayode 2025-10-01   83  		error = regmap_clear_bits(onkey->pf1550->regmap,
9acb215cbebdce7 Samuel Kayode 2025-10-01   84  					  PF1550_PMIC_REG_PWRCTRL1,
9acb215cbebdce7 Samuel Kayode 2025-10-01   85  					  PF1550_ONKEY_RST_EN);
9acb215cbebdce7 Samuel Kayode 2025-10-01   86  		if (error)
9acb215cbebdce7 Samuel Kayode 2025-10-01   87  			return dev_err_probe(&pdev->dev, error,
9acb215cbebdce7 Samuel Kayode 2025-10-01   88  					     "failed: disable turn system off");
9acb215cbebdce7 Samuel Kayode 2025-10-01   89  	} else {
9acb215cbebdce7 Samuel Kayode 2025-10-01   90  		key_power = true;
9acb215cbebdce7 Samuel Kayode 2025-10-01   91  	}
9acb215cbebdce7 Samuel Kayode 2025-10-01   92  
9acb215cbebdce7 Samuel Kayode 2025-10-01   93  	input = devm_input_allocate_device(&pdev->dev);
9acb215cbebdce7 Samuel Kayode 2025-10-01   94  	if (!input)
9acb215cbebdce7 Samuel Kayode 2025-10-01   95  		return dev_err_probe(&pdev->dev, -ENOMEM,
9acb215cbebdce7 Samuel Kayode 2025-10-01   96  				     "failed to allocate the input device\n");
9acb215cbebdce7 Samuel Kayode 2025-10-01   97  
9acb215cbebdce7 Samuel Kayode 2025-10-01   98  	input->name = pdev->name;
9acb215cbebdce7 Samuel Kayode 2025-10-01   99  	input->phys = "pf1550-onkey/input0";
9acb215cbebdce7 Samuel Kayode 2025-10-01  100  	input->id.bustype = BUS_HOST;
9acb215cbebdce7 Samuel Kayode 2025-10-01  101  
9acb215cbebdce7 Samuel Kayode 2025-10-01  102  	if (key_power)
9acb215cbebdce7 Samuel Kayode 2025-10-01  103  		input_set_capability(input, EV_KEY, KEY_POWER);
9acb215cbebdce7 Samuel Kayode 2025-10-01  104  
9acb215cbebdce7 Samuel Kayode 2025-10-01  105  	onkey->input = input;
9acb215cbebdce7 Samuel Kayode 2025-10-01  106  	platform_set_drvdata(pdev, onkey);
9acb215cbebdce7 Samuel Kayode 2025-10-01  107  
9acb215cbebdce7 Samuel Kayode 2025-10-01  108  	for (i = 0; i < PF1550_ONKEY_IRQ_NR; i++) {
9acb215cbebdce7 Samuel Kayode 2025-10-01  109  		irq = platform_get_irq(pdev, i);
9acb215cbebdce7 Samuel Kayode 2025-10-01  110  		if (irq < 0)
9acb215cbebdce7 Samuel Kayode 2025-10-01  111  			return irq;
9acb215cbebdce7 Samuel Kayode 2025-10-01  112  
9acb215cbebdce7 Samuel Kayode 2025-10-01  113  		error = devm_request_threaded_irq(&pdev->dev, irq, NULL,
9acb215cbebdce7 Samuel Kayode 2025-10-01  114  						  pf1550_onkey_irq_handler,
9acb215cbebdce7 Samuel Kayode 2025-10-01  115  						  IRQF_NO_SUSPEND,
9acb215cbebdce7 Samuel Kayode 2025-10-01  116  						  "pf1550-onkey", onkey);
9acb215cbebdce7 Samuel Kayode 2025-10-01  117  		if (error)
9acb215cbebdce7 Samuel Kayode 2025-10-01  118  			return dev_err_probe(&pdev->dev, error,
9acb215cbebdce7 Samuel Kayode 2025-10-01  119  					     "failed: irq request (IRQ: %d)\n",
9acb215cbebdce7 Samuel Kayode 2025-10-01  120  					     i);
9acb215cbebdce7 Samuel Kayode 2025-10-01  121  	}
9acb215cbebdce7 Samuel Kayode 2025-10-01  122  
9acb215cbebdce7 Samuel Kayode 2025-10-01  123  	error = input_register_device(input);
9acb215cbebdce7 Samuel Kayode 2025-10-01  124  	if (error)
9acb215cbebdce7 Samuel Kayode 2025-10-01  125  		return dev_err_probe(&pdev->dev, error,
9acb215cbebdce7 Samuel Kayode 2025-10-01  126  				     "failed to register input device\n");
9acb215cbebdce7 Samuel Kayode 2025-10-01  127  
9acb215cbebdce7 Samuel Kayode 2025-10-01  128  	device_init_wakeup(&pdev->dev, onkey->wakeup);
9acb215cbebdce7 Samuel Kayode 2025-10-01  129  
9acb215cbebdce7 Samuel Kayode 2025-10-01  130  	return 0;
9acb215cbebdce7 Samuel Kayode 2025-10-01  131  }
9acb215cbebdce7 Samuel Kayode 2025-10-01  132  
f88534a6e7afcfe Andrew Morton 2026-02-13  133  #ifdef CONFIG_PM_SLEEP
9acb215cbebdce7 Samuel Kayode 2025-10-01  134  static int pf1550_onkey_suspend(struct device *dev)
9acb215cbebdce7 Samuel Kayode 2025-10-01  135  {
9acb215cbebdce7 Samuel Kayode 2025-10-01  136  	struct platform_device *pdev = to_platform_device(dev);
9acb215cbebdce7 Samuel Kayode 2025-10-01  137  	struct onkey_drv_data *onkey = platform_get_drvdata(pdev);
9acb215cbebdce7 Samuel Kayode 2025-10-01  138  	int i, irq;
9acb215cbebdce7 Samuel Kayode 2025-10-01  139  
9acb215cbebdce7 Samuel Kayode 2025-10-01  140  	if (!device_may_wakeup(&pdev->dev))
9acb215cbebdce7 Samuel Kayode 2025-10-01  141  		regmap_write(onkey->pf1550->regmap,
9acb215cbebdce7 Samuel Kayode 2025-10-01  142  			     PF1550_PMIC_REG_ONKEY_INT_MASK0,
9acb215cbebdce7 Samuel Kayode 2025-10-01  143  			     ONKEY_IRQ_PUSHI | ONKEY_IRQ_1SI | ONKEY_IRQ_2SI |
9acb215cbebdce7 Samuel Kayode 2025-10-01  144  			     ONKEY_IRQ_3SI | ONKEY_IRQ_4SI | ONKEY_IRQ_8SI);
9acb215cbebdce7 Samuel Kayode 2025-10-01  145  	else
9acb215cbebdce7 Samuel Kayode 2025-10-01  146  		for (i = 0; i < PF1550_ONKEY_IRQ_NR; i++) {
9acb215cbebdce7 Samuel Kayode 2025-10-01  147  			irq = platform_get_irq(pdev, i);
9acb215cbebdce7 Samuel Kayode 2025-10-01  148  			if (irq > 0)
9acb215cbebdce7 Samuel Kayode 2025-10-01  149  				enable_irq_wake(irq);
9acb215cbebdce7 Samuel Kayode 2025-10-01  150  		}
9acb215cbebdce7 Samuel Kayode 2025-10-01  151  
9acb215cbebdce7 Samuel Kayode 2025-10-01  152  	return 0;
9acb215cbebdce7 Samuel Kayode 2025-10-01  153  }
9acb215cbebdce7 Samuel Kayode 2025-10-01  154  
9acb215cbebdce7 Samuel Kayode 2025-10-01  155  static int pf1550_onkey_resume(struct device *dev)
9acb215cbebdce7 Samuel Kayode 2025-10-01  156  {
9acb215cbebdce7 Samuel Kayode 2025-10-01  157  	struct platform_device *pdev = to_platform_device(dev);
9acb215cbebdce7 Samuel Kayode 2025-10-01  158  	struct onkey_drv_data *onkey = platform_get_drvdata(pdev);
9acb215cbebdce7 Samuel Kayode 2025-10-01  159  	int i, irq;
9acb215cbebdce7 Samuel Kayode 2025-10-01  160  
9acb215cbebdce7 Samuel Kayode 2025-10-01  161  	if (!device_may_wakeup(&pdev->dev))
9acb215cbebdce7 Samuel Kayode 2025-10-01  162  		regmap_write(onkey->pf1550->regmap,
9acb215cbebdce7 Samuel Kayode 2025-10-01  163  			     PF1550_PMIC_REG_ONKEY_INT_MASK0,
9acb215cbebdce7 Samuel Kayode 2025-10-01  164  			     ~((u8)(ONKEY_IRQ_PUSHI | ONKEY_IRQ_1SI |
9acb215cbebdce7 Samuel Kayode 2025-10-01  165  			     ONKEY_IRQ_2SI | ONKEY_IRQ_3SI | ONKEY_IRQ_4SI |
9acb215cbebdce7 Samuel Kayode 2025-10-01  166  			     ONKEY_IRQ_8SI)));
9acb215cbebdce7 Samuel Kayode 2025-10-01  167  	else
9acb215cbebdce7 Samuel Kayode 2025-10-01  168  		for (i = 0; i < PF1550_ONKEY_IRQ_NR; i++) {
9acb215cbebdce7 Samuel Kayode 2025-10-01  169  			irq = platform_get_irq(pdev, i);
9acb215cbebdce7 Samuel Kayode 2025-10-01  170  			if (irq > 0)
9acb215cbebdce7 Samuel Kayode 2025-10-01  171  				disable_irq_wake(irq);
9acb215cbebdce7 Samuel Kayode 2025-10-01  172  		}
9acb215cbebdce7 Samuel Kayode 2025-10-01  173  
9acb215cbebdce7 Samuel Kayode 2025-10-01  174  	return 0;
9acb215cbebdce7 Samuel Kayode 2025-10-01  175  }
9acb215cbebdce7 Samuel Kayode 2025-10-01  176  
9acb215cbebdce7 Samuel Kayode 2025-10-01  177  static SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
9acb215cbebdce7 Samuel Kayode 2025-10-01  178  			 pf1550_onkey_resume);
f88534a6e7afcfe Andrew Morton 2026-02-13 @179  #endif CONFIG_PM_SLEEP
9acb215cbebdce7 Samuel Kayode 2025-10-01  180  
9acb215cbebdce7 Samuel Kayode 2025-10-01  181  static const struct platform_device_id pf1550_onkey_id[] = {
9acb215cbebdce7 Samuel Kayode 2025-10-01  182  	{ "pf1550-onkey", },
9acb215cbebdce7 Samuel Kayode 2025-10-01  183  	{ /* sentinel */ }
9acb215cbebdce7 Samuel Kayode 2025-10-01  184  };
9acb215cbebdce7 Samuel Kayode 2025-10-01  185  MODULE_DEVICE_TABLE(platform, pf1550_onkey_id);
9acb215cbebdce7 Samuel Kayode 2025-10-01  186  
9acb215cbebdce7 Samuel Kayode 2025-10-01  187  static struct platform_driver pf1550_onkey_driver = {
9acb215cbebdce7 Samuel Kayode 2025-10-01  188  	.driver = {
9acb215cbebdce7 Samuel Kayode 2025-10-01  189  		.name = "pf1550-onkey",
9acb215cbebdce7 Samuel Kayode 2025-10-01 @190  		.pm   = pm_sleep_ptr(&pf1550_onkey_pm_ops),
9acb215cbebdce7 Samuel Kayode 2025-10-01  191  	},
9acb215cbebdce7 Samuel Kayode 2025-10-01  192  	.probe = pf1550_onkey_probe,
9acb215cbebdce7 Samuel Kayode 2025-10-01  193  	.id_table = pf1550_onkey_id,
9acb215cbebdce7 Samuel Kayode 2025-10-01  194  };
9acb215cbebdce7 Samuel Kayode 2025-10-01  195  module_platform_driver(pf1550_onkey_driver);
9acb215cbebdce7 Samuel Kayode 2025-10-01  196  

:::::: The code at line 190 was first introduced by commit
:::::: 9acb215cbebdce721af2219e2859ad17342c9084 Input: pf1550 - add onkey support

:::::: TO: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
:::::: CC: Lee Jones <lee@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
