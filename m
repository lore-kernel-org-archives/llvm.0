Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4E668
	for <llvm@lists.linux.dev>; Sat, 27 Nov 2021 02:43:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="296536565"
X-IronPort-AV: E=Sophos;i="5.87,267,1631602800"; 
   d="scan'208";a="296536565"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 18:43:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,267,1631602800"; 
   d="scan'208";a="675707630"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 26 Nov 2021 18:43:31 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqngY-0008xH-9s; Sat, 27 Nov 2021 02:43:30 +0000
Date: Sat, 27 Nov 2021 10:43:14 +0800
From: kernel test robot <lkp@intel.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: mm/memcontrol.c:1058:29: warning: unused function 'memcg_kmem_bypass'
Message-ID: <202111271029.EeYluWMG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: b4e0b68fbd9d1fd7e31cbe8adca3ad6cf556e2ee mm: memcontrol: use obj_cgroup APIs to charge kmem pages
date:   7 months ago
config: mips-randconfig-r022-20211122 (https://download.01.org/0day-ci/archive/20211127/202111271029.EeYluWMG-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c133fb321f7ca6083ce15b6aa5bf89de6600e649)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b4e0b68fbd9d1fd7e31cbe8adca3ad6cf556e2ee
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b4e0b68fbd9d1fd7e31cbe8adca3ad6cf556e2ee
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:1058:29: warning: unused function 'memcg_kmem_bypass'
   static __always_inline bool memcg_kmem_bypass(void)
   ^
   fatal error: error in backend: Nested variants found in inline asm string: ' .set push
   .set noat
   .set push
   .set arch=r4000
   .if ( 0x00 ) != -1)) 0x00 ) != -1)) : ($( static struct ftrace_branch_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace_branch"))) __if_trace = $( .func = __func__, .file = "arch/mips/include/asm/cmpxchg.h", .line = 163, $); 0x00 ) != -1)) : $))) ) && ( 0 ); .set push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ; .endif
   1: ll $0, $2 # __cmpxchg_asm
   bne $0, ${3:z}, 2f
   .set pop
   move $$1, ${4:z}
   .set arch=r4000
   sc $$1, $1
   beqz $$1, 1b
   .set pop
   2: .if ( 0x00 ) != -1)) 0x00 ) != -1)) : ($( static struct ftrace_branch_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace_branch"))) __if_trace = $( .func = __func__, .file = "arch/mips/include/asm/cmpxchg.h", .line = 163, $); 0x00 ) != -1)) : $))) ) && ( 0 ); .set push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ; .endif
   '
   clang-14: error: clang frontend command failed with exit code 70 (use -v to see invocation)
   clang version 14.0.0 (git://gitmirror/llvm_project 5162b558d8c0b542e752b037e72a69d5fd51eb1e)
   Target: mips-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-5162b558d8/bin
   clang-14: note: diagnostic msg:
   Makefile arch block certs crypto drivers fs include init ipc kernel lib mm net nr_bisected scripts security sound source usr virt


vim +/memcg_kmem_bypass +1058 mm/memcontrol.c

279c3393e2c1133 Roman Gushchin 2020-10-17  1057  
4127c6504f25c4f Roman Gushchin 2020-10-17 @1058  static __always_inline bool memcg_kmem_bypass(void)
4127c6504f25c4f Roman Gushchin 2020-10-17  1059  {
4127c6504f25c4f Roman Gushchin 2020-10-17  1060  	/* Allow remote memcg charging from any context. */
4127c6504f25c4f Roman Gushchin 2020-10-17  1061  	if (unlikely(active_memcg()))
4127c6504f25c4f Roman Gushchin 2020-10-17  1062  		return false;
4127c6504f25c4f Roman Gushchin 2020-10-17  1063  
4127c6504f25c4f Roman Gushchin 2020-10-17  1064  	/* Memcg to charge can't be determined. */
4127c6504f25c4f Roman Gushchin 2020-10-17  1065  	if (in_interrupt() || !current->mm || (current->flags & PF_KTHREAD))
4127c6504f25c4f Roman Gushchin 2020-10-17  1066  		return true;
4127c6504f25c4f Roman Gushchin 2020-10-17  1067  
4127c6504f25c4f Roman Gushchin 2020-10-17  1068  	return false;
4127c6504f25c4f Roman Gushchin 2020-10-17  1069  }
4127c6504f25c4f Roman Gushchin 2020-10-17  1070  

:::::: The code at line 1058 was first introduced by commit
:::::: 4127c6504f25c4fcff52dc996efda2ef859dd661 mm: kmem: enable kernel memcg accounting from interrupt contexts

:::::: TO: Roman Gushchin <guro@fb.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
