Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86BD139C;
	Fri,  3 Mar 2023 22:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677883168; x=1709419168;
  h=date:from:cc:subject:message-id:mime-version;
  bh=UtbNUeHkdfnI7hK+rTZjXWYK3JN5Xw4FLO8Gz2rkiig=;
  b=jERKgOkHWRV8+F7I7yxVAEVvRCJvICVB4ZRO+lrhsf+VsofQrebSbjwE
   nffi/kGVUPlu2AbiCbS39yawWzGTFgSY+OMLJOVRQrGqReaa3I0UYkwXX
   efUnkazQaQsEzrUtXvjGYJS+o8p7VfXwUFaJmjBrLNonEBckjQx3X7Ig1
   bwONNzR9uAqvff3Z+8DN+ryYuymWu59YsAyYw++XEH8OFMEEFRDIuNFGi
   wJB9kmvHZti/fzdlldM/yzxZkbp+y91oxPKdE9VRmP338BA726J4jKgzY
   ZJt8ewOjYaT7tzVlyqJ7eeehXMNNv4e2kt7K1qBZfr3ut/L2+CrI/mfv4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="399990324"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="399990324"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 14:39:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="849640981"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="849640981"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Mar 2023 14:39:27 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYE3i-0001hM-2q;
	Fri, 03 Mar 2023 22:39:26 +0000
Date: Sat, 4 Mar 2023 06:39:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [driver-core:debugfs_cleanup 7/7] ld.lld: error:
 vmlinux.a(fs/ext4/orphan.o):(function ext4_orphan_add: .text+0x110):
 relocation R_RISCV_HI20 out of range: 541487 is not in [-524288, 524287];
 references ext4_orphan_add.__if_trace.2.1
Message-ID: <202303040632.lhWDtmIN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: devel@driverdev.osuosl.org
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git debugfs_cleanup
head:   d6b1776e7d0ed5afabaf9c8ea8e4581bbeab3e60
commit: d6b1776e7d0ed5afabaf9c8ea8e4581bbeab3e60 [7/7] soundwire: sysfs: remove unneeded ATTRIBUTE_GROUPS() comments
config: riscv-randconfig-r002-20230303 (https://download.01.org/0day-ci/archive/20230304/202303040632.lhWDtmIN-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?id=d6b1776e7d0ed5afabaf9c8ea8e4581bbeab3e60
        git remote add driver-core https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
        git fetch --no-tags driver-core debugfs_cleanup
        git checkout d6b1776e7d0ed5afabaf9c8ea8e4581bbeab3e60
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303040632.lhWDtmIN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(fs/ext4/orphan.o):(function ext4_orphan_add: .text+0x110): relocation R_RISCV_HI20 out of range: 541487 is not in [-524288, 524287]; references ext4_orphan_add.__if_trace.2.1
   >>> referenced by orphan.c:101 (fs/ext4/orphan.c:101)
   >>> defined in vmlinux.a(fs/ext4/orphan.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
