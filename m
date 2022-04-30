Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAEC7B
	for <llvm@lists.linux.dev>; Sat, 30 Apr 2022 01:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651282712; x=1682818712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AdNqjN2aPR9DTlrBrCsJSY4O3w+eaIoczFhTKfpPs48=;
  b=Tf74/qnMCnuQ2+XR77FTs+6FON3LPGI9XoHbAvnY5DAcBugx510SuhM3
   KsgM5Ihlb3fw+NePyIsiyricwH9IKAp1Of/UaT7imBni20nh5AMe6K1gC
   bF8VXf+3Lp9zl5bbdrDVpWUFv9ojY5rbYPzhkWlw+j6pIb9nwTwAROZEF
   8fNakFNPEZGvf4dYQkLqeXm80bs/Pgk+AHOkNsrr2EO665kWqu3thkXDG
   xgdpi8gs9/99DMnOe358hXjW0Wj/xH68dqix3cxf1jkiXMrP+1giqY2rk
   RwFlPvrEOw/UzcJTtVL0Y2Fiqx2hKx8PmsB9U4gnNvyZUdac9XiNbFelC
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10332"; a="327317173"
X-IronPort-AV: E=Sophos;i="5.91,187,1647327600"; 
   d="scan'208";a="327317173"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2022 18:38:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,187,1647327600"; 
   d="scan'208";a="882066061"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Apr 2022 18:38:29 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nkc44-0006lV-QX;
	Sat, 30 Apr 2022 01:38:28 +0000
Date: Sat, 30 Apr 2022 09:38:14 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Huckleberry <nhuck@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v5 7/8] crypto: arm64/polyval: Add PMULL accelerated
 implementation of POLYVAL
Message-ID: <202204300918.SdgoNFfx-lkp@intel.com>
References: <20220427003759.1115361-8-nhuck@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427003759.1115361-8-nhuck@google.com>

Hi Nathan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master linus/master v5.18-rc4 next-20220429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Huckleberry/crypto-HCTR2-support/20220427-084044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220430/202204300918.SdgoNFfx-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473aacce38cd7dd77eebceaf3c98c5707ab3b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/3d3f8a04f4735ce4fc1a9b59cd6fa091e11a35c3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nathan-Huckleberry/crypto-HCTR2-support/20220427-084044
        git checkout 3d3f8a04f4735ce4fc1a9b59cd6fa091e11a35c3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm64/crypto/polyval-ce-glue.c:188:1: error: redefinition of '__inittest'
   module_init(polyval_ce_mod_init);
   ^
   include/linux/module.h:131:42: note: expanded from macro 'module_init'
           static inline initcall_t __maybe_unused __inittest(void)                \
                                                   ^
   arch/arm64/crypto/polyval-ce-glue.c:186:1: note: previous definition is here
   module_cpu_feature_match(PMULL, polyval_ce_mod_init)
   ^
   include/linux/cpufeature.h:54:10: note: expanded from macro 'module_cpu_feature_match'
   }                                                               \
                                                                   ^
   include/linux/module.h:131:42: note: expanded from macro '\
   module_init'
           static inline initcall_t __maybe_unused __inittest(void)                \
                                                   ^
>> arch/arm64/crypto/polyval-ce-glue.c:188:1: error: redefinition of 'init_module'
   module_init(polyval_ce_mod_init);
   ^
   include/linux/module.h:133:6: note: expanded from macro 'module_init'
           int init_module(void) __copy(initfn)                    \
               ^
   arch/arm64/crypto/polyval-ce-glue.c:186:1: note: previous definition is here
   module_cpu_feature_match(PMULL, polyval_ce_mod_init)
   ^
   include/linux/cpufeature.h:54:10: note: expanded from macro 'module_cpu_feature_match'
   }                                                               \
                                                                   ^
   include/linux/module.h:133:6: note: expanded from macro '\
   module_init'
           int init_module(void) __copy(initfn)                    \
               ^
   2 errors generated.


vim +/__inittest +188 arch/arm64/crypto/polyval-ce-glue.c

   187	
 > 188	module_init(polyval_ce_mod_init);
   189	module_exit(polyval_ce_mod_exit);
   190	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
