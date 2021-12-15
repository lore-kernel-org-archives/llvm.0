Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C969968
	for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 01:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639530161; x=1671066161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z/Kb2/OdzfUdgZLNhEvn9G5TA6snH3wX/ODH2Fsmmkc=;
  b=M5z3RzY1J+C9vxR5wJcmkg8TYmyu9CjfyWaMm0oyaPJ1MDW3CDxZufX5
   zrYcGAtCmguJegluLHbN1K5sdEJxRt0eV7BNrZPcER+AagZcLcLTB+eZg
   H5Ef1betN5Kpy8Z+Sf20X/Br1ylOz7ipkDPyPus3eBFCVfZMpTFwEuS9m
   NKaPRBxoQ/esrUoNTaVoXxYIdfyz06BnkkfHWneO056x5PnXxEeotj9g/
   HgUWIRyk3K3bpC4fi6Gz+c3YM5OS06mg/PfvkHJHTTHSY599egNT/DVD0
   hcBVPnrAmquSWHuUrv5ATMmBM5YuKp0xB5iqZ+BTl2ruuHiQNkzpwyUBO
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="299895600"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="299895600"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 17:02:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="567617616"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 14 Dec 2021 17:02:37 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxIgm-00011C-TS; Wed, 15 Dec 2021 01:02:36 +0000
Date: Wed, 15 Dec 2021 09:01:54 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
	P L Sai Krishna <lakshmis@xilinx.com>,
	Ranjit Waghmode <ranjit.waghmode@xilinx.com>,
	Tejas Prajapati Rameshchandra <tejas.prajapati.rameshchandra@xilinx.com>,
	Rajan Vaja <rajan.vaja@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.10 724/1981] ld.lld: error: undefined
 symbol: update_stripe
Message-ID: <202112150827.yvnVoALZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.10
head:   87ec9a2d98a7a7dfc98b57348a0ec310fd170e4b
commit: 5d37ab2cf69a5d4367f49fca798d78e4be66a43b [724/1981] spi: Update ZynqMP and Versal QSPI controller driver
config: x86_64-randconfig-a016-20211214 (https://download.01.org/0day-ci/archive/20211215/202112150827.yvnVoALZ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/5d37ab2cf69a5d4367f49fca798d78e4be66a43b
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.10
        git checkout 5d37ab2cf69a5d4367f49fca798d78e4be66a43b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: update_stripe
   >>> referenced by spi-zynqmp-gqspi.c:1173 (drivers/spi/spi-zynqmp-gqspi.c:1173)
   >>>               spi/spi-zynqmp-gqspi.o:(zynqmp_qspi_exec_op) in archive drivers/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
