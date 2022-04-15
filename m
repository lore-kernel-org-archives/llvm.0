Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B988633D6
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 19:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650052111; x=1681588111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ybWQ9vXTjXyctd0VE3AvZjUJhWeYRenZUC7U2hsPbQ=;
  b=IhWm4V17b1oC6VD59zwrMXKgRdRnbJxhGZeq8YQeUeq/syRJoCGtlE/k
   NJT93cOjp4EEeelzci1dqB/xZheJHhxWEO278FOfFUAq72CpHtI2cId7e
   vjfaSpbjeY7qQaWpJUpYy47MrS4cOlCFcpHDroITQ4JHJsETeNTBcWoTt
   IZ45vwEDyuT2kTas8zvlEqcGW4asRPJ028iwT32RrS6pJo15vNSusxcKG
   8f5uMoApz/4x5aUwVWOraOOEcCf+xfWHBr1EHyoN51qC9l/0EHgi3xb0F
   2qbXaJwszU6YutydEXEOzZRlO3yEiuOocRVOt0D42PIUyl2ME3+waz3SR
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="262974795"
X-IronPort-AV: E=Sophos;i="5.90,263,1643702400"; 
   d="scan'208";a="262974795"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 12:48:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,263,1643702400"; 
   d="scan'208";a="591737485"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Apr 2022 12:48:30 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nfRvh-0002KX-AV;
	Fri, 15 Apr 2022 19:48:29 +0000
Date: Sat, 16 Apr 2022 03:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:cex7 151/154] ERROR: Input tree has errors, aborting (use -f to
 force output)
Message-ID: <202204160340.3VtMHUZ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git cex7
head:   ceb9c4a67bf5af34dd9e4809b3fc581562772f2a
commit: 6ed5eed0063857d895c002a4a0f6753ad30fd801 [151/154] arm64: dts: lx2160a: add optee support             [*experimental*]
config: arm64-randconfig-r035-20220415 (https://download.01.org/0day-ci/archive/20220416/202204160340.3VtMHUZ9-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add arm git://git.armlinux.org.uk/~rmk/linux-arm.git
        git fetch --no-tags arm cex7
        git checkout 6ed5eed0063857d895c002a4a0f6753ad30fd801
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1765.11-1771.4: ERROR (duplicate_node_names): /firmware: Duplicate node name
>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
