Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523DF8F78;
	Tue, 21 Feb 2023 21:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677014268; x=1708550268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R5WWbAVA114aSu2PXOQvoV76AbP931etrHq99pJJRRA=;
  b=hYF2+Rt7WF/QdDj1yuvsl1rshOdx7o7ozL13SaMCzsUlVHMkq2PiyjPo
   HogbbFCrCiDkPFHkqy2mOwd8xHB4R95NS0kFb5QR9UvEmd0dWHYeQmYoQ
   osQSHORKgXFL7reeE9RjNeOIJqbi2dm44CjXvCZsqS8UQNll8z7+CWGeE
   Xppdcfk3d4IsSi5gvMSuaHtTaj9zBs2SOFMhCHrIO2JCXq1kJ3q6IgZdX
   JpTicAw36aDO8f5aeoyXx8kuxb3mXMSg42jsy/XGoH84L2jRey4RqMKsu
   7rn0WhXVOAOiWkeUZXKcVgOl+u1vvXSRo1rttjYXOH7XBUkXbCXLm7a3f
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="331423399"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="331423399"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 13:17:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="1000749793"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="1000749793"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Feb 2023 13:17:42 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUa17-0000FN-1D;
	Tue, 21 Feb 2023 21:17:41 +0000
Date: Wed, 22 Feb 2023 05:17:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-5.10.y 4450/9999] ld.lld: error:
 lib/crypto/blake2s.o:(.riscv.attributes):
 rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0
 for extension 'zicsr'
Message-ID: <202302220536.HZSMHsH3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   707c48210a5384a72c82655a37895b7e822755f2
commit: 62531d446a985fd87fd1320beafec74455cc2bb5 [4450/9999] lib/crypto: blake2s: include as built-in
config: riscv-randconfig-r032-20230221 (https://download.01.org/0day-ci/archive/20230222/202302220536.HZSMHsH3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=62531d446a985fd87fd1320beafec74455cc2bb5
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout 62531d446a985fd87fd1320beafec74455cc2bb5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220536.HZSMHsH3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: lib/crypto/blake2s.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
--
>> ld.lld: error: lib/crypto/blake2s-generic.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
