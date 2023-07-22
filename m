Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627A611C9D;
	Sat, 22 Jul 2023 09:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690017262; x=1721553262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hj6cC6dJ4jnH2yWwR8JNgdbMCVAWXaApzz1QuQw6Viw=;
  b=apiok+pdsL/LzlAfqYtTG0iqGRSoluJKjNRe31Y1LONXYrnQY2DyBDR6
   lohyiQojj09sNBlN5AYoQf5w29lK/sGPwmlHCSrmKQENK6ofJvxuXVv4X
   +OrzBxq8c0ix8h/laRInb3Nte96VLEetVX8PM+8ne4t4bC++QpRHmhflQ
   gJQggQR7m45V9KysQ5H4WaCqC+YI+gQnpv2m1EE8GEikAZjgkRsZF3BgZ
   qHPRbGcCkQ37pJlu1u554e5zowZeEFtcAo0CwKi3M1vOIvuQBSaY5o/NG
   u+/VMEeMSfDNKgvuUf3Aj9+abx3ZM/2mNMwZuTdaXKSCoM/sMmY53GGWL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="369846587"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="369846587"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 02:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="815284723"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="815284723"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Jul 2023 02:14:20 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN8gt-0008CX-20;
	Sat, 22 Jul 2023 09:14:19 +0000
Date: Sat, 22 Jul 2023 17:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 5/42]
 arch/riscv/kernel/setup.c:285:13: warning: no previous prototype for
 function 'combo_spin_lock_init'
Message-ID: <202307221749.i3zgUarh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   7f9f76d36814ed6fcbca4c27a5d2ec3724c46add
commit: f1f72f77c9e8cc273bfb44cb928f5787abe50cd8 [5/42] riscv: Add combo spinlock support
config: riscv-randconfig-r042-20230720 (https://download.01.org/0day-ci/archive/20230722/202307221749.i3zgUarh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221749.i3zgUarh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307221749.i3zgUarh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/setup.c:285:13: warning: no previous prototype for function 'combo_spin_lock_init' [-Wmissing-prototypes]
     285 | void __init combo_spin_lock_init(void)
         |             ^
   arch/riscv/kernel/setup.c:285:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     285 | void __init combo_spin_lock_init(void)
         | ^
         | static 
   1 warning generated.


vim +/combo_spin_lock_init +285 arch/riscv/kernel/setup.c

   270	
   271	void __init combo_spin_lock_init(void)
   272	{
   273		asm_volatile_goto(ALTERNATIVE(
   274			"j %l[l_dis]",
   275			"nop",
   276			THEAD_VENDOR_ID,
   277			ERRATA_THEAD_QSPINLOCK,
   278			CONFIG_ERRATA_THEAD_QSPINLOCK)
   279			: : : : l_dis);
   280		return;
   281	l_dis:
   282		static_branch_disable(&qspinlock_key);
   283	}
   284	#else
 > 285	void __init combo_spin_lock_init(void)
   286	{
   287		return;
   288	}
   289	#endif
   290	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
