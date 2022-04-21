Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C181FA1
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 06:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650523312; x=1682059312;
  h=date:from:cc:subject:message-id:mime-version;
  bh=0c255BImuwKNF/eKBJ/CCAtU1wPEN7xQouRT2+bb6m4=;
  b=l07fIWVefDCSUeLtolf0L6odnlNnUU+CBKbObDPb5IyqAxmVEh0TdyO3
   v60CqM5Wl149f8fwo1MYzLuRtTMZ7F+KodR+ldceUSPPorXHJdgkSiyvm
   qHj0ebLKcb9zz+DsZ2eymkHCE7jZ+HUXnRiMFs/R+dqrGaws+CLUNq9Kx
   u1h3lpLmPfkmbnRtPE1JpDMjN40nqrklL0H4OLqHnhshv6aQtXmST5tdq
   380WIE7XpzQwczLghsrykyrkG24tDl115dbAuS+nX602afZqqeipeKpBF
   PUbBnkB1+a3ET7rBa6ubxfuR9DG5v1NLMsSly71bHIYlOwg3rEj1ttne/
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="263722467"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="263722467"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 23:41:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="562448347"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Apr 2022 23:41:50 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhQVi-0007yp-1C;
	Thu, 21 Apr 2022 06:41:50 +0000
Date: Thu, 21 Apr 2022 14:41:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [geert-renesas-drivers:renesas-pinctrl-for-v5.19 5/11] ld.lld:
 error: arch/riscv/built-in.a(kernel/process.o):(function __show_regs:
 .text+0x28): relocation R_RISCV_HI20 out of range: 528134 is not in
 [-524288, 524287]; references .L.str
Message-ID: <202204202322.TtcAPEKU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-renesas-soc@vger.kernel.org
TO: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: LUU HOAI <hoai.luu.ub@renesas.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v5.19
head:   f7bc5f52d2354b41d5a111942be7ee01e5560c78
commit: 843394c61e9a71f0fb340a08b28cb42695baa929 [5/11] pinctrl: renesas: r8a77990: Add drive-strength
config: riscv-randconfig-r025-20220420 (https://download.01.org/0day-ci/archive/20220420/202204202322.TtcAPEKU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=843394c61e9a71f0fb340a08b28cb42695baa929
        git remote add geert-renesas-drivers https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
        git fetch --no-tags geert-renesas-drivers renesas-pinctrl-for-v5.19
        git checkout 843394c61e9a71f0fb340a08b28cb42695baa929
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/riscv/built-in.a(kernel/process.o):(function __show_regs: .text+0x28): relocation R_RISCV_HI20 out of range: 528134 is not in [-524288, 524287]; references .L.str
   >>> referenced by process.c
   >>> defined in arch/riscv/built-in.a(kernel/process.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
