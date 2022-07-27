Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4A13234
	for <llvm@lists.linux.dev>; Wed, 27 Jul 2022 21:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658958838; x=1690494838;
  h=date:from:cc:subject:message-id:mime-version;
  bh=6Ei7GiyEdnFO5NfbtTNZ4GhWz/ulsTgCnDDscChhA58=;
  b=Swha7l7w/wzPxcEa/Pb3HHv2PcdU/w96bCnZlwMSH/UwGJBwPkpy1rBs
   bKbx+5bMQvPj3xJzsaTYwMQN0jvNMHbvWYfEvhqfoGJb73o8l334oruQu
   hHtFlCunmfD2THcvgnk2IPmJVMNdUvA+zeJR4biFCyyeOW74OIjJw2iJp
   V3gfqrbIAkMd7l10wPvNzBMW6y3iiv23ses4SxHp4uFeYyi1/pk660agT
   v7RtVZ6R3QgZvqwEPhlK59VE+M+NAhNv2ew5RvZa/nEdBB7pO3I2hDMla
   ogiO+pC00vYr/rpx6NqX8Qom3MtQBddr61702mREJ8Bq2Lr8T5Z4loTN/
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="275236144"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="275236144"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2022 14:53:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="628555882"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Jul 2022 14:53:56 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oGoya-00098c-0x;
	Wed, 27 Jul 2022 21:53:56 +0000
Date: Thu, 28 Jul 2022 05:53:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:linux-5.15.y 4343/8925] ld.lld: error:
 kernel/built-in.a(sysctl.o):(function proc_dostring: .text+0x50): relocation
 R_RISCV_HI20 out of range: 529636 is not in [-524288, 524287]; references
 sysctl_writes_strict
Message-ID: <202207280541.6micc9ZL-lkp@intel.com>
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
TO: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
head:   6a9b4e0a656c73ff2dc9a24b5714c6afccff043c
commit: 2dca61693e6cb6d163e5ba2cf18f2c3270d7ec30 [4343/8925] ARM: use LOADADDR() to get load address of sections
config: riscv-randconfig-r025-20220727 (https://download.01.org/0day-ci/archive/20220728/202207280541.6micc9ZL-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8dfaecc4c24494337933aff9d9166486ca0949f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=2dca61693e6cb6d163e5ba2cf18f2c3270d7ec30
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.15.y
        git checkout 2dca61693e6cb6d163e5ba2cf18f2c3270d7ec30
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-stable-rc/linux-5.15.y HEAD 6a9b4e0a656c73ff2dc9a24b5714c6afccff043c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(sysctl.o):(function proc_dostring: .text+0x50): relocation R_RISCV_HI20 out of range: 529636 is not in [-524288, 524287]; references sysctl_writes_strict
   >>> referenced by sysctl.c
   >>> defined in kernel/built-in.a(sysctl.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
