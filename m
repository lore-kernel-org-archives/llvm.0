Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E98E4E2;
	Fri, 10 Mar 2023 23:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678490736; x=1710026736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yYV/DF86B2S0IQgPhb3yZwShZsnqTeq2emFusE8Z2j8=;
  b=kojfljuNYTCjdcqPBcKdHghmQDjgNZZcups3kjL8PLlYm2IKljYG2piw
   hHjnz7FbYoOZmkAipA1aVqlPXV0gMczwTB6oszEMt2DuCT+On4iiObfSU
   +tuAK0qwCaPobH59FWdVGybI06DS2OG0+5t4XVVJ+wd8SVuF5HhtB3EC1
   EDLBMzkxrnf8uR14sbJIs+KPwsm8YA5cK2aQhdGCgonZ+UXp0K6LeTPAu
   VeRoSoV6CZ6r0Ir8oHbAdNYlUe6/KXpFNX1Nqpw2R1j6PimlIeOJy3nLd
   /ZLITIIQmfDx/4USdLXqNPj5LWmNelER53eOq8MeaF9hEm4tHCIdunQ6g
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423117528"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="423117528"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 15:25:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="788216213"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="788216213"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2023 15:25:34 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pam7B-0004AJ-1v;
	Fri, 10 Mar 2023 23:25:33 +0000
Date: Sat, 11 Mar 2023 07:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-call-null-3 2/5] arch/powerpc/kernel/irq.c:223:1:
 error: type specifier missing, defaults to 'int'; ISO C99 and later do not
 support implicit int
Message-ID: <202303110734.cvRB3UtN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-call-null-3
head:   432e4844ba65840af4a24f5e3f561aead867f6e7
commit: 999f0b7f8056dcb51476a6515a8601c9d6374aa2 [2/5] static_call: Make NULL static calls return 0
config: powerpc-randconfig-r001-20230310 (https://download.01.org/0day-ci/archive/20230311/202303110734.cvRB3UtN-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=999f0b7f8056dcb51476a6515a8601c9d6374aa2
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe static-call-null-3
        git checkout 999f0b7f8056dcb51476a6515a8601c9d6374aa2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/ kernel/events/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110734.cvRB3UtN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/irq.c:223:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   DEFINE_STATIC_CALL_RET0(ppc_get_irq, *ppc_md.get_irq);
   ^
   include/linux/static_call.h:212:33: note: expanded from macro 'DEFINE_STATIC_CALL_RET0'
   #define DEFINE_STATIC_CALL_RET0 DEFINE_STATIC_CALL_NULL
                                   ^
   include/linux/static_call.h:210:2: note: expanded from macro 'DEFINE_STATIC_CALL_NULL'
           ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
           ^
>> arch/powerpc/kernel/irq.c:223:25: error: a parameter list without types is only allowed in a function definition
   DEFINE_STATIC_CALL_RET0(ppc_get_irq, *ppc_md.get_irq);
                           ^
   include/linux/static_call.h:212:33: note: expanded from macro 'DEFINE_STATIC_CALL_RET0'
   #define DEFINE_STATIC_CALL_RET0 DEFINE_STATIC_CALL_NULL
                                   ^
   2 errors generated.
--
>> kernel/events/core.c:13769:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   DEFINE_STATIC_CALL_RET0(perf_snapshot_branch_stack, perf_snapshot_branch_stack_t);
   ^
   include/linux/static_call.h:212:33: note: expanded from macro 'DEFINE_STATIC_CALL_RET0'
   #define DEFINE_STATIC_CALL_RET0 DEFINE_STATIC_CALL_NULL
                                   ^
   include/linux/static_call.h:210:2: note: expanded from macro 'DEFINE_STATIC_CALL_NULL'
           ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
           ^
>> kernel/events/core.c:13769:25: error: a parameter list without types is only allowed in a function definition
   DEFINE_STATIC_CALL_RET0(perf_snapshot_branch_stack, perf_snapshot_branch_stack_t);
                           ^
   include/linux/static_call.h:212:33: note: expanded from macro 'DEFINE_STATIC_CALL_RET0'
   #define DEFINE_STATIC_CALL_RET0 DEFINE_STATIC_CALL_NULL
                                   ^
   2 errors generated.


vim +/int +223 arch/powerpc/kernel/irq.c

48cf12d88969bd Christophe Leroy 2021-03-19  222  
e59596a2d6a75e Christophe Leroy 2022-03-11 @223  DEFINE_STATIC_CALL_RET0(ppc_get_irq, *ppc_md.get_irq);
e59596a2d6a75e Christophe Leroy 2022-03-11  224  

:::::: The code at line 223 was first introduced by commit
:::::: e59596a2d6a75ea3deb60698b95942aaf03681f5 powerpc: Use static call for get_irq()

:::::: TO: Christophe Leroy <christophe.leroy@csgroup.eu>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
