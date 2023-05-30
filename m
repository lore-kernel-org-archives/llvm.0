Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE018946C;
	Tue, 30 May 2023 07:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685430755; x=1716966755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ccZ8LsN6vN2OJ0qMDf9L2Qnjm2Qgq5dauLEmP547ho=;
  b=j1EXaxR9Q6b/v4EuM84Skb2NMs1Ufh7AKcCj3MKbpoB96CzokNjtjbCu
   pvtmFpBfbA34Oo/pm5GpHiXNwkNe2kg7pAQ1KcXOHm+1ybzMAfcB+/Xc5
   FWcoJbkmOjP1/c1TOJ3eBfcIZHKr7otANf9S2iz+0jPhKgOl8G1VCJuyN
   kKfo/JNqUkJrYm7Q5L2HtJvFwdC0bTeRVzV5c+ovVOOAOEVJVFR0R1rN9
   JNRC6bOG1VHObjk6B6fmwGRTMGwXWI7Wg38jttmKrLEXriSoClM7bIrhG
   jF8p5eZc3V1mTh5fLkbjHMSfDpH4mKKnFW7tG5Yybk83LXzxQtSg6K9cG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="441192123"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="441192123"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 00:12:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="683833041"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="683833041"
Received: from lkp-server01.sh.intel.com (HELO fd90924b3b99) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 May 2023 00:12:12 -0700
Received: from kbuild by fd90924b3b99 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3tWe-0000Bd-0L;
	Tue, 30 May 2023 07:12:12 +0000
Date: Tue, 30 May 2023 15:11:22 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Shixin <liushixin2@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Will Deacon <will@kernel.org>
Subject: [stable:linux-6.1.y 1681/6252]
 arch/arm64/include/asm/pgtable.h:871:44: error: call to undeclared function
 'pud_user_exec'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202305301536.JbenGcsI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
head:   a343b0dd87b42ba9d508fbf7d0c06f744c2e0954
commit: a006aaffd78ff70efcffa44e325633c0840b2bf2 [1681/6252] arm64/mm: add pud_user_exec() check in pud_user_accessible_page()
config: arm64-randconfig-r036-20230530 (https://download.01.org/0day-ci/archive/20230530/202305301536.JbenGcsI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=a006aaffd78ff70efcffa44e325633c0840b2bf2
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-6.1.y
        git checkout a006aaffd78ff70efcffa44e325633c0840b2bf2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305301536.JbenGcsI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:12:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/crash_core.h:6:
   In file included from include/linux/elfcore.h:11:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
>> arch/arm64/include/asm/pgtable.h:871:44: error: call to undeclared function 'pud_user_exec'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
                                                     ^
   1 error generated.
   make[2]: *** [scripts/Makefile.build:118: arch/arm64/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1270: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:231: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/pud_user_exec +871 arch/arm64/include/asm/pgtable.h

   868	
   869	static inline bool pud_user_accessible_page(pud_t pud)
   870	{
 > 871		return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
   872	}
   873	#endif
   874	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
