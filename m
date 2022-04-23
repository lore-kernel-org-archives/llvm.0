Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D362A17C8
	for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 18:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650739417; x=1682275417;
  h=date:from:cc:subject:message-id:mime-version;
  bh=cM0xIaCRGWeUzj2QR+AG4HOGgzKe39zITQhz8NInd8s=;
  b=lYRkT2HDRrfvbBLUA/DrP7r40PTIqg6kGmiZtH+m80fG8R2byMoO7EjX
   buz1yOSL9R9O/QxUW8Xop4BMNlMHEe1zwJ7lqKeVY92P2IBeJFCEAE2lP
   d8y+TPbU6RbDJXLTorutPWcky7bBnfL7aAOptRDiu0iSnWADpVoo8Fqtg
   Vqa9kXxFQbvxaQQZYddoX1lZdcAPLw2g+roBYKdm54xkbkxdA/t8N3nTT
   1EiZam6Xf4PBeJGTqDRitOb1Sza4idLvrx4WOKl3U6IHMb6hgbjPKDQQo
   KD8sCR006Z2VZ4yXmXZ32PllL97JwKV3hfWLBWc2OwwS0iDubKs0FNvJn
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10326"; a="244865741"
X-IronPort-AV: E=Sophos;i="5.90,285,1643702400"; 
   d="scan'208";a="244865741"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2022 11:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,285,1643702400"; 
   d="scan'208";a="594612478"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Apr 2022 11:43:26 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1niKj7-0000Lj-O9;
	Sat, 23 Apr 2022 18:43:25 +0000
Date: Sun, 24 Apr 2022 02:42:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: error: unknown target CPU 'loongson2e'
Message-ID: <202204240235.rXGbz16D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Nathan Chancellor <nathan@kernel.org>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Nathan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   13bc32bad7059d6c5671e9d037e6e3ed001cc0f4
commit: 13ceb48bc19c563e05f407e663aaa4105fdfd408 MIPS: Loongson2ef: Remove unnecessary {as,cc}-option calls
date:   5 months ago
config: mips-randconfig-r031-20220422 (https://download.01.org/0day-ci/archive/20220424/202204240235.rXGbz16D-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=13ceb48bc19c563e05f407e663aaa4105fdfd408
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 13ceb48bc19c563e05f407e663aaa4105fdfd408
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   clang-15: warning: argument unused during compilation: '-mno-branch-likely' [-Wunused-command-line-argument]
>> error: unknown target CPU 'loongson2e'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
>> error: unknown target CPU 'loongson2e'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   make[2]: *** [scripts/Makefile.build:287: scripts/mod/empty.o] Error 1
>> error: unknown target CPU 'loongson2e'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   make[2]: *** [scripts/Makefile.build:121: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1196: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
