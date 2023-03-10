Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F0C2F49;
	Fri, 10 Mar 2023 11:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678447577; x=1709983577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8gWzasV8zIqbV4uzJ5YZgYmSmOknznmzxM/HCFMyDKc=;
  b=anAn+rHAtfsvQv4UxOHjVQI0VUYTD+GltZAUDtIrKiouSRJxVFGV+2U6
   h5iDP6Birx/AdDzQNAicBuTyZlAL/tLfaIlU4LtyUqwZRng2x7c5oXNmI
   JPwZyGYM8SkOqGaj9jFIrcgcxynumcscuST92S8FhixFziTYApj4NzNFA
   PE1O3r4R3QC9crVfNX95jxS5wBo1tcWTxUQbsw9otaw/Qkjz5cMvbfrLG
   G2RBq1YTKFLrG63kFwM1ipnOZKy7kJF/5Tgt+GBluemhwNxHi9PAzsbbw
   N7pEkNWYiFFhTHQitNUrGnO+WWbcdjEgYcceFVYWMRK3Q0kgT3CRErJ1X
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="338261429"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="338261429"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 03:26:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="627778986"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="627778986"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Mar 2023 03:26:15 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paat5-0003nL-0e;
	Fri, 10 Mar 2023 11:26:15 +0000
Date: Fri, 10 Mar 2023 19:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Faycal Benmlih <faycal.benmlih@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mchinth:socwatch_linux_6_3 41/89]
 drivers/platform/x86/socwatch/sw_pci.c:64:6: warning: no previous prototype
 for function 'sw_print_pci_devices_i'
Message-ID: <202303101924.rF3D9XvD-lkp@intel.com>
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
head:   2bbe949bea3cbc139c5dd26decd5023b84779d86
commit: cd0ae8e45c3cc66d1cfb9bfc5046d6a1e9b04d19 [41/89] SEP/SOCWATCH Update SoCWatch driver after rebasing to linux v5.7
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230310/202303101924.rF3D9XvD-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/x86/sepdk/pax/ drivers/platform/x86/socwatch/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101924.rF3D9XvD-lkp@intel.com/

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
