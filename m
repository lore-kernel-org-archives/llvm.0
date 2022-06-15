Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9257A
	for <llvm@lists.linux.dev>; Wed, 15 Jun 2022 13:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655299699; x=1686835699;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ELZGT5Y9QupiX4bdathSuRd/t+U1liAWHCVgX16R4KQ=;
  b=k/GzVLFbSFf/Ka/ZyycNXelj3EMFgFZk7Mz8YEt7BMfVM0n1Vde+Tt1U
   07WRYkfxdrC6aa365kjR25kcMZ3v0eN/3G1R4kfi1ZtCOhgOvdIu5MNGJ
   RX0HJF6DQLdLSKalJDwZI4AxcDo336CdqgGuWR+YgOHbgOOrvTgDsHGL2
   ejhctbm5B6aPUtODcLhGxPYfuKAxoR+DYXZm/Nx4BGh8AGePn8Tg2U6GE
   Ofzd7VQUtBeKKgvYsuvfPv3PAb7roVzqMfBWd8BLG7AxbCDMdFnIx2d5l
   BE7WwzGzqE7HJB75w1+QnfcP9dFCOgvUq7TCyoxbceHdVyK/k+4tXDXPq
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="261983030"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="261983030"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 06:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="831040330"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 Jun 2022 06:28:17 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1T4C-000Mtd-Qh;
	Wed, 15 Jun 2022 13:28:16 +0000
Date: Wed, 15 Jun 2022 21:27:32 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:linux-5.18.y 759/1352] ld.lld: error:
 arch/riscv/built-in.a(kernel/reset.o):(function machine_power_off:
 .text+0x60): relocation R_RISCV_HI20 out of range: 539872 is not in
 [-524288, 524287]; references pm_power_off
Message-ID: <202206152147.HyB7vaSj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Miaoqian Lin <linmq006@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.18.y
head:   0e32b2c68ea4d90e0ecca45afd07dcf5d594de7e
commit: 5607a77a365df8c0fd5ff43ac424812b95775527 [759/1352] powerpc/fsl_rio: Fix refcount leak in fsl_rio_setup
config: riscv-randconfig-r001-20220613 (https://download.01.org/0day-ci/archive/20220615/202206152147.HyB7vaSj-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c97436f8b6e2718286e8496faf53a2c800e281cf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=5607a77a365df8c0fd5ff43ac424812b95775527
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.18.y
        git checkout 5607a77a365df8c0fd5ff43ac424812b95775527
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/riscv/built-in.a(kernel/reset.o):(function machine_power_off: .text+0x60): relocation R_RISCV_HI20 out of range: 539872 is not in [-524288, 524287]; references pm_power_off
   >>> referenced by reset.c
   >>> defined in arch/riscv/built-in.a(kernel/reset.o)
--
>> ld.lld: error: arch/riscv/built-in.a(kernel/reset.o):(function machine_halt: .text+0xe): relocation R_RISCV_HI20 out of range: 539872 is not in [-524288, 524287]; references pm_power_off
   >>> referenced by reset.c
   >>> defined in arch/riscv/built-in.a(kernel/reset.o)
--
>> ld.lld: error: arch/riscv/built-in.a(kernel/reset.o):(function machine_halt: .text+0x18): relocation R_RISCV_HI20 out of range: 539038 is not in [-524288, 524287]; references machine_halt.__if_trace.1
   >>> referenced by reset.c
   >>> defined in arch/riscv/built-in.a(kernel/reset.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
