Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F954258E
	for <llvm@lists.linux.dev>; Sat, 12 Mar 2022 19:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647111881; x=1678647881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WcTqN6pdrnRV8s7lHgAdNuSKmxqY21awmplFp41zZus=;
  b=Mg0Xtpaoo9FWkAW49LxL7o8xCtuC08wP6ETZT3ltsgjZ3Izr7ZjSYeQ2
   X35lOClbJGHzDbItcO0DefO0LFmBvvMkBPELUfIhYaWQa2TLlHMeuG8mY
   Lnj+27nT65Ia9xRnJp4ay+Mo02Yn8Lub3yPxc3LvzIjpIhjLFOEecDODl
   2Z6sZs+JEkJF6Sd6LEbZV2bRH3Kx9zrdqRMikLJuaGEDUSAwSeBRBk8+9
   +gDLKqP/9xMXXVqPBO0+1P+Nsjcpc/wHAlpp9aTFF87qLQhQkWeqojxVu
   jyUqebJ3nHpkSAQ0DsiUuYexHp++UlyAGjLkbHgQN+6QyK3xxs9F2cMCS
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10284"; a="236417200"
X-IronPort-AV: E=Sophos;i="5.90,175,1643702400"; 
   d="scan'208";a="236417200"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2022 11:04:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,175,1643702400"; 
   d="scan'208";a="579684543"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Mar 2022 11:04:38 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nT72c-0008BU-6K; Sat, 12 Mar 2022 19:04:38 +0000
Date: Sun, 13 Mar 2022 03:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atish.patra@wdc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>, linux-doc@vger.kernel.org
Subject: arch/riscv/kvm/vcpu_sbi.c:3: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202203130225.OBpOOQrW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Atish,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   68453767131a5deec1e8f9ac92a9042f929e585d
commit: dea8ee31a039277576c215fffa13957970246366 RISC-V: KVM: Add SBI v0.1 support
date:   5 months ago
config: riscv-randconfig-c006-20220312 (https://download.01.org/0day-ci/archive/20220313/202203130225.OBpOOQrW-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 43f668b98e8d87290fc6bbf5ed13c3ab542e3497)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dea8ee31a039277576c215fffa13957970246366
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout dea8ee31a039277576c215fffa13957970246366
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_sbi.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (c) 2019 Western Digital Corporation or its affiliates.


vim +3 arch/riscv/kvm/vcpu_sbi.c

   > 3	 * Copyright (c) 2019 Western Digital Corporation or its affiliates.
     4	 *
     5	 * Authors:
     6	 *     Atish Patra <atish.patra@wdc.com>
     7	 */
     8	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
