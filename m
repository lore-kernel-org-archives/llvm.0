Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794176385;
	b=uRIBw+e/90IzLGRpiU9777LOLBW6vMWwCbhiK2cUeGEWDO6I7SvfXv1ILyhG1K1ILley
	 I8ajklEsQrUNDccGRVHJD2Oce5kBdSEkzc7B1JMQIRyhhyvAJrKmhNeLEVdrIpZ0Lcl4d
	 Ne3Y3Yc9xp9/kHp/0r8uRUnPC/kzKwFsxRjiMSjpBWBhbsTV+8JL4SukDYYJLY7VB3/yA
	 XLMui8udBASzk9A/rBU/oIo5GhVJAwcIJGHyYSUZLTF8qAue75D1V+MSrtJxc8D54ZOzL
	 jniMnzMPaStgYKdYEVl+316maa0TEXRTjmygpoLJ5CUYV9dhz1aKvjAl5pbP+fYLXHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794176385;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=De0VxvsZdiWZC8218q+0ibGhvvSWEZUbrYa4+qRq8LY=;
	b=xdOn5FvfH6ejRQOTr1RmZjrQdCriuxg50r7TDbmn5e9x4nLV7tUci704b/eVQ7Hqu08j
	 MpZ7FJBNF4YA6WJLrMrDHtVxbwbJHTvnbacyeV08eRqoohjBrfjlfE4WhM0/hBuEeXxjs
	 1nBq/PmCEG5+NJky2v/dguB55eCROQkmPy5f1LKq66z4H070EGyJHtFoRhyoXnwi+njnk
	 ea5ztB8OgoqEQecjUH9FZnohdSEO8oqujYa75/m5QNG18DHlDxpyq1n7eyS5dMPb18Dwq
	 muzU4Cm7576M6xWAkEVuWo2k3FYLIBzmcrRa54iOZ/+myo1hLU061HuNM2tNoJIANtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GQIYliJ8;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E24606A31C;
	Sun,  8 Nov 2026 22:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5E24606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GQIYliJ8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794176384; x=1825712384;
  h=date:from:to:cc:subject:message-id;
  bh=2dUp/gU9bEKSGpq7f79GNBm8qtt7Hyd4NFuYdfrPHsM=;
  b=GQIYliJ89tn3AIdCQ6oSaA7zPArIbOwDnhTDdp+Uf7/STxxJ2h5zHmsU
   ADzaPGYSvebMarYvxpoLDVHledtULcSTayKohDehu5Jfh76Ck4Yk+ws6W
   NKOhTLfImIbGYlbR1Dl2qWeECsCByJfAetoOiC+vqx6FpTDmcAH0HxBnr
   vUZsonIMm2rJ2yH67+9jb2+0G04GVekzyOYaiwAdey9bzJRBWbcQHjmM8
   /Qfx052g3GpzUUrXQfvxKBv+yBvWH4pGtwsQ6RkFjxNlI+iS1lCiG9HHl
   hsFXOCQLTEw6ZT/w2faMGUL3vERFnfnYogeqWWYr/GYT1nWsL+uVhF8Pc
   g==;
X-CSE-ConnectionGUID: BdU7nEk2Szmvp8oaxBRLCA==
X-CSE-MsgGUID: UWYFjgzhTPCu/sqDLn7ZWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2900995"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2900995"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 14:19:43 -0800
X-CSE-ConnectionGUID: FSEREFM2S3Oor6ChyGZhMg==
X-CSE-MsgGUID: A6J82uTRSh+/yQKPmqeNvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="9595884"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 08 Nov 2026 14:19:41 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQBEh-00000000tTr-0IFQ;
	Sun, 08 Nov 2026 22:19:39 +0000
Date: Mon, 09 Nov 2026 06:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: Prajwal N <prajwal.n@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_watchdog_v1 98/98]
 drivers/watchdog/riscv_sbi_wdt.c:327:16: error: assigning to 'struct
 imsic_global_config *' from 'const struct imsic_global_config *' discards
 qualifiers
