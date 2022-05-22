Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE30717C9
	for <llvm@lists.linux.dev>; Sun, 22 May 2022 00:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653179939; x=1684715939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3WHKXl79u1vCILkAQxIaDjbpXnUaF+IeSbND92Q613E=;
  b=YCeu8Bybi8KdxKEz26iOAd+acHZvKNsq0/B6xlPPe2LflvImAOwNs9c+
   BM01h7cRqhBD1YOO745+Wz2FV7IUhwhzD6HNy0+djWS1D07J44Jpy8I5Y
   3Y37OWTOw1wie7TVMGCDi7bEnxLwM9+71Hmg5DG05BvNBs+1gpgiJc5bs
   a1q9YR0irOLsGIOfSbL6b5Pp5l5XkvTn6DWmraGFmxHhsfCArQkxKA77u
   5qrwEkjxgS5pNLbjbqf0NJVyvPX/V1qIIEhlf7UqYQex/zO6m6S9AUi9Y
   Jchx3One2+PuEKNgTxqWwvtto27b5BFIMNb1xNThRphZ3NkPFuEwdf2ar
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10354"; a="272631544"
X-IronPort-AV: E=Sophos;i="5.91,243,1647327600"; 
   d="scan'208";a="272631544"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 17:38:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,243,1647327600"; 
   d="scan'208";a="599963293"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 May 2022 17:38:57 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nsZcW-0006mg-DK;
	Sun, 22 May 2022 00:38:56 +0000
Date: Sun, 22 May 2022 08:38:05 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [linux-next:master 10411/13468]
 arch/riscv/include/asm/pgtable-64.h:210:2: error: invalid input constraint
 '0' in asm
Message-ID: <202205220805.wrw5woEk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   18ecd30af1a8402c162cca1bd58771c0e5be7815
commit: a35707c3d850dda0ceefb75b1b3bd191921d5765 [10411/13468] riscv: add memory-type errata for T-Head
config: riscv-randconfig-r032-20220522 (https://download.01.org/0day-ci/archive/20220522/202205220805.wrw5woEk-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b369762beb70dfef22c7e793aed79b94d7dc0757)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a35707c3d850dda0ceefb75b1b3bd191921d5765
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout a35707c3d850dda0ceefb75b1b3bd191921d5765
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/riscv/include/asm/pgtable.h:114:
>> arch/riscv/include/asm/pgtable-64.h:210:2: error: invalid input constraint '0' in asm
           ALT_THEAD_PMA(prot_val);
           ^
   arch/riscv/include/asm/errata_list.h:88:4: note: expanded from macro 'ALT_THEAD_PMA'
           : "0"(_val),                                                    \
             ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
>> arch/riscv/include/asm/pgtable.h:255:2: error: invalid input constraint '0' in asm
           ALT_THEAD_PMA(prot_val);
           ^
   arch/riscv/include/asm/errata_list.h:88:4: note: expanded from macro 'ALT_THEAD_PMA'
           : "0"(_val),                                                    \
             ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   arch/riscv/include/asm/pgtable.h:298:2: error: invalid input constraint '0' in asm
           ALT_THEAD_PMA(prot_val);
           ^
   arch/riscv/include/asm/errata_list.h:88:4: note: expanded from macro 'ALT_THEAD_PMA'
           : "0"(_val),                                                    \
             ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   arch/riscv/include/asm/pgtable.h:411:2: error: invalid input constraint '0' in asm
           ALT_THEAD_PMA(newprot_val);
           ^
   arch/riscv/include/asm/errata_list.h:88:4: note: expanded from macro 'ALT_THEAD_PMA'
           : "0"(_val),                                                    \
             ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:700:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:700:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:700:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:4: warning: array index 1 is past the end of the array (which contains 1 element) [-Warray-bounds]
                           set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:700:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:100:11: warning: array index 1 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   return (set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:700:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:700:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];


vim +/0 +210 arch/riscv/include/asm/pgtable-64.h

   205	
   206	static inline pmd_t pfn_pmd(unsigned long pfn, pgprot_t prot)
   207	{
   208		unsigned long prot_val = pgprot_val(prot);
   209	
 > 210		ALT_THEAD_PMA(prot_val);
   211	
   212		return __pmd((pfn << _PAGE_PFN_SHIFT) | prot_val);
   213	}
   214	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
