Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35DB1FC3
	for <llvm@lists.linux.dev>; Sun,  4 Sep 2022 03:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662260967; x=1693796967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jkMdshiKs9XrIuJlcAFkAPcMEg3w2+8GzDrvRzklfJ4=;
  b=Hdh4D3N4FjDzkPOvK4vZna6T1BnPt8Id4eRZZpzkOvKEe3ZEV0RIkDP7
   D2NKu3w3GofLZA63mF/HbJ8wuArwCA14s+bsunzMQDJ4EeXwTA5rAE3fs
   HMiggM34g1Eq/XAtIDm+fxNvs4tUCukTQmPO7lO3HEYCHZTSLC4eGHcfq
   u8pGBRUGYd/Z20LDLxb+1esmkqtQBLR3805MQNfYZHh7c3M6/gAyTseKX
   J0fit6ABsE6asWDyyLtLw4Iw/BpUFm1vlpac2NgHmvYJZXrYZFiTPRzPs
   4K650voTFgbOnIOqhn7mAz6VhAZiyC6qilFiZBpfJSHkHzUvrhNlaUB3k
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10459"; a="283196751"
X-IronPort-AV: E=Sophos;i="5.93,288,1654585200"; 
   d="scan'208";a="283196751"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2022 20:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,288,1654585200"; 
   d="scan'208";a="590503626"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Sep 2022 20:09:25 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oUg0j-0002UH-0j;
	Sun, 04 Sep 2022 03:09:25 +0000
Date: Sun, 4 Sep 2022 11:08:48 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jpoimboe:s390 2/2] make[2]: *** No rule to make target 'relocs'.
Message-ID: <202209041142.KeGy3btD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git s390
head:   0784ee2ec1b58527a764182f48cf5fdf4f64f12c
commit: 0784ee2ec1b58527a764182f48cf5fdf4f64f12c [2/2] s390: Compile relocatable kernel without -fPIE
config: s390-randconfig-r006-20220904 (https://download.01.org/0day-ci/archive/20220904/202209041142.KeGy3btD-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=0784ee2ec1b58527a764182f48cf5fdf4f64f12c
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe s390
        git checkout 0784ee2ec1b58527a764182f48cf5fdf4f64f12c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> make[2]: *** No rule to make target 'relocs'.
   make[1]: *** [arch/s390/Makefile:154: archprepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:222: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
