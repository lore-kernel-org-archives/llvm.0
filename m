Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D792E36E3;
	Mon, 14 Jul 2025 03:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752462298; cv=none; b=WPObkXyc3EfOIJynCXfPIQy5xln4pHtDJqEkQUW8boGzSzVD2fXbiie7z/cVs6jrZubcVUavSJs1EnyTR6s08xuvlgTsoGEifCkbn3TP24QCUatBXHnrl8oECwCj5BheAlyZrOPGjxvrlzEt5kVBnwObizGrqlEVKTULvJUmm38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752462298; c=relaxed/simple;
	bh=C+9SO1vO2unM0WBcMuLVfYhXioucnZUM+dwWbiG6LYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TyPLVmB9p3RTY+5GkKR5XQkwvJ5CWWOYOyaXtdqUBNBbElutERqs2+8hd//lFH4k0MC9nfDBJGyfDX6alLMYafKnbU1dPYyPtQZ+NULhACTTY486mhujNtKXhxzamfHKI5XeWNOMADwCQmw8kqvaa/lBF+aIePJSqq6GEz8H/0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkWt7J32; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkWt7J32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752462297; x=1783998297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C+9SO1vO2unM0WBcMuLVfYhXioucnZUM+dwWbiG6LYo=;
  b=CkWt7J32BpYjCALyKkJL7AhOBSrbdapdzp5EzVMUmFqOzW31BQud1xbQ
   lqSqfxVc8mVgqyjagF5TJgq0hi/+i9OVzxUZ+oAY8rkpdngz4Nsnzk7mM
   HTFTzUhJ6Ue9/FxRC1YgcXKUnJfF7bBAwXv/I5z5pF95TZ39d1p9sW26g
   jcYKCfoHF0DLNjJudH+IFPB9R4kjGnGmkBDP/cqWe9agM62pvZtfFqY5m
   LlrYZuP3NP4EGlRSzk0av3qX/ZmjbmU9pvlwF6CWYIYmYaUdblm/NJWoL
   nZsBcoRUDFkELz3HI2dlHS30qt4mO4VRBNSgyd3vy2zxzwAyF9gx9uEHd
   g==;
X-CSE-ConnectionGUID: 5+e7T1h8RRi5S1xn8cZ47Q==
X-CSE-MsgGUID: PneCvc6eRYmaJUC/Ua6lFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66005475"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="66005475"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 20:04:57 -0700
X-CSE-ConnectionGUID: fRCb4DwCSOa56gNEv9yHYQ==
X-CSE-MsgGUID: e7nd1wekS2m0UGcuUTsamQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="187820012"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2025 20:04:55 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ub9Ur-0008Rl-0o;
	Mon, 14 Jul 2025 03:04:53 +0000
Date: Mon, 14 Jul 2025 11:04:12 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [ras:edac-drivers 1/1] drivers/edac/synopsys_edac.c:1405:6: warning:
 variable 'rc' is used uninitialized whenever 'if' condition is true
Message-ID: <202507141048.obUv3ZUm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git edac-drivers
head:   3e2923c48e75f69f988c9cafd1fd2fbca4fc05f6
commit: 3e2923c48e75f69f988c9cafd1fd2fbca4fc05f6 [1/1] EDAC/synopsys: Clear the ECC counters on init
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250714/202507141048.obUv3ZUm-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507141048.obUv3ZUm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507141048.obUv3ZUm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/edac/synopsys_edac.c:1405:6: warning: variable 'rc' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1405 |         if (!get_ecc_state(priv)) {
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/edac/synopsys_edac.c:1453:9: note: uninitialized use occurs here
    1453 |         return rc;
         |                ^~
   drivers/edac/synopsys_edac.c:1405:2: note: remove the 'if' if its condition is always false
    1405 |         if (!get_ecc_state(priv)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
    1406 |                 edac_printk(KERN_INFO, EDAC_MC, "ECC not enabled\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1407 |                 goto free_edac_mc;
         |                 ~~~~~~~~~~~~~~~~~~
    1408 |         }
         |         ~
   drivers/edac/synopsys_edac.c:1376:8: note: initialize the variable 'rc' to silence this warning
    1376 |         int rc;
         |               ^
         |                = 0
   1 warning generated.


vim +1405 drivers/edac/synopsys_edac.c

  1359	
  1360	/**
  1361	 * mc_probe - Check controller and bind driver.
  1362	 * @pdev:	platform device.
  1363	 *
  1364	 * Probe a specific controller instance for binding with the driver.
  1365	 *
  1366	 * Return: 0 if the controller instance was successfully bound to the
  1367	 * driver; otherwise, < 0 on error.
  1368	 */
  1369	static int mc_probe(struct platform_device *pdev)
  1370	{
  1371		const struct synps_platform_data *p_data;
  1372		struct edac_mc_layer layers[2];
  1373		struct synps_edac_priv *priv;
  1374		struct mem_ctl_info *mci;
  1375		void __iomem *baseaddr;
  1376		int rc;
  1377	
  1378		baseaddr = devm_platform_ioremap_resource(pdev, 0);
  1379		if (IS_ERR(baseaddr))
  1380			return PTR_ERR(baseaddr);
  1381	
  1382		p_data = of_device_get_match_data(&pdev->dev);
  1383		if (!p_data)
  1384			return -ENODEV;
  1385	
  1386	
  1387		layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
  1388		layers[0].size = SYNPS_EDAC_NR_CSROWS;
  1389		layers[0].is_virt_csrow = true;
  1390		layers[1].type = EDAC_MC_LAYER_CHANNEL;
  1391		layers[1].size = SYNPS_EDAC_NR_CHANS;
  1392		layers[1].is_virt_csrow = false;
  1393	
  1394		mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers,
  1395				    sizeof(struct synps_edac_priv));
  1396		if (!mci) {
  1397			edac_printk(KERN_ERR, EDAC_MC,
  1398				    "Failed memory allocation for mc instance\n");
  1399			return -ENOMEM;
  1400		}
  1401	
  1402		priv = mci->pvt_info;
  1403		priv->baseaddr = baseaddr;
  1404		priv->p_data = p_data;
> 1405		if (!get_ecc_state(priv)) {
  1406			edac_printk(KERN_INFO, EDAC_MC, "ECC not enabled\n");
  1407			goto free_edac_mc;
  1408		}
  1409	
  1410		spin_lock_init(&priv->reglock);
  1411	
  1412		mc_init(mci, pdev);
  1413	
  1414		if (priv->p_data->quirks & DDR_ECC_INTR_SUPPORT) {
  1415			rc = setup_irq(mci, pdev);
  1416			if (rc)
  1417				goto free_edac_mc;
  1418		}
  1419	
  1420		rc = edac_mc_add_mc(mci);
  1421		if (rc) {
  1422			edac_printk(KERN_ERR, EDAC_MC,
  1423				    "Failed to register with EDAC core\n");
  1424			goto free_edac_mc;
  1425		}
  1426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
