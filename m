Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560AD3D7C
	for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 13:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656596454; x=1688132454;
  h=date:from:cc:subject:message-id:mime-version;
  bh=9m7ExAuUbLHRnrr4ygSyyZuNUqX5eORbDGAlsRzoe4Q=;
  b=g88Or2v205JF7VyBrFWVwACi3+NdDNTALrI2E5KVIyoLhlBYs94xcfC3
   cyacqOm4VbAWXZJXyDPUucCkILjziVQ+atRhRi8f+rvlfxvwXCLo3I+kE
   ktew5kS4lx3GEyQx4uesgs0vGKZHukdGb1Z8VAcCQXV019Sfk2YPQKm3i
   tRobakC8BfU6izzh+zWRZa5I3sBjP5qE0FwnfeQyhPpODbjByUtSLR/+J
   Y8OmROrdVfSY13n7G6JnZQVGS/a7dvVBOZiwYXdCL2pPDZvvUcuqtew8I
   QKzkt3+T7nC62ln+wRLn4ZjBabtiBjVrtB/kbWGIKpy7wv3TQ7utzYI7q
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="344036469"
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; 
   d="scan'208";a="344036469"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 06:40:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; 
   d="scan'208";a="541331051"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 Jun 2022 06:40:52 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o6uPb-000Co6-Vi;
	Thu, 30 Jun 2022 13:40:51 +0000
Date: Thu, 30 Jun 2022 21:40:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 1/2] sched: Add per_cpu cluster domain info and
 cpus_share_lowest_cache API
Message-ID: <202206302141.nFFCjekB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
In-Reply-To: <20220630065527.38544-2-yangyicong@hisilicon.com>
References: <20220630065527.38544-2-yangyicong@hisilicon.com>
TO: Yicong Yang <yangyicong@hisilicon.com>
TO: peterz@infradead.org
TO: mingo@redhat.com
TO: juri.lelli@redhat.com
TO: vincent.guittot@linaro.org
TO: tim.c.chen@linux.intel.com
TO: gautham.shenoy@amd.com
TO: linux-kernel@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
CC: dietmar.eggemann@arm.com
CC: rostedt@goodmis.org
CC: bsegall@google.com
CC: bristot@redhat.com
CC: prime.zeng@huawei.com
CC: yangyicong@hisilicon.com
CC: jonathan.cameron@huawei.com
CC: ego@linux.vnet.ibm.com
CC: srikar@linux.vnet.ibm.com
CC: linuxarm@huawei.com
CC: 21cnbao@gmail.com
CC: guodong.xu@linaro.org
CC: hesham.almatary@huawei.com
CC: john.garry@huawei.com
CC: shenyang39@huawei.com
CC: kprateek.nayak@amd.com
CC: yu.c.chen@intel.com
CC: wuyun.abel@bytedance.com

Hi Yicong,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on next-20220630]
[cannot apply to linus/master v5.19-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Yicong-Yang/sched-fair-Scan-cluster-before-scanning-LLC-in-wake-up-path/20220630-145742
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 70fb5ccf2ebb09a0c8ebba775041567812d45f86
config: riscv-randconfig-r032-20220629 (https://download.01.org/0day-ci/archive/20220630/202206302141.nFFCjekB-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a774ba7f60d1fef403b5507b1b1a7475d3684d71)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/50ff7c627bf5a989311a194127ef0e87b2a1c453
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yicong-Yang/sched-fair-Scan-cluster-before-scanning-LLC-in-wake-up-path/20220630-145742
        git checkout 50ff7c627bf5a989311a194127ef0e87b2a1c453
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: init/built-in.a(main.o):(.text+0x9c): relocation R_RISCV_HI20 out of range: 526768 is not in [-524288, 524287]; references __init_end
   >>> referenced by main.c
   >>> defined in ./arch/riscv/kernel/vmlinux.lds:64
--
>> ld.lld: error: init/built-in.a(main.o):(.text+0xa4): relocation R_RISCV_HI20 out of range: 528523 is not in [-524288, 524287]; references .L.str.52
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function rcu_lock_acquire: .text+0xe0): relocation R_RISCV_HI20 out of range: 524289 is not in [-524288, 524287]; references .Ltmp6
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
