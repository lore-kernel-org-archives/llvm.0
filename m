Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E428B38F93;
	Thu,  9 Nov 2023 21:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kcw5ttAP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699566884; x=1731102884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=07ykyJfI1LwBywrQnp2qHRxF0kgTfQLvRSM5cXuuSX0=;
  b=Kcw5ttAPLgUL4nDSnVf8q6gYq/hkeicR1+d89fVAKXZpnopGNcyNUFbL
   cql3K6L9jnVec0RtkIPmLzoQgHB0X92M3UtJXb+Ao2ydt3MXDDIyIRoT+
   H7uregvpTi8+XrV3CxA/52LUdWRfv8O83z2VmfeYsQiALLCLbNm35SigO
   25J2QGVMq28vOAfg9KDlpRg7mb1VQ79bkDfPo/CofaId9zx4Vx6KrtCma
   xyHK0sbTwckUrnt0bzl8/kdiTkmjpwnShhoWn47PH1pWYmJqK3p0M8rL2
   XTPldqXAN1166WwPZ0RydZmILncTxJGtKBQHnc3rgs4/DG8ZdqDS1mddh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="393989044"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="393989044"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 13:54:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="833974434"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="833974434"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2023 13:54:38 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Cyy-0009Bp-1h;
	Thu, 09 Nov 2023 21:54:36 +0000
Date: Fri, 10 Nov 2023 05:53:57 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 9/10] kernel/unwind/user.c:12:2: warning: implicit
 conversion from 'unsigned long' to 's32' (aka 'int') changes value from
 18446744073709551600 to -16
Message-ID: <202311100530.pjdNYUBV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   ec004e900e02c9c85cf8c89d4c26d4168a6c5d18
commit: 09460e60dd1c2f8ea1abb8d9188195db699ce76f [9/10] unwind: Introduce SFrame user space unwinding
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231110/202311100530.pjdNYUBV-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100530.pjdNYUBV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100530.pjdNYUBV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/unwind/user.c:12:2: warning: implicit conversion from 'unsigned long' to 's32' (aka 'int') changes value from 18446744073709551600 to -16 [-Wconstant-conversion]
           ARCH_INIT_USER_FP_FRAME
           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/user_unwind.h:8:26: note: expanded from macro 'ARCH_INIT_USER_FP_FRAME'
           .fp_off         = sizeof(long) * -2,                            \
                             ~~~~~~~~~~~~~^~~~
   kernel/unwind/user.c:12:2: warning: implicit conversion from 'unsigned long' to 's32' (aka 'int') changes value from 18446744073709551608 to -8 [-Wconstant-conversion]
           ARCH_INIT_USER_FP_FRAME
           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/user_unwind.h:6:26: note: expanded from macro 'ARCH_INIT_USER_FP_FRAME'
           .ra_off         = sizeof(long) * -1,                            \
                             ~~~~~~~~~~~~~^~~~
   2 warnings generated.


vim +12 kernel/unwind/user.c

bd5cff471e67cf Josh Poimboeuf 2023-11-07  10  
bd5cff471e67cf Josh Poimboeuf 2023-11-07  11  static struct user_unwind_frame fp_frame = {
bd5cff471e67cf Josh Poimboeuf 2023-11-07 @12  	ARCH_INIT_USER_FP_FRAME
bd5cff471e67cf Josh Poimboeuf 2023-11-07  13  };
bd5cff471e67cf Josh Poimboeuf 2023-11-07  14  

:::::: The code at line 12 was first introduced by commit
:::::: bd5cff471e67cf8d2b2d3bd8db35007ccc86f6a4 unwind: Introduce generic user space unwinding interfaces

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
