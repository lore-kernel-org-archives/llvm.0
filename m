Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201C172
	for <llvm@lists.linux.dev>; Sun, 28 Nov 2021 11:28:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10181"; a="299224149"
X-IronPort-AV: E=Sophos;i="5.87,271,1631602800"; 
   d="scan'208";a="299224149"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2021 03:28:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,271,1631602800"; 
   d="scan'208";a="608355161"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Nov 2021 03:28:21 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mrIM0-000AcG-GK; Sun, 28 Nov 2021 11:28:20 +0000
Date: Sun, 28 Nov 2021 19:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: Tyler Baicar <baicar@os.amperecomputing.com>,
	patches@amperecomputing.com, abdulhamid@os.amperecomputing.com,
	darren@os.amperecomputing.com, catalin.marinas@arm.com,
	will@kernel.org, maz@kernel.org, james.morse@arm.com,
	alexandru.elisei@arm.com, suzuki.poulose@arm.com,
	lorenzo.pieralisi@arm.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 2/2] trace, ras: add ARM RAS extension trace event
Message-ID: <202111281921.pUlQlG7z-lkp@intel.com>
References: <20211124170708.3874-3-baicar@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124170708.3874-3-baicar@os.amperecomputing.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Tyler,

I love your patch! Yet something to improve:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on rafael-pm/linux-next kvmarm/next linus/master v5.16-rc2 next-20211126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tyler-Baicar/ARM-Error-Source-Table-Support/20211125-011746
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
config: arm64-buildonly-randconfig-r006-20211126 (https://download.01.org/0day-ci/archive/20211128/202111281921.pUlQlG7z-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b558d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/f57618adb3ac894e9f3631edcb692dab7b78fa3b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Tyler-Baicar/ARM-Error-Source-Table-Support/20211125-011746
        git checkout f57618adb3ac894e9f3631edcb692dab7b78fa3b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __tracepoint_arm_ras_ext_event
   >>> referenced by ras.c
   >>> kernel/ras.o:(arch_arm_ras_report_error) in archive arch/arm64/built-in.a
   >>> referenced by ras.c
   >>> kernel/ras.o:(arch_arm_ras_report_error) in archive arch/arm64/built-in.a
   >>> referenced by ras.c
   >>> kernel/ras.o:(__jump_table+0x8) in archive arch/arm64/built-in.a
--
>> ld.lld: error: undefined symbol: __traceiter_arm_ras_ext_event
   >>> referenced by ras.c
   >>> kernel/ras.o:(arch_arm_ras_report_error) in archive arch/arm64/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
