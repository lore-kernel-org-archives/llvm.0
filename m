Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D1317F7;
	Tue,  7 Feb 2023 05:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675749064; x=1707285064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3b3aWcL1l7U/L1LS+KV371zL/qzf8gpKCQsHXNrtd54=;
  b=g9Vr+pP6f7bQ7lOWNV91haqW0zUuOFY9X7gqrOuPxIYXc6UmmsXsjEGI
   KLBGWMfjF5LGCqHPqi15fvfcqyrsbjWbvt2tXXGb0A1XH5ltkoXy7P9ST
   NB3qn66XW5a1vvceRH4JjaQaVDfsoKapEc9uKGQfh1M1g57Pb+jUt0hlq
   9gvNXdn3Q6pA26ibUtH5nwF9Yif6uPSFJ3mmt/hqNpQntdSpo8AOw0IYY
   uuxzwxtF0CVE5LkKHVl23eigl1HAmrF/29YWfDV5DBNWlSE/FYgQnPvVw
   EGKKzt02irM4eOtaIgYJ2WBIG85PjWOdTclpG8INNq7eQ/xh/zX+RwJga
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="415633704"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="415633704"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 21:50:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="775409282"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="775409282"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2023 21:50:39 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPGsI-00038v-1M;
	Tue, 07 Feb 2023 05:50:38 +0000
Date: Tue, 7 Feb 2023 13:50:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [tip:x86/vdso 3/4] arch/x86/include/asm/arch_hweight.h:49:15: error:
 invalid input size for constraint 'D'
Message-ID: <202302071322.KTuOfRSa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/vdso
head:   5646bbd6684acf5c9b9dedb863b7d2f6f5a330fb
commit: 92d33063c081a82d25dd08a9cce03947c8ed9164 [3/4] x86/vdso: Provide getcpu for x86-32.
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230207/202302071322.KTuOfRSa-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=92d33063c081a82d25dd08a9cce03947c8ed9164
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip x86/vdso
        git checkout 92d33063c081a82d25dd08a9cce03947c8ed9164
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/x86/entry/vdso/vdso32/vgetcpu.c:2:
   In file included from arch/x86/entry/vdso/vdso32/../vgetcpu.c:8:
   In file included from include/linux/kernel.h:22:
   In file included from include/linux/bitops.h:68:
   In file included from arch/x86/include/asm/bitops.h:420:
>> arch/x86/include/asm/arch_hweight.h:49:15: error: invalid input size for constraint 'D'
                            : REG_IN (w));
                                      ^
   In file included from arch/x86/entry/vdso/vdso32/vgetcpu.c:2:
   In file included from arch/x86/entry/vdso/vdso32/../vgetcpu.c:8:
   In file included from include/linux/kernel.h:25:
   In file included from include/linux/math.h:6:
>> arch/x86/include/asm/div64.h:85:34: error: invalid output size for constraint '=a'
           asm ("mulq %2; divq %3" : "=a" (q)
                                           ^
   In file included from arch/x86/entry/vdso/vdso32/vgetcpu.c:2:
   arch/x86/entry/vdso/vdso32/../vgetcpu.c:13:1: warning: no previous prototype for function '__vdso_getcpu' [-Wmissing-prototypes]
   __vdso_getcpu(unsigned *cpu, unsigned *node, struct getcpu_cache *unused)
   ^
   arch/x86/entry/vdso/vdso32/../vgetcpu.c:12:9: note: declare 'static' if the function is not intended to be used outside of this translation unit
   notrace long
           ^
           static 
   1 warning and 2 errors generated.


vim +/D +49 arch/x86/include/asm/arch_hweight.h

d61931d89be506 Borislav Petkov 2010-03-05  35  
d14edb1648221e Denys Vlasenko  2015-08-04  36  #ifdef CONFIG_X86_32
d61931d89be506 Borislav Petkov 2010-03-05  37  static inline unsigned long __arch_hweight64(__u64 w)
d61931d89be506 Borislav Petkov 2010-03-05  38  {
d61931d89be506 Borislav Petkov 2010-03-05  39  	return  __arch_hweight32((u32)w) +
d61931d89be506 Borislav Petkov 2010-03-05  40  		__arch_hweight32((u32)(w >> 32));
d14edb1648221e Denys Vlasenko  2015-08-04  41  }
d61931d89be506 Borislav Petkov 2010-03-05  42  #else
d14edb1648221e Denys Vlasenko  2015-08-04  43  static __always_inline unsigned long __arch_hweight64(__u64 w)
d14edb1648221e Denys Vlasenko  2015-08-04  44  {
f5967101e9de12 Borislav Petkov 2016-05-30  45  	unsigned long res;
d14edb1648221e Denys Vlasenko  2015-08-04  46  
566b62a3676cae Uros Bizjak     2018-10-14  47  	asm (ALTERNATIVE("call __sw_hweight64", "popcntq %1, %0", X86_FEATURE_POPCNT)
d61931d89be506 Borislav Petkov 2010-03-05  48  			 : "="REG_OUT (res)
d61931d89be506 Borislav Petkov 2010-03-05 @49  			 : REG_IN (w));
d61931d89be506 Borislav Petkov 2010-03-05  50  
d61931d89be506 Borislav Petkov 2010-03-05  51  	return res;
d61931d89be506 Borislav Petkov 2010-03-05  52  }
d14edb1648221e Denys Vlasenko  2015-08-04  53  #endif /* CONFIG_X86_32 */
d61931d89be506 Borislav Petkov 2010-03-05  54  

:::::: The code at line 49 was first introduced by commit
:::::: d61931d89be506372d01a90d1755f6d0a9fafe2d x86: Add optimized popcnt variants

:::::: TO: Borislav Petkov <borislav.petkov@amd.com>
:::::: CC: H. Peter Anvin <hpa@zytor.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
