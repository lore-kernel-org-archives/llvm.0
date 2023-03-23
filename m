Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A80817CE;
	Thu, 23 Mar 2023 03:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679540952; x=1711076952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OxMp5ITUApnmxe34JYqk5zZlhEZbDF+SZO5UY8pwQE4=;
  b=TbL9vhsI1Eac/F+MSeVv5Otp73YkowG4knrz5D6hKnEkilFkuVyavX0z
   TTSZ5HqAzpUh6+fRYJ34FbtjE+caaJnZr4r4nZaIBdLtamc8gkdgjP8LT
   tF0Y8huTh10BVNVEX5Yh9w5QdX1k76r7DIcwHMfB196+8FPPcLNW30XDv
   6mOXGlzaT85iuwox9trX1GD7LVm3wvyWEKHHYoAmmtegUn+Q1cK3dJr+r
   cpa5wvclKVjGWnKhFX8Z/1gj7As2zPXcojlR9xe/XID+tDBdNA1bcxVkc
   Eff5OyGvyuk/5Py3uTvfgomrCpqyUXB3hqIMVjhnQtbRRHC90/F1h+UtI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319035517"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="319035517"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 20:09:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="825653980"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="825653980"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Mar 2023 20:09:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfBK5-000DsY-1h;
	Thu, 23 Mar 2023 03:09:05 +0000
Date: Thu, 23 Mar 2023 11:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [peterz-queue:smp/core 7/12] kernel/smp.c:112:35: error: passing
 'const struct cpumask *' to parameter of type 'struct cpumask *' discards
 qualifiers
Message-ID: <202303231040.y5rzdaUc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git smp/core
head:   74a78c26e097e9dd14b898429103d6a312fe1d5c
commit: 272d3dd1133b0d5291a9f587a2bb7ec8516c72ba [7/12] smp: Trace IPIs sent via arch_send_call_function_ipi_mask()
config: riscv-randconfig-r001-20230322 (https://download.01.org/0day-ci/archive/20230323/202303231040.y5rzdaUc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=272d3dd1133b0d5291a9f587a2bb7ec8516c72ba
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue smp/core
        git checkout 272d3dd1133b0d5291a9f587a2bb7ec8516c72ba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231040.y5rzdaUc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/smp.c:112:35: error: passing 'const struct cpumask *' to parameter of type 'struct cpumask *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           arch_send_call_function_ipi_mask(mask);
                                            ^~~~
   arch/riscv/include/asm/smp.h:40:55: note: passing argument to parameter 'mask' here
   void arch_send_call_function_ipi_mask(struct cpumask *mask);
                                                         ^
   1 error generated.


vim +112 kernel/smp.c

   107	
   108	static __always_inline void
   109	send_call_function_ipi_mask(const struct cpumask *mask)
   110	{
   111		trace_ipi_send_cpumask(mask, _RET_IP_, NULL);
 > 112		arch_send_call_function_ipi_mask(mask);
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
