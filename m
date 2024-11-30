Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A9A13C3D3;
	Sat, 30 Nov 2024 07:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732950226; cv=none; b=QfdKnSZC+kM0uzQUqMXkyPkyigrXXlj+TleDEnQsr8fP+jy0dfPNeztg1edWQ2cJIpPx/7sXNO+yX7CEWqOMmfme48FR+UuWfuYbIabkr6WiPaozNQDQ02V03Pe1TpHDldx0pbdJlTNOadR2aWHI39t+M/2qSaGRGr+iMv0ErEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732950226; c=relaxed/simple;
	bh=YfiMztccSiKe3YBK5wXH7dyEjzjJD3Ix0Pp3ghKMdHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jUlT7HwRtSojMSTyMKCHRhfWp4nICNcuplGc/d6DWapIl9QtR6u0Nrj+AmtJGg1AnUl4x3QZFknQYjIHsovHSDrc6KB5r/NR8xUUz69xjqjgadTd7Jt8LTS2m0IoMh9Y95yRrd5ajsId/IOyvSD1biF/QCagTsmILAaUsgvMEH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1ItzbGt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1ItzbGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732950224; x=1764486224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YfiMztccSiKe3YBK5wXH7dyEjzjJD3Ix0Pp3ghKMdHM=;
  b=b1ItzbGtSRza2TCLesgYGiJFh0yLkxYmSuV2JKumJPR9RyXLfUeDN/JD
   U4R2LNnTszBjfhrRUM8CzArvmDTjapJ6HWAYQew5COvMLFF6canQ/Gki7
   0U4BDeFgJ+yBRUzb0ljQfuXmxAKxoi59mEMo8cOFIr3ywWD8tqpYKGhrw
   dfuQPhiQ9B+J4A3an0JQDcLL5IR37H1TrKOXsA01nvrI40a09IVDGxjWz
   mrMFY/5IBZEUJsTioMyFnJduVgYFg7cbSUs9q6qKxnz02+IHcH2ZrI+5Q
   rl/oBj0A5n4GeRwa4vMCnqx97zAcQxxLj3ffk1PjuwaNzJOKqEDnczBy4
   A==;
X-CSE-ConnectionGUID: Z+Y59gdUT+KWkYMfq2gVOA==
X-CSE-MsgGUID: YkthMkkTQ46dB2oTAypRRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="37103629"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="37103629"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 23:03:44 -0800
X-CSE-ConnectionGUID: ukG/bsjtQNGVIPKqBCfwng==
X-CSE-MsgGUID: EJPLnNDaRrG81S7SiZc4Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="93028917"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Nov 2024 23:03:42 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHHVz-00009v-31;
	Sat, 30 Nov 2024 07:03:39 +0000
Date: Sat, 30 Nov 2024 15:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.12.0-scu4-dt-overlay 24/30]
 drivers/gpio/gpiolib-of.c:1201:2: error: call to undeclared function
 'of_changeset_revert'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202411301523.8UcTC7Yz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.12.0-scu4-dt-overlay
