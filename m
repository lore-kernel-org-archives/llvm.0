Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604981C02;
	Tue, 18 Apr 2023 08:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681805010; x=1713341010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3gvt0Cr3iK9FcuX33wgyb3BC3sOttQXdFu65w04jc1U=;
  b=a+/i+p4gZy0/RdovrU/vm0b9MP3Tthb0OO4V0g8mPkm7bsUnvYvd3zDr
   nib/KaKCmZQrTnzhE2Xs6A1Vgxm3n7ZWbU2Jy5Yqhlbx1naM10PQcZde6
   +zhdbs6Lk6zLafXerKHowmqZVqAXEpSyuYXeMkLEkkK6/CM9vVPcpb+Pp
   pB6khMR/ZmcK3kk70qqt+Zhw5/Hix6XR+DeoQnQ6VVPYtTAqjQWm7Xpyq
   gpRS/dmpZpD4GiO1gAL1WSuJEbxCAa37gPzthSOWptcGKLI/xj9YWdK/H
   kVtaTNJ4gZgIwyCHiE9J0qwznMqvQm+XbwW6G+cHri4iQCHa3IYirQ3/Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="343858973"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="343858973"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 01:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="693539353"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="693539353"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Apr 2023 01:03:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pogJC-000d8h-1V;
	Tue, 18 Apr 2023 08:03:26 +0000
Date: Tue, 18 Apr 2023 16:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net
Subject: [jaegeuk-f2fs:dev-test 49/49] ld.lld: error: undefined symbol:
 __hexagon_udivdi3
Message-ID: <202304181512.3CpLfgBe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   07717639336b495e1115e95824031643363d0276
commit: 07717639336b495e1115e95824031643363d0276 [49/49] f2fs: remove power-of-two limitation fo zoned device
config: hexagon-randconfig-r012-20230416 (https://download.01.org/0day-ci/archive/20230418/202304181512.3CpLfgBe-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?id=07717639336b495e1115e95824031643363d0276
        git remote add jaegeuk-f2fs https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
        git fetch --no-tags jaegeuk-f2fs dev-test
        git checkout 07717639336b495e1115e95824031643363d0276
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181512.3CpLfgBe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __hexagon_udivdi3
   >>> referenced by super.c
   >>>               fs/f2fs/super.o:(f2fs_scan_devices) in archive vmlinux.a
   >>> referenced by super.c
   >>>               fs/f2fs/super.o:(f2fs_scan_devices) in archive vmlinux.a
   >>> did you mean: __hexagon_udivsi3
   >>> defined in: vmlinux.a(arch/hexagon/lib/udivsi3.o)
--
>> ld.lld: error: undefined symbol: __hexagon_divdi3
   >>> referenced by gc.c
   >>>               fs/f2fs/gc.o:(update_fs_metadata) in archive vmlinux.a
   >>> referenced by gc.c
   >>>               fs/f2fs/gc.o:(update_fs_metadata) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
