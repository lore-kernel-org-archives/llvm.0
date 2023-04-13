Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591DD2C9C;
	Thu, 13 Apr 2023 19:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681412822; x=1712948822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nFbEfl46q2WfU7iMn+ZXgXrVQiGtvKXygzTc5PfkNCk=;
  b=cowVbOL2IMpGbA68CxZ5Wbg0qv1jga+NMmd5H9xzJLbbEMgiomYq7Ly3
   l7QNsD1NINp6bZ/LO4uF0dJJluJRZq09YlyBbFD0GtKFg7hXLPQK3EuDG
   +wwEKaJDnNsVi79tDIbt+CMRyTmp0bINLvRCVcfHWAhKGZH3VOqXjfaZZ
   j2PPWUdkL0rBJQ7a4vt/YznTSoUI4hLyfABI/ZOsxojhZA7ZrDcLQ2N8P
   YCM2HyDK6Uoy+SouFuUT5TmYvE38hMxsQySxTUcKXV8Mhzquc4JHu07na
   h84w1k/HmREyPzno8KwWaoKY0zYwKeg9Ql4N1iNFy6ImlImXrL6wAqBuE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="344274910"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="344274910"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 12:07:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="719998061"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="719998061"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Apr 2023 12:07:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn2Hc-000YtZ-0N;
	Thu, 13 Apr 2023 19:07:00 +0000
Date: Fri, 14 Apr 2023 03:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt-temp-working
 180/324] drivers/pci/endpoint/functions/pci-epf-vntb.c:1433:20: error:
 incompatible function pointer types initializing 'int (*)(struct pci_epf *,
 const struct pci_epf_device_id *)' with an expression of type 'int (struct
 pci_epf *)'
Message-ID: <202304140303.DFN6LJq7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt-temp-working
head:   6d3957bec671279b13cba72c95513c24b9a082b6
commit: 0fa9f824f15c11f77209b124d12f2885da7310db [180/324] PCI: endpoint: Pass EPF device ID to the probe function
config: x86_64-randconfig-a002-20230410 (https://download.01.org/0day-ci/archive/20230414/202304140303.DFN6LJq7-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/0fa9f824f15c11f77209b124d12f2885da7310db
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt-temp-working
        git checkout 0fa9f824f15c11f77209b124d12f2885da7310db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140303.DFN6LJq7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/endpoint/functions/pci-epf-vntb.c:1433:20: error: incompatible function pointer types initializing 'int (*)(struct pci_epf *, const struct pci_epf_device_id *)' with an expression of type 'int (struct pci_epf *)' [-Werror,-Wincompatible-function-pointer-types]
           .probe          = epf_ntb_probe,
                             ^~~~~~~~~~~~~
   1 error generated.


vim +1433 drivers/pci/endpoint/functions/pci-epf-vntb.c

e35f56bb03304a Frank Li 2022-02-22  1430  
e35f56bb03304a Frank Li 2022-02-22  1431  static struct pci_epf_driver epf_ntb_driver = {
e35f56bb03304a Frank Li 2022-02-22  1432  	.driver.name    = "pci_epf_vntb",
e35f56bb03304a Frank Li 2022-02-22 @1433  	.probe          = epf_ntb_probe,
e35f56bb03304a Frank Li 2022-02-22  1434  	.id_table       = epf_ntb_ids,
e35f56bb03304a Frank Li 2022-02-22  1435  	.ops            = &epf_ntb_ops,
e35f56bb03304a Frank Li 2022-02-22  1436  	.owner          = THIS_MODULE,
e35f56bb03304a Frank Li 2022-02-22  1437  };
e35f56bb03304a Frank Li 2022-02-22  1438  

:::::: The code at line 1433 was first introduced by commit
:::::: e35f56bb03304abc92c928b641af41ca372966bb PCI: endpoint: Support NTB transfer between RC and EP

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Jon Mason <jdmason@kudzu.us>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
