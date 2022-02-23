Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F9F7EC
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 03:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645586895; x=1677122895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aXsvb76kxe1f0vtbpAwHxd95aWtlNMa7DirL39W8X0s=;
  b=S1QFoymF9fhH7ljsMepTU5Wbyn2mOmt52QzwphTWurxQCWvKi6W8/Xt9
   vPtml1JMNooZ4A54zzdazbB230hkPZ0Q7LunlbdapRAXIlLkWEl3n4GCG
   6ducL2fmBR/on3VHMySbdTVq6UUUBDI4kgX1ujVTGa2UYDSFf6ZOeRETj
   FGnaEm+cC8L2/9o30I5LwnfoGrWz9smXjvJVbp3NYOj9RZzQZd4ChD4nc
   TJqESbgWiTalgH8jp+FGuny/Dnhyqj93az8wlOUZcjCA6uB6/rkBsToBl
   mgJlAoppT1u8Hs89hpJQFXKbbS15ZJCZdQFQy3DvGUWa+9uugG9aXnxRQ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="251611134"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="251611134"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 19:28:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="548052217"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Feb 2022 19:28:13 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMiK5-0000w0-8k; Wed, 23 Feb 2022 03:28:13 +0000
Date: Wed, 23 Feb 2022 11:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1839/2324] arch/mips/ath25/devices.h:36:10:
 error: implicit declaration of function 'smp_processor_id'
Message-ID: <202202231135.jSEszXqu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   7d9efc989eceed6a8fa475a186880ec4a1ad54a3
commit: 03d4ee3eff69c2a68c1717afc5a08d1142af6a57 [1839/2324] headers/deps: mm: Optimize <linux/node.h> dependencies
config: mips-ath25_defconfig (https://download.01.org/0day-ci/archive/20220223/202202231135.jSEszXqu-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=03d4ee3eff69c2a68c1717afc5a08d1142af6a57
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 03d4ee3eff69c2a68c1717afc5a08d1142af6a57
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/mips/ath25/early_printk.c:14:
>> arch/mips/ath25/devices.h:36:10: error: implicit declaration of function 'smp_processor_id' [-Werror,-Wimplicit-function-declaration]
           return (current_cpu_data.cputype == CPU_4KEC);
                   ^
   arch/mips/include/asm/cpu-info.h:120:35: note: expanded from macro 'current_cpu_data'
   #define current_cpu_data cpu_data[smp_processor_id()]
                                     ^
   1 error generated.


vim +/smp_processor_id +36 arch/mips/ath25/devices.h

1ac91b1f686e9d Sergey Ryazanov 2014-10-29  33  
43cc739fd98b8c Sergey Ryazanov 2014-10-29  34  static inline bool is_ar2315(void)
43cc739fd98b8c Sergey Ryazanov 2014-10-29  35  {
43cc739fd98b8c Sergey Ryazanov 2014-10-29 @36  	return (current_cpu_data.cputype == CPU_4KEC);
43cc739fd98b8c Sergey Ryazanov 2014-10-29  37  }
43cc739fd98b8c Sergey Ryazanov 2014-10-29  38  

:::::: The code at line 36 was first introduced by commit
:::::: 43cc739fd98b8c517ad45756d869f866e746ba04 MIPS: ath25: add common parts

:::::: TO: Sergey Ryazanov <ryazanov.s.a@gmail.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
