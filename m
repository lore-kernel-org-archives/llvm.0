Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91015A945;
	Thu,  8 Jun 2023 09:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686218281; x=1717754281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ztXZEFwxcxQubvmV/lljE2Dc939p0dz324TayOxx/kg=;
  b=d5PaMYgYjuU066Nxn011rYg2jU1bBsQ05lNDw/QXzkDyYltpri5s7ubE
   X2/60Jug8gjG4888IURmTtIKb6rMvB/mduisIDVk/8nt9/M4RZOAqeSsf
   WCcnuC3euJTVqIOVhUpL53ZptILithP0Y8iMzoO1C/emyB7YAUeLyxtFL
   IDU+LQ7SQ96oAN6FRb1gg9pASgAeg/nK22SMlKlnstcvTHiLXhDtTXvi+
   oZrHRE5MG8w6qsW9FlU5/r7VHeUB1RBbiudwEC4KUm6H3qIkEPs2+7hYQ
   CWGEYxouhG/c4lly/dGEEzAZZvMIyDobNgELq8YGHCSqp+xlHE1mfaFJk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="354753738"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="354753738"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 02:57:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="704017666"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="704017666"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Jun 2023 02:57:53 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7COv-0007eO-02;
	Thu, 08 Jun 2023 09:57:53 +0000
Date: Thu, 8 Jun 2023 17:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/210-gpu 89/225] warning: associated function
 `into_raw` is never used
Message-ID: <202306081708.R2L4ylXV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/210-gpu
head:   088cf4cc64f4e0eec3c9b99e36c9f5e9a86b1173
commit: 29b0bf0eed1a1011e729d34508c82aa3fb406500 [89/225] rust: dma_fence: Add DMA Fence abstraction
config: x86_64-randconfig-x061-20230606 (https://download.01.org/0day-ci/archive/20230608/202306081708.R2L4ylXV-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/29b0bf0eed1a1011e729d34508c82aa3fb406500
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/210-gpu
        git checkout 29b0bf0eed1a1011e729d34508c82aa3fb406500
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306081708.R2L4ylXV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated function `into_raw` is never used
   --> rust/kernel/dma_fence.rs:520:19
   |
   520 |     pub(crate) fn into_raw(self) -> *mut bindings::dma_fence_chain {
   |                   ^^^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
