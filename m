Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162782C82
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 15:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643729349; x=1675265349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O9qf2U0x7o4A/jcao6X2JJyNTrNpGEOOemrb2qph0vo=;
  b=PF3VMQE09dhR/gcn4Vr6fs06VHWMED3fUmSTq1OTikexJnpyR+sx+4se
   oz/iSkRqwQkG5GG2MalD6hQdQNL4UNpZRi65x63U+gi6qmnZfynQPonog
   yYXPV1RDe+OPoTpN/u/WQu0hIvoKpg8D0O5xZkQ6Dmp4oE3XW3wKRxy8g
   g2pUO1ilJH96GFPbYuMacPRQGPJ9GlSeCfEel7Q5oWd+eyp0Nklpc7Jb8
   v532PdGg+dAv/6VEL+YP3NsX4vuO9ohamLNoVZGkjh8eOKzM3RbtQO9/E
   XMIfv8AuztrRoFagrLVnuqvBbn7rcbY7xDYE9Af9Q1C1pnib1yYQbZUt8
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="227685549"
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; 
   d="scan'208";a="227685549"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 07:28:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; 
   d="scan'208";a="698437069"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Feb 2022 07:28:50 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEv5O-000TPg-6S; Tue, 01 Feb 2022 15:28:50 +0000
Date: Tue, 1 Feb 2022 23:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@gnuweeb.org>,
	linux-kernel@vger.kernel.org,
	Will McVicker <willmcvicker@google.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [ammarfaizi2-block:google/android/kernel/common/android-4.19-stable
 343/9999] drivers/nvmem/core.c:347:5: warning: no previous prototype for
 function 'nvmem_add_cells'
Message-ID: <202202012338.LedWi6I7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-4.19-stable
head:   b45c5eeda8dea785e3d411380b486a209768f6b2
commit: e96a10625581a499e8a4218ef504f3f53918408b [343/9999] UPSTREAM: nvmem: add support for cell info
config: x86_64-randconfig-r026-20220131 (https://download.01.org/0day-ci/archive/20220201/202202012338.LedWi6I7-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/e96a10625581a499e8a4218ef504f3f53918408b
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-4.19-stable
        git checkout e96a10625581a499e8a4218ef504f3f53918408b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/nvmem/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/nvmem/core.c:347:5: warning: no previous prototype for function 'nvmem_add_cells' [-Wmissing-prototypes]
   int nvmem_add_cells(struct nvmem_device *nvmem,
       ^
   drivers/nvmem/core.c:347:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int nvmem_add_cells(struct nvmem_device *nvmem,
   ^
   static 
   1 warning generated.


vim +/nvmem_add_cells +347 drivers/nvmem/core.c

eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  337  
b3db17e4b864e4 Andrew Lunn         2018-05-11  338  /**
b3db17e4b864e4 Andrew Lunn         2018-05-11  339   * nvmem_add_cells() - Add cell information to an nvmem device
b3db17e4b864e4 Andrew Lunn         2018-05-11  340   *
b3db17e4b864e4 Andrew Lunn         2018-05-11  341   * @nvmem: nvmem device to add cells to.
b3db17e4b864e4 Andrew Lunn         2018-05-11  342   * @info: nvmem cell info to add to the device
b3db17e4b864e4 Andrew Lunn         2018-05-11  343   * @ncells: number of cells in info
b3db17e4b864e4 Andrew Lunn         2018-05-11  344   *
b3db17e4b864e4 Andrew Lunn         2018-05-11  345   * Return: 0 or negative error code on failure.
b3db17e4b864e4 Andrew Lunn         2018-05-11  346   */
b3db17e4b864e4 Andrew Lunn         2018-05-11 @347  int nvmem_add_cells(struct nvmem_device *nvmem,
b3db17e4b864e4 Andrew Lunn         2018-05-11  348  		    const struct nvmem_cell_info *info,
b3db17e4b864e4 Andrew Lunn         2018-05-11  349  		    int ncells)
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  350  {
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  351  	struct nvmem_cell **cells;
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  352  	int i, rval;
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  353  
b3db17e4b864e4 Andrew Lunn         2018-05-11  354  	cells = kcalloc(ncells, sizeof(*cells), GFP_KERNEL);
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  355  	if (!cells)
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  356  		return -ENOMEM;
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  357  
b3db17e4b864e4 Andrew Lunn         2018-05-11  358  	for (i = 0; i < ncells; i++) {
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  359  		cells[i] = kzalloc(sizeof(**cells), GFP_KERNEL);
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  360  		if (!cells[i]) {
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  361  			rval = -ENOMEM;
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  362  			goto err;
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  363  		}
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  364  
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  365  		rval = nvmem_cell_info_to_nvmem_cell(nvmem, &info[i], cells[i]);
287980e49ffc0f Arnd Bergmann       2016-05-27  366  		if (rval) {
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  367  			kfree(cells[i]);
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  368  			goto err;
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  369  		}
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  370  
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  371  		nvmem_cell_add(cells[i]);
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  372  	}
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  373  
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  374  	/* remove tmp array */
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  375  	kfree(cells);
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  376  
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  377  	return 0;
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  378  err:
dfdf141429f089 Rasmus Villemoes    2016-02-08  379  	while (i--)
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  380  		nvmem_cell_drop(cells[i]);
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  381  
dfdf141429f089 Rasmus Villemoes    2016-02-08  382  	kfree(cells);
dfdf141429f089 Rasmus Villemoes    2016-02-08  383  
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  384  	return rval;
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  385  }
b3db17e4b864e4 Andrew Lunn         2018-05-11  386  EXPORT_SYMBOL_GPL(nvmem_add_cells);
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  387  

:::::: The code at line 347 was first introduced by commit
:::::: b3db17e4b864e46ad150ebef69c0e0130a1c5fca drivers: nvmem: Export nvmem_add_cells()

:::::: TO: Andrew Lunn <andrew@lunn.ch>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
