Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034680;
	b=zXEDFmVRdkqBKM4F4Sdud5vJtjWzesfR9+dp7OcMf6WnOcg12kvqsf8cIoTtHZGeTPR9
	 aGuqWn9kBggalAd4KLWdVQCv4sLa3aJ3SU7ndhRG7ppvu6tVvhExU0LQjckmWIcqJJgnK
	 +WlAfOlBrH/sCrT51LaAWPQnRJjh18wsCtSArxiDIUIfug/z0Z75UU+9gC1kX9s/nC+jq
	 HyrUGKc7pBMYv6+RMxVubgu6mxQ3WoR++NouxTXU+BfBhNJEs9Sq9gvG2YmVdexNGj1lf
	 zigRFmcYktQQc7ZN4JN7eZc7A+DsPKWo/HPKFbDBXyuB12iMeLNI7ZaZUPF7pr8bTZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034680;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Y6fG7lcGMiK8HBC1ZoJaefvrbvz2/uKtmaYcUkOU7Ys=;
	b=wtGiBh5guCjSJ91wmbuLJ59G7d4xpz7nMQrRdT6oJN8KisvLa1abSan5HcwEBgAekho5
	 4ZtUCaR285q6pyPnSSBcwZxwgkWShSwA52zermR0QzkifnsfLVgv1wj011isi9nLeX+kr
	 vO7JtPbt+4bH1MVdM23se/Df5orwQ+px8iwq3NnPJJuVPO5M3LgdfqIw7TR1LI3paPttZ
	 4yBYSLKOXl1Vikbqdzqkecx+AlI179ZbwtlQhWIqN2Bd/HZF8xUBVZdzaUqhAKv7xeTLD
	 JQxTco38Wg16391n0YCeto4VchRdYABclHqc7j8E0cJaj/wJpfZLpqYvNk7uY9eMW2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MmBjs1m9;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442A9606A334;
	Wed, 18 Nov 2026 20:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 442A9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MmBjs1m9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795034680; x=1826570680;
  h=date:from:to:cc:subject:message-id;
  bh=uTfT6odHoXTFSpYewsefSjYE/wOtmX7XB/D5nP2HstY=;
  b=MmBjs1m9SqrhkCabPtLkqTRny4bCDI0j7CUiLEpT3kw16pORw0zCvIJ0
   WwAwygmOT1+O6BoQ2Z3IFxw6ugWfiUgRU5SBZj1cEK+7xwIuy3XWQbySv
   O2To5OMIZ5bxbSBQhU/Jhax6kJ3fTv+ZrUs+bXf7czkzMNSR2blIKFef4
   0Hsj6DccGhVHPJvyrgqe6it8xr5cRcfqrZaZkbVXhnBQgCKabEkW2gbse
   4LMdPDE9fg09OppkfrBV/zX7Rt89bdWdsmIes3hcsekXwkoolhPl5Kk+j
   gL6uIBfRY9YmWH8/qnzoYlFfunGcsey60kb/XcZPXq+nE7UUbNeY25qJ1
   Q==;
X-CSE-ConnectionGUID: g2U9O4KCQLaTuC1iUSpKjA==
X-CSE-MsgGUID: c+aB6KpPQX6daKOREGIl3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3857007"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3857007"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 12:44:39 -0800
X-CSE-ConnectionGUID: n6oCCFVST6+t1HjAXsFvBw==
X-CSE-MsgGUID: Biixfo4SReKHPE/4AJbmOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10572495"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 18 Nov 2026 12:44:37 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTmWB-000000003TJ-0SnK;
	Wed, 18 Nov 2026 20:44:35 +0000
Date: Wed, 18 Nov 2026 21:44:07 +0100
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [superna9999:topic/sm8650/el2-integ 2/36]
 drivers/input/misc/pm8941-pwrkey.c:406:58: error: call to undeclared function
 'is_kernel_in_hyp_mode'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <20261118213853.EXkpojMM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/superna9999/linux topic/sm8650/el2-integ
