Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7897EA6
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 20:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651179076; x=1682715076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kg1jfSL7N0RPdEHLoFJYHHn8nSoOnJ1Ovm0Qzi1wzKA=;
  b=QZdMmBDrIW2FN+p3JlI1PHEj7VUhYCfNKx0HvH/HSP6EC1uCPQjHIFnR
   UJ5g4NY/j7L988IaLdmoMfxMgkpQwTwVa38n/MGoX/g9//JNzIpHl8IVk
   ClH7ErhcUzXk3MYAg2QxSEq2v2347Eo+HhivZPwn1NclnSDvyenT1+brv
   K53kHDjoSfjs8iWgNKpczhpA3agBATWkc+hPBIyyvgzJUmHKOum3VkTqE
   +rIb4eDLuY65N/0lsa5q4goScbheXEov8I8bbrvHfzTTVfpF92MGJiE1S
   uM22DjHd2cMT77BoAO8eSwD4ZqGaHMUtFj8004tq3FW49sjbIfulMOCZM
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="246334015"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="246334015"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 13:51:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="683249386"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Apr 2022 13:51:14 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nkB6X-0005gx-KU;
	Thu, 28 Apr 2022 20:51:13 +0000
Date: Fri, 29 Apr 2022 04:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:pxa-multiplatform-5.18 48/49] arch/arm/mm/ioremap.c:461:6:
 error: redefinition of 'pci_ioremap_set_mem_type'
Message-ID: <202204290421.uTDRBzzm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git pxa-multiplatform-5.18
head:   bafe674c95e7e72094bdbeab22affaf87976929e
commit: 0150d5b2b3fb588a1f95dd12452c0fc4a8ea03fc [48/49] ARM: pxa/sa1100: move I/O space to PCI_IOBASE
config: arm-omap1_defconfig (https://download.01.org/0day-ci/archive/20220429/202204290421.uTDRBzzm-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473aacce38cd7dd77eebceaf3c98c5707ab3b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=0150d5b2b3fb588a1f95dd12452c0fc4a8ea03fc
        git remote add soc https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
        git fetch --no-tags soc pxa-multiplatform-5.18
        git checkout 0150d5b2b3fb588a1f95dd12452c0fc4a8ea03fc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm/mm/ioremap.c:461:6: error: redefinition of 'pci_ioremap_set_mem_type'
   void pci_ioremap_set_mem_type(int mem_type)
        ^
   arch/arm/include/asm/io.h:180:20: note: previous definition is here
   static inline void pci_ioremap_set_mem_type(int mem_type) {}
                      ^
   1 error generated.


vim +/pci_ioremap_set_mem_type +461 arch/arm/mm/ioremap.c

1c8c3cf0b523938 Thomas Petazzoni 2014-05-19  460  
1c8c3cf0b523938 Thomas Petazzoni 2014-05-19 @461  void pci_ioremap_set_mem_type(int mem_type)
1c8c3cf0b523938 Thomas Petazzoni 2014-05-19  462  {
1c8c3cf0b523938 Thomas Petazzoni 2014-05-19  463  	pci_ioremap_mem_type = mem_type;
1c8c3cf0b523938 Thomas Petazzoni 2014-05-19  464  }
1c8c3cf0b523938 Thomas Petazzoni 2014-05-19  465  

:::::: The code at line 461 was first introduced by commit
:::::: 1c8c3cf0b5239388e712508a85821f4718f4d889 ARM: 8060/1: mm: allow sub-architectures to override PCI I/O memory type

:::::: TO: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
