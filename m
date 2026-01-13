Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B03525393B;
	Tue, 13 Jan 2026 03:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768275740; cv=none; b=m8jBIYRG96XILC4nD9yuhiyVZ9fXyz4DzlKbnk3cjJYMFIdsNQfImHMHHnPEpwl/WVWhhJJKuf+tZbaPAC/Gr+RlPFUdF3ZpG9PLBypOhYj/shZ9tcTrl/6Iwd/hcySiX3Jjb5eZN2VFcbmyR7+B1NOx9dZby0sSexuXDFpGnqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768275740; c=relaxed/simple;
	bh=a189GyiyLwJgfD4HhPrDhWNPYwV0vohFYoQElg4PC7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYa5F0vkoLMoZtX6f9RanpS9bpbE/jGIaTBf1st/YVsBZdVMggGnI8+oULY8XH116fldTcaaXcdigl6gi01Vpi7qjj1sBZzohuVLKDoOWIRL9ygRSZHT3WSAvfI7fIRNnRCcLyV5R5QKsldfQk3oR7IL0jFLNow/YHZqzFP7iaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFkHMZUi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFkHMZUi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768275739; x=1799811739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a189GyiyLwJgfD4HhPrDhWNPYwV0vohFYoQElg4PC7Y=;
  b=EFkHMZUi7WxQvDLe/zDFLeZWzKg9AX1G/emY+qkluoHqQLV4LY342gq6
   ZqCub8cx7X14ZwOZM3iwUYcQ+n4HEJSO0GY1bBzuPEtV+aJtfi4BJjn3y
   tSjNQQ2z+nJUH7fbve7CGyvUHMeq27witXhMe1UHz/tmk1pMRl98y3lTb
   Xr6xT1x4Nvp57qF+HEy1yBekuf2UqgVYblE5mK92J1eNEuqZ6yF4gHUR6
   69R0jswG6OqffclzzCVhLwIFPgDRQSFKi6fSNHgmzA63IVduxmtv4dJrx
   8qz0p7Jy9eF+Oy5sPTrRzAXTxP4JCbzPUVIJjlH/jIo/B6ECKZB+YlgHg
   A==;
X-CSE-ConnectionGUID: BRlIY9MRSHC7ORvFSiiNMQ==
X-CSE-MsgGUID: /xkWG1SjRGWrTAran79gMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73189399"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73189399"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:42:18 -0800
X-CSE-ConnectionGUID: P0cr0bG/S/qezmCmaThNYA==
X-CSE-MsgGUID: ts13jOezTKKjb3EQe9wSoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204078696"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Jan 2026 19:42:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfVII-00000000EAy-3c1r;
	Tue, 13 Jan 2026 03:42:10 +0000
Date: Tue, 13 Jan 2026 11:41:38 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v3 2/4] of: reserved_mem: Support multiple 'reg' entries
 for memory-region
Message-ID: <202601131101.q65jw7p0-lkp@intel.com>
References: <20260107-mtd-memregion-v3-2-f9fc9107b992@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-mtd-memregion-v3-2-f9fc9107b992@bootlin.com>

