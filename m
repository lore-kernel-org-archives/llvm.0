Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14347E
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 10:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650883097; x=1682419097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZmOvpfhratRIkwuw8D+s35C96Xsu5QDil0qdt+ZdK3U=;
  b=KLLfQvPCb0HsoJ1Sfd610pQJlaN3IWCBMonpwiw5c1vWydt2IZDGss3s
   SuZ+bXKjUyi4imKP4CVjvjTZ5z/8UimBWXZu8Hhe9z+07LQQJ8gbcISWD
   TNbF9byOpUsleDrl+LQU3kvsZQYv9EMWbsBDaOe5gReZTLByBgRj1xzTE
   YC/SaLb1PlKduqtkXI1TCPLf73PsDyi9FmwSv2aKacM6d9ZQ3YWbvRZUS
   F46v3+P3DPxWQQ26weLcGrpgubbqhb0WGigJOH9qP9tiKWv0KWRQrykf9
   zKEtS+5v3UMacgFffjxmOIp/Fa+7u3N8SI83df+k/ytAk+ZNYfEjRiav2
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="264728511"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="264728511"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 03:38:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="627996501"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 25 Apr 2022 03:38:15 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1niw6g-0002L8-N0;
	Mon, 25 Apr 2022 10:38:14 +0000
Date: Mon, 25 Apr 2022 18:37:28 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
	Robert Richter <rric@kernel.org>
Subject: drivers/pci/controller/pci-xgene.c:626:34: warning: unused variable
 'xgene_pcie_match_table'
Message-ID: <202204251857.XKGp0wbV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af2d861d4cd2a4da5137f795ee3509e6f944a25b
commit: 6e5a1fff9096ecd259dedcbbdc812aa90986a40e PCI: Avoid building empty drivers
date:   1 year, 1 month ago
config: x86_64-buildonly-randconfig-r006-20220425 (https://download.01.org/0day-ci/archive/20220425/202204251857.XKGp0wbV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6e5a1fff9096ecd259dedcbbdc812aa90986a40e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6e5a1fff9096ecd259dedcbbdc812aa90986a40e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/pci/controller/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/pci-xgene.c:626:34: warning: unused variable 'xgene_pcie_match_table' [-Wunused-const-variable]
   static const struct of_device_id xgene_pcie_match_table[] = {
                                    ^
   1 warning generated.


vim +/xgene_pcie_match_table +626 drivers/pci/controller/pci-xgene.c

5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c Tanmay Inamdar 2014-10-01  625  
5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c Tanmay Inamdar 2014-10-01 @626  static const struct of_device_id xgene_pcie_match_table[] = {
5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c Tanmay Inamdar 2014-10-01  627  	{.compatible = "apm,xgene-pcie",},
5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c Tanmay Inamdar 2014-10-01  628  	{},
5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c Tanmay Inamdar 2014-10-01  629  };
5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c Tanmay Inamdar 2014-10-01  630  

:::::: The code at line 626 was first introduced by commit
:::::: 5f6b6ccdbe1cdfa5aa4347ec5412509b8995db27 PCI: xgene: Add APM X-Gene PCIe driver

:::::: TO: Tanmay Inamdar <tinamdar@apm.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
