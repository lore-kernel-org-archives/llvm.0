Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20A13D89
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 20:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657313409; x=1688849409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f4+Pv6ztoVQxNmpihMiCo2tCWAEketMWZRexCM0xWHU=;
  b=ItVIkoN6kZ3S1XaS/P2cJXwMr6Hjfg8tEjLQFvNPTwsiJdF3Ms68HGN3
   in1EV7fVmkKILd8755+cvM/T8uBbUiBVgiyla09JBdonu0WclKWZrqe2K
   rUxtoQoJwbODGTRctFwBao2KeAGWJ9QsgacEr9cGz0pJybgWhN2vd8ISq
   2C4Qq4qa8BkedjbhD8Co1oz5zc8P3WcWiQmY+azIWVD9O54qIEboQbUf/
   CVaGS3qkdZWdxIDsPwhsgsmrzZrQjmHBylQS2hvpKYoomxkv814alPuko
   5myer5UnyZ2+2vc6NwzgEYJoYY7B2YQHIzjXrAHEb+rAaXj5WzDwT+Oqr
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="370675775"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="370675775"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 13:50:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="921120227"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Jul 2022 13:50:07 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9uvP-000NvK-5D;
	Fri, 08 Jul 2022 20:50:07 +0000
Date: Sat, 9 Jul 2022 04:49:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [tip:locking/core 2/4] arch/mips/kernel/jump_label.c:93:6: warning:
 no previous prototype for function 'jump_label_apply_nops'
Message-ID: <202207090424.PgjCetK5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ard,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   eae6d58d67d9739be5f7ae2dbead1d0ef6528243
commit: fdfd42892f311e2b3695852036e5be23661dc590 [2/4] jump_label: mips: move module NOP patching into arch code
config: mips-randconfig-r035-20220708 (https://download.01.org/0day-ci/archive/20220709/202207090424.PgjCetK5-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 562c3467a6738aa89203f72fc1d1343e5baadf3c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=fdfd42892f311e2b3695852036e5be23661dc590
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip locking/core
        git checkout fdfd42892f311e2b3695852036e5be23661dc590
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/kernel/ fs/ksmbd/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/mips/kernel/jump_label.c:93:6: warning: no previous prototype for function 'jump_label_apply_nops' [-Wmissing-prototypes]
   void jump_label_apply_nops(struct module *mod)
        ^
   arch/mips/kernel/jump_label.c:93:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void jump_label_apply_nops(struct module *mod)
   ^
   static 
   1 warning generated.


vim +/jump_label_apply_nops +93 arch/mips/kernel/jump_label.c

    91	
    92	#ifdef CONFIG_MODULES
  > 93	void jump_label_apply_nops(struct module *mod)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
