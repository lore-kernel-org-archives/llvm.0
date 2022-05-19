Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281ED33C3
	for <llvm@lists.linux.dev>; Thu, 19 May 2022 23:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653001666; x=1684537666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=owTa8Ojj1njakSWjuxpOqGqY+f8O3SRc7zvEl/3ZICg=;
  b=f7p60oRy0QJ9kKBtpuaEYGK907M/pOezU3Ypwh7eVuRvaswDYCXqUkRw
   20keY/8TTho2NR1BfIdLiBJKWcsXerOeYfHOOqknj7mNS2Y6WaY/oXa1u
   D3KlTzv7cbQIz07eJG4IVfMq+34ryRD0XXjRo9Vos5UH8nG86bjcEaAxE
   9OnUC/TxxAMGG9raS4/3IbyCu0aVmzzicTYVVhgs5ck36GmvooYj8tvvr
   aJQHcOuGncOjJ56RIEz1SsLnBB20v42pwTPxgJ7JIZndbF+Gp3mnnlBqp
   yonp82NeMhlZLRROgUhZIv8qKgqC+TB+ySimv05K13GJLD4QV6DFIGYQO
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="297721069"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="297721069"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2022 16:07:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="557162745"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 19 May 2022 16:07:43 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nrpF9-00042G-07;
	Thu, 19 May 2022 23:07:43 +0000
Date: Fri, 20 May 2022 07:07:01 +0800
From: kernel test robot <lkp@intel.com>
To: Chih-En Lin <shiyn.lin@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 3/6] mm, pgtable: Add ownership for the PTE table
Message-ID: <202205200722.h5TDQrQZ-lkp@intel.com>
References: <20220519183127.3909598-4-shiyn.lin@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519183127.3909598-4-shiyn.lin@gmail.com>

Hi Chih-En,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tip/sched/core]
[also build test ERROR on soc/for-next linus/master v5.18-rc7 next-20220519]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Chih-En-Lin/Introduce-Copy-On-Write-to-Page-Table/20220520-023243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 734387ec2f9d77b00276042b1fa7c95f48ee879d
config: powerpc-microwatt_defconfig (https://download.01.org/0day-ci/archive/20220520/202205200722.h5TDQrQZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/aa5b69eef6a0be734cd331cb3ab4172d854fb93c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chih-En-Lin/Introduce-Copy-On-Write-to-Page-Table/20220520-023243
        git checkout aa5b69eef6a0be734cd331cb3ab4172d854fb93c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   include/linux/signal.h:162:1: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_BINOP(sigandnsets, _sig_andn)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:139:3: note: expanded from macro '_SIG_SET_BINOP'
                   r->sig[3] = op(a3, b3);                                 \
                   ^      ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:162:1: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_BINOP(sigandnsets, _sig_andn)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:140:3: note: expanded from macro '_SIG_SET_BINOP'
                   r->sig[2] = op(a2, b2);                                 \
                   ^      ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_OP(signotset, _sig_not)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:173:27: note: expanded from macro '_SIG_SET_OP'
           case 4: set->sig[3] = op(set->sig[3]);                          \
                                    ^        ~
   include/linux/signal.h:185:24: note: expanded from macro '_sig_not'
   #define _sig_not(x)     (~(x))
                              ^
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_OP(signotset, _sig_not)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:173:10: note: expanded from macro '_SIG_SET_OP'
           case 4: set->sig[3] = op(set->sig[3]);                          \
                   ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_OP(signotset, _sig_not)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:20: note: expanded from macro '_SIG_SET_OP'
                   set->sig[2] = op(set->sig[2]);                          \
                                    ^        ~
   include/linux/signal.h:185:24: note: expanded from macro '_sig_not'
   #define _sig_not(x)     (~(x))
                              ^
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_OP(signotset, _sig_not)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:3: note: expanded from macro '_SIG_SET_OP'
                   set->sig[2] = op(set->sig[2]);                          \
                   ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:11:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/powerpc/include/asm/uaccess.h:9:
   In file included from arch/powerpc/include/asm/kup.h:37:
>> include/linux/pgtable.h:603:59: error: invalid operands to binary expression ('void' and 'pmd_t *')
           return (smp_load_acquire(&pmd_page(*pmd)->cow_pte_owner) == owner) ?
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:25:
>> include/linux/page_ref.h:89:32: error: no member named 'page' in 'struct folio'
           return page_ref_count(&folio->page);
                                  ~~~~~  ^
   include/linux/page_ref.h:106:25: error: no member named 'page' in 'struct folio'
           set_page_count(&folio->page, v);
                           ~~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   28 warnings and 20 errors generated.
   make[2]: *** [scripts/Makefile.build:120: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1194: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +603 include/linux/pgtable.h

   600	
   601	static inline bool cow_pte_owner_is_same(pmd_t *pmd, pmd_t *owner)
   602	{
 > 603		return (smp_load_acquire(&pmd_page(*pmd)->cow_pte_owner) == owner) ?
   604			true : false;
   605	}
   606	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
