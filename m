Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC0420E4
	for <llvm@lists.linux.dev>; Wed,  1 Jun 2022 13:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654090686; x=1685626686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JR5obCoehj3ulyaBpP75i60De/pEvORZKnoggn39DHk=;
  b=jYXliTdO51qKkVtLSZAYFaYs//la87Z+OBzi5TFoW1v0RdQ7l0jsREOB
   Fp+vHourCwrcEpU/YdYcpwCThPMKZHQfFdsE7Zc7V5wqSRgoE16KjLy6Q
   jJz2v1wy+V80z+ez3DgUS75bF/TJGihY5n3798aDINgblEx98XSXgD8cl
   8FtVmA55iHwA/Yhs7ekDSrAQeacVOWmHf6oXHzWFRwCWXYkom56DwS05H
   d+h4OMhJ8UcIQEq/haPtVZwfHQH3rjCSe/1iRnSgcPr4XDzpvOw+FLIw9
   RZMIvpjADu7tqDgYBSTzeOEOT3L/1Y5upg1DwC9dAzzJWD2iCHVAz8SJW
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="275668673"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="275668673"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 06:38:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="562800373"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Jun 2022 06:38:03 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwOXz-00041u-07;
	Wed, 01 Jun 2022 13:38:03 +0000
Date: Wed, 1 Jun 2022 21:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Collingbourne <pcc@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: arch/arm64/kernel/mte.c:197:13: warning: no previous prototype for
 function 'kasan_hw_tags_enable'
Message-ID: <202206012143.S2fcThHk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   700170bf6b4d773e328fa54ebb70ba444007c702
commit: e5af50a5df571c1d0268b02f924de49b742c990f arm64: kasan: mte: move GCR_EL1 switch to task switch when KASAN disabled
date:   8 months ago
config: arm64-buildonly-randconfig-r001-20220531 (https://download.01.org/0day-ci/archive/20220601/202206012143.S2fcThHk-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e5af50a5df571c1d0268b02f924de49b742c990f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e5af50a5df571c1d0268b02f924de49b742c990f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/mte.c:197:13: warning: no previous prototype for function 'kasan_hw_tags_enable' [-Wmissing-prototypes]
   void __init kasan_hw_tags_enable(struct alt_instr *alt, __le32 *origptr,
               ^
   arch/arm64/kernel/mte.c:197:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init kasan_hw_tags_enable(struct alt_instr *alt, __le32 *origptr,
   ^
   static 
   arch/arm64/kernel/mte.c:103:20: warning: unused function '__mte_enable_kernel' [-Wunused-function]
   static inline void __mte_enable_kernel(const char *mode, unsigned long tcf)
                      ^
   2 warnings generated.


vim +/kasan_hw_tags_enable +197 arch/arm64/kernel/mte.c

   196	
 > 197	void __init kasan_hw_tags_enable(struct alt_instr *alt, __le32 *origptr,
   198					 __le32 *updptr, int nr_inst)
   199	{
   200		BUG_ON(nr_inst != 1); /* Branch -> NOP */
   201	
   202		if (kasan_hw_tags_enabled())
   203			*updptr = cpu_to_le32(aarch64_insn_gen_nop());
   204	}
   205	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
