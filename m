Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361A6371860;
	Tue,  8 Sep 2026 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855027; cv=none; b=Ba7PSRGczVcaUZoxgd3ZQnI1AOj2wijxGvJKkvv+c4HnW00/DWtQokZHJEJOJPvNDU2WQ3wPvncZCWc5QcBaUDBa3vtl8gx13JZhhxVoHXDL8prNH2fmXS3zC9XLFQTP0FJJdhdQrJdlw3iiXEh0tBDoltFZNtnOEeLQBJWezZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855027; c=relaxed/simple;
	bh=DcT+4RZsm15hQyCKxoRnRYKGrvLWi0uj14D8lJpw3aU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qX3O6qKgQaTk2eGMkAQ4zPYNkqVwVcisQIHj2eEF/o4Jlxdrqgu175weP10upU8YpEQOWMj9WeRnsL4vh/BsJCR7kHvSe6LgNljD5biyKYD41yqi7Wkb/oxvknbfwFiuEX0RYhOK0QhLxdBXGTaUd8ELORhWas9aX7192E/QAHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddzS7cnU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddzS7cnU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788855025; x=1820391025;
  h=date:from:to:cc:subject:message-id;
  bh=DcT+4RZsm15hQyCKxoRnRYKGrvLWi0uj14D8lJpw3aU=;
  b=ddzS7cnUFMtwqNfYwJq2QmsSnrRfDBq1of1gSG/8Z6z7aeA79r9/kfjx
   ubDkXWfDPb+zxmp/uGZzEtnax0slg6pp4Ud2pKElzvmFDuUdsPV5FKqa/
   YAILXuzvgUGARb18Lm0QZm4bKUpoBDWIip5shjOuHDmgr/nqUVSZnmybe
   G53hDgXi7WIHW+zlRUBYZzI2m9NbH2LVqptBrRRVai5ZLTE6B4Q3XyJ2T
   Wl0xUWlNSNylVglu412aP6gP+E1pqkMlRplwZq9z9+aZZb1DcoGxwN3vS
   8BRVN51YjwPCpUtWnc3VOVE1Wx9KAN9ilAD3Rcm9wQxHQE1LHYCaB8C9c
   w==;
X-CSE-ConnectionGUID: VzENwuWgQB2I5GNRVdqzRg==
X-CSE-MsgGUID: 0xD68kIPT7qzo9/DQn63BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="92950332"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="92950332"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:10:24 -0700
X-CSE-ConnectionGUID: YUxZ63t9S5Oqcmmjh1yNNw==
X-CSE-MsgGUID: 8F5/s4+tQ2Oj+pUv4xixtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="270408504"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Sep 2026 01:10:23 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3quJ-000000001s3-23EL;
	Tue, 08 Sep 2026 08:10:19 +0000
Date: Tue, 08 Sep 2026 16:09:30 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [pinchartl:rcar/x5h/vsp 1/1]
 drivers/media/platform/renesas/rcar-fcp.c:263:14: warning: cast to smaller
 integer type 'enum rcar_fcp_type' from 'const void *'
Message-ID: <202609081526.zHnaqSx0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git rcar/x5h/vsp
head:   a92cff87bfdad91d6a30df052c342a23849c1f40
commit: a92cff87bfdad91d6a30df052c342a23849c1f40 [1/1] v4l: rcar-fcp: Check device revision at probe time
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260908/202609081526.zHnaqSx0-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2362eeb5f75560740146975e9eabe84c6bd25a0d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081526.zHnaqSx0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609081526.zHnaqSx0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/renesas/rcar-fcp.c:263:14: warning: cast to smaller integer type 'enum rcar_fcp_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     263 |         fcp->type = (enum rcar_fcp_type)device_get_match_data(&pdev->dev);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +263 drivers/media/platform/renesas/rcar-fcp.c

   252	
   253	static int rcar_fcp_probe(struct platform_device *pdev)
   254	{
   255		struct rcar_fcp_device *fcp;
   256		int ret;
   257	
   258		fcp = devm_kzalloc(&pdev->dev, sizeof(*fcp), GFP_KERNEL);
   259		if (fcp == NULL)
   260			return -ENOMEM;
   261	
   262		fcp->dev = &pdev->dev;
 > 263		fcp->type = (enum rcar_fcp_type)device_get_match_data(&pdev->dev);
   264	
   265		fcp->base = devm_platform_ioremap_resource(pdev, 0);
   266		if (IS_ERR(fcp->base))
   267			return PTR_ERR(fcp->base);
   268	
   269		dma_set_max_seg_size(fcp->dev, UINT_MAX);
   270	
   271		pm_runtime_enable(&pdev->dev);
   272		ret = pm_runtime_get_sync(&pdev->dev);
   273		if (ret < 0)
   274			goto error_pm_disable;
   275	
   276		ret = rcar_fcp_setup(fcp);
   277		if (ret < 0)
   278			goto error_pm_put;
   279	
   280		pm_runtime_put(&pdev->dev);
   281	
   282		mutex_lock(&fcp_lock);
   283		list_add_tail(&fcp->list, &fcp_devices);
   284		mutex_unlock(&fcp_lock);
   285	
   286		platform_set_drvdata(pdev, fcp);
   287	
   288		return 0;
   289	
   290	error_pm_put:
   291		pm_runtime_put(&pdev->dev);
   292	error_pm_disable:
   293		pm_runtime_disable(&pdev->dev);
   294		return ret;
   295	}
   296	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
