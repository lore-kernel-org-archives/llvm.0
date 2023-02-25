Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B300C3D7B;
	Sat, 25 Feb 2023 20:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677356204; x=1708892204;
  h=date:from:cc:subject:message-id:mime-version;
  bh=79W5CCtAhs/LGJOiQmkExRTqjgwaczngOY16plUpu68=;
  b=SwBowbqMrocHLUUqQecJGUFxWSGo2u74SlqT25He65sJoNiexSGPT+w4
   axXBpbnnGzatq6HP/gmQlZ+xlXGTwOxw00U96lB0x8CiOR0GiDYDKyNju
   en/XLhK5RwBcWbdpYrz/qCxWI7Tvdx4Zxm+qatMhx95wmwYG89rLVOny2
   ybVoJMY5F8Hn1Rl/L3fA5ObgZZRr75SzWTyTN52R/xeC9VC/5QOS+2pNM
   4haJtE1pmTe70bd6dp56m/Zlpt9lDk8YgaGEylNFH2UmxA0CcPClEBk70
   MzNr/RdfxZOpPVZU89jbfvq2uw10GkGQ6UxkojeZP2ssix874td2NsK53
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="333702164"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="333702164"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 12:16:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="847321646"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="847321646"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 25 Feb 2023 12:16:42 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pW0yH-0003Oj-3C;
	Sat, 25 Feb 2023 20:16:41 +0000
Date: Sun, 26 Feb 2023 04:15:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(init/main.o):(function
 __traceiter_initcall_level: .text+0x24): relocation R_RISCV_HI20 out of
 range: 532254 is not in [-524288, 524287]; references
 __tracepoint_initcall_level
Message-ID: <202302260440.cPp9SMGR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Eric Biggers <ebiggers@google.com>
CC: "Christian Brauner (Microsoft)" <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7c3dc440b1f5c75f45e24430f913e561dc82a419
commit: ccd30a476f8e864732de220bd50e6f372f5ebcab fscrypt: fix keyring memory leak on mount failure
date:   4 months ago
config: riscv-buildonly-randconfig-r004-20230222 (https://download.01.org/0day-ci/archive/20230226/202302260440.cPp9SMGR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ccd30a476f8e864732de220bd50e6f372f5ebcab
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ccd30a476f8e864732de220bd50e6f372f5ebcab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302260440.cPp9SMGR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function __traceiter_initcall_level: .text+0x24): relocation R_RISCV_HI20 out of range: 532254 is not in [-524288, 524287]; references __tracepoint_initcall_level
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function __traceiter_initcall_level: .text+0x30): relocation R_RISCV_HI20 out of range: 532463 is not in [-524288, 524287]; references __traceiter_initcall_level.__if_trace.1
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function __traceiter_initcall_start: .text+0xfc): relocation R_RISCV_HI20 out of range: 532254 is not in [-524288, 524287]; references __tracepoint_initcall_start
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function __traceiter_initcall_start: .text+0x108): relocation R_RISCV_HI20 out of range: 532463 is not in [-524288, 524287]; references __traceiter_initcall_start.__if_trace.1
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