head:   6a87eb702125c86f68c9c466c941b914713c8252
commit: 3003e9eae5cddbc635a165d44194a95e1d26b5be [24/30] gpio: Dynamically add OF nodes if not present
config: arm-integrator_defconfig (https://download.01.org/0day-ci/archive/20241130/202411301523.8UcTC7Yz-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411301523.8UcTC7Yz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301523.8UcTC7Yz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpiolib-of.c:1191:6: error: redefinition of 'of_gpiochip_remove_dev_node'
    1191 | void of_gpiochip_remove_dev_node(struct gpio_chip *chip)
         |      ^
   drivers/gpio/gpiolib-of.h:50:20: note: previous definition is here
      50 | static inline void of_gpiochip_remove_dev_node(struct gpio_chip *chip) {};
         |                    ^
>> drivers/gpio/gpiolib-of.c:1201:2: error: call to undeclared function 'of_changeset_revert'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1201 |         of_changeset_revert(np->data);
         |         ^
>> drivers/gpio/gpiolib-of.c:1202:2: error: call to undeclared function 'of_changeset_destroy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1202 |         of_changeset_destroy(np->data);
         |         ^
>> drivers/gpio/gpiolib-of.c:1217:8: error: call to undeclared function 'of_changeset_add_prop_bool'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1217 |         ret = of_changeset_add_prop_bool(ocs, np, "gpio-controller");
         |               ^
>> drivers/gpio/gpiolib-of.c:1221:9: error: call to undeclared function 'of_changeset_add_prop_u32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1221 |         return of_changeset_add_prop_u32(ocs, np, "#gpio-cells", 2);
         |                ^
   drivers/gpio/gpiolib-of.c:1224:6: error: redefinition of 'of_gpiochip_make_dev_node'
    1224 | void of_gpiochip_make_dev_node(struct gpio_chip *chip)
         |      ^
   drivers/gpio/gpiolib-of.h:49:20: note: previous definition is here
      49 | static inline void of_gpiochip_make_dev_node(struct gpio_chip *chip) {}
         |                    ^
>> drivers/gpio/gpiolib-of.c:1241:2: error: call to undeclared function 'of_changeset_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1241 |         of_changeset_init(cset);
         |         ^
>> drivers/gpio/gpiolib-of.c:1243:7: error: call to undeclared function 'of_changeset_create_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1243 |         np = of_changeset_create_node(cset, of_root, chip->label);
         |              ^
>> drivers/gpio/gpiolib-of.c:1243:5: error: incompatible integer to pointer conversion assigning to 'struct device_node *' from 'int' [-Wint-conversion]
    1243 |         np = of_changeset_create_node(cset, of_root, chip->label);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpiolib-of.c:1251:8: error: call to undeclared function 'of_changeset_apply'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1251 |         ret = of_changeset_apply(cset);
         |               ^
   drivers/gpio/gpiolib-of.c:1263:2: error: call to undeclared function 'of_changeset_destroy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1263 |         of_changeset_destroy(cset);
         |         ^
   11 errors generated.


vim +/of_changeset_revert +1201 drivers/gpio/gpiolib-of.c

  1190	
  1191	void of_gpiochip_remove_dev_node(struct gpio_chip *chip)
  1192	{
  1193		struct device_node *np;
  1194	
  1195		np = dev_of_node(&chip->gpiodev->dev);
  1196		if (!np || !of_node_check_flag(np, OF_DYNAMIC))
  1197			return;
  1198	
  1199		chip->gpiodev->dev.of_node = NULL;
  1200	
> 1201		of_changeset_revert(np->data);
> 1202		of_changeset_destroy(np->data);
  1203		of_node_put(np);
  1204	}
  1205	
  1206	static int of_gpiochip_add_properties(struct gpio_chip *chip,
  1207					      struct of_changeset *ocs,
  1208					      struct device_node *np)
  1209	{
  1210		int ret;
  1211	
  1212		/*
  1213		 * The added properties will be released when the
  1214		 * changeset is destroyed.
  1215		 */
  1216	
> 1217		ret = of_changeset_add_prop_bool(ocs, np, "gpio-controller");
  1218		if (ret)
  1219			return ret;
  1220	
> 1221		return of_changeset_add_prop_u32(ocs, np, "#gpio-cells", 2);
  1222	}
  1223	
  1224	void of_gpiochip_make_dev_node(struct gpio_chip *chip)
  1225	{
  1226		struct device_node *np = NULL;
  1227		struct of_changeset *cset;
  1228		int ret;
  1229	
  1230		/*
  1231		 * If there is already a device tree node linked to this device,
  1232		 * return immediately.
  1233		 */
  1234		if (chip->gpiodev->dev.of_node)
  1235			return;
  1236	
  1237		cset = kmalloc(sizeof(*cset), GFP_KERNEL);
  1238		if (!cset)
  1239		       return;
  1240	
> 1241		of_changeset_init(cset);
  1242	
> 1243		np = of_changeset_create_node(cset, of_root, chip->label);
  1244		if (!np)
  1245			goto out_destroy_cset;
  1246	
  1247		ret = of_gpiochip_add_properties(chip, cset, np);
  1248		if (ret)
  1249			goto out_free_node;
  1250	
> 1251		ret = of_changeset_apply(cset);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
