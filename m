Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA236185F;
	Fri,  5 May 2023 09:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683279012; x=1714815012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8brSWXmEO2/CuC9//F2jJ3+RVBMifoKAFI07N4K23Qg=;
  b=RhM+8oq7af9hJyK92mEoVr/18xoQ/M6uODqxxa9/i0FDducetdNr7skw
   f2O7H3PEsH/99DwCsp3E3EOe31sWhrkthXVAkYE1vq0NiLXqvXJMTnIwv
   djO/wVlDJHb33wTtr13oVA2vIkUYKRPblBmd5p2I4J581vfLgurBSz3BA
   ZxDavNHROxDTpQA47fx+ioX5q5ZB0cZssCMcUdcu5+A1sIZ3X+5giyfiG
   WlwEFvHYaTNVjZRZSdhXuHoE7QrOo0XV8N8EBepB6oeO6P6TCoGQRO9Jg
   Br6eBLkxSb/cN6xCw/pslndxHzBLsW2Mo6uABd4yUnelfNjCgg4gBDqqX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="352211666"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="352211666"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 02:30:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="809150181"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="809150181"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 May 2023 02:30:10 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1purlS-0000Sp-0w;
	Fri, 05 May 2023 09:30:10 +0000
Date: Fri, 5 May 2023 17:29:59 +0800
From: kernel test robot <lkp@intel.com>
To: Faycal Benmlih <faycal.benmlih@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mchinth:socwatch_linux_6_3 41/91]
 drivers/platform/x86/socwatch/sw_pci.c:64:6: warning: no previous prototype
 for function 'sw_print_pci_devices_i'
Message-ID: <202305051725.10lP5z3V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Faycal,

FYI, the error/warning still remains.

tree:   https://github.com/mchinth/linux socwatch_linux_6_3
head:   db51827dc3d8fd27fd6312b14811fa2e0c4abe87
commit: cd0ae8e45c3cc66d1cfb9bfc5046d6a1e9b04d19 [41/91] SEP/SOCWATCH Update SoCWatch driver after rebasing to linux v5.7
config: i386-randconfig-a011-20230501 (https://download.01.org/0day-ci/archive/20230505/202305051725.10lP5z3V-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/mchinth/linux/commit/cd0ae8e45c3cc66d1cfb9bfc5046d6a1e9b04d19
        git remote add mchinth https://github.com/mchinth/linux
        git fetch --no-tags mchinth socwatch_linux_6_3
        git checkout cd0ae8e45c3cc66d1cfb9bfc5046d6a1e9b04d19
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/sepdk/pax/ drivers/platform/x86/socwatch/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305051725.10lP5z3V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/socwatch/sw_pci.c:64:6: warning: no previous prototype for function 'sw_print_pci_devices_i' [-Wmissing-prototypes]
   void sw_print_pci_devices_i(void) {
        ^
   drivers/platform/x86/socwatch/sw_pci.c:64:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sw_print_pci_devices_i(void) {
   ^
   static 
   1 warning generated.


vim +/sw_print_pci_devices_i +64 drivers/platform/x86/socwatch/sw_pci.c

    63	
  > 64	void sw_print_pci_devices_i(void) {
    65		int i = 0;
    66	
    67		for(i = 0; i < s_pci_dev_list.num_entries; ++i) {
    68			pw_pr_debug("bus: %x, dev: %x, func: %x, vendor: %x, device: %x, class: %x, header: %x\n",
    69					s_pci_dev_list.info[i].bus, s_pci_dev_list.info[i].device, s_pci_dev_list.info[i].function,
    70					s_pci_dev_list.info[i].vendorID, s_pci_dev_list.info[i].deviceID, s_pci_dev_list.info[i].classID,
    71					s_pci_dev_list.info[i].headerType);
    72		}
    73	}
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