Hi Gregory,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-CLEMENT/of-reserved_mem-Fix-placement-of-__free-annotation/20260107-211455
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260107-mtd-memregion-v3-2-f9fc9107b992%40bootlin.com
patch subject: [PATCH v3 2/4] of: reserved_mem: Support multiple 'reg' entries for memory-region
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260113/202601131101.q65jw7p0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131101.q65jw7p0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131101.q65jw7p0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/of_reserved_mem.c:317:7: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
     317 |                 if (err == -ENOENT && of_get_flat_dt_prop(child, "size", NULL)) {
         |                     ^~~
   drivers/of/of_reserved_mem.c:300:10: note: initialize the variable 'err' to silence this warning
     300 |                 int err, ret;
         |                        ^
         |                         = 0
   1 warning generated.


vim +/err +317 drivers/of/of_reserved_mem.c

8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  278  
54c180e73ffa3e Rob Herring        2024-03-11  279  /*
54c180e73ffa3e Rob Herring        2024-03-11  280   * fdt_scan_reserved_mem() - scan a single FDT node for reserved memory
54c180e73ffa3e Rob Herring        2024-03-11  281   */
54c180e73ffa3e Rob Herring        2024-03-11  282  int __init fdt_scan_reserved_mem(void)
54c180e73ffa3e Rob Herring        2024-03-11  283  {
54c180e73ffa3e Rob Herring        2024-03-11  284  	int node, child;
00c9a452a235c6 Oreoluwa Babatunde 2024-10-08  285  	int dynamic_nodes_cnt = 0, count = 0;
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  286  	int dynamic_nodes[MAX_RESERVED_REGIONS];
54c180e73ffa3e Rob Herring        2024-03-11  287  	const void *fdt = initial_boot_params;
54c180e73ffa3e Rob Herring        2024-03-11  288  
54c180e73ffa3e Rob Herring        2024-03-11  289  	node = fdt_path_offset(fdt, "/reserved-memory");
54c180e73ffa3e Rob Herring        2024-03-11  290  	if (node < 0)
54c180e73ffa3e Rob Herring        2024-03-11  291  		return -ENODEV;
54c180e73ffa3e Rob Herring        2024-03-11  292  
54c180e73ffa3e Rob Herring        2024-03-11  293  	if (__reserved_mem_check_root(node) != 0) {
54c180e73ffa3e Rob Herring        2024-03-11  294  		pr_err("Reserved memory: unsupported node format, ignoring\n");
54c180e73ffa3e Rob Herring        2024-03-11  295  		return -EINVAL;
54c180e73ffa3e Rob Herring        2024-03-11  296  	}
54c180e73ffa3e Rob Herring        2024-03-11  297  
54c180e73ffa3e Rob Herring        2024-03-11  298  	fdt_for_each_subnode(child, fdt, node) {
54c180e73ffa3e Rob Herring        2024-03-11  299  		const char *uname;
8be14ac8dccc70 Gregory CLEMENT    2026-01-07  300  		int err, ret;
54c180e73ffa3e Rob Herring        2024-03-11  301  
54c180e73ffa3e Rob Herring        2024-03-11  302  		if (!of_fdt_device_is_available(fdt, child))
54c180e73ffa3e Rob Herring        2024-03-11  303  			continue;
54c180e73ffa3e Rob Herring        2024-03-11  304  
54c180e73ffa3e Rob Herring        2024-03-11  305  		uname = fdt_get_name(fdt, child, NULL);
54c180e73ffa3e Rob Herring        2024-03-11  306  
8be14ac8dccc70 Gregory CLEMENT    2026-01-07  307  		ret = __reserved_mem_reserve_reg(child, uname);
8be14ac8dccc70 Gregory CLEMENT    2026-01-07  308  		if (ret > 0)
8be14ac8dccc70 Gregory CLEMENT    2026-01-07  309  			count += ret;
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  310  		/*
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  311  		 * Save the nodes for the dynamically-placed regions
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  312  		 * into an array which will be used for allocation right
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  313  		 * after all the statically-placed regions are reserved
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  314  		 * or marked as no-map. This is done to avoid dynamically
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  315  		 * allocating from one of the statically-placed regions.
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  316  		 */
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08 @317  		if (err == -ENOENT && of_get_flat_dt_prop(child, "size", NULL)) {
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  318  			dynamic_nodes[dynamic_nodes_cnt] = child;
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  319  			dynamic_nodes_cnt++;
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  320  		}
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  321  	}
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  322  	for (int i = 0; i < dynamic_nodes_cnt; i++) {
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  323  		const char *uname;
00c9a452a235c6 Oreoluwa Babatunde 2024-10-08  324  		int err;
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  325  
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  326  		child = dynamic_nodes[i];
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  327  		uname = fdt_get_name(fdt, child, NULL);
00c9a452a235c6 Oreoluwa Babatunde 2024-10-08  328  		err = __reserved_mem_alloc_size(child, uname);
00c9a452a235c6 Oreoluwa Babatunde 2024-10-08  329  		if (!err)
00c9a452a235c6 Oreoluwa Babatunde 2024-10-08  330  			count++;
54c180e73ffa3e Rob Herring        2024-03-11  331  	}
00c9a452a235c6 Oreoluwa Babatunde 2024-10-08  332  	total_reserved_mem_cnt = count;
54c180e73ffa3e Rob Herring        2024-03-11  333  	return 0;
54c180e73ffa3e Rob Herring        2024-03-11  334  }
54c180e73ffa3e Rob Herring        2024-03-11  335  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
