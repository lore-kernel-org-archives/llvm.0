Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89C2362
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 07:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652513368; x=1684049368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FQaXAdRLHeS/F/Os+0ChPC/KCF8P6e2fT/VRAWOBYIY=;
  b=SxiJLo9nyovo9aiAO0Dczv2L7WVtnuya5CQb+F06MEC+dV9qh0475k03
   9+WDe9xb/1Mm+BUSkI/SiD8VjzF9sUkQ+2PIleT49aWkH0fXiS7UPgLuv
   UrF2GTLMAwATu3cb01Ts/7hmVwqBuOUrSPN/v8terjDydMV+BC+QzBn0j
   kgnnmPIjiNXnBJRAJKA1Mnv2I9hMr08YpYXjpCcfxIYRwAbB05kgXL8nU
   pLEPaVGVzNfWFmCqM41jlpwvdK0lB+Exp1dBSLc7Q0gUhejVOQ0m/mJdm
   32DBSuYsxgNRKuoyBNw8e1jnshCSAcGeR6yZjDtwK6sQkoyySaa3zzu8e
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="356903437"
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; 
   d="scan'208";a="356903437"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2022 00:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; 
   d="scan'208";a="637573946"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 May 2022 00:29:26 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npmDO-0000Lx-2g;
	Sat, 14 May 2022 07:29:26 +0000
Date: Sat, 14 May 2022 15:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS_2022.1_update 848/1093] ld.lld:
 error: undefined symbol: update_stripe
Message-ID: <202205141502.Su3kf7NC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Amit,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
head:   5ead03b6e64b5072737c653bb20ebcd88704e3d1
commit: ad3ea50420b2f1742f84afbb0de7dd0b355298c2 [848/1093] spi: spi-zynqmp-gqspi: Add dual parallel and stacked mode support in driver
config: hexagon-randconfig-r035-20220512 (https://download.01.org/0day-ci/archive/20220514/202205141502.Su3kf7NC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/ad3ea50420b2f1742f84afbb0de7dd0b355298c2
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
        git checkout ad3ea50420b2f1742f84afbb0de7dd0b355298c2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: update_stripe
   >>> referenced by spi-zynqmp-gqspi.c
   >>> spi/spi-zynqmp-gqspi.o:(zynqmp_qspi_exec_op) in archive drivers/built-in.a
   >>> referenced by spi-zynqmp-gqspi.c
   >>> spi/spi-zynqmp-gqspi.o:(zynqmp_qspi_exec_op) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
