Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EE515AE
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 00:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660783733; x=1692319733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=34rzyG6fA/I4w7aOxR4DKRYPL9bn0W46XoUQeJYg3Dg=;
  b=eqw1Pz6mSuApurAjaFi2DyVtLyHWS2cdbKqu9BXnZrcGKSHnGHzpeymS
   BQ3PUOqt0VLwtHPrEsJ8dQPT+4OjIs44iJ1itMf646MNCl9VBVWceOy2W
   tGRijp7AijpFjudc6BgZhmyTN+0kVOkjr5y9XXks9A45nXEnOHcSJBFxN
   lnxGmtLmVz72BtLfFkC7IUIZIUS2qPfwoc9vNIph/tPLAUjam1UzpWjE5
   P+wRqfqIYAAYIc+2yaGXBacYV7wScC8PjGQhQyik+Whf2QVHxsSVu1oIB
   eTqUZ3pqIprwF8U0f+J4tDlbPKswwFvhlUObhx5rVa2yBf4ZCvZpnJyHQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="354375581"
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; 
   d="scan'208";a="354375581"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2022 17:48:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; 
   d="scan'208";a="710761607"
Received: from lkp-server02.sh.intel.com (HELO 81d7e1ade3ba) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2022 17:48:51 -0700
Received: from kbuild by 81d7e1ade3ba with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oOTiM-0001XG-1k;
	Thu, 18 Aug 2022 00:48:50 +0000
Date: Thu, 18 Aug 2022 08:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [avpatel:riscv_aia_v1 9/21] ld.lld: error: undefined symbol:
 ipi_mux_create
Message-ID: <202208180836.hCTy6TA1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_aia_v1
head:   36cb4e5ba395f2438224c82ed1b2e8f816eff45b
commit: 9d1529228e6447d48c54a07ba627b114319eb13a [9/21] RISC-V: Treat IPIs as normal Linux IRQs
config: riscv-randconfig-r004-20220818 (https://download.01.org/0day-ci/archive/20220818/202208180836.hCTy6TA1-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project aed5e3bea138ce581d682158eb61c27b3cfdd6ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/9d1529228e6447d48c54a07ba627b114319eb13a
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_aia_v1
        git checkout 9d1529228e6447d48c54a07ba627b114319eb13a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ipi_mux_create
   >>> referenced by timer-clint.c:169 (drivers/clocksource/timer-clint.c:169)
   >>>               clocksource/timer-clint.o:(clint_timer_init_dt) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
