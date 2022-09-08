Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D664E5394
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 17:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662658525; x=1694194525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YNFerqpJPpOJPGDi6l26UsPT7NdSVmzfo2zjn07INMQ=;
  b=FAIepHvjl9Hq2F+gRMR3E43FE1MZ87Hf2ROMiu2QMN+ivpVEvj6eLgiQ
   kea+Qyae9W6rOR6e31GJ/fGynE3CD1NIDmrtDIJHcbrYFSIM3cGeuqWil
   L9iFMAsUZBKkKAvuHUhvrqtHPngzbTvuplS++6PYbJvST+RpeCwbM74BT
   FziV1cf+o8E38nT4TYFXZV9hd7HJ7EQ9XRsBuIHp+IJYM7wKA62XANSl6
   /GpCmGjrWlu09lz1vp9D1itEBzkOTr44JNoWaBsgXG7bmg+V4cBw4uanH
   WuD1ITIOVEkn+AsTB9cEbf5//f9CYU6NusaiFXd6MJeRbqzLySMv1Gzb3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="294854855"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="294854855"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 10:35:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="704094746"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Sep 2022 10:35:22 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWLQw-0000Bh-0o;
	Thu, 08 Sep 2022 17:35:22 +0000
Date: Fri, 9 Sep 2022 01:34:21 +0800
From: kernel test robot <lkp@intel.com>
To: Matteo Croce <mcroce@microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [esmil:visionfive 1/42] arch/riscv/lib/string.c:90:7: error:
 redefinition of '__memcpy'
Message-ID: <202209090127.x1z9vvlp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   044c1f5e968de7d30940431fbb90da599074ea1c
commit: c247f6e6c7ba6abb92177ba2a742f60a3244d6d2 [1/42] riscv: optimized memcpy
config: riscv-randconfig-r021-20220907 (https://download.01.org/0day-ci/archive/20220909/202209090127.x1z9vvlp-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/esmil/linux/commit/c247f6e6c7ba6abb92177ba2a742f60a3244d6d2
        git remote add esmil https://github.com/esmil/linux
        git fetch --no-tags esmil visionfive
        git checkout c247f6e6c7ba6abb92177ba2a742f60a3244d6d2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> arch/riscv/lib/string.c:90:57: warning: attribute declaration must precede definition [-Wignored-attributes]
   void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);
                                                           ^
   include/linux/compiler_attributes.h:372:56: note: expanded from macro '__weak'
   #define __weak                          __attribute__((__weak__))
                                                          ^
   arch/riscv/lib/string.c:31:7: note: previous definition is here
   void *__memcpy(void *dest, const void *src, size_t count)
         ^
>> arch/riscv/lib/string.c:90:7: error: redefinition of '__memcpy'
   void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);
         ^
   arch/riscv/include/asm/string.h:25:31: note: expanded from macro 'memcpy'
   #define memcpy(dst, src, len) __memcpy(dst, src, len)
                                 ^
   arch/riscv/lib/string.c:31:7: note: previous definition is here
   void *__memcpy(void *dest, const void *src, size_t count)
         ^
   1 warning and 1 error generated.


vim +/__memcpy +90 arch/riscv/lib/string.c

    89	
  > 90	void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
