Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A268160EDB;
	Wed, 13 Mar 2024 18:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710354245; cv=none; b=F0Oyf91PlxTHNfrVub5bD//bncncTD79uUuP8syar0tbMrwI5WaSXjAG0E4G4QLFRoSUTW00dbvx/Z4Q9GmCBk9NzBfbqoAHkkezlCeKG6h9g91iXgILliqq+vvLr5k1fm6d0qmOKgzJww3O7ws1bWQ9MEkyW8aYIgauJTm8zGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710354245; c=relaxed/simple;
	bh=NvYMxVkpcZOvB4LxRGQW3x8Rkz2TMeaR9EC1qF1oAds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q2lfjwfWhj2lsRqRkxoOlt5kTXNT+V5fmXkTm1tS1YqIw2sWQQcQbT1bYgj1o7ittY19WhwauZwk2j/9b70fXHs8+ElNHyzzAZ+Fs/2hTxAGbG8DsSxBXHFtWzZbOM9sJZH/XkNFbX/ri1uZuu8pbzbdcMbLaYZdeHXis/wKhag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tq7Ovxvu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tq7Ovxvu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710354244; x=1741890244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NvYMxVkpcZOvB4LxRGQW3x8Rkz2TMeaR9EC1qF1oAds=;
  b=Tq7OvxvuqgiQzcuD27kebgatYNu98OXklPfx5UDj335by+F81D4BjMx6
   PCHiVWOA7ETUMhOxBXoeFhgPP0aJoQlNj/RZxPyaxtck8nGC/isqVNh7M
   DDIslUTFAz3euboyUw8UHePnvAVtEw8aHJtqGxQHWr3DDjeB8sAbKid/B
   cV4ACS9hi38y1PQP6ssHyUwRNjQk9aKry1lBjCCp/LFXbZ4+0iTZP/Kaz
   mdhTCOH8+ROe6eaVSvNVK3b2d/DhHiUFtZkds+8u9JfkC3KNJvAr5T0ET
   7/z5r9FMOiC5+ym3ptzJ9+jxn8IObD8e6SmRPbi9+iBwfJuOoH48WtOs7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5312891"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5312891"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 11:24:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="12594943"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Mar 2024 11:24:00 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkTGf-000Cf5-2V;
	Wed, 13 Mar 2024 18:23:57 +0000
Date: Thu, 14 Mar 2024 02:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:test 1/1] drivers/mtd/maps/physmap-core.c:527:52:
 warning: format specifies type 'unsigned int' but the argument has type
 'void *'
Message-ID: <202403140230.q9kERt7l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git test
head:   0d7231b62906aa3562554714aa708ac0b452c0a5
commit: 0d7231b62906aa3562554714aa708ac0b452c0a5 [1/1] CFI debug code
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240314/202403140230.q9kERt7l-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403140230.q9kERt7l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403140230.q9kERt7l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mtd/maps/physmap-core.c:35:
   include/linux/mtd/map.h:413:43: warning: format specifies type 'unsigned int' but the argument has type 'void *' [-Wformat]
           pr_info("%s map->virt=%08x\n", __func__, map->virt);
                                 ~~~~               ^~~~~~~~~
   include/linux/printk.h:528:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                   ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
>> drivers/mtd/maps/physmap-core.c:527:52: warning: format specifies type 'unsigned int' but the argument has type 'void *' [-Wformat]
                   dev_notice(&dev->dev, "remapped to %08x-%08x\n", info->maps[i].virt,
                                                      ~~~~          ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:148:71: note: expanded from macro 'dev_notice'
           dev_printk_index_wrap(_dev_notice, KERN_NOTICE, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                        ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   drivers/mtd/maps/physmap-core.c:528:7: warning: format specifies type 'unsigned int' but the argument has type 'void *' [-Wformat]
                              info->maps[i].virt + info->maps[i].size - 1);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:148:71: note: expanded from macro 'dev_notice'
           dev_printk_index_wrap(_dev_notice, KERN_NOTICE, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                        ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   3 warnings generated.


vim +527 drivers/mtd/maps/physmap-core.c

   445	
   446	static int physmap_flash_probe(struct platform_device *dev)
   447	{
   448		struct physmap_flash_info *info;
   449		int err = 0;
   450		int i;
   451	
   452		if (!dev->dev.of_node && !dev_get_platdata(&dev->dev))
   453			return -EINVAL;
   454	
   455		info = devm_kzalloc(&dev->dev, sizeof(*info), GFP_KERNEL);
   456		if (!info)
   457			return -ENOMEM;
   458	
   459		while (platform_get_resource(dev, IORESOURCE_MEM, info->nmaps))
   460			info->nmaps++;
   461	
   462		if (!info->nmaps)
   463			return -ENODEV;
   464	
   465		info->maps = devm_kzalloc(&dev->dev,
   466					  sizeof(*info->maps) * info->nmaps,
   467					  GFP_KERNEL);
   468		if (!info->maps)
   469			return -ENOMEM;
   470	
   471		info->mtds = devm_kzalloc(&dev->dev,
   472					  sizeof(*info->mtds) * info->nmaps,
   473					  GFP_KERNEL);
   474		if (!info->mtds)
   475			return -ENOMEM;
   476	
   477		platform_set_drvdata(dev, info);
   478	
   479		info->gpios = devm_gpiod_get_array_optional(&dev->dev, "addr",
   480							    GPIOD_OUT_LOW);
   481		if (IS_ERR(info->gpios))
   482			return PTR_ERR(info->gpios);
   483	
   484		if (info->gpios && info->nmaps > 1) {
   485			dev_err(&dev->dev, "addr-gpios only supported for nmaps == 1\n");
   486			return -EINVAL;
   487		}
   488	
   489		pm_runtime_enable(&dev->dev);
   490		pm_runtime_get_sync(&dev->dev);
   491	
   492		if (dev->dev.of_node) {
   493			pr_info("%s: call physmap_flash_of_init()\n", __func__);
   494			err = physmap_flash_of_init(dev);
   495		} else
   496			err = physmap_flash_pdata_init(dev);
   497	
   498		if (err) {
   499			pm_runtime_put(&dev->dev);
   500			pm_runtime_disable(&dev->dev);
   501			return err;
   502		}
   503	
   504		for (i = 0; i < info->nmaps; i++) {
   505			struct resource *res;
   506	
   507			info->maps[i].virt = devm_platform_get_and_ioremap_resource(dev, i, &res);
   508			if (IS_ERR(info->maps[i].virt)) {
   509				err = PTR_ERR(info->maps[i].virt);
   510				goto err_out;
   511			}
   512	
   513			dev_notice(&dev->dev, "physmap platform flash device: %pR\n",
   514				   res);
   515	
   516			if (!info->maps[i].name)
   517				info->maps[i].name = dev_name(&dev->dev);
   518	
   519			if (!info->maps[i].phys)
   520				info->maps[i].phys = res->start;
   521	
   522			info->win_order = get_bitmask_order(resource_size(res)) - 1;
   523			info->maps[i].size = BIT(info->win_order +
   524						 (info->gpios ?
   525						  info->gpios->ndescs : 0));
   526	
 > 527			dev_notice(&dev->dev, "remapped to %08x-%08x\n", info->maps[i].virt,
   528				   info->maps[i].virt + info->maps[i].size - 1);
   529	
   530			info->maps[i].map_priv_1 = (unsigned long)dev;
   531	
   532			if (info->gpios) {
   533				pr_info("%s: gpios map init\n", __func__);
   534				err = physmap_addr_gpios_map_init(&info->maps[i]);
   535				if (err)
   536					goto err_out;
   537			}
   538	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
