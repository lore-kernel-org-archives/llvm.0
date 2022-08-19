Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A3B7B
	for <llvm@lists.linux.dev>; Fri, 19 Aug 2022 02:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660876646; x=1692412646;
  h=date:from:cc:subject:message-id:mime-version;
  bh=PljOfEjxAfk6yY6m03wNdeEYty+3tzTXXZ0gzvLi17k=;
  b=ByIHBf+7WBAnlJv5Dvmx5Dpyx4hVerq3kdYBTQi0Y6oIvF5ZLQYrHcn1
   SlM7M699PcD6cgvLuFkFN6fZDKdWT1HaSVom7xeuG1lr26xKI0Wkn4kxK
   5p6xQsPYVux8bkuc/IP2DZxK9iMGilHkydmd0GAncqcTqYLGlq0ixBYg/
   15qdr9Ove2502SnJq8cJvdxyVuKMCSwdkONXZw0L4dJCUTkzCD28tBOEP
   bHAjQI+HtoNotNa4oDmPx+wajPVEvMqGPTKdASfKhmD0J1N7h5ND/tpgZ
   AzTfxudIfSuktf/NPrV1WR5zKXKdQg2Kgl/aSqjb5qtwdMaU1o/absmgy
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="290484698"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="290484698"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2022 19:37:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="641090215"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Aug 2022 19:37:25 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oOrsy-0000xZ-20;
	Fri, 19 Aug 2022 02:37:24 +0000
Date: Fri, 19 Aug 2022 10:36:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [ammarfaizi2-block:palmer/linux/fixes 2/2] ld.lld: error:
 init/built-in.a(calibrate.o):(function calibrate_delay: .text+0x90):
 relocation R_RISCV_HI20 out of range: 528022 is not in [-524288, 524287];
 references __stack_chk_guard
Message-ID: <202208191051.Jh9p7zSO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel@vger.kernel.org
TO: Conor Dooley <conor.dooley@microchip.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>

tree:   https://github.com/ammarfaizi2/linux-block palmer/linux/fixes
head:   96264230a6817bcd4a7ae0fc30c60bfb46499f68
commit: 96264230a6817bcd4a7ae0fc30c60bfb46499f68 [2/2] perf: riscv legacy: fix kerneldoc comment warning
config: riscv-buildonly-randconfig-r002-20220819 (https://download.01.org/0day-ci/archive/20220819/202208191051.Jh9p7zSO-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 0ac597f3cacf60479ffd36b03766fa7462dabd78)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/96264230a6817bcd4a7ae0fc30c60bfb46499f68
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block palmer/linux/fixes
        git checkout 96264230a6817bcd4a7ae0fc30c60bfb46499f68
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: init/built-in.a(calibrate.o):(function calibrate_delay: .text+0x90): relocation R_RISCV_HI20 out of range: 528022 is not in [-524288, 524287]; references __stack_chk_guard
   >>> referenced by calibrate.c:272 (init/calibrate.c:272)
   >>> defined in arch/riscv/built-in.a(kernel/process.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
