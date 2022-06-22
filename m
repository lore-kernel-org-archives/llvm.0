Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0909136F
	for <llvm@lists.linux.dev>; Wed, 22 Jun 2022 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655893068; x=1687429068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ib7Jxvpxhyto6qxZuzBuKdNUpPcqFiHeFBVLswbBh84=;
  b=nKGSFMC+yYGjuK4DtcPHnOU5arza9QYJsfui76TMdpzQK8r5lP3dS+P8
   7FY9UcOBZ36sgDaaBcOxxTBtGO6YZOLAoR44+MpLj6iRITcVO6cjbDzob
   /xooo4fe1UjO9CfjPmPLEDWzpJboxvRi/Y2V6y9mVicfJywcU5O7CW+NE
   /Cz+S/HjZanxbfd1dy3joZxtD8RZcLPi3gqd+R7iQFtcsRQJIxCgiODtm
   te00ZGtlqr+lvY1ssXHOlJ5XEpMFHFA01J/L042wdGytqL/6CIcMY/YT+
   zefnCaeLcC5qoZHxM3Q909rlPg7ii/s3WTKM5SkJR3BGAzksQubW3R8JG
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="342062744"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="342062744"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 03:17:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="644120768"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 22 Jun 2022 03:17:42 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3xQc-00017w-2I;
	Wed, 22 Jun 2022 10:17:42 +0000
Date: Wed, 22 Jun 2022 18:17:38 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jon Mason <jdmason@kudzu.us>
Subject: [linux-next:master 3913/4996]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:975:5: warning: no previous
 prototype for function 'pci_read'
Message-ID: <202206221813.Dn1s6uuh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ac0ba5454ca85162c08dc429fef1999e077ca976
commit: ff32fac00d97661c715ee47bbfd867cae1f3aaf8 [3913/4996] NTB: EPF: support NTB transfer between PCI RC and EP connection
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20220622/202206221813.Dn1s6uuh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ff32fac00d97661c715ee47bbfd867cae1f3aaf8
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ff32fac00d97661c715ee47bbfd867cae1f3aaf8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/ drivers/pci/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pci/endpoint/functions/pci-epf-vntb.c:975:5: warning: no previous prototype for function 'pci_read' [-Wmissing-prototypes]
   int pci_read(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val)
       ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:975:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pci_read(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val)
   ^
   static 
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:984:5: warning: no previous prototype for function 'pci_write' [-Wmissing-prototypes]
   int pci_write(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val)
       ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:984:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pci_write(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val)
   ^
   static 
   2 warnings generated.


vim +/pci_read +975 drivers/pci/endpoint/functions/pci-epf-vntb.c

   974	
 > 975	int pci_read(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val)
   976	{
   977		if (devfn == 0) {
   978			memcpy(val, ((uint8_t *)pci_space) + where, size);
   979			return 0;
   980		}
   981		return -1;
   982	}
   983	
 > 984	int pci_write(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val)
   985	{
   986		return 0;
   987	}
   988	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
