Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3671FC8
	for <llvm@lists.linux.dev>; Mon,  6 Jun 2022 02:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654483352; x=1686019352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fit8HZMPGvo/+C1wqhHEmiPdAbd1OryM+h5M+okK88U=;
  b=GUfFfz1Bnq6HnU8fC+FjkgxgmEU1N/ODxFBy+JkON6TevxIY4qgb0I2m
   J4G8N1yo2J8fyfh4/r+5g2xeLpa1ERqHgLHxp3IlgFKwojJJBQiA8DSxu
   C8awsI/hjPFOc65E0Q5kH8QhgUS84TV167rHjP8srZ+O8N2k974Pheqsc
   WwYOy7AXaLhjNCxnxEluP6GDLLjLFmv1GUBZigrer9LH+DW6gIZjPE4s+
   Knh4yq0ABJq0ri/W04qxBqYgZRAl3NNEBt1G6cR+uZx1xYOGb0nb7/fEz
   mj0vOYkEzh9mKZpLs7ZEbEYCyCp5xtxZJtWJnYtdVxfEaoKvVE9H4FQPh
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="301974562"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="301974562"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2022 19:42:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="906315383"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Jun 2022 19:42:04 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ny2gt-000CQX-Or;
	Mon, 06 Jun 2022 02:42:03 +0000
Date: Mon, 6 Jun 2022 10:41:29 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Atish Patra <Atish.Patra@wdc.com>, linux-kernel@vger.kernel.org
Subject: [atishp04:kvm_pmu 4/4] arch/riscv/include/asm/kvm_host.h:19:10:
 fatal error: 'asm/kvm_vcpu_pmu.h' file not found
Message-ID: <202206061019.MqcefJj0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux kvm_pmu
head:   9df21c8955e9552aae9109be01c0f910e4023667
commit: 9df21c8955e9552aae9109be01c0f910e4023667 [4/4] RISC-V: KVM: Add skeleton support
config: riscv-buildonly-randconfig-r009-20220605 (https://download.01.org/0day-ci/archive/20220606/202206061019.MqcefJj0-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/atishp04/linux/commit/9df21c8955e9552aae9109be01c0f910e4023667
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 kvm_pmu
        git checkout 9df21c8955e9552aae9109be01c0f910e4023667
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:12:
>> arch/riscv/include/asm/kvm_host.h:19:10: fatal error: 'asm/kvm_vcpu_pmu.h' file not found
   #include <asm/kvm_vcpu_pmu.h>
            ^~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[2]: *** [scripts/Makefile.build:121: arch/riscv/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1196: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +19 arch/riscv/include/asm/kvm_host.h

    11	
    12	#include <linux/types.h>
    13	#include <linux/kvm.h>
    14	#include <linux/kvm_types.h>
    15	#include <linux/spinlock.h>
    16	#include <asm/csr.h>
    17	#include <asm/kvm_vcpu_fp.h>
    18	#include <asm/kvm_vcpu_timer.h>
  > 19	#include <asm/kvm_vcpu_pmu.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
