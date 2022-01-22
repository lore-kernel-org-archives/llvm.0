Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A612CAB
	for <llvm@lists.linux.dev>; Sat, 22 Jan 2022 20:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642882565; x=1674418565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I05j7AIiy5VYCwKC09ZWpINZcZRo6HaH+XfW4ySU/b8=;
  b=QmrnzkWvLcqPy2Z6O8Ags9F0Cu/YjyvUvOZ6W1lmT2WplRxpa5dDMa4E
   kmItdj3KxYL6uZQwXFcc55d1HbJAId3DepXyi5uE1M/SRk92JBbuhGQrk
   ulMQGg4J3o6x94yRllIPu9KY2bUZcU/sLsFGHzCmRduNVG+7xbPU9LIdU
   kXzxIV5TVPhVEKEVyOIPdmjZS5VumNNgzg+j1xko6oyhdbuv0TG1zgJPY
   7Mwz0U+3k4rSoFz0i8plaHz3SNnEHUiLX9R3qiHboqRLC3bDXABk5aBRN
   KGAPk3qiiQmVE/e+bzSj87yP6d0IQlbbGQODkMpd/mzFK5XmmJIOnEVR0
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10235"; a="270279395"
X-IronPort-AV: E=Sophos;i="5.88,308,1635231600"; 
   d="scan'208";a="270279395"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2022 12:16:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,308,1635231600"; 
   d="scan'208";a="616845117"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Jan 2022 12:16:03 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nBMnq-000GjK-Br; Sat, 22 Jan 2022 20:16:02 +0000
Date: Sun, 23 Jan 2022 04:15:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [cxl:preview 45/53] drivers/cxl/core/port.c:853:26: error: use of
 undeclared identifier 'CXL_REGLOC_RBI_COMPONENT'
Message-ID: <202201230041.j2B2ds4Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   e675fabdbbcdb6e32dba688a20fb0bd42e0e2d5d
commit: bdcd1df24905ea3d8196ef7e62b077b136d18ab1 [45/53] cxl/core/port: Add switch port enumeration
config: mips-randconfig-c004-20220120 (https://download.01.org/0day-ci/archive/20220123/202201230041.j2B2ds4Z-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commit/?id=bdcd1df24905ea3d8196ef7e62b077b136d18ab1
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
        git fetch --no-tags cxl preview
        git checkout bdcd1df24905ea3d8196ef7e62b077b136d18ab1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/cxl/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/cxl/core/port.c:853:26: error: use of undeclared identifier 'CXL_REGLOC_RBI_COMPONENT'
           cxl_find_regblock(pdev, CXL_REGLOC_RBI_COMPONENT, &map);
                                   ^
>> drivers/cxl/core/port.c:854:9: error: implicit declaration of function 'cxl_regmap_to_base' [-Werror,-Wimplicit-function-declaration]
           return cxl_regmap_to_base(pdev, &map);
                  ^
   drivers/cxl/core/port.c:998:18: warning: no previous prototype for function 'cxl_mem_find_port' [-Wmissing-prototypes]
   struct cxl_port *cxl_mem_find_port(struct cxl_memdev *cxlmd)
                    ^
   drivers/cxl/core/port.c:998:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct cxl_port *cxl_mem_find_port(struct cxl_memdev *cxlmd)
   ^
   static 
   1 warning and 2 errors generated.


vim +/CXL_REGLOC_RBI_COMPONENT +853 drivers/cxl/core/port.c

   838	
   839	static resource_size_t find_component_registers(struct device *dev)
   840	{
   841		struct cxl_register_map map;
   842		struct pci_dev *pdev;
   843	
   844		/*
   845		 * Theoretically, CXL component registers can be hosted on a
   846		 * non-PCI device, in practice, only cxl_test hits this case.
   847		 */
   848		if (!dev_is_pci(dev))
   849			return CXL_RESOURCE_NONE;
   850	
   851		pdev = to_pci_dev(dev);
   852	
 > 853		cxl_find_regblock(pdev, CXL_REGLOC_RBI_COMPONENT, &map);
 > 854		return cxl_regmap_to_base(pdev, &map);
   855	}
   856	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
