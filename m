Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CAF17D3
	for <llvm@lists.linux.dev>; Tue,  5 Apr 2022 12:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649161212; x=1680697212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ONDmzJmB0fxAYiOE5GDJFF/DWkwTo0kGZnNYvLqpM+U=;
  b=fhoQuQePa/CzYP6BNFS3XT34UfjBrJk7rCJTJKE2ggiwwvSe4DZgHs0J
   IbrdWdBDjziln1jgnez3lLMzr4T+e6NUdv3CtjsYaX7qq/U17pxqf8Uf6
   +K8yC5Lj57YtI1CfMqZNCha6b94IvDpDXkSXK5a+hzWU5q/U1XJ8JKM8w
   LHKbAaGg7ZL6dMe293f33ZM/pPKzHpvyafmmG4b7mvT9IsOMjNaM4ZCem
   UxNUZaJB+16FNq4teDiQr6Z3a8+d60kfAjMEDuuQPMOPT21OqlGldL9rb
   m4Bl+UJj0BkmG9hCjnSrTZkZEcrKMJbauo97I4ORMg7bvoSJ7GYKkGXDT
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="321429521"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; 
   d="scan'208";a="321429521"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 05:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; 
   d="scan'208";a="587911269"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Apr 2022 05:20:10 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nbiAM-0003EC-27;
	Tue, 05 Apr 2022 12:20:10 +0000
Date: Tue, 5 Apr 2022 20:19:14 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:multiplatform-misc-5.18 12/13]
 arch/arm/mach-orion/board-d2net.c:102:13: warning: no previous prototype for
 function 'd2net_init'
Message-ID: <202204052037.UnjBcCI3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git multiplatform-misc-5.18
head:   a2677c00b0f03b8cad961f785941ca257f454df3
commit: 4e61a655e496f6225a146264a3dbc94c790870a6 [12/13] ARM: orion/mv78xx0/dove: move to a common directory
config: arm-mvebu_v5_defconfig (https://download.01.org/0day-ci/archive/20220405/202204052037.UnjBcCI3-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=4e61a655e496f6225a146264a3dbc94c790870a6
        git remote add soc https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
        git fetch --no-tags soc multiplatform-misc-5.18
        git checkout 4e61a655e496f6225a146264a3dbc94c790870a6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-orion/board-d2net.c:102:13: warning: no previous prototype for function 'd2net_init' [-Wmissing-prototypes]
   void __init d2net_init(void)
               ^
   arch/arm/mach-orion/board-d2net.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init d2net_init(void)
   ^
   static 
   1 warning generated.


vim +/d2net_init +102 arch/arm/mach-orion/board-d2net.c

94b0bd366e3637 arch/arm/mach-orion5x/board-d2net.c Thomas Petazzoni 2014-04-22   97  
94b0bd366e3637 arch/arm/mach-orion5x/board-d2net.c Thomas Petazzoni 2014-04-22   98  /*****************************************************************************
94b0bd366e3637 arch/arm/mach-orion5x/board-d2net.c Thomas Petazzoni 2014-04-22   99   * General Setup
94b0bd366e3637 arch/arm/mach-orion5x/board-d2net.c Thomas Petazzoni 2014-04-22  100   ****************************************************************************/
94b0bd366e3637 arch/arm/mach-orion5x/board-d2net.c Thomas Petazzoni 2014-04-22  101  
94b0bd366e3637 arch/arm/mach-orion5x/board-d2net.c Thomas Petazzoni 2014-04-22 @102  void __init d2net_init(void)

:::::: The code at line 102 was first introduced by commit
:::::: 94b0bd366e36379c994bdaa84f18355702212eb4 ARM: orion5x: convert d2net to Device Tree

:::::: TO: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
:::::: CC: Jason Cooper <jason@lakedaemon.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