Message-ID: <202611090657.vj0OMmgn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_sbi_watchdog_v1
head:   929bf13433e242a3f255f463b2fb44633e102e0d
commit: 929bf13433e242a3f255f463b2fb44633e102e0d [98/98] drivers/watchdog: Add RISC-V SBI watchdog driver
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20261109/202611090657.vj0OMmgn-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project fc9576e3b179738d99c5babe5cd9d6c1f883e0db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090657.vj0OMmgn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611090657.vj0OMmgn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/watchdog/riscv_sbi_wdt.c:327:16: error: assigning to 'struct imsic_global_config *' from 'const struct imsic_global_config *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     327 |                 imsic_global = imsic_get_global_config();
         |                              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +327 drivers/watchdog/riscv_sbi_wdt.c

   298	
   299	static int sbiwdt_probe(struct platform_device *pdev)
   300	{
   301		struct sbiwdt *wdt;
   302		struct imsic_global_config *imsic_global;
   303		struct irq_domain *msi_domain;
   304		struct device *dev = &pdev->dev;
   305		int rc;
   306	
   307		/* Allocate memory for the global watchdog structure */
   308		wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
   309		if (!wdt)
   310			return -ENOMEM;
   311	
   312		platform_set_drvdata(pdev, wdt);
   313		watchdog_set_drvdata(&wdt->wdd, wdt);
   314	
   315		/* Initialiaze watchdog attributes */
   316		rc = sbiwdt_init_attributes(wdt);
   317		if (rc) {
   318			dev_err(dev, "Failed to read SBI watchdog attributes: %d\n", rc);
   319			return rc;
   320		}
   321	
   322		wdt->wdd.info = &sbiwdt_info;
   323		wdt->wdd.ops = &sbiwdt_ops;
   324	
   325		/* Setup MSI if the capability is available */
   326		if (wdt->attrs.wdt_capability & SBI_WDT_CAP_MSI_SUPPORT_MASK) {
 > 327			imsic_global = imsic_get_global_config();
   328			if (!imsic_global) {
   329				dev_err(dev, "IMSIC firmware node is unavailable\n");
   330				return -ENODEV;
   331			}
   332	
   333			msi_domain = irq_find_matching_fwnode(imsic_global->fwnode,
   334								DOMAIN_BUS_PLATFORM_MSI);
   335	
   336			if (!msi_domain) {
   337				dev_err(dev, "IMSIC platform MSI domain is unavailable\n");
   338				return -ENODEV;
   339			}
   340	
   341			dev_set_msi_domain(&pdev->dev, msi_domain);
   342	
   343			/* MSI setup*/
   344			rc = platform_device_msi_init_and_alloc_irqs(dev, 1, sbiwdt_msi_write);
   345			if (rc) {
   346				dev_err(dev, "Failed to allocate MSIs\n");
   347				return rc;
   348			}
   349	
   350			wdt->virq = msi_get_virq(dev, 0);
   351			if (!wdt->virq) {
   352				dev_err(dev, "Failed to get MSI virtual IRQ: %d\n", wdt->virq);
   353				return wdt->virq;
   354			}
   355	
   356			rc = devm_request_irq(dev, wdt->virq,
   357						sbiwdt_pretimeout_handler,
   358						0, "sbiwdt-pretimeout", wdt);
   359			if (rc) {
   360				dev_err(dev, "Failed to request pretimeout IRQ: %d\n", rc);
   361				return rc;
   362			}
   363		}
   364	
   365		rc = devm_watchdog_register_device(dev, &wdt->wdd);
   366		if (rc) {
   367			dev_err(dev, "Failed to register RISC-V SBI watchdog device\n");
   368			return rc;
   369		}
   370	
   371		dev_info(&pdev->dev, "RISC-V SBI Watchdog registered\n");
   372	
   373		return 0;
   374	}
   375	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
