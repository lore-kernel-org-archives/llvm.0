Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0C91FA2
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 06:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650523312; x=1682059312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wPEL/kw/JWNf7uKtzOagGZmEcIiBH/2teWadWxvGW8Q=;
  b=jCsvQxHDc9xXnaJmEllbXR5x/6OI/odgYBj1SmT7+h0ppJX8+UtWJ+sk
   R1cGmgfIcnUjKTi06/62qyR8J7iBvMsIs25yNtvDsNGvJTxNwbpR+3hnL
   px8RHLzRA3PLfU7ZpTFUbBWWMdsR6ThOr1lQ4JB5KeG7lGWbMNR9FzH28
   1AQyoOcOKU+dkNSioToLM1G8F/H24PJTiCo0Pn+nvE5RLNfhgzqsyoxOr
   eAvuZKmvcCL7IinqFLBlMTtK4aXCbNts6xJUye9p1fmpt5ddx/FVP7RrC
   D5RKOebifmcN8F20lk+8VAyAV943M9itzDDY58fp6ToLylhuts4GIwyUz
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="324700176"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="324700176"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 23:41:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="614756916"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Apr 2022 23:41:50 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhQVh-0007yT-QS;
	Thu, 21 Apr 2022 06:41:49 +0000
Date: Thu, 21 Apr 2022 14:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1453/2579] arch/mips/vdso/genvdso.c:21:10:
 fatal error: 'linux/mm_api.h' file not found
Message-ID: <202204202323.l1gSemNN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   49e1ec6c70a6eb4b7de9250a455b8b63eb42afbe
commit: 4eb7f06cbb9a0539016473ab509c83b5c9c50127 [1453/2579] headers/deps: Add header dependencies to .c files: <linux/mm_api.h>
config: mips-randconfig-r026-20220419 (https://download.01.org/0day-ci/archive/20220420/202204202323.l1gSemNN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c1c49a356162b22554088d269f7689bdb044a9f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=4eb7f06cbb9a0539016473ab509c83b5c9c50127
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 4eb7f06cbb9a0539016473ab509c83b5c9c50127
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/kernel/ arch/mips/vdso/ drivers/media/tuners/ drivers/rtc/ kernel/ lib/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/mips/vdso/genvdso.c:21:10: fatal error: 'linux/mm_api.h' file not found
   #include <linux/mm_api.h>
            ^~~~~~~~~~~~~~~~
   1 error generated.


vim +21 arch/mips/vdso/genvdso.c

  > 21	#include <linux/mm_api.h>
    22	#include <sys/mman.h>
    23	#include <sys/stat.h>
    24	#include <sys/types.h>
    25	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
