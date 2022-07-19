Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C43E2F59
	for <llvm@lists.linux.dev>; Tue, 19 Jul 2022 20:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658263774; x=1689799774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1FETl9/GOw92C0K59SvpN3kdI7uId9kecaBzsARiyjw=;
  b=MSEgzVDZx2EtzMEcb/wzjniNKvabbmLFLT5rpMVjk3lkcCxZqy/itOx+
   TFXZJAfbx6+onI/PQiuabaEKZVHVU8lCr3TGJZiE5oyDUh1hjcCLftXaf
   3vPnJ/Z+eGJPEVKviZpEZhtFhV9E3VUH2i+FHZqfZ96aThd6oA8KWi1Lf
   SltvjHHVJmFMXimBpbI+YQDPNm7Q9X3KNXgXTkIxhrsY/KsQm7izYe2qj
   gtE4uhbDKlASt8U8o3I3AxJmg1/gtIB/PQCkRNDf39gwoAzfYtu2/B7vS
   j/3poP/1xFHvX/9MpDKy3E8WTfDcJLiboNEbxDUZ9ANFJInwImPWAqJFx
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="266996318"
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="266996318"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 13:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="625349135"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 19 Jul 2022 13:49:31 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDu9r-00062d-1P;
	Tue, 19 Jul 2022 20:49:31 +0000
Date: Wed, 20 Jul 2022 04:49:14 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: arch/arm/mach-versatile/versatile.c:56:14: warning: no previous
 prototype for function 'mmc_status'
Message-ID: <202207200433.KqmAK60e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ca85855bdcae8f84f1512e88b4c75009ea17ea2f
commit: d7445676e86900f8dc363825033ff62416c216e0 ARM: versatile: move integrator/realview/vexpress to versatile
date:   4 months ago
config: arm-versatile_defconfig (https://download.01.org/0day-ci/archive/20220720/202207200433.KqmAK60e-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fa0c7639e91fa1cd0cf2ff0445a1634a90fe850a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d7445676e86900f8dc363825033ff62416c216e0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d7445676e86900f8dc363825033ff62416c216e0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-versatile/versatile.c:56:14: warning: no previous prototype for function 'mmc_status' [-Wmissing-prototypes]
   unsigned int mmc_status(struct device *dev)
                ^
   arch/arm/mach-versatile/versatile.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned int mmc_status(struct device *dev)
   ^
   static 
   1 warning generated.


vim +/mmc_status +56 arch/arm/mach-versatile/versatile.c

a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  55  
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08 @56  unsigned int mmc_status(struct device *dev)
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  57  {
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  58  	struct amba_device *adev = container_of(dev, struct amba_device, dev);
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  59  	u32 mask;
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  60  
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  61  	if (adev->res.start == VERSATILE_MMCI0_BASE)
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  62  		mask = 1;
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  63  	else
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  64  		mask = 2;
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  65  
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  66  	return readl(versatile_sys_base + VERSATILE_SYS_MCI_OFFSET) & mask;
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  67  }
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  68  

:::::: The code at line 56 was first introduced by commit
:::::: a70967892111934e292485ce84f1bab38cc55380 ARM: versatile: merge mach code into a single file

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
