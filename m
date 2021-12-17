Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061CC2C9D
	for <llvm@lists.linux.dev>; Fri, 17 Dec 2021 09:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639733587; x=1671269587;
  h=date:from:cc:subject:message-id:mime-version;
  bh=v8W0WR7DdyjlJrc5lTaZ1a4Ptk9l7yb9q6Dbh6QB9xM=;
  b=TZz9WREcU7a21O2l8xKhQjBTVRhh3EJURyyUS2yA/PtteF9k9ykOh8Yq
   Mp9IJUhUmNtRxltm6rPPFtOFid6aRtHUFkBFPIRxIiiX/ikNzEVJThSkR
   a2Qy2i0b9GwqHmbcH346VkiU+OpLXgv0Ad41T58vqvxGwUkfn6e2p4hGI
   YeaZmxxHnhXdNoMfiimoACKGTlNvv4vxDDrQUHbWB32GR062pkQ6HJamF
   ApH0qrsWjflVYE0aSb6LizJRnTvx1ZY3NIS8zymn2pMJVJTC+Tu3wAOQW
   b+1oVPvnD51ObHYgL+pF40syNDW+1HuoziNK9gHpjail0TfofBy/7+PIE
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="326007829"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="326007829"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2021 01:33:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="506702689"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Dec 2021 01:33:03 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1my9bq-0004Xg-Mc; Fri, 17 Dec 2021 09:33:02 +0000
Date: Fri, 17 Dec 2021 17:32:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [kvalo-ath:pending 28/41] ld.lld: error:
 arch/riscv/built-in.a(kernel/process.o):(function __show_regs: .text+0x3e):
 relocation R_RISCV_HI20 out of range: 528318 is not in
Message-ID: <202112171727.KOUWbGEB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: Kalle Valo <kvalo@codeaurora.org>
CC: ath10k@lists.infradead.org
CC: linux-kernel@vger.kernel.org
TO: "David Mosberger-Tang" <davidm@egauge.net>
CC: Kalle Valo <kvalo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   af7d1ba82e6454bcb22dc77394a7c4350e3dfb6c
commit: 3cc23932ba2a9aaa8c62d1a9ecb1fe7c296f9f32 [28/41] wilc1000: Rename tx task from "K_TXQ_TASK" to NETDEV-tx
config: riscv-randconfig-r011-20211216 (https://download.01.org/0day-ci/archive/20211217/202112171727.KOUWbGEB-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9043c3d65b11b442226015acfbf8167684586cfa)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=3cc23932ba2a9aaa8c62d1a9ecb1fe7c296f9f32
        git remote add kvalo-ath https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
        git fetch --no-tags kvalo-ath pending
        git checkout 3cc23932ba2a9aaa8c62d1a9ecb1fe7c296f9f32
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/riscv/built-in.a(kernel/process.o):(function __show_regs: .text+0x3e): relocation R_RISCV_HI20 out of range: 528318 is not in [-524288, 524287]
   >>> referenced by process.c

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
