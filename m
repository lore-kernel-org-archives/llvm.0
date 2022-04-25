Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5E27E
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 11:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650884975; x=1682420975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aVfklPl8F97C3QlZfb1wntXnrbpkkWL2ySVlme3e6Wk=;
  b=AdEk+54ahpY5JlaNcM1b8FS1GyF6q6fG+Ap6H8Vwm5hMchi9Stc91zuU
   lIe7b4YbUlqtHDA6guLWgR9e2at7QDKHUK4sQCpB4pYQtQVp/2qhoNOTE
   fjuVV+HySa7YBIMrkZPDn7U4Rd7HutZLtY5VwyGH3IaW9j40niiKrzJHf
   8zlf+kPiBcZQPL4zkjzUJbAFyf1LFjuXR99h2I31rkDop14gGdRpiszmu
   JqslJWr6ZfL54NCoz2/gOkraqel7p7FhnF47tx5yLOq8WhBF7S/OFNrIw
   rniGjSfP6d98s6KB2IIOLeV61EeSCTdQ2Z4MvbH9FxnaNSEiBGBv0qjP+
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="265018344"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="265018344"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 04:09:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="595193811"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Apr 2022 04:09:34 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1niwaz-0002RM-9J;
	Mon, 25 Apr 2022 11:09:33 +0000
Date: Mon, 25 Apr 2022 19:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
Subject: [rppt:fixes/arm-ioremap-pfn-valid-v2 1/1] ld.lld: error: undefined
 symbol: arch_memremap_can_ram_remap
Message-ID: <202204251950.LxDogI1Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git fixes/arm-ioremap-pfn-valid-v2
head:   7c4b7785fd9fb0564245417bbca100f3e88e48a9
commit: 7c4b7785fd9fb0564245417bbca100f3e88e48a9 [1/1] arm[64]/memremap: don't abuse pfn_valid() to ensure presence of linear map
config: arm-buildonly-randconfig-r006-20220425 (https://download.01.org/0day-ci/archive/20220425/202204251950.LxDogI1Q-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=7c4b7785fd9fb0564245417bbca100f3e88e48a9
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt fixes/arm-ioremap-pfn-valid-v2
        git checkout 7c4b7785fd9fb0564245417bbca100f3e88e48a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: arch_memremap_can_ram_remap
   >>> referenced by iomem.c
   >>>               iomem.o:(memremap) in archive kernel/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