head:   237d9f2f9294f587cd9e1ce7fd5124d71ea60d12
commit: 4bf6e743effcfb71eab2bdfe28614f486bced226 [2/36] input: misc: pm8941-pwrkey: allow reboot config when in EL2 on GEN3 PMICs
config: s390-randconfig-2002-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118213853.EXkpojMM-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118213853.EXkpojMM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118213853.EXkpojMM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/misc/pm8941-pwrkey.c:406:58: error: call to undeclared function 'is_kernel_in_hyp_mode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     406 |             (pwrkey->data->allows_ps_hold_poff_config_in_el2 && is_kernel_in_hyp_mode())) {
         |                                                                 ^
   drivers/input/misc/pm8941-pwrkey.c:430:58: error: call to undeclared function 'is_kernel_in_hyp_mode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     430 |             (pwrkey->data->allows_ps_hold_poff_config_in_el2 && is_kernel_in_hyp_mode()))
         |                                                                 ^
   2 errors generated.


vim +/is_kernel_in_hyp_mode +406 drivers/input/misc/pm8941-pwrkey.c

   251	
   252	static DEFINE_SIMPLE_DEV_PM_OPS(pm8941_pwr_key_pm_ops,
   253					pm8941_pwrkey_suspend, pm8941_pwrkey_resume);
   254	
   255	static int pm8941_pwrkey_probe(struct platform_device *pdev)
   256	{
   257		struct pm8941_pwrkey *pwrkey;
   258		bool pull_up, wakeup;
   259		struct device *parent;
   260		struct device_node *regmap_node;
   261		const __be32 *addr;
   262		u32 req_delay, mask, delay_shift;
   263		int error;
   264	
   265		if (of_property_read_u32(pdev->dev.of_node, "debounce", &req_delay))
   266			req_delay = 15625;
   267	
   268		if (req_delay > 2000000 || req_delay == 0) {
   269			dev_err(&pdev->dev, "invalid debounce time: %u\n", req_delay);
   270			return -EINVAL;
   271		}
   272	
   273		pull_up = of_property_read_bool(pdev->dev.of_node, "bias-pull-up");
   274	
   275		pwrkey = devm_kzalloc_obj(&pdev->dev, *pwrkey);
   276		if (!pwrkey)
   277			return -ENOMEM;
   278	
   279		pwrkey->dev = &pdev->dev;
   280		pwrkey->data = of_device_get_match_data(&pdev->dev);
   281	
   282		parent = pdev->dev.parent;
   283		regmap_node = pdev->dev.of_node;
   284		pwrkey->regmap = dev_get_regmap(parent, NULL);
   285		if (!pwrkey->regmap) {
   286			regmap_node = parent->of_node;
   287			/*
   288			 * We failed to get regmap for parent. Let's see if we are
   289			 * a child of pon node and read regmap and reg from its
   290			 * parent.
   291			 */
   292			pwrkey->regmap = dev_get_regmap(parent->parent, NULL);
   293			if (!pwrkey->regmap) {
   294				dev_err(&pdev->dev, "failed to locate regmap\n");
   295				return -ENODEV;
   296			}
   297		}
   298	
   299		addr = of_get_address(regmap_node, 0, NULL, NULL);
   300		if (!addr) {
   301			dev_err(&pdev->dev, "reg property missing\n");
   302			return -EINVAL;
   303		}
   304		pwrkey->baseaddr = be32_to_cpup(addr);
   305	
   306		if (pwrkey->data->has_pon_pbs) {
   307			/* PON_PBS base address is optional */
   308			addr = of_get_address(regmap_node, 1, NULL, NULL);
   309			if (addr)
   310				pwrkey->pon_pbs_baseaddr = be32_to_cpup(addr);
   311		}
   312	
   313		pwrkey->irq = platform_get_irq(pdev, 0);
   314		if (pwrkey->irq < 0)
   315			return pwrkey->irq;
   316	
   317		error = regmap_read(pwrkey->regmap, pwrkey->baseaddr + PON_REV2,
   318				    &pwrkey->revision);
   319		if (error) {
   320			dev_err(&pdev->dev, "failed to read revision: %d\n", error);
   321			return error;
   322		}
   323	
   324		error = regmap_read(pwrkey->regmap, pwrkey->baseaddr + PON_SUBTYPE,
   325				    &pwrkey->subtype);
   326		if (error) {
   327			dev_err(&pdev->dev, "failed to read subtype: %d\n", error);
   328			return error;
   329		}
   330	
   331		error = of_property_read_u32(pdev->dev.of_node, "linux,code",
   332					     &pwrkey->code);
   333		if (error) {
   334			dev_dbg(&pdev->dev,
   335				"no linux,code assuming power (%d)\n", error);
   336			pwrkey->code = KEY_POWER;
   337		}
   338	
   339		pwrkey->input = devm_input_allocate_device(&pdev->dev);
   340		if (!pwrkey->input) {
   341			dev_dbg(&pdev->dev, "unable to allocate input device\n");
   342			return -ENOMEM;
   343		}
   344	
   345		input_set_capability(pwrkey->input, EV_KEY, pwrkey->code);
   346	
   347		pwrkey->input->name = pwrkey->data->name;
   348		pwrkey->input->phys = pwrkey->data->phys;
   349	
   350		if (pwrkey->data->supports_debounce_config) {
   351			if (pwrkey->subtype >= PON_SUBTYPE_GEN2_PRIMARY) {
   352				mask = PON_DBC_DELAY_MASK_GEN2;
   353				delay_shift = PON_DBC_SHIFT_GEN2;
   354			} else {
   355				mask = PON_DBC_DELAY_MASK_GEN1;
   356				delay_shift = PON_DBC_SHIFT_GEN1;
   357			}
   358	
   359			req_delay = (req_delay << delay_shift) / USEC_PER_SEC;
   360			req_delay = ilog2(req_delay);
   361	
   362			error = regmap_update_bits(pwrkey->regmap,
   363						   pwrkey->baseaddr + PON_DBC_CTL,
   364						   mask,
   365						   req_delay);
   366			if (error) {
   367				dev_err(&pdev->dev, "failed to set debounce: %d\n",
   368					error);
   369				return error;
   370			}
   371		}
   372	
   373		error = pm8941_pwrkey_sw_debounce_init(pwrkey);
   374		if (error)
   375			return error;
   376	
   377		if (pwrkey->data->pull_up_bit) {
   378			error = regmap_update_bits(pwrkey->regmap,
   379						   pwrkey->baseaddr + PON_PULL_CTL,
   380						   pwrkey->data->pull_up_bit,
   381						   pull_up ? pwrkey->data->pull_up_bit :
   382							     0);
   383			if (error) {
   384				dev_err(&pdev->dev, "failed to set pull: %d\n", error);
   385				return error;
   386			}
   387		}
   388	
   389		error = devm_request_threaded_irq(&pdev->dev, pwrkey->irq,
   390						  NULL, pm8941_pwrkey_irq,
   391						  IRQF_ONESHOT,
   392						  pwrkey->data->name, pwrkey);
   393		if (error) {
   394			dev_err(&pdev->dev, "failed requesting IRQ: %d\n", error);
   395			return error;
   396		}
   397	
   398		error = input_register_device(pwrkey->input);
   399		if (error) {
   400			dev_err(&pdev->dev, "failed to register input device: %d\n",
   401				error);
   402			return error;
   403		}
   404	
   405		if (pwrkey->data->supports_ps_hold_poff_config ||
 > 406		    (pwrkey->data->allows_ps_hold_poff_config_in_el2 && is_kernel_in_hyp_mode())) {
   407			pwrkey->reboot_notifier.notifier_call = pm8941_reboot_notify;
   408			error = register_reboot_notifier(&pwrkey->reboot_notifier);
   409			if (error) {
   410				dev_err(&pdev->dev, "failed to register reboot notifier: %d\n",
   411					error);
   412				return error;
   413			}
   414		}
   415	
   416		wakeup = pwrkey->data->wakeup_source_default ||
   417			of_property_read_bool(pdev->dev.of_node, "wakeup-source");
   418	
   419		platform_set_drvdata(pdev, pwrkey);
   420		device_init_wakeup(&pdev->dev, wakeup);
   421	
   422		return 0;
   423	}
   424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
