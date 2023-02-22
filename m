Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1D815A0;
	Wed, 22 Feb 2023 02:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677032158; x=1708568158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zC1d8na7UkAhwr2JhXJPfvHtFO/Rpp5qo7Krw+n6WAw=;
  b=C1gKtxPxkouQFZMfgFzOiUfSPhiT4YfFHiyFScOgSLprC70LBOQBELqQ
   cmqsbiwNYJwsXv1zbEOpIVANbnbucgEZfElrMx8hDQw/wwtzymgfFl1Qi
   2JVQPgn3jLrtzUwFpCwtWJjUw5Pw4iG6ubBPoqHTWusltmrxWNt79760i
   8dH1NHt1/gtNdLIJS00rQVIrIycvmbk7+Old54mDrvDFW9WIhqE3ZQrpq
   eXDbDuofb4acJPBYrgVmJOKO3jnc1IfgMYLqIO5zRIPZhrMWdRlObAAVl
   hSENGtWVPzSbLj7IbuDkgEl9CzxWfjqWr6ul1BdCMqM4C1TUP80/pSZmV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="313187047"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="313187047"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 18:15:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="649396061"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="649396061"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Feb 2023 18:15:55 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUefi-0000UC-2R;
	Wed, 22 Feb 2023 02:15:54 +0000
Date: Wed, 22 Feb 2023 10:15:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Eric Biggers <ebiggers@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [stable:linux-5.10.y 5340/9999] ld.lld: error:
 lib/memneq.o:(.riscv.attributes):
 rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0
 for extension 'zicsr'
Message-ID: <202302221012.KDw7vvoh-lkp@intel.com>
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
commit: d721986e967b3c5fef7495e3840362ba71d1968f [5340/9999] crypto: memneq - move into lib/
config: riscv-randconfig-r032-20230221 (https://download.01.org/0day-ci/archive/20230222/202302221012.KDw7vvoh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=d721986e967b3c5fef7495e3840362ba71d1968f
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout d721986e967b3c5fef7495e3840362ba71d1968f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302221012.KDw7vvoh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: lib/memneq.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
