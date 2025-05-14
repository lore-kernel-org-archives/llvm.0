Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942EC215067;
	Wed, 14 May 2025 21:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747259544; cv=none; b=JpUw5fEy4cf/jXdDwUubvWN15QeC3qdGuhjqgGRB5egnnsgIUNl/aQKNeBKrlDngXEd6af1bp0QcbnhGpG3wn0QV1OySCtJEZuqrTonYgF7nwKpqFoXke80Dgpp1IaCFvJG42uLlVLwjSXwmov3y/sqSoTsIASqjfnDRygVxodg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747259544; c=relaxed/simple;
	bh=WE1kkOih7ieP3MpoLtFnsfRD6A4HizsAgMgGr5inInE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XPQv7mX/s34ts/Pj/d1kY5bMorNHvZTB5WWftZUovsHdWwDj4Hxhscx6+rOCH7oOMgivVyawAndBE0CpWW2TiXpsG0nTy2wehYJ80FfPZz/DhCFT7nfbhg7GoTNvEv9GFB9M3vP8e+oc5OPhQ2TD3u8nbGVIDWpWT5vJUNog4rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QiFmqeyQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QiFmqeyQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747259542; x=1778795542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WE1kkOih7ieP3MpoLtFnsfRD6A4HizsAgMgGr5inInE=;
  b=QiFmqeyQ1poRmwmS/WRhhvoOYXINOppWx9NMbpMFGBkcDa8gEVn7hTIV
   IRRNEohrt1kANP3Y5yo0mVeY49DB155lKP251nFRVjJf5dQdItdGIIMSA
   zOpbh1+/kksepLo5lYfC3CQVFVZY12H5+mtz2X3ELRjYYrCTp3p91IyVl
   o3qjRkWWwwOYFVcxS9ih+PHQwacubnXWC6bXFY0iEceGVTKexc3A5ygoW
   86Pr8gyOg62HNgdXG8J69PAcvkawbp5vKnj2GRx4xTaKtzovxacO8D8Xb
   fweUxwe4qCAcKyCHNaY4cbIhBY/YFCHUYPzY+ZVYeJByU3Gmx/YF1BJk3
   Q==;
X-CSE-ConnectionGUID: uo3UaMu5RV6mFbak6k2RHA==
X-CSE-MsgGUID: rczmaZrWThKmZWRm0NG2fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60579823"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="60579823"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 14:52:21 -0700
X-CSE-ConnectionGUID: E9XIQlyoSjapinfbcbUv6g==
X-CSE-MsgGUID: 3z4x+3VLSE2zdTkbTFnBCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="138043698"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 May 2025 14:52:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFK1R-000Hcd-2P;
	Wed, 14 May 2025 21:52:17 +0000
Date: Thu, 15 May 2025 05:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:ramdax 1/1] drivers/nvdimm/ramdax.c:89:6: warning: variable
 'err' is used uninitialized whenever 'if' condition is true
Message-ID: <202505150504.66GhNnqk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git ramdax
head:   0b81d6e851e5acf76aba4697db1281798bedbec8
commit: 0b81d6e851e5acf76aba4697db1281798bedbec8 [1/1] nvdimm: allow exposing RAM carveouts as NVDIMM devices
config: x86_64-buildonly-randconfig-003-20250515 (https://download.01.org/0day-ci/archive/20250515/202505150504.66GhNnqk-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150504.66GhNnqk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150504.66GhNnqk-lkp@intel.com/

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
