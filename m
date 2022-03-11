Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C259B2574
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 20:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647032109; x=1678568109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Eft7ilMFBTtn33WKAneo4xUPJ38xQRQ0vY+nWyGwX7A=;
  b=cKQxzuElJZMP2p7KgbKdW9+KfywrmH5wYSmTD+KeMM43NWQ9qmn35r+V
   18P5G2qIuswlaHuRtUbdsCkyIUMtpn53CTm5ApSXa/AbkSH4WVYCWCfwb
   f12YGeXeD7ftvm5pKF0Ww8gp7UmHKJuUi7aETDiQza5R3EfN9bgoORzZ3
   1IWzrBQ1TLVXafx9OQTjgIAUJag/K7z5ZVaOgSGvYrsoqS0jcLo0n19eT
   nrU5UEsYBmiOPJLHUhhjTBqKny7SpCtxmgnawCtOpmvYe+bTihLhp073l
   t9oHt3lrPwb4K59h6ZSVc0Jfk6jbYUoB4WusSiussnNPrnx2iRz58Sg6x
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="280397438"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="280397438"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 12:55:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="514633839"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 11 Mar 2022 12:55:06 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSmHy-00075B-56; Fri, 11 Mar 2022 20:55:06 +0000
Date: Sat, 12 Mar 2022 04:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Collingbourne <pcc@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: arch/arm64/kernel/mte.c:197:13: warning: no previous prototype for
 function 'kasan_hw_tags_enable'
Message-ID: <202203120429.Fx8bkRdV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   79b00034e9dcd2b065c1665c8b42f62b6b80a9be
commit: e5af50a5df571c1d0268b02f924de49b742c990f arm64: kasan: mte: move GCR_EL1 switch to task switch when KASAN disabled
date:   5 months ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220312/202203120429.Fx8bkRdV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e5af50a5df571c1d0268b02f924de49b742c990f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e5af50a5df571c1d0268b02f924de49b742c990f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/ drivers/gpu/drm/tegra/ drivers/usb/host/ kernel/debug/kdb/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

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

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
