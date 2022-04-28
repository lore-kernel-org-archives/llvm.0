Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07931138F
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 21:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651181545; x=1682717545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fg1A9llVWiUR2nEY+gn8sF5TyyiYjI6x2TTU9jDYCyE=;
  b=nTsn1LHquqQpp+sGMSxXnbSiBkSTzoFtbFnbTGYgBoFkpfrtrtXnboCx
   O9BIxGogqtPm945b4eu9AvAqcpNSmmGXAqqrAEswLNSNHb+c+FKMPV+y7
   rOOQWANhy9ucEhVcyn6jIHdhg29xVYlRiVUSjJUVZW8BHXPRTgBN/ojsm
   RwW8QO+t/HFUbiGOlPwNqk9bSxofCxc15VlOX7QmKf7bxXWVew76/F0+w
   +BJ39eNKaMPv80NJcTFeszPpPLGLBS6B8urkdxO+hdr+Ss4L2a+hB8RxS
   j+XCUaUNF5zBu5UgPcPO0lt4YNfd3W8gG3O4DIx0GgS7q0Ffk5ccIbPHr
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="248361269"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="248361269"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 14:32:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="514486858"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Apr 2022 14:32:22 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nkBkL-0005iF-IH;
	Thu, 28 Apr 2022 21:32:21 +0000
Date: Fri, 29 Apr 2022 05:32:02 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:pxa-multiplatform-5.18 48/49]
 drivers/pcmcia/soc_common.c:786:2: error: call to undeclared function
 'pci_unmap_iospace'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202204290508.8lPpo1c3-lkp@intel.com>
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
config: arm-collie_defconfig (https://download.01.org/0day-ci/archive/20220429/202204290508.8lPpo1c3-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/pcmcia/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pcmcia/soc_common.c:786:2: error: call to undeclared function 'pci_unmap_iospace'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pci_unmap_iospace(&skt->res_io_io);
           ^
   drivers/pcmcia/soc_common.c:786:2: note: did you mean 'pci_remap_iospace'?
   arch/arm/include/asm/io.h:186:5: note: 'pci_remap_iospace' declared here
   int pci_remap_iospace(const struct resource *res, phys_addr_t phys_addr);
       ^
   arch/arm/include/asm/io.h:185:27: note: expanded from macro 'pci_remap_iospace'
   #define pci_remap_iospace pci_remap_iospace
                             ^
   drivers/pcmcia/soc_common.c:875:2: error: call to undeclared function 'pci_unmap_iospace'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pci_unmap_iospace(&skt->res_io_io);
           ^
   2 errors generated.


vim +/pci_unmap_iospace +786 drivers/pcmcia/soc_common.c

   780	
   781		soc_pcmcia_hw_shutdown(skt);
   782	
   783		/* should not be required; violates some lowlevel drivers */
   784		soc_common_pcmcia_config_skt(skt, &dead_socket);
   785	
 > 786		pci_unmap_iospace(&skt->res_io_io);
   787		release_resource(&skt->res_attr);
   788		release_resource(&skt->res_mem);
   789		release_resource(&skt->res_io);
   790		release_resource(&skt->res_skt);
   791	}
   792	EXPORT_SYMBOL(soc_pcmcia_remove_one);
   793	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
