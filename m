Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6989332ABC6;
	Fri, 17 Oct 2025 12:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760704948; cv=none; b=LhPdshLIvr2bZQsfKh32s6Tlg3sPXr/EgA11mXibyIsdPyqQMNGodemm9Libxgb1vq5d40b/2/MlQcHOpNtmztUDFYhtKc8iiSyNPsaaG4KSiLlYFm843aAAkUVNcVaQOC43cAQL/gm9ZIyLpTsGVue1J+9+cv6TMgyUuI55e3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760704948; c=relaxed/simple;
	bh=gPjraPHBXn2fLaabKS2du7VQKfsxdSWdD+f/UGuL9R8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MFqLHo4wuAx6oyeDs128xuZ7WL+aNrTcj4hA2A0huY73Fg0Br9w3YRUNg4TVHyebROSLKAu/k8IfatyE4/MAT0tKY3YX5gCGvAl6t5/N5OkgL+ylwoXBzQBYPjoRaz1OP8+4cqh740e1BiG8APUkrhfQIaO/OxqOnszj69tGRAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+snkLsy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+snkLsy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760704946; x=1792240946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gPjraPHBXn2fLaabKS2du7VQKfsxdSWdD+f/UGuL9R8=;
  b=c+snkLsyK+U9vBaU74Bgygie9/y5fUyym1xobIgDwFN7kjUfutBCMxzl
   DKMCZXyUB5tGKdyw7onlGGycQKtTL+Rf3QFjq/5q+Kc50aT8sXsHiM0tu
   vTFz4VcckxkONMbck1sSU6s3pyaNpWVKsMJfutHlOnRYAJ2QC/vjbu0+z
   DvZjvJESig64D52lKsCIXWdc/FLdNkUfLhSJ8Y/o4QvYqH+ojndaUxcKO
   YEflPLk05+yUcueaTplQT6Iq6DHSXWC1176piD1HborvzaHlU/rcHXSvu
   uoawVtcveSQW6K0eMNZOeWRGGzPNlF1KLybvQj/Wr525hqqEXZ2Bj1VNW
   Q==;
X-CSE-ConnectionGUID: 2mGg76ylSD+uVtKZ6texVA==
X-CSE-MsgGUID: gD4fwQdgTqCRl5f0T4lasA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="63059787"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="63059787"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 05:42:24 -0700
X-CSE-ConnectionGUID: /NZjkvjGT6uVFVEoOOlZQA==
X-CSE-MsgGUID: aZQRsllWQvCoC+FR+drjYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="181860364"
Received: from igk-lkp-server01.igk.intel.com (HELO e6a816730032) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 17 Oct 2025 05:42:25 -0700
Received: from kbuild by e6a816730032 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v9jmo-0000000004R-04NI;
	Fri, 17 Oct 2025 12:42:22 +0000
Date: Fri, 17 Oct 2025 14:41:39 +0200
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:ramdax/v2 1/1] drivers/nvdimm/ramdax.c:89:6: warning: variable
 'err' is used uninitialized whenever 'if' condition is true
Message-ID: <202510151412.xq0waBqC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git ramdax/v2
head:   21920e8b12b5d2011f38cf50c9e686004bfb7540
commit: 21920e8b12b5d2011f38cf50c9e686004bfb7540 [1/1] nvdimm: allow exposing RAM carveouts as NVDIMM DIMM devices
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251015/202510151412.xq0waBqC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510151412.xq0waBqC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510151412.xq0waBqC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvdimm/ramdax.c:89:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
      89 |         if (!dimm->label_area)
         |             ^~~~~~~~~~~~~~~~~
   drivers/nvdimm/ramdax.c:117:9: note: uninitialized use occurs here
     117 |         return err;
         |                ^~~
   drivers/nvdimm/ramdax.c:89:2: note: remove the 'if' if its condition is always false
      89 |         if (!dimm->label_area)
         |         ^~~~~~~~~~~~~~~~~~~~~~
      90 |                 goto err_free_dimm;
         |                 ~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/ramdax.c:81:9: note: initialize the variable 'err' to silence this warning
      81 |         int err;
         |                ^
         |                 = 0
   1 warning generated.


vim +89 drivers/nvdimm/ramdax.c

    73	
    74	static int ramdax_register_dimm(struct resource *res, void *data)
    75	{
    76		resource_size_t start = res->start;
    77		resource_size_t size = resource_size(res);
    78		unsigned long flags = 0, cmd_mask = 0;
    79		struct nvdimm_bus *nvdimm_bus = data;
    80		struct ramdax_dimm *dimm;
    81		int err;
    82	
    83		dimm = kzalloc(sizeof(*dimm), GFP_KERNEL);
    84		if (!dimm)
    85			return -ENOMEM;
    86	
    87		dimm->label_area = memremap(start + size - LABEL_AREA_SIZE,
    88					    LABEL_AREA_SIZE, MEMREMAP_WB);
  > 89		if (!dimm->label_area)
    90			goto err_free_dimm;
    91	
    92		set_bit(NDD_LABELING, &flags);
    93		set_bit(NDD_REGISTER_SYNC, &flags);
    94		set_bit(ND_CMD_GET_CONFIG_SIZE, &cmd_mask);
    95		set_bit(ND_CMD_GET_CONFIG_DATA, &cmd_mask);
    96		set_bit(ND_CMD_SET_CONFIG_DATA, &cmd_mask);
    97		dimm->nvdimm = nvdimm_create(nvdimm_bus, dimm,
    98					     /* dimm_attribute_groups */ NULL,
    99					     flags, cmd_mask, 0, NULL);
   100		if (!dimm->nvdimm) {
   101			err = -ENOMEM;
   102			goto err_unmap_label;
   103		}
   104	
   105		err = ramdax_register_region(res, dimm->nvdimm, nvdimm_bus);
   106		if (err)
   107			goto err_remove_nvdimm;
   108	
   109		return 0;
   110	
   111	err_remove_nvdimm:
   112		nvdimm_delete(dimm->nvdimm);
   113	err_unmap_label:
   114		memunmap(dimm->label_area);
   115	err_free_dimm:
   116		kfree(dimm);
   117		return err;
   118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
