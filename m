Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08062F25
	for <llvm@lists.linux.dev>; Wed,  9 Feb 2022 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644397905; x=1675933905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NjdtmaVs0ctuD53j3aiBDEGJMY5OFw6n0MZBEZ9TuzI=;
  b=eXHFEU16hi7aIccinuS7fjGDYCoNloU5bzCFwyiyM5HuiiB2mq2UBrQw
   2RS6j9mnPsswk6jVG2eGcI7UkI7+WYoE3WinEh7htlokAg8gWWcuLGQE6
   7gbVcA06hV7pNqahCkVqeDaanaam1NGShXL2YWzDi+a1JtWo+qT14yiUz
   VrCiNdDmTKY5Ab+qpJCZ5iKVZYzVfrX6C0k36DuDB2XZ2leZS8T/YsbKe
   u+IjTE17AKIoz9ytsqo4yxwhQvFcPa4o7cNDzTRNkv7ce/9qRLm2YNOYC
   Kp7qkwKLBJ+4U0Zy0hBWJNCiiQi2TE/R5dno7do0rGJpr6eKqGWj6RcZF
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="249109264"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; 
   d="scan'208";a="249109264"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 01:11:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; 
   d="scan'208";a="499903651"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Feb 2022 01:11:36 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHj0h-0001XJ-IB; Wed, 09 Feb 2022 09:11:35 +0000
Date: Wed, 9 Feb 2022 17:11:19 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 848/872] ld.lld: error: undefined
 symbol: update_stripe
Message-ID: <202202091702.kNz1pA5j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   1183ce490adb103e5e569b8ebd74c50c885ddc05
commit: ad3ea50420b2f1742f84afbb0de7dd0b355298c2 [848/872] spi: spi-zynqmp-gqspi: Add dual parallel and stacked mode support in driver
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220209/202202091702.kNz1pA5j-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/ad3ea50420b2f1742f84afbb0de7dd0b355298c2
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15
        git checkout ad3ea50420b2f1742f84afbb0de7dd0b355298c2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: update_stripe
   >>> referenced by spi-zynqmp-gqspi.c:1148 (drivers/spi/spi-zynqmp-gqspi.c:1148)
   >>>               spi/spi-zynqmp-gqspi.o:(zynqmp_qspi_exec_op) in archive drivers/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
