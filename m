Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1242F2D
	for <llvm@lists.linux.dev>; Thu, 22 Sep 2022 11:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663846046; x=1695382046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FgJ9nNz/vzLaS4WX2fhDFxkYknwbFT4sEjE+pFd9WeI=;
  b=TZMZm/rWA5F7VPrQ+Mddjl/EPakB/T3A6x7AMFXtao9ft2G145QhEkf8
   ylVJDAHFI49k01x8VZbsdIML/XK8g9IWrjRdCJ7xpIX3fCxJ8EffoU3Y1
   XP+KaZRRl0inD9bK1sxTQxIqwKHP+0YW83ekf9HQAU8FKzpau+/X3tF6z
   0ebtAKtZS2QPShhyMvtFJDo5c7XMR+eHcs9xeqN0YA3DB7ZYwio4Sff0N
   7fJUI/7Fw4g5W0c7LyJlEdxjD1fggmh7Fh/4EGG4WNOueTdGsb7XyL0Tx
   hVaNusajC/5sNL7cKJJ8bSXPqcMyZ5KTfsvRsI5obKYTBdhJD2LeVyjbE
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="386558775"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="386558775"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 04:27:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="652932094"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Sep 2022 04:27:22 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obKMU-0004eg-09;
	Thu, 22 Sep 2022 11:27:22 +0000
Date: Thu, 22 Sep 2022 19:26:59 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [ammarfaizi2-block:arm64/linux/for-next/alternatives 7/9]
 arch/arm64/include/asm/alternative-macros.h:224:2: error: call to undeclared
 function 'BUILD_BUG_ON'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202209221916.DuPaZviq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block arm64/linux/for-next/alternatives
head:   0072dc1b53c39fb7c4cfc5c9e5d5a30622198613
commit: 21fb26bfb01ffe0d9a9a967ffe061092128bbffe [7/9] arm64: alternatives: add alternative_has_feature_*()
config: arm64-buildonly-randconfig-r006-20220921 (https://download.01.org/0day-ci/archive/20220922/202209221916.DuPaZviq-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/21fb26bfb01ffe0d9a9a967ffe061092128bbffe
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block arm64/linux/for-next/alternatives
        git checkout 21fb26bfb01ffe0d9a9a967ffe061092128bbffe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the ammarfaizi2-block/arm64/linux/for-next/alternatives HEAD 0072dc1b53c39fb7c4cfc5c9e5d5a30622198613 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from kernel/bounds.c:10:
   In file included from include/linux/page-flags.h:10:
   In file included from include/linux/bug.h:5:
   In file included from arch/arm64/include/asm/bug.h:26:
   In file included from include/asm-generic/bug.h:5:
   In file included from include/linux/compiler.h:248:
   In file included from arch/arm64/include/asm/rwonce.h:11:
>> arch/arm64/include/asm/alternative-macros.h:224:2: error: call to undeclared function 'BUILD_BUG_ON'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           BUILD_BUG_ON(feature >= ARM64_NCAPS);
           ^
   arch/arm64/include/asm/alternative-macros.h:241:2: error: call to undeclared function 'BUILD_BUG_ON'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           BUILD_BUG_ON(feature >= ARM64_NCAPS);
           ^
   2 errors generated.
   make[2]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1205: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:222: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/BUILD_BUG_ON +224 arch/arm64/include/asm/alternative-macros.h

   220	
   221	static __always_inline bool
   222	alternative_has_feature_likely(unsigned long feature)
   223	{
 > 224		BUILD_BUG_ON(feature >= ARM64_NCAPS);
   225	
   226		asm_volatile_goto(
   227		ALTERNATIVE("b	%l[l_no]", "nop", %[feature])
   228		:
   229		: [feature] "i" (feature)
   230		:
   231		: l_no);
   232	
   233		return true;
   234	l_no:
   235		return false;
   236	}
   237	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
