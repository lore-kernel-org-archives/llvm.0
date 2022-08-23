Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468527F
	for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 02:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661221724; x=1692757724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FNgQhLJPllCGPYZrPfGgqJ4GjILt0gZKxOjRsHwUco4=;
  b=arl2EO9vftAWPx7a5Zm4jLgN888rHFz17s03bg+7WGJPJMnJjzaEtbu5
   XplfsHX5Zm2unYMMQujtd0oRL1kbYG0gtDcruY8Xi2KKKfNaxqSnVkyYK
   atqF6J8JR4nhB1MfiB2CgUKFq7r4M0X9eqlDKc/a8fNjh0B7s7uYzRK1n
   dkrCavzOa+VmJvf8uLjXJ65TBJ8u039tYH56s47lXkYqcNioIXXQO1Dhu
   jJUyOEoQqZgdUp2pKAZOr3wmtc5HGwqt9qltye6qyOEMEQunT49+htgKz
   R0p1hW3ec7M045jdqA0gnHLe3vF2HAqIdNb8p/e8RGmxJ4TCE5GO0+0si
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="273325396"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; 
   d="scan'208";a="273325396"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 19:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; 
   d="scan'208";a="559988733"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Aug 2022 19:28:24 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oQJeR-00013F-1y;
	Tue, 23 Aug 2022 02:28:23 +0000
Date: Tue, 23 Aug 2022 10:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mark:arm64/alternatives/rework 10/12]
 arch/arm64/kernel/alternative.c:269:14: warning: no previous prototype for
 function 'patch_apply_nops'
Message-ID: <202208231008.mwF7HrQy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/alternatives/rework
head:   c6f1e900bb0e1c5932f9995feaf4acb70cf6f62e
commit: f1665fd81160e18d4c71f4edcfd25c41e248fb67 [10/12] HACK: nops
config: arm64-buildonly-randconfig-r005-20220822 (https://download.01.org/0day-ci/archive/20220823/202208231008.mwF7HrQy-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project abce7acebd4c06c977bc4bd79170697f1122bc5e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=f1665fd81160e18d4c71f4edcfd25c41e248fb67
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark arm64/alternatives/rework
        git checkout f1665fd81160e18d4c71f4edcfd25c41e248fb67
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/alternative.c:269:14: warning: no previous prototype for function 'patch_apply_nops' [-Wmissing-prototypes]
   noinstr void patch_apply_nops(struct alt_instr *alt,
                ^
   arch/arm64/kernel/alternative.c:269:9: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinstr void patch_apply_nops(struct alt_instr *alt,
           ^
           static 
   1 warning generated.


vim +/patch_apply_nops +269 arch/arm64/kernel/alternative.c

   268	
 > 269	noinstr void patch_apply_nops(struct alt_instr *alt,

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
