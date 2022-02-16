Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727191B69
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 04:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644986426; x=1676522426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f9nny1FjAVESb1bhZWB+zYKFO3ktt8MPMbm+cj2MSrA=;
  b=GW2BVXWMCvpo9WPfMB+8M6goDC693yWrg0fykkUQlqRs37PWErIxtVvP
   8xYFDTRQ5mOaPbJBs0gTadJH3uoPKJLy2B1C6bwHTG0moGkxMnrN3Gqa6
   iECOvXe4xD9Q5MXqHHWPTptZrd4VNF6x862QX2gcCMY4Ri5wqfbUdCboi
   TNkQn9JXiUWOIwD6IRF7dq2dvKYTEEiEH6d/MPkbQUjWgi/qkhIa2fKE5
   Lm6/hDSEP7On7G6/L+eaR+qPMPleZRqdQcEXGTJyF2jiSgiJPOnj1gZvF
   BCTMPh7O4k7z/QFwNN0WObRiro1vyTcW1SMfAWvXqOH5TiKOiqJul9pG6
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="230486563"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="230486563"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 20:40:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="498189992"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 15 Feb 2022 20:40:24 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKC75-000APW-JR; Wed, 16 Feb 2022 04:40:23 +0000
Date: Wed, 16 Feb 2022 12:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Huckleberry <nhuck@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>
Subject: [ebiggers:crypto-pending 7/7]
 arch/arm64/crypto/polyval-ce-glue.c:355:33: warning: unused variable
 'polyval_cpu_feature'
Message-ID: <202202161205.0mACsVya-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crypto-pending
head:   67824d3cb5325de4264ad344174a7e4ea69e5303
commit: 67824d3cb5325de4264ad344174a7e4ea69e5303 [7/7] crypto: arm64/polyval: Add PMULL accelerated implementation of POLYVAL
config: arm64-randconfig-r033-20220216 (https://download.01.org/0day-ci/archive/20220216/202202161205.0mACsVya-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/commit/?id=67824d3cb5325de4264ad344174a7e4ea69e5303
        git remote add ebiggers https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
        git fetch --no-tags ebiggers crypto-pending
        git checkout 67824d3cb5325de4264ad344174a7e4ea69e5303
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/crypto/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/crypto/polyval-ce-glue.c:355:33: warning: unused variable 'polyval_cpu_feature' [-Wunused-const-variable]
   static const struct cpu_feature polyval_cpu_feature[] = {
                                   ^
   1 warning generated.


vim +/polyval_cpu_feature +355 arch/arm64/crypto/polyval-ce-glue.c

   354	
 > 355	static const struct cpu_feature polyval_cpu_feature[] = {
   356		{ cpu_feature(PMULL) }, { }
   357	};
   358	MODULE_DEVICE_TABLE(cpu, polyval_cpu_feature);
   359	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
