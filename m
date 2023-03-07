Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D39BA4F;
	Tue,  7 Mar 2023 19:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678215751; x=1709751751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R4Aswtna7Q6k4KcdpQ681CgnEtG6Wk89kjUpElYelUY=;
  b=El1+QmR/FXf8a7D8OPUhGgUNXfm/1N+ia7tYWPXp58cixGLdpUByYVTj
   HnAzSRrFeEyXPIfOscYGpRFyP+faIjki48zGZ2rGDxEt+PGPNFJXtTTt7
   Nm9ki0yh7DbLjSmKtsy6ySwqIammbirO/4bWKJCCGyVLUdJ7xCdTDf8cL
   SVET2wj5b8sWC73L/XK3k5Ox2gyFSArwnP4BD4y0PgUzGfaa2d7dREOHR
   9ebnEBYc9envwp1N05I4gUdK/wfROPMEmynTQrpljLgYCLqJ9Dza8um58
   rNiib6crfLHsaJ7MQlJQof4II7EtNjo21H0fz2AZ2pDqOyOpfOGxP7OxR
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="400767732"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="400767732"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 11:02:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676663268"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="676663268"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Mar 2023 11:02:16 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZcZj-0001XL-31;
	Tue, 07 Mar 2023 19:02:15 +0000
Date: Wed, 8 Mar 2023 03:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 488/639] drivers/pci/endpoint/functions/pci-epf-vntb.c:1432:20: error:
 incompatible function pointer types initializing 'int (*)(struct pci_epf *,
 const struct pci_epf_device_id *)' with an expression of type 'int (struct
 pci_epf *)'
Message-ID: <202303080252.b23GA3FL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
head:   bc291a97d070700f8a5b4504fe3de4c2cea6a888
commit: 0a5791cface5a07c793b0192cbcc3e685f2e65a7 [488/639] PCI: endpoint: Pass EPF device ID to the probe function
config: i386-randconfig-a012-20230306 (https://download.01.org/0day-ci/archive/20230308/202303080252.b23GA3FL-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/0a5791cface5a07c793b0192cbcc3e685f2e65a7
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
        git checkout 0a5791cface5a07c793b0192cbcc3e685f2e65a7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/pci/endpoint/functions/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080252.b23GA3FL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/endpoint/functions/pci-epf-vntb.c:1432:20: error: incompatible function pointer types initializing 'int (*)(struct pci_epf *, const struct pci_epf_device_id *)' with an expression of type 'int (struct pci_epf *)' [-Werror,-Wincompatible-function-pointer-types]
           .probe          = epf_ntb_probe,
                             ^~~~~~~~~~~~~
   1 error generated.


vim +1432 drivers/pci/endpoint/functions/pci-epf-vntb.c

e35f56bb03304a Frank Li 2022-02-22  1429  
e35f56bb03304a Frank Li 2022-02-22  1430  static struct pci_epf_driver epf_ntb_driver = {
e35f56bb03304a Frank Li 2022-02-22  1431  	.driver.name    = "pci_epf_vntb",
e35f56bb03304a Frank Li 2022-02-22 @1432  	.probe          = epf_ntb_probe,
e35f56bb03304a Frank Li 2022-02-22  1433  	.id_table       = epf_ntb_ids,
e35f56bb03304a Frank Li 2022-02-22  1434  	.ops            = &epf_ntb_ops,
e35f56bb03304a Frank Li 2022-02-22  1435  	.owner          = THIS_MODULE,
e35f56bb03304a Frank Li 2022-02-22  1436  };
e35f56bb03304a Frank Li 2022-02-22  1437  

:::::: The code at line 1432 was first introduced by commit
:::::: e35f56bb03304abc92c928b641af41ca372966bb PCI: endpoint: Support NTB transfer between RC and EP

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Jon Mason <jdmason@kudzu.us>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
