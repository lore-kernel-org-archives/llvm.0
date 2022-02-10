Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0332F28
	for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 08:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644483103; x=1676019103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/A4693GUb3o/SU+sa4rlHA5z1S2X7+z1egkBlbKjtho=;
  b=Cr4B1oBgTQk7KSTD+s+WvSQgB37I0sHlKNOWylBOU+2bl/jcEMiiU1Zz
   Mz0Ym49aRod6oAXnUoe1xWAi9Z595/QMkJxbbxqWjlbhTRdAaeky7XQlm
   r+9DoJTpGbufOpX8gLyH7u8ez9yjrvZCYxUT10+MSoYUYpkqbf9H++l07
   UdPmVfjI9clTtDawOBj4YdRhNeryLXiYmMBMnnbnrBZyzBqVuj8q4OWEE
   lTiTY1XHD8nAhqx0p44sY2IVQpSLmYANlp8OouDfpmjcLwtGh1FuM29rl
   ZhjW+RxNbGmmGbweI+ukZaWDPoBSA1dYF45BPnLl8CWbpLVqADpDzBOo2
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="312732721"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; 
   d="scan'208";a="312732721"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 00:51:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; 
   d="scan'208";a="701609674"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Feb 2022 00:51:35 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nI5As-0002zm-Rn; Thu, 10 Feb 2022 08:51:34 +0000
Date: Thu, 10 Feb 2022 16:51:31 +0800
From: kernel test robot <lkp@intel.com>
To: Pingfan Liu <kernelfans@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [linux-next:pending-fixes 265/356]
 arch/riscv/kernel/cpu-hotplug.c:43:2: error: implicit declaration of
 function 'numa_remove_cpu'
Message-ID: <202202101650.4mU4Ubis-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   dfd7907f4e4fe53417c1436f4a727a143e0ba2d2
commit: c3c94752087e789419be7024116c0a7b22883541 [265/356] riscv: cpu-hotplug: clear cpu from numa map when teardown
config: riscv-randconfig-c006-20220210 (https://download.01.org/0day-ci/archive/20220210/202202101650.4mU4Ubis-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project aa845d7a245d85c441d0bd44fc7b6c3be8f3de8d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c3c94752087e789419be7024116c0a7b22883541
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next pending-fixes
        git checkout c3c94752087e789419be7024116c0a7b22883541
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/cpu-hotplug.c:43:2: error: implicit declaration of function 'numa_remove_cpu' [-Werror,-Wimplicit-function-declaration]
           numa_remove_cpu(cpu);
           ^
   arch/riscv/kernel/cpu-hotplug.c:43:2: note: did you mean 'remove_cpu'?
   include/linux/cpu.h:128:5: note: 'remove_cpu' declared here
   int remove_cpu(unsigned int cpu);
       ^
   1 error generated.


vim +/numa_remove_cpu +43 arch/riscv/kernel/cpu-hotplug.c

    24	
    25	/*
    26	 * __cpu_disable runs on the processor to be shutdown.
    27	 */
    28	int __cpu_disable(void)
    29	{
    30		int ret = 0;
    31		unsigned int cpu = smp_processor_id();
    32	
    33		if (!cpu_ops[cpu] || !cpu_ops[cpu]->cpu_stop)
    34			return -EOPNOTSUPP;
    35	
    36		if (cpu_ops[cpu]->cpu_disable)
    37			ret = cpu_ops[cpu]->cpu_disable(cpu);
    38	
    39		if (ret)
    40			return ret;
    41	
    42		remove_cpu_topology(cpu);
  > 43		numa_remove_cpu(cpu);
    44		set_cpu_online(cpu, false);
    45		irq_migrate_all_off_this_cpu();
    46	
    47		return ret;
    48	}
    49	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
