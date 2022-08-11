Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBC020E2
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 02:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660184958; x=1691720958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+1ZHUJn3r8AxLUw3lFtmofHK3d9eH8VFo7SW/Syu/kM=;
  b=WhhCpHOcFjUgi+yXKCoBMObqIO+XoDT2CqP4eH/xwxwc9KTCB/RUPi6P
   UGj3OK4UJ/Eq9Ohp2HjrYoT2jVVdFpu0oWloJohlYe94cSUzpXxINDeTX
   ujHPBNA5/6wvwiz/rtSe/ZVadtzOBtpHk6VSh0eQEDSGLjQHlmYx/ZYcL
   waMBKl75+GQKc5szzfBJyIhtgyLxmCgOLAA6lLFYd7OudJN3QgkBOIjhf
   dAlKl9Dliq4DxzKdqiACmWiax8NbXqJue3fgBgdgzFzTtU+LzAiTzFGSq
   warcHF3ph5iOPvGwcJRJlE+tw7uuz5bbRHHdBDS5NhnZQbDZ94JKB6Qwk
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="317199022"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="317199022"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2022 19:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="634029438"
Received: from lkp-server02.sh.intel.com (HELO 5d6b42aa80b8) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Aug 2022 19:29:16 -0700
Received: from kbuild by 5d6b42aa80b8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLxwi-0000zW-0F;
	Thu, 11 Aug 2022 02:29:16 +0000
Date: Thu, 11 Aug 2022 10:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jon Mason <jdmason@kudzu.us>
Subject: [linux-next:master 14719/14849] ld.lld: error: undefined symbol:
 pci_msi_mask_irq
Message-ID: <202208111047.pzfyP3K2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc6c6584ffb27b62e19ea89553b22b4cad1abaca
commit: 893ae515ff8d97334dd02b21e4af1d4b1ca86854 [14719/14849] irqchip: imx mu worked as msi controller
config: arm64-randconfig-r004-20220810 (https://download.01.org/0day-ci/archive/20220811/202208111047.pzfyP3K2-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=893ae515ff8d97334dd02b21e4af1d4b1ca86854
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 893ae515ff8d97334dd02b21e4af1d4b1ca86854
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: pci_msi_mask_irq
   >>> referenced by irq-imx-mu-msi.c
   >>>               irqchip/irq-imx-mu-msi.o:(imx_mu_msi_mask_irq) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: pci_msi_unmask_irq
   >>> referenced by irq-imx-mu-msi.c
   >>>               irqchip/irq-imx-mu-msi.o:(imx_mu_msi_unmask_irq) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
