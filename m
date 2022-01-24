Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE6B173
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 10:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643018423; x=1674554423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I9ASTMkJBZh1dnZeeM7ClIkGGamrhZ4TzmARTN6rzk4=;
  b=P1lAV00c31r4jGkTNDYQN1j5NhCDbHWoyU47I0ygsjJSEmUbYKxao4A9
   RqoZptq4/RUxdqv1/VxOf+4MZyQu7WWLCpmmvXpX0HPnukZAYvHRGjDz8
   qTS2d2d4mrXzXHPkYU+uIkbcNhdeWgcpiI+y1/zBhnNlfK0d3ptR4eNeX
   5O8ivKRfY3W11H+iUSbzbR3htiBDFU97mKBrYWhj9XjW9gOToClrNMwI8
   ShpmI5IKn6uklLY0yLpusi3m4vHRUdV0MiseyC8B7/95fGj6Ymje0U9W3
   cT1L/HyGK1Y25+7Cs3gJBR+ct9GisiSPDNqOdHvhlYxdrSz+hO6Burca7
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="245956145"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="245956145"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 01:59:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="695369016"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Jan 2022 01:59:29 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nBw8G-000I9K-R5; Mon, 24 Jan 2022 09:59:28 +0000
Date: Mon, 24 Jan 2022 17:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: drivers/pci/controller/pcie-mt7621.c:549:34: warning: unused
 variable 'mt7621_pcie_ids'
Message-ID: <202201241754.igtHzgHv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: 87c71931633bd15e9cfd51d4a4d9cd685e8cdb55 Merge branch 'pci/driver-cleanup'
date:   11 days ago
config: mips-randconfig-r031-20220124 (https://download.01.org/0day-ci/archive/20220124/202201241754.igtHzgHv-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=87c71931633bd15e9cfd51d4a4d9cd685e8cdb55
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 87c71931633bd15e9cfd51d4a4d9cd685e8cdb55
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/pci/controller/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/pci/controller/pcie-mt7621.c:112:20: warning: unused function 'pcie_rmw' [-Wunused-function]
   static inline void pcie_rmw(struct mt7621_pcie *pcie, u32 reg, u32 clr, u32 set)
                      ^
>> drivers/pci/controller/pcie-mt7621.c:549:34: warning: unused variable 'mt7621_pcie_ids' [-Wunused-const-variable]
   static const struct of_device_id mt7621_pcie_ids[] = {
                                    ^
   2 warnings generated.


vim +/mt7621_pcie_ids +549 drivers/pci/controller/pcie-mt7621.c

03f152e31f4ae89 drivers/staging/mt7621-pci/pci-mt7621.c John Crispin  2018-03-15  548  
4793895f597d42e drivers/pci/controller/pcie-mt7621.c    Bjorn Helgaas 2021-12-22 @549  static const struct of_device_id mt7621_pcie_ids[] = {
03f152e31f4ae89 drivers/staging/mt7621-pci/pci-mt7621.c John Crispin  2018-03-15  550  	{ .compatible = "mediatek,mt7621-pci" },
03f152e31f4ae89 drivers/staging/mt7621-pci/pci-mt7621.c John Crispin  2018-03-15  551  	{},
03f152e31f4ae89 drivers/staging/mt7621-pci/pci-mt7621.c John Crispin  2018-03-15  552  };
4793895f597d42e drivers/pci/controller/pcie-mt7621.c    Bjorn Helgaas 2021-12-22  553  MODULE_DEVICE_TABLE(of, mt7621_pcie_ids);
03f152e31f4ae89 drivers/staging/mt7621-pci/pci-mt7621.c John Crispin  2018-03-15  554  

:::::: The code at line 549 was first introduced by commit
:::::: 4793895f597d42eb54a0f54711b61263b6a8dd03 PCI: mt7621: Rename mt7621_pci_ to mt7621_pcie_

:::::: TO: Bjorn Helgaas <bhelgaas@google.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
