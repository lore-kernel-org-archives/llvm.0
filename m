Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8358B10E7
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 22:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651185286; x=1682721286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Xaif9XTCLVj9HMqW7PV8obS8KjvJ3OUPUcIY2cWs4U=;
  b=gAQYrpeP0ExnAiP9NBhdCGOOqfttyeoAz/BEuV5VC6C46kGfEGbBDTH/
   bbWW7ENXmM/dyOE7BQKtk0H4fkMhH5vGpsBsk3ACRy0p7hGSj4HxGtSsz
   zz3YyoR0yGd0D8K8aQoDJ7JpOD9R3gYszZSxsXLy70z1YbZQ3Nobw4wnQ
   5yhrKTMHXkBsV1NGccb9jca+w2Vu/tLxGS4c1I1wieR4b/Nf7/ed869R0
   KYhdd/D9Im9VRAFr1iUNytDSYfWMKt+WcpphBt2g+iZwnLkv/TSwYFsT1
   j07mEXt120SALui2KVXbnSc6V380TzA4tNhcB/26by80URVegwfWyV2pz
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="264033883"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="264033883"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 15:34:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="597008914"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 28 Apr 2022 15:34:28 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nkCiR-0005k1-S9;
	Thu, 28 Apr 2022 22:34:27 +0000
Date: Fri, 29 Apr 2022 06:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmerdabbelt@google.com>
Subject: fs/proc/vmcore.c:443:42: warning: unused variable 'vmcore_mmap_ops'
Message-ID: <202204290642.I2dLZBgO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nick,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   249aca0d3d631660aa3583c6a3559b75b6e971b4
commit: 5640975003d0234da08559677e22ec25b9cb3267 RISC-V: Add crash kernel support
date:   1 year ago
config: riscv-randconfig-c006-20220428 (https://download.01.org/0day-ci/archive/20220429/202204290642.I2dLZBgO-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473aacce38cd7dd77eebceaf3c98c5707ab3b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5640975003d0234da08559677e22ec25b9cb3267
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5640975003d0234da08559677e22ec25b9cb3267
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/proc/vmcore.c:443:42: warning: unused variable 'vmcore_mmap_ops' [-Wunused-const-variable]
   static const struct vm_operations_struct vmcore_mmap_ops = {
                                            ^
   8 warnings generated.


vim +/vmcore_mmap_ops +443 fs/proc/vmcore.c

9cb218131de1c59 Michael Holzheu 2013-09-11  442  
9cb218131de1c59 Michael Holzheu 2013-09-11 @443  static const struct vm_operations_struct vmcore_mmap_ops = {
9cb218131de1c59 Michael Holzheu 2013-09-11  444  	.fault = mmap_vmcore_fault,
9cb218131de1c59 Michael Holzheu 2013-09-11  445  };
9cb218131de1c59 Michael Holzheu 2013-09-11  446  

:::::: The code at line 443 was first introduced by commit
:::::: 9cb218131de1c59dca9063b2efe876f053f316af vmcore: introduce remap_oldmem_pfn_range()

:::::: TO: Michael Holzheu <holzheu@linux.vnet.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
