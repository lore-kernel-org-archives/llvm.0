Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9514B6FAD;
	Sun, 10 Dec 2023 08:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="loxXLQWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702196018; x=1733732018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=juynS0Dx4tVXtiHdj+sokllf4aZwRtcyn61WUVwhA4M=;
  b=loxXLQWuvfu80FU9wd2nCRCWDfOUfUvSeukb96G9Ny3//faFwDGjSlbl
   pxxaIFcgLd9wUAUI+X2+xWMdIO2AwPPEA4wBfn6zZlY55OMWMtw57rwF/
   H9KrdX7MN7huJEiHuAFoudJfWxUPNwulQkW+qEb+TQFBo95CP2z/lYvnU
   0hWQc4KiajOYA0+svefWQ99yTUCzMW6EmaRHrtcXEbgwe8uJe+O6XsxIC
   rRgAoK+NOvAZaD4cB7cWlsmQkckmFsrAvUxBB2w+V1c6BkMw4ebnzbd+7
   3jPZ+22M4c7VN362EUjKk6EF+0qOBZClLJSO36oFpitTb0sah7UEE/MJm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="374051031"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="374051031"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 00:13:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="945883777"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="945883777"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 10 Dec 2023 00:13:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCEwP-000Gb7-2q;
	Sun, 10 Dec 2023 08:13:33 +0000
Date: Sun, 10 Dec 2023 16:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [srini-nvmem:for-next 7/13] drivers/nvmem/core.c:1470:2: error: call
 to undeclared function 'nvmem_layout_module_put'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202312101649.wG7vHNYC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-next
head:   d58acb1e2be2e29f5e4add7d48ae35e23d69b7c3
commit: ed7778e43271c55d78ff458b826f4e989da72444 [7/13] nvmem: core: Rework layouts to become regular devices
config: i386-randconfig-013-20231210 (https://download.01.org/0day-ci/archive/20231210/202312101649.wG7vHNYC-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312101649.wG7vHNYC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312101649.wG7vHNYC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvmem/core.c:1470:2: error: call to undeclared function 'nvmem_layout_module_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           nvmem_layout_module_put(nvmem);
           ^
   1 error generated.


vim +/nvmem_layout_module_put +1470 drivers/nvmem/core.c

  1455	
  1456	/**
  1457	 * nvmem_cell_put() - Release previously allocated nvmem cell.
  1458	 *
  1459	 * @cell: Previously allocated nvmem cell by nvmem_cell_get().
  1460	 */
  1461	void nvmem_cell_put(struct nvmem_cell *cell)
  1462	{
  1463		struct nvmem_device *nvmem = cell->entry->nvmem;
  1464	
  1465		if (cell->id)
  1466			kfree_const(cell->id);
  1467	
  1468		kfree(cell);
  1469		__nvmem_device_put(nvmem);
> 1470		nvmem_layout_module_put(nvmem);
  1471	}
  1472	EXPORT_SYMBOL_GPL(nvmem_cell_put);
  1473	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
