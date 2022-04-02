Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C247A
	for <llvm@lists.linux.dev>; Sat,  2 Apr 2022 23:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648941671; x=1680477671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TSxaV4arXDY3Am7fyfPZpWYiHspQXhewWl6DbqCG8BE=;
  b=K7cBmsp9RFd1Jeo4vFBziqJ/IgviqudkZEbVoUpwlzuViOwwToAq+xf4
   NqUVlKqp5wnRAAbdHl4dPv/qIIJVZoUbHI27zhJ005mrKBztbOUnHbWn+
   FXwyfsIT3wsTLri4uqlrfLSTCPL0Bpkuyz5K8+QuMT5yAhyv8PGf5C8HL
   3hiPxNfEL28iaJn9w5s7Bf60rZltKQ+StK35jEdUwLKM6wO5ofxepQbGw
   s5uMDR9AW8Yx0JPnEHq88lHdM0sYHviN7WOHC4w0DskexjKs6MRKSZzIo
   5TOmhoNNy4fu5Ze+8Hrvla/NNqpfGtZAgoH/lRVAxQic9X38PkVx5326w
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10305"; a="323517382"
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="323517382"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2022 16:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="721264986"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 02 Apr 2022 16:21:09 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nan3M-0000Wf-Dl;
	Sat, 02 Apr 2022 23:21:08 +0000
Date: Sun, 3 Apr 2022 07:20:58 +0800
From: kernel test robot <lkp@intel.com>
To: Divya Koppera <Divya.Koppera@microchip.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: ld.lld: error: undefined symbol: ptp_clock_register
Message-ID: <202204030755.3o6LEkHq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Divya,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   88e6c0207623874922712e162e25d9dafd39661e
commit: ece19502834d84ece2e056db28257ca2aa6e4d48 net: phy: micrel: 1588 support for LAN8814 phy
date:   4 weeks ago
config: riscv-randconfig-r006-20220402 (https://download.01.org/0day-ci/archive/20220403/202204030755.3o6LEkHq-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ece19502834d84ece2e056db28257ca2aa6e4d48
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ece19502834d84ece2e056db28257ca2aa6e4d48
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ptp_clock_register
   >>> referenced by micrel.c
   >>> net/phy/micrel.o:(lan8814_probe) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: ptp_clock_index
   >>> referenced by micrel.c
   >>> net/phy/micrel.o:(lan8814_ts_info) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
