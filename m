Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819F8883E;
	Fri, 28 Apr 2023 19:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682710603; x=1714246603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jyu45+ZzxksvpMm8r+3+9KUykJKqifdkE/eWGUPo/u8=;
  b=kgrUJ4duTP0ko77opE/jiSkf2ucVpFFryKZtpTy4SxUl9+7cGNgGjHqd
   rDNA4eM/3Wjb+yonB1daeteQlObcEs0hLfrF7MlGwO4/BMSWccFyHt1TS
   KTZnlSNg21Ok5Vy18+0sgKT0BmC0Py2DXTx4D7RpAy+hxPlVua3UzOOMw
   1e9fC3PYHu31UGnFVCKjfWLK+0yyQZ7XeJJBCF/fZXy/ShjXvemk4cepc
   NE971HFecWeacwjSyG2r6OzRotgmNfpfpXrulgsbB6c9+Xx6ir5RU8bO5
   LehJFW/UCR33TSspq4AiAYzejqYGao00Cgeq8Gm5i7obr2R1/gp3taTnp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="346605892"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="346605892"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 12:36:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="941212438"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="941212438"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Apr 2023 12:36:42 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psTtZ-0000dX-0L;
	Fri, 28 Apr 2023 19:36:41 +0000
Date: Sat, 29 Apr 2023 03:36:09 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-rebased 121/187] mm/shmem.c:96:8: warning:
 'const' type qualifier on return type has no effect
Message-ID: <202304290305.uavuDXMr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/rust-rebased
head:   e8ecda1e3b7f3e01508b712df489f21260c4c9c6
commit: b9d83a7aa2d40b09c37253fa71af3e0f4654625d [121/187] shmem: 16K on 4K hack
config: powerpc-randconfig-r035-20230428 (https://download.01.org/0day-ci/archive/20230429/202304290305.uavuDXMr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/b9d83a7aa2d40b09c37253fa71af3e0f4654625d
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/rust-rebased
        git checkout b9d83a7aa2d40b09c37253fa71af3e0f4654625d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304290305.uavuDXMr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:96:8: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
   static const unsigned long shmem_base_nr(struct address_space *mapping) {
          ^~~~~~
   1 warning generated.


vim +/const +96 mm/shmem.c

    95	
  > 96	static const unsigned long shmem_base_nr(struct address_space *mapping) {
    97		return 1L << mapping->order;
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
