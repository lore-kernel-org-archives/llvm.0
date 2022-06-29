Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75ABC6AA2
	for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 20:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656535747; x=1688071747;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xBzclANnsRyRuccf9RJtwFYhinTiU2o3IO5sJrDKt0g=;
  b=HOWa+Vjdcit+trTf3ZFVkAeToK8JIQLn/uwzTOfp1xYHg79p9E6WnIza
   tx034bPQeWtKruk0hNVbLb9xQuuT5Zpny8BqWX5t93Njn9lp6Vb07a1X5
   txxWw2t+baivoNK5gcXSV61Z4/j13VOFzhfLAehE6iED5FkBeJKwu/re+
   aebpIgXNnlbiArJ2hRiVaDQ5qoa2+NqOjx6YrjK+FthJUebPyrivZsVl0
   muK/ca+EngQfaznDJQ1JkH7tyOdbZiCiY128b0Fz+XRqQeVY3m6KOByKW
   ngRamo9gFYlleLa3EJGMsOL45PaX19hipPEbZyUmi552e9mve4sMcxMyD
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="265190731"
X-IronPort-AV: E=Sophos;i="5.92,232,1650956400"; 
   d="scan'208";a="265190731"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 13:49:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,232,1650956400"; 
   d="scan'208";a="658706868"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Jun 2022 13:49:05 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o6ecT-000BeK-6l;
	Wed, 29 Jun 2022 20:49:05 +0000
Date: Thu, 30 Jun 2022 04:48:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 1183/1199] ld.lld: error:
 arch/riscv/built-in.a(kernel/cpu_ops.o):(function
 cpu_update_secondary_bootdata: .text+0x40): relocation R_RISCV_HI20 out of
 range: 528473 is not in [-524288, 524287]; references __cpu_up_stack_pointer
Message-ID: <202206300410.aH7JA7Km-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-arm-kernel@lists.infradead.org
TO: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   8684044b601946fceda13df7e84a2a8c68309e00
commit: 330b5ccda82fb4aeb62645f43825318798d10a55 [1183/1199] usb: dwc3: xilinx: Make dwc3_xilinx_wakeup_capable() static
config: riscv-randconfig-r032-20220629 (https://download.01.org/0day-ci/archive/20220630/202206300410.aH7JA7Km-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a774ba7f60d1fef403b5507b1b1a7475d3684d71)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/330b5ccda82fb4aeb62645f43825318798d10a55
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 330b5ccda82fb4aeb62645f43825318798d10a55
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/riscv/built-in.a(kernel/cpu_ops.o):(function cpu_update_secondary_bootdata: .text+0x40): relocation R_RISCV_HI20 out of range: 528473 is not in [-524288, 524287]; references __cpu_up_stack_pointer
   >>> referenced by cpu_ops.c
   >>> defined in arch/riscv/built-in.a(kernel/cpu_ops.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
